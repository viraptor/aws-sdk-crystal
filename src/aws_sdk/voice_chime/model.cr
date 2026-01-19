module AwsSdk
  module ChimeSDKVoice
    module Model
      API_VERSION = "2022-08-03"
      TARGET_PREFIX = ""
      SIGNING_NAME = "chime"
      ENDPOINT_PREFIX = "voice-chime"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://voice-chime-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://voice-chime-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://voice-chime.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://voice-chime.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_PHONE_NUMBERS_WITH_VOICE_CONNECTOR = OperationModel.new(
        name: "AssociatePhoneNumbersWithVoiceConnector",
        http_method: "POST",
        request_uri: "/voice-connectors/{voiceConnectorId}?operation=associate-phone-numbers"
      )

      ASSOCIATE_PHONE_NUMBERS_WITH_VOICE_CONNECTOR_GROUP = OperationModel.new(
        name: "AssociatePhoneNumbersWithVoiceConnectorGroup",
        http_method: "POST",
        request_uri: "/voice-connector-groups/{voiceConnectorGroupId}?operation=associate-phone-numbers"
      )

      BATCH_DELETE_PHONE_NUMBER = OperationModel.new(
        name: "BatchDeletePhoneNumber",
        http_method: "POST",
        request_uri: "/phone-numbers?operation=batch-delete"
      )

      BATCH_UPDATE_PHONE_NUMBER = OperationModel.new(
        name: "BatchUpdatePhoneNumber",
        http_method: "POST",
        request_uri: "/phone-numbers?operation=batch-update"
      )

      CREATE_PHONE_NUMBER_ORDER = OperationModel.new(
        name: "CreatePhoneNumberOrder",
        http_method: "POST",
        request_uri: "/phone-number-orders"
      )

      CREATE_PROXY_SESSION = OperationModel.new(
        name: "CreateProxySession",
        http_method: "POST",
        request_uri: "/voice-connectors/{voiceConnectorId}/proxy-sessions"
      )

      CREATE_SIP_MEDIA_APPLICATION = OperationModel.new(
        name: "CreateSipMediaApplication",
        http_method: "POST",
        request_uri: "/sip-media-applications"
      )

      CREATE_SIP_MEDIA_APPLICATION_CALL = OperationModel.new(
        name: "CreateSipMediaApplicationCall",
        http_method: "POST",
        request_uri: "/sip-media-applications/{sipMediaApplicationId}/calls"
      )

      CREATE_SIP_RULE = OperationModel.new(
        name: "CreateSipRule",
        http_method: "POST",
        request_uri: "/sip-rules"
      )

      CREATE_VOICE_CONNECTOR = OperationModel.new(
        name: "CreateVoiceConnector",
        http_method: "POST",
        request_uri: "/voice-connectors"
      )

      CREATE_VOICE_CONNECTOR_GROUP = OperationModel.new(
        name: "CreateVoiceConnectorGroup",
        http_method: "POST",
        request_uri: "/voice-connector-groups"
      )

      CREATE_VOICE_PROFILE = OperationModel.new(
        name: "CreateVoiceProfile",
        http_method: "POST",
        request_uri: "/voice-profiles"
      )

      CREATE_VOICE_PROFILE_DOMAIN = OperationModel.new(
        name: "CreateVoiceProfileDomain",
        http_method: "POST",
        request_uri: "/voice-profile-domains"
      )

      DELETE_PHONE_NUMBER = OperationModel.new(
        name: "DeletePhoneNumber",
        http_method: "DELETE",
        request_uri: "/phone-numbers/{phoneNumberId}"
      )

      DELETE_PROXY_SESSION = OperationModel.new(
        name: "DeleteProxySession",
        http_method: "DELETE",
        request_uri: "/voice-connectors/{voiceConnectorId}/proxy-sessions/{proxySessionId}"
      )

      DELETE_SIP_MEDIA_APPLICATION = OperationModel.new(
        name: "DeleteSipMediaApplication",
        http_method: "DELETE",
        request_uri: "/sip-media-applications/{sipMediaApplicationId}"
      )

      DELETE_SIP_RULE = OperationModel.new(
        name: "DeleteSipRule",
        http_method: "DELETE",
        request_uri: "/sip-rules/{sipRuleId}"
      )

      DELETE_VOICE_CONNECTOR = OperationModel.new(
        name: "DeleteVoiceConnector",
        http_method: "DELETE",
        request_uri: "/voice-connectors/{voiceConnectorId}"
      )

      DELETE_VOICE_CONNECTOR_EMERGENCY_CALLING_CONFIGURATION = OperationModel.new(
        name: "DeleteVoiceConnectorEmergencyCallingConfiguration",
        http_method: "DELETE",
        request_uri: "/voice-connectors/{voiceConnectorId}/emergency-calling-configuration"
      )

      DELETE_VOICE_CONNECTOR_EXTERNAL_SYSTEMS_CONFIGURATION = OperationModel.new(
        name: "DeleteVoiceConnectorExternalSystemsConfiguration",
        http_method: "DELETE",
        request_uri: "/voice-connectors/{voiceConnectorId}/external-systems-configuration"
      )

      DELETE_VOICE_CONNECTOR_GROUP = OperationModel.new(
        name: "DeleteVoiceConnectorGroup",
        http_method: "DELETE",
        request_uri: "/voice-connector-groups/{voiceConnectorGroupId}"
      )

      DELETE_VOICE_CONNECTOR_ORIGINATION = OperationModel.new(
        name: "DeleteVoiceConnectorOrigination",
        http_method: "DELETE",
        request_uri: "/voice-connectors/{voiceConnectorId}/origination"
      )

      DELETE_VOICE_CONNECTOR_PROXY = OperationModel.new(
        name: "DeleteVoiceConnectorProxy",
        http_method: "DELETE",
        request_uri: "/voice-connectors/{voiceConnectorId}/programmable-numbers/proxy"
      )

      DELETE_VOICE_CONNECTOR_STREAMING_CONFIGURATION = OperationModel.new(
        name: "DeleteVoiceConnectorStreamingConfiguration",
        http_method: "DELETE",
        request_uri: "/voice-connectors/{voiceConnectorId}/streaming-configuration"
      )

      DELETE_VOICE_CONNECTOR_TERMINATION = OperationModel.new(
        name: "DeleteVoiceConnectorTermination",
        http_method: "DELETE",
        request_uri: "/voice-connectors/{voiceConnectorId}/termination"
      )

      DELETE_VOICE_CONNECTOR_TERMINATION_CREDENTIALS = OperationModel.new(
        name: "DeleteVoiceConnectorTerminationCredentials",
        http_method: "POST",
        request_uri: "/voice-connectors/{voiceConnectorId}/termination/credentials?operation=delete"
      )

      DELETE_VOICE_PROFILE = OperationModel.new(
        name: "DeleteVoiceProfile",
        http_method: "DELETE",
        request_uri: "/voice-profiles/{VoiceProfileId}"
      )

      DELETE_VOICE_PROFILE_DOMAIN = OperationModel.new(
        name: "DeleteVoiceProfileDomain",
        http_method: "DELETE",
        request_uri: "/voice-profile-domains/{VoiceProfileDomainId}"
      )

      DISASSOCIATE_PHONE_NUMBERS_FROM_VOICE_CONNECTOR = OperationModel.new(
        name: "DisassociatePhoneNumbersFromVoiceConnector",
        http_method: "POST",
        request_uri: "/voice-connectors/{voiceConnectorId}?operation=disassociate-phone-numbers"
      )

      DISASSOCIATE_PHONE_NUMBERS_FROM_VOICE_CONNECTOR_GROUP = OperationModel.new(
        name: "DisassociatePhoneNumbersFromVoiceConnectorGroup",
        http_method: "POST",
        request_uri: "/voice-connector-groups/{voiceConnectorGroupId}?operation=disassociate-phone-numbers"
      )

      GET_GLOBAL_SETTINGS = OperationModel.new(
        name: "GetGlobalSettings",
        http_method: "GET",
        request_uri: "/settings"
      )

      GET_PHONE_NUMBER = OperationModel.new(
        name: "GetPhoneNumber",
        http_method: "GET",
        request_uri: "/phone-numbers/{phoneNumberId}"
      )

      GET_PHONE_NUMBER_ORDER = OperationModel.new(
        name: "GetPhoneNumberOrder",
        http_method: "GET",
        request_uri: "/phone-number-orders/{phoneNumberOrderId}"
      )

      GET_PHONE_NUMBER_SETTINGS = OperationModel.new(
        name: "GetPhoneNumberSettings",
        http_method: "GET",
        request_uri: "/settings/phone-number"
      )

      GET_PROXY_SESSION = OperationModel.new(
        name: "GetProxySession",
        http_method: "GET",
        request_uri: "/voice-connectors/{voiceConnectorId}/proxy-sessions/{proxySessionId}"
      )

      GET_SIP_MEDIA_APPLICATION = OperationModel.new(
        name: "GetSipMediaApplication",
        http_method: "GET",
        request_uri: "/sip-media-applications/{sipMediaApplicationId}"
      )

      GET_SIP_MEDIA_APPLICATION_ALEXA_SKILL_CONFIGURATION = OperationModel.new(
        name: "GetSipMediaApplicationAlexaSkillConfiguration",
        http_method: "GET",
        request_uri: "/sip-media-applications/{sipMediaApplicationId}/alexa-skill-configuration"
      )

      GET_SIP_MEDIA_APPLICATION_LOGGING_CONFIGURATION = OperationModel.new(
        name: "GetSipMediaApplicationLoggingConfiguration",
        http_method: "GET",
        request_uri: "/sip-media-applications/{sipMediaApplicationId}/logging-configuration"
      )

      GET_SIP_RULE = OperationModel.new(
        name: "GetSipRule",
        http_method: "GET",
        request_uri: "/sip-rules/{sipRuleId}"
      )

      GET_SPEAKER_SEARCH_TASK = OperationModel.new(
        name: "GetSpeakerSearchTask",
        http_method: "GET",
        request_uri: "/voice-connectors/{VoiceConnectorId}/speaker-search-tasks/{SpeakerSearchTaskId}"
      )

      GET_VOICE_CONNECTOR = OperationModel.new(
        name: "GetVoiceConnector",
        http_method: "GET",
        request_uri: "/voice-connectors/{voiceConnectorId}"
      )

      GET_VOICE_CONNECTOR_EMERGENCY_CALLING_CONFIGURATION = OperationModel.new(
        name: "GetVoiceConnectorEmergencyCallingConfiguration",
        http_method: "GET",
        request_uri: "/voice-connectors/{voiceConnectorId}/emergency-calling-configuration"
      )

      GET_VOICE_CONNECTOR_EXTERNAL_SYSTEMS_CONFIGURATION = OperationModel.new(
        name: "GetVoiceConnectorExternalSystemsConfiguration",
        http_method: "GET",
        request_uri: "/voice-connectors/{voiceConnectorId}/external-systems-configuration"
      )

      GET_VOICE_CONNECTOR_GROUP = OperationModel.new(
        name: "GetVoiceConnectorGroup",
        http_method: "GET",
        request_uri: "/voice-connector-groups/{voiceConnectorGroupId}"
      )

      GET_VOICE_CONNECTOR_LOGGING_CONFIGURATION = OperationModel.new(
        name: "GetVoiceConnectorLoggingConfiguration",
        http_method: "GET",
        request_uri: "/voice-connectors/{voiceConnectorId}/logging-configuration"
      )

      GET_VOICE_CONNECTOR_ORIGINATION = OperationModel.new(
        name: "GetVoiceConnectorOrigination",
        http_method: "GET",
        request_uri: "/voice-connectors/{voiceConnectorId}/origination"
      )

      GET_VOICE_CONNECTOR_PROXY = OperationModel.new(
        name: "GetVoiceConnectorProxy",
        http_method: "GET",
        request_uri: "/voice-connectors/{voiceConnectorId}/programmable-numbers/proxy"
      )

      GET_VOICE_CONNECTOR_STREAMING_CONFIGURATION = OperationModel.new(
        name: "GetVoiceConnectorStreamingConfiguration",
        http_method: "GET",
        request_uri: "/voice-connectors/{voiceConnectorId}/streaming-configuration"
      )

      GET_VOICE_CONNECTOR_TERMINATION = OperationModel.new(
        name: "GetVoiceConnectorTermination",
        http_method: "GET",
        request_uri: "/voice-connectors/{voiceConnectorId}/termination"
      )

      GET_VOICE_CONNECTOR_TERMINATION_HEALTH = OperationModel.new(
        name: "GetVoiceConnectorTerminationHealth",
        http_method: "GET",
        request_uri: "/voice-connectors/{voiceConnectorId}/termination/health"
      )

      GET_VOICE_PROFILE = OperationModel.new(
        name: "GetVoiceProfile",
        http_method: "GET",
        request_uri: "/voice-profiles/{VoiceProfileId}"
      )

      GET_VOICE_PROFILE_DOMAIN = OperationModel.new(
        name: "GetVoiceProfileDomain",
        http_method: "GET",
        request_uri: "/voice-profile-domains/{VoiceProfileDomainId}"
      )

      GET_VOICE_TONE_ANALYSIS_TASK = OperationModel.new(
        name: "GetVoiceToneAnalysisTask",
        http_method: "GET",
        request_uri: "/voice-connectors/{VoiceConnectorId}/voice-tone-analysis-tasks/{VoiceToneAnalysisTaskId}"
      )

      LIST_AVAILABLE_VOICE_CONNECTOR_REGIONS = OperationModel.new(
        name: "ListAvailableVoiceConnectorRegions",
        http_method: "GET",
        request_uri: "/voice-connector-regions"
      )

      LIST_PHONE_NUMBER_ORDERS = OperationModel.new(
        name: "ListPhoneNumberOrders",
        http_method: "GET",
        request_uri: "/phone-number-orders"
      )

      LIST_PHONE_NUMBERS = OperationModel.new(
        name: "ListPhoneNumbers",
        http_method: "GET",
        request_uri: "/phone-numbers"
      )

      LIST_PROXY_SESSIONS = OperationModel.new(
        name: "ListProxySessions",
        http_method: "GET",
        request_uri: "/voice-connectors/{voiceConnectorId}/proxy-sessions"
      )

      LIST_SIP_MEDIA_APPLICATIONS = OperationModel.new(
        name: "ListSipMediaApplications",
        http_method: "GET",
        request_uri: "/sip-media-applications"
      )

      LIST_SIP_RULES = OperationModel.new(
        name: "ListSipRules",
        http_method: "GET",
        request_uri: "/sip-rules"
      )

      LIST_SUPPORTED_PHONE_NUMBER_COUNTRIES = OperationModel.new(
        name: "ListSupportedPhoneNumberCountries",
        http_method: "GET",
        request_uri: "/phone-number-countries"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags"
      )

      LIST_VOICE_CONNECTOR_GROUPS = OperationModel.new(
        name: "ListVoiceConnectorGroups",
        http_method: "GET",
        request_uri: "/voice-connector-groups"
      )

      LIST_VOICE_CONNECTOR_TERMINATION_CREDENTIALS = OperationModel.new(
        name: "ListVoiceConnectorTerminationCredentials",
        http_method: "GET",
        request_uri: "/voice-connectors/{voiceConnectorId}/termination/credentials"
      )

      LIST_VOICE_CONNECTORS = OperationModel.new(
        name: "ListVoiceConnectors",
        http_method: "GET",
        request_uri: "/voice-connectors"
      )

      LIST_VOICE_PROFILE_DOMAINS = OperationModel.new(
        name: "ListVoiceProfileDomains",
        http_method: "GET",
        request_uri: "/voice-profile-domains"
      )

      LIST_VOICE_PROFILES = OperationModel.new(
        name: "ListVoiceProfiles",
        http_method: "GET",
        request_uri: "/voice-profiles"
      )

      PUT_SIP_MEDIA_APPLICATION_ALEXA_SKILL_CONFIGURATION = OperationModel.new(
        name: "PutSipMediaApplicationAlexaSkillConfiguration",
        http_method: "PUT",
        request_uri: "/sip-media-applications/{sipMediaApplicationId}/alexa-skill-configuration"
      )

      PUT_SIP_MEDIA_APPLICATION_LOGGING_CONFIGURATION = OperationModel.new(
        name: "PutSipMediaApplicationLoggingConfiguration",
        http_method: "PUT",
        request_uri: "/sip-media-applications/{sipMediaApplicationId}/logging-configuration"
      )

      PUT_VOICE_CONNECTOR_EMERGENCY_CALLING_CONFIGURATION = OperationModel.new(
        name: "PutVoiceConnectorEmergencyCallingConfiguration",
        http_method: "PUT",
        request_uri: "/voice-connectors/{voiceConnectorId}/emergency-calling-configuration"
      )

      PUT_VOICE_CONNECTOR_EXTERNAL_SYSTEMS_CONFIGURATION = OperationModel.new(
        name: "PutVoiceConnectorExternalSystemsConfiguration",
        http_method: "PUT",
        request_uri: "/voice-connectors/{voiceConnectorId}/external-systems-configuration"
      )

      PUT_VOICE_CONNECTOR_LOGGING_CONFIGURATION = OperationModel.new(
        name: "PutVoiceConnectorLoggingConfiguration",
        http_method: "PUT",
        request_uri: "/voice-connectors/{voiceConnectorId}/logging-configuration"
      )

      PUT_VOICE_CONNECTOR_ORIGINATION = OperationModel.new(
        name: "PutVoiceConnectorOrigination",
        http_method: "PUT",
        request_uri: "/voice-connectors/{voiceConnectorId}/origination"
      )

      PUT_VOICE_CONNECTOR_PROXY = OperationModel.new(
        name: "PutVoiceConnectorProxy",
        http_method: "PUT",
        request_uri: "/voice-connectors/{voiceConnectorId}/programmable-numbers/proxy"
      )

      PUT_VOICE_CONNECTOR_STREAMING_CONFIGURATION = OperationModel.new(
        name: "PutVoiceConnectorStreamingConfiguration",
        http_method: "PUT",
        request_uri: "/voice-connectors/{voiceConnectorId}/streaming-configuration"
      )

      PUT_VOICE_CONNECTOR_TERMINATION = OperationModel.new(
        name: "PutVoiceConnectorTermination",
        http_method: "PUT",
        request_uri: "/voice-connectors/{voiceConnectorId}/termination"
      )

      PUT_VOICE_CONNECTOR_TERMINATION_CREDENTIALS = OperationModel.new(
        name: "PutVoiceConnectorTerminationCredentials",
        http_method: "POST",
        request_uri: "/voice-connectors/{voiceConnectorId}/termination/credentials?operation=put"
      )

      RESTORE_PHONE_NUMBER = OperationModel.new(
        name: "RestorePhoneNumber",
        http_method: "POST",
        request_uri: "/phone-numbers/{phoneNumberId}?operation=restore"
      )

      SEARCH_AVAILABLE_PHONE_NUMBERS = OperationModel.new(
        name: "SearchAvailablePhoneNumbers",
        http_method: "GET",
        request_uri: "/search?type=phone-numbers"
      )

      START_SPEAKER_SEARCH_TASK = OperationModel.new(
        name: "StartSpeakerSearchTask",
        http_method: "POST",
        request_uri: "/voice-connectors/{VoiceConnectorId}/speaker-search-tasks"
      )

      START_VOICE_TONE_ANALYSIS_TASK = OperationModel.new(
        name: "StartVoiceToneAnalysisTask",
        http_method: "POST",
        request_uri: "/voice-connectors/{VoiceConnectorId}/voice-tone-analysis-tasks"
      )

      STOP_SPEAKER_SEARCH_TASK = OperationModel.new(
        name: "StopSpeakerSearchTask",
        http_method: "POST",
        request_uri: "/voice-connectors/{VoiceConnectorId}/speaker-search-tasks/{SpeakerSearchTaskId}?operation=stop"
      )

      STOP_VOICE_TONE_ANALYSIS_TASK = OperationModel.new(
        name: "StopVoiceToneAnalysisTask",
        http_method: "POST",
        request_uri: "/voice-connectors/{VoiceConnectorId}/voice-tone-analysis-tasks/{VoiceToneAnalysisTaskId}?operation=stop"
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

      UPDATE_GLOBAL_SETTINGS = OperationModel.new(
        name: "UpdateGlobalSettings",
        http_method: "PUT",
        request_uri: "/settings"
      )

      UPDATE_PHONE_NUMBER = OperationModel.new(
        name: "UpdatePhoneNumber",
        http_method: "POST",
        request_uri: "/phone-numbers/{phoneNumberId}"
      )

      UPDATE_PHONE_NUMBER_SETTINGS = OperationModel.new(
        name: "UpdatePhoneNumberSettings",
        http_method: "PUT",
        request_uri: "/settings/phone-number"
      )

      UPDATE_PROXY_SESSION = OperationModel.new(
        name: "UpdateProxySession",
        http_method: "POST",
        request_uri: "/voice-connectors/{voiceConnectorId}/proxy-sessions/{proxySessionId}"
      )

      UPDATE_SIP_MEDIA_APPLICATION = OperationModel.new(
        name: "UpdateSipMediaApplication",
        http_method: "PUT",
        request_uri: "/sip-media-applications/{sipMediaApplicationId}"
      )

      UPDATE_SIP_MEDIA_APPLICATION_CALL = OperationModel.new(
        name: "UpdateSipMediaApplicationCall",
        http_method: "POST",
        request_uri: "/sip-media-applications/{sipMediaApplicationId}/calls/{transactionId}"
      )

      UPDATE_SIP_RULE = OperationModel.new(
        name: "UpdateSipRule",
        http_method: "PUT",
        request_uri: "/sip-rules/{sipRuleId}"
      )

      UPDATE_VOICE_CONNECTOR = OperationModel.new(
        name: "UpdateVoiceConnector",
        http_method: "PUT",
        request_uri: "/voice-connectors/{voiceConnectorId}"
      )

      UPDATE_VOICE_CONNECTOR_GROUP = OperationModel.new(
        name: "UpdateVoiceConnectorGroup",
        http_method: "PUT",
        request_uri: "/voice-connector-groups/{voiceConnectorGroupId}"
      )

      UPDATE_VOICE_PROFILE = OperationModel.new(
        name: "UpdateVoiceProfile",
        http_method: "PUT",
        request_uri: "/voice-profiles/{VoiceProfileId}"
      )

      UPDATE_VOICE_PROFILE_DOMAIN = OperationModel.new(
        name: "UpdateVoiceProfileDomain",
        http_method: "PUT",
        request_uri: "/voice-profile-domains/{VoiceProfileDomainId}"
      )

      VALIDATE_E911_ADDRESS = OperationModel.new(
        name: "ValidateE911Address",
        http_method: "POST",
        request_uri: "/emergency-calling/address"
      )
    end
  end
end
