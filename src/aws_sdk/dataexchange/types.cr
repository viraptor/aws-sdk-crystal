require "json"
require "time"

module AwsSdk
  module DataExchange
    module Types

      struct AcceptDataGrantRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the data grant to accept.
        @[JSON::Field(key: "DataGrantArn")]
        getter data_grant_arn : String

        def initialize(
          @data_grant_arn : String
        )
        end
      end

      struct AcceptDataGrantResponse
        include JSON::Serializable

        # The acceptance state of the data grant.
        @[JSON::Field(key: "AcceptanceState")]
        getter acceptance_state : String

        # The Amazon Resource Name (ARN) of the accepted data grant.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The timestamp of when the data grant was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The ID of the data set associated to the data grant.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The distribution scope for the data grant.
        @[JSON::Field(key: "GrantDistributionScope")]
        getter grant_distribution_scope : String

        # The ID of the data grant.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the accepted data grant.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Web Services account ID of the data grant receiver.
        @[JSON::Field(key: "ReceiverPrincipal")]
        getter receiver_principal : String

        # The timestamp of when the data grant was last updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time

        # The timestamp of when the data grant was accepted.
        @[JSON::Field(key: "AcceptedAt")]
        getter accepted_at : Time?

        # The description of the accepted data grant.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The timestamp of when access to the associated data set ends.
        @[JSON::Field(key: "EndsAt")]
        getter ends_at : Time?

        # The Amazon Web Services account ID of the data grant sender.
        @[JSON::Field(key: "SenderPrincipal")]
        getter sender_principal : String?

        def initialize(
          @acceptance_state : String,
          @arn : String,
          @created_at : Time,
          @data_set_id : String,
          @grant_distribution_scope : String,
          @id : String,
          @name : String,
          @receiver_principal : String,
          @updated_at : Time,
          @accepted_at : Time? = nil,
          @description : String? = nil,
          @ends_at : Time? = nil,
          @sender_principal : String? = nil
        )
        end
      end

      # Access to the resource is denied.
      struct AccessDeniedException
        include JSON::Serializable

        # Access to the resource is denied.
        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # What occurs after a certain event.
      struct Action
        include JSON::Serializable

        # Details for the export revision to Amazon S3 action.
        @[JSON::Field(key: "ExportRevisionToS3")]
        getter export_revision_to_s3 : Types::AutoExportRevisionToS3RequestDetails?

        def initialize(
          @export_revision_to_s3 : Types::AutoExportRevisionToS3RequestDetails? = nil
        )
        end
      end

      # The API Gateway API that is the asset.
      struct ApiGatewayApiAsset
        include JSON::Serializable

        # The API description of the API asset.
        @[JSON::Field(key: "ApiDescription")]
        getter api_description : String?

        # The API endpoint of the API asset.
        @[JSON::Field(key: "ApiEndpoint")]
        getter api_endpoint : String?

        # The unique identifier of the API asset.
        @[JSON::Field(key: "ApiId")]
        getter api_id : String?

        # The API key of the API asset.
        @[JSON::Field(key: "ApiKey")]
        getter api_key : String?

        # The API name of the API asset.
        @[JSON::Field(key: "ApiName")]
        getter api_name : String?

        # The download URL of the API specification of the API asset.
        @[JSON::Field(key: "ApiSpecificationDownloadUrl")]
        getter api_specification_download_url : String?

        # The date and time that the upload URL expires, in ISO 8601 format.
        @[JSON::Field(key: "ApiSpecificationDownloadUrlExpiresAt")]
        getter api_specification_download_url_expires_at : Time?

        # The protocol type of the API asset.
        @[JSON::Field(key: "ProtocolType")]
        getter protocol_type : String?

        # The stage of the API asset.
        @[JSON::Field(key: "Stage")]
        getter stage : String?

        def initialize(
          @api_description : String? = nil,
          @api_endpoint : String? = nil,
          @api_id : String? = nil,
          @api_key : String? = nil,
          @api_name : String? = nil,
          @api_specification_download_url : String? = nil,
          @api_specification_download_url_expires_at : Time? = nil,
          @protocol_type : String? = nil,
          @stage : String? = nil
        )
        end
      end

      # The destination for the asset.
      struct AssetDestinationEntry
        include JSON::Serializable

        # The unique identifier for the asset.
        @[JSON::Field(key: "AssetId")]
        getter asset_id : String

        # The Amazon S3 bucket that is the destination for the asset.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The name of the object in Amazon S3 for the asset.
        @[JSON::Field(key: "Key")]
        getter key : String?

        def initialize(
          @asset_id : String,
          @bucket : String,
          @key : String? = nil
        )
        end
      end

      # Details about the asset.
      struct AssetDetails
        include JSON::Serializable

        # Information about the API Gateway API asset.
        @[JSON::Field(key: "ApiGatewayApiAsset")]
        getter api_gateway_api_asset : Types::ApiGatewayApiAsset?

        # The AWS Lake Formation data permission that is the asset.
        @[JSON::Field(key: "LakeFormationDataPermissionAsset")]
        getter lake_formation_data_permission_asset : Types::LakeFormationDataPermissionAsset?

        # The Amazon Redshift datashare that is the asset.
        @[JSON::Field(key: "RedshiftDataShareAsset")]
        getter redshift_data_share_asset : Types::RedshiftDataShareAsset?

        # The Amazon S3 data access that is the asset.
        @[JSON::Field(key: "S3DataAccessAsset")]
        getter s3_data_access_asset : Types::S3DataAccessAsset?

        # The Amazon S3 object that is the asset.
        @[JSON::Field(key: "S3SnapshotAsset")]
        getter s3_snapshot_asset : Types::S3SnapshotAsset?

        def initialize(
          @api_gateway_api_asset : Types::ApiGatewayApiAsset? = nil,
          @lake_formation_data_permission_asset : Types::LakeFormationDataPermissionAsset? = nil,
          @redshift_data_share_asset : Types::RedshiftDataShareAsset? = nil,
          @s3_data_access_asset : Types::S3DataAccessAsset? = nil,
          @s3_snapshot_asset : Types::S3SnapshotAsset? = nil
        )
        end
      end

      # An asset in AWS Data Exchange is a piece of data (Amazon S3 object) or a means of fulfilling data
      # (Amazon Redshift datashare or Amazon API Gateway API, AWS Lake Formation data permission, or Amazon
      # S3 data access). The asset can be a structured data file, an image file, or some other data file
      # that can be stored as an Amazon S3 object, an Amazon API Gateway API, or an Amazon Redshift
      # datashare, an AWS Lake Formation data permission, or an Amazon S3 data access. When you create an
      # import job for your files, API Gateway APIs, Amazon Redshift datashares, AWS Lake Formation data
      # permission, or Amazon S3 data access, you create an asset in AWS Data Exchange.
      struct AssetEntry
        include JSON::Serializable

        # The ARN for the asset.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Details about the asset.
        @[JSON::Field(key: "AssetDetails")]
        getter asset_details : Types::AssetDetails

        # The type of asset that is added to a data set.
        @[JSON::Field(key: "AssetType")]
        getter asset_type : String

        # The date and time that the asset was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The unique identifier for the data set associated with this asset.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the asset.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the asset. When importing from Amazon S3, the Amazon S3 object key is used as the asset
        # name. When exporting to Amazon S3, the asset name is used as default target Amazon S3 object key.
        # When importing from Amazon API Gateway API, the API name is used as the asset name. When importing
        # from Amazon Redshift, the datashare name is used as the asset name. When importing from AWS Lake
        # Formation, the static values of "Database(s) included in LF-tag policy" or "Table(s) included in
        # LF-tag policy" are used as the asset name.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The unique identifier for the revision associated with this asset.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # The date and time that the asset was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time

        # The asset ID of the owned asset corresponding to the entitled asset being viewed. This parameter is
        # returned when an asset owner is viewing the entitled copy of its owned asset.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        def initialize(
          @arn : String,
          @asset_details : Types::AssetDetails,
          @asset_type : String,
          @created_at : Time,
          @data_set_id : String,
          @id : String,
          @name : String,
          @revision_id : String,
          @updated_at : Time,
          @source_id : String? = nil
        )
        end
      end

      # The source of the assets.
      struct AssetSourceEntry
        include JSON::Serializable

        # The Amazon S3 bucket that's part of the source of the asset.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The name of the object in Amazon S3 for the asset.
        @[JSON::Field(key: "Key")]
        getter key : String

        def initialize(
          @bucket : String,
          @key : String
        )
        end
      end

      # A revision destination is the Amazon S3 bucket folder destination to where the export will be sent.
      struct AutoExportRevisionDestinationEntry
        include JSON::Serializable

        # The Amazon S3 bucket that is the destination for the event action.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # A string representing the pattern for generated names of the individual assets in the revision. For
        # more information about key patterns, see Key patterns when exporting revisions .
        @[JSON::Field(key: "KeyPattern")]
        getter key_pattern : String?

        def initialize(
          @bucket : String,
          @key_pattern : String? = nil
        )
        end
      end

      # Details of the operation to be performed by the job.
      struct AutoExportRevisionToS3RequestDetails
        include JSON::Serializable

        # A revision destination is the Amazon S3 bucket folder destination to where the export will be sent.
        @[JSON::Field(key: "RevisionDestination")]
        getter revision_destination : Types::AutoExportRevisionDestinationEntry

        # Encryption configuration for the auto export job.
        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::ExportServerSideEncryption?

        def initialize(
          @revision_destination : Types::AutoExportRevisionDestinationEntry,
          @encryption : Types::ExportServerSideEncryption? = nil
        )
        end
      end

      struct CancelJobRequest
        include JSON::Serializable

        # The unique identifier for a job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      # The request couldn't be completed because it conflicted with the current state of the resource.
      struct ConflictException
        include JSON::Serializable

        # The request couldn't be completed because it conflicted with the current state of the resource.
        @[JSON::Field(key: "Message")]
        getter message : String

        # The unique identifier for the resource with the conflict.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of the resource with the conflict.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct CreateDataGrantRequest
        include JSON::Serializable

        # The distribution scope of the data grant.
        @[JSON::Field(key: "GrantDistributionScope")]
        getter grant_distribution_scope : String

        # The name of the data grant.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Web Services account ID of the data grant receiver.
        @[JSON::Field(key: "ReceiverPrincipal")]
        getter receiver_principal : String

        # The ID of the data set used to create the data grant.
        @[JSON::Field(key: "SourceDataSetId")]
        getter source_data_set_id : String

        # The description of the data grant.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The timestamp of when access to the associated data set ends.
        @[JSON::Field(key: "EndsAt")]
        getter ends_at : Time?

        # The tags to add to the data grant. A tag is a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @grant_distribution_scope : String,
          @name : String,
          @receiver_principal : String,
          @source_data_set_id : String,
          @description : String? = nil,
          @ends_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDataGrantResponse
        include JSON::Serializable

        # The acceptance state of the data grant.
        @[JSON::Field(key: "AcceptanceState")]
        getter acceptance_state : String

        # The Amazon Resource Name (ARN) of the data grant.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The timestamp of when the data grant was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The ID of the data set associated to the data grant.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The distribution scope for the data grant.
        @[JSON::Field(key: "GrantDistributionScope")]
        getter grant_distribution_scope : String

        # The ID of the data grant.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the data grant.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Web Services account ID of the data grant receiver.
        @[JSON::Field(key: "ReceiverPrincipal")]
        getter receiver_principal : String

        # The Amazon Web Services account ID of the data grant sender.
        @[JSON::Field(key: "SenderPrincipal")]
        getter sender_principal : String

        # The ID of the data set used to create the data grant.
        @[JSON::Field(key: "SourceDataSetId")]
        getter source_data_set_id : String

        # The timestamp of when the data grant was last updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time

        # The timestamp of when the data grant was accepted.
        @[JSON::Field(key: "AcceptedAt")]
        getter accepted_at : Time?

        # The description of the data grant.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The timestamp of when access to the associated data set ends.
        @[JSON::Field(key: "EndsAt")]
        getter ends_at : Time?

        # The tags associated to the data grant. A tag is a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @acceptance_state : String,
          @arn : String,
          @created_at : Time,
          @data_set_id : String,
          @grant_distribution_scope : String,
          @id : String,
          @name : String,
          @receiver_principal : String,
          @sender_principal : String,
          @source_data_set_id : String,
          @updated_at : Time,
          @accepted_at : Time? = nil,
          @description : String? = nil,
          @ends_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDataSetRequest
        include JSON::Serializable

        # The type of asset that is added to a data set.
        @[JSON::Field(key: "AssetType")]
        getter asset_type : String

        # A description for the data set. This value can be up to 16,348 characters long.
        @[JSON::Field(key: "Description")]
        getter description : String

        # The name of the data set.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A data set tag is an optional label that you can assign to a data set when you create it. Each tag
        # consists of a key and an optional value, both of which you define. When you use tagging, you can
        # also use tag-based access control in IAM policies to control access to these data sets and
        # revisions.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @asset_type : String,
          @description : String,
          @name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDataSetResponse
        include JSON::Serializable

        # The ARN for the data set.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The type of asset that is added to a data set.
        @[JSON::Field(key: "AssetType")]
        getter asset_type : String?

        # The date and time that the data set was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description for the data set.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier for the data set.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the data set.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A property that defines the data set as OWNED by the account (for providers) or ENTITLED to the
        # account (for subscribers).
        @[JSON::Field(key: "Origin")]
        getter origin : String?

        # If the origin of this data set is ENTITLED, includes the details for the product on AWS Marketplace.
        @[JSON::Field(key: "OriginDetails")]
        getter origin_details : Types::OriginDetails?

        # The data set ID of the owned data set corresponding to the entitled data set being viewed. This
        # parameter is returned when a data set owner is viewing the entitled copy of its owned data set.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        # The tags for the data set.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The date and time that the data set was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @asset_type : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @origin : String? = nil,
          @origin_details : Types::OriginDetails? = nil,
          @source_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct CreateEventActionRequest
        include JSON::Serializable

        # What occurs after a certain event.
        @[JSON::Field(key: "Action")]
        getter action : Types::Action

        # What occurs to start an action.
        @[JSON::Field(key: "Event")]
        getter event : Types::Event

        # Key-value pairs that you can associate with the event action.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @action : Types::Action,
          @event : Types::Event,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateEventActionResponse
        include JSON::Serializable

        # What occurs after a certain event.
        @[JSON::Field(key: "Action")]
        getter action : Types::Action?

        # The ARN for the event action.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the event action was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # What occurs to start an action.
        @[JSON::Field(key: "Event")]
        getter event : Types::Event?

        # The unique identifier for the event action.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The tags for the event action.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The date and time that the event action was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @action : Types::Action? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @event : Types::Event? = nil,
          @id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct CreateJobRequest
        include JSON::Serializable

        # The details for the CreateJob request.
        @[JSON::Field(key: "Details")]
        getter details : Types::RequestDetails

        # The type of job to be created.
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @details : Types::RequestDetails,
          @type : String
        )
        end
      end

      struct CreateJobResponse
        include JSON::Serializable

        # The ARN for the job.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the job was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Details about the job.
        @[JSON::Field(key: "Details")]
        getter details : Types::ResponseDetails?

        # The errors associated with jobs.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::JobError)?

        # The unique identifier for the job.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The state of the job.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The job type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The date and time that the job was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @details : Types::ResponseDetails? = nil,
          @errors : Array(Types::JobError)? = nil,
          @id : String? = nil,
          @state : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct CreateRevisionRequest
        include JSON::Serializable

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # An optional comment about the revision.
        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # A revision tag is an optional label that you can assign to a revision when you create it. Each tag
        # consists of a key and an optional value, both of which you define. When you use tagging, you can
        # also use tag-based access control in IAM policies to control access to these data sets and
        # revisions.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @data_set_id : String,
          @comment : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateRevisionResponse
        include JSON::Serializable

        # The ARN for the revision.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # An optional comment about the revision.
        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The date and time that the revision was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The unique identifier for the data set associated with the data set revision.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String?

        # To publish a revision to a data set in a product, the revision must first be finalized. Finalizing a
        # revision tells AWS Data Exchange that your changes to the assets in the revision are complete. After
        # it's in this read-only state, you can publish the revision to your products. Finalized revisions can
        # be published through the AWS Data Exchange console or the AWS Marketplace Catalog API, using the
        # StartChangeSet AWS Marketplace Catalog API action. When using the API, revisions are uniquely
        # identified by their ARN.
        @[JSON::Field(key: "Finalized")]
        getter finalized : Bool?

        # The unique identifier for the revision.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # A required comment to inform subscribers of the reason their access to the revision was revoked.
        @[JSON::Field(key: "RevocationComment")]
        getter revocation_comment : String?

        # A status indicating that subscribers' access to the revision was revoked.
        @[JSON::Field(key: "Revoked")]
        getter revoked : Bool?

        # The date and time that the revision was revoked, in ISO 8601 format.
        @[JSON::Field(key: "RevokedAt")]
        getter revoked_at : Time?

        # The revision ID of the owned revision corresponding to the entitled revision being viewed. This
        # parameter is returned when a revision owner is viewing the entitled copy of its owned revision.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        # The tags for the revision.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The date and time that the revision was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @comment : String? = nil,
          @created_at : Time? = nil,
          @data_set_id : String? = nil,
          @finalized : Bool? = nil,
          @id : String? = nil,
          @revocation_comment : String? = nil,
          @revoked : Bool? = nil,
          @revoked_at : Time? = nil,
          @source_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Details of the operation to create an Amazon S3 data access from an S3 bucket.
      struct CreateS3DataAccessFromS3BucketRequestDetails
        include JSON::Serializable

        # Details about the S3 data access source asset.
        @[JSON::Field(key: "AssetSource")]
        getter asset_source : Types::S3DataAccessAssetSourceEntry

        # The unique identifier for the data set associated with the creation of this Amazon S3 data access.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for a revision.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @asset_source : Types::S3DataAccessAssetSourceEntry,
          @data_set_id : String,
          @revision_id : String
        )
        end
      end

      # Details about the response of the operation to create an S3 data access from an S3 bucket.
      struct CreateS3DataAccessFromS3BucketResponseDetails
        include JSON::Serializable

        # Details about the asset source from an Amazon S3 bucket.
        @[JSON::Field(key: "AssetSource")]
        getter asset_source : Types::S3DataAccessAssetSourceEntry

        # The unique identifier for this data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @asset_source : Types::S3DataAccessAssetSourceEntry,
          @data_set_id : String,
          @revision_id : String
        )
        end
      end

      # Information about a data grant.
      struct DataGrantSummaryEntry
        include JSON::Serializable

        # The acceptance state of the data grant.
        @[JSON::Field(key: "AcceptanceState")]
        getter acceptance_state : String

        # The Amazon Resource Name (ARN) of the data grant.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The timestamp of when the data grant was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The ID of the data set associated to the data grant.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The ID of the data grant.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the data grant.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Web Services account ID of the data grant receiver.
        @[JSON::Field(key: "ReceiverPrincipal")]
        getter receiver_principal : String

        # The Amazon Web Services account ID of the data grant sender.
        @[JSON::Field(key: "SenderPrincipal")]
        getter sender_principal : String

        # The ID of the data set used to create the data grant.
        @[JSON::Field(key: "SourceDataSetId")]
        getter source_data_set_id : String

        # The timestamp of when the data grant was last updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time

        # The timestamp of when the data grant was accepted.
        @[JSON::Field(key: "AcceptedAt")]
        getter accepted_at : Time?

        # The timestamp of when access to the associated data set ends.
        @[JSON::Field(key: "EndsAt")]
        getter ends_at : Time?

        def initialize(
          @acceptance_state : String,
          @arn : String,
          @created_at : Time,
          @data_set_id : String,
          @id : String,
          @name : String,
          @receiver_principal : String,
          @sender_principal : String,
          @source_data_set_id : String,
          @updated_at : Time,
          @accepted_at : Time? = nil,
          @ends_at : Time? = nil
        )
        end
      end

      # A data set is an AWS resource with one or more revisions.
      struct DataSetEntry
        include JSON::Serializable

        # The ARN for the data set.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The type of asset that is added to a data set.
        @[JSON::Field(key: "AssetType")]
        getter asset_type : String

        # The date and time that the data set was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The description for the data set.
        @[JSON::Field(key: "Description")]
        getter description : String

        # The unique identifier for the data set.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the data set.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A property that defines the data set as OWNED by the account (for providers) or ENTITLED to the
        # account (for subscribers).
        @[JSON::Field(key: "Origin")]
        getter origin : String

        # The date and time that the data set was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time

        # If the origin of this data set is ENTITLED, includes the details for the product on AWS Marketplace.
        @[JSON::Field(key: "OriginDetails")]
        getter origin_details : Types::OriginDetails?

        # The data set ID of the owned data set corresponding to the entitled data set being viewed. This
        # parameter is returned when a data set owner is viewing the entitled copy of its owned data set.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        def initialize(
          @arn : String,
          @asset_type : String,
          @created_at : Time,
          @description : String,
          @id : String,
          @name : String,
          @origin : String,
          @updated_at : Time,
          @origin_details : Types::OriginDetails? = nil,
          @source_id : String? = nil
        )
        end
      end

      # Extra details specific to a data update type notification.
      struct DataUpdateRequestDetails
        include JSON::Serializable

        # A datetime in the past when the data was updated. This typically means that the underlying resource
        # supporting the data set was updated.
        @[JSON::Field(key: "DataUpdatedAt")]
        getter data_updated_at : Time?

        def initialize(
          @data_updated_at : Time? = nil
        )
        end
      end

      # The LF-tag policy for database resources.
      struct DatabaseLFTagPolicy
        include JSON::Serializable

        # A list of LF-tag conditions that apply to database resources.
        @[JSON::Field(key: "Expression")]
        getter expression : Array(Types::LFTag)

        def initialize(
          @expression : Array(Types::LFTag)
        )
        end
      end

      # The LF-tag policy and permissions for database resources.
      struct DatabaseLFTagPolicyAndPermissions
        include JSON::Serializable

        # A list of LF-tag conditions that apply to database resources.
        @[JSON::Field(key: "Expression")]
        getter expression : Array(Types::LFTag)

        # The permissions granted to subscribers on database resources.
        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)

        def initialize(
          @expression : Array(Types::LFTag),
          @permissions : Array(String)
        )
        end
      end

      struct DeleteAssetRequest
        include JSON::Serializable

        # The unique identifier for an asset.
        @[JSON::Field(key: "AssetId")]
        getter asset_id : String

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for a revision.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @asset_id : String,
          @data_set_id : String,
          @revision_id : String
        )
        end
      end

      struct DeleteDataGrantRequest
        include JSON::Serializable

        # The ID of the data grant to delete.
        @[JSON::Field(key: "DataGrantId")]
        getter data_grant_id : String

        def initialize(
          @data_grant_id : String
        )
        end
      end

      struct DeleteDataSetRequest
        include JSON::Serializable

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        def initialize(
          @data_set_id : String
        )
        end
      end

      struct DeleteEventActionRequest
        include JSON::Serializable

        # The unique identifier for the event action.
        @[JSON::Field(key: "EventActionId")]
        getter event_action_id : String

        def initialize(
          @event_action_id : String
        )
        end
      end

      struct DeleteRevisionRequest
        include JSON::Serializable

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for a revision.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @data_set_id : String,
          @revision_id : String
        )
        end
      end

      # Extra details specific to a deprecation type notification.
      struct DeprecationRequestDetails
        include JSON::Serializable

        # A datetime in the future when the data set will be deprecated.
        @[JSON::Field(key: "DeprecationAt")]
        getter deprecation_at : Time

        def initialize(
          @deprecation_at : Time
        )
        end
      end

      # Information about the job error.
      struct Details
        include JSON::Serializable

        # Information about the job error.
        @[JSON::Field(key: "ImportAssetFromSignedUrlJobErrorDetails")]
        getter import_asset_from_signed_url_job_error_details : Types::ImportAssetFromSignedUrlJobErrorDetails?

        # Details about the job error.
        @[JSON::Field(key: "ImportAssetsFromS3JobErrorDetails")]
        getter import_assets_from_s3_job_error_details : Array(Types::AssetSourceEntry)?

        def initialize(
          @import_asset_from_signed_url_job_error_details : Types::ImportAssetFromSignedUrlJobErrorDetails? = nil,
          @import_assets_from_s3_job_error_details : Array(Types::AssetSourceEntry)? = nil
        )
        end
      end

      # What occurs to start an action.
      struct Event
        include JSON::Serializable

        # What occurs to start the revision publish action.
        @[JSON::Field(key: "RevisionPublished")]
        getter revision_published : Types::RevisionPublished?

        def initialize(
          @revision_published : Types::RevisionPublished? = nil
        )
        end
      end

      # An event action is an object that defines the relationship between a specific event and an automated
      # action that will be taken on behalf of the customer.
      struct EventActionEntry
        include JSON::Serializable

        # What occurs after a certain event.
        @[JSON::Field(key: "Action")]
        getter action : Types::Action

        # The Amazon Resource Name (ARN) for the event action.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date and time that the event action was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # What occurs to start an action.
        @[JSON::Field(key: "Event")]
        getter event : Types::Event

        # The unique identifier for the event action.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time that the event action was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time

        def initialize(
          @action : Types::Action,
          @arn : String,
          @created_at : Time,
          @event : Types::Event,
          @id : String,
          @updated_at : Time
        )
        end
      end

      # Details of the operation to be performed by the job.
      struct ExportAssetToSignedUrlRequestDetails
        include JSON::Serializable

        # The unique identifier for the asset that is exported to a signed URL.
        @[JSON::Field(key: "AssetId")]
        getter asset_id : String

        # The unique identifier for the data set associated with this export job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision associated with this export request.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @asset_id : String,
          @data_set_id : String,
          @revision_id : String
        )
        end
      end

      # The details of the export to signed URL response.
      struct ExportAssetToSignedUrlResponseDetails
        include JSON::Serializable

        # The unique identifier for the asset associated with this export job.
        @[JSON::Field(key: "AssetId")]
        getter asset_id : String

        # The unique identifier for the data set associated with this export job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision associated with this export response.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # The signed URL for the export request.
        @[JSON::Field(key: "SignedUrl")]
        getter signed_url : String?

        # The date and time that the signed URL expires, in ISO 8601 format.
        @[JSON::Field(key: "SignedUrlExpiresAt")]
        getter signed_url_expires_at : Time?

        def initialize(
          @asset_id : String,
          @data_set_id : String,
          @revision_id : String,
          @signed_url : String? = nil,
          @signed_url_expires_at : Time? = nil
        )
        end
      end

      # Details of the operation to be performed by the job.
      struct ExportAssetsToS3RequestDetails
        include JSON::Serializable

        # The destination for the asset.
        @[JSON::Field(key: "AssetDestinations")]
        getter asset_destinations : Array(Types::AssetDestinationEntry)

        # The unique identifier for the data set associated with this export job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision associated with this export request.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # Encryption configuration for the export job.
        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::ExportServerSideEncryption?

        def initialize(
          @asset_destinations : Array(Types::AssetDestinationEntry),
          @data_set_id : String,
          @revision_id : String,
          @encryption : Types::ExportServerSideEncryption? = nil
        )
        end
      end

      # Details about the export to Amazon S3 response.
      struct ExportAssetsToS3ResponseDetails
        include JSON::Serializable

        # The destination in Amazon S3 where the asset is exported.
        @[JSON::Field(key: "AssetDestinations")]
        getter asset_destinations : Array(Types::AssetDestinationEntry)

        # The unique identifier for the data set associated with this export job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision associated with this export response.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # Encryption configuration of the export job.
        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::ExportServerSideEncryption?

        def initialize(
          @asset_destinations : Array(Types::AssetDestinationEntry),
          @data_set_id : String,
          @revision_id : String,
          @encryption : Types::ExportServerSideEncryption? = nil
        )
        end
      end

      # Details of the operation to be performed by the job.
      struct ExportRevisionsToS3RequestDetails
        include JSON::Serializable

        # The unique identifier for the data set associated with this export job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The destination for the revision.
        @[JSON::Field(key: "RevisionDestinations")]
        getter revision_destinations : Array(Types::RevisionDestinationEntry)

        # Encryption configuration for the export job.
        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::ExportServerSideEncryption?

        def initialize(
          @data_set_id : String,
          @revision_destinations : Array(Types::RevisionDestinationEntry),
          @encryption : Types::ExportServerSideEncryption? = nil
        )
        end
      end

      # Details about the export revisions to Amazon S3 response.
      struct ExportRevisionsToS3ResponseDetails
        include JSON::Serializable

        # The unique identifier for the data set associated with this export job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The destination in Amazon S3 where the revision is exported.
        @[JSON::Field(key: "RevisionDestinations")]
        getter revision_destinations : Array(Types::RevisionDestinationEntry)

        # Encryption configuration of the export job.
        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::ExportServerSideEncryption?

        # The Amazon Resource Name (ARN) of the event action.
        @[JSON::Field(key: "EventActionArn")]
        getter event_action_arn : String?

        def initialize(
          @data_set_id : String,
          @revision_destinations : Array(Types::RevisionDestinationEntry),
          @encryption : Types::ExportServerSideEncryption? = nil,
          @event_action_arn : String? = nil
        )
        end
      end

      # Encryption configuration of the export job. Includes the encryption type in addition to the AWS KMS
      # key. The KMS key is only necessary if you chose the KMS encryption type.
      struct ExportServerSideEncryption
        include JSON::Serializable

        # The type of server side encryption used for encrypting the objects in Amazon S3.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The Amazon Resource Name (ARN) of the AWS KMS key you want to use to encrypt the Amazon S3 objects.
        # This parameter is required if you choose aws:kms as an encryption type.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @type : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      struct GetAssetRequest
        include JSON::Serializable

        # The unique identifier for an asset.
        @[JSON::Field(key: "AssetId")]
        getter asset_id : String

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for a revision.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @asset_id : String,
          @data_set_id : String,
          @revision_id : String
        )
        end
      end

      struct GetAssetResponse
        include JSON::Serializable

        # The ARN for the asset.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Details about the asset.
        @[JSON::Field(key: "AssetDetails")]
        getter asset_details : Types::AssetDetails?

        # The type of asset that is added to a data set.
        @[JSON::Field(key: "AssetType")]
        getter asset_type : String?

        # The date and time that the asset was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The unique identifier for the data set associated with this asset.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String?

        # The unique identifier for the asset.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the asset. When importing from Amazon S3, the Amazon S3 object key is used as the asset
        # name. When exporting to Amazon S3, the asset name is used as default target Amazon S3 object key.
        # When importing from Amazon API Gateway API, the API name is used as the asset name. When importing
        # from Amazon Redshift, the datashare name is used as the asset name. When importing from AWS Lake
        # Formation, the static values of "Database(s) included in the LF-tag policy" or "Table(s) included in
        # the LF-tag policy" are used as the asset name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique identifier for the revision associated with this asset.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        # The asset ID of the owned asset corresponding to the entitled asset being viewed. This parameter is
        # returned when an asset owner is viewing the entitled copy of its owned asset.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        # The date and time that the asset was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @asset_details : Types::AssetDetails? = nil,
          @asset_type : String? = nil,
          @created_at : Time? = nil,
          @data_set_id : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @revision_id : String? = nil,
          @source_id : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct GetDataGrantRequest
        include JSON::Serializable

        # The ID of the data grant.
        @[JSON::Field(key: "DataGrantId")]
        getter data_grant_id : String

        def initialize(
          @data_grant_id : String
        )
        end
      end

      struct GetDataGrantResponse
        include JSON::Serializable

        # The acceptance state of the data grant.
        @[JSON::Field(key: "AcceptanceState")]
        getter acceptance_state : String

        # The Amazon Resource Name (ARN) of the data grant.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The timestamp of when the data grant was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The ID of the data set associated to the data grant.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The distribution scope for the data grant.
        @[JSON::Field(key: "GrantDistributionScope")]
        getter grant_distribution_scope : String

        # The ID of the data grant.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the data grant.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Web Services account ID of the data grant receiver.
        @[JSON::Field(key: "ReceiverPrincipal")]
        getter receiver_principal : String

        # The Amazon Web Services account ID of the data grant sender.
        @[JSON::Field(key: "SenderPrincipal")]
        getter sender_principal : String

        # The ID of the data set used to create the data grant.
        @[JSON::Field(key: "SourceDataSetId")]
        getter source_data_set_id : String

        # The timestamp of when the data grant was last updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time

        # The timestamp of when the data grant was accepted.
        @[JSON::Field(key: "AcceptedAt")]
        getter accepted_at : Time?

        # The description of the data grant.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The timestamp of when access to the associated data set ends.
        @[JSON::Field(key: "EndsAt")]
        getter ends_at : Time?

        # The tags associated to the data grant. A tag is a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @acceptance_state : String,
          @arn : String,
          @created_at : Time,
          @data_set_id : String,
          @grant_distribution_scope : String,
          @id : String,
          @name : String,
          @receiver_principal : String,
          @sender_principal : String,
          @source_data_set_id : String,
          @updated_at : Time,
          @accepted_at : Time? = nil,
          @description : String? = nil,
          @ends_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetDataSetRequest
        include JSON::Serializable

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        def initialize(
          @data_set_id : String
        )
        end
      end

      struct GetDataSetResponse
        include JSON::Serializable

        # The ARN for the data set.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The type of asset that is added to a data set.
        @[JSON::Field(key: "AssetType")]
        getter asset_type : String?

        # The date and time that the data set was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description for the data set.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier for the data set.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the data set.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A property that defines the data set as OWNED by the account (for providers) or ENTITLED to the
        # account (for subscribers).
        @[JSON::Field(key: "Origin")]
        getter origin : String?

        # If the origin of this data set is ENTITLED, includes the details for the product on AWS Marketplace.
        @[JSON::Field(key: "OriginDetails")]
        getter origin_details : Types::OriginDetails?

        # The data set ID of the owned data set corresponding to the entitled data set being viewed. This
        # parameter is returned when a data set owner is viewing the entitled copy of its owned data set.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        # The tags for the data set.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The date and time that the data set was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @asset_type : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @origin : String? = nil,
          @origin_details : Types::OriginDetails? = nil,
          @source_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct GetEventActionRequest
        include JSON::Serializable

        # The unique identifier for the event action.
        @[JSON::Field(key: "EventActionId")]
        getter event_action_id : String

        def initialize(
          @event_action_id : String
        )
        end
      end

      struct GetEventActionResponse
        include JSON::Serializable

        # What occurs after a certain event.
        @[JSON::Field(key: "Action")]
        getter action : Types::Action?

        # The ARN for the event action.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the event action was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # What occurs to start an action.
        @[JSON::Field(key: "Event")]
        getter event : Types::Event?

        # The unique identifier for the event action.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The tags for the event action.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The date and time that the event action was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @action : Types::Action? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @event : Types::Event? = nil,
          @id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct GetJobRequest
        include JSON::Serializable

        # The unique identifier for a job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct GetJobResponse
        include JSON::Serializable

        # The ARN for the job.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the job was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Details about the job.
        @[JSON::Field(key: "Details")]
        getter details : Types::ResponseDetails?

        # The errors associated with jobs.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::JobError)?

        # The unique identifier for the job.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The state of the job.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The job type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The date and time that the job was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @details : Types::ResponseDetails? = nil,
          @errors : Array(Types::JobError)? = nil,
          @id : String? = nil,
          @state : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct GetReceivedDataGrantRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the data grant.
        @[JSON::Field(key: "DataGrantArn")]
        getter data_grant_arn : String

        def initialize(
          @data_grant_arn : String
        )
        end
      end

      struct GetReceivedDataGrantResponse
        include JSON::Serializable

        # The acceptance state of the data grant.
        @[JSON::Field(key: "AcceptanceState")]
        getter acceptance_state : String

        # The Amazon Resource Name (ARN) of the data grant.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The timestamp of when the data grant was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The ID of the data set associated to the data grant.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The distribution scope for the data grant.
        @[JSON::Field(key: "GrantDistributionScope")]
        getter grant_distribution_scope : String

        # The ID of the data grant.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the data grant.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Web Services account ID of the data grant receiver.
        @[JSON::Field(key: "ReceiverPrincipal")]
        getter receiver_principal : String

        # The timestamp of when the data grant was last updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time

        # The timestamp of when the data grant was accepted.
        @[JSON::Field(key: "AcceptedAt")]
        getter accepted_at : Time?

        # The description of the data grant.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The timestamp of when access to the associated data set ends.
        @[JSON::Field(key: "EndsAt")]
        getter ends_at : Time?

        # The Amazon Web Services account ID of the data grant sender.
        @[JSON::Field(key: "SenderPrincipal")]
        getter sender_principal : String?

        def initialize(
          @acceptance_state : String,
          @arn : String,
          @created_at : Time,
          @data_set_id : String,
          @grant_distribution_scope : String,
          @id : String,
          @name : String,
          @receiver_principal : String,
          @updated_at : Time,
          @accepted_at : Time? = nil,
          @description : String? = nil,
          @ends_at : Time? = nil,
          @sender_principal : String? = nil
        )
        end
      end

      struct GetRevisionRequest
        include JSON::Serializable

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for a revision.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @data_set_id : String,
          @revision_id : String
        )
        end
      end

      struct GetRevisionResponse
        include JSON::Serializable

        # The ARN for the revision.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # An optional comment about the revision.
        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The date and time that the revision was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The unique identifier for the data set associated with the data set revision.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String?

        # To publish a revision to a data set in a product, the revision must first be finalized. Finalizing a
        # revision tells AWS Data Exchange that your changes to the assets in the revision are complete. After
        # it's in this read-only state, you can publish the revision to your products. Finalized revisions can
        # be published through the AWS Data Exchange console or the AWS Marketplace Catalog API, using the
        # StartChangeSet AWS Marketplace Catalog API action. When using the API, revisions are uniquely
        # identified by their ARN.
        @[JSON::Field(key: "Finalized")]
        getter finalized : Bool?

        # The unique identifier for the revision.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # A required comment to inform subscribers of the reason their access to the revision was revoked.
        @[JSON::Field(key: "RevocationComment")]
        getter revocation_comment : String?

        # A status indicating that subscribers' access to the revision was revoked.
        @[JSON::Field(key: "Revoked")]
        getter revoked : Bool?

        # The date and time that the revision was revoked, in ISO 8601 format.
        @[JSON::Field(key: "RevokedAt")]
        getter revoked_at : Time?

        # The revision ID of the owned revision corresponding to the entitled revision being viewed. This
        # parameter is returned when a revision owner is viewing the entitled copy of its owned revision.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        # The tags for the revision.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The date and time that the revision was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @comment : String? = nil,
          @created_at : Time? = nil,
          @data_set_id : String? = nil,
          @finalized : Bool? = nil,
          @id : String? = nil,
          @revocation_comment : String? = nil,
          @revoked : Bool? = nil,
          @revoked_at : Time? = nil,
          @source_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The request details.
      struct ImportAssetFromApiGatewayApiRequestDetails
        include JSON::Serializable

        # The API Gateway API ID.
        @[JSON::Field(key: "ApiId")]
        getter api_id : String

        # The API name.
        @[JSON::Field(key: "ApiName")]
        getter api_name : String

        # The Base64-encoded MD5 hash of the OpenAPI 3.0 JSON API specification file. It is used to ensure the
        # integrity of the file.
        @[JSON::Field(key: "ApiSpecificationMd5Hash")]
        getter api_specification_md5_hash : String

        # The data set ID.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The protocol type.
        @[JSON::Field(key: "ProtocolType")]
        getter protocol_type : String

        # The revision ID.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # The API stage.
        @[JSON::Field(key: "Stage")]
        getter stage : String

        # The API description. Markdown supported.
        @[JSON::Field(key: "ApiDescription")]
        getter api_description : String?

        # The API Gateway API key.
        @[JSON::Field(key: "ApiKey")]
        getter api_key : String?

        def initialize(
          @api_id : String,
          @api_name : String,
          @api_specification_md5_hash : String,
          @data_set_id : String,
          @protocol_type : String,
          @revision_id : String,
          @stage : String,
          @api_description : String? = nil,
          @api_key : String? = nil
        )
        end
      end

      # The response details.
      struct ImportAssetFromApiGatewayApiResponseDetails
        include JSON::Serializable

        # The API ID.
        @[JSON::Field(key: "ApiId")]
        getter api_id : String

        # The API name.
        @[JSON::Field(key: "ApiName")]
        getter api_name : String

        # The Base64-encoded Md5 hash for the API asset, used to ensure the integrity of the API at that
        # location.
        @[JSON::Field(key: "ApiSpecificationMd5Hash")]
        getter api_specification_md5_hash : String

        # The upload URL of the API specification.
        @[JSON::Field(key: "ApiSpecificationUploadUrl")]
        getter api_specification_upload_url : String

        # The date and time that the upload URL expires, in ISO 8601 format.
        @[JSON::Field(key: "ApiSpecificationUploadUrlExpiresAt")]
        getter api_specification_upload_url_expires_at : Time

        # The data set ID.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The protocol type.
        @[JSON::Field(key: "ProtocolType")]
        getter protocol_type : String

        # The revision ID.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # The API stage.
        @[JSON::Field(key: "Stage")]
        getter stage : String

        # The API description.
        @[JSON::Field(key: "ApiDescription")]
        getter api_description : String?

        # The API key.
        @[JSON::Field(key: "ApiKey")]
        getter api_key : String?

        def initialize(
          @api_id : String,
          @api_name : String,
          @api_specification_md5_hash : String,
          @api_specification_upload_url : String,
          @api_specification_upload_url_expires_at : Time,
          @data_set_id : String,
          @protocol_type : String,
          @revision_id : String,
          @stage : String,
          @api_description : String? = nil,
          @api_key : String? = nil
        )
        end
      end

      # Details about the job error.
      struct ImportAssetFromSignedUrlJobErrorDetails
        include JSON::Serializable

        # Details about the job error.
        @[JSON::Field(key: "AssetName")]
        getter asset_name : String

        def initialize(
          @asset_name : String
        )
        end
      end

      # Details of the operation to be performed by the job.
      struct ImportAssetFromSignedUrlRequestDetails
        include JSON::Serializable

        # The name of the asset. When importing from Amazon S3, the Amazon S3 object key is used as the asset
        # name.
        @[JSON::Field(key: "AssetName")]
        getter asset_name : String

        # The unique identifier for the data set associated with this import job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The Base64-encoded Md5 hash for the asset, used to ensure the integrity of the file at that
        # location.
        @[JSON::Field(key: "Md5Hash")]
        getter md5_hash : String

        # The unique identifier for the revision associated with this import request.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @asset_name : String,
          @data_set_id : String,
          @md5_hash : String,
          @revision_id : String
        )
        end
      end

      # The details in the response for an import request, including the signed URL and other information.
      struct ImportAssetFromSignedUrlResponseDetails
        include JSON::Serializable

        # The name for the asset associated with this import job.
        @[JSON::Field(key: "AssetName")]
        getter asset_name : String

        # The unique identifier for the data set associated with this import job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision associated with this import response.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # The Base64-encoded Md5 hash for the asset, used to ensure the integrity of the file at that
        # location.
        @[JSON::Field(key: "Md5Hash")]
        getter md5_hash : String?

        # The signed URL.
        @[JSON::Field(key: "SignedUrl")]
        getter signed_url : String?

        # The time and date at which the signed URL expires, in ISO 8601 format.
        @[JSON::Field(key: "SignedUrlExpiresAt")]
        getter signed_url_expires_at : Time?

        def initialize(
          @asset_name : String,
          @data_set_id : String,
          @revision_id : String,
          @md5_hash : String? = nil,
          @signed_url : String? = nil,
          @signed_url_expires_at : Time? = nil
        )
        end
      end

      # Details about the assets imported from an AWS Lake Formation tag policy request.
      struct ImportAssetsFromLakeFormationTagPolicyRequestDetails
        include JSON::Serializable

        # The identifier for the AWS Glue Data Catalog.
        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String

        # The unique identifier for the data set associated with this import job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision associated with this import job.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # The IAM role's ARN that allows AWS Data Exchange to assume the role and grant and revoke permissions
        # of subscribers to AWS Lake Formation data permissions.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # A structure for the database object.
        @[JSON::Field(key: "Database")]
        getter database : Types::DatabaseLFTagPolicyAndPermissions?

        # A structure for the table object.
        @[JSON::Field(key: "Table")]
        getter table : Types::TableLFTagPolicyAndPermissions?

        def initialize(
          @catalog_id : String,
          @data_set_id : String,
          @revision_id : String,
          @role_arn : String,
          @database : Types::DatabaseLFTagPolicyAndPermissions? = nil,
          @table : Types::TableLFTagPolicyAndPermissions? = nil
        )
        end
      end

      # Details from an import AWS Lake Formation tag policy job response.
      struct ImportAssetsFromLakeFormationTagPolicyResponseDetails
        include JSON::Serializable

        # The identifier for the AWS Glue Data Catalog.
        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String

        # The unique identifier for the data set associated with this import job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision associated with this import job.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # The IAM role's ARN that allows AWS Data Exchange to assume the role and grant and revoke permissions
        # to AWS Lake Formation data permissions.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # A structure for the database object.
        @[JSON::Field(key: "Database")]
        getter database : Types::DatabaseLFTagPolicyAndPermissions?

        # A structure for the table object.
        @[JSON::Field(key: "Table")]
        getter table : Types::TableLFTagPolicyAndPermissions?

        def initialize(
          @catalog_id : String,
          @data_set_id : String,
          @revision_id : String,
          @role_arn : String,
          @database : Types::DatabaseLFTagPolicyAndPermissions? = nil,
          @table : Types::TableLFTagPolicyAndPermissions? = nil
        )
        end
      end

      # Details from an import from Amazon Redshift datashare request.
      struct ImportAssetsFromRedshiftDataSharesRequestDetails
        include JSON::Serializable

        # A list of Amazon Redshift datashare assets.
        @[JSON::Field(key: "AssetSources")]
        getter asset_sources : Array(Types::RedshiftDataShareAssetSourceEntry)

        # The unique identifier for the data set associated with this import job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision associated with this import job.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @asset_sources : Array(Types::RedshiftDataShareAssetSourceEntry),
          @data_set_id : String,
          @revision_id : String
        )
        end
      end

      # Details from an import from Amazon Redshift datashare response.
      struct ImportAssetsFromRedshiftDataSharesResponseDetails
        include JSON::Serializable

        # A list of Amazon Redshift datashare asset sources.
        @[JSON::Field(key: "AssetSources")]
        getter asset_sources : Array(Types::RedshiftDataShareAssetSourceEntry)

        # The unique identifier for the data set associated with this import job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision associated with this import job.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @asset_sources : Array(Types::RedshiftDataShareAssetSourceEntry),
          @data_set_id : String,
          @revision_id : String
        )
        end
      end

      # Details of the operation to be performed by the job.
      struct ImportAssetsFromS3RequestDetails
        include JSON::Serializable

        # Is a list of Amazon S3 bucket and object key pairs.
        @[JSON::Field(key: "AssetSources")]
        getter asset_sources : Array(Types::AssetSourceEntry)

        # The unique identifier for the data set associated with this import job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision associated with this import request.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @asset_sources : Array(Types::AssetSourceEntry),
          @data_set_id : String,
          @revision_id : String
        )
        end
      end

      # Details from an import from Amazon S3 response.
      struct ImportAssetsFromS3ResponseDetails
        include JSON::Serializable

        # Is a list of Amazon S3 bucket and object key pairs.
        @[JSON::Field(key: "AssetSources")]
        getter asset_sources : Array(Types::AssetSourceEntry)

        # The unique identifier for the data set associated with this import job.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision associated with this import response.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @asset_sources : Array(Types::AssetSourceEntry),
          @data_set_id : String,
          @revision_id : String
        )
        end
      end

      # An exception occurred with the service.
      struct InternalServerException
        include JSON::Serializable

        # The message identifying the service exception that occurred.
        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # AWS Data Exchange Jobs are asynchronous import or export operations used to create or copy assets. A
      # data set owner can both import and export as they see fit. Someone with an entitlement to a data set
      # can only export. Jobs are deleted 90 days after they are created.
      struct JobEntry
        include JSON::Serializable

        # The ARN for the job.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date and time that the job was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # Details of the operation to be performed by the job, such as export destination details or import
        # source details.
        @[JSON::Field(key: "Details")]
        getter details : Types::ResponseDetails

        # The unique identifier for the job.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The state of the job.
        @[JSON::Field(key: "State")]
        getter state : String

        # The job type.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The date and time that the job was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time

        # Errors for jobs.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::JobError)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @details : Types::ResponseDetails,
          @id : String,
          @state : String,
          @type : String,
          @updated_at : Time,
          @errors : Array(Types::JobError)? = nil
        )
        end
      end

      # An error that occurred with the job request.
      struct JobError
        include JSON::Serializable

        # The code for the job error.
        @[JSON::Field(key: "Code")]
        getter code : String

        # The message related to the job error.
        @[JSON::Field(key: "Message")]
        getter message : String

        # The details about the job error.
        @[JSON::Field(key: "Details")]
        getter details : Types::Details?

        # The name of the limit that was reached.
        @[JSON::Field(key: "LimitName")]
        getter limit_name : String?

        # The value of the exceeded limit.
        @[JSON::Field(key: "LimitValue")]
        getter limit_value : Float64?

        # The unique identifier for the resource related to the error.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of resource related to the error.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @code : String,
          @message : String,
          @details : Types::Details? = nil,
          @limit_name : String? = nil,
          @limit_value : Float64? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The Amazon Resource Name (ARN) of the AWS KMS key used to encrypt the shared S3 objects.
      struct KmsKeyToGrant
        include JSON::Serializable

        # The AWS KMS CMK (Key Management System Customer Managed Key) used to encrypt S3 objects in the
        # shared S3 Bucket. AWS Data exchange will create a KMS grant for each subscriber to allow them to
        # access and decrypt their entitled data that is encrypted using this KMS key specified.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String

        def initialize(
          @kms_key_arn : String
        )
        end
      end

      # Details about the AWS Lake Formation resource (Table or Database) included in the AWS Lake Formation
      # data permission.
      struct LFResourceDetails
        include JSON::Serializable

        # Details about the database resource included in the AWS Lake Formation data permission.
        @[JSON::Field(key: "Database")]
        getter database : Types::DatabaseLFTagPolicy?

        # Details about the table resource included in the AWS Lake Formation data permission.
        @[JSON::Field(key: "Table")]
        getter table : Types::TableLFTagPolicy?

        def initialize(
          @database : Types::DatabaseLFTagPolicy? = nil,
          @table : Types::TableLFTagPolicy? = nil
        )
        end
      end

      # A structure that allows an LF-admin to grant permissions on certain conditions.
      struct LFTag
        include JSON::Serializable

        # The key name for the LF-tag.
        @[JSON::Field(key: "TagKey")]
        getter tag_key : String

        # A list of LF-tag values.
        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)

        def initialize(
          @tag_key : String,
          @tag_values : Array(String)
        )
        end
      end

      # Details about the LF-tag policy.
      struct LFTagPolicyDetails
        include JSON::Serializable

        # The identifier for the AWS Glue Data Catalog.
        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String

        # Details for the Lake Formation Resources included in the LF-tag policy.
        @[JSON::Field(key: "ResourceDetails")]
        getter resource_details : Types::LFResourceDetails

        # The resource type for which the LF-tag policy applies.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @catalog_id : String,
          @resource_details : Types::LFResourceDetails,
          @resource_type : String
        )
        end
      end

      # The AWS Lake Formation data permission asset.
      struct LakeFormationDataPermissionAsset
        include JSON::Serializable

        # Details about the AWS Lake Formation data permission.
        @[JSON::Field(key: "LakeFormationDataPermissionDetails")]
        getter lake_formation_data_permission_details : Types::LakeFormationDataPermissionDetails

        # The data permission type.
        @[JSON::Field(key: "LakeFormationDataPermissionType")]
        getter lake_formation_data_permission_type : String

        # The permissions granted to the subscribers on the resource.
        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)

        # The IAM role's ARN that allows AWS Data Exchange to assume the role and grant and revoke permissions
        # to AWS Lake Formation data permissions.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @lake_formation_data_permission_details : Types::LakeFormationDataPermissionDetails,
          @lake_formation_data_permission_type : String,
          @permissions : Array(String),
          @role_arn : String? = nil
        )
        end
      end

      # Details about the AWS Lake Formation data permission.
      struct LakeFormationDataPermissionDetails
        include JSON::Serializable

        # Details about the LF-tag policy.
        @[JSON::Field(key: "LFTagPolicy")]
        getter lf_tag_policy : Types::LFTagPolicyDetails?

        def initialize(
          @lf_tag_policy : Types::LFTagPolicyDetails? = nil
        )
        end
      end

      # Extra details specific to the affected scope in this LF data set.
      struct LakeFormationTagPolicyDetails
        include JSON::Serializable

        # The underlying Glue database that the notification is referring to.
        @[JSON::Field(key: "Database")]
        getter database : String?

        # The underlying Glue table that the notification is referring to.
        @[JSON::Field(key: "Table")]
        getter table : String?

        def initialize(
          @database : String? = nil,
          @table : String? = nil
        )
        end
      end

      struct ListDataGrantsRequest
        include JSON::Serializable

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDataGrantsResponse
        include JSON::Serializable

        # An object that contains a list of data grant information.
        @[JSON::Field(key: "DataGrantSummaries")]
        getter data_grant_summaries : Array(Types::DataGrantSummaryEntry)?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @data_grant_summaries : Array(Types::DataGrantSummaryEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDataSetRevisionsRequest
        include JSON::Serializable

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The maximum number of results returned by a single call.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_set_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDataSetRevisionsResponse
        include JSON::Serializable

        # The token value retrieved from a previous call to access the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The asset objects listed by the request.
        @[JSON::Field(key: "Revisions")]
        getter revisions : Array(Types::RevisionEntry)?

        def initialize(
          @next_token : String? = nil,
          @revisions : Array(Types::RevisionEntry)? = nil
        )
        end
      end

      struct ListDataSetsRequest
        include JSON::Serializable

        # The maximum number of results returned by a single call.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A property that defines the data set as OWNED by the account (for providers) or ENTITLED to the
        # account (for subscribers).
        @[JSON::Field(key: "origin")]
        getter origin : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @origin : String? = nil
        )
        end
      end

      struct ListDataSetsResponse
        include JSON::Serializable

        # The data set objects listed by the request.
        @[JSON::Field(key: "DataSets")]
        getter data_sets : Array(Types::DataSetEntry)?

        # The token value retrieved from a previous call to access the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @data_sets : Array(Types::DataSetEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEventActionsRequest
        include JSON::Serializable

        # The unique identifier for the event source.
        @[JSON::Field(key: "eventSourceId")]
        getter event_source_id : String?

        # The maximum number of results returned by a single call.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_source_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEventActionsResponse
        include JSON::Serializable

        # The event action objects listed by the request.
        @[JSON::Field(key: "EventActions")]
        getter event_actions : Array(Types::EventActionEntry)?

        # The token value retrieved from a previous call to access the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @event_actions : Array(Types::EventActionEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListJobsRequest
        include JSON::Serializable

        # The unique identifier for a data set.
        @[JSON::Field(key: "dataSetId")]
        getter data_set_id : String?

        # The maximum number of results returned by a single call.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The unique identifier for a revision.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @data_set_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @revision_id : String? = nil
        )
        end
      end

      struct ListJobsResponse
        include JSON::Serializable

        # The jobs listed by the request.
        @[JSON::Field(key: "Jobs")]
        getter jobs : Array(Types::JobEntry)?

        # The token value retrieved from a previous call to access the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::JobEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReceivedDataGrantsRequest
        include JSON::Serializable

        # The acceptance state of the data grants to list.
        @[JSON::Field(key: "acceptanceState")]
        getter acceptance_state : Array(String)?

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @acceptance_state : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReceivedDataGrantsResponse
        include JSON::Serializable

        # An object that contains a list of received data grant information.
        @[JSON::Field(key: "DataGrantSummaries")]
        getter data_grant_summaries : Array(Types::ReceivedDataGrantSummariesEntry)?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @data_grant_summaries : Array(Types::ReceivedDataGrantSummariesEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRevisionAssetsRequest
        include JSON::Serializable

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for a revision.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # The maximum number of results returned by a single call.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_set_id : String,
          @revision_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRevisionAssetsResponse
        include JSON::Serializable

        # The asset objects listed by the request.
        @[JSON::Field(key: "Assets")]
        getter assets : Array(Types::AssetEntry)?

        # The token value retrieved from a previous call to access the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @assets : Array(Types::AssetEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A label that consists of a customer-defined key and an optional value.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Extra details specific to this notification.
      struct NotificationDetails
        include JSON::Serializable

        # Extra details specific to a data update type notification.
        @[JSON::Field(key: "DataUpdate")]
        getter data_update : Types::DataUpdateRequestDetails?

        # Extra details specific to a deprecation type notification.
        @[JSON::Field(key: "Deprecation")]
        getter deprecation : Types::DeprecationRequestDetails?

        # Extra details specific to a schema change type notification.
        @[JSON::Field(key: "SchemaChange")]
        getter schema_change : Types::SchemaChangeRequestDetails?

        def initialize(
          @data_update : Types::DataUpdateRequestDetails? = nil,
          @deprecation : Types::DeprecationRequestDetails? = nil,
          @schema_change : Types::SchemaChangeRequestDetails? = nil
        )
        end
      end

      # Details about the origin of the data set.
      struct OriginDetails
        include JSON::Serializable

        # The ID of the data grant.
        @[JSON::Field(key: "DataGrantId")]
        getter data_grant_id : String?

        # The product ID of the origin of the data set.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        def initialize(
          @data_grant_id : String? = nil,
          @product_id : String? = nil
        )
        end
      end

      # Information about a received data grant.
      struct ReceivedDataGrantSummariesEntry
        include JSON::Serializable

        # The acceptance state of the data grant.
        @[JSON::Field(key: "AcceptanceState")]
        getter acceptance_state : String

        # The Amazon Resource Name (ARN) of the data grant.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The timestamp of when the data grant was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The ID of the data set associated to the data grant.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The ID of the data grant.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the data grant.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Web Services account ID of the data grant receiver.
        @[JSON::Field(key: "ReceiverPrincipal")]
        getter receiver_principal : String

        # The Amazon Web Services account ID of the data grant sender.
        @[JSON::Field(key: "SenderPrincipal")]
        getter sender_principal : String

        # The timestamp of when the data grant was last updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time

        # The timestamp of when the data grant was accepted.
        @[JSON::Field(key: "AcceptedAt")]
        getter accepted_at : Time?

        # The timestamp of when access to the associated data set ends.
        @[JSON::Field(key: "EndsAt")]
        getter ends_at : Time?

        def initialize(
          @acceptance_state : String,
          @arn : String,
          @created_at : Time,
          @data_set_id : String,
          @id : String,
          @name : String,
          @receiver_principal : String,
          @sender_principal : String,
          @updated_at : Time,
          @accepted_at : Time? = nil,
          @ends_at : Time? = nil
        )
        end
      end

      # The Amazon Redshift datashare asset.
      struct RedshiftDataShareAsset
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the datashare asset.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # The source of the Amazon Redshift datashare asset.
      struct RedshiftDataShareAssetSourceEntry
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the datashare asset.
        @[JSON::Field(key: "DataShareArn")]
        getter data_share_arn : String

        def initialize(
          @data_share_arn : String
        )
        end
      end

      # Extra details specific to the affected scope in this Redshift data set.
      struct RedshiftDataShareDetails
        include JSON::Serializable

        # The ARN of the underlying Redshift data share that is being affected by this notification.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The database name in the Redshift data share that is being affected by this notification.
        @[JSON::Field(key: "Database")]
        getter database : String

        # A function name in the Redshift database that is being affected by this notification.
        @[JSON::Field(key: "Function")]
        getter function : String?

        # A schema name in the Redshift database that is being affected by this notification.
        @[JSON::Field(key: "Schema")]
        getter schema : String?

        # A table name in the Redshift database that is being affected by this notification.
        @[JSON::Field(key: "Table")]
        getter table : String?

        # A view name in the Redshift database that is being affected by this notification.
        @[JSON::Field(key: "View")]
        getter view : String?

        def initialize(
          @arn : String,
          @database : String,
          @function : String? = nil,
          @schema : String? = nil,
          @table : String? = nil,
          @view : String? = nil
        )
        end
      end

      # The details for the request.
      struct RequestDetails
        include JSON::Serializable

        # Details of the request to create S3 data access from the Amazon S3 bucket.
        @[JSON::Field(key: "CreateS3DataAccessFromS3Bucket")]
        getter create_s3_data_access_from_s3_bucket : Types::CreateS3DataAccessFromS3BucketRequestDetails?

        # Details about the export to signed URL request.
        @[JSON::Field(key: "ExportAssetToSignedUrl")]
        getter export_asset_to_signed_url : Types::ExportAssetToSignedUrlRequestDetails?

        # Details about the export to Amazon S3 request.
        @[JSON::Field(key: "ExportAssetsToS3")]
        getter export_assets_to_s3 : Types::ExportAssetsToS3RequestDetails?

        # Details about the export to Amazon S3 request.
        @[JSON::Field(key: "ExportRevisionsToS3")]
        getter export_revisions_to_s3 : Types::ExportRevisionsToS3RequestDetails?

        # Details about the import from signed URL request.
        @[JSON::Field(key: "ImportAssetFromApiGatewayApi")]
        getter import_asset_from_api_gateway_api : Types::ImportAssetFromApiGatewayApiRequestDetails?

        # Details about the import from Amazon S3 request.
        @[JSON::Field(key: "ImportAssetFromSignedUrl")]
        getter import_asset_from_signed_url : Types::ImportAssetFromSignedUrlRequestDetails?

        # Request details for the ImportAssetsFromLakeFormationTagPolicy job.
        @[JSON::Field(key: "ImportAssetsFromLakeFormationTagPolicy")]
        getter import_assets_from_lake_formation_tag_policy : Types::ImportAssetsFromLakeFormationTagPolicyRequestDetails?

        # Details from an import from Amazon Redshift datashare request.
        @[JSON::Field(key: "ImportAssetsFromRedshiftDataShares")]
        getter import_assets_from_redshift_data_shares : Types::ImportAssetsFromRedshiftDataSharesRequestDetails?

        # Details about the import asset from API Gateway API request.
        @[JSON::Field(key: "ImportAssetsFromS3")]
        getter import_assets_from_s3 : Types::ImportAssetsFromS3RequestDetails?

        def initialize(
          @create_s3_data_access_from_s3_bucket : Types::CreateS3DataAccessFromS3BucketRequestDetails? = nil,
          @export_asset_to_signed_url : Types::ExportAssetToSignedUrlRequestDetails? = nil,
          @export_assets_to_s3 : Types::ExportAssetsToS3RequestDetails? = nil,
          @export_revisions_to_s3 : Types::ExportRevisionsToS3RequestDetails? = nil,
          @import_asset_from_api_gateway_api : Types::ImportAssetFromApiGatewayApiRequestDetails? = nil,
          @import_asset_from_signed_url : Types::ImportAssetFromSignedUrlRequestDetails? = nil,
          @import_assets_from_lake_formation_tag_policy : Types::ImportAssetsFromLakeFormationTagPolicyRequestDetails? = nil,
          @import_assets_from_redshift_data_shares : Types::ImportAssetsFromRedshiftDataSharesRequestDetails? = nil,
          @import_assets_from_s3 : Types::ImportAssetsFromS3RequestDetails? = nil
        )
        end
      end

      # The resource couldn't be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        # The resource couldn't be found.
        @[JSON::Field(key: "Message")]
        getter message : String

        # The unique identifier for the resource that couldn't be found.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of resource that couldn't be found.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Details for the response.
      struct ResponseDetails
        include JSON::Serializable

        # Response details from the CreateS3DataAccessFromS3Bucket job.
        @[JSON::Field(key: "CreateS3DataAccessFromS3Bucket")]
        getter create_s3_data_access_from_s3_bucket : Types::CreateS3DataAccessFromS3BucketResponseDetails?

        # Details for the export to signed URL response.
        @[JSON::Field(key: "ExportAssetToSignedUrl")]
        getter export_asset_to_signed_url : Types::ExportAssetToSignedUrlResponseDetails?

        # Details for the export to Amazon S3 response.
        @[JSON::Field(key: "ExportAssetsToS3")]
        getter export_assets_to_s3 : Types::ExportAssetsToS3ResponseDetails?

        # Details for the export revisions to Amazon S3 response.
        @[JSON::Field(key: "ExportRevisionsToS3")]
        getter export_revisions_to_s3 : Types::ExportRevisionsToS3ResponseDetails?

        # The response details.
        @[JSON::Field(key: "ImportAssetFromApiGatewayApi")]
        getter import_asset_from_api_gateway_api : Types::ImportAssetFromApiGatewayApiResponseDetails?

        # Details for the import from signed URL response.
        @[JSON::Field(key: "ImportAssetFromSignedUrl")]
        getter import_asset_from_signed_url : Types::ImportAssetFromSignedUrlResponseDetails?

        # Response details from the ImportAssetsFromLakeFormationTagPolicy job.
        @[JSON::Field(key: "ImportAssetsFromLakeFormationTagPolicy")]
        getter import_assets_from_lake_formation_tag_policy : Types::ImportAssetsFromLakeFormationTagPolicyResponseDetails?

        # Details from an import from Amazon Redshift datashare response.
        @[JSON::Field(key: "ImportAssetsFromRedshiftDataShares")]
        getter import_assets_from_redshift_data_shares : Types::ImportAssetsFromRedshiftDataSharesResponseDetails?

        # Details for the import from Amazon S3 response.
        @[JSON::Field(key: "ImportAssetsFromS3")]
        getter import_assets_from_s3 : Types::ImportAssetsFromS3ResponseDetails?

        def initialize(
          @create_s3_data_access_from_s3_bucket : Types::CreateS3DataAccessFromS3BucketResponseDetails? = nil,
          @export_asset_to_signed_url : Types::ExportAssetToSignedUrlResponseDetails? = nil,
          @export_assets_to_s3 : Types::ExportAssetsToS3ResponseDetails? = nil,
          @export_revisions_to_s3 : Types::ExportRevisionsToS3ResponseDetails? = nil,
          @import_asset_from_api_gateway_api : Types::ImportAssetFromApiGatewayApiResponseDetails? = nil,
          @import_asset_from_signed_url : Types::ImportAssetFromSignedUrlResponseDetails? = nil,
          @import_assets_from_lake_formation_tag_policy : Types::ImportAssetsFromLakeFormationTagPolicyResponseDetails? = nil,
          @import_assets_from_redshift_data_shares : Types::ImportAssetsFromRedshiftDataSharesResponseDetails? = nil,
          @import_assets_from_s3 : Types::ImportAssetsFromS3ResponseDetails? = nil
        )
        end
      end

      # The destination where the assets in the revision will be exported.
      struct RevisionDestinationEntry
        include JSON::Serializable

        # The Amazon S3 bucket that is the destination for the assets in the revision.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The unique identifier for the revision.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # A string representing the pattern for generated names of the individual assets in the revision. For
        # more information about key patterns, see Key patterns when exporting revisions .
        @[JSON::Field(key: "KeyPattern")]
        getter key_pattern : String?

        def initialize(
          @bucket : String,
          @revision_id : String,
          @key_pattern : String? = nil
        )
        end
      end

      # A revision is a container for one or more assets.
      struct RevisionEntry
        include JSON::Serializable

        # The ARN for the revision.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date and time that the revision was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The unique identifier for the data set associated with the data set revision.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for the revision.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time that the revision was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time

        # An optional comment about the revision.
        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # To publish a revision to a data set in a product, the revision must first be finalized. Finalizing a
        # revision tells AWS Data Exchange that your changes to the assets in the revision are complete. After
        # it's in this read-only state, you can publish the revision to your products. Finalized revisions can
        # be published through the AWS Data Exchange console or the AWS Marketplace Catalog API, using the
        # StartChangeSet AWS Marketplace Catalog API action. When using the API, revisions are uniquely
        # identified by their ARN.
        @[JSON::Field(key: "Finalized")]
        getter finalized : Bool?

        # A required comment to inform subscribers of the reason their access to the revision was revoked.
        @[JSON::Field(key: "RevocationComment")]
        getter revocation_comment : String?

        # A status indicating that subscribers' access to the revision was revoked.
        @[JSON::Field(key: "Revoked")]
        getter revoked : Bool?

        # The date and time that the revision was revoked, in ISO 8601 format.
        @[JSON::Field(key: "RevokedAt")]
        getter revoked_at : Time?

        # The revision ID of the owned revision corresponding to the entitled revision being viewed. This
        # parameter is returned when a revision owner is viewing the entitled copy of its owned revision.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @data_set_id : String,
          @id : String,
          @updated_at : Time,
          @comment : String? = nil,
          @finalized : Bool? = nil,
          @revocation_comment : String? = nil,
          @revoked : Bool? = nil,
          @revoked_at : Time? = nil,
          @source_id : String? = nil
        )
        end
      end

      # Information about the published revision.
      struct RevisionPublished
        include JSON::Serializable

        # The data set ID of the published revision.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        def initialize(
          @data_set_id : String
        )
        end
      end

      struct RevokeRevisionRequest
        include JSON::Serializable

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for a revision.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # A required comment to inform subscribers of the reason their access to the revision was revoked.
        @[JSON::Field(key: "RevocationComment")]
        getter revocation_comment : String

        def initialize(
          @data_set_id : String,
          @revision_id : String,
          @revocation_comment : String
        )
        end
      end

      struct RevokeRevisionResponse
        include JSON::Serializable

        # The ARN for the revision.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # An optional comment about the revision.
        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The date and time that the revision was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The unique identifier for the data set associated with the data set revision.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String?

        # To publish a revision to a data set in a product, the revision must first be finalized. Finalizing a
        # revision tells AWS Data Exchange that changes to the assets in the revision are complete. After it's
        # in this read-only state, you can publish the revision to your products. Finalized revisions can be
        # published through the AWS Data Exchange console or the AWS Marketplace Catalog API, using the
        # StartChangeSet AWS Marketplace Catalog API action. When using the API, revisions are uniquely
        # identified by their ARN.
        @[JSON::Field(key: "Finalized")]
        getter finalized : Bool?

        # The unique identifier for the revision.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # A required comment to inform subscribers of the reason their access to the revision was revoked.
        @[JSON::Field(key: "RevocationComment")]
        getter revocation_comment : String?

        # A status indicating that subscribers' access to the revision was revoked.
        @[JSON::Field(key: "Revoked")]
        getter revoked : Bool?

        # The date and time that the revision was revoked, in ISO 8601 format.
        @[JSON::Field(key: "RevokedAt")]
        getter revoked_at : Time?

        # The revision ID of the owned revision corresponding to the entitled revision being viewed. This
        # parameter is returned when a revision owner is viewing the entitled copy of its owned revision.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        # The date and time that the revision was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @comment : String? = nil,
          @created_at : Time? = nil,
          @data_set_id : String? = nil,
          @finalized : Bool? = nil,
          @id : String? = nil,
          @revocation_comment : String? = nil,
          @revoked : Bool? = nil,
          @revoked_at : Time? = nil,
          @source_id : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The Amazon S3 data access that is the asset.
      struct S3DataAccessAsset
        include JSON::Serializable

        # The Amazon S3 bucket hosting data to be shared in the S3 data access.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The Amazon S3 bucket used for hosting shared data in the Amazon S3 data access.
        @[JSON::Field(key: "KeyPrefixes")]
        getter key_prefixes : Array(String)?

        # S3 keys made available using this asset.
        @[JSON::Field(key: "Keys")]
        getter keys : Array(String)?

        # List of AWS KMS CMKs (Key Management System Customer Managed Keys) and ARNs used to encrypt S3
        # objects being shared in this S3 Data Access asset. Providers must include all AWS KMS keys used to
        # encrypt these shared S3 objects.
        @[JSON::Field(key: "KmsKeysToGrant")]
        getter kms_keys_to_grant : Array(Types::KmsKeyToGrant)?

        # The automatically-generated bucket-style alias for your Amazon S3 Access Point. Customers can access
        # their entitled data using the S3 Access Point alias.
        @[JSON::Field(key: "S3AccessPointAlias")]
        getter s3_access_point_alias : String?

        # The ARN for your Amazon S3 Access Point. Customers can also access their entitled data using the S3
        # Access Point ARN.
        @[JSON::Field(key: "S3AccessPointArn")]
        getter s3_access_point_arn : String?

        def initialize(
          @bucket : String,
          @key_prefixes : Array(String)? = nil,
          @keys : Array(String)? = nil,
          @kms_keys_to_grant : Array(Types::KmsKeyToGrant)? = nil,
          @s3_access_point_alias : String? = nil,
          @s3_access_point_arn : String? = nil
        )
        end
      end

      # Source details for an Amazon S3 data access asset.
      struct S3DataAccessAssetSourceEntry
        include JSON::Serializable

        # The Amazon S3 bucket used for hosting shared data in the Amazon S3 data access.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Organizes Amazon S3 asset key prefixes stored in an Amazon S3 bucket.
        @[JSON::Field(key: "KeyPrefixes")]
        getter key_prefixes : Array(String)?

        # The keys used to create the Amazon S3 data access.
        @[JSON::Field(key: "Keys")]
        getter keys : Array(String)?

        # List of AWS KMS CMKs (Key Management System Customer Managed Keys) and ARNs used to encrypt S3
        # objects being shared in this S3 Data Access asset.
        @[JSON::Field(key: "KmsKeysToGrant")]
        getter kms_keys_to_grant : Array(Types::KmsKeyToGrant)?

        def initialize(
          @bucket : String,
          @key_prefixes : Array(String)? = nil,
          @keys : Array(String)? = nil,
          @kms_keys_to_grant : Array(Types::KmsKeyToGrant)? = nil
        )
        end
      end

      # Extra details specific to the affected scope in this S3 Data Access data set.
      struct S3DataAccessDetails
        include JSON::Serializable

        # A list of the key prefixes affected by this notification. This can have up to 50 entries.
        @[JSON::Field(key: "KeyPrefixes")]
        getter key_prefixes : Array(String)?

        # A list of the keys affected by this notification. This can have up to 50 entries.
        @[JSON::Field(key: "Keys")]
        getter keys : Array(String)?

        def initialize(
          @key_prefixes : Array(String)? = nil,
          @keys : Array(String)? = nil
        )
        end
      end

      # The Amazon S3 object that is the asset.
      struct S3SnapshotAsset
        include JSON::Serializable

        # The size of the Amazon S3 object that is the object.
        @[JSON::Field(key: "Size")]
        getter size : Float64

        def initialize(
          @size : Float64
        )
        end
      end

      # Object encompassing information about a schema change to a single, particular field, a notification
      # can have up to 100 of these.
      struct SchemaChangeDetails
        include JSON::Serializable

        # Name of the changing field. This value can be up to 255 characters long.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Is the field being added, removed, or modified?
        @[JSON::Field(key: "Type")]
        getter type : String

        # Description of what's changing about this field. This value can be up to 512 characters long.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @name : String,
          @type : String,
          @description : String? = nil
        )
        end
      end

      # Extra details specific to this schema change type notification.
      struct SchemaChangeRequestDetails
        include JSON::Serializable

        # A date in the future when the schema change is taking effect.
        @[JSON::Field(key: "SchemaChangeAt")]
        getter schema_change_at : Time

        # List of schema changes happening in the scope of this notification. This can have up to 100 entries.
        @[JSON::Field(key: "Changes")]
        getter changes : Array(Types::SchemaChangeDetails)?

        def initialize(
          @schema_change_at : Time,
          @changes : Array(Types::SchemaChangeDetails)? = nil
        )
        end
      end

      # Details about the scope of the notifications such as the affected resources.
      struct ScopeDetails
        include JSON::Serializable

        # Underlying LF resources that will be affected by this notification.
        @[JSON::Field(key: "LakeFormationTagPolicies")]
        getter lake_formation_tag_policies : Array(Types::LakeFormationTagPolicyDetails)?

        # Underlying Redshift resources that will be affected by this notification.
        @[JSON::Field(key: "RedshiftDataShares")]
        getter redshift_data_shares : Array(Types::RedshiftDataShareDetails)?

        # Underlying S3 resources that will be affected by this notification.
        @[JSON::Field(key: "S3DataAccesses")]
        getter s3_data_accesses : Array(Types::S3DataAccessDetails)?

        def initialize(
          @lake_formation_tag_policies : Array(Types::LakeFormationTagPolicyDetails)? = nil,
          @redshift_data_shares : Array(Types::RedshiftDataShareDetails)? = nil,
          @s3_data_accesses : Array(Types::S3DataAccessDetails)? = nil
        )
        end
      end

      struct SendApiAssetRequest
        include JSON::Serializable

        # Asset ID value for the API request.
        @[JSON::Field(key: "x-amzn-dataexchange-asset-id")]
        getter asset_id : String

        # Data set ID value for the API request.
        @[JSON::Field(key: "x-amzn-dataexchange-data-set-id")]
        getter data_set_id : String

        # Revision ID value for the API request.
        @[JSON::Field(key: "x-amzn-dataexchange-revision-id")]
        getter revision_id : String

        # The request body.
        @[JSON::Field(key: "Body")]
        getter body : String?

        # HTTP method value for the API request. Alternatively, you can use the appropriate verb in your
        # request.
        @[JSON::Field(key: "x-amzn-dataexchange-http-method")]
        getter method : String?

        # URI path value for the API request. Alternatively, you can set the URI path directly by invoking
        # /v1/{pathValue}.
        @[JSON::Field(key: "x-amzn-dataexchange-path")]
        getter path : String?

        # Attach query string parameters to the end of the URI (for example,
        # /v1/examplePath?exampleParam=exampleValue).
        @[JSON::Field(key: "QueryStringParameters")]
        getter query_string_parameters : Hash(String, String)?

        # Any header value prefixed with x-amzn-dataexchange-header- will have that stripped before sending
        # the Asset API request. Use this when you want to override a header that AWS Data Exchange uses.
        # Alternatively, you can use the header without a prefix to the HTTP request.
        @[JSON::Field(key: "x-amzn-dataexchange-header-")]
        getter request_headers : Hash(String, String)?

        def initialize(
          @asset_id : String,
          @data_set_id : String,
          @revision_id : String,
          @body : String? = nil,
          @method : String? = nil,
          @path : String? = nil,
          @query_string_parameters : Hash(String, String)? = nil,
          @request_headers : Hash(String, String)? = nil
        )
        end
      end

      struct SendApiAssetResponse
        include JSON::Serializable

        # The response body from the underlying API tracked by the API asset.
        @[JSON::Field(key: "Body")]
        getter body : String?

        # The response headers from the underlying API tracked by the API asset.
        @[JSON::Field(key: "")]
        getter response_headers : Hash(String, String)?

        def initialize(
          @body : String? = nil,
          @response_headers : Hash(String, String)? = nil
        )
        end
      end

      struct SendDataSetNotificationRequest
        include JSON::Serializable

        # Affected data set of the notification.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The type of the notification. Describing the kind of event the notification is alerting you to.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Idempotency key for the notification, this key allows us to deduplicate notifications that are sent
        # in quick succession erroneously.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Free-form text field for providers to add information about their notifications.
        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # Extra details specific to this notification type.
        @[JSON::Field(key: "Details")]
        getter details : Types::NotificationDetails?

        # Affected scope of this notification such as the underlying resources affected by the notification
        # event.
        @[JSON::Field(key: "Scope")]
        getter scope : Types::ScopeDetails?

        def initialize(
          @data_set_id : String,
          @type : String,
          @client_token : String? = nil,
          @comment : String? = nil,
          @details : Types::NotificationDetails? = nil,
          @scope : Types::ScopeDetails? = nil
        )
        end
      end

      struct SendDataSetNotificationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request has exceeded the quotas imposed by the service.
      struct ServiceLimitExceededException
        include JSON::Serializable

        # The request has exceeded the quotas imposed by the service.
        @[JSON::Field(key: "Message")]
        getter message : String

        # The name of the limit that was reached.
        @[JSON::Field(key: "LimitName")]
        getter limit_name : String?

        # The value of the exceeded limit.
        @[JSON::Field(key: "LimitValue")]
        getter limit_value : Float64?

        def initialize(
          @message : String,
          @limit_name : String? = nil,
          @limit_value : Float64? = nil
        )
        end
      end

      struct StartJobRequest
        include JSON::Serializable

        # The unique identifier for a job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct StartJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The LF-tag policy for a table resource.
      struct TableLFTagPolicy
        include JSON::Serializable

        # A list of LF-tag conditions that apply to table resources.
        @[JSON::Field(key: "Expression")]
        getter expression : Array(Types::LFTag)

        def initialize(
          @expression : Array(Types::LFTag)
        )
        end
      end

      # The LF-tag policy and permissions that apply to table resources.
      struct TableLFTagPolicyAndPermissions
        include JSON::Serializable

        # A list of LF-tag conditions that apply to table resources.
        @[JSON::Field(key: "Expression")]
        getter expression : Array(Types::LFTag)

        # The permissions granted to subscribers on table resources.
        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)

        def initialize(
          @expression : Array(Types::LFTag),
          @permissions : Array(String)
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A label that consists of a customer-defined key and an optional value.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The limit on the number of requests per second was exceeded.
      struct ThrottlingException
        include JSON::Serializable

        # The limit on the number of requests per second was exceeded.
        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The key tags.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UpdateAssetRequest
        include JSON::Serializable

        # The unique identifier for an asset.
        @[JSON::Field(key: "AssetId")]
        getter asset_id : String

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The name of the asset. When importing from Amazon S3, the Amazon S3 object key is used as the asset
        # name. When exporting to Amazon S3, the asset name is used as default target Amazon S3 object key.
        # When importing from Amazon API Gateway API, the API name is used as the asset name. When importing
        # from Amazon Redshift, the datashare name is used as the asset name. When importing from AWS Lake
        # Formation, the static values of "Database(s) included in the LF-tag policy" or "Table(s) included in
        # LF-tag policy" are used as the name.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The unique identifier for a revision.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        def initialize(
          @asset_id : String,
          @data_set_id : String,
          @name : String,
          @revision_id : String
        )
        end
      end

      struct UpdateAssetResponse
        include JSON::Serializable

        # The ARN for the asset.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Details about the asset.
        @[JSON::Field(key: "AssetDetails")]
        getter asset_details : Types::AssetDetails?

        # The type of asset that is added to a data set.
        @[JSON::Field(key: "AssetType")]
        getter asset_type : String?

        # The date and time that the asset was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The unique identifier for the data set associated with this asset.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String?

        # The unique identifier for the asset.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the asset. When importing from Amazon S3, the Amazon S3 object key is used as the asset
        # name. When exporting to Amazon S3, the asset name is used as default target Amazon S3 object key.
        # When importing from Amazon API Gateway API, the API name is used as the asset name. When importing
        # from Amazon Redshift, the datashare name is used as the asset name. When importing from AWS Lake
        # Formation, the static values of "Database(s) included in the LF-tag policy"- or "Table(s) included
        # in LF-tag policy" are used as the asset name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique identifier for the revision associated with this asset.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        # The asset ID of the owned asset corresponding to the entitled asset being viewed. This parameter is
        # returned when an asset owner is viewing the entitled copy of its owned asset.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        # The date and time that the asset was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @asset_details : Types::AssetDetails? = nil,
          @asset_type : String? = nil,
          @created_at : Time? = nil,
          @data_set_id : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @revision_id : String? = nil,
          @source_id : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct UpdateDataSetRequest
        include JSON::Serializable

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The description for the data set.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the data set.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @data_set_id : String,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateDataSetResponse
        include JSON::Serializable

        # The ARN for the data set.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The type of asset that is added to a data set.
        @[JSON::Field(key: "AssetType")]
        getter asset_type : String?

        # The date and time that the data set was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description for the data set.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier for the data set.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the data set.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A property that defines the data set as OWNED by the account (for providers) or ENTITLED to the
        # account (for subscribers).
        @[JSON::Field(key: "Origin")]
        getter origin : String?

        # If the origin of this data set is ENTITLED, includes the details for the product on AWS Marketplace.
        @[JSON::Field(key: "OriginDetails")]
        getter origin_details : Types::OriginDetails?

        # The data set ID of the owned data set corresponding to the entitled data set being viewed. This
        # parameter is returned when a data set owner is viewing the entitled copy of its owned data set.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        # The date and time that the data set was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @asset_type : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @origin : String? = nil,
          @origin_details : Types::OriginDetails? = nil,
          @source_id : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct UpdateEventActionRequest
        include JSON::Serializable

        # The unique identifier for the event action.
        @[JSON::Field(key: "EventActionId")]
        getter event_action_id : String

        # What occurs after a certain event.
        @[JSON::Field(key: "Action")]
        getter action : Types::Action?

        def initialize(
          @event_action_id : String,
          @action : Types::Action? = nil
        )
        end
      end

      struct UpdateEventActionResponse
        include JSON::Serializable

        # What occurs after a certain event.
        @[JSON::Field(key: "Action")]
        getter action : Types::Action?

        # The ARN for the event action.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the event action was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # What occurs to start an action.
        @[JSON::Field(key: "Event")]
        getter event : Types::Event?

        # The unique identifier for the event action.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time that the event action was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @action : Types::Action? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @event : Types::Event? = nil,
          @id : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct UpdateRevisionRequest
        include JSON::Serializable

        # The unique identifier for a data set.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String

        # The unique identifier for a revision.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String

        # An optional comment about the revision.
        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # Finalizing a revision tells AWS Data Exchange that your changes to the assets in the revision are
        # complete. After it's in this read-only state, you can publish the revision to your products.
        @[JSON::Field(key: "Finalized")]
        getter finalized : Bool?

        def initialize(
          @data_set_id : String,
          @revision_id : String,
          @comment : String? = nil,
          @finalized : Bool? = nil
        )
        end
      end

      struct UpdateRevisionResponse
        include JSON::Serializable

        # The ARN for the revision.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # An optional comment about the revision.
        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The date and time that the revision was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The unique identifier for the data set associated with the data set revision.
        @[JSON::Field(key: "DataSetId")]
        getter data_set_id : String?

        # To publish a revision to a data set in a product, the revision must first be finalized. Finalizing a
        # revision tells AWS Data Exchange that changes to the assets in the revision are complete. After it's
        # in this read-only state, you can publish the revision to your products. Finalized revisions can be
        # published through the AWS Data Exchange console or the AWS Marketplace Catalog API, using the
        # StartChangeSet AWS Marketplace Catalog API action. When using the API, revisions are uniquely
        # identified by their ARN.
        @[JSON::Field(key: "Finalized")]
        getter finalized : Bool?

        # The unique identifier for the revision.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # A required comment to inform subscribers of the reason their access to the revision was revoked.
        @[JSON::Field(key: "RevocationComment")]
        getter revocation_comment : String?

        # A status indicating that subscribers' access to the revision was revoked.
        @[JSON::Field(key: "Revoked")]
        getter revoked : Bool?

        # The date and time that the revision was revoked, in ISO 8601 format.
        @[JSON::Field(key: "RevokedAt")]
        getter revoked_at : Time?

        # The revision ID of the owned revision corresponding to the entitled revision being viewed. This
        # parameter is returned when a revision owner is viewing the entitled copy of its owned revision.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        # The date and time that the revision was last updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @comment : String? = nil,
          @created_at : Time? = nil,
          @data_set_id : String? = nil,
          @finalized : Bool? = nil,
          @id : String? = nil,
          @revocation_comment : String? = nil,
          @revoked : Bool? = nil,
          @revoked_at : Time? = nil,
          @source_id : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The request was invalid.
      struct ValidationException
        include JSON::Serializable

        # The message that informs you about what was invalid about the request.
        @[JSON::Field(key: "Message")]
        getter message : String

        # The unique identifier for the resource that couldn't be found.
        @[JSON::Field(key: "ExceptionCause")]
        getter exception_cause : String?

        def initialize(
          @message : String,
          @exception_cause : String? = nil
        )
        end
      end
    end
  end
end
