module AwsSdk
  module Glacier
    module Model
      API_VERSION = "2012-06-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "glacier"
      ENDPOINT_PREFIX = "glacier"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://glacier-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://glacier.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://glacier-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://glacier.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://glacier.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ABORT_MULTIPART_UPLOAD = OperationModel.new(
        name: "AbortMultipartUpload",
        http_method: "DELETE",
        request_uri: "/{accountId}/vaults/{vaultName}/multipart-uploads/{uploadId}"
      )

      ABORT_VAULT_LOCK = OperationModel.new(
        name: "AbortVaultLock",
        http_method: "DELETE",
        request_uri: "/{accountId}/vaults/{vaultName}/lock-policy"
      )

      ADD_TAGS_TO_VAULT = OperationModel.new(
        name: "AddTagsToVault",
        http_method: "POST",
        request_uri: "/{accountId}/vaults/{vaultName}/tags?operation=add"
      )

      COMPLETE_MULTIPART_UPLOAD = OperationModel.new(
        name: "CompleteMultipartUpload",
        http_method: "POST",
        request_uri: "/{accountId}/vaults/{vaultName}/multipart-uploads/{uploadId}"
      )

      COMPLETE_VAULT_LOCK = OperationModel.new(
        name: "CompleteVaultLock",
        http_method: "POST",
        request_uri: "/{accountId}/vaults/{vaultName}/lock-policy/{lockId}"
      )

      CREATE_VAULT = OperationModel.new(
        name: "CreateVault",
        http_method: "PUT",
        request_uri: "/{accountId}/vaults/{vaultName}"
      )

      DELETE_ARCHIVE = OperationModel.new(
        name: "DeleteArchive",
        http_method: "DELETE",
        request_uri: "/{accountId}/vaults/{vaultName}/archives/{archiveId}"
      )

      DELETE_VAULT = OperationModel.new(
        name: "DeleteVault",
        http_method: "DELETE",
        request_uri: "/{accountId}/vaults/{vaultName}"
      )

      DELETE_VAULT_ACCESS_POLICY = OperationModel.new(
        name: "DeleteVaultAccessPolicy",
        http_method: "DELETE",
        request_uri: "/{accountId}/vaults/{vaultName}/access-policy"
      )

      DELETE_VAULT_NOTIFICATIONS = OperationModel.new(
        name: "DeleteVaultNotifications",
        http_method: "DELETE",
        request_uri: "/{accountId}/vaults/{vaultName}/notification-configuration"
      )

      DESCRIBE_JOB = OperationModel.new(
        name: "DescribeJob",
        http_method: "GET",
        request_uri: "/{accountId}/vaults/{vaultName}/jobs/{jobId}"
      )

      DESCRIBE_VAULT = OperationModel.new(
        name: "DescribeVault",
        http_method: "GET",
        request_uri: "/{accountId}/vaults/{vaultName}"
      )

      GET_DATA_RETRIEVAL_POLICY = OperationModel.new(
        name: "GetDataRetrievalPolicy",
        http_method: "GET",
        request_uri: "/{accountId}/policies/data-retrieval"
      )

      GET_JOB_OUTPUT = OperationModel.new(
        name: "GetJobOutput",
        http_method: "GET",
        request_uri: "/{accountId}/vaults/{vaultName}/jobs/{jobId}/output"
      )

      GET_VAULT_ACCESS_POLICY = OperationModel.new(
        name: "GetVaultAccessPolicy",
        http_method: "GET",
        request_uri: "/{accountId}/vaults/{vaultName}/access-policy"
      )

      GET_VAULT_LOCK = OperationModel.new(
        name: "GetVaultLock",
        http_method: "GET",
        request_uri: "/{accountId}/vaults/{vaultName}/lock-policy"
      )

      GET_VAULT_NOTIFICATIONS = OperationModel.new(
        name: "GetVaultNotifications",
        http_method: "GET",
        request_uri: "/{accountId}/vaults/{vaultName}/notification-configuration"
      )

      INITIATE_JOB = OperationModel.new(
        name: "InitiateJob",
        http_method: "POST",
        request_uri: "/{accountId}/vaults/{vaultName}/jobs"
      )

      INITIATE_MULTIPART_UPLOAD = OperationModel.new(
        name: "InitiateMultipartUpload",
        http_method: "POST",
        request_uri: "/{accountId}/vaults/{vaultName}/multipart-uploads"
      )

      INITIATE_VAULT_LOCK = OperationModel.new(
        name: "InitiateVaultLock",
        http_method: "POST",
        request_uri: "/{accountId}/vaults/{vaultName}/lock-policy"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "GET",
        request_uri: "/{accountId}/vaults/{vaultName}/jobs"
      )

      LIST_MULTIPART_UPLOADS = OperationModel.new(
        name: "ListMultipartUploads",
        http_method: "GET",
        request_uri: "/{accountId}/vaults/{vaultName}/multipart-uploads"
      )

      LIST_PARTS = OperationModel.new(
        name: "ListParts",
        http_method: "GET",
        request_uri: "/{accountId}/vaults/{vaultName}/multipart-uploads/{uploadId}"
      )

      LIST_PROVISIONED_CAPACITY = OperationModel.new(
        name: "ListProvisionedCapacity",
        http_method: "GET",
        request_uri: "/{accountId}/provisioned-capacity"
      )

      LIST_TAGS_FOR_VAULT = OperationModel.new(
        name: "ListTagsForVault",
        http_method: "GET",
        request_uri: "/{accountId}/vaults/{vaultName}/tags"
      )

      LIST_VAULTS = OperationModel.new(
        name: "ListVaults",
        http_method: "GET",
        request_uri: "/{accountId}/vaults"
      )

      PURCHASE_PROVISIONED_CAPACITY = OperationModel.new(
        name: "PurchaseProvisionedCapacity",
        http_method: "POST",
        request_uri: "/{accountId}/provisioned-capacity"
      )

      REMOVE_TAGS_FROM_VAULT = OperationModel.new(
        name: "RemoveTagsFromVault",
        http_method: "POST",
        request_uri: "/{accountId}/vaults/{vaultName}/tags?operation=remove"
      )

      SET_DATA_RETRIEVAL_POLICY = OperationModel.new(
        name: "SetDataRetrievalPolicy",
        http_method: "PUT",
        request_uri: "/{accountId}/policies/data-retrieval"
      )

      SET_VAULT_ACCESS_POLICY = OperationModel.new(
        name: "SetVaultAccessPolicy",
        http_method: "PUT",
        request_uri: "/{accountId}/vaults/{vaultName}/access-policy"
      )

      SET_VAULT_NOTIFICATIONS = OperationModel.new(
        name: "SetVaultNotifications",
        http_method: "PUT",
        request_uri: "/{accountId}/vaults/{vaultName}/notification-configuration"
      )

      UPLOAD_ARCHIVE = OperationModel.new(
        name: "UploadArchive",
        http_method: "POST",
        request_uri: "/{accountId}/vaults/{vaultName}/archives"
      )

      UPLOAD_MULTIPART_PART = OperationModel.new(
        name: "UploadMultipartPart",
        http_method: "PUT",
        request_uri: "/{accountId}/vaults/{vaultName}/multipart-uploads/{uploadId}"
      )
    end
  end
end
