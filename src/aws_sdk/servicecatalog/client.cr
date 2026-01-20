module AwsSdk
  module ServiceCatalog
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

      # Accepts an offer to share the specified portfolio.

      def accept_portfolio_share(
        portfolio_id : String,
        accept_language : String? = nil,
        portfolio_share_type : String? = nil
      ) : Types::AcceptPortfolioShareOutput

        input = Types::AcceptPortfolioShareInput.new(portfolio_id: portfolio_id, accept_language: accept_language, portfolio_share_type: portfolio_share_type)
        accept_portfolio_share(input)
      end

      def accept_portfolio_share(input : Types::AcceptPortfolioShareInput) : Types::AcceptPortfolioShareOutput
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_PORTFOLIO_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptPortfolioShareOutput, "AcceptPortfolioShare")
      end

      # Associates the specified budget with the specified resource.

      def associate_budget_with_resource(
        budget_name : String,
        resource_id : String
      ) : Types::AssociateBudgetWithResourceOutput

        input = Types::AssociateBudgetWithResourceInput.new(budget_name: budget_name, resource_id: resource_id)
        associate_budget_with_resource(input)
      end

      def associate_budget_with_resource(input : Types::AssociateBudgetWithResourceInput) : Types::AssociateBudgetWithResourceOutput
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_BUDGET_WITH_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateBudgetWithResourceOutput, "AssociateBudgetWithResource")
      end

      # Associates the specified principal ARN with the specified portfolio. If you share the portfolio with
      # principal name sharing enabled, the PrincipalARN association is included in the share. The
      # PortfolioID , PrincipalARN , and PrincipalType parameters are required. You can associate a maximum
      # of 10 Principals with a portfolio using PrincipalType as IAM_PATTERN . When you associate a
      # principal with portfolio, a potential privilege escalation path may occur when that portfolio is
      # then shared with other accounts. For a user in a recipient account who is not an Service Catalog
      # Admin, but still has the ability to create Principals (Users/Groups/Roles), that user could create a
      # role that matches a principal name association for the portfolio. Although this user may not know
      # which principal names are associated through Service Catalog, they may be able to guess the user. If
      # this potential escalation path is a concern, then Service Catalog recommends using PrincipalType as
      # IAM . With this configuration, the PrincipalARN must already exist in the recipient account before
      # it can be associated.

      def associate_principal_with_portfolio(
        portfolio_id : String,
        principal_arn : String,
        principal_type : String,
        accept_language : String? = nil
      ) : Types::AssociatePrincipalWithPortfolioOutput

        input = Types::AssociatePrincipalWithPortfolioInput.new(portfolio_id: portfolio_id, principal_arn: principal_arn, principal_type: principal_type, accept_language: accept_language)
        associate_principal_with_portfolio(input)
      end

      def associate_principal_with_portfolio(input : Types::AssociatePrincipalWithPortfolioInput) : Types::AssociatePrincipalWithPortfolioOutput
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_PRINCIPAL_WITH_PORTFOLIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociatePrincipalWithPortfolioOutput, "AssociatePrincipalWithPortfolio")
      end

      # Associates the specified product with the specified portfolio. A delegated admin is authorized to
      # invoke this command.

      def associate_product_with_portfolio(
        portfolio_id : String,
        product_id : String,
        accept_language : String? = nil,
        source_portfolio_id : String? = nil
      ) : Types::AssociateProductWithPortfolioOutput

        input = Types::AssociateProductWithPortfolioInput.new(portfolio_id: portfolio_id, product_id: product_id, accept_language: accept_language, source_portfolio_id: source_portfolio_id)
        associate_product_with_portfolio(input)
      end

      def associate_product_with_portfolio(input : Types::AssociateProductWithPortfolioInput) : Types::AssociateProductWithPortfolioOutput
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_PRODUCT_WITH_PORTFOLIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateProductWithPortfolioOutput, "AssociateProductWithPortfolio")
      end

      # Associates a self-service action with a provisioning artifact.

      def associate_service_action_with_provisioning_artifact(
        product_id : String,
        provisioning_artifact_id : String,
        service_action_id : String,
        accept_language : String? = nil,
        idempotency_token : String? = nil
      ) : Types::AssociateServiceActionWithProvisioningArtifactOutput

        input = Types::AssociateServiceActionWithProvisioningArtifactInput.new(product_id: product_id, provisioning_artifact_id: provisioning_artifact_id, service_action_id: service_action_id, accept_language: accept_language, idempotency_token: idempotency_token)
        associate_service_action_with_provisioning_artifact(input)
      end

      def associate_service_action_with_provisioning_artifact(input : Types::AssociateServiceActionWithProvisioningArtifactInput) : Types::AssociateServiceActionWithProvisioningArtifactOutput
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_SERVICE_ACTION_WITH_PROVISIONING_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateServiceActionWithProvisioningArtifactOutput, "AssociateServiceActionWithProvisioningArtifact")
      end

      # Associate the specified TagOption with the specified portfolio or product.

      def associate_tag_option_with_resource(
        resource_id : String,
        tag_option_id : String
      ) : Types::AssociateTagOptionWithResourceOutput

        input = Types::AssociateTagOptionWithResourceInput.new(resource_id: resource_id, tag_option_id: tag_option_id)
        associate_tag_option_with_resource(input)
      end

      def associate_tag_option_with_resource(input : Types::AssociateTagOptionWithResourceInput) : Types::AssociateTagOptionWithResourceOutput
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_TAG_OPTION_WITH_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateTagOptionWithResourceOutput, "AssociateTagOptionWithResource")
      end

      # Associates multiple self-service actions with provisioning artifacts.

      def batch_associate_service_action_with_provisioning_artifact(
        service_action_associations : Array(Types::ServiceActionAssociation),
        accept_language : String? = nil
      ) : Types::BatchAssociateServiceActionWithProvisioningArtifactOutput

        input = Types::BatchAssociateServiceActionWithProvisioningArtifactInput.new(service_action_associations: service_action_associations, accept_language: accept_language)
        batch_associate_service_action_with_provisioning_artifact(input)
      end

      def batch_associate_service_action_with_provisioning_artifact(input : Types::BatchAssociateServiceActionWithProvisioningArtifactInput) : Types::BatchAssociateServiceActionWithProvisioningArtifactOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_ASSOCIATE_SERVICE_ACTION_WITH_PROVISIONING_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchAssociateServiceActionWithProvisioningArtifactOutput, "BatchAssociateServiceActionWithProvisioningArtifact")
      end

      # Disassociates a batch of self-service actions from the specified provisioning artifact.

      def batch_disassociate_service_action_from_provisioning_artifact(
        service_action_associations : Array(Types::ServiceActionAssociation),
        accept_language : String? = nil
      ) : Types::BatchDisassociateServiceActionFromProvisioningArtifactOutput

        input = Types::BatchDisassociateServiceActionFromProvisioningArtifactInput.new(service_action_associations: service_action_associations, accept_language: accept_language)
        batch_disassociate_service_action_from_provisioning_artifact(input)
      end

      def batch_disassociate_service_action_from_provisioning_artifact(input : Types::BatchDisassociateServiceActionFromProvisioningArtifactInput) : Types::BatchDisassociateServiceActionFromProvisioningArtifactOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_DISASSOCIATE_SERVICE_ACTION_FROM_PROVISIONING_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDisassociateServiceActionFromProvisioningArtifactOutput, "BatchDisassociateServiceActionFromProvisioningArtifact")
      end

      # Copies the specified source product to the specified target product or a new product. You can copy a
      # product to the same account or another account. You can copy a product to the same Region or another
      # Region. If you copy a product to another account, you must first share the product in a portfolio
      # using CreatePortfolioShare . This operation is performed asynchronously. To track the progress of
      # the operation, use DescribeCopyProductStatus .

      def copy_product(
        idempotency_token : String,
        source_product_arn : String,
        accept_language : String? = nil,
        copy_options : Array(String)? = nil,
        source_provisioning_artifact_identifiers : Array(Hash(String, String))? = nil,
        target_product_id : String? = nil,
        target_product_name : String? = nil
      ) : Types::CopyProductOutput

        input = Types::CopyProductInput.new(idempotency_token: idempotency_token, source_product_arn: source_product_arn, accept_language: accept_language, copy_options: copy_options, source_provisioning_artifact_identifiers: source_provisioning_artifact_identifiers, target_product_id: target_product_id, target_product_name: target_product_name)
        copy_product(input)
      end

      def copy_product(input : Types::CopyProductInput) : Types::CopyProductOutput
        request = Protocol::JsonRpc.build_request(Model::COPY_PRODUCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CopyProductOutput, "CopyProduct")
      end

      # Creates a constraint. A delegated admin is authorized to invoke this command.

      def create_constraint(
        idempotency_token : String,
        parameters : String,
        portfolio_id : String,
        product_id : String,
        type : String,
        accept_language : String? = nil,
        description : String? = nil
      ) : Types::CreateConstraintOutput

        input = Types::CreateConstraintInput.new(idempotency_token: idempotency_token, parameters: parameters, portfolio_id: portfolio_id, product_id: product_id, type: type, accept_language: accept_language, description: description)
        create_constraint(input)
      end

      def create_constraint(input : Types::CreateConstraintInput) : Types::CreateConstraintOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONSTRAINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateConstraintOutput, "CreateConstraint")
      end

      # Creates a portfolio. A delegated admin is authorized to invoke this command.

      def create_portfolio(
        display_name : String,
        idempotency_token : String,
        provider_name : String,
        accept_language : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePortfolioOutput

        input = Types::CreatePortfolioInput.new(display_name: display_name, idempotency_token: idempotency_token, provider_name: provider_name, accept_language: accept_language, description: description, tags: tags)
        create_portfolio(input)
      end

      def create_portfolio(input : Types::CreatePortfolioInput) : Types::CreatePortfolioOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PORTFOLIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePortfolioOutput, "CreatePortfolio")
      end

      # Shares the specified portfolio with the specified account or organization node. Shares to an
      # organization node can only be created by the management account of an organization or by a delegated
      # administrator. You can share portfolios to an organization, an organizational unit, or a specific
      # account. Note that if a delegated admin is de-registered, they can no longer create portfolio
      # shares. AWSOrganizationsAccess must be enabled in order to create a portfolio share to an
      # organization node. You can't share a shared resource, including portfolios that contain a shared
      # product. If the portfolio share with the specified account or organization node already exists, this
      # action will have no effect and will not return an error. To update an existing share, you must use
      # the UpdatePortfolioShare API instead. When you associate a principal with portfolio, a potential
      # privilege escalation path may occur when that portfolio is then shared with other accounts. For a
      # user in a recipient account who is not an Service Catalog Admin, but still has the ability to create
      # Principals (Users/Groups/Roles), that user could create a role that matches a principal name
      # association for the portfolio. Although this user may not know which principal names are associated
      # through Service Catalog, they may be able to guess the user. If this potential escalation path is a
      # concern, then Service Catalog recommends using PrincipalType as IAM . With this configuration, the
      # PrincipalARN must already exist in the recipient account before it can be associated.

      def create_portfolio_share(
        portfolio_id : String,
        accept_language : String? = nil,
        account_id : String? = nil,
        organization_node : Types::OrganizationNode? = nil,
        share_principals : Bool? = nil,
        share_tag_options : Bool? = nil
      ) : Types::CreatePortfolioShareOutput

        input = Types::CreatePortfolioShareInput.new(portfolio_id: portfolio_id, accept_language: accept_language, account_id: account_id, organization_node: organization_node, share_principals: share_principals, share_tag_options: share_tag_options)
        create_portfolio_share(input)
      end

      def create_portfolio_share(input : Types::CreatePortfolioShareInput) : Types::CreatePortfolioShareOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PORTFOLIO_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePortfolioShareOutput, "CreatePortfolioShare")
      end

      # Creates a product. A delegated admin is authorized to invoke this command. The user or role that
      # performs this operation must have the cloudformation:GetTemplate IAM policy permission. This policy
      # permission is required when using the ImportFromPhysicalId template source in the information data
      # section.

      def create_product(
        idempotency_token : String,
        name : String,
        owner : String,
        product_type : String,
        accept_language : String? = nil,
        description : String? = nil,
        distributor : String? = nil,
        provisioning_artifact_parameters : Types::ProvisioningArtifactProperties? = nil,
        source_connection : Types::SourceConnection? = nil,
        support_description : String? = nil,
        support_email : String? = nil,
        support_url : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateProductOutput

        input = Types::CreateProductInput.new(idempotency_token: idempotency_token, name: name, owner: owner, product_type: product_type, accept_language: accept_language, description: description, distributor: distributor, provisioning_artifact_parameters: provisioning_artifact_parameters, source_connection: source_connection, support_description: support_description, support_email: support_email, support_url: support_url, tags: tags)
        create_product(input)
      end

      def create_product(input : Types::CreateProductInput) : Types::CreateProductOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PRODUCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProductOutput, "CreateProduct")
      end

      # Creates a plan. A plan includes the list of resources to be created (when provisioning a new
      # product) or modified (when updating a provisioned product) when the plan is executed. You can create
      # one plan for each provisioned product. To create a plan for an existing provisioned product, the
      # product status must be AVAILABLE or TAINTED. To view the resource changes in the change set, use
      # DescribeProvisionedProductPlan . To create or modify the provisioned product, use
      # ExecuteProvisionedProductPlan .

      def create_provisioned_product_plan(
        idempotency_token : String,
        plan_name : String,
        plan_type : String,
        product_id : String,
        provisioned_product_name : String,
        provisioning_artifact_id : String,
        accept_language : String? = nil,
        notification_arns : Array(String)? = nil,
        path_id : String? = nil,
        provisioning_parameters : Array(Types::UpdateProvisioningParameter)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateProvisionedProductPlanOutput

        input = Types::CreateProvisionedProductPlanInput.new(idempotency_token: idempotency_token, plan_name: plan_name, plan_type: plan_type, product_id: product_id, provisioned_product_name: provisioned_product_name, provisioning_artifact_id: provisioning_artifact_id, accept_language: accept_language, notification_arns: notification_arns, path_id: path_id, provisioning_parameters: provisioning_parameters, tags: tags)
        create_provisioned_product_plan(input)
      end

      def create_provisioned_product_plan(input : Types::CreateProvisionedProductPlanInput) : Types::CreateProvisionedProductPlanOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROVISIONED_PRODUCT_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProvisionedProductPlanOutput, "CreateProvisionedProductPlan")
      end

      # Creates a provisioning artifact (also known as a version) for the specified product. You cannot
      # create a provisioning artifact for a product that was shared with you. The user or role that
      # performs this operation must have the cloudformation:GetTemplate IAM policy permission. This policy
      # permission is required when using the ImportFromPhysicalId template source in the information data
      # section.

      def create_provisioning_artifact(
        idempotency_token : String,
        parameters : Types::ProvisioningArtifactProperties,
        product_id : String,
        accept_language : String? = nil
      ) : Types::CreateProvisioningArtifactOutput

        input = Types::CreateProvisioningArtifactInput.new(idempotency_token: idempotency_token, parameters: parameters, product_id: product_id, accept_language: accept_language)
        create_provisioning_artifact(input)
      end

      def create_provisioning_artifact(input : Types::CreateProvisioningArtifactInput) : Types::CreateProvisioningArtifactOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROVISIONING_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProvisioningArtifactOutput, "CreateProvisioningArtifact")
      end

      # Creates a self-service action.

      def create_service_action(
        definition : Hash(String, String),
        definition_type : String,
        idempotency_token : String,
        name : String,
        accept_language : String? = nil,
        description : String? = nil
      ) : Types::CreateServiceActionOutput

        input = Types::CreateServiceActionInput.new(definition: definition, definition_type: definition_type, idempotency_token: idempotency_token, name: name, accept_language: accept_language, description: description)
        create_service_action(input)
      end

      def create_service_action(input : Types::CreateServiceActionInput) : Types::CreateServiceActionOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_SERVICE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateServiceActionOutput, "CreateServiceAction")
      end

      # Creates a TagOption.

      def create_tag_option(
        key : String,
        value : String
      ) : Types::CreateTagOptionOutput

        input = Types::CreateTagOptionInput.new(key: key, value: value)
        create_tag_option(input)
      end

      def create_tag_option(input : Types::CreateTagOptionInput) : Types::CreateTagOptionOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_TAG_OPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTagOptionOutput, "CreateTagOption")
      end

      # Deletes the specified constraint. A delegated admin is authorized to invoke this command.

      def delete_constraint(
        id : String,
        accept_language : String? = nil
      ) : Types::DeleteConstraintOutput

        input = Types::DeleteConstraintInput.new(id: id, accept_language: accept_language)
        delete_constraint(input)
      end

      def delete_constraint(input : Types::DeleteConstraintInput) : Types::DeleteConstraintOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONSTRAINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteConstraintOutput, "DeleteConstraint")
      end

      # Deletes the specified portfolio. You cannot delete a portfolio if it was shared with you or if it
      # has associated products, users, constraints, or shared accounts. A delegated admin is authorized to
      # invoke this command.

      def delete_portfolio(
        id : String,
        accept_language : String? = nil
      ) : Types::DeletePortfolioOutput

        input = Types::DeletePortfolioInput.new(id: id, accept_language: accept_language)
        delete_portfolio(input)
      end

      def delete_portfolio(input : Types::DeletePortfolioInput) : Types::DeletePortfolioOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_PORTFOLIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePortfolioOutput, "DeletePortfolio")
      end

      # Stops sharing the specified portfolio with the specified account or organization node. Shares to an
      # organization node can only be deleted by the management account of an organization or by a delegated
      # administrator. Note that if a delegated admin is de-registered, portfolio shares created from that
      # account are removed.

      def delete_portfolio_share(
        portfolio_id : String,
        accept_language : String? = nil,
        account_id : String? = nil,
        organization_node : Types::OrganizationNode? = nil
      ) : Types::DeletePortfolioShareOutput

        input = Types::DeletePortfolioShareInput.new(portfolio_id: portfolio_id, accept_language: accept_language, account_id: account_id, organization_node: organization_node)
        delete_portfolio_share(input)
      end

      def delete_portfolio_share(input : Types::DeletePortfolioShareInput) : Types::DeletePortfolioShareOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_PORTFOLIO_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePortfolioShareOutput, "DeletePortfolioShare")
      end

      # Deletes the specified product. You cannot delete a product if it was shared with you or is
      # associated with a portfolio. A delegated admin is authorized to invoke this command.

      def delete_product(
        id : String,
        accept_language : String? = nil
      ) : Types::DeleteProductOutput

        input = Types::DeleteProductInput.new(id: id, accept_language: accept_language)
        delete_product(input)
      end

      def delete_product(input : Types::DeleteProductInput) : Types::DeleteProductOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_PRODUCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProductOutput, "DeleteProduct")
      end

      # Deletes the specified plan.

      def delete_provisioned_product_plan(
        plan_id : String,
        accept_language : String? = nil,
        ignore_errors : Bool? = nil
      ) : Types::DeleteProvisionedProductPlanOutput

        input = Types::DeleteProvisionedProductPlanInput.new(plan_id: plan_id, accept_language: accept_language, ignore_errors: ignore_errors)
        delete_provisioned_product_plan(input)
      end

      def delete_provisioned_product_plan(input : Types::DeleteProvisionedProductPlanInput) : Types::DeleteProvisionedProductPlanOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROVISIONED_PRODUCT_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProvisionedProductPlanOutput, "DeleteProvisionedProductPlan")
      end

      # Deletes the specified provisioning artifact (also known as a version) for the specified product. You
      # cannot delete a provisioning artifact associated with a product that was shared with you. You cannot
      # delete the last provisioning artifact for a product, because a product must have at least one
      # provisioning artifact.

      def delete_provisioning_artifact(
        product_id : String,
        provisioning_artifact_id : String,
        accept_language : String? = nil
      ) : Types::DeleteProvisioningArtifactOutput

        input = Types::DeleteProvisioningArtifactInput.new(product_id: product_id, provisioning_artifact_id: provisioning_artifact_id, accept_language: accept_language)
        delete_provisioning_artifact(input)
      end

      def delete_provisioning_artifact(input : Types::DeleteProvisioningArtifactInput) : Types::DeleteProvisioningArtifactOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROVISIONING_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProvisioningArtifactOutput, "DeleteProvisioningArtifact")
      end

      # Deletes a self-service action.

      def delete_service_action(
        id : String,
        accept_language : String? = nil,
        idempotency_token : String? = nil
      ) : Types::DeleteServiceActionOutput

        input = Types::DeleteServiceActionInput.new(id: id, accept_language: accept_language, idempotency_token: idempotency_token)
        delete_service_action(input)
      end

      def delete_service_action(input : Types::DeleteServiceActionInput) : Types::DeleteServiceActionOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_SERVICE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteServiceActionOutput, "DeleteServiceAction")
      end

      # Deletes the specified TagOption. You cannot delete a TagOption if it is associated with a product or
      # portfolio.

      def delete_tag_option(
        id : String
      ) : Types::DeleteTagOptionOutput

        input = Types::DeleteTagOptionInput.new(id: id)
        delete_tag_option(input)
      end

      def delete_tag_option(input : Types::DeleteTagOptionInput) : Types::DeleteTagOptionOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_TAG_OPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTagOptionOutput, "DeleteTagOption")
      end

      # Gets information about the specified constraint.

      def describe_constraint(
        id : String,
        accept_language : String? = nil
      ) : Types::DescribeConstraintOutput

        input = Types::DescribeConstraintInput.new(id: id, accept_language: accept_language)
        describe_constraint(input)
      end

      def describe_constraint(input : Types::DescribeConstraintInput) : Types::DescribeConstraintOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONSTRAINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConstraintOutput, "DescribeConstraint")
      end

      # Gets the status of the specified copy product operation.

      def describe_copy_product_status(
        copy_product_token : String,
        accept_language : String? = nil
      ) : Types::DescribeCopyProductStatusOutput

        input = Types::DescribeCopyProductStatusInput.new(copy_product_token: copy_product_token, accept_language: accept_language)
        describe_copy_product_status(input)
      end

      def describe_copy_product_status(input : Types::DescribeCopyProductStatusInput) : Types::DescribeCopyProductStatusOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_COPY_PRODUCT_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCopyProductStatusOutput, "DescribeCopyProductStatus")
      end

      # Gets information about the specified portfolio. A delegated admin is authorized to invoke this
      # command.

      def describe_portfolio(
        id : String,
        accept_language : String? = nil
      ) : Types::DescribePortfolioOutput

        input = Types::DescribePortfolioInput.new(id: id, accept_language: accept_language)
        describe_portfolio(input)
      end

      def describe_portfolio(input : Types::DescribePortfolioInput) : Types::DescribePortfolioOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PORTFOLIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePortfolioOutput, "DescribePortfolio")
      end

      # Gets the status of the specified portfolio share operation. This API can only be called by the
      # management account in the organization or by a delegated admin.

      def describe_portfolio_share_status(
        portfolio_share_token : String
      ) : Types::DescribePortfolioShareStatusOutput

        input = Types::DescribePortfolioShareStatusInput.new(portfolio_share_token: portfolio_share_token)
        describe_portfolio_share_status(input)
      end

      def describe_portfolio_share_status(input : Types::DescribePortfolioShareStatusInput) : Types::DescribePortfolioShareStatusOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PORTFOLIO_SHARE_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePortfolioShareStatusOutput, "DescribePortfolioShareStatus")
      end

      # Returns a summary of each of the portfolio shares that were created for the specified portfolio. You
      # can use this API to determine which accounts or organizational nodes this portfolio have been
      # shared, whether the recipient entity has imported the share, and whether TagOptions are included
      # with the share. The PortfolioId and Type parameters are both required.

      def describe_portfolio_shares(
        portfolio_id : String,
        type : String,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::DescribePortfolioSharesOutput

        input = Types::DescribePortfolioSharesInput.new(portfolio_id: portfolio_id, type: type, page_size: page_size, page_token: page_token)
        describe_portfolio_shares(input)
      end

      def describe_portfolio_shares(input : Types::DescribePortfolioSharesInput) : Types::DescribePortfolioSharesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PORTFOLIO_SHARES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePortfolioSharesOutput, "DescribePortfolioShares")
      end

      # Gets information about the specified product. Running this operation with administrator access
      # results in a failure. DescribeProductAsAdmin should be used instead.

      def describe_product(
        accept_language : String? = nil,
        id : String? = nil,
        name : String? = nil
      ) : Types::DescribeProductOutput

        input = Types::DescribeProductInput.new(accept_language: accept_language, id: id, name: name)
        describe_product(input)
      end

      def describe_product(input : Types::DescribeProductInput) : Types::DescribeProductOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PRODUCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProductOutput, "DescribeProduct")
      end

      # Gets information about the specified product. This operation is run with administrator access.

      def describe_product_as_admin(
        accept_language : String? = nil,
        id : String? = nil,
        name : String? = nil,
        source_portfolio_id : String? = nil
      ) : Types::DescribeProductAsAdminOutput

        input = Types::DescribeProductAsAdminInput.new(accept_language: accept_language, id: id, name: name, source_portfolio_id: source_portfolio_id)
        describe_product_as_admin(input)
      end

      def describe_product_as_admin(input : Types::DescribeProductAsAdminInput) : Types::DescribeProductAsAdminOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PRODUCT_AS_ADMIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProductAsAdminOutput, "DescribeProductAsAdmin")
      end

      # Gets information about the specified product.

      def describe_product_view(
        id : String,
        accept_language : String? = nil
      ) : Types::DescribeProductViewOutput

        input = Types::DescribeProductViewInput.new(id: id, accept_language: accept_language)
        describe_product_view(input)
      end

      def describe_product_view(input : Types::DescribeProductViewInput) : Types::DescribeProductViewOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PRODUCT_VIEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProductViewOutput, "DescribeProductView")
      end

      # Gets information about the specified provisioned product.

      def describe_provisioned_product(
        accept_language : String? = nil,
        id : String? = nil,
        name : String? = nil
      ) : Types::DescribeProvisionedProductOutput

        input = Types::DescribeProvisionedProductInput.new(accept_language: accept_language, id: id, name: name)
        describe_provisioned_product(input)
      end

      def describe_provisioned_product(input : Types::DescribeProvisionedProductInput) : Types::DescribeProvisionedProductOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROVISIONED_PRODUCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProvisionedProductOutput, "DescribeProvisionedProduct")
      end

      # Gets information about the resource changes for the specified plan.

      def describe_provisioned_product_plan(
        plan_id : String,
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::DescribeProvisionedProductPlanOutput

        input = Types::DescribeProvisionedProductPlanInput.new(plan_id: plan_id, accept_language: accept_language, page_size: page_size, page_token: page_token)
        describe_provisioned_product_plan(input)
      end

      def describe_provisioned_product_plan(input : Types::DescribeProvisionedProductPlanInput) : Types::DescribeProvisionedProductPlanOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROVISIONED_PRODUCT_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProvisionedProductPlanOutput, "DescribeProvisionedProductPlan")
      end

      # Gets information about the specified provisioning artifact (also known as a version) for the
      # specified product.

      def describe_provisioning_artifact(
        accept_language : String? = nil,
        include_provisioning_artifact_parameters : Bool? = nil,
        product_id : String? = nil,
        product_name : String? = nil,
        provisioning_artifact_id : String? = nil,
        provisioning_artifact_name : String? = nil,
        verbose : Bool? = nil
      ) : Types::DescribeProvisioningArtifactOutput

        input = Types::DescribeProvisioningArtifactInput.new(accept_language: accept_language, include_provisioning_artifact_parameters: include_provisioning_artifact_parameters, product_id: product_id, product_name: product_name, provisioning_artifact_id: provisioning_artifact_id, provisioning_artifact_name: provisioning_artifact_name, verbose: verbose)
        describe_provisioning_artifact(input)
      end

      def describe_provisioning_artifact(input : Types::DescribeProvisioningArtifactInput) : Types::DescribeProvisioningArtifactOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROVISIONING_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProvisioningArtifactOutput, "DescribeProvisioningArtifact")
      end

      # Gets information about the configuration required to provision the specified product using the
      # specified provisioning artifact. If the output contains a TagOption key with an empty list of
      # values, there is a TagOption conflict for that key. The end user cannot take action to fix the
      # conflict, and launch is not blocked. In subsequent calls to ProvisionProduct , do not include
      # conflicted TagOption keys as tags, or this causes the error "Parameter validation failed: Missing
      # required parameter in Tags[ N ]: Value ". Tag the provisioned product with the value
      # sc-tagoption-conflict-portfolioId-productId .

      def describe_provisioning_parameters(
        accept_language : String? = nil,
        path_id : String? = nil,
        path_name : String? = nil,
        product_id : String? = nil,
        product_name : String? = nil,
        provisioning_artifact_id : String? = nil,
        provisioning_artifact_name : String? = nil
      ) : Types::DescribeProvisioningParametersOutput

        input = Types::DescribeProvisioningParametersInput.new(accept_language: accept_language, path_id: path_id, path_name: path_name, product_id: product_id, product_name: product_name, provisioning_artifact_id: provisioning_artifact_id, provisioning_artifact_name: provisioning_artifact_name)
        describe_provisioning_parameters(input)
      end

      def describe_provisioning_parameters(input : Types::DescribeProvisioningParametersInput) : Types::DescribeProvisioningParametersOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROVISIONING_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProvisioningParametersOutput, "DescribeProvisioningParameters")
      end

      # Gets information about the specified request operation. Use this operation after calling a request
      # operation (for example, ProvisionProduct , TerminateProvisionedProduct , or UpdateProvisionedProduct
      # ). If a provisioned product was transferred to a new owner using UpdateProvisionedProductProperties
      # , the new owner will be able to describe all past records for that product. The previous owner will
      # no longer be able to describe the records, but will be able to use ListRecordHistory to see the
      # product's history from when he was the owner.

      def describe_record(
        id : String,
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::DescribeRecordOutput

        input = Types::DescribeRecordInput.new(id: id, accept_language: accept_language, page_size: page_size, page_token: page_token)
        describe_record(input)
      end

      def describe_record(input : Types::DescribeRecordInput) : Types::DescribeRecordOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RECORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRecordOutput, "DescribeRecord")
      end

      # Describes a self-service action.

      def describe_service_action(
        id : String,
        accept_language : String? = nil
      ) : Types::DescribeServiceActionOutput

        input = Types::DescribeServiceActionInput.new(id: id, accept_language: accept_language)
        describe_service_action(input)
      end

      def describe_service_action(input : Types::DescribeServiceActionInput) : Types::DescribeServiceActionOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SERVICE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeServiceActionOutput, "DescribeServiceAction")
      end

      # Finds the default parameters for a specific self-service action on a specific provisioned product
      # and returns a map of the results to the user.

      def describe_service_action_execution_parameters(
        provisioned_product_id : String,
        service_action_id : String,
        accept_language : String? = nil
      ) : Types::DescribeServiceActionExecutionParametersOutput

        input = Types::DescribeServiceActionExecutionParametersInput.new(provisioned_product_id: provisioned_product_id, service_action_id: service_action_id, accept_language: accept_language)
        describe_service_action_execution_parameters(input)
      end

      def describe_service_action_execution_parameters(input : Types::DescribeServiceActionExecutionParametersInput) : Types::DescribeServiceActionExecutionParametersOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SERVICE_ACTION_EXECUTION_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeServiceActionExecutionParametersOutput, "DescribeServiceActionExecutionParameters")
      end

      # Gets information about the specified TagOption.

      def describe_tag_option(
        id : String
      ) : Types::DescribeTagOptionOutput

        input = Types::DescribeTagOptionInput.new(id: id)
        describe_tag_option(input)
      end

      def describe_tag_option(input : Types::DescribeTagOptionInput) : Types::DescribeTagOptionOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TAG_OPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTagOptionOutput, "DescribeTagOption")
      end

      # Disable portfolio sharing through the Organizations service. This command will not delete your
      # current shares, but prevents you from creating new shares throughout your organization. Current
      # shares are not kept in sync with your organization structure if the structure changes after calling
      # this API. Only the management account in the organization can call this API. You cannot call this
      # API if there are active delegated administrators in the organization. Note that a delegated
      # administrator is not authorized to invoke DisableAWSOrganizationsAccess . If you share an Service
      # Catalog portfolio in an organization within Organizations, and then disable Organizations access for
      # Service Catalog, the portfolio access permissions will not sync with the latest changes to the
      # organization structure. Specifically, accounts that you removed from the organization after
      # disabling Service Catalog access will retain access to the previously shared portfolio.

      def disable_aws_organizations_access : Types::DisableAWSOrganizationsAccessOutput
        input = Types::DisableAWSOrganizationsAccessInput.new
        disable_aws_organizations_access(input)
      end

      def disable_aws_organizations_access(input : Types::DisableAWSOrganizationsAccessInput) : Types::DisableAWSOrganizationsAccessOutput
        request = Protocol::JsonRpc.build_request(Model::DISABLE_AWS_ORGANIZATIONS_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableAWSOrganizationsAccessOutput, "DisableAWSOrganizationsAccess")
      end

      # Disassociates the specified budget from the specified resource.

      def disassociate_budget_from_resource(
        budget_name : String,
        resource_id : String
      ) : Types::DisassociateBudgetFromResourceOutput

        input = Types::DisassociateBudgetFromResourceInput.new(budget_name: budget_name, resource_id: resource_id)
        disassociate_budget_from_resource(input)
      end

      def disassociate_budget_from_resource(input : Types::DisassociateBudgetFromResourceInput) : Types::DisassociateBudgetFromResourceOutput
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_BUDGET_FROM_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateBudgetFromResourceOutput, "DisassociateBudgetFromResource")
      end

      # Disassociates a previously associated principal ARN from a specified portfolio. The PrincipalType
      # and PrincipalARN must match the AssociatePrincipalWithPortfolio call request details. For example,
      # to disassociate an association created with a PrincipalARN of PrincipalType IAM you must use the
      # PrincipalType IAM when calling DisassociatePrincipalFromPortfolio . For portfolios that have been
      # shared with principal name sharing enabled: after disassociating a principal, share recipient
      # accounts will no longer be able to provision products in this portfolio using a role matching the
      # name of the associated principal. For more information, review associate-principal-with-portfolio in
      # the Amazon Web Services CLI Command Reference. If you disassociate a principal from a portfolio,
      # with PrincipalType as IAM , the same principal will still have access to the portfolio if it matches
      # one of the associated principals of type IAM_PATTERN . To fully remove access for a principal,
      # verify all the associated Principals of type IAM_PATTERN , and then ensure you disassociate any
      # IAM_PATTERN principals that match the principal whose access you are removing.

      def disassociate_principal_from_portfolio(
        portfolio_id : String,
        principal_arn : String,
        accept_language : String? = nil,
        principal_type : String? = nil
      ) : Types::DisassociatePrincipalFromPortfolioOutput

        input = Types::DisassociatePrincipalFromPortfolioInput.new(portfolio_id: portfolio_id, principal_arn: principal_arn, accept_language: accept_language, principal_type: principal_type)
        disassociate_principal_from_portfolio(input)
      end

      def disassociate_principal_from_portfolio(input : Types::DisassociatePrincipalFromPortfolioInput) : Types::DisassociatePrincipalFromPortfolioOutput
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_PRINCIPAL_FROM_PORTFOLIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociatePrincipalFromPortfolioOutput, "DisassociatePrincipalFromPortfolio")
      end

      # Disassociates the specified product from the specified portfolio. A delegated admin is authorized to
      # invoke this command.

      def disassociate_product_from_portfolio(
        portfolio_id : String,
        product_id : String,
        accept_language : String? = nil
      ) : Types::DisassociateProductFromPortfolioOutput

        input = Types::DisassociateProductFromPortfolioInput.new(portfolio_id: portfolio_id, product_id: product_id, accept_language: accept_language)
        disassociate_product_from_portfolio(input)
      end

      def disassociate_product_from_portfolio(input : Types::DisassociateProductFromPortfolioInput) : Types::DisassociateProductFromPortfolioOutput
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_PRODUCT_FROM_PORTFOLIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateProductFromPortfolioOutput, "DisassociateProductFromPortfolio")
      end

      # Disassociates the specified self-service action association from the specified provisioning
      # artifact.

      def disassociate_service_action_from_provisioning_artifact(
        product_id : String,
        provisioning_artifact_id : String,
        service_action_id : String,
        accept_language : String? = nil,
        idempotency_token : String? = nil
      ) : Types::DisassociateServiceActionFromProvisioningArtifactOutput

        input = Types::DisassociateServiceActionFromProvisioningArtifactInput.new(product_id: product_id, provisioning_artifact_id: provisioning_artifact_id, service_action_id: service_action_id, accept_language: accept_language, idempotency_token: idempotency_token)
        disassociate_service_action_from_provisioning_artifact(input)
      end

      def disassociate_service_action_from_provisioning_artifact(input : Types::DisassociateServiceActionFromProvisioningArtifactInput) : Types::DisassociateServiceActionFromProvisioningArtifactOutput
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_SERVICE_ACTION_FROM_PROVISIONING_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateServiceActionFromProvisioningArtifactOutput, "DisassociateServiceActionFromProvisioningArtifact")
      end

      # Disassociates the specified TagOption from the specified resource.

      def disassociate_tag_option_from_resource(
        resource_id : String,
        tag_option_id : String
      ) : Types::DisassociateTagOptionFromResourceOutput

        input = Types::DisassociateTagOptionFromResourceInput.new(resource_id: resource_id, tag_option_id: tag_option_id)
        disassociate_tag_option_from_resource(input)
      end

      def disassociate_tag_option_from_resource(input : Types::DisassociateTagOptionFromResourceInput) : Types::DisassociateTagOptionFromResourceOutput
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_TAG_OPTION_FROM_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateTagOptionFromResourceOutput, "DisassociateTagOptionFromResource")
      end

      # Enable portfolio sharing feature through Organizations. This API will allow Service Catalog to
      # receive updates on your organization in order to sync your shares with the current structure. This
      # API can only be called by the management account in the organization. When you call this API,
      # Service Catalog calls organizations:EnableAWSServiceAccess on your behalf so that your shares stay
      # in sync with any changes in your Organizations structure. Note that a delegated administrator is not
      # authorized to invoke EnableAWSOrganizationsAccess . If you have previously disabled Organizations
      # access for Service Catalog, and then enable access again, the portfolio access permissions might not
      # sync with the latest changes to the organization structure. Specifically, accounts that you removed
      # from the organization after disabling Service Catalog access, and before you enabled access again,
      # can retain access to the previously shared portfolio. As a result, an account that has been removed
      # from the organization might still be able to create or manage Amazon Web Services resources when it
      # is no longer authorized to do so. Amazon Web Services is working to resolve this issue.

      def enable_aws_organizations_access : Types::EnableAWSOrganizationsAccessOutput
        input = Types::EnableAWSOrganizationsAccessInput.new
        enable_aws_organizations_access(input)
      end

      def enable_aws_organizations_access(input : Types::EnableAWSOrganizationsAccessInput) : Types::EnableAWSOrganizationsAccessOutput
        request = Protocol::JsonRpc.build_request(Model::ENABLE_AWS_ORGANIZATIONS_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableAWSOrganizationsAccessOutput, "EnableAWSOrganizationsAccess")
      end

      # Provisions or modifies a product based on the resource changes for the specified plan.

      def execute_provisioned_product_plan(
        idempotency_token : String,
        plan_id : String,
        accept_language : String? = nil
      ) : Types::ExecuteProvisionedProductPlanOutput

        input = Types::ExecuteProvisionedProductPlanInput.new(idempotency_token: idempotency_token, plan_id: plan_id, accept_language: accept_language)
        execute_provisioned_product_plan(input)
      end

      def execute_provisioned_product_plan(input : Types::ExecuteProvisionedProductPlanInput) : Types::ExecuteProvisionedProductPlanOutput
        request = Protocol::JsonRpc.build_request(Model::EXECUTE_PROVISIONED_PRODUCT_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExecuteProvisionedProductPlanOutput, "ExecuteProvisionedProductPlan")
      end

      # Executes a self-service action against a provisioned product.

      def execute_provisioned_product_service_action(
        execute_token : String,
        provisioned_product_id : String,
        service_action_id : String,
        accept_language : String? = nil,
        parameters : Hash(String, Array(String))? = nil
      ) : Types::ExecuteProvisionedProductServiceActionOutput

        input = Types::ExecuteProvisionedProductServiceActionInput.new(execute_token: execute_token, provisioned_product_id: provisioned_product_id, service_action_id: service_action_id, accept_language: accept_language, parameters: parameters)
        execute_provisioned_product_service_action(input)
      end

      def execute_provisioned_product_service_action(input : Types::ExecuteProvisionedProductServiceActionInput) : Types::ExecuteProvisionedProductServiceActionOutput
        request = Protocol::JsonRpc.build_request(Model::EXECUTE_PROVISIONED_PRODUCT_SERVICE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExecuteProvisionedProductServiceActionOutput, "ExecuteProvisionedProductServiceAction")
      end

      # Get the Access Status for Organizations portfolio share feature. This API can only be called by the
      # management account in the organization or by a delegated admin.

      def get_aws_organizations_access_status : Types::GetAWSOrganizationsAccessStatusOutput
        input = Types::GetAWSOrganizationsAccessStatusInput.new
        get_aws_organizations_access_status(input)
      end

      def get_aws_organizations_access_status(input : Types::GetAWSOrganizationsAccessStatusInput) : Types::GetAWSOrganizationsAccessStatusOutput
        request = Protocol::JsonRpc.build_request(Model::GET_AWS_ORGANIZATIONS_ACCESS_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAWSOrganizationsAccessStatusOutput, "GetAWSOrganizationsAccessStatus")
      end

      # This API takes either a ProvisonedProductId or a ProvisionedProductName , along with a list of one
      # or more output keys, and responds with the key/value pairs of those outputs.

      def get_provisioned_product_outputs(
        accept_language : String? = nil,
        output_keys : Array(String)? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil,
        provisioned_product_id : String? = nil,
        provisioned_product_name : String? = nil
      ) : Types::GetProvisionedProductOutputsOutput

        input = Types::GetProvisionedProductOutputsInput.new(accept_language: accept_language, output_keys: output_keys, page_size: page_size, page_token: page_token, provisioned_product_id: provisioned_product_id, provisioned_product_name: provisioned_product_name)
        get_provisioned_product_outputs(input)
      end

      def get_provisioned_product_outputs(input : Types::GetProvisionedProductOutputsInput) : Types::GetProvisionedProductOutputsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PROVISIONED_PRODUCT_OUTPUTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetProvisionedProductOutputsOutput, "GetProvisionedProductOutputs")
      end

      # Requests the import of a resource as an Service Catalog provisioned product that is associated to an
      # Service Catalog product and provisioning artifact. Once imported, all supported governance actions
      # are supported on the provisioned product. Resource import only supports CloudFormation stack ARNs.
      # CloudFormation StackSets, and non-root nested stacks, are not supported. The CloudFormation stack
      # must have one of the following statuses to be imported: CREATE_COMPLETE , UPDATE_COMPLETE ,
      # UPDATE_ROLLBACK_COMPLETE , IMPORT_COMPLETE , and IMPORT_ROLLBACK_COMPLETE . Import of the resource
      # requires that the CloudFormation stack template matches the associated Service Catalog product
      # provisioning artifact. When you import an existing CloudFormation stack into a portfolio, Service
      # Catalog does not apply the product's associated constraints during the import process. Service
      # Catalog applies the constraints after you call UpdateProvisionedProduct for the provisioned product.
      # The user or role that performs this operation must have the cloudformation:GetTemplate and
      # cloudformation:DescribeStacks IAM policy permissions. You can only import one provisioned product at
      # a time. The product's CloudFormation stack must have the IMPORT_COMPLETE status before you import
      # another.

      def import_as_provisioned_product(
        idempotency_token : String,
        physical_id : String,
        product_id : String,
        provisioned_product_name : String,
        provisioning_artifact_id : String,
        accept_language : String? = nil
      ) : Types::ImportAsProvisionedProductOutput

        input = Types::ImportAsProvisionedProductInput.new(idempotency_token: idempotency_token, physical_id: physical_id, product_id: product_id, provisioned_product_name: provisioned_product_name, provisioning_artifact_id: provisioning_artifact_id, accept_language: accept_language)
        import_as_provisioned_product(input)
      end

      def import_as_provisioned_product(input : Types::ImportAsProvisionedProductInput) : Types::ImportAsProvisionedProductOutput
        request = Protocol::JsonRpc.build_request(Model::IMPORT_AS_PROVISIONED_PRODUCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportAsProvisionedProductOutput, "ImportAsProvisionedProduct")
      end

      # Lists all imported portfolios for which account-to-account shares were accepted by this account. By
      # specifying the PortfolioShareType , you can list portfolios for which organizational shares were
      # accepted by this account.

      def list_accepted_portfolio_shares(
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil,
        portfolio_share_type : String? = nil
      ) : Types::ListAcceptedPortfolioSharesOutput

        input = Types::ListAcceptedPortfolioSharesInput.new(accept_language: accept_language, page_size: page_size, page_token: page_token, portfolio_share_type: portfolio_share_type)
        list_accepted_portfolio_shares(input)
      end

      def list_accepted_portfolio_shares(input : Types::ListAcceptedPortfolioSharesInput) : Types::ListAcceptedPortfolioSharesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCEPTED_PORTFOLIO_SHARES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAcceptedPortfolioSharesOutput, "ListAcceptedPortfolioShares")
      end

      # Lists all the budgets associated to the specified resource.

      def list_budgets_for_resource(
        resource_id : String,
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ListBudgetsForResourceOutput

        input = Types::ListBudgetsForResourceInput.new(resource_id: resource_id, accept_language: accept_language, page_size: page_size, page_token: page_token)
        list_budgets_for_resource(input)
      end

      def list_budgets_for_resource(input : Types::ListBudgetsForResourceInput) : Types::ListBudgetsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_BUDGETS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBudgetsForResourceOutput, "ListBudgetsForResource")
      end

      # Lists the constraints for the specified portfolio and product.

      def list_constraints_for_portfolio(
        portfolio_id : String,
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil,
        product_id : String? = nil
      ) : Types::ListConstraintsForPortfolioOutput

        input = Types::ListConstraintsForPortfolioInput.new(portfolio_id: portfolio_id, accept_language: accept_language, page_size: page_size, page_token: page_token, product_id: product_id)
        list_constraints_for_portfolio(input)
      end

      def list_constraints_for_portfolio(input : Types::ListConstraintsForPortfolioInput) : Types::ListConstraintsForPortfolioOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CONSTRAINTS_FOR_PORTFOLIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListConstraintsForPortfolioOutput, "ListConstraintsForPortfolio")
      end

      # Lists the paths to the specified product. A path describes how the user gets access to a specified
      # product and is necessary when provisioning a product. A path also determines the constraints that
      # are put on a product. A path is dependent on a specific product, porfolio, and principal. When
      # provisioning a product that's been added to a portfolio, you must grant your user, group, or role
      # access to the portfolio. For more information, see Granting users access in the Service Catalog User
      # Guide .

      def list_launch_paths(
        product_id : String,
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ListLaunchPathsOutput

        input = Types::ListLaunchPathsInput.new(product_id: product_id, accept_language: accept_language, page_size: page_size, page_token: page_token)
        list_launch_paths(input)
      end

      def list_launch_paths(input : Types::ListLaunchPathsInput) : Types::ListLaunchPathsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_LAUNCH_PATHS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLaunchPathsOutput, "ListLaunchPaths")
      end

      # Lists the organization nodes that have access to the specified portfolio. This API can only be
      # called by the management account in the organization or by a delegated admin. If a delegated admin
      # is de-registered, they can no longer perform this operation.

      def list_organization_portfolio_access(
        organization_node_type : String,
        portfolio_id : String,
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ListOrganizationPortfolioAccessOutput

        input = Types::ListOrganizationPortfolioAccessInput.new(organization_node_type: organization_node_type, portfolio_id: portfolio_id, accept_language: accept_language, page_size: page_size, page_token: page_token)
        list_organization_portfolio_access(input)
      end

      def list_organization_portfolio_access(input : Types::ListOrganizationPortfolioAccessInput) : Types::ListOrganizationPortfolioAccessOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ORGANIZATION_PORTFOLIO_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOrganizationPortfolioAccessOutput, "ListOrganizationPortfolioAccess")
      end

      # Lists the account IDs that have access to the specified portfolio. A delegated admin can list the
      # accounts that have access to the shared portfolio. Note that if a delegated admin is de-registered,
      # they can no longer perform this operation.

      def list_portfolio_access(
        portfolio_id : String,
        accept_language : String? = nil,
        organization_parent_id : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ListPortfolioAccessOutput

        input = Types::ListPortfolioAccessInput.new(portfolio_id: portfolio_id, accept_language: accept_language, organization_parent_id: organization_parent_id, page_size: page_size, page_token: page_token)
        list_portfolio_access(input)
      end

      def list_portfolio_access(input : Types::ListPortfolioAccessInput) : Types::ListPortfolioAccessOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PORTFOLIO_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPortfolioAccessOutput, "ListPortfolioAccess")
      end

      # Lists all portfolios in the catalog.

      def list_portfolios(
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ListPortfoliosOutput

        input = Types::ListPortfoliosInput.new(accept_language: accept_language, page_size: page_size, page_token: page_token)
        list_portfolios(input)
      end

      def list_portfolios(input : Types::ListPortfoliosInput) : Types::ListPortfoliosOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PORTFOLIOS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPortfoliosOutput, "ListPortfolios")
      end

      # Lists all portfolios that the specified product is associated with.

      def list_portfolios_for_product(
        product_id : String,
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ListPortfoliosForProductOutput

        input = Types::ListPortfoliosForProductInput.new(product_id: product_id, accept_language: accept_language, page_size: page_size, page_token: page_token)
        list_portfolios_for_product(input)
      end

      def list_portfolios_for_product(input : Types::ListPortfoliosForProductInput) : Types::ListPortfoliosForProductOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PORTFOLIOS_FOR_PRODUCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPortfoliosForProductOutput, "ListPortfoliosForProduct")
      end

      # Lists all PrincipalARN s and corresponding PrincipalType s associated with the specified portfolio.

      def list_principals_for_portfolio(
        portfolio_id : String,
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ListPrincipalsForPortfolioOutput

        input = Types::ListPrincipalsForPortfolioInput.new(portfolio_id: portfolio_id, accept_language: accept_language, page_size: page_size, page_token: page_token)
        list_principals_for_portfolio(input)
      end

      def list_principals_for_portfolio(input : Types::ListPrincipalsForPortfolioInput) : Types::ListPrincipalsForPortfolioOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PRINCIPALS_FOR_PORTFOLIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPrincipalsForPortfolioOutput, "ListPrincipalsForPortfolio")
      end

      # Lists the plans for the specified provisioned product or all plans to which the user has access.

      def list_provisioned_product_plans(
        accept_language : String? = nil,
        access_level_filter : Types::AccessLevelFilter? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil,
        provision_product_id : String? = nil
      ) : Types::ListProvisionedProductPlansOutput

        input = Types::ListProvisionedProductPlansInput.new(accept_language: accept_language, access_level_filter: access_level_filter, page_size: page_size, page_token: page_token, provision_product_id: provision_product_id)
        list_provisioned_product_plans(input)
      end

      def list_provisioned_product_plans(input : Types::ListProvisionedProductPlansInput) : Types::ListProvisionedProductPlansOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PROVISIONED_PRODUCT_PLANS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProvisionedProductPlansOutput, "ListProvisionedProductPlans")
      end

      # Lists all provisioning artifacts (also known as versions) for the specified product.

      def list_provisioning_artifacts(
        product_id : String,
        accept_language : String? = nil
      ) : Types::ListProvisioningArtifactsOutput

        input = Types::ListProvisioningArtifactsInput.new(product_id: product_id, accept_language: accept_language)
        list_provisioning_artifacts(input)
      end

      def list_provisioning_artifacts(input : Types::ListProvisioningArtifactsInput) : Types::ListProvisioningArtifactsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PROVISIONING_ARTIFACTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProvisioningArtifactsOutput, "ListProvisioningArtifacts")
      end

      # Lists all provisioning artifacts (also known as versions) for the specified self-service action.

      def list_provisioning_artifacts_for_service_action(
        service_action_id : String,
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ListProvisioningArtifactsForServiceActionOutput

        input = Types::ListProvisioningArtifactsForServiceActionInput.new(service_action_id: service_action_id, accept_language: accept_language, page_size: page_size, page_token: page_token)
        list_provisioning_artifacts_for_service_action(input)
      end

      def list_provisioning_artifacts_for_service_action(input : Types::ListProvisioningArtifactsForServiceActionInput) : Types::ListProvisioningArtifactsForServiceActionOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PROVISIONING_ARTIFACTS_FOR_SERVICE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProvisioningArtifactsForServiceActionOutput, "ListProvisioningArtifactsForServiceAction")
      end

      # Lists the specified requests or all performed requests.

      def list_record_history(
        accept_language : String? = nil,
        access_level_filter : Types::AccessLevelFilter? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil,
        search_filter : Types::ListRecordHistorySearchFilter? = nil
      ) : Types::ListRecordHistoryOutput

        input = Types::ListRecordHistoryInput.new(accept_language: accept_language, access_level_filter: access_level_filter, page_size: page_size, page_token: page_token, search_filter: search_filter)
        list_record_history(input)
      end

      def list_record_history(input : Types::ListRecordHistoryInput) : Types::ListRecordHistoryOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_RECORD_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRecordHistoryOutput, "ListRecordHistory")
      end

      # Lists the resources associated with the specified TagOption.

      def list_resources_for_tag_option(
        tag_option_id : String,
        page_size : Int32? = nil,
        page_token : String? = nil,
        resource_type : String? = nil
      ) : Types::ListResourcesForTagOptionOutput

        input = Types::ListResourcesForTagOptionInput.new(tag_option_id: tag_option_id, page_size: page_size, page_token: page_token, resource_type: resource_type)
        list_resources_for_tag_option(input)
      end

      def list_resources_for_tag_option(input : Types::ListResourcesForTagOptionInput) : Types::ListResourcesForTagOptionOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCES_FOR_TAG_OPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourcesForTagOptionOutput, "ListResourcesForTagOption")
      end

      # Lists all self-service actions.

      def list_service_actions(
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ListServiceActionsOutput

        input = Types::ListServiceActionsInput.new(accept_language: accept_language, page_size: page_size, page_token: page_token)
        list_service_actions(input)
      end

      def list_service_actions(input : Types::ListServiceActionsInput) : Types::ListServiceActionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServiceActionsOutput, "ListServiceActions")
      end

      # Returns a paginated list of self-service actions associated with the specified Product ID and
      # Provisioning Artifact ID.

      def list_service_actions_for_provisioning_artifact(
        product_id : String,
        provisioning_artifact_id : String,
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ListServiceActionsForProvisioningArtifactOutput

        input = Types::ListServiceActionsForProvisioningArtifactInput.new(product_id: product_id, provisioning_artifact_id: provisioning_artifact_id, accept_language: accept_language, page_size: page_size, page_token: page_token)
        list_service_actions_for_provisioning_artifact(input)
      end

      def list_service_actions_for_provisioning_artifact(input : Types::ListServiceActionsForProvisioningArtifactInput) : Types::ListServiceActionsForProvisioningArtifactOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_ACTIONS_FOR_PROVISIONING_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServiceActionsForProvisioningArtifactOutput, "ListServiceActionsForProvisioningArtifact")
      end

      # Returns summary information about stack instances that are associated with the specified
      # CFN_STACKSET type provisioned product. You can filter for stack instances that are associated with a
      # specific Amazon Web Services account name or Region.

      def list_stack_instances_for_provisioned_product(
        provisioned_product_id : String,
        accept_language : String? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ListStackInstancesForProvisionedProductOutput

        input = Types::ListStackInstancesForProvisionedProductInput.new(provisioned_product_id: provisioned_product_id, accept_language: accept_language, page_size: page_size, page_token: page_token)
        list_stack_instances_for_provisioned_product(input)
      end

      def list_stack_instances_for_provisioned_product(input : Types::ListStackInstancesForProvisionedProductInput) : Types::ListStackInstancesForProvisionedProductOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_STACK_INSTANCES_FOR_PROVISIONED_PRODUCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStackInstancesForProvisionedProductOutput, "ListStackInstancesForProvisionedProduct")
      end

      # Lists the specified TagOptions or all TagOptions.

      def list_tag_options(
        filters : Types::ListTagOptionsFilters? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ListTagOptionsOutput

        input = Types::ListTagOptionsInput.new(filters: filters, page_size: page_size, page_token: page_token)
        list_tag_options(input)
      end

      def list_tag_options(input : Types::ListTagOptionsInput) : Types::ListTagOptionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAG_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagOptionsOutput, "ListTagOptions")
      end

      # Notifies the result of the provisioning engine execution.

      def notify_provision_product_engine_workflow_result(
        idempotency_token : String,
        record_id : String,
        status : String,
        workflow_token : String,
        failure_reason : String? = nil,
        outputs : Array(Types::RecordOutput)? = nil,
        resource_identifier : Types::EngineWorkflowResourceIdentifier? = nil
      ) : Types::NotifyProvisionProductEngineWorkflowResultOutput

        input = Types::NotifyProvisionProductEngineWorkflowResultInput.new(idempotency_token: idempotency_token, record_id: record_id, status: status, workflow_token: workflow_token, failure_reason: failure_reason, outputs: outputs, resource_identifier: resource_identifier)
        notify_provision_product_engine_workflow_result(input)
      end

      def notify_provision_product_engine_workflow_result(input : Types::NotifyProvisionProductEngineWorkflowResultInput) : Types::NotifyProvisionProductEngineWorkflowResultOutput
        request = Protocol::JsonRpc.build_request(Model::NOTIFY_PROVISION_PRODUCT_ENGINE_WORKFLOW_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::NotifyProvisionProductEngineWorkflowResultOutput, "NotifyProvisionProductEngineWorkflowResult")
      end

      # Notifies the result of the terminate engine execution.

      def notify_terminate_provisioned_product_engine_workflow_result(
        idempotency_token : String,
        record_id : String,
        status : String,
        workflow_token : String,
        failure_reason : String? = nil
      ) : Types::NotifyTerminateProvisionedProductEngineWorkflowResultOutput

        input = Types::NotifyTerminateProvisionedProductEngineWorkflowResultInput.new(idempotency_token: idempotency_token, record_id: record_id, status: status, workflow_token: workflow_token, failure_reason: failure_reason)
        notify_terminate_provisioned_product_engine_workflow_result(input)
      end

      def notify_terminate_provisioned_product_engine_workflow_result(input : Types::NotifyTerminateProvisionedProductEngineWorkflowResultInput) : Types::NotifyTerminateProvisionedProductEngineWorkflowResultOutput
        request = Protocol::JsonRpc.build_request(Model::NOTIFY_TERMINATE_PROVISIONED_PRODUCT_ENGINE_WORKFLOW_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::NotifyTerminateProvisionedProductEngineWorkflowResultOutput, "NotifyTerminateProvisionedProductEngineWorkflowResult")
      end

      # Notifies the result of the update engine execution.

      def notify_update_provisioned_product_engine_workflow_result(
        idempotency_token : String,
        record_id : String,
        status : String,
        workflow_token : String,
        failure_reason : String? = nil,
        outputs : Array(Types::RecordOutput)? = nil
      ) : Types::NotifyUpdateProvisionedProductEngineWorkflowResultOutput

        input = Types::NotifyUpdateProvisionedProductEngineWorkflowResultInput.new(idempotency_token: idempotency_token, record_id: record_id, status: status, workflow_token: workflow_token, failure_reason: failure_reason, outputs: outputs)
        notify_update_provisioned_product_engine_workflow_result(input)
      end

      def notify_update_provisioned_product_engine_workflow_result(input : Types::NotifyUpdateProvisionedProductEngineWorkflowResultInput) : Types::NotifyUpdateProvisionedProductEngineWorkflowResultOutput
        request = Protocol::JsonRpc.build_request(Model::NOTIFY_UPDATE_PROVISIONED_PRODUCT_ENGINE_WORKFLOW_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::NotifyUpdateProvisionedProductEngineWorkflowResultOutput, "NotifyUpdateProvisionedProductEngineWorkflowResult")
      end

      # Provisions the specified product. A provisioned product is a resourced instance of a product. For
      # example, provisioning a product that's based on an CloudFormation template launches an
      # CloudFormation stack and its underlying resources. You can check the status of this request using
      # DescribeRecord . If the request contains a tag key with an empty list of values, there's a tag
      # conflict for that key. Don't include conflicted keys as tags, or this will cause the error
      # "Parameter validation failed: Missing required parameter in Tags[ N ]: Value ". When provisioning a
      # product that's been added to a portfolio, you must grant your user, group, or role access to the
      # portfolio. For more information, see Granting users access in the Service Catalog User Guide .

      def provision_product(
        provision_token : String,
        provisioned_product_name : String,
        accept_language : String? = nil,
        notification_arns : Array(String)? = nil,
        path_id : String? = nil,
        path_name : String? = nil,
        product_id : String? = nil,
        product_name : String? = nil,
        provisioning_artifact_id : String? = nil,
        provisioning_artifact_name : String? = nil,
        provisioning_parameters : Array(Types::ProvisioningParameter)? = nil,
        provisioning_preferences : Types::ProvisioningPreferences? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ProvisionProductOutput

        input = Types::ProvisionProductInput.new(provision_token: provision_token, provisioned_product_name: provisioned_product_name, accept_language: accept_language, notification_arns: notification_arns, path_id: path_id, path_name: path_name, product_id: product_id, product_name: product_name, provisioning_artifact_id: provisioning_artifact_id, provisioning_artifact_name: provisioning_artifact_name, provisioning_parameters: provisioning_parameters, provisioning_preferences: provisioning_preferences, tags: tags)
        provision_product(input)
      end

      def provision_product(input : Types::ProvisionProductInput) : Types::ProvisionProductOutput
        request = Protocol::JsonRpc.build_request(Model::PROVISION_PRODUCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ProvisionProductOutput, "ProvisionProduct")
      end

      # Rejects an offer to share the specified portfolio.

      def reject_portfolio_share(
        portfolio_id : String,
        accept_language : String? = nil,
        portfolio_share_type : String? = nil
      ) : Types::RejectPortfolioShareOutput

        input = Types::RejectPortfolioShareInput.new(portfolio_id: portfolio_id, accept_language: accept_language, portfolio_share_type: portfolio_share_type)
        reject_portfolio_share(input)
      end

      def reject_portfolio_share(input : Types::RejectPortfolioShareInput) : Types::RejectPortfolioShareOutput
        request = Protocol::JsonRpc.build_request(Model::REJECT_PORTFOLIO_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RejectPortfolioShareOutput, "RejectPortfolioShare")
      end

      # Lists the provisioned products that are available (not terminated). To use additional filtering, see
      # SearchProvisionedProducts .

      def scan_provisioned_products(
        accept_language : String? = nil,
        access_level_filter : Types::AccessLevelFilter? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil
      ) : Types::ScanProvisionedProductsOutput

        input = Types::ScanProvisionedProductsInput.new(accept_language: accept_language, access_level_filter: access_level_filter, page_size: page_size, page_token: page_token)
        scan_provisioned_products(input)
      end

      def scan_provisioned_products(input : Types::ScanProvisionedProductsInput) : Types::ScanProvisionedProductsOutput
        request = Protocol::JsonRpc.build_request(Model::SCAN_PROVISIONED_PRODUCTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ScanProvisionedProductsOutput, "ScanProvisionedProducts")
      end

      # Gets information about the products to which the caller has access.

      def search_products(
        accept_language : String? = nil,
        filters : Hash(String, Array(String))? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::SearchProductsOutput

        input = Types::SearchProductsInput.new(accept_language: accept_language, filters: filters, page_size: page_size, page_token: page_token, sort_by: sort_by, sort_order: sort_order)
        search_products(input)
      end

      def search_products(input : Types::SearchProductsInput) : Types::SearchProductsOutput
        request = Protocol::JsonRpc.build_request(Model::SEARCH_PRODUCTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchProductsOutput, "SearchProducts")
      end

      # Gets information about the products for the specified portfolio or all products.

      def search_products_as_admin(
        accept_language : String? = nil,
        filters : Hash(String, Array(String))? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil,
        portfolio_id : String? = nil,
        product_source : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::SearchProductsAsAdminOutput

        input = Types::SearchProductsAsAdminInput.new(accept_language: accept_language, filters: filters, page_size: page_size, page_token: page_token, portfolio_id: portfolio_id, product_source: product_source, sort_by: sort_by, sort_order: sort_order)
        search_products_as_admin(input)
      end

      def search_products_as_admin(input : Types::SearchProductsAsAdminInput) : Types::SearchProductsAsAdminOutput
        request = Protocol::JsonRpc.build_request(Model::SEARCH_PRODUCTS_AS_ADMIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchProductsAsAdminOutput, "SearchProductsAsAdmin")
      end

      # Gets information about the provisioned products that meet the specified criteria.

      def search_provisioned_products(
        accept_language : String? = nil,
        access_level_filter : Types::AccessLevelFilter? = nil,
        filters : Hash(String, Array(String))? = nil,
        page_size : Int32? = nil,
        page_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::SearchProvisionedProductsOutput

        input = Types::SearchProvisionedProductsInput.new(accept_language: accept_language, access_level_filter: access_level_filter, filters: filters, page_size: page_size, page_token: page_token, sort_by: sort_by, sort_order: sort_order)
        search_provisioned_products(input)
      end

      def search_provisioned_products(input : Types::SearchProvisionedProductsInput) : Types::SearchProvisionedProductsOutput
        request = Protocol::JsonRpc.build_request(Model::SEARCH_PROVISIONED_PRODUCTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchProvisionedProductsOutput, "SearchProvisionedProducts")
      end

      # Terminates the specified provisioned product. This operation does not delete any records associated
      # with the provisioned product. You can check the status of this request using DescribeRecord .

      def terminate_provisioned_product(
        terminate_token : String,
        accept_language : String? = nil,
        ignore_errors : Bool? = nil,
        provisioned_product_id : String? = nil,
        provisioned_product_name : String? = nil,
        retain_physical_resources : Bool? = nil
      ) : Types::TerminateProvisionedProductOutput

        input = Types::TerminateProvisionedProductInput.new(terminate_token: terminate_token, accept_language: accept_language, ignore_errors: ignore_errors, provisioned_product_id: provisioned_product_id, provisioned_product_name: provisioned_product_name, retain_physical_resources: retain_physical_resources)
        terminate_provisioned_product(input)
      end

      def terminate_provisioned_product(input : Types::TerminateProvisionedProductInput) : Types::TerminateProvisionedProductOutput
        request = Protocol::JsonRpc.build_request(Model::TERMINATE_PROVISIONED_PRODUCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TerminateProvisionedProductOutput, "TerminateProvisionedProduct")
      end

      # Updates the specified constraint.

      def update_constraint(
        id : String,
        accept_language : String? = nil,
        description : String? = nil,
        parameters : String? = nil
      ) : Types::UpdateConstraintOutput

        input = Types::UpdateConstraintInput.new(id: id, accept_language: accept_language, description: description, parameters: parameters)
        update_constraint(input)
      end

      def update_constraint(input : Types::UpdateConstraintInput) : Types::UpdateConstraintOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONSTRAINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateConstraintOutput, "UpdateConstraint")
      end

      # Updates the specified portfolio. You cannot update a product that was shared with you.

      def update_portfolio(
        id : String,
        accept_language : String? = nil,
        add_tags : Array(Types::Tag)? = nil,
        description : String? = nil,
        display_name : String? = nil,
        provider_name : String? = nil,
        remove_tags : Array(String)? = nil
      ) : Types::UpdatePortfolioOutput

        input = Types::UpdatePortfolioInput.new(id: id, accept_language: accept_language, add_tags: add_tags, description: description, display_name: display_name, provider_name: provider_name, remove_tags: remove_tags)
        update_portfolio(input)
      end

      def update_portfolio(input : Types::UpdatePortfolioInput) : Types::UpdatePortfolioOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PORTFOLIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePortfolioOutput, "UpdatePortfolio")
      end

      # Updates the specified portfolio share. You can use this API to enable or disable TagOptions sharing
      # or Principal sharing for an existing portfolio share. The portfolio share cannot be updated if the
      # CreatePortfolioShare operation is IN_PROGRESS , as the share is not available to recipient entities.
      # In this case, you must wait for the portfolio share to be completed. You must provide the accountId
      # or organization node in the input, but not both. If the portfolio is shared to both an external
      # account and an organization node, and both shares need to be updated, you must invoke
      # UpdatePortfolioShare separately for each share type. This API cannot be used for removing the
      # portfolio share. You must use DeletePortfolioShare API for that action. When you associate a
      # principal with portfolio, a potential privilege escalation path may occur when that portfolio is
      # then shared with other accounts. For a user in a recipient account who is not an Service Catalog
      # Admin, but still has the ability to create Principals (Users/Groups/Roles), that user could create a
      # role that matches a principal name association for the portfolio. Although this user may not know
      # which principal names are associated through Service Catalog, they may be able to guess the user. If
      # this potential escalation path is a concern, then Service Catalog recommends using PrincipalType as
      # IAM . With this configuration, the PrincipalARN must already exist in the recipient account before
      # it can be associated.

      def update_portfolio_share(
        portfolio_id : String,
        accept_language : String? = nil,
        account_id : String? = nil,
        organization_node : Types::OrganizationNode? = nil,
        share_principals : Bool? = nil,
        share_tag_options : Bool? = nil
      ) : Types::UpdatePortfolioShareOutput

        input = Types::UpdatePortfolioShareInput.new(portfolio_id: portfolio_id, accept_language: accept_language, account_id: account_id, organization_node: organization_node, share_principals: share_principals, share_tag_options: share_tag_options)
        update_portfolio_share(input)
      end

      def update_portfolio_share(input : Types::UpdatePortfolioShareInput) : Types::UpdatePortfolioShareOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PORTFOLIO_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePortfolioShareOutput, "UpdatePortfolioShare")
      end

      # Updates the specified product.

      def update_product(
        id : String,
        accept_language : String? = nil,
        add_tags : Array(Types::Tag)? = nil,
        description : String? = nil,
        distributor : String? = nil,
        name : String? = nil,
        owner : String? = nil,
        remove_tags : Array(String)? = nil,
        source_connection : Types::SourceConnection? = nil,
        support_description : String? = nil,
        support_email : String? = nil,
        support_url : String? = nil
      ) : Types::UpdateProductOutput

        input = Types::UpdateProductInput.new(id: id, accept_language: accept_language, add_tags: add_tags, description: description, distributor: distributor, name: name, owner: owner, remove_tags: remove_tags, source_connection: source_connection, support_description: support_description, support_email: support_email, support_url: support_url)
        update_product(input)
      end

      def update_product(input : Types::UpdateProductInput) : Types::UpdateProductOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PRODUCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProductOutput, "UpdateProduct")
      end

      # Requests updates to the configuration of the specified provisioned product. If there are tags
      # associated with the object, they cannot be updated or added. Depending on the specific updates
      # requested, this operation can update with no interruption, with some interruption, or replace the
      # provisioned product entirely. You can check the status of this request using DescribeRecord .

      def update_provisioned_product(
        update_token : String,
        accept_language : String? = nil,
        path_id : String? = nil,
        path_name : String? = nil,
        product_id : String? = nil,
        product_name : String? = nil,
        provisioned_product_id : String? = nil,
        provisioned_product_name : String? = nil,
        provisioning_artifact_id : String? = nil,
        provisioning_artifact_name : String? = nil,
        provisioning_parameters : Array(Types::UpdateProvisioningParameter)? = nil,
        provisioning_preferences : Types::UpdateProvisioningPreferences? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::UpdateProvisionedProductOutput

        input = Types::UpdateProvisionedProductInput.new(update_token: update_token, accept_language: accept_language, path_id: path_id, path_name: path_name, product_id: product_id, product_name: product_name, provisioned_product_id: provisioned_product_id, provisioned_product_name: provisioned_product_name, provisioning_artifact_id: provisioning_artifact_id, provisioning_artifact_name: provisioning_artifact_name, provisioning_parameters: provisioning_parameters, provisioning_preferences: provisioning_preferences, tags: tags)
        update_provisioned_product(input)
      end

      def update_provisioned_product(input : Types::UpdateProvisionedProductInput) : Types::UpdateProvisionedProductOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROVISIONED_PRODUCT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProvisionedProductOutput, "UpdateProvisionedProduct")
      end

      # Requests updates to the properties of the specified provisioned product.

      def update_provisioned_product_properties(
        idempotency_token : String,
        provisioned_product_id : String,
        provisioned_product_properties : Hash(String, String),
        accept_language : String? = nil
      ) : Types::UpdateProvisionedProductPropertiesOutput

        input = Types::UpdateProvisionedProductPropertiesInput.new(idempotency_token: idempotency_token, provisioned_product_id: provisioned_product_id, provisioned_product_properties: provisioned_product_properties, accept_language: accept_language)
        update_provisioned_product_properties(input)
      end

      def update_provisioned_product_properties(input : Types::UpdateProvisionedProductPropertiesInput) : Types::UpdateProvisionedProductPropertiesOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROVISIONED_PRODUCT_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProvisionedProductPropertiesOutput, "UpdateProvisionedProductProperties")
      end

      # Updates the specified provisioning artifact (also known as a version) for the specified product. You
      # cannot update a provisioning artifact for a product that was shared with you.

      def update_provisioning_artifact(
        product_id : String,
        provisioning_artifact_id : String,
        accept_language : String? = nil,
        active : Bool? = nil,
        description : String? = nil,
        guidance : String? = nil,
        name : String? = nil
      ) : Types::UpdateProvisioningArtifactOutput

        input = Types::UpdateProvisioningArtifactInput.new(product_id: product_id, provisioning_artifact_id: provisioning_artifact_id, accept_language: accept_language, active: active, description: description, guidance: guidance, name: name)
        update_provisioning_artifact(input)
      end

      def update_provisioning_artifact(input : Types::UpdateProvisioningArtifactInput) : Types::UpdateProvisioningArtifactOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROVISIONING_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProvisioningArtifactOutput, "UpdateProvisioningArtifact")
      end

      # Updates a self-service action.

      def update_service_action(
        id : String,
        accept_language : String? = nil,
        definition : Hash(String, String)? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Types::UpdateServiceActionOutput

        input = Types::UpdateServiceActionInput.new(id: id, accept_language: accept_language, definition: definition, description: description, name: name)
        update_service_action(input)
      end

      def update_service_action(input : Types::UpdateServiceActionInput) : Types::UpdateServiceActionOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceActionOutput, "UpdateServiceAction")
      end

      # Updates the specified TagOption.

      def update_tag_option(
        id : String,
        active : Bool? = nil,
        value : String? = nil
      ) : Types::UpdateTagOptionOutput

        input = Types::UpdateTagOptionInput.new(id: id, active: active, value: value)
        update_tag_option(input)
      end

      def update_tag_option(input : Types::UpdateTagOptionInput) : Types::UpdateTagOptionOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TAG_OPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTagOptionOutput, "UpdateTagOption")
      end
    end
  end
end
