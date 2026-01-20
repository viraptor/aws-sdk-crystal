module AwsSdk
  module SecurityIR
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "security-ir"
      ENDPOINT_PREFIX = "security-ir"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://security-ir-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://security-ir.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_MEMBER_ACCOUNT_DETAILS = OperationModel.new(
        name: "BatchGetMemberAccountDetails",
        http_method: "POST",
        request_uri: "/v1/membership/{membershipId}/batch-member-details"
      )

      CANCEL_MEMBERSHIP = OperationModel.new(
        name: "CancelMembership",
        http_method: "PUT",
        request_uri: "/v1/membership/{membershipId}"
      )

      CLOSE_CASE = OperationModel.new(
        name: "CloseCase",
        http_method: "POST",
        request_uri: "/v1/cases/{caseId}/close-case"
      )

      CREATE_CASE = OperationModel.new(
        name: "CreateCase",
        http_method: "POST",
        request_uri: "/v1/create-case"
      )

      CREATE_CASE_COMMENT = OperationModel.new(
        name: "CreateCaseComment",
        http_method: "POST",
        request_uri: "/v1/cases/{caseId}/create-comment"
      )

      CREATE_MEMBERSHIP = OperationModel.new(
        name: "CreateMembership",
        http_method: "POST",
        request_uri: "/v1/membership"
      )

      GET_CASE = OperationModel.new(
        name: "GetCase",
        http_method: "GET",
        request_uri: "/v1/cases/{caseId}/get-case"
      )

      GET_CASE_ATTACHMENT_DOWNLOAD_URL = OperationModel.new(
        name: "GetCaseAttachmentDownloadUrl",
        http_method: "GET",
        request_uri: "/v1/cases/{caseId}/get-presigned-url/{attachmentId}"
      )

      GET_CASE_ATTACHMENT_UPLOAD_URL = OperationModel.new(
        name: "GetCaseAttachmentUploadUrl",
        http_method: "POST",
        request_uri: "/v1/cases/{caseId}/get-presigned-url"
      )

      GET_MEMBERSHIP = OperationModel.new(
        name: "GetMembership",
        http_method: "GET",
        request_uri: "/v1/membership/{membershipId}"
      )

      LIST_CASE_EDITS = OperationModel.new(
        name: "ListCaseEdits",
        http_method: "POST",
        request_uri: "/v1/cases/{caseId}/list-case-edits"
      )

      LIST_CASES = OperationModel.new(
        name: "ListCases",
        http_method: "POST",
        request_uri: "/v1/list-cases"
      )

      LIST_COMMENTS = OperationModel.new(
        name: "ListComments",
        http_method: "POST",
        request_uri: "/v1/cases/{caseId}/list-comments"
      )

      LIST_INVESTIGATIONS = OperationModel.new(
        name: "ListInvestigations",
        http_method: "GET",
        request_uri: "/v1/cases/{caseId}/list-investigations"
      )

      LIST_MEMBERSHIPS = OperationModel.new(
        name: "ListMemberships",
        http_method: "POST",
        request_uri: "/v1/memberships"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v1/tags/{resourceArn}"
      )

      SEND_FEEDBACK = OperationModel.new(
        name: "SendFeedback",
        http_method: "POST",
        request_uri: "/v1/cases/{caseId}/feedback/{resultId}/send-feedback"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/v1/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/v1/tags/{resourceArn}"
      )

      UPDATE_CASE = OperationModel.new(
        name: "UpdateCase",
        http_method: "POST",
        request_uri: "/v1/cases/{caseId}/update-case"
      )

      UPDATE_CASE_COMMENT = OperationModel.new(
        name: "UpdateCaseComment",
        http_method: "PUT",
        request_uri: "/v1/cases/{caseId}/update-case-comment/{commentId}"
      )

      UPDATE_CASE_STATUS = OperationModel.new(
        name: "UpdateCaseStatus",
        http_method: "POST",
        request_uri: "/v1/cases/{caseId}/update-case-status"
      )

      UPDATE_MEMBERSHIP = OperationModel.new(
        name: "UpdateMembership",
        http_method: "PUT",
        request_uri: "/v1/membership/{membershipId}/update-membership"
      )

      UPDATE_RESOLVER_TYPE = OperationModel.new(
        name: "UpdateResolverType",
        http_method: "POST",
        request_uri: "/v1/cases/{caseId}/update-resolver-type"
      )
    end
  end
end
