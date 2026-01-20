module Aws
  module SsmSap
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "ssm-sap"
      ENDPOINT_PREFIX = "ssm-sap"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://ssm-sap-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://ssm-sap-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://ssm-sap.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://ssm-sap.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      DELETE_RESOURCE_PERMISSION = OperationModel.new(
        name: "DeleteResourcePermission",
        http_method: "POST",
        request_uri: "/delete-resource-permission"
      )

      DEREGISTER_APPLICATION = OperationModel.new(
        name: "DeregisterApplication",
        http_method: "POST",
        request_uri: "/deregister-application"
      )

      GET_APPLICATION = OperationModel.new(
        name: "GetApplication",
        http_method: "POST",
        request_uri: "/get-application"
      )

      GET_COMPONENT = OperationModel.new(
        name: "GetComponent",
        http_method: "POST",
        request_uri: "/get-component"
      )

      GET_CONFIGURATION_CHECK_OPERATION = OperationModel.new(
        name: "GetConfigurationCheckOperation",
        http_method: "POST",
        request_uri: "/get-configuration-check-operation"
      )

      GET_DATABASE = OperationModel.new(
        name: "GetDatabase",
        http_method: "POST",
        request_uri: "/get-database"
      )

      GET_OPERATION = OperationModel.new(
        name: "GetOperation",
        http_method: "POST",
        request_uri: "/get-operation"
      )

      GET_RESOURCE_PERMISSION = OperationModel.new(
        name: "GetResourcePermission",
        http_method: "POST",
        request_uri: "/get-resource-permission"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "POST",
        request_uri: "/list-applications"
      )

      LIST_COMPONENTS = OperationModel.new(
        name: "ListComponents",
        http_method: "POST",
        request_uri: "/list-components"
      )

      LIST_CONFIGURATION_CHECK_DEFINITIONS = OperationModel.new(
        name: "ListConfigurationCheckDefinitions",
        http_method: "POST",
        request_uri: "/list-configuration-check-definitions"
      )

      LIST_CONFIGURATION_CHECK_OPERATIONS = OperationModel.new(
        name: "ListConfigurationCheckOperations",
        http_method: "POST",
        request_uri: "/list-configuration-check-operations"
      )

      LIST_DATABASES = OperationModel.new(
        name: "ListDatabases",
        http_method: "POST",
        request_uri: "/list-databases"
      )

      LIST_OPERATION_EVENTS = OperationModel.new(
        name: "ListOperationEvents",
        http_method: "POST",
        request_uri: "/list-operation-events"
      )

      LIST_OPERATIONS = OperationModel.new(
        name: "ListOperations",
        http_method: "POST",
        request_uri: "/list-operations"
      )

      LIST_SUB_CHECK_RESULTS = OperationModel.new(
        name: "ListSubCheckResults",
        http_method: "POST",
        request_uri: "/list-sub-check-results"
      )

      LIST_SUB_CHECK_RULE_RESULTS = OperationModel.new(
        name: "ListSubCheckRuleResults",
        http_method: "POST",
        request_uri: "/list-sub-check-rule-results"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_RESOURCE_PERMISSION = OperationModel.new(
        name: "PutResourcePermission",
        http_method: "POST",
        request_uri: "/put-resource-permission"
      )

      REGISTER_APPLICATION = OperationModel.new(
        name: "RegisterApplication",
        http_method: "POST",
        request_uri: "/register-application"
      )

      START_APPLICATION = OperationModel.new(
        name: "StartApplication",
        http_method: "POST",
        request_uri: "/start-application"
      )

      START_APPLICATION_REFRESH = OperationModel.new(
        name: "StartApplicationRefresh",
        http_method: "POST",
        request_uri: "/start-application-refresh"
      )

      START_CONFIGURATION_CHECKS = OperationModel.new(
        name: "StartConfigurationChecks",
        http_method: "POST",
        request_uri: "/start-configuration-checks"
      )

      STOP_APPLICATION = OperationModel.new(
        name: "StopApplication",
        http_method: "POST",
        request_uri: "/stop-application"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_APPLICATION_SETTINGS = OperationModel.new(
        name: "UpdateApplicationSettings",
        http_method: "POST",
        request_uri: "/update-application-settings"
      )
    end
  end
end
