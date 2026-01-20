module Aws
  module ChimeSDKIdentity
    module Model
      API_VERSION = "2021-04-20"
      TARGET_PREFIX = ""
      SIGNING_NAME = "chime"
      ENDPOINT_PREFIX = "identity-chime"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://identity-chime-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://identity-chime-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://identity-chime.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://identity-chime.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_APP_INSTANCE = OperationModel.new(
        name: "CreateAppInstance",
        http_method: "POST",
        request_uri: "/app-instances"
      )

      CREATE_APP_INSTANCE_ADMIN = OperationModel.new(
        name: "CreateAppInstanceAdmin",
        http_method: "POST",
        request_uri: "/app-instances/{appInstanceArn}/admins"
      )

      CREATE_APP_INSTANCE_BOT = OperationModel.new(
        name: "CreateAppInstanceBot",
        http_method: "POST",
        request_uri: "/app-instance-bots"
      )

      CREATE_APP_INSTANCE_USER = OperationModel.new(
        name: "CreateAppInstanceUser",
        http_method: "POST",
        request_uri: "/app-instance-users"
      )

      DELETE_APP_INSTANCE = OperationModel.new(
        name: "DeleteAppInstance",
        http_method: "DELETE",
        request_uri: "/app-instances/{appInstanceArn}"
      )

      DELETE_APP_INSTANCE_ADMIN = OperationModel.new(
        name: "DeleteAppInstanceAdmin",
        http_method: "DELETE",
        request_uri: "/app-instances/{appInstanceArn}/admins/{appInstanceAdminArn}"
      )

      DELETE_APP_INSTANCE_BOT = OperationModel.new(
        name: "DeleteAppInstanceBot",
        http_method: "DELETE",
        request_uri: "/app-instance-bots/{appInstanceBotArn}"
      )

      DELETE_APP_INSTANCE_USER = OperationModel.new(
        name: "DeleteAppInstanceUser",
        http_method: "DELETE",
        request_uri: "/app-instance-users/{appInstanceUserArn}"
      )

      DEREGISTER_APP_INSTANCE_USER_ENDPOINT = OperationModel.new(
        name: "DeregisterAppInstanceUserEndpoint",
        http_method: "DELETE",
        request_uri: "/app-instance-users/{appInstanceUserArn}/endpoints/{endpointId}"
      )

      DESCRIBE_APP_INSTANCE = OperationModel.new(
        name: "DescribeAppInstance",
        http_method: "GET",
        request_uri: "/app-instances/{appInstanceArn}"
      )

      DESCRIBE_APP_INSTANCE_ADMIN = OperationModel.new(
        name: "DescribeAppInstanceAdmin",
        http_method: "GET",
        request_uri: "/app-instances/{appInstanceArn}/admins/{appInstanceAdminArn}"
      )

      DESCRIBE_APP_INSTANCE_BOT = OperationModel.new(
        name: "DescribeAppInstanceBot",
        http_method: "GET",
        request_uri: "/app-instance-bots/{appInstanceBotArn}"
      )

      DESCRIBE_APP_INSTANCE_USER = OperationModel.new(
        name: "DescribeAppInstanceUser",
        http_method: "GET",
        request_uri: "/app-instance-users/{appInstanceUserArn}"
      )

      DESCRIBE_APP_INSTANCE_USER_ENDPOINT = OperationModel.new(
        name: "DescribeAppInstanceUserEndpoint",
        http_method: "GET",
        request_uri: "/app-instance-users/{appInstanceUserArn}/endpoints/{endpointId}"
      )

      GET_APP_INSTANCE_RETENTION_SETTINGS = OperationModel.new(
        name: "GetAppInstanceRetentionSettings",
        http_method: "GET",
        request_uri: "/app-instances/{appInstanceArn}/retention-settings"
      )

      LIST_APP_INSTANCE_ADMINS = OperationModel.new(
        name: "ListAppInstanceAdmins",
        http_method: "GET",
        request_uri: "/app-instances/{appInstanceArn}/admins"
      )

      LIST_APP_INSTANCE_BOTS = OperationModel.new(
        name: "ListAppInstanceBots",
        http_method: "GET",
        request_uri: "/app-instance-bots"
      )

      LIST_APP_INSTANCE_USER_ENDPOINTS = OperationModel.new(
        name: "ListAppInstanceUserEndpoints",
        http_method: "GET",
        request_uri: "/app-instance-users/{appInstanceUserArn}/endpoints"
      )

      LIST_APP_INSTANCE_USERS = OperationModel.new(
        name: "ListAppInstanceUsers",
        http_method: "GET",
        request_uri: "/app-instance-users"
      )

      LIST_APP_INSTANCES = OperationModel.new(
        name: "ListAppInstances",
        http_method: "GET",
        request_uri: "/app-instances"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags"
      )

      PUT_APP_INSTANCE_RETENTION_SETTINGS = OperationModel.new(
        name: "PutAppInstanceRetentionSettings",
        http_method: "PUT",
        request_uri: "/app-instances/{appInstanceArn}/retention-settings"
      )

      PUT_APP_INSTANCE_USER_EXPIRATION_SETTINGS = OperationModel.new(
        name: "PutAppInstanceUserExpirationSettings",
        http_method: "PUT",
        request_uri: "/app-instance-users/{appInstanceUserArn}/expiration-settings"
      )

      REGISTER_APP_INSTANCE_USER_ENDPOINT = OperationModel.new(
        name: "RegisterAppInstanceUserEndpoint",
        http_method: "POST",
        request_uri: "/app-instance-users/{appInstanceUserArn}/endpoints"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags?operation=tag-resource"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/tags?operation=untag-resource"
      )

      UPDATE_APP_INSTANCE = OperationModel.new(
        name: "UpdateAppInstance",
        http_method: "PUT",
        request_uri: "/app-instances/{appInstanceArn}"
      )

      UPDATE_APP_INSTANCE_BOT = OperationModel.new(
        name: "UpdateAppInstanceBot",
        http_method: "PUT",
        request_uri: "/app-instance-bots/{appInstanceBotArn}"
      )

      UPDATE_APP_INSTANCE_USER = OperationModel.new(
        name: "UpdateAppInstanceUser",
        http_method: "PUT",
        request_uri: "/app-instance-users/{appInstanceUserArn}"
      )

      UPDATE_APP_INSTANCE_USER_ENDPOINT = OperationModel.new(
        name: "UpdateAppInstanceUserEndpoint",
        http_method: "PUT",
        request_uri: "/app-instance-users/{appInstanceUserArn}/endpoints/{endpointId}"
      )
    end
  end
end
