module AwsSdk
  module ConnectCampaigns
    module Model
      API_VERSION = "2021-01-30"
      TARGET_PREFIX = ""
      SIGNING_NAME = "connect-campaigns"
      ENDPOINT_PREFIX = "connect-campaigns"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://connect-campaigns-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://connect-campaigns-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://connect-campaigns.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://connect-campaigns.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CAMPAIGN = OperationModel.new(
        name: "CreateCampaign",
        http_method: "PUT",
        request_uri: "/campaigns"
      )

      DELETE_CAMPAIGN = OperationModel.new(
        name: "DeleteCampaign",
        http_method: "DELETE",
        request_uri: "/campaigns/{id}"
      )

      DELETE_CONNECT_INSTANCE_CONFIG = OperationModel.new(
        name: "DeleteConnectInstanceConfig",
        http_method: "DELETE",
        request_uri: "/connect-instance/{connectInstanceId}/config"
      )

      DELETE_INSTANCE_ONBOARDING_JOB = OperationModel.new(
        name: "DeleteInstanceOnboardingJob",
        http_method: "DELETE",
        request_uri: "/connect-instance/{connectInstanceId}/onboarding"
      )

      DESCRIBE_CAMPAIGN = OperationModel.new(
        name: "DescribeCampaign",
        http_method: "GET",
        request_uri: "/campaigns/{id}"
      )

      GET_CAMPAIGN_STATE = OperationModel.new(
        name: "GetCampaignState",
        http_method: "GET",
        request_uri: "/campaigns/{id}/state"
      )

      GET_CAMPAIGN_STATE_BATCH = OperationModel.new(
        name: "GetCampaignStateBatch",
        http_method: "POST",
        request_uri: "/campaigns-state"
      )

      GET_CONNECT_INSTANCE_CONFIG = OperationModel.new(
        name: "GetConnectInstanceConfig",
        http_method: "GET",
        request_uri: "/connect-instance/{connectInstanceId}/config"
      )

      GET_INSTANCE_ONBOARDING_JOB_STATUS = OperationModel.new(
        name: "GetInstanceOnboardingJobStatus",
        http_method: "GET",
        request_uri: "/connect-instance/{connectInstanceId}/onboarding"
      )

      LIST_CAMPAIGNS = OperationModel.new(
        name: "ListCampaigns",
        http_method: "POST",
        request_uri: "/campaigns-summary"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{arn}"
      )

      PAUSE_CAMPAIGN = OperationModel.new(
        name: "PauseCampaign",
        http_method: "POST",
        request_uri: "/campaigns/{id}/pause"
      )

      PUT_DIAL_REQUEST_BATCH = OperationModel.new(
        name: "PutDialRequestBatch",
        http_method: "PUT",
        request_uri: "/campaigns/{id}/dial-requests"
      )

      RESUME_CAMPAIGN = OperationModel.new(
        name: "ResumeCampaign",
        http_method: "POST",
        request_uri: "/campaigns/{id}/resume"
      )

      START_CAMPAIGN = OperationModel.new(
        name: "StartCampaign",
        http_method: "POST",
        request_uri: "/campaigns/{id}/start"
      )

      START_INSTANCE_ONBOARDING_JOB = OperationModel.new(
        name: "StartInstanceOnboardingJob",
        http_method: "PUT",
        request_uri: "/connect-instance/{connectInstanceId}/onboarding"
      )

      STOP_CAMPAIGN = OperationModel.new(
        name: "StopCampaign",
        http_method: "POST",
        request_uri: "/campaigns/{id}/stop"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{arn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{arn}"
      )

      UPDATE_CAMPAIGN_DIALER_CONFIG = OperationModel.new(
        name: "UpdateCampaignDialerConfig",
        http_method: "POST",
        request_uri: "/campaigns/{id}/dialer-config"
      )

      UPDATE_CAMPAIGN_NAME = OperationModel.new(
        name: "UpdateCampaignName",
        http_method: "POST",
        request_uri: "/campaigns/{id}/name"
      )

      UPDATE_CAMPAIGN_OUTBOUND_CALL_CONFIG = OperationModel.new(
        name: "UpdateCampaignOutboundCallConfig",
        http_method: "POST",
        request_uri: "/campaigns/{id}/outbound-call-config"
      )
    end
  end
end
