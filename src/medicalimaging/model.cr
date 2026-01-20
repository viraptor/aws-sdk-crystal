module Aws
  module MedicalImaging
    module Model
      API_VERSION = "2023-07-19"
      TARGET_PREFIX = ""
      SIGNING_NAME = "medical-imaging"
      ENDPOINT_PREFIX = "medical-imaging"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://medical-imaging-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://medical-imaging-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://medical-imaging.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://medical-imaging.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      COPY_IMAGE_SET = OperationModel.new(
        name: "CopyImageSet",
        http_method: "POST",
        request_uri: "/datastore/{datastoreId}/imageSet/{sourceImageSetId}/copyImageSet"
      )

      CREATE_DATASTORE = OperationModel.new(
        name: "CreateDatastore",
        http_method: "POST",
        request_uri: "/datastore"
      )

      DELETE_DATASTORE = OperationModel.new(
        name: "DeleteDatastore",
        http_method: "DELETE",
        request_uri: "/datastore/{datastoreId}"
      )

      DELETE_IMAGE_SET = OperationModel.new(
        name: "DeleteImageSet",
        http_method: "POST",
        request_uri: "/datastore/{datastoreId}/imageSet/{imageSetId}/deleteImageSet"
      )

      GET_DICOM_IMPORT_JOB = OperationModel.new(
        name: "GetDICOMImportJob",
        http_method: "GET",
        request_uri: "/getDICOMImportJob/datastore/{datastoreId}/job/{jobId}"
      )

      GET_DATASTORE = OperationModel.new(
        name: "GetDatastore",
        http_method: "GET",
        request_uri: "/datastore/{datastoreId}"
      )

      GET_IMAGE_FRAME = OperationModel.new(
        name: "GetImageFrame",
        http_method: "POST",
        request_uri: "/datastore/{datastoreId}/imageSet/{imageSetId}/getImageFrame"
      )

      GET_IMAGE_SET = OperationModel.new(
        name: "GetImageSet",
        http_method: "POST",
        request_uri: "/datastore/{datastoreId}/imageSet/{imageSetId}/getImageSet"
      )

      GET_IMAGE_SET_METADATA = OperationModel.new(
        name: "GetImageSetMetadata",
        http_method: "POST",
        request_uri: "/datastore/{datastoreId}/imageSet/{imageSetId}/getImageSetMetadata"
      )

      LIST_DICOM_IMPORT_JOBS = OperationModel.new(
        name: "ListDICOMImportJobs",
        http_method: "GET",
        request_uri: "/listDICOMImportJobs/datastore/{datastoreId}"
      )

      LIST_DATASTORES = OperationModel.new(
        name: "ListDatastores",
        http_method: "GET",
        request_uri: "/datastore"
      )

      LIST_IMAGE_SET_VERSIONS = OperationModel.new(
        name: "ListImageSetVersions",
        http_method: "POST",
        request_uri: "/datastore/{datastoreId}/imageSet/{imageSetId}/listImageSetVersions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      SEARCH_IMAGE_SETS = OperationModel.new(
        name: "SearchImageSets",
        http_method: "POST",
        request_uri: "/datastore/{datastoreId}/searchImageSets"
      )

      START_DICOM_IMPORT_JOB = OperationModel.new(
        name: "StartDICOMImportJob",
        http_method: "POST",
        request_uri: "/startDICOMImportJob/datastore/{datastoreId}"
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

      UPDATE_IMAGE_SET_METADATA = OperationModel.new(
        name: "UpdateImageSetMetadata",
        http_method: "POST",
        request_uri: "/datastore/{datastoreId}/imageSet/{imageSetId}/updateImageSetMetadata"
      )
    end
  end
end
