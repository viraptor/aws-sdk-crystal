module Aws
  module MTurk
    module Model
      API_VERSION = "2017-01-17"
      TARGET_PREFIX = "MTurkRequesterServiceV20170117"
      SIGNING_NAME = "mturk-requester"
      ENDPOINT_PREFIX = "mturk-requester"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mturk-requester-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mturk-requester-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mturk-requester.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"sandbox"]}],"endpoint":{"url":"https://mturk-requester-sandbox.us-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://mturk-requester.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_QUALIFICATION_REQUEST = OperationModel.new(
        name: "AcceptQualificationRequest",
        http_method: "POST",
        request_uri: "/"
      )

      APPROVE_ASSIGNMENT = OperationModel.new(
        name: "ApproveAssignment",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_QUALIFICATION_WITH_WORKER = OperationModel.new(
        name: "AssociateQualificationWithWorker",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ADDITIONAL_ASSIGNMENTS_FOR_HIT = OperationModel.new(
        name: "CreateAdditionalAssignmentsForHIT",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HIT = OperationModel.new(
        name: "CreateHIT",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HIT_TYPE = OperationModel.new(
        name: "CreateHITType",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HIT_WITH_HIT_TYPE = OperationModel.new(
        name: "CreateHITWithHITType",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_QUALIFICATION_TYPE = OperationModel.new(
        name: "CreateQualificationType",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORKER_BLOCK = OperationModel.new(
        name: "CreateWorkerBlock",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HIT = OperationModel.new(
        name: "DeleteHIT",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_QUALIFICATION_TYPE = OperationModel.new(
        name: "DeleteQualificationType",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORKER_BLOCK = OperationModel.new(
        name: "DeleteWorkerBlock",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_QUALIFICATION_FROM_WORKER = OperationModel.new(
        name: "DisassociateQualificationFromWorker",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCOUNT_BALANCE = OperationModel.new(
        name: "GetAccountBalance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ASSIGNMENT = OperationModel.new(
        name: "GetAssignment",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FILE_UPLOAD_URL = OperationModel.new(
        name: "GetFileUploadURL",
        http_method: "POST",
        request_uri: "/"
      )

      GET_HIT = OperationModel.new(
        name: "GetHIT",
        http_method: "POST",
        request_uri: "/"
      )

      GET_QUALIFICATION_SCORE = OperationModel.new(
        name: "GetQualificationScore",
        http_method: "POST",
        request_uri: "/"
      )

      GET_QUALIFICATION_TYPE = OperationModel.new(
        name: "GetQualificationType",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSIGNMENTS_FOR_HIT = OperationModel.new(
        name: "ListAssignmentsForHIT",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BONUS_PAYMENTS = OperationModel.new(
        name: "ListBonusPayments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HI_TS = OperationModel.new(
        name: "ListHITs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HI_TS_FOR_QUALIFICATION_TYPE = OperationModel.new(
        name: "ListHITsForQualificationType",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_QUALIFICATION_REQUESTS = OperationModel.new(
        name: "ListQualificationRequests",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_QUALIFICATION_TYPES = OperationModel.new(
        name: "ListQualificationTypes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REVIEW_POLICY_RESULTS_FOR_HIT = OperationModel.new(
        name: "ListReviewPolicyResultsForHIT",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REVIEWABLE_HI_TS = OperationModel.new(
        name: "ListReviewableHITs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKER_BLOCKS = OperationModel.new(
        name: "ListWorkerBlocks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKERS_WITH_QUALIFICATION_TYPE = OperationModel.new(
        name: "ListWorkersWithQualificationType",
        http_method: "POST",
        request_uri: "/"
      )

      NOTIFY_WORKERS = OperationModel.new(
        name: "NotifyWorkers",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_ASSIGNMENT = OperationModel.new(
        name: "RejectAssignment",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_QUALIFICATION_REQUEST = OperationModel.new(
        name: "RejectQualificationRequest",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_BONUS = OperationModel.new(
        name: "SendBonus",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_TEST_EVENT_NOTIFICATION = OperationModel.new(
        name: "SendTestEventNotification",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_EXPIRATION_FOR_HIT = OperationModel.new(
        name: "UpdateExpirationForHIT",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_HIT_REVIEW_STATUS = OperationModel.new(
        name: "UpdateHITReviewStatus",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_HIT_TYPE_OF_HIT = OperationModel.new(
        name: "UpdateHITTypeOfHIT",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_NOTIFICATION_SETTINGS = OperationModel.new(
        name: "UpdateNotificationSettings",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_QUALIFICATION_TYPE = OperationModel.new(
        name: "UpdateQualificationType",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
