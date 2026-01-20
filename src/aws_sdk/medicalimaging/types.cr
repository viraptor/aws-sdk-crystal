require "json"
require "time"

module AwsSdk
  module MedicalImaging
    module Types

      # The user does not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Updating or deleting a resource can cause an inconsistent state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Copy the destination image set.

      struct CopyDestinationImageSet
        include JSON::Serializable

        # The image set identifier for the destination image set.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        # The latest version identifier for the destination image set.

        @[JSON::Field(key: "latestVersionId")]
        getter latest_version_id : String

        def initialize(
          @image_set_id : String,
          @latest_version_id : String
        )
        end
      end

      # Copy the image set properties of the destination image set.

      struct CopyDestinationImageSetProperties
        include JSON::Serializable

        # The image set identifier of the copied image set properties.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        # The latest version identifier for the destination image set properties.

        @[JSON::Field(key: "latestVersionId")]
        getter latest_version_id : String

        # The timestamp when the destination image set properties were created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) assigned to the destination image set.

        @[JSON::Field(key: "imageSetArn")]
        getter image_set_arn : String?

        # The image set state of the destination image set properties.

        @[JSON::Field(key: "imageSetState")]
        getter image_set_state : String?

        # The image set workflow status of the destination image set properties.

        @[JSON::Field(key: "imageSetWorkflowStatus")]
        getter image_set_workflow_status : String?

        # The timestamp when the destination image set properties were last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @image_set_id : String,
          @latest_version_id : String,
          @created_at : Time? = nil,
          @image_set_arn : String? = nil,
          @image_set_state : String? = nil,
          @image_set_workflow_status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Copy image set information.

      struct CopyImageSetInformation
        include JSON::Serializable

        # The source image set.

        @[JSON::Field(key: "sourceImageSet")]
        getter source_image_set : Types::CopySourceImageSetInformation

        # The destination image set.

        @[JSON::Field(key: "destinationImageSet")]
        getter destination_image_set : Types::CopyDestinationImageSet?

        def initialize(
          @source_image_set : Types::CopySourceImageSetInformation,
          @destination_image_set : Types::CopyDestinationImageSet? = nil
        )
        end
      end


      struct CopyImageSetRequest
        include JSON::Serializable

        # Copy image set information.

        @[JSON::Field(key: "copyImageSetInformation")]
        getter copy_image_set_information : Types::CopyImageSetInformation

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The source image set identifier.

        @[JSON::Field(key: "sourceImageSetId")]
        getter source_image_set_id : String

        # Providing this parameter will force completion of the CopyImageSet operation, even if there are
        # inconsistent Patient, Study, and/or Series level metadata elements between the sourceImageSet and
        # destinationImageSet .

        @[JSON::Field(key: "force")]
        getter force : Bool?

        # Providing this parameter will configure the CopyImageSet operation to promote the given image set to
        # the primary DICOM hierarchy. If successful, a new primary image set ID will be returned as the
        # destination image set.

        @[JSON::Field(key: "promoteToPrimary")]
        getter promote_to_primary : Bool?

        def initialize(
          @copy_image_set_information : Types::CopyImageSetInformation,
          @datastore_id : String,
          @source_image_set_id : String,
          @force : Bool? = nil,
          @promote_to_primary : Bool? = nil
        )
        end
      end


      struct CopyImageSetResponse
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The properties of the destination image set.

        @[JSON::Field(key: "destinationImageSetProperties")]
        getter destination_image_set_properties : Types::CopyDestinationImageSetProperties

        # The properties of the source image set.

        @[JSON::Field(key: "sourceImageSetProperties")]
        getter source_image_set_properties : Types::CopySourceImageSetProperties

        def initialize(
          @datastore_id : String,
          @destination_image_set_properties : Types::CopyDestinationImageSetProperties,
          @source_image_set_properties : Types::CopySourceImageSetProperties
        )
        end
      end

      # Copy source image set information.

      struct CopySourceImageSetInformation
        include JSON::Serializable

        # The latest version identifier for the source image set.

        @[JSON::Field(key: "latestVersionId")]
        getter latest_version_id : String

        # Contains MetadataCopies structure and wraps information related to specific copy use cases. For
        # example, when copying subsets.

        @[JSON::Field(key: "DICOMCopies")]
        getter dicom_copies : Types::MetadataCopies?

        def initialize(
          @latest_version_id : String,
          @dicom_copies : Types::MetadataCopies? = nil
        )
        end
      end

      # Copy source image set properties.

      struct CopySourceImageSetProperties
        include JSON::Serializable

        # The image set identifier for the copied source image set.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        # The latest version identifier for the copied source image set.

        @[JSON::Field(key: "latestVersionId")]
        getter latest_version_id : String

        # The timestamp when the source image set properties were created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) assigned to the source image set.

        @[JSON::Field(key: "imageSetArn")]
        getter image_set_arn : String?

        # The image set state of the copied source image set.

        @[JSON::Field(key: "imageSetState")]
        getter image_set_state : String?

        # The workflow status of the copied source image set.

        @[JSON::Field(key: "imageSetWorkflowStatus")]
        getter image_set_workflow_status : String?

        # The timestamp when the source image set properties were updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @image_set_id : String,
          @latest_version_id : String,
          @created_at : Time? = nil,
          @image_set_arn : String? = nil,
          @image_set_state : String? = nil,
          @image_set_workflow_status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct CreateDatastoreRequest
        include JSON::Serializable

        # A unique identifier for API idempotency.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The data store name.

        @[JSON::Field(key: "datastoreName")]
        getter datastore_name : String?

        # The Amazon Resource Name (ARN) assigned to the Key Management Service (KMS) key for accessing
        # encrypted data.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The ARN of the authorizer's Lambda function.

        @[JSON::Field(key: "lambdaAuthorizerArn")]
        getter lambda_authorizer_arn : String?

        # The lossless storage format for the datastore.

        @[JSON::Field(key: "losslessStorageFormat")]
        getter lossless_storage_format : String?

        # The tags provided when creating a data store.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @datastore_name : String? = nil,
          @kms_key_arn : String? = nil,
          @lambda_authorizer_arn : String? = nil,
          @lossless_storage_format : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDatastoreResponse
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The data store status.

        @[JSON::Field(key: "datastoreStatus")]
        getter datastore_status : String

        def initialize(
          @datastore_id : String,
          @datastore_status : String
        )
        end
      end

      # Properties of the import job.

      struct DICOMImportJobProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that grants permissions to access medical imaging resources.

        @[JSON::Field(key: "dataAccessRoleArn")]
        getter data_access_role_arn : String

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The input prefix path for the S3 bucket that contains the DICOM P10 files to be imported.

        @[JSON::Field(key: "inputS3Uri")]
        getter input_s3_uri : String

        # The import job identifier.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The import job name.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The filters for listing import jobs based on status.

        @[JSON::Field(key: "jobStatus")]
        getter job_status : String

        # The output prefix of the S3 bucket to upload the results of the DICOM import job.

        @[JSON::Field(key: "outputS3Uri")]
        getter output_s3_uri : String

        # The timestamp for when the import job was ended.

        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The error message thrown if an import job fails.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The timestamp for when the import job was submitted.

        @[JSON::Field(key: "submittedAt")]
        getter submitted_at : Time?

        def initialize(
          @data_access_role_arn : String,
          @datastore_id : String,
          @input_s3_uri : String,
          @job_id : String,
          @job_name : String,
          @job_status : String,
          @output_s3_uri : String,
          @ended_at : Time? = nil,
          @message : String? = nil,
          @submitted_at : Time? = nil
        )
        end
      end

      # Summary of import job.

      struct DICOMImportJobSummary
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The import job identifier.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The import job name.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The filters for listing import jobs based on status.

        @[JSON::Field(key: "jobStatus")]
        getter job_status : String

        # The Amazon Resource Name (ARN) that grants permissions to access medical imaging resources.

        @[JSON::Field(key: "dataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The timestamp when an import job ended.

        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The error message thrown if an import job fails.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The timestamp when an import job was submitted.

        @[JSON::Field(key: "submittedAt")]
        getter submitted_at : Time?

        def initialize(
          @datastore_id : String,
          @job_id : String,
          @job_name : String,
          @job_status : String,
          @data_access_role_arn : String? = nil,
          @ended_at : Time? = nil,
          @message : String? = nil,
          @submitted_at : Time? = nil
        )
        end
      end

      # The aggregated structure to store DICOM study date and study time for search capabilities.

      struct DICOMStudyDateAndTime
        include JSON::Serializable

        # The DICOM study date provided in yyMMdd format.

        @[JSON::Field(key: "DICOMStudyDate")]
        getter dicom_study_date : String

        # The DICOM study time provided in HHmmss.FFFFFF format.

        @[JSON::Field(key: "DICOMStudyTime")]
        getter dicom_study_time : String?

        def initialize(
          @dicom_study_date : String,
          @dicom_study_time : String? = nil
        )
        end
      end

      # The DICOM attributes returned as a part of a response. Each image set has these properties as part
      # of a search result.

      struct DICOMTags
        include JSON::Serializable

        # The accession number for the DICOM study.

        @[JSON::Field(key: "DICOMAccessionNumber")]
        getter dicom_accession_number : String?

        # The total number of instances in the DICOM study.

        @[JSON::Field(key: "DICOMNumberOfStudyRelatedInstances")]
        getter dicom_number_of_study_related_instances : Int32?

        # The total number of series in the DICOM study.

        @[JSON::Field(key: "DICOMNumberOfStudyRelatedSeries")]
        getter dicom_number_of_study_related_series : Int32?

        # The patient birth date.

        @[JSON::Field(key: "DICOMPatientBirthDate")]
        getter dicom_patient_birth_date : String?

        # The unique identifier for a patient in a DICOM Study.

        @[JSON::Field(key: "DICOMPatientId")]
        getter dicom_patient_id : String?

        # The patient name.

        @[JSON::Field(key: "DICOMPatientName")]
        getter dicom_patient_name : String?

        # The patient sex.

        @[JSON::Field(key: "DICOMPatientSex")]
        getter dicom_patient_sex : String?

        # The DICOM provided identifier for the series Body Part Examined.

        @[JSON::Field(key: "DICOMSeriesBodyPart")]
        getter dicom_series_body_part : String?

        # The DICOM provided identifier for the Series Instance UID.

        @[JSON::Field(key: "DICOMSeriesInstanceUID")]
        getter dicom_series_instance_uid : String?

        # The DICOM provided identifier for the series Modality.

        @[JSON::Field(key: "DICOMSeriesModality")]
        getter dicom_series_modality : String?

        # The DICOM provided identifier for the Series Number.

        @[JSON::Field(key: "DICOMSeriesNumber")]
        getter dicom_series_number : Int32?

        # The study date.

        @[JSON::Field(key: "DICOMStudyDate")]
        getter dicom_study_date : String?

        # The DICOM provided Study Description.

        @[JSON::Field(key: "DICOMStudyDescription")]
        getter dicom_study_description : String?

        # The DICOM provided identifier for the Study ID.

        @[JSON::Field(key: "DICOMStudyId")]
        getter dicom_study_id : String?

        # The DICOM provided identifier for the Study Instance UID.

        @[JSON::Field(key: "DICOMStudyInstanceUID")]
        getter dicom_study_instance_uid : String?

        # The study time.

        @[JSON::Field(key: "DICOMStudyTime")]
        getter dicom_study_time : String?

        def initialize(
          @dicom_accession_number : String? = nil,
          @dicom_number_of_study_related_instances : Int32? = nil,
          @dicom_number_of_study_related_series : Int32? = nil,
          @dicom_patient_birth_date : String? = nil,
          @dicom_patient_id : String? = nil,
          @dicom_patient_name : String? = nil,
          @dicom_patient_sex : String? = nil,
          @dicom_series_body_part : String? = nil,
          @dicom_series_instance_uid : String? = nil,
          @dicom_series_modality : String? = nil,
          @dicom_series_number : Int32? = nil,
          @dicom_study_date : String? = nil,
          @dicom_study_description : String? = nil,
          @dicom_study_id : String? = nil,
          @dicom_study_instance_uid : String? = nil,
          @dicom_study_time : String? = nil
        )
        end
      end

      # The object containing removableAttributes and updatableAttributes .

      struct DICOMUpdates
        include JSON::Serializable

        # The DICOM tags to be removed from ImageSetMetadata .

        @[JSON::Field(key: "removableAttributes")]
        getter removable_attributes : Bytes?

        # The DICOM tags that need to be updated in ImageSetMetadata .

        @[JSON::Field(key: "updatableAttributes")]
        getter updatable_attributes : Bytes?

        def initialize(
          @removable_attributes : Bytes? = nil,
          @updatable_attributes : Bytes? = nil
        )
        end
      end

      # The properties associated with the data store.

      struct DatastoreProperties
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The data store name.

        @[JSON::Field(key: "datastoreName")]
        getter datastore_name : String

        # The data store status.

        @[JSON::Field(key: "datastoreStatus")]
        getter datastore_status : String

        # The timestamp when the data store was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) for the data store.

        @[JSON::Field(key: "datastoreArn")]
        getter datastore_arn : String?

        # The Amazon Resource Name (ARN) assigned to the Key Management Service (KMS) key for accessing
        # encrypted data.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The ARN of the authorizer's Lambda function.

        @[JSON::Field(key: "lambdaAuthorizerArn")]
        getter lambda_authorizer_arn : String?

        # The datastore's lossless storage format.

        @[JSON::Field(key: "losslessStorageFormat")]
        getter lossless_storage_format : String?

        # The timestamp when the data store was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @datastore_id : String,
          @datastore_name : String,
          @datastore_status : String,
          @created_at : Time? = nil,
          @datastore_arn : String? = nil,
          @kms_key_arn : String? = nil,
          @lambda_authorizer_arn : String? = nil,
          @lossless_storage_format : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # List of summaries of data stores.

      struct DatastoreSummary
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The data store name.

        @[JSON::Field(key: "datastoreName")]
        getter datastore_name : String

        # The data store status.

        @[JSON::Field(key: "datastoreStatus")]
        getter datastore_status : String

        # The timestamp when the data store was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) for the data store.

        @[JSON::Field(key: "datastoreArn")]
        getter datastore_arn : String?

        # The timestamp when the data store was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @datastore_id : String,
          @datastore_name : String,
          @datastore_status : String,
          @created_at : Time? = nil,
          @datastore_arn : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct DeleteDatastoreRequest
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        def initialize(
          @datastore_id : String
        )
        end
      end


      struct DeleteDatastoreResponse
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The data store status.

        @[JSON::Field(key: "datastoreStatus")]
        getter datastore_status : String

        def initialize(
          @datastore_id : String,
          @datastore_status : String
        )
        end
      end


      struct DeleteImageSetRequest
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The image set identifier.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        def initialize(
          @datastore_id : String,
          @image_set_id : String
        )
        end
      end


      struct DeleteImageSetResponse
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The image set identifier.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        # The image set state.

        @[JSON::Field(key: "imageSetState")]
        getter image_set_state : String

        # The image set workflow status.

        @[JSON::Field(key: "imageSetWorkflowStatus")]
        getter image_set_workflow_status : String

        def initialize(
          @datastore_id : String,
          @image_set_id : String,
          @image_set_state : String,
          @image_set_workflow_status : String
        )
        end
      end


      struct GetDICOMImportJobRequest
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The import job identifier.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @datastore_id : String,
          @job_id : String
        )
        end
      end


      struct GetDICOMImportJobResponse
        include JSON::Serializable

        # The properties of the import job.

        @[JSON::Field(key: "jobProperties")]
        getter job_properties : Types::DICOMImportJobProperties

        def initialize(
          @job_properties : Types::DICOMImportJobProperties
        )
        end
      end


      struct GetDatastoreRequest
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        def initialize(
          @datastore_id : String
        )
        end
      end


      struct GetDatastoreResponse
        include JSON::Serializable

        # The data store properties.

        @[JSON::Field(key: "datastoreProperties")]
        getter datastore_properties : Types::DatastoreProperties

        def initialize(
          @datastore_properties : Types::DatastoreProperties
        )
        end
      end


      struct GetImageFrameRequest
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # Information about the image frame (pixel data) identifier.

        @[JSON::Field(key: "imageFrameInformation")]
        getter image_frame_information : Types::ImageFrameInformation

        # The image set identifier.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        def initialize(
          @datastore_id : String,
          @image_frame_information : Types::ImageFrameInformation,
          @image_set_id : String
        )
        end
      end


      struct GetImageFrameResponse
        include JSON::Serializable

        # The blob containing the aggregated image frame information.

        @[JSON::Field(key: "imageFrameBlob")]
        getter image_frame_blob : Bytes

        # The format in which the image frame information is returned to the customer. Default is
        # application/octet-stream . If the stored transfer syntax is 1.2.840.10008.1.2.1 , the returned
        # contentType is application/octet-stream . If the stored transfer syntax is 1.2.840.10008.1.2.4.50 ,
        # the returned contentType is image/jpeg . If the stored transfer syntax is 1.2.840.10008.1.2.4.91 ,
        # the returned contentType is image/j2c . If the stored transfer syntax is MPEG2,
        # 1.2.840.10008.1.2.4.100 , 1.2.840.10008.1.2.4.100.1 , 1.2.840.10008.1.2.4.101 , or
        # 1.2.840.10008.1.2.4.101.1 , the returned contentType is video/mpeg . If the stored transfer syntax
        # is MPEG-4 AVC/H.264, UID 1.2.840.10008.1.2.4.102 , 1.2.840.10008.1.2.4.102.1 ,
        # 1.2.840.10008.1.2.4.103 , 1.2.840.10008.1.2.4.103.1 , 1.2.840.10008.1.2.4.104 ,
        # 1.2.840.10008.1.2.4.104.1 , 1.2.840.10008.1.2.4.105 , 1.2.840.10008.1.2.4.105.1 ,
        # 1.2.840.10008.1.2.4.106 , or 1.2.840.10008.1.2.4.106.1 , the returned contentType is video/mp4 . If
        # the stored transfer syntax is HEVC/H.265, UID 1.2.840.10008.1.2.4.107 or 1.2.840.10008.1.2.4.108 ,
        # the returned contentType is video/H256 . If the stored transfer syntax is 1.2.840.10008.1.2.4.202 or
        # if the stored transfer syntax is missing , the returned contentType is image/jph . If the stored
        # transfer syntax is 1.2.840.10008.1.2.4.203 , the returned contentType is image/jphc .

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @image_frame_blob : Bytes,
          @content_type : String? = nil
        )
        end
      end


      struct GetImageSetMetadataRequest
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The image set identifier.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        # The image set version identifier.

        @[JSON::Field(key: "version")]
        getter version_id : String?

        def initialize(
          @datastore_id : String,
          @image_set_id : String,
          @version_id : String? = nil
        )
        end
      end


      struct GetImageSetMetadataResponse
        include JSON::Serializable

        # The blob containing the aggregated metadata information for the image set.

        @[JSON::Field(key: "imageSetMetadataBlob")]
        getter image_set_metadata_blob : Bytes

        # The compression format in which image set metadata attributes are returned.

        @[JSON::Field(key: "Content-Encoding")]
        getter content_encoding : String?

        # The format in which the study metadata is returned to the customer. Default is text/plain .

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @image_set_metadata_blob : Bytes,
          @content_encoding : String? = nil,
          @content_type : String? = nil
        )
        end
      end


      struct GetImageSetRequest
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The image set identifier.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        # The image set version identifier.

        @[JSON::Field(key: "version")]
        getter version_id : String?

        def initialize(
          @datastore_id : String,
          @image_set_id : String,
          @version_id : String? = nil
        )
        end
      end


      struct GetImageSetResponse
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The image set identifier.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        # The image set state.

        @[JSON::Field(key: "imageSetState")]
        getter image_set_state : String

        # The image set version identifier.

        @[JSON::Field(key: "versionId")]
        getter version_id : String

        # The timestamp when image set properties were created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The timestamp when the image set properties were deleted.

        @[JSON::Field(key: "deletedAt")]
        getter deleted_at : Time?

        # The Amazon Resource Name (ARN) assigned to the image set.

        @[JSON::Field(key: "imageSetArn")]
        getter image_set_arn : String?

        # The image set workflow status.

        @[JSON::Field(key: "imageSetWorkflowStatus")]
        getter image_set_workflow_status : String?

        # The flag to determine whether the image set is primary or not.

        @[JSON::Field(key: "isPrimary")]
        getter is_primary : Bool?

        # When the image set was last accessed.

        @[JSON::Field(key: "lastAccessedAt")]
        getter last_accessed_at : Time?

        # The error message thrown if an image set action fails.

        @[JSON::Field(key: "message")]
        getter message : String?

        # This object contains the details of any overrides used while creating a specific image set version.
        # If an image set was copied or updated using the force flag, this object will contain the forced
        # flag.

        @[JSON::Field(key: "overrides")]
        getter overrides : Types::Overrides?

        # The storage tier of the image set.

        @[JSON::Field(key: "storageTier")]
        getter storage_tier : String?

        # The timestamp when image set properties were updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @datastore_id : String,
          @image_set_id : String,
          @image_set_state : String,
          @version_id : String,
          @created_at : Time? = nil,
          @deleted_at : Time? = nil,
          @image_set_arn : String? = nil,
          @image_set_workflow_status : String? = nil,
          @is_primary : Bool? = nil,
          @last_accessed_at : Time? = nil,
          @message : String? = nil,
          @overrides : Types::Overrides? = nil,
          @storage_tier : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Information about the image frame (pixel data) identifier.

      struct ImageFrameInformation
        include JSON::Serializable

        # The image frame (pixel data) identifier.

        @[JSON::Field(key: "imageFrameId")]
        getter image_frame_id : String

        def initialize(
          @image_frame_id : String
        )
        end
      end

      # The image set properties.

      struct ImageSetProperties
        include JSON::Serializable

        # The image set identifier.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        # The image set state.

        @[JSON::Field(key: "imageSetState")]
        getter image_set_state : String

        # The image set version identifier.

        @[JSON::Field(key: "versionId")]
        getter version_id : String

        # The image set workflow status.

        @[JSON::Field(key: "ImageSetWorkflowStatus")]
        getter image_set_workflow_status : String?

        # The timestamp when the image set properties were created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The timestamp when the image set properties were deleted.

        @[JSON::Field(key: "deletedAt")]
        getter deleted_at : Time?

        # The flag to determine whether the image set is primary or not.

        @[JSON::Field(key: "isPrimary")]
        getter is_primary : Bool?

        # The error message thrown if an image set action fails.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Contains details on overrides used when creating the returned version of an image set. For example,
        # if forced exists, the forced flag was used when creating the image set.

        @[JSON::Field(key: "overrides")]
        getter overrides : Types::Overrides?

        # The timestamp when the image set properties were updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @image_set_id : String,
          @image_set_state : String,
          @version_id : String,
          @image_set_workflow_status : String? = nil,
          @created_at : Time? = nil,
          @deleted_at : Time? = nil,
          @is_primary : Bool? = nil,
          @message : String? = nil,
          @overrides : Types::Overrides? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Summary of the image set metadata.

      struct ImageSetsMetadataSummary
        include JSON::Serializable

        # The image set identifier.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        # The DICOM tags associated with the image set.

        @[JSON::Field(key: "DICOMTags")]
        getter dicom_tags : Types::DICOMTags?

        # The time an image set is created. Sample creation date is provided in 1985-04-12T23:20:50.52Z
        # format.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The flag to determine whether the image set is primary or not.

        @[JSON::Field(key: "isPrimary")]
        getter is_primary : Bool?

        # When the image set was last accessed.

        @[JSON::Field(key: "lastAccessedAt")]
        getter last_accessed_at : Time?

        # The image set's storage tier.

        @[JSON::Field(key: "storageTier")]
        getter storage_tier : String?

        # The time an image set was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The image set version.

        @[JSON::Field(key: "version")]
        getter version : Int32?

        def initialize(
          @image_set_id : String,
          @dicom_tags : Types::DICOMTags? = nil,
          @created_at : Time? = nil,
          @is_primary : Bool? = nil,
          @last_accessed_at : Time? = nil,
          @storage_tier : String? = nil,
          @updated_at : Time? = nil,
          @version : Int32? = nil
        )
        end
      end

      # An unexpected error occurred during processing of the request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListDICOMImportJobsRequest
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The filters for listing import jobs based on status.

        @[JSON::Field(key: "jobStatus")]
        getter job_status : String?

        # The max results count. The upper bound is determined by load testing.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to request the list of import jobs on the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @datastore_id : String,
          @job_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDICOMImportJobsResponse
        include JSON::Serializable

        # A list of job summaries.

        @[JSON::Field(key: "jobSummaries")]
        getter job_summaries : Array(Types::DICOMImportJobSummary)

        # The pagination token used to retrieve the list of import jobs on the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_summaries : Array(Types::DICOMImportJobSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListDatastoresRequest
        include JSON::Serializable

        # The data store status.

        @[JSON::Field(key: "datastoreStatus")]
        getter datastore_status : String?

        # Valid Range: Minimum value of 1. Maximum value of 50.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to request the list of data stores on the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @datastore_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatastoresResponse
        include JSON::Serializable

        # The list of summaries of data stores.

        @[JSON::Field(key: "datastoreSummaries")]
        getter datastore_summaries : Array(Types::DatastoreSummary)?

        # The pagination token used to retrieve the list of data stores on the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @datastore_summaries : Array(Types::DatastoreSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImageSetVersionsRequest
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The image set identifier.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        # The max results count.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to request the list of image set versions on the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @datastore_id : String,
          @image_set_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImageSetVersionsResponse
        include JSON::Serializable

        # Lists all properties associated with an image set.

        @[JSON::Field(key: "imageSetPropertiesList")]
        getter image_set_properties_list : Array(Types::ImageSetProperties)

        # The pagination token used to retrieve the list of image set versions on the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @image_set_properties_list : Array(Types::ImageSetProperties),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the medical imaging resource to list tags for.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of all tags associated with a medical imaging resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      # Contains copiable Attributes structure and wraps information related to specific copy use cases. For
      # example, when copying subsets.

      struct MetadataCopies
        include JSON::Serializable

        # The JSON string used to specify a subset of SOP Instances to copy from source to destination image
        # set.

        @[JSON::Field(key: "copiableAttributes")]
        getter copiable_attributes : String

        def initialize(
          @copiable_attributes : String
        )
        end
      end

      # Contains DICOMUpdates.

      struct MetadataUpdates
        include JSON::Serializable

        # The object containing removableAttributes and updatableAttributes .

        @[JSON::Field(key: "DICOMUpdates")]
        getter dicom_updates : Types::DICOMUpdates?

        # Specifies the previous image set version ID to revert the current image set back to. You must
        # provide either revertToVersionId or DICOMUpdates in your request. A ValidationException error is
        # thrown if both parameters are provided at the same time.

        @[JSON::Field(key: "revertToVersionId")]
        getter revert_to_version_id : String?

        def initialize(
          @dicom_updates : Types::DICOMUpdates? = nil,
          @revert_to_version_id : String? = nil
        )
        end
      end

      # Specifies the overrides used in image set modification calls to CopyImageSet and
      # UpdateImageSetMetadata .

      struct Overrides
        include JSON::Serializable

        # Providing this parameter will force completion of the CopyImageSet and UpdateImageSetMetadata
        # actions, even if metadata is inconsistent at the Patient, Study, and/or Series levels.

        @[JSON::Field(key: "forced")]
        getter forced : Bool?

        def initialize(
          @forced : Bool? = nil
        )
        end
      end

      # The request references a resource which does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The search input attribute value.

      struct SearchByAttributeValue
        include JSON::Serializable

        # The DICOM accession number for search.

        @[JSON::Field(key: "DICOMAccessionNumber")]
        getter dicom_accession_number : String?

        # The patient ID input for search.

        @[JSON::Field(key: "DICOMPatientId")]
        getter dicom_patient_id : String?

        # The Series Instance UID input for search.

        @[JSON::Field(key: "DICOMSeriesInstanceUID")]
        getter dicom_series_instance_uid : String?

        # The aggregated structure containing DICOM study date and study time for search.

        @[JSON::Field(key: "DICOMStudyDateAndTime")]
        getter dicom_study_date_and_time : Types::DICOMStudyDateAndTime?

        # The DICOM study ID for search.

        @[JSON::Field(key: "DICOMStudyId")]
        getter dicom_study_id : String?

        # The DICOM study instance UID for search.

        @[JSON::Field(key: "DICOMStudyInstanceUID")]
        getter dicom_study_instance_uid : String?

        # The created at time of the image set provided for search.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The primary image set flag provided for search.

        @[JSON::Field(key: "isPrimary")]
        getter is_primary : Bool?

        # The timestamp input for search.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @dicom_accession_number : String? = nil,
          @dicom_patient_id : String? = nil,
          @dicom_series_instance_uid : String? = nil,
          @dicom_study_date_and_time : Types::DICOMStudyDateAndTime? = nil,
          @dicom_study_id : String? = nil,
          @dicom_study_instance_uid : String? = nil,
          @created_at : Time? = nil,
          @is_primary : Bool? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The search criteria.

      struct SearchCriteria
        include JSON::Serializable

        # The filters for the search criteria.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SearchFilter)?

        # The sort input for search criteria.

        @[JSON::Field(key: "sort")]
        getter sort : Types::Sort?

        def initialize(
          @filters : Array(Types::SearchFilter)? = nil,
          @sort : Types::Sort? = nil
        )
        end
      end

      # The search filter.

      struct SearchFilter
        include JSON::Serializable

        # The search filter operator for imageSetDateTime .

        @[JSON::Field(key: "operator")]
        getter operator : String

        # The search filter values.

        @[JSON::Field(key: "values")]
        getter values : Array(Types::SearchByAttributeValue)

        def initialize(
          @operator : String,
          @values : Array(Types::SearchByAttributeValue)
        )
        end
      end


      struct SearchImageSetsRequest
        include JSON::Serializable

        # The identifier of the data store where the image sets reside.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The maximum number of results that can be returned in a search.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token used for pagination of results returned in the response. Use the token returned from the
        # previous request to continue results where the previous request ended.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The search criteria that filters by applying a maximum of 1 item to SearchByAttribute .

        @[JSON::Field(key: "searchCriteria")]
        getter search_criteria : Types::SearchCriteria?

        def initialize(
          @datastore_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @search_criteria : Types::SearchCriteria? = nil
        )
        end
      end


      struct SearchImageSetsResponse
        include JSON::Serializable

        # The model containing the image set results.

        @[JSON::Field(key: "imageSetsMetadataSummaries")]
        getter image_sets_metadata_summaries : Array(Types::ImageSetsMetadataSummary)

        # The token for pagination results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The sort order for image set search results.

        @[JSON::Field(key: "sort")]
        getter sort : Types::Sort?

        def initialize(
          @image_sets_metadata_summaries : Array(Types::ImageSetsMetadataSummary),
          @next_token : String? = nil,
          @sort : Types::Sort? = nil
        )
        end
      end

      # The request caused a service quota to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Sort search results.

      struct Sort
        include JSON::Serializable

        # The sort field for search criteria.

        @[JSON::Field(key: "sortField")]
        getter sort_field : String

        # The sort order for search criteria.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String

        def initialize(
          @sort_field : String,
          @sort_order : String
        )
        end
      end


      struct StartDICOMImportJobRequest
        include JSON::Serializable

        # A unique identifier for API idempotency.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the IAM role that grants permission to access medical imaging
        # resources.

        @[JSON::Field(key: "dataAccessRoleArn")]
        getter data_access_role_arn : String

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The input prefix path for the S3 bucket that contains the DICOM files to be imported.

        @[JSON::Field(key: "inputS3Uri")]
        getter input_s3_uri : String

        # The output prefix of the S3 bucket to upload the results of the DICOM import job.

        @[JSON::Field(key: "outputS3Uri")]
        getter output_s3_uri : String

        # The account ID of the source S3 bucket owner.

        @[JSON::Field(key: "inputOwnerAccountId")]
        getter input_owner_account_id : String?

        # The import job name.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        def initialize(
          @client_token : String,
          @data_access_role_arn : String,
          @datastore_id : String,
          @input_s3_uri : String,
          @output_s3_uri : String,
          @input_owner_account_id : String? = nil,
          @job_name : String? = nil
        )
        end
      end


      struct StartDICOMImportJobResponse
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The import job identifier.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The import job status.

        @[JSON::Field(key: "jobStatus")]
        getter job_status : String

        # The timestamp when the import job was submitted.

        @[JSON::Field(key: "submittedAt")]
        getter submitted_at : Time

        def initialize(
          @datastore_id : String,
          @job_id : String,
          @job_status : String,
          @submitted_at : Time
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the medical imaging resource that tags are being added to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The user-specified key and value tag pairs added to a medical imaging resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request was denied due to throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the medical imaging resource that tags are being removed from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys for the tags to be removed from the medical imaging resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateImageSetMetadataRequest
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The image set identifier.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        # The latest image set version identifier.

        @[JSON::Field(key: "latestVersion")]
        getter latest_version_id : String

        # Update image set metadata updates.

        @[JSON::Field(key: "updateImageSetMetadataUpdates")]
        getter update_image_set_metadata_updates : Types::MetadataUpdates

        # Setting this flag will force the UpdateImageSetMetadata operation for the following attributes:
        # Tag.StudyInstanceUID , Tag.SeriesInstanceUID , Tag.SOPInstanceUID , and Tag.StudyID Adding,
        # removing, or updating private tags for an individual SOP Instance

        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @datastore_id : String,
          @image_set_id : String,
          @latest_version_id : String,
          @update_image_set_metadata_updates : Types::MetadataUpdates,
          @force : Bool? = nil
        )
        end
      end


      struct UpdateImageSetMetadataResponse
        include JSON::Serializable

        # The data store identifier.

        @[JSON::Field(key: "datastoreId")]
        getter datastore_id : String

        # The image set identifier.

        @[JSON::Field(key: "imageSetId")]
        getter image_set_id : String

        # The image set state.

        @[JSON::Field(key: "imageSetState")]
        getter image_set_state : String

        # The latest image set version identifier.

        @[JSON::Field(key: "latestVersionId")]
        getter latest_version_id : String

        # The timestamp when image set metadata was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The image set workflow status.

        @[JSON::Field(key: "imageSetWorkflowStatus")]
        getter image_set_workflow_status : String?

        # The error message thrown if an update image set metadata action fails.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The timestamp when image set metadata was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @datastore_id : String,
          @image_set_id : String,
          @image_set_state : String,
          @latest_version_id : String,
          @created_at : Time? = nil,
          @image_set_workflow_status : String? = nil,
          @message : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The input fails to satisfy the constraints set by the service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
