require "json"

module AwsSdk
  module ServerlessApplicationRepository
    module Types

      # Details about the application.
      struct Application
        include JSON::Serializable

        # The application Amazon Resource Name (ARN).
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The name of the author publishing the app. Minimum length=1. Maximum length=127. Pattern
        # "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
        @[JSON::Field(key: "author")]
        getter author : String

        # The description of the application. Minimum length=1. Maximum length=256
        @[JSON::Field(key: "description")]
        getter description : String

        # The name of the application. Minimum length=1. Maximum length=140 Pattern: "[a-zA-Z0-9\\-]+";
        @[JSON::Field(key: "name")]
        getter name : String

        # The date and time this resource was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : String?

        # A URL with more information about the application, for example the location of your GitHub
        # repository for the application.
        @[JSON::Field(key: "homePageUrl")]
        getter home_page_url : String?

        # Whether the author of this application has been verified. This means means that AWS has made a good
        # faith review, as a reasonable and prudent service provider, of the information provided by the
        # requester and has confirmed that the requester's identity is as claimed.
        @[JSON::Field(key: "isVerifiedAuthor")]
        getter is_verified_author : Bool?

        # Labels to improve discovery of apps in search results. Minimum length=1. Maximum length=127. Maximum
        # number of labels: 10 Pattern: "^[a-zA-Z0-9+\\-_:\\/@]+$";
        @[JSON::Field(key: "labels")]
        getter labels : Array(String)?

        # A link to a license file of the app that matches the spdxLicenseID value of your application.
        # Maximum size 5 MB
        @[JSON::Field(key: "licenseUrl")]
        getter license_url : String?

        # A link to the readme file in Markdown language that contains a more detailed description of the
        # application and how it works. Maximum size 5 MB
        @[JSON::Field(key: "readmeUrl")]
        getter readme_url : String?

        # A valid identifier from https://spdx.org/licenses/.
        @[JSON::Field(key: "spdxLicenseId")]
        getter spdx_license_id : String?

        # The URL to the public profile of a verified author. This URL is submitted by the author.
        @[JSON::Field(key: "verifiedAuthorUrl")]
        getter verified_author_url : String?

        # Version information about the application.
        @[JSON::Field(key: "version")]
        getter version : Types::Version?

        def initialize(
          @application_id : String,
          @author : String,
          @description : String,
          @name : String,
          @creation_time : String? = nil,
          @home_page_url : String? = nil,
          @is_verified_author : Bool? = nil,
          @labels : Array(String)? = nil,
          @license_url : String? = nil,
          @readme_url : String? = nil,
          @spdx_license_id : String? = nil,
          @verified_author_url : String? = nil,
          @version : Types::Version? = nil
        )
        end
      end

      # A list of application summaries nested in the application.
      struct ApplicationDependencyPage
        include JSON::Serializable

        # An array of application summaries nested in the application.
        @[JSON::Field(key: "dependencies")]
        getter dependencies : Array(Types::ApplicationDependencySummary)

        # The token to request the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dependencies : Array(Types::ApplicationDependencySummary),
          @next_token : String? = nil
        )
        end
      end

      # A nested application summary.
      struct ApplicationDependencySummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the nested application.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The semantic version of the nested application.
        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        def initialize(
          @application_id : String,
          @semantic_version : String
        )
        end
      end

      # A list of application details.
      struct ApplicationPage
        include JSON::Serializable

        # An array of application summaries.
        @[JSON::Field(key: "applications")]
        getter applications : Array(Types::ApplicationSummary)

        # The token to request the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @applications : Array(Types::ApplicationSummary),
          @next_token : String? = nil
        )
        end
      end

      # Policy statements applied to the application.
      struct ApplicationPolicy
        include JSON::Serializable

        # An array of policy statements applied to the application.
        @[JSON::Field(key: "statements")]
        getter statements : Array(Types::ApplicationPolicyStatement)

        def initialize(
          @statements : Array(Types::ApplicationPolicyStatement)
        )
        end
      end

      # Policy statement applied to the application.
      struct ApplicationPolicyStatement
        include JSON::Serializable

        # For the list of actions supported for this operation, see Application Permissions .
        @[JSON::Field(key: "actions")]
        getter actions : Array(String)

        # An array of AWS account IDs, or * to make the application public.
        @[JSON::Field(key: "principals")]
        getter principals : Array(String)

        # An array of PrinciplalOrgIDs, which corresponds to AWS IAM aws:PrincipalOrgID global condition key.
        @[JSON::Field(key: "principalOrgIDs")]
        getter principal_org_i_ds : Array(String)?

        # A unique ID for the statement.
        @[JSON::Field(key: "statementId")]
        getter statement_id : String?

        def initialize(
          @actions : Array(String),
          @principals : Array(String),
          @principal_org_i_ds : Array(String)? = nil,
          @statement_id : String? = nil
        )
        end
      end

      # Summary of details about the application.
      struct ApplicationSummary
        include JSON::Serializable

        # The application Amazon Resource Name (ARN).
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The name of the author publishing the app. Minimum length=1. Maximum length=127. Pattern
        # "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
        @[JSON::Field(key: "author")]
        getter author : String

        # The description of the application. Minimum length=1. Maximum length=256
        @[JSON::Field(key: "description")]
        getter description : String

        # The name of the application. Minimum length=1. Maximum length=140 Pattern: "[a-zA-Z0-9\\-]+";
        @[JSON::Field(key: "name")]
        getter name : String

        # The date and time this resource was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : String?

        # A URL with more information about the application, for example the location of your GitHub
        # repository for the application.
        @[JSON::Field(key: "homePageUrl")]
        getter home_page_url : String?

        # Labels to improve discovery of apps in search results. Minimum length=1. Maximum length=127. Maximum
        # number of labels: 10 Pattern: "^[a-zA-Z0-9+\\-_:\\/@]+$";
        @[JSON::Field(key: "labels")]
        getter labels : Array(String)?

        # A valid identifier from https://spdx.org/licenses/ .
        @[JSON::Field(key: "spdxLicenseId")]
        getter spdx_license_id : String?

        def initialize(
          @application_id : String,
          @author : String,
          @description : String,
          @name : String,
          @creation_time : String? = nil,
          @home_page_url : String? = nil,
          @labels : Array(String)? = nil,
          @spdx_license_id : String? = nil
        )
        end
      end

      # A list of version summaries for the application.
      struct ApplicationVersionPage
        include JSON::Serializable

        # An array of version summaries for the application.
        @[JSON::Field(key: "versions")]
        getter versions : Array(Types::VersionSummary)

        # The token to request the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @versions : Array(Types::VersionSummary),
          @next_token : String? = nil
        )
        end
      end

      # One of the parameters in the request is invalid.
      struct BadRequestException
        include JSON::Serializable

        # 400
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # One of the parameters in the request is invalid.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Details of the change set.
      struct ChangeSetDetails
        include JSON::Serializable

        # The application Amazon Resource Name (ARN).
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The Amazon Resource Name (ARN) of the change set. Length constraints: Minimum length of 1. Pattern:
        # ARN:[-a-zA-Z0-9:/]*
        @[JSON::Field(key: "changeSetId")]
        getter change_set_id : String

        # The semantic version of the application: https://semver.org/
        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        # The unique ID of the stack.
        @[JSON::Field(key: "stackId")]
        getter stack_id : String

        def initialize(
          @application_id : String,
          @change_set_id : String,
          @semantic_version : String,
          @stack_id : String
        )
        end
      end

      # The resource already exists.
      struct ConflictException
        include JSON::Serializable

        # 409
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The resource already exists.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Create an application request.
      struct CreateApplicationInput
        include JSON::Serializable

        # The name of the author publishing the app. Minimum length=1. Maximum length=127. Pattern
        # "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
        @[JSON::Field(key: "author")]
        getter author : String

        # The description of the application. Minimum length=1. Maximum length=256
        @[JSON::Field(key: "description")]
        getter description : String

        # The name of the application that you want to publish. Minimum length=1. Maximum length=140 Pattern:
        # "[a-zA-Z0-9\\-]+";
        @[JSON::Field(key: "name")]
        getter name : String

        # A URL with more information about the application, for example the location of your GitHub
        # repository for the application.
        @[JSON::Field(key: "homePageUrl")]
        getter home_page_url : String?

        # Labels to improve discovery of apps in search results. Minimum length=1. Maximum length=127. Maximum
        # number of labels: 10 Pattern: "^[a-zA-Z0-9+\\-_:\\/@]+$";
        @[JSON::Field(key: "labels")]
        getter labels : Array(String)?

        # A local text file that contains the license of the app that matches the spdxLicenseID value of your
        # application. The file has the format file://&lt;path>/&lt;filename>. Maximum size 5 MB You can
        # specify only one of licenseBody and licenseUrl; otherwise, an error results.
        @[JSON::Field(key: "licenseBody")]
        getter license_body : String?

        # A link to the S3 object that contains the license of the app that matches the spdxLicenseID value of
        # your application. Maximum size 5 MB You can specify only one of licenseBody and licenseUrl;
        # otherwise, an error results.
        @[JSON::Field(key: "licenseUrl")]
        getter license_url : String?

        # A local text readme file in Markdown language that contains a more detailed description of the
        # application and how it works. The file has the format file://&lt;path>/&lt;filename>. Maximum size 5
        # MB You can specify only one of readmeBody and readmeUrl; otherwise, an error results.
        @[JSON::Field(key: "readmeBody")]
        getter readme_body : String?

        # A link to the S3 object in Markdown language that contains a more detailed description of the
        # application and how it works. Maximum size 5 MB You can specify only one of readmeBody and
        # readmeUrl; otherwise, an error results.
        @[JSON::Field(key: "readmeUrl")]
        getter readme_url : String?

        # The semantic version of the application: https://semver.org/
        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String?

        # A link to the S3 object that contains the ZIP archive of the source code for this version of your
        # application. Maximum size 50 MB
        @[JSON::Field(key: "sourceCodeArchiveUrl")]
        getter source_code_archive_url : String?

        # A link to a public repository for the source code of your application, for example the URL of a
        # specific GitHub commit.
        @[JSON::Field(key: "sourceCodeUrl")]
        getter source_code_url : String?

        # A valid identifier from https://spdx.org/licenses/ .
        @[JSON::Field(key: "spdxLicenseId")]
        getter spdx_license_id : String?

        # The local raw packaged AWS SAM template file of your application. The file has the format
        # file://&lt;path>/&lt;filename>. You can specify only one of templateBody and templateUrl; otherwise
        # an error results.
        @[JSON::Field(key: "templateBody")]
        getter template_body : String?

        # A link to the S3 object containing the packaged AWS SAM template of your application. You can
        # specify only one of templateBody and templateUrl; otherwise an error results.
        @[JSON::Field(key: "templateUrl")]
        getter template_url : String?

        def initialize(
          @author : String,
          @description : String,
          @name : String,
          @home_page_url : String? = nil,
          @labels : Array(String)? = nil,
          @license_body : String? = nil,
          @license_url : String? = nil,
          @readme_body : String? = nil,
          @readme_url : String? = nil,
          @semantic_version : String? = nil,
          @source_code_archive_url : String? = nil,
          @source_code_url : String? = nil,
          @spdx_license_id : String? = nil,
          @template_body : String? = nil,
          @template_url : String? = nil
        )
        end
      end

      struct CreateApplicationRequest
        include JSON::Serializable

        @[JSON::Field(key: "author")]
        getter author : String

        @[JSON::Field(key: "description")]
        getter description : String

        @[JSON::Field(key: "name")]
        getter name : String

        @[JSON::Field(key: "homePageUrl")]
        getter home_page_url : String?

        @[JSON::Field(key: "labels")]
        getter labels : Array(String)?

        @[JSON::Field(key: "licenseBody")]
        getter license_body : String?

        @[JSON::Field(key: "licenseUrl")]
        getter license_url : String?

        @[JSON::Field(key: "readmeBody")]
        getter readme_body : String?

        @[JSON::Field(key: "readmeUrl")]
        getter readme_url : String?

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String?

        @[JSON::Field(key: "sourceCodeArchiveUrl")]
        getter source_code_archive_url : String?

        @[JSON::Field(key: "sourceCodeUrl")]
        getter source_code_url : String?

        @[JSON::Field(key: "spdxLicenseId")]
        getter spdx_license_id : String?

        @[JSON::Field(key: "templateBody")]
        getter template_body : String?

        @[JSON::Field(key: "templateUrl")]
        getter template_url : String?

        def initialize(
          @author : String,
          @description : String,
          @name : String,
          @home_page_url : String? = nil,
          @labels : Array(String)? = nil,
          @license_body : String? = nil,
          @license_url : String? = nil,
          @readme_body : String? = nil,
          @readme_url : String? = nil,
          @semantic_version : String? = nil,
          @source_code_archive_url : String? = nil,
          @source_code_url : String? = nil,
          @spdx_license_id : String? = nil,
          @template_body : String? = nil,
          @template_url : String? = nil
        )
        end
      end

      struct CreateApplicationResponse
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        @[JSON::Field(key: "author")]
        getter author : String?

        @[JSON::Field(key: "creationTime")]
        getter creation_time : String?

        @[JSON::Field(key: "description")]
        getter description : String?

        @[JSON::Field(key: "homePageUrl")]
        getter home_page_url : String?

        @[JSON::Field(key: "isVerifiedAuthor")]
        getter is_verified_author : Bool?

        @[JSON::Field(key: "labels")]
        getter labels : Array(String)?

        @[JSON::Field(key: "licenseUrl")]
        getter license_url : String?

        @[JSON::Field(key: "name")]
        getter name : String?

        @[JSON::Field(key: "readmeUrl")]
        getter readme_url : String?

        @[JSON::Field(key: "spdxLicenseId")]
        getter spdx_license_id : String?

        @[JSON::Field(key: "verifiedAuthorUrl")]
        getter verified_author_url : String?

        @[JSON::Field(key: "version")]
        getter version : Types::Version?

        def initialize(
          @application_id : String? = nil,
          @author : String? = nil,
          @creation_time : String? = nil,
          @description : String? = nil,
          @home_page_url : String? = nil,
          @is_verified_author : Bool? = nil,
          @labels : Array(String)? = nil,
          @license_url : String? = nil,
          @name : String? = nil,
          @readme_url : String? = nil,
          @spdx_license_id : String? = nil,
          @verified_author_url : String? = nil,
          @version : Types::Version? = nil
        )
        end
      end

      # Create a version request.
      struct CreateApplicationVersionInput
        include JSON::Serializable

        # A link to the S3 object that contains the ZIP archive of the source code for this version of your
        # application. Maximum size 50 MB
        @[JSON::Field(key: "sourceCodeArchiveUrl")]
        getter source_code_archive_url : String?

        # A link to a public repository for the source code of your application, for example the URL of a
        # specific GitHub commit.
        @[JSON::Field(key: "sourceCodeUrl")]
        getter source_code_url : String?

        # The raw packaged AWS SAM template of your application.
        @[JSON::Field(key: "templateBody")]
        getter template_body : String?

        # A link to the packaged AWS SAM template of your application.
        @[JSON::Field(key: "templateUrl")]
        getter template_url : String?

        def initialize(
          @source_code_archive_url : String? = nil,
          @source_code_url : String? = nil,
          @template_body : String? = nil,
          @template_url : String? = nil
        )
        end
      end

      struct CreateApplicationVersionRequest
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        @[JSON::Field(key: "sourceCodeArchiveUrl")]
        getter source_code_archive_url : String?

        @[JSON::Field(key: "sourceCodeUrl")]
        getter source_code_url : String?

        @[JSON::Field(key: "templateBody")]
        getter template_body : String?

        @[JSON::Field(key: "templateUrl")]
        getter template_url : String?

        def initialize(
          @application_id : String,
          @semantic_version : String,
          @source_code_archive_url : String? = nil,
          @source_code_url : String? = nil,
          @template_body : String? = nil,
          @template_url : String? = nil
        )
        end
      end

      struct CreateApplicationVersionResponse
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        @[JSON::Field(key: "creationTime")]
        getter creation_time : String?

        @[JSON::Field(key: "parameterDefinitions")]
        getter parameter_definitions : Array(Types::ParameterDefinition)?

        @[JSON::Field(key: "requiredCapabilities")]
        getter required_capabilities : Array(String)?

        @[JSON::Field(key: "resourcesSupported")]
        getter resources_supported : Bool?

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String?

        @[JSON::Field(key: "sourceCodeArchiveUrl")]
        getter source_code_archive_url : String?

        @[JSON::Field(key: "sourceCodeUrl")]
        getter source_code_url : String?

        @[JSON::Field(key: "templateUrl")]
        getter template_url : String?

        def initialize(
          @application_id : String? = nil,
          @creation_time : String? = nil,
          @parameter_definitions : Array(Types::ParameterDefinition)? = nil,
          @required_capabilities : Array(String)? = nil,
          @resources_supported : Bool? = nil,
          @semantic_version : String? = nil,
          @source_code_archive_url : String? = nil,
          @source_code_url : String? = nil,
          @template_url : String? = nil
        )
        end
      end

      # Create an application change set request.
      struct CreateCloudFormationChangeSetInput
        include JSON::Serializable

        # This property corresponds to the parameter of the same name for the AWS CloudFormation
        # CreateChangeSet API.
        @[JSON::Field(key: "stackName")]
        getter stack_name : String

        # A list of values that you must specify before you can deploy certain applications. Some applications
        # might include resources that can affect permissions in your AWS account, for example, by creating
        # new AWS Identity and Access Management (IAM) users. For those applications, you must explicitly
        # acknowledge their capabilities by specifying this parameter. The only valid values are
        # CAPABILITY_IAM, CAPABILITY_NAMED_IAM, CAPABILITY_RESOURCE_POLICY, and CAPABILITY_AUTO_EXPAND. The
        # following resources require you to specify CAPABILITY_IAM or CAPABILITY_NAMED_IAM: AWS::IAM::Group ,
        # AWS::IAM::InstanceProfile , AWS::IAM::Policy , and AWS::IAM::Role . If the application contains IAM
        # resources, you can specify either CAPABILITY_IAM or CAPABILITY_NAMED_IAM. If the application
        # contains IAM resources with custom names, you must specify CAPABILITY_NAMED_IAM. The following
        # resources require you to specify CAPABILITY_RESOURCE_POLICY: AWS::Lambda::Permission ,
        # AWS::IAM:Policy , AWS::ApplicationAutoScaling::ScalingPolicy , AWS::S3::BucketPolicy ,
        # AWS::SQS::QueuePolicy , and AWS::SNS:TopicPolicy . Applications that contain one or more nested
        # applications require you to specify CAPABILITY_AUTO_EXPAND. If your application template contains
        # any of the above resources, we recommend that you review all permissions associated with the
        # application before deploying. If you don't specify this parameter for an application that requires
        # capabilities, the call will fail.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        # This property corresponds to the parameter of the same name for the AWS CloudFormation
        # CreateChangeSet API.
        @[JSON::Field(key: "changeSetName")]
        getter change_set_name : String?

        # This property corresponds to the parameter of the same name for the AWS CloudFormation
        # CreateChangeSet API.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # This property corresponds to the parameter of the same name for the AWS CloudFormation
        # CreateChangeSet API.
        @[JSON::Field(key: "description")]
        getter description : String?

        # This property corresponds to the parameter of the same name for the AWS CloudFormation
        # CreateChangeSet API.
        @[JSON::Field(key: "notificationArns")]
        getter notification_arns : Array(String)?

        # A list of parameter values for the parameters of the application.
        @[JSON::Field(key: "parameterOverrides")]
        getter parameter_overrides : Array(Types::ParameterValue)?

        # This property corresponds to the parameter of the same name for the AWS CloudFormation
        # CreateChangeSet API.
        @[JSON::Field(key: "resourceTypes")]
        getter resource_types : Array(String)?

        # This property corresponds to the parameter of the same name for the AWS CloudFormation
        # CreateChangeSet API.
        @[JSON::Field(key: "rollbackConfiguration")]
        getter rollback_configuration : Types::RollbackConfiguration?

        # The semantic version of the application: https://semver.org/
        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String?

        # This property corresponds to the parameter of the same name for the AWS CloudFormation
        # CreateChangeSet API.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The UUID returned by CreateCloudFormationTemplate. Pattern:
        # [0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}
        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        def initialize(
          @stack_name : String,
          @capabilities : Array(String)? = nil,
          @change_set_name : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @notification_arns : Array(String)? = nil,
          @parameter_overrides : Array(Types::ParameterValue)? = nil,
          @resource_types : Array(String)? = nil,
          @rollback_configuration : Types::RollbackConfiguration? = nil,
          @semantic_version : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @template_id : String? = nil
        )
        end
      end

      struct CreateCloudFormationChangeSetRequest
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        @[JSON::Field(key: "stackName")]
        getter stack_name : String

        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        @[JSON::Field(key: "changeSetName")]
        getter change_set_name : String?

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        @[JSON::Field(key: "description")]
        getter description : String?

        @[JSON::Field(key: "notificationArns")]
        getter notification_arns : Array(String)?

        @[JSON::Field(key: "parameterOverrides")]
        getter parameter_overrides : Array(Types::ParameterValue)?

        @[JSON::Field(key: "resourceTypes")]
        getter resource_types : Array(String)?

        @[JSON::Field(key: "rollbackConfiguration")]
        getter rollback_configuration : Types::RollbackConfiguration?

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String?

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        def initialize(
          @application_id : String,
          @stack_name : String,
          @capabilities : Array(String)? = nil,
          @change_set_name : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @notification_arns : Array(String)? = nil,
          @parameter_overrides : Array(Types::ParameterValue)? = nil,
          @resource_types : Array(String)? = nil,
          @rollback_configuration : Types::RollbackConfiguration? = nil,
          @semantic_version : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @template_id : String? = nil
        )
        end
      end

      struct CreateCloudFormationChangeSetResponse
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        @[JSON::Field(key: "changeSetId")]
        getter change_set_id : String?

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String?

        @[JSON::Field(key: "stackId")]
        getter stack_id : String?

        def initialize(
          @application_id : String? = nil,
          @change_set_id : String? = nil,
          @semantic_version : String? = nil,
          @stack_id : String? = nil
        )
        end
      end

      struct CreateCloudFormationTemplateRequest
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String?

        def initialize(
          @application_id : String,
          @semantic_version : String? = nil
        )
        end
      end

      struct CreateCloudFormationTemplateResponse
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        @[JSON::Field(key: "creationTime")]
        getter creation_time : String?

        @[JSON::Field(key: "expirationTime")]
        getter expiration_time : String?

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        @[JSON::Field(key: "templateUrl")]
        getter template_url : String?

        def initialize(
          @application_id : String? = nil,
          @creation_time : String? = nil,
          @expiration_time : String? = nil,
          @semantic_version : String? = nil,
          @status : String? = nil,
          @template_id : String? = nil,
          @template_url : String? = nil
        )
        end
      end

      struct DeleteApplicationRequest
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end

      # The client is not authenticated.
      struct ForbiddenException
        include JSON::Serializable

        # 403
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The client is not authenticated.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct GetApplicationPolicyRequest
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end

      struct GetApplicationPolicyResponse
        include JSON::Serializable

        @[JSON::Field(key: "statements")]
        getter statements : Array(Types::ApplicationPolicyStatement)?

        def initialize(
          @statements : Array(Types::ApplicationPolicyStatement)? = nil
        )
        end
      end

      struct GetApplicationRequest
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String?

        def initialize(
          @application_id : String,
          @semantic_version : String? = nil
        )
        end
      end

      struct GetApplicationResponse
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        @[JSON::Field(key: "author")]
        getter author : String?

        @[JSON::Field(key: "creationTime")]
        getter creation_time : String?

        @[JSON::Field(key: "description")]
        getter description : String?

        @[JSON::Field(key: "homePageUrl")]
        getter home_page_url : String?

        @[JSON::Field(key: "isVerifiedAuthor")]
        getter is_verified_author : Bool?

        @[JSON::Field(key: "labels")]
        getter labels : Array(String)?

        @[JSON::Field(key: "licenseUrl")]
        getter license_url : String?

        @[JSON::Field(key: "name")]
        getter name : String?

        @[JSON::Field(key: "readmeUrl")]
        getter readme_url : String?

        @[JSON::Field(key: "spdxLicenseId")]
        getter spdx_license_id : String?

        @[JSON::Field(key: "verifiedAuthorUrl")]
        getter verified_author_url : String?

        @[JSON::Field(key: "version")]
        getter version : Types::Version?

        def initialize(
          @application_id : String? = nil,
          @author : String? = nil,
          @creation_time : String? = nil,
          @description : String? = nil,
          @home_page_url : String? = nil,
          @is_verified_author : Bool? = nil,
          @labels : Array(String)? = nil,
          @license_url : String? = nil,
          @name : String? = nil,
          @readme_url : String? = nil,
          @spdx_license_id : String? = nil,
          @verified_author_url : String? = nil,
          @version : Types::Version? = nil
        )
        end
      end

      struct GetCloudFormationTemplateRequest
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        def initialize(
          @application_id : String,
          @template_id : String
        )
        end
      end

      struct GetCloudFormationTemplateResponse
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        @[JSON::Field(key: "creationTime")]
        getter creation_time : String?

        @[JSON::Field(key: "expirationTime")]
        getter expiration_time : String?

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        @[JSON::Field(key: "templateUrl")]
        getter template_url : String?

        def initialize(
          @application_id : String? = nil,
          @creation_time : String? = nil,
          @expiration_time : String? = nil,
          @semantic_version : String? = nil,
          @status : String? = nil,
          @template_id : String? = nil,
          @template_url : String? = nil
        )
        end
      end

      # The AWS Serverless Application Repository service encountered an internal error.
      struct InternalServerErrorException
        include JSON::Serializable

        # 500
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The AWS Serverless Application Repository service encountered an internal error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct ListApplicationDependenciesRequest
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        @[JSON::Field(key: "maxItems")]
        getter max_items : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String?

        def initialize(
          @application_id : String,
          @max_items : Int32? = nil,
          @next_token : String? = nil,
          @semantic_version : String? = nil
        )
        end
      end

      struct ListApplicationDependenciesResponse
        include JSON::Serializable

        @[JSON::Field(key: "dependencies")]
        getter dependencies : Array(Types::ApplicationDependencySummary)?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dependencies : Array(Types::ApplicationDependencySummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListApplicationVersionsRequest
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        @[JSON::Field(key: "maxItems")]
        getter max_items : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_items : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListApplicationVersionsResponse
        include JSON::Serializable

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        @[JSON::Field(key: "versions")]
        getter versions : Array(Types::VersionSummary)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(Types::VersionSummary)? = nil
        )
        end
      end

      struct ListApplicationsRequest
        include JSON::Serializable

        @[JSON::Field(key: "maxItems")]
        getter max_items : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_items : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListApplicationsResponse
        include JSON::Serializable

        @[JSON::Field(key: "applications")]
        getter applications : Array(Types::ApplicationSummary)?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @applications : Array(Types::ApplicationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The resource (for example, an access policy statement) specified in the request doesn't exist.
      struct NotFoundException
        include JSON::Serializable

        # 404
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The resource (for example, an access policy statement) specified in the request doesn't exist.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Parameters supported by the application.
      struct ParameterDefinition
        include JSON::Serializable

        # The name of the parameter.
        @[JSON::Field(key: "name")]
        getter name : String

        # A list of AWS SAM resources that use this parameter.
        @[JSON::Field(key: "referencedByResources")]
        getter referenced_by_resources : Array(String)

        # A regular expression that represents the patterns to allow for String types.
        @[JSON::Field(key: "allowedPattern")]
        getter allowed_pattern : String?

        # An array containing the list of values allowed for the parameter.
        @[JSON::Field(key: "allowedValues")]
        getter allowed_values : Array(String)?

        # A string that explains a constraint when the constraint is violated. For example, without a
        # constraint description, a parameter that has an allowed pattern of [A-Za-z0-9]+ displays the
        # following error message when the user specifies an invalid value: Malformed input-Parameter
        # MyParameter must match pattern [A-Za-z0-9]+ By adding a constraint description, such as "must
        # contain only uppercase and lowercase letters and numbers," you can display the following customized
        # error message: Malformed input-Parameter MyParameter must contain only uppercase and lowercase
        # letters and numbers.
        @[JSON::Field(key: "constraintDescription")]
        getter constraint_description : String?

        # A value of the appropriate type for the template to use if no value is specified when a stack is
        # created. If you define constraints for the parameter, you must specify a value that adheres to those
        # constraints.
        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # A string of up to 4,000 characters that describes the parameter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # An integer value that determines the largest number of characters that you want to allow for String
        # types.
        @[JSON::Field(key: "maxLength")]
        getter max_length : Int32?

        # A numeric value that determines the largest numeric value that you want to allow for Number types.
        @[JSON::Field(key: "maxValue")]
        getter max_value : Int32?

        # An integer value that determines the smallest number of characters that you want to allow for String
        # types.
        @[JSON::Field(key: "minLength")]
        getter min_length : Int32?

        # A numeric value that determines the smallest numeric value that you want to allow for Number types.
        @[JSON::Field(key: "minValue")]
        getter min_value : Int32?

        # Whether to mask the parameter value whenever anyone makes a call that describes the stack. If you
        # set the value to true, the parameter value is masked with asterisks (*****).
        @[JSON::Field(key: "noEcho")]
        getter no_echo : Bool?

        # The type of the parameter. Valid values: String | Number | List&lt;Number> | CommaDelimitedList
        # String: A literal string. For example, users can specify "MyUserName". Number: An integer or float.
        # AWS CloudFormation validates the parameter value as a number. However, when you use the parameter
        # elsewhere in your template (for example, by using the Ref intrinsic function), the parameter value
        # becomes a string. For example, users might specify "8888". List&lt;Number>: An array of integers or
        # floats that are separated by commas. AWS CloudFormation validates the parameter value as numbers.
        # However, when you use the parameter elsewhere in your template (for example, by using the Ref
        # intrinsic function), the parameter value becomes a list of strings. For example, users might specify
        # "80,20", and then Ref results in ["80","20"]. CommaDelimitedList: An array of literal strings that
        # are separated by commas. The total number of strings should be one more than the total number of
        # commas. Also, each member string is space-trimmed. For example, users might specify "test,dev,prod",
        # and then Ref results in ["test","dev","prod"].
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String,
          @referenced_by_resources : Array(String),
          @allowed_pattern : String? = nil,
          @allowed_values : Array(String)? = nil,
          @constraint_description : String? = nil,
          @default_value : String? = nil,
          @description : String? = nil,
          @max_length : Int32? = nil,
          @max_value : Int32? = nil,
          @min_length : Int32? = nil,
          @min_value : Int32? = nil,
          @no_echo : Bool? = nil,
          @type : String? = nil
        )
        end
      end

      # Parameter value of the application.
      struct ParameterValue
        include JSON::Serializable

        # The key associated with the parameter. If you don't specify a key and value for a particular
        # parameter, AWS CloudFormation uses the default value that is specified in your template.
        @[JSON::Field(key: "name")]
        getter name : String

        # The input value associated with the parameter.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      struct PutApplicationPolicyRequest
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        @[JSON::Field(key: "statements")]
        getter statements : Array(Types::ApplicationPolicyStatement)

        def initialize(
          @application_id : String,
          @statements : Array(Types::ApplicationPolicyStatement)
        )
        end
      end

      struct PutApplicationPolicyResponse
        include JSON::Serializable

        @[JSON::Field(key: "statements")]
        getter statements : Array(Types::ApplicationPolicyStatement)?

        def initialize(
          @statements : Array(Types::ApplicationPolicyStatement)? = nil
        )
        end
      end

      # This property corresponds to the AWS CloudFormation RollbackConfiguration Data Type.
      struct RollbackConfiguration
        include JSON::Serializable

        # This property corresponds to the content of the same name for the AWS CloudFormation
        # RollbackConfiguration Data Type.
        @[JSON::Field(key: "monitoringTimeInMinutes")]
        getter monitoring_time_in_minutes : Int32?

        # This property corresponds to the content of the same name for the AWS CloudFormation
        # RollbackConfiguration Data Type.
        @[JSON::Field(key: "rollbackTriggers")]
        getter rollback_triggers : Array(Types::RollbackTrigger)?

        def initialize(
          @monitoring_time_in_minutes : Int32? = nil,
          @rollback_triggers : Array(Types::RollbackTrigger)? = nil
        )
        end
      end

      # This property corresponds to the AWS CloudFormation RollbackTrigger Data Type.
      struct RollbackTrigger
        include JSON::Serializable

        # This property corresponds to the content of the same name for the AWS CloudFormation RollbackTrigger
        # Data Type.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # This property corresponds to the content of the same name for the AWS CloudFormation RollbackTrigger
        # Data Type.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @arn : String,
          @type : String
        )
        end
      end

      # This property corresponds to the AWS CloudFormation Tag Data Type.
      struct Tag
        include JSON::Serializable

        # This property corresponds to the content of the same name for the AWS CloudFormation Tag Data Type.
        @[JSON::Field(key: "key")]
        getter key : String

        # This property corresponds to the content of the same name for the AWS CloudFormation Tag Data Type.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Details of the template.
      struct TemplateDetails
        include JSON::Serializable

        # The application Amazon Resource Name (ARN).
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The date and time this resource was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : String

        # The date and time this template expires. Templates expire 1 hour after creation.
        @[JSON::Field(key: "expirationTime")]
        getter expiration_time : String

        # The semantic version of the application: https://semver.org/
        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        # Status of the template creation workflow. Possible values: PREPARING | ACTIVE | EXPIRED
        @[JSON::Field(key: "status")]
        getter status : String

        # The UUID returned by CreateCloudFormationTemplate. Pattern:
        # [0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}
        @[JSON::Field(key: "templateId")]
        getter template_id : String

        # A link to the template that can be used to deploy the application using AWS CloudFormation.
        @[JSON::Field(key: "templateUrl")]
        getter template_url : String

        def initialize(
          @application_id : String,
          @creation_time : String,
          @expiration_time : String,
          @semantic_version : String,
          @status : String,
          @template_id : String,
          @template_url : String
        )
        end
      end

      # The client is sending more than the allowed number of requests per unit of time.
      struct TooManyRequestsException
        include JSON::Serializable

        # 429
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The client is sending more than the allowed number of requests per unit of time.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Unshare application request.
      struct UnshareApplicationInput
        include JSON::Serializable

        # The AWS Organization ID to unshare the application from.
        @[JSON::Field(key: "organizationId")]
        getter organization_id : String

        def initialize(
          @organization_id : String
        )
        end
      end

      struct UnshareApplicationRequest
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        @[JSON::Field(key: "organizationId")]
        getter organization_id : String

        def initialize(
          @application_id : String,
          @organization_id : String
        )
        end
      end

      # Update the application request.
      struct UpdateApplicationInput
        include JSON::Serializable

        # The name of the author publishing the app. Minimum length=1. Maximum length=127. Pattern
        # "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
        @[JSON::Field(key: "author")]
        getter author : String?

        # The description of the application. Minimum length=1. Maximum length=256
        @[JSON::Field(key: "description")]
        getter description : String?

        # A URL with more information about the application, for example the location of your GitHub
        # repository for the application.
        @[JSON::Field(key: "homePageUrl")]
        getter home_page_url : String?

        # Labels to improve discovery of apps in search results. Minimum length=1. Maximum length=127. Maximum
        # number of labels: 10 Pattern: "^[a-zA-Z0-9+\\-_:\\/@]+$";
        @[JSON::Field(key: "labels")]
        getter labels : Array(String)?

        # A text readme file in Markdown language that contains a more detailed description of the application
        # and how it works. Maximum size 5 MB
        @[JSON::Field(key: "readmeBody")]
        getter readme_body : String?

        # A link to the readme file in Markdown language that contains a more detailed description of the
        # application and how it works. Maximum size 5 MB
        @[JSON::Field(key: "readmeUrl")]
        getter readme_url : String?

        def initialize(
          @author : String? = nil,
          @description : String? = nil,
          @home_page_url : String? = nil,
          @labels : Array(String)? = nil,
          @readme_body : String? = nil,
          @readme_url : String? = nil
        )
        end
      end

      struct UpdateApplicationRequest
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        @[JSON::Field(key: "author")]
        getter author : String?

        @[JSON::Field(key: "description")]
        getter description : String?

        @[JSON::Field(key: "homePageUrl")]
        getter home_page_url : String?

        @[JSON::Field(key: "labels")]
        getter labels : Array(String)?

        @[JSON::Field(key: "readmeBody")]
        getter readme_body : String?

        @[JSON::Field(key: "readmeUrl")]
        getter readme_url : String?

        def initialize(
          @application_id : String,
          @author : String? = nil,
          @description : String? = nil,
          @home_page_url : String? = nil,
          @labels : Array(String)? = nil,
          @readme_body : String? = nil,
          @readme_url : String? = nil
        )
        end
      end

      struct UpdateApplicationResponse
        include JSON::Serializable

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        @[JSON::Field(key: "author")]
        getter author : String?

        @[JSON::Field(key: "creationTime")]
        getter creation_time : String?

        @[JSON::Field(key: "description")]
        getter description : String?

        @[JSON::Field(key: "homePageUrl")]
        getter home_page_url : String?

        @[JSON::Field(key: "isVerifiedAuthor")]
        getter is_verified_author : Bool?

        @[JSON::Field(key: "labels")]
        getter labels : Array(String)?

        @[JSON::Field(key: "licenseUrl")]
        getter license_url : String?

        @[JSON::Field(key: "name")]
        getter name : String?

        @[JSON::Field(key: "readmeUrl")]
        getter readme_url : String?

        @[JSON::Field(key: "spdxLicenseId")]
        getter spdx_license_id : String?

        @[JSON::Field(key: "verifiedAuthorUrl")]
        getter verified_author_url : String?

        @[JSON::Field(key: "version")]
        getter version : Types::Version?

        def initialize(
          @application_id : String? = nil,
          @author : String? = nil,
          @creation_time : String? = nil,
          @description : String? = nil,
          @home_page_url : String? = nil,
          @is_verified_author : Bool? = nil,
          @labels : Array(String)? = nil,
          @license_url : String? = nil,
          @name : String? = nil,
          @readme_url : String? = nil,
          @spdx_license_id : String? = nil,
          @verified_author_url : String? = nil,
          @version : Types::Version? = nil
        )
        end
      end

      # Application version details.
      struct Version
        include JSON::Serializable

        # The application Amazon Resource Name (ARN).
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The date and time this resource was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : String

        # An array of parameter types supported by the application.
        @[JSON::Field(key: "parameterDefinitions")]
        getter parameter_definitions : Array(Types::ParameterDefinition)

        # A list of values that you must specify before you can deploy certain applications. Some applications
        # might include resources that can affect permissions in your AWS account, for example, by creating
        # new AWS Identity and Access Management (IAM) users. For those applications, you must explicitly
        # acknowledge their capabilities by specifying this parameter. The only valid values are
        # CAPABILITY_IAM, CAPABILITY_NAMED_IAM, CAPABILITY_RESOURCE_POLICY, and CAPABILITY_AUTO_EXPAND. The
        # following resources require you to specify CAPABILITY_IAM or CAPABILITY_NAMED_IAM: AWS::IAM::Group ,
        # AWS::IAM::InstanceProfile , AWS::IAM::Policy , and AWS::IAM::Role . If the application contains IAM
        # resources, you can specify either CAPABILITY_IAM or CAPABILITY_NAMED_IAM. If the application
        # contains IAM resources with custom names, you must specify CAPABILITY_NAMED_IAM. The following
        # resources require you to specify CAPABILITY_RESOURCE_POLICY: AWS::Lambda::Permission ,
        # AWS::IAM:Policy , AWS::ApplicationAutoScaling::ScalingPolicy , AWS::S3::BucketPolicy ,
        # AWS::SQS::QueuePolicy , and AWS::SNS::TopicPolicy . Applications that contain one or more nested
        # applications require you to specify CAPABILITY_AUTO_EXPAND. If your application template contains
        # any of the above resources, we recommend that you review all permissions associated with the
        # application before deploying. If you don't specify this parameter for an application that requires
        # capabilities, the call will fail.
        @[JSON::Field(key: "requiredCapabilities")]
        getter required_capabilities : Array(String)

        # Whether all of the AWS resources contained in this application are supported in the region in which
        # it is being retrieved.
        @[JSON::Field(key: "resourcesSupported")]
        getter resources_supported : Bool

        # The semantic version of the application: https://semver.org/
        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        # A link to the packaged AWS SAM template of your application.
        @[JSON::Field(key: "templateUrl")]
        getter template_url : String

        # A link to the S3 object that contains the ZIP archive of the source code for this version of your
        # application. Maximum size 50 MB
        @[JSON::Field(key: "sourceCodeArchiveUrl")]
        getter source_code_archive_url : String?

        # A link to a public repository for the source code of your application, for example the URL of a
        # specific GitHub commit.
        @[JSON::Field(key: "sourceCodeUrl")]
        getter source_code_url : String?

        def initialize(
          @application_id : String,
          @creation_time : String,
          @parameter_definitions : Array(Types::ParameterDefinition),
          @required_capabilities : Array(String),
          @resources_supported : Bool,
          @semantic_version : String,
          @template_url : String,
          @source_code_archive_url : String? = nil,
          @source_code_url : String? = nil
        )
        end
      end

      # An application version summary.
      struct VersionSummary
        include JSON::Serializable

        # The application Amazon Resource Name (ARN).
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The date and time this resource was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : String

        # The semantic version of the application: https://semver.org/
        @[JSON::Field(key: "semanticVersion")]
        getter semantic_version : String

        # A link to a public repository for the source code of your application, for example the URL of a
        # specific GitHub commit.
        @[JSON::Field(key: "sourceCodeUrl")]
        getter source_code_url : String?

        def initialize(
          @application_id : String,
          @creation_time : String,
          @semantic_version : String,
          @source_code_url : String? = nil
        )
        end
      end
    end
  end
end
