require "json"
require "time"

module AwsSdk
  module Amplify
    module Types

      # Represents the different branches of a repository for building, deploying, and hosting an Amplify
      # app.

      struct App
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amplify app.

        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The unique ID of the Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # A timestamp of when Amplify created the application.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The default domain for the Amplify app.

        @[JSON::Field(key: "defaultDomain")]
        getter default_domain : String

        # The description for the Amplify app.

        @[JSON::Field(key: "description")]
        getter description : String

        # Enables basic authorization for the Amplify app's branches.

        @[JSON::Field(key: "enableBasicAuth")]
        getter enable_basic_auth : Bool

        # Enables the auto-building of branches for the Amplify app.

        @[JSON::Field(key: "enableBranchAutoBuild")]
        getter enable_branch_auto_build : Bool

        # The environment variables for the Amplify app. For a list of the environment variables that are
        # accessible to Amplify by default, see Amplify Environment variables in the Amplify Hosting User
        # Guide .

        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)

        # The name for the Amplify app.

        @[JSON::Field(key: "name")]
        getter name : String

        # The platform for the Amplify app. For a static app, set the platform type to WEB . For a dynamic
        # server-side rendered (SSR) app, set the platform type to WEB_COMPUTE . For an app requiring Amplify
        # Hosting's original SSR support only, set the platform type to WEB_DYNAMIC . If you are deploying an
        # SSG only app with Next.js 14 or later, you must use the platform type WEB_COMPUTE .

        @[JSON::Field(key: "platform")]
        getter platform : String

        # The Git repository for the Amplify app.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # A timestamp of when Amplify updated the application.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # Describes the automated branch creation configuration for the Amplify app.

        @[JSON::Field(key: "autoBranchCreationConfig")]
        getter auto_branch_creation_config : Types::AutoBranchCreationConfig?

        # Describes the automated branch creation glob patterns for the Amplify app.

        @[JSON::Field(key: "autoBranchCreationPatterns")]
        getter auto_branch_creation_patterns : Array(String)?

        # The basic authorization credentials for branches for the Amplify app. You must base64-encode the
        # authorization credentials and provide them in the format user:password .

        @[JSON::Field(key: "basicAuthCredentials")]
        getter basic_auth_credentials : String?

        # Describes the content of the build specification (build spec) for the Amplify app.

        @[JSON::Field(key: "buildSpec")]
        getter build_spec : String?

        # The cache configuration for the Amplify app. If you don't specify the cache configuration type ,
        # Amplify uses the default AMPLIFY_MANAGED setting.

        @[JSON::Field(key: "cacheConfig")]
        getter cache_config : Types::CacheConfig?

        # The Amazon Resource Name (ARN) of the IAM role for an SSR app. The Compute role allows the Amplify
        # Hosting compute service to securely access specific Amazon Web Services resources based on the
        # role's permissions. For more information about the SSR Compute role, see Adding an SSR Compute role
        # in the Amplify User Guide .

        @[JSON::Field(key: "computeRoleArn")]
        getter compute_role_arn : String?

        # Describes the custom HTTP headers for the Amplify app.

        @[JSON::Field(key: "customHeaders")]
        getter custom_headers : String?

        # Describes the custom redirect and rewrite rules for the Amplify app.

        @[JSON::Field(key: "customRules")]
        getter custom_rules : Array(Types::CustomRule)?

        # Enables automated branch creation for the Amplify app.

        @[JSON::Field(key: "enableAutoBranchCreation")]
        getter enable_auto_branch_creation : Bool?

        # Automatically disconnect a branch in the Amplify console when you delete a branch from your Git
        # repository.

        @[JSON::Field(key: "enableBranchAutoDeletion")]
        getter enable_branch_auto_deletion : Bool?

        # The Amazon Resource Name (ARN) of the IAM service role for the Amplify app.

        @[JSON::Field(key: "iamServiceRoleArn")]
        getter iam_service_role_arn : String?

        # The configuration details that apply to the jobs for an Amplify app.

        @[JSON::Field(key: "jobConfig")]
        getter job_config : Types::JobConfig?

        # Describes the information about a production branch of the Amplify app.

        @[JSON::Field(key: "productionBranch")]
        getter production_branch : Types::ProductionBranch?

        # This is for internal use. The Amplify service uses this parameter to specify the authentication
        # protocol to use to access the Git repository for an Amplify app. Amplify specifies TOKEN for a
        # GitHub repository, SIGV4 for an Amazon Web Services CodeCommit repository, and SSH for GitLab and
        # Bitbucket repositories.

        @[JSON::Field(key: "repositoryCloneMethod")]
        getter repository_clone_method : String?

        # The tag for the Amplify app.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Describes the Firewall configuration for the Amplify app. Firewall support enables you to protect
        # your hosted applications with a direct integration with WAF.

        @[JSON::Field(key: "wafConfiguration")]
        getter waf_configuration : Types::WafConfiguration?

        # A timestamp of when Amplify created the webhook in your Git repository.

        @[JSON::Field(key: "webhookCreateTime")]
        getter webhook_create_time : Time?

        def initialize(
          @app_arn : String,
          @app_id : String,
          @create_time : Time,
          @default_domain : String,
          @description : String,
          @enable_basic_auth : Bool,
          @enable_branch_auto_build : Bool,
          @environment_variables : Hash(String, String),
          @name : String,
          @platform : String,
          @repository : String,
          @update_time : Time,
          @auto_branch_creation_config : Types::AutoBranchCreationConfig? = nil,
          @auto_branch_creation_patterns : Array(String)? = nil,
          @basic_auth_credentials : String? = nil,
          @build_spec : String? = nil,
          @cache_config : Types::CacheConfig? = nil,
          @compute_role_arn : String? = nil,
          @custom_headers : String? = nil,
          @custom_rules : Array(Types::CustomRule)? = nil,
          @enable_auto_branch_creation : Bool? = nil,
          @enable_branch_auto_deletion : Bool? = nil,
          @iam_service_role_arn : String? = nil,
          @job_config : Types::JobConfig? = nil,
          @production_branch : Types::ProductionBranch? = nil,
          @repository_clone_method : String? = nil,
          @tags : Hash(String, String)? = nil,
          @waf_configuration : Types::WafConfiguration? = nil,
          @webhook_create_time : Time? = nil
        )
        end
      end

      # Describes an artifact.

      struct Artifact
        include JSON::Serializable

        # The file name for the artifact.

        @[JSON::Field(key: "artifactFileName")]
        getter artifact_file_name : String

        # The unique ID for the artifact.

        @[JSON::Field(key: "artifactId")]
        getter artifact_id : String

        def initialize(
          @artifact_file_name : String,
          @artifact_id : String
        )
        end
      end

      # Describes the automated branch creation configuration.

      struct AutoBranchCreationConfig
        include JSON::Serializable

        # The basic authorization credentials for the autocreated branch. You must base64-encode the
        # authorization credentials and provide them in the format user:password .

        @[JSON::Field(key: "basicAuthCredentials")]
        getter basic_auth_credentials : String?

        # The build specification (build spec) for the autocreated branch.

        @[JSON::Field(key: "buildSpec")]
        getter build_spec : String?

        # Enables auto building for the autocreated branch.

        @[JSON::Field(key: "enableAutoBuild")]
        getter enable_auto_build : Bool?

        # Enables basic authorization for the autocreated branch.

        @[JSON::Field(key: "enableBasicAuth")]
        getter enable_basic_auth : Bool?

        # Enables performance mode for the branch. Performance mode optimizes for faster hosting performance
        # by keeping content cached at the edge for a longer interval. When performance mode is enabled,
        # hosting configuration or code changes can take up to 10 minutes to roll out.

        @[JSON::Field(key: "enablePerformanceMode")]
        getter enable_performance_mode : Bool?

        # Enables pull request previews for the autocreated branch.

        @[JSON::Field(key: "enablePullRequestPreview")]
        getter enable_pull_request_preview : Bool?

        # The environment variables for the autocreated branch.

        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)?

        # The framework for the autocreated branch.

        @[JSON::Field(key: "framework")]
        getter framework : String?

        # The Amplify environment name for the pull request.

        @[JSON::Field(key: "pullRequestEnvironmentName")]
        getter pull_request_environment_name : String?

        # Describes the current stage for the autocreated branch.

        @[JSON::Field(key: "stage")]
        getter stage : String?

        def initialize(
          @basic_auth_credentials : String? = nil,
          @build_spec : String? = nil,
          @enable_auto_build : Bool? = nil,
          @enable_basic_auth : Bool? = nil,
          @enable_performance_mode : Bool? = nil,
          @enable_pull_request_preview : Bool? = nil,
          @environment_variables : Hash(String, String)? = nil,
          @framework : String? = nil,
          @pull_request_environment_name : String? = nil,
          @stage : String? = nil
        )
        end
      end

      # Describes the backend associated with an Amplify Branch . This property is available to Amplify Gen
      # 2 apps only. When you deploy an application with Amplify Gen 2, you provision the app's backend
      # infrastructure using Typescript code.

      struct Backend
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the CloudFormation stack.

        @[JSON::Field(key: "stackArn")]
        getter stack_arn : String?

        def initialize(
          @stack_arn : String? = nil
        )
        end
      end

      # Describes the backend environment associated with a Branch of a Gen 1 Amplify app. Amplify Gen 1
      # applications are created using Amplify Studio or the Amplify command line interface (CLI).

      struct BackendEnvironment
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for a backend environment that is part of an Amplify app.

        @[JSON::Field(key: "backendEnvironmentArn")]
        getter backend_environment_arn : String

        # The creation date and time for a backend environment that is part of an Amplify app.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name for a backend environment that is part of an Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The last updated date and time for a backend environment that is part of an Amplify app.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The name of deployment artifacts.

        @[JSON::Field(key: "deploymentArtifacts")]
        getter deployment_artifacts : String?

        # The AWS CloudFormation stack name of a backend environment.

        @[JSON::Field(key: "stackName")]
        getter stack_name : String?

        def initialize(
          @backend_environment_arn : String,
          @create_time : Time,
          @environment_name : String,
          @update_time : Time,
          @deployment_artifacts : String? = nil,
          @stack_name : String? = nil
        )
        end
      end

      # A request contains unexpected data.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The branch for an Amplify app, which maps to a third-party repository branch.

      struct Branch
        include JSON::Serializable

        # The ID of the active job for a branch of an Amplify app.

        @[JSON::Field(key: "activeJobId")]
        getter active_job_id : String

        # The Amazon Resource Name (ARN) for a branch that is part of an Amplify app.

        @[JSON::Field(key: "branchArn")]
        getter branch_arn : String

        # The name for the branch that is part of an Amplify app.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # A timestamp of when Amplify created the branch.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The custom domains for a branch of an Amplify app.

        @[JSON::Field(key: "customDomains")]
        getter custom_domains : Array(String)

        # The description for the branch that is part of an Amplify app.

        @[JSON::Field(key: "description")]
        getter description : String

        # The display name for the branch. This is used as the default domain prefix.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # Enables auto-building on push for a branch of an Amplify app.

        @[JSON::Field(key: "enableAutoBuild")]
        getter enable_auto_build : Bool

        # Enables basic authorization for a branch of an Amplify app.

        @[JSON::Field(key: "enableBasicAuth")]
        getter enable_basic_auth : Bool

        # Enables notifications for a branch that is part of an Amplify app.

        @[JSON::Field(key: "enableNotification")]
        getter enable_notification : Bool

        # Enables pull request previews for the branch.

        @[JSON::Field(key: "enablePullRequestPreview")]
        getter enable_pull_request_preview : Bool

        # The environment variables specific to a branch of an Amplify app.

        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)

        # The framework for a branch of an Amplify app.

        @[JSON::Field(key: "framework")]
        getter framework : String

        # The current stage for the branch that is part of an Amplify app.

        @[JSON::Field(key: "stage")]
        getter stage : String

        # The total number of jobs that are part of an Amplify app.

        @[JSON::Field(key: "totalNumberOfJobs")]
        getter total_number_of_jobs : String

        # The content Time to Live (TTL) for the website in seconds.

        @[JSON::Field(key: "ttl")]
        getter ttl : String

        # A timestamp for the last updated time for a branch.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # A list of custom resources that are linked to this branch.

        @[JSON::Field(key: "associatedResources")]
        getter associated_resources : Array(String)?


        @[JSON::Field(key: "backend")]
        getter backend : Types::Backend?

        # The Amazon Resource Name (ARN) for a backend environment that is part of an Amplify app. This
        # property is available to Amplify Gen 1 apps only. When you deploy an application with Amplify Gen 2,
        # you provision the app's backend infrastructure using Typescript code.

        @[JSON::Field(key: "backendEnvironmentArn")]
        getter backend_environment_arn : String?

        # The basic authorization credentials for a branch of an Amplify app. You must base64-encode the
        # authorization credentials and provide them in the format user:password .

        @[JSON::Field(key: "basicAuthCredentials")]
        getter basic_auth_credentials : String?

        # The build specification (build spec) content for the branch of an Amplify app.

        @[JSON::Field(key: "buildSpec")]
        getter build_spec : String?

        # The Amazon Resource Name (ARN) of the IAM role for a branch of an SSR app. The Compute role allows
        # the Amplify Hosting compute service to securely access specific Amazon Web Services resources based
        # on the role's permissions. For more information about the SSR Compute role, see Adding an SSR
        # Compute role in the Amplify User Guide .

        @[JSON::Field(key: "computeRoleArn")]
        getter compute_role_arn : String?

        # The destination branch if the branch is a pull request branch.

        @[JSON::Field(key: "destinationBranch")]
        getter destination_branch : String?

        # Enables performance mode for the branch. Performance mode optimizes for faster hosting performance
        # by keeping content cached at the edge for a longer interval. When performance mode is enabled,
        # hosting configuration or code changes can take up to 10 minutes to roll out.

        @[JSON::Field(key: "enablePerformanceMode")]
        getter enable_performance_mode : Bool?

        # Specifies whether the skew protection feature is enabled for the branch. Deployment skew protection
        # is available to Amplify applications to eliminate version skew issues between client and servers in
        # web applications. When you apply skew protection to a branch, you can ensure that your clients
        # always interact with the correct version of server-side assets, regardless of when a deployment
        # occurs. For more information about skew protection, see Skew protection for Amplify deployments in
        # the Amplify User Guide .

        @[JSON::Field(key: "enableSkewProtection")]
        getter enable_skew_protection : Bool?

        # The Amplify environment name for the pull request.

        @[JSON::Field(key: "pullRequestEnvironmentName")]
        getter pull_request_environment_name : String?

        # The source branch if the branch is a pull request branch.

        @[JSON::Field(key: "sourceBranch")]
        getter source_branch : String?

        # The tag for the branch of an Amplify app.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The thumbnail URL for the branch of an Amplify app.

        @[JSON::Field(key: "thumbnailUrl")]
        getter thumbnail_url : String?

        def initialize(
          @active_job_id : String,
          @branch_arn : String,
          @branch_name : String,
          @create_time : Time,
          @custom_domains : Array(String),
          @description : String,
          @display_name : String,
          @enable_auto_build : Bool,
          @enable_basic_auth : Bool,
          @enable_notification : Bool,
          @enable_pull_request_preview : Bool,
          @environment_variables : Hash(String, String),
          @framework : String,
          @stage : String,
          @total_number_of_jobs : String,
          @ttl : String,
          @update_time : Time,
          @associated_resources : Array(String)? = nil,
          @backend : Types::Backend? = nil,
          @backend_environment_arn : String? = nil,
          @basic_auth_credentials : String? = nil,
          @build_spec : String? = nil,
          @compute_role_arn : String? = nil,
          @destination_branch : String? = nil,
          @enable_performance_mode : Bool? = nil,
          @enable_skew_protection : Bool? = nil,
          @pull_request_environment_name : String? = nil,
          @source_branch : String? = nil,
          @tags : Hash(String, String)? = nil,
          @thumbnail_url : String? = nil
        )
        end
      end

      # Describes the cache configuration for an Amplify app. For more information about how Amplify applies
      # an optimal cache configuration for your app based on the type of content that is being served, see
      # Managing cache configuration in the Amplify User guide .

      struct CacheConfig
        include JSON::Serializable

        # The type of cache configuration to use for an Amplify app. The AMPLIFY_MANAGED cache configuration
        # automatically applies an optimized cache configuration for your app based on its platform, routing
        # rules, and rewrite rules. The AMPLIFY_MANAGED_NO_COOKIES cache configuration type is the same as
        # AMPLIFY_MANAGED , except that it excludes all cookies from the cache key. This is the default
        # setting.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # Describes the current SSL/TLS certificate that is in use for the domain. If you are using
      # CreateDomainAssociation to create a new domain association, Certificate describes the new
      # certificate that you are creating.

      struct Certificate
        include JSON::Serializable

        # The type of SSL/TLS certificate that you want to use. Specify AMPLIFY_MANAGED to use the default
        # certificate that Amplify provisions for you. Specify CUSTOM to use your own certificate that you
        # have already added to Certificate Manager in your Amazon Web Services account. Make sure you request
        # (or import) the certificate in the US East (N. Virginia) Region (us-east-1). For more information
        # about using ACM, see Importing certificates into Certificate Manager in the ACM User guide .

        @[JSON::Field(key: "type")]
        getter type : String

        # The DNS record for certificate verification.

        @[JSON::Field(key: "certificateVerificationDNSRecord")]
        getter certificate_verification_dns_record : String?

        # The Amazon resource name (ARN) for a custom certificate that you have already added to Certificate
        # Manager in your Amazon Web Services account. This field is required only when the certificate type
        # is CUSTOM .

        @[JSON::Field(key: "customCertificateArn")]
        getter custom_certificate_arn : String?

        def initialize(
          @type : String,
          @certificate_verification_dns_record : String? = nil,
          @custom_certificate_arn : String? = nil
        )
        end
      end

      # The type of SSL/TLS certificate to use for your custom domain. If a certificate type isn't
      # specified, Amplify uses the default AMPLIFY_MANAGED certificate.

      struct CertificateSettings
        include JSON::Serializable

        # The certificate type. Specify AMPLIFY_MANAGED to use the default certificate that Amplify provisions
        # for you. Specify CUSTOM to use your own certificate that you have already added to Certificate
        # Manager in your Amazon Web Services account. Make sure you request (or import) the certificate in
        # the US East (N. Virginia) Region (us-east-1). For more information about using ACM, see Importing
        # certificates into Certificate Manager in the ACM User guide .

        @[JSON::Field(key: "type")]
        getter type : String

        # The Amazon resource name (ARN) for the custom certificate that you have already added to Certificate
        # Manager in your Amazon Web Services account. This field is required only when the certificate type
        # is CUSTOM .

        @[JSON::Field(key: "customCertificateArn")]
        getter custom_certificate_arn : String?

        def initialize(
          @type : String,
          @custom_certificate_arn : String? = nil
        )
        end
      end

      # The request structure used to create apps in Amplify.

      struct CreateAppRequest
        include JSON::Serializable

        # The name of the Amplify app.

        @[JSON::Field(key: "name")]
        getter name : String

        # The personal access token for a GitHub repository for an Amplify app. The personal access token is
        # used to authorize access to a GitHub repository using the Amplify GitHub App. The token is not
        # stored. Use accessToken for GitHub repositories only. To authorize access to a repository provider
        # such as Bitbucket or CodeCommit, use oauthToken . You must specify either accessToken or oauthToken
        # when you create a new app. Existing Amplify apps deployed from a GitHub repository using OAuth
        # continue to work with CI/CD. However, we strongly recommend that you migrate these apps to use the
        # GitHub App. For more information, see Migrating an existing OAuth app to the Amplify GitHub App in
        # the Amplify User Guide .

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The automated branch creation configuration for an Amplify app.

        @[JSON::Field(key: "autoBranchCreationConfig")]
        getter auto_branch_creation_config : Types::AutoBranchCreationConfig?

        # The automated branch creation glob patterns for an Amplify app.

        @[JSON::Field(key: "autoBranchCreationPatterns")]
        getter auto_branch_creation_patterns : Array(String)?

        # The credentials for basic authorization for an Amplify app. You must base64-encode the authorization
        # credentials and provide them in the format user:password .

        @[JSON::Field(key: "basicAuthCredentials")]
        getter basic_auth_credentials : String?

        # The build specification (build spec) for an Amplify app.

        @[JSON::Field(key: "buildSpec")]
        getter build_spec : String?

        # The cache configuration for the Amplify app.

        @[JSON::Field(key: "cacheConfig")]
        getter cache_config : Types::CacheConfig?

        # The Amazon Resource Name (ARN) of the IAM role to assign to an SSR app. The SSR Compute role allows
        # the Amplify Hosting compute service to securely access specific Amazon Web Services resources based
        # on the role's permissions. For more information about the SSR Compute role, see Adding an SSR
        # Compute role in the Amplify User Guide .

        @[JSON::Field(key: "computeRoleArn")]
        getter compute_role_arn : String?

        # The custom HTTP headers for an Amplify app.

        @[JSON::Field(key: "customHeaders")]
        getter custom_headers : String?

        # The custom rewrite and redirect rules for an Amplify app.

        @[JSON::Field(key: "customRules")]
        getter custom_rules : Array(Types::CustomRule)?

        # The description of the Amplify app.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Enables automated branch creation for an Amplify app.

        @[JSON::Field(key: "enableAutoBranchCreation")]
        getter enable_auto_branch_creation : Bool?

        # Enables basic authorization for an Amplify app. This will apply to all branches that are part of
        # this app.

        @[JSON::Field(key: "enableBasicAuth")]
        getter enable_basic_auth : Bool?

        # Enables the auto building of branches for an Amplify app.

        @[JSON::Field(key: "enableBranchAutoBuild")]
        getter enable_branch_auto_build : Bool?

        # Automatically disconnects a branch in the Amplify console when you delete a branch from your Git
        # repository.

        @[JSON::Field(key: "enableBranchAutoDeletion")]
        getter enable_branch_auto_deletion : Bool?

        # The environment variables map for an Amplify app. For a list of the environment variables that are
        # accessible to Amplify by default, see Amplify Environment variables in the Amplify Hosting User
        # Guide .

        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the IAM service role for the Amplify app.

        @[JSON::Field(key: "iamServiceRoleArn")]
        getter iam_service_role_arn : String?

        # Describes the configuration details that apply to the jobs for an Amplify app.

        @[JSON::Field(key: "jobConfig")]
        getter job_config : Types::JobConfig?

        # The OAuth token for a third-party source control system for an Amplify app. The OAuth token is used
        # to create a webhook and a read-only deploy key using SSH cloning. The OAuth token is not stored. Use
        # oauthToken for repository providers other than GitHub, such as Bitbucket or CodeCommit. To authorize
        # access to GitHub as your repository provider, use accessToken . You must specify either oauthToken
        # or accessToken when you create a new app. Existing Amplify apps deployed from a GitHub repository
        # using OAuth continue to work with CI/CD. However, we strongly recommend that you migrate these apps
        # to use the GitHub App. For more information, see Migrating an existing OAuth app to the Amplify
        # GitHub App in the Amplify User Guide .

        @[JSON::Field(key: "oauthToken")]
        getter oauth_token : String?

        # The platform for the Amplify app. For a static app, set the platform type to WEB . For a dynamic
        # server-side rendered (SSR) app, set the platform type to WEB_COMPUTE . For an app requiring Amplify
        # Hosting's original SSR support only, set the platform type to WEB_DYNAMIC . If you are deploying an
        # SSG only app with Next.js version 14 or later, you must set the platform type to WEB_COMPUTE and set
        # the artifacts baseDirectory to .next in the application's build settings. For an example of the
        # build specification settings, see Amplify build settings for a Next.js 14 SSG application in the
        # Amplify Hosting User Guide .

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The Git repository for the Amplify app.

        @[JSON::Field(key: "repository")]
        getter repository : String?

        # The tag for an Amplify app.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @access_token : String? = nil,
          @auto_branch_creation_config : Types::AutoBranchCreationConfig? = nil,
          @auto_branch_creation_patterns : Array(String)? = nil,
          @basic_auth_credentials : String? = nil,
          @build_spec : String? = nil,
          @cache_config : Types::CacheConfig? = nil,
          @compute_role_arn : String? = nil,
          @custom_headers : String? = nil,
          @custom_rules : Array(Types::CustomRule)? = nil,
          @description : String? = nil,
          @enable_auto_branch_creation : Bool? = nil,
          @enable_basic_auth : Bool? = nil,
          @enable_branch_auto_build : Bool? = nil,
          @enable_branch_auto_deletion : Bool? = nil,
          @environment_variables : Hash(String, String)? = nil,
          @iam_service_role_arn : String? = nil,
          @job_config : Types::JobConfig? = nil,
          @oauth_token : String? = nil,
          @platform : String? = nil,
          @repository : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAppResult
        include JSON::Serializable


        @[JSON::Field(key: "app")]
        getter app : Types::App

        def initialize(
          @app : Types::App
        )
        end
      end

      # The request structure for the backend environment create request.

      struct CreateBackendEnvironmentRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name for the backend environment.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        # The name of deployment artifacts.

        @[JSON::Field(key: "deploymentArtifacts")]
        getter deployment_artifacts : String?

        # The AWS CloudFormation stack name of a backend environment.

        @[JSON::Field(key: "stackName")]
        getter stack_name : String?

        def initialize(
          @app_id : String,
          @environment_name : String,
          @deployment_artifacts : String? = nil,
          @stack_name : String? = nil
        )
        end
      end

      # The result structure for the create backend environment request.

      struct CreateBackendEnvironmentResult
        include JSON::Serializable

        # Describes the backend environment for an Amplify app.

        @[JSON::Field(key: "backendEnvironment")]
        getter backend_environment : Types::BackendEnvironment

        def initialize(
          @backend_environment : Types::BackendEnvironment
        )
        end
      end

      # The request structure for the create branch request.

      struct CreateBranchRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name for the branch.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The backend for a Branch of an Amplify app. Use for a backend created from an CloudFormation stack.
        # This field is available to Amplify Gen 2 apps only. When you deploy an application with Amplify Gen
        # 2, you provision the app's backend infrastructure using Typescript code.

        @[JSON::Field(key: "backend")]
        getter backend : Types::Backend?

        # The Amazon Resource Name (ARN) for a backend environment that is part of a Gen 1 Amplify app. This
        # field is available to Amplify Gen 1 apps only where the backend is created using Amplify Studio or
        # the Amplify command line interface (CLI).

        @[JSON::Field(key: "backendEnvironmentArn")]
        getter backend_environment_arn : String?

        # The basic authorization credentials for the branch. You must base64-encode the authorization
        # credentials and provide them in the format user:password .

        @[JSON::Field(key: "basicAuthCredentials")]
        getter basic_auth_credentials : String?

        # The build specification (build spec) for the branch.

        @[JSON::Field(key: "buildSpec")]
        getter build_spec : String?

        # The Amazon Resource Name (ARN) of the IAM role to assign to a branch of an SSR app. The SSR Compute
        # role allows the Amplify Hosting compute service to securely access specific Amazon Web Services
        # resources based on the role's permissions. For more information about the SSR Compute role, see
        # Adding an SSR Compute role in the Amplify User Guide .

        @[JSON::Field(key: "computeRoleArn")]
        getter compute_role_arn : String?

        # The description for the branch.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name for a branch. This is used as the default domain prefix.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # Enables auto building for the branch.

        @[JSON::Field(key: "enableAutoBuild")]
        getter enable_auto_build : Bool?

        # Enables basic authorization for the branch.

        @[JSON::Field(key: "enableBasicAuth")]
        getter enable_basic_auth : Bool?

        # Enables notifications for the branch.

        @[JSON::Field(key: "enableNotification")]
        getter enable_notification : Bool?

        # Enables performance mode for the branch. Performance mode optimizes for faster hosting performance
        # by keeping content cached at the edge for a longer interval. When performance mode is enabled,
        # hosting configuration or code changes can take up to 10 minutes to roll out.

        @[JSON::Field(key: "enablePerformanceMode")]
        getter enable_performance_mode : Bool?

        # Enables pull request previews for this branch.

        @[JSON::Field(key: "enablePullRequestPreview")]
        getter enable_pull_request_preview : Bool?

        # Specifies whether the skew protection feature is enabled for the branch. Deployment skew protection
        # is available to Amplify applications to eliminate version skew issues between client and servers in
        # web applications. When you apply skew protection to a branch, you can ensure that your clients
        # always interact with the correct version of server-side assets, regardless of when a deployment
        # occurs. For more information about skew protection, see Skew protection for Amplify deployments in
        # the Amplify User Guide .

        @[JSON::Field(key: "enableSkewProtection")]
        getter enable_skew_protection : Bool?

        # The environment variables for the branch.

        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)?

        # The framework for the branch.

        @[JSON::Field(key: "framework")]
        getter framework : String?

        # The Amplify environment name for the pull request.

        @[JSON::Field(key: "pullRequestEnvironmentName")]
        getter pull_request_environment_name : String?

        # Describes the current stage for the branch.

        @[JSON::Field(key: "stage")]
        getter stage : String?

        # The tag for the branch.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The content Time To Live (TTL) for the website in seconds.

        @[JSON::Field(key: "ttl")]
        getter ttl : String?

        def initialize(
          @app_id : String,
          @branch_name : String,
          @backend : Types::Backend? = nil,
          @backend_environment_arn : String? = nil,
          @basic_auth_credentials : String? = nil,
          @build_spec : String? = nil,
          @compute_role_arn : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @enable_auto_build : Bool? = nil,
          @enable_basic_auth : Bool? = nil,
          @enable_notification : Bool? = nil,
          @enable_performance_mode : Bool? = nil,
          @enable_pull_request_preview : Bool? = nil,
          @enable_skew_protection : Bool? = nil,
          @environment_variables : Hash(String, String)? = nil,
          @framework : String? = nil,
          @pull_request_environment_name : String? = nil,
          @stage : String? = nil,
          @tags : Hash(String, String)? = nil,
          @ttl : String? = nil
        )
        end
      end

      # The result structure for create branch request.

      struct CreateBranchResult
        include JSON::Serializable

        # Describes the branch for an Amplify app, which maps to a third-party repository branch.

        @[JSON::Field(key: "branch")]
        getter branch : Types::Branch

        def initialize(
          @branch : Types::Branch
        )
        end
      end

      # The request structure for the create a new deployment request.

      struct CreateDeploymentRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the branch to use for the job.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # An optional file map that contains the file name as the key and the file content md5 hash as the
        # value. If this argument is provided, the service will generate a unique upload URL per file.
        # Otherwise, the service will only generate a single upload URL for the zipped files.

        @[JSON::Field(key: "fileMap")]
        getter file_map : Hash(String, String)?

        def initialize(
          @app_id : String,
          @branch_name : String,
          @file_map : Hash(String, String)? = nil
        )
        end
      end

      # The result structure for the create a new deployment request.

      struct CreateDeploymentResult
        include JSON::Serializable

        # When the fileMap argument is provided in the request, fileUploadUrls will contain a map of file
        # names to upload URLs.

        @[JSON::Field(key: "fileUploadUrls")]
        getter file_upload_urls : Hash(String, String)

        # When the fileMap argument is not provided in the request, this zipUploadUrl is returned.

        @[JSON::Field(key: "zipUploadUrl")]
        getter zip_upload_url : String

        # The job ID for this deployment. will supply to start deployment api.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        def initialize(
          @file_upload_urls : Hash(String, String),
          @zip_upload_url : String,
          @job_id : String? = nil
        )
        end
      end

      # The request structure for the create domain association request.

      struct CreateDomainAssociationRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The domain name for the domain association.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The setting for the subdomain.

        @[JSON::Field(key: "subDomainSettings")]
        getter sub_domain_settings : Array(Types::SubDomainSetting)

        # Sets the branch patterns for automatic subdomain creation.

        @[JSON::Field(key: "autoSubDomainCreationPatterns")]
        getter auto_sub_domain_creation_patterns : Array(String)?

        # The required AWS Identity and Access Management (IAM) service role for the Amazon Resource Name
        # (ARN) for automatically creating subdomains.

        @[JSON::Field(key: "autoSubDomainIAMRole")]
        getter auto_sub_domain_iam_role : String?

        # The type of SSL/TLS certificate to use for your custom domain. If you don't specify a certificate
        # type, Amplify uses the default certificate that it provisions and manages for you.

        @[JSON::Field(key: "certificateSettings")]
        getter certificate_settings : Types::CertificateSettings?

        # Enables the automated creation of subdomains for branches.

        @[JSON::Field(key: "enableAutoSubDomain")]
        getter enable_auto_sub_domain : Bool?

        def initialize(
          @app_id : String,
          @domain_name : String,
          @sub_domain_settings : Array(Types::SubDomainSetting),
          @auto_sub_domain_creation_patterns : Array(String)? = nil,
          @auto_sub_domain_iam_role : String? = nil,
          @certificate_settings : Types::CertificateSettings? = nil,
          @enable_auto_sub_domain : Bool? = nil
        )
        end
      end

      # The result structure for the create domain association request.

      struct CreateDomainAssociationResult
        include JSON::Serializable

        # Describes the structure of a domain association, which associates a custom domain with an Amplify
        # app.

        @[JSON::Field(key: "domainAssociation")]
        getter domain_association : Types::DomainAssociation

        def initialize(
          @domain_association : Types::DomainAssociation
        )
        end
      end

      # The request structure for the create webhook request.

      struct CreateWebhookRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name for a branch that is part of an Amplify app.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The description for a webhook.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @app_id : String,
          @branch_name : String,
          @description : String? = nil
        )
        end
      end

      # The result structure for the create webhook request.

      struct CreateWebhookResult
        include JSON::Serializable

        # Describes a webhook that connects repository events to an Amplify app.

        @[JSON::Field(key: "webhook")]
        getter webhook : Types::Webhook

        def initialize(
          @webhook : Types::Webhook
        )
        end
      end

      # Describes a custom rewrite or redirect rule.

      struct CustomRule
        include JSON::Serializable

        # The source pattern for a URL rewrite or redirect rule.

        @[JSON::Field(key: "source")]
        getter source : String

        # The target pattern for a URL rewrite or redirect rule.

        @[JSON::Field(key: "target")]
        getter target : String

        # The condition for a URL rewrite or redirect rule, such as a country code.

        @[JSON::Field(key: "condition")]
        getter condition : String?

        # The status code for a URL rewrite or redirect rule. 200 Represents a 200 rewrite rule. 301
        # Represents a 301 (moved permanently) redirect rule. This and all future requests should be directed
        # to the target URL. 302 Represents a 302 temporary redirect rule. 404 Represents a 404 redirect rule.
        # 404-200 Represents a 404 rewrite rule.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @source : String,
          @target : String,
          @condition : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the request structure for the delete app request.

      struct DeleteAppRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        def initialize(
          @app_id : String
        )
        end
      end

      # The result structure for the delete app request.

      struct DeleteAppResult
        include JSON::Serializable


        @[JSON::Field(key: "app")]
        getter app : Types::App

        def initialize(
          @app : Types::App
        )
        end
      end

      # The request structure for the delete backend environment request.

      struct DeleteBackendEnvironmentRequest
        include JSON::Serializable

        # The unique ID of an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of a backend environment of an Amplify app.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        def initialize(
          @app_id : String,
          @environment_name : String
        )
        end
      end

      # The result structure of the delete backend environment result.

      struct DeleteBackendEnvironmentResult
        include JSON::Serializable

        # Describes the backend environment for an Amplify app.

        @[JSON::Field(key: "backendEnvironment")]
        getter backend_environment : Types::BackendEnvironment

        def initialize(
          @backend_environment : Types::BackendEnvironment
        )
        end
      end

      # The request structure for the delete branch request.

      struct DeleteBranchRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the branch.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        def initialize(
          @app_id : String,
          @branch_name : String
        )
        end
      end

      # The result structure for the delete branch request.

      struct DeleteBranchResult
        include JSON::Serializable

        # The branch for an Amplify app, which maps to a third-party repository branch.

        @[JSON::Field(key: "branch")]
        getter branch : Types::Branch

        def initialize(
          @branch : Types::Branch
        )
        end
      end

      # The request structure for the delete domain association request.

      struct DeleteDomainAssociationRequest
        include JSON::Serializable

        # The unique id for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the domain.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @app_id : String,
          @domain_name : String
        )
        end
      end


      struct DeleteDomainAssociationResult
        include JSON::Serializable


        @[JSON::Field(key: "domainAssociation")]
        getter domain_association : Types::DomainAssociation

        def initialize(
          @domain_association : Types::DomainAssociation
        )
        end
      end

      # The request structure for the delete job request.

      struct DeleteJobRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the branch to use for the job.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The unique ID for the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @app_id : String,
          @branch_name : String,
          @job_id : String
        )
        end
      end

      # The result structure for the delete job request.

      struct DeleteJobResult
        include JSON::Serializable


        @[JSON::Field(key: "jobSummary")]
        getter job_summary : Types::JobSummary

        def initialize(
          @job_summary : Types::JobSummary
        )
        end
      end

      # The request structure for the delete webhook request.

      struct DeleteWebhookRequest
        include JSON::Serializable

        # The unique ID for a webhook.

        @[JSON::Field(key: "webhookId")]
        getter webhook_id : String

        def initialize(
          @webhook_id : String
        )
        end
      end

      # The result structure for the delete webhook request.

      struct DeleteWebhookResult
        include JSON::Serializable

        # Describes a webhook that connects repository events to an Amplify app.

        @[JSON::Field(key: "webhook")]
        getter webhook : Types::Webhook

        def initialize(
          @webhook : Types::Webhook
        )
        end
      end

      # An operation failed because a dependent service threw an exception.

      struct DependentServiceFailureException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the association between a custom domain and an Amplify app.

      struct DomainAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the domain association.

        @[JSON::Field(key: "domainAssociationArn")]
        getter domain_association_arn : String

        # The name of the domain.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The current status of the domain association.

        @[JSON::Field(key: "domainStatus")]
        getter domain_status : String

        # Enables the automated creation of subdomains for branches.

        @[JSON::Field(key: "enableAutoSubDomain")]
        getter enable_auto_sub_domain : Bool

        # Additional information that describes why the domain association is in the current state.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String

        # The subdomains for the domain association.

        @[JSON::Field(key: "subDomains")]
        getter sub_domains : Array(Types::SubDomain)

        # Sets branch patterns for automatic subdomain creation.

        @[JSON::Field(key: "autoSubDomainCreationPatterns")]
        getter auto_sub_domain_creation_patterns : Array(String)?

        # The required AWS Identity and Access Management (IAM) service role for the Amazon Resource Name
        # (ARN) for automatically creating subdomains.

        @[JSON::Field(key: "autoSubDomainIAMRole")]
        getter auto_sub_domain_iam_role : String?

        # Describes the SSL/TLS certificate for the domain association. This can be your own custom
        # certificate or the default certificate that Amplify provisions for you. If you are updating your
        # domain to use a different certificate, certificate points to the new certificate that is being
        # created instead of the current active certificate. Otherwise, certificate points to the current
        # active certificate.

        @[JSON::Field(key: "certificate")]
        getter certificate : Types::Certificate?

        # The DNS record for certificate verification.

        @[JSON::Field(key: "certificateVerificationDNSRecord")]
        getter certificate_verification_dns_record : String?

        # The status of the domain update operation that is currently in progress. The following list
        # describes the valid update states. REQUESTING_CERTIFICATE The certificate is in the process of being
        # updated. PENDING_VERIFICATION Indicates that an Amplify managed certificate is in the process of
        # being verified. This occurs during the creation of a custom domain or when a custom domain is
        # updated to use a managed certificate. IMPORTING_CUSTOM_CERTIFICATE Indicates that an Amplify custom
        # certificate is in the process of being imported. This occurs during the creation of a custom domain
        # or when a custom domain is updated to use a custom certificate. PENDING_DEPLOYMENT Indicates that
        # the subdomain or certificate changes are being propagated. AWAITING_APP_CNAME Amplify is waiting for
        # CNAME records corresponding to subdomains to be propagated. If your custom domain is on Route 53,
        # Amplify handles this for you automatically. For more information about custom domains, see Setting
        # up custom domains in the Amplify Hosting User Guide . UPDATE_COMPLETE The certificate has been
        # associated with a domain. UPDATE_FAILED The certificate has failed to be provisioned or associated,
        # and there is no existing active certificate to roll back to.

        @[JSON::Field(key: "updateStatus")]
        getter update_status : String?

        def initialize(
          @domain_association_arn : String,
          @domain_name : String,
          @domain_status : String,
          @enable_auto_sub_domain : Bool,
          @status_reason : String,
          @sub_domains : Array(Types::SubDomain),
          @auto_sub_domain_creation_patterns : Array(String)? = nil,
          @auto_sub_domain_iam_role : String? = nil,
          @certificate : Types::Certificate? = nil,
          @certificate_verification_dns_record : String? = nil,
          @update_status : String? = nil
        )
        end
      end

      # The request structure for the generate access logs request.

      struct GenerateAccessLogsRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the domain.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The time at which the logs should end. The time range specified is inclusive of the end time.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The time at which the logs should start. The time range specified is inclusive of the start time.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @app_id : String,
          @domain_name : String,
          @end_time : Time? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # The result structure for the generate access logs request.

      struct GenerateAccessLogsResult
        include JSON::Serializable

        # The pre-signed URL for the requested access logs.

        @[JSON::Field(key: "logUrl")]
        getter log_url : String?

        def initialize(
          @log_url : String? = nil
        )
        end
      end

      # The request structure for the get app request.

      struct GetAppRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        def initialize(
          @app_id : String
        )
        end
      end


      struct GetAppResult
        include JSON::Serializable


        @[JSON::Field(key: "app")]
        getter app : Types::App

        def initialize(
          @app : Types::App
        )
        end
      end

      # Returns the request structure for the get artifact request.

      struct GetArtifactUrlRequest
        include JSON::Serializable

        # The unique ID for an artifact.

        @[JSON::Field(key: "artifactId")]
        getter artifact_id : String

        def initialize(
          @artifact_id : String
        )
        end
      end

      # Returns the result structure for the get artifact request.

      struct GetArtifactUrlResult
        include JSON::Serializable

        # The unique ID for an artifact.

        @[JSON::Field(key: "artifactId")]
        getter artifact_id : String

        # The presigned URL for the artifact.

        @[JSON::Field(key: "artifactUrl")]
        getter artifact_url : String

        def initialize(
          @artifact_id : String,
          @artifact_url : String
        )
        end
      end

      # The request structure for the get backend environment request.

      struct GetBackendEnvironmentRequest
        include JSON::Serializable

        # The unique id for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name for the backend environment.

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String

        def initialize(
          @app_id : String,
          @environment_name : String
        )
        end
      end

      # The result structure for the get backend environment result.

      struct GetBackendEnvironmentResult
        include JSON::Serializable

        # Describes the backend environment for an Amplify app.

        @[JSON::Field(key: "backendEnvironment")]
        getter backend_environment : Types::BackendEnvironment

        def initialize(
          @backend_environment : Types::BackendEnvironment
        )
        end
      end

      # The request structure for the get branch request.

      struct GetBranchRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the branch.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        def initialize(
          @app_id : String,
          @branch_name : String
        )
        end
      end


      struct GetBranchResult
        include JSON::Serializable


        @[JSON::Field(key: "branch")]
        getter branch : Types::Branch

        def initialize(
          @branch : Types::Branch
        )
        end
      end

      # The request structure for the get domain association request.

      struct GetDomainAssociationRequest
        include JSON::Serializable

        # The unique id for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the domain.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @app_id : String,
          @domain_name : String
        )
        end
      end

      # The result structure for the get domain association request.

      struct GetDomainAssociationResult
        include JSON::Serializable

        # Describes the structure of a domain association, which associates a custom domain with an Amplify
        # app.

        @[JSON::Field(key: "domainAssociation")]
        getter domain_association : Types::DomainAssociation

        def initialize(
          @domain_association : Types::DomainAssociation
        )
        end
      end

      # The request structure for the get job request.

      struct GetJobRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the branch to use for the job.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The unique ID for the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @app_id : String,
          @branch_name : String,
          @job_id : String
        )
        end
      end


      struct GetJobResult
        include JSON::Serializable


        @[JSON::Field(key: "job")]
        getter job : Types::Job

        def initialize(
          @job : Types::Job
        )
        end
      end

      # The request structure for the get webhook request.

      struct GetWebhookRequest
        include JSON::Serializable

        # The unique ID for a webhook.

        @[JSON::Field(key: "webhookId")]
        getter webhook_id : String

        def initialize(
          @webhook_id : String
        )
        end
      end

      # The result structure for the get webhook request.

      struct GetWebhookResult
        include JSON::Serializable

        # Describes the structure of a webhook.

        @[JSON::Field(key: "webhook")]
        getter webhook : Types::Webhook

        def initialize(
          @webhook : Types::Webhook
        )
        end
      end

      # The service failed to perform an operation due to an internal issue.

      struct InternalFailureException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes an execution job for an Amplify app.

      struct Job
        include JSON::Serializable

        # The execution steps for an execution job, for an Amplify app.

        @[JSON::Field(key: "steps")]
        getter steps : Array(Types::Step)

        # Describes the summary for an execution job for an Amplify app.

        @[JSON::Field(key: "summary")]
        getter summary : Types::JobSummary

        def initialize(
          @steps : Array(Types::Step),
          @summary : Types::JobSummary
        )
        end
      end

      # Describes the configuration details that apply to the jobs for an Amplify app. Use JobConfig to
      # apply configuration to jobs, such as customizing the build instance size when you create or update
      # an Amplify app. For more information about customizable build instances, see Custom build instances
      # in the Amplify User Guide .

      struct JobConfig
        include JSON::Serializable

        # Specifies the size of the build instance. Amplify supports three instance sizes: STANDARD_8GB ,
        # LARGE_16GB , and XLARGE_72GB . If you don't specify a value, Amplify uses the STANDARD_8GB default.
        # The following list describes the CPU, memory, and storage capacity for each build instance type:
        # STANDARD_8GB vCPUs: 4 Memory: 8 GiB Disk space: 128 GB LARGE_16GB vCPUs: 8 Memory: 16 GiB Disk
        # space: 128 GB XLARGE_72GB vCPUs: 36 Memory: 72 GiB Disk space: 256 GB

        @[JSON::Field(key: "buildComputeType")]
        getter build_compute_type : String

        def initialize(
          @build_compute_type : String
        )
        end
      end

      # Describes the summary for an execution job for an Amplify app.

      struct JobSummary
        include JSON::Serializable

        # The commit ID from a third-party repository provider for the job.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String

        # The commit message from a third-party repository provider for the job.

        @[JSON::Field(key: "commitMessage")]
        getter commit_message : String

        # The commit date and time for the job.

        @[JSON::Field(key: "commitTime")]
        getter commit_time : Time

        # The Amazon Resource Name (ARN) for the job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The unique ID for the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The type for the job. If the value is RELEASE , the job was manually released from its source by
        # using the StartJob API. This value is available only for apps that are connected to a repository. If
        # the value is RETRY , the job was manually retried using the StartJob API. If the value is WEB_HOOK ,
        # the job was automatically triggered by webhooks. If the value is MANUAL , the job is for a manually
        # deployed app. Manually deployed apps are not connected to a Git repository.

        @[JSON::Field(key: "jobType")]
        getter job_type : String

        # The start date and time for the job.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The current status for the job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The end date and time for the job.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The source URL for the files to deploy. The source URL can be either an HTTP GET URL that is
        # publicly accessible and downloads a single .zip file, or an Amazon S3 bucket and prefix.

        @[JSON::Field(key: "sourceUrl")]
        getter source_url : String?

        # The type of source specified by the sourceURL . If the value is ZIP , the source is a .zip file. If
        # the value is BUCKET_PREFIX , the source is an Amazon S3 bucket and prefix. If no value is specified,
        # the default is ZIP .

        @[JSON::Field(key: "sourceUrlType")]
        getter source_url_type : String?

        def initialize(
          @commit_id : String,
          @commit_message : String,
          @commit_time : Time,
          @job_arn : String,
          @job_id : String,
          @job_type : String,
          @start_time : Time,
          @status : String,
          @end_time : Time? = nil,
          @source_url : String? = nil,
          @source_url_type : String? = nil
        )
        end
      end

      # A resource could not be created because service quotas were exceeded.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request structure for the list apps request.

      struct ListAppsRequest
        include JSON::Serializable

        # The maximum number of records to list in a single response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token. If non-null, the pagination token is returned in a result. Pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result structure for an Amplify app list request.

      struct ListAppsResult
        include JSON::Serializable

        # A list of Amplify apps.

        @[JSON::Field(key: "apps")]
        getter apps : Array(Types::App)

        # A pagination token. Set to null to start listing apps from start. If non-null, the pagination token
        # is returned in a result. Pass its value in here to list more projects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @apps : Array(Types::App),
          @next_token : String? = nil
        )
        end
      end

      # Describes the request structure for the list artifacts request.

      struct ListArtifactsRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of a branch that is part of an Amplify app.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The unique ID for a job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The maximum number of records to list in a single response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token. Set to null to start listing artifacts from start. If a non-null pagination
        # token is returned in a result, pass its value in here to list more artifacts.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @branch_name : String,
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result structure for the list artifacts request.

      struct ListArtifactsResult
        include JSON::Serializable

        # A list of artifacts.

        @[JSON::Field(key: "artifacts")]
        getter artifacts : Array(Types::Artifact)

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @artifacts : Array(Types::Artifact),
          @next_token : String? = nil
        )
        end
      end

      # The request structure for the list backend environments request.

      struct ListBackendEnvironmentsRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment

        @[JSON::Field(key: "environmentName")]
        getter environment_name : String?

        # The maximum number of records to list in a single response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token. Set to null to start listing backend environments from the start. If a non-null
        # pagination token is returned in a result, pass its value in here to list more backend environments.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @environment_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result structure for the list backend environments result.

      struct ListBackendEnvironmentsResult
        include JSON::Serializable

        # The list of backend environments for an Amplify app.

        @[JSON::Field(key: "backendEnvironments")]
        getter backend_environments : Array(Types::BackendEnvironment)

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @backend_environments : Array(Types::BackendEnvironment),
          @next_token : String? = nil
        )
        end
      end

      # The request structure for the list branches request.

      struct ListBranchesRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The maximum number of records to list in a single response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token. Set to null to start listing branches from the start. If a non-null pagination
        # token is returned in a result, pass its value in here to list more branches.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result structure for the list branches request.

      struct ListBranchesResult
        include JSON::Serializable

        # A list of branches for an Amplify app.

        @[JSON::Field(key: "branches")]
        getter branches : Array(Types::Branch)

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @branches : Array(Types::Branch),
          @next_token : String? = nil
        )
        end
      end

      # The request structure for the list domain associations request.

      struct ListDomainAssociationsRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The maximum number of records to list in a single response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token. Set to null to start listing apps from the start. If non-null, a pagination
        # token is returned in a result. Pass its value in here to list more projects.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result structure for the list domain association request.

      struct ListDomainAssociationsResult
        include JSON::Serializable

        # A list of domain associations.

        @[JSON::Field(key: "domainAssociations")]
        getter domain_associations : Array(Types::DomainAssociation)

        # A pagination token. If non-null, a pagination token is returned in a result. Pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_associations : Array(Types::DomainAssociation),
          @next_token : String? = nil
        )
        end
      end

      # The request structure for the list jobs request.

      struct ListJobsRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the branch to use for the request.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The maximum number of records to list in a single response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token. Set to null to start listing steps from the start. If a non-null pagination
        # token is returned in a result, pass its value in here to list more steps.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @branch_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The maximum number of records to list in a single response.

      struct ListJobsResult
        include JSON::Serializable

        # The result structure for the list job result request.

        @[JSON::Field(key: "jobSummaries")]
        getter job_summaries : Array(Types::JobSummary)

        # A pagination token. If non-null the pagination token is returned in a result. Pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_summaries : Array(Types::JobSummary),
          @next_token : String? = nil
        )
        end
      end

      # The request structure to use to list tags for a resource.

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to use to list tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # The response for the list tags for resource request.

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags for the specified The Amazon Resource Name (ARN).

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The request structure for the list webhooks request.

      struct ListWebhooksRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The maximum number of records to list in a single response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token. Set to null to start listing webhooks from the start. If non-null,the pagination
        # token is returned in a result. Pass its value in here to list more webhooks.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result structure for the list webhooks request.

      struct ListWebhooksResult
        include JSON::Serializable

        # A list of webhooks.

        @[JSON::Field(key: "webhooks")]
        getter webhooks : Array(Types::Webhook)

        # A pagination token. If non-null, the pagination token is returned in a result. Pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @webhooks : Array(Types::Webhook),
          @next_token : String? = nil
        )
        end
      end

      # An entity was not found during an operation.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the information about a production branch for an Amplify app.

      struct ProductionBranch
        include JSON::Serializable

        # The branch name for the production branch.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String?

        # The last deploy time of the production branch.

        @[JSON::Field(key: "lastDeployTime")]
        getter last_deploy_time : Time?

        # The status of the production branch.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The thumbnail URL for the production branch.

        @[JSON::Field(key: "thumbnailUrl")]
        getter thumbnail_url : String?

        def initialize(
          @branch_name : String? = nil,
          @last_deploy_time : Time? = nil,
          @status : String? = nil,
          @thumbnail_url : String? = nil
        )
        end
      end

      # An operation failed due to a non-existent resource.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end

      # The request structure for the start a deployment request.

      struct StartDeploymentRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the branch to use for the deployment job.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The job ID for this deployment that is generated by the CreateDeployment request.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The source URL for the deployment that is used when calling StartDeployment without CreateDeployment
        # . The source URL can be either an HTTP GET URL that is publicly accessible and downloads a single
        # .zip file, or an Amazon S3 bucket and prefix.

        @[JSON::Field(key: "sourceUrl")]
        getter source_url : String?

        # The type of source specified by the sourceURL . If the value is ZIP , the source is a .zip file. If
        # the value is BUCKET_PREFIX , the source is an Amazon S3 bucket and prefix. If no value is specified,
        # the default is ZIP .

        @[JSON::Field(key: "sourceUrlType")]
        getter source_url_type : String?

        def initialize(
          @app_id : String,
          @branch_name : String,
          @job_id : String? = nil,
          @source_url : String? = nil,
          @source_url_type : String? = nil
        )
        end
      end

      # The result structure for the start a deployment request.

      struct StartDeploymentResult
        include JSON::Serializable

        # The summary for the job.

        @[JSON::Field(key: "jobSummary")]
        getter job_summary : Types::JobSummary

        def initialize(
          @job_summary : Types::JobSummary
        )
        end
      end

      # The request structure for the start job request.

      struct StartJobRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the branch to use for the job.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # Describes the type for the job. The job type RELEASE starts a new job with the latest change from
        # the specified branch. This value is available only for apps that are connected to a repository. The
        # job type RETRY retries an existing job. If the job type value is RETRY , the jobId is also required.

        @[JSON::Field(key: "jobType")]
        getter job_type : String

        # The commit ID from a third-party repository provider for the job.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String?

        # The commit message from a third-party repository provider for the job.

        @[JSON::Field(key: "commitMessage")]
        getter commit_message : String?

        # The commit date and time for the job.

        @[JSON::Field(key: "commitTime")]
        getter commit_time : Time?

        # The unique ID for an existing job. This is required if the value of jobType is RETRY .

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # A descriptive reason for starting the job.

        @[JSON::Field(key: "jobReason")]
        getter job_reason : String?

        def initialize(
          @app_id : String,
          @branch_name : String,
          @job_type : String,
          @commit_id : String? = nil,
          @commit_message : String? = nil,
          @commit_time : Time? = nil,
          @job_id : String? = nil,
          @job_reason : String? = nil
        )
        end
      end

      # The result structure for the run job request.

      struct StartJobResult
        include JSON::Serializable

        # The summary for the job.

        @[JSON::Field(key: "jobSummary")]
        getter job_summary : Types::JobSummary

        def initialize(
          @job_summary : Types::JobSummary
        )
        end
      end

      # Describes an execution step, for an execution job, for an Amplify app.

      struct Step
        include JSON::Serializable

        # The end date and time of the execution step.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The start date and time of the execution step.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The status of the execution step.

        @[JSON::Field(key: "status")]
        getter status : String

        # The name of the execution step.

        @[JSON::Field(key: "stepName")]
        getter step_name : String

        # The URL to the build artifact for the execution step.

        @[JSON::Field(key: "artifactsUrl")]
        getter artifacts_url : String?

        # The context for the current step. Includes a build image if the step is build.

        @[JSON::Field(key: "context")]
        getter context : String?

        # The URL to the logs for the execution step.

        @[JSON::Field(key: "logUrl")]
        getter log_url : String?

        # The list of screenshot URLs for the execution step, if relevant.

        @[JSON::Field(key: "screenshots")]
        getter screenshots : Hash(String, String)?

        # The reason for the current step status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The URL to the test artifact for the execution step.

        @[JSON::Field(key: "testArtifactsUrl")]
        getter test_artifacts_url : String?

        # The URL to the test configuration for the execution step.

        @[JSON::Field(key: "testConfigUrl")]
        getter test_config_url : String?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @status : String,
          @step_name : String,
          @artifacts_url : String? = nil,
          @context : String? = nil,
          @log_url : String? = nil,
          @screenshots : Hash(String, String)? = nil,
          @status_reason : String? = nil,
          @test_artifacts_url : String? = nil,
          @test_config_url : String? = nil
        )
        end
      end

      # The request structure for the stop job request.

      struct StopJobRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the branch to use for the stop job request.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The unique id for the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @app_id : String,
          @branch_name : String,
          @job_id : String
        )
        end
      end

      # The result structure for the stop job request.

      struct StopJobResult
        include JSON::Serializable

        # The summary for the job.

        @[JSON::Field(key: "jobSummary")]
        getter job_summary : Types::JobSummary

        def initialize(
          @job_summary : Types::JobSummary
        )
        end
      end

      # The subdomain for the domain association.

      struct SubDomain
        include JSON::Serializable

        # The DNS record for the subdomain.

        @[JSON::Field(key: "dnsRecord")]
        getter dns_record : String

        # Describes the settings for the subdomain.

        @[JSON::Field(key: "subDomainSetting")]
        getter sub_domain_setting : Types::SubDomainSetting

        # The verified status of the subdomain

        @[JSON::Field(key: "verified")]
        getter verified : Bool

        def initialize(
          @dns_record : String,
          @sub_domain_setting : Types::SubDomainSetting,
          @verified : Bool
        )
        end
      end

      # Describes the settings for the subdomain.

      struct SubDomainSetting
        include JSON::Serializable

        # The branch name setting for the subdomain.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The prefix setting for the subdomain.

        @[JSON::Field(key: "prefix")]
        getter prefix : String

        def initialize(
          @branch_name : String,
          @prefix : String
        )
        end
      end

      # The request structure to tag a resource with a tag key and value.

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to use to tag a resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags used to tag the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The response for the tag resource request.

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An operation failed due to a lack of access.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request structure for the untag resource request.

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to use to untag a resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys to use to untag a resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # The response for the untag resource request.

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request structure for the update app request.

      struct UpdateAppRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The personal access token for a GitHub repository for an Amplify app. The personal access token is
        # used to authorize access to a GitHub repository using the Amplify GitHub App. The token is not
        # stored. Use accessToken for GitHub repositories only. To authorize access to a repository provider
        # such as Bitbucket or CodeCommit, use oauthToken . You must specify either accessToken or oauthToken
        # when you update an app. Existing Amplify apps deployed from a GitHub repository using OAuth continue
        # to work with CI/CD. However, we strongly recommend that you migrate these apps to use the GitHub
        # App. For more information, see Migrating an existing OAuth app to the Amplify GitHub App in the
        # Amplify User Guide .

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The automated branch creation configuration for an Amplify app.

        @[JSON::Field(key: "autoBranchCreationConfig")]
        getter auto_branch_creation_config : Types::AutoBranchCreationConfig?

        # Describes the automated branch creation glob patterns for an Amplify app.

        @[JSON::Field(key: "autoBranchCreationPatterns")]
        getter auto_branch_creation_patterns : Array(String)?

        # The basic authorization credentials for an Amplify app. You must base64-encode the authorization
        # credentials and provide them in the format user:password .

        @[JSON::Field(key: "basicAuthCredentials")]
        getter basic_auth_credentials : String?

        # The build specification (build spec) for an Amplify app.

        @[JSON::Field(key: "buildSpec")]
        getter build_spec : String?

        # The cache configuration for the Amplify app.

        @[JSON::Field(key: "cacheConfig")]
        getter cache_config : Types::CacheConfig?

        # The Amazon Resource Name (ARN) of the IAM role to assign to an SSR app. The SSR Compute role allows
        # the Amplify Hosting compute service to securely access specific Amazon Web Services resources based
        # on the role's permissions. For more information about the SSR Compute role, see Adding an SSR
        # Compute role in the Amplify User Guide .

        @[JSON::Field(key: "computeRoleArn")]
        getter compute_role_arn : String?

        # The custom HTTP headers for an Amplify app.

        @[JSON::Field(key: "customHeaders")]
        getter custom_headers : String?

        # The custom redirect and rewrite rules for an Amplify app.

        @[JSON::Field(key: "customRules")]
        getter custom_rules : Array(Types::CustomRule)?

        # The description for an Amplify app.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Enables automated branch creation for an Amplify app.

        @[JSON::Field(key: "enableAutoBranchCreation")]
        getter enable_auto_branch_creation : Bool?

        # Enables basic authorization for an Amplify app.

        @[JSON::Field(key: "enableBasicAuth")]
        getter enable_basic_auth : Bool?

        # Enables branch auto-building for an Amplify app.

        @[JSON::Field(key: "enableBranchAutoBuild")]
        getter enable_branch_auto_build : Bool?

        # Automatically disconnects a branch in the Amplify console when you delete a branch from your Git
        # repository.

        @[JSON::Field(key: "enableBranchAutoDeletion")]
        getter enable_branch_auto_deletion : Bool?

        # The environment variables for an Amplify app.

        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the IAM service role for the Amplify app.

        @[JSON::Field(key: "iamServiceRoleArn")]
        getter iam_service_role_arn : String?

        # Describes the configuration details that apply to the jobs for an Amplify app.

        @[JSON::Field(key: "jobConfig")]
        getter job_config : Types::JobConfig?

        # The name for an Amplify app.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The OAuth token for a third-party source control system for an Amplify app. The OAuth token is used
        # to create a webhook and a read-only deploy key using SSH cloning. The OAuth token is not stored. Use
        # oauthToken for repository providers other than GitHub, such as Bitbucket or CodeCommit. To authorize
        # access to GitHub as your repository provider, use accessToken . You must specify either oauthToken
        # or accessToken when you update an app. Existing Amplify apps deployed from a GitHub repository using
        # OAuth continue to work with CI/CD. However, we strongly recommend that you migrate these apps to use
        # the GitHub App. For more information, see Migrating an existing OAuth app to the Amplify GitHub App
        # in the Amplify User Guide .

        @[JSON::Field(key: "oauthToken")]
        getter oauth_token : String?

        # The platform for the Amplify app. For a static app, set the platform type to WEB . For a dynamic
        # server-side rendered (SSR) app, set the platform type to WEB_COMPUTE . For an app requiring Amplify
        # Hosting's original SSR support only, set the platform type to WEB_DYNAMIC . If you are deploying an
        # SSG only app with Next.js version 14 or later, you must set the platform type to WEB_COMPUTE .

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The name of the Git repository for an Amplify app.

        @[JSON::Field(key: "repository")]
        getter repository : String?

        def initialize(
          @app_id : String,
          @access_token : String? = nil,
          @auto_branch_creation_config : Types::AutoBranchCreationConfig? = nil,
          @auto_branch_creation_patterns : Array(String)? = nil,
          @basic_auth_credentials : String? = nil,
          @build_spec : String? = nil,
          @cache_config : Types::CacheConfig? = nil,
          @compute_role_arn : String? = nil,
          @custom_headers : String? = nil,
          @custom_rules : Array(Types::CustomRule)? = nil,
          @description : String? = nil,
          @enable_auto_branch_creation : Bool? = nil,
          @enable_basic_auth : Bool? = nil,
          @enable_branch_auto_build : Bool? = nil,
          @enable_branch_auto_deletion : Bool? = nil,
          @environment_variables : Hash(String, String)? = nil,
          @iam_service_role_arn : String? = nil,
          @job_config : Types::JobConfig? = nil,
          @name : String? = nil,
          @oauth_token : String? = nil,
          @platform : String? = nil,
          @repository : String? = nil
        )
        end
      end

      # The result structure for an Amplify app update request.

      struct UpdateAppResult
        include JSON::Serializable

        # Represents the updated Amplify app.

        @[JSON::Field(key: "app")]
        getter app : Types::App

        def initialize(
          @app : Types::App
        )
        end
      end

      # The request structure for the update branch request.

      struct UpdateBranchRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the branch.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The backend for a Branch of an Amplify app. Use for a backend created from an CloudFormation stack.
        # This field is available to Amplify Gen 2 apps only. When you deploy an application with Amplify Gen
        # 2, you provision the app's backend infrastructure using Typescript code.

        @[JSON::Field(key: "backend")]
        getter backend : Types::Backend?

        # The Amazon Resource Name (ARN) for a backend environment that is part of a Gen 1 Amplify app. This
        # field is available to Amplify Gen 1 apps only where the backend is created using Amplify Studio or
        # the Amplify command line interface (CLI).

        @[JSON::Field(key: "backendEnvironmentArn")]
        getter backend_environment_arn : String?

        # The basic authorization credentials for the branch. You must base64-encode the authorization
        # credentials and provide them in the format user:password .

        @[JSON::Field(key: "basicAuthCredentials")]
        getter basic_auth_credentials : String?

        # The build specification (build spec) for the branch.

        @[JSON::Field(key: "buildSpec")]
        getter build_spec : String?

        # The Amazon Resource Name (ARN) of the IAM role to assign to a branch of an SSR app. The SSR Compute
        # role allows the Amplify Hosting compute service to securely access specific Amazon Web Services
        # resources based on the role's permissions. For more information about the SSR Compute role, see
        # Adding an SSR Compute role in the Amplify User Guide .

        @[JSON::Field(key: "computeRoleArn")]
        getter compute_role_arn : String?

        # The description for the branch.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name for a branch. This is used as the default domain prefix.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # Enables auto building for the branch.

        @[JSON::Field(key: "enableAutoBuild")]
        getter enable_auto_build : Bool?

        # Enables basic authorization for the branch.

        @[JSON::Field(key: "enableBasicAuth")]
        getter enable_basic_auth : Bool?

        # Enables notifications for the branch.

        @[JSON::Field(key: "enableNotification")]
        getter enable_notification : Bool?

        # Enables performance mode for the branch. Performance mode optimizes for faster hosting performance
        # by keeping content cached at the edge for a longer interval. When performance mode is enabled,
        # hosting configuration or code changes can take up to 10 minutes to roll out.

        @[JSON::Field(key: "enablePerformanceMode")]
        getter enable_performance_mode : Bool?

        # Enables pull request previews for this branch.

        @[JSON::Field(key: "enablePullRequestPreview")]
        getter enable_pull_request_preview : Bool?

        # Specifies whether the skew protection feature is enabled for the branch. Deployment skew protection
        # is available to Amplify applications to eliminate version skew issues between client and servers in
        # web applications. When you apply skew protection to a branch, you can ensure that your clients
        # always interact with the correct version of server-side assets, regardless of when a deployment
        # occurs. For more information about skew protection, see Skew protection for Amplify deployments in
        # the Amplify User Guide .

        @[JSON::Field(key: "enableSkewProtection")]
        getter enable_skew_protection : Bool?

        # The environment variables for the branch.

        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)?

        # The framework for the branch.

        @[JSON::Field(key: "framework")]
        getter framework : String?

        # The Amplify environment name for the pull request.

        @[JSON::Field(key: "pullRequestEnvironmentName")]
        getter pull_request_environment_name : String?

        # Describes the current stage for the branch.

        @[JSON::Field(key: "stage")]
        getter stage : String?

        # The content Time to Live (TTL) for the website in seconds.

        @[JSON::Field(key: "ttl")]
        getter ttl : String?

        def initialize(
          @app_id : String,
          @branch_name : String,
          @backend : Types::Backend? = nil,
          @backend_environment_arn : String? = nil,
          @basic_auth_credentials : String? = nil,
          @build_spec : String? = nil,
          @compute_role_arn : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @enable_auto_build : Bool? = nil,
          @enable_basic_auth : Bool? = nil,
          @enable_notification : Bool? = nil,
          @enable_performance_mode : Bool? = nil,
          @enable_pull_request_preview : Bool? = nil,
          @enable_skew_protection : Bool? = nil,
          @environment_variables : Hash(String, String)? = nil,
          @framework : String? = nil,
          @pull_request_environment_name : String? = nil,
          @stage : String? = nil,
          @ttl : String? = nil
        )
        end
      end

      # The result structure for the update branch request.

      struct UpdateBranchResult
        include JSON::Serializable

        # The branch for an Amplify app, which maps to a third-party repository branch.

        @[JSON::Field(key: "branch")]
        getter branch : Types::Branch

        def initialize(
          @branch : Types::Branch
        )
        end
      end

      # The request structure for the update domain association request.

      struct UpdateDomainAssociationRequest
        include JSON::Serializable

        # The unique ID for an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the domain.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # Sets the branch patterns for automatic subdomain creation.

        @[JSON::Field(key: "autoSubDomainCreationPatterns")]
        getter auto_sub_domain_creation_patterns : Array(String)?

        # The required AWS Identity and Access Management (IAM) service role for the Amazon Resource Name
        # (ARN) for automatically creating subdomains.

        @[JSON::Field(key: "autoSubDomainIAMRole")]
        getter auto_sub_domain_iam_role : String?

        # The type of SSL/TLS certificate to use for your custom domain.

        @[JSON::Field(key: "certificateSettings")]
        getter certificate_settings : Types::CertificateSettings?

        # Enables the automated creation of subdomains for branches.

        @[JSON::Field(key: "enableAutoSubDomain")]
        getter enable_auto_sub_domain : Bool?

        # Describes the settings for the subdomain.

        @[JSON::Field(key: "subDomainSettings")]
        getter sub_domain_settings : Array(Types::SubDomainSetting)?

        def initialize(
          @app_id : String,
          @domain_name : String,
          @auto_sub_domain_creation_patterns : Array(String)? = nil,
          @auto_sub_domain_iam_role : String? = nil,
          @certificate_settings : Types::CertificateSettings? = nil,
          @enable_auto_sub_domain : Bool? = nil,
          @sub_domain_settings : Array(Types::SubDomainSetting)? = nil
        )
        end
      end

      # The result structure for the update domain association request.

      struct UpdateDomainAssociationResult
        include JSON::Serializable

        # Describes a domain association, which associates a custom domain with an Amplify app.

        @[JSON::Field(key: "domainAssociation")]
        getter domain_association : Types::DomainAssociation

        def initialize(
          @domain_association : Types::DomainAssociation
        )
        end
      end

      # The request structure for the update webhook request.

      struct UpdateWebhookRequest
        include JSON::Serializable

        # The unique ID for a webhook.

        @[JSON::Field(key: "webhookId")]
        getter webhook_id : String

        # The name for a branch that is part of an Amplify app.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String?

        # The description for a webhook.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @webhook_id : String,
          @branch_name : String? = nil,
          @description : String? = nil
        )
        end
      end

      # The result structure for the update webhook request.

      struct UpdateWebhookResult
        include JSON::Serializable

        # Describes a webhook that connects repository events to an Amplify app.

        @[JSON::Field(key: "webhook")]
        getter webhook : Types::Webhook

        def initialize(
          @webhook : Types::Webhook
        )
        end
      end

      # Describes the Firewall configuration for a hosted Amplify application. Firewall support enables you
      # to protect your web applications with a direct integration with WAF. For more information about
      # using WAF protections for an Amplify application, see Firewall support for hosted sites in the
      # Amplify User Guide .

      struct WafConfiguration
        include JSON::Serializable

        # The reason for the current status of the Firewall configuration.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The status of the process to associate or disassociate a web ACL to an Amplify app.

        @[JSON::Field(key: "wafStatus")]
        getter waf_status : String?

        # The Amazon Resource Name (ARN) for the web ACL associated with an Amplify app.

        @[JSON::Field(key: "webAclArn")]
        getter web_acl_arn : String?

        def initialize(
          @status_reason : String? = nil,
          @waf_status : String? = nil,
          @web_acl_arn : String? = nil
        )
        end
      end

      # Describes a webhook that connects repository events to an Amplify app.

      struct Webhook
        include JSON::Serializable

        # The name for a branch that is part of an Amplify app.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # A timestamp of when Amplify created the webhook in your Git repository.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The description for a webhook.

        @[JSON::Field(key: "description")]
        getter description : String

        # A timestamp of when Amplify updated the webhook in your Git repository.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The Amazon Resource Name (ARN) for the webhook.

        @[JSON::Field(key: "webhookArn")]
        getter webhook_arn : String

        # The ID of the webhook.

        @[JSON::Field(key: "webhookId")]
        getter webhook_id : String

        # The URL of the webhook.

        @[JSON::Field(key: "webhookUrl")]
        getter webhook_url : String

        # The unique ID of an Amplify app.

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        def initialize(
          @branch_name : String,
          @create_time : Time,
          @description : String,
          @update_time : Time,
          @webhook_arn : String,
          @webhook_id : String,
          @webhook_url : String,
          @app_id : String? = nil
        )
        end
      end
    end
  end
end
