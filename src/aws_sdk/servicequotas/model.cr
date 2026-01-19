module AwsSdk
  module ServiceQuotas
    module Model
      API_VERSION = "2019-06-24"
      TARGET_PREFIX = "ServiceQuotasV20190624"
      SIGNING_NAME = "servicequotas"
      ENDPOINT_PREFIX = "servicequotas"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://servicequotas-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://servicequotas.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://servicequotas-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://servicequotas.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://servicequotas.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_SERVICE_QUOTA_TEMPLATE = OperationModel.new(
        name: "AssociateServiceQuotaTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SUPPORT_CASE = OperationModel.new(
        name: "CreateSupportCase",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE_QUOTA_INCREASE_REQUEST_FROM_TEMPLATE = OperationModel.new(
        name: "DeleteServiceQuotaIncreaseRequestFromTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_SERVICE_QUOTA_TEMPLATE = OperationModel.new(
        name: "DisassociateServiceQuotaTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AWS_DEFAULT_SERVICE_QUOTA = OperationModel.new(
        name: "GetAWSDefaultServiceQuota",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ASSOCIATION_FOR_SERVICE_QUOTA_TEMPLATE = OperationModel.new(
        name: "GetAssociationForServiceQuotaTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AUTO_MANAGEMENT_CONFIGURATION = OperationModel.new(
        name: "GetAutoManagementConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_QUOTA_UTILIZATION_REPORT = OperationModel.new(
        name: "GetQuotaUtilizationReport",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REQUESTED_SERVICE_QUOTA_CHANGE = OperationModel.new(
        name: "GetRequestedServiceQuotaChange",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_QUOTA = OperationModel.new(
        name: "GetServiceQuota",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_QUOTA_INCREASE_REQUEST_FROM_TEMPLATE = OperationModel.new(
        name: "GetServiceQuotaIncreaseRequestFromTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AWS_DEFAULT_SERVICE_QUOTAS = OperationModel.new(
        name: "ListAWSDefaultServiceQuotas",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REQUESTED_SERVICE_QUOTA_CHANGE_HISTORY = OperationModel.new(
        name: "ListRequestedServiceQuotaChangeHistory",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REQUESTED_SERVICE_QUOTA_CHANGE_HISTORY_BY_QUOTA = OperationModel.new(
        name: "ListRequestedServiceQuotaChangeHistoryByQuota",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_QUOTA_INCREASE_REQUESTS_IN_TEMPLATE = OperationModel.new(
        name: "ListServiceQuotaIncreaseRequestsInTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_QUOTAS = OperationModel.new(
        name: "ListServiceQuotas",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICES = OperationModel.new(
        name: "ListServices",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_SERVICE_QUOTA_INCREASE_REQUEST_INTO_TEMPLATE = OperationModel.new(
        name: "PutServiceQuotaIncreaseRequestIntoTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      REQUEST_SERVICE_QUOTA_INCREASE = OperationModel.new(
        name: "RequestServiceQuotaIncrease",
        http_method: "POST",
        request_uri: "/"
      )

      START_AUTO_MANAGEMENT = OperationModel.new(
        name: "StartAutoManagement",
        http_method: "POST",
        request_uri: "/"
      )

      START_QUOTA_UTILIZATION_REPORT = OperationModel.new(
        name: "StartQuotaUtilizationReport",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_AUTO_MANAGEMENT = OperationModel.new(
        name: "StopAutoManagement",
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

      UPDATE_AUTO_MANAGEMENT = OperationModel.new(
        name: "UpdateAutoManagement",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
