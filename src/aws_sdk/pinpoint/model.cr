module AwsSdk
  module Pinpoint
    module Model
      API_VERSION = "2016-12-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "mobiletargeting"
      ENDPOINT_PREFIX = "pinpoint"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://pinpoint-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://pinpoint-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://pinpoint.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-east-1"]}],"endpoint":{"url":"https://pinpoint.us-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-west-2"]}],"endpoint":{"url":"https://pinpoint.us-west-2.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-west-1"]}],"endpoint":{"url":"https://pinpoint.us-gov-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://pinpoint.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-us-gov",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://pinpoint.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://pinpoint.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_APP = OperationModel.new(
        name: "CreateApp",
        http_method: "POST",
        request_uri: "/v1/apps"
      )

      CREATE_CAMPAIGN = OperationModel.new(
        name: "CreateCampaign",
        http_method: "POST",
        request_uri: "/v1/apps/{application-id}/campaigns"
      )

      CREATE_EMAIL_TEMPLATE = OperationModel.new(
        name: "CreateEmailTemplate",
        http_method: "POST",
        request_uri: "/v1/templates/{template-name}/email"
      )

      CREATE_EXPORT_JOB = OperationModel.new(
        name: "CreateExportJob",
        http_method: "POST",
        request_uri: "/v1/apps/{application-id}/jobs/export"
      )

      CREATE_IMPORT_JOB = OperationModel.new(
        name: "CreateImportJob",
        http_method: "POST",
        request_uri: "/v1/apps/{application-id}/jobs/import"
      )

      CREATE_IN_APP_TEMPLATE = OperationModel.new(
        name: "CreateInAppTemplate",
        http_method: "POST",
        request_uri: "/v1/templates/{template-name}/inapp"
      )

      CREATE_JOURNEY = OperationModel.new(
        name: "CreateJourney",
        http_method: "POST",
        request_uri: "/v1/apps/{application-id}/journeys"
      )

      CREATE_PUSH_TEMPLATE = OperationModel.new(
        name: "CreatePushTemplate",
        http_method: "POST",
        request_uri: "/v1/templates/{template-name}/push"
      )

      CREATE_RECOMMENDER_CONFIGURATION = OperationModel.new(
        name: "CreateRecommenderConfiguration",
        http_method: "POST",
        request_uri: "/v1/recommenders"
      )

      CREATE_SEGMENT = OperationModel.new(
        name: "CreateSegment",
        http_method: "POST",
        request_uri: "/v1/apps/{application-id}/segments"
      )

      CREATE_SMS_TEMPLATE = OperationModel.new(
        name: "CreateSmsTemplate",
        http_method: "POST",
        request_uri: "/v1/templates/{template-name}/sms"
      )

      CREATE_VOICE_TEMPLATE = OperationModel.new(
        name: "CreateVoiceTemplate",
        http_method: "POST",
        request_uri: "/v1/templates/{template-name}/voice"
      )

      DELETE_ADM_CHANNEL = OperationModel.new(
        name: "DeleteAdmChannel",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/channels/adm"
      )

      DELETE_APNS_CHANNEL = OperationModel.new(
        name: "DeleteApnsChannel",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/channels/apns"
      )

      DELETE_APNS_SANDBOX_CHANNEL = OperationModel.new(
        name: "DeleteApnsSandboxChannel",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/channels/apns_sandbox"
      )

      DELETE_APNS_VOIP_CHANNEL = OperationModel.new(
        name: "DeleteApnsVoipChannel",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/channels/apns_voip"
      )

      DELETE_APNS_VOIP_SANDBOX_CHANNEL = OperationModel.new(
        name: "DeleteApnsVoipSandboxChannel",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/channels/apns_voip_sandbox"
      )

      DELETE_APP = OperationModel.new(
        name: "DeleteApp",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}"
      )

      DELETE_BAIDU_CHANNEL = OperationModel.new(
        name: "DeleteBaiduChannel",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/channels/baidu"
      )

      DELETE_CAMPAIGN = OperationModel.new(
        name: "DeleteCampaign",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/campaigns/{campaign-id}"
      )

      DELETE_EMAIL_CHANNEL = OperationModel.new(
        name: "DeleteEmailChannel",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/channels/email"
      )

      DELETE_EMAIL_TEMPLATE = OperationModel.new(
        name: "DeleteEmailTemplate",
        http_method: "DELETE",
        request_uri: "/v1/templates/{template-name}/email"
      )

      DELETE_ENDPOINT = OperationModel.new(
        name: "DeleteEndpoint",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/endpoints/{endpoint-id}"
      )

      DELETE_EVENT_STREAM = OperationModel.new(
        name: "DeleteEventStream",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/eventstream"
      )

      DELETE_GCM_CHANNEL = OperationModel.new(
        name: "DeleteGcmChannel",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/channels/gcm"
      )

      DELETE_IN_APP_TEMPLATE = OperationModel.new(
        name: "DeleteInAppTemplate",
        http_method: "DELETE",
        request_uri: "/v1/templates/{template-name}/inapp"
      )

      DELETE_JOURNEY = OperationModel.new(
        name: "DeleteJourney",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/journeys/{journey-id}"
      )

      DELETE_PUSH_TEMPLATE = OperationModel.new(
        name: "DeletePushTemplate",
        http_method: "DELETE",
        request_uri: "/v1/templates/{template-name}/push"
      )

      DELETE_RECOMMENDER_CONFIGURATION = OperationModel.new(
        name: "DeleteRecommenderConfiguration",
        http_method: "DELETE",
        request_uri: "/v1/recommenders/{recommender-id}"
      )

      DELETE_SEGMENT = OperationModel.new(
        name: "DeleteSegment",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/segments/{segment-id}"
      )

      DELETE_SMS_CHANNEL = OperationModel.new(
        name: "DeleteSmsChannel",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/channels/sms"
      )

      DELETE_SMS_TEMPLATE = OperationModel.new(
        name: "DeleteSmsTemplate",
        http_method: "DELETE",
        request_uri: "/v1/templates/{template-name}/sms"
      )

      DELETE_USER_ENDPOINTS = OperationModel.new(
        name: "DeleteUserEndpoints",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/users/{user-id}"
      )

      DELETE_VOICE_CHANNEL = OperationModel.new(
        name: "DeleteVoiceChannel",
        http_method: "DELETE",
        request_uri: "/v1/apps/{application-id}/channels/voice"
      )

      DELETE_VOICE_TEMPLATE = OperationModel.new(
        name: "DeleteVoiceTemplate",
        http_method: "DELETE",
        request_uri: "/v1/templates/{template-name}/voice"
      )

      GET_ADM_CHANNEL = OperationModel.new(
        name: "GetAdmChannel",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/channels/adm"
      )

      GET_APNS_CHANNEL = OperationModel.new(
        name: "GetApnsChannel",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/channels/apns"
      )

      GET_APNS_SANDBOX_CHANNEL = OperationModel.new(
        name: "GetApnsSandboxChannel",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/channels/apns_sandbox"
      )

      GET_APNS_VOIP_CHANNEL = OperationModel.new(
        name: "GetApnsVoipChannel",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/channels/apns_voip"
      )

      GET_APNS_VOIP_SANDBOX_CHANNEL = OperationModel.new(
        name: "GetApnsVoipSandboxChannel",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/channels/apns_voip_sandbox"
      )

      GET_APP = OperationModel.new(
        name: "GetApp",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}"
      )

      GET_APPLICATION_DATE_RANGE_KPI = OperationModel.new(
        name: "GetApplicationDateRangeKpi",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/kpis/daterange/{kpi-name}"
      )

      GET_APPLICATION_SETTINGS = OperationModel.new(
        name: "GetApplicationSettings",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/settings"
      )

      GET_APPS = OperationModel.new(
        name: "GetApps",
        http_method: "GET",
        request_uri: "/v1/apps"
      )

      GET_BAIDU_CHANNEL = OperationModel.new(
        name: "GetBaiduChannel",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/channels/baidu"
      )

      GET_CAMPAIGN = OperationModel.new(
        name: "GetCampaign",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/campaigns/{campaign-id}"
      )

      GET_CAMPAIGN_ACTIVITIES = OperationModel.new(
        name: "GetCampaignActivities",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/campaigns/{campaign-id}/activities"
      )

      GET_CAMPAIGN_DATE_RANGE_KPI = OperationModel.new(
        name: "GetCampaignDateRangeKpi",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/campaigns/{campaign-id}/kpis/daterange/{kpi-name}"
      )

      GET_CAMPAIGN_VERSION = OperationModel.new(
        name: "GetCampaignVersion",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/campaigns/{campaign-id}/versions/{version}"
      )

      GET_CAMPAIGN_VERSIONS = OperationModel.new(
        name: "GetCampaignVersions",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/campaigns/{campaign-id}/versions"
      )

      GET_CAMPAIGNS = OperationModel.new(
        name: "GetCampaigns",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/campaigns"
      )

      GET_CHANNELS = OperationModel.new(
        name: "GetChannels",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/channels"
      )

      GET_EMAIL_CHANNEL = OperationModel.new(
        name: "GetEmailChannel",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/channels/email"
      )

      GET_EMAIL_TEMPLATE = OperationModel.new(
        name: "GetEmailTemplate",
        http_method: "GET",
        request_uri: "/v1/templates/{template-name}/email"
      )

      GET_ENDPOINT = OperationModel.new(
        name: "GetEndpoint",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/endpoints/{endpoint-id}"
      )

      GET_EVENT_STREAM = OperationModel.new(
        name: "GetEventStream",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/eventstream"
      )

      GET_EXPORT_JOB = OperationModel.new(
        name: "GetExportJob",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/jobs/export/{job-id}"
      )

      GET_EXPORT_JOBS = OperationModel.new(
        name: "GetExportJobs",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/jobs/export"
      )

      GET_GCM_CHANNEL = OperationModel.new(
        name: "GetGcmChannel",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/channels/gcm"
      )

      GET_IMPORT_JOB = OperationModel.new(
        name: "GetImportJob",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/jobs/import/{job-id}"
      )

      GET_IMPORT_JOBS = OperationModel.new(
        name: "GetImportJobs",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/jobs/import"
      )

      GET_IN_APP_MESSAGES = OperationModel.new(
        name: "GetInAppMessages",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/endpoints/{endpoint-id}/inappmessages"
      )

      GET_IN_APP_TEMPLATE = OperationModel.new(
        name: "GetInAppTemplate",
        http_method: "GET",
        request_uri: "/v1/templates/{template-name}/inapp"
      )

      GET_JOURNEY = OperationModel.new(
        name: "GetJourney",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/journeys/{journey-id}"
      )

      GET_JOURNEY_DATE_RANGE_KPI = OperationModel.new(
        name: "GetJourneyDateRangeKpi",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/journeys/{journey-id}/kpis/daterange/{kpi-name}"
      )

      GET_JOURNEY_EXECUTION_ACTIVITY_METRICS = OperationModel.new(
        name: "GetJourneyExecutionActivityMetrics",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/journeys/{journey-id}/activities/{journey-activity-id}/execution-metrics"
      )

      GET_JOURNEY_EXECUTION_METRICS = OperationModel.new(
        name: "GetJourneyExecutionMetrics",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/journeys/{journey-id}/execution-metrics"
      )

      GET_JOURNEY_RUN_EXECUTION_ACTIVITY_METRICS = OperationModel.new(
        name: "GetJourneyRunExecutionActivityMetrics",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/journeys/{journey-id}/runs/{run-id}/activities/{journey-activity-id}/execution-metrics"
      )

      GET_JOURNEY_RUN_EXECUTION_METRICS = OperationModel.new(
        name: "GetJourneyRunExecutionMetrics",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/journeys/{journey-id}/runs/{run-id}/execution-metrics"
      )

      GET_JOURNEY_RUNS = OperationModel.new(
        name: "GetJourneyRuns",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/journeys/{journey-id}/runs"
      )

      GET_PUSH_TEMPLATE = OperationModel.new(
        name: "GetPushTemplate",
        http_method: "GET",
        request_uri: "/v1/templates/{template-name}/push"
      )

      GET_RECOMMENDER_CONFIGURATION = OperationModel.new(
        name: "GetRecommenderConfiguration",
        http_method: "GET",
        request_uri: "/v1/recommenders/{recommender-id}"
      )

      GET_RECOMMENDER_CONFIGURATIONS = OperationModel.new(
        name: "GetRecommenderConfigurations",
        http_method: "GET",
        request_uri: "/v1/recommenders"
      )

      GET_SEGMENT = OperationModel.new(
        name: "GetSegment",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/segments/{segment-id}"
      )

      GET_SEGMENT_EXPORT_JOBS = OperationModel.new(
        name: "GetSegmentExportJobs",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/segments/{segment-id}/jobs/export"
      )

      GET_SEGMENT_IMPORT_JOBS = OperationModel.new(
        name: "GetSegmentImportJobs",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/segments/{segment-id}/jobs/import"
      )

      GET_SEGMENT_VERSION = OperationModel.new(
        name: "GetSegmentVersion",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/segments/{segment-id}/versions/{version}"
      )

      GET_SEGMENT_VERSIONS = OperationModel.new(
        name: "GetSegmentVersions",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/segments/{segment-id}/versions"
      )

      GET_SEGMENTS = OperationModel.new(
        name: "GetSegments",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/segments"
      )

      GET_SMS_CHANNEL = OperationModel.new(
        name: "GetSmsChannel",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/channels/sms"
      )

      GET_SMS_TEMPLATE = OperationModel.new(
        name: "GetSmsTemplate",
        http_method: "GET",
        request_uri: "/v1/templates/{template-name}/sms"
      )

      GET_USER_ENDPOINTS = OperationModel.new(
        name: "GetUserEndpoints",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/users/{user-id}"
      )

      GET_VOICE_CHANNEL = OperationModel.new(
        name: "GetVoiceChannel",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/channels/voice"
      )

      GET_VOICE_TEMPLATE = OperationModel.new(
        name: "GetVoiceTemplate",
        http_method: "GET",
        request_uri: "/v1/templates/{template-name}/voice"
      )

      LIST_JOURNEYS = OperationModel.new(
        name: "ListJourneys",
        http_method: "GET",
        request_uri: "/v1/apps/{application-id}/journeys"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v1/tags/{resource-arn}"
      )

      LIST_TEMPLATE_VERSIONS = OperationModel.new(
        name: "ListTemplateVersions",
        http_method: "GET",
        request_uri: "/v1/templates/{template-name}/{template-type}/versions"
      )

      LIST_TEMPLATES = OperationModel.new(
        name: "ListTemplates",
        http_method: "GET",
        request_uri: "/v1/templates"
      )

      PHONE_NUMBER_VALIDATE = OperationModel.new(
        name: "PhoneNumberValidate",
        http_method: "POST",
        request_uri: "/v1/phone/number/validate"
      )

      PUT_EVENT_STREAM = OperationModel.new(
        name: "PutEventStream",
        http_method: "POST",
        request_uri: "/v1/apps/{application-id}/eventstream"
      )

      PUT_EVENTS = OperationModel.new(
        name: "PutEvents",
        http_method: "POST",
        request_uri: "/v1/apps/{application-id}/events"
      )

      REMOVE_ATTRIBUTES = OperationModel.new(
        name: "RemoveAttributes",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/attributes/{attribute-type}"
      )

      SEND_MESSAGES = OperationModel.new(
        name: "SendMessages",
        http_method: "POST",
        request_uri: "/v1/apps/{application-id}/messages"
      )

      SEND_OTP_MESSAGE = OperationModel.new(
        name: "SendOTPMessage",
        http_method: "POST",
        request_uri: "/v1/apps/{application-id}/otp"
      )

      SEND_USERS_MESSAGES = OperationModel.new(
        name: "SendUsersMessages",
        http_method: "POST",
        request_uri: "/v1/apps/{application-id}/users-messages"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/v1/tags/{resource-arn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/v1/tags/{resource-arn}"
      )

      UPDATE_ADM_CHANNEL = OperationModel.new(
        name: "UpdateAdmChannel",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/channels/adm"
      )

      UPDATE_APNS_CHANNEL = OperationModel.new(
        name: "UpdateApnsChannel",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/channels/apns"
      )

      UPDATE_APNS_SANDBOX_CHANNEL = OperationModel.new(
        name: "UpdateApnsSandboxChannel",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/channels/apns_sandbox"
      )

      UPDATE_APNS_VOIP_CHANNEL = OperationModel.new(
        name: "UpdateApnsVoipChannel",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/channels/apns_voip"
      )

      UPDATE_APNS_VOIP_SANDBOX_CHANNEL = OperationModel.new(
        name: "UpdateApnsVoipSandboxChannel",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/channels/apns_voip_sandbox"
      )

      UPDATE_APPLICATION_SETTINGS = OperationModel.new(
        name: "UpdateApplicationSettings",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/settings"
      )

      UPDATE_BAIDU_CHANNEL = OperationModel.new(
        name: "UpdateBaiduChannel",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/channels/baidu"
      )

      UPDATE_CAMPAIGN = OperationModel.new(
        name: "UpdateCampaign",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/campaigns/{campaign-id}"
      )

      UPDATE_EMAIL_CHANNEL = OperationModel.new(
        name: "UpdateEmailChannel",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/channels/email"
      )

      UPDATE_EMAIL_TEMPLATE = OperationModel.new(
        name: "UpdateEmailTemplate",
        http_method: "PUT",
        request_uri: "/v1/templates/{template-name}/email"
      )

      UPDATE_ENDPOINT = OperationModel.new(
        name: "UpdateEndpoint",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/endpoints/{endpoint-id}"
      )

      UPDATE_ENDPOINTS_BATCH = OperationModel.new(
        name: "UpdateEndpointsBatch",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/endpoints"
      )

      UPDATE_GCM_CHANNEL = OperationModel.new(
        name: "UpdateGcmChannel",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/channels/gcm"
      )

      UPDATE_IN_APP_TEMPLATE = OperationModel.new(
        name: "UpdateInAppTemplate",
        http_method: "PUT",
        request_uri: "/v1/templates/{template-name}/inapp"
      )

      UPDATE_JOURNEY = OperationModel.new(
        name: "UpdateJourney",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/journeys/{journey-id}"
      )

      UPDATE_JOURNEY_STATE = OperationModel.new(
        name: "UpdateJourneyState",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/journeys/{journey-id}/state"
      )

      UPDATE_PUSH_TEMPLATE = OperationModel.new(
        name: "UpdatePushTemplate",
        http_method: "PUT",
        request_uri: "/v1/templates/{template-name}/push"
      )

      UPDATE_RECOMMENDER_CONFIGURATION = OperationModel.new(
        name: "UpdateRecommenderConfiguration",
        http_method: "PUT",
        request_uri: "/v1/recommenders/{recommender-id}"
      )

      UPDATE_SEGMENT = OperationModel.new(
        name: "UpdateSegment",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/segments/{segment-id}"
      )

      UPDATE_SMS_CHANNEL = OperationModel.new(
        name: "UpdateSmsChannel",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/channels/sms"
      )

      UPDATE_SMS_TEMPLATE = OperationModel.new(
        name: "UpdateSmsTemplate",
        http_method: "PUT",
        request_uri: "/v1/templates/{template-name}/sms"
      )

      UPDATE_TEMPLATE_ACTIVE_VERSION = OperationModel.new(
        name: "UpdateTemplateActiveVersion",
        http_method: "PUT",
        request_uri: "/v1/templates/{template-name}/{template-type}/active-version"
      )

      UPDATE_VOICE_CHANNEL = OperationModel.new(
        name: "UpdateVoiceChannel",
        http_method: "PUT",
        request_uri: "/v1/apps/{application-id}/channels/voice"
      )

      UPDATE_VOICE_TEMPLATE = OperationModel.new(
        name: "UpdateVoiceTemplate",
        http_method: "PUT",
        request_uri: "/v1/templates/{template-name}/voice"
      )

      VERIFY_OTP_MESSAGE = OperationModel.new(
        name: "VerifyOTPMessage",
        http_method: "POST",
        request_uri: "/v1/apps/{application-id}/verify-otp"
      )
    end
  end
end
