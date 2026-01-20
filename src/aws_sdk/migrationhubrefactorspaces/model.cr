module AwsSdk
  module MigrationHubRefactorSpaces
    module Model
      API_VERSION = "2021-10-26"
      TARGET_PREFIX = ""
      SIGNING_NAME = "refactor-spaces"
      ENDPOINT_PREFIX = "refactor-spaces"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://refactor-spaces-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://refactor-spaces-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://refactor-spaces.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://refactor-spaces.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/environments/{EnvironmentIdentifier}/applications"
      )

      CREATE_ENVIRONMENT = OperationModel.new(
        name: "CreateEnvironment",
        http_method: "POST",
        request_uri: "/environments"
      )

      CREATE_ROUTE = OperationModel.new(
        name: "CreateRoute",
        http_method: "POST",
        request_uri: "/environments/{EnvironmentIdentifier}/applications/{ApplicationIdentifier}/routes"
      )

      CREATE_SERVICE = OperationModel.new(
        name: "CreateService",
        http_method: "POST",
        request_uri: "/environments/{EnvironmentIdentifier}/applications/{ApplicationIdentifier}/services"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "DELETE",
        request_uri: "/environments/{EnvironmentIdentifier}/applications/{ApplicationIdentifier}"
      )

      DELETE_ENVIRONMENT = OperationModel.new(
        name: "DeleteEnvironment",
        http_method: "DELETE",
        request_uri: "/environments/{EnvironmentIdentifier}"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "DELETE",
        request_uri: "/resourcepolicy/{Identifier}"
      )

      DELETE_ROUTE = OperationModel.new(
        name: "DeleteRoute",
        http_method: "DELETE",
        request_uri: "/environments/{EnvironmentIdentifier}/applications/{ApplicationIdentifier}/routes/{RouteIdentifier}"
      )

      DELETE_SERVICE = OperationModel.new(
        name: "DeleteService",
        http_method: "DELETE",
        request_uri: "/environments/{EnvironmentIdentifier}/applications/{ApplicationIdentifier}/services/{ServiceIdentifier}"
      )

      GET_APPLICATION = OperationModel.new(
        name: "GetApplication",
        http_method: "GET",
        request_uri: "/environments/{EnvironmentIdentifier}/applications/{ApplicationIdentifier}"
      )

      GET_ENVIRONMENT = OperationModel.new(
        name: "GetEnvironment",
        http_method: "GET",
        request_uri: "/environments/{EnvironmentIdentifier}"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "GET",
        request_uri: "/resourcepolicy/{Identifier}"
      )

      GET_ROUTE = OperationModel.new(
        name: "GetRoute",
        http_method: "GET",
        request_uri: "/environments/{EnvironmentIdentifier}/applications/{ApplicationIdentifier}/routes/{RouteIdentifier}"
      )

      GET_SERVICE = OperationModel.new(
        name: "GetService",
        http_method: "GET",
        request_uri: "/environments/{EnvironmentIdentifier}/applications/{ApplicationIdentifier}/services/{ServiceIdentifier}"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "GET",
        request_uri: "/environments/{EnvironmentIdentifier}/applications"
      )

      LIST_ENVIRONMENT_VPCS = OperationModel.new(
        name: "ListEnvironmentVpcs",
        http_method: "GET",
        request_uri: "/environments/{EnvironmentIdentifier}/vpcs"
      )

      LIST_ENVIRONMENTS = OperationModel.new(
        name: "ListEnvironments",
        http_method: "GET",
        request_uri: "/environments"
      )

      LIST_ROUTES = OperationModel.new(
        name: "ListRoutes",
        http_method: "GET",
        request_uri: "/environments/{EnvironmentIdentifier}/applications/{ApplicationIdentifier}/routes"
      )

      LIST_SERVICES = OperationModel.new(
        name: "ListServices",
        http_method: "GET",
        request_uri: "/environments/{EnvironmentIdentifier}/applications/{ApplicationIdentifier}/services"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "PUT",
        request_uri: "/resourcepolicy"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_ROUTE = OperationModel.new(
        name: "UpdateRoute",
        http_method: "PATCH",
        request_uri: "/environments/{EnvironmentIdentifier}/applications/{ApplicationIdentifier}/routes/{RouteIdentifier}"
      )
    end
  end
end
