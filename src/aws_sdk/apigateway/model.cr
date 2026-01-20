module AwsSdk
  module APIGateway
    module Model
      API_VERSION = "2015-07-09"
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

      CREATE_API_KEY = OperationModel.new(
        name: "CreateApiKey",
        http_method: "POST",
        request_uri: "/apikeys"
      )

      CREATE_AUTHORIZER = OperationModel.new(
        name: "CreateAuthorizer",
        http_method: "POST",
        request_uri: "/restapis/{restapi_id}/authorizers"
      )

      CREATE_BASE_PATH_MAPPING = OperationModel.new(
        name: "CreateBasePathMapping",
        http_method: "POST",
        request_uri: "/domainnames/{domain_name}/basepathmappings"
      )

      CREATE_DEPLOYMENT = OperationModel.new(
        name: "CreateDeployment",
        http_method: "POST",
        request_uri: "/restapis/{restapi_id}/deployments"
      )

      CREATE_DOCUMENTATION_PART = OperationModel.new(
        name: "CreateDocumentationPart",
        http_method: "POST",
        request_uri: "/restapis/{restapi_id}/documentation/parts"
      )

      CREATE_DOCUMENTATION_VERSION = OperationModel.new(
        name: "CreateDocumentationVersion",
        http_method: "POST",
        request_uri: "/restapis/{restapi_id}/documentation/versions"
      )

      CREATE_DOMAIN_NAME = OperationModel.new(
        name: "CreateDomainName",
        http_method: "POST",
        request_uri: "/domainnames"
      )

      CREATE_DOMAIN_NAME_ACCESS_ASSOCIATION = OperationModel.new(
        name: "CreateDomainNameAccessAssociation",
        http_method: "POST",
        request_uri: "/domainnameaccessassociations"
      )

      CREATE_MODEL = OperationModel.new(
        name: "CreateModel",
        http_method: "POST",
        request_uri: "/restapis/{restapi_id}/models"
      )

      CREATE_REQUEST_VALIDATOR = OperationModel.new(
        name: "CreateRequestValidator",
        http_method: "POST",
        request_uri: "/restapis/{restapi_id}/requestvalidators"
      )

      CREATE_RESOURCE = OperationModel.new(
        name: "CreateResource",
        http_method: "POST",
        request_uri: "/restapis/{restapi_id}/resources/{parent_id}"
      )

      CREATE_REST_API = OperationModel.new(
        name: "CreateRestApi",
        http_method: "POST",
        request_uri: "/restapis"
      )

      CREATE_STAGE = OperationModel.new(
        name: "CreateStage",
        http_method: "POST",
        request_uri: "/restapis/{restapi_id}/stages"
      )

      CREATE_USAGE_PLAN = OperationModel.new(
        name: "CreateUsagePlan",
        http_method: "POST",
        request_uri: "/usageplans"
      )

      CREATE_USAGE_PLAN_KEY = OperationModel.new(
        name: "CreateUsagePlanKey",
        http_method: "POST",
        request_uri: "/usageplans/{usageplanId}/keys"
      )

      CREATE_VPC_LINK = OperationModel.new(
        name: "CreateVpcLink",
        http_method: "POST",
        request_uri: "/vpclinks"
      )

      DELETE_API_KEY = OperationModel.new(
        name: "DeleteApiKey",
        http_method: "DELETE",
        request_uri: "/apikeys/{api_Key}"
      )

      DELETE_AUTHORIZER = OperationModel.new(
        name: "DeleteAuthorizer",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/authorizers/{authorizer_id}"
      )

      DELETE_BASE_PATH_MAPPING = OperationModel.new(
        name: "DeleteBasePathMapping",
        http_method: "DELETE",
        request_uri: "/domainnames/{domain_name}/basepathmappings/{base_path}"
      )

      DELETE_CLIENT_CERTIFICATE = OperationModel.new(
        name: "DeleteClientCertificate",
        http_method: "DELETE",
        request_uri: "/clientcertificates/{clientcertificate_id}"
      )

      DELETE_DEPLOYMENT = OperationModel.new(
        name: "DeleteDeployment",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/deployments/{deployment_id}"
      )

      DELETE_DOCUMENTATION_PART = OperationModel.new(
        name: "DeleteDocumentationPart",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/documentation/parts/{part_id}"
      )

      DELETE_DOCUMENTATION_VERSION = OperationModel.new(
        name: "DeleteDocumentationVersion",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/documentation/versions/{doc_version}"
      )

      DELETE_DOMAIN_NAME = OperationModel.new(
        name: "DeleteDomainName",
        http_method: "DELETE",
        request_uri: "/domainnames/{domain_name}"
      )

      DELETE_DOMAIN_NAME_ACCESS_ASSOCIATION = OperationModel.new(
        name: "DeleteDomainNameAccessAssociation",
        http_method: "DELETE",
        request_uri: "/domainnameaccessassociations/{domain_name_access_association_arn}"
      )

      DELETE_GATEWAY_RESPONSE = OperationModel.new(
        name: "DeleteGatewayResponse",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/gatewayresponses/{response_type}"
      )

      DELETE_INTEGRATION = OperationModel.new(
        name: "DeleteIntegration",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}/integration"
      )

      DELETE_INTEGRATION_RESPONSE = OperationModel.new(
        name: "DeleteIntegrationResponse",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}/integration/responses/{status_code}"
      )

      DELETE_METHOD = OperationModel.new(
        name: "DeleteMethod",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}"
      )

      DELETE_METHOD_RESPONSE = OperationModel.new(
        name: "DeleteMethodResponse",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}/responses/{status_code}"
      )

      DELETE_MODEL = OperationModel.new(
        name: "DeleteModel",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/models/{model_name}"
      )

      DELETE_REQUEST_VALIDATOR = OperationModel.new(
        name: "DeleteRequestValidator",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/requestvalidators/{requestvalidator_id}"
      )

      DELETE_RESOURCE = OperationModel.new(
        name: "DeleteResource",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}"
      )

      DELETE_REST_API = OperationModel.new(
        name: "DeleteRestApi",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}"
      )

      DELETE_STAGE = OperationModel.new(
        name: "DeleteStage",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/stages/{stage_name}"
      )

      DELETE_USAGE_PLAN = OperationModel.new(
        name: "DeleteUsagePlan",
        http_method: "DELETE",
        request_uri: "/usageplans/{usageplanId}"
      )

      DELETE_USAGE_PLAN_KEY = OperationModel.new(
        name: "DeleteUsagePlanKey",
        http_method: "DELETE",
        request_uri: "/usageplans/{usageplanId}/keys/{keyId}"
      )

      DELETE_VPC_LINK = OperationModel.new(
        name: "DeleteVpcLink",
        http_method: "DELETE",
        request_uri: "/vpclinks/{vpclink_id}"
      )

      FLUSH_STAGE_AUTHORIZERS_CACHE = OperationModel.new(
        name: "FlushStageAuthorizersCache",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/stages/{stage_name}/cache/authorizers"
      )

      FLUSH_STAGE_CACHE = OperationModel.new(
        name: "FlushStageCache",
        http_method: "DELETE",
        request_uri: "/restapis/{restapi_id}/stages/{stage_name}/cache/data"
      )

      GENERATE_CLIENT_CERTIFICATE = OperationModel.new(
        name: "GenerateClientCertificate",
        http_method: "POST",
        request_uri: "/clientcertificates"
      )

      GET_ACCOUNT = OperationModel.new(
        name: "GetAccount",
        http_method: "GET",
        request_uri: "/account"
      )

      GET_API_KEY = OperationModel.new(
        name: "GetApiKey",
        http_method: "GET",
        request_uri: "/apikeys/{api_Key}"
      )

      GET_API_KEYS = OperationModel.new(
        name: "GetApiKeys",
        http_method: "GET",
        request_uri: "/apikeys"
      )

      GET_AUTHORIZER = OperationModel.new(
        name: "GetAuthorizer",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/authorizers/{authorizer_id}"
      )

      GET_AUTHORIZERS = OperationModel.new(
        name: "GetAuthorizers",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/authorizers"
      )

      GET_BASE_PATH_MAPPING = OperationModel.new(
        name: "GetBasePathMapping",
        http_method: "GET",
        request_uri: "/domainnames/{domain_name}/basepathmappings/{base_path}"
      )

      GET_BASE_PATH_MAPPINGS = OperationModel.new(
        name: "GetBasePathMappings",
        http_method: "GET",
        request_uri: "/domainnames/{domain_name}/basepathmappings"
      )

      GET_CLIENT_CERTIFICATE = OperationModel.new(
        name: "GetClientCertificate",
        http_method: "GET",
        request_uri: "/clientcertificates/{clientcertificate_id}"
      )

      GET_CLIENT_CERTIFICATES = OperationModel.new(
        name: "GetClientCertificates",
        http_method: "GET",
        request_uri: "/clientcertificates"
      )

      GET_DEPLOYMENT = OperationModel.new(
        name: "GetDeployment",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/deployments/{deployment_id}"
      )

      GET_DEPLOYMENTS = OperationModel.new(
        name: "GetDeployments",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/deployments"
      )

      GET_DOCUMENTATION_PART = OperationModel.new(
        name: "GetDocumentationPart",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/documentation/parts/{part_id}"
      )

      GET_DOCUMENTATION_PARTS = OperationModel.new(
        name: "GetDocumentationParts",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/documentation/parts"
      )

      GET_DOCUMENTATION_VERSION = OperationModel.new(
        name: "GetDocumentationVersion",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/documentation/versions/{doc_version}"
      )

      GET_DOCUMENTATION_VERSIONS = OperationModel.new(
        name: "GetDocumentationVersions",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/documentation/versions"
      )

      GET_DOMAIN_NAME = OperationModel.new(
        name: "GetDomainName",
        http_method: "GET",
        request_uri: "/domainnames/{domain_name}"
      )

      GET_DOMAIN_NAME_ACCESS_ASSOCIATIONS = OperationModel.new(
        name: "GetDomainNameAccessAssociations",
        http_method: "GET",
        request_uri: "/domainnameaccessassociations"
      )

      GET_DOMAIN_NAMES = OperationModel.new(
        name: "GetDomainNames",
        http_method: "GET",
        request_uri: "/domainnames"
      )

      GET_EXPORT = OperationModel.new(
        name: "GetExport",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/stages/{stage_name}/exports/{export_type}"
      )

      GET_GATEWAY_RESPONSE = OperationModel.new(
        name: "GetGatewayResponse",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/gatewayresponses/{response_type}"
      )

      GET_GATEWAY_RESPONSES = OperationModel.new(
        name: "GetGatewayResponses",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/gatewayresponses"
      )

      GET_INTEGRATION = OperationModel.new(
        name: "GetIntegration",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}/integration"
      )

      GET_INTEGRATION_RESPONSE = OperationModel.new(
        name: "GetIntegrationResponse",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}/integration/responses/{status_code}"
      )

      GET_METHOD = OperationModel.new(
        name: "GetMethod",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}"
      )

      GET_METHOD_RESPONSE = OperationModel.new(
        name: "GetMethodResponse",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}/responses/{status_code}"
      )

      GET_MODEL = OperationModel.new(
        name: "GetModel",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/models/{model_name}"
      )

      GET_MODEL_TEMPLATE = OperationModel.new(
        name: "GetModelTemplate",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/models/{model_name}/default_template"
      )

      GET_MODELS = OperationModel.new(
        name: "GetModels",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/models"
      )

      GET_REQUEST_VALIDATOR = OperationModel.new(
        name: "GetRequestValidator",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/requestvalidators/{requestvalidator_id}"
      )

      GET_REQUEST_VALIDATORS = OperationModel.new(
        name: "GetRequestValidators",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/requestvalidators"
      )

      GET_RESOURCE = OperationModel.new(
        name: "GetResource",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}"
      )

      GET_RESOURCES = OperationModel.new(
        name: "GetResources",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/resources"
      )

      GET_REST_API = OperationModel.new(
        name: "GetRestApi",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}"
      )

      GET_REST_APIS = OperationModel.new(
        name: "GetRestApis",
        http_method: "GET",
        request_uri: "/restapis"
      )

      GET_SDK = OperationModel.new(
        name: "GetSdk",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/stages/{stage_name}/sdks/{sdk_type}"
      )

      GET_SDK_TYPE = OperationModel.new(
        name: "GetSdkType",
        http_method: "GET",
        request_uri: "/sdktypes/{sdktype_id}"
      )

      GET_SDK_TYPES = OperationModel.new(
        name: "GetSdkTypes",
        http_method: "GET",
        request_uri: "/sdktypes"
      )

      GET_STAGE = OperationModel.new(
        name: "GetStage",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/stages/{stage_name}"
      )

      GET_STAGES = OperationModel.new(
        name: "GetStages",
        http_method: "GET",
        request_uri: "/restapis/{restapi_id}/stages"
      )

      GET_TAGS = OperationModel.new(
        name: "GetTags",
        http_method: "GET",
        request_uri: "/tags/{resource_arn}"
      )

      GET_USAGE = OperationModel.new(
        name: "GetUsage",
        http_method: "GET",
        request_uri: "/usageplans/{usageplanId}/usage"
      )

      GET_USAGE_PLAN = OperationModel.new(
        name: "GetUsagePlan",
        http_method: "GET",
        request_uri: "/usageplans/{usageplanId}"
      )

      GET_USAGE_PLAN_KEY = OperationModel.new(
        name: "GetUsagePlanKey",
        http_method: "GET",
        request_uri: "/usageplans/{usageplanId}/keys/{keyId}"
      )

      GET_USAGE_PLAN_KEYS = OperationModel.new(
        name: "GetUsagePlanKeys",
        http_method: "GET",
        request_uri: "/usageplans/{usageplanId}/keys"
      )

      GET_USAGE_PLANS = OperationModel.new(
        name: "GetUsagePlans",
        http_method: "GET",
        request_uri: "/usageplans"
      )

      GET_VPC_LINK = OperationModel.new(
        name: "GetVpcLink",
        http_method: "GET",
        request_uri: "/vpclinks/{vpclink_id}"
      )

      GET_VPC_LINKS = OperationModel.new(
        name: "GetVpcLinks",
        http_method: "GET",
        request_uri: "/vpclinks"
      )

      IMPORT_API_KEYS = OperationModel.new(
        name: "ImportApiKeys",
        http_method: "POST",
        request_uri: "/apikeys?mode=import"
      )

      IMPORT_DOCUMENTATION_PARTS = OperationModel.new(
        name: "ImportDocumentationParts",
        http_method: "PUT",
        request_uri: "/restapis/{restapi_id}/documentation/parts"
      )

      IMPORT_REST_API = OperationModel.new(
        name: "ImportRestApi",
        http_method: "POST",
        request_uri: "/restapis?mode=import"
      )

      PUT_GATEWAY_RESPONSE = OperationModel.new(
        name: "PutGatewayResponse",
        http_method: "PUT",
        request_uri: "/restapis/{restapi_id}/gatewayresponses/{response_type}"
      )

      PUT_INTEGRATION = OperationModel.new(
        name: "PutIntegration",
        http_method: "PUT",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}/integration"
      )

      PUT_INTEGRATION_RESPONSE = OperationModel.new(
        name: "PutIntegrationResponse",
        http_method: "PUT",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}/integration/responses/{status_code}"
      )

      PUT_METHOD = OperationModel.new(
        name: "PutMethod",
        http_method: "PUT",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}"
      )

      PUT_METHOD_RESPONSE = OperationModel.new(
        name: "PutMethodResponse",
        http_method: "PUT",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}/responses/{status_code}"
      )

      PUT_REST_API = OperationModel.new(
        name: "PutRestApi",
        http_method: "PUT",
        request_uri: "/restapis/{restapi_id}"
      )

      REJECT_DOMAIN_NAME_ACCESS_ASSOCIATION = OperationModel.new(
        name: "RejectDomainNameAccessAssociation",
        http_method: "POST",
        request_uri: "/rejectdomainnameaccessassociations"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "PUT",
        request_uri: "/tags/{resource_arn}"
      )

      TEST_INVOKE_AUTHORIZER = OperationModel.new(
        name: "TestInvokeAuthorizer",
        http_method: "POST",
        request_uri: "/restapis/{restapi_id}/authorizers/{authorizer_id}"
      )

      TEST_INVOKE_METHOD = OperationModel.new(
        name: "TestInvokeMethod",
        http_method: "POST",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resource_arn}"
      )

      UPDATE_ACCOUNT = OperationModel.new(
        name: "UpdateAccount",
        http_method: "PATCH",
        request_uri: "/account"
      )

      UPDATE_API_KEY = OperationModel.new(
        name: "UpdateApiKey",
        http_method: "PATCH",
        request_uri: "/apikeys/{api_Key}"
      )

      UPDATE_AUTHORIZER = OperationModel.new(
        name: "UpdateAuthorizer",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/authorizers/{authorizer_id}"
      )

      UPDATE_BASE_PATH_MAPPING = OperationModel.new(
        name: "UpdateBasePathMapping",
        http_method: "PATCH",
        request_uri: "/domainnames/{domain_name}/basepathmappings/{base_path}"
      )

      UPDATE_CLIENT_CERTIFICATE = OperationModel.new(
        name: "UpdateClientCertificate",
        http_method: "PATCH",
        request_uri: "/clientcertificates/{clientcertificate_id}"
      )

      UPDATE_DEPLOYMENT = OperationModel.new(
        name: "UpdateDeployment",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/deployments/{deployment_id}"
      )

      UPDATE_DOCUMENTATION_PART = OperationModel.new(
        name: "UpdateDocumentationPart",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/documentation/parts/{part_id}"
      )

      UPDATE_DOCUMENTATION_VERSION = OperationModel.new(
        name: "UpdateDocumentationVersion",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/documentation/versions/{doc_version}"
      )

      UPDATE_DOMAIN_NAME = OperationModel.new(
        name: "UpdateDomainName",
        http_method: "PATCH",
        request_uri: "/domainnames/{domain_name}"
      )

      UPDATE_GATEWAY_RESPONSE = OperationModel.new(
        name: "UpdateGatewayResponse",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/gatewayresponses/{response_type}"
      )

      UPDATE_INTEGRATION = OperationModel.new(
        name: "UpdateIntegration",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}/integration"
      )

      UPDATE_INTEGRATION_RESPONSE = OperationModel.new(
        name: "UpdateIntegrationResponse",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}/integration/responses/{status_code}"
      )

      UPDATE_METHOD = OperationModel.new(
        name: "UpdateMethod",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}"
      )

      UPDATE_METHOD_RESPONSE = OperationModel.new(
        name: "UpdateMethodResponse",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}/methods/{http_method}/responses/{status_code}"
      )

      UPDATE_MODEL = OperationModel.new(
        name: "UpdateModel",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/models/{model_name}"
      )

      UPDATE_REQUEST_VALIDATOR = OperationModel.new(
        name: "UpdateRequestValidator",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/requestvalidators/{requestvalidator_id}"
      )

      UPDATE_RESOURCE = OperationModel.new(
        name: "UpdateResource",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/resources/{resource_id}"
      )

      UPDATE_REST_API = OperationModel.new(
        name: "UpdateRestApi",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}"
      )

      UPDATE_STAGE = OperationModel.new(
        name: "UpdateStage",
        http_method: "PATCH",
        request_uri: "/restapis/{restapi_id}/stages/{stage_name}"
      )

      UPDATE_USAGE = OperationModel.new(
        name: "UpdateUsage",
        http_method: "PATCH",
        request_uri: "/usageplans/{usageplanId}/keys/{keyId}/usage"
      )

      UPDATE_USAGE_PLAN = OperationModel.new(
        name: "UpdateUsagePlan",
        http_method: "PATCH",
        request_uri: "/usageplans/{usageplanId}"
      )

      UPDATE_VPC_LINK = OperationModel.new(
        name: "UpdateVpcLink",
        http_method: "PATCH",
        request_uri: "/vpclinks/{vpclink_id}"
      )
    end
  end
end
