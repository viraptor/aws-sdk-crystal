module Aws
  module ApiGatewayV2
    module Model
      API_VERSION = "2018-11-29"
      TARGET_PREFIX = ""
      SIGNING_NAME = "apigateway"
      ENDPOINT_PREFIX = "apigateway"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://apigateway-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://apigateway-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://apigateway.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://apigateway.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_API = OperationModel.new(
        name: "CreateApi",
        http_method: "POST",
        request_uri: "/v2/apis"
      )

      CREATE_API_MAPPING = OperationModel.new(
        name: "CreateApiMapping",
        http_method: "POST",
        request_uri: "/v2/domainnames/{domainName}/apimappings"
      )

      CREATE_AUTHORIZER = OperationModel.new(
        name: "CreateAuthorizer",
        http_method: "POST",
        request_uri: "/v2/apis/{apiId}/authorizers"
      )

      CREATE_DEPLOYMENT = OperationModel.new(
        name: "CreateDeployment",
        http_method: "POST",
        request_uri: "/v2/apis/{apiId}/deployments"
      )

      CREATE_DOMAIN_NAME = OperationModel.new(
        name: "CreateDomainName",
        http_method: "POST",
        request_uri: "/v2/domainnames"
      )

      CREATE_INTEGRATION = OperationModel.new(
        name: "CreateIntegration",
        http_method: "POST",
        request_uri: "/v2/apis/{apiId}/integrations"
      )

      CREATE_INTEGRATION_RESPONSE = OperationModel.new(
        name: "CreateIntegrationResponse",
        http_method: "POST",
        request_uri: "/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses"
      )

      CREATE_MODEL = OperationModel.new(
        name: "CreateModel",
        http_method: "POST",
        request_uri: "/v2/apis/{apiId}/models"
      )

      CREATE_PORTAL = OperationModel.new(
        name: "CreatePortal",
        http_method: "POST",
        request_uri: "/v2/portals"
      )

      CREATE_PORTAL_PRODUCT = OperationModel.new(
        name: "CreatePortalProduct",
        http_method: "POST",
        request_uri: "/v2/portalproducts"
      )

      CREATE_PRODUCT_PAGE = OperationModel.new(
        name: "CreateProductPage",
        http_method: "POST",
        request_uri: "/v2/portalproducts/{portalProductId}/productpages"
      )

      CREATE_PRODUCT_REST_ENDPOINT_PAGE = OperationModel.new(
        name: "CreateProductRestEndpointPage",
        http_method: "POST",
        request_uri: "/v2/portalproducts/{portalProductId}/productrestendpointpages"
      )

      CREATE_ROUTE = OperationModel.new(
        name: "CreateRoute",
        http_method: "POST",
        request_uri: "/v2/apis/{apiId}/routes"
      )

      CREATE_ROUTE_RESPONSE = OperationModel.new(
        name: "CreateRouteResponse",
        http_method: "POST",
        request_uri: "/v2/apis/{apiId}/routes/{routeId}/routeresponses"
      )

      CREATE_ROUTING_RULE = OperationModel.new(
        name: "CreateRoutingRule",
        http_method: "POST",
        request_uri: "/v2/domainnames/{domainName}/routingrules"
      )

      CREATE_STAGE = OperationModel.new(
        name: "CreateStage",
        http_method: "POST",
        request_uri: "/v2/apis/{apiId}/stages"
      )

      CREATE_VPC_LINK = OperationModel.new(
        name: "CreateVpcLink",
        http_method: "POST",
        request_uri: "/v2/vpclinks"
      )

      DELETE_ACCESS_LOG_SETTINGS = OperationModel.new(
        name: "DeleteAccessLogSettings",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/stages/{stageName}/accesslogsettings"
      )

      DELETE_API = OperationModel.new(
        name: "DeleteApi",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}"
      )

      DELETE_API_MAPPING = OperationModel.new(
        name: "DeleteApiMapping",
        http_method: "DELETE",
        request_uri: "/v2/domainnames/{domainName}/apimappings/{apiMappingId}"
      )

      DELETE_AUTHORIZER = OperationModel.new(
        name: "DeleteAuthorizer",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/authorizers/{authorizerId}"
      )

      DELETE_CORS_CONFIGURATION = OperationModel.new(
        name: "DeleteCorsConfiguration",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/cors"
      )

      DELETE_DEPLOYMENT = OperationModel.new(
        name: "DeleteDeployment",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/deployments/{deploymentId}"
      )

      DELETE_DOMAIN_NAME = OperationModel.new(
        name: "DeleteDomainName",
        http_method: "DELETE",
        request_uri: "/v2/domainnames/{domainName}"
      )

      DELETE_INTEGRATION = OperationModel.new(
        name: "DeleteIntegration",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/integrations/{integrationId}"
      )

      DELETE_INTEGRATION_RESPONSE = OperationModel.new(
        name: "DeleteIntegrationResponse",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses/{integrationResponseId}"
      )

      DELETE_MODEL = OperationModel.new(
        name: "DeleteModel",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/models/{modelId}"
      )

      DELETE_PORTAL = OperationModel.new(
        name: "DeletePortal",
        http_method: "DELETE",
        request_uri: "/v2/portals/{portalId}"
      )

      DELETE_PORTAL_PRODUCT = OperationModel.new(
        name: "DeletePortalProduct",
        http_method: "DELETE",
        request_uri: "/v2/portalproducts/{portalProductId}"
      )

      DELETE_PORTAL_PRODUCT_SHARING_POLICY = OperationModel.new(
        name: "DeletePortalProductSharingPolicy",
        http_method: "DELETE",
        request_uri: "/v2/portalproducts/{portalProductId}/sharingpolicy"
      )

      DELETE_PRODUCT_PAGE = OperationModel.new(
        name: "DeleteProductPage",
        http_method: "DELETE",
        request_uri: "/v2/portalproducts/{portalProductId}/productpages/{productPageId}"
      )

      DELETE_PRODUCT_REST_ENDPOINT_PAGE = OperationModel.new(
        name: "DeleteProductRestEndpointPage",
        http_method: "DELETE",
        request_uri: "/v2/portalproducts/{portalProductId}/productrestendpointpages/{productRestEndpointPageId}"
      )

      DELETE_ROUTE = OperationModel.new(
        name: "DeleteRoute",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/routes/{routeId}"
      )

      DELETE_ROUTE_REQUEST_PARAMETER = OperationModel.new(
        name: "DeleteRouteRequestParameter",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/routes/{routeId}/requestparameters/{requestParameterKey}"
      )

      DELETE_ROUTE_RESPONSE = OperationModel.new(
        name: "DeleteRouteResponse",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/routes/{routeId}/routeresponses/{routeResponseId}"
      )

      DELETE_ROUTE_SETTINGS = OperationModel.new(
        name: "DeleteRouteSettings",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/stages/{stageName}/routesettings/{routeKey}"
      )

      DELETE_ROUTING_RULE = OperationModel.new(
        name: "DeleteRoutingRule",
        http_method: "DELETE",
        request_uri: "/v2/domainnames/{domainName}/routingrules/{routingRuleId}"
      )

      DELETE_STAGE = OperationModel.new(
        name: "DeleteStage",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/stages/{stageName}"
      )

      DELETE_VPC_LINK = OperationModel.new(
        name: "DeleteVpcLink",
        http_method: "DELETE",
        request_uri: "/v2/vpclinks/{vpcLinkId}"
      )

      DISABLE_PORTAL = OperationModel.new(
        name: "DisablePortal",
        http_method: "DELETE",
        request_uri: "/v2/portals/{portalId}/publish"
      )

      EXPORT_API = OperationModel.new(
        name: "ExportApi",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/exports/{specification}"
      )

      GET_API = OperationModel.new(
        name: "GetApi",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}"
      )

      GET_API_MAPPING = OperationModel.new(
        name: "GetApiMapping",
        http_method: "GET",
        request_uri: "/v2/domainnames/{domainName}/apimappings/{apiMappingId}"
      )

      GET_API_MAPPINGS = OperationModel.new(
        name: "GetApiMappings",
        http_method: "GET",
        request_uri: "/v2/domainnames/{domainName}/apimappings"
      )

      GET_APIS = OperationModel.new(
        name: "GetApis",
        http_method: "GET",
        request_uri: "/v2/apis"
      )

      GET_AUTHORIZER = OperationModel.new(
        name: "GetAuthorizer",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/authorizers/{authorizerId}"
      )

      GET_AUTHORIZERS = OperationModel.new(
        name: "GetAuthorizers",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/authorizers"
      )

      GET_DEPLOYMENT = OperationModel.new(
        name: "GetDeployment",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/deployments/{deploymentId}"
      )

      GET_DEPLOYMENTS = OperationModel.new(
        name: "GetDeployments",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/deployments"
      )

      GET_DOMAIN_NAME = OperationModel.new(
        name: "GetDomainName",
        http_method: "GET",
        request_uri: "/v2/domainnames/{domainName}"
      )

      GET_DOMAIN_NAMES = OperationModel.new(
        name: "GetDomainNames",
        http_method: "GET",
        request_uri: "/v2/domainnames"
      )

      GET_INTEGRATION = OperationModel.new(
        name: "GetIntegration",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/integrations/{integrationId}"
      )

      GET_INTEGRATION_RESPONSE = OperationModel.new(
        name: "GetIntegrationResponse",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses/{integrationResponseId}"
      )

      GET_INTEGRATION_RESPONSES = OperationModel.new(
        name: "GetIntegrationResponses",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses"
      )

      GET_INTEGRATIONS = OperationModel.new(
        name: "GetIntegrations",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/integrations"
      )

      GET_MODEL = OperationModel.new(
        name: "GetModel",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/models/{modelId}"
      )

      GET_MODEL_TEMPLATE = OperationModel.new(
        name: "GetModelTemplate",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/models/{modelId}/template"
      )

      GET_MODELS = OperationModel.new(
        name: "GetModels",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/models"
      )

      GET_PORTAL = OperationModel.new(
        name: "GetPortal",
        http_method: "GET",
        request_uri: "/v2/portals/{portalId}"
      )

      GET_PORTAL_PRODUCT = OperationModel.new(
        name: "GetPortalProduct",
        http_method: "GET",
        request_uri: "/v2/portalproducts/{portalProductId}"
      )

      GET_PORTAL_PRODUCT_SHARING_POLICY = OperationModel.new(
        name: "GetPortalProductSharingPolicy",
        http_method: "GET",
        request_uri: "/v2/portalproducts/{portalProductId}/sharingpolicy"
      )

      GET_PRODUCT_PAGE = OperationModel.new(
        name: "GetProductPage",
        http_method: "GET",
        request_uri: "/v2/portalproducts/{portalProductId}/productpages/{productPageId}"
      )

      GET_PRODUCT_REST_ENDPOINT_PAGE = OperationModel.new(
        name: "GetProductRestEndpointPage",
        http_method: "GET",
        request_uri: "/v2/portalproducts/{portalProductId}/productrestendpointpages/{productRestEndpointPageId}"
      )

      GET_ROUTE = OperationModel.new(
        name: "GetRoute",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/routes/{routeId}"
      )

      GET_ROUTE_RESPONSE = OperationModel.new(
        name: "GetRouteResponse",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/routes/{routeId}/routeresponses/{routeResponseId}"
      )

      GET_ROUTE_RESPONSES = OperationModel.new(
        name: "GetRouteResponses",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/routes/{routeId}/routeresponses"
      )

      GET_ROUTES = OperationModel.new(
        name: "GetRoutes",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/routes"
      )

      GET_ROUTING_RULE = OperationModel.new(
        name: "GetRoutingRule",
        http_method: "GET",
        request_uri: "/v2/domainnames/{domainName}/routingrules/{routingRuleId}"
      )

      GET_STAGE = OperationModel.new(
        name: "GetStage",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/stages/{stageName}"
      )

      GET_STAGES = OperationModel.new(
        name: "GetStages",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/stages"
      )

      GET_TAGS = OperationModel.new(
        name: "GetTags",
        http_method: "GET",
        request_uri: "/v2/tags/{resource-arn}"
      )

      GET_VPC_LINK = OperationModel.new(
        name: "GetVpcLink",
        http_method: "GET",
        request_uri: "/v2/vpclinks/{vpcLinkId}"
      )

      GET_VPC_LINKS = OperationModel.new(
        name: "GetVpcLinks",
        http_method: "GET",
        request_uri: "/v2/vpclinks"
      )

      IMPORT_API = OperationModel.new(
        name: "ImportApi",
        http_method: "PUT",
        request_uri: "/v2/apis"
      )

      LIST_PORTAL_PRODUCTS = OperationModel.new(
        name: "ListPortalProducts",
        http_method: "GET",
        request_uri: "/v2/portalproducts"
      )

      LIST_PORTALS = OperationModel.new(
        name: "ListPortals",
        http_method: "GET",
        request_uri: "/v2/portals"
      )

      LIST_PRODUCT_PAGES = OperationModel.new(
        name: "ListProductPages",
        http_method: "GET",
        request_uri: "/v2/portalproducts/{portalProductId}/productpages"
      )

      LIST_PRODUCT_REST_ENDPOINT_PAGES = OperationModel.new(
        name: "ListProductRestEndpointPages",
        http_method: "GET",
        request_uri: "/v2/portalproducts/{portalProductId}/productrestendpointpages"
      )

      LIST_ROUTING_RULES = OperationModel.new(
        name: "ListRoutingRules",
        http_method: "GET",
        request_uri: "/v2/domainnames/{domainName}/routingrules"
      )

      PREVIEW_PORTAL = OperationModel.new(
        name: "PreviewPortal",
        http_method: "POST",
        request_uri: "/v2/portals/{portalId}/preview"
      )

      PUBLISH_PORTAL = OperationModel.new(
        name: "PublishPortal",
        http_method: "POST",
        request_uri: "/v2/portals/{portalId}/publish"
      )

      PUT_PORTAL_PRODUCT_SHARING_POLICY = OperationModel.new(
        name: "PutPortalProductSharingPolicy",
        http_method: "PUT",
        request_uri: "/v2/portalproducts/{portalProductId}/sharingpolicy"
      )

      PUT_ROUTING_RULE = OperationModel.new(
        name: "PutRoutingRule",
        http_method: "PUT",
        request_uri: "/v2/domainnames/{domainName}/routingrules/{routingRuleId}"
      )

      REIMPORT_API = OperationModel.new(
        name: "ReimportApi",
        http_method: "PUT",
        request_uri: "/v2/apis/{apiId}"
      )

      RESET_AUTHORIZERS_CACHE = OperationModel.new(
        name: "ResetAuthorizersCache",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/stages/{stageName}/cache/authorizers"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/v2/tags/{resource-arn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/v2/tags/{resource-arn}"
      )

      UPDATE_API = OperationModel.new(
        name: "UpdateApi",
        http_method: "PATCH",
        request_uri: "/v2/apis/{apiId}"
      )

      UPDATE_API_MAPPING = OperationModel.new(
        name: "UpdateApiMapping",
        http_method: "PATCH",
        request_uri: "/v2/domainnames/{domainName}/apimappings/{apiMappingId}"
      )

      UPDATE_AUTHORIZER = OperationModel.new(
        name: "UpdateAuthorizer",
        http_method: "PATCH",
        request_uri: "/v2/apis/{apiId}/authorizers/{authorizerId}"
      )

      UPDATE_DEPLOYMENT = OperationModel.new(
        name: "UpdateDeployment",
        http_method: "PATCH",
        request_uri: "/v2/apis/{apiId}/deployments/{deploymentId}"
      )

      UPDATE_DOMAIN_NAME = OperationModel.new(
        name: "UpdateDomainName",
        http_method: "PATCH",
        request_uri: "/v2/domainnames/{domainName}"
      )

      UPDATE_INTEGRATION = OperationModel.new(
        name: "UpdateIntegration",
        http_method: "PATCH",
        request_uri: "/v2/apis/{apiId}/integrations/{integrationId}"
      )

      UPDATE_INTEGRATION_RESPONSE = OperationModel.new(
        name: "UpdateIntegrationResponse",
        http_method: "PATCH",
        request_uri: "/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses/{integrationResponseId}"
      )

      UPDATE_MODEL = OperationModel.new(
        name: "UpdateModel",
        http_method: "PATCH",
        request_uri: "/v2/apis/{apiId}/models/{modelId}"
      )

      UPDATE_PORTAL = OperationModel.new(
        name: "UpdatePortal",
        http_method: "PATCH",
        request_uri: "/v2/portals/{portalId}"
      )

      UPDATE_PORTAL_PRODUCT = OperationModel.new(
        name: "UpdatePortalProduct",
        http_method: "PATCH",
        request_uri: "/v2/portalproducts/{portalProductId}"
      )

      UPDATE_PRODUCT_PAGE = OperationModel.new(
        name: "UpdateProductPage",
        http_method: "PATCH",
        request_uri: "/v2/portalproducts/{portalProductId}/productpages/{productPageId}"
      )

      UPDATE_PRODUCT_REST_ENDPOINT_PAGE = OperationModel.new(
        name: "UpdateProductRestEndpointPage",
        http_method: "PATCH",
        request_uri: "/v2/portalproducts/{portalProductId}/productrestendpointpages/{productRestEndpointPageId}"
      )

      UPDATE_ROUTE = OperationModel.new(
        name: "UpdateRoute",
        http_method: "PATCH",
        request_uri: "/v2/apis/{apiId}/routes/{routeId}"
      )

      UPDATE_ROUTE_RESPONSE = OperationModel.new(
        name: "UpdateRouteResponse",
        http_method: "PATCH",
        request_uri: "/v2/apis/{apiId}/routes/{routeId}/routeresponses/{routeResponseId}"
      )

      UPDATE_STAGE = OperationModel.new(
        name: "UpdateStage",
        http_method: "PATCH",
        request_uri: "/v2/apis/{apiId}/stages/{stageName}"
      )

      UPDATE_VPC_LINK = OperationModel.new(
        name: "UpdateVpcLink",
        http_method: "PATCH",
        request_uri: "/v2/vpclinks/{vpcLinkId}"
      )
    end
  end
end
