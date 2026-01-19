require "json"
require "time"

module AwsSdk
  module ServiceCatalog
    module Types

      struct AcceptPortfolioShareInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The type of shared portfolios to accept. The default is to accept imported portfolios.
        # AWS_ORGANIZATIONS - Accept portfolios shared by the management account of your organization.
        # IMPORTED - Accept imported portfolios. AWS_SERVICECATALOG - Not supported. (Throws
        # ResourceNotFoundException.) For example, aws servicecatalog accept-portfolio-share --portfolio-id
        # "port-2qwzkwxt3y5fk" --portfolio-share-type AWS_ORGANIZATIONS
        @[JSON::Field(key: "PortfolioShareType")]
        getter portfolio_share_type : String?

        def initialize(
          @portfolio_id : String,
          @accept_language : String? = nil,
          @portfolio_share_type : String? = nil
        )
        end
      end

      struct AcceptPortfolioShareOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The access level to use to filter results.
      struct AccessLevelFilter
        include JSON::Serializable

        # The access level. Account - Filter results based on the account. Role - Filter results based on the
        # federated role of the specified user. User - Filter results based on the specified user.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The user to which the access level applies. The only supported value is self .
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct AssociateBudgetWithResourceInput
        include JSON::Serializable

        # The name of the budget you want to associate.
        @[JSON::Field(key: "BudgetName")]
        getter budget_name : String

        # The resource identifier. Either a portfolio-id or a product-id.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @budget_name : String,
          @resource_id : String
        )
        end
      end

      struct AssociateBudgetWithResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociatePrincipalWithPortfolioInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The ARN of the principal (user, role, or group). If the PrincipalType is IAM , the supported value
        # is a fully defined IAM Amazon Resource Name (ARN) . If the PrincipalType is IAM_PATTERN , the
        # supported value is an IAM ARN without an AccountID in the following format:
        # arn:partition:iam:::resource-type/resource-id The ARN resource-id can be either: A fully formed
        # resource-id. For example, arn:aws:iam:::role/resource-name or
        # arn:aws:iam:::role/resource-path/resource-name A wildcard ARN. The wildcard ARN accepts IAM_PATTERN
        # values with a "*" or "?" in the resource-id segment of the ARN. For example
        # arn:partition:service:::resource-type/resource-path/resource-name . The new symbols are exclusive to
        # the resource-path and resource-name and cannot replace the resource-type or other ARN values. The
        # ARN path and principal name allow unlimited wildcard characters. Examples of an acceptable wildcard
        # ARN: arn:aws:iam:::role/ResourceName_* arn:aws:iam:::role/*/ResourceName_? Examples of an
        # unacceptable wildcard ARN: arn:aws:iam:::*/ResourceName You can associate multiple IAM_PATTERN s
        # even if the account has no principal with that name. The "?" wildcard character matches zero or one
        # of any character. This is similar to ".?" in regular regex context. The "*" wildcard character
        # matches any number of any characters. This is similar to ".*" in regular regex context. In the IAM
        # Principal ARN format ( arn:partition:iam:::resource-type/resource-path/resource-name ), valid
        # resource-type values include user/ , group/ , or role/ . The "?" and "*" characters are allowed only
        # after the resource-type in the resource-id segment. You can use special characters anywhere within
        # the resource-id. The "*" character also matches the "/" character, allowing paths to be formed
        # within the resource-id. For example, arn:aws:iam:::role/ * /ResourceName_? matches both
        # arn:aws:iam:::role/pathA/pathB/ResourceName_1 and arn:aws:iam:::role/pathA/ResourceName_1 .
        @[JSON::Field(key: "PrincipalARN")]
        getter principal_arn : String

        # The principal type. The supported value is IAM if you use a fully defined Amazon Resource Name
        # (ARN), or IAM_PATTERN if you use an ARN with no accountID , with or without wildcard characters.
        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @portfolio_id : String,
          @principal_arn : String,
          @principal_type : String,
          @accept_language : String? = nil
        )
        end
      end

      struct AssociatePrincipalWithPortfolioOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociateProductWithPortfolioInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The identifier of the source portfolio.
        @[JSON::Field(key: "SourcePortfolioId")]
        getter source_portfolio_id : String?

        def initialize(
          @portfolio_id : String,
          @product_id : String,
          @accept_language : String? = nil,
          @source_portfolio_id : String? = nil
        )
        end
      end

      struct AssociateProductWithPortfolioOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociateServiceActionWithProvisioningArtifactInput
        include JSON::Serializable

        # The product identifier. For example, prod-abcdzk7xy33qa .
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The identifier of the provisioning artifact. For example, pa-4abcdjnxjj6ne .
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String

        # The self-service action identifier. For example, act-fs7abcd89wxyz .
        @[JSON::Field(key: "ServiceActionId")]
        getter service_action_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # A unique identifier that you provide to ensure idempotency. If multiple requests from the same
        # Amazon Web Services account use the same idempotency token, the same response is returned for each
        # repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        def initialize(
          @product_id : String,
          @provisioning_artifact_id : String,
          @service_action_id : String,
          @accept_language : String? = nil,
          @idempotency_token : String? = nil
        )
        end
      end

      struct AssociateServiceActionWithProvisioningArtifactOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociateTagOptionWithResourceInput
        include JSON::Serializable

        # The resource identifier.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The TagOption identifier.
        @[JSON::Field(key: "TagOptionId")]
        getter tag_option_id : String

        def initialize(
          @resource_id : String,
          @tag_option_id : String
        )
        end
      end

      struct AssociateTagOptionWithResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct BatchAssociateServiceActionWithProvisioningArtifactInput
        include JSON::Serializable

        # One or more associations, each consisting of the Action ID, the Product ID, and the Provisioning
        # Artifact ID.
        @[JSON::Field(key: "ServiceActionAssociations")]
        getter service_action_associations : Array(Types::ServiceActionAssociation)

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @service_action_associations : Array(Types::ServiceActionAssociation),
          @accept_language : String? = nil
        )
        end
      end

      struct BatchAssociateServiceActionWithProvisioningArtifactOutput
        include JSON::Serializable

        # An object that contains a list of errors, along with information to help you identify the
        # self-service action.
        @[JSON::Field(key: "FailedServiceActionAssociations")]
        getter failed_service_action_associations : Array(Types::FailedServiceActionAssociation)?

        def initialize(
          @failed_service_action_associations : Array(Types::FailedServiceActionAssociation)? = nil
        )
        end
      end

      struct BatchDisassociateServiceActionFromProvisioningArtifactInput
        include JSON::Serializable

        # One or more associations, each consisting of the Action ID, the Product ID, and the Provisioning
        # Artifact ID.
        @[JSON::Field(key: "ServiceActionAssociations")]
        getter service_action_associations : Array(Types::ServiceActionAssociation)

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @service_action_associations : Array(Types::ServiceActionAssociation),
          @accept_language : String? = nil
        )
        end
      end

      struct BatchDisassociateServiceActionFromProvisioningArtifactOutput
        include JSON::Serializable

        # An object that contains a list of errors, along with information to help you identify the
        # self-service action.
        @[JSON::Field(key: "FailedServiceActionAssociations")]
        getter failed_service_action_associations : Array(Types::FailedServiceActionAssociation)?

        def initialize(
          @failed_service_action_associations : Array(Types::FailedServiceActionAssociation)? = nil
        )
        end
      end

      # Information about a budget.
      struct BudgetDetail
        include JSON::Serializable

        # Name of the associated budget.
        @[JSON::Field(key: "BudgetName")]
        getter budget_name : String?

        def initialize(
          @budget_name : String? = nil
        )
        end
      end

      # Information about a CloudWatch dashboard.
      struct CloudWatchDashboard
        include JSON::Serializable

        # The name of the CloudWatch dashboard.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # The subtype containing details about the Codestar connection Type .
      struct CodeStarParameters
        include JSON::Serializable

        # The absolute path wehre the artifact resides within the repo and branch, formatted as
        # "folder/file.json."
        @[JSON::Field(key: "ArtifactPath")]
        getter artifact_path : String

        # The specific branch where the artifact resides.
        @[JSON::Field(key: "Branch")]
        getter branch : String

        # The CodeStar ARN, which is the connection between Service Catalog and the external repository.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String

        # The specific repository where the product’s artifact-to-be-synced resides, formatted as
        # "Account/Repo."
        @[JSON::Field(key: "Repository")]
        getter repository : String

        def initialize(
          @artifact_path : String,
          @branch : String,
          @connection_arn : String,
          @repository : String
        )
        end
      end

      # Information about a constraint.
      struct ConstraintDetail
        include JSON::Serializable

        # The identifier of the constraint.
        @[JSON::Field(key: "ConstraintId")]
        getter constraint_id : String?

        # The description of the constraint.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The owner of the constraint.
        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The identifier of the portfolio the product resides in. The constraint applies only to the instance
        # of the product that lives within this portfolio.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String?

        # The identifier of the product the constraint applies to. Note that a constraint applies to a
        # specific instance of a product within a certain portfolio.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # The type of constraint. LAUNCH NOTIFICATION STACKSET TEMPLATE
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @constraint_id : String? = nil,
          @description : String? = nil,
          @owner : String? = nil,
          @portfolio_id : String? = nil,
          @product_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Summary information about a constraint.
      struct ConstraintSummary
        include JSON::Serializable

        # The description of the constraint.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The type of constraint. LAUNCH NOTIFICATION STACKSET TEMPLATE
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @description : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct CopyProductInput
        include JSON::Serializable

        # A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the
        # idempotency token, the same response is returned for each repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The Amazon Resource Name (ARN) of the source product.
        @[JSON::Field(key: "SourceProductArn")]
        getter source_product_arn : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The copy options. If the value is CopyTags , the tags from the source product are copied to the
        # target product.
        @[JSON::Field(key: "CopyOptions")]
        getter copy_options : Array(String)?

        # The identifiers of the provisioning artifacts (also known as versions) of the product to copy. By
        # default, all provisioning artifacts are copied.
        @[JSON::Field(key: "SourceProvisioningArtifactIdentifiers")]
        getter source_provisioning_artifact_identifiers : Array(Hash(String, String))?

        # The identifier of the target product. By default, a new product is created.
        @[JSON::Field(key: "TargetProductId")]
        getter target_product_id : String?

        # A name for the target product. The default is the name of the source product.
        @[JSON::Field(key: "TargetProductName")]
        getter target_product_name : String?

        def initialize(
          @idempotency_token : String,
          @source_product_arn : String,
          @accept_language : String? = nil,
          @copy_options : Array(String)? = nil,
          @source_provisioning_artifact_identifiers : Array(Hash(String, String))? = nil,
          @target_product_id : String? = nil,
          @target_product_name : String? = nil
        )
        end
      end

      struct CopyProductOutput
        include JSON::Serializable

        # The token to use to track the progress of the operation.
        @[JSON::Field(key: "CopyProductToken")]
        getter copy_product_token : String?

        def initialize(
          @copy_product_token : String? = nil
        )
        end
      end

      struct CreateConstraintInput
        include JSON::Serializable

        # A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the
        # idempotency token, the same response is returned for each repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The constraint parameters, in JSON format. The syntax depends on the constraint type as follows:
        # LAUNCH You are required to specify either the RoleArn or the LocalRoleName but can't use both.
        # Specify the RoleArn property as follows: {"RoleArn" : "arn:aws:iam::123456789012:role/LaunchRole"}
        # Specify the LocalRoleName property as follows: {"LocalRoleName": "SCBasicLaunchRole"} If you specify
        # the LocalRoleName property, when an account uses the launch constraint, the IAM role with that name
        # in the account will be used. This allows launch-role constraints to be account-agnostic so the
        # administrator can create fewer resources per shared account. The given role name must exist in the
        # account used to create the launch constraint and the account of the user who launches a product with
        # this launch constraint. You cannot have both a LAUNCH and a STACKSET constraint. You also cannot
        # have more than one LAUNCH constraint on a product and portfolio. NOTIFICATION Specify the
        # NotificationArns property as follows: {"NotificationArns" :
        # ["arn:aws:sns:us-east-1:123456789012:Topic"]} RESOURCE_UPDATE Specify the
        # TagUpdatesOnProvisionedProduct property as follows:
        # {"Version":"2.0","Properties":{"TagUpdateOnProvisionedProduct":"String"}} The
        # TagUpdatesOnProvisionedProduct property accepts a string value of ALLOWED or NOT_ALLOWED . STACKSET
        # Specify the Parameters property as follows: {"Version": "String", "Properties": {"AccountList": [
        # "String" ], "RegionList": [ "String" ], "AdminRole": "String", "ExecutionRole": "String"}} You
        # cannot have both a LAUNCH and a STACKSET constraint. You also cannot have more than one STACKSET
        # constraint on a product and portfolio. Products with a STACKSET constraint will launch an
        # CloudFormation stack set. TEMPLATE Specify the Rules property. For more information, see Template
        # Constraint Rules .
        @[JSON::Field(key: "Parameters")]
        getter parameters : String

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The type of constraint. LAUNCH NOTIFICATION RESOURCE_UPDATE STACKSET TEMPLATE
        @[JSON::Field(key: "Type")]
        getter type : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The description of the constraint.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @idempotency_token : String,
          @parameters : String,
          @portfolio_id : String,
          @product_id : String,
          @type : String,
          @accept_language : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreateConstraintOutput
        include JSON::Serializable

        # Information about the constraint.
        @[JSON::Field(key: "ConstraintDetail")]
        getter constraint_detail : Types::ConstraintDetail?

        # The constraint parameters.
        @[JSON::Field(key: "ConstraintParameters")]
        getter constraint_parameters : String?

        # The status of the current request.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @constraint_detail : Types::ConstraintDetail? = nil,
          @constraint_parameters : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreatePortfolioInput
        include JSON::Serializable

        # The name to use for display purposes.
        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the
        # idempotency token, the same response is returned for each repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The name of the portfolio provider.
        @[JSON::Field(key: "ProviderName")]
        getter provider_name : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The description of the portfolio.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # One or more tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @display_name : String,
          @idempotency_token : String,
          @provider_name : String,
          @accept_language : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreatePortfolioOutput
        include JSON::Serializable

        # Information about the portfolio.
        @[JSON::Field(key: "PortfolioDetail")]
        getter portfolio_detail : Types::PortfolioDetail?

        # Information about the tags associated with the portfolio.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @portfolio_detail : Types::PortfolioDetail? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreatePortfolioShareInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The Amazon Web Services account ID. For example, 123456789012 .
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The organization node to whom you are going to share. When you pass OrganizationNode , it creates
        # PortfolioShare for all of the Amazon Web Services accounts that are associated to the
        # OrganizationNode . The output returns a PortfolioShareToken , which enables the administrator to
        # monitor the status of the PortfolioShare creation process.
        @[JSON::Field(key: "OrganizationNode")]
        getter organization_node : Types::OrganizationNode?

        # This parameter is only supported for portfolios with an OrganizationalNode Type of ORGANIZATION or
        # ORGANIZATIONAL_UNIT . Enables or disables Principal sharing when creating the portfolio share. If
        # you do not provide this flag, principal sharing is disabled. When you enable Principal Name Sharing
        # for a portfolio share, the share recipient account end users with a principal that matches any of
        # the associated IAM patterns can provision products from the portfolio. Once shared, the share
        # recipient can view associations of PrincipalType : IAM_PATTERN on their portfolio. You can create
        # the principals in the recipient account before or after creating the share.
        @[JSON::Field(key: "SharePrincipals")]
        getter share_principals : Bool?

        # Enables or disables TagOptions sharing when creating the portfolio share. If this flag is not
        # provided, TagOptions sharing is disabled.
        @[JSON::Field(key: "ShareTagOptions")]
        getter share_tag_options : Bool?

        def initialize(
          @portfolio_id : String,
          @accept_language : String? = nil,
          @account_id : String? = nil,
          @organization_node : Types::OrganizationNode? = nil,
          @share_principals : Bool? = nil,
          @share_tag_options : Bool? = nil
        )
        end
      end

      struct CreatePortfolioShareOutput
        include JSON::Serializable

        # The portfolio shares a unique identifier that only returns if the portfolio is shared to an
        # organization node.
        @[JSON::Field(key: "PortfolioShareToken")]
        getter portfolio_share_token : String?

        def initialize(
          @portfolio_share_token : String? = nil
        )
        end
      end

      struct CreateProductInput
        include JSON::Serializable

        # A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the
        # idempotency token, the same response is returned for each repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The name of the product.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The owner of the product.
        @[JSON::Field(key: "Owner")]
        getter owner : String

        # The type of product.
        @[JSON::Field(key: "ProductType")]
        getter product_type : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The description of the product.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The distributor of the product.
        @[JSON::Field(key: "Distributor")]
        getter distributor : String?

        # The configuration of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactParameters")]
        getter provisioning_artifact_parameters : Types::ProvisioningArtifactProperties?

        # Specifies connection details for the created product and syncs the product to the connection source
        # artifact. This automatically manages the product's artifacts based on changes to the source. The
        # SourceConnection parameter consists of the following sub-fields. Type ConnectionParamters
        @[JSON::Field(key: "SourceConnection")]
        getter source_connection : Types::SourceConnection?

        # The support information about the product.
        @[JSON::Field(key: "SupportDescription")]
        getter support_description : String?

        # The contact email for product support.
        @[JSON::Field(key: "SupportEmail")]
        getter support_email : String?

        # The contact URL for product support. ^https?:\/\// / is the pattern used to validate SupportUrl.
        @[JSON::Field(key: "SupportUrl")]
        getter support_url : String?

        # One or more tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @idempotency_token : String,
          @name : String,
          @owner : String,
          @product_type : String,
          @accept_language : String? = nil,
          @description : String? = nil,
          @distributor : String? = nil,
          @provisioning_artifact_parameters : Types::ProvisioningArtifactProperties? = nil,
          @source_connection : Types::SourceConnection? = nil,
          @support_description : String? = nil,
          @support_email : String? = nil,
          @support_url : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateProductOutput
        include JSON::Serializable

        # Information about the product view.
        @[JSON::Field(key: "ProductViewDetail")]
        getter product_view_detail : Types::ProductViewDetail?

        # Information about the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactDetail")]
        getter provisioning_artifact_detail : Types::ProvisioningArtifactDetail?

        # Information about the tags associated with the product.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @product_view_detail : Types::ProductViewDetail? = nil,
          @provisioning_artifact_detail : Types::ProvisioningArtifactDetail? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateProvisionedProductPlanInput
        include JSON::Serializable

        # A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the
        # idempotency token, the same response is returned for each repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The name of the plan.
        @[JSON::Field(key: "PlanName")]
        getter plan_name : String

        # The plan type.
        @[JSON::Field(key: "PlanType")]
        getter plan_type : String

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # A user-friendly name for the provisioned product. This value must be unique for the Amazon Web
        # Services account and cannot be updated after the product is provisioned.
        @[JSON::Field(key: "ProvisionedProductName")]
        getter provisioned_product_name : String

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # Passed to CloudFormation. The SNS topic ARNs to which to publish stack-related events.
        @[JSON::Field(key: "NotificationArns")]
        getter notification_arns : Array(String)?

        # The path identifier of the product. This value is optional if the product has a default path, and
        # required if the product has more than one path. To list the paths for a product, use ListLaunchPaths
        # .
        @[JSON::Field(key: "PathId")]
        getter path_id : String?

        # Parameters specified by the administrator that are required for provisioning the product.
        @[JSON::Field(key: "ProvisioningParameters")]
        getter provisioning_parameters : Array(Types::UpdateProvisioningParameter)?

        # One or more tags. If the plan is for an existing provisioned product, the product must have a
        # RESOURCE_UPDATE constraint with TagUpdatesOnProvisionedProduct set to ALLOWED to allow tag updates.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @idempotency_token : String,
          @plan_name : String,
          @plan_type : String,
          @product_id : String,
          @provisioned_product_name : String,
          @provisioning_artifact_id : String,
          @accept_language : String? = nil,
          @notification_arns : Array(String)? = nil,
          @path_id : String? = nil,
          @provisioning_parameters : Array(Types::UpdateProvisioningParameter)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateProvisionedProductPlanOutput
        include JSON::Serializable

        # The plan identifier.
        @[JSON::Field(key: "PlanId")]
        getter plan_id : String?

        # The name of the plan.
        @[JSON::Field(key: "PlanName")]
        getter plan_name : String?

        # The product identifier.
        @[JSON::Field(key: "ProvisionProductId")]
        getter provision_product_id : String?

        # The user-friendly name of the provisioned product.
        @[JSON::Field(key: "ProvisionedProductName")]
        getter provisioned_product_name : String?

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String?

        def initialize(
          @plan_id : String? = nil,
          @plan_name : String? = nil,
          @provision_product_id : String? = nil,
          @provisioned_product_name : String? = nil,
          @provisioning_artifact_id : String? = nil
        )
        end
      end

      struct CreateProvisioningArtifactInput
        include JSON::Serializable

        # A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the
        # idempotency token, the same response is returned for each repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The configuration for the provisioning artifact.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Types::ProvisioningArtifactProperties

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @idempotency_token : String,
          @parameters : Types::ProvisioningArtifactProperties,
          @product_id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct CreateProvisioningArtifactOutput
        include JSON::Serializable

        # Specify the template source with one of the following options, but not both. Keys accepted: [
        # LoadTemplateFromURL , ImportFromPhysicalId ]. Use the URL of the CloudFormation template in Amazon
        # S3 or GitHub in JSON format. LoadTemplateFromURL Use the URL of the CloudFormation template in
        # Amazon S3 or GitHub in JSON format. ImportFromPhysicalId Use the physical id of the resource that
        # contains the template; currently supports CloudFormation stack ARN.
        @[JSON::Field(key: "Info")]
        getter info : Hash(String, String)?

        # Information about the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactDetail")]
        getter provisioning_artifact_detail : Types::ProvisioningArtifactDetail?

        # The status of the current request.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @info : Hash(String, String)? = nil,
          @provisioning_artifact_detail : Types::ProvisioningArtifactDetail? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateServiceActionInput
        include JSON::Serializable

        # The self-service action definition. Can be one of the following: Name The name of the Amazon Web
        # Services Systems Manager document (SSM document). For example, AWS-RestartEC2Instance . If you are
        # using a shared SSM document, you must provide the ARN instead of the name. Version The Amazon Web
        # Services Systems Manager automation document version. For example, "Version": "1" AssumeRole The
        # Amazon Resource Name (ARN) of the role that performs the self-service actions on your behalf. For
        # example, "AssumeRole": "arn:aws:iam::12345678910:role/ActionRole" . To reuse the provisioned product
        # launch role, set to "AssumeRole": "LAUNCH_ROLE" . Parameters The list of parameters in JSON format.
        # For example: [{\"Name\":\"InstanceId\",\"Type\":\"TARGET\"}] or
        # [{\"Name\":\"InstanceId\",\"Type\":\"TEXT_VALUE\"}] .
        @[JSON::Field(key: "Definition")]
        getter definition : Hash(String, String)

        # The service action definition type. For example, SSM_AUTOMATION .
        @[JSON::Field(key: "DefinitionType")]
        getter definition_type : String

        # A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the
        # idempotency token, the same response is returned for each repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The self-service action name.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The self-service action description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @definition : Hash(String, String),
          @definition_type : String,
          @idempotency_token : String,
          @name : String,
          @accept_language : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreateServiceActionOutput
        include JSON::Serializable

        # An object containing information about the self-service action.
        @[JSON::Field(key: "ServiceActionDetail")]
        getter service_action_detail : Types::ServiceActionDetail?

        def initialize(
          @service_action_detail : Types::ServiceActionDetail? = nil
        )
        end
      end

      struct CreateTagOptionInput
        include JSON::Serializable

        # The TagOption key.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The TagOption value.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct CreateTagOptionOutput
        include JSON::Serializable

        # Information about the TagOption.
        @[JSON::Field(key: "TagOptionDetail")]
        getter tag_option_detail : Types::TagOptionDetail?

        def initialize(
          @tag_option_detail : Types::TagOptionDetail? = nil
        )
        end
      end

      struct DeleteConstraintInput
        include JSON::Serializable

        # The identifier of the constraint.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct DeleteConstraintOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeletePortfolioInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct DeletePortfolioOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeletePortfolioShareInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The Amazon Web Services account ID.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The organization node to whom you are going to stop sharing.
        @[JSON::Field(key: "OrganizationNode")]
        getter organization_node : Types::OrganizationNode?

        def initialize(
          @portfolio_id : String,
          @accept_language : String? = nil,
          @account_id : String? = nil,
          @organization_node : Types::OrganizationNode? = nil
        )
        end
      end

      struct DeletePortfolioShareOutput
        include JSON::Serializable

        # The portfolio share unique identifier. This will only be returned if delete is made to an
        # organization node.
        @[JSON::Field(key: "PortfolioShareToken")]
        getter portfolio_share_token : String?

        def initialize(
          @portfolio_share_token : String? = nil
        )
        end
      end

      struct DeleteProductInput
        include JSON::Serializable

        # The product identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct DeleteProductOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteProvisionedProductPlanInput
        include JSON::Serializable

        # The plan identifier.
        @[JSON::Field(key: "PlanId")]
        getter plan_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # If set to true, Service Catalog stops managing the specified provisioned product even if it cannot
        # delete the underlying resources.
        @[JSON::Field(key: "IgnoreErrors")]
        getter ignore_errors : Bool?

        def initialize(
          @plan_id : String,
          @accept_language : String? = nil,
          @ignore_errors : Bool? = nil
        )
        end
      end

      struct DeleteProvisionedProductPlanOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteProvisioningArtifactInput
        include JSON::Serializable

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @product_id : String,
          @provisioning_artifact_id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct DeleteProvisioningArtifactOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteServiceActionInput
        include JSON::Serializable

        # The self-service action identifier. For example, act-fs7abcd89wxyz .
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # A unique identifier that you provide to ensure idempotency. If multiple requests from the same
        # Amazon Web Services account use the same idempotency token, the same response is returned for each
        # repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        def initialize(
          @id : String,
          @accept_language : String? = nil,
          @idempotency_token : String? = nil
        )
        end
      end

      struct DeleteServiceActionOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteTagOptionInput
        include JSON::Serializable

        # The TagOption identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DeleteTagOptionOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeConstraintInput
        include JSON::Serializable

        # The identifier of the constraint.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct DescribeConstraintOutput
        include JSON::Serializable

        # Information about the constraint.
        @[JSON::Field(key: "ConstraintDetail")]
        getter constraint_detail : Types::ConstraintDetail?

        # The constraint parameters.
        @[JSON::Field(key: "ConstraintParameters")]
        getter constraint_parameters : String?

        # The status of the current request.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @constraint_detail : Types::ConstraintDetail? = nil,
          @constraint_parameters : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribeCopyProductStatusInput
        include JSON::Serializable

        # The token for the copy product operation. This token is returned by CopyProduct .
        @[JSON::Field(key: "CopyProductToken")]
        getter copy_product_token : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @copy_product_token : String,
          @accept_language : String? = nil
        )
        end
      end

      struct DescribeCopyProductStatusOutput
        include JSON::Serializable

        # The status of the copy product operation.
        @[JSON::Field(key: "CopyProductStatus")]
        getter copy_product_status : String?

        # The status message.
        @[JSON::Field(key: "StatusDetail")]
        getter status_detail : String?

        # The identifier of the copied product.
        @[JSON::Field(key: "TargetProductId")]
        getter target_product_id : String?

        def initialize(
          @copy_product_status : String? = nil,
          @status_detail : String? = nil,
          @target_product_id : String? = nil
        )
        end
      end

      struct DescribePortfolioInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct DescribePortfolioOutput
        include JSON::Serializable

        # Information about the associated budgets.
        @[JSON::Field(key: "Budgets")]
        getter budgets : Array(Types::BudgetDetail)?

        # Information about the portfolio.
        @[JSON::Field(key: "PortfolioDetail")]
        getter portfolio_detail : Types::PortfolioDetail?

        # Information about the TagOptions associated with the portfolio.
        @[JSON::Field(key: "TagOptions")]
        getter tag_options : Array(Types::TagOptionDetail)?

        # Information about the tags associated with the portfolio.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @budgets : Array(Types::BudgetDetail)? = nil,
          @portfolio_detail : Types::PortfolioDetail? = nil,
          @tag_options : Array(Types::TagOptionDetail)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct DescribePortfolioShareStatusInput
        include JSON::Serializable

        # The token for the portfolio share operation. This token is returned either by CreatePortfolioShare
        # or by DeletePortfolioShare.
        @[JSON::Field(key: "PortfolioShareToken")]
        getter portfolio_share_token : String

        def initialize(
          @portfolio_share_token : String
        )
        end
      end

      struct DescribePortfolioShareStatusOutput
        include JSON::Serializable

        # Organization node identifier. It can be either account id, organizational unit id or organization
        # id.
        @[JSON::Field(key: "OrganizationNodeValue")]
        getter organization_node_value : String?

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String?

        # The token for the portfolio share operation. For example, share-6v24abcdefghi .
        @[JSON::Field(key: "PortfolioShareToken")]
        getter portfolio_share_token : String?

        # Information about the portfolio share operation.
        @[JSON::Field(key: "ShareDetails")]
        getter share_details : Types::ShareDetails?

        # Status of the portfolio share operation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @organization_node_value : String? = nil,
          @portfolio_id : String? = nil,
          @portfolio_share_token : String? = nil,
          @share_details : Types::ShareDetails? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribePortfolioSharesInput
        include JSON::Serializable

        # The unique identifier of the portfolio for which shares will be retrieved.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The type of portfolio share to summarize. This field acts as a filter on the type of portfolio
        # share, which can be one of the following: 1. ACCOUNT - Represents an external account to account
        # share. 2. ORGANIZATION - Represents a share to an organization. This share is available to every
        # account in the organization. 3. ORGANIZATIONAL_UNIT - Represents a share to an organizational unit.
        # 4. ORGANIZATION_MEMBER_ACCOUNT - Represents a share to an account in the organization.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @portfolio_id : String,
          @type : String,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct DescribePortfolioSharesOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Summaries about each of the portfolio shares.
        @[JSON::Field(key: "PortfolioShareDetails")]
        getter portfolio_share_details : Array(Types::PortfolioShareDetail)?

        def initialize(
          @next_page_token : String? = nil,
          @portfolio_share_details : Array(Types::PortfolioShareDetail)? = nil
        )
        end
      end

      struct DescribeProductAsAdminInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The product identifier.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The product name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique identifier of the shared portfolio that the specified product is associated with. You can
        # provide this parameter to retrieve the shared TagOptions associated with the product. If this
        # parameter is provided and if TagOptions sharing is enabled in the portfolio share, the API returns
        # both local and shared TagOptions associated with the product. Otherwise only local TagOptions will
        # be returned.
        @[JSON::Field(key: "SourcePortfolioId")]
        getter source_portfolio_id : String?

        def initialize(
          @accept_language : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @source_portfolio_id : String? = nil
        )
        end
      end

      struct DescribeProductAsAdminOutput
        include JSON::Serializable

        # Information about the associated budgets.
        @[JSON::Field(key: "Budgets")]
        getter budgets : Array(Types::BudgetDetail)?

        # Information about the product view.
        @[JSON::Field(key: "ProductViewDetail")]
        getter product_view_detail : Types::ProductViewDetail?

        # Information about the provisioning artifacts (also known as versions) for the specified product.
        @[JSON::Field(key: "ProvisioningArtifactSummaries")]
        getter provisioning_artifact_summaries : Array(Types::ProvisioningArtifactSummary)?

        # Information about the TagOptions associated with the product.
        @[JSON::Field(key: "TagOptions")]
        getter tag_options : Array(Types::TagOptionDetail)?

        # Information about the tags associated with the product.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @budgets : Array(Types::BudgetDetail)? = nil,
          @product_view_detail : Types::ProductViewDetail? = nil,
          @provisioning_artifact_summaries : Array(Types::ProvisioningArtifactSummary)? = nil,
          @tag_options : Array(Types::TagOptionDetail)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct DescribeProductInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The product identifier.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The product name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @accept_language : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct DescribeProductOutput
        include JSON::Serializable

        # Information about the associated budgets.
        @[JSON::Field(key: "Budgets")]
        getter budgets : Array(Types::BudgetDetail)?

        # Information about the associated launch paths.
        @[JSON::Field(key: "LaunchPaths")]
        getter launch_paths : Array(Types::LaunchPath)?

        # Summary information about the product view.
        @[JSON::Field(key: "ProductViewSummary")]
        getter product_view_summary : Types::ProductViewSummary?

        # Information about the provisioning artifacts for the specified product.
        @[JSON::Field(key: "ProvisioningArtifacts")]
        getter provisioning_artifacts : Array(Types::ProvisioningArtifact)?

        def initialize(
          @budgets : Array(Types::BudgetDetail)? = nil,
          @launch_paths : Array(Types::LaunchPath)? = nil,
          @product_view_summary : Types::ProductViewSummary? = nil,
          @provisioning_artifacts : Array(Types::ProvisioningArtifact)? = nil
        )
        end
      end

      struct DescribeProductViewInput
        include JSON::Serializable

        # The product view identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct DescribeProductViewOutput
        include JSON::Serializable

        # Summary information about the product.
        @[JSON::Field(key: "ProductViewSummary")]
        getter product_view_summary : Types::ProductViewSummary?

        # Information about the provisioning artifacts for the product.
        @[JSON::Field(key: "ProvisioningArtifacts")]
        getter provisioning_artifacts : Array(Types::ProvisioningArtifact)?

        def initialize(
          @product_view_summary : Types::ProductViewSummary? = nil,
          @provisioning_artifacts : Array(Types::ProvisioningArtifact)? = nil
        )
        end
      end

      # DescribeProvisionedProductAPI input structure. AcceptLanguage - [Optional] The language code for
      # localization. Id - [Optional] The provisioned product identifier. Name - [Optional] Another
      # provisioned product identifier. Customers must provide either Id or Name.
      struct DescribeProvisionedProductInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The provisioned product identifier. You must provide the name or ID, but not both. If you do not
        # provide a name or ID, or you provide both name and ID, an InvalidParametersException will occur.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the provisioned product. You must provide the name or ID, but not both. If you do not
        # provide a name or ID, or you provide both name and ID, an InvalidParametersException will occur.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @accept_language : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct DescribeProvisionedProductOutput
        include JSON::Serializable

        # Any CloudWatch dashboards that were created when provisioning the product.
        @[JSON::Field(key: "CloudWatchDashboards")]
        getter cloud_watch_dashboards : Array(Types::CloudWatchDashboard)?

        # Information about the provisioned product.
        @[JSON::Field(key: "ProvisionedProductDetail")]
        getter provisioned_product_detail : Types::ProvisionedProductDetail?

        def initialize(
          @cloud_watch_dashboards : Array(Types::CloudWatchDashboard)? = nil,
          @provisioned_product_detail : Types::ProvisionedProductDetail? = nil
        )
        end
      end

      struct DescribeProvisionedProductPlanInput
        include JSON::Serializable

        # The plan identifier.
        @[JSON::Field(key: "PlanId")]
        getter plan_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @plan_id : String,
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct DescribeProvisionedProductPlanOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Information about the plan.
        @[JSON::Field(key: "ProvisionedProductPlanDetails")]
        getter provisioned_product_plan_details : Types::ProvisionedProductPlanDetails?

        # Information about the resource changes that will occur when the plan is executed.
        @[JSON::Field(key: "ResourceChanges")]
        getter resource_changes : Array(Types::ResourceChange)?

        def initialize(
          @next_page_token : String? = nil,
          @provisioned_product_plan_details : Types::ProvisionedProductPlanDetails? = nil,
          @resource_changes : Array(Types::ResourceChange)? = nil
        )
        end
      end

      struct DescribeProvisioningArtifactInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # Indicates if the API call response does or does not include additional details about the
        # provisioning parameters.
        @[JSON::Field(key: "IncludeProvisioningArtifactParameters")]
        getter include_provisioning_artifact_parameters : Bool?

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # The product name.
        @[JSON::Field(key: "ProductName")]
        getter product_name : String?

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String?

        # The provisioning artifact name.
        @[JSON::Field(key: "ProvisioningArtifactName")]
        getter provisioning_artifact_name : String?

        # Indicates whether a verbose level of detail is enabled.
        @[JSON::Field(key: "Verbose")]
        getter verbose : Bool?

        def initialize(
          @accept_language : String? = nil,
          @include_provisioning_artifact_parameters : Bool? = nil,
          @product_id : String? = nil,
          @product_name : String? = nil,
          @provisioning_artifact_id : String? = nil,
          @provisioning_artifact_name : String? = nil,
          @verbose : Bool? = nil
        )
        end
      end

      struct DescribeProvisioningArtifactOutput
        include JSON::Serializable

        # The URL of the CloudFormation template in Amazon S3 or GitHub in JSON format.
        @[JSON::Field(key: "Info")]
        getter info : Hash(String, String)?

        # Information about the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactDetail")]
        getter provisioning_artifact_detail : Types::ProvisioningArtifactDetail?

        # Information about the parameters used to provision the product.
        @[JSON::Field(key: "ProvisioningArtifactParameters")]
        getter provisioning_artifact_parameters : Array(Types::ProvisioningArtifactParameter)?

        # The status of the current request.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @info : Hash(String, String)? = nil,
          @provisioning_artifact_detail : Types::ProvisioningArtifactDetail? = nil,
          @provisioning_artifact_parameters : Array(Types::ProvisioningArtifactParameter)? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribeProvisioningParametersInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The path identifier of the product. This value is optional if the product has a default path, and
        # required if the product has more than one path. To list the paths for a product, use ListLaunchPaths
        # . You must provide the name or ID, but not both.
        @[JSON::Field(key: "PathId")]
        getter path_id : String?

        # The name of the path. You must provide the name or ID, but not both.
        @[JSON::Field(key: "PathName")]
        getter path_name : String?

        # The product identifier. You must provide the product name or ID, but not both.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # The name of the product. You must provide the name or ID, but not both.
        @[JSON::Field(key: "ProductName")]
        getter product_name : String?

        # The identifier of the provisioning artifact. You must provide the name or ID, but not both.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String?

        # The name of the provisioning artifact. You must provide the name or ID, but not both.
        @[JSON::Field(key: "ProvisioningArtifactName")]
        getter provisioning_artifact_name : String?

        def initialize(
          @accept_language : String? = nil,
          @path_id : String? = nil,
          @path_name : String? = nil,
          @product_id : String? = nil,
          @product_name : String? = nil,
          @provisioning_artifact_id : String? = nil,
          @provisioning_artifact_name : String? = nil
        )
        end
      end

      struct DescribeProvisioningParametersOutput
        include JSON::Serializable

        # Information about the constraints used to provision the product.
        @[JSON::Field(key: "ConstraintSummaries")]
        getter constraint_summaries : Array(Types::ConstraintSummary)?

        # A list of the keys and descriptions of the outputs. These outputs can be referenced from a
        # provisioned product launched from this provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactOutputKeys")]
        getter provisioning_artifact_output_keys : Array(Types::ProvisioningArtifactOutput)?

        # The output of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactOutputs")]
        getter provisioning_artifact_outputs : Array(Types::ProvisioningArtifactOutput)?

        # Information about the parameters used to provision the product.
        @[JSON::Field(key: "ProvisioningArtifactParameters")]
        getter provisioning_artifact_parameters : Array(Types::ProvisioningArtifactParameter)?

        # An object that contains information about preferences, such as Regions and accounts, for the
        # provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactPreferences")]
        getter provisioning_artifact_preferences : Types::ProvisioningArtifactPreferences?

        # Information about the TagOptions associated with the resource.
        @[JSON::Field(key: "TagOptions")]
        getter tag_options : Array(Types::TagOptionSummary)?

        # Any additional metadata specifically related to the provisioning of the product. For example, see
        # the Version field of the CloudFormation template.
        @[JSON::Field(key: "UsageInstructions")]
        getter usage_instructions : Array(Types::UsageInstruction)?

        def initialize(
          @constraint_summaries : Array(Types::ConstraintSummary)? = nil,
          @provisioning_artifact_output_keys : Array(Types::ProvisioningArtifactOutput)? = nil,
          @provisioning_artifact_outputs : Array(Types::ProvisioningArtifactOutput)? = nil,
          @provisioning_artifact_parameters : Array(Types::ProvisioningArtifactParameter)? = nil,
          @provisioning_artifact_preferences : Types::ProvisioningArtifactPreferences? = nil,
          @tag_options : Array(Types::TagOptionSummary)? = nil,
          @usage_instructions : Array(Types::UsageInstruction)? = nil
        )
        end
      end

      struct DescribeRecordInput
        include JSON::Serializable

        # The record identifier of the provisioned product. This identifier is returned by the request
        # operation.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @id : String,
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct DescribeRecordOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Information about the product.
        @[JSON::Field(key: "RecordDetail")]
        getter record_detail : Types::RecordDetail?

        # Information about the product created as the result of a request. For example, the output for a
        # CloudFormation-backed product that creates an S3 bucket would include the S3 bucket URL.
        @[JSON::Field(key: "RecordOutputs")]
        getter record_outputs : Array(Types::RecordOutput)?

        def initialize(
          @next_page_token : String? = nil,
          @record_detail : Types::RecordDetail? = nil,
          @record_outputs : Array(Types::RecordOutput)? = nil
        )
        end
      end

      struct DescribeServiceActionExecutionParametersInput
        include JSON::Serializable

        # The identifier of the provisioned product.
        @[JSON::Field(key: "ProvisionedProductId")]
        getter provisioned_product_id : String

        # The self-service action identifier.
        @[JSON::Field(key: "ServiceActionId")]
        getter service_action_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @provisioned_product_id : String,
          @service_action_id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct DescribeServiceActionExecutionParametersOutput
        include JSON::Serializable

        # The parameters of the self-service action.
        @[JSON::Field(key: "ServiceActionParameters")]
        getter service_action_parameters : Array(Types::ExecutionParameter)?

        def initialize(
          @service_action_parameters : Array(Types::ExecutionParameter)? = nil
        )
        end
      end

      struct DescribeServiceActionInput
        include JSON::Serializable

        # The self-service action identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct DescribeServiceActionOutput
        include JSON::Serializable

        # Detailed information about the self-service action.
        @[JSON::Field(key: "ServiceActionDetail")]
        getter service_action_detail : Types::ServiceActionDetail?

        def initialize(
          @service_action_detail : Types::ServiceActionDetail? = nil
        )
        end
      end

      struct DescribeTagOptionInput
        include JSON::Serializable

        # The TagOption identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DescribeTagOptionOutput
        include JSON::Serializable

        # Information about the TagOption.
        @[JSON::Field(key: "TagOptionDetail")]
        getter tag_option_detail : Types::TagOptionDetail?

        def initialize(
          @tag_option_detail : Types::TagOptionDetail? = nil
        )
        end
      end

      struct DisableAWSOrganizationsAccessInput
        include JSON::Serializable

        def initialize
        end
      end

      struct DisableAWSOrganizationsAccessOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateBudgetFromResourceInput
        include JSON::Serializable

        # The name of the budget you want to disassociate.
        @[JSON::Field(key: "BudgetName")]
        getter budget_name : String

        # The resource identifier you want to disassociate from. Either a portfolio-id or a product-id.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @budget_name : String,
          @resource_id : String
        )
        end
      end

      struct DisassociateBudgetFromResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociatePrincipalFromPortfolioInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The ARN of the principal (user, role, or group). This field allows an ARN with no accountID with or
        # without wildcard characters if PrincipalType is IAM_PATTERN .
        @[JSON::Field(key: "PrincipalARN")]
        getter principal_arn : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The supported value is IAM if you use a fully defined ARN, or IAM_PATTERN if you specify an IAM ARN
        # with no AccountId, with or without wildcard characters.
        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String?

        def initialize(
          @portfolio_id : String,
          @principal_arn : String,
          @accept_language : String? = nil,
          @principal_type : String? = nil
        )
        end
      end

      struct DisassociatePrincipalFromPortfolioOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateProductFromPortfolioInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @portfolio_id : String,
          @product_id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct DisassociateProductFromPortfolioOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateServiceActionFromProvisioningArtifactInput
        include JSON::Serializable

        # The product identifier. For example, prod-abcdzk7xy33qa .
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The identifier of the provisioning artifact. For example, pa-4abcdjnxjj6ne .
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String

        # The self-service action identifier. For example, act-fs7abcd89wxyz .
        @[JSON::Field(key: "ServiceActionId")]
        getter service_action_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # A unique identifier that you provide to ensure idempotency. If multiple requests from the same
        # Amazon Web Services account use the same idempotency token, the same response is returned for each
        # repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        def initialize(
          @product_id : String,
          @provisioning_artifact_id : String,
          @service_action_id : String,
          @accept_language : String? = nil,
          @idempotency_token : String? = nil
        )
        end
      end

      struct DisassociateServiceActionFromProvisioningArtifactOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateTagOptionFromResourceInput
        include JSON::Serializable

        # The resource identifier.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The TagOption identifier.
        @[JSON::Field(key: "TagOptionId")]
        getter tag_option_id : String

        def initialize(
          @resource_id : String,
          @tag_option_id : String
        )
        end
      end

      struct DisassociateTagOptionFromResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The specified resource is a duplicate.
      struct DuplicateResourceException
        include JSON::Serializable

        def initialize
        end
      end

      struct EnableAWSOrganizationsAccessInput
        include JSON::Serializable

        def initialize
        end
      end

      struct EnableAWSOrganizationsAccessOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The ID for the provisioned product resources that are part of a resource group.
      struct EngineWorkflowResourceIdentifier
        include JSON::Serializable

        # The unique key-value pair for a tag that identifies provisioned product resources.
        @[JSON::Field(key: "UniqueTag")]
        getter unique_tag : Types::UniqueTagResourceIdentifier?

        def initialize(
          @unique_tag : Types::UniqueTagResourceIdentifier? = nil
        )
        end
      end

      struct ExecuteProvisionedProductPlanInput
        include JSON::Serializable

        # A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the
        # idempotency token, the same response is returned for each repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The plan identifier.
        @[JSON::Field(key: "PlanId")]
        getter plan_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @idempotency_token : String,
          @plan_id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct ExecuteProvisionedProductPlanOutput
        include JSON::Serializable

        # Information about the result of provisioning the product.
        @[JSON::Field(key: "RecordDetail")]
        getter record_detail : Types::RecordDetail?

        def initialize(
          @record_detail : Types::RecordDetail? = nil
        )
        end
      end

      struct ExecuteProvisionedProductServiceActionInput
        include JSON::Serializable

        # An idempotency token that uniquely identifies the execute request.
        @[JSON::Field(key: "ExecuteToken")]
        getter execute_token : String

        # The identifier of the provisioned product.
        @[JSON::Field(key: "ProvisionedProductId")]
        getter provisioned_product_id : String

        # The self-service action identifier. For example, act-fs7abcd89wxyz .
        @[JSON::Field(key: "ServiceActionId")]
        getter service_action_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # A map of all self-service action parameters and their values. If a provided parameter is of a
        # special type, such as TARGET , the provided value will override the default value generated by
        # Service Catalog. If the parameters field is not provided, no additional parameters are passed and
        # default values will be used for any special parameters such as TARGET .
        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        def initialize(
          @execute_token : String,
          @provisioned_product_id : String,
          @service_action_id : String,
          @accept_language : String? = nil,
          @parameters : Hash(String, Array(String))? = nil
        )
        end
      end

      struct ExecuteProvisionedProductServiceActionOutput
        include JSON::Serializable

        # An object containing detailed information about the result of provisioning the product.
        @[JSON::Field(key: "RecordDetail")]
        getter record_detail : Types::RecordDetail?

        def initialize(
          @record_detail : Types::RecordDetail? = nil
        )
        end
      end

      # Details of an execution parameter value that is passed to a self-service action when executed on a
      # provisioned product.
      struct ExecutionParameter
        include JSON::Serializable

        # The default values for the execution parameter.
        @[JSON::Field(key: "DefaultValues")]
        getter default_values : Array(String)?

        # The name of the execution parameter.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The execution parameter type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @default_values : Array(String)? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # An object containing information about the error, along with identifying information about the
      # self-service action and its associations.
      struct FailedServiceActionAssociation
        include JSON::Serializable

        # The error code. Valid values are listed below.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A text description of the error.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The product identifier. For example, prod-abcdzk7xy33qa .
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # The identifier of the provisioning artifact. For example, pa-4abcdjnxjj6ne .
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String?

        # The self-service action identifier. For example, act-fs7abcd89wxyz .
        @[JSON::Field(key: "ServiceActionId")]
        getter service_action_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @product_id : String? = nil,
          @provisioning_artifact_id : String? = nil,
          @service_action_id : String? = nil
        )
        end
      end

      struct GetAWSOrganizationsAccessStatusInput
        include JSON::Serializable

        def initialize
        end
      end

      struct GetAWSOrganizationsAccessStatusOutput
        include JSON::Serializable

        # The status of the portfolio share feature.
        @[JSON::Field(key: "AccessStatus")]
        getter access_status : String?

        def initialize(
          @access_status : String? = nil
        )
        end
      end

      struct GetProvisionedProductOutputsInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The list of keys that the API should return with their values. If none are provided, the API will
        # return all outputs of the provisioned product.
        @[JSON::Field(key: "OutputKeys")]
        getter output_keys : Array(String)?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        # The identifier of the provisioned product that you want the outputs from.
        @[JSON::Field(key: "ProvisionedProductId")]
        getter provisioned_product_id : String?

        # The name of the provisioned product that you want the outputs from.
        @[JSON::Field(key: "ProvisionedProductName")]
        getter provisioned_product_name : String?

        def initialize(
          @accept_language : String? = nil,
          @output_keys : Array(String)? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil,
          @provisioned_product_id : String? = nil,
          @provisioned_product_name : String? = nil
        )
        end
      end

      struct GetProvisionedProductOutputsOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Information about the product created as the result of a request. For example, the output for a
        # CloudFormation-backed product that creates an S3 bucket would include the S3 bucket URL.
        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::RecordOutput)?

        def initialize(
          @next_page_token : String? = nil,
          @outputs : Array(Types::RecordOutput)? = nil
        )
        end
      end

      struct ImportAsProvisionedProductInput
        include JSON::Serializable

        # A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the
        # idempotency token, the same response is returned for each repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The unique identifier of the resource to be imported. It only currently supports CloudFormation
        # stack IDs.
        @[JSON::Field(key: "PhysicalId")]
        getter physical_id : String

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The user-friendly name of the provisioned product. The value must be unique for the Amazon Web
        # Services account. The name cannot be updated after the product is provisioned.
        @[JSON::Field(key: "ProvisionedProductName")]
        getter provisioned_product_name : String

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @idempotency_token : String,
          @physical_id : String,
          @product_id : String,
          @provisioned_product_name : String,
          @provisioning_artifact_id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct ImportAsProvisionedProductOutput
        include JSON::Serializable

        @[JSON::Field(key: "RecordDetail")]
        getter record_detail : Types::RecordDetail?

        def initialize(
          @record_detail : Types::RecordDetail? = nil
        )
        end
      end

      # One or more parameters provided to the operation are not valid.
      struct InvalidParametersException
        include JSON::Serializable

        def initialize
        end
      end

      # An attempt was made to modify a resource that is in a state that is not valid. Check your resources
      # to ensure that they are in valid states before retrying the operation.
      struct InvalidStateException
        include JSON::Serializable

        def initialize
        end
      end

      # Provides details about the product's connection sync and contains the following sub-fields.
      # LastSyncTime LastSyncStatus LastSyncStatusMessage LastSuccessfulSyncTime
      # LastSuccessfulSyncProvisioningArtifactID
      struct LastSync
        include JSON::Serializable

        # The ProvisioningArtifactID of the ProvisioningArtifact created from the latest successful sync.
        @[JSON::Field(key: "LastSuccessfulSyncProvisioningArtifactId")]
        getter last_successful_sync_provisioning_artifact_id : String?

        # The time of the latest successful sync from the source repo artifact to the Service Catalog product.
        @[JSON::Field(key: "LastSuccessfulSyncTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_successful_sync_time : Time?

        # The current status of the sync. Responses include SUCCEEDED or FAILED .
        @[JSON::Field(key: "LastSyncStatus")]
        getter last_sync_status : String?

        # The sync's status message.
        @[JSON::Field(key: "LastSyncStatusMessage")]
        getter last_sync_status_message : String?

        # The time of the last attempted sync from the repository to the Service Catalog product.
        @[JSON::Field(key: "LastSyncTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_sync_time : Time?

        def initialize(
          @last_successful_sync_provisioning_artifact_id : String? = nil,
          @last_successful_sync_time : Time? = nil,
          @last_sync_status : String? = nil,
          @last_sync_status_message : String? = nil,
          @last_sync_time : Time? = nil
        )
        end
      end

      # A launch path object.
      struct LaunchPath
        include JSON::Serializable

        # The identifier of the launch path.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the launch path.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Summary information about a product path for a user.
      struct LaunchPathSummary
        include JSON::Serializable

        # The constraints on the portfolio-product relationship.
        @[JSON::Field(key: "ConstraintSummaries")]
        getter constraint_summaries : Array(Types::ConstraintSummary)?

        # The identifier of the product path.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the portfolio that contains the product.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The tags associated with this product path.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @constraint_summaries : Array(Types::ConstraintSummary)? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The current limits of the service would have been exceeded by this operation. Decrease your resource
      # use or increase your service limits and retry the operation.
      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      struct ListAcceptedPortfolioSharesInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        # The type of shared portfolios to list. The default is to list imported portfolios. AWS_ORGANIZATIONS
        # - List portfolios accepted and shared via organizational sharing by the management account or
        # delegated administrator of your organization. AWS_SERVICECATALOG - Deprecated type. IMPORTED - List
        # imported portfolios that have been accepted and shared through account-to-account sharing.
        @[JSON::Field(key: "PortfolioShareType")]
        getter portfolio_share_type : String?

        def initialize(
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil,
          @portfolio_share_type : String? = nil
        )
        end
      end

      struct ListAcceptedPortfolioSharesOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Information about the portfolios.
        @[JSON::Field(key: "PortfolioDetails")]
        getter portfolio_details : Array(Types::PortfolioDetail)?

        def initialize(
          @next_page_token : String? = nil,
          @portfolio_details : Array(Types::PortfolioDetail)? = nil
        )
        end
      end

      struct ListBudgetsForResourceInput
        include JSON::Serializable

        # The resource identifier.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @resource_id : String,
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ListBudgetsForResourceOutput
        include JSON::Serializable

        # Information about the associated budgets.
        @[JSON::Field(key: "Budgets")]
        getter budgets : Array(Types::BudgetDetail)?

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @budgets : Array(Types::BudgetDetail)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct ListConstraintsForPortfolioInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        def initialize(
          @portfolio_id : String,
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil,
          @product_id : String? = nil
        )
        end
      end

      struct ListConstraintsForPortfolioOutput
        include JSON::Serializable

        # Information about the constraints.
        @[JSON::Field(key: "ConstraintDetails")]
        getter constraint_details : Array(Types::ConstraintDetail)?

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @constraint_details : Array(Types::ConstraintDetail)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct ListLaunchPathsInput
        include JSON::Serializable

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @product_id : String,
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ListLaunchPathsOutput
        include JSON::Serializable

        # Information about the launch path.
        @[JSON::Field(key: "LaunchPathSummaries")]
        getter launch_path_summaries : Array(Types::LaunchPathSummary)?

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @launch_path_summaries : Array(Types::LaunchPathSummary)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct ListOrganizationPortfolioAccessInput
        include JSON::Serializable

        # The organization node type that will be returned in the output. ORGANIZATION - Organization that has
        # access to the portfolio. ORGANIZATIONAL_UNIT - Organizational unit that has access to the portfolio
        # within your organization. ACCOUNT - Account that has access to the portfolio within your
        # organization.
        @[JSON::Field(key: "OrganizationNodeType")]
        getter organization_node_type : String

        # The portfolio identifier. For example, port-2abcdext3y5fk .
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @organization_node_type : String,
          @portfolio_id : String,
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ListOrganizationPortfolioAccessOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Displays information about the organization nodes.
        @[JSON::Field(key: "OrganizationNodes")]
        getter organization_nodes : Array(Types::OrganizationNode)?

        def initialize(
          @next_page_token : String? = nil,
          @organization_nodes : Array(Types::OrganizationNode)? = nil
        )
        end
      end

      struct ListPortfolioAccessInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The ID of an organization node the portfolio is shared with. All children of this node with an
        # inherited portfolio share will be returned.
        @[JSON::Field(key: "OrganizationParentId")]
        getter organization_parent_id : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @portfolio_id : String,
          @accept_language : String? = nil,
          @organization_parent_id : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ListPortfolioAccessOutput
        include JSON::Serializable

        # Information about the Amazon Web Services accounts with access to the portfolio.
        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @account_ids : Array(String)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct ListPortfoliosForProductInput
        include JSON::Serializable

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @product_id : String,
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ListPortfoliosForProductOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Information about the portfolios.
        @[JSON::Field(key: "PortfolioDetails")]
        getter portfolio_details : Array(Types::PortfolioDetail)?

        def initialize(
          @next_page_token : String? = nil,
          @portfolio_details : Array(Types::PortfolioDetail)? = nil
        )
        end
      end

      struct ListPortfoliosInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ListPortfoliosOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Information about the portfolios.
        @[JSON::Field(key: "PortfolioDetails")]
        getter portfolio_details : Array(Types::PortfolioDetail)?

        def initialize(
          @next_page_token : String? = nil,
          @portfolio_details : Array(Types::PortfolioDetail)? = nil
        )
        end
      end

      struct ListPrincipalsForPortfolioInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @portfolio_id : String,
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ListPrincipalsForPortfolioOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The PrincipalARN s and corresponding PrincipalType s associated with the portfolio.
        @[JSON::Field(key: "Principals")]
        getter principals : Array(Types::Principal)?

        def initialize(
          @next_page_token : String? = nil,
          @principals : Array(Types::Principal)? = nil
        )
        end
      end

      struct ListProvisionedProductPlansInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The access level to use to obtain results. The default is User .
        @[JSON::Field(key: "AccessLevelFilter")]
        getter access_level_filter : Types::AccessLevelFilter?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        # The product identifier.
        @[JSON::Field(key: "ProvisionProductId")]
        getter provision_product_id : String?

        def initialize(
          @accept_language : String? = nil,
          @access_level_filter : Types::AccessLevelFilter? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil,
          @provision_product_id : String? = nil
        )
        end
      end

      struct ListProvisionedProductPlansOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Information about the plans.
        @[JSON::Field(key: "ProvisionedProductPlans")]
        getter provisioned_product_plans : Array(Types::ProvisionedProductPlanSummary)?

        def initialize(
          @next_page_token : String? = nil,
          @provisioned_product_plans : Array(Types::ProvisionedProductPlanSummary)? = nil
        )
        end
      end

      struct ListProvisioningArtifactsForServiceActionInput
        include JSON::Serializable

        # The self-service action identifier. For example, act-fs7abcd89wxyz .
        @[JSON::Field(key: "ServiceActionId")]
        getter service_action_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @service_action_id : String,
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ListProvisioningArtifactsForServiceActionOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # An array of objects with information about product views and provisioning artifacts.
        @[JSON::Field(key: "ProvisioningArtifactViews")]
        getter provisioning_artifact_views : Array(Types::ProvisioningArtifactView)?

        def initialize(
          @next_page_token : String? = nil,
          @provisioning_artifact_views : Array(Types::ProvisioningArtifactView)? = nil
        )
        end
      end

      struct ListProvisioningArtifactsInput
        include JSON::Serializable

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @product_id : String,
          @accept_language : String? = nil
        )
        end
      end

      struct ListProvisioningArtifactsOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Information about the provisioning artifacts.
        @[JSON::Field(key: "ProvisioningArtifactDetails")]
        getter provisioning_artifact_details : Array(Types::ProvisioningArtifactDetail)?

        def initialize(
          @next_page_token : String? = nil,
          @provisioning_artifact_details : Array(Types::ProvisioningArtifactDetail)? = nil
        )
        end
      end

      struct ListRecordHistoryInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The access level to use to obtain results. The default is User .
        @[JSON::Field(key: "AccessLevelFilter")]
        getter access_level_filter : Types::AccessLevelFilter?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        # The search filter to scope the results.
        @[JSON::Field(key: "SearchFilter")]
        getter search_filter : Types::ListRecordHistorySearchFilter?

        def initialize(
          @accept_language : String? = nil,
          @access_level_filter : Types::AccessLevelFilter? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil,
          @search_filter : Types::ListRecordHistorySearchFilter? = nil
        )
        end
      end

      struct ListRecordHistoryOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The records, in reverse chronological order.
        @[JSON::Field(key: "RecordDetails")]
        getter record_details : Array(Types::RecordDetail)?

        def initialize(
          @next_page_token : String? = nil,
          @record_details : Array(Types::RecordDetail)? = nil
        )
        end
      end

      # The search filter to use when listing history records.
      struct ListRecordHistorySearchFilter
        include JSON::Serializable

        # The filter key. product - Filter results based on the specified product identifier.
        # provisionedproduct - Filter results based on the provisioned product identifier.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The filter value.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct ListResourcesForTagOptionInput
        include JSON::Serializable

        # The TagOption identifier.
        @[JSON::Field(key: "TagOptionId")]
        getter tag_option_id : String

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        # The resource type. Portfolio Product
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @tag_option_id : String,
          @page_size : Int32? = nil,
          @page_token : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct ListResourcesForTagOptionOutput
        include JSON::Serializable

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        # Information about the resources.
        @[JSON::Field(key: "ResourceDetails")]
        getter resource_details : Array(Types::ResourceDetail)?

        def initialize(
          @page_token : String? = nil,
          @resource_details : Array(Types::ResourceDetail)? = nil
        )
        end
      end

      struct ListServiceActionsForProvisioningArtifactInput
        include JSON::Serializable

        # The product identifier. For example, prod-abcdzk7xy33qa .
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The identifier of the provisioning artifact. For example, pa-4abcdjnxjj6ne .
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @product_id : String,
          @provisioning_artifact_id : String,
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ListServiceActionsForProvisioningArtifactOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # An object containing information about the self-service actions associated with the provisioning
        # artifact.
        @[JSON::Field(key: "ServiceActionSummaries")]
        getter service_action_summaries : Array(Types::ServiceActionSummary)?

        def initialize(
          @next_page_token : String? = nil,
          @service_action_summaries : Array(Types::ServiceActionSummary)? = nil
        )
        end
      end

      struct ListServiceActionsInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ListServiceActionsOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # An object containing information about the service actions associated with the provisioning
        # artifact.
        @[JSON::Field(key: "ServiceActionSummaries")]
        getter service_action_summaries : Array(Types::ServiceActionSummary)?

        def initialize(
          @next_page_token : String? = nil,
          @service_action_summaries : Array(Types::ServiceActionSummary)? = nil
        )
        end
      end

      struct ListStackInstancesForProvisionedProductInput
        include JSON::Serializable

        # The identifier of the provisioned product.
        @[JSON::Field(key: "ProvisionedProductId")]
        getter provisioned_product_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @provisioned_product_id : String,
          @accept_language : String? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ListStackInstancesForProvisionedProductOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # List of stack instances.
        @[JSON::Field(key: "StackInstances")]
        getter stack_instances : Array(Types::StackInstance)?

        def initialize(
          @next_page_token : String? = nil,
          @stack_instances : Array(Types::StackInstance)? = nil
        )
        end
      end

      # Filters to use when listing TagOptions.
      struct ListTagOptionsFilters
        include JSON::Serializable

        # The active state.
        @[JSON::Field(key: "Active")]
        getter active : Bool?

        # The TagOption key.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The TagOption value.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @active : Bool? = nil,
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct ListTagOptionsInput
        include JSON::Serializable

        # The search filters. If no search filters are specified, the output includes all TagOptions.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListTagOptionsFilters?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @filters : Types::ListTagOptionsFilters? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ListTagOptionsOutput
        include JSON::Serializable

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        # Information about the TagOptions.
        @[JSON::Field(key: "TagOptionDetails")]
        getter tag_option_details : Array(Types::TagOptionDetail)?

        def initialize(
          @page_token : String? = nil,
          @tag_option_details : Array(Types::TagOptionDetail)? = nil
        )
        end
      end

      struct NotifyProvisionProductEngineWorkflowResultInput
        include JSON::Serializable

        # The idempotency token that identifies the provisioning engine execution.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The identifier of the record.
        @[JSON::Field(key: "RecordId")]
        getter record_id : String

        # The status of the provisioning engine execution.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The encrypted contents of the provisioning engine execution payload that Service Catalog sends after
        # the Terraform product provisioning workflow starts.
        @[JSON::Field(key: "WorkflowToken")]
        getter workflow_token : String

        # The reason why the provisioning engine execution failed.
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The output of the provisioning engine execution.
        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::RecordOutput)?

        # The ID for the provisioned product resources that are part of a resource group.
        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : Types::EngineWorkflowResourceIdentifier?

        def initialize(
          @idempotency_token : String,
          @record_id : String,
          @status : String,
          @workflow_token : String,
          @failure_reason : String? = nil,
          @outputs : Array(Types::RecordOutput)? = nil,
          @resource_identifier : Types::EngineWorkflowResourceIdentifier? = nil
        )
        end
      end

      struct NotifyProvisionProductEngineWorkflowResultOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct NotifyTerminateProvisionedProductEngineWorkflowResultInput
        include JSON::Serializable

        # The idempotency token that identifies the terminate engine execution.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The identifier of the record.
        @[JSON::Field(key: "RecordId")]
        getter record_id : String

        # The status of the terminate engine execution.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The encrypted contents of the terminate engine execution payload that Service Catalog sends after
        # the Terraform product terminate workflow starts.
        @[JSON::Field(key: "WorkflowToken")]
        getter workflow_token : String

        # The reason why the terminate engine execution failed.
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        def initialize(
          @idempotency_token : String,
          @record_id : String,
          @status : String,
          @workflow_token : String,
          @failure_reason : String? = nil
        )
        end
      end

      struct NotifyTerminateProvisionedProductEngineWorkflowResultOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct NotifyUpdateProvisionedProductEngineWorkflowResultInput
        include JSON::Serializable

        # The idempotency token that identifies the update engine execution.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The identifier of the record.
        @[JSON::Field(key: "RecordId")]
        getter record_id : String

        # The status of the update engine execution.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The encrypted contents of the update engine execution payload that Service Catalog sends after the
        # Terraform product update workflow starts.
        @[JSON::Field(key: "WorkflowToken")]
        getter workflow_token : String

        # The reason why the update engine execution failed.
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The output of the update engine execution.
        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::RecordOutput)?

        def initialize(
          @idempotency_token : String,
          @record_id : String,
          @status : String,
          @workflow_token : String,
          @failure_reason : String? = nil,
          @outputs : Array(Types::RecordOutput)? = nil
        )
        end
      end

      struct NotifyUpdateProvisionedProductEngineWorkflowResultOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The operation is not supported.
      struct OperationNotSupportedException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the organization node.
      struct OrganizationNode
        include JSON::Serializable

        # The organization node type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The identifier of the organization node.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The constraints that the administrator has put on the parameter.
      struct ParameterConstraints
        include JSON::Serializable

        # A regular expression that represents the patterns that allow for String types. The pattern must
        # match the entire parameter value provided.
        @[JSON::Field(key: "AllowedPattern")]
        getter allowed_pattern : String?

        # The values that the administrator has allowed for the parameter.
        @[JSON::Field(key: "AllowedValues")]
        getter allowed_values : Array(String)?

        # A string that explains a constraint when the constraint is violated. For example, without a
        # constraint description, a parameter that has an allowed pattern of [A-Za-z0-9]+ displays the
        # following error message when the user specifies an invalid value: Malformed input-Parameter
        # MyParameter must match pattern [A-Za-z0-9]+ By adding a constraint description, such as must only
        # contain letters (uppercase and lowercase) and numbers, you can display the following customized
        # error message: Malformed input-Parameter MyParameter must only contain uppercase and lowercase
        # letters and numbers.
        @[JSON::Field(key: "ConstraintDescription")]
        getter constraint_description : String?

        # An integer value that determines the largest number of characters you want to allow for String
        # types.
        @[JSON::Field(key: "MaxLength")]
        getter max_length : String?

        # A numeric value that determines the largest numeric value you want to allow for Number types.
        @[JSON::Field(key: "MaxValue")]
        getter max_value : String?

        # An integer value that determines the smallest number of characters you want to allow for String
        # types.
        @[JSON::Field(key: "MinLength")]
        getter min_length : String?

        # A numeric value that determines the smallest numeric value you want to allow for Number types.
        @[JSON::Field(key: "MinValue")]
        getter min_value : String?

        def initialize(
          @allowed_pattern : String? = nil,
          @allowed_values : Array(String)? = nil,
          @constraint_description : String? = nil,
          @max_length : String? = nil,
          @max_value : String? = nil,
          @min_length : String? = nil,
          @min_value : String? = nil
        )
        end
      end

      # Information about a portfolio.
      struct PortfolioDetail
        include JSON::Serializable

        # The ARN assigned to the portfolio.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The UTC time stamp of the creation time.
        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description of the portfolio.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name to use for display purposes.
        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The portfolio identifier.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the portfolio provider.
        @[JSON::Field(key: "ProviderName")]
        getter provider_name : String?

        def initialize(
          @arn : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @id : String? = nil,
          @provider_name : String? = nil
        )
        end
      end

      # Information about the portfolio share.
      struct PortfolioShareDetail
        include JSON::Serializable

        # Indicates whether the shared portfolio is imported by the recipient account. If the recipient is in
        # an organization node, the share is automatically imported, and the field is always set to true.
        @[JSON::Field(key: "Accepted")]
        getter accepted : Bool?

        # The identifier of the recipient entity that received the portfolio share. The recipient entity can
        # be one of the following: 1. An external account. 2. An organziation member account. 3. An
        # organzational unit (OU). 4. The organization itself. (This shares with every account in the
        # organization).
        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String?

        # Indicates if Principal sharing is enabled or disabled for the portfolio share.
        @[JSON::Field(key: "SharePrincipals")]
        getter share_principals : Bool?

        # Indicates whether TagOptions sharing is enabled or disabled for the portfolio share.
        @[JSON::Field(key: "ShareTagOptions")]
        getter share_tag_options : Bool?

        # The type of the portfolio share.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @accepted : Bool? = nil,
          @principal_id : String? = nil,
          @share_principals : Bool? = nil,
          @share_tag_options : Bool? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about a principal.
      struct Principal
        include JSON::Serializable

        # The ARN of the principal (user, role, or group). This field allows for an ARN with no accountID ,
        # with or without wildcard characters if the PrincipalType is an IAM_PATTERN . For more information,
        # review associate-principal-with-portfolio in the Amazon Web Services CLI Command Reference.
        @[JSON::Field(key: "PrincipalARN")]
        getter principal_arn : String?

        # The principal type. The supported value is IAM if you use a fully defined ARN, or IAM_PATTERN if you
        # use an ARN with no accountID , with or without wildcard characters.
        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String?

        def initialize(
          @principal_arn : String? = nil,
          @principal_type : String? = nil
        )
        end
      end

      # A single product view aggregation value/count pair, containing metadata about each product to which
      # the calling user has access.
      struct ProductViewAggregationValue
        include JSON::Serializable

        # An approximate count of the products that match the value.
        @[JSON::Field(key: "ApproximateCount")]
        getter approximate_count : Int32?

        # The value of the product view aggregation.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @approximate_count : Int32? = nil,
          @value : String? = nil
        )
        end
      end

      # Information about a product view.
      struct ProductViewDetail
        include JSON::Serializable

        # The UTC time stamp of the creation time.
        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The ARN of the product.
        @[JSON::Field(key: "ProductARN")]
        getter product_arn : String?

        # Summary information about the product view.
        @[JSON::Field(key: "ProductViewSummary")]
        getter product_view_summary : Types::ProductViewSummary?

        # A top level ProductViewDetail response containing details about the product’s connection. Service
        # Catalog returns this field for the CreateProduct , UpdateProduct , DescribeProductAsAdmin , and
        # SearchProductAsAdmin APIs. This response contains the same fields as the ConnectionParameters
        # request, with the addition of the LastSync response.
        @[JSON::Field(key: "SourceConnection")]
        getter source_connection : Types::SourceConnectionDetail?

        # The status of the product. AVAILABLE - The product is ready for use. CREATING - Product creation has
        # started; the product is not ready for use. FAILED - An action failed.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_time : Time? = nil,
          @product_arn : String? = nil,
          @product_view_summary : Types::ProductViewSummary? = nil,
          @source_connection : Types::SourceConnectionDetail? = nil,
          @status : String? = nil
        )
        end
      end

      # Summary information about a product view.
      struct ProductViewSummary
        include JSON::Serializable

        # The distributor of the product. Contact the product administrator for the significance of this
        # value.
        @[JSON::Field(key: "Distributor")]
        getter distributor : String?

        # Indicates whether the product has a default path. If the product does not have a default path, call
        # ListLaunchPaths to disambiguate between paths. Otherwise, ListLaunchPaths is not required, and the
        # output of ProductViewSummary can be used directly with DescribeProvisioningParameters .
        @[JSON::Field(key: "HasDefaultPath")]
        getter has_default_path : Bool?

        # The product view identifier.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the product.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The owner of the product. Contact the product administrator for the significance of this value.
        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # Short description of the product.
        @[JSON::Field(key: "ShortDescription")]
        getter short_description : String?

        # The description of the support for this Product.
        @[JSON::Field(key: "SupportDescription")]
        getter support_description : String?

        # The email contact information to obtain support for this Product.
        @[JSON::Field(key: "SupportEmail")]
        getter support_email : String?

        # The URL information to obtain support for this Product.
        @[JSON::Field(key: "SupportUrl")]
        getter support_url : String?

        # The product type. Contact the product administrator for the significance of this value. If this
        # value is MARKETPLACE , the product was created by Amazon Web Services Marketplace.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @distributor : String? = nil,
          @has_default_path : Bool? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @product_id : String? = nil,
          @short_description : String? = nil,
          @support_description : String? = nil,
          @support_email : String? = nil,
          @support_url : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ProvisionProductInput
        include JSON::Serializable

        # An idempotency token that uniquely identifies the provisioning request.
        @[JSON::Field(key: "ProvisionToken")]
        getter provision_token : String

        # A user-friendly name for the provisioned product. This value must be unique for the Amazon Web
        # Services account and cannot be updated after the product is provisioned.
        @[JSON::Field(key: "ProvisionedProductName")]
        getter provisioned_product_name : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # Passed to CloudFormation. The SNS topic ARNs to which to publish stack-related events.
        @[JSON::Field(key: "NotificationArns")]
        getter notification_arns : Array(String)?

        # The path identifier of the product. This value is optional if the product has a default path, and
        # required if the product has more than one path. To list the paths for a product, use ListLaunchPaths
        # . You must provide the name or ID, but not both.
        @[JSON::Field(key: "PathId")]
        getter path_id : String?

        # The name of the path. You must provide the name or ID, but not both.
        @[JSON::Field(key: "PathName")]
        getter path_name : String?

        # The product identifier. You must provide the name or ID, but not both.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # The name of the product. You must provide the name or ID, but not both.
        @[JSON::Field(key: "ProductName")]
        getter product_name : String?

        # The identifier of the provisioning artifact. You must provide the name or ID, but not both.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String?

        # The name of the provisioning artifact. You must provide the name or ID, but not both.
        @[JSON::Field(key: "ProvisioningArtifactName")]
        getter provisioning_artifact_name : String?

        # Parameters specified by the administrator that are required for provisioning the product.
        @[JSON::Field(key: "ProvisioningParameters")]
        getter provisioning_parameters : Array(Types::ProvisioningParameter)?

        # An object that contains information about the provisioning preferences for a stack set.
        @[JSON::Field(key: "ProvisioningPreferences")]
        getter provisioning_preferences : Types::ProvisioningPreferences?

        # One or more tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @provision_token : String,
          @provisioned_product_name : String,
          @accept_language : String? = nil,
          @notification_arns : Array(String)? = nil,
          @path_id : String? = nil,
          @path_name : String? = nil,
          @product_id : String? = nil,
          @product_name : String? = nil,
          @provisioning_artifact_id : String? = nil,
          @provisioning_artifact_name : String? = nil,
          @provisioning_parameters : Array(Types::ProvisioningParameter)? = nil,
          @provisioning_preferences : Types::ProvisioningPreferences? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ProvisionProductOutput
        include JSON::Serializable

        # Information about the result of provisioning the product.
        @[JSON::Field(key: "RecordDetail")]
        getter record_detail : Types::RecordDetail?

        def initialize(
          @record_detail : Types::RecordDetail? = nil
        )
        end
      end

      # Information about a provisioned product.
      struct ProvisionedProductAttribute
        include JSON::Serializable

        # The ARN of the provisioned product.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The UTC time stamp of the creation time.
        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The identifier of the provisioned product.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the
        # idempotency token, the same response is returned for each repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # The record identifier of the last request performed on this provisioned product of the following
        # types: ProvisionProduct UpdateProvisionedProduct ExecuteProvisionedProductPlan
        # TerminateProvisionedProduct
        @[JSON::Field(key: "LastProvisioningRecordId")]
        getter last_provisioning_record_id : String?

        # The record identifier of the last request performed on this provisioned product.
        @[JSON::Field(key: "LastRecordId")]
        getter last_record_id : String?

        # The record identifier of the last successful request performed on this provisioned product of the
        # following types: ProvisionProduct UpdateProvisionedProduct ExecuteProvisionedProductPlan
        # TerminateProvisionedProduct
        @[JSON::Field(key: "LastSuccessfulProvisioningRecordId")]
        getter last_successful_provisioning_record_id : String?

        # The user-friendly name of the provisioned product.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The assigned identifier for the resource, such as an EC2 instance ID or an S3 bucket name.
        @[JSON::Field(key: "PhysicalId")]
        getter physical_id : String?

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # The name of the product.
        @[JSON::Field(key: "ProductName")]
        getter product_name : String?

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String?

        # The name of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactName")]
        getter provisioning_artifact_name : String?

        # The current status of the provisioned product. AVAILABLE - Stable state, ready to perform any
        # operation. The most recent operation succeeded and completed. UNDER_CHANGE - Transitive state.
        # Operations performed might not have valid results. Wait for an AVAILABLE status before performing
        # operations. TAINTED - Stable state, ready to perform any operation. The stack has completed the
        # requested operation but is not exactly what was requested. For example, a request to update to a new
        # version failed and the stack rolled back to the current version. ERROR - An unexpected error
        # occurred. The provisioned product exists but the stack is not running. For example, CloudFormation
        # received a parameter value that was not valid and could not launch the stack. PLAN_IN_PROGRESS -
        # Transitive state. The plan operations were performed to provision a new product, but resources have
        # not yet been created. After reviewing the list of resources to be created, execute the plan. Wait
        # for an AVAILABLE status before performing operations.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The current status message of the provisioned product.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # One or more tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The type of provisioned product. The supported values are CFN_STACK , CFN_STACKSET ,
        # TERRAFORM_OPEN_SOURCE , TERRAFORM_CLOUD , and EXTERNAL .
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The Amazon Resource Name (ARN) of the user.
        @[JSON::Field(key: "UserArn")]
        getter user_arn : String?

        # The ARN of the user in the session. This ARN might contain a session ID.
        @[JSON::Field(key: "UserArnSession")]
        getter user_arn_session : String?

        def initialize(
          @arn : String? = nil,
          @created_time : Time? = nil,
          @id : String? = nil,
          @idempotency_token : String? = nil,
          @last_provisioning_record_id : String? = nil,
          @last_record_id : String? = nil,
          @last_successful_provisioning_record_id : String? = nil,
          @name : String? = nil,
          @physical_id : String? = nil,
          @product_id : String? = nil,
          @product_name : String? = nil,
          @provisioning_artifact_id : String? = nil,
          @provisioning_artifact_name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil,
          @user_arn : String? = nil,
          @user_arn_session : String? = nil
        )
        end
      end

      # Information about a provisioned product.
      struct ProvisionedProductDetail
        include JSON::Serializable

        # The ARN of the provisioned product.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The UTC time stamp of the creation time.
        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The identifier of the provisioned product.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the
        # idempotency token, the same response is returned for each repeated request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # The record identifier of the last request performed on this provisioned product of the following
        # types: ProvisionProduct UpdateProvisionedProduct ExecuteProvisionedProductPlan
        # TerminateProvisionedProduct
        @[JSON::Field(key: "LastProvisioningRecordId")]
        getter last_provisioning_record_id : String?

        # The record identifier of the last request performed on this provisioned product.
        @[JSON::Field(key: "LastRecordId")]
        getter last_record_id : String?

        # The record identifier of the last successful request performed on this provisioned product of the
        # following types: ProvisionProduct UpdateProvisionedProduct ExecuteProvisionedProductPlan
        # TerminateProvisionedProduct
        @[JSON::Field(key: "LastSuccessfulProvisioningRecordId")]
        getter last_successful_provisioning_record_id : String?

        # The ARN of the launch role associated with the provisioned product.
        @[JSON::Field(key: "LaunchRoleArn")]
        getter launch_role_arn : String?

        # The user-friendly name of the provisioned product.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The product identifier. For example, prod-abcdzk7xy33qa .
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # The identifier of the provisioning artifact. For example, pa-4abcdjnxjj6ne .
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String?

        # The current status of the provisioned product. AVAILABLE - Stable state, ready to perform any
        # operation. The most recent operation succeeded and completed. UNDER_CHANGE - Transitive state.
        # Operations performed might not have valid results. Wait for an AVAILABLE status before performing
        # operations. TAINTED - Stable state, ready to perform any operation. The stack has completed the
        # requested operation but is not exactly what was requested. For example, a request to update to a new
        # version failed and the stack rolled back to the current version. ERROR - An unexpected error
        # occurred. The provisioned product exists but the stack is not running. For example, CloudFormation
        # received a parameter value that was not valid and could not launch the stack. PLAN_IN_PROGRESS -
        # Transitive state. The plan operations were performed to provision a new product, but resources have
        # not yet been created. After reviewing the list of resources to be created, execute the plan. Wait
        # for an AVAILABLE status before performing operations.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The current status message of the provisioned product.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The type of provisioned product. The supported values are CFN_STACK , CFN_STACKSET ,
        # TERRAFORM_OPEN_SOURCE , TERRAFORM_CLOUD , and EXTERNAL .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @created_time : Time? = nil,
          @id : String? = nil,
          @idempotency_token : String? = nil,
          @last_provisioning_record_id : String? = nil,
          @last_record_id : String? = nil,
          @last_successful_provisioning_record_id : String? = nil,
          @launch_role_arn : String? = nil,
          @name : String? = nil,
          @product_id : String? = nil,
          @provisioning_artifact_id : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about a plan.
      struct ProvisionedProductPlanDetails
        include JSON::Serializable

        # The UTC time stamp of the creation time.
        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # Passed to CloudFormation. The SNS topic ARNs to which to publish stack-related events.
        @[JSON::Field(key: "NotificationArns")]
        getter notification_arns : Array(String)?

        # The path identifier of the product. This value is optional if the product has a default path, and
        # required if the product has more than one path. To list the paths for a product, use ListLaunchPaths
        # .
        @[JSON::Field(key: "PathId")]
        getter path_id : String?

        # The plan identifier.
        @[JSON::Field(key: "PlanId")]
        getter plan_id : String?

        # The name of the plan.
        @[JSON::Field(key: "PlanName")]
        getter plan_name : String?

        # The plan type.
        @[JSON::Field(key: "PlanType")]
        getter plan_type : String?

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # The product identifier.
        @[JSON::Field(key: "ProvisionProductId")]
        getter provision_product_id : String?

        # The user-friendly name of the provisioned product.
        @[JSON::Field(key: "ProvisionProductName")]
        getter provision_product_name : String?

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String?

        # Parameters specified by the administrator that are required for provisioning the product.
        @[JSON::Field(key: "ProvisioningParameters")]
        getter provisioning_parameters : Array(Types::UpdateProvisioningParameter)?

        # The status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # One or more tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The UTC time stamp when the plan was last updated.
        @[JSON::Field(key: "UpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_time : Time?

        def initialize(
          @created_time : Time? = nil,
          @notification_arns : Array(String)? = nil,
          @path_id : String? = nil,
          @plan_id : String? = nil,
          @plan_name : String? = nil,
          @plan_type : String? = nil,
          @product_id : String? = nil,
          @provision_product_id : String? = nil,
          @provision_product_name : String? = nil,
          @provisioning_artifact_id : String? = nil,
          @provisioning_parameters : Array(Types::UpdateProvisioningParameter)? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @updated_time : Time? = nil
        )
        end
      end

      # Summary information about a plan.
      struct ProvisionedProductPlanSummary
        include JSON::Serializable

        # The plan identifier.
        @[JSON::Field(key: "PlanId")]
        getter plan_id : String?

        # The name of the plan.
        @[JSON::Field(key: "PlanName")]
        getter plan_name : String?

        # The plan type.
        @[JSON::Field(key: "PlanType")]
        getter plan_type : String?

        # The product identifier.
        @[JSON::Field(key: "ProvisionProductId")]
        getter provision_product_id : String?

        # The user-friendly name of the provisioned product.
        @[JSON::Field(key: "ProvisionProductName")]
        getter provision_product_name : String?

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String?

        def initialize(
          @plan_id : String? = nil,
          @plan_name : String? = nil,
          @plan_type : String? = nil,
          @provision_product_id : String? = nil,
          @provision_product_name : String? = nil,
          @provisioning_artifact_id : String? = nil
        )
        end
      end

      # Information about a provisioning artifact. A provisioning artifact is also known as a product
      # version.
      struct ProvisioningArtifact
        include JSON::Serializable

        # The UTC time stamp of the creation time.
        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description of the provisioning artifact.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information set by the administrator to provide guidance to end users about which provisioning
        # artifacts to use.
        @[JSON::Field(key: "Guidance")]
        getter guidance : String?

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the provisioning artifact.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @created_time : Time? = nil,
          @description : String? = nil,
          @guidance : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Information about a provisioning artifact (also known as a version) for a product.
      struct ProvisioningArtifactDetail
        include JSON::Serializable

        # Indicates whether the product version is active.
        @[JSON::Field(key: "Active")]
        getter active : Bool?

        # The UTC time stamp of the creation time.
        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description of the provisioning artifact.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information set by the administrator to provide guidance to end users about which provisioning
        # artifacts to use.
        @[JSON::Field(key: "Guidance")]
        getter guidance : String?

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the provisioning artifact.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies the revision of the external artifact that was used to automatically sync the Service
        # Catalog product and create the provisioning artifact. Service Catalog includes this response
        # parameter as a high level field to the existing ProvisioningArtifactDetail type, which is returned
        # as part of the response for CreateProduct , UpdateProduct , DescribeProductAsAdmin ,
        # DescribeProvisioningArtifact , ListProvisioningArtifact , and UpdateProvisioningArticat APIs. This
        # field only exists for Repo-Synced products.
        @[JSON::Field(key: "SourceRevision")]
        getter source_revision : String?

        # The type of provisioning artifact. CLOUD_FORMATION_TEMPLATE - CloudFormation template
        # TERRAFORM_OPEN_SOURCE - Terraform Open Source configuration file TERRAFORM_CLOUD - Terraform Cloud
        # configuration file EXTERNAL - External configuration file
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @active : Bool? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @guidance : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @source_revision : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Provisioning artifact output.
      struct ProvisioningArtifactOutput
        include JSON::Serializable

        # Description of the provisioning artifact output key.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The provisioning artifact output key.
        @[JSON::Field(key: "Key")]
        getter key : String?

        def initialize(
          @description : String? = nil,
          @key : String? = nil
        )
        end
      end

      # Information about a parameter used to provision a product.
      struct ProvisioningArtifactParameter
        include JSON::Serializable

        # The default value.
        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # The description of the parameter.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # If this value is true, the value for this parameter is obfuscated from view when the parameter is
        # retrieved. This parameter is used to hide sensitive information.
        @[JSON::Field(key: "IsNoEcho")]
        getter is_no_echo : Bool?

        # Constraints that the administrator has put on a parameter.
        @[JSON::Field(key: "ParameterConstraints")]
        getter parameter_constraints : Types::ParameterConstraints?

        # The parameter key.
        @[JSON::Field(key: "ParameterKey")]
        getter parameter_key : String?

        # The parameter type.
        @[JSON::Field(key: "ParameterType")]
        getter parameter_type : String?

        def initialize(
          @default_value : String? = nil,
          @description : String? = nil,
          @is_no_echo : Bool? = nil,
          @parameter_constraints : Types::ParameterConstraints? = nil,
          @parameter_key : String? = nil,
          @parameter_type : String? = nil
        )
        end
      end

      # The user-defined preferences that will be applied during product provisioning, unless overridden by
      # ProvisioningPreferences or UpdateProvisioningPreferences . For more information on maximum
      # concurrent accounts and failure tolerance, see Stack set operation options in the CloudFormation
      # User Guide .
      struct ProvisioningArtifactPreferences
        include JSON::Serializable

        # One or more Amazon Web Services accounts where stack instances are deployed from the stack set.
        # These accounts can be scoped in ProvisioningPreferences$StackSetAccounts and
        # UpdateProvisioningPreferences$StackSetAccounts . Applicable only to a CFN_STACKSET provisioned
        # product type.
        @[JSON::Field(key: "StackSetAccounts")]
        getter stack_set_accounts : Array(String)?

        # One or more Amazon Web Services Regions where stack instances are deployed from the stack set. These
        # Regions can be scoped in ProvisioningPreferences$StackSetRegions and
        # UpdateProvisioningPreferences$StackSetRegions . Applicable only to a CFN_STACKSET provisioned
        # product type.
        @[JSON::Field(key: "StackSetRegions")]
        getter stack_set_regions : Array(String)?

        def initialize(
          @stack_set_accounts : Array(String)? = nil,
          @stack_set_regions : Array(String)? = nil
        )
        end
      end

      # Information about a provisioning artifact (also known as a version) for a product.
      struct ProvisioningArtifactProperties
        include JSON::Serializable

        # The description of the provisioning artifact, including how it differs from the previous
        # provisioning artifact.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # If set to true, Service Catalog stops validating the specified provisioning artifact even if it is
        # invalid. Service Catalog does not support template validation for the TERRAFORM_OS product type.
        @[JSON::Field(key: "DisableTemplateValidation")]
        getter disable_template_validation : Bool?

        # Specify the template source with one of the following options, but not both. Keys accepted: [
        # LoadTemplateFromURL , ImportFromPhysicalId ] The URL of the CloudFormation template in Amazon S3 or
        # GitHub in JSON format. Specify the URL in JSON format as follows: "LoadTemplateFromURL":
        # "https://s3.amazonaws.com/cf-templates-ozkq9d3hgiq2-us-east-1/..." ImportFromPhysicalId : The
        # physical id of the resource that contains the template. Currently only supports CloudFormation stack
        # arn. Specify the physical id in JSON format as follows: ImportFromPhysicalId:
        # “arn:aws:cloudformation:[us-east-1]:[accountId]:stack/[StackName]/[resourceId]
        @[JSON::Field(key: "Info")]
        getter info : Hash(String, String)?

        # The name of the provisioning artifact (for example, v1 v2beta). No spaces are allowed.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of provisioning artifact. CLOUD_FORMATION_TEMPLATE - CloudFormation template
        # TERRAFORM_OPEN_SOURCE - Terraform Open Source configuration file TERRAFORM_CLOUD - Terraform Cloud
        # configuration file EXTERNAL - External configuration file
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @description : String? = nil,
          @disable_template_validation : Bool? = nil,
          @info : Hash(String, String)? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Summary information about a provisioning artifact (also known as a version) for a product.
      struct ProvisioningArtifactSummary
        include JSON::Serializable

        # The UTC time stamp of the creation time.
        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description of the provisioning artifact.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the provisioning artifact.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The metadata for the provisioning artifact. This is used with Amazon Web Services Marketplace
        # products.
        @[JSON::Field(key: "ProvisioningArtifactMetadata")]
        getter provisioning_artifact_metadata : Hash(String, String)?

        def initialize(
          @created_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @provisioning_artifact_metadata : Hash(String, String)? = nil
        )
        end
      end

      # An object that contains summary information about a product view and a provisioning artifact.
      struct ProvisioningArtifactView
        include JSON::Serializable

        # Summary information about a product view.
        @[JSON::Field(key: "ProductViewSummary")]
        getter product_view_summary : Types::ProductViewSummary?

        # Information about a provisioning artifact. A provisioning artifact is also known as a product
        # version.
        @[JSON::Field(key: "ProvisioningArtifact")]
        getter provisioning_artifact : Types::ProvisioningArtifact?

        def initialize(
          @product_view_summary : Types::ProductViewSummary? = nil,
          @provisioning_artifact : Types::ProvisioningArtifact? = nil
        )
        end
      end

      # Information about a parameter used to provision a product.
      struct ProvisioningParameter
        include JSON::Serializable

        # The parameter key.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The parameter value.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The user-defined preferences that will be applied when updating a provisioned product. Not all
      # preferences are applicable to all provisioned product type One or more Amazon Web Services accounts
      # that will have access to the provisioned product. Applicable only to a CFN_STACKSET provisioned
      # product type. The Amazon Web Services accounts specified should be within the list of accounts in
      # the STACKSET constraint. To get the list of accounts in the STACKSET constraint, use the
      # DescribeProvisioningParameters operation. If no values are specified, the default value is all
      # accounts from the STACKSET constraint.
      struct ProvisioningPreferences
        include JSON::Serializable

        # One or more Amazon Web Services accounts where the provisioned product will be available. Applicable
        # only to a CFN_STACKSET provisioned product type. The specified accounts should be within the list of
        # accounts from the STACKSET constraint. To get the list of accounts in the STACKSET constraint, use
        # the DescribeProvisioningParameters operation. If no values are specified, the default value is all
        # acounts from the STACKSET constraint.
        @[JSON::Field(key: "StackSetAccounts")]
        getter stack_set_accounts : Array(String)?

        # The number of accounts, per Region, for which this operation can fail before Service Catalog stops
        # the operation in that Region. If the operation is stopped in a Region, Service Catalog doesn't
        # attempt the operation in any subsequent Regions. Applicable only to a CFN_STACKSET provisioned
        # product type. Conditional: You must specify either StackSetFailureToleranceCount or
        # StackSetFailureTolerancePercentage , but not both. The default value is 0 if no value is specified.
        @[JSON::Field(key: "StackSetFailureToleranceCount")]
        getter stack_set_failure_tolerance_count : Int32?

        # The percentage of accounts, per Region, for which this stack operation can fail before Service
        # Catalog stops the operation in that Region. If the operation is stopped in a Region, Service Catalog
        # doesn't attempt the operation in any subsequent Regions. When calculating the number of accounts
        # based on the specified percentage, Service Catalog rounds down to the next whole number. Applicable
        # only to a CFN_STACKSET provisioned product type. Conditional: You must specify either
        # StackSetFailureToleranceCount or StackSetFailureTolerancePercentage , but not both.
        @[JSON::Field(key: "StackSetFailureTolerancePercentage")]
        getter stack_set_failure_tolerance_percentage : Int32?

        # The maximum number of accounts in which to perform this operation at one time. This is dependent on
        # the value of StackSetFailureToleranceCount . StackSetMaxConcurrentCount is at most one more than the
        # StackSetFailureToleranceCount . Note that this setting lets you specify the maximum for operations.
        # For large deployments, under certain circumstances the actual number of accounts acted upon
        # concurrently may be lower due to service throttling. Applicable only to a CFN_STACKSET provisioned
        # product type. Conditional: You must specify either StackSetMaxConcurrentCount or
        # StackSetMaxConcurrentPercentage , but not both.
        @[JSON::Field(key: "StackSetMaxConcurrencyCount")]
        getter stack_set_max_concurrency_count : Int32?

        # The maximum percentage of accounts in which to perform this operation at one time. When calculating
        # the number of accounts based on the specified percentage, Service Catalog rounds down to the next
        # whole number. This is true except in cases where rounding down would result is zero. In this case,
        # Service Catalog sets the number as 1 instead. Note that this setting lets you specify the maximum
        # for operations. For large deployments, under certain circumstances the actual number of accounts
        # acted upon concurrently may be lower due to service throttling. Applicable only to a CFN_STACKSET
        # provisioned product type. Conditional: You must specify either StackSetMaxConcurrentCount or
        # StackSetMaxConcurrentPercentage , but not both.
        @[JSON::Field(key: "StackSetMaxConcurrencyPercentage")]
        getter stack_set_max_concurrency_percentage : Int32?

        # One or more Amazon Web Services Regions where the provisioned product will be available. Applicable
        # only to a CFN_STACKSET provisioned product type. The specified Regions should be within the list of
        # Regions from the STACKSET constraint. To get the list of Regions in the STACKSET constraint, use the
        # DescribeProvisioningParameters operation. If no values are specified, the default value is all
        # Regions from the STACKSET constraint.
        @[JSON::Field(key: "StackSetRegions")]
        getter stack_set_regions : Array(String)?

        def initialize(
          @stack_set_accounts : Array(String)? = nil,
          @stack_set_failure_tolerance_count : Int32? = nil,
          @stack_set_failure_tolerance_percentage : Int32? = nil,
          @stack_set_max_concurrency_count : Int32? = nil,
          @stack_set_max_concurrency_percentage : Int32? = nil,
          @stack_set_regions : Array(String)? = nil
        )
        end
      end

      # Information about a request operation.
      struct RecordDetail
        include JSON::Serializable

        # The UTC time stamp of the creation time.
        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The ARN of the launch role associated with the provisioned product.
        @[JSON::Field(key: "LaunchRoleArn")]
        getter launch_role_arn : String?

        # The path identifier.
        @[JSON::Field(key: "PathId")]
        getter path_id : String?

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # The identifier of the provisioned product.
        @[JSON::Field(key: "ProvisionedProductId")]
        getter provisioned_product_id : String?

        # The user-friendly name of the provisioned product.
        @[JSON::Field(key: "ProvisionedProductName")]
        getter provisioned_product_name : String?

        # The type of provisioned product. The supported values are CFN_STACK , CFN_STACKSET ,
        # TERRAFORM_OPEN_SOURCE , TERRAFORM_CLOUD , and EXTERNAL .
        @[JSON::Field(key: "ProvisionedProductType")]
        getter provisioned_product_type : String?

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String?

        # The errors that occurred.
        @[JSON::Field(key: "RecordErrors")]
        getter record_errors : Array(Types::RecordError)?

        # The identifier of the record.
        @[JSON::Field(key: "RecordId")]
        getter record_id : String?

        # One or more tags.
        @[JSON::Field(key: "RecordTags")]
        getter record_tags : Array(Types::RecordTag)?

        # The record type. PROVISION_PRODUCT UPDATE_PROVISIONED_PRODUCT TERMINATE_PROVISIONED_PRODUCT
        @[JSON::Field(key: "RecordType")]
        getter record_type : String?

        # The status of the provisioned product. CREATED - The request was created but the operation has not
        # started. IN_PROGRESS - The requested operation is in progress. IN_PROGRESS_IN_ERROR - The
        # provisioned product is under change but the requested operation failed and some remediation is
        # occurring. For example, a rollback. SUCCEEDED - The requested operation has successfully completed.
        # FAILED - The requested operation has unsuccessfully completed. Investigate using the error messages
        # returned.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time when the record was last updated.
        @[JSON::Field(key: "UpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_time : Time?

        def initialize(
          @created_time : Time? = nil,
          @launch_role_arn : String? = nil,
          @path_id : String? = nil,
          @product_id : String? = nil,
          @provisioned_product_id : String? = nil,
          @provisioned_product_name : String? = nil,
          @provisioned_product_type : String? = nil,
          @provisioning_artifact_id : String? = nil,
          @record_errors : Array(Types::RecordError)? = nil,
          @record_id : String? = nil,
          @record_tags : Array(Types::RecordTag)? = nil,
          @record_type : String? = nil,
          @status : String? = nil,
          @updated_time : Time? = nil
        )
        end
      end

      # The error code and description resulting from an operation.
      struct RecordError
        include JSON::Serializable

        # The numeric value of the error.
        @[JSON::Field(key: "Code")]
        getter code : String?

        # The description of the error.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @code : String? = nil,
          @description : String? = nil
        )
        end
      end

      # The output for the product created as the result of a request. For example, the output for a
      # CloudFormation-backed product that creates an S3 bucket would include the S3 bucket URL.
      struct RecordOutput
        include JSON::Serializable

        # The description of the output.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The output key.
        @[JSON::Field(key: "OutputKey")]
        getter output_key : String?

        # The output value.
        @[JSON::Field(key: "OutputValue")]
        getter output_value : String?

        def initialize(
          @description : String? = nil,
          @output_key : String? = nil,
          @output_value : String? = nil
        )
        end
      end

      # Information about a tag, which is a key-value pair.
      struct RecordTag
        include JSON::Serializable

        # The key for this tag.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value for this tag.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct RejectPortfolioShareInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The type of shared portfolios to reject. The default is to reject imported portfolios.
        # AWS_ORGANIZATIONS - Reject portfolios shared by the management account of your organization.
        # IMPORTED - Reject imported portfolios. AWS_SERVICECATALOG - Not supported. (Throws
        # ResourceNotFoundException.) For example, aws servicecatalog reject-portfolio-share --portfolio-id
        # "port-2qwzkwxt3y5fk" --portfolio-share-type AWS_ORGANIZATIONS
        @[JSON::Field(key: "PortfolioShareType")]
        getter portfolio_share_type : String?

        def initialize(
          @portfolio_id : String,
          @accept_language : String? = nil,
          @portfolio_share_type : String? = nil
        )
        end
      end

      struct RejectPortfolioShareOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a resource change that will occur when a plan is executed.
      struct ResourceChange
        include JSON::Serializable

        # The change action.
        @[JSON::Field(key: "Action")]
        getter action : String?

        # Information about the resource changes.
        @[JSON::Field(key: "Details")]
        getter details : Array(Types::ResourceChangeDetail)?

        # The ID of the resource, as defined in the CloudFormation template.
        @[JSON::Field(key: "LogicalResourceId")]
        getter logical_resource_id : String?

        # The ID of the resource, if it was already created.
        @[JSON::Field(key: "PhysicalResourceId")]
        getter physical_resource_id : String?

        # If the change type is Modify , indicates whether the existing resource is deleted and replaced with
        # a new one.
        @[JSON::Field(key: "Replacement")]
        getter replacement : String?

        # The type of resource.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The change scope.
        @[JSON::Field(key: "Scope")]
        getter scope : Array(String)?

        def initialize(
          @action : String? = nil,
          @details : Array(Types::ResourceChangeDetail)? = nil,
          @logical_resource_id : String? = nil,
          @physical_resource_id : String? = nil,
          @replacement : String? = nil,
          @resource_type : String? = nil,
          @scope : Array(String)? = nil
        )
        end
      end

      # Information about a change to a resource attribute.
      struct ResourceChangeDetail
        include JSON::Serializable

        # The ID of the entity that caused the change.
        @[JSON::Field(key: "CausingEntity")]
        getter causing_entity : String?

        # For static evaluations, the value of the resource attribute will change and the new value is known.
        # For dynamic evaluations, the value might change, and any new value will be determined when the plan
        # is updated.
        @[JSON::Field(key: "Evaluation")]
        getter evaluation : String?

        # Information about the resource attribute to be modified.
        @[JSON::Field(key: "Target")]
        getter target : Types::ResourceTargetDefinition?

        def initialize(
          @causing_entity : String? = nil,
          @evaluation : String? = nil,
          @target : Types::ResourceTargetDefinition? = nil
        )
        end
      end

      # Information about a resource.
      struct ResourceDetail
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The creation time of the resource.
        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The description of the resource.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the resource.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the resource.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A resource that is currently in use. Ensure that the resource is not in use and retry the operation.
      struct ResourceInUseException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified resource was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a change to a resource attribute.
      struct ResourceTargetDefinition
        include JSON::Serializable

        # The attribute to be changed.
        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        # If the attribute is Properties , the value is the name of the property. Otherwise, the value is
        # null.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # If the attribute is Properties , indicates whether a change to this property causes the resource to
        # be re-created.
        @[JSON::Field(key: "RequiresRecreation")]
        getter requires_recreation : String?

        def initialize(
          @attribute : String? = nil,
          @name : String? = nil,
          @requires_recreation : String? = nil
        )
        end
      end

      struct ScanProvisionedProductsInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The access level to use to obtain results. The default is User .
        @[JSON::Field(key: "AccessLevelFilter")]
        getter access_level_filter : Types::AccessLevelFilter?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        def initialize(
          @accept_language : String? = nil,
          @access_level_filter : Types::AccessLevelFilter? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct ScanProvisionedProductsOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Information about the provisioned products.
        @[JSON::Field(key: "ProvisionedProducts")]
        getter provisioned_products : Array(Types::ProvisionedProductDetail)?

        def initialize(
          @next_page_token : String? = nil,
          @provisioned_products : Array(Types::ProvisionedProductDetail)? = nil
        )
        end
      end

      struct SearchProductsAsAdminInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The search filters. If no search filters are specified, the output includes all products to which
        # the administrator has access.
        @[JSON::Field(key: "Filters")]
        getter filters : Hash(String, Array(String))?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        # The portfolio identifier.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String?

        # Access level of the source of the product.
        @[JSON::Field(key: "ProductSource")]
        getter product_source : String?

        # The sort field. If no value is specified, the results are not sorted.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # The sort order. If no value is specified, the results are not sorted.
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @accept_language : String? = nil,
          @filters : Hash(String, Array(String))? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil,
          @portfolio_id : String? = nil,
          @product_source : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct SearchProductsAsAdminOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Information about the product views.
        @[JSON::Field(key: "ProductViewDetails")]
        getter product_view_details : Array(Types::ProductViewDetail)?

        def initialize(
          @next_page_token : String? = nil,
          @product_view_details : Array(Types::ProductViewDetail)? = nil
        )
        end
      end

      struct SearchProductsInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The search filters. If no search filters are specified, the output includes all products to which
        # the caller has access.
        @[JSON::Field(key: "Filters")]
        getter filters : Hash(String, Array(String))?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        # The sort field. If no value is specified, the results are not sorted.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # The sort order. If no value is specified, the results are not sorted.
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @accept_language : String? = nil,
          @filters : Hash(String, Array(String))? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct SearchProductsOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The product view aggregations.
        @[JSON::Field(key: "ProductViewAggregations")]
        getter product_view_aggregations : Hash(String, Array(Types::ProductViewAggregationValue))?

        # Information about the product views.
        @[JSON::Field(key: "ProductViewSummaries")]
        getter product_view_summaries : Array(Types::ProductViewSummary)?

        def initialize(
          @next_page_token : String? = nil,
          @product_view_aggregations : Hash(String, Array(Types::ProductViewAggregationValue))? = nil,
          @product_view_summaries : Array(Types::ProductViewSummary)? = nil
        )
        end
      end

      struct SearchProvisionedProductsInput
        include JSON::Serializable

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The access level to use to obtain results. The default is Account .
        @[JSON::Field(key: "AccessLevelFilter")]
        getter access_level_filter : Types::AccessLevelFilter?

        # The search filters. When the key is SearchQuery , the searchable fields are arn , createdTime , id ,
        # lastRecordId , idempotencyToken , name , physicalId , productId , provisioningArtifactId , type ,
        # status , tags , userArn , userArnSession , lastProvisioningRecordId ,
        # lastSuccessfulProvisioningRecordId , productName , and provisioningArtifactName . Example:
        # "SearchQuery":["status:AVAILABLE"]
        @[JSON::Field(key: "Filters")]
        getter filters : Hash(String, Array(String))?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The page token for the next set of results. To retrieve the first set of results, use null.
        @[JSON::Field(key: "PageToken")]
        getter page_token : String?

        # The sort field. If no value is specified, the results are not sorted. The valid values are arn , id
        # , name , and lastRecordId .
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # The sort order. If no value is specified, the results are not sorted.
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @accept_language : String? = nil,
          @access_level_filter : Types::AccessLevelFilter? = nil,
          @filters : Hash(String, Array(String))? = nil,
          @page_size : Int32? = nil,
          @page_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct SearchProvisionedProductsOutput
        include JSON::Serializable

        # The page token to use to retrieve the next set of results. If there are no additional results, this
        # value is null.
        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Information about the provisioned products.
        @[JSON::Field(key: "ProvisionedProducts")]
        getter provisioned_products : Array(Types::ProvisionedProductAttribute)?

        # The number of provisioned products found.
        @[JSON::Field(key: "TotalResultsCount")]
        getter total_results_count : Int32?

        def initialize(
          @next_page_token : String? = nil,
          @provisioned_products : Array(Types::ProvisionedProductAttribute)? = nil,
          @total_results_count : Int32? = nil
        )
        end
      end

      # A self-service action association consisting of the Action ID, the Product ID, and the Provisioning
      # Artifact ID.
      struct ServiceActionAssociation
        include JSON::Serializable

        # The product identifier. For example, prod-abcdzk7xy33qa .
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The identifier of the provisioning artifact. For example, pa-4abcdjnxjj6ne .
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String

        # The self-service action identifier. For example, act-fs7abcd89wxyz .
        @[JSON::Field(key: "ServiceActionId")]
        getter service_action_id : String

        def initialize(
          @product_id : String,
          @provisioning_artifact_id : String,
          @service_action_id : String
        )
        end
      end

      # An object containing detailed information about the self-service action.
      struct ServiceActionDetail
        include JSON::Serializable

        # A map that defines the self-service action.
        @[JSON::Field(key: "Definition")]
        getter definition : Hash(String, String)?

        # Summary information about the self-service action.
        @[JSON::Field(key: "ServiceActionSummary")]
        getter service_action_summary : Types::ServiceActionSummary?

        def initialize(
          @definition : Hash(String, String)? = nil,
          @service_action_summary : Types::ServiceActionSummary? = nil
        )
        end
      end

      # Detailed information about the self-service action.
      struct ServiceActionSummary
        include JSON::Serializable

        # The self-service action definition type. For example, SSM_AUTOMATION .
        @[JSON::Field(key: "DefinitionType")]
        getter definition_type : String?

        # The self-service action description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The self-service action identifier.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The self-service action name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @definition_type : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Information about the portfolio share operation.
      struct ShareDetails
        include JSON::Serializable

        # List of errors.
        @[JSON::Field(key: "ShareErrors")]
        getter share_errors : Array(Types::ShareError)?

        # List of accounts for whom the operation succeeded.
        @[JSON::Field(key: "SuccessfulShares")]
        getter successful_shares : Array(String)?

        def initialize(
          @share_errors : Array(Types::ShareError)? = nil,
          @successful_shares : Array(String)? = nil
        )
        end
      end

      # Errors that occurred during the portfolio share operation.
      struct ShareError
        include JSON::Serializable

        # List of accounts impacted by the error.
        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(String)?

        # Error type that happened when processing the operation.
        @[JSON::Field(key: "Error")]
        getter error : String?

        # Information about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @accounts : Array(String)? = nil,
          @error : String? = nil,
          @message : String? = nil
        )
        end
      end

      # A top level ProductViewDetail response containing details about the product’s connection. Service
      # Catalog returns this field for the CreateProduct , UpdateProduct , DescribeProductAsAdmin , and
      # SearchProductAsAdmin APIs. This response contains the same fields as the ConnectionParameters
      # request, with the addition of the LastSync response.
      struct SourceConnection
        include JSON::Serializable

        # The connection details based on the connection Type .
        @[JSON::Field(key: "ConnectionParameters")]
        getter connection_parameters : Types::SourceConnectionParameters

        # The only supported SourceConnection type is Codestar.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @connection_parameters : Types::SourceConnectionParameters,
          @type : String? = nil
        )
        end
      end

      # Provides details about the configured SourceConnection .
      struct SourceConnectionDetail
        include JSON::Serializable

        # The connection details based on the connection Type .
        @[JSON::Field(key: "ConnectionParameters")]
        getter connection_parameters : Types::SourceConnectionParameters?

        # Provides details about the product's connection sync and contains the following sub-fields.
        # LastSyncTime LastSyncStatus LastSyncStatusMessage LastSuccessfulSyncTime
        # LastSuccessfulSyncProvisioningArtifactID
        @[JSON::Field(key: "LastSync")]
        getter last_sync : Types::LastSync?

        # The only supported SourceConnection type is Codestar.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @connection_parameters : Types::SourceConnectionParameters? = nil,
          @last_sync : Types::LastSync? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides connection details.
      struct SourceConnectionParameters
        include JSON::Serializable

        # Provides ConnectionType details.
        @[JSON::Field(key: "CodeStar")]
        getter code_star : Types::CodeStarParameters?

        def initialize(
          @code_star : Types::CodeStarParameters? = nil
        )
        end
      end

      # An CloudFormation stack, in a specific account and Region, that's part of a stack set operation. A
      # stack instance is a reference to an attempted or actual stack in a given account within a given
      # Region. A stack instance can exist without a stack—for example, if the stack couldn't be created for
      # some reason. A stack instance is associated with only one stack set. Each stack instance contains
      # the ID of its associated stack set, as well as the ID of the actual stack and the stack status.
      struct StackInstance
        include JSON::Serializable

        # The name of the Amazon Web Services account that the stack instance is associated with.
        @[JSON::Field(key: "Account")]
        getter account : String?

        # The name of the Amazon Web Services Region that the stack instance is associated with.
        @[JSON::Field(key: "Region")]
        getter region : String?

        # The status of the stack instance, in terms of its synchronization with its associated stack set.
        # INOPERABLE : A DeleteStackInstances operation has failed and left the stack in an unstable state.
        # Stacks in this state are excluded from further UpdateStackSet operations. You might need to perform
        # a DeleteStackInstances operation, with RetainStacks set to true, to delete the stack instance, and
        # then delete the stack manually. OUTDATED : The stack isn't currently up to date with the stack set
        # because either the associated stack failed during a CreateStackSet or UpdateStackSet operation, or
        # the stack was part of a CreateStackSet or UpdateStackSet operation that failed or was stopped before
        # the stack was created or updated. CURRENT : The stack is currently up to date with the stack set.
        @[JSON::Field(key: "StackInstanceStatus")]
        getter stack_instance_status : String?

        def initialize(
          @account : String? = nil,
          @region : String? = nil,
          @stack_instance_status : String? = nil
        )
        end
      end

      # Information about a tag. A tag is a key-value pair. Tags are propagated to the resources created
      # when provisioning a product.
      struct Tag
        include JSON::Serializable

        # The tag key.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value for this key.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Information about a TagOption.
      struct TagOptionDetail
        include JSON::Serializable

        # The TagOption active state.
        @[JSON::Field(key: "Active")]
        getter active : Bool?

        # The TagOption identifier.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The TagOption key.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The Amazon Web Services account Id of the owner account that created the TagOption.
        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The TagOption value.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @active : Bool? = nil,
          @id : String? = nil,
          @key : String? = nil,
          @owner : String? = nil,
          @value : String? = nil
        )
        end
      end

      # An operation requiring TagOptions failed because the TagOptions migration process has not been
      # performed for this account. Use the Amazon Web Services Management Console to perform the migration
      # process before retrying the operation.
      struct TagOptionNotMigratedException
        include JSON::Serializable

        def initialize
        end
      end

      # Summary information about a TagOption.
      struct TagOptionSummary
        include JSON::Serializable

        # The TagOption key.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The TagOption value.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      struct TerminateProvisionedProductInput
        include JSON::Serializable

        # An idempotency token that uniquely identifies the termination request. This token is only valid
        # during the termination process. After the provisioned product is terminated, subsequent requests to
        # terminate the same provisioned product always return ResourceNotFound .
        @[JSON::Field(key: "TerminateToken")]
        getter terminate_token : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # If set to true, Service Catalog stops managing the specified provisioned product even if it cannot
        # delete the underlying resources.
        @[JSON::Field(key: "IgnoreErrors")]
        getter ignore_errors : Bool?

        # The identifier of the provisioned product. You cannot specify both ProvisionedProductName and
        # ProvisionedProductId .
        @[JSON::Field(key: "ProvisionedProductId")]
        getter provisioned_product_id : String?

        # The name of the provisioned product. You cannot specify both ProvisionedProductName and
        # ProvisionedProductId .
        @[JSON::Field(key: "ProvisionedProductName")]
        getter provisioned_product_name : String?

        # When this boolean parameter is set to true, the TerminateProvisionedProduct API deletes the Service
        # Catalog provisioned product. However, it does not remove the CloudFormation stack, stack set, or the
        # underlying resources of the deleted provisioned product. The default value is false.
        @[JSON::Field(key: "RetainPhysicalResources")]
        getter retain_physical_resources : Bool?

        def initialize(
          @terminate_token : String,
          @accept_language : String? = nil,
          @ignore_errors : Bool? = nil,
          @provisioned_product_id : String? = nil,
          @provisioned_product_name : String? = nil,
          @retain_physical_resources : Bool? = nil
        )
        end
      end

      struct TerminateProvisionedProductOutput
        include JSON::Serializable

        # Information about the result of this request.
        @[JSON::Field(key: "RecordDetail")]
        getter record_detail : Types::RecordDetail?

        def initialize(
          @record_detail : Types::RecordDetail? = nil
        )
        end
      end

      # The unique key-value pair for a tag that identifies provisioned product resources.
      struct UniqueTagResourceIdentifier
        include JSON::Serializable

        # A unique key that's attached to a resource.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # A unique value that's attached to a resource.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct UpdateConstraintInput
        include JSON::Serializable

        # The identifier of the constraint.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The updated description of the constraint.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The constraint parameters, in JSON format. The syntax depends on the constraint type as follows:
        # LAUNCH You are required to specify either the RoleArn or the LocalRoleName but can't use both.
        # Specify the RoleArn property as follows: {"RoleArn" : "arn:aws:iam::123456789012:role/LaunchRole"}
        # Specify the LocalRoleName property as follows: {"LocalRoleName": "SCBasicLaunchRole"} If you specify
        # the LocalRoleName property, when an account uses the launch constraint, the IAM role with that name
        # in the account will be used. This allows launch-role constraints to be account-agnostic so the
        # administrator can create fewer resources per shared account. The given role name must exist in the
        # account used to create the launch constraint and the account of the user who launches a product with
        # this launch constraint. You cannot have both a LAUNCH and a STACKSET constraint. You also cannot
        # have more than one LAUNCH constraint on a product and portfolio. NOTIFICATION Specify the
        # NotificationArns property as follows: {"NotificationArns" :
        # ["arn:aws:sns:us-east-1:123456789012:Topic"]} RESOURCE_UPDATE Specify the
        # TagUpdatesOnProvisionedProduct property as follows:
        # {"Version":"2.0","Properties":{"TagUpdateOnProvisionedProduct":"String"}} The
        # TagUpdatesOnProvisionedProduct property accepts a string value of ALLOWED or NOT_ALLOWED . STACKSET
        # Specify the Parameters property as follows: {"Version": "String", "Properties": {"AccountList": [
        # "String" ], "RegionList": [ "String" ], "AdminRole": "String", "ExecutionRole": "String"}} You
        # cannot have both a LAUNCH and a STACKSET constraint. You also cannot have more than one STACKSET
        # constraint on a product and portfolio. Products with a STACKSET constraint will launch an
        # CloudFormation stack set. TEMPLATE Specify the Rules property. For more information, see Template
        # Constraint Rules .
        @[JSON::Field(key: "Parameters")]
        getter parameters : String?

        def initialize(
          @id : String,
          @accept_language : String? = nil,
          @description : String? = nil,
          @parameters : String? = nil
        )
        end
      end

      struct UpdateConstraintOutput
        include JSON::Serializable

        # Information about the constraint.
        @[JSON::Field(key: "ConstraintDetail")]
        getter constraint_detail : Types::ConstraintDetail?

        # The constraint parameters.
        @[JSON::Field(key: "ConstraintParameters")]
        getter constraint_parameters : String?

        # The status of the current request.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @constraint_detail : Types::ConstraintDetail? = nil,
          @constraint_parameters : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdatePortfolioInput
        include JSON::Serializable

        # The portfolio identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The tags to add.
        @[JSON::Field(key: "AddTags")]
        getter add_tags : Array(Types::Tag)?

        # The updated description of the portfolio.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name to use for display purposes.
        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The updated name of the portfolio provider.
        @[JSON::Field(key: "ProviderName")]
        getter provider_name : String?

        # The tags to remove.
        @[JSON::Field(key: "RemoveTags")]
        getter remove_tags : Array(String)?

        def initialize(
          @id : String,
          @accept_language : String? = nil,
          @add_tags : Array(Types::Tag)? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @provider_name : String? = nil,
          @remove_tags : Array(String)? = nil
        )
        end
      end

      struct UpdatePortfolioOutput
        include JSON::Serializable

        # Information about the portfolio.
        @[JSON::Field(key: "PortfolioDetail")]
        getter portfolio_detail : Types::PortfolioDetail?

        # Information about the tags associated with the portfolio.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @portfolio_detail : Types::PortfolioDetail? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct UpdatePortfolioShareInput
        include JSON::Serializable

        # The unique identifier of the portfolio for which the share will be updated.
        @[JSON::Field(key: "PortfolioId")]
        getter portfolio_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The Amazon Web Services account Id of the recipient account. This field is required when updating an
        # external account to account type share.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        @[JSON::Field(key: "OrganizationNode")]
        getter organization_node : Types::OrganizationNode?

        # A flag to enables or disables Principals sharing in the portfolio. If this field is not provided,
        # the current state of the Principals sharing on the portfolio share will not be modified.
        @[JSON::Field(key: "SharePrincipals")]
        getter share_principals : Bool?

        # Enables or disables TagOptions sharing for the portfolio share. If this field is not provided, the
        # current state of TagOptions sharing on the portfolio share will not be modified.
        @[JSON::Field(key: "ShareTagOptions")]
        getter share_tag_options : Bool?

        def initialize(
          @portfolio_id : String,
          @accept_language : String? = nil,
          @account_id : String? = nil,
          @organization_node : Types::OrganizationNode? = nil,
          @share_principals : Bool? = nil,
          @share_tag_options : Bool? = nil
        )
        end
      end

      struct UpdatePortfolioShareOutput
        include JSON::Serializable

        # The token that tracks the status of the UpdatePortfolioShare operation for external account to
        # account or organizational type sharing.
        @[JSON::Field(key: "PortfolioShareToken")]
        getter portfolio_share_token : String?

        # The status of UpdatePortfolioShare operation. You can also obtain the operation status using
        # DescribePortfolioShareStatus API.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @portfolio_share_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateProductInput
        include JSON::Serializable

        # The product identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The tags to add to the product.
        @[JSON::Field(key: "AddTags")]
        getter add_tags : Array(Types::Tag)?

        # The updated description of the product.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The updated distributor of the product.
        @[JSON::Field(key: "Distributor")]
        getter distributor : String?

        # The updated product name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The updated owner of the product.
        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The tags to remove from the product.
        @[JSON::Field(key: "RemoveTags")]
        getter remove_tags : Array(String)?

        # Specifies connection details for the updated product and syncs the product to the connection source
        # artifact. This automatically manages the product's artifacts based on changes to the source. The
        # SourceConnection parameter consists of the following sub-fields. Type ConnectionParamters
        @[JSON::Field(key: "SourceConnection")]
        getter source_connection : Types::SourceConnection?

        # The updated support description for the product.
        @[JSON::Field(key: "SupportDescription")]
        getter support_description : String?

        # The updated support email for the product.
        @[JSON::Field(key: "SupportEmail")]
        getter support_email : String?

        # The updated support URL for the product.
        @[JSON::Field(key: "SupportUrl")]
        getter support_url : String?

        def initialize(
          @id : String,
          @accept_language : String? = nil,
          @add_tags : Array(Types::Tag)? = nil,
          @description : String? = nil,
          @distributor : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @remove_tags : Array(String)? = nil,
          @source_connection : Types::SourceConnection? = nil,
          @support_description : String? = nil,
          @support_email : String? = nil,
          @support_url : String? = nil
        )
        end
      end

      struct UpdateProductOutput
        include JSON::Serializable

        # Information about the product view.
        @[JSON::Field(key: "ProductViewDetail")]
        getter product_view_detail : Types::ProductViewDetail?

        # Information about the tags associated with the product.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @product_view_detail : Types::ProductViewDetail? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct UpdateProvisionedProductInput
        include JSON::Serializable

        # The idempotency token that uniquely identifies the provisioning update request.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # The path identifier. This value is optional if the product has a default path, and required if the
        # product has more than one path. You must provide the name or ID, but not both.
        @[JSON::Field(key: "PathId")]
        getter path_id : String?

        # The name of the path. You must provide the name or ID, but not both.
        @[JSON::Field(key: "PathName")]
        getter path_name : String?

        # The identifier of the product. You must provide the name or ID, but not both.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # The name of the product. You must provide the name or ID, but not both.
        @[JSON::Field(key: "ProductName")]
        getter product_name : String?

        # The identifier of the provisioned product. You must provide the name or ID, but not both.
        @[JSON::Field(key: "ProvisionedProductId")]
        getter provisioned_product_id : String?

        # The name of the provisioned product. You cannot specify both ProvisionedProductName and
        # ProvisionedProductId .
        @[JSON::Field(key: "ProvisionedProductName")]
        getter provisioned_product_name : String?

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String?

        # The name of the provisioning artifact. You must provide the name or ID, but not both.
        @[JSON::Field(key: "ProvisioningArtifactName")]
        getter provisioning_artifact_name : String?

        # The new parameters.
        @[JSON::Field(key: "ProvisioningParameters")]
        getter provisioning_parameters : Array(Types::UpdateProvisioningParameter)?

        # An object that contains information about the provisioning preferences for a stack set.
        @[JSON::Field(key: "ProvisioningPreferences")]
        getter provisioning_preferences : Types::UpdateProvisioningPreferences?

        # One or more tags. Requires the product to have RESOURCE_UPDATE constraint with
        # TagUpdatesOnProvisionedProduct set to ALLOWED to allow tag updates.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @update_token : String,
          @accept_language : String? = nil,
          @path_id : String? = nil,
          @path_name : String? = nil,
          @product_id : String? = nil,
          @product_name : String? = nil,
          @provisioned_product_id : String? = nil,
          @provisioned_product_name : String? = nil,
          @provisioning_artifact_id : String? = nil,
          @provisioning_artifact_name : String? = nil,
          @provisioning_parameters : Array(Types::UpdateProvisioningParameter)? = nil,
          @provisioning_preferences : Types::UpdateProvisioningPreferences? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct UpdateProvisionedProductOutput
        include JSON::Serializable

        # Information about the result of the request.
        @[JSON::Field(key: "RecordDetail")]
        getter record_detail : Types::RecordDetail?

        def initialize(
          @record_detail : Types::RecordDetail? = nil
        )
        end
      end

      struct UpdateProvisionedProductPropertiesInput
        include JSON::Serializable

        # The idempotency token that uniquely identifies the provisioning product update request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The identifier of the provisioned product.
        @[JSON::Field(key: "ProvisionedProductId")]
        getter provisioned_product_id : String

        # A map that contains the provisioned product properties to be updated. The LAUNCH_ROLE key accepts
        # role ARNs. This key allows an administrator to call UpdateProvisionedProductProperties to update the
        # launch role that is associated with a provisioned product. This role is used when an end user calls
        # a provisioning operation such as UpdateProvisionedProduct , TerminateProvisionedProduct , or
        # ExecuteProvisionedProductServiceAction . Only a role ARN is valid. A user ARN is invalid. The OWNER
        # key accepts user ARNs, IAM role ARNs, and STS assumed-role ARNs. The owner is the user that has
        # permission to see, update, terminate, and execute service actions in the provisioned product. The
        # administrator can change the owner of a provisioned product to another IAM or STS entity within the
        # same account. Both end user owners and administrators can see ownership history of the provisioned
        # product using the ListRecordHistory API. The new owner can describe all past records for the
        # provisioned product using the DescribeRecord API. The previous owner can no longer use
        # DescribeRecord , but can still see the product's history from when he was an owner using
        # ListRecordHistory . If a provisioned product ownership is assigned to an end user, they can see and
        # perform any action through the API or Service Catalog console such as update, terminate, and execute
        # service actions. If an end user provisions a product and the owner is updated to someone else, they
        # will no longer be able to see or perform any actions through API or the Service Catalog console on
        # that provisioned product.
        @[JSON::Field(key: "ProvisionedProductProperties")]
        getter provisioned_product_properties : Hash(String, String)

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        def initialize(
          @idempotency_token : String,
          @provisioned_product_id : String,
          @provisioned_product_properties : Hash(String, String),
          @accept_language : String? = nil
        )
        end
      end

      struct UpdateProvisionedProductPropertiesOutput
        include JSON::Serializable

        # The provisioned product identifier.
        @[JSON::Field(key: "ProvisionedProductId")]
        getter provisioned_product_id : String?

        # A map that contains the properties updated.
        @[JSON::Field(key: "ProvisionedProductProperties")]
        getter provisioned_product_properties : Hash(String, String)?

        # The identifier of the record.
        @[JSON::Field(key: "RecordId")]
        getter record_id : String?

        # The status of the request.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @provisioned_product_id : String? = nil,
          @provisioned_product_properties : Hash(String, String)? = nil,
          @record_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateProvisioningArtifactInput
        include JSON::Serializable

        # The product identifier.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String

        # The identifier of the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactId")]
        getter provisioning_artifact_id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # Indicates whether the product version is active. Inactive provisioning artifacts are invisible to
        # end users. End users cannot launch or update a provisioned product from an inactive provisioning
        # artifact.
        @[JSON::Field(key: "Active")]
        getter active : Bool?

        # The updated description of the provisioning artifact.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information set by the administrator to provide guidance to end users about which provisioning
        # artifacts to use. The DEFAULT value indicates that the product version is active. The administrator
        # can set the guidance to DEPRECATED to inform users that the product version is deprecated. Users are
        # able to make updates to a provisioned product of a deprecated version but cannot launch new
        # provisioned products using a deprecated version.
        @[JSON::Field(key: "Guidance")]
        getter guidance : String?

        # The updated name of the provisioning artifact.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @product_id : String,
          @provisioning_artifact_id : String,
          @accept_language : String? = nil,
          @active : Bool? = nil,
          @description : String? = nil,
          @guidance : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateProvisioningArtifactOutput
        include JSON::Serializable

        # The URL of the CloudFormation template in Amazon S3 or GitHub in JSON format.
        @[JSON::Field(key: "Info")]
        getter info : Hash(String, String)?

        # Information about the provisioning artifact.
        @[JSON::Field(key: "ProvisioningArtifactDetail")]
        getter provisioning_artifact_detail : Types::ProvisioningArtifactDetail?

        # The status of the current request.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @info : Hash(String, String)? = nil,
          @provisioning_artifact_detail : Types::ProvisioningArtifactDetail? = nil,
          @status : String? = nil
        )
        end
      end

      # The parameter key-value pair used to update a provisioned product.
      struct UpdateProvisioningParameter
        include JSON::Serializable

        # The parameter key.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # If set to true, Value is ignored and the previous parameter value is kept.
        @[JSON::Field(key: "UsePreviousValue")]
        getter use_previous_value : Bool?

        # The parameter value.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @use_previous_value : Bool? = nil,
          @value : String? = nil
        )
        end
      end

      # The user-defined preferences that will be applied when updating a provisioned product. Not all
      # preferences are applicable to all provisioned product types.
      struct UpdateProvisioningPreferences
        include JSON::Serializable

        # One or more Amazon Web Services accounts that will have access to the provisioned product.
        # Applicable only to a CFN_STACKSET provisioned product type. The Amazon Web Services accounts
        # specified should be within the list of accounts in the STACKSET constraint. To get the list of
        # accounts in the STACKSET constraint, use the DescribeProvisioningParameters operation. If no values
        # are specified, the default value is all accounts from the STACKSET constraint.
        @[JSON::Field(key: "StackSetAccounts")]
        getter stack_set_accounts : Array(String)?

        # The number of accounts, per Region, for which this operation can fail before Service Catalog stops
        # the operation in that Region. If the operation is stopped in a Region, Service Catalog doesn't
        # attempt the operation in any subsequent Regions. Applicable only to a CFN_STACKSET provisioned
        # product type. Conditional: You must specify either StackSetFailureToleranceCount or
        # StackSetFailureTolerancePercentage , but not both. The default value is 0 if no value is specified.
        @[JSON::Field(key: "StackSetFailureToleranceCount")]
        getter stack_set_failure_tolerance_count : Int32?

        # The percentage of accounts, per Region, for which this stack operation can fail before Service
        # Catalog stops the operation in that Region. If the operation is stopped in a Region, Service Catalog
        # doesn't attempt the operation in any subsequent Regions. When calculating the number of accounts
        # based on the specified percentage, Service Catalog rounds down to the next whole number. Applicable
        # only to a CFN_STACKSET provisioned product type. Conditional: You must specify either
        # StackSetFailureToleranceCount or StackSetFailureTolerancePercentage , but not both.
        @[JSON::Field(key: "StackSetFailureTolerancePercentage")]
        getter stack_set_failure_tolerance_percentage : Int32?

        # The maximum number of accounts in which to perform this operation at one time. This is dependent on
        # the value of StackSetFailureToleranceCount . StackSetMaxConcurrentCount is at most one more than the
        # StackSetFailureToleranceCount . Note that this setting lets you specify the maximum for operations.
        # For large deployments, under certain circumstances the actual number of accounts acted upon
        # concurrently may be lower due to service throttling. Applicable only to a CFN_STACKSET provisioned
        # product type. Conditional: You must specify either StackSetMaxConcurrentCount or
        # StackSetMaxConcurrentPercentage , but not both.
        @[JSON::Field(key: "StackSetMaxConcurrencyCount")]
        getter stack_set_max_concurrency_count : Int32?

        # The maximum percentage of accounts in which to perform this operation at one time. When calculating
        # the number of accounts based on the specified percentage, Service Catalog rounds down to the next
        # whole number. This is true except in cases where rounding down would result is zero. In this case,
        # Service Catalog sets the number as 1 instead. Note that this setting lets you specify the maximum
        # for operations. For large deployments, under certain circumstances the actual number of accounts
        # acted upon concurrently may be lower due to service throttling. Applicable only to a CFN_STACKSET
        # provisioned product type. Conditional: You must specify either StackSetMaxConcurrentCount or
        # StackSetMaxConcurrentPercentage , but not both.
        @[JSON::Field(key: "StackSetMaxConcurrencyPercentage")]
        getter stack_set_max_concurrency_percentage : Int32?

        # Determines what action Service Catalog performs to a stack set or a stack instance represented by
        # the provisioned product. The default value is UPDATE if nothing is specified. Applicable only to a
        # CFN_STACKSET provisioned product type. CREATE Creates a new stack instance in the stack set
        # represented by the provisioned product. In this case, only new stack instances are created based on
        # accounts and Regions; if new ProductId or ProvisioningArtifactID are passed, they will be ignored.
        # UPDATE Updates the stack set represented by the provisioned product and also its stack instances.
        # DELETE Deletes a stack instance in the stack set represented by the provisioned product.
        @[JSON::Field(key: "StackSetOperationType")]
        getter stack_set_operation_type : String?

        # One or more Amazon Web Services Regions where the provisioned product will be available. Applicable
        # only to a CFN_STACKSET provisioned product type. The specified Regions should be within the list of
        # Regions from the STACKSET constraint. To get the list of Regions in the STACKSET constraint, use the
        # DescribeProvisioningParameters operation. If no values are specified, the default value is all
        # Regions from the STACKSET constraint.
        @[JSON::Field(key: "StackSetRegions")]
        getter stack_set_regions : Array(String)?

        def initialize(
          @stack_set_accounts : Array(String)? = nil,
          @stack_set_failure_tolerance_count : Int32? = nil,
          @stack_set_failure_tolerance_percentage : Int32? = nil,
          @stack_set_max_concurrency_count : Int32? = nil,
          @stack_set_max_concurrency_percentage : Int32? = nil,
          @stack_set_operation_type : String? = nil,
          @stack_set_regions : Array(String)? = nil
        )
        end
      end

      struct UpdateServiceActionInput
        include JSON::Serializable

        # The self-service action identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The language code. jp - Japanese zh - Chinese
        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # A map that defines the self-service action.
        @[JSON::Field(key: "Definition")]
        getter definition : Hash(String, String)?

        # The self-service action description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The self-service action name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @id : String,
          @accept_language : String? = nil,
          @definition : Hash(String, String)? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateServiceActionOutput
        include JSON::Serializable

        # Detailed information about the self-service action.
        @[JSON::Field(key: "ServiceActionDetail")]
        getter service_action_detail : Types::ServiceActionDetail?

        def initialize(
          @service_action_detail : Types::ServiceActionDetail? = nil
        )
        end
      end

      struct UpdateTagOptionInput
        include JSON::Serializable

        # The TagOption identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The updated active state.
        @[JSON::Field(key: "Active")]
        getter active : Bool?

        # The updated value.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @id : String,
          @active : Bool? = nil,
          @value : String? = nil
        )
        end
      end

      struct UpdateTagOptionOutput
        include JSON::Serializable

        # Information about the TagOption.
        @[JSON::Field(key: "TagOptionDetail")]
        getter tag_option_detail : Types::TagOptionDetail?

        def initialize(
          @tag_option_detail : Types::TagOptionDetail? = nil
        )
        end
      end

      # Additional information provided by the administrator.
      struct UsageInstruction
        include JSON::Serializable

        # The usage instruction type for the value.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The usage instruction value for this type.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end
    end
  end
end
