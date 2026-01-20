require "json"
require "time"

module AwsSdk
  module AppConfig
    module Types


      struct AccountSettings
        include JSON::Serializable

        # A parameter to configure deletion protection. Deletion protection prevents a user from deleting a
        # configuration profile or an environment if AppConfig has called either GetLatestConfiguration or for
        # the configuration profile or from the environment during the specified interval. The default
        # interval for ProtectionPeriodInMinutes is 60.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Types::DeletionProtectionSettings?

        def initialize(
          @deletion_protection : Types::DeletionProtectionSettings? = nil
        )
        end
      end

      # An action defines the tasks that the extension performs during the AppConfig workflow. Each action
      # includes an action point, as shown in the following list: PRE_CREATE_HOSTED_CONFIGURATION_VERSION
      # PRE_START_DEPLOYMENT AT_DEPLOYMENT_TICK ON_DEPLOYMENT_START ON_DEPLOYMENT_STEP ON_DEPLOYMENT_BAKING
      # ON_DEPLOYMENT_COMPLETE ON_DEPLOYMENT_ROLLED_BACK Each action also includes a name, a URI to an
      # Lambda function, and an Amazon Resource Name (ARN) for an Identity and Access Management assume
      # role. You specify the name, URI, and ARN for each action point defined in the extension.

      struct Action
        include JSON::Serializable

        # Information about the action.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The action name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An Amazon Resource Name (ARN) for an Identity and Access Management assume role.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The extension URI associated to the action point in the extension definition. The URI can be an
        # Amazon Resource Name (ARN) for one of the following: an Lambda function, an Amazon Simple Queue
        # Service queue, an Amazon Simple Notification Service topic, or the Amazon EventBridge default event
        # bus.

        @[JSON::Field(key: "Uri")]
        getter uri : String?

        def initialize(
          @description : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @uri : String? = nil
        )
        end
      end

      # An extension that was invoked as part of a deployment event.

      struct ActionInvocation
        include JSON::Serializable

        # The name of the action.

        @[JSON::Field(key: "ActionName")]
        getter action_name : String?

        # The error code when an extension invocation fails.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message when an extension invocation fails.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The name, the ID, or the Amazon Resource Name (ARN) of the extension.

        @[JSON::Field(key: "ExtensionIdentifier")]
        getter extension_identifier : String?

        # A system-generated ID for this invocation.

        @[JSON::Field(key: "InvocationId")]
        getter invocation_id : String?

        # An Amazon Resource Name (ARN) for an Identity and Access Management assume role.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The extension URI associated to the action point in the extension definition. The URI can be an
        # Amazon Resource Name (ARN) for one of the following: an Lambda function, an Amazon Simple Queue
        # Service queue, an Amazon Simple Notification Service topic, or the Amazon EventBridge default event
        # bus.

        @[JSON::Field(key: "Uri")]
        getter uri : String?

        def initialize(
          @action_name : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @extension_identifier : String? = nil,
          @invocation_id : String? = nil,
          @role_arn : String? = nil,
          @uri : String? = nil
        )
        end
      end


      struct Application
        include JSON::Serializable

        # The description of the application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The application ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The application name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct Applications
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::Application)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Application)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # An extension that was invoked during a deployment.

      struct AppliedExtension
        include JSON::Serializable

        # The system-generated ID for the association.

        @[JSON::Field(key: "ExtensionAssociationId")]
        getter extension_association_id : String?

        # The system-generated ID of the extension.

        @[JSON::Field(key: "ExtensionId")]
        getter extension_id : String?

        # One or more parameters for the actions called by the extension.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        # The extension version number.

        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int32?

        def initialize(
          @extension_association_id : String? = nil,
          @extension_id : String? = nil,
          @parameters : Hash(String, String)? = nil,
          @version_number : Int32? = nil
        )
        end
      end

      # Detailed information about the input that failed to satisfy the constraints specified by a call.

      struct BadRequestDetails
        include JSON::Serializable

        # Detailed information about the bad request exception error when creating a hosted configuration
        # version.

        @[JSON::Field(key: "InvalidConfiguration")]
        getter invalid_configuration : Array(Types::InvalidConfigurationDetail)?

        def initialize(
          @invalid_configuration : Array(Types::InvalidConfigurationDetail)? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Details")]
        getter details : Types::BadRequestDetails?


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @details : Types::BadRequestDetails? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct Configuration
        include JSON::Serializable

        # The configuration version.

        @[JSON::Field(key: "Configuration-Version")]
        getter configuration_version : String?

        # The content of the configuration or the configuration data. The Content attribute only contains data
        # if the system finds new or updated configuration data. If there is no new or updated data and
        # ClientConfigurationVersion matches the version of the current configuration, AppConfig returns a 204
        # No Content HTTP response code and the Content value will be empty.

        @[JSON::Field(key: "Content")]
        getter content : Bytes?

        # A standard MIME type describing the format of the configuration content. For more information, see
        # Content-Type .

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @configuration_version : String? = nil,
          @content : Bytes? = nil,
          @content_type : String? = nil
        )
        end
      end


      struct ConfigurationProfile
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The configuration profile description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The configuration profile ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The Amazon Resource Name of the Key Management Service key to encrypt new configuration data
        # versions in the AppConfig hosted configuration store. This attribute is only used for hosted
        # configuration types. To encrypt data managed in other configuration stores, see the documentation
        # for how to specify an KMS key for that particular service.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The Key Management Service key identifier (key ID, key alias, or key ARN) provided when the resource
        # was created or updated.

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The URI location of the configuration.

        @[JSON::Field(key: "LocationUri")]
        getter location_uri : String?

        # The name of the configuration profile.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of an IAM role with permission to access the configuration at the specified LocationUri .

        @[JSON::Field(key: "RetrievalRoleArn")]
        getter retrieval_role_arn : String?

        # The type of configurations contained in the profile. AppConfig supports feature flags and freeform
        # configurations. We recommend you create feature flag configurations to enable or disable new
        # features and freeform configurations to distribute configurations to an application. When calling
        # this API, enter one of the following values for Type : AWS.AppConfig.FeatureFlags AWS.Freeform

        @[JSON::Field(key: "Type")]
        getter type : String?

        # A list of methods for validating the configuration.

        @[JSON::Field(key: "Validators")]
        getter validators : Array(Types::Validator)?

        def initialize(
          @application_id : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @kms_key_arn : String? = nil,
          @kms_key_identifier : String? = nil,
          @location_uri : String? = nil,
          @name : String? = nil,
          @retrieval_role_arn : String? = nil,
          @type : String? = nil,
          @validators : Array(Types::Validator)? = nil
        )
        end
      end

      # A summary of a configuration profile.

      struct ConfigurationProfileSummary
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The ID of the configuration profile.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The URI location of the configuration.

        @[JSON::Field(key: "LocationUri")]
        getter location_uri : String?

        # The name of the configuration profile.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of configurations contained in the profile. AppConfig supports feature flags and freeform
        # configurations. We recommend you create feature flag configurations to enable or disable new
        # features and freeform configurations to distribute configurations to an application. When calling
        # this API, enter one of the following values for Type : AWS.AppConfig.FeatureFlags AWS.Freeform

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The types of validators in the configuration profile.

        @[JSON::Field(key: "ValidatorTypes")]
        getter validator_types : Array(String)?

        def initialize(
          @application_id : String? = nil,
          @id : String? = nil,
          @location_uri : String? = nil,
          @name : String? = nil,
          @type : String? = nil,
          @validator_types : Array(String)? = nil
        )
        end
      end


      struct ConfigurationProfiles
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ConfigurationProfileSummary)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ConfigurationProfileSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The request could not be processed because of conflict in the current state of the resource.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateApplicationRequest
        include JSON::Serializable

        # A name for the application.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description of the application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Metadata to assign to the application. Tags help organize and categorize your AppConfig resources.
        # Each tag consists of a key and an optional value, both of which you define.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateConfigurationProfileRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # A URI to locate the configuration. You can specify the following: For the AppConfig hosted
        # configuration store and for feature flags, specify hosted . For an Amazon Web Services Systems
        # Manager Parameter Store parameter, specify either the parameter name in the format
        # ssm-parameter://&lt;parameter name&gt; or the ARN. For an Amazon Web Services CodePipeline pipeline,
        # specify the URI in the following format: codepipeline ://&lt;pipeline name&gt;. For an Secrets
        # Manager secret, specify the URI in the following format: secretsmanager ://&lt;secret name&gt;. For
        # an Amazon S3 object, specify the URI in the following format: s3://&lt;bucket&gt;/&lt;objectKey&gt;
        # . Here is an example: s3://amzn-s3-demo-bucket/my-app/us-east-1/my-config.json For an SSM document,
        # specify either the document name in the format ssm-document://&lt;document name&gt; or the Amazon
        # Resource Name (ARN).

        @[JSON::Field(key: "LocationUri")]
        getter location_uri : String

        # A name for the configuration profile.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description of the configuration profile.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier for an Key Management Service key to encrypt new configuration data versions in the
        # AppConfig hosted configuration store. This attribute is only used for hosted configuration types.
        # The identifier can be an KMS key ID, alias, or the Amazon Resource Name (ARN) of the key ID or
        # alias. To encrypt data managed in other configuration stores, see the documentation for how to
        # specify an KMS key for that particular service.

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The ARN of an IAM role with permission to access the configuration at the specified LocationUri . A
        # retrieval role ARN is not required for configurations stored in CodePipeline or the AppConfig hosted
        # configuration store. It is required for all other sources that store your configuration.

        @[JSON::Field(key: "RetrievalRoleArn")]
        getter retrieval_role_arn : String?

        # Metadata to assign to the configuration profile. Tags help organize and categorize your AppConfig
        # resources. Each tag consists of a key and an optional value, both of which you define.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The type of configurations contained in the profile. AppConfig supports feature flags and freeform
        # configurations. We recommend you create feature flag configurations to enable or disable new
        # features and freeform configurations to distribute configurations to an application. When calling
        # this API, enter one of the following values for Type : AWS.AppConfig.FeatureFlags AWS.Freeform

        @[JSON::Field(key: "Type")]
        getter type : String?

        # A list of methods for validating the configuration.

        @[JSON::Field(key: "Validators")]
        getter validators : Array(Types::Validator)?

        def initialize(
          @application_id : String,
          @location_uri : String,
          @name : String,
          @description : String? = nil,
          @kms_key_identifier : String? = nil,
          @retrieval_role_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @validators : Array(Types::Validator)? = nil
        )
        end
      end


      struct CreateDeploymentStrategyRequest
        include JSON::Serializable

        # Total amount of time for a deployment to last.

        @[JSON::Field(key: "DeploymentDurationInMinutes")]
        getter deployment_duration_in_minutes : Int32

        # The percentage of targets to receive a deployed configuration during each interval.

        @[JSON::Field(key: "GrowthFactor")]
        getter growth_factor : Float64

        # A name for the deployment strategy.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description of the deployment strategy.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies the amount of time AppConfig monitors for Amazon CloudWatch alarms after the configuration
        # has been deployed to 100% of its targets, before considering the deployment to be complete. If an
        # alarm is triggered during this time, AppConfig rolls back the deployment. You must configure
        # permissions for AppConfig to roll back based on CloudWatch alarms. For more information, see
        # Configuring permissions for rollback based on Amazon CloudWatch alarms in the AppConfig User Guide .

        @[JSON::Field(key: "FinalBakeTimeInMinutes")]
        getter final_bake_time_in_minutes : Int32?

        # The algorithm used to define how percentage grows over time. AppConfig supports the following growth
        # types: Linear : For this type, AppConfig processes the deployment by dividing the total number of
        # targets by the value specified for Step percentage . For example, a linear deployment that uses a
        # Step percentage of 10 deploys the configuration to 10 percent of the hosts. After those deployments
        # are complete, the system deploys the configuration to the next 10 percent. This continues until 100%
        # of the targets have successfully received the configuration. Exponential : For this type, AppConfig
        # processes the deployment exponentially using the following formula: G*(2^N) . In this formula, G is
        # the growth factor specified by the user and N is the number of steps until the configuration is
        # deployed to all targets. For example, if you specify a growth factor of 2, then the system rolls out
        # the configuration as follows: 2*(2^0) 2*(2^1) 2*(2^2) Expressed numerically, the deployment rolls
        # out as follows: 2% of the targets, 4% of the targets, 8% of the targets, and continues until the
        # configuration has been deployed to all targets.

        @[JSON::Field(key: "GrowthType")]
        getter growth_type : String?

        # Save the deployment strategy to a Systems Manager (SSM) document.

        @[JSON::Field(key: "ReplicateTo")]
        getter replicate_to : String?

        # Metadata to assign to the deployment strategy. Tags help organize and categorize your AppConfig
        # resources. Each tag consists of a key and an optional value, both of which you define.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @deployment_duration_in_minutes : Int32,
          @growth_factor : Float64,
          @name : String,
          @description : String? = nil,
          @final_bake_time_in_minutes : Int32? = nil,
          @growth_type : String? = nil,
          @replicate_to : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEnvironmentRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # A name for the environment.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description of the environment.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Amazon CloudWatch alarms to monitor during the deployment process.

        @[JSON::Field(key: "Monitors")]
        getter monitors : Array(Types::Monitor)?

        # Metadata to assign to the environment. Tags help organize and categorize your AppConfig resources.
        # Each tag consists of a key and an optional value, both of which you define.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_id : String,
          @name : String,
          @description : String? = nil,
          @monitors : Array(Types::Monitor)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateExtensionAssociationRequest
        include JSON::Serializable

        # The name, the ID, or the Amazon Resource Name (ARN) of the extension.

        @[JSON::Field(key: "ExtensionIdentifier")]
        getter extension_identifier : String

        # The ARN of an application, configuration profile, or environment.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # The version number of the extension. If not specified, AppConfig uses the maximum version of the
        # extension.

        @[JSON::Field(key: "ExtensionVersionNumber")]
        getter extension_version_number : Int32?

        # The parameter names and values defined in the extensions. Extension parameters marked Required must
        # be entered for this field.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        # Adds one or more tags for the specified extension association. Tags are metadata that help you
        # categorize resources in different ways, for example, by purpose, owner, or environment. Each tag
        # consists of a key and an optional value, both of which you define.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @extension_identifier : String,
          @resource_identifier : String,
          @extension_version_number : Int32? = nil,
          @parameters : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateExtensionRequest
        include JSON::Serializable

        # The actions defined in the extension.

        @[JSON::Field(key: "Actions")]
        getter actions : Hash(String, Array(Types::Action))

        # A name for the extension. Each extension name in your account must be unique. Extension versions use
        # the same name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Information about the extension.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # You can omit this field when you create an extension. When you create a new version, specify the
        # most recent current version number. For example, you create version 3, enter 2 for this field.

        @[JSON::Field(key: "Latest-Version-Number")]
        getter latest_version_number : Int32?

        # The parameters accepted by the extension. You specify parameter values when you associate the
        # extension to an AppConfig resource by using the CreateExtensionAssociation API action. For Lambda
        # extension actions, these parameters are included in the Lambda request object.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Types::Parameter)?

        # Adds one or more tags for the specified extension. Tags are metadata that help you categorize
        # resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a
        # key and an optional value, both of which you define.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @actions : Hash(String, Array(Types::Action)),
          @name : String,
          @description : String? = nil,
          @latest_version_number : Int32? = nil,
          @parameters : Hash(String, Types::Parameter)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateHostedConfigurationVersionRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The configuration profile ID.

        @[JSON::Field(key: "ConfigurationProfileId")]
        getter configuration_profile_id : String

        # The configuration data, as bytes. AppConfig accepts any type of data, including text formats like
        # JSON or TOML, or binary formats like protocol buffers or compressed data.

        @[JSON::Field(key: "Content")]
        getter content : Bytes

        # A standard MIME type describing the format of the configuration content. For more information, see
        # Content-Type .

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String

        # A description of the configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # An optional locking token used to prevent race conditions from overwriting configuration updates
        # when creating a new version. To ensure your data is not overwritten when creating multiple hosted
        # configuration versions in rapid succession, specify the version number of the latest hosted
        # configuration version.

        @[JSON::Field(key: "Latest-Version-Number")]
        getter latest_version_number : Int32?

        # An optional, user-defined label for the AppConfig hosted configuration version. This value must
        # contain at least one non-numeric character. For example, "v2.2.0".

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        def initialize(
          @application_id : String,
          @configuration_profile_id : String,
          @content : Bytes,
          @content_type : String,
          @description : String? = nil,
          @latest_version_number : Int32? = nil,
          @version_label : String? = nil
        )
        end
      end


      struct DeleteApplicationRequest
        include JSON::Serializable

        # The ID of the application to delete.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteConfigurationProfileRequest
        include JSON::Serializable

        # The application ID that includes the configuration profile you want to delete.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The ID of the configuration profile you want to delete.

        @[JSON::Field(key: "ConfigurationProfileId")]
        getter configuration_profile_id : String

        # A parameter to configure deletion protection. Deletion protection prevents a user from deleting a
        # configuration profile if your application has called either GetLatestConfiguration or for the
        # configuration profile during the specified interval. This parameter supports the following values:
        # BYPASS : Instructs AppConfig to bypass the deletion protection check and delete a configuration
        # profile even if deletion protection would have otherwise prevented it. APPLY : Instructs the
        # deletion protection check to run, even if deletion protection is disabled at the account level.
        # APPLY also forces the deletion protection check to run against resources created in the past hour,
        # which are normally excluded from deletion protection checks. ACCOUNT_DEFAULT : The default setting,
        # which instructs AppConfig to implement the deletion protection value specified in the
        # UpdateAccountSettings API.

        @[JSON::Field(key: "x-amzn-deletion-protection-check")]
        getter deletion_protection_check : String?

        def initialize(
          @application_id : String,
          @configuration_profile_id : String,
          @deletion_protection_check : String? = nil
        )
        end
      end


      struct DeleteDeploymentStrategyRequest
        include JSON::Serializable

        # The ID of the deployment strategy you want to delete.

        @[JSON::Field(key: "DeploymentStrategyId")]
        getter deployment_strategy_id : String

        def initialize(
          @deployment_strategy_id : String
        )
        end
      end


      struct DeleteEnvironmentRequest
        include JSON::Serializable

        # The application ID that includes the environment that you want to delete.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The ID of the environment that you want to delete.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String

        # A parameter to configure deletion protection. Deletion protection prevents a user from deleting an
        # environment if your application called either GetLatestConfiguration or in the environment during
        # the specified interval. This parameter supports the following values: BYPASS : Instructs AppConfig
        # to bypass the deletion protection check and delete a configuration profile even if deletion
        # protection would have otherwise prevented it. APPLY : Instructs the deletion protection check to
        # run, even if deletion protection is disabled at the account level. APPLY also forces the deletion
        # protection check to run against resources created in the past hour, which are normally excluded from
        # deletion protection checks. ACCOUNT_DEFAULT : The default setting, which instructs AppConfig to
        # implement the deletion protection value specified in the UpdateAccountSettings API.

        @[JSON::Field(key: "x-amzn-deletion-protection-check")]
        getter deletion_protection_check : String?

        def initialize(
          @application_id : String,
          @environment_id : String,
          @deletion_protection_check : String? = nil
        )
        end
      end


      struct DeleteExtensionAssociationRequest
        include JSON::Serializable

        # The ID of the extension association to delete.

        @[JSON::Field(key: "ExtensionAssociationId")]
        getter extension_association_id : String

        def initialize(
          @extension_association_id : String
        )
        end
      end


      struct DeleteExtensionRequest
        include JSON::Serializable

        # The name, ID, or Amazon Resource Name (ARN) of the extension you want to delete.

        @[JSON::Field(key: "ExtensionIdentifier")]
        getter extension_identifier : String

        # A specific version of an extension to delete. If omitted, the highest version is deleted.

        @[JSON::Field(key: "version")]
        getter version_number : Int32?

        def initialize(
          @extension_identifier : String,
          @version_number : Int32? = nil
        )
        end
      end


      struct DeleteHostedConfigurationVersionRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The configuration profile ID.

        @[JSON::Field(key: "ConfigurationProfileId")]
        getter configuration_profile_id : String

        # The versions number to delete.

        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int32

        def initialize(
          @application_id : String,
          @configuration_profile_id : String,
          @version_number : Int32
        )
        end
      end

      # A parameter to configure deletion protection. Deletion protection prevents a user from deleting a
      # configuration profile or an environment if AppConfig has called either GetLatestConfiguration or for
      # the configuration profile or from the environment during the specified interval. The default
      # interval specified by ProtectionPeriodInMinutes is 60. DeletionProtectionCheck skips configuration
      # profiles and environments that were created in the past hour.

      struct DeletionProtectionSettings
        include JSON::Serializable

        # A parameter that indicates if deletion protection is enabled or not.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The time interval during which AppConfig monitors for calls to GetLatestConfiguration or for a
        # configuration profile or from an environment. AppConfig returns an error if a user calls or for the
        # designated configuration profile or environment. To bypass the error and delete a configuration
        # profile or an environment, specify BYPASS for the DeletionProtectionCheck parameter for either or .

        @[JSON::Field(key: "ProtectionPeriodInMinutes")]
        getter protection_period_in_minutes : Int32?

        def initialize(
          @enabled : Bool? = nil,
          @protection_period_in_minutes : Int32? = nil
        )
        end
      end


      struct Deployment
        include JSON::Serializable

        # The ID of the application that was deployed.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # A list of extensions that were processed as part of the deployment. The extensions that were
        # previously associated to the configuration profile, environment, or the application when
        # StartDeployment was called.

        @[JSON::Field(key: "AppliedExtensions")]
        getter applied_extensions : Array(Types::AppliedExtension)?

        # The time the deployment completed.

        @[JSON::Field(key: "CompletedAt")]
        getter completed_at : Time?

        # Information about the source location of the configuration.

        @[JSON::Field(key: "ConfigurationLocationUri")]
        getter configuration_location_uri : String?

        # The name of the configuration.

        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String?

        # The ID of the configuration profile that was deployed.

        @[JSON::Field(key: "ConfigurationProfileId")]
        getter configuration_profile_id : String?

        # The configuration version that was deployed.

        @[JSON::Field(key: "ConfigurationVersion")]
        getter configuration_version : String?

        # Total amount of time the deployment lasted.

        @[JSON::Field(key: "DeploymentDurationInMinutes")]
        getter deployment_duration_in_minutes : Int32?

        # The sequence number of the deployment.

        @[JSON::Field(key: "DeploymentNumber")]
        getter deployment_number : Int32?

        # The ID of the deployment strategy that was deployed.

        @[JSON::Field(key: "DeploymentStrategyId")]
        getter deployment_strategy_id : String?

        # The description of the deployment.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the environment that was deployed.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # A list containing all events related to a deployment. The most recent events are displayed first.

        @[JSON::Field(key: "EventLog")]
        getter event_log : Array(Types::DeploymentEvent)?

        # The amount of time that AppConfig monitored for alarms before considering the deployment to be
        # complete and no longer eligible for automatic rollback.

        @[JSON::Field(key: "FinalBakeTimeInMinutes")]
        getter final_bake_time_in_minutes : Int32?

        # The percentage of targets to receive a deployed configuration during each interval.

        @[JSON::Field(key: "GrowthFactor")]
        getter growth_factor : Float64?

        # The algorithm used to define how percentage grew over time.

        @[JSON::Field(key: "GrowthType")]
        getter growth_type : String?

        # The Amazon Resource Name of the Key Management Service key used to encrypt configuration data. You
        # can encrypt secrets stored in Secrets Manager, Amazon Simple Storage Service (Amazon S3) objects
        # encrypted with SSE-KMS, or secure string parameters stored in Amazon Web Services Systems Manager
        # Parameter Store.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The Key Management Service key identifier (key ID, key alias, or key ARN) provided when the resource
        # was created or updated.

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The percentage of targets for which the deployment is available.

        @[JSON::Field(key: "PercentageComplete")]
        getter percentage_complete : Float64?

        # The time the deployment started.

        @[JSON::Field(key: "StartedAt")]
        getter started_at : Time?

        # The state of the deployment.

        @[JSON::Field(key: "State")]
        getter state : String?

        # A user-defined label for an AppConfig hosted configuration version.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        def initialize(
          @application_id : String? = nil,
          @applied_extensions : Array(Types::AppliedExtension)? = nil,
          @completed_at : Time? = nil,
          @configuration_location_uri : String? = nil,
          @configuration_name : String? = nil,
          @configuration_profile_id : String? = nil,
          @configuration_version : String? = nil,
          @deployment_duration_in_minutes : Int32? = nil,
          @deployment_number : Int32? = nil,
          @deployment_strategy_id : String? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @event_log : Array(Types::DeploymentEvent)? = nil,
          @final_bake_time_in_minutes : Int32? = nil,
          @growth_factor : Float64? = nil,
          @growth_type : String? = nil,
          @kms_key_arn : String? = nil,
          @kms_key_identifier : String? = nil,
          @percentage_complete : Float64? = nil,
          @started_at : Time? = nil,
          @state : String? = nil,
          @version_label : String? = nil
        )
        end
      end

      # An object that describes a deployment event.

      struct DeploymentEvent
        include JSON::Serializable

        # The list of extensions that were invoked as part of the deployment.

        @[JSON::Field(key: "ActionInvocations")]
        getter action_invocations : Array(Types::ActionInvocation)?

        # A description of the deployment event. Descriptions include, but are not limited to, the following:
        # The Amazon Web Services account or the Amazon CloudWatch alarm ARN that initiated a rollback. The
        # percentage of hosts that received the deployment. A recommendation to attempt a new deployment (in
        # the case of an internal error).

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The type of deployment event. Deployment event types include the start, stop, or completion of a
        # deployment; a percentage update; the start or stop of a bake period; and the start or completion of
        # a rollback.

        @[JSON::Field(key: "EventType")]
        getter event_type : String?

        # The date and time the event occurred.

        @[JSON::Field(key: "OccurredAt")]
        getter occurred_at : Time?

        # The entity that triggered the deployment event. Events can be triggered by a user, AppConfig, an
        # Amazon CloudWatch alarm, or an internal error.

        @[JSON::Field(key: "TriggeredBy")]
        getter triggered_by : String?

        def initialize(
          @action_invocations : Array(Types::ActionInvocation)? = nil,
          @description : String? = nil,
          @event_type : String? = nil,
          @occurred_at : Time? = nil,
          @triggered_by : String? = nil
        )
        end
      end


      struct DeploymentStrategies
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::DeploymentStrategy)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DeploymentStrategy)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DeploymentStrategy
        include JSON::Serializable

        # Total amount of time the deployment lasted.

        @[JSON::Field(key: "DeploymentDurationInMinutes")]
        getter deployment_duration_in_minutes : Int32?

        # The description of the deployment strategy.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The amount of time that AppConfig monitored for alarms before considering the deployment to be
        # complete and no longer eligible for automatic rollback.

        @[JSON::Field(key: "FinalBakeTimeInMinutes")]
        getter final_bake_time_in_minutes : Int32?

        # The percentage of targets that received a deployed configuration during each interval.

        @[JSON::Field(key: "GrowthFactor")]
        getter growth_factor : Float64?

        # The algorithm used to define how percentage grew over time.

        @[JSON::Field(key: "GrowthType")]
        getter growth_type : String?

        # The deployment strategy ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the deployment strategy.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Save the deployment strategy to a Systems Manager (SSM) document.

        @[JSON::Field(key: "ReplicateTo")]
        getter replicate_to : String?

        def initialize(
          @deployment_duration_in_minutes : Int32? = nil,
          @description : String? = nil,
          @final_bake_time_in_minutes : Int32? = nil,
          @growth_factor : Float64? = nil,
          @growth_type : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @replicate_to : String? = nil
        )
        end
      end

      # Information about the deployment.

      struct DeploymentSummary
        include JSON::Serializable

        # Time the deployment completed.

        @[JSON::Field(key: "CompletedAt")]
        getter completed_at : Time?

        # The name of the configuration.

        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String?

        # The version of the configuration.

        @[JSON::Field(key: "ConfigurationVersion")]
        getter configuration_version : String?

        # Total amount of time the deployment lasted.

        @[JSON::Field(key: "DeploymentDurationInMinutes")]
        getter deployment_duration_in_minutes : Int32?

        # The sequence number of the deployment.

        @[JSON::Field(key: "DeploymentNumber")]
        getter deployment_number : Int32?

        # The amount of time that AppConfig monitors for alarms before considering the deployment to be
        # complete and no longer eligible for automatic rollback.

        @[JSON::Field(key: "FinalBakeTimeInMinutes")]
        getter final_bake_time_in_minutes : Int32?

        # The percentage of targets to receive a deployed configuration during each interval.

        @[JSON::Field(key: "GrowthFactor")]
        getter growth_factor : Float64?

        # The algorithm used to define how percentage grows over time.

        @[JSON::Field(key: "GrowthType")]
        getter growth_type : String?

        # The percentage of targets for which the deployment is available.

        @[JSON::Field(key: "PercentageComplete")]
        getter percentage_complete : Float64?

        # Time the deployment started.

        @[JSON::Field(key: "StartedAt")]
        getter started_at : Time?

        # The state of the deployment.

        @[JSON::Field(key: "State")]
        getter state : String?

        # A user-defined label for an AppConfig hosted configuration version.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        def initialize(
          @completed_at : Time? = nil,
          @configuration_name : String? = nil,
          @configuration_version : String? = nil,
          @deployment_duration_in_minutes : Int32? = nil,
          @deployment_number : Int32? = nil,
          @final_bake_time_in_minutes : Int32? = nil,
          @growth_factor : Float64? = nil,
          @growth_type : String? = nil,
          @percentage_complete : Float64? = nil,
          @started_at : Time? = nil,
          @state : String? = nil,
          @version_label : String? = nil
        )
        end
      end


      struct Deployments
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::DeploymentSummary)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DeploymentSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct Environment
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The description of the environment.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The environment ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Amazon CloudWatch alarms monitored during the deployment.

        @[JSON::Field(key: "Monitors")]
        getter monitors : Array(Types::Monitor)?

        # The name of the environment.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The state of the environment. An environment can be in one of the following states:
        # READY_FOR_DEPLOYMENT , DEPLOYING , ROLLING_BACK , or ROLLED_BACK

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @application_id : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @monitors : Array(Types::Monitor)? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct Environments
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::Environment)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Environment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct Extension
        include JSON::Serializable

        # The actions defined in the extension.

        @[JSON::Field(key: "Actions")]
        getter actions : Hash(String, Array(Types::Action))?

        # The system-generated Amazon Resource Name (ARN) for the extension.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Information about the extension.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The system-generated ID of the extension.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The extension name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The parameters accepted by the extension. You specify parameter values when you associate the
        # extension to an AppConfig resource by using the CreateExtensionAssociation API action. For Lambda
        # extension actions, these parameters are included in the Lambda request object.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Types::Parameter)?

        # The extension version number.

        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int32?

        def initialize(
          @actions : Hash(String, Array(Types::Action))? = nil,
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @parameters : Hash(String, Types::Parameter)? = nil,
          @version_number : Int32? = nil
        )
        end
      end


      struct ExtensionAssociation
        include JSON::Serializable

        # The system-generated Amazon Resource Name (ARN) for the extension.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ARN of the extension defined in the association.

        @[JSON::Field(key: "ExtensionArn")]
        getter extension_arn : String?

        # The version number for the extension defined in the association.

        @[JSON::Field(key: "ExtensionVersionNumber")]
        getter extension_version_number : Int32?

        # The system-generated ID for the association.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The parameter names and values defined in the association.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        # The ARNs of applications, configuration profiles, or environments defined in the association.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @arn : String? = nil,
          @extension_arn : String? = nil,
          @extension_version_number : Int32? = nil,
          @id : String? = nil,
          @parameters : Hash(String, String)? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # Information about an association between an extension and an AppConfig resource such as an
      # application, environment, or configuration profile. Call GetExtensionAssociation to get more
      # information about an association.

      struct ExtensionAssociationSummary
        include JSON::Serializable

        # The system-generated Amazon Resource Name (ARN) for the extension.

        @[JSON::Field(key: "ExtensionArn")]
        getter extension_arn : String?

        # The extension association ID. This ID is used to call other ExtensionAssociation API actions such as
        # GetExtensionAssociation or DeleteExtensionAssociation .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The ARNs of applications, configuration profiles, or environments defined in the association.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @extension_arn : String? = nil,
          @id : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end


      struct ExtensionAssociations
        include JSON::Serializable

        # The list of extension associations. Each item represents an extension association to an application,
        # environment, or configuration profile.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ExtensionAssociationSummary)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ExtensionAssociationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Information about an extension. Call GetExtension to get more information about an extension.

      struct ExtensionSummary
        include JSON::Serializable

        # The system-generated Amazon Resource Name (ARN) for the extension.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Information about the extension.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The system-generated ID of the extension.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The extension name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The extension version number.

        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int32?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @version_number : Int32? = nil
        )
        end
      end


      struct Extensions
        include JSON::Serializable

        # The list of available extensions. The list includes Amazon Web Services authored and user-created
        # extensions.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ExtensionSummary)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ExtensionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetApplicationRequest
        include JSON::Serializable

        # The ID of the application you want to get.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetConfigurationProfileRequest
        include JSON::Serializable

        # The ID of the application that includes the configuration profile you want to get.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The ID of the configuration profile that you want to get.

        @[JSON::Field(key: "ConfigurationProfileId")]
        getter configuration_profile_id : String

        def initialize(
          @application_id : String,
          @configuration_profile_id : String
        )
        end
      end


      struct GetConfigurationRequest
        include JSON::Serializable

        # The application to get. Specify either the application name or the application ID.

        @[JSON::Field(key: "Application")]
        getter application : String

        # The clientId parameter in the following command is a unique, user-specified ID to identify the
        # client for the configuration. This ID enables AppConfig to deploy the configuration in intervals, as
        # defined in the deployment strategy.

        @[JSON::Field(key: "client_id")]
        getter client_id : String

        # The configuration to get. Specify either the configuration name or the configuration ID.

        @[JSON::Field(key: "Configuration")]
        getter configuration : String

        # The environment to get. Specify either the environment name or the environment ID.

        @[JSON::Field(key: "Environment")]
        getter environment : String

        # The configuration version returned in the most recent GetConfiguration response. AppConfig uses the
        # value of the ClientConfigurationVersion parameter to identify the configuration version on your
        # clients. If you don’t send ClientConfigurationVersion with each call to GetConfiguration , your
        # clients receive the current configuration. You are charged each time your clients receive a
        # configuration. To avoid excess charges, we recommend you use the StartConfigurationSession and
        # GetLatestConfiguration APIs, which track the client configuration version on your behalf. If you
        # choose to continue using GetConfiguration , we recommend that you include the
        # ClientConfigurationVersion value with every call to GetConfiguration . The value to use for
        # ClientConfigurationVersion comes from the ConfigurationVersion attribute returned by
        # GetConfiguration when there is new or updated data, and should be saved for subsequent calls to
        # GetConfiguration . For more information about working with configurations, see Retrieving feature
        # flags and configuration data in AppConfig in the AppConfig User Guide .

        @[JSON::Field(key: "client_configuration_version")]
        getter client_configuration_version : String?

        def initialize(
          @application : String,
          @client_id : String,
          @configuration : String,
          @environment : String,
          @client_configuration_version : String? = nil
        )
        end
      end


      struct GetDeploymentRequest
        include JSON::Serializable

        # The ID of the application that includes the deployment you want to get.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The sequence number of the deployment.

        @[JSON::Field(key: "DeploymentNumber")]
        getter deployment_number : Int32

        # The ID of the environment that includes the deployment you want to get.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String

        def initialize(
          @application_id : String,
          @deployment_number : Int32,
          @environment_id : String
        )
        end
      end


      struct GetDeploymentStrategyRequest
        include JSON::Serializable

        # The ID of the deployment strategy to get.

        @[JSON::Field(key: "DeploymentStrategyId")]
        getter deployment_strategy_id : String

        def initialize(
          @deployment_strategy_id : String
        )
        end
      end


      struct GetEnvironmentRequest
        include JSON::Serializable

        # The ID of the application that includes the environment you want to get.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The ID of the environment that you want to get.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String

        def initialize(
          @application_id : String,
          @environment_id : String
        )
        end
      end


      struct GetExtensionAssociationRequest
        include JSON::Serializable

        # The extension association ID to get.

        @[JSON::Field(key: "ExtensionAssociationId")]
        getter extension_association_id : String

        def initialize(
          @extension_association_id : String
        )
        end
      end


      struct GetExtensionRequest
        include JSON::Serializable

        # The name, the ID, or the Amazon Resource Name (ARN) of the extension.

        @[JSON::Field(key: "ExtensionIdentifier")]
        getter extension_identifier : String

        # The extension version number. If no version number was defined, AppConfig uses the highest version.

        @[JSON::Field(key: "version_number")]
        getter version_number : Int32?

        def initialize(
          @extension_identifier : String,
          @version_number : Int32? = nil
        )
        end
      end


      struct GetHostedConfigurationVersionRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The configuration profile ID.

        @[JSON::Field(key: "ConfigurationProfileId")]
        getter configuration_profile_id : String

        # The version.

        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int32

        def initialize(
          @application_id : String,
          @configuration_profile_id : String,
          @version_number : Int32
        )
        end
      end


      struct HostedConfigurationVersion
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "Application-Id")]
        getter application_id : String?

        # The configuration profile ID.

        @[JSON::Field(key: "Configuration-Profile-Id")]
        getter configuration_profile_id : String?

        # The content of the configuration or the configuration data.

        @[JSON::Field(key: "Content")]
        getter content : Bytes?

        # A standard MIME type describing the format of the configuration content. For more information, see
        # Content-Type .

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # A description of the configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name of the Key Management Service key that was used to encrypt this specific
        # version of the configuration data in the AppConfig hosted configuration store.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # A user-defined label for an AppConfig hosted configuration version.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        # The configuration version.

        @[JSON::Field(key: "Version-Number")]
        getter version_number : Int32?

        def initialize(
          @application_id : String? = nil,
          @configuration_profile_id : String? = nil,
          @content : Bytes? = nil,
          @content_type : String? = nil,
          @description : String? = nil,
          @kms_key_arn : String? = nil,
          @version_label : String? = nil,
          @version_number : Int32? = nil
        )
        end
      end

      # Information about the configuration.

      struct HostedConfigurationVersionSummary
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The configuration profile ID.

        @[JSON::Field(key: "ConfigurationProfileId")]
        getter configuration_profile_id : String?

        # A standard MIME type describing the format of the configuration content. For more information, see
        # Content-Type .

        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # A description of the configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name of the Key Management Service key that was used to encrypt this specific
        # version of the configuration data in the AppConfig hosted configuration store.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # A user-defined label for an AppConfig hosted configuration version.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        # The configuration version.

        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int32?

        def initialize(
          @application_id : String? = nil,
          @configuration_profile_id : String? = nil,
          @content_type : String? = nil,
          @description : String? = nil,
          @kms_key_arn : String? = nil,
          @version_label : String? = nil,
          @version_number : Int32? = nil
        )
        end
      end


      struct HostedConfigurationVersions
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::HostedConfigurationVersionSummary)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::HostedConfigurationVersionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # There was an internal failure in the AppConfig service.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Detailed information about the bad request exception error when creating a hosted configuration
      # version.

      struct InvalidConfigurationDetail
        include JSON::Serializable

        # The invalid or out-of-range validation constraint in your JSON schema that failed validation.

        @[JSON::Field(key: "Constraint")]
        getter constraint : String?

        # Location of the validation constraint in the configuration JSON schema that failed validation.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The reason for an invalid configuration error.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The type of error for an invalid configuration.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # Details about an error with Lambda when a synchronous extension experiences an error during an
        # invocation.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @constraint : String? = nil,
          @location : String? = nil,
          @reason : String? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct ListApplicationsRequest
        include JSON::Serializable

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A token to start the list. Next token is a pagination token generated by AppConfig to describe what
        # page the previous List call ended on. For the first List request, the nextToken should not be set.
        # On subsequent calls, the nextToken parameter should be set to the previous responses nextToken
        # value. Use this token to get the next set of results.

        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfigurationProfilesRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        # A filter based on the type of configurations that the configuration profile contains. A
        # configuration can be a feature flag or a freeform configuration.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListDeploymentStrategiesRequest
        include JSON::Serializable

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeploymentsRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The environment ID.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String

        # The maximum number of items that may be returned for this call. If there are items that have not yet
        # been returned, the response will include a non-null NextToken that you can provide in a subsequent
        # call to get the next set of results.

        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # The token returned by a prior call to this operation indicating the next set of results to be
        # returned. If not specified, the operation will return the first set of results.

        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @environment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentsRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExtensionAssociationsRequest
        include JSON::Serializable

        # The name, the ID, or the Amazon Resource Name (ARN) of the extension.

        @[JSON::Field(key: "extension_identifier")]
        getter extension_identifier : String?

        # The version number for the extension defined in the association.

        @[JSON::Field(key: "extension_version_number")]
        getter extension_version_number : Int32?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results or pass null to get the
        # first set of results.

        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        # The ARN of an application, configuration profile, or environment.

        @[JSON::Field(key: "resource_identifier")]
        getter resource_identifier : String?

        def initialize(
          @extension_identifier : String? = nil,
          @extension_version_number : Int32? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_identifier : String? = nil
        )
        end
      end


      struct ListExtensionsRequest
        include JSON::Serializable

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # The extension name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListHostedConfigurationVersionsRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The configuration profile ID.

        @[JSON::Field(key: "ConfigurationProfileId")]
        getter configuration_profile_id : String

        # The maximum number of items to return for this call. If MaxResults is not provided in the call,
        # AppConfig returns the maximum of 50. The call also returns a token that you can specify in a
        # subsequent call to get the next set of results.

        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        # An optional filter that can be used to specify the version label of an AppConfig hosted
        # configuration version. This parameter supports filtering by prefix using a wildcard, for example
        # "v2*". If you don't specify an asterisk at the end of the value, only an exact match is returned.

        @[JSON::Field(key: "version_label")]
        getter version_label : String?

        def initialize(
          @application_id : String,
          @configuration_profile_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @version_label : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The resource ARN.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # Amazon CloudWatch alarms to monitor during the deployment process.

      struct Monitor
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Amazon CloudWatch alarm.

        @[JSON::Field(key: "AlarmArn")]
        getter alarm_arn : String

        # ARN of an Identity and Access Management (IAM) role for AppConfig to monitor AlarmArn .

        @[JSON::Field(key: "AlarmRoleArn")]
        getter alarm_role_arn : String?

        def initialize(
          @alarm_arn : String,
          @alarm_role_arn : String? = nil
        )
        end
      end

      # A value such as an Amazon Resource Name (ARN) or an Amazon Simple Notification Service topic entered
      # in an extension when invoked. Parameter values are specified in an extension association. For more
      # information about extensions, see Extending workflows in the AppConfig User Guide .

      struct Parameter
        include JSON::Serializable

        # Information about the parameter.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether this parameter's value can be supplied at the extension's action point instead of
        # during extension association. Dynamic parameters can't be marked Required .

        @[JSON::Field(key: "Dynamic")]
        getter dynamic : Bool?

        # A parameter value must be specified in the extension association.

        @[JSON::Field(key: "Required")]
        getter required : Bool?

        def initialize(
          @description : String? = nil,
          @dynamic : Bool? = nil,
          @required : Bool? = nil
        )
        end
      end

      # The configuration size is too large.

      struct PayloadTooLargeException
        include JSON::Serializable


        @[JSON::Field(key: "Limit")]
        getter limit : Float64?


        @[JSON::Field(key: "Measure")]
        getter measure : String?


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "Size")]
        getter size : Float64?

        def initialize(
          @limit : Float64? = nil,
          @measure : String? = nil,
          @message : String? = nil,
          @size : Float64? = nil
        )
        end
      end

      # The requested resource could not be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end


      struct ResourceTags
        include JSON::Serializable

        # Metadata to assign to AppConfig resources. Tags help organize and categorize your AppConfig
        # resources. Each tag consists of a key and an optional value, both of which you define.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The number of one more AppConfig resources exceeds the maximum allowed. Verify that your environment
      # doesn't exceed the following service quotas: Applications: 100 max Deployment strategies: 20 max
      # Configuration profiles: 100 max per application Environments: 20 max per application To resolve this
      # issue, you can delete one or more resources and try again. Or, you can request a quota increase. For
      # more information about quotas and to request an increase, see Service quotas for AppConfig in the
      # Amazon Web Services General Reference.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartDeploymentRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The configuration profile ID.

        @[JSON::Field(key: "ConfigurationProfileId")]
        getter configuration_profile_id : String

        # The configuration version to deploy. If deploying an AppConfig hosted configuration version, you can
        # specify either the version number or version label. For all other configurations, you must specify
        # the version number.

        @[JSON::Field(key: "ConfigurationVersion")]
        getter configuration_version : String

        # The deployment strategy ID.

        @[JSON::Field(key: "DeploymentStrategyId")]
        getter deployment_strategy_id : String

        # The environment ID.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String

        # A description of the deployment.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A map of dynamic extension parameter names to values to pass to associated extensions with
        # PRE_START_DEPLOYMENT actions.

        @[JSON::Field(key: "DynamicExtensionParameters")]
        getter dynamic_extension_parameters : Hash(String, String)?

        # The KMS key identifier (key ID, key alias, or key ARN). AppConfig uses this ID to encrypt the
        # configuration data using a customer managed key.

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # Metadata to assign to the deployment. Tags help organize and categorize your AppConfig resources.
        # Each tag consists of a key and an optional value, both of which you define.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_id : String,
          @configuration_profile_id : String,
          @configuration_version : String,
          @deployment_strategy_id : String,
          @environment_id : String,
          @description : String? = nil,
          @dynamic_extension_parameters : Hash(String, String)? = nil,
          @kms_key_identifier : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StopDeploymentRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The sequence number of the deployment.

        @[JSON::Field(key: "DeploymentNumber")]
        getter deployment_number : Int32

        # The environment ID.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String

        # A Boolean that enables AppConfig to rollback a COMPLETED deployment to the previous configuration
        # version. This action moves the deployment to a status of REVERTED .

        @[JSON::Field(key: "Allow-Revert")]
        getter allow_revert : Bool?

        def initialize(
          @application_id : String,
          @deployment_number : Int32,
          @environment_id : String,
          @allow_revert : Bool? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource for which to retrieve tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The key-value string map. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to 128
        # characters and must not start with aws: . The tag value can be up to 256 characters.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource for which to remove tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tag keys to delete.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateAccountSettingsRequest
        include JSON::Serializable

        # A parameter to configure deletion protection. Deletion protection prevents a user from deleting a
        # configuration profile or an environment if AppConfig has called either GetLatestConfiguration or for
        # the configuration profile or from the environment during the specified interval. The default
        # interval for ProtectionPeriodInMinutes is 60.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : Types::DeletionProtectionSettings?

        def initialize(
          @deletion_protection : Types::DeletionProtectionSettings? = nil
        )
        end
      end


      struct UpdateApplicationRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # A description of the application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @application_id : String,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateConfigurationProfileRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The ID of the configuration profile.

        @[JSON::Field(key: "ConfigurationProfileId")]
        getter configuration_profile_id : String

        # A description of the configuration profile.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier for a Key Management Service key to encrypt new configuration data versions in the
        # AppConfig hosted configuration store. This attribute is only used for hosted configuration types.
        # The identifier can be an KMS key ID, alias, or the Amazon Resource Name (ARN) of the key ID or
        # alias. To encrypt data managed in other configuration stores, see the documentation for how to
        # specify an KMS key for that particular service.

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The name of the configuration profile.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of an IAM role with permission to access the configuration at the specified LocationUri . A
        # retrieval role ARN is not required for configurations stored in CodePipeline or the AppConfig hosted
        # configuration store. It is required for all other sources that store your configuration.

        @[JSON::Field(key: "RetrievalRoleArn")]
        getter retrieval_role_arn : String?

        # A list of methods for validating the configuration.

        @[JSON::Field(key: "Validators")]
        getter validators : Array(Types::Validator)?

        def initialize(
          @application_id : String,
          @configuration_profile_id : String,
          @description : String? = nil,
          @kms_key_identifier : String? = nil,
          @name : String? = nil,
          @retrieval_role_arn : String? = nil,
          @validators : Array(Types::Validator)? = nil
        )
        end
      end


      struct UpdateDeploymentStrategyRequest
        include JSON::Serializable

        # The deployment strategy ID.

        @[JSON::Field(key: "DeploymentStrategyId")]
        getter deployment_strategy_id : String

        # Total amount of time for a deployment to last.

        @[JSON::Field(key: "DeploymentDurationInMinutes")]
        getter deployment_duration_in_minutes : Int32?

        # A description of the deployment strategy.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The amount of time that AppConfig monitors for alarms before considering the deployment to be
        # complete and no longer eligible for automatic rollback.

        @[JSON::Field(key: "FinalBakeTimeInMinutes")]
        getter final_bake_time_in_minutes : Int32?

        # The percentage of targets to receive a deployed configuration during each interval.

        @[JSON::Field(key: "GrowthFactor")]
        getter growth_factor : Float64?

        # The algorithm used to define how percentage grows over time. AppConfig supports the following growth
        # types: Linear : For this type, AppConfig processes the deployment by increments of the growth factor
        # evenly distributed over the deployment time. For example, a linear deployment that uses a growth
        # factor of 20 initially makes the configuration available to 20 percent of the targets. After 1/5th
        # of the deployment time has passed, the system updates the percentage to 40 percent. This continues
        # until 100% of the targets are set to receive the deployed configuration. Exponential : For this
        # type, AppConfig processes the deployment exponentially using the following formula: G*(2^N) . In
        # this formula, G is the growth factor specified by the user and N is the number of steps until the
        # configuration is deployed to all targets. For example, if you specify a growth factor of 2, then the
        # system rolls out the configuration as follows: 2*(2^0) 2*(2^1) 2*(2^2) Expressed numerically, the
        # deployment rolls out as follows: 2% of the targets, 4% of the targets, 8% of the targets, and
        # continues until the configuration has been deployed to all targets.

        @[JSON::Field(key: "GrowthType")]
        getter growth_type : String?

        def initialize(
          @deployment_strategy_id : String,
          @deployment_duration_in_minutes : Int32? = nil,
          @description : String? = nil,
          @final_bake_time_in_minutes : Int32? = nil,
          @growth_factor : Float64? = nil,
          @growth_type : String? = nil
        )
        end
      end


      struct UpdateEnvironmentRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The environment ID.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String

        # A description of the environment.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Amazon CloudWatch alarms to monitor during the deployment process.

        @[JSON::Field(key: "Monitors")]
        getter monitors : Array(Types::Monitor)?

        # The name of the environment.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @application_id : String,
          @environment_id : String,
          @description : String? = nil,
          @monitors : Array(Types::Monitor)? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateExtensionAssociationRequest
        include JSON::Serializable

        # The system-generated ID for the association.

        @[JSON::Field(key: "ExtensionAssociationId")]
        getter extension_association_id : String

        # The parameter names and values defined in the extension.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        def initialize(
          @extension_association_id : String,
          @parameters : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateExtensionRequest
        include JSON::Serializable

        # The name, the ID, or the Amazon Resource Name (ARN) of the extension.

        @[JSON::Field(key: "ExtensionIdentifier")]
        getter extension_identifier : String

        # The actions defined in the extension.

        @[JSON::Field(key: "Actions")]
        getter actions : Hash(String, Array(Types::Action))?

        # Information about the extension.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # One or more parameters for the actions called by the extension.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Types::Parameter)?

        # The extension version number.

        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int32?

        def initialize(
          @extension_identifier : String,
          @actions : Hash(String, Array(Types::Action))? = nil,
          @description : String? = nil,
          @parameters : Hash(String, Types::Parameter)? = nil,
          @version_number : Int32? = nil
        )
        end
      end


      struct ValidateConfigurationRequest
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The configuration profile ID.

        @[JSON::Field(key: "ConfigurationProfileId")]
        getter configuration_profile_id : String

        # The version of the configuration to validate.

        @[JSON::Field(key: "configuration_version")]
        getter configuration_version : String

        def initialize(
          @application_id : String,
          @configuration_profile_id : String,
          @configuration_version : String
        )
        end
      end

      # A validator provides a syntactic or semantic check to ensure the configuration that you want to
      # deploy functions as intended. To validate your application configuration data, you provide a schema
      # or an Amazon Web Services Lambda function that runs against the configuration. The configuration
      # deployment or update can only proceed when the configuration data is valid. For more information,
      # see About validators in the AppConfig User Guide .

      struct Validator
        include JSON::Serializable

        # Either the JSON Schema content or the Amazon Resource Name (ARN) of an Lambda function.

        @[JSON::Field(key: "Content")]
        getter content : String

        # AppConfig supports validators of type JSON_SCHEMA and LAMBDA

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @content : String,
          @type : String
        )
        end
      end
    end
  end
end
