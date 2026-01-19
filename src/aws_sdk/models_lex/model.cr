module AwsSdk
  module LexModelBuildingService
    module Model
      API_VERSION = "2017-04-19"
      TARGET_PREFIX = ""
      SIGNING_NAME = "lex"
      ENDPOINT_PREFIX = "models.lex"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://models.lex-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]}],"endpoint":{"url":"https://models-fips.lex.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://models-fips.lex.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://models.lex-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://models.lex.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://models.lex.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-us-gov",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://models.lex.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://models.lex.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_BOT_VERSION = OperationModel.new(
        name: "CreateBotVersion",
        http_method: "POST",
        request_uri: "/bots/{name}/versions"
      )

      CREATE_INTENT_VERSION = OperationModel.new(
        name: "CreateIntentVersion",
        http_method: "POST",
        request_uri: "/intents/{name}/versions"
      )

      CREATE_SLOT_TYPE_VERSION = OperationModel.new(
        name: "CreateSlotTypeVersion",
        http_method: "POST",
        request_uri: "/slottypes/{name}/versions"
      )

      DELETE_BOT = OperationModel.new(
        name: "DeleteBot",
        http_method: "DELETE",
        request_uri: "/bots/{name}"
      )

      DELETE_BOT_ALIAS = OperationModel.new(
        name: "DeleteBotAlias",
        http_method: "DELETE",
        request_uri: "/bots/{botName}/aliases/{name}"
      )

      DELETE_BOT_CHANNEL_ASSOCIATION = OperationModel.new(
        name: "DeleteBotChannelAssociation",
        http_method: "DELETE",
        request_uri: "/bots/{botName}/aliases/{aliasName}/channels/{name}"
      )

      DELETE_BOT_VERSION = OperationModel.new(
        name: "DeleteBotVersion",
        http_method: "DELETE",
        request_uri: "/bots/{name}/versions/{version}"
      )

      DELETE_INTENT = OperationModel.new(
        name: "DeleteIntent",
        http_method: "DELETE",
        request_uri: "/intents/{name}"
      )

      DELETE_INTENT_VERSION = OperationModel.new(
        name: "DeleteIntentVersion",
        http_method: "DELETE",
        request_uri: "/intents/{name}/versions/{version}"
      )

      DELETE_SLOT_TYPE = OperationModel.new(
        name: "DeleteSlotType",
        http_method: "DELETE",
        request_uri: "/slottypes/{name}"
      )

      DELETE_SLOT_TYPE_VERSION = OperationModel.new(
        name: "DeleteSlotTypeVersion",
        http_method: "DELETE",
        request_uri: "/slottypes/{name}/version/{version}"
      )

      DELETE_UTTERANCES = OperationModel.new(
        name: "DeleteUtterances",
        http_method: "DELETE",
        request_uri: "/bots/{botName}/utterances/{userId}"
      )

      GET_BOT = OperationModel.new(
        name: "GetBot",
        http_method: "GET",
        request_uri: "/bots/{name}/versions/{versionoralias}"
      )

      GET_BOT_ALIAS = OperationModel.new(
        name: "GetBotAlias",
        http_method: "GET",
        request_uri: "/bots/{botName}/aliases/{name}"
      )

      GET_BOT_ALIASES = OperationModel.new(
        name: "GetBotAliases",
        http_method: "GET",
        request_uri: "/bots/{botName}/aliases/"
      )

      GET_BOT_CHANNEL_ASSOCIATION = OperationModel.new(
        name: "GetBotChannelAssociation",
        http_method: "GET",
        request_uri: "/bots/{botName}/aliases/{aliasName}/channels/{name}"
      )

      GET_BOT_CHANNEL_ASSOCIATIONS = OperationModel.new(
        name: "GetBotChannelAssociations",
        http_method: "GET",
        request_uri: "/bots/{botName}/aliases/{aliasName}/channels/"
      )

      GET_BOT_VERSIONS = OperationModel.new(
        name: "GetBotVersions",
        http_method: "GET",
        request_uri: "/bots/{name}/versions/"
      )

      GET_BOTS = OperationModel.new(
        name: "GetBots",
        http_method: "GET",
        request_uri: "/bots/"
      )

      GET_BUILTIN_INTENT = OperationModel.new(
        name: "GetBuiltinIntent",
        http_method: "GET",
        request_uri: "/builtins/intents/{signature}"
      )

      GET_BUILTIN_INTENTS = OperationModel.new(
        name: "GetBuiltinIntents",
        http_method: "GET",
        request_uri: "/builtins/intents/"
      )

      GET_BUILTIN_SLOT_TYPES = OperationModel.new(
        name: "GetBuiltinSlotTypes",
        http_method: "GET",
        request_uri: "/builtins/slottypes/"
      )

      GET_EXPORT = OperationModel.new(
        name: "GetExport",
        http_method: "GET",
        request_uri: "/exports/"
      )

      GET_IMPORT = OperationModel.new(
        name: "GetImport",
        http_method: "GET",
        request_uri: "/imports/{importId}"
      )

      GET_INTENT = OperationModel.new(
        name: "GetIntent",
        http_method: "GET",
        request_uri: "/intents/{name}/versions/{version}"
      )

      GET_INTENT_VERSIONS = OperationModel.new(
        name: "GetIntentVersions",
        http_method: "GET",
        request_uri: "/intents/{name}/versions/"
      )

      GET_INTENTS = OperationModel.new(
        name: "GetIntents",
        http_method: "GET",
        request_uri: "/intents/"
      )

      GET_MIGRATION = OperationModel.new(
        name: "GetMigration",
        http_method: "GET",
        request_uri: "/migrations/{migrationId}"
      )

      GET_MIGRATIONS = OperationModel.new(
        name: "GetMigrations",
        http_method: "GET",
        request_uri: "/migrations"
      )

      GET_SLOT_TYPE = OperationModel.new(
        name: "GetSlotType",
        http_method: "GET",
        request_uri: "/slottypes/{name}/versions/{version}"
      )

      GET_SLOT_TYPE_VERSIONS = OperationModel.new(
        name: "GetSlotTypeVersions",
        http_method: "GET",
        request_uri: "/slottypes/{name}/versions/"
      )

      GET_SLOT_TYPES = OperationModel.new(
        name: "GetSlotTypes",
        http_method: "GET",
        request_uri: "/slottypes/"
      )

      GET_UTTERANCES_VIEW = OperationModel.new(
        name: "GetUtterancesView",
        http_method: "GET",
        request_uri: "/bots/{botname}/utterances?view=aggregation"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_BOT = OperationModel.new(
        name: "PutBot",
        http_method: "PUT",
        request_uri: "/bots/{name}/versions/$LATEST"
      )

      PUT_BOT_ALIAS = OperationModel.new(
        name: "PutBotAlias",
        http_method: "PUT",
        request_uri: "/bots/{botName}/aliases/{name}"
      )

      PUT_INTENT = OperationModel.new(
        name: "PutIntent",
        http_method: "PUT",
        request_uri: "/intents/{name}/versions/$LATEST"
      )

      PUT_SLOT_TYPE = OperationModel.new(
        name: "PutSlotType",
        http_method: "PUT",
        request_uri: "/slottypes/{name}/versions/$LATEST"
      )

      START_IMPORT = OperationModel.new(
        name: "StartImport",
        http_method: "POST",
        request_uri: "/imports/"
      )

      START_MIGRATION = OperationModel.new(
        name: "StartMigration",
        http_method: "POST",
        request_uri: "/migrations"
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
    end
  end
end
