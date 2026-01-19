module AwsSdk
  module Shield
    module Model
      API_VERSION = "2016-06-02"
      TARGET_PREFIX = "AWSShield_20160616"
      SIGNING_NAME = "shield"
      ENDPOINT_PREFIX = "shield"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://shield.us-east-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"shield","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://shield-fips.us-east-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"shield","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://shield-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://shield-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://shield.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://shield.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_DRT_LOG_BUCKET = OperationModel.new(
        name: "AssociateDRTLogBucket",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_DRT_ROLE = OperationModel.new(
        name: "AssociateDRTRole",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_HEALTH_CHECK = OperationModel.new(
        name: "AssociateHealthCheck",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_PROACTIVE_ENGAGEMENT_DETAILS = OperationModel.new(
        name: "AssociateProactiveEngagementDetails",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROTECTION = OperationModel.new(
        name: "CreateProtection",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROTECTION_GROUP = OperationModel.new(
        name: "CreateProtectionGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SUBSCRIPTION = OperationModel.new(
        name: "CreateSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROTECTION = OperationModel.new(
        name: "DeleteProtection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROTECTION_GROUP = OperationModel.new(
        name: "DeleteProtectionGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SUBSCRIPTION = OperationModel.new(
        name: "DeleteSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ATTACK = OperationModel.new(
        name: "DescribeAttack",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ATTACK_STATISTICS = OperationModel.new(
        name: "DescribeAttackStatistics",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DRT_ACCESS = OperationModel.new(
        name: "DescribeDRTAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EMERGENCY_CONTACT_SETTINGS = OperationModel.new(
        name: "DescribeEmergencyContactSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROTECTION = OperationModel.new(
        name: "DescribeProtection",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROTECTION_GROUP = OperationModel.new(
        name: "DescribeProtectionGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SUBSCRIPTION = OperationModel.new(
        name: "DescribeSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_APPLICATION_LAYER_AUTOMATIC_RESPONSE = OperationModel.new(
        name: "DisableApplicationLayerAutomaticResponse",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_PROACTIVE_ENGAGEMENT = OperationModel.new(
        name: "DisableProactiveEngagement",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_DRT_LOG_BUCKET = OperationModel.new(
        name: "DisassociateDRTLogBucket",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_DRT_ROLE = OperationModel.new(
        name: "DisassociateDRTRole",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_HEALTH_CHECK = OperationModel.new(
        name: "DisassociateHealthCheck",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_APPLICATION_LAYER_AUTOMATIC_RESPONSE = OperationModel.new(
        name: "EnableApplicationLayerAutomaticResponse",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_PROACTIVE_ENGAGEMENT = OperationModel.new(
        name: "EnableProactiveEngagement",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SUBSCRIPTION_STATE = OperationModel.new(
        name: "GetSubscriptionState",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ATTACKS = OperationModel.new(
        name: "ListAttacks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROTECTION_GROUPS = OperationModel.new(
        name: "ListProtectionGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROTECTIONS = OperationModel.new(
        name: "ListProtections",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCES_IN_PROTECTION_GROUP = OperationModel.new(
        name: "ListResourcesInProtectionGroup",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_APPLICATION_LAYER_AUTOMATIC_RESPONSE = OperationModel.new(
        name: "UpdateApplicationLayerAutomaticResponse",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_EMERGENCY_CONTACT_SETTINGS = OperationModel.new(
        name: "UpdateEmergencyContactSettings",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROTECTION_GROUP = OperationModel.new(
        name: "UpdateProtectionGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SUBSCRIPTION = OperationModel.new(
        name: "UpdateSubscription",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
