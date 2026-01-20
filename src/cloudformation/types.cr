require "json"
require "time"

module Aws
  module CloudFormation
    module Types

      # Structure that contains the results of the account gate function which CloudFormation invokes, if
      # present, before proceeding with a StackSet operation in an account and Region. For each account and
      # Region, CloudFormation lets you specify a Lambda function that encapsulates any requirements that
      # must be met before CloudFormation can proceed with a StackSet operation in that account and Region.
      # CloudFormation invokes the function each time a StackSet operation is requested for that account and
      # Region; if the function returns FAILED , CloudFormation cancels the operation in that account and
      # Region, and sets the StackSet operation result status for that account and Region to FAILED . For
      # more information, see Prevent failed StackSets deployments using target account gates in the
      # CloudFormation User Guide .

      struct AccountGateResult
        include JSON::Serializable

        # The status of the account gate function. SUCCEEDED : The account gate function has determined that
        # the account and Region passes any requirements for a StackSet operation to occur. CloudFormation
        # proceeds with the stack operation in that account and Region. FAILED : The account gate function has
        # determined that the account and Region doesn't meet the requirements for a StackSet operation to
        # occur. CloudFormation cancels the StackSet operation in that account and Region, and sets the
        # StackSet operation result status for that account and Region to FAILED . SKIPPED : CloudFormation
        # has skipped calling the account gate function for this account and Region, for one of the following
        # reasons: An account gate function hasn't been specified for the account and Region. CloudFormation
        # proceeds with the StackSet operation in this account and Region. The
        # AWSCloudFormationStackSetExecutionRole of the administration account lacks permissions to invoke the
        # function. CloudFormation proceeds with the StackSet operation in this account and Region. Either no
        # action is necessary, or no action is possible, on the stack. CloudFormation skips the StackSet
        # operation in this account and Region.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason for the account gate status assigned to this account and Region for the StackSet
        # operation.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Describes the current CloudFormation limits for your account. CloudFormation has the following
      # limits per account: Number of concurrent resources Number of stacks Number of stack outputs For more
      # information, see Understand CloudFormation quotas in the CloudFormation User Guide .

      struct AccountLimit
        include JSON::Serializable

        # The name of the account limit. Values: ConcurrentResourcesLimit | StackLimit | StackOutputsLimit

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value that's associated with the account limit name.

        @[JSON::Field(key: "Value")]
        getter value : Int32?

        def initialize(
          @name : String? = nil,
          @value : Int32? = nil
        )
        end
      end


      struct ActivateOrganizationsAccessInput
        include JSON::Serializable

        def initialize
        end
      end


      struct ActivateOrganizationsAccessOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct ActivateTypeInput
        include JSON::Serializable

        # Whether to automatically update the extension in this account and Region when a new minor version is
        # published by the extension publisher. Major versions released by the publisher must be manually
        # updated. The default is true .

        @[JSON::Field(key: "AutoUpdate")]
        getter auto_update : Bool?

        # The name of the IAM execution role to use to activate the extension.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # Contains logging configuration information for an extension.

        @[JSON::Field(key: "LoggingConfig")]
        getter logging_config : Types::LoggingConfig?

        # The major version of this extension you want to activate, if multiple major versions are available.
        # The default is the latest major version. CloudFormation uses the latest available minor version of
        # the major version selected. You can specify MajorVersion or VersionBump , but not both.

        @[JSON::Field(key: "MajorVersion")]
        getter major_version : Int64?

        # The Amazon Resource Name (ARN) of the public extension. Conditional: You must specify PublicTypeArn
        # , or TypeName , Type , and PublisherId .

        @[JSON::Field(key: "PublicTypeArn")]
        getter public_type_arn : String?

        # The ID of the extension publisher. Conditional: You must specify PublicTypeArn , or TypeName , Type
        # , and PublisherId .

        @[JSON::Field(key: "PublisherId")]
        getter publisher_id : String?

        # The extension type. Conditional: You must specify PublicTypeArn , or TypeName , Type , and
        # PublisherId .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The name of the extension. Conditional: You must specify PublicTypeArn , or TypeName , Type , and
        # PublisherId .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # An alias to assign to the public extension in this account and Region. If you specify an alias for
        # the extension, CloudFormation treats the alias as the extension type name within this account and
        # Region. You must use the alias to refer to the extension in your templates, API calls, and
        # CloudFormation console. An extension alias must be unique within a given account and Region. You can
        # activate the same public resource multiple times in the same account and Region, using different
        # type name aliases.

        @[JSON::Field(key: "TypeNameAlias")]
        getter type_name_alias : String?

        # Manually updates a previously-activated type to a new major or minor version, if available. You can
        # also use this parameter to update the value of AutoUpdate . MAJOR : CloudFormation updates the
        # extension to the newest major version, if one is available. MINOR : CloudFormation updates the
        # extension to the newest minor version, if one is available.

        @[JSON::Field(key: "VersionBump")]
        getter version_bump : String?

        def initialize(
          @auto_update : Bool? = nil,
          @execution_role_arn : String? = nil,
          @logging_config : Types::LoggingConfig? = nil,
          @major_version : Int64? = nil,
          @public_type_arn : String? = nil,
          @publisher_id : String? = nil,
          @type : String? = nil,
          @type_name : String? = nil,
          @type_name_alias : String? = nil,
          @version_bump : String? = nil
        )
        end
      end


      struct ActivateTypeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the activated extension in this account and Region.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # The resource with the name requested already exists.

      struct AlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # The Annotation data type. A GetHookResult call returns detailed information and remediation guidance
      # from Control Tower, Guard, Lambda, or custom Hooks for a Hook invocation result.

      struct Annotation
        include JSON::Serializable

        # An identifier for the evaluation logic that was used when invoking the Hook. For Control Tower, this
        # is the control ID. For Guard, this is the rule ID. For Lambda and custom Hooks, this is a
        # user-defined identifier.

        @[JSON::Field(key: "AnnotationName")]
        getter annotation_name : String?

        # A URL that you can access for additional remediation guidance.

        @[JSON::Field(key: "RemediationLink")]
        getter remediation_link : String?

        # Suggests what to change if your Hook returns a FAILED status. For example, "Block public access to
        # the bucket".

        @[JSON::Field(key: "RemediationMessage")]
        getter remediation_message : String?

        # The relative risk associated with any violations of this type.

        @[JSON::Field(key: "SeverityLevel")]
        getter severity_level : String?

        # The status of the Hook invocation from the downstream service.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The explanation for the specific status assigned to this Hook invocation. For example, "Bucket does
        # not block public access".

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @annotation_name : String? = nil,
          @remediation_link : String? = nil,
          @remediation_message : String? = nil,
          @severity_level : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Describes whether StackSets automatically deploys to Organizations accounts that are added to a
      # target organization or organizational unit (OU). For more information, see Enable or disable
      # automatic deployments for StackSets in Organizations in the CloudFormation User Guide .

      struct AutoDeployment
        include JSON::Serializable

        # A list of StackSet ARNs that this StackSet depends on for auto-deployment operations. When
        # auto-deployment is triggered, operations will be sequenced to ensure all dependencies complete
        # successfully before this StackSet's operation begins.

        @[JSON::Field(key: "DependsOn")]
        getter depends_on : Array(String)?

        # If set to true , StackSets automatically deploys additional stack instances to Organizations
        # accounts that are added to a target organization or organizational unit (OU) in the specified
        # Regions. If an account is removed from a target organization or OU, StackSets deletes stack
        # instances from the account in the specified Regions.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # If set to true , stack resources are retained when an account is removed from a target organization
        # or OU. If set to false , stack resources are deleted. Specify only if Enabled is set to True .

        @[JSON::Field(key: "RetainStacksOnAccountRemoval")]
        getter retain_stacks_on_account_removal : Bool?

        def initialize(
          @depends_on : Array(String)? = nil,
          @enabled : Bool? = nil,
          @retain_stacks_on_account_removal : Bool? = nil
        )
        end
      end

      # Detailed information concerning an error generated during the setting of configuration data for a
      # CloudFormation extension.

      struct BatchDescribeTypeConfigurationsError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # Identifying information for the configuration of a CloudFormation extension.

        @[JSON::Field(key: "TypeConfigurationIdentifier")]
        getter type_configuration_identifier : Types::TypeConfigurationIdentifier?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @type_configuration_identifier : Types::TypeConfigurationIdentifier? = nil
        )
        end
      end


      struct BatchDescribeTypeConfigurationsInput
        include JSON::Serializable

        # The list of identifiers for the desired extension configurations.

        @[JSON::Field(key: "TypeConfigurationIdentifiers")]
        getter type_configuration_identifiers : Array(Types::TypeConfigurationIdentifier)

        def initialize(
          @type_configuration_identifiers : Array(Types::TypeConfigurationIdentifier)
        )
        end
      end


      struct BatchDescribeTypeConfigurationsOutput
        include JSON::Serializable

        # A list of information concerning any errors generated during the setting of the specified
        # configurations.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchDescribeTypeConfigurationsError)?

        # A list of any of the specified extension configurations from the CloudFormation registry.

        @[JSON::Field(key: "TypeConfigurations")]
        getter type_configurations : Array(Types::TypeConfigurationDetails)?

        # A list of any of the specified extension configurations that CloudFormation could not process for
        # any reason.

        @[JSON::Field(key: "UnprocessedTypeConfigurations")]
        getter unprocessed_type_configurations : Array(Types::TypeConfigurationIdentifier)?

        def initialize(
          @errors : Array(Types::BatchDescribeTypeConfigurationsError)? = nil,
          @type_configurations : Array(Types::TypeConfigurationDetails)? = nil,
          @unprocessed_type_configurations : Array(Types::TypeConfigurationIdentifier)? = nil
        )
        end
      end

      # An error occurred during a CloudFormation registry operation.

      struct CFNRegistryException
        include JSON::Serializable

        # A message with details about the error that occurred.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input for the CancelUpdateStack action.

      struct CancelUpdateStackInput
        include JSON::Serializable

        # If you don't pass a parameter to StackName , the API returns a response that describes all resources
        # in the account. The IAM policy below can be added to IAM policies when you want to limit
        # resource-level permissions and avoid returning a response when no parameter is sent in the request:
        # { "Version": "2012-10-17", "Statement": [{ "Effect": "Deny", "Action":
        # "cloudformation:DescribeStacks", "NotResource": "arn:aws:cloudformation:*:*:stack/*/*" }] } The name
        # or the unique stack ID that's associated with the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # A unique identifier for this CancelUpdateStack request. Specify this token if you plan to retry
        # requests so that CloudFormation knows that you're not attempting to cancel an update on a stack with
        # the same name. You might retry CancelUpdateStack requests to ensure that CloudFormation successfully
        # received them.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @stack_name : String,
          @client_request_token : String? = nil
        )
        end
      end

      # The Change structure describes the changes CloudFormation will perform if you execute the change
      # set.

      struct Change
        include JSON::Serializable

        # Is either null , if no Hooks invoke for the resource, or contains the number of Hooks that will
        # invoke for the resource.

        @[JSON::Field(key: "HookInvocationCount")]
        getter hook_invocation_count : Int32?

        # A ResourceChange structure that describes the resource and action that CloudFormation will perform.

        @[JSON::Field(key: "ResourceChange")]
        getter resource_change : Types::ResourceChange?

        # The type of entity that CloudFormation changes. Resource This change is for a resource.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @hook_invocation_count : Int32? = nil,
          @resource_change : Types::ResourceChange? = nil,
          @type : String? = nil
        )
        end
      end

      # Specifies the resource, the Hook, and the Hook version to be invoked.

      struct ChangeSetHook
        include JSON::Serializable

        # Specify the Hook failure mode for non-compliant resources in the followings ways. FAIL Stops
        # provisioning resources. WARN Allows provisioning to continue with a warning message.

        @[JSON::Field(key: "FailureMode")]
        getter failure_mode : String?

        # The specific point in the provisioning process where the Hook is invoked.

        @[JSON::Field(key: "InvocationPoint")]
        getter invocation_point : String?

        # Specifies details about the target that the Hook will run against.

        @[JSON::Field(key: "TargetDetails")]
        getter target_details : Types::ChangeSetHookTargetDetails?

        # The version ID of the type configuration.

        @[JSON::Field(key: "TypeConfigurationVersionId")]
        getter type_configuration_version_id : String?

        # The unique name for your Hook. Specifies a three-part namespace for your Hook, with a recommended
        # pattern of Organization::Service::Hook . The following organization namespaces are reserved and
        # can't be used in your Hook type names: Alexa AMZN Amazon ASK AWS Custom Dev

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # The version ID of the type specified.

        @[JSON::Field(key: "TypeVersionId")]
        getter type_version_id : String?

        def initialize(
          @failure_mode : String? = nil,
          @invocation_point : String? = nil,
          @target_details : Types::ChangeSetHookTargetDetails? = nil,
          @type_configuration_version_id : String? = nil,
          @type_name : String? = nil,
          @type_version_id : String? = nil
        )
        end
      end

      # Specifies RESOURCE type target details for activated Hooks.

      struct ChangeSetHookResourceTargetDetails
        include JSON::Serializable

        # The resource's logical ID, which is defined in the stack's template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String?

        # Specifies the action of the resource.

        @[JSON::Field(key: "ResourceAction")]
        getter resource_action : String?

        # The type of CloudFormation resource, such as AWS::S3::Bucket .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @logical_resource_id : String? = nil,
          @resource_action : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Specifies target details for an activated Hook.

      struct ChangeSetHookTargetDetails
        include JSON::Serializable

        # Required if TargetType is RESOURCE .

        @[JSON::Field(key: "ResourceTargetDetails")]
        getter resource_target_details : Types::ChangeSetHookResourceTargetDetails?

        # The Hook target type.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        def initialize(
          @resource_target_details : Types::ChangeSetHookResourceTargetDetails? = nil,
          @target_type : String? = nil
        )
        end
      end

      # The specified change set name or ID doesn't exit. To view valid change sets for a stack, use the
      # ListChangeSets operation.

      struct ChangeSetNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The ChangeSetSummary structure describes a change set, its status, and the stack with which it's
      # associated.

      struct ChangeSetSummary
        include JSON::Serializable

        # The ID of the change set.

        @[JSON::Field(key: "ChangeSetId")]
        getter change_set_id : String?

        # The name of the change set.

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String?

        # The start time when the change set was created, in UTC.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # Descriptive information about the change set.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If the change set execution status is AVAILABLE , you can execute the change set. If you can't
        # execute the change set, the status indicates why. For example, a change set might be in an
        # UNAVAILABLE state because CloudFormation is still creating it or in an OBSOLETE state because the
        # stack was already updated.

        @[JSON::Field(key: "ExecutionStatus")]
        getter execution_status : String?

        # Indicates if the change set imports resources that already exist.

        @[JSON::Field(key: "ImportExistingResources")]
        getter import_existing_resources : Bool?

        # Specifies the current setting of IncludeNestedStacks for the change set.

        @[JSON::Field(key: "IncludeNestedStacks")]
        getter include_nested_stacks : Bool?

        # The parent change set ID.

        @[JSON::Field(key: "ParentChangeSetId")]
        getter parent_change_set_id : String?

        # The root change set ID.

        @[JSON::Field(key: "RootChangeSetId")]
        getter root_change_set_id : String?

        # The ID of the stack with which the change set is associated.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        # The name of the stack with which the change set is associated.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        # The state of the change set, such as CREATE_PENDING , CREATE_COMPLETE , or FAILED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A description of the change set's status. For example, if your change set is in the FAILED state,
        # CloudFormation shows the error message.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @change_set_id : String? = nil,
          @change_set_name : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @execution_status : String? = nil,
          @import_existing_resources : Bool? = nil,
          @include_nested_stacks : Bool? = nil,
          @parent_change_set_id : String? = nil,
          @root_change_set_id : String? = nil,
          @stack_id : String? = nil,
          @stack_name : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # No more than 5 generated templates can be in an InProgress or Pending status at one time. This error
      # is also returned if a generated template that is in an InProgress or Pending status is attempted to
      # be updated or deleted.

      struct ConcurrentResourcesLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the ContinueUpdateRollback action.

      struct ContinueUpdateRollbackInput
        include JSON::Serializable

        # The name or the unique ID of the stack that you want to continue rolling back. Don't specify the
        # name of a nested stack (a stack that was created by using the AWS::CloudFormation::Stack resource).
        # Instead, use this operation on the parent stack (the stack that contains the
        # AWS::CloudFormation::Stack resource).

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # A unique identifier for this ContinueUpdateRollback request. Specify this token if you plan to retry
        # requests so that CloudFormation knows that you're not attempting to continue the rollback to a stack
        # with the same name. You might retry ContinueUpdateRollback requests to ensure that CloudFormation
        # successfully received them.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # A list of the logical IDs of the resources that CloudFormation skips during the continue update
        # rollback operation. You can specify only resources that are in the UPDATE_FAILED state because a
        # rollback failed. You can't specify resources that are in the UPDATE_FAILED state for other reasons,
        # for example, because an update was canceled. To check why a resource update failed, use the
        # DescribeStackResources action, and view the resource status reason. Specify this property to skip
        # rolling back resources that CloudFormation can't successfully roll back. We recommend that you
        # troubleshoot resources before skipping them. CloudFormation sets the status of the specified
        # resources to UPDATE_COMPLETE and continues to roll back the stack. After the rollback is complete,
        # the state of the skipped resources will be inconsistent with the state of the resources in the stack
        # template. Before performing another stack update, you must update the stack or resources to be
        # consistent with each other. If you don't, subsequent stack updates might fail, and the stack will
        # become unrecoverable. Specify the minimum number of resources required to successfully roll back
        # your stack. For example, a failed resource update might cause dependent resources to fail. In this
        # case, it might not be necessary to skip the dependent resources. To skip resources that are part of
        # nested stacks, use the following format: NestedStackName.ResourceLogicalID . If you want to specify
        # the logical ID of a stack resource ( Type: AWS::CloudFormation::Stack ) in the ResourcesToSkip list,
        # then its corresponding embedded stack must be in one of the following states: DELETE_IN_PROGRESS ,
        # DELETE_COMPLETE , or DELETE_FAILED . Don't confuse a child stack's name with its corresponding
        # logical ID defined in the parent stack. For an example of a continue update rollback operation with
        # nested stacks, see Continue rolling back from failed nested stack updates .

        @[JSON::Field(key: "ResourcesToSkip")]
        getter resources_to_skip : Array(String)?

        # The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes to roll back the stack.
        # CloudFormation uses the role's credentials to make calls on your behalf. CloudFormation always uses
        # this role for all future operations on the stack. Provided that users have permission to operate on
        # the stack, CloudFormation uses this role even if the users don't have permission to pass it. Ensure
        # that the role grants least permission. If you don't specify a value, CloudFormation uses the role
        # that was previously associated with the stack. If no role is available, CloudFormation uses a
        # temporary session that's generated from your user credentials.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @stack_name : String,
          @client_request_token : String? = nil,
          @resources_to_skip : Array(String)? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # The output for a ContinueUpdateRollback operation.

      struct ContinueUpdateRollbackOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the CreateChangeSet action.

      struct CreateChangeSetInput
        include JSON::Serializable

        # The name of the change set. The name must be unique among all change sets that are associated with
        # the specified stack. A change set name can contain only alphanumeric, case sensitive characters, and
        # hyphens. It must start with an alphabetical character and can't exceed 128 characters.

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String

        # The name or the unique ID of the stack for which you are creating a change set. CloudFormation
        # generates the change set by comparing this stack's information with the information that you submit,
        # such as a modified template or different parameter input values.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # In some cases, you must explicitly acknowledge that your stack template contains certain
        # capabilities in order for CloudFormation to create the stack. CAPABILITY_IAM and
        # CAPABILITY_NAMED_IAM Some stack templates might include resources that can affect permissions in
        # your Amazon Web Services account, for example, by creating new IAM users. For those stacks, you must
        # explicitly acknowledge this by specifying one of these capabilities. The following IAM resources
        # require you to specify either the CAPABILITY_IAM or CAPABILITY_NAMED_IAM capability. If you have IAM
        # resources, you can specify either capability. If you have IAM resources with custom names, you must
        # specify CAPABILITY_NAMED_IAM . If you don't specify either of these capabilities, CloudFormation
        # returns an InsufficientCapabilities error. If your stack template contains these resources, we
        # suggest that you review all permissions associated with them and edit their permissions if
        # necessary. AWS::IAM::AccessKey AWS::IAM::Group AWS::IAM::InstanceProfile AWS::IAM::ManagedPolicy
        # AWS::IAM::Policy AWS::IAM::Role AWS::IAM::User AWS::IAM::UserToGroupAddition For more information,
        # see Acknowledging IAM resources in CloudFormation templates . CAPABILITY_AUTO_EXPAND Some template
        # contain macros. Macros perform custom processing on templates; this can include simple actions like
        # find-and-replace operations, all the way to extensive transformations of entire templates. Because
        # of this, users typically create a change set from the processed template, so that they can review
        # the changes resulting from the macros before actually creating the stack. If your stack template
        # contains one or more macros, and you choose to create a stack directly from the processed template,
        # without first reviewing the resulting changes in a change set, you must acknowledge this capability.
        # This includes the AWS::Include and AWS::Serverless transforms, which are macros hosted by
        # CloudFormation. This capacity doesn't apply to creating change sets, and specifying it when creating
        # change sets has no effect. If you want to create a stack from a stack template that contains macros
        # and nested stacks, you must create or update the stack directly from the template using the
        # CreateStack or UpdateStack action, and specifying this capability. For more information about
        # macros, see Perform custom processing on CloudFormation templates with template macros . Only one of
        # the Capabilities and ResourceType parameters can be specified.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)?

        # The type of change set operation. To create a change set for a new stack, specify CREATE . To create
        # a change set for an existing stack, specify UPDATE . To create a change set for an import operation,
        # specify IMPORT . If you create a change set for a new stack, CloudFormation creates a stack with a
        # unique stack ID, but no template or resources. The stack will be in the REVIEW_IN_PROGRESS state
        # until you execute the change set. By default, CloudFormation specifies UPDATE . You can't use the
        # UPDATE type to create a change set for a new stack or the CREATE type to create a change set for an
        # existing stack.

        @[JSON::Field(key: "ChangeSetType")]
        getter change_set_type : String?

        # A unique identifier for this CreateChangeSet request. Specify this token if you plan to retry
        # requests so that CloudFormation knows that you're not attempting to create another change set with
        # the same name. You might retry CreateChangeSet requests to ensure that CloudFormation successfully
        # received them.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Determines how CloudFormation handles configuration drift during deployment. REVERT_DRIFT – Creates
        # a drift-aware change set that brings actual resource states in line with template definitions.
        # Provides a three-way comparison between actual state, previous deployment state, and desired state.
        # For more information, see Using drift-aware change sets in the CloudFormation User Guide .

        @[JSON::Field(key: "DeploymentMode")]
        getter deployment_mode : String?

        # A description to help you identify this change set.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates if the change set auto-imports resources that already exist. For more information, see
        # Import Amazon Web Services resources into a CloudFormation stack automatically in the CloudFormation
        # User Guide . This parameter can only import resources that have custom names in templates. For more
        # information, see name type in the CloudFormation User Guide . To import resources that do not accept
        # custom names, such as EC2 instances, use the ResourcesToImport parameter instead.

        @[JSON::Field(key: "ImportExistingResources")]
        getter import_existing_resources : Bool?

        # Creates a change set for the all nested stacks specified in the template. The default behavior of
        # this action is set to False . To include nested sets in a change set, specify True .

        @[JSON::Field(key: "IncludeNestedStacks")]
        getter include_nested_stacks : Bool?

        # The Amazon Resource Names (ARNs) of Amazon SNS topics that CloudFormation associates with the stack.
        # To remove all associated notification topics, specify an empty list.

        @[JSON::Field(key: "NotificationARNs")]
        getter notification_ar_ns : Array(String)?

        # Determines what action will be taken if stack creation fails. If this parameter is specified, the
        # DisableRollback parameter to the ExecuteChangeSet API operation must not be specified. This must be
        # one of these values: DELETE - Deletes the change set if the stack creation fails. This is only valid
        # when the ChangeSetType parameter is set to CREATE . If the deletion of the stack fails, the status
        # of the stack is DELETE_FAILED . DO_NOTHING - if the stack creation fails, do nothing. This is
        # equivalent to specifying true for the DisableRollback parameter to the ExecuteChangeSet API
        # operation. ROLLBACK - if the stack creation fails, roll back the stack. This is equivalent to
        # specifying false for the DisableRollback parameter to the ExecuteChangeSet API operation. For nested
        # stacks, when the OnStackFailure parameter is set to DELETE for the change set for the parent stack,
        # any failure in a child stack will cause the parent stack creation to fail and all stacks to be
        # deleted.

        @[JSON::Field(key: "OnStackFailure")]
        getter on_stack_failure : String?

        # A list of Parameter structures that specify input parameters for the change set. For more
        # information, see the Parameter data type.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # Specifies which resource types you can work with, such as AWS::EC2::Instance or
        # Custom::MyCustomInstance . If the list of resource types doesn't include a resource type that you're
        # updating, the stack update fails. By default, CloudFormation grants permissions to all resource
        # types. IAM uses this parameter for condition keys in IAM policies for CloudFormation. For more
        # information, see Control CloudFormation access with Identity and Access Management in the
        # CloudFormation User Guide . Only one of the Capabilities and ResourceType parameters can be
        # specified.

        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # The resources to import into your stack.

        @[JSON::Field(key: "ResourcesToImport")]
        getter resources_to_import : Array(Types::ResourceToImport)?

        # The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes when executing the change
        # set. CloudFormation uses the role's credentials to make calls on your behalf. CloudFormation uses
        # this role for all future operations on the stack. Provided that users have permission to operate on
        # the stack, CloudFormation uses this role even if the users don't have permission to pass it. Ensure
        # that the role grants least permission. If you don't specify a value, CloudFormation uses the role
        # that was previously associated with the stack. If no role is available, CloudFormation uses a
        # temporary session that is generated from your user credentials.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The rollback triggers for CloudFormation to monitor during stack creation and updating operations,
        # and for the specified monitoring period afterwards.

        @[JSON::Field(key: "RollbackConfiguration")]
        getter rollback_configuration : Types::RollbackConfiguration?

        # Key-value pairs to associate with this stack. CloudFormation also propagates these tags to resources
        # in the stack. You can specify a maximum of 50 tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A structure that contains the body of the revised template, with a minimum length of 1 byte and a
        # maximum length of 51,200 bytes. CloudFormation generates the change set by comparing this template
        # with the template of the stack that you specified. Conditional: You must specify only one of the
        # following parameters: TemplateBody , TemplateURL , or set the UsePreviousTemplate to true .

        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        # The URL of the file that contains the revised template. The URL must point to a template (max size:
        # 1 MB) that's located in an Amazon S3 bucket or a Systems Manager document. CloudFormation generates
        # the change set by comparing this template with the stack that you specified. The location for an
        # Amazon S3 bucket must start with https:// . URLs from S3 static websites are not supported.
        # Conditional: You must specify only one of the following parameters: TemplateBody , TemplateURL , or
        # set the UsePreviousTemplate to true .

        @[JSON::Field(key: "TemplateURL")]
        getter template_url : String?

        # Whether to reuse the template that's associated with the stack to create the change set. When using
        # templates with the AWS::LanguageExtensions transform, provide the template instead of using
        # UsePreviousTemplate to ensure new parameter values and Systems Manager parameter updates are applied
        # correctly. For more information, see AWS::LanguageExtensions transform . Conditional: You must
        # specify only one of the following parameters: TemplateBody , TemplateURL , or set the
        # UsePreviousTemplate to true .

        @[JSON::Field(key: "UsePreviousTemplate")]
        getter use_previous_template : Bool?

        def initialize(
          @change_set_name : String,
          @stack_name : String,
          @capabilities : Array(String)? = nil,
          @change_set_type : String? = nil,
          @client_token : String? = nil,
          @deployment_mode : String? = nil,
          @description : String? = nil,
          @import_existing_resources : Bool? = nil,
          @include_nested_stacks : Bool? = nil,
          @notification_ar_ns : Array(String)? = nil,
          @on_stack_failure : String? = nil,
          @parameters : Array(Types::Parameter)? = nil,
          @resource_types : Array(String)? = nil,
          @resources_to_import : Array(Types::ResourceToImport)? = nil,
          @role_arn : String? = nil,
          @rollback_configuration : Types::RollbackConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil,
          @template_body : String? = nil,
          @template_url : String? = nil,
          @use_previous_template : Bool? = nil
        )
        end
      end

      # The output for the CreateChangeSet action.

      struct CreateChangeSetOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the change set.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The unique ID of the stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        def initialize(
          @id : String? = nil,
          @stack_id : String? = nil
        )
        end
      end


      struct CreateGeneratedTemplateInput
        include JSON::Serializable

        # The name assigned to the generated template.

        @[JSON::Field(key: "GeneratedTemplateName")]
        getter generated_template_name : String

        # An optional list of resources to be included in the generated template. If no resources are
        # specified,the template will be created without any resources. Resources can be added to the template
        # using the UpdateGeneratedTemplate API action.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::ResourceDefinition)?

        # An optional name or ARN of a stack to use as the base stack for the generated template.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        # The configuration details of the generated template, including the DeletionPolicy and
        # UpdateReplacePolicy .

        @[JSON::Field(key: "TemplateConfiguration")]
        getter template_configuration : Types::TemplateConfiguration?

        def initialize(
          @generated_template_name : String,
          @resources : Array(Types::ResourceDefinition)? = nil,
          @stack_name : String? = nil,
          @template_configuration : Types::TemplateConfiguration? = nil
        )
        end
      end


      struct CreateGeneratedTemplateOutput
        include JSON::Serializable

        # The ID of the generated template.

        @[JSON::Field(key: "GeneratedTemplateId")]
        getter generated_template_id : String?

        def initialize(
          @generated_template_id : String? = nil
        )
        end
      end

      # The input for CreateStack action.

      struct CreateStackInput
        include JSON::Serializable

        # The name that's associated with the stack. The name must be unique in the Region in which you are
        # creating the stack. A stack name can contain only alphanumeric characters (case sensitive) and
        # hyphens. It must start with an alphabetical character and can't be longer than 128 characters.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # In some cases, you must explicitly acknowledge that your stack template contains certain
        # capabilities in order for CloudFormation to create the stack. CAPABILITY_IAM and
        # CAPABILITY_NAMED_IAM Some stack templates might include resources that can affect permissions in
        # your Amazon Web Services account; for example, by creating new IAM users. For those stacks, you must
        # explicitly acknowledge this by specifying one of these capabilities. The following IAM resources
        # require you to specify either the CAPABILITY_IAM or CAPABILITY_NAMED_IAM capability. If you have IAM
        # resources, you can specify either capability. If you have IAM resources with custom names, you must
        # specify CAPABILITY_NAMED_IAM . If you don't specify either of these capabilities, CloudFormation
        # returns an InsufficientCapabilities error. If your stack template contains these resources, we
        # recommend that you review all permissions associated with them and edit their permissions if
        # necessary. AWS::IAM::AccessKey AWS::IAM::Group AWS::IAM::InstanceProfile AWS::IAM::ManagedPolicy
        # AWS::IAM::Policy AWS::IAM::Role AWS::IAM::User AWS::IAM::UserToGroupAddition For more information,
        # see Acknowledging IAM resources in CloudFormation templates . CAPABILITY_AUTO_EXPAND Some template
        # contain macros. Macros perform custom processing on templates; this can include simple actions like
        # find-and-replace operations, all the way to extensive transformations of entire templates. Because
        # of this, users typically create a change set from the processed template, so that they can review
        # the changes resulting from the macros before actually creating the stack. If your stack template
        # contains one or more macros, and you choose to create a stack directly from the processed template,
        # without first reviewing the resulting changes in a change set, you must acknowledge this capability.
        # This includes the AWS::Include and AWS::Serverless transforms, which are macros hosted by
        # CloudFormation. If you want to create a stack from a stack template that contains macros and nested
        # stacks, you must create the stack directly from the template using this capability. You should only
        # create stacks directly from a stack template that contains macros if you know what processing the
        # macro performs. Each macro relies on an underlying Lambda service function for processing stack
        # templates. Be aware that the Lambda function owner can update the function operation without
        # CloudFormation being notified. For more information, see Perform custom processing on CloudFormation
        # templates with template macros . Only one of the Capabilities and ResourceType parameters can be
        # specified.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)?

        # A unique identifier for this CreateStack request. Specify this token if you plan to retry requests
        # so that CloudFormation knows that you're not attempting to create a stack with the same name. You
        # might retry CreateStack requests to ensure that CloudFormation successfully received them. All
        # events initiated by a given stack operation are assigned the same client request token, which you
        # can use to track operations. For example, if you execute a CreateStack operation with the token
        # token1 , then all the StackEvents generated by that operation will have ClientRequestToken set as
        # token1 . In the console, stack operations display the client request token on the Events tab. Stack
        # operations that are initiated from the console use the token format Console-StackOperation-ID ,
        # which helps you easily identify the stack operation . For example, if you create a stack using the
        # console, each stack event would be assigned the same token in the following format:
        # Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002 .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Set to true to disable rollback of the stack if stack creation failed. You can specify either
        # DisableRollback or OnFailure , but not both. Default: false

        @[JSON::Field(key: "DisableRollback")]
        getter disable_rollback : Bool?

        # Whether to enable termination protection on the specified stack. If a user attempts to delete a
        # stack with termination protection enabled, the operation fails and the stack remains unchanged. For
        # more information, see Protect CloudFormation stacks from being deleted in the CloudFormation User
        # Guide . Termination protection is deactivated on stacks by default. For nested stacks , termination
        # protection is set on the root stack and can't be changed directly on the nested stack.

        @[JSON::Field(key: "EnableTerminationProtection")]
        getter enable_termination_protection : Bool?

        # The Amazon SNS topic ARNs to publish stack related events. You can find your Amazon SNS topic ARNs
        # using the Amazon SNS console or your Command Line Interface (CLI).

        @[JSON::Field(key: "NotificationARNs")]
        getter notification_ar_ns : Array(String)?

        # Determines what action will be taken if stack creation fails. This must be one of: DO_NOTHING ,
        # ROLLBACK , or DELETE . You can specify either OnFailure or DisableRollback , but not both. Although
        # the default setting is ROLLBACK , there is one exception. This exception occurs when a StackSet
        # attempts to deploy a stack instance and the stack instance fails to create successfully. In this
        # case, the CreateStack call overrides the default setting and sets the value of OnFailure to DELETE .
        # Default: ROLLBACK

        @[JSON::Field(key: "OnFailure")]
        getter on_failure : String?

        # A list of Parameter structures that specify input parameters for the stack. For more information,
        # see the Parameter data type.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # Specifies which resource types you can work with, such as AWS::EC2::Instance or
        # Custom::MyCustomInstance . If the list of resource types doesn't include a resource that you're
        # creating, the stack creation fails. By default, CloudFormation grants permissions to all resource
        # types. IAM uses this parameter for CloudFormation-specific condition keys in IAM policies. For more
        # information, see Control CloudFormation access with Identity and Access Management . Only one of the
        # Capabilities and ResourceType parameters can be specified.

        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # When set to true , newly created resources are deleted when the operation rolls back. This includes
        # newly created resources marked with a deletion policy of Retain . Default: false

        @[JSON::Field(key: "RetainExceptOnCreate")]
        getter retain_except_on_create : Bool?

        # The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes to create the stack.
        # CloudFormation uses the role's credentials to make calls on your behalf. CloudFormation always uses
        # this role for all future operations on the stack. Provided that users have permission to operate on
        # the stack, CloudFormation uses this role even if the users don't have permission to pass it. Ensure
        # that the role grants least privilege. If you don't specify a value, CloudFormation uses the role
        # that was previously associated with the stack. If no role is available, CloudFormation uses a
        # temporary session that's generated from your user credentials.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The rollback triggers for CloudFormation to monitor during stack creation and updating operations,
        # and for the specified monitoring period afterwards.

        @[JSON::Field(key: "RollbackConfiguration")]
        getter rollback_configuration : Types::RollbackConfiguration?

        # Structure that contains the stack policy body. For more information, see Prevent updates to stack
        # resources in the CloudFormation User Guide . You can specify either the StackPolicyBody or the
        # StackPolicyURL parameter, but not both.

        @[JSON::Field(key: "StackPolicyBody")]
        getter stack_policy_body : String?

        # Location of a file that contains the stack policy. The URL must point to a policy (maximum size: 16
        # KB) located in an S3 bucket in the same Region as the stack. The location for an Amazon S3 bucket
        # must start with https:// . URLs from S3 static websites are not supported. You can specify either
        # the StackPolicyBody or the StackPolicyURL parameter, but not both.

        @[JSON::Field(key: "StackPolicyURL")]
        getter stack_policy_url : String?

        # Key-value pairs to associate with this stack. CloudFormation also propagates these tags to the
        # resources created in the stack. A maximum number of 50 tags can be specified.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Structure that contains the template body with a minimum length of 1 byte and a maximum length of
        # 51,200 bytes. Conditional: You must specify either TemplateBody or TemplateURL , but not both.

        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        # The URL of a file that contains the template body. The URL must point to a template (max size: 1 MB)
        # that's located in an Amazon S3 bucket or a Systems Manager document. The location for an Amazon S3
        # bucket must start with https:// . URLs from S3 static websites are not supported. Conditional: You
        # must specify either the TemplateBody or the TemplateURL parameter, but not both.

        @[JSON::Field(key: "TemplateURL")]
        getter template_url : String?

        # The amount of time that can pass before the stack status becomes CREATE_FAILED ; if DisableRollback
        # is not set or is set to false , the stack will be rolled back.

        @[JSON::Field(key: "TimeoutInMinutes")]
        getter timeout_in_minutes : Int32?

        def initialize(
          @stack_name : String,
          @capabilities : Array(String)? = nil,
          @client_request_token : String? = nil,
          @disable_rollback : Bool? = nil,
          @enable_termination_protection : Bool? = nil,
          @notification_ar_ns : Array(String)? = nil,
          @on_failure : String? = nil,
          @parameters : Array(Types::Parameter)? = nil,
          @resource_types : Array(String)? = nil,
          @retain_except_on_create : Bool? = nil,
          @role_arn : String? = nil,
          @rollback_configuration : Types::RollbackConfiguration? = nil,
          @stack_policy_body : String? = nil,
          @stack_policy_url : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @template_body : String? = nil,
          @template_url : String? = nil,
          @timeout_in_minutes : Int32? = nil
        )
        end
      end


      struct CreateStackInstancesInput
        include JSON::Serializable

        # The names of one or more Amazon Web Services Regions where you want to create stack instances using
        # the specified Amazon Web Services accounts.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)

        # The name or unique ID of the StackSet that you want to create stack instances from.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Self-managed permissions] The account IDs of one or more Amazon Web Services accounts that you want
        # to create stack instances in the specified Region(s) for. You can specify Accounts or
        # DeploymentTargets , but not both.

        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(String)?

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # [Service-managed permissions] The Organizations accounts in which to create stack instances in the
        # specified Amazon Web Services Regions. You can specify Accounts or DeploymentTargets , but not both.

        @[JSON::Field(key: "DeploymentTargets")]
        getter deployment_targets : Types::DeploymentTargets?

        # The unique identifier for this StackSet operation. The operation ID also functions as an idempotency
        # token, to ensure that CloudFormation performs the StackSet operation only once, even if you retry
        # the request multiple times. You might retry StackSet operation requests to ensure that
        # CloudFormation successfully received them. If you don't specify an operation ID, the SDK generates
        # one automatically. Repeating this StackSet operation with a new operation ID retries all stack
        # instances whose status is OUTDATED .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # Preferences for how CloudFormation performs this StackSet operation.

        @[JSON::Field(key: "OperationPreferences")]
        getter operation_preferences : Types::StackSetOperationPreferences?

        # A list of StackSet parameters whose values you want to override in the selected stack instances. Any
        # overridden parameter values will be applied to all stack instances in the specified accounts and
        # Amazon Web Services Regions. When specifying parameters and their values, be aware of how
        # CloudFormation sets parameter values during stack instance operations: To override the current value
        # for a parameter, include the parameter and specify its value. To leave an overridden parameter set
        # to its present value, include the parameter and specify UsePreviousValue as true . (You can't
        # specify both a value and set UsePreviousValue to true .) To set an overridden parameter back to the
        # value specified in the StackSet, specify a parameter list but don't include the parameter in the
        # list. To leave all parameters set to their present values, don't specify this property at all.
        # During StackSet updates, any parameter values overridden for a stack instance aren't updated, but
        # retain their overridden value. You can only override the parameter values that are specified in the
        # StackSet; to add or delete a parameter itself, use UpdateStackSet to update the StackSet template.

        @[JSON::Field(key: "ParameterOverrides")]
        getter parameter_overrides : Array(Types::Parameter)?

        def initialize(
          @regions : Array(String),
          @stack_set_name : String,
          @accounts : Array(String)? = nil,
          @call_as : String? = nil,
          @deployment_targets : Types::DeploymentTargets? = nil,
          @operation_id : String? = nil,
          @operation_preferences : Types::StackSetOperationPreferences? = nil,
          @parameter_overrides : Array(Types::Parameter)? = nil
        )
        end
      end


      struct CreateStackInstancesOutput
        include JSON::Serializable

        # The unique identifier for this StackSet operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # The output for a CreateStack action.

      struct CreateStackOutput
        include JSON::Serializable

        # A unique identifier for this stack operation that can be used to track the operation's progress and
        # events.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # Unique identifier of the stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        def initialize(
          @operation_id : String? = nil,
          @stack_id : String? = nil
        )
        end
      end


      struct CreateStackRefactorInput
        include JSON::Serializable

        # The stacks being refactored.

        @[JSON::Field(key: "StackDefinitions")]
        getter stack_definitions : Array(Types::StackDefinition)

        # A description to help you identify the stack refactor.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Determines if a new stack is created with the refactor.

        @[JSON::Field(key: "EnableStackCreation")]
        getter enable_stack_creation : Bool?

        # The mappings for the stack resource Source and stack resource Destination .

        @[JSON::Field(key: "ResourceMappings")]
        getter resource_mappings : Array(Types::ResourceMapping)?

        def initialize(
          @stack_definitions : Array(Types::StackDefinition),
          @description : String? = nil,
          @enable_stack_creation : Bool? = nil,
          @resource_mappings : Array(Types::ResourceMapping)? = nil
        )
        end
      end


      struct CreateStackRefactorOutput
        include JSON::Serializable

        # The ID associated with the stack refactor created from the CreateStackRefactor action.

        @[JSON::Field(key: "StackRefactorId")]
        getter stack_refactor_id : String

        def initialize(
          @stack_refactor_id : String
        )
        end
      end


      struct CreateStackSetInput
        include JSON::Serializable

        # The name to associate with the StackSet. The name must be unique in the Region where you create your
        # StackSet. A stack name can contain only alphanumeric characters (case-sensitive) and hyphens. It
        # must start with an alphabetic character and can't be longer than 128 characters.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # The Amazon Resource Name (ARN) of the IAM role to use to create this StackSet. Specify an IAM role
        # only if you are using customized administrator roles to control which users or groups can manage
        # specific StackSets within the same administrator account. For more information, see Grant
        # self-managed permissions in the CloudFormation User Guide . Valid only if the permissions model is
        # SELF_MANAGED .

        @[JSON::Field(key: "AdministrationRoleARN")]
        getter administration_role_arn : String?

        # Describes whether StackSets automatically deploys to Organizations accounts that are added to the
        # target organization or organizational unit (OU). For more information, see Enable or disable
        # automatic deployments for StackSets in Organizations in the CloudFormation User Guide . Required if
        # the permissions model is SERVICE_MANAGED . (Not used with self-managed permissions.)

        @[JSON::Field(key: "AutoDeployment")]
        getter auto_deployment : Types::AutoDeployment?

        # Specifies whether you are acting as an account administrator in the organization's management
        # account or as a delegated administrator in a member account. By default, SELF is specified. Use SELF
        # for StackSets with self-managed permissions. To create a StackSet with service-managed permissions
        # while signed in to the management account, specify SELF . To create a StackSet with service-managed
        # permissions while signed in to a delegated administrator account, specify DELEGATED_ADMIN . Your
        # Amazon Web Services account must be registered as a delegated admin in the management account. For
        # more information, see Register a delegated administrator in the CloudFormation User Guide .
        # StackSets with service-managed permissions are created in the management account, including
        # StackSets that are created by delegated administrators. Valid only if the permissions model is
        # SERVICE_MANAGED .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # In some cases, you must explicitly acknowledge that your StackSet template contains certain
        # capabilities in order for CloudFormation to create the StackSet and related stack instances.
        # CAPABILITY_IAM and CAPABILITY_NAMED_IAM Some stack templates might include resources that can affect
        # permissions in your Amazon Web Services account; for example, by creating new IAM users. For those
        # StackSets, you must explicitly acknowledge this by specifying one of these capabilities. The
        # following IAM resources require you to specify either the CAPABILITY_IAM or CAPABILITY_NAMED_IAM
        # capability. If you have IAM resources, you can specify either capability. If you have IAM resources
        # with custom names, you must specify CAPABILITY_NAMED_IAM . If you don't specify either of these
        # capabilities, CloudFormation returns an InsufficientCapabilities error. If your stack template
        # contains these resources, we recommend that you review all permissions associated with them and edit
        # their permissions if necessary. AWS::IAM::AccessKey AWS::IAM::Group AWS::IAM::InstanceProfile
        # AWS::IAM::Policy AWS::IAM::Role AWS::IAM::User AWS::IAM::UserToGroupAddition For more information,
        # see Acknowledging IAM resources in CloudFormation templates . CAPABILITY_AUTO_EXPAND Some templates
        # reference macros. If your StackSet template references one or more macros, you must create the
        # StackSet directly from the processed template, without first reviewing the resulting changes in a
        # change set. To create the StackSet directly, you must acknowledge this capability. For more
        # information, see Perform custom processing on CloudFormation templates with template macros .
        # StackSets with service-managed permissions don't currently support the use of macros in templates.
        # (This includes the AWS::Include and AWS::Serverless transforms, which are macros hosted by
        # CloudFormation.) Even if you specify this capability for a StackSet with service-managed
        # permissions, if you reference a macro in your template the StackSet operation will fail.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)?

        # A unique identifier for this CreateStackSet request. Specify this token if you plan to retry
        # requests so that CloudFormation knows that you're not attempting to create another StackSet with the
        # same name. You might retry CreateStackSet requests to ensure that CloudFormation successfully
        # received them. If you don't specify an operation ID, the SDK generates one automatically.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # A description of the StackSet. You can use the description to identify the StackSet's purpose or
        # other important information.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the IAM execution role to use to create the StackSet. If you do not specify an execution
        # role, CloudFormation uses the AWSCloudFormationStackSetExecutionRole role for the StackSet
        # operation. Specify an IAM role only if you are using customized execution roles to control which
        # stack resources users and groups can include in their StackSets. Valid only if the permissions model
        # is SELF_MANAGED .

        @[JSON::Field(key: "ExecutionRoleName")]
        getter execution_role_name : String?

        # Describes whether CloudFormation performs non-conflicting operations concurrently and queues
        # conflicting operations.

        @[JSON::Field(key: "ManagedExecution")]
        getter managed_execution : Types::ManagedExecution?

        # The input parameters for the StackSet template.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # Describes how the IAM roles required for StackSet operations are created. By default, SELF-MANAGED
        # is specified. With self-managed permissions, you must create the administrator and execution roles
        # required to deploy to target accounts. For more information, see Grant self-managed permissions .
        # With service-managed permissions, StackSets automatically creates the IAM roles required to deploy
        # to accounts managed by Organizations. For more information, see Activate trusted access for
        # StackSets with Organizations .

        @[JSON::Field(key: "PermissionModel")]
        getter permission_model : String?

        # The stack ID you are importing into a new StackSet. Specify the Amazon Resource Name (ARN) of the
        # stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        # The key-value pairs to associate with this StackSet and the stacks created from it. CloudFormation
        # also propagates these tags to supported resources that are created in the stacks. A maximum number
        # of 50 tags can be specified. If you specify tags as part of a CreateStackSet action, CloudFormation
        # checks to see if you have the required IAM permission to tag resources. If you don't, the entire
        # CreateStackSet action fails with an access denied error, and the StackSet is not created.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The structure that contains the template body, with a minimum length of 1 byte and a maximum length
        # of 51,200 bytes. Conditional: You must specify either the TemplateBody or the TemplateURL parameter,
        # but not both.

        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        # The URL of a file that contains the template body. The URL must point to a template (maximum size: 1
        # MB) that's located in an Amazon S3 bucket or a Systems Manager document. The location for an Amazon
        # S3 bucket must start with https:// . S3 static website URLs are not supported. Conditional: You must
        # specify either the TemplateBody or the TemplateURL parameter, but not both.

        @[JSON::Field(key: "TemplateURL")]
        getter template_url : String?

        def initialize(
          @stack_set_name : String,
          @administration_role_arn : String? = nil,
          @auto_deployment : Types::AutoDeployment? = nil,
          @call_as : String? = nil,
          @capabilities : Array(String)? = nil,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @execution_role_name : String? = nil,
          @managed_execution : Types::ManagedExecution? = nil,
          @parameters : Array(Types::Parameter)? = nil,
          @permission_model : String? = nil,
          @stack_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @template_body : String? = nil,
          @template_url : String? = nil
        )
        end
      end


      struct CreateStackSetOutput
        include JSON::Serializable

        # The ID of the StackSet that you're creating.

        @[JSON::Field(key: "StackSetId")]
        getter stack_set_id : String?

        def initialize(
          @stack_set_id : String? = nil
        )
        end
      end

      # The specified resource exists, but has been changed.

      struct CreatedButModifiedException
        include JSON::Serializable

        def initialize
        end
      end


      struct DeactivateOrganizationsAccessInput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeactivateOrganizationsAccessOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeactivateTypeInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the extension in this account and Region. Conditional: You must
        # specify either Arn , or TypeName and Type .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The extension type. Conditional: You must specify either Arn , or TypeName and Type .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The type name of the extension in this account and Region. If you specified a type name alias when
        # enabling the extension, use the type name alias. Conditional: You must specify either Arn , or
        # TypeName and Type .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @arn : String? = nil,
          @type : String? = nil,
          @type_name : String? = nil
        )
        end
      end


      struct DeactivateTypeOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the DeleteChangeSet action.

      struct DeleteChangeSetInput
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the change set that you want to delete.

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String

        # If you specified the name of a change set to delete, specify the stack name or Amazon Resource Name
        # (ARN) that's associated with it.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        def initialize(
          @change_set_name : String,
          @stack_name : String? = nil
        )
        end
      end

      # The output for the DeleteChangeSet action.

      struct DeleteChangeSetOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteGeneratedTemplateInput
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of a generated template.

        @[JSON::Field(key: "GeneratedTemplateName")]
        getter generated_template_name : String

        def initialize(
          @generated_template_name : String
        )
        end
      end

      # The input for DeleteStack action.

      struct DeleteStackInput
        include JSON::Serializable

        # The name or the unique stack ID that's associated with the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # A unique identifier for this DeleteStack request. Specify this token if you plan to retry requests
        # so that CloudFormation knows that you're not attempting to delete a stack with the same name. You
        # might retry DeleteStack requests to ensure that CloudFormation successfully received them. All
        # events initiated by a given stack operation are assigned the same client request token, which you
        # can use to track operations. For example, if you execute a CreateStack operation with the token
        # token1 , then all the StackEvents generated by that operation will have ClientRequestToken set as
        # token1 . In the console, stack operations display the client request token on the Events tab. Stack
        # operations that are initiated from the console use the token format Console-StackOperation-ID ,
        # which helps you easily identify the stack operation . For example, if you create a stack using the
        # console, each stack event would be assigned the same token in the following format:
        # Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002 .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Specifies the deletion mode for the stack. Possible values are: STANDARD - Use the standard
        # behavior. Specifying this value is the same as not specifying this parameter. FORCE_DELETE_STACK -
        # Delete the stack if it's stuck in a DELETE_FAILED state due to resource deletion failure.

        @[JSON::Field(key: "DeletionMode")]
        getter deletion_mode : String?

        # For stacks in the DELETE_FAILED state, a list of resource logical IDs that are associated with the
        # resources you want to retain. During deletion, CloudFormation deletes the stack but doesn't delete
        # the retained resources. Retaining resources is useful when you can't delete a resource, such as a
        # non-empty S3 bucket, but you want to delete the stack.

        @[JSON::Field(key: "RetainResources")]
        getter retain_resources : Array(String)?

        # The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes to delete the stack.
        # CloudFormation uses the role's credentials to make calls on your behalf. If you don't specify a
        # value, CloudFormation uses the role that was previously associated with the stack. If no role is
        # available, CloudFormation uses a temporary session that's generated from your user credentials.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @stack_name : String,
          @client_request_token : String? = nil,
          @deletion_mode : String? = nil,
          @retain_resources : Array(String)? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct DeleteStackInstancesInput
        include JSON::Serializable

        # The Amazon Web Services Regions where you want to delete StackSet instances.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)

        # Removes the stack instances from the specified StackSet, but doesn't delete the stacks. You can't
        # reassociate a retained stack or add an existing, saved stack to a new stack set. For more
        # information, see StackSet operation options .

        @[JSON::Field(key: "RetainStacks")]
        getter retain_stacks : Bool

        # The name or unique ID of the StackSet that you want to delete stack instances for.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Self-managed permissions] The account IDs of the Amazon Web Services accounts that you want to
        # delete stack instances for. You can specify Accounts or DeploymentTargets , but not both.

        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(String)?

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # [Service-managed permissions] The Organizations accounts from which to delete stack instances. You
        # can specify Accounts or DeploymentTargets , but not both.

        @[JSON::Field(key: "DeploymentTargets")]
        getter deployment_targets : Types::DeploymentTargets?

        # The unique identifier for this StackSet operation. If you don't specify an operation ID, the SDK
        # generates one automatically. The operation ID also functions as an idempotency token, to ensure that
        # CloudFormation performs the StackSet operation only once, even if you retry the request multiple
        # times. You can retry StackSet operation requests to ensure that CloudFormation successfully received
        # them. Repeating this StackSet operation with a new operation ID retries all stack instances whose
        # status is OUTDATED .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # Preferences for how CloudFormation performs this StackSet operation.

        @[JSON::Field(key: "OperationPreferences")]
        getter operation_preferences : Types::StackSetOperationPreferences?

        def initialize(
          @regions : Array(String),
          @retain_stacks : Bool,
          @stack_set_name : String,
          @accounts : Array(String)? = nil,
          @call_as : String? = nil,
          @deployment_targets : Types::DeploymentTargets? = nil,
          @operation_id : String? = nil,
          @operation_preferences : Types::StackSetOperationPreferences? = nil
        )
        end
      end


      struct DeleteStackInstancesOutput
        include JSON::Serializable

        # The unique identifier for this StackSet operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct DeleteStackSetInput
        include JSON::Serializable

        # The name or unique ID of the StackSet that you're deleting. You can obtain this value by running
        # ListStackSets .

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        def initialize(
          @stack_set_name : String,
          @call_as : String? = nil
        )
        end
      end


      struct DeleteStackSetOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the Organizations accounts where you want to create, update, or delete stack instances.
      # You can target either your entire organization or specific accounts using organizational units (OUs)
      # and account filter options. CloudFormation doesn't deploy stack instances to the organization
      # management account, even if the organization management account is in your organization or in an OU
      # in your organization. When performing create operations, if you specify both OrganizationalUnitIds
      # and Accounts , you must also specify the AccountFilterType property.

      struct DeploymentTargets
        include JSON::Serializable

        # Refines which accounts will have stack operations performed on them by specifying how to use the
        # Accounts and OrganizationalUnitIds properties together. The following values determine how
        # CloudFormation selects target accounts: INTERSECTION : Performs stack operations only on specific
        # individual accounts within the selected OUs. Only accounts that are both specified in the Accounts
        # property and belong to the specified OUs will be targeted. DIFFERENCE : Performs stack operations on
        # all accounts in the selected OUs except for specific accounts listed in the Accounts property. This
        # enables you to exclude certain accounts within an OU, such as suspended accounts. UNION : Performs
        # stack operations on the specified OUs plus additional individual accounts listed in the Accounts
        # property. This is the default value if AccountFilterType is not provided. This lets you target an
        # entire OU and individual accounts from a different OU in one request. Note that UNION is not
        # supported for CreateStackInstances operations. NONE : Performs stack operations on all accounts in
        # the specified organizational units (OUs).

        @[JSON::Field(key: "AccountFilterType")]
        getter account_filter_type : String?

        # The Amazon Web Services account IDs where you want to perform stack operations. How these accounts
        # are used depends on the AccountFilterType property. If you have many account numbers, you can
        # provide those accounts using the AccountsUrl property instead.

        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(String)?

        # The Amazon S3 URL path to a file that contains a list of Amazon Web Services account IDs. The file
        # format must be either .csv or .txt , and the data can be comma-separated or new-line-separated.
        # There is currently a 10MB limit for the data (approximately 800,000 accounts). This property serves
        # the same purpose as Accounts but allows you to specify a large number of accounts.

        @[JSON::Field(key: "AccountsUrl")]
        getter accounts_url : String?

        # The organization root ID or organizational unit (OU) IDs where you want to perform stack operations.
        # CloudFormation will perform operations on accounts within these OUs and their child OUs.

        @[JSON::Field(key: "OrganizationalUnitIds")]
        getter organizational_unit_ids : Array(String)?

        def initialize(
          @account_filter_type : String? = nil,
          @accounts : Array(String)? = nil,
          @accounts_url : String? = nil,
          @organizational_unit_ids : Array(String)? = nil
        )
        end
      end


      struct DeregisterTypeInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the extension. Conditional: You must specify either TypeName and
        # Type , or Arn .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The kind of extension. Conditional: You must specify either TypeName and Type , or Arn .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The name of the extension. Conditional: You must specify either TypeName and Type , or Arn .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # The ID of a specific version of the extension. The version ID is the value at the end of the Amazon
        # Resource Name (ARN) assigned to the extension version when it is registered.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @arn : String? = nil,
          @type : String? = nil,
          @type_name : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct DeregisterTypeOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the DescribeAccountLimits action.

      struct DescribeAccountLimitsInput
        include JSON::Serializable

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # The output for the DescribeAccountLimits action.

      struct DescribeAccountLimitsOutput
        include JSON::Serializable

        # An account limit structure that contain a list of CloudFormation account limits and their values.

        @[JSON::Field(key: "AccountLimits")]
        getter account_limits : Array(Types::AccountLimit)?

        # If the output exceeds 1 MB in size, a string that identifies the next page of limits. If no
        # additional page exists, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_limits : Array(Types::AccountLimit)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeChangeSetHooksInput
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the change set that you want to describe.

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String

        # If specified, lists only the Hooks related to the specified LogicalResourceId .

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If you specified the name of a change set, specify the stack name or stack ID (ARN) of the change
        # set you want to describe.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        def initialize(
          @change_set_name : String,
          @logical_resource_id : String? = nil,
          @next_token : String? = nil,
          @stack_name : String? = nil
        )
        end
      end


      struct DescribeChangeSetHooksOutput
        include JSON::Serializable

        # The change set identifier (stack ID).

        @[JSON::Field(key: "ChangeSetId")]
        getter change_set_id : String?

        # The change set name.

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String?

        # List of Hook objects.

        @[JSON::Field(key: "Hooks")]
        getter hooks : Array(Types::ChangeSetHook)?

        # Pagination token, null or empty if no more results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The stack identifier (stack ID).

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        # The stack name.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        # Provides the status of the change set Hook.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @change_set_id : String? = nil,
          @change_set_name : String? = nil,
          @hooks : Array(Types::ChangeSetHook)? = nil,
          @next_token : String? = nil,
          @stack_id : String? = nil,
          @stack_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The input for the DescribeChangeSet action.

      struct DescribeChangeSetInput
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the change set that you want to describe.

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String

        # If true , the returned changes include detailed changes in the property values.

        @[JSON::Field(key: "IncludePropertyValues")]
        getter include_property_values : Bool?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If you specified the name of a change set, specify the stack name or ID (ARN) of the change set you
        # want to describe.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        def initialize(
          @change_set_name : String,
          @include_property_values : Bool? = nil,
          @next_token : String? = nil,
          @stack_name : String? = nil
        )
        end
      end

      # The output for the DescribeChangeSet action.

      struct DescribeChangeSetOutput
        include JSON::Serializable

        # If you execute the change set, the list of capabilities that were explicitly acknowledged when the
        # change set was created.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)?

        # The Amazon Resource Name (ARN) of the change set.

        @[JSON::Field(key: "ChangeSetId")]
        getter change_set_id : String?

        # The name of the change set.

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String?

        # A list of Change structures that describes the resources CloudFormation changes if you execute the
        # change set.

        @[JSON::Field(key: "Changes")]
        getter changes : Array(Types::Change)?

        # The start time when the change set was created, in UTC.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The deployment mode specified when the change set was created. Valid value is REVERT_DRIFT . Only
        # present for drift-aware change sets.

        @[JSON::Field(key: "DeploymentMode")]
        getter deployment_mode : String?

        # Information about the change set.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If the change set execution status is AVAILABLE , you can execute the change set. If you can't
        # execute the change set, the status indicates why. For example, a change set might be in an
        # UNAVAILABLE state because CloudFormation is still creating it or in an OBSOLETE state because the
        # stack was already updated.

        @[JSON::Field(key: "ExecutionStatus")]
        getter execution_status : String?

        # Indicates if the change set imports resources that already exist. This parameter can only import
        # resources that have custom names in templates. To import resources that do not accept custom names,
        # such as EC2 instances, use the resource import feature instead.

        @[JSON::Field(key: "ImportExistingResources")]
        getter import_existing_resources : Bool?

        # Verifies if IncludeNestedStacks is set to True .

        @[JSON::Field(key: "IncludeNestedStacks")]
        getter include_nested_stacks : Bool?

        # If the output exceeds 1 MB, a string that identifies the next page of changes. If there is no
        # additional page, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ARNs of the Amazon SNS topics that will be associated with the stack if you execute the change
        # set.

        @[JSON::Field(key: "NotificationARNs")]
        getter notification_ar_ns : Array(String)?

        # Determines what action will be taken if stack creation fails. When this parameter is specified, the
        # DisableRollback parameter to the ExecuteChangeSet API operation must not be specified. This must be
        # one of these values: DELETE - Deletes the change set if the stack creation fails. This is only valid
        # when the ChangeSetType parameter is set to CREATE . If the deletion of the stack fails, the status
        # of the stack is DELETE_FAILED . DO_NOTHING - if the stack creation fails, do nothing. This is
        # equivalent to specifying true for the DisableRollback parameter to the ExecuteChangeSet API
        # operation. ROLLBACK - if the stack creation fails, roll back the stack. This is equivalent to
        # specifying false for the DisableRollback parameter to the ExecuteChangeSet API operation.

        @[JSON::Field(key: "OnStackFailure")]
        getter on_stack_failure : String?

        # A list of Parameter structures that describes the input parameters and their values used to create
        # the change set. For more information, see the Parameter data type.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # Specifies the change set ID of the parent change set in the current nested change set hierarchy.

        @[JSON::Field(key: "ParentChangeSetId")]
        getter parent_change_set_id : String?

        # The rollback triggers for CloudFormation to monitor during stack creation and updating operations,
        # and for the specified monitoring period afterwards.

        @[JSON::Field(key: "RollbackConfiguration")]
        getter rollback_configuration : Types::RollbackConfiguration?

        # Specifies the change set ID of the root change set in the current nested change set hierarchy.

        @[JSON::Field(key: "RootChangeSetId")]
        getter root_change_set_id : String?

        # The drift status of the stack when the change set was created. Valid values: DRIFTED – The stack has
        # drifted from its last deployment. IN_SYNC – The stack is in sync with its last deployment.
        # NOT_CHECKED – CloudFormation doesn’t currently return this value. UNKNOWN – The drift status could
        # not be determined. Only present for drift-aware change sets.

        @[JSON::Field(key: "StackDriftStatus")]
        getter stack_drift_status : String?

        # The Amazon Resource Name (ARN) of the stack that's associated with the change set.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        # The name of the stack that's associated with the change set.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        # The current status of the change set, such as CREATE_PENDING , CREATE_COMPLETE , or FAILED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A description of the change set's status. For example, if your attempt to create a change set
        # failed, CloudFormation shows the error message.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # If you execute the change set, the tags that will be associated with the stack.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @capabilities : Array(String)? = nil,
          @change_set_id : String? = nil,
          @change_set_name : String? = nil,
          @changes : Array(Types::Change)? = nil,
          @creation_time : Time? = nil,
          @deployment_mode : String? = nil,
          @description : String? = nil,
          @execution_status : String? = nil,
          @import_existing_resources : Bool? = nil,
          @include_nested_stacks : Bool? = nil,
          @next_token : String? = nil,
          @notification_ar_ns : Array(String)? = nil,
          @on_stack_failure : String? = nil,
          @parameters : Array(Types::Parameter)? = nil,
          @parent_change_set_id : String? = nil,
          @rollback_configuration : Types::RollbackConfiguration? = nil,
          @root_change_set_id : String? = nil,
          @stack_drift_status : String? = nil,
          @stack_id : String? = nil,
          @stack_name : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct DescribeEventsInput
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the change set for which you want to retrieve events.

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String?

        # Filters to apply when retrieving events.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::EventFilter?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The unique identifier of the operation for which you want to retrieve events.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # The name or unique stack ID for which you want to retrieve events.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        def initialize(
          @change_set_name : String? = nil,
          @filters : Types::EventFilter? = nil,
          @next_token : String? = nil,
          @operation_id : String? = nil,
          @stack_name : String? = nil
        )
        end
      end


      struct DescribeEventsOutput
        include JSON::Serializable

        # If the request doesn't return all the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call DescribeEvents again and assign that token to the request object's
        # NextToken parameter. If the request returns all results, NextToken is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of operation events that match the specified criteria.

        @[JSON::Field(key: "OperationEvents")]
        getter operation_events : Array(Types::OperationEvent)?

        def initialize(
          @next_token : String? = nil,
          @operation_events : Array(Types::OperationEvent)? = nil
        )
        end
      end


      struct DescribeGeneratedTemplateInput
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of a generated template.

        @[JSON::Field(key: "GeneratedTemplateName")]
        getter generated_template_name : String

        def initialize(
          @generated_template_name : String
        )
        end
      end


      struct DescribeGeneratedTemplateOutput
        include JSON::Serializable

        # The time the generated template was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the generated template. The format is
        # arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id} . For example,
        # arn:aws:cloudformation: us-east-1 : 123456789012 :generatedtemplate/
        # 2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc .

        @[JSON::Field(key: "GeneratedTemplateId")]
        getter generated_template_id : String?

        # The name of the generated template.

        @[JSON::Field(key: "GeneratedTemplateName")]
        getter generated_template_name : String?

        # The time the generated template was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # An object describing the progress of the template generation.

        @[JSON::Field(key: "Progress")]
        getter progress : Types::TemplateProgress?

        # A list of objects describing the details of the resources in the template generation.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::ResourceDetail)?

        # The stack ARN of the base stack if a base stack was provided when generating the template.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        # The status of the template generation. Supported values are: CreatePending - the creation of the
        # template is pending. CreateInProgress - the creation of the template is in progress. DeletePending -
        # the deletion of the template is pending. DeleteInProgress - the deletion of the template is in
        # progress. UpdatePending - the update of the template is pending. UpdateInProgress - the update of
        # the template is in progress. Failed - the template operation failed. Complete - the template
        # operation is complete.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason for the current template generation status. This will provide more details if a failure
        # happened.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The configuration details of the generated template, including the DeletionPolicy and
        # UpdateReplacePolicy .

        @[JSON::Field(key: "TemplateConfiguration")]
        getter template_configuration : Types::TemplateConfiguration?

        # The number of warnings generated for this template. The warnings are found in the details of each of
        # the resources in the template.

        @[JSON::Field(key: "TotalWarnings")]
        getter total_warnings : Int32?

        def initialize(
          @creation_time : Time? = nil,
          @generated_template_id : String? = nil,
          @generated_template_name : String? = nil,
          @last_updated_time : Time? = nil,
          @progress : Types::TemplateProgress? = nil,
          @resources : Array(Types::ResourceDetail)? = nil,
          @stack_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @template_configuration : Types::TemplateConfiguration? = nil,
          @total_warnings : Int32? = nil
        )
        end
      end


      struct DescribeOrganizationsAccessInput
        include JSON::Serializable

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. If you are signed in to the management account, specify SELF . If you are signed
        # in to a delegated administrator account, specify DELEGATED_ADMIN . Your Amazon Web Services account
        # must be registered as a delegated administrator in the management account. For more information, see
        # Register a delegated administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        def initialize(
          @call_as : String? = nil
        )
        end
      end


      struct DescribeOrganizationsAccessOutput
        include JSON::Serializable

        # Presents the status of the OrganizationAccess .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct DescribePublisherInput
        include JSON::Serializable

        # The ID of the extension publisher. If you don't supply a PublisherId , and you have registered as an
        # extension publisher, DescribePublisher returns information about your own publisher account.

        @[JSON::Field(key: "PublisherId")]
        getter publisher_id : String?

        def initialize(
          @publisher_id : String? = nil
        )
        end
      end


      struct DescribePublisherOutput
        include JSON::Serializable

        # The type of account used as the identity provider when registering this publisher with
        # CloudFormation.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : String?

        # The ID of the extension publisher.

        @[JSON::Field(key: "PublisherId")]
        getter publisher_id : String?

        # The URL to the publisher's profile with the identity provider.

        @[JSON::Field(key: "PublisherProfile")]
        getter publisher_profile : String?

        # Whether the publisher is verified. Currently, all registered publishers are verified.

        @[JSON::Field(key: "PublisherStatus")]
        getter publisher_status : String?

        def initialize(
          @identity_provider : String? = nil,
          @publisher_id : String? = nil,
          @publisher_profile : String? = nil,
          @publisher_status : String? = nil
        )
        end
      end


      struct DescribeResourceScanInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource scan.

        @[JSON::Field(key: "ResourceScanId")]
        getter resource_scan_id : String

        def initialize(
          @resource_scan_id : String
        )
        end
      end


      struct DescribeResourceScanOutput
        include JSON::Serializable

        # The time that the resource scan was finished.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The percentage of the resource scan that has been completed.

        @[JSON::Field(key: "PercentageCompleted")]
        getter percentage_completed : Float64?

        # The Amazon Resource Name (ARN) of the resource scan. The format is
        # arn:${Partition}:cloudformation:${Region}:${Account}:resourceScan/${Id} . An example is
        # arn:aws:cloudformation: us-east-1 : 123456789012 :resourceScan/ f5b490f7-7ed4-428a-aa06-31ff25db0772
        # .

        @[JSON::Field(key: "ResourceScanId")]
        getter resource_scan_id : String?

        # The list of resource types for the specified scan. Resource types are only available for scans with
        # a Status set to COMPLETE or FAILED .

        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # The number of resources that were read. This is only available for scans with a Status set to
        # COMPLETE , EXPIRED , or FAILED . This field may be 0 if the resource scan failed with a
        # ResourceScanLimitExceededException .

        @[JSON::Field(key: "ResourcesRead")]
        getter resources_read : Int32?

        # The number of resources that were listed. This is only available for scans with a Status set to
        # COMPLETE , EXPIRED , or FAILED .

        @[JSON::Field(key: "ResourcesScanned")]
        getter resources_scanned : Int32?

        # The scan filters that were used.

        @[JSON::Field(key: "ScanFilters")]
        getter scan_filters : Array(Types::ScanFilter)?

        # The time that the resource scan was started.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # Status of the resource scan. IN_PROGRESS The resource scan is still in progress. COMPLETE The
        # resource scan is complete. EXPIRED The resource scan has expired. FAILED The resource scan has
        # failed.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason for the resource scan status, providing more information if a failure happened.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @end_time : Time? = nil,
          @percentage_completed : Float64? = nil,
          @resource_scan_id : String? = nil,
          @resource_types : Array(String)? = nil,
          @resources_read : Int32? = nil,
          @resources_scanned : Int32? = nil,
          @scan_filters : Array(Types::ScanFilter)? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct DescribeStackDriftDetectionStatusInput
        include JSON::Serializable

        # The ID of the drift detection results of this operation. CloudFormation generates new results, with
        # a new drift detection ID, each time this operation is run. However, the number of drift results
        # CloudFormation retains for any given stack, and for how long, may vary.

        @[JSON::Field(key: "StackDriftDetectionId")]
        getter stack_drift_detection_id : String

        def initialize(
          @stack_drift_detection_id : String
        )
        end
      end


      struct DescribeStackDriftDetectionStatusOutput
        include JSON::Serializable

        # The status of the stack drift detection operation. DETECTION_COMPLETE : The stack drift detection
        # operation has successfully completed for all resources in the stack that support drift detection.
        # (Resources that don't currently support stack detection remain unchecked.) If you specified logical
        # resource IDs for CloudFormation to use as a filter for the stack drift detection operation, only the
        # resources with those logical IDs are checked for drift. DETECTION_FAILED : The stack drift detection
        # operation has failed for at least one resource in the stack. Results will be available for resources
        # on which CloudFormation successfully completed drift detection. DETECTION_IN_PROGRESS : The stack
        # drift detection operation is currently in progress.

        @[JSON::Field(key: "DetectionStatus")]
        getter detection_status : String

        # The ID of the drift detection results of this operation. CloudFormation generates new results, with
        # a new drift detection ID, each time this operation is run. However, the number of reports
        # CloudFormation retains for any given stack, and for how long, may vary.

        @[JSON::Field(key: "StackDriftDetectionId")]
        getter stack_drift_detection_id : String

        # The ID of the stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String

        # Time at which the stack drift detection operation was initiated.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        # The reason the stack drift detection operation has its current status.

        @[JSON::Field(key: "DetectionStatusReason")]
        getter detection_status_reason : String?

        # Total number of stack resources that have drifted. This is NULL until the drift detection operation
        # reaches a status of DETECTION_COMPLETE . This value will be 0 for stacks whose drift status is
        # IN_SYNC .

        @[JSON::Field(key: "DriftedStackResourceCount")]
        getter drifted_stack_resource_count : Int32?

        # Status of the stack's actual configuration compared to its expected configuration. DRIFTED : The
        # stack differs from its expected template configuration. A stack is considered to have drifted if one
        # or more of its resources have drifted. NOT_CHECKED : CloudFormation hasn't checked if the stack
        # differs from its expected template configuration. IN_SYNC : The stack's actual configuration matches
        # its expected template configuration. UNKNOWN : CloudFormation could not run drift detection for a
        # resource in the stack. See the DetectionStatusReason for details.

        @[JSON::Field(key: "StackDriftStatus")]
        getter stack_drift_status : String?

        def initialize(
          @detection_status : String,
          @stack_drift_detection_id : String,
          @stack_id : String,
          @timestamp : Time,
          @detection_status_reason : String? = nil,
          @drifted_stack_resource_count : Int32? = nil,
          @stack_drift_status : String? = nil
        )
        end
      end

      # The input for DescribeStackEvents action.

      struct DescribeStackEventsInput
        include JSON::Serializable

        # The name or the unique stack ID that's associated with the stack, which aren't always
        # interchangeable: Running stacks: You can specify either the stack's name or its unique stack ID.
        # Deleted stacks: You must specify the unique stack ID.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @stack_name : String,
          @next_token : String? = nil
        )
        end
      end

      # The output for a DescribeStackEvents action.

      struct DescribeStackEventsOutput
        include JSON::Serializable

        # If the output exceeds 1 MB in size, a string that identifies the next page of events. If no
        # additional page exists, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of StackEvents structures.

        @[JSON::Field(key: "StackEvents")]
        getter stack_events : Array(Types::StackEvent)?

        def initialize(
          @next_token : String? = nil,
          @stack_events : Array(Types::StackEvent)? = nil
        )
        end
      end


      struct DescribeStackInstanceInput
        include JSON::Serializable

        # The ID of an Amazon Web Services account that's associated with this stack instance.

        @[JSON::Field(key: "StackInstanceAccount")]
        getter stack_instance_account : String

        # The name of a Region that's associated with this stack instance.

        @[JSON::Field(key: "StackInstanceRegion")]
        getter stack_instance_region : String

        # The name or the unique stack ID of the StackSet that you want to get stack instance information for.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        def initialize(
          @stack_instance_account : String,
          @stack_instance_region : String,
          @stack_set_name : String,
          @call_as : String? = nil
        )
        end
      end


      struct DescribeStackInstanceOutput
        include JSON::Serializable

        # The stack instance that matches the specified request parameters.

        @[JSON::Field(key: "StackInstance")]
        getter stack_instance : Types::StackInstance?

        def initialize(
          @stack_instance : Types::StackInstance? = nil
        )
        end
      end


      struct DescribeStackRefactorInput
        include JSON::Serializable

        # The ID associated with the stack refactor created from the CreateStackRefactor action.

        @[JSON::Field(key: "StackRefactorId")]
        getter stack_refactor_id : String

        def initialize(
          @stack_refactor_id : String
        )
        end
      end


      struct DescribeStackRefactorOutput
        include JSON::Serializable

        # A description to help you identify the refactor.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The stack refactor execution operation status that's provided after calling the ExecuteStackRefactor
        # action.

        @[JSON::Field(key: "ExecutionStatus")]
        getter execution_status : String?

        # A detailed explanation for the stack refactor ExecutionStatus .

        @[JSON::Field(key: "ExecutionStatusReason")]
        getter execution_status_reason : String?

        # The unique ID for each stack.

        @[JSON::Field(key: "StackIds")]
        getter stack_ids : Array(String)?

        # The ID associated with the stack refactor created from the CreateStackRefactor action.

        @[JSON::Field(key: "StackRefactorId")]
        getter stack_refactor_id : String?

        # The stack refactor operation status that's provided after calling the CreateStackRefactor action.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed explanation for the stack refactor operation Status .

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @description : String? = nil,
          @execution_status : String? = nil,
          @execution_status_reason : String? = nil,
          @stack_ids : Array(String)? = nil,
          @stack_refactor_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct DescribeStackResourceDriftsInput
        include JSON::Serializable

        # The name of the stack for which you want drift information.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The resource drift status values to use as filters for the resource drift results returned. DELETED
        # : The resource differs from its expected template configuration in that the resource has been
        # deleted. MODIFIED : One or more resource properties differ from their expected template values.
        # IN_SYNC : The resource's actual configuration matches its expected template configuration.
        # NOT_CHECKED : CloudFormation doesn't currently return this value. UNKNOWN : CloudFormation could not
        # run drift detection for the resource.

        @[JSON::Field(key: "StackResourceDriftStatusFilters")]
        getter stack_resource_drift_status_filters : Array(String)?

        def initialize(
          @stack_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @stack_resource_drift_status_filters : Array(String)? = nil
        )
        end
      end


      struct DescribeStackResourceDriftsOutput
        include JSON::Serializable

        # Drift information for the resources that have been checked for drift in the specified stack. This
        # includes actual and expected configuration values for resources where CloudFormation detects drift.
        # For a given stack, there will be one StackResourceDrift for each stack resource that has been
        # checked for drift. Resources that haven't yet been checked for drift aren't included. Resources that
        # do not currently support drift detection aren't checked, and so not included. For a list of
        # resources that support drift detection, see Resource type support for imports and drift detection .

        @[JSON::Field(key: "StackResourceDrifts")]
        getter stack_resource_drifts : Array(Types::StackResourceDrift)

        # If the request doesn't return all the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call DescribeStackResourceDrifts again and assign that token to the request
        # object's NextToken parameter. If the request returns all results, NextToken is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @stack_resource_drifts : Array(Types::StackResourceDrift),
          @next_token : String? = nil
        )
        end
      end

      # The input for DescribeStackResource action.

      struct DescribeStackResourceInput
        include JSON::Serializable

        # The logical name of the resource as specified in the template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String

        # The name or the unique stack ID that's associated with the stack, which aren't always
        # interchangeable: Running stacks: You can specify either the stack's name or its unique stack ID.
        # Deleted stacks: You must specify the unique stack ID.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        def initialize(
          @logical_resource_id : String,
          @stack_name : String
        )
        end
      end

      # The output for a DescribeStackResource action.

      struct DescribeStackResourceOutput
        include JSON::Serializable

        # A StackResourceDetail structure that contains the description of the specified resource in the
        # specified stack.

        @[JSON::Field(key: "StackResourceDetail")]
        getter stack_resource_detail : Types::StackResourceDetail?

        def initialize(
          @stack_resource_detail : Types::StackResourceDetail? = nil
        )
        end
      end

      # The input for DescribeStackResources action.

      struct DescribeStackResourcesInput
        include JSON::Serializable

        # The logical name of the resource as specified in the template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String?

        # The name or unique identifier that corresponds to a physical instance ID of a resource supported by
        # CloudFormation. For example, for an Amazon Elastic Compute Cloud (EC2) instance, PhysicalResourceId
        # corresponds to the InstanceId . You can pass the EC2 InstanceId to DescribeStackResources to find
        # which stack the instance belongs to and what other resources are part of the stack. Required:
        # Conditional. If you don't specify PhysicalResourceId , you must specify StackName .

        @[JSON::Field(key: "PhysicalResourceId")]
        getter physical_resource_id : String?

        # The name or the unique stack ID that is associated with the stack, which aren't always
        # interchangeable: Running stacks: You can specify either the stack's name or its unique stack ID.
        # Deleted stacks: You must specify the unique stack ID. Required: Conditional. If you don't specify
        # StackName , you must specify PhysicalResourceId .

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        def initialize(
          @logical_resource_id : String? = nil,
          @physical_resource_id : String? = nil,
          @stack_name : String? = nil
        )
        end
      end

      # The output for a DescribeStackResources action.

      struct DescribeStackResourcesOutput
        include JSON::Serializable

        # A list of StackResource structures.

        @[JSON::Field(key: "StackResources")]
        getter stack_resources : Array(Types::StackResource)?

        def initialize(
          @stack_resources : Array(Types::StackResource)? = nil
        )
        end
      end


      struct DescribeStackSetInput
        include JSON::Serializable

        # The name or unique ID of the StackSet whose description you want.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        def initialize(
          @stack_set_name : String,
          @call_as : String? = nil
        )
        end
      end


      struct DescribeStackSetOperationInput
        include JSON::Serializable

        # The unique ID of the StackSet operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        # The name or the unique stack ID of the StackSet for the stack operation.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        def initialize(
          @operation_id : String,
          @stack_set_name : String,
          @call_as : String? = nil
        )
        end
      end


      struct DescribeStackSetOperationOutput
        include JSON::Serializable

        # The specified StackSet operation.

        @[JSON::Field(key: "StackSetOperation")]
        getter stack_set_operation : Types::StackSetOperation?

        def initialize(
          @stack_set_operation : Types::StackSetOperation? = nil
        )
        end
      end


      struct DescribeStackSetOutput
        include JSON::Serializable

        # The specified StackSet.

        @[JSON::Field(key: "StackSet")]
        getter stack_set : Types::StackSet?

        def initialize(
          @stack_set : Types::StackSet? = nil
        )
        end
      end

      # The input for DescribeStacks action.

      struct DescribeStacksInput
        include JSON::Serializable

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If you don't pass a parameter to StackName , the API returns a response that describes all resources
        # in the account, which can impact performance. This requires ListStacks and DescribeStacks
        # permissions. Consider using the ListStacks API if you're not passing a parameter to StackName . The
        # IAM policy below can be added to IAM policies when you want to limit resource-level permissions and
        # avoid returning a response when no parameter is sent in the request: { "Version": "2012-10-17",
        # "Statement": [{ "Effect": "Deny", "Action": "cloudformation:DescribeStacks", "NotResource":
        # "arn:aws:cloudformation:*:*:stack/*/*" }] } The name or the unique stack ID that's associated with
        # the stack, which aren't always interchangeable: Running stacks: You can specify either the stack's
        # name or its unique stack ID. Deleted stacks: You must specify the unique stack ID.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        def initialize(
          @next_token : String? = nil,
          @stack_name : String? = nil
        )
        end
      end

      # The output for a DescribeStacks action.

      struct DescribeStacksOutput
        include JSON::Serializable

        # If the output exceeds 1 MB in size, a string that identifies the next page of stacks. If no
        # additional page exists, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of stack structures.

        @[JSON::Field(key: "Stacks")]
        getter stacks : Array(Types::Stack)?

        def initialize(
          @next_token : String? = nil,
          @stacks : Array(Types::Stack)? = nil
        )
        end
      end


      struct DescribeTypeInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the extension. Conditional: You must specify either TypeName and
        # Type , or Arn .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The version number of a public third-party extension.

        @[JSON::Field(key: "PublicVersionNumber")]
        getter public_version_number : String?

        # The publisher ID of the extension publisher. Extensions provided by Amazon Web Services are not
        # assigned a publisher ID.

        @[JSON::Field(key: "PublisherId")]
        getter publisher_id : String?

        # The kind of extension. Conditional: You must specify either TypeName and Type , or Arn .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The name of the extension. Conditional: You must specify either TypeName and Type , or Arn .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # The ID of a specific version of the extension. The version ID is the value at the end of the Amazon
        # Resource Name (ARN) assigned to the extension version when it is registered. If you specify a
        # VersionId , DescribeType returns information about that specific extension version. Otherwise, it
        # returns information about the default extension version.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @arn : String? = nil,
          @public_version_number : String? = nil,
          @publisher_id : String? = nil,
          @type : String? = nil,
          @type_name : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct DescribeTypeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the extension.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Whether CloudFormation automatically updates the extension in this account and Region when a new
        # minor version is published by the extension publisher. Major versions released by the publisher must
        # be manually updated. For more information, see Automatically use new versions of extensions in the
        # CloudFormation User Guide .

        @[JSON::Field(key: "AutoUpdate")]
        getter auto_update : Bool?

        # A JSON string that represent the current configuration data for the extension in this account and
        # Region. To set the configuration data for an extension, use SetTypeConfiguration .

        @[JSON::Field(key: "ConfigurationSchema")]
        getter configuration_schema : String?

        # The ID of the default version of the extension. The default version is used when the extension
        # version isn't specified. This applies only to private extensions you have registered in your
        # account. For public extensions, both those provided by Amazon Web Services and published by third
        # parties, CloudFormation returns null . For more information, see RegisterType . To set the default
        # version of an extension, use SetTypeDefaultVersion .

        @[JSON::Field(key: "DefaultVersionId")]
        getter default_version_id : String?

        # The deprecation status of the extension version. Valid values include: LIVE : The extension is
        # activated or registered and can be used in CloudFormation operations, dependent on its provisioning
        # behavior and visibility scope. DEPRECATED : The extension has been deactivated or deregistered and
        # can no longer be used in CloudFormation operations. For public third-party extensions,
        # CloudFormation returns null .

        @[JSON::Field(key: "DeprecatedStatus")]
        getter deprecated_status : String?

        # The description of the extension.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The URL of a page providing detailed documentation for this extension.

        @[JSON::Field(key: "DocumentationUrl")]
        getter documentation_url : String?

        # The Amazon Resource Name (ARN) of the IAM execution role used to register the extension. This
        # applies only to private extensions you have registered in your account. For more information, see
        # RegisterType . If the registered extension calls any Amazon Web Services APIs, you must create an
        # IAM execution role that includes the necessary permissions to call those Amazon Web Services APIs,
        # and provision that execution role in your account. CloudFormation then assumes that execution role
        # to provide your extension with the appropriate credentials.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # Whether the extension is activated in the account and Region. This only applies to public
        # third-party extensions. For all other extensions, CloudFormation returns null .

        @[JSON::Field(key: "IsActivated")]
        getter is_activated : Bool?

        # Whether the specified extension version is set as the default version. This applies only to private
        # extensions you have registered in your account, and extensions published by Amazon Web Services. For
        # public third-party extensions, whether they are activated in your account, CloudFormation returns
        # null .

        @[JSON::Field(key: "IsDefaultVersion")]
        getter is_default_version : Bool?

        # When the specified extension version was registered. This applies only to: Private extensions you
        # have registered in your account. For more information, see RegisterType . Public extensions you have
        # activated in your account with auto-update specified. For more information, see ActivateType .

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : Time?

        # The latest version of a public extension that is available for use. This only applies if you specify
        # a public extension, and you don't specify a version. For all other requests, CloudFormation returns
        # null .

        @[JSON::Field(key: "LatestPublicVersion")]
        getter latest_public_version : String?

        # Contains logging configuration information for private extensions. This applies only to private
        # extensions you have registered in your account. For public extensions, both those provided by Amazon
        # Web Services and published by third parties, CloudFormation returns null . For more information, see
        # RegisterType .

        @[JSON::Field(key: "LoggingConfig")]
        getter logging_config : Types::LoggingConfig?

        # For public extensions that have been activated for this account and Region, the Amazon Resource Name
        # (ARN) of the public extension.

        @[JSON::Field(key: "OriginalTypeArn")]
        getter original_type_arn : String?

        # For public extensions that have been activated for this account and Region, the type name of the
        # public extension. If you specified a TypeNameAlias when enabling the extension in this account and
        # Region, CloudFormation treats that alias as the extension's type name within the account and Region,
        # not the type name of the public extension. For more information, see Use aliases to refer to
        # extensions in the CloudFormation User Guide .

        @[JSON::Field(key: "OriginalTypeName")]
        getter original_type_name : String?

        # For resource type extensions, the provisioning behavior of the resource type. CloudFormation
        # determines the provisioning type during registration, based on the types of handlers in the schema
        # handler package submitted. Valid values include: FULLY_MUTABLE : The resource type includes an
        # update handler to process updates to the type during stack update operations. IMMUTABLE : The
        # resource type doesn't include an update handler, so the type can't be updated and must instead be
        # replaced during stack update operations. NON_PROVISIONABLE : The resource type doesn't include all
        # the following handlers, and therefore can't actually be provisioned. create read delete

        @[JSON::Field(key: "ProvisioningType")]
        getter provisioning_type : String?

        # The version number of a public third-party extension. This applies only if you specify a public
        # extension you have activated in your account, or specify a public extension without specifying a
        # version. For all other extensions, CloudFormation returns null .

        @[JSON::Field(key: "PublicVersionNumber")]
        getter public_version_number : String?

        # The publisher ID of the extension publisher. This applies only to public third-party extensions. For
        # private registered extensions, and extensions provided by Amazon Web Services, CloudFormation
        # returns null .

        @[JSON::Field(key: "PublisherId")]
        getter publisher_id : String?

        # For extensions that are modules, the public third-party extensions that must be activated in your
        # account in order for the module itself to be activated.

        @[JSON::Field(key: "RequiredActivatedTypes")]
        getter required_activated_types : Array(Types::RequiredActivatedType)?

        # The schema that defines the extension. For more information, see Resource type schema in the
        # CloudFormation Command Line Interface (CLI) User Guide and the CloudFormation Hooks User Guide .

        @[JSON::Field(key: "Schema")]
        getter schema : String?

        # The URL of the source code for the extension.

        @[JSON::Field(key: "SourceUrl")]
        getter source_url : String?

        # When the specified private extension version was registered or activated in your account.

        @[JSON::Field(key: "TimeCreated")]
        getter time_created : Time?

        # The kind of extension.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The name of the extension. If the extension is a public third-party type you have activated with a
        # type name alias, CloudFormation returns the type name alias. For more information, see ActivateType
        # .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # The contract test status of the registered extension version. To return the extension test status of
        # a specific extension version, you must specify VersionId . This applies only to registered private
        # extension versions. CloudFormation doesn't return this information for public extensions, whether
        # they are activated in your account. PASSED : The extension has passed all its contract tests. An
        # extension must have a test status of PASSED before it can be published. For more information, see
        # Publishing extensions to make them available for public use in the CloudFormation Command Line
        # Interface (CLI) User Guide . FAILED : The extension has failed one or more contract tests.
        # IN_PROGRESS : Contract tests are currently being performed on the extension. NOT_TESTED : Contract
        # tests haven't been performed on the extension.

        @[JSON::Field(key: "TypeTestsStatus")]
        getter type_tests_status : String?

        # The description of the test status. To return the extension test status of a specific extension
        # version, you must specify VersionId . This applies only to registered private extension versions.
        # CloudFormation doesn't return this information for public extensions, whether they are activated in
        # your account.

        @[JSON::Field(key: "TypeTestsStatusDescription")]
        getter type_tests_status_description : String?

        # The scope at which the extension is visible and usable in CloudFormation operations. Valid values
        # include: PRIVATE : The extension is only visible and usable within the account in which it is
        # registered. CloudFormation marks any extensions you register as PRIVATE . PUBLIC : The extension is
        # publicly visible and usable within any Amazon Web Services account.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @arn : String? = nil,
          @auto_update : Bool? = nil,
          @configuration_schema : String? = nil,
          @default_version_id : String? = nil,
          @deprecated_status : String? = nil,
          @description : String? = nil,
          @documentation_url : String? = nil,
          @execution_role_arn : String? = nil,
          @is_activated : Bool? = nil,
          @is_default_version : Bool? = nil,
          @last_updated : Time? = nil,
          @latest_public_version : String? = nil,
          @logging_config : Types::LoggingConfig? = nil,
          @original_type_arn : String? = nil,
          @original_type_name : String? = nil,
          @provisioning_type : String? = nil,
          @public_version_number : String? = nil,
          @publisher_id : String? = nil,
          @required_activated_types : Array(Types::RequiredActivatedType)? = nil,
          @schema : String? = nil,
          @source_url : String? = nil,
          @time_created : Time? = nil,
          @type : String? = nil,
          @type_name : String? = nil,
          @type_tests_status : String? = nil,
          @type_tests_status_description : String? = nil,
          @visibility : String? = nil
        )
        end
      end


      struct DescribeTypeRegistrationInput
        include JSON::Serializable

        # The identifier for this registration request. This registration token is generated by CloudFormation
        # when you initiate a registration request using RegisterType .

        @[JSON::Field(key: "RegistrationToken")]
        getter registration_token : String

        def initialize(
          @registration_token : String
        )
        end
      end


      struct DescribeTypeRegistrationOutput
        include JSON::Serializable

        # The description of the extension registration request.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current status of the extension registration request.

        @[JSON::Field(key: "ProgressStatus")]
        getter progress_status : String?

        # The Amazon Resource Name (ARN) of the extension being registered. For registration requests with a
        # ProgressStatus of other than COMPLETE , this will be null .

        @[JSON::Field(key: "TypeArn")]
        getter type_arn : String?

        # The Amazon Resource Name (ARN) of this specific version of the extension being registered. For
        # registration requests with a ProgressStatus of other than COMPLETE , this will be null .

        @[JSON::Field(key: "TypeVersionArn")]
        getter type_version_arn : String?

        def initialize(
          @description : String? = nil,
          @progress_status : String? = nil,
          @type_arn : String? = nil,
          @type_version_arn : String? = nil
        )
        end
      end


      struct DetectStackDriftInput
        include JSON::Serializable

        # The name of the stack for which you want to detect drift.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The logical names of any resources you want to use as filters.

        @[JSON::Field(key: "LogicalResourceIds")]
        getter logical_resource_ids : Array(String)?

        def initialize(
          @stack_name : String,
          @logical_resource_ids : Array(String)? = nil
        )
        end
      end


      struct DetectStackDriftOutput
        include JSON::Serializable

        # The ID of the drift detection results of this operation. CloudFormation generates new results, with
        # a new drift detection ID, each time this operation is run. However, the number of drift results
        # CloudFormation retains for any given stack, and for how long, may vary.

        @[JSON::Field(key: "StackDriftDetectionId")]
        getter stack_drift_detection_id : String

        def initialize(
          @stack_drift_detection_id : String
        )
        end
      end


      struct DetectStackResourceDriftInput
        include JSON::Serializable

        # The logical name of the resource for which to return drift information.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String

        # The name of the stack to which the resource belongs.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        def initialize(
          @logical_resource_id : String,
          @stack_name : String
        )
        end
      end


      struct DetectStackResourceDriftOutput
        include JSON::Serializable

        # Information about whether the resource's actual configuration has drifted from its expected template
        # configuration, including actual and expected property values and any differences detected.

        @[JSON::Field(key: "StackResourceDrift")]
        getter stack_resource_drift : Types::StackResourceDrift

        def initialize(
          @stack_resource_drift : Types::StackResourceDrift
        )
        end
      end


      struct DetectStackSetDriftInput
        include JSON::Serializable

        # The name of the StackSet on which to perform the drift detection operation.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # The ID of the StackSet operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # The user-specified preferences for how CloudFormation performs a StackSet operation. For more
        # information about maximum concurrent accounts and failure tolerance, see StackSet operation options
        # .

        @[JSON::Field(key: "OperationPreferences")]
        getter operation_preferences : Types::StackSetOperationPreferences?

        def initialize(
          @stack_set_name : String,
          @call_as : String? = nil,
          @operation_id : String? = nil,
          @operation_preferences : Types::StackSetOperationPreferences? = nil
        )
        end
      end


      struct DetectStackSetDriftOutput
        include JSON::Serializable

        # The ID of the drift detection StackSet operation. You can use this operation ID with
        # DescribeStackSetOperation to monitor the progress of the drift detection operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # The input for an EstimateTemplateCost action.

      struct EstimateTemplateCostInput
        include JSON::Serializable

        # A list of Parameter structures that specify input parameters.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # Structure that contains the template body with a minimum length of 1 byte and a maximum length of
        # 51,200 bytes. Conditional: You must pass TemplateBody or TemplateURL . If both are passed, only
        # TemplateBody is used.

        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        # The URL of a file that contains the template body. The URL must point to a template that's located
        # in an Amazon S3 bucket or a Systems Manager document. The location for an Amazon S3 bucket must
        # start with https:// . URLs from S3 static websites are not supported. Conditional: You must pass
        # TemplateURL or TemplateBody . If both are passed, only TemplateBody is used.

        @[JSON::Field(key: "TemplateURL")]
        getter template_url : String?

        def initialize(
          @parameters : Array(Types::Parameter)? = nil,
          @template_body : String? = nil,
          @template_url : String? = nil
        )
        end
      end

      # The output for a EstimateTemplateCost action.

      struct EstimateTemplateCostOutput
        include JSON::Serializable

        # An Amazon Web Services Simple Monthly Calculator URL with a query string that describes the
        # resources required to run the template.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end

      # Event filter allows you to focus on specific events in an operation.

      struct EventFilter
        include JSON::Serializable

        # When set to true, only returns failed events within the operation. This helps quickly identify root
        # causes for a failed operation.

        @[JSON::Field(key: "FailedEvents")]
        getter failed_events : Bool?

        def initialize(
          @failed_events : Bool? = nil
        )
        end
      end

      # The input for the ExecuteChangeSet action.

      struct ExecuteChangeSetInput
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the change set that you want use to update the specified
        # stack.

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String

        # A unique identifier for this ExecuteChangeSet request. Specify this token if you plan to retry
        # requests so that CloudFormation knows that you're not attempting to execute a change set to update a
        # stack with the same name. You might retry ExecuteChangeSet requests to ensure that CloudFormation
        # successfully received them.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Preserves the state of previously provisioned resources when an operation fails. This parameter
        # can't be specified when the OnStackFailure parameter to the CreateChangeSet API operation was
        # specified. True - if the stack creation fails, do nothing. This is equivalent to specifying
        # DO_NOTHING for the OnStackFailure parameter to the CreateChangeSet API operation. False - if the
        # stack creation fails, roll back the stack. This is equivalent to specifying ROLLBACK for the
        # OnStackFailure parameter to the CreateChangeSet API operation. Default: True

        @[JSON::Field(key: "DisableRollback")]
        getter disable_rollback : Bool?

        # When set to true , newly created resources are deleted when the operation rolls back. This includes
        # newly created resources marked with a deletion policy of Retain . Default: false

        @[JSON::Field(key: "RetainExceptOnCreate")]
        getter retain_except_on_create : Bool?

        # If you specified the name of a change set, specify the stack name or Amazon Resource Name (ARN)
        # that's associated with the change set you want to execute.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        def initialize(
          @change_set_name : String,
          @client_request_token : String? = nil,
          @disable_rollback : Bool? = nil,
          @retain_except_on_create : Bool? = nil,
          @stack_name : String? = nil
        )
        end
      end

      # The output for the ExecuteChangeSet action.

      struct ExecuteChangeSetOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct ExecuteStackRefactorInput
        include JSON::Serializable

        # The ID associated with the stack refactor created from the CreateStackRefactor action.

        @[JSON::Field(key: "StackRefactorId")]
        getter stack_refactor_id : String

        def initialize(
          @stack_refactor_id : String
        )
        end
      end

      # The Export structure describes the exported output values for a stack. For more information, see Get
      # exported outputs from a deployed CloudFormation stack .

      struct Export
        include JSON::Serializable

        # The stack that contains the exported output name and value.

        @[JSON::Field(key: "ExportingStackId")]
        getter exporting_stack_id : String?

        # The name of exported output value. Use this name and the Fn::ImportValue function to import the
        # associated value into other stacks. The name is defined in the Export field in the associated
        # stack's Outputs section.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value of the exported output, such as a resource physical ID. This value is defined in the
        # Export field in the associated stack's Outputs section.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @exporting_stack_id : String? = nil,
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The generated template was not found.

      struct GeneratedTemplateNotFoundException
        include JSON::Serializable

        def initialize
        end
      end


      struct GetGeneratedTemplateInput
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the generated template. The format is
        # arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id} . For example,
        # arn:aws:cloudformation: us-east-1 : 123456789012 :generatedtemplate/
        # 2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc .

        @[JSON::Field(key: "GeneratedTemplateName")]
        getter generated_template_name : String

        # The language to use to retrieve for the generated template. Supported values are: JSON YAML

        @[JSON::Field(key: "Format")]
        getter format : String?

        def initialize(
          @generated_template_name : String,
          @format : String? = nil
        )
        end
      end


      struct GetGeneratedTemplateOutput
        include JSON::Serializable

        # The status of the template generation. Supported values are: CreatePending - the creation of the
        # template is pending. CreateInProgress - the creation of the template is in progress. DeletePending -
        # the deletion of the template is pending. DeleteInProgress - the deletion of the template is in
        # progress. UpdatePending - the update of the template is pending. UpdateInProgress - the update of
        # the template is in progress. Failed - the template operation failed. Complete - the template
        # operation is complete.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The template body of the generated template, in the language specified by the Language parameter.

        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        def initialize(
          @status : String? = nil,
          @template_body : String? = nil
        )
        end
      end


      struct GetHookResultInput
        include JSON::Serializable

        # The unique identifier (ID) of the Hook invocation result that you want details about. You can get
        # the ID from the ListHookResults operation.

        @[JSON::Field(key: "HookResultId")]
        getter hook_result_id : String?

        def initialize(
          @hook_result_id : String? = nil
        )
        end
      end


      struct GetHookResultOutput
        include JSON::Serializable

        # A list of objects with additional information and guidance that can help you resolve a failed Hook
        # invocation.

        @[JSON::Field(key: "Annotations")]
        getter annotations : Array(Types::Annotation)?

        # The failure mode of the invocation.

        @[JSON::Field(key: "FailureMode")]
        getter failure_mode : String?

        # The unique identifier of the Hook result.

        @[JSON::Field(key: "HookResultId")]
        getter hook_result_id : String?

        # A message that provides additional details about the Hook invocation status.

        @[JSON::Field(key: "HookStatusReason")]
        getter hook_status_reason : String?

        # The specific point in the provisioning process where the Hook is invoked.

        @[JSON::Field(key: "InvocationPoint")]
        getter invocation_point : String?

        # The timestamp when the Hook was invoked.

        @[JSON::Field(key: "InvokedAt")]
        getter invoked_at : Time?

        # The original public type name of the Hook when an alias is used. For example, if you activate
        # AWS::Hooks::GuardHook with alias MyCompany::Custom::GuardHook , then TypeName will be
        # MyCompany::Custom::GuardHook and OriginalTypeName will be AWS::Hooks::GuardHook .

        @[JSON::Field(key: "OriginalTypeName")]
        getter original_type_name : String?

        # The status of the Hook invocation. The following statuses are possible: HOOK_IN_PROGRESS : The Hook
        # is currently running. HOOK_COMPLETE_SUCCEEDED : The Hook completed successfully.
        # HOOK_COMPLETE_FAILED : The Hook completed but failed validation. HOOK_FAILED : The Hook encountered
        # an error during execution.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Information about the target of the Hook invocation.

        @[JSON::Field(key: "Target")]
        getter target : Types::HookTarget?

        # The Amazon Resource Name (ARN) of the Hook.

        @[JSON::Field(key: "TypeArn")]
        getter type_arn : String?

        # The version identifier of the Hook configuration data that was used during invocation.

        @[JSON::Field(key: "TypeConfigurationVersionId")]
        getter type_configuration_version_id : String?

        # The name of the Hook that was invoked.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # The version identifier of the Hook that was invoked.

        @[JSON::Field(key: "TypeVersionId")]
        getter type_version_id : String?

        def initialize(
          @annotations : Array(Types::Annotation)? = nil,
          @failure_mode : String? = nil,
          @hook_result_id : String? = nil,
          @hook_status_reason : String? = nil,
          @invocation_point : String? = nil,
          @invoked_at : Time? = nil,
          @original_type_name : String? = nil,
          @status : String? = nil,
          @target : Types::HookTarget? = nil,
          @type_arn : String? = nil,
          @type_configuration_version_id : String? = nil,
          @type_name : String? = nil,
          @type_version_id : String? = nil
        )
        end
      end

      # The input for the GetStackPolicy action.

      struct GetStackPolicyInput
        include JSON::Serializable

        # The name or unique stack ID that's associated with the stack whose policy you want to get.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        def initialize(
          @stack_name : String
        )
        end
      end

      # The output for the GetStackPolicy action.

      struct GetStackPolicyOutput
        include JSON::Serializable

        # Structure that contains the stack policy body. For more information, see Prevent updates to stack
        # resources in the CloudFormation User Guide .

        @[JSON::Field(key: "StackPolicyBody")]
        getter stack_policy_body : String?

        def initialize(
          @stack_policy_body : String? = nil
        )
        end
      end

      # The input for a GetTemplate action.

      struct GetTemplateInput
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of a change set for which CloudFormation returns the
        # associated template. If you specify a name, you must also specify the StackName .

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String?

        # The name or the unique stack ID that's associated with the stack, which aren't always
        # interchangeable: Running stacks: You can specify either the stack's name or its unique stack ID.
        # Deleted stacks: You must specify the unique stack ID.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        # For templates that include transforms, the stage of the template that CloudFormation returns. To get
        # the user-submitted template, specify Original . To get the template after CloudFormation has
        # processed all transforms, specify Processed . If the template doesn't include transforms, Original
        # and Processed return the same template. By default, CloudFormation specifies Processed .

        @[JSON::Field(key: "TemplateStage")]
        getter template_stage : String?

        def initialize(
          @change_set_name : String? = nil,
          @stack_name : String? = nil,
          @template_stage : String? = nil
        )
        end
      end

      # The output for GetTemplate action.

      struct GetTemplateOutput
        include JSON::Serializable

        # The stage of the template that you can retrieve. For stacks, the Original and Processed templates
        # are always available. For change sets, the Original template is always available. After
        # CloudFormation finishes creating the change set, the Processed template becomes available.

        @[JSON::Field(key: "StagesAvailable")]
        getter stages_available : Array(String)?

        # Structure that contains the template body. CloudFormation returns the same template that was used
        # when the stack was created.

        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        def initialize(
          @stages_available : Array(String)? = nil,
          @template_body : String? = nil
        )
        end
      end

      # The input for the GetTemplateSummary action.

      struct GetTemplateSummaryInput
        include JSON::Serializable

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # The name or the stack ID that's associated with the stack, which aren't always interchangeable. For
        # running stacks, you can specify either the stack's name or its unique stack ID. For deleted stack,
        # you must specify the unique stack ID. Conditional: You must specify only one of the following
        # parameters: StackName , StackSetName , TemplateBody , or TemplateURL .

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        # The name or unique ID of the StackSet from which the stack was created. Conditional: You must
        # specify only one of the following parameters: StackName , StackSetName , TemplateBody , or
        # TemplateURL .

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String?

        # Structure that contains the template body with a minimum length of 1 byte and a maximum length of
        # 51,200 bytes. Conditional: You must specify only one of the following parameters: StackName ,
        # StackSetName , TemplateBody , or TemplateURL .

        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        # Specifies options for the GetTemplateSummary API action.

        @[JSON::Field(key: "TemplateSummaryConfig")]
        getter template_summary_config : Types::TemplateSummaryConfig?

        # The URL of a file that contains the template body. The URL must point to a template (max size: 1 MB)
        # that's located in an Amazon S3 bucket or a Systems Manager document. The location for an Amazon S3
        # bucket must start with https:// . Conditional: You must specify only one of the following
        # parameters: StackName , StackSetName , TemplateBody , or TemplateURL .

        @[JSON::Field(key: "TemplateURL")]
        getter template_url : String?

        def initialize(
          @call_as : String? = nil,
          @stack_name : String? = nil,
          @stack_set_name : String? = nil,
          @template_body : String? = nil,
          @template_summary_config : Types::TemplateSummaryConfig? = nil,
          @template_url : String? = nil
        )
        end
      end

      # The output for the GetTemplateSummary action.

      struct GetTemplateSummaryOutput
        include JSON::Serializable

        # The capabilities found within the template. If your template contains IAM resources, you must
        # specify the CAPABILITY_IAM or CAPABILITY_NAMED_IAM value for this parameter when you use the
        # CreateStack or UpdateStack actions with your template; otherwise, those actions return an
        # InsufficientCapabilities error. For more information, see Acknowledging IAM resources in
        # CloudFormation templates .

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)?

        # The list of resources that generated the values in the Capabilities response element.

        @[JSON::Field(key: "CapabilitiesReason")]
        getter capabilities_reason : String?

        # A list of the transforms that are declared in the template.

        @[JSON::Field(key: "DeclaredTransforms")]
        getter declared_transforms : Array(String)?

        # The value that's defined in the Description property of the template.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The value that's defined for the Metadata property of the template.

        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # A list of parameter declarations that describe various properties for each parameter.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::ParameterDeclaration)?

        # A list of resource identifier summaries that describe the target resources of an import operation
        # and the properties you can provide during the import to identify the target resources. For example,
        # BucketName is a possible identifier property for an AWS::S3::Bucket resource.

        @[JSON::Field(key: "ResourceIdentifierSummaries")]
        getter resource_identifier_summaries : Array(Types::ResourceIdentifierSummary)?

        # A list of all the template resource types that are defined in the template, such as
        # AWS::EC2::Instance , AWS::Dynamo::Table , and Custom::MyCustomInstance .

        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # The Amazon Web Services template format version, which identifies the capabilities of the template.

        @[JSON::Field(key: "Version")]
        getter version : String?

        # An object that contains any warnings returned.

        @[JSON::Field(key: "Warnings")]
        getter warnings : Types::Warnings?

        def initialize(
          @capabilities : Array(String)? = nil,
          @capabilities_reason : String? = nil,
          @declared_transforms : Array(String)? = nil,
          @description : String? = nil,
          @metadata : String? = nil,
          @parameters : Array(Types::ParameterDeclaration)? = nil,
          @resource_identifier_summaries : Array(Types::ResourceIdentifierSummary)? = nil,
          @resource_types : Array(String)? = nil,
          @version : String? = nil,
          @warnings : Types::Warnings? = nil
        )
        end
      end

      # The specified target doesn't have any requested Hook invocations.

      struct HookResultNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # A ListHookResults call returns a summary of a Hook invocation.

      struct HookResultSummary
        include JSON::Serializable

        # The failure mode of the invocation.

        @[JSON::Field(key: "FailureMode")]
        getter failure_mode : String?

        # The Amazon Resource Name (ARN) of the target stack or request token of the Cloud Control API
        # operation. Only shown in responses when the request does not specify TargetType and TargetId
        # filters.

        @[JSON::Field(key: "HookExecutionTarget")]
        getter hook_execution_target : String?

        # The unique identifier for this Hook invocation result.

        @[JSON::Field(key: "HookResultId")]
        getter hook_result_id : String?

        # A description of the Hook results status. For example, if the Hook result is in a failed state, this
        # may contain additional information for the failed state.

        @[JSON::Field(key: "HookStatusReason")]
        getter hook_status_reason : String?

        # The specific point in the provisioning process where the Hook is invoked.

        @[JSON::Field(key: "InvocationPoint")]
        getter invocation_point : String?

        # The timestamp when the Hook was invoked. Only shown in responses when the request does not specify
        # TargetType and TargetId filters.

        @[JSON::Field(key: "InvokedAt")]
        getter invoked_at : Time?

        # The status of the Hook invocation. The following statuses are possible: HOOK_IN_PROGRESS : The Hook
        # is currently running. HOOK_COMPLETE_SUCCEEDED : The Hook completed successfully.
        # HOOK_COMPLETE_FAILED : The Hook completed but failed validation. HOOK_FAILED : The Hook encountered
        # an error during execution.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The unique identifier of the Hook invocation target.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String?

        # The target type that the Hook was invoked against.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        # The ARN of the Hook that was invoked.

        @[JSON::Field(key: "TypeArn")]
        getter type_arn : String?

        # The version of the Hook configuration.

        @[JSON::Field(key: "TypeConfigurationVersionId")]
        getter type_configuration_version_id : String?

        # The name of the Hook that was invoked.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # The version of the Hook that was invoked.

        @[JSON::Field(key: "TypeVersionId")]
        getter type_version_id : String?

        def initialize(
          @failure_mode : String? = nil,
          @hook_execution_target : String? = nil,
          @hook_result_id : String? = nil,
          @hook_status_reason : String? = nil,
          @invocation_point : String? = nil,
          @invoked_at : Time? = nil,
          @status : String? = nil,
          @target_id : String? = nil,
          @target_type : String? = nil,
          @type_arn : String? = nil,
          @type_configuration_version_id : String? = nil,
          @type_name : String? = nil,
          @type_version_id : String? = nil
        )
        end
      end

      # The HookTarget data type.

      struct HookTarget
        include JSON::Serializable

        # The action that invoked the Hook.

        @[JSON::Field(key: "Action")]
        getter action : String

        # The unique identifier of the Hook invocation target.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String

        # The target type.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String

        # The target name, for example, AWS::S3::Bucket .

        @[JSON::Field(key: "TargetTypeName")]
        getter target_type_name : String

        def initialize(
          @action : String,
          @target_id : String,
          @target_type : String,
          @target_type_name : String
        )
        end
      end


      struct ImportStacksToStackSetInput
        include JSON::Serializable

        # The name of the StackSet. The name must be unique in the Region where you create your StackSet.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # By default, SELF is specified. Use SELF for StackSets with self-managed permissions. If you are
        # signed in to the management account, specify SELF . For service managed StackSets, specify
        # DELEGATED_ADMIN .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # A unique, user defined, identifier for the StackSet operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # The user-specified preferences for how CloudFormation performs a StackSet operation. For more
        # information about maximum concurrent accounts and failure tolerance, see StackSet operation options
        # .

        @[JSON::Field(key: "OperationPreferences")]
        getter operation_preferences : Types::StackSetOperationPreferences?

        # The list of OU ID's to which the imported stacks must be mapped as deployment targets.

        @[JSON::Field(key: "OrganizationalUnitIds")]
        getter organizational_unit_ids : Array(String)?

        # The IDs of the stacks you are importing into a StackSet. You import up to 10 stacks per StackSet at
        # a time. Specify either StackIds or StackIdsUrl .

        @[JSON::Field(key: "StackIds")]
        getter stack_ids : Array(String)?

        # The Amazon S3 URL which contains list of stack ids to be inputted. Specify either StackIds or
        # StackIdsUrl .

        @[JSON::Field(key: "StackIdsUrl")]
        getter stack_ids_url : String?

        def initialize(
          @stack_set_name : String,
          @call_as : String? = nil,
          @operation_id : String? = nil,
          @operation_preferences : Types::StackSetOperationPreferences? = nil,
          @organizational_unit_ids : Array(String)? = nil,
          @stack_ids : Array(String)? = nil,
          @stack_ids_url : String? = nil
        )
        end
      end


      struct ImportStacksToStackSetOutput
        include JSON::Serializable

        # The unique identifier for the StackSet operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # The template contains resources with capabilities that weren't specified in the Capabilities
      # parameter.

      struct InsufficientCapabilitiesException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified change set can't be used to update the stack. For example, the change set status might
      # be CREATE_IN_PROGRESS , or the stack status might be UPDATE_IN_PROGRESS .

      struct InvalidChangeSetStatusException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified operation isn't valid.

      struct InvalidOperationException
        include JSON::Serializable

        def initialize
        end
      end

      # Error reserved for use by the CloudFormation CLI . CloudFormation doesn't return this error to
      # users.

      struct InvalidStateTransitionException
        include JSON::Serializable

        def initialize
        end
      end

      # The quota for the resource has already been reached. For information about resource and stack
      # limitations, see CloudFormation quotas in the CloudFormation User Guide .

      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the ListChangeSets action.

      struct ListChangeSetsInput
        include JSON::Serializable

        # The name or the Amazon Resource Name (ARN) of the stack for which you want to list change sets.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @stack_name : String,
          @next_token : String? = nil
        )
        end
      end

      # The output for the ListChangeSets action.

      struct ListChangeSetsOutput
        include JSON::Serializable

        # If the output exceeds 1 MB, a string that identifies the next page of change sets. If there is no
        # additional page, this value is null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of ChangeSetSummary structures that provides the ID and status of each change set for the
        # specified stack.

        @[JSON::Field(key: "Summaries")]
        getter summaries : Array(Types::ChangeSetSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::ChangeSetSummary)? = nil
        )
        end
      end


      struct ListExportsInput
        include JSON::Serializable

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct ListExportsOutput
        include JSON::Serializable

        # The output for the ListExports action.

        @[JSON::Field(key: "Exports")]
        getter exports : Array(Types::Export)?

        # If the output exceeds 100 exported output values, a string that identifies the next page of exports.
        # If there is no additional page, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @exports : Array(Types::Export)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGeneratedTemplatesInput
        include JSON::Serializable

        # If the number of available results exceeds this maximum, the response includes a NextToken value
        # that you can use for the NextToken parameter to get the next set of results. By default the
        # ListGeneratedTemplates API action will return at most 50 results in each response. The maximum value
        # is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGeneratedTemplatesOutput
        include JSON::Serializable

        # If the request doesn't return all the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call ListGeneratedTemplates again and use that value for the NextToken
        # parameter. If the request returns all results, NextToken is set to an empty string.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of summaries of the generated templates.

        @[JSON::Field(key: "Summaries")]
        getter summaries : Array(Types::TemplateSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::TemplateSummary)? = nil
        )
        end
      end


      struct ListHookResultsInput
        include JSON::Serializable

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters results by the status of Hook invocations. Can only be used in combination with TypeArn .
        # Valid values are: HOOK_IN_PROGRESS : The Hook is currently running. HOOK_COMPLETE_SUCCEEDED : The
        # Hook completed successfully. HOOK_COMPLETE_FAILED : The Hook completed but failed validation.
        # HOOK_FAILED : The Hook encountered an error during execution.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Filters results by the unique identifier of the target the Hook was invoked against. For change
        # sets, this is the change set ARN. When the target is a Cloud Control API operation, this value must
        # be the HookRequestToken returned by the Cloud Control API request. For more information on the
        # HookRequestToken , see ProgressEvent . Required when TargetType is specified and cannot be used
        # otherwise.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String?

        # Filters results by target type. Currently, only CHANGE_SET and CLOUD_CONTROL are supported filter
        # options. Required when TargetId is specified and cannot be used otherwise.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        # Filters results by the ARN of the Hook. Can be used alone or in combination with Status .

        @[JSON::Field(key: "TypeArn")]
        getter type_arn : String?

        def initialize(
          @next_token : String? = nil,
          @status : String? = nil,
          @target_id : String? = nil,
          @target_type : String? = nil,
          @type_arn : String? = nil
        )
        end
      end


      struct ListHookResultsOutput
        include JSON::Serializable

        # A list of HookResultSummary structures that provides the status and Hook status reason for each Hook
        # invocation for the specified target.

        @[JSON::Field(key: "HookResults")]
        getter hook_results : Array(Types::HookResultSummary)?

        # Pagination token, null or empty if no more results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The unique identifier of the Hook invocation target.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String?

        # The target type.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        def initialize(
          @hook_results : Array(Types::HookResultSummary)? = nil,
          @next_token : String? = nil,
          @target_id : String? = nil,
          @target_type : String? = nil
        )
        end
      end


      struct ListImportsInput
        include JSON::Serializable

        # The name of the exported output value. CloudFormation returns the stack names that are importing
        # this value.

        @[JSON::Field(key: "ExportName")]
        getter export_name : String

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @export_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListImportsOutput
        include JSON::Serializable

        # A list of stack names that are importing the specified exported output value.

        @[JSON::Field(key: "Imports")]
        getter imports : Array(String)?

        # A string that identifies the next page of exports. If there is no additional page, this value is
        # null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @imports : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceScanRelatedResourcesInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource scan.

        @[JSON::Field(key: "ResourceScanId")]
        getter resource_scan_id : String

        # The list of resources for which you want to get the related resources. Up to 100 resources can be
        # provided.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::ScannedResourceIdentifier)

        # If the number of available results exceeds this maximum, the response includes a NextToken value
        # that you can use for the NextToken parameter to get the next set of results. By default the
        # ListResourceScanRelatedResources API action will return up to 100 results in each response. The
        # maximum value is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_scan_id : String,
          @resources : Array(Types::ScannedResourceIdentifier),
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceScanRelatedResourcesOutput
        include JSON::Serializable

        # If the request doesn't return all the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call ListResourceScanRelatedResources again and use that value for the
        # NextToken parameter. If the request returns all results, NextToken is set to an empty string.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of up to MaxResults resources in the specified resource scan related to the specified
        # resources.

        @[JSON::Field(key: "RelatedResources")]
        getter related_resources : Array(Types::ScannedResource)?

        def initialize(
          @next_token : String? = nil,
          @related_resources : Array(Types::ScannedResource)? = nil
        )
        end
      end


      struct ListResourceScanResourcesInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource scan.

        @[JSON::Field(key: "ResourceScanId")]
        getter resource_scan_id : String

        # If the number of available results exceeds this maximum, the response includes a NextToken value
        # that you can use for the NextToken parameter to get the next set of results. By default the
        # ListResourceScanResources API action will return at most 100 results in each response. The maximum
        # value is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If specified, the returned resources will have the specified resource identifier (or one of them in
        # the case where the resource has multiple identifiers).

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        # If specified, the returned resources will be of any of the resource types with the specified prefix.

        @[JSON::Field(key: "ResourceTypePrefix")]
        getter resource_type_prefix : String?

        # If specified, the returned resources will have a matching tag key.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String?

        # If specified, the returned resources will have a matching tag value.

        @[JSON::Field(key: "TagValue")]
        getter tag_value : String?

        def initialize(
          @resource_scan_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_identifier : String? = nil,
          @resource_type_prefix : String? = nil,
          @tag_key : String? = nil,
          @tag_value : String? = nil
        )
        end
      end


      struct ListResourceScanResourcesOutput
        include JSON::Serializable

        # If the request doesn't return all the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call ListResourceScanResources again and use that value for the NextToken
        # parameter. If the request returns all results, NextToken is set to an empty string.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of up to MaxResults resources in the specified resource scan that match all of the specified
        # filters.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::ScannedResource)?

        def initialize(
          @next_token : String? = nil,
          @resources : Array(Types::ScannedResource)? = nil
        )
        end
      end


      struct ListResourceScansInput
        include JSON::Serializable

        # If the number of available results exceeds this maximum, the response includes a NextToken value
        # that you can use for the NextToken parameter to get the next set of results. The default value is
        # 10. The maximum value is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The scan type that you want to get summary information about. The default is FULL .

        @[JSON::Field(key: "ScanTypeFilter")]
        getter scan_type_filter : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @scan_type_filter : String? = nil
        )
        end
      end


      struct ListResourceScansOutput
        include JSON::Serializable

        # If the request doesn't return all the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call ListResourceScans again and use that value for the NextToken
        # parameter. If the request returns all results, NextToken is set to an empty string.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of scans returned.

        @[JSON::Field(key: "ResourceScanSummaries")]
        getter resource_scan_summaries : Array(Types::ResourceScanSummary)?

        def initialize(
          @next_token : String? = nil,
          @resource_scan_summaries : Array(Types::ResourceScanSummary)? = nil
        )
        end
      end


      struct ListStackInstanceResourceDriftsInput
        include JSON::Serializable

        # The unique ID of the drift operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        # The name of the Amazon Web Services account that you want to list resource drifts for.

        @[JSON::Field(key: "StackInstanceAccount")]
        getter stack_instance_account : String

        # The name of the Region where you want to list resource drifts.

        @[JSON::Field(key: "StackInstanceRegion")]
        getter stack_instance_region : String

        # The name or unique ID of the StackSet that you want to list drifted resources for.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The resource drift status of the stack instance. DELETED : The resource differs from its expected
        # template configuration in that the resource has been deleted. MODIFIED : One or more resource
        # properties differ from their expected template values. IN_SYNC : The resource's actual configuration
        # matches its expected template configuration. NOT_CHECKED : CloudFormation doesn't currently return
        # this value.

        @[JSON::Field(key: "StackInstanceResourceDriftStatuses")]
        getter stack_instance_resource_drift_statuses : Array(String)?

        def initialize(
          @operation_id : String,
          @stack_instance_account : String,
          @stack_instance_region : String,
          @stack_set_name : String,
          @call_as : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @stack_instance_resource_drift_statuses : Array(String)? = nil
        )
        end
      end


      struct ListStackInstanceResourceDriftsOutput
        include JSON::Serializable

        # If the previous paginated request didn't return all of the remaining results, the response object's
        # NextToken parameter value is set to a token. To retrieve the next set of results, call this action
        # again and assign that token to the request object's NextToken parameter. If there are no remaining
        # results, the previous response object's NextToken parameter is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of StackInstanceResourceDriftsSummary structures that contain information about the specified
        # stack instances.

        @[JSON::Field(key: "Summaries")]
        getter summaries : Array(Types::StackInstanceResourceDriftsSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::StackInstanceResourceDriftsSummary)? = nil
        )
        end
      end


      struct ListStackInstancesInput
        include JSON::Serializable

        # The name or unique ID of the StackSet that you want to list stack instances for.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # The filter to apply to stack instances

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::StackInstanceFilter)?

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the Amazon Web Services account that you want to list stack instances for.

        @[JSON::Field(key: "StackInstanceAccount")]
        getter stack_instance_account : String?

        # The name of the Region where you want to list stack instances.

        @[JSON::Field(key: "StackInstanceRegion")]
        getter stack_instance_region : String?

        def initialize(
          @stack_set_name : String,
          @call_as : String? = nil,
          @filters : Array(Types::StackInstanceFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @stack_instance_account : String? = nil,
          @stack_instance_region : String? = nil
        )
        end
      end


      struct ListStackInstancesOutput
        include JSON::Serializable

        # If the request doesn't return all the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call ListStackInstances again and assign that token to the request object's
        # NextToken parameter. If the request returns all results, NextToken is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of StackInstanceSummary structures that contain information about the specified stack
        # instances.

        @[JSON::Field(key: "Summaries")]
        getter summaries : Array(Types::StackInstanceSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::StackInstanceSummary)? = nil
        )
        end
      end


      struct ListStackRefactorActionsInput
        include JSON::Serializable

        # The ID associated with the stack refactor created from the CreateStackRefactor action.

        @[JSON::Field(key: "StackRefactorId")]
        getter stack_refactor_id : String

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @stack_refactor_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStackRefactorActionsOutput
        include JSON::Serializable

        # The stack refactor actions.

        @[JSON::Field(key: "StackRefactorActions")]
        getter stack_refactor_actions : Array(Types::StackRefactorAction)

        # If the request doesn't return all the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call this action again and assign that token to the request object's
        # NextToken parameter. If the request returns all results, NextToken is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @stack_refactor_actions : Array(Types::StackRefactorAction),
          @next_token : String? = nil
        )
        end
      end


      struct ListStackRefactorsInput
        include JSON::Serializable

        # Execution status to use as a filter. Specify one or more execution status codes to list only stack
        # refactors with the specified execution status codes.

        @[JSON::Field(key: "ExecutionStatusFilter")]
        getter execution_status_filter : Array(String)?

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @execution_status_filter : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStackRefactorsOutput
        include JSON::Serializable

        # Provides a summary of a stack refactor, including the following: StackRefactorId Status StatusReason
        # ExecutionStatus ExecutionStatusReason Description

        @[JSON::Field(key: "StackRefactorSummaries")]
        getter stack_refactor_summaries : Array(Types::StackRefactorSummary)

        # If the request doesn't return all the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call this action again and assign that token to the request object's
        # NextToken parameter. If the request returns all results, NextToken is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @stack_refactor_summaries : Array(Types::StackRefactorSummary),
          @next_token : String? = nil
        )
        end
      end

      # The input for the ListStackResource action.

      struct ListStackResourcesInput
        include JSON::Serializable

        # The name or the unique stack ID that is associated with the stack, which aren't always
        # interchangeable: Running stacks: You can specify either the stack's name or its unique stack ID.
        # Deleted stacks: You must specify the unique stack ID.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @stack_name : String,
          @next_token : String? = nil
        )
        end
      end

      # The output for a ListStackResources action.

      struct ListStackResourcesOutput
        include JSON::Serializable

        # If the output exceeds 1 MB, a string that identifies the next page of stack resources. If no
        # additional page exists, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of StackResourceSummary structures.

        @[JSON::Field(key: "StackResourceSummaries")]
        getter stack_resource_summaries : Array(Types::StackResourceSummary)?

        def initialize(
          @next_token : String? = nil,
          @stack_resource_summaries : Array(Types::StackResourceSummary)? = nil
        )
        end
      end


      struct ListStackSetAutoDeploymentTargetsInput
        include JSON::Serializable

        # The name or unique ID of the StackSet that you want to get automatic deployment targets for.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # Specifies whether you are acting as an account administrator in the organization's management
        # account or as a delegated administrator in a member account. By default, SELF is specified. Use SELF
        # for StackSets with self-managed permissions. If you are signed in to the management account, specify
        # SELF . If you are signed in to a delegated administrator account, specify DELEGATED_ADMIN . Your
        # Amazon Web Services account must be registered as a delegated administrator in the management
        # account. For more information, see Register a delegated administrator in the CloudFormation User
        # Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @stack_set_name : String,
          @call_as : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStackSetAutoDeploymentTargetsOutput
        include JSON::Serializable

        # If the request doesn't return all the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call ListStackSetAutoDeploymentTargets again and use that value for the
        # NextToken parameter. If the request returns all results, NextToken is set to an empty string.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of summaries of the deployment targets for the StackSet.

        @[JSON::Field(key: "Summaries")]
        getter summaries : Array(Types::StackSetAutoDeploymentTargetSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::StackSetAutoDeploymentTargetSummary)? = nil
        )
        end
      end


      struct ListStackSetOperationResultsInput
        include JSON::Serializable

        # The ID of the StackSet operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        # The name or unique ID of the StackSet that you want to get operation results for.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # The filter to apply to operation results.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::OperationResultFilter)?

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @operation_id : String,
          @stack_set_name : String,
          @call_as : String? = nil,
          @filters : Array(Types::OperationResultFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStackSetOperationResultsOutput
        include JSON::Serializable

        # If the request doesn't return all results, NextToken is set to a token. To retrieve the next set of
        # results, call ListOperationResults again and assign that token to the request object's NextToken
        # parameter. If there are no remaining results, NextToken is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of StackSetOperationResultSummary structures that contain information about the specified
        # operation results, for accounts and Amazon Web Services Regions that are included in the operation.

        @[JSON::Field(key: "Summaries")]
        getter summaries : Array(Types::StackSetOperationResultSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::StackSetOperationResultSummary)? = nil
        )
        end
      end


      struct ListStackSetOperationsInput
        include JSON::Serializable

        # The name or unique ID of the StackSet that you want to get operation summaries for.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @stack_set_name : String,
          @call_as : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStackSetOperationsOutput
        include JSON::Serializable

        # If the request doesn't return all results, NextToken is set to a token. To retrieve the next set of
        # results, call ListOperationResults again and assign that token to the request object's NextToken
        # parameter. If there are no remaining results, NextToken is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of StackSetOperationSummary structures that contain summary information about operations for
        # the specified StackSet.

        @[JSON::Field(key: "Summaries")]
        getter summaries : Array(Types::StackSetOperationSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::StackSetOperationSummary)? = nil
        )
        end
      end


      struct ListStackSetsInput
        include JSON::Serializable

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # management account or as a delegated administrator in a member account. By default, SELF is
        # specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The status of the StackSets that you want to get summary information about.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @call_as : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListStackSetsOutput
        include JSON::Serializable

        # If the request doesn't return all of the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call ListStackInstances again and assign that token to the request object's
        # NextToken parameter. If the request returns all results, NextToken is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of StackSetSummary structures that contain information about the user's StackSets.

        @[JSON::Field(key: "Summaries")]
        getter summaries : Array(Types::StackSetSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::StackSetSummary)? = nil
        )
        end
      end

      # The input for ListStacks action.

      struct ListStacksInput
        include JSON::Serializable

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Stack status to use as a filter. Specify one or more stack status codes to list only stacks with the
        # specified status codes. For a complete list of stack status codes, see the StackStatus parameter of
        # the Stack data type.

        @[JSON::Field(key: "StackStatusFilter")]
        getter stack_status_filter : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @stack_status_filter : Array(String)? = nil
        )
        end
      end

      # The output for ListStacks action.

      struct ListStacksOutput
        include JSON::Serializable

        # If the output exceeds 1 MB in size, a string that identifies the next page of stacks. If no
        # additional page exists, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of StackSummary structures that contains information about the specified stacks.

        @[JSON::Field(key: "StackSummaries")]
        getter stack_summaries : Array(Types::StackSummary)?

        def initialize(
          @next_token : String? = nil,
          @stack_summaries : Array(Types::StackSummary)? = nil
        )
        end
      end


      struct ListTypeRegistrationsInput
        include JSON::Serializable

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The current status of the extension registration request. The default is IN_PROGRESS .

        @[JSON::Field(key: "RegistrationStatusFilter")]
        getter registration_status_filter : String?

        # The kind of extension. Conditional: You must specify either TypeName and Type , or Arn .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The Amazon Resource Name (ARN) of the extension. Conditional: You must specify either TypeName and
        # Type , or Arn .

        @[JSON::Field(key: "TypeArn")]
        getter type_arn : String?

        # The name of the extension. Conditional: You must specify either TypeName and Type , or Arn .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registration_status_filter : String? = nil,
          @type : String? = nil,
          @type_arn : String? = nil,
          @type_name : String? = nil
        )
        end
      end


      struct ListTypeRegistrationsOutput
        include JSON::Serializable

        # If the request doesn't return all the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call this action again and assign that token to the request object's
        # NextToken parameter. If the request returns all results, NextToken is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of extension registration tokens. Use DescribeTypeRegistration to return detailed information
        # about a type registration request.

        @[JSON::Field(key: "RegistrationTokenList")]
        getter registration_token_list : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @registration_token_list : Array(String)? = nil
        )
        end
      end


      struct ListTypeVersionsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the extension for which you want version summary information.
        # Conditional: You must specify either TypeName and Type , or Arn .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The deprecation status of the extension versions that you want to get summary information about.
        # Valid values include: LIVE : The extension version is registered and can be used in CloudFormation
        # operations, dependent on its provisioning behavior and visibility scope. DEPRECATED : The extension
        # version has been deregistered and can no longer be used in CloudFormation operations. The default is
        # LIVE .

        @[JSON::Field(key: "DeprecatedStatus")]
        getter deprecated_status : String?

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The publisher ID of the extension publisher. Extensions published by Amazon aren't assigned a
        # publisher ID.

        @[JSON::Field(key: "PublisherId")]
        getter publisher_id : String?

        # The kind of the extension. Conditional: You must specify either TypeName and Type , or Arn .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The name of the extension for which you want version summary information. Conditional: You must
        # specify either TypeName and Type , or Arn .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @arn : String? = nil,
          @deprecated_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @publisher_id : String? = nil,
          @type : String? = nil,
          @type_name : String? = nil
        )
        end
      end


      struct ListTypeVersionsOutput
        include JSON::Serializable

        # If the request doesn't return all of the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call this action again and assign that token to the request object's
        # NextToken parameter. If the request returns all results, NextToken is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of TypeVersionSummary structures that contain information about the specified extension's
        # versions.

        @[JSON::Field(key: "TypeVersionSummaries")]
        getter type_version_summaries : Array(Types::TypeVersionSummary)?

        def initialize(
          @next_token : String? = nil,
          @type_version_summaries : Array(Types::TypeVersionSummary)? = nil
        )
        end
      end


      struct ListTypesInput
        include JSON::Serializable

        # The deprecation status of the extension that you want to get summary information about. Valid values
        # include: LIVE : The extension is registered for use in CloudFormation operations. DEPRECATED : The
        # extension has been deregistered and can no longer be used in CloudFormation operations.

        @[JSON::Field(key: "DeprecatedStatus")]
        getter deprecated_status : String?

        # Filter criteria to use in determining which extensions to return. Filters must be compatible with
        # Visibility to return valid results. For example, specifying AWS_TYPES for Category and PRIVATE for
        # Visibility returns an empty list of types, but specifying PUBLIC for Visibility returns the desired
        # list.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::TypeFilters?

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # For resource types, the provisioning behavior of the resource type. CloudFormation determines the
        # provisioning type during registration, based on the types of handlers in the schema handler package
        # submitted. Valid values include: FULLY_MUTABLE : The resource type includes an update handler to
        # process updates to the type during stack update operations. IMMUTABLE : The resource type doesn't
        # include an update handler, so the type can't be updated and must instead be replaced during stack
        # update operations. NON_PROVISIONABLE : The resource type doesn't include create, read, and delete
        # handlers, and therefore can't actually be provisioned. The default is FULLY_MUTABLE .

        @[JSON::Field(key: "ProvisioningType")]
        getter provisioning_type : String?

        # The type of extension.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The scope at which the extensions are visible and usable in CloudFormation operations. Valid values
        # include: PRIVATE : Extensions that are visible and usable within this account and Region. This
        # includes: Private extensions you have registered in this account and Region. Public extensions that
        # you have activated in this account and Region. PUBLIC : Extensions that are publicly visible and
        # available to be activated within any Amazon Web Services account. This includes extensions from
        # Amazon Web Services and third-party publishers. The default is PRIVATE .

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @deprecated_status : String? = nil,
          @filters : Types::TypeFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @provisioning_type : String? = nil,
          @type : String? = nil,
          @visibility : String? = nil
        )
        end
      end


      struct ListTypesOutput
        include JSON::Serializable

        # If the request doesn't return all the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call this action again and assign that token to the request object's
        # NextToken parameter. If the request returns all results, NextToken is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of TypeSummary structures that contain information about the specified extensions.

        @[JSON::Field(key: "TypeSummaries")]
        getter type_summaries : Array(Types::TypeSummary)?

        def initialize(
          @next_token : String? = nil,
          @type_summaries : Array(Types::TypeSummary)? = nil
        )
        end
      end

      # Contains drift information for a resource property, including actual value, previous deployment
      # value, and drift detection timestamp.

      struct LiveResourceDrift
        include JSON::Serializable

        # The current live configuration value of the resource property.

        @[JSON::Field(key: "ActualValue")]
        getter actual_value : String?

        # The timestamp when drift was detected for this resource property.

        @[JSON::Field(key: "DriftDetectionTimestamp")]
        getter drift_detection_timestamp : Time?

        # The configuration value from the previous CloudFormation deployment.

        @[JSON::Field(key: "PreviousValue")]
        getter previous_value : String?

        def initialize(
          @actual_value : String? = nil,
          @drift_detection_timestamp : Time? = nil,
          @previous_value : String? = nil
        )
        end
      end

      # Contains logging configuration information for an extension.

      struct LoggingConfig
        include JSON::Serializable

        # The Amazon CloudWatch Logs group to which CloudFormation sends error logging information when
        # invoking the extension's handlers.

        @[JSON::Field(key: "LogGroupName")]
        getter log_group_name : String

        # The Amazon Resource Name (ARN) of the role that CloudFormation should assume when sending log
        # entries to CloudWatch Logs.

        @[JSON::Field(key: "LogRoleArn")]
        getter log_role_arn : String

        def initialize(
          @log_group_name : String,
          @log_role_arn : String
        )
        end
      end

      # Describes whether StackSets performs non-conflicting operations concurrently and queues conflicting
      # operations.

      struct ManagedExecution
        include JSON::Serializable

        # When true , CloudFormation performs non-conflicting operations concurrently and queues conflicting
        # operations. After conflicting operations finish, CloudFormation starts queued operations in request
        # order. If there are already running or queued operations, CloudFormation queues all incoming
        # operations even if they are non-conflicting. You can't modify your StackSet's execution
        # configuration while there are running or queued operations for that StackSet. When false (default),
        # StackSets performs one operation at a time in request order.

        @[JSON::Field(key: "Active")]
        getter active : Bool?

        def initialize(
          @active : Bool? = nil
        )
        end
      end

      # Contains information about the module from which the resource was created, if the resource was
      # created from a module included in the stack template. For more information about modules, see Create
      # reusable resource configurations that can be included across templates with CloudFormation modules
      # in the CloudFormation User Guide .

      struct ModuleInfo
        include JSON::Serializable

        # A concatenated list of the logical IDs of the module or modules that contains the resource. Modules
        # are listed starting with the inner-most nested module, and separated by / . In the following
        # example, the resource was created from a module, moduleA , that's nested inside a parent module,
        # moduleB . moduleA/moduleB For more information, see Reference module resources in CloudFormation
        # templates in the CloudFormation User Guide .

        @[JSON::Field(key: "LogicalIdHierarchy")]
        getter logical_id_hierarchy : String?

        # A concatenated list of the module type or types that contains the resource. Module types are listed
        # starting with the inner-most nested module, and separated by / . In the following example, the
        # resource was created from a module of type AWS::First::Example::MODULE , that's nested inside a
        # parent module of type AWS::Second::Example::MODULE .
        # AWS::First::Example::MODULE/AWS::Second::Example::MODULE

        @[JSON::Field(key: "TypeHierarchy")]
        getter type_hierarchy : String?

        def initialize(
          @logical_id_hierarchy : String? = nil,
          @type_hierarchy : String? = nil
        )
        end
      end

      # The specified name is already in use.

      struct NameAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about a CloudFormation operation.

      struct OperationEntry
        include JSON::Serializable

        # The unique identifier for the operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # The type of operation.

        @[JSON::Field(key: "OperationType")]
        getter operation_type : String?

        def initialize(
          @operation_id : String? = nil,
          @operation_type : String? = nil
        )
        end
      end

      # Contains detailed information about an event that occurred during a CloudFormation operation.

      struct OperationEvent
        include JSON::Serializable

        # A unique identifier for the request that initiated this operation.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Additional status information about the operation.

        @[JSON::Field(key: "DetailedStatus")]
        getter detailed_status : String?

        # The time when the event ended.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # A unique identifier for this event.

        @[JSON::Field(key: "EventId")]
        getter event_id : String?

        # The type of event.

        @[JSON::Field(key: "EventType")]
        getter event_type : String?

        # Specifies how Hook failures are handled.

        @[JSON::Field(key: "HookFailureMode")]
        getter hook_failure_mode : String?

        # The point in the operation lifecycle when the Hook was invoked.

        @[JSON::Field(key: "HookInvocationPoint")]
        getter hook_invocation_point : String?

        # The status of the Hook invocation.

        @[JSON::Field(key: "HookStatus")]
        getter hook_status : String?

        # Additional information about the Hook status.

        @[JSON::Field(key: "HookStatusReason")]
        getter hook_status_reason : String?

        # The type name of the Hook that was invoked.

        @[JSON::Field(key: "HookType")]
        getter hook_type : String?

        # The logical name of the resource as specified in the template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String?

        # The unique identifier of the operation this event belongs to.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # The current status of the operation.

        @[JSON::Field(key: "OperationStatus")]
        getter operation_status : String?

        # The type of operation.

        @[JSON::Field(key: "OperationType")]
        getter operation_type : String?

        # The name or unique identifier that corresponds to a physical instance ID of a resource.

        @[JSON::Field(key: "PhysicalResourceId")]
        getter physical_resource_id : String?

        # The properties used to create the resource.

        @[JSON::Field(key: "ResourceProperties")]
        getter resource_properties : String?

        # Current status of the resource.

        @[JSON::Field(key: "ResourceStatus")]
        getter resource_status : String?

        # Success or failure message associated with the resource.

        @[JSON::Field(key: "ResourceStatusReason")]
        getter resource_status_reason : String?

        # Type of resource.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The unique ID name of the instance of the stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        # The time when the event started.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # Time the status was updated.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        # Specifies how validation failures are handled.

        @[JSON::Field(key: "ValidationFailureMode")]
        getter validation_failure_mode : String?

        # The name of the validation that was performed.

        @[JSON::Field(key: "ValidationName")]
        getter validation_name : String?

        # The path within the resource where the validation was applied.

        @[JSON::Field(key: "ValidationPath")]
        getter validation_path : String?

        # The status of the validation.

        @[JSON::Field(key: "ValidationStatus")]
        getter validation_status : String?

        # Additional information about the validation status.

        @[JSON::Field(key: "ValidationStatusReason")]
        getter validation_status_reason : String?

        def initialize(
          @client_request_token : String? = nil,
          @detailed_status : String? = nil,
          @end_time : Time? = nil,
          @event_id : String? = nil,
          @event_type : String? = nil,
          @hook_failure_mode : String? = nil,
          @hook_invocation_point : String? = nil,
          @hook_status : String? = nil,
          @hook_status_reason : String? = nil,
          @hook_type : String? = nil,
          @logical_resource_id : String? = nil,
          @operation_id : String? = nil,
          @operation_status : String? = nil,
          @operation_type : String? = nil,
          @physical_resource_id : String? = nil,
          @resource_properties : String? = nil,
          @resource_status : String? = nil,
          @resource_status_reason : String? = nil,
          @resource_type : String? = nil,
          @stack_id : String? = nil,
          @start_time : Time? = nil,
          @timestamp : Time? = nil,
          @validation_failure_mode : String? = nil,
          @validation_name : String? = nil,
          @validation_path : String? = nil,
          @validation_status : String? = nil,
          @validation_status_reason : String? = nil
        )
        end
      end

      # The specified operation ID already exists.

      struct OperationIdAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # Another operation is currently in progress for this StackSet. Only one operation can be performed
      # for a stack set at a given time.

      struct OperationInProgressException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified ID refers to an operation that doesn't exist.

      struct OperationNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The status that operation results are filtered by.

      struct OperationResultFilter
        include JSON::Serializable

        # The type of filter to apply.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value to filter by.

        @[JSON::Field(key: "Values")]
        getter values : String?

        def initialize(
          @name : String? = nil,
          @values : String? = nil
        )
        end
      end

      # Error reserved for use by the CloudFormation CLI . CloudFormation doesn't return this error to
      # users.

      struct OperationStatusCheckFailedException
        include JSON::Serializable

        def initialize
        end
      end

      # The Output data type.

      struct Output
        include JSON::Serializable

        # User defined description associated with the output.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the export associated with the output.

        @[JSON::Field(key: "ExportName")]
        getter export_name : String?

        # The key associated with the output.

        @[JSON::Field(key: "OutputKey")]
        getter output_key : String?

        # The value associated with the output.

        @[JSON::Field(key: "OutputValue")]
        getter output_value : String?

        def initialize(
          @description : String? = nil,
          @export_name : String? = nil,
          @output_key : String? = nil,
          @output_value : String? = nil
        )
        end
      end

      # The Parameter data type.

      struct Parameter
        include JSON::Serializable

        # The key associated with the parameter. If you don't specify a key and value for a particular
        # parameter, CloudFormation uses the default value that's specified in your template.

        @[JSON::Field(key: "ParameterKey")]
        getter parameter_key : String?

        # The input value associated with the parameter.

        @[JSON::Field(key: "ParameterValue")]
        getter parameter_value : String?

        # Read-only. The value that corresponds to a Systems Manager parameter key. This field is returned
        # only for Systems Manager parameter types in the template. For more information, see Specify existing
        # resources at runtime with CloudFormation-supplied parameter types in the CloudFormation User Guide .

        @[JSON::Field(key: "ResolvedValue")]
        getter resolved_value : String?

        # During a stack update, use the existing parameter value that the stack is using for a given
        # parameter key. If you specify true , do not specify a parameter value.

        @[JSON::Field(key: "UsePreviousValue")]
        getter use_previous_value : Bool?

        def initialize(
          @parameter_key : String? = nil,
          @parameter_value : String? = nil,
          @resolved_value : String? = nil,
          @use_previous_value : Bool? = nil
        )
        end
      end

      # A set of criteria that CloudFormation uses to validate parameter values. Although other constraints
      # might be defined in the stack template, CloudFormation returns only the AllowedValues property.

      struct ParameterConstraints
        include JSON::Serializable

        # A list of values that are permitted for a parameter.

        @[JSON::Field(key: "AllowedValues")]
        getter allowed_values : Array(String)?

        def initialize(
          @allowed_values : Array(String)? = nil
        )
        end
      end

      # The ParameterDeclaration data type.

      struct ParameterDeclaration
        include JSON::Serializable

        # The default value of the parameter.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # The description that's associate with the parameter.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Flag that indicates whether the parameter value is shown as plain text in logs and in the Amazon Web
        # Services Management Console.

        @[JSON::Field(key: "NoEcho")]
        getter no_echo : Bool?

        # The criteria that CloudFormation uses to validate parameter values.

        @[JSON::Field(key: "ParameterConstraints")]
        getter parameter_constraints : Types::ParameterConstraints?

        # The name that's associated with the parameter.

        @[JSON::Field(key: "ParameterKey")]
        getter parameter_key : String?

        # The type of parameter.

        @[JSON::Field(key: "ParameterType")]
        getter parameter_type : String?

        def initialize(
          @default_value : String? = nil,
          @description : String? = nil,
          @no_echo : Bool? = nil,
          @parameter_constraints : Types::ParameterConstraints? = nil,
          @parameter_key : String? = nil,
          @parameter_type : String? = nil
        )
        end
      end

      # Context information that enables CloudFormation to uniquely identify a resource. CloudFormation uses
      # context key-value pairs in cases where a resource's logical and physical IDs aren't enough to
      # uniquely identify that resource. Each context key-value pair specifies a resource that contains the
      # targeted resource.

      struct PhysicalResourceIdContextKeyValuePair
        include JSON::Serializable

        # The resource context key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The resource context value.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Information about a resource property whose actual value differs from its expected value, as defined
      # in the stack template and any values specified as template parameters. These will be present only
      # for resources whose StackResourceDriftStatus is MODIFIED . For more information, see Detect
      # unmanaged configuration changes to stacks and resources with drift detection .

      struct PropertyDifference
        include JSON::Serializable

        # The actual property value of the resource property.

        @[JSON::Field(key: "ActualValue")]
        getter actual_value : String

        # The type of property difference. ADD : A value has been added to a resource property that's an array
        # or list data type. REMOVE : The property has been removed from the current resource configuration.
        # NOT_EQUAL : The current property value differs from its expected value (as defined in the stack
        # template and any values specified as template parameters).

        @[JSON::Field(key: "DifferenceType")]
        getter difference_type : String

        # The expected property value of the resource property, as defined in the stack template and any
        # values specified as template parameters.

        @[JSON::Field(key: "ExpectedValue")]
        getter expected_value : String

        # The fully-qualified path to the resource property.

        @[JSON::Field(key: "PropertyPath")]
        getter property_path : String

        def initialize(
          @actual_value : String,
          @difference_type : String,
          @expected_value : String,
          @property_path : String
        )
        end
      end


      struct PublishTypeInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the extension. Conditional: You must specify Arn , or TypeName and
        # Type .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The version number to assign to this version of the extension. Use the following format, and adhere
        # to semantic versioning when assigning a version number to your extension: MAJOR.MINOR.PATCH For more
        # information, see Semantic Versioning 2.0.0 . If you don't specify a version number, CloudFormation
        # increments the version number by one minor version release. You cannot specify a version number the
        # first time you publish a type. CloudFormation automatically sets the first version number to be
        # 1.0.0 .

        @[JSON::Field(key: "PublicVersionNumber")]
        getter public_version_number : String?

        # The type of the extension. Conditional: You must specify Arn , or TypeName and Type .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The name of the extension. Conditional: You must specify Arn , or TypeName and Type .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @arn : String? = nil,
          @public_version_number : String? = nil,
          @type : String? = nil,
          @type_name : String? = nil
        )
        end
      end


      struct PublishTypeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) assigned to the public extension upon publication.

        @[JSON::Field(key: "PublicTypeArn")]
        getter public_type_arn : String?

        def initialize(
          @public_type_arn : String? = nil
        )
        end
      end


      struct RecordHandlerProgressInput
        include JSON::Serializable

        # Reserved for use by the CloudFormation CLI .

        @[JSON::Field(key: "BearerToken")]
        getter bearer_token : String

        # Reserved for use by the CloudFormation CLI .

        @[JSON::Field(key: "OperationStatus")]
        getter operation_status : String

        # Reserved for use by the CloudFormation CLI .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Reserved for use by the CloudFormation CLI .

        @[JSON::Field(key: "CurrentOperationStatus")]
        getter current_operation_status : String?

        # Reserved for use by the CloudFormation CLI .

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # Reserved for use by the CloudFormation CLI .

        @[JSON::Field(key: "ResourceModel")]
        getter resource_model : String?

        # Reserved for use by the CloudFormation CLI .

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @bearer_token : String,
          @operation_status : String,
          @client_request_token : String? = nil,
          @current_operation_status : String? = nil,
          @error_code : String? = nil,
          @resource_model : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct RecordHandlerProgressOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct RegisterPublisherInput
        include JSON::Serializable

        # Whether you accept the Terms and Conditions for publishing extensions in the CloudFormation
        # registry. You must accept the terms and conditions in order to register to publish public extensions
        # to the CloudFormation registry. The default is false .

        @[JSON::Field(key: "AcceptTermsAndConditions")]
        getter accept_terms_and_conditions : Bool?

        # If you are using a Bitbucket or GitHub account for identity verification, the Amazon Resource Name
        # (ARN) for your connection to that account. For more information, see Prerequisite: Registering your
        # account to publish CloudFormation extensions in the CloudFormation Command Line Interface (CLI) User
        # Guide .

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        def initialize(
          @accept_terms_and_conditions : Bool? = nil,
          @connection_arn : String? = nil
        )
        end
      end


      struct RegisterPublisherOutput
        include JSON::Serializable

        # The ID assigned this account by CloudFormation for publishing extensions.

        @[JSON::Field(key: "PublisherId")]
        getter publisher_id : String?

        def initialize(
          @publisher_id : String? = nil
        )
        end
      end


      struct RegisterTypeInput
        include JSON::Serializable

        # A URL to the S3 bucket that contains the extension project package that contains the necessary files
        # for the extension you want to register. For information about generating a schema handler package
        # for the extension you want to register, see submit in the CloudFormation Command Line Interface
        # (CLI) User Guide . The user registering the extension must be able to access the package in the S3
        # bucket. That's, the user needs to have GetObject permissions for the schema handler package. For
        # more information, see Actions, Resources, and Condition Keys for Amazon S3 in the Identity and
        # Access Management User Guide .

        @[JSON::Field(key: "SchemaHandlerPackage")]
        getter schema_handler_package : String

        # The name of the extension being registered. We suggest that extension names adhere to the following
        # patterns: For resource types, company_or_organization::service::type . For modules,
        # company_or_organization::service::type::MODULE . For Hooks, MyCompany::Testing::MyTestHook . The
        # following organization namespaces are reserved and can't be used in your extension names: Alexa AMZN
        # Amazon AWS Custom Dev

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        # A unique identifier that acts as an idempotency key for this registration request. Specifying a
        # client request token prevents CloudFormation from generating more than one version of an extension
        # from the same registration request, even if the request is submitted multiple times.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The Amazon Resource Name (ARN) of the IAM role for CloudFormation to assume when invoking the
        # extension. For CloudFormation to assume the specified execution role, the role must contain a trust
        # relationship with the CloudFormation service principal ( resources.cloudformation.amazonaws.com ).
        # For more information about adding trust relationships, see Modifying a role trust policy in the
        # Identity and Access Management User Guide . If your extension calls Amazon Web Services APIs in any
        # of its handlers, you must create an IAM execution role that includes the necessary permissions to
        # call those Amazon Web Services APIs, and provision that execution role in your account. When
        # CloudFormation needs to invoke the resource type handler, CloudFormation assumes this execution role
        # to create a temporary session token, which it then passes to the resource type handler, thereby
        # supplying your resource type with the appropriate credentials.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # Specifies logging configuration information for an extension.

        @[JSON::Field(key: "LoggingConfig")]
        getter logging_config : Types::LoggingConfig?

        # The kind of extension.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @schema_handler_package : String,
          @type_name : String,
          @client_request_token : String? = nil,
          @execution_role_arn : String? = nil,
          @logging_config : Types::LoggingConfig? = nil,
          @type : String? = nil
        )
        end
      end


      struct RegisterTypeOutput
        include JSON::Serializable

        # The identifier for this registration request. Use this registration token when calling
        # DescribeTypeRegistration , which returns information about the status and IDs of the extension
        # registration.

        @[JSON::Field(key: "RegistrationToken")]
        getter registration_token : String?

        def initialize(
          @registration_token : String? = nil
        )
        end
      end

      # For extensions that are modules, a public third-party extension that must be activated in your
      # account in order for the module itself to be activated. For more information, see Requirements for
      # activating third-party public modules in the CloudFormation User Guide .

      struct RequiredActivatedType
        include JSON::Serializable

        # The type name of the public extension. If you specified a TypeNameAlias when enabling the extension
        # in this account and Region, CloudFormation treats that alias as the extension's type name within the
        # account and Region, not the type name of the public extension. For more information, see Use aliases
        # to refer to extensions in the CloudFormation User Guide .

        @[JSON::Field(key: "OriginalTypeName")]
        getter original_type_name : String?

        # The publisher ID of the extension publisher.

        @[JSON::Field(key: "PublisherId")]
        getter publisher_id : String?

        # A list of the major versions of the extension type that the macro supports.

        @[JSON::Field(key: "SupportedMajorVersions")]
        getter supported_major_versions : Array(Int32)?

        # An alias assigned to the public extension, in this account and Region. If you specify an alias for
        # the extension, CloudFormation treats the alias as the extension type name within this account and
        # Region. You must use the alias to refer to the extension in your templates, API calls, and
        # CloudFormation console.

        @[JSON::Field(key: "TypeNameAlias")]
        getter type_name_alias : String?

        def initialize(
          @original_type_name : String? = nil,
          @publisher_id : String? = nil,
          @supported_major_versions : Array(Int32)? = nil,
          @type_name_alias : String? = nil
        )
        end
      end

      # The ResourceChange structure describes the resource and the action that CloudFormation will perform
      # on it if you execute this change set.

      struct ResourceChange
        include JSON::Serializable

        # The action that CloudFormation takes on the resource, such as Add (adds a new resource), Modify
        # (changes a resource), Remove (deletes a resource), Import (imports a resource), Dynamic (exact
        # action for the resource can't be determined), or SyncWithActual (resource will not be changed, only
        # CloudFormation metadata will change).

        @[JSON::Field(key: "Action")]
        getter action : String?

        # An encoded JSON string that contains the context of the resource after the change is executed.

        @[JSON::Field(key: "AfterContext")]
        getter after_context : String?

        # An encoded JSON string that contains the context of the resource before the change is executed.

        @[JSON::Field(key: "BeforeContext")]
        getter before_context : String?

        # The change set ID of the nested change set.

        @[JSON::Field(key: "ChangeSetId")]
        getter change_set_id : String?

        # For the Modify action, a list of ResourceChangeDetail structures that describes the changes that
        # CloudFormation will make to the resource.

        @[JSON::Field(key: "Details")]
        getter details : Array(Types::ResourceChangeDetail)?

        # The resource's logical ID, which is defined in the stack's template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String?

        # Contains information about the module from which the resource was created, if the resource was
        # created from a module included in the stack template.

        @[JSON::Field(key: "ModuleInfo")]
        getter module_info : Types::ModuleInfo?

        # The resource's physical ID (resource name). Resources that you are adding don't have physical IDs
        # because they haven't been created.

        @[JSON::Field(key: "PhysicalResourceId")]
        getter physical_resource_id : String?

        # The action that will be taken on the physical resource when the change set is executed. Delete The
        # resource will be deleted. Retain The resource will be retained. Snapshot The resource will have a
        # snapshot taken. ReplaceAndDelete The resource will be replaced and then deleted. ReplaceAndRetain
        # The resource will be replaced and then retained. ReplaceAndSnapshot The resource will be replaced
        # and then have a snapshot taken.

        @[JSON::Field(key: "PolicyAction")]
        getter policy_action : String?

        # Information about the resource's state from the previous CloudFormation deployment.

        @[JSON::Field(key: "PreviousDeploymentContext")]
        getter previous_deployment_context : String?

        # For the Modify action, indicates whether CloudFormation will replace the resource by creating a new
        # one and deleting the old one. This value depends on the value of the RequiresRecreation property in
        # the ResourceTargetDefinition structure. For example, if the RequiresRecreation field is Always and
        # the Evaluation field is Static , Replacement is True . If the RequiresRecreation field is Always and
        # the Evaluation field is Dynamic , Replacement is Conditional . If you have multiple changes with
        # different RequiresRecreation values, the Replacement value depends on the change with the most
        # impact. A RequiresRecreation value of Always has the most impact, followed by Conditional , and then
        # Never .

        @[JSON::Field(key: "Replacement")]
        getter replacement : String?

        # List of resource attributes for which drift was ignored.

        @[JSON::Field(key: "ResourceDriftIgnoredAttributes")]
        getter resource_drift_ignored_attributes : Array(Types::ResourceDriftIgnoredAttribute)?

        # The drift status of the resource. Valid values: IN_SYNC – The resource matches its template
        # definition. MODIFIED – Resource properties were modified outside CloudFormation. DELETED – The
        # resource was deleted outside CloudFormation. NOT_CHECKED – CloudFormation doesn’t currently return
        # this value. UNKNOWN – Drift status could not be determined. UNSUPPORTED – Resource type does not
        # support actual state comparison. Only present for drift-aware change sets.

        @[JSON::Field(key: "ResourceDriftStatus")]
        getter resource_drift_status : String?

        # The type of CloudFormation resource, such as AWS::S3::Bucket .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # For the Modify action, indicates which resource attribute is triggering this update, such as a
        # change in the resource attribute's Metadata , Properties , or Tags .

        @[JSON::Field(key: "Scope")]
        getter scope : Array(String)?

        def initialize(
          @action : String? = nil,
          @after_context : String? = nil,
          @before_context : String? = nil,
          @change_set_id : String? = nil,
          @details : Array(Types::ResourceChangeDetail)? = nil,
          @logical_resource_id : String? = nil,
          @module_info : Types::ModuleInfo? = nil,
          @physical_resource_id : String? = nil,
          @policy_action : String? = nil,
          @previous_deployment_context : String? = nil,
          @replacement : String? = nil,
          @resource_drift_ignored_attributes : Array(Types::ResourceDriftIgnoredAttribute)? = nil,
          @resource_drift_status : String? = nil,
          @resource_type : String? = nil,
          @scope : Array(String)? = nil
        )
        end
      end

      # For a resource with Modify as the action, the ResourceChange structure describes the changes
      # CloudFormation will make to that resource.

      struct ResourceChangeDetail
        include JSON::Serializable

        # The identity of the entity that triggered this change. This entity is a member of the group that's
        # specified by the ChangeSource field. For example, if you modified the value of the KeyPairName
        # parameter, the CausingEntity is the name of the parameter ( KeyPairName ). If the ChangeSource value
        # is DirectModification , no value is given for CausingEntity .

        @[JSON::Field(key: "CausingEntity")]
        getter causing_entity : String?

        # The group to which the CausingEntity value belongs. There are five entity groups: ResourceReference
        # entities are Ref intrinsic functions that refer to resources in the template, such as { "Ref" :
        # "MyEC2InstanceResource" } . ParameterReference entities are Ref intrinsic functions that get
        # template parameter values, such as { "Ref" : "MyPasswordParameter" } . ResourceAttribute entities
        # are Fn::GetAtt intrinsic functions that get resource attribute values, such as { "Fn::GetAtt" : [
        # "MyEC2InstanceResource", "PublicDnsName" ] } . DirectModification entities are changes that are made
        # directly to the template. Automatic entities are AWS::CloudFormation::Stack resource types, which
        # are also known as nested stacks. If you made no changes to the AWS::CloudFormation::Stack resource,
        # CloudFormation sets the ChangeSource to Automatic because the nested stack's template might have
        # changed. Changes to a nested stack's template aren't visible to CloudFormation until you run an
        # update on the parent stack. NoModification entities are changes made to the template that matches
        # the actual state of the resource.

        @[JSON::Field(key: "ChangeSource")]
        getter change_source : String?

        # Indicates whether CloudFormation can determine the target value, and whether the target value will
        # change before you execute a change set. For Static evaluations, CloudFormation can determine that
        # the target value will change, and its value. For example, if you directly modify the InstanceType
        # property of an EC2 instance, CloudFormation knows that this property value will change, and its
        # value, so this is a Static evaluation. For Dynamic evaluations, can't determine the target value
        # because it depends on the result of an intrinsic function, such as a Ref or Fn::GetAtt intrinsic
        # function, when the stack is updated. For example, if your template includes a reference to a
        # resource that's conditionally recreated, the value of the reference (the physical ID of the
        # resource) might change, depending on if the resource is recreated. If the resource is recreated, it
        # will have a new physical ID, so all references to that resource will also be updated.

        @[JSON::Field(key: "Evaluation")]
        getter evaluation : String?

        # A ResourceTargetDefinition structure that describes the field that CloudFormation will change and
        # whether the resource will be recreated.

        @[JSON::Field(key: "Target")]
        getter target : Types::ResourceTargetDefinition?

        def initialize(
          @causing_entity : String? = nil,
          @change_source : String? = nil,
          @evaluation : String? = nil,
          @target : Types::ResourceTargetDefinition? = nil
        )
        end
      end

      # A resource included in a generated template. This data type is used with the CreateGeneratedTemplate
      # and UpdateGeneratedTemplate API actions.

      struct ResourceDefinition
        include JSON::Serializable

        # A list of up to 256 key-value pairs that identifies the scanned resource. The key is the name of one
        # of the primary identifiers for the resource. (Primary identifiers are specified in the
        # primaryIdentifier list in the resource schema.) The value is the value of that primary identifier.
        # For example, for a AWS::DynamoDB::Table resource, the primary identifiers is TableName so the
        # key-value pair could be "TableName": "MyDDBTable" . For more information, see primaryIdentifier in
        # the CloudFormation Command Line Interface (CLI) User Guide .

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : Hash(String, String)

        # The type of the resource, such as AWS::DynamoDB::Table . For the list of supported resources, see
        # Resource type support for imports and drift detection in the CloudFormation User Guide

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The logical resource id for this resource in the generated template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String?

        def initialize(
          @resource_identifier : Hash(String, String),
          @resource_type : String,
          @logical_resource_id : String? = nil
        )
        end
      end

      # Details about a resource in a generated template

      struct ResourceDetail
        include JSON::Serializable

        # The logical id for this resource in the final generated template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String?

        # A list of up to 256 key-value pairs that identifies the resource in the generated template. The key
        # is the name of one of the primary identifiers for the resource. (Primary identifiers are specified
        # in the primaryIdentifier list in the resource schema.) The value is the value of that primary
        # identifier. For example, for a AWS::DynamoDB::Table resource, the primary identifiers is TableName
        # so the key-value pair could be "TableName": "MyDDBTable" . For more information, see
        # primaryIdentifier in the CloudFormation Command Line Interface (CLI) User Guide .

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : Hash(String, String)?

        # Status of the processing of a resource in a generated template. InProgress The resource processing
        # is still in progress. Complete The resource processing is complete. Pending The resource processing
        # is pending. Failed The resource processing has failed.

        @[JSON::Field(key: "ResourceStatus")]
        getter resource_status : String?

        # The reason for the resource detail, providing more information if a failure happened.

        @[JSON::Field(key: "ResourceStatusReason")]
        getter resource_status_reason : String?

        # The type of the resource, such as AWS::DynamoDB::Table . For the list of supported resources, see
        # Resource type support for imports and drift detection In the CloudFormation User Guide

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The warnings generated for this resource.

        @[JSON::Field(key: "Warnings")]
        getter warnings : Array(Types::WarningDetail)?

        def initialize(
          @logical_resource_id : String? = nil,
          @resource_identifier : Hash(String, String)? = nil,
          @resource_status : String? = nil,
          @resource_status_reason : String? = nil,
          @resource_type : String? = nil,
          @warnings : Array(Types::WarningDetail)? = nil
        )
        end
      end

      # The ResourceDriftIgnoredAttribute data type.

      struct ResourceDriftIgnoredAttribute
        include JSON::Serializable

        # Path of the resource attribute for which drift was ignored.

        @[JSON::Field(key: "Path")]
        getter path : String?

        # Reason why drift was ignored for the attribute, can have 2 possible values: WRITE_ONLY_PROPERTY -
        # Property is not included in read response for the resource’s live state. MANAGED_BY_AWS - Property
        # is managed by an Amazon Web Services service and is expected to be dynamically modified.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @path : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Describes the target resources of a specific type in your import template (for example, all
      # AWS::S3::Bucket resources) and the properties you can provide during the import to identify
      # resources of that type.

      struct ResourceIdentifierSummary
        include JSON::Serializable

        # The logical IDs of the target resources of the specified ResourceType , as defined in the import
        # template.

        @[JSON::Field(key: "LogicalResourceIds")]
        getter logical_resource_ids : Array(String)?

        # The resource properties you can provide during the import to identify your target resources. For
        # example, BucketName is a possible identifier property for AWS::S3::Bucket resources.

        @[JSON::Field(key: "ResourceIdentifiers")]
        getter resource_identifiers : Array(String)?

        # The template resource type of the target resources, such as AWS::S3::Bucket .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @logical_resource_ids : Array(String)? = nil,
          @resource_identifiers : Array(String)? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The location of the resource in a stack template.

      struct ResourceLocation
        include JSON::Serializable

        # The logical name of the resource specified in the template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String

        # The name associated with the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        def initialize(
          @logical_resource_id : String,
          @stack_name : String
        )
        end
      end

      # Specifies the current source of the resource and the destination of where it will be moved to.

      struct ResourceMapping
        include JSON::Serializable

        # The destination stack StackName and LogicalResourceId for the resource being refactored.

        @[JSON::Field(key: "Destination")]
        getter destination : Types::ResourceLocation

        # The source stack StackName and LogicalResourceId for the resource being refactored.

        @[JSON::Field(key: "Source")]
        getter source : Types::ResourceLocation

        def initialize(
          @destination : Types::ResourceLocation,
          @source : Types::ResourceLocation
        )
        end
      end

      # A resource scan is currently in progress. Only one can be run at a time for an account in a Region.

      struct ResourceScanInProgressException
        include JSON::Serializable

        def initialize
        end
      end

      # The limit on resource scans has been exceeded. Reasons include: Exceeded the daily quota for
      # resource scans. A resource scan recently failed. You must wait 10 minutes before starting a new
      # resource scan. The last resource scan failed after exceeding 100,000 resources. When this happens,
      # you must wait 24 hours before starting a new resource scan.

      struct ResourceScanLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The resource scan was not found.

      struct ResourceScanNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # A summary of the resource scan. This is returned by the ListResourceScan API action.

      struct ResourceScanSummary
        include JSON::Serializable

        # The time that the resource scan was finished.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The percentage of the resource scan that has been completed.

        @[JSON::Field(key: "PercentageCompleted")]
        getter percentage_completed : Float64?

        # The Amazon Resource Name (ARN) of the resource scan.

        @[JSON::Field(key: "ResourceScanId")]
        getter resource_scan_id : String?

        # The scan type that has been completed.

        @[JSON::Field(key: "ScanType")]
        getter scan_type : String?

        # The time that the resource scan was started.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # Status of the resource scan. IN_PROGRESS The resource scan is still in progress. COMPLETE The
        # resource scan is complete. EXPIRED The resource scan has expired. FAILED The resource scan has
        # failed.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason for the resource scan status, providing more information if a failure happened.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @end_time : Time? = nil,
          @percentage_completed : Float64? = nil,
          @resource_scan_id : String? = nil,
          @scan_type : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The field that CloudFormation will change, such as the name of a resource's property, and whether
      # the resource will be recreated.

      struct ResourceTargetDefinition
        include JSON::Serializable

        # The value of the property after the change is executed. Large values can be truncated.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Indicates the source of the after value. Valid value: TEMPLATE – The after value comes from the new
        # template. Only present for drift-aware change sets.

        @[JSON::Field(key: "AfterValueFrom")]
        getter after_value_from : String?

        # Indicates which resource attribute is triggering this update, such as a change in the resource
        # attribute's Metadata , Properties , or Tags .

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        # The type of change to be made to the property if the change is executed. Add The item will be added.
        # Remove The item will be removed. Modify The item will be modified. SyncWithActual The drift status
        # of this item will be reset but the item will not be modified.

        @[JSON::Field(key: "AttributeChangeType")]
        getter attribute_change_type : String?

        # The value of the property before the change is executed. Large values can be truncated.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        # Indicates the source of the before value. Valid values: ACTUAL_STATE – The before value represents
        # current actual state. PREVIOUS_DEPLOYMENT_STATE – The before value represents the previous
        # CloudFormation deployment state. Only present for drift-aware change sets.

        @[JSON::Field(key: "BeforeValueFrom")]
        getter before_value_from : String?

        # Detailed drift information for the resource property, including actual values, previous deployment
        # values, and drift detection timestamps.

        @[JSON::Field(key: "Drift")]
        getter drift : Types::LiveResourceDrift?

        # If the Attribute value is Properties , the name of the property. For all other attributes, the value
        # is null.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The property path of the property.

        @[JSON::Field(key: "Path")]
        getter path : String?

        # If the Attribute value is Properties , indicates whether a change to this property causes the
        # resource to be recreated. The value can be Never , Always , or Conditionally . To determine the
        # conditions for a Conditionally recreation, see the update behavior for that property in the Amazon
        # Web Services resource and property types reference in the CloudFormation User Guide .

        @[JSON::Field(key: "RequiresRecreation")]
        getter requires_recreation : String?

        def initialize(
          @after_value : String? = nil,
          @after_value_from : String? = nil,
          @attribute : String? = nil,
          @attribute_change_type : String? = nil,
          @before_value : String? = nil,
          @before_value_from : String? = nil,
          @drift : Types::LiveResourceDrift? = nil,
          @name : String? = nil,
          @path : String? = nil,
          @requires_recreation : String? = nil
        )
        end
      end

      # Describes the target resource of an import operation.

      struct ResourceToImport
        include JSON::Serializable

        # The logical ID of the target resource as specified in the template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String

        # A key-value pair that identifies the target resource. The key is an identifier property (for
        # example, BucketName for AWS::S3::Bucket resources) and the value is the actual property value (for
        # example, MyS3Bucket ).

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : Hash(String, String)

        # The type of resource to import into your stack, such as AWS::S3::Bucket . For a list of supported
        # resource types, see Resource type support for imports and drift detection in the CloudFormation User
        # Guide .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @logical_resource_id : String,
          @resource_identifier : Hash(String, String),
          @resource_type : String
        )
        end
      end

      # Structure that contains the rollback triggers for CloudFormation to monitor during stack creation
      # and updating operations, and for the specified monitoring period afterwards. Rollback triggers
      # enable you to have CloudFormation monitor the state of your application during stack creation and
      # updating, and to roll back that operation if the application breaches the threshold of any of the
      # alarms you've specified. For more information, see Roll back your CloudFormation stack on alarm
      # breach with rollback triggers .

      struct RollbackConfiguration
        include JSON::Serializable

        # The amount of time, in minutes, during which CloudFormation should monitor all the rollback triggers
        # after the stack creation or update operation deploys all necessary resources. The default is 0
        # minutes. If you specify a monitoring period but don't specify any rollback triggers, CloudFormation
        # still waits the specified period of time before cleaning up old resources after update operations.
        # You can use this monitoring period to perform any manual stack validation desired, and manually
        # cancel the stack creation or update (using CancelUpdateStack , for example) as necessary. If you
        # specify 0 for this parameter, CloudFormation still monitors the specified rollback triggers during
        # stack creation and update operations. Then, for update operations, it begins disposing of old
        # resources immediately once the operation completes.

        @[JSON::Field(key: "MonitoringTimeInMinutes")]
        getter monitoring_time_in_minutes : Int32?

        # The triggers to monitor during stack creation or update actions. By default, CloudFormation saves
        # the rollback triggers specified for a stack and applies them to any subsequent update operations for
        # the stack, unless you specify otherwise. If you do specify rollback triggers for this parameter,
        # those triggers replace any list of triggers previously specified for the stack. This means: To use
        # the rollback triggers previously specified for this stack, if any, don't specify this parameter. To
        # specify new or updated rollback triggers, you must specify all the triggers that you want used for
        # this stack, even triggers you've specified before (for example, when creating the stack or during a
        # previous stack update). Any triggers that you don't include in the updated list of triggers are no
        # longer applied to the stack. To remove all currently specified triggers, specify an empty list for
        # this parameter. If a specified trigger is missing, the entire stack operation fails and is rolled
        # back.

        @[JSON::Field(key: "RollbackTriggers")]
        getter rollback_triggers : Array(Types::RollbackTrigger)?

        def initialize(
          @monitoring_time_in_minutes : Int32? = nil,
          @rollback_triggers : Array(Types::RollbackTrigger)? = nil
        )
        end
      end


      struct RollbackStackInput
        include JSON::Serializable

        # The name that's associated with the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # A unique identifier for this RollbackStack request.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # When set to true , newly created resources are deleted when the operation rolls back. This includes
        # newly created resources marked with a deletion policy of Retain . Default: false

        @[JSON::Field(key: "RetainExceptOnCreate")]
        getter retain_except_on_create : Bool?

        # The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes to rollback the stack.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @stack_name : String,
          @client_request_token : String? = nil,
          @retain_except_on_create : Bool? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct RollbackStackOutput
        include JSON::Serializable

        # A unique identifier for this rollback operation that can be used to track the operation's progress
        # and events.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # Unique identifier of the stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        def initialize(
          @operation_id : String? = nil,
          @stack_id : String? = nil
        )
        end
      end

      # A rollback trigger CloudFormation monitors during creation and updating of stacks. If any of the
      # alarms you specify goes to ALARM state during the stack operation or within the specified monitoring
      # period afterwards, CloudFormation rolls back the entire stack operation.

      struct RollbackTrigger
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rollback trigger. If a specified trigger is missing, the
        # entire stack operation fails and is rolled back.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The resource type of the rollback trigger. Specify either AWS::CloudWatch::Alarm or
        # AWS::CloudWatch::CompositeAlarm resource types.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @arn : String,
          @type : String
        )
        end
      end

      # A filter that is used to specify which resource types to scan.

      struct ScanFilter
        include JSON::Serializable

        # An array of strings where each string represents an Amazon Web Services resource type you want to
        # scan. Each string defines the resource type using the format AWS::ServiceName::ResourceType , for
        # example, AWS::DynamoDB::Table . For the full list of supported resource types, see the Resource type
        # support table in the CloudFormation User Guide . To scan all resource types within a service, you
        # can use a wildcard, represented by an asterisk ( * ). You can place an asterisk at only the end of
        # the string, for example, AWS::S3::* .

        @[JSON::Field(key: "Types")]
        getter types : Array(String)?

        def initialize(
          @types : Array(String)? = nil
        )
        end
      end

      # A scanned resource returned by ListResourceScanResources or ListResourceScanRelatedResources .

      struct ScannedResource
        include JSON::Serializable

        # If true , the resource is managed by a CloudFormation stack.

        @[JSON::Field(key: "ManagedByStack")]
        getter managed_by_stack : Bool?

        # A list of up to 256 key-value pairs that identifies for the scanned resource. The key is the name of
        # one of the primary identifiers for the resource. (Primary identifiers are specified in the
        # primaryIdentifier list in the resource schema.) The value is the value of that primary identifier.
        # For example, for a AWS::DynamoDB::Table resource, the primary identifiers is TableName so the
        # key-value pair could be "TableName": "MyDDBTable" . For more information, see primaryIdentifier in
        # the CloudFormation Command Line Interface (CLI) User Guide .

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : Hash(String, String)?

        # The type of the resource, such as AWS::DynamoDB::Table . For the list of supported resources, see
        # Resource type support for imports and drift detection In the CloudFormation User Guide

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @managed_by_stack : Bool? = nil,
          @resource_identifier : Hash(String, String)? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Identifies a scanned resource. This is used with the ListResourceScanRelatedResources API action.

      struct ScannedResourceIdentifier
        include JSON::Serializable

        # A list of up to 256 key-value pairs that identifies the scanned resource. The key is the name of one
        # of the primary identifiers for the resource. (Primary identifiers are specified in the
        # primaryIdentifier list in the resource schema.) The value is the value of that primary identifier.
        # For example, for a AWS::DynamoDB::Table resource, the primary identifiers is TableName so the
        # key-value pair could be "TableName": "MyDDBTable" . For more information, see primaryIdentifier in
        # the CloudFormation Command Line Interface (CLI) User Guide .

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : Hash(String, String)

        # The type of the resource, such as AWS::DynamoDB::Table . For the list of supported resources, see
        # Resource type support for imports and drift detection In the CloudFormation User Guide .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @resource_identifier : Hash(String, String),
          @resource_type : String
        )
        end
      end

      # The input for the SetStackPolicy action.

      struct SetStackPolicyInput
        include JSON::Serializable

        # The name or unique stack ID that you want to associate a policy with.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # Structure that contains the stack policy body. For more information, see Prevent updates to stack
        # resources in the CloudFormation User Guide . You can specify either the StackPolicyBody or the
        # StackPolicyURL parameter, but not both.

        @[JSON::Field(key: "StackPolicyBody")]
        getter stack_policy_body : String?

        # Location of a file that contains the stack policy. The URL must point to a policy (maximum size: 16
        # KB) located in an Amazon S3 bucket in the same Amazon Web Services Region as the stack. The location
        # for an Amazon S3 bucket must start with https:// . URLs from S3 static websites are not supported.
        # You can specify either the StackPolicyBody or the StackPolicyURL parameter, but not both.

        @[JSON::Field(key: "StackPolicyURL")]
        getter stack_policy_url : String?

        def initialize(
          @stack_name : String,
          @stack_policy_body : String? = nil,
          @stack_policy_url : String? = nil
        )
        end
      end


      struct SetTypeConfigurationInput
        include JSON::Serializable

        # The configuration data for the extension in this account and Region. The configuration data must be
        # formatted as JSON and validate against the extension's schema returned in the Schema response
        # element of DescribeType .

        @[JSON::Field(key: "Configuration")]
        getter configuration : String

        # An alias by which to refer to this extension configuration data. Conditional: Specifying a
        # configuration alias is required when setting a configuration for a resource type extension.

        @[JSON::Field(key: "ConfigurationAlias")]
        getter configuration_alias : String?

        # The type of extension. Conditional: You must specify ConfigurationArn , or Type and TypeName .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The Amazon Resource Name (ARN) for the extension in this account and Region. For public extensions,
        # this will be the ARN assigned when you call the ActivateType API operation in this account and
        # Region. For private extensions, this will be the ARN assigned when you call the RegisterType API
        # operation in this account and Region. Do not include the extension versions suffix at the end of the
        # ARN. You can set the configuration for an extension, but not for a specific extension version.

        @[JSON::Field(key: "TypeArn")]
        getter type_arn : String?

        # The name of the extension. Conditional: You must specify ConfigurationArn , or Type and TypeName .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @configuration : String,
          @configuration_alias : String? = nil,
          @type : String? = nil,
          @type_arn : String? = nil,
          @type_name : String? = nil
        )
        end
      end


      struct SetTypeConfigurationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the configuration data in this account and Region. Conditional:
        # You must specify ConfigurationArn , or Type and TypeName .

        @[JSON::Field(key: "ConfigurationArn")]
        getter configuration_arn : String?

        def initialize(
          @configuration_arn : String? = nil
        )
        end
      end


      struct SetTypeDefaultVersionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the extension for which you want version summary information.
        # Conditional: You must specify either TypeName and Type , or Arn .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The kind of extension. Conditional: You must specify either TypeName and Type , or Arn .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The name of the extension. Conditional: You must specify either TypeName and Type , or Arn .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # The ID of a specific version of the extension. The version ID is the value at the end of the Amazon
        # Resource Name (ARN) assigned to the extension version when it is registered.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @arn : String? = nil,
          @type : String? = nil,
          @type_name : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct SetTypeDefaultVersionOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the SignalResource action.

      struct SignalResourceInput
        include JSON::Serializable

        # The logical ID of the resource that you want to signal. The logical ID is the name of the resource
        # that given in the template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String

        # The stack name or unique stack ID that includes the resource that you want to signal.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The status of the signal, which is either success or failure. A failure signal causes CloudFormation
        # to immediately fail the stack creation or update.

        @[JSON::Field(key: "Status")]
        getter status : String

        # A unique ID of the signal. When you signal Amazon EC2 instances or Amazon EC2 Auto Scaling groups,
        # specify the instance ID that you are signaling as the unique ID. If you send multiple signals to a
        # single resource (such as signaling a wait condition), each signal requires a different unique ID.

        @[JSON::Field(key: "UniqueId")]
        getter unique_id : String

        def initialize(
          @logical_resource_id : String,
          @stack_name : String,
          @status : String,
          @unique_id : String
        )
        end
      end

      # The Stack data type.

      struct Stack
        include JSON::Serializable

        # The time at which the stack was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The name associated with the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # Current status of the stack.

        @[JSON::Field(key: "StackStatus")]
        getter stack_status : String

        # The capabilities allowed in the stack.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)?

        # The unique ID of the change set.

        @[JSON::Field(key: "ChangeSetId")]
        getter change_set_id : String?

        # Specifies the deletion mode for the stack. Possible values are: STANDARD - Use the standard
        # behavior. Specifying this value is the same as not specifying this parameter. FORCE_DELETE_STACK -
        # Delete the stack if it's stuck in a DELETE_FAILED state due to resource deletion failure.

        @[JSON::Field(key: "DeletionMode")]
        getter deletion_mode : String?

        # The time the stack was deleted.

        @[JSON::Field(key: "DeletionTime")]
        getter deletion_time : Time?

        # A user-defined description associated with the stack.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The detailed status of the resource or stack. If CONFIGURATION_COMPLETE is present, the resource or
        # resource configuration phase has completed and the stabilization of the resources is in progress.
        # The StackSets CONFIGURATION_COMPLETE when all of the resources in the stack have reached that event.
        # For more information, see Understand CloudFormation stack creation events in the CloudFormation User
        # Guide .

        @[JSON::Field(key: "DetailedStatus")]
        getter detailed_status : String?

        # Boolean to enable or disable rollback on stack creation failures: true : disable rollback. false :
        # enable rollback.

        @[JSON::Field(key: "DisableRollback")]
        getter disable_rollback : Bool?

        # Information about whether a stack's actual configuration differs, or has drifted , from its expected
        # configuration, as defined in the stack template and any values specified as template parameters. For
        # more information, see Detect unmanaged configuration changes to stacks and resources with drift
        # detection .

        @[JSON::Field(key: "DriftInformation")]
        getter drift_information : Types::StackDriftInformation?

        # Whether termination protection is enabled for the stack. For nested stacks , termination protection
        # is set on the root stack and can't be changed directly on the nested stack. For more information,
        # see Protect a CloudFormation stack from being deleted in the CloudFormation User Guide .

        @[JSON::Field(key: "EnableTerminationProtection")]
        getter enable_termination_protection : Bool?

        # Information about the most recent operations performed on this stack.

        @[JSON::Field(key: "LastOperations")]
        getter last_operations : Array(Types::OperationEntry)?

        # The time the stack was last updated. This field will only be returned if the stack has been updated
        # at least once.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # Amazon SNS topic Amazon Resource Names (ARNs) to which stack related events are published.

        @[JSON::Field(key: "NotificationARNs")]
        getter notification_ar_ns : Array(String)?

        # A list of output structures.

        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::Output)?

        # A list of Parameter structures.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # For nested stacks, the stack ID of the direct parent of this stack. For the first level of nested
        # stacks, the root stack is also the parent stack. For more information, see Nested stacks in the
        # CloudFormation User Guide .

        @[JSON::Field(key: "ParentId")]
        getter parent_id : String?

        # When set to true , newly created resources are deleted when the operation rolls back. This includes
        # newly created resources marked with a deletion policy of Retain . Default: false

        @[JSON::Field(key: "RetainExceptOnCreate")]
        getter retain_except_on_create : Bool?

        # The Amazon Resource Name (ARN) of an IAM role that's associated with the stack. During a stack
        # operation, CloudFormation uses this role's credentials to make calls on your behalf.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The rollback triggers for CloudFormation to monitor during stack creation and updating operations,
        # and for the specified monitoring period afterwards.

        @[JSON::Field(key: "RollbackConfiguration")]
        getter rollback_configuration : Types::RollbackConfiguration?

        # For nested stacks, the stack ID of the top-level stack to which the nested stack ultimately belongs.
        # For more information, see Nested stacks in the CloudFormation User Guide .

        @[JSON::Field(key: "RootId")]
        getter root_id : String?

        # Unique identifier of the stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        # Success/failure message associated with the stack status.

        @[JSON::Field(key: "StackStatusReason")]
        getter stack_status_reason : String?

        # A list of Tag s that specify information about the stack.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The amount of time within which stack creation should complete.

        @[JSON::Field(key: "TimeoutInMinutes")]
        getter timeout_in_minutes : Int32?

        def initialize(
          @creation_time : Time,
          @stack_name : String,
          @stack_status : String,
          @capabilities : Array(String)? = nil,
          @change_set_id : String? = nil,
          @deletion_mode : String? = nil,
          @deletion_time : Time? = nil,
          @description : String? = nil,
          @detailed_status : String? = nil,
          @disable_rollback : Bool? = nil,
          @drift_information : Types::StackDriftInformation? = nil,
          @enable_termination_protection : Bool? = nil,
          @last_operations : Array(Types::OperationEntry)? = nil,
          @last_updated_time : Time? = nil,
          @notification_ar_ns : Array(String)? = nil,
          @outputs : Array(Types::Output)? = nil,
          @parameters : Array(Types::Parameter)? = nil,
          @parent_id : String? = nil,
          @retain_except_on_create : Bool? = nil,
          @role_arn : String? = nil,
          @rollback_configuration : Types::RollbackConfiguration? = nil,
          @root_id : String? = nil,
          @stack_id : String? = nil,
          @stack_status_reason : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timeout_in_minutes : Int32? = nil
        )
        end
      end

      # Describes the stack and the template used by the stack.

      struct StackDefinition
        include JSON::Serializable

        # The name associated with the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        # The file path for the stack template file.

        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        # The desired final state of the stack template.

        @[JSON::Field(key: "TemplateURL")]
        getter template_url : String?

        def initialize(
          @stack_name : String? = nil,
          @template_body : String? = nil,
          @template_url : String? = nil
        )
        end
      end

      # Contains information about whether the stack's actual configuration differs, or has drifted , from
      # its expected configuration, as defined in the stack template and any values specified as template
      # parameters. A stack is considered to have drifted if one or more of its resources have drifted.

      struct StackDriftInformation
        include JSON::Serializable

        # Status of the stack's actual configuration compared to its expected template configuration. DRIFTED
        # : The stack differs from its expected template configuration. A stack is considered to have drifted
        # if one or more of its resources have drifted. NOT_CHECKED : CloudFormation hasn't checked if the
        # stack differs from its expected template configuration. IN_SYNC : The stack's actual configuration
        # matches its expected template configuration. UNKNOWN : CloudFormation could not run drift detection
        # for a resource in the stack.

        @[JSON::Field(key: "StackDriftStatus")]
        getter stack_drift_status : String

        # Most recent time when a drift detection operation was initiated on the stack, or any of its
        # individual resources that support drift detection.

        @[JSON::Field(key: "LastCheckTimestamp")]
        getter last_check_timestamp : Time?

        def initialize(
          @stack_drift_status : String,
          @last_check_timestamp : Time? = nil
        )
        end
      end

      # Contains information about whether the stack's actual configuration differs, or has drifted , from
      # its expected configuration, as defined in the stack template and any values specified as template
      # parameters. A stack is considered to have drifted if one or more of its resources have drifted.

      struct StackDriftInformationSummary
        include JSON::Serializable

        # Status of the stack's actual configuration compared to its expected template configuration. DRIFTED
        # : The stack differs from its expected template configuration. A stack is considered to have drifted
        # if one or more of its resources have drifted. NOT_CHECKED : CloudFormation hasn't checked if the
        # stack differs from its expected template configuration. IN_SYNC : The stack's actual configuration
        # matches its expected template configuration. UNKNOWN : CloudFormation could not run drift detection
        # for a resource in the stack.

        @[JSON::Field(key: "StackDriftStatus")]
        getter stack_drift_status : String

        # Most recent time when a drift detection operation was initiated on the stack, or any of its
        # individual resources that support drift detection.

        @[JSON::Field(key: "LastCheckTimestamp")]
        getter last_check_timestamp : Time?

        def initialize(
          @stack_drift_status : String,
          @last_check_timestamp : Time? = nil
        )
        end
      end

      # The StackEvent data type.

      struct StackEvent
        include JSON::Serializable

        # The unique identifier of this event.

        @[JSON::Field(key: "EventId")]
        getter event_id : String

        # The unique ID name of the instance of the stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String

        # The name associated with a stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # Time the status was updated.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        # The token passed to the operation that generated this event. All events triggered by a given stack
        # operation are assigned the same client request token, which you can use to track operations. For
        # example, if you execute a CreateStack operation with the token token1 , then all the StackEvents
        # generated by that operation will have ClientRequestToken set as token1 . In the console, stack
        # operations display the client request token on the Events tab. Stack operations that are initiated
        # from the console use the token format Console-StackOperation-ID , which helps you easily identify
        # the stack operation . For example, if you create a stack using the console, each stack event would
        # be assigned the same token in the following format:
        # Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002 .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # An optional field that contains information about the detailed status of the stack event.
        # CONFIGURATION_COMPLETE - all of the resources in the stack have reached that event. For more
        # information, see Understand CloudFormation stack creation events in the CloudFormation User Guide .
        # VALIDATION_FAILED - template validation failed because of invalid properties in the template. The
        # ResourceStatusReason field shows what properties are defined incorrectly.

        @[JSON::Field(key: "DetailedStatus")]
        getter detailed_status : String?

        # Specify the Hook failure mode for non-compliant resources in the followings ways. FAIL Stops
        # provisioning resources. WARN Allows provisioning to continue with a warning message.

        @[JSON::Field(key: "HookFailureMode")]
        getter hook_failure_mode : String?

        # The unique identifier of the Hook invocation.

        @[JSON::Field(key: "HookInvocationId")]
        getter hook_invocation_id : String?

        # The specific point in the provisioning process where the Hook is invoked.

        @[JSON::Field(key: "HookInvocationPoint")]
        getter hook_invocation_point : String?

        # Provides the status of the change set Hook.

        @[JSON::Field(key: "HookStatus")]
        getter hook_status : String?

        # Provides the reason for the Hook status.

        @[JSON::Field(key: "HookStatusReason")]
        getter hook_status_reason : String?

        # The name of the Hook.

        @[JSON::Field(key: "HookType")]
        getter hook_type : String?

        # The logical name of the resource specified in the template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String?

        # The unique identifier of the operation that generated this stack event.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # The name or unique identifier associated with the physical instance of the resource.

        @[JSON::Field(key: "PhysicalResourceId")]
        getter physical_resource_id : String?

        # BLOB of the properties used to create the resource.

        @[JSON::Field(key: "ResourceProperties")]
        getter resource_properties : String?

        # Current status of the resource.

        @[JSON::Field(key: "ResourceStatus")]
        getter resource_status : String?

        # Success/failure message associated with the resource.

        @[JSON::Field(key: "ResourceStatusReason")]
        getter resource_status_reason : String?

        # Type of resource. For more information, see Amazon Web Services resource and property types
        # reference in the CloudFormation User Guide .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @event_id : String,
          @stack_id : String,
          @stack_name : String,
          @timestamp : Time,
          @client_request_token : String? = nil,
          @detailed_status : String? = nil,
          @hook_failure_mode : String? = nil,
          @hook_invocation_id : String? = nil,
          @hook_invocation_point : String? = nil,
          @hook_status : String? = nil,
          @hook_status_reason : String? = nil,
          @hook_type : String? = nil,
          @logical_resource_id : String? = nil,
          @operation_id : String? = nil,
          @physical_resource_id : String? = nil,
          @resource_properties : String? = nil,
          @resource_status : String? = nil,
          @resource_status_reason : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # A CloudFormation stack, in a specific account and Region, that's part of a StackSet operation. A
      # stack instance is a reference to an attempted or actual stack in a given account within a given
      # Region. A stack instance can exist without a stack—for example, if the stack couldn't be created for
      # some reason. A stack instance is associated with only one StackSet. Each stack instance contains the
      # ID of its associated StackSet, in addition to the ID of the actual stack and the stack status.

      struct StackInstance
        include JSON::Serializable

        # [Self-managed permissions] The name of the Amazon Web Services account that the stack instance is
        # associated with.

        @[JSON::Field(key: "Account")]
        getter account : String?

        # Status of the stack instance's actual configuration compared to the expected template and parameter
        # configuration of the StackSet it belongs to. DRIFTED : The stack differs from the expected template
        # and parameter configuration of the StackSet it belongs to. A stack instance is considered to have
        # drifted if one or more of the resources in the associated stack have drifted. NOT_CHECKED :
        # CloudFormation hasn't checked if the stack instance differs from its expected StackSet
        # configuration. IN_SYNC : The stack instance's actual configuration matches its expected StackSset
        # configuration. UNKNOWN : This value is reserved for future use.

        @[JSON::Field(key: "DriftStatus")]
        getter drift_status : String?

        # Most recent time when CloudFormation performed a drift detection operation on the stack instance.
        # This value will be NULL for any stack instance that drift detection hasn't yet been performed on.

        @[JSON::Field(key: "LastDriftCheckTimestamp")]
        getter last_drift_check_timestamp : Time?

        # The last unique ID of a StackSet operation performed on a stack instance.

        @[JSON::Field(key: "LastOperationId")]
        getter last_operation_id : String?

        # [Service-managed permissions] The organization root ID or organizational unit (OU) IDs that you
        # specified for DeploymentTargets .

        @[JSON::Field(key: "OrganizationalUnitId")]
        getter organizational_unit_id : String?

        # A list of parameters from the StackSet template whose values have been overridden in this stack
        # instance.

        @[JSON::Field(key: "ParameterOverrides")]
        getter parameter_overrides : Array(Types::Parameter)?

        # The name of the Amazon Web Services Region that the stack instance is associated with.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The ID of the stack instance.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        # The detailed status of the stack instance.

        @[JSON::Field(key: "StackInstanceStatus")]
        getter stack_instance_status : Types::StackInstanceComprehensiveStatus?

        # The name or unique ID of the StackSet that the stack instance is associated with.

        @[JSON::Field(key: "StackSetId")]
        getter stack_set_id : String?

        # The status of the stack instance, in terms of its synchronization with its associated stack set.
        # INOPERABLE : A DeleteStackInstances operation has failed and left the stack in an unstable state.
        # Stacks in this state are excluded from further UpdateStackSet operations. You might need to perform
        # a DeleteStackInstances operation, with RetainStacks set to true , to delete the stack instance, and
        # then delete the stack manually. INOPERABLE can be returned here when the cause is a failed import.
        # If it's due to a failed import, the operation can be retried once the failures are fixed. To see if
        # this is due to a failed import, look at the DetailedStatus member in the StackInstanceSummary member
        # that is a peer to this Status member. OUTDATED : The stack isn't currently up to date with the
        # StackSet because: The associated stack failed during a CreateStackSet or UpdateStackSet operation.
        # The stack was part of a CreateStackSet or UpdateStackSet operation that failed or was stopped before
        # the stack was created or updated. CURRENT : The stack is currently up to date with the StackSet.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The explanation for the specific status code that's assigned to this stack instance.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @account : String? = nil,
          @drift_status : String? = nil,
          @last_drift_check_timestamp : Time? = nil,
          @last_operation_id : String? = nil,
          @organizational_unit_id : String? = nil,
          @parameter_overrides : Array(Types::Parameter)? = nil,
          @region : String? = nil,
          @stack_id : String? = nil,
          @stack_instance_status : Types::StackInstanceComprehensiveStatus? = nil,
          @stack_set_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The detailed status of the stack instance.

      struct StackInstanceComprehensiveStatus
        include JSON::Serializable

        # CANCELLED : The operation in the specified account and Region has been canceled. This is either
        # because a user has stopped the StackSet operation, or because the failure tolerance of the StackSet
        # operation has been exceeded. FAILED : The operation in the specified account and Region failed. If
        # the StackSet operation fails in enough accounts within a Region, the failure tolerance for the
        # StackSet operation as a whole might be exceeded. FAILED_IMPORT : The import of the stack instance in
        # the specified account and Region failed and left the stack in an unstable state. Once the issues
        # causing the failure are fixed, the import operation can be retried. If enough StackSet operations
        # fail in enough accounts within a Region, the failure tolerance for the StackSet operation as a whole
        # might be exceeded. INOPERABLE : A DeleteStackInstances operation has failed and left the stack in an
        # unstable state. Stacks in this state are excluded from further UpdateStackSet operations. You might
        # need to perform a DeleteStackInstances operation, with RetainStacks set to true , to delete the
        # stack instance, and then delete the stack manually. PENDING : The operation in the specified account
        # and Region has yet to start. RUNNING : The operation in the specified account and Region is
        # currently in progress. SKIPPED_SUSPENDED_ACCOUNT : The operation in the specified account and Region
        # has been skipped because the account was suspended at the time of the operation. SUCCEEDED : The
        # operation in the specified account and Region completed successfully.

        @[JSON::Field(key: "DetailedStatus")]
        getter detailed_status : String?

        def initialize(
          @detailed_status : String? = nil
        )
        end
      end

      # The filter to apply to stack instances

      struct StackInstanceFilter
        include JSON::Serializable

        # The type of filter to apply.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status to filter by.

        @[JSON::Field(key: "Values")]
        getter values : String?

        def initialize(
          @name : String? = nil,
          @values : String? = nil
        )
        end
      end

      # The specified stack instance doesn't exist.

      struct StackInstanceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The structure containing summary information about resource drifts for a stack instance.

      struct StackInstanceResourceDriftsSummary
        include JSON::Serializable

        # The logical name of the resource specified in the template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String

        # Type of resource. For more information, see Amazon Web Services resource and property types
        # reference in the CloudFormation User Guide .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The ID of the stack instance.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String

        # The drift status of the resource in a stack instance. DELETED : The resource differs from its
        # expected template configuration in that the resource has been deleted. MODIFIED : One or more
        # resource properties differ from their expected template values. IN_SYNC : The resource's actual
        # configuration matches its expected template configuration. NOT_CHECKED : CloudFormation doesn't
        # currently return this value.

        @[JSON::Field(key: "StackResourceDriftStatus")]
        getter stack_resource_drift_status : String

        # Time at which the stack instance drift detection operation was initiated.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        # The name or unique identifier that corresponds to a physical instance ID of a resource supported by
        # CloudFormation.

        @[JSON::Field(key: "PhysicalResourceId")]
        getter physical_resource_id : String?

        # Context information that enables CloudFormation to uniquely identify a resource. CloudFormation uses
        # context key-value pairs in cases where a resource's logical and physical IDs aren't enough to
        # uniquely identify that resource. Each context key-value pair specifies a unique resource that
        # contains the targeted resource.

        @[JSON::Field(key: "PhysicalResourceIdContext")]
        getter physical_resource_id_context : Array(Types::PhysicalResourceIdContextKeyValuePair)?

        # Status of the actual configuration of the resource compared to its expected configuration. These
        # will be present only for resources whose StackInstanceResourceDriftStatus is MODIFIED .

        @[JSON::Field(key: "PropertyDifferences")]
        getter property_differences : Array(Types::PropertyDifference)?

        def initialize(
          @logical_resource_id : String,
          @resource_type : String,
          @stack_id : String,
          @stack_resource_drift_status : String,
          @timestamp : Time,
          @physical_resource_id : String? = nil,
          @physical_resource_id_context : Array(Types::PhysicalResourceIdContextKeyValuePair)? = nil,
          @property_differences : Array(Types::PropertyDifference)? = nil
        )
        end
      end

      # The structure that contains summary information about a stack instance.

      struct StackInstanceSummary
        include JSON::Serializable

        # [Self-managed permissions] The name of the Amazon Web Services account that the stack instance is
        # associated with.

        @[JSON::Field(key: "Account")]
        getter account : String?

        # Status of the stack instance's actual configuration compared to the expected template and parameter
        # configuration of the StackSet it belongs to. DRIFTED : The stack differs from the expected template
        # and parameter configuration of the StackSet it belongs to. A stack instance is considered to have
        # drifted if one or more of the resources in the associated stack have drifted. NOT_CHECKED :
        # CloudFormation hasn't checked if the stack instance differs from its expected StackSet
        # configuration. IN_SYNC : The stack instance's actual configuration matches its expected StackSet
        # configuration. UNKNOWN : This value is reserved for future use.

        @[JSON::Field(key: "DriftStatus")]
        getter drift_status : String?

        # Most recent time when CloudFormation performed a drift detection operation on the stack instance.
        # This value will be NULL for any stack instance that drift detection hasn't yet been performed on.

        @[JSON::Field(key: "LastDriftCheckTimestamp")]
        getter last_drift_check_timestamp : Time?

        # The last unique ID of a StackSet operation performed on a stack instance.

        @[JSON::Field(key: "LastOperationId")]
        getter last_operation_id : String?

        # [Service-managed permissions] The organization root ID or organizational unit (OU) IDs that you
        # specified for DeploymentTargets .

        @[JSON::Field(key: "OrganizationalUnitId")]
        getter organizational_unit_id : String?

        # The name of the Amazon Web Services Region that the stack instance is associated with.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The ID of the stack instance.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        # The detailed status of the stack instance.

        @[JSON::Field(key: "StackInstanceStatus")]
        getter stack_instance_status : Types::StackInstanceComprehensiveStatus?

        # The name or unique ID of the StackSet that the stack instance is associated with.

        @[JSON::Field(key: "StackSetId")]
        getter stack_set_id : String?

        # The status of the stack instance, in terms of its synchronization with its associated stack set.
        # INOPERABLE : A DeleteStackInstances operation has failed and left the stack in an unstable state.
        # Stacks in this state are excluded from further UpdateStackSet operations. You might need to perform
        # a DeleteStackInstances operation, with RetainStacks set to true , to delete the stack instance, and
        # then delete the stack manually. INOPERABLE can be returned here when the cause is a failed import.
        # If it's due to a failed import, the operation can be retried once the failures are fixed. To see if
        # this is due to a failed import, call the DescribeStackInstance API operation, look at the
        # DetailedStatus member returned in the StackInstanceSummary member. OUTDATED : The stack isn't
        # currently up to date with the StackSet because: The associated stack failed during a CreateStackSet
        # or UpdateStackSet operation. The stack was part of a CreateStackSet or UpdateStackSet operation that
        # failed or was stopped before the stack was created or updated. CURRENT : The stack is currently up
        # to date with the StackSet.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The explanation for the specific status code assigned to this stack instance.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @account : String? = nil,
          @drift_status : String? = nil,
          @last_drift_check_timestamp : Time? = nil,
          @last_operation_id : String? = nil,
          @organizational_unit_id : String? = nil,
          @region : String? = nil,
          @stack_id : String? = nil,
          @stack_instance_status : Types::StackInstanceComprehensiveStatus? = nil,
          @stack_set_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The specified stack ARN doesn't exist or stack doesn't exist corresponding to the ARN in input.

      struct StackNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the stack and the action that CloudFormation will perform on it if you execute the stack
      # refactor.

      struct StackRefactorAction
        include JSON::Serializable

        # The action that CloudFormation takes on the stack.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # A description to help you identify the refactor.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The detection type is one of the following: Auto: CloudFormation figured out the mapping on its own.
        # Manual: The customer provided the mapping in the ResourceMapping parameter.

        @[JSON::Field(key: "Detection")]
        getter detection : String?

        # The description of the detection type.

        @[JSON::Field(key: "DetectionReason")]
        getter detection_reason : String?

        # The type that will be evaluated in the StackRefactorAction . The following are potential Entity
        # types: Stack Resource

        @[JSON::Field(key: "Entity")]
        getter entity : String?

        # The name or unique identifier associated with the physical instance of the resource.

        @[JSON::Field(key: "PhysicalResourceId")]
        getter physical_resource_id : String?

        # A key-value pair that identifies the target resource. The key is an identifier property (for
        # example, BucketName for AWS::S3::Bucket resources) and the value is the actual property value (for
        # example, MyS3Bucket ).

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        # The mapping for the stack resource Source and stack resource Destination .

        @[JSON::Field(key: "ResourceMapping")]
        getter resource_mapping : Types::ResourceMapping?

        # Assigns one or more tags to specified resources.

        @[JSON::Field(key: "TagResources")]
        getter tag_resources : Array(Types::Tag)?

        # Removes one or more tags to specified resources.

        @[JSON::Field(key: "UntagResources")]
        getter untag_resources : Array(String)?

        def initialize(
          @action : String? = nil,
          @description : String? = nil,
          @detection : String? = nil,
          @detection_reason : String? = nil,
          @entity : String? = nil,
          @physical_resource_id : String? = nil,
          @resource_identifier : String? = nil,
          @resource_mapping : Types::ResourceMapping? = nil,
          @tag_resources : Array(Types::Tag)? = nil,
          @untag_resources : Array(String)? = nil
        )
        end
      end

      # The specified stack refactor can't be found.

      struct StackRefactorNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The summary of a stack refactor operation.

      struct StackRefactorSummary
        include JSON::Serializable

        # A description to help you identify the refactor.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The operation status that's provided after calling the ExecuteStackRefactor action.

        @[JSON::Field(key: "ExecutionStatus")]
        getter execution_status : String?

        # A detailed explanation for the stack refactor ExecutionStatus .

        @[JSON::Field(key: "ExecutionStatusReason")]
        getter execution_status_reason : String?

        # The ID associated with the stack refactor created from the CreateStackRefactor action.

        @[JSON::Field(key: "StackRefactorId")]
        getter stack_refactor_id : String?

        # The stack refactor operation status that's provided after calling the CreateStackRefactor action.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed explanation for the stack refactor Status .

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @description : String? = nil,
          @execution_status : String? = nil,
          @execution_status_reason : String? = nil,
          @stack_refactor_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The StackResource data type.

      struct StackResource
        include JSON::Serializable

        # The logical name of the resource specified in the template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String

        # Current status of the resource.

        @[JSON::Field(key: "ResourceStatus")]
        getter resource_status : String

        # Type of resource. For more information, see Amazon Web Services resource and property types
        # reference in the CloudFormation User Guide .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Time the status was updated.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        # User defined description associated with the resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information about whether the resource's actual configuration differs, or has drifted , from its
        # expected configuration, as defined in the stack template and any values specified as template
        # parameters. For more information, see Detect unmanaged configuration changes to stacks and resources
        # with drift detection .

        @[JSON::Field(key: "DriftInformation")]
        getter drift_information : Types::StackResourceDriftInformation?

        # Contains information about the module from which the resource was created, if the resource was
        # created from a module included in the stack template.

        @[JSON::Field(key: "ModuleInfo")]
        getter module_info : Types::ModuleInfo?

        # The name or unique identifier that corresponds to a physical instance ID of a resource supported by
        # CloudFormation.

        @[JSON::Field(key: "PhysicalResourceId")]
        getter physical_resource_id : String?

        # Success/failure message associated with the resource.

        @[JSON::Field(key: "ResourceStatusReason")]
        getter resource_status_reason : String?

        # Unique identifier of the stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        # The name associated with the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        def initialize(
          @logical_resource_id : String,
          @resource_status : String,
          @resource_type : String,
          @timestamp : Time,
          @description : String? = nil,
          @drift_information : Types::StackResourceDriftInformation? = nil,
          @module_info : Types::ModuleInfo? = nil,
          @physical_resource_id : String? = nil,
          @resource_status_reason : String? = nil,
          @stack_id : String? = nil,
          @stack_name : String? = nil
        )
        end
      end

      # Contains detailed information about the specified stack resource.

      struct StackResourceDetail
        include JSON::Serializable

        # Time the status was updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time

        # The logical name of the resource specified in the template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String

        # Current status of the resource.

        @[JSON::Field(key: "ResourceStatus")]
        getter resource_status : String

        # Type of resource. For more information, see Amazon Web Services resource and property types
        # reference in the CloudFormation User Guide .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # User defined description associated with the resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information about whether the resource's actual configuration differs, or has drifted , from its
        # expected configuration, as defined in the stack template and any values specified as template
        # parameters. For more information, see Detect unmanaged configuration changes to stacks and resources
        # with drift detection .

        @[JSON::Field(key: "DriftInformation")]
        getter drift_information : Types::StackResourceDriftInformation?

        # The content of the Metadata attribute declared for the resource. For more information, see Metadata
        # attribute in the CloudFormation User Guide .

        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # Contains information about the module from which the resource was created, if the resource was
        # created from a module included in the stack template.

        @[JSON::Field(key: "ModuleInfo")]
        getter module_info : Types::ModuleInfo?

        # The name or unique identifier that corresponds to a physical instance ID of a resource supported by
        # CloudFormation.

        @[JSON::Field(key: "PhysicalResourceId")]
        getter physical_resource_id : String?

        # Success/failure message associated with the resource.

        @[JSON::Field(key: "ResourceStatusReason")]
        getter resource_status_reason : String?

        # Unique identifier of the stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        # The name associated with the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        def initialize(
          @last_updated_timestamp : Time,
          @logical_resource_id : String,
          @resource_status : String,
          @resource_type : String,
          @description : String? = nil,
          @drift_information : Types::StackResourceDriftInformation? = nil,
          @metadata : String? = nil,
          @module_info : Types::ModuleInfo? = nil,
          @physical_resource_id : String? = nil,
          @resource_status_reason : String? = nil,
          @stack_id : String? = nil,
          @stack_name : String? = nil
        )
        end
      end

      # Contains the drift information for a resource that has been checked for drift. This includes actual
      # and expected property values for resources in which CloudFormation has detected drift. Only resource
      # properties explicitly defined in the stack template are checked for drift. For more information, see
      # Detect unmanaged configuration changes to stacks and resources with drift detection . Resources that
      # don't currently support drift detection can't be checked. For a list of resources that support drift
      # detection, see Resource type support for imports and drift detection . Use DetectStackResourceDrift
      # to detect drift on individual resources, or DetectStackDrift to detect drift on all resources in a
      # given stack that support drift detection.

      struct StackResourceDrift
        include JSON::Serializable

        # The logical name of the resource specified in the template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String

        # The type of the resource.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The ID of the stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String

        # Status of the resource's actual configuration compared to its expected configuration. DELETED : The
        # resource differs from its expected template configuration because the resource has been deleted.
        # MODIFIED : One or more resource properties differ from their expected values (as defined in the
        # stack template and any values specified as template parameters). IN_SYNC : The resource's actual
        # configuration matches its expected template configuration. NOT_CHECKED : CloudFormation does not
        # currently return this value. UNKNOWN : CloudFormation could not run drift detection for the
        # resource. See the DriftStatusReason for details.

        @[JSON::Field(key: "StackResourceDriftStatus")]
        getter stack_resource_drift_status : String

        # Time at which CloudFormation performed drift detection on the stack resource.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        # A JSON structure that contains the actual property values of the stack resource. For resources whose
        # StackResourceDriftStatus is DELETED , this structure will not be present.

        @[JSON::Field(key: "ActualProperties")]
        getter actual_properties : String?

        # The reason for the drift status.

        @[JSON::Field(key: "DriftStatusReason")]
        getter drift_status_reason : String?

        # A JSON structure that contains the expected property values of the stack resource, as defined in the
        # stack template and any values specified as template parameters. For resources whose
        # StackResourceDriftStatus is DELETED , this structure will not be present.

        @[JSON::Field(key: "ExpectedProperties")]
        getter expected_properties : String?

        # Contains information about the module from which the resource was created, if the resource was
        # created from a module included in the stack template.

        @[JSON::Field(key: "ModuleInfo")]
        getter module_info : Types::ModuleInfo?

        # The name or unique identifier that corresponds to a physical instance ID of a resource supported by
        # CloudFormation.

        @[JSON::Field(key: "PhysicalResourceId")]
        getter physical_resource_id : String?

        # Context information that enables CloudFormation to uniquely identify a resource. CloudFormation uses
        # context key-value pairs in cases where a resource's logical and physical IDs aren't enough to
        # uniquely identify that resource. Each context key-value pair specifies a unique resource that
        # contains the targeted resource.

        @[JSON::Field(key: "PhysicalResourceIdContext")]
        getter physical_resource_id_context : Array(Types::PhysicalResourceIdContextKeyValuePair)?

        # A collection of the resource properties whose actual values differ from their expected values. These
        # will be present only for resources whose StackResourceDriftStatus is MODIFIED .

        @[JSON::Field(key: "PropertyDifferences")]
        getter property_differences : Array(Types::PropertyDifference)?

        def initialize(
          @logical_resource_id : String,
          @resource_type : String,
          @stack_id : String,
          @stack_resource_drift_status : String,
          @timestamp : Time,
          @actual_properties : String? = nil,
          @drift_status_reason : String? = nil,
          @expected_properties : String? = nil,
          @module_info : Types::ModuleInfo? = nil,
          @physical_resource_id : String? = nil,
          @physical_resource_id_context : Array(Types::PhysicalResourceIdContextKeyValuePair)? = nil,
          @property_differences : Array(Types::PropertyDifference)? = nil
        )
        end
      end

      # Contains information about whether the resource's actual configuration differs, or has drifted ,
      # from its expected configuration.

      struct StackResourceDriftInformation
        include JSON::Serializable

        # Status of the resource's actual configuration compared to its expected configuration DELETED : The
        # resource differs from its expected configuration in that it has been deleted. MODIFIED : The
        # resource differs from its expected configuration. NOT_CHECKED : CloudFormation has not checked if
        # the resource differs from its expected configuration. Any resources that do not currently support
        # drift detection have a status of NOT_CHECKED . For more information, see Resource type support for
        # imports and drift detection . IN_SYNC : The resource's actual configuration matches its expected
        # configuration.

        @[JSON::Field(key: "StackResourceDriftStatus")]
        getter stack_resource_drift_status : String

        # When CloudFormation last checked if the resource had drifted from its expected configuration.

        @[JSON::Field(key: "LastCheckTimestamp")]
        getter last_check_timestamp : Time?

        def initialize(
          @stack_resource_drift_status : String,
          @last_check_timestamp : Time? = nil
        )
        end
      end

      # Summarizes information about whether the resource's actual configuration differs, or has drifted ,
      # from its expected configuration.

      struct StackResourceDriftInformationSummary
        include JSON::Serializable

        # Status of the resource's actual configuration compared to its expected configuration. DELETED : The
        # resource differs from its expected configuration in that it has been deleted. MODIFIED : The
        # resource differs from its expected configuration. NOT_CHECKED : CloudFormation hasn't checked if the
        # resource differs from its expected configuration. Any resources that don't currently support drift
        # detection have a status of NOT_CHECKED . For more information, see Resource type support for imports
        # and drift detection . If you performed an ContinueUpdateRollback operation on a stack, any resources
        # included in ResourcesToSkip will also have a status of NOT_CHECKED . For more information about
        # skipping resources during rollback operations, see Continue rolling back an update in the
        # CloudFormation User Guide . IN_SYNC : The resource's actual configuration matches its expected
        # configuration.

        @[JSON::Field(key: "StackResourceDriftStatus")]
        getter stack_resource_drift_status : String

        # When CloudFormation last checked if the resource had drifted from its expected configuration.

        @[JSON::Field(key: "LastCheckTimestamp")]
        getter last_check_timestamp : Time?

        def initialize(
          @stack_resource_drift_status : String,
          @last_check_timestamp : Time? = nil
        )
        end
      end

      # Contains high-level information about the specified stack resource.

      struct StackResourceSummary
        include JSON::Serializable

        # Time the status was updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time

        # The logical name of the resource specified in the template.

        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String

        # Current status of the resource.

        @[JSON::Field(key: "ResourceStatus")]
        getter resource_status : String

        # Type of resource. (For more information, see Amazon Web Services resource and property types
        # reference in the CloudFormation User Guide .)

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Information about whether the resource's actual configuration differs, or has drifted , from its
        # expected configuration, as defined in the stack template and any values specified as template
        # parameters. For more information, see Detect unmanaged configuration changes to stacks and resources
        # with drift detection .

        @[JSON::Field(key: "DriftInformation")]
        getter drift_information : Types::StackResourceDriftInformationSummary?

        # Contains information about the module from which the resource was created, if the resource was
        # created from a module included in the stack template.

        @[JSON::Field(key: "ModuleInfo")]
        getter module_info : Types::ModuleInfo?

        # The name or unique identifier that corresponds to a physical instance ID of the resource.

        @[JSON::Field(key: "PhysicalResourceId")]
        getter physical_resource_id : String?

        # Success/failure message associated with the resource.

        @[JSON::Field(key: "ResourceStatusReason")]
        getter resource_status_reason : String?

        def initialize(
          @last_updated_timestamp : Time,
          @logical_resource_id : String,
          @resource_status : String,
          @resource_type : String,
          @drift_information : Types::StackResourceDriftInformationSummary? = nil,
          @module_info : Types::ModuleInfo? = nil,
          @physical_resource_id : String? = nil,
          @resource_status_reason : String? = nil
        )
        end
      end

      # A structure that contains information about a StackSet. With StackSets, you can provision stacks
      # across Amazon Web Services accounts and Regions from a single CloudFormation template. Each stack is
      # based on the same CloudFormation template, but you can customize individual stacks using parameters.

      struct StackSet
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role used to create or update the stack set. Use
        # customized administrator roles to control which users or groups can manage specific StackSets within
        # the same administrator account. For more information, see Prerequisites for using CloudFormation
        # StackSets in the CloudFormation User Guide .

        @[JSON::Field(key: "AdministrationRoleARN")]
        getter administration_role_arn : String?

        # Describes whether StackSets automatically deploys to Organizations accounts that are added to a
        # target organization or organizational unit (OU). Valid only if the StackSet uses service-managed
        # permissions.

        @[JSON::Field(key: "AutoDeployment")]
        getter auto_deployment : Types::AutoDeployment?

        # The capabilities that are allowed in the StackSet. Some StackSet templates might include resources
        # that can affect permissions in your Amazon Web Services account—for example, by creating new
        # Identity and Access Management (IAM) users. For more information, see Acknowledging IAM resources in
        # CloudFormation templates .

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)?

        # A description of the StackSet that you specify when the StackSet is created or updated.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the IAM execution role used to create or update the StackSet. Use customized execution
        # roles to control which stack resources users and groups can include in their StackSets.

        @[JSON::Field(key: "ExecutionRoleName")]
        getter execution_role_name : String?

        # Describes whether StackSets performs non-conflicting operations concurrently and queues conflicting
        # operations.

        @[JSON::Field(key: "ManagedExecution")]
        getter managed_execution : Types::ManagedExecution?

        # [Service-managed permissions] The organization root ID or organizational unit (OU) IDs that you
        # specified for DeploymentTargets .

        @[JSON::Field(key: "OrganizationalUnitIds")]
        getter organizational_unit_ids : Array(String)?

        # A list of input parameters for a StackSet.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # Describes how the IAM roles required for StackSet operations are created. With self-managed
        # permissions, you must create the administrator and execution roles required to deploy to target
        # accounts. For more information, see Grant self-managed permissions . With service-managed
        # permissions, StackSets automatically creates the IAM roles required to deploy to accounts managed by
        # Organizations. For more information, see Activate trusted access for StackSets with Organizations .

        @[JSON::Field(key: "PermissionModel")]
        getter permission_model : String?

        # Returns a list of all Amazon Web Services Regions the given StackSet has stack instances deployed
        # in. The Amazon Web Services Regions list output is in no particular order.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        # The Amazon Resource Name (ARN) of the StackSet.

        @[JSON::Field(key: "StackSetARN")]
        getter stack_set_arn : String?

        # Detailed information about the drift status of the StackSet. For StackSets, contains information
        # about the last completed drift operation performed on the StackSet. Information about drift
        # operations currently in progress isn't included.

        @[JSON::Field(key: "StackSetDriftDetectionDetails")]
        getter stack_set_drift_detection_details : Types::StackSetDriftDetectionDetails?

        # The ID of the StackSet.

        @[JSON::Field(key: "StackSetId")]
        getter stack_set_id : String?

        # The name that's associated with the StackSet.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String?

        # The status of the StackSet.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A list of tags that specify information about the StackSet. A maximum number of 50 tags can be
        # specified.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The structure that contains the body of the template that was used to create or update the StackSet.

        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        def initialize(
          @administration_role_arn : String? = nil,
          @auto_deployment : Types::AutoDeployment? = nil,
          @capabilities : Array(String)? = nil,
          @description : String? = nil,
          @execution_role_name : String? = nil,
          @managed_execution : Types::ManagedExecution? = nil,
          @organizational_unit_ids : Array(String)? = nil,
          @parameters : Array(Types::Parameter)? = nil,
          @permission_model : String? = nil,
          @regions : Array(String)? = nil,
          @stack_set_arn : String? = nil,
          @stack_set_drift_detection_details : Types::StackSetDriftDetectionDetails? = nil,
          @stack_set_id : String? = nil,
          @stack_set_name : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @template_body : String? = nil
        )
        end
      end

      # One of the targets for the StackSet. Returned by the ListStackSetAutoDeploymentTargets API
      # operation.

      struct StackSetAutoDeploymentTargetSummary
        include JSON::Serializable

        # The organization root ID or organizational unit (OU) IDs where the StackSet is targeted.

        @[JSON::Field(key: "OrganizationalUnitId")]
        getter organizational_unit_id : String?

        # The list of Regions targeted for this organization or OU.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        def initialize(
          @organizational_unit_id : String? = nil,
          @regions : Array(String)? = nil
        )
        end
      end

      # Detailed information about the drift status of the StackSet. For StackSets, contains information
      # about the last completed drift operation performed on the StackSet. Information about drift
      # operations in-progress isn't included. For StackSet operations, includes information about drift
      # operations currently being performed on the StackSet. For more information, see Performing drift
      # detection on CloudFormation StackSets in the CloudFormation User Guide .

      struct StackSetDriftDetectionDetails
        include JSON::Serializable

        # The status of the StackSet drift detection operation. COMPLETED : The drift detection operation
        # completed without failing on any stack instances. FAILED : The drift detection operation exceeded
        # the specified failure tolerance. PARTIAL_SUCCESS : The drift detection operation completed without
        # exceeding the failure tolerance for the operation. IN_PROGRESS : The drift detection operation is
        # currently being performed. STOPPED : The user has canceled the drift detection operation.

        @[JSON::Field(key: "DriftDetectionStatus")]
        getter drift_detection_status : String?

        # Status of the StackSet's actual configuration compared to its expected template and parameter
        # configuration. DRIFTED : One or more of the stack instances belonging to the StackSet differs from
        # the expected template and parameter configuration. A stack instance is considered to have drifted if
        # one or more of the resources in the associated stack have drifted. NOT_CHECKED : CloudFormation
        # hasn't checked the StackSet for drift. IN_SYNC : All of the stack instances belonging to the
        # StackSet stack match the expected template and parameter configuration.

        @[JSON::Field(key: "DriftStatus")]
        getter drift_status : String?

        # The number of stack instances that have drifted from the expected template and parameter
        # configuration of the StackSet. A stack instance is considered to have drifted if one or more of the
        # resources in the associated stack don't match their expected configuration.

        @[JSON::Field(key: "DriftedStackInstancesCount")]
        getter drifted_stack_instances_count : Int32?

        # The number of stack instances for which the drift detection operation failed.

        @[JSON::Field(key: "FailedStackInstancesCount")]
        getter failed_stack_instances_count : Int32?

        # The number of stack instances that are currently being checked for drift.

        @[JSON::Field(key: "InProgressStackInstancesCount")]
        getter in_progress_stack_instances_count : Int32?

        # The number of stack instances which match the expected template and parameter configuration of the
        # StackSet.

        @[JSON::Field(key: "InSyncStackInstancesCount")]
        getter in_sync_stack_instances_count : Int32?

        # Most recent time when CloudFormation performed a drift detection operation on the StackSet. This
        # value will be NULL for any StackSet that drift detection hasn't yet been performed on.

        @[JSON::Field(key: "LastDriftCheckTimestamp")]
        getter last_drift_check_timestamp : Time?

        # The total number of stack instances belonging to this StackSet. The total number of stack instances
        # is equal to the total of: Stack instances that match the StackSet configuration. Stack instances
        # that have drifted from the StackSet configuration. Stack instances where the drift detection
        # operation has failed. Stack instances currently being checked for drift.

        @[JSON::Field(key: "TotalStackInstancesCount")]
        getter total_stack_instances_count : Int32?

        def initialize(
          @drift_detection_status : String? = nil,
          @drift_status : String? = nil,
          @drifted_stack_instances_count : Int32? = nil,
          @failed_stack_instances_count : Int32? = nil,
          @in_progress_stack_instances_count : Int32? = nil,
          @in_sync_stack_instances_count : Int32? = nil,
          @last_drift_check_timestamp : Time? = nil,
          @total_stack_instances_count : Int32? = nil
        )
        end
      end

      # You can't yet delete this StackSet, because it still contains one or more stack instances. Delete
      # all stack instances from the StackSet before deleting the StackSet.

      struct StackSetNotEmptyException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified StackSet doesn't exist.

      struct StackSetNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The structure that contains information about a StackSet operation.

      struct StackSetOperation
        include JSON::Serializable

        # The type of StackSet operation: CREATE , UPDATE , or DELETE . Create and delete operations affect
        # only the specified stack instances that are associated with the specified StackSet. Update
        # operations affect both the StackSet itself, in addition to all associated stack instances.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The Amazon Resource Name (ARN) of the IAM role used to perform this StackSet operation. Use
        # customized administrator roles to control which users or groups can manage specific StackSets within
        # the same administrator account. For more information, see Grant self-managed permissions in the
        # CloudFormation User Guide .

        @[JSON::Field(key: "AdministrationRoleARN")]
        getter administration_role_arn : String?

        # The time at which the operation was initiated. Note that the creation times for the stack set
        # operation might differ from the creation time of the individual stacks themselves. This is because
        # CloudFormation needs to perform preparatory work for the operation, such as dispatching the work to
        # the requested Regions, before actually creating the first stacks.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : Time?

        # The Organizations accounts affected by the stack operation. Valid only if the StackSet uses
        # service-managed permissions.

        @[JSON::Field(key: "DeploymentTargets")]
        getter deployment_targets : Types::DeploymentTargets?

        # The time at which the StackSet operation ended, across all accounts and Regions specified. Note that
        # this doesn't necessarily mean that the StackSet operation was successful, or even attempted, in each
        # account or Region.

        @[JSON::Field(key: "EndTimestamp")]
        getter end_timestamp : Time?

        # The name of the IAM execution role used to create or update the StackSet. Use customized execution
        # roles to control which stack resources users and groups can include in their StackSets.

        @[JSON::Field(key: "ExecutionRoleName")]
        getter execution_role_name : String?

        # The unique ID of a StackSet operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # The preferences for how CloudFormation performs this StackSet operation.

        @[JSON::Field(key: "OperationPreferences")]
        getter operation_preferences : Types::StackSetOperationPreferences?

        # For StackSet operations of action type DELETE , specifies whether to remove the stack instances from
        # the specified StackSet, but doesn't delete the stacks. You can't re-associate a retained stack, or
        # add an existing, saved stack to a new StackSet.

        @[JSON::Field(key: "RetainStacks")]
        getter retain_stacks : Bool?

        # Detailed information about the drift status of the StackSet. This includes information about drift
        # operations currently being performed on the StackSet. This information will only be present for
        # StackSet operations whose Action type is DETECT_DRIFT . For more information, see Performing drift
        # detection on CloudFormation StackSets in the CloudFormation User Guide .

        @[JSON::Field(key: "StackSetDriftDetectionDetails")]
        getter stack_set_drift_detection_details : Types::StackSetDriftDetectionDetails?

        # The ID of the StackSet.

        @[JSON::Field(key: "StackSetId")]
        getter stack_set_id : String?

        # The status of the operation. FAILED : The operation exceeded the specified failure tolerance. The
        # failure tolerance value that you've set for an operation is applied for each Region during stack
        # create and update operations. If the number of failed stacks within a Region exceeds the failure
        # tolerance, the status of the operation in the Region is set to FAILED . This in turn sets the status
        # of the operation as a whole to FAILED , and CloudFormation cancels the operation in any remaining
        # Regions. QUEUED : [Service-managed permissions] For automatic deployments that require a sequence of
        # operations, the operation is queued to be performed. For more information, see the StackSets status
        # codes in the CloudFormation User Guide . RUNNING : The operation is currently being performed.
        # STOPPED : The user has canceled the operation. STOPPING : The operation is in the process of
        # stopping, at user request. SUCCEEDED : The operation completed creating or updating all the
        # specified stacks without exceeding the failure tolerance for the operation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Detailed information about the StackSet operation.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : Types::StackSetOperationStatusDetails?

        # The status of the operation in details.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @action : String? = nil,
          @administration_role_arn : String? = nil,
          @creation_timestamp : Time? = nil,
          @deployment_targets : Types::DeploymentTargets? = nil,
          @end_timestamp : Time? = nil,
          @execution_role_name : String? = nil,
          @operation_id : String? = nil,
          @operation_preferences : Types::StackSetOperationPreferences? = nil,
          @retain_stacks : Bool? = nil,
          @stack_set_drift_detection_details : Types::StackSetDriftDetectionDetails? = nil,
          @stack_set_id : String? = nil,
          @status : String? = nil,
          @status_details : Types::StackSetOperationStatusDetails? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The user-specified preferences for how CloudFormation performs a StackSet operation. For more
      # information about maximum concurrent accounts and failure tolerance, see StackSet operation options
      # . StackSetOperationPreferences don't apply to AutoDeployment , even if it's enabled.

      struct StackSetOperationPreferences
        include JSON::Serializable

        # Specifies how the concurrency level behaves during the operation execution. STRICT_FAILURE_TOLERANCE
        # : This option dynamically lowers the concurrency level to ensure the number of failed accounts never
        # exceeds the value of FailureToleranceCount +1. The initial actual concurrency is set to the lower of
        # either the value of the MaxConcurrentCount , or the value of FailureToleranceCount +1. The actual
        # concurrency is then reduced proportionally by the number of failures. This is the default behavior.
        # If failure tolerance or Maximum concurrent accounts are set to percentages, the behavior is similar.
        # SOFT_FAILURE_TOLERANCE : This option decouples FailureToleranceCount from the actual concurrency.
        # This allows StackSet operations to run at the concurrency level set by the MaxConcurrentCount value,
        # or MaxConcurrentPercentage , regardless of the number of failures.

        @[JSON::Field(key: "ConcurrencyMode")]
        getter concurrency_mode : String?

        # The number of accounts per Region this operation can fail in before CloudFormation stops the
        # operation in that Region. If the operation is stopped in a Region, CloudFormation doesn't attempt
        # the operation in any subsequent Regions. You can specify either FailureToleranceCount or
        # FailureTolerancePercentage , but not both. By default, 0 is specified.

        @[JSON::Field(key: "FailureToleranceCount")]
        getter failure_tolerance_count : Int32?

        # The percentage of accounts per Region this stack operation can fail in before CloudFormation stops
        # the operation in that Region. If the operation is stopped in a Region, CloudFormation doesn't
        # attempt the operation in any subsequent Regions. When calculating the number of accounts based on
        # the specified percentage, CloudFormation rounds down to the next whole number. You can specify
        # either FailureToleranceCount or FailureTolerancePercentage , but not both. By default, 0 is
        # specified.

        @[JSON::Field(key: "FailureTolerancePercentage")]
        getter failure_tolerance_percentage : Int32?

        # The maximum number of accounts in which to perform this operation at one time. This can depend on
        # the value of FailureToleranceCount depending on your ConcurrencyMode . MaxConcurrentCount is at most
        # one more than the FailureToleranceCount if you're using STRICT_FAILURE_TOLERANCE . Note that this
        # setting lets you specify the maximum for operations. For large deployments, under certain
        # circumstances the actual number of accounts acted upon concurrently may be lower due to service
        # throttling. You can specify either MaxConcurrentCount or MaxConcurrentPercentage , but not both. By
        # default, 1 is specified.

        @[JSON::Field(key: "MaxConcurrentCount")]
        getter max_concurrent_count : Int32?

        # The maximum percentage of accounts in which to perform this operation at one time. When calculating
        # the number of accounts based on the specified percentage, CloudFormation rounds down to the next
        # whole number. This is true except in cases where rounding down would result is zero. In this case,
        # CloudFormation sets the number as one instead. Note that this setting lets you specify the maximum
        # for operations. For large deployments, under certain circumstances the actual number of accounts
        # acted upon concurrently may be lower due to service throttling. You can specify either
        # MaxConcurrentCount or MaxConcurrentPercentage , but not both. By default, 1 is specified.

        @[JSON::Field(key: "MaxConcurrentPercentage")]
        getter max_concurrent_percentage : Int32?

        # The concurrency type of deploying StackSets operations in Regions, could be in parallel or one
        # Region at a time.

        @[JSON::Field(key: "RegionConcurrencyType")]
        getter region_concurrency_type : String?

        # The order of the Regions where you want to perform the stack operation.

        @[JSON::Field(key: "RegionOrder")]
        getter region_order : Array(String)?

        def initialize(
          @concurrency_mode : String? = nil,
          @failure_tolerance_count : Int32? = nil,
          @failure_tolerance_percentage : Int32? = nil,
          @max_concurrent_count : Int32? = nil,
          @max_concurrent_percentage : Int32? = nil,
          @region_concurrency_type : String? = nil,
          @region_order : Array(String)? = nil
        )
        end
      end

      # The structure that contains information about a specified operation's results for a given account in
      # a given Region.

      struct StackSetOperationResultSummary
        include JSON::Serializable

        # [Self-managed permissions] The name of the Amazon Web Services account for this operation result.

        @[JSON::Field(key: "Account")]
        getter account : String?

        # The results of the account gate function CloudFormation invokes, if present, before proceeding with
        # StackSet operations in an account.

        @[JSON::Field(key: "AccountGateResult")]
        getter account_gate_result : Types::AccountGateResult?

        # [Service-managed permissions] The organization root ID or organizational unit (OU) IDs that you
        # specified for DeploymentTargets .

        @[JSON::Field(key: "OrganizationalUnitId")]
        getter organizational_unit_id : String?

        # The name of the Amazon Web Services Region for this operation result.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The result status of the StackSet operation for the given account in the given Region. CANCELLED :
        # The operation in the specified account and Region has been canceled. This is either because a user
        # has stopped the StackSet operation, or because the failure tolerance of the StackSet operation has
        # been exceeded. FAILED : The operation in the specified account and Region failed. If the StackSet
        # operation fails in enough accounts within a Region, the failure tolerance for the StackSet operation
        # as a whole might be exceeded. RUNNING : The operation in the specified account and Region is
        # currently in progress. PENDING : The operation in the specified account and Region has yet to start.
        # SUCCEEDED : The operation in the specified account and Region completed successfully.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason for the assigned result status.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @account : String? = nil,
          @account_gate_result : Types::AccountGateResult? = nil,
          @organizational_unit_id : String? = nil,
          @region : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Detailed information about the StackSet operation.

      struct StackSetOperationStatusDetails
        include JSON::Serializable

        # The number of stack instances for which the StackSet operation failed.

        @[JSON::Field(key: "FailedStackInstancesCount")]
        getter failed_stack_instances_count : Int32?

        def initialize(
          @failed_stack_instances_count : Int32? = nil
        )
        end
      end

      # The structures that contain summary information about the specified operation.

      struct StackSetOperationSummary
        include JSON::Serializable

        # The type of operation: CREATE , UPDATE , or DELETE . Create and delete operations affect only the
        # specified stack instances that are associated with the specified StackSet. Update operations affect
        # both the StackSet itself and all associated StackSet instances.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The time at which the operation was initiated. Note that the creation times for the StackSet
        # operation might differ from the creation time of the individual stacks themselves. This is because
        # CloudFormation needs to perform preparatory work for the operation, such as dispatching the work to
        # the requested Regions, before actually creating the first stacks.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : Time?

        # The time at which the StackSet operation ended, across all accounts and Regions specified. Note that
        # this doesn't necessarily mean that the StackSet operation was successful, or even attempted, in each
        # account or Region.

        @[JSON::Field(key: "EndTimestamp")]
        getter end_timestamp : Time?

        # The unique ID of the StackSet operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # The user-specified preferences for how CloudFormation performs a StackSet operation. For more
        # information about maximum concurrent accounts and failure tolerance, see StackSet operation options
        # .

        @[JSON::Field(key: "OperationPreferences")]
        getter operation_preferences : Types::StackSetOperationPreferences?

        # The overall status of the operation. FAILED : The operation exceeded the specified failure
        # tolerance. The failure tolerance value that you've set for an operation is applied for each Region
        # during stack create and update operations. If the number of failed stacks within a Region exceeds
        # the failure tolerance, the status of the operation in the Region is set to FAILED . This in turn
        # sets the status of the operation as a whole to FAILED , and CloudFormation cancels the operation in
        # any remaining Regions. QUEUED : [Service-managed permissions] For automatic deployments that require
        # a sequence of operations, the operation is queued to be performed. For more information, see the
        # StackSet status codes in the CloudFormation User Guide . RUNNING : The operation is currently being
        # performed. STOPPED : The user has canceled the operation. STOPPING : The operation is in the process
        # of stopping, at user request. SUCCEEDED : The operation completed creating or updating all the
        # specified stacks without exceeding the failure tolerance for the operation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Detailed information about the StackSet operation.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : Types::StackSetOperationStatusDetails?

        # The status of the operation in details.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @action : String? = nil,
          @creation_timestamp : Time? = nil,
          @end_timestamp : Time? = nil,
          @operation_id : String? = nil,
          @operation_preferences : Types::StackSetOperationPreferences? = nil,
          @status : String? = nil,
          @status_details : Types::StackSetOperationStatusDetails? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The structures that contain summary information about the specified StackSet.

      struct StackSetSummary
        include JSON::Serializable

        # [Service-managed permissions] Describes whether StackSets automatically deploys to Organizations
        # accounts that are added to a target organizational unit (OU).

        @[JSON::Field(key: "AutoDeployment")]
        getter auto_deployment : Types::AutoDeployment?

        # A description of the StackSet that you specify when the StackSet is created or updated.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Status of the StackSet's actual configuration compared to its expected template and parameter
        # configuration. DRIFTED : One or more of the stack instances belonging to the StackSet differs from
        # the expected template and parameter configuration. A stack instance is considered to have drifted if
        # one or more of the resources in the associated stack have drifted. NOT_CHECKED : CloudFormation
        # hasn't checked the StackSet for drift. IN_SYNC : All the stack instances belonging to the StackSet
        # match the expected template and parameter configuration. UNKNOWN : This value is reserved for future
        # use.

        @[JSON::Field(key: "DriftStatus")]
        getter drift_status : String?

        # Most recent time when CloudFormation performed a drift detection operation on the StackSet. This
        # value will be NULL for any StackSet that drift detection hasn't yet been performed on.

        @[JSON::Field(key: "LastDriftCheckTimestamp")]
        getter last_drift_check_timestamp : Time?

        # Describes whether StackSets performs non-conflicting operations concurrently and queues conflicting
        # operations.

        @[JSON::Field(key: "ManagedExecution")]
        getter managed_execution : Types::ManagedExecution?

        # Describes how the IAM roles required for StackSet operations are created. With self-managed
        # permissions, you must create the administrator and execution roles required to deploy to target
        # accounts. For more information, see Grant self-managed permissions . With service-managed
        # permissions, StackSets automatically creates the IAM roles required to deploy to accounts managed by
        # Organizations. For more information, see Activate trusted access for StackSets with Organizations .

        @[JSON::Field(key: "PermissionModel")]
        getter permission_model : String?

        # The ID of the StackSet.

        @[JSON::Field(key: "StackSetId")]
        getter stack_set_id : String?

        # The name of the StackSet.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String?

        # The status of the StackSet.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @auto_deployment : Types::AutoDeployment? = nil,
          @description : String? = nil,
          @drift_status : String? = nil,
          @last_drift_check_timestamp : Time? = nil,
          @managed_execution : Types::ManagedExecution? = nil,
          @permission_model : String? = nil,
          @stack_set_id : String? = nil,
          @stack_set_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The StackSummary Data Type

      struct StackSummary
        include JSON::Serializable

        # The time the stack was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The name associated with the stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # The current status of the stack.

        @[JSON::Field(key: "StackStatus")]
        getter stack_status : String

        # The time the stack was deleted.

        @[JSON::Field(key: "DeletionTime")]
        getter deletion_time : Time?

        # Summarizes information about whether a stack's actual configuration differs, or has drifted , from
        # its expected configuration, as defined in the stack template and any values specified as template
        # parameters. For more information, see Detect unmanaged configuration changes to stacks and resources
        # with drift detection .

        @[JSON::Field(key: "DriftInformation")]
        getter drift_information : Types::StackDriftInformationSummary?

        # Information about the most recent operations performed on this stack.

        @[JSON::Field(key: "LastOperations")]
        getter last_operations : Array(Types::OperationEntry)?

        # The time the stack was last updated. This field will only be returned if the stack has been updated
        # at least once.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # For nested stacks, the stack ID of the direct parent of this stack. For the first level of nested
        # stacks, the root stack is also the parent stack. For more information, see Nested stacks in the
        # CloudFormation User Guide .

        @[JSON::Field(key: "ParentId")]
        getter parent_id : String?

        # For nested stacks, the stack ID of the top-level stack to which the nested stack ultimately belongs.
        # For more information, see Nested stacks in the CloudFormation User Guide .

        @[JSON::Field(key: "RootId")]
        getter root_id : String?

        # Unique stack identifier.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        # Success/Failure message associated with the stack status.

        @[JSON::Field(key: "StackStatusReason")]
        getter stack_status_reason : String?

        # The template description of the template used to create the stack.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        def initialize(
          @creation_time : Time,
          @stack_name : String,
          @stack_status : String,
          @deletion_time : Time? = nil,
          @drift_information : Types::StackDriftInformationSummary? = nil,
          @last_operations : Array(Types::OperationEntry)? = nil,
          @last_updated_time : Time? = nil,
          @parent_id : String? = nil,
          @root_id : String? = nil,
          @stack_id : String? = nil,
          @stack_status_reason : String? = nil,
          @template_description : String? = nil
        )
        end
      end

      # Another operation has been performed on this StackSet since the specified operation was performed.

      struct StaleRequestException
        include JSON::Serializable

        def initialize
        end
      end


      struct StartResourceScanInput
        include JSON::Serializable

        # A unique identifier for this StartResourceScan request. Specify this token if you plan to retry
        # requests so that CloudFormation knows that you're not attempting to start a new resource scan.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The scan filters to use.

        @[JSON::Field(key: "ScanFilters")]
        getter scan_filters : Array(Types::ScanFilter)?

        def initialize(
          @client_request_token : String? = nil,
          @scan_filters : Array(Types::ScanFilter)? = nil
        )
        end
      end


      struct StartResourceScanOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource scan. The format is
        # arn:${Partition}:cloudformation:${Region}:${Account}:resourceScan/${Id} . An example is
        # arn:aws:cloudformation: us-east-1 : 123456789012 :resourceScan/ f5b490f7-7ed4-428a-aa06-31ff25db0772
        # .

        @[JSON::Field(key: "ResourceScanId")]
        getter resource_scan_id : String?

        def initialize(
          @resource_scan_id : String? = nil
        )
        end
      end


      struct StopStackSetOperationInput
        include JSON::Serializable

        # The ID of the stack operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        # The name or unique ID of the StackSet that you want to stop the operation for.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # Specifies whether you are acting as an account administrator in the organization's management
        # account or as a delegated administrator in a member account. Valid only if the StackSet uses
        # service-managed permissions. By default, SELF is specified. Use SELF for StackSets with self-managed
        # permissions. If you are signed in to the management account, specify SELF . If you are signed in to
        # a delegated administrator account, specify DELEGATED_ADMIN . Your Amazon Web Services account must
        # be registered as a delegated administrator in the management account. For more information, see
        # Register a delegated administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        def initialize(
          @operation_id : String,
          @stack_set_name : String,
          @call_as : String? = nil
        )
        end
      end


      struct StopStackSetOperationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The Tag type enables you to specify a key-value pair that can be used to store information about an
      # CloudFormation stack.

      struct Tag
        include JSON::Serializable

        # A string used to identify this tag. You can specify a maximum of 128 characters for a tag key. Tags
        # owned by Amazon Web Services have the reserved prefix: aws: .

        @[JSON::Field(key: "Key")]
        getter key : String

        # A string that contains the value for this tag. You can specify a maximum of 256 characters for a tag
        # value.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # The configuration details of a generated template.

      struct TemplateConfiguration
        include JSON::Serializable

        # The DeletionPolicy assigned to resources in the generated template. Supported values are: DELETE -
        # delete all resources when the stack is deleted. RETAIN - retain all resources when the stack is
        # deleted. For more information, see DeletionPolicy attribute in the CloudFormation User Guide .

        @[JSON::Field(key: "DeletionPolicy")]
        getter deletion_policy : String?

        # The UpdateReplacePolicy assigned to resources in the generated template. Supported values are:
        # DELETE - delete all resources when the resource is replaced during an update operation. RETAIN -
        # retain all resources when the resource is replaced during an update operation. For more information,
        # see UpdateReplacePolicy attribute in the CloudFormation User Guide .

        @[JSON::Field(key: "UpdateReplacePolicy")]
        getter update_replace_policy : String?

        def initialize(
          @deletion_policy : String? = nil,
          @update_replace_policy : String? = nil
        )
        end
      end

      # The TemplateParameter data type.

      struct TemplateParameter
        include JSON::Serializable

        # The default value associated with the parameter.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # User defined description associated with the parameter.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Flag indicating whether the parameter should be displayed as plain text in logs and UIs.

        @[JSON::Field(key: "NoEcho")]
        getter no_echo : Bool?

        # The name associated with the parameter.

        @[JSON::Field(key: "ParameterKey")]
        getter parameter_key : String?

        def initialize(
          @default_value : String? = nil,
          @description : String? = nil,
          @no_echo : Bool? = nil,
          @parameter_key : String? = nil
        )
        end
      end

      # A summary of the progress of the template generation.

      struct TemplateProgress
        include JSON::Serializable

        # The number of resources that failed the template generation.

        @[JSON::Field(key: "ResourcesFailed")]
        getter resources_failed : Int32?

        # The number of resources that are still pending the template generation.

        @[JSON::Field(key: "ResourcesPending")]
        getter resources_pending : Int32?

        # The number of resources that are in-process for the template generation.

        @[JSON::Field(key: "ResourcesProcessing")]
        getter resources_processing : Int32?

        # The number of resources that succeeded the template generation.

        @[JSON::Field(key: "ResourcesSucceeded")]
        getter resources_succeeded : Int32?

        def initialize(
          @resources_failed : Int32? = nil,
          @resources_pending : Int32? = nil,
          @resources_processing : Int32? = nil,
          @resources_succeeded : Int32? = nil
        )
        end
      end

      # The summary of a generated template.

      struct TemplateSummary
        include JSON::Serializable

        # The time the generated template was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the generated template. The format is
        # arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id} . For example,
        # arn:aws:cloudformation: us-east-1 : 123456789012 :generatedtemplate/
        # 2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc .

        @[JSON::Field(key: "GeneratedTemplateId")]
        getter generated_template_id : String?

        # The name of the generated template.

        @[JSON::Field(key: "GeneratedTemplateName")]
        getter generated_template_name : String?

        # The time the generated template was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The number of resources in the generated template. This is a total of resources in pending,
        # in-progress, completed, and failed states.

        @[JSON::Field(key: "NumberOfResources")]
        getter number_of_resources : Int32?

        # The status of the template generation. Supported values are: CreatePending - the creation of the
        # template is pending. CreateInProgress - the creation of the template is in progress. DeletePending -
        # the deletion of the template is pending. DeleteInProgress - the deletion of the template is in
        # progress. UpdatePending - the update of the template is pending. UpdateInProgress - the update of
        # the template is in progress. Failed - the template operation failed. Complete - the template
        # operation is complete.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason for the current template generation status. This will provide more details if a failure
        # happened.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @creation_time : Time? = nil,
          @generated_template_id : String? = nil,
          @generated_template_name : String? = nil,
          @last_updated_time : Time? = nil,
          @number_of_resources : Int32? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Options for the GetTemplateSummary API action.

      struct TemplateSummaryConfig
        include JSON::Serializable

        # If set to True , any unrecognized resource types generate warnings and not an error. Any
        # unrecognized resource types are returned in the Warnings output parameter.

        @[JSON::Field(key: "TreatUnrecognizedResourceTypesAsWarnings")]
        getter treat_unrecognized_resource_types_as_warnings : Bool?

        def initialize(
          @treat_unrecognized_resource_types_as_warnings : Bool? = nil
        )
        end
      end


      struct TestTypeInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the extension. Conditional: You must specify Arn , or TypeName and
        # Type .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The S3 bucket to which CloudFormation delivers the contract test execution logs. CloudFormation
        # delivers the logs by the time contract testing has completed and the extension has been assigned a
        # test type status of PASSED or FAILED . The user calling TestType must be able to access items in the
        # specified S3 bucket. Specifically, the user needs the following permissions: GetObject PutObject For
        # more information, see Actions, Resources, and Condition Keys for Amazon S3 in the Identity and
        # Access Management User Guide .

        @[JSON::Field(key: "LogDeliveryBucket")]
        getter log_delivery_bucket : String?

        # The type of the extension to test. Conditional: You must specify Arn , or TypeName and Type .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The name of the extension to test. Conditional: You must specify Arn , or TypeName and Type .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # The version of the extension to test. You can specify the version id with either Arn , or with
        # TypeName and Type . If you don't specify a version, CloudFormation uses the default version of the
        # extension in this account and Region for testing.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @arn : String? = nil,
          @log_delivery_bucket : String? = nil,
          @type : String? = nil,
          @type_name : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct TestTypeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the extension.

        @[JSON::Field(key: "TypeVersionArn")]
        getter type_version_arn : String?

        def initialize(
          @type_version_arn : String? = nil
        )
        end
      end

      # A client request token already exists.

      struct TokenAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # Detailed information concerning the specification of a CloudFormation extension in a given account
      # and Region. For more information, see Edit configuration data for extensions in your account in the
      # CloudFormation User Guide .

      struct TypeConfigurationDetails
        include JSON::Serializable

        # The alias specified for this configuration, if one was specified when the configuration was set.

        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # The ARN for the configuration data, in this account and Region.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A JSON string specifying the configuration data for the extension, in this account and Region. If a
        # configuration hasn't been set for a specified extension, CloudFormation returns {} .

        @[JSON::Field(key: "Configuration")]
        getter configuration : String?

        # Whether this configuration data is the default configuration for the extension.

        @[JSON::Field(key: "IsDefaultConfiguration")]
        getter is_default_configuration : Bool?

        # When the configuration data was last updated for this extension. If a configuration hasn't been set
        # for a specified extension, CloudFormation returns null .

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : Time?

        # The ARN for the extension, in this account and Region. For public extensions, this will be the ARN
        # assigned when you call the ActivateType API operation in this account and Region. For private
        # extensions, this will be the ARN assigned when you call the RegisterType API operation in this
        # account and Region.

        @[JSON::Field(key: "TypeArn")]
        getter type_arn : String?

        # The name of the extension.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @alias : String? = nil,
          @arn : String? = nil,
          @configuration : String? = nil,
          @is_default_configuration : Bool? = nil,
          @last_updated : Time? = nil,
          @type_arn : String? = nil,
          @type_name : String? = nil
        )
        end
      end

      # Identifying information for the configuration of a CloudFormation extension.

      struct TypeConfigurationIdentifier
        include JSON::Serializable

        # The type of extension.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The ARN for the extension, in this account and Region. For public extensions, this will be the ARN
        # assigned when you call the ActivateType API operation in this account and Region. For private
        # extensions, this will be the ARN assigned when you call the RegisterType API operation in this
        # account and Region.

        @[JSON::Field(key: "TypeArn")]
        getter type_arn : String?

        # The alias specified for this configuration, if one was specified when the configuration was set.

        @[JSON::Field(key: "TypeConfigurationAlias")]
        getter type_configuration_alias : String?

        # The ARN for the configuration, in this account and Region.

        @[JSON::Field(key: "TypeConfigurationArn")]
        getter type_configuration_arn : String?

        # The name of the extension type to which this configuration applies.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @type : String? = nil,
          @type_arn : String? = nil,
          @type_configuration_alias : String? = nil,
          @type_configuration_arn : String? = nil,
          @type_name : String? = nil
        )
        end
      end

      # The specified extension configuration can't be found.

      struct TypeConfigurationNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Filter criteria to use in determining which extensions to return.

      struct TypeFilters
        include JSON::Serializable

        # The category of extensions to return. REGISTERED : Private extensions that have been registered for
        # this account and Region. ACTIVATED : Public extensions that have been activated for this account and
        # Region. THIRD_PARTY : Extensions available for use from publishers other than Amazon. This includes:
        # Private extensions registered in the account. Public extensions from publishers other than Amazon,
        # whether activated or not. AWS_TYPES : Extensions available for use from Amazon.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The id of the publisher of the extension. Extensions published by Amazon aren't assigned a publisher
        # ID. Use the AWS_TYPES category to specify a list of types published by Amazon.

        @[JSON::Field(key: "PublisherId")]
        getter publisher_id : String?

        # A prefix to use as a filter for results.

        @[JSON::Field(key: "TypeNamePrefix")]
        getter type_name_prefix : String?

        def initialize(
          @category : String? = nil,
          @publisher_id : String? = nil,
          @type_name_prefix : String? = nil
        )
        end
      end

      # The specified extension doesn't exist in the CloudFormation registry.

      struct TypeNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains summary information about the specified CloudFormation extension.

      struct TypeSummary
        include JSON::Serializable

        # The ID of the default version of the extension. The default version is used when the extension
        # version isn't specified. This applies only to private extensions you have registered in your
        # account. For public extensions, both those provided by Amazon and published by third parties,
        # CloudFormation returns null . For more information, see RegisterType . To set the default version of
        # an extension, use SetTypeDefaultVersion .

        @[JSON::Field(key: "DefaultVersionId")]
        getter default_version_id : String?

        # The description of the extension.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Whether the extension is activated for this account and Region. This applies only to third-party
        # public extensions. Extensions published by Amazon are activated by default.

        @[JSON::Field(key: "IsActivated")]
        getter is_activated : Bool?

        # When the specified extension version was registered. This applies only to: Private extensions you
        # have registered in your account. For more information, see RegisterType . Public extensions you have
        # activated in your account with auto-update specified. For more information, see ActivateType . For
        # all other extension types, CloudFormation returns null .

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : Time?

        # For public extensions that have been activated for this account and Region, the latest version of
        # the public extension that is available . For any extensions other than activated third-party
        # extensions, CloudFormation returns null . How you specified AutoUpdate when enabling the extension
        # affects whether CloudFormation automatically updates the extension in this account and Region when a
        # new version is released. For more information, see Automatically use new versions of extensions in
        # the CloudFormation User Guide .

        @[JSON::Field(key: "LatestPublicVersion")]
        getter latest_public_version : String?

        # For public extensions that have been activated for this account and Region, the type name of the
        # public extension. If you specified a TypeNameAlias when enabling the extension in this account and
        # Region, CloudFormation treats that alias as the extension's type name within the account and Region,
        # not the type name of the public extension. For more information, see Use aliases to refer to
        # extensions in the CloudFormation User Guide .

        @[JSON::Field(key: "OriginalTypeName")]
        getter original_type_name : String?

        # For public extensions that have been activated for this account and Region, the version of the
        # public extension to be used for CloudFormation operations in this account and Region. How you
        # specified AutoUpdate when enabling the extension affects whether CloudFormation automatically
        # updates the extension in this account and Region when a new version is released. For more
        # information, see Automatically use new versions of extensions in the CloudFormation User Guide .

        @[JSON::Field(key: "PublicVersionNumber")]
        getter public_version_number : String?

        # The ID of the extension publisher, if the extension is published by a third party. Extensions
        # published by Amazon don't return a publisher ID.

        @[JSON::Field(key: "PublisherId")]
        getter publisher_id : String?

        # The service used to verify the publisher identity. For more information, see Publishing extensions
        # to make them available for public use in the CloudFormation Command Line Interface (CLI) User Guide
        # .

        @[JSON::Field(key: "PublisherIdentity")]
        getter publisher_identity : String?

        # The publisher name, as defined in the public profile for that publisher in the service used to
        # verify the publisher identity.

        @[JSON::Field(key: "PublisherName")]
        getter publisher_name : String?

        # The kind of extension.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The ARN of the extension.

        @[JSON::Field(key: "TypeArn")]
        getter type_arn : String?

        # The name of the extension. If you specified a TypeNameAlias when you call the ActivateType API
        # operation in your account and Region, CloudFormation considers that alias as the type name.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @default_version_id : String? = nil,
          @description : String? = nil,
          @is_activated : Bool? = nil,
          @last_updated : Time? = nil,
          @latest_public_version : String? = nil,
          @original_type_name : String? = nil,
          @public_version_number : String? = nil,
          @publisher_id : String? = nil,
          @publisher_identity : String? = nil,
          @publisher_name : String? = nil,
          @type : String? = nil,
          @type_arn : String? = nil,
          @type_name : String? = nil
        )
        end
      end

      # Contains summary information about a specific version of a CloudFormation extension.

      struct TypeVersionSummary
        include JSON::Serializable

        # The ARN of the extension version.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The description of the extension version.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Whether the specified extension version is set as the default version. This applies only to private
        # extensions you have registered in your account, and extensions published by Amazon. For public
        # third-party extensions, CloudFormation returns null .

        @[JSON::Field(key: "IsDefaultVersion")]
        getter is_default_version : Bool?

        # For public extensions that have been activated for this account and Region, the version of the
        # public extension to be used for CloudFormation operations in this account and Region. For any
        # extensions other than activated third-party extensions, CloudFormation returns null . How you
        # specified AutoUpdate when enabling the extension affects whether CloudFormation automatically
        # updates the extension in this account and Region when a new version is released. For more
        # information, see Automatically use new versions of extensions in the CloudFormation User Guide .

        @[JSON::Field(key: "PublicVersionNumber")]
        getter public_version_number : String?

        # When the version was registered.

        @[JSON::Field(key: "TimeCreated")]
        getter time_created : Time?

        # The kind of extension.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The name of the extension.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # The ID of a specific version of the extension. The version ID is the value at the end of the ARN
        # assigned to the extension version when it's registered.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @is_default_version : Bool? = nil,
          @public_version_number : String? = nil,
          @time_created : Time? = nil,
          @type : String? = nil,
          @type_name : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct UpdateGeneratedTemplateInput
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of a generated template.

        @[JSON::Field(key: "GeneratedTemplateName")]
        getter generated_template_name : String

        # An optional list of resources to be added to the generated template.

        @[JSON::Field(key: "AddResources")]
        getter add_resources : Array(Types::ResourceDefinition)?

        # An optional new name to assign to the generated template.

        @[JSON::Field(key: "NewGeneratedTemplateName")]
        getter new_generated_template_name : String?

        # If true , update the resource properties in the generated template with their current live state.
        # This feature is useful when the resource properties in your generated a template does not reflect
        # the live state of the resource properties. This happens when a user update the resource properties
        # after generating a template.

        @[JSON::Field(key: "RefreshAllResources")]
        getter refresh_all_resources : Bool?

        # A list of logical ids for resources to remove from the generated template.

        @[JSON::Field(key: "RemoveResources")]
        getter remove_resources : Array(String)?

        # The configuration details of the generated template, including the DeletionPolicy and
        # UpdateReplacePolicy .

        @[JSON::Field(key: "TemplateConfiguration")]
        getter template_configuration : Types::TemplateConfiguration?

        def initialize(
          @generated_template_name : String,
          @add_resources : Array(Types::ResourceDefinition)? = nil,
          @new_generated_template_name : String? = nil,
          @refresh_all_resources : Bool? = nil,
          @remove_resources : Array(String)? = nil,
          @template_configuration : Types::TemplateConfiguration? = nil
        )
        end
      end


      struct UpdateGeneratedTemplateOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the generated template. The format is
        # arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id} . For example,
        # arn:aws:cloudformation: us-east-1 : 123456789012 :generatedtemplate/
        # 2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc .

        @[JSON::Field(key: "GeneratedTemplateId")]
        getter generated_template_id : String?

        def initialize(
          @generated_template_id : String? = nil
        )
        end
      end

      # The input for an UpdateStack action.

      struct UpdateStackInput
        include JSON::Serializable

        # The name or unique stack ID of the stack to update.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        # In some cases, you must explicitly acknowledge that your stack template contains certain
        # capabilities in order for CloudFormation to update the stack. CAPABILITY_IAM and
        # CAPABILITY_NAMED_IAM Some stack templates might include resources that can affect permissions in
        # your Amazon Web Services account, for example, by creating new IAM users. For those stacks, you must
        # explicitly acknowledge this by specifying one of these capabilities. The following IAM resources
        # require you to specify either the CAPABILITY_IAM or CAPABILITY_NAMED_IAM capability. If you have IAM
        # resources, you can specify either capability. If you have IAM resources with custom names, you must
        # specify CAPABILITY_NAMED_IAM . If you don't specify either of these capabilities, CloudFormation
        # returns an InsufficientCapabilities error. If your stack template contains these resources, we
        # suggest that you review all permissions associated with them and edit their permissions if
        # necessary. AWS::IAM::AccessKey AWS::IAM::Group AWS::IAM::InstanceProfile AWS::IAM::ManagedPolicy
        # AWS::IAM::Policy AWS::IAM::Role AWS::IAM::User AWS::IAM::UserToGroupAddition For more information,
        # see Acknowledging IAM resources in CloudFormation templates . CAPABILITY_AUTO_EXPAND Some template
        # contain macros. Macros perform custom processing on templates; this can include simple actions like
        # find-and-replace operations, all the way to extensive transformations of entire templates. Because
        # of this, users typically create a change set from the processed template, so that they can review
        # the changes resulting from the macros before actually updating the stack. If your stack template
        # contains one or more macros, and you choose to update a stack directly from the processed template,
        # without first reviewing the resulting changes in a change set, you must acknowledge this capability.
        # This includes the AWS::Include and AWS::Serverless transforms, which are macros hosted by
        # CloudFormation. If you want to update a stack from a stack template that contains macros and nested
        # stacks, you must update the stack directly from the template using this capability. You should only
        # update stacks directly from a stack template that contains macros if you know what processing the
        # macro performs. Each macro relies on an underlying Lambda service function for processing stack
        # templates. Be aware that the Lambda function owner can update the function operation without
        # CloudFormation being notified. For more information, see Perform custom processing on CloudFormation
        # templates with template macros . Only one of the Capabilities and ResourceType parameters can be
        # specified.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)?

        # A unique identifier for this UpdateStack request. Specify this token if you plan to retry requests
        # so that CloudFormation knows that you're not attempting to update a stack with the same name. You
        # might retry UpdateStack requests to ensure that CloudFormation successfully received them. All
        # events triggered by a given stack operation are assigned the same client request token, which you
        # can use to track operations. For example, if you execute a CreateStack operation with the token
        # token1 , then all the StackEvents generated by that operation will have ClientRequestToken set as
        # token1 . In the console, stack operations display the client request token on the Events tab. Stack
        # operations that are initiated from the console use the token format Console-StackOperation-ID ,
        # which helps you easily identify the stack operation . For example, if you create a stack using the
        # console, each stack event would be assigned the same token in the following format:
        # Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002 .

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Preserve the state of previously provisioned resources when an operation fails. Default: False

        @[JSON::Field(key: "DisableRollback")]
        getter disable_rollback : Bool?

        # Amazon Simple Notification Service topic Amazon Resource Names (ARNs) that CloudFormation associates
        # with the stack. Specify an empty list to remove all notification topics.

        @[JSON::Field(key: "NotificationARNs")]
        getter notification_ar_ns : Array(String)?

        # A list of Parameter structures that specify input parameters for the stack. For more information,
        # see the Parameter data type.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # Specifies which resource types you can work with, such as AWS::EC2::Instance or
        # Custom::MyCustomInstance . If the list of resource types doesn't include a resource that you're
        # updating, the stack update fails. By default, CloudFormation grants permissions to all resource
        # types. IAM uses this parameter for CloudFormation-specific condition keys in IAM policies. For more
        # information, see Control CloudFormation access with Identity and Access Management . Only one of the
        # Capabilities and ResourceType parameters can be specified.

        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # When set to true , newly created resources are deleted when the operation rolls back. This includes
        # newly created resources marked with a deletion policy of Retain . Default: false

        @[JSON::Field(key: "RetainExceptOnCreate")]
        getter retain_except_on_create : Bool?

        # The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes to update the stack.
        # CloudFormation uses the role's credentials to make calls on your behalf. CloudFormation always uses
        # this role for all future operations on the stack. Provided that users have permission to operate on
        # the stack, CloudFormation uses this role even if the users don't have permission to pass it. Ensure
        # that the role grants least privilege. If you don't specify a value, CloudFormation uses the role
        # that was previously associated with the stack. If no role is available, CloudFormation uses a
        # temporary session that is generated from your user credentials.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The rollback triggers for CloudFormation to monitor during stack creation and updating operations,
        # and for the specified monitoring period afterwards.

        @[JSON::Field(key: "RollbackConfiguration")]
        getter rollback_configuration : Types::RollbackConfiguration?

        # Structure that contains a new stack policy body. You can specify either the StackPolicyBody or the
        # StackPolicyURL parameter, but not both. You might update the stack policy, for example, in order to
        # protect a new resource that you created during a stack update. If you don't specify a stack policy,
        # the current policy that is associated with the stack is unchanged.

        @[JSON::Field(key: "StackPolicyBody")]
        getter stack_policy_body : String?

        # Structure that contains the temporary overriding stack policy body. You can specify either the
        # StackPolicyDuringUpdateBody or the StackPolicyDuringUpdateURL parameter, but not both. If you want
        # to update protected resources, specify a temporary overriding stack policy during this update. If
        # you don't specify a stack policy, the current policy that is associated with the stack will be used.

        @[JSON::Field(key: "StackPolicyDuringUpdateBody")]
        getter stack_policy_during_update_body : String?

        # Location of a file that contains the temporary overriding stack policy. The URL must point to a
        # policy (max size: 16KB) located in an S3 bucket in the same Region as the stack. The location for an
        # Amazon S3 bucket must start with https:// . URLs from S3 static websites are not supported. You can
        # specify either the StackPolicyDuringUpdateBody or the StackPolicyDuringUpdateURL parameter, but not
        # both. If you want to update protected resources, specify a temporary overriding stack policy during
        # this update. If you don't specify a stack policy, the current policy that is associated with the
        # stack will be used.

        @[JSON::Field(key: "StackPolicyDuringUpdateURL")]
        getter stack_policy_during_update_url : String?

        # Location of a file that contains the updated stack policy. The URL must point to a policy (max size:
        # 16KB) located in an S3 bucket in the same Region as the stack. The location for an Amazon S3 bucket
        # must start with https:// . URLs from S3 static websites are not supported. You can specify either
        # the StackPolicyBody or the StackPolicyURL parameter, but not both. You might update the stack
        # policy, for example, in order to protect a new resource that you created during a stack update. If
        # you don't specify a stack policy, the current policy that is associated with the stack is unchanged.

        @[JSON::Field(key: "StackPolicyURL")]
        getter stack_policy_url : String?

        # Key-value pairs to associate with this stack. CloudFormation also propagates these tags to supported
        # resources in the stack. You can specify a maximum number of 50 tags. If you don't specify this
        # parameter, CloudFormation doesn't modify the stack's tags. If you specify an empty value,
        # CloudFormation removes all associated tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Structure that contains the template body with a minimum length of 1 byte and a maximum length of
        # 51,200 bytes. Conditional: You must specify only one of the following parameters: TemplateBody ,
        # TemplateURL , or set the UsePreviousTemplate to true .

        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        # The URL of a file that contains the template body. The URL must point to a template that's located
        # in an Amazon S3 bucket or a Systems Manager document. The location for an Amazon S3 bucket must
        # start with https:// . Conditional: You must specify only one of the following parameters:
        # TemplateBody , TemplateURL , or set the UsePreviousTemplate to true .

        @[JSON::Field(key: "TemplateURL")]
        getter template_url : String?

        # Reuse the existing template that is associated with the stack that you are updating. When using
        # templates with the AWS::LanguageExtensions transform, provide the template instead of using
        # UsePreviousTemplate to ensure new parameter values and Systems Manager parameter updates are applied
        # correctly. For more information, see AWS::LanguageExtensions transform . Conditional: You must
        # specify only one of the following parameters: TemplateBody , TemplateURL , or set the
        # UsePreviousTemplate to true .

        @[JSON::Field(key: "UsePreviousTemplate")]
        getter use_previous_template : Bool?

        def initialize(
          @stack_name : String,
          @capabilities : Array(String)? = nil,
          @client_request_token : String? = nil,
          @disable_rollback : Bool? = nil,
          @notification_ar_ns : Array(String)? = nil,
          @parameters : Array(Types::Parameter)? = nil,
          @resource_types : Array(String)? = nil,
          @retain_except_on_create : Bool? = nil,
          @role_arn : String? = nil,
          @rollback_configuration : Types::RollbackConfiguration? = nil,
          @stack_policy_body : String? = nil,
          @stack_policy_during_update_body : String? = nil,
          @stack_policy_during_update_url : String? = nil,
          @stack_policy_url : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @template_body : String? = nil,
          @template_url : String? = nil,
          @use_previous_template : Bool? = nil
        )
        end
      end


      struct UpdateStackInstancesInput
        include JSON::Serializable

        # The names of one or more Amazon Web Services Regions in which you want to update parameter values
        # for stack instances. The overridden parameter values will be applied to all stack instances in the
        # specified accounts and Amazon Web Services Regions.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)

        # The name or unique ID of the StackSet associated with the stack instances.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Self-managed permissions] The account IDs of one or more Amazon Web Services accounts in which you
        # want to update parameter values for stack instances. The overridden parameter values will be applied
        # to all stack instances in the specified accounts and Amazon Web Services Regions. You can specify
        # Accounts or DeploymentTargets , but not both.

        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(String)?

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # [Service-managed permissions] The Organizations accounts in which you want to update parameter
        # values for stack instances. If your update targets OUs, the overridden parameter values only apply
        # to the accounts that are currently in the target OUs and their child OUs. Accounts added to the
        # target OUs and their child OUs in the future won't use the overridden values. You can specify
        # Accounts or DeploymentTargets , but not both.

        @[JSON::Field(key: "DeploymentTargets")]
        getter deployment_targets : Types::DeploymentTargets?

        # The unique identifier for this StackSet operation. The operation ID also functions as an idempotency
        # token, to ensure that CloudFormation performs the StackSet operation only once, even if you retry
        # the request multiple times. You might retry StackSet operation requests to ensure that
        # CloudFormation successfully received them. If you don't specify an operation ID, the SDK generates
        # one automatically.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # Preferences for how CloudFormation performs this StackSet operation.

        @[JSON::Field(key: "OperationPreferences")]
        getter operation_preferences : Types::StackSetOperationPreferences?

        # A list of input parameters whose values you want to update for the specified stack instances. Any
        # overridden parameter values will be applied to all stack instances in the specified accounts and
        # Amazon Web Services Regions. When specifying parameters and their values, be aware of how
        # CloudFormation sets parameter values during stack instance update operations: To override the
        # current value for a parameter, include the parameter and specify its value. To leave an overridden
        # parameter set to its present value, include the parameter and specify UsePreviousValue as true .
        # (You can't specify both a value and set UsePreviousValue to true .) To set an overridden parameter
        # back to the value specified in the StackSet, specify a parameter list but don't include the
        # parameter in the list. To leave all parameters set to their present values, don't specify this
        # property at all. During StackSet updates, any parameter values overridden for a stack instance
        # aren't updated, but retain their overridden value. You can only override the parameter values that
        # are specified in the StackSet. To add or delete a parameter itself, use UpdateStackSet to update the
        # StackSet template. If you add a parameter to a template, before you can override the parameter value
        # specified in the StackSet you must first use UpdateStackSet to update all stack instances with the
        # updated template and parameter value specified in the StackSet. Once a stack instance has been
        # updated with the new parameter, you can then override the parameter value using UpdateStackInstances
        # .

        @[JSON::Field(key: "ParameterOverrides")]
        getter parameter_overrides : Array(Types::Parameter)?

        def initialize(
          @regions : Array(String),
          @stack_set_name : String,
          @accounts : Array(String)? = nil,
          @call_as : String? = nil,
          @deployment_targets : Types::DeploymentTargets? = nil,
          @operation_id : String? = nil,
          @operation_preferences : Types::StackSetOperationPreferences? = nil,
          @parameter_overrides : Array(Types::Parameter)? = nil
        )
        end
      end


      struct UpdateStackInstancesOutput
        include JSON::Serializable

        # The unique identifier for this StackSet operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # The output for an UpdateStack action.

      struct UpdateStackOutput
        include JSON::Serializable

        # A unique identifier for this update operation that can be used to track the operation's progress and
        # events.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # Unique identifier of the stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        def initialize(
          @operation_id : String? = nil,
          @stack_id : String? = nil
        )
        end
      end


      struct UpdateStackSetInput
        include JSON::Serializable

        # The name or unique ID of the StackSet that you want to update.

        @[JSON::Field(key: "StackSetName")]
        getter stack_set_name : String

        # [Self-managed permissions] The accounts in which to update associated stack instances. If you
        # specify accounts, you must also specify the Amazon Web Services Regions in which to update StackSet
        # instances. To update all the stack instances associated with this StackSet, don't specify the
        # Accounts or Regions properties. If the StackSet update includes changes to the template (that is, if
        # the TemplateBody or TemplateURL properties are specified), or the Parameters property,
        # CloudFormation marks all stack instances with a status of OUTDATED prior to updating the stack
        # instances in the specified accounts and Amazon Web Services Regions. If the StackSet update does not
        # include changes to the template or parameters, CloudFormation updates the stack instances in the
        # specified accounts and Amazon Web Services Regions, while leaving all other stack instances with
        # their existing stack instance status.

        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(String)?

        # [Self-managed permissions] The Amazon Resource Name (ARN) of the IAM role to use to update this
        # StackSet. Specify an IAM role only if you are using customized administrator roles to control which
        # users or groups can manage specific StackSets within the same administrator account. For more
        # information, see Grant self-managed permissions in the CloudFormation User Guide . If you specified
        # a customized administrator role when you created the StackSet, you must specify a customized
        # administrator role, even if it is the same customized administrator role used with this StackSet
        # previously.

        @[JSON::Field(key: "AdministrationRoleARN")]
        getter administration_role_arn : String?

        # [Service-managed permissions] Describes whether StackSets automatically deploys to Organizations
        # accounts that are added to a target organization or organizational unit (OU). For more information,
        # see Enable or disable automatic deployments for StackSets in Organizations in the CloudFormation
        # User Guide . If you specify AutoDeployment , don't specify DeploymentTargets or Regions .

        @[JSON::Field(key: "AutoDeployment")]
        getter auto_deployment : Types::AutoDeployment?

        # [Service-managed permissions] Specifies whether you are acting as an account administrator in the
        # organization's management account or as a delegated administrator in a member account. By default,
        # SELF is specified. Use SELF for StackSets with self-managed permissions. If you are signed in to the
        # management account, specify SELF . If you are signed in to a delegated administrator account,
        # specify DELEGATED_ADMIN . Your Amazon Web Services account must be registered as a delegated
        # administrator in the management account. For more information, see Register a delegated
        # administrator in the CloudFormation User Guide .

        @[JSON::Field(key: "CallAs")]
        getter call_as : String?

        # In some cases, you must explicitly acknowledge that your stack template contains certain
        # capabilities in order for CloudFormation to update the StackSet and its associated stack instances.
        # CAPABILITY_IAM and CAPABILITY_NAMED_IAM Some stack templates might include resources that can affect
        # permissions in your Amazon Web Services account, for example, by creating new IAM users. For those
        # stacks sets, you must explicitly acknowledge this by specifying one of these capabilities. The
        # following IAM resources require you to specify either the CAPABILITY_IAM or CAPABILITY_NAMED_IAM
        # capability. If you have IAM resources, you can specify either capability. If you have IAM resources
        # with custom names, you must specify CAPABILITY_NAMED_IAM . If you don't specify either of these
        # capabilities, CloudFormation returns an InsufficientCapabilities error. If your stack template
        # contains these resources, we recommend that you review all permissions associated with them and edit
        # their permissions if necessary. AWS::IAM::AccessKey AWS::IAM::Group AWS::IAM::InstanceProfile
        # AWS::IAM::Policy AWS::IAM::Role AWS::IAM::User AWS::IAM::UserToGroupAddition For more information,
        # see Acknowledging IAM resources in CloudFormation templates . CAPABILITY_AUTO_EXPAND Some templates
        # reference macros. If your StackSet template references one or more macros, you must update the
        # StackSet directly from the processed template, without first reviewing the resulting changes in a
        # change set. To update the StackSet directly, you must acknowledge this capability. For more
        # information, see Perform custom processing on CloudFormation templates with template macros .
        # StackSets with service-managed permissions do not currently support the use of macros in templates.
        # (This includes the AWS::Include and AWS::Serverless transforms, which are macros hosted by
        # CloudFormation.) Even if you specify this capability for a StackSet with service-managed
        # permissions, if you reference a macro in your template the StackSet operation will fail.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)?

        # [Service-managed permissions] The Organizations accounts in which to update associated stack
        # instances. To update all the stack instances associated with this StackSet, do not specify
        # DeploymentTargets or Regions . If the StackSet update includes changes to the template (that is, if
        # TemplateBody or TemplateURL is specified), or the Parameters , CloudFormation marks all stack
        # instances with a status of OUTDATED prior to updating the stack instances in the specified accounts
        # and Amazon Web Services Regions. If the StackSet update doesn't include changes to the template or
        # parameters, CloudFormation updates the stack instances in the specified accounts and Regions, while
        # leaving all other stack instances with their existing stack instance status.

        @[JSON::Field(key: "DeploymentTargets")]
        getter deployment_targets : Types::DeploymentTargets?

        # A brief description of updates that you are making.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # [Self-managed permissions] The name of the IAM execution role to use to update the stack set. If you
        # do not specify an execution role, CloudFormation uses the AWSCloudFormationStackSetExecutionRole
        # role for the StackSet operation. Specify an IAM role only if you are using customized execution
        # roles to control which stack resources users and groups can include in their StackSets. If you
        # specify a customized execution role, CloudFormation uses that role to update the stack. If you do
        # not specify a customized execution role, CloudFormation performs the update using the role
        # previously associated with the StackSet, so long as you have permissions to perform operations on
        # the StackSet.

        @[JSON::Field(key: "ExecutionRoleName")]
        getter execution_role_name : String?

        # Describes whether CloudFormation performs non-conflicting operations concurrently and queues
        # conflicting operations.

        @[JSON::Field(key: "ManagedExecution")]
        getter managed_execution : Types::ManagedExecution?

        # The unique ID for this StackSet operation. The operation ID also functions as an idempotency token,
        # to ensure that CloudFormation performs the StackSet operation only once, even if you retry the
        # request multiple times. You might retry StackSet operation requests to ensure that CloudFormation
        # successfully received them. If you don't specify an operation ID, CloudFormation generates one
        # automatically. Repeating this StackSet operation with a new operation ID retries all stack instances
        # whose status is OUTDATED .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # Preferences for how CloudFormation performs this StackSet operation.

        @[JSON::Field(key: "OperationPreferences")]
        getter operation_preferences : Types::StackSetOperationPreferences?

        # A list of input parameters for the StackSet template.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # Describes how the IAM roles required for StackSet operations are created. You cannot modify
        # PermissionModel if there are stack instances associated with your stack set. With self-managed
        # permissions, you must create the administrator and execution roles required to deploy to target
        # accounts. For more information, see Grant self-managed permissions . With service-managed
        # permissions, StackSets automatically creates the IAM roles required to deploy to accounts managed by
        # Organizations. For more information, see Activate trusted access for StackSets with Organizations .

        @[JSON::Field(key: "PermissionModel")]
        getter permission_model : String?

        # The Amazon Web Services Regions in which to update associated stack instances. If you specify
        # Regions, you must also specify accounts in which to update StackSet instances. To update all the
        # stack instances associated with this StackSet, do not specify the Accounts or Regions properties. If
        # the StackSet update includes changes to the template (that is, if the TemplateBody or TemplateURL
        # properties are specified), or the Parameters property, CloudFormation marks all stack instances with
        # a status of OUTDATED prior to updating the stack instances in the specified accounts and Regions. If
        # the StackSet update does not include changes to the template or parameters, CloudFormation updates
        # the stack instances in the specified accounts and Regions, while leaving all other stack instances
        # with their existing stack instance status.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        # The key-value pairs to associate with this StackSet and the stacks created from it. CloudFormation
        # also propagates these tags to supported resources that are created in the stacks. You can specify a
        # maximum number of 50 tags. If you specify tags for this parameter, those tags replace any list of
        # tags that are currently associated with this StackSet. This means: If you don't specify this
        # parameter, CloudFormation doesn't modify the stack's tags. If you specify any tags using this
        # parameter, you must specify all the tags that you want associated with this StackSet, even tags
        # you've specified before (for example, when creating the StackSet or during a previous update of the
        # StackSet.). Any tags that you don't include in the updated list of tags are removed from the
        # StackSet, and therefore from the stacks and resources as well. If you specify an empty value,
        # CloudFormation removes all currently associated tags. If you specify new tags as part of an
        # UpdateStackSet action, CloudFormation checks to see if you have the required IAM permission to tag
        # resources. If you omit tags that are currently associated with the StackSet from the list of tags
        # you specify, CloudFormation assumes that you want to remove those tags from the StackSet, and checks
        # to see if you have permission to untag resources. If you don't have the necessary permission(s), the
        # entire UpdateStackSet action fails with an access denied error, and the StackSet is not updated.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The structure that contains the template body, with a minimum length of 1 byte and a maximum length
        # of 51,200 bytes. Conditional: You must specify only one of the following parameters: TemplateBody or
        # TemplateURL —or set UsePreviousTemplate to true.

        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        # The URL of a file that contains the template body. The URL must point to a template (maximum size: 1
        # MB) that is located in an Amazon S3 bucket or a Systems Manager document. The location for an Amazon
        # S3 bucket must start with https:// . S3 static website URLs are not supported. Conditional: You must
        # specify only one of the following parameters: TemplateBody or TemplateURL —or set
        # UsePreviousTemplate to true.

        @[JSON::Field(key: "TemplateURL")]
        getter template_url : String?

        # Use the existing template that's associated with the StackSet that you're updating. Conditional: You
        # must specify only one of the following parameters: TemplateBody or TemplateURL —or set
        # UsePreviousTemplate to true.

        @[JSON::Field(key: "UsePreviousTemplate")]
        getter use_previous_template : Bool?

        def initialize(
          @stack_set_name : String,
          @accounts : Array(String)? = nil,
          @administration_role_arn : String? = nil,
          @auto_deployment : Types::AutoDeployment? = nil,
          @call_as : String? = nil,
          @capabilities : Array(String)? = nil,
          @deployment_targets : Types::DeploymentTargets? = nil,
          @description : String? = nil,
          @execution_role_name : String? = nil,
          @managed_execution : Types::ManagedExecution? = nil,
          @operation_id : String? = nil,
          @operation_preferences : Types::StackSetOperationPreferences? = nil,
          @parameters : Array(Types::Parameter)? = nil,
          @permission_model : String? = nil,
          @regions : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @template_body : String? = nil,
          @template_url : String? = nil,
          @use_previous_template : Bool? = nil
        )
        end
      end


      struct UpdateStackSetOutput
        include JSON::Serializable

        # The unique ID for this StackSet operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct UpdateTerminationProtectionInput
        include JSON::Serializable

        # Whether to enable termination protection on the specified stack.

        @[JSON::Field(key: "EnableTerminationProtection")]
        getter enable_termination_protection : Bool

        # The name or unique ID of the stack for which you want to set termination protection.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String

        def initialize(
          @enable_termination_protection : Bool,
          @stack_name : String
        )
        end
      end


      struct UpdateTerminationProtectionOutput
        include JSON::Serializable

        # The unique ID of the stack.

        @[JSON::Field(key: "StackId")]
        getter stack_id : String?

        def initialize(
          @stack_id : String? = nil
        )
        end
      end

      # The input for ValidateTemplate action.

      struct ValidateTemplateInput
        include JSON::Serializable

        # Structure that contains the template body with a minimum length of 1 byte and a maximum length of
        # 51,200 bytes. Conditional: You must pass TemplateURL or TemplateBody . If both are passed, only
        # TemplateBody is used.

        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        # The URL of a file that contains the template body. The URL must point to a template (max size: 1 MB)
        # that is located in an Amazon S3 bucket or a Systems Manager document. The location for an Amazon S3
        # bucket must start with https:// . Conditional: You must pass TemplateURL or TemplateBody . If both
        # are passed, only TemplateBody is used.

        @[JSON::Field(key: "TemplateURL")]
        getter template_url : String?

        def initialize(
          @template_body : String? = nil,
          @template_url : String? = nil
        )
        end
      end

      # The output for ValidateTemplate action.

      struct ValidateTemplateOutput
        include JSON::Serializable

        # The capabilities found within the template. If your template contains IAM resources, you must
        # specify the CAPABILITY_IAM or CAPABILITY_NAMED_IAM value for this parameter when you use the
        # CreateStack or UpdateStack actions with your template; otherwise, those actions return an
        # InsufficientCapabilities error. For more information, see Acknowledging IAM resources in
        # CloudFormation templates .

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)?

        # The list of resources that generated the values in the Capabilities response element.

        @[JSON::Field(key: "CapabilitiesReason")]
        getter capabilities_reason : String?

        # A list of the transforms that are declared in the template.

        @[JSON::Field(key: "DeclaredTransforms")]
        getter declared_transforms : Array(String)?

        # The description found within the template.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of TemplateParameter structures.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::TemplateParameter)?

        def initialize(
          @capabilities : Array(String)? = nil,
          @capabilities_reason : String? = nil,
          @declared_transforms : Array(String)? = nil,
          @description : String? = nil,
          @parameters : Array(Types::TemplateParameter)? = nil
        )
        end
      end

      # The warnings generated for a specific resource for this generated template.

      struct WarningDetail
        include JSON::Serializable

        # The properties of the resource that are impacted by this warning.

        @[JSON::Field(key: "Properties")]
        getter properties : Array(Types::WarningProperty)?

        # The type of this warning. For more information, see Resolve write-only properties in the
        # CloudFormation User Guide . MUTUALLY_EXCLUSIVE_PROPERTIES - The resource requires mutually-exclusive
        # write-only properties. The IaC generator selects one set of mutually exclusive properties and
        # converts the included properties into parameters. The parameter names have a suffix OneOf and the
        # parameter descriptions indicate that the corresponding property can be replaced with other exclusive
        # properties. UNSUPPORTED_PROPERTIES - Unsupported properties are present in the resource. One example
        # of unsupported properties would be a required write-only property that is an array, because a
        # parameter cannot be an array. Another example is an optional write-only property.
        # MUTUALLY_EXCLUSIVE_TYPES - One or more required write-only properties are found in the resource, and
        # the type of that property can be any of several types. Currently the resource and property reference
        # documentation does not indicate if a property uses a type of oneOf or anyOf . You need to look at
        # the resource provider schema.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @properties : Array(Types::WarningProperty)? = nil,
          @type : String? = nil
        )
        end
      end

      # A specific property that is impacted by a warning.

      struct WarningProperty
        include JSON::Serializable

        # The description of the property from the resource provider schema.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The path of the property. For example, if this is for the S3Bucket member of the Code property, the
        # property path would be Code/S3Bucket .

        @[JSON::Field(key: "PropertyPath")]
        getter property_path : String?

        # If true , the specified property is required.

        @[JSON::Field(key: "Required")]
        getter required : Bool?

        def initialize(
          @description : String? = nil,
          @property_path : String? = nil,
          @required : Bool? = nil
        )
        end
      end

      # Contains any warnings returned by the GetTemplateSummary API action.

      struct Warnings
        include JSON::Serializable

        # A list of all of the unrecognized resource types. This is only returned if the TemplateSummaryConfig
        # parameter has the TreatUnrecognizedResourceTypesAsWarning configuration set to True .

        @[JSON::Field(key: "UnrecognizedResourceTypes")]
        getter unrecognized_resource_types : Array(String)?

        def initialize(
          @unrecognized_resource_types : Array(String)? = nil
        )
        end
      end
    end
  end
end
