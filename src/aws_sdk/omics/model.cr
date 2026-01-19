module AwsSdk
  module Omics
    module Model
      API_VERSION = "2022-11-28"
      TARGET_PREFIX = ""
      SIGNING_NAME = "omics"
      ENDPOINT_PREFIX = "omics"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://omics-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://omics-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://omics.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://omics.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ABORT_MULTIPART_READ_SET_UPLOAD = OperationModel.new(
        name: "AbortMultipartReadSetUpload",
        http_method: "DELETE",
        request_uri: "/sequencestore/{sequenceStoreId}/upload/{uploadId}/abort"
      )

      ACCEPT_SHARE = OperationModel.new(
        name: "AcceptShare",
        http_method: "POST",
        request_uri: "/share/{shareId}"
      )

      BATCH_DELETE_READ_SET = OperationModel.new(
        name: "BatchDeleteReadSet",
        http_method: "POST",
        request_uri: "/sequencestore/{sequenceStoreId}/readset/batch/delete"
      )

      CANCEL_ANNOTATION_IMPORT_JOB = OperationModel.new(
        name: "CancelAnnotationImportJob",
        http_method: "DELETE",
        request_uri: "/import/annotation/{jobId}"
      )

      CANCEL_RUN = OperationModel.new(
        name: "CancelRun",
        http_method: "POST",
        request_uri: "/run/{id}/cancel"
      )

      CANCEL_VARIANT_IMPORT_JOB = OperationModel.new(
        name: "CancelVariantImportJob",
        http_method: "DELETE",
        request_uri: "/import/variant/{jobId}"
      )

      COMPLETE_MULTIPART_READ_SET_UPLOAD = OperationModel.new(
        name: "CompleteMultipartReadSetUpload",
        http_method: "POST",
        request_uri: "/sequencestore/{sequenceStoreId}/upload/{uploadId}/complete"
      )

      CREATE_ANNOTATION_STORE = OperationModel.new(
        name: "CreateAnnotationStore",
        http_method: "POST",
        request_uri: "/annotationStore"
      )

      CREATE_ANNOTATION_STORE_VERSION = OperationModel.new(
        name: "CreateAnnotationStoreVersion",
        http_method: "POST",
        request_uri: "/annotationStore/{name}/version"
      )

      CREATE_MULTIPART_READ_SET_UPLOAD = OperationModel.new(
        name: "CreateMultipartReadSetUpload",
        http_method: "POST",
        request_uri: "/sequencestore/{sequenceStoreId}/upload"
      )

      CREATE_REFERENCE_STORE = OperationModel.new(
        name: "CreateReferenceStore",
        http_method: "POST",
        request_uri: "/referencestore"
      )

      CREATE_RUN_CACHE = OperationModel.new(
        name: "CreateRunCache",
        http_method: "POST",
        request_uri: "/runCache"
      )

      CREATE_RUN_GROUP = OperationModel.new(
        name: "CreateRunGroup",
        http_method: "POST",
        request_uri: "/runGroup"
      )

      CREATE_SEQUENCE_STORE = OperationModel.new(
        name: "CreateSequenceStore",
        http_method: "POST",
        request_uri: "/sequencestore"
      )

      CREATE_SHARE = OperationModel.new(
        name: "CreateShare",
        http_method: "POST",
        request_uri: "/share"
      )

      CREATE_VARIANT_STORE = OperationModel.new(
        name: "CreateVariantStore",
        http_method: "POST",
        request_uri: "/variantStore"
      )

      CREATE_WORKFLOW = OperationModel.new(
        name: "CreateWorkflow",
        http_method: "POST",
        request_uri: "/workflow"
      )

      CREATE_WORKFLOW_VERSION = OperationModel.new(
        name: "CreateWorkflowVersion",
        http_method: "POST",
        request_uri: "/workflow/{workflowId}/version"
      )

      DELETE_ANNOTATION_STORE = OperationModel.new(
        name: "DeleteAnnotationStore",
        http_method: "DELETE",
        request_uri: "/annotationStore/{name}"
      )

      DELETE_ANNOTATION_STORE_VERSIONS = OperationModel.new(
        name: "DeleteAnnotationStoreVersions",
        http_method: "POST",
        request_uri: "/annotationStore/{name}/versions/delete"
      )

      DELETE_REFERENCE = OperationModel.new(
        name: "DeleteReference",
        http_method: "DELETE",
        request_uri: "/referencestore/{referenceStoreId}/reference/{id}"
      )

      DELETE_REFERENCE_STORE = OperationModel.new(
        name: "DeleteReferenceStore",
        http_method: "DELETE",
        request_uri: "/referencestore/{id}"
      )

      DELETE_RUN = OperationModel.new(
        name: "DeleteRun",
        http_method: "DELETE",
        request_uri: "/run/{id}"
      )

      DELETE_RUN_CACHE = OperationModel.new(
        name: "DeleteRunCache",
        http_method: "DELETE",
        request_uri: "/runCache/{id}"
      )

      DELETE_RUN_GROUP = OperationModel.new(
        name: "DeleteRunGroup",
        http_method: "DELETE",
        request_uri: "/runGroup/{id}"
      )

      DELETE_S3_ACCESS_POLICY = OperationModel.new(
        name: "DeleteS3AccessPolicy",
        http_method: "DELETE",
        request_uri: "/s3accesspolicy/{s3AccessPointArn}"
      )

      DELETE_SEQUENCE_STORE = OperationModel.new(
        name: "DeleteSequenceStore",
        http_method: "DELETE",
        request_uri: "/sequencestore/{id}"
      )

      DELETE_SHARE = OperationModel.new(
        name: "DeleteShare",
        http_method: "DELETE",
        request_uri: "/share/{shareId}"
      )

      DELETE_VARIANT_STORE = OperationModel.new(
        name: "DeleteVariantStore",
        http_method: "DELETE",
        request_uri: "/variantStore/{name}"
      )

      DELETE_WORKFLOW = OperationModel.new(
        name: "DeleteWorkflow",
        http_method: "DELETE",
        request_uri: "/workflow/{id}"
      )

      DELETE_WORKFLOW_VERSION = OperationModel.new(
        name: "DeleteWorkflowVersion",
        http_method: "DELETE",
        request_uri: "/workflow/{workflowId}/version/{versionName}"
      )

      GET_ANNOTATION_IMPORT_JOB = OperationModel.new(
        name: "GetAnnotationImportJob",
        http_method: "GET",
        request_uri: "/import/annotation/{jobId}"
      )

      GET_ANNOTATION_STORE = OperationModel.new(
        name: "GetAnnotationStore",
        http_method: "GET",
        request_uri: "/annotationStore/{name}"
      )

      GET_ANNOTATION_STORE_VERSION = OperationModel.new(
        name: "GetAnnotationStoreVersion",
        http_method: "GET",
        request_uri: "/annotationStore/{name}/version/{versionName}"
      )

      GET_READ_SET = OperationModel.new(
        name: "GetReadSet",
        http_method: "GET",
        request_uri: "/sequencestore/{sequenceStoreId}/readset/{id}"
      )

      GET_READ_SET_ACTIVATION_JOB = OperationModel.new(
        name: "GetReadSetActivationJob",
        http_method: "GET",
        request_uri: "/sequencestore/{sequenceStoreId}/activationjob/{id}"
      )

      GET_READ_SET_EXPORT_JOB = OperationModel.new(
        name: "GetReadSetExportJob",
        http_method: "GET",
        request_uri: "/sequencestore/{sequenceStoreId}/exportjob/{id}"
      )

      GET_READ_SET_IMPORT_JOB = OperationModel.new(
        name: "GetReadSetImportJob",
        http_method: "GET",
        request_uri: "/sequencestore/{sequenceStoreId}/importjob/{id}"
      )

      GET_READ_SET_METADATA = OperationModel.new(
        name: "GetReadSetMetadata",
        http_method: "GET",
        request_uri: "/sequencestore/{sequenceStoreId}/readset/{id}/metadata"
      )

      GET_REFERENCE = OperationModel.new(
        name: "GetReference",
        http_method: "GET",
        request_uri: "/referencestore/{referenceStoreId}/reference/{id}"
      )

      GET_REFERENCE_IMPORT_JOB = OperationModel.new(
        name: "GetReferenceImportJob",
        http_method: "GET",
        request_uri: "/referencestore/{referenceStoreId}/importjob/{id}"
      )

      GET_REFERENCE_METADATA = OperationModel.new(
        name: "GetReferenceMetadata",
        http_method: "GET",
        request_uri: "/referencestore/{referenceStoreId}/reference/{id}/metadata"
      )

      GET_REFERENCE_STORE = OperationModel.new(
        name: "GetReferenceStore",
        http_method: "GET",
        request_uri: "/referencestore/{id}"
      )

      GET_RUN = OperationModel.new(
        name: "GetRun",
        http_method: "GET",
        request_uri: "/run/{id}"
      )

      GET_RUN_CACHE = OperationModel.new(
        name: "GetRunCache",
        http_method: "GET",
        request_uri: "/runCache/{id}"
      )

      GET_RUN_GROUP = OperationModel.new(
        name: "GetRunGroup",
        http_method: "GET",
        request_uri: "/runGroup/{id}"
      )

      GET_RUN_TASK = OperationModel.new(
        name: "GetRunTask",
        http_method: "GET",
        request_uri: "/run/{id}/task/{taskId}"
      )

      GET_S3_ACCESS_POLICY = OperationModel.new(
        name: "GetS3AccessPolicy",
        http_method: "GET",
        request_uri: "/s3accesspolicy/{s3AccessPointArn}"
      )

      GET_SEQUENCE_STORE = OperationModel.new(
        name: "GetSequenceStore",
        http_method: "GET",
        request_uri: "/sequencestore/{id}"
      )

      GET_SHARE = OperationModel.new(
        name: "GetShare",
        http_method: "GET",
        request_uri: "/share/{shareId}"
      )

      GET_VARIANT_IMPORT_JOB = OperationModel.new(
        name: "GetVariantImportJob",
        http_method: "GET",
        request_uri: "/import/variant/{jobId}"
      )

      GET_VARIANT_STORE = OperationModel.new(
        name: "GetVariantStore",
        http_method: "GET",
        request_uri: "/variantStore/{name}"
      )

      GET_WORKFLOW = OperationModel.new(
        name: "GetWorkflow",
        http_method: "GET",
        request_uri: "/workflow/{id}"
      )

      GET_WORKFLOW_VERSION = OperationModel.new(
        name: "GetWorkflowVersion",
        http_method: "GET",
        request_uri: "/workflow/{workflowId}/version/{versionName}"
      )

      LIST_ANNOTATION_IMPORT_JOBS = OperationModel.new(
        name: "ListAnnotationImportJobs",
        http_method: "POST",
        request_uri: "/import/annotations"
      )

      LIST_ANNOTATION_STORE_VERSIONS = OperationModel.new(
        name: "ListAnnotationStoreVersions",
        http_method: "POST",
        request_uri: "/annotationStore/{name}/versions"
      )

      LIST_ANNOTATION_STORES = OperationModel.new(
        name: "ListAnnotationStores",
        http_method: "POST",
        request_uri: "/annotationStores"
      )

      LIST_MULTIPART_READ_SET_UPLOADS = OperationModel.new(
        name: "ListMultipartReadSetUploads",
        http_method: "POST",
        request_uri: "/sequencestore/{sequenceStoreId}/uploads"
      )

      LIST_READ_SET_ACTIVATION_JOBS = OperationModel.new(
        name: "ListReadSetActivationJobs",
        http_method: "POST",
        request_uri: "/sequencestore/{sequenceStoreId}/activationjobs"
      )

      LIST_READ_SET_EXPORT_JOBS = OperationModel.new(
        name: "ListReadSetExportJobs",
        http_method: "POST",
        request_uri: "/sequencestore/{sequenceStoreId}/exportjobs"
      )

      LIST_READ_SET_IMPORT_JOBS = OperationModel.new(
        name: "ListReadSetImportJobs",
        http_method: "POST",
        request_uri: "/sequencestore/{sequenceStoreId}/importjobs"
      )

      LIST_READ_SET_UPLOAD_PARTS = OperationModel.new(
        name: "ListReadSetUploadParts",
        http_method: "POST",
        request_uri: "/sequencestore/{sequenceStoreId}/upload/{uploadId}/parts"
      )

      LIST_READ_SETS = OperationModel.new(
        name: "ListReadSets",
        http_method: "POST",
        request_uri: "/sequencestore/{sequenceStoreId}/readsets"
      )

      LIST_REFERENCE_IMPORT_JOBS = OperationModel.new(
        name: "ListReferenceImportJobs",
        http_method: "POST",
        request_uri: "/referencestore/{referenceStoreId}/importjobs"
      )

      LIST_REFERENCE_STORES = OperationModel.new(
        name: "ListReferenceStores",
        http_method: "POST",
        request_uri: "/referencestores"
      )

      LIST_REFERENCES = OperationModel.new(
        name: "ListReferences",
        http_method: "POST",
        request_uri: "/referencestore/{referenceStoreId}/references"
      )

      LIST_RUN_CACHES = OperationModel.new(
        name: "ListRunCaches",
        http_method: "GET",
        request_uri: "/runCache"
      )

      LIST_RUN_GROUPS = OperationModel.new(
        name: "ListRunGroups",
        http_method: "GET",
        request_uri: "/runGroup"
      )

      LIST_RUN_TASKS = OperationModel.new(
        name: "ListRunTasks",
        http_method: "GET",
        request_uri: "/run/{id}/task"
      )

      LIST_RUNS = OperationModel.new(
        name: "ListRuns",
        http_method: "GET",
        request_uri: "/run"
      )

      LIST_SEQUENCE_STORES = OperationModel.new(
        name: "ListSequenceStores",
        http_method: "POST",
        request_uri: "/sequencestores"
      )

      LIST_SHARES = OperationModel.new(
        name: "ListShares",
        http_method: "POST",
        request_uri: "/shares"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_VARIANT_IMPORT_JOBS = OperationModel.new(
        name: "ListVariantImportJobs",
        http_method: "POST",
        request_uri: "/import/variants"
      )

      LIST_VARIANT_STORES = OperationModel.new(
        name: "ListVariantStores",
        http_method: "POST",
        request_uri: "/variantStores"
      )

      LIST_WORKFLOW_VERSIONS = OperationModel.new(
        name: "ListWorkflowVersions",
        http_method: "GET",
        request_uri: "/workflow/{workflowId}/version"
      )

      LIST_WORKFLOWS = OperationModel.new(
        name: "ListWorkflows",
        http_method: "GET",
        request_uri: "/workflow"
      )

      PUT_S3_ACCESS_POLICY = OperationModel.new(
        name: "PutS3AccessPolicy",
        http_method: "PUT",
        request_uri: "/s3accesspolicy/{s3AccessPointArn}"
      )

      START_ANNOTATION_IMPORT_JOB = OperationModel.new(
        name: "StartAnnotationImportJob",
        http_method: "POST",
        request_uri: "/import/annotation"
      )

      START_READ_SET_ACTIVATION_JOB = OperationModel.new(
        name: "StartReadSetActivationJob",
        http_method: "POST",
        request_uri: "/sequencestore/{sequenceStoreId}/activationjob"
      )

      START_READ_SET_EXPORT_JOB = OperationModel.new(
        name: "StartReadSetExportJob",
        http_method: "POST",
        request_uri: "/sequencestore/{sequenceStoreId}/exportjob"
      )

      START_READ_SET_IMPORT_JOB = OperationModel.new(
        name: "StartReadSetImportJob",
        http_method: "POST",
        request_uri: "/sequencestore/{sequenceStoreId}/importjob"
      )

      START_REFERENCE_IMPORT_JOB = OperationModel.new(
        name: "StartReferenceImportJob",
        http_method: "POST",
        request_uri: "/referencestore/{referenceStoreId}/importjob"
      )

      START_RUN = OperationModel.new(
        name: "StartRun",
        http_method: "POST",
        request_uri: "/run"
      )

      START_VARIANT_IMPORT_JOB = OperationModel.new(
        name: "StartVariantImportJob",
        http_method: "POST",
        request_uri: "/import/variant"
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

      UPDATE_ANNOTATION_STORE = OperationModel.new(
        name: "UpdateAnnotationStore",
        http_method: "POST",
        request_uri: "/annotationStore/{name}"
      )

      UPDATE_ANNOTATION_STORE_VERSION = OperationModel.new(
        name: "UpdateAnnotationStoreVersion",
        http_method: "POST",
        request_uri: "/annotationStore/{name}/version/{versionName}"
      )

      UPDATE_RUN_CACHE = OperationModel.new(
        name: "UpdateRunCache",
        http_method: "POST",
        request_uri: "/runCache/{id}"
      )

      UPDATE_RUN_GROUP = OperationModel.new(
        name: "UpdateRunGroup",
        http_method: "POST",
        request_uri: "/runGroup/{id}"
      )

      UPDATE_SEQUENCE_STORE = OperationModel.new(
        name: "UpdateSequenceStore",
        http_method: "PATCH",
        request_uri: "/sequencestore/{id}"
      )

      UPDATE_VARIANT_STORE = OperationModel.new(
        name: "UpdateVariantStore",
        http_method: "POST",
        request_uri: "/variantStore/{name}"
      )

      UPDATE_WORKFLOW = OperationModel.new(
        name: "UpdateWorkflow",
        http_method: "POST",
        request_uri: "/workflow/{id}"
      )

      UPDATE_WORKFLOW_VERSION = OperationModel.new(
        name: "UpdateWorkflowVersion",
        http_method: "POST",
        request_uri: "/workflow/{workflowId}/version/{versionName}"
      )

      UPLOAD_READ_SET_PART = OperationModel.new(
        name: "UploadReadSetPart",
        http_method: "PUT",
        request_uri: "/sequencestore/{sequenceStoreId}/upload/{uploadId}/part"
      )
    end
  end
end
