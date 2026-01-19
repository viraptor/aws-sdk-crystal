module AwsSdk
  module ServiceCatalog
    module Model
      API_VERSION = "2015-12-10"
      TARGET_PREFIX = "AWS242ServiceCatalogService"
      SIGNING_NAME = "servicecatalog"
      ENDPOINT_PREFIX = "servicecatalog"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://servicecatalog-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://servicecatalog-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://servicecatalog.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://servicecatalog.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_PORTFOLIO_SHARE = OperationModel.new(
        name: "AcceptPortfolioShare",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_BUDGET_WITH_RESOURCE = OperationModel.new(
        name: "AssociateBudgetWithResource",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_PRINCIPAL_WITH_PORTFOLIO = OperationModel.new(
        name: "AssociatePrincipalWithPortfolio",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_PRODUCT_WITH_PORTFOLIO = OperationModel.new(
        name: "AssociateProductWithPortfolio",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_SERVICE_ACTION_WITH_PROVISIONING_ARTIFACT = OperationModel.new(
        name: "AssociateServiceActionWithProvisioningArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_TAG_OPTION_WITH_RESOURCE = OperationModel.new(
        name: "AssociateTagOptionWithResource",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_ASSOCIATE_SERVICE_ACTION_WITH_PROVISIONING_ARTIFACT = OperationModel.new(
        name: "BatchAssociateServiceActionWithProvisioningArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DISASSOCIATE_SERVICE_ACTION_FROM_PROVISIONING_ARTIFACT = OperationModel.new(
        name: "BatchDisassociateServiceActionFromProvisioningArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_PRODUCT = OperationModel.new(
        name: "CopyProduct",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONSTRAINT = OperationModel.new(
        name: "CreateConstraint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PORTFOLIO = OperationModel.new(
        name: "CreatePortfolio",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PORTFOLIO_SHARE = OperationModel.new(
        name: "CreatePortfolioShare",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PRODUCT = OperationModel.new(
        name: "CreateProduct",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROVISIONED_PRODUCT_PLAN = OperationModel.new(
        name: "CreateProvisionedProductPlan",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROVISIONING_ARTIFACT = OperationModel.new(
        name: "CreateProvisioningArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVICE_ACTION = OperationModel.new(
        name: "CreateServiceAction",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TAG_OPTION = OperationModel.new(
        name: "CreateTagOption",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONSTRAINT = OperationModel.new(
        name: "DeleteConstraint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PORTFOLIO = OperationModel.new(
        name: "DeletePortfolio",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PORTFOLIO_SHARE = OperationModel.new(
        name: "DeletePortfolioShare",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PRODUCT = OperationModel.new(
        name: "DeleteProduct",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROVISIONED_PRODUCT_PLAN = OperationModel.new(
        name: "DeleteProvisionedProductPlan",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROVISIONING_ARTIFACT = OperationModel.new(
        name: "DeleteProvisioningArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE_ACTION = OperationModel.new(
        name: "DeleteServiceAction",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TAG_OPTION = OperationModel.new(
        name: "DeleteTagOption",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONSTRAINT = OperationModel.new(
        name: "DescribeConstraint",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COPY_PRODUCT_STATUS = OperationModel.new(
        name: "DescribeCopyProductStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PORTFOLIO = OperationModel.new(
        name: "DescribePortfolio",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PORTFOLIO_SHARE_STATUS = OperationModel.new(
        name: "DescribePortfolioShareStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PORTFOLIO_SHARES = OperationModel.new(
        name: "DescribePortfolioShares",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PRODUCT = OperationModel.new(
        name: "DescribeProduct",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PRODUCT_AS_ADMIN = OperationModel.new(
        name: "DescribeProductAsAdmin",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PRODUCT_VIEW = OperationModel.new(
        name: "DescribeProductView",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROVISIONED_PRODUCT = OperationModel.new(
        name: "DescribeProvisionedProduct",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROVISIONED_PRODUCT_PLAN = OperationModel.new(
        name: "DescribeProvisionedProductPlan",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROVISIONING_ARTIFACT = OperationModel.new(
        name: "DescribeProvisioningArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROVISIONING_PARAMETERS = OperationModel.new(
        name: "DescribeProvisioningParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RECORD = OperationModel.new(
        name: "DescribeRecord",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVICE_ACTION = OperationModel.new(
        name: "DescribeServiceAction",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVICE_ACTION_EXECUTION_PARAMETERS = OperationModel.new(
        name: "DescribeServiceActionExecutionParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAG_OPTION = OperationModel.new(
        name: "DescribeTagOption",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_AWS_ORGANIZATIONS_ACCESS = OperationModel.new(
        name: "DisableAWSOrganizationsAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_BUDGET_FROM_RESOURCE = OperationModel.new(
        name: "DisassociateBudgetFromResource",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_PRINCIPAL_FROM_PORTFOLIO = OperationModel.new(
        name: "DisassociatePrincipalFromPortfolio",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_PRODUCT_FROM_PORTFOLIO = OperationModel.new(
        name: "DisassociateProductFromPortfolio",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_SERVICE_ACTION_FROM_PROVISIONING_ARTIFACT = OperationModel.new(
        name: "DisassociateServiceActionFromProvisioningArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_TAG_OPTION_FROM_RESOURCE = OperationModel.new(
        name: "DisassociateTagOptionFromResource",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_AWS_ORGANIZATIONS_ACCESS = OperationModel.new(
        name: "EnableAWSOrganizationsAccess",
        http_method: "POST",
        request_uri: "/"
      )

      EXECUTE_PROVISIONED_PRODUCT_PLAN = OperationModel.new(
        name: "ExecuteProvisionedProductPlan",
        http_method: "POST",
        request_uri: "/"
      )

      EXECUTE_PROVISIONED_PRODUCT_SERVICE_ACTION = OperationModel.new(
        name: "ExecuteProvisionedProductServiceAction",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AWS_ORGANIZATIONS_ACCESS_STATUS = OperationModel.new(
        name: "GetAWSOrganizationsAccessStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PROVISIONED_PRODUCT_OUTPUTS = OperationModel.new(
        name: "GetProvisionedProductOutputs",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_AS_PROVISIONED_PRODUCT = OperationModel.new(
        name: "ImportAsProvisionedProduct",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCEPTED_PORTFOLIO_SHARES = OperationModel.new(
        name: "ListAcceptedPortfolioShares",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BUDGETS_FOR_RESOURCE = OperationModel.new(
        name: "ListBudgetsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONSTRAINTS_FOR_PORTFOLIO = OperationModel.new(
        name: "ListConstraintsForPortfolio",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LAUNCH_PATHS = OperationModel.new(
        name: "ListLaunchPaths",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ORGANIZATION_PORTFOLIO_ACCESS = OperationModel.new(
        name: "ListOrganizationPortfolioAccess",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PORTFOLIO_ACCESS = OperationModel.new(
        name: "ListPortfolioAccess",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PORTFOLIOS = OperationModel.new(
        name: "ListPortfolios",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PORTFOLIOS_FOR_PRODUCT = OperationModel.new(
        name: "ListPortfoliosForProduct",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PRINCIPALS_FOR_PORTFOLIO = OperationModel.new(
        name: "ListPrincipalsForPortfolio",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROVISIONED_PRODUCT_PLANS = OperationModel.new(
        name: "ListProvisionedProductPlans",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROVISIONING_ARTIFACTS = OperationModel.new(
        name: "ListProvisioningArtifacts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROVISIONING_ARTIFACTS_FOR_SERVICE_ACTION = OperationModel.new(
        name: "ListProvisioningArtifactsForServiceAction",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECORD_HISTORY = OperationModel.new(
        name: "ListRecordHistory",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCES_FOR_TAG_OPTION = OperationModel.new(
        name: "ListResourcesForTagOption",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_ACTIONS = OperationModel.new(
        name: "ListServiceActions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_ACTIONS_FOR_PROVISIONING_ARTIFACT = OperationModel.new(
        name: "ListServiceActionsForProvisioningArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STACK_INSTANCES_FOR_PROVISIONED_PRODUCT = OperationModel.new(
        name: "ListStackInstancesForProvisionedProduct",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAG_OPTIONS = OperationModel.new(
        name: "ListTagOptions",
        http_method: "POST",
        request_uri: "/"
      )

      NOTIFY_PROVISION_PRODUCT_ENGINE_WORKFLOW_RESULT = OperationModel.new(
        name: "NotifyProvisionProductEngineWorkflowResult",
        http_method: "POST",
        request_uri: "/"
      )

      NOTIFY_TERMINATE_PROVISIONED_PRODUCT_ENGINE_WORKFLOW_RESULT = OperationModel.new(
        name: "NotifyTerminateProvisionedProductEngineWorkflowResult",
        http_method: "POST",
        request_uri: "/"
      )

      NOTIFY_UPDATE_PROVISIONED_PRODUCT_ENGINE_WORKFLOW_RESULT = OperationModel.new(
        name: "NotifyUpdateProvisionedProductEngineWorkflowResult",
        http_method: "POST",
        request_uri: "/"
      )

      PROVISION_PRODUCT = OperationModel.new(
        name: "ProvisionProduct",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_PORTFOLIO_SHARE = OperationModel.new(
        name: "RejectPortfolioShare",
        http_method: "POST",
        request_uri: "/"
      )

      SCAN_PROVISIONED_PRODUCTS = OperationModel.new(
        name: "ScanProvisionedProducts",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_PRODUCTS = OperationModel.new(
        name: "SearchProducts",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_PRODUCTS_AS_ADMIN = OperationModel.new(
        name: "SearchProductsAsAdmin",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_PROVISIONED_PRODUCTS = OperationModel.new(
        name: "SearchProvisionedProducts",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_PROVISIONED_PRODUCT = OperationModel.new(
        name: "TerminateProvisionedProduct",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONSTRAINT = OperationModel.new(
        name: "UpdateConstraint",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PORTFOLIO = OperationModel.new(
        name: "UpdatePortfolio",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PORTFOLIO_SHARE = OperationModel.new(
        name: "UpdatePortfolioShare",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PRODUCT = OperationModel.new(
        name: "UpdateProduct",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROVISIONED_PRODUCT = OperationModel.new(
        name: "UpdateProvisionedProduct",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROVISIONED_PRODUCT_PROPERTIES = OperationModel.new(
        name: "UpdateProvisionedProductProperties",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROVISIONING_ARTIFACT = OperationModel.new(
        name: "UpdateProvisioningArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_ACTION = OperationModel.new(
        name: "UpdateServiceAction",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TAG_OPTION = OperationModel.new(
        name: "UpdateTagOption",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
