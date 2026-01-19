module AwsSdk
  module VoiceID
    module Model
      API_VERSION = "2021-09-27"
      TARGET_PREFIX = "VoiceID"
      SIGNING_NAME = "voiceid"
      ENDPOINT_PREFIX = "voiceid"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://voiceid-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://voiceid-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://voiceid.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://voiceid.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_FRAUDSTER = OperationModel.new(
        name: "AssociateFraudster",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DOMAIN = OperationModel.new(
        name: "CreateDomain",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WATCHLIST = OperationModel.new(
        name: "CreateWatchlist",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DOMAIN = OperationModel.new(
        name: "DeleteDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FRAUDSTER = OperationModel.new(
        name: "DeleteFraudster",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SPEAKER = OperationModel.new(
        name: "DeleteSpeaker",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WATCHLIST = OperationModel.new(
        name: "DeleteWatchlist",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DOMAIN = OperationModel.new(
        name: "DescribeDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FRAUDSTER = OperationModel.new(
        name: "DescribeFraudster",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FRAUDSTER_REGISTRATION_JOB = OperationModel.new(
        name: "DescribeFraudsterRegistrationJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SPEAKER = OperationModel.new(
        name: "DescribeSpeaker",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SPEAKER_ENROLLMENT_JOB = OperationModel.new(
        name: "DescribeSpeakerEnrollmentJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WATCHLIST = OperationModel.new(
        name: "DescribeWatchlist",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_FRAUDSTER = OperationModel.new(
        name: "DisassociateFraudster",
        http_method: "POST",
        request_uri: "/"
      )

      EVALUATE_SESSION = OperationModel.new(
        name: "EvaluateSession",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOMAINS = OperationModel.new(
        name: "ListDomains",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FRAUDSTER_REGISTRATION_JOBS = OperationModel.new(
        name: "ListFraudsterRegistrationJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FRAUDSTERS = OperationModel.new(
        name: "ListFraudsters",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SPEAKER_ENROLLMENT_JOBS = OperationModel.new(
        name: "ListSpeakerEnrollmentJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SPEAKERS = OperationModel.new(
        name: "ListSpeakers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WATCHLISTS = OperationModel.new(
        name: "ListWatchlists",
        http_method: "POST",
        request_uri: "/"
      )

      OPT_OUT_SPEAKER = OperationModel.new(
        name: "OptOutSpeaker",
        http_method: "POST",
        request_uri: "/"
      )

      START_FRAUDSTER_REGISTRATION_JOB = OperationModel.new(
        name: "StartFraudsterRegistrationJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_SPEAKER_ENROLLMENT_JOB = OperationModel.new(
        name: "StartSpeakerEnrollmentJob",
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

      UPDATE_DOMAIN = OperationModel.new(
        name: "UpdateDomain",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WATCHLIST = OperationModel.new(
        name: "UpdateWatchlist",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
