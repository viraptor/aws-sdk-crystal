module AwsSdk
  module Signer
    module Model
      API_VERSION = "2017-08-25"
      TARGET_PREFIX = ""
      SIGNING_NAME = "signer"
      ENDPOINT_PREFIX = "signer"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://signer-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://signer-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://signer.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://signer.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_PROFILE_PERMISSION = OperationModel.new(
        name: "AddProfilePermission",
        http_method: "POST",
        request_uri: "/signing-profiles/{profileName}/permissions"
      )

      CANCEL_SIGNING_PROFILE = OperationModel.new(
        name: "CancelSigningProfile",
        http_method: "DELETE",
        request_uri: "/signing-profiles/{profileName}"
      )

      DESCRIBE_SIGNING_JOB = OperationModel.new(
        name: "DescribeSigningJob",
        http_method: "GET",
        request_uri: "/signing-jobs/{jobId}"
      )

      GET_REVOCATION_STATUS = OperationModel.new(
        name: "GetRevocationStatus",
        http_method: "GET",
        request_uri: "/revocations"
      )

      GET_SIGNING_PLATFORM = OperationModel.new(
        name: "GetSigningPlatform",
        http_method: "GET",
        request_uri: "/signing-platforms/{platformId}"
      )

      GET_SIGNING_PROFILE = OperationModel.new(
        name: "GetSigningProfile",
        http_method: "GET",
        request_uri: "/signing-profiles/{profileName}"
      )

      LIST_PROFILE_PERMISSIONS = OperationModel.new(
        name: "ListProfilePermissions",
        http_method: "GET",
        request_uri: "/signing-profiles/{profileName}/permissions"
      )

      LIST_SIGNING_JOBS = OperationModel.new(
        name: "ListSigningJobs",
        http_method: "GET",
        request_uri: "/signing-jobs"
      )

      LIST_SIGNING_PLATFORMS = OperationModel.new(
        name: "ListSigningPlatforms",
        http_method: "GET",
        request_uri: "/signing-platforms"
      )

      LIST_SIGNING_PROFILES = OperationModel.new(
        name: "ListSigningProfiles",
        http_method: "GET",
        request_uri: "/signing-profiles"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_SIGNING_PROFILE = OperationModel.new(
        name: "PutSigningProfile",
        http_method: "PUT",
        request_uri: "/signing-profiles/{profileName}"
      )

      REMOVE_PROFILE_PERMISSION = OperationModel.new(
        name: "RemoveProfilePermission",
        http_method: "DELETE",
        request_uri: "/signing-profiles/{profileName}/permissions/{statementId}"
      )

      REVOKE_SIGNATURE = OperationModel.new(
        name: "RevokeSignature",
        http_method: "PUT",
        request_uri: "/signing-jobs/{jobId}/revoke"
      )

      REVOKE_SIGNING_PROFILE = OperationModel.new(
        name: "RevokeSigningProfile",
        http_method: "PUT",
        request_uri: "/signing-profiles/{profileName}/revoke"
      )

      SIGN_PAYLOAD = OperationModel.new(
        name: "SignPayload",
        http_method: "POST",
        request_uri: "/signing-jobs/with-payload"
      )

      START_SIGNING_JOB = OperationModel.new(
        name: "StartSigningJob",
        http_method: "POST",
        request_uri: "/signing-jobs"
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
