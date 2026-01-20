module Aws
  module Route53RecoveryReadiness
    module Model
      API_VERSION = "2019-12-02"
      TARGET_PREFIX = ""
      SIGNING_NAME = "route53-recovery-readiness"
      ENDPOINT_PREFIX = "route53-recovery-readiness"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53-recovery-readiness-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53-recovery-readiness-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53-recovery-readiness.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://route53-recovery-readiness.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CELL = OperationModel.new(
        name: "CreateCell",
        http_method: "POST",
        request_uri: "/cells"
      )

      CREATE_CROSS_ACCOUNT_AUTHORIZATION = OperationModel.new(
        name: "CreateCrossAccountAuthorization",
        http_method: "POST",
        request_uri: "/crossaccountauthorizations"
      )

      CREATE_READINESS_CHECK = OperationModel.new(
        name: "CreateReadinessCheck",
        http_method: "POST",
        request_uri: "/readinesschecks"
      )

      CREATE_RECOVERY_GROUP = OperationModel.new(
        name: "CreateRecoveryGroup",
        http_method: "POST",
        request_uri: "/recoverygroups"
      )

      CREATE_RESOURCE_SET = OperationModel.new(
        name: "CreateResourceSet",
        http_method: "POST",
        request_uri: "/resourcesets"
      )

      DELETE_CELL = OperationModel.new(
        name: "DeleteCell",
        http_method: "DELETE",
        request_uri: "/cells/{cellName}"
      )

      DELETE_CROSS_ACCOUNT_AUTHORIZATION = OperationModel.new(
        name: "DeleteCrossAccountAuthorization",
        http_method: "DELETE",
        request_uri: "/crossaccountauthorizations/{crossAccountAuthorization}"
      )

      DELETE_READINESS_CHECK = OperationModel.new(
        name: "DeleteReadinessCheck",
        http_method: "DELETE",
        request_uri: "/readinesschecks/{readinessCheckName}"
      )

      DELETE_RECOVERY_GROUP = OperationModel.new(
        name: "DeleteRecoveryGroup",
        http_method: "DELETE",
        request_uri: "/recoverygroups/{recoveryGroupName}"
      )

      DELETE_RESOURCE_SET = OperationModel.new(
        name: "DeleteResourceSet",
        http_method: "DELETE",
        request_uri: "/resourcesets/{resourceSetName}"
      )

      GET_ARCHITECTURE_RECOMMENDATIONS = OperationModel.new(
        name: "GetArchitectureRecommendations",
        http_method: "GET",
        request_uri: "/recoverygroups/{recoveryGroupName}/architectureRecommendations"
      )

      GET_CELL = OperationModel.new(
        name: "GetCell",
        http_method: "GET",
        request_uri: "/cells/{cellName}"
      )

      GET_CELL_READINESS_SUMMARY = OperationModel.new(
        name: "GetCellReadinessSummary",
        http_method: "GET",
        request_uri: "/cellreadiness/{cellName}"
      )

      GET_READINESS_CHECK = OperationModel.new(
        name: "GetReadinessCheck",
        http_method: "GET",
        request_uri: "/readinesschecks/{readinessCheckName}"
      )

      GET_READINESS_CHECK_RESOURCE_STATUS = OperationModel.new(
        name: "GetReadinessCheckResourceStatus",
        http_method: "GET",
        request_uri: "/readinesschecks/{readinessCheckName}/resource/{resourceIdentifier}/status"
      )

      GET_READINESS_CHECK_STATUS = OperationModel.new(
        name: "GetReadinessCheckStatus",
        http_method: "GET",
        request_uri: "/readinesschecks/{readinessCheckName}/status"
      )

      GET_RECOVERY_GROUP = OperationModel.new(
        name: "GetRecoveryGroup",
        http_method: "GET",
        request_uri: "/recoverygroups/{recoveryGroupName}"
      )

      GET_RECOVERY_GROUP_READINESS_SUMMARY = OperationModel.new(
        name: "GetRecoveryGroupReadinessSummary",
        http_method: "GET",
        request_uri: "/recoverygroupreadiness/{recoveryGroupName}"
      )

      GET_RESOURCE_SET = OperationModel.new(
        name: "GetResourceSet",
        http_method: "GET",
        request_uri: "/resourcesets/{resourceSetName}"
      )

      LIST_CELLS = OperationModel.new(
        name: "ListCells",
        http_method: "GET",
        request_uri: "/cells"
      )

      LIST_CROSS_ACCOUNT_AUTHORIZATIONS = OperationModel.new(
        name: "ListCrossAccountAuthorizations",
        http_method: "GET",
        request_uri: "/crossaccountauthorizations"
      )

      LIST_READINESS_CHECKS = OperationModel.new(
        name: "ListReadinessChecks",
        http_method: "GET",
        request_uri: "/readinesschecks"
      )

      LIST_RECOVERY_GROUPS = OperationModel.new(
        name: "ListRecoveryGroups",
        http_method: "GET",
        request_uri: "/recoverygroups"
      )

      LIST_RESOURCE_SETS = OperationModel.new(
        name: "ListResourceSets",
        http_method: "GET",
        request_uri: "/resourcesets"
      )

      LIST_RULES = OperationModel.new(
        name: "ListRules",
        http_method: "GET",
        request_uri: "/rules"
      )

      LIST_TAGS_FOR_RESOURCES = OperationModel.new(
        name: "ListTagsForResources",
        http_method: "GET",
        request_uri: "/tags/{resource-arn}"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resource-arn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resource-arn}"
      )

      UPDATE_CELL = OperationModel.new(
        name: "UpdateCell",
        http_method: "PUT",
        request_uri: "/cells/{cellName}"
      )

      UPDATE_READINESS_CHECK = OperationModel.new(
        name: "UpdateReadinessCheck",
        http_method: "PUT",
        request_uri: "/readinesschecks/{readinessCheckName}"
      )

      UPDATE_RECOVERY_GROUP = OperationModel.new(
        name: "UpdateRecoveryGroup",
        http_method: "PUT",
        request_uri: "/recoverygroups/{recoveryGroupName}"
      )

      UPDATE_RESOURCE_SET = OperationModel.new(
        name: "UpdateResourceSet",
        http_method: "PUT",
        request_uri: "/resourcesets/{resourceSetName}"
      )
    end
  end
end
