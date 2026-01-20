require "json"
require "uri"
require "xml"
require "../../runtime"

module AwsSdk
  module S3Control
    module Protocol
      module RestXml
        CONTENT_TYPE = "application/xml"

        struct ShapeMember
          getter name : String
          getter shape : String
          getter location : String?
          getter location_name : String?
          getter flattened : Bool

          def initialize(
            @name : String,
            @shape : String,
            @location : String?,
            @location_name : String?,
            @flattened : Bool
          )
          end
        end

        struct Shape
          getter name : String
          getter type : String
          getter members : Array(ShapeMember)
          getter list_member : ShapeMember?
          getter flattened : Bool

          def initialize(
            @name : String,
            @type : String,
            @members : Array(ShapeMember),
            @list_member : ShapeMember?,
            @flattened : Bool
          )
          end
        end

        OPERATION_INPUT_SHAPES = {


          "AssociateAccessGrantsIdentityCenter" => "AssociateAccessGrantsIdentityCenterRequest",


          "CreateAccessGrant" => "CreateAccessGrantRequest",


          "CreateAccessGrantsInstance" => "CreateAccessGrantsInstanceRequest",


          "CreateAccessGrantsLocation" => "CreateAccessGrantsLocationRequest",


          "CreateAccessPoint" => "CreateAccessPointRequest",


          "CreateAccessPointForObjectLambda" => "CreateAccessPointForObjectLambdaRequest",


          "CreateBucket" => "CreateBucketRequest",


          "CreateJob" => "CreateJobRequest",


          "CreateMultiRegionAccessPoint" => "CreateMultiRegionAccessPointRequest",


          "CreateStorageLensGroup" => "CreateStorageLensGroupRequest",


          "DeleteAccessGrant" => "DeleteAccessGrantRequest",


          "DeleteAccessGrantsInstance" => "DeleteAccessGrantsInstanceRequest",


          "DeleteAccessGrantsInstanceResourcePolicy" => "DeleteAccessGrantsInstanceResourcePolicyRequest",


          "DeleteAccessGrantsLocation" => "DeleteAccessGrantsLocationRequest",


          "DeleteAccessPoint" => "DeleteAccessPointRequest",


          "DeleteAccessPointForObjectLambda" => "DeleteAccessPointForObjectLambdaRequest",


          "DeleteAccessPointPolicy" => "DeleteAccessPointPolicyRequest",


          "DeleteAccessPointPolicyForObjectLambda" => "DeleteAccessPointPolicyForObjectLambdaRequest",


          "DeleteAccessPointScope" => "DeleteAccessPointScopeRequest",


          "DeleteBucket" => "DeleteBucketRequest",


          "DeleteBucketLifecycleConfiguration" => "DeleteBucketLifecycleConfigurationRequest",


          "DeleteBucketPolicy" => "DeleteBucketPolicyRequest",


          "DeleteBucketReplication" => "DeleteBucketReplicationRequest",


          "DeleteBucketTagging" => "DeleteBucketTaggingRequest",


          "DeleteJobTagging" => "DeleteJobTaggingRequest",


          "DeleteMultiRegionAccessPoint" => "DeleteMultiRegionAccessPointRequest",


          "DeletePublicAccessBlock" => "DeletePublicAccessBlockRequest",


          "DeleteStorageLensConfiguration" => "DeleteStorageLensConfigurationRequest",


          "DeleteStorageLensConfigurationTagging" => "DeleteStorageLensConfigurationTaggingRequest",


          "DeleteStorageLensGroup" => "DeleteStorageLensGroupRequest",


          "DescribeJob" => "DescribeJobRequest",


          "DescribeMultiRegionAccessPointOperation" => "DescribeMultiRegionAccessPointOperationRequest",


          "DissociateAccessGrantsIdentityCenter" => "DissociateAccessGrantsIdentityCenterRequest",


          "GetAccessGrant" => "GetAccessGrantRequest",


          "GetAccessGrantsInstance" => "GetAccessGrantsInstanceRequest",


          "GetAccessGrantsInstanceForPrefix" => "GetAccessGrantsInstanceForPrefixRequest",


          "GetAccessGrantsInstanceResourcePolicy" => "GetAccessGrantsInstanceResourcePolicyRequest",


          "GetAccessGrantsLocation" => "GetAccessGrantsLocationRequest",


          "GetAccessPoint" => "GetAccessPointRequest",


          "GetAccessPointConfigurationForObjectLambda" => "GetAccessPointConfigurationForObjectLambdaRequest",


          "GetAccessPointForObjectLambda" => "GetAccessPointForObjectLambdaRequest",


          "GetAccessPointPolicy" => "GetAccessPointPolicyRequest",


          "GetAccessPointPolicyForObjectLambda" => "GetAccessPointPolicyForObjectLambdaRequest",


          "GetAccessPointPolicyStatus" => "GetAccessPointPolicyStatusRequest",


          "GetAccessPointPolicyStatusForObjectLambda" => "GetAccessPointPolicyStatusForObjectLambdaRequest",


          "GetAccessPointScope" => "GetAccessPointScopeRequest",


          "GetBucket" => "GetBucketRequest",


          "GetBucketLifecycleConfiguration" => "GetBucketLifecycleConfigurationRequest",


          "GetBucketPolicy" => "GetBucketPolicyRequest",


          "GetBucketReplication" => "GetBucketReplicationRequest",


          "GetBucketTagging" => "GetBucketTaggingRequest",


          "GetBucketVersioning" => "GetBucketVersioningRequest",


          "GetDataAccess" => "GetDataAccessRequest",


          "GetJobTagging" => "GetJobTaggingRequest",


          "GetMultiRegionAccessPoint" => "GetMultiRegionAccessPointRequest",


          "GetMultiRegionAccessPointPolicy" => "GetMultiRegionAccessPointPolicyRequest",


          "GetMultiRegionAccessPointPolicyStatus" => "GetMultiRegionAccessPointPolicyStatusRequest",


          "GetMultiRegionAccessPointRoutes" => "GetMultiRegionAccessPointRoutesRequest",


          "GetPublicAccessBlock" => "GetPublicAccessBlockRequest",


          "GetStorageLensConfiguration" => "GetStorageLensConfigurationRequest",


          "GetStorageLensConfigurationTagging" => "GetStorageLensConfigurationTaggingRequest",


          "GetStorageLensGroup" => "GetStorageLensGroupRequest",


          "ListAccessGrants" => "ListAccessGrantsRequest",


          "ListAccessGrantsInstances" => "ListAccessGrantsInstancesRequest",


          "ListAccessGrantsLocations" => "ListAccessGrantsLocationsRequest",


          "ListAccessPoints" => "ListAccessPointsRequest",


          "ListAccessPointsForDirectoryBuckets" => "ListAccessPointsForDirectoryBucketsRequest",


          "ListAccessPointsForObjectLambda" => "ListAccessPointsForObjectLambdaRequest",


          "ListCallerAccessGrants" => "ListCallerAccessGrantsRequest",


          "ListJobs" => "ListJobsRequest",


          "ListMultiRegionAccessPoints" => "ListMultiRegionAccessPointsRequest",


          "ListRegionalBuckets" => "ListRegionalBucketsRequest",


          "ListStorageLensConfigurations" => "ListStorageLensConfigurationsRequest",


          "ListStorageLensGroups" => "ListStorageLensGroupsRequest",


          "ListTagsForResource" => "ListTagsForResourceRequest",


          "PutAccessGrantsInstanceResourcePolicy" => "PutAccessGrantsInstanceResourcePolicyRequest",


          "PutAccessPointConfigurationForObjectLambda" => "PutAccessPointConfigurationForObjectLambdaRequest",


          "PutAccessPointPolicy" => "PutAccessPointPolicyRequest",


          "PutAccessPointPolicyForObjectLambda" => "PutAccessPointPolicyForObjectLambdaRequest",


          "PutAccessPointScope" => "PutAccessPointScopeRequest",


          "PutBucketLifecycleConfiguration" => "PutBucketLifecycleConfigurationRequest",


          "PutBucketPolicy" => "PutBucketPolicyRequest",


          "PutBucketReplication" => "PutBucketReplicationRequest",


          "PutBucketTagging" => "PutBucketTaggingRequest",


          "PutBucketVersioning" => "PutBucketVersioningRequest",


          "PutJobTagging" => "PutJobTaggingRequest",


          "PutMultiRegionAccessPointPolicy" => "PutMultiRegionAccessPointPolicyRequest",


          "PutPublicAccessBlock" => "PutPublicAccessBlockRequest",


          "PutStorageLensConfiguration" => "PutStorageLensConfigurationRequest",


          "PutStorageLensConfigurationTagging" => "PutStorageLensConfigurationTaggingRequest",


          "SubmitMultiRegionAccessPointRoutes" => "SubmitMultiRegionAccessPointRoutesRequest",


          "TagResource" => "TagResourceRequest",


          "UntagResource" => "UntagResourceRequest",


          "UpdateAccessGrantsLocation" => "UpdateAccessGrantsLocationRequest",


          "UpdateJobPriority" => "UpdateJobPriorityRequest",


          "UpdateJobStatus" => "UpdateJobStatusRequest",


          "UpdateStorageLensGroup" => "UpdateStorageLensGroupRequest",

        }

        OPERATION_OUTPUT_SHAPES = {



          "CreateAccessGrant" => "CreateAccessGrantResult",


          "CreateAccessGrantsInstance" => "CreateAccessGrantsInstanceResult",


          "CreateAccessGrantsLocation" => "CreateAccessGrantsLocationResult",


          "CreateAccessPoint" => "CreateAccessPointResult",


          "CreateAccessPointForObjectLambda" => "CreateAccessPointForObjectLambdaResult",


          "CreateBucket" => "CreateBucketResult",


          "CreateJob" => "CreateJobResult",


          "CreateMultiRegionAccessPoint" => "CreateMultiRegionAccessPointResult",

















          "DeleteJobTagging" => "DeleteJobTaggingResult",


          "DeleteMultiRegionAccessPoint" => "DeleteMultiRegionAccessPointResult",




          "DeleteStorageLensConfigurationTagging" => "DeleteStorageLensConfigurationTaggingResult",



          "DescribeJob" => "DescribeJobResult",


          "DescribeMultiRegionAccessPointOperation" => "DescribeMultiRegionAccessPointOperationResult",



          "GetAccessGrant" => "GetAccessGrantResult",


          "GetAccessGrantsInstance" => "GetAccessGrantsInstanceResult",


          "GetAccessGrantsInstanceForPrefix" => "GetAccessGrantsInstanceForPrefixResult",


          "GetAccessGrantsInstanceResourcePolicy" => "GetAccessGrantsInstanceResourcePolicyResult",


          "GetAccessGrantsLocation" => "GetAccessGrantsLocationResult",


          "GetAccessPoint" => "GetAccessPointResult",


          "GetAccessPointConfigurationForObjectLambda" => "GetAccessPointConfigurationForObjectLambdaResult",


          "GetAccessPointForObjectLambda" => "GetAccessPointForObjectLambdaResult",


          "GetAccessPointPolicy" => "GetAccessPointPolicyResult",


          "GetAccessPointPolicyForObjectLambda" => "GetAccessPointPolicyForObjectLambdaResult",


          "GetAccessPointPolicyStatus" => "GetAccessPointPolicyStatusResult",


          "GetAccessPointPolicyStatusForObjectLambda" => "GetAccessPointPolicyStatusForObjectLambdaResult",


          "GetAccessPointScope" => "GetAccessPointScopeResult",


          "GetBucket" => "GetBucketResult",


          "GetBucketLifecycleConfiguration" => "GetBucketLifecycleConfigurationResult",


          "GetBucketPolicy" => "GetBucketPolicyResult",


          "GetBucketReplication" => "GetBucketReplicationResult",


          "GetBucketTagging" => "GetBucketTaggingResult",


          "GetBucketVersioning" => "GetBucketVersioningResult",


          "GetDataAccess" => "GetDataAccessResult",


          "GetJobTagging" => "GetJobTaggingResult",


          "GetMultiRegionAccessPoint" => "GetMultiRegionAccessPointResult",


          "GetMultiRegionAccessPointPolicy" => "GetMultiRegionAccessPointPolicyResult",


          "GetMultiRegionAccessPointPolicyStatus" => "GetMultiRegionAccessPointPolicyStatusResult",


          "GetMultiRegionAccessPointRoutes" => "GetMultiRegionAccessPointRoutesResult",


          "GetPublicAccessBlock" => "GetPublicAccessBlockOutput",


          "GetStorageLensConfiguration" => "GetStorageLensConfigurationResult",


          "GetStorageLensConfigurationTagging" => "GetStorageLensConfigurationTaggingResult",


          "GetStorageLensGroup" => "GetStorageLensGroupResult",


          "ListAccessGrants" => "ListAccessGrantsResult",


          "ListAccessGrantsInstances" => "ListAccessGrantsInstancesResult",


          "ListAccessGrantsLocations" => "ListAccessGrantsLocationsResult",


          "ListAccessPoints" => "ListAccessPointsResult",


          "ListAccessPointsForDirectoryBuckets" => "ListAccessPointsForDirectoryBucketsResult",


          "ListAccessPointsForObjectLambda" => "ListAccessPointsForObjectLambdaResult",


          "ListCallerAccessGrants" => "ListCallerAccessGrantsResult",


          "ListJobs" => "ListJobsResult",


          "ListMultiRegionAccessPoints" => "ListMultiRegionAccessPointsResult",


          "ListRegionalBuckets" => "ListRegionalBucketsResult",


          "ListStorageLensConfigurations" => "ListStorageLensConfigurationsResult",


          "ListStorageLensGroups" => "ListStorageLensGroupsResult",


          "ListTagsForResource" => "ListTagsForResourceResult",


          "PutAccessGrantsInstanceResourcePolicy" => "PutAccessGrantsInstanceResourcePolicyResult",











          "PutJobTagging" => "PutJobTaggingResult",


          "PutMultiRegionAccessPointPolicy" => "PutMultiRegionAccessPointPolicyResult",




          "PutStorageLensConfigurationTagging" => "PutStorageLensConfigurationTaggingResult",


          "SubmitMultiRegionAccessPointRoutes" => "SubmitMultiRegionAccessPointRoutesResult",


          "TagResource" => "TagResourceResult",


          "UntagResource" => "UntagResourceResult",


          "UpdateAccessGrantsLocation" => "UpdateAccessGrantsLocationResult",


          "UpdateJobPriority" => "UpdateJobPriorityResult",


          "UpdateJobStatus" => "UpdateJobStatusResult",


        }

        OPERATION_INPUT_ROOTS = {



          "AssociateAccessGrantsIdentityCenter" => "AssociateAccessGrantsIdentityCenterRequest",



          "CreateAccessGrant" => "CreateAccessGrantRequest",



          "CreateAccessGrantsInstance" => "CreateAccessGrantsInstanceRequest",



          "CreateAccessGrantsLocation" => "CreateAccessGrantsLocationRequest",



          "CreateAccessPoint" => "CreateAccessPointRequest",



          "CreateAccessPointForObjectLambda" => "CreateAccessPointForObjectLambdaRequest",



          "CreateBucket" => "CreateBucketRequest",



          "CreateJob" => "CreateJobRequest",



          "CreateMultiRegionAccessPoint" => "CreateMultiRegionAccessPointRequest",



          "CreateStorageLensGroup" => "CreateStorageLensGroupRequest",



          "DeleteAccessGrant" => "DeleteAccessGrantRequest",



          "DeleteAccessGrantsInstance" => "DeleteAccessGrantsInstanceRequest",



          "DeleteAccessGrantsInstanceResourcePolicy" => "DeleteAccessGrantsInstanceResourcePolicyRequest",



          "DeleteAccessGrantsLocation" => "DeleteAccessGrantsLocationRequest",



          "DeleteAccessPoint" => "DeleteAccessPointRequest",



          "DeleteAccessPointForObjectLambda" => "DeleteAccessPointForObjectLambdaRequest",



          "DeleteAccessPointPolicy" => "DeleteAccessPointPolicyRequest",



          "DeleteAccessPointPolicyForObjectLambda" => "DeleteAccessPointPolicyForObjectLambdaRequest",



          "DeleteAccessPointScope" => "DeleteAccessPointScopeRequest",



          "DeleteBucket" => "DeleteBucketRequest",



          "DeleteBucketLifecycleConfiguration" => "DeleteBucketLifecycleConfigurationRequest",



          "DeleteBucketPolicy" => "DeleteBucketPolicyRequest",



          "DeleteBucketReplication" => "DeleteBucketReplicationRequest",



          "DeleteBucketTagging" => "DeleteBucketTaggingRequest",



          "DeleteJobTagging" => "DeleteJobTaggingRequest",



          "DeleteMultiRegionAccessPoint" => "DeleteMultiRegionAccessPointRequest",



          "DeletePublicAccessBlock" => "DeletePublicAccessBlockRequest",



          "DeleteStorageLensConfiguration" => "DeleteStorageLensConfigurationRequest",



          "DeleteStorageLensConfigurationTagging" => "DeleteStorageLensConfigurationTaggingRequest",



          "DeleteStorageLensGroup" => "DeleteStorageLensGroupRequest",



          "DescribeJob" => "DescribeJobRequest",



          "DescribeMultiRegionAccessPointOperation" => "DescribeMultiRegionAccessPointOperationRequest",



          "DissociateAccessGrantsIdentityCenter" => "DissociateAccessGrantsIdentityCenterRequest",



          "GetAccessGrant" => "GetAccessGrantRequest",



          "GetAccessGrantsInstance" => "GetAccessGrantsInstanceRequest",



          "GetAccessGrantsInstanceForPrefix" => "GetAccessGrantsInstanceForPrefixRequest",



          "GetAccessGrantsInstanceResourcePolicy" => "GetAccessGrantsInstanceResourcePolicyRequest",



          "GetAccessGrantsLocation" => "GetAccessGrantsLocationRequest",



          "GetAccessPoint" => "GetAccessPointRequest",



          "GetAccessPointConfigurationForObjectLambda" => "GetAccessPointConfigurationForObjectLambdaRequest",



          "GetAccessPointForObjectLambda" => "GetAccessPointForObjectLambdaRequest",



          "GetAccessPointPolicy" => "GetAccessPointPolicyRequest",



          "GetAccessPointPolicyForObjectLambda" => "GetAccessPointPolicyForObjectLambdaRequest",



          "GetAccessPointPolicyStatus" => "GetAccessPointPolicyStatusRequest",



          "GetAccessPointPolicyStatusForObjectLambda" => "GetAccessPointPolicyStatusForObjectLambdaRequest",



          "GetAccessPointScope" => "GetAccessPointScopeRequest",



          "GetBucket" => "GetBucketRequest",



          "GetBucketLifecycleConfiguration" => "GetBucketLifecycleConfigurationRequest",



          "GetBucketPolicy" => "GetBucketPolicyRequest",



          "GetBucketReplication" => "GetBucketReplicationRequest",



          "GetBucketTagging" => "GetBucketTaggingRequest",



          "GetBucketVersioning" => "GetBucketVersioningRequest",



          "GetDataAccess" => "GetDataAccessRequest",



          "GetJobTagging" => "GetJobTaggingRequest",



          "GetMultiRegionAccessPoint" => "GetMultiRegionAccessPointRequest",



          "GetMultiRegionAccessPointPolicy" => "GetMultiRegionAccessPointPolicyRequest",



          "GetMultiRegionAccessPointPolicyStatus" => "GetMultiRegionAccessPointPolicyStatusRequest",



          "GetMultiRegionAccessPointRoutes" => "GetMultiRegionAccessPointRoutesRequest",



          "GetPublicAccessBlock" => "GetPublicAccessBlockRequest",



          "GetStorageLensConfiguration" => "GetStorageLensConfigurationRequest",



          "GetStorageLensConfigurationTagging" => "GetStorageLensConfigurationTaggingRequest",



          "GetStorageLensGroup" => "GetStorageLensGroupRequest",



          "ListAccessGrants" => "ListAccessGrantsRequest",



          "ListAccessGrantsInstances" => "ListAccessGrantsInstancesRequest",



          "ListAccessGrantsLocations" => "ListAccessGrantsLocationsRequest",



          "ListAccessPoints" => "ListAccessPointsRequest",



          "ListAccessPointsForDirectoryBuckets" => "ListAccessPointsForDirectoryBucketsRequest",



          "ListAccessPointsForObjectLambda" => "ListAccessPointsForObjectLambdaRequest",



          "ListCallerAccessGrants" => "ListCallerAccessGrantsRequest",



          "ListJobs" => "ListJobsRequest",



          "ListMultiRegionAccessPoints" => "ListMultiRegionAccessPointsRequest",



          "ListRegionalBuckets" => "ListRegionalBucketsRequest",



          "ListStorageLensConfigurations" => "ListStorageLensConfigurationsRequest",



          "ListStorageLensGroups" => "ListStorageLensGroupsRequest",



          "ListTagsForResource" => "ListTagsForResourceRequest",



          "PutAccessGrantsInstanceResourcePolicy" => "PutAccessGrantsInstanceResourcePolicyRequest",



          "PutAccessPointConfigurationForObjectLambda" => "PutAccessPointConfigurationForObjectLambdaRequest",



          "PutAccessPointPolicy" => "PutAccessPointPolicyRequest",



          "PutAccessPointPolicyForObjectLambda" => "PutAccessPointPolicyForObjectLambdaRequest",



          "PutAccessPointScope" => "PutAccessPointScopeRequest",



          "PutBucketLifecycleConfiguration" => "PutBucketLifecycleConfigurationRequest",



          "PutBucketPolicy" => "PutBucketPolicyRequest",



          "PutBucketReplication" => "PutBucketReplicationRequest",



          "PutBucketTagging" => "PutBucketTaggingRequest",



          "PutBucketVersioning" => "PutBucketVersioningRequest",



          "PutJobTagging" => "PutJobTaggingRequest",



          "PutMultiRegionAccessPointPolicy" => "PutMultiRegionAccessPointPolicyRequest",



          "PutPublicAccessBlock" => "PutPublicAccessBlockRequest",



          "PutStorageLensConfiguration" => "PutStorageLensConfigurationRequest",



          "PutStorageLensConfigurationTagging" => "PutStorageLensConfigurationTaggingRequest",



          "SubmitMultiRegionAccessPointRoutes" => "SubmitMultiRegionAccessPointRoutesRequest",



          "TagResource" => "TagResourceRequest",



          "UntagResource" => "UntagResourceRequest",



          "UpdateAccessGrantsLocation" => "UpdateAccessGrantsLocationRequest",



          "UpdateJobPriority" => "UpdateJobPriorityRequest",



          "UpdateJobStatus" => "UpdateJobStatusRequest",



          "UpdateStorageLensGroup" => "UpdateStorageLensGroupRequest",

        }

        OPERATION_INPUT_NAMESPACES = {




          "AssociateAccessGrantsIdentityCenter" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "CreateAccessGrant" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "CreateAccessGrantsInstance" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "CreateAccessGrantsLocation" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "CreateAccessPoint" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "CreateAccessPointForObjectLambda" => "http://awss3control.amazonaws.com/doc/2018-08-20/",







          "CreateJob" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "CreateMultiRegionAccessPoint" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "CreateStorageLensGroup" => "http://awss3control.amazonaws.com/doc/2018-08-20/",

















































          "DeleteMultiRegionAccessPoint" => "http://awss3control.amazonaws.com/doc/2018-08-20/",























































































































































          "PutAccessGrantsInstanceResourcePolicy" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "PutAccessPointConfigurationForObjectLambda" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "PutAccessPointPolicy" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "PutAccessPointPolicyForObjectLambda" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "PutAccessPointScope" => "http://awss3control.amazonaws.com/doc/2018-08-20/",







          "PutBucketPolicy" => "http://awss3control.amazonaws.com/doc/2018-08-20/",













          "PutJobTagging" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "PutMultiRegionAccessPointPolicy" => "http://awss3control.amazonaws.com/doc/2018-08-20/",







          "PutStorageLensConfiguration" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "PutStorageLensConfigurationTagging" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "SubmitMultiRegionAccessPointRoutes" => "http://awss3control.amazonaws.com/doc/2018-08-20/",




          "TagResource" => "http://awss3control.amazonaws.com/doc/2018-08-20/",







          "UpdateAccessGrantsLocation" => "http://awss3control.amazonaws.com/doc/2018-08-20/",










          "UpdateStorageLensGroup" => "http://awss3control.amazonaws.com/doc/2018-08-20/",

        }

        SHAPES = {



          "AbortIncompleteMultipartUpload" => Shape.new(
            "AbortIncompleteMultipartUpload",
            "structure",
            [





              ShapeMember.new(
                "DaysAfterInitiation",
                "DaysAfterInitiation",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AccessControlTranslation" => Shape.new(
            "AccessControlTranslation",
            "structure",
            [





              ShapeMember.new(
                "Owner",
                "OwnerOverride",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AccessGrantArn" => Shape.new(
            "AccessGrantArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AccessGrantId" => Shape.new(
            "AccessGrantId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AccessGrantsInstanceArn" => Shape.new(
            "AccessGrantsInstanceArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AccessGrantsInstanceId" => Shape.new(
            "AccessGrantsInstanceId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "AccessGrantsInstancesList" => Shape.new(
            "AccessGrantsInstancesList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ListAccessGrantsInstanceEntry",
              nil,
              "AccessGrantsInstance",
              false
            ),
            false
          ),









          "AccessGrantsList" => Shape.new(
            "AccessGrantsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ListAccessGrantEntry",
              nil,
              "AccessGrant",
              false
            ),
            false
          ),





          "AccessGrantsLocationArn" => Shape.new(
            "AccessGrantsLocationArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AccessGrantsLocationConfiguration" => Shape.new(
            "AccessGrantsLocationConfiguration",
            "structure",
            [





              ShapeMember.new(
                "S3SubPrefix",
                "S3Prefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AccessGrantsLocationId" => Shape.new(
            "AccessGrantsLocationId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "AccessGrantsLocationsList" => Shape.new(
            "AccessGrantsLocationsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ListAccessGrantsLocationsEntry",
              nil,
              "AccessGrantsLocation",
              false
            ),
            false
          ),





          "AccessKeyId" => Shape.new(
            "AccessKeyId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AccessPoint" => Shape.new(
            "AccessPoint",
            "structure",
            [





              ShapeMember.new(
                "AccessPointArn",
                "S3AccessPointArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Alias",
                "Alias",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Bucket",
                "AccessPointBucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketAccountId",
                "AccountId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DataSourceId",
                "DataSourceId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DataSourceType",
                "DataSourceType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "AccessPointName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NetworkOrigin",
                "NetworkOrigin",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VpcConfiguration",
                "VpcConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AccessPointBucketName" => Shape.new(
            "AccessPointBucketName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "AccessPointList" => Shape.new(
            "AccessPointList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "AccessPoint",
              nil,
              "AccessPoint",
              false
            ),
            false
          ),





          "AccessPointName" => Shape.new(
            "AccessPointName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AccountId" => Shape.new(
            "AccountId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AccountLevel" => Shape.new(
            "AccountLevel",
            "structure",
            [





              ShapeMember.new(
                "ActivityMetrics",
                "ActivityMetrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AdvancedCostOptimizationMetrics",
                "AdvancedCostOptimizationMetrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AdvancedDataProtectionMetrics",
                "AdvancedDataProtectionMetrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AdvancedPerformanceMetrics",
                "AdvancedPerformanceMetrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketLevel",
                "BucketLevel",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DetailedStatusCodesMetrics",
                "DetailedStatusCodesMetrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageLensGroupLevel",
                "StorageLensGroupLevel",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ActivityMetrics" => Shape.new(
            "ActivityMetrics",
            "structure",
            [





              ShapeMember.new(
                "IsEnabled",
                "IsEnabled",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AdvancedCostOptimizationMetrics" => Shape.new(
            "AdvancedCostOptimizationMetrics",
            "structure",
            [





              ShapeMember.new(
                "IsEnabled",
                "IsEnabled",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AdvancedDataProtectionMetrics" => Shape.new(
            "AdvancedDataProtectionMetrics",
            "structure",
            [





              ShapeMember.new(
                "IsEnabled",
                "IsEnabled",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AdvancedPerformanceMetrics" => Shape.new(
            "AdvancedPerformanceMetrics",
            "structure",
            [





              ShapeMember.new(
                "IsEnabled",
                "IsEnabled",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Alias" => Shape.new(
            "Alias",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AssociateAccessGrantsIdentityCenterRequest" => Shape.new(
            "AssociateAccessGrantsIdentityCenterRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "IdentityCenterArn",
                "IdentityCenterArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AsyncCreationTimestamp" => Shape.new(
            "AsyncCreationTimestamp",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "AsyncErrorDetails" => Shape.new(
            "AsyncErrorDetails",
            "structure",
            [





              ShapeMember.new(
                "Code",
                "MaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Message",
                "MaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestId",
                "MaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Resource",
                "MaxLength1024String",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AsyncOperation" => Shape.new(
            "AsyncOperation",
            "structure",
            [





              ShapeMember.new(
                "CreationTime",
                "AsyncCreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Operation",
                "AsyncOperationName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestParameters",
                "AsyncRequestParameters",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestStatus",
                "AsyncRequestStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestTokenARN",
                "AsyncRequestTokenARN",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ResponseDetails",
                "AsyncResponseDetails",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AsyncOperationName" => Shape.new(
            "AsyncOperationName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AsyncRequestParameters" => Shape.new(
            "AsyncRequestParameters",
            "structure",
            [





              ShapeMember.new(
                "CreateMultiRegionAccessPointRequest",
                "CreateMultiRegionAccessPointInput",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DeleteMultiRegionAccessPointRequest",
                "DeleteMultiRegionAccessPointInput",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PutMultiRegionAccessPointPolicyRequest",
                "PutMultiRegionAccessPointPolicyInput",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AsyncRequestStatus" => Shape.new(
            "AsyncRequestStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AsyncRequestTokenARN" => Shape.new(
            "AsyncRequestTokenARN",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AsyncResponseDetails" => Shape.new(
            "AsyncResponseDetails",
            "structure",
            [





              ShapeMember.new(
                "ErrorDetails",
                "AsyncErrorDetails",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MultiRegionAccessPointDetails",
                "MultiRegionAccessPointsAsyncResponse",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AwsLambdaTransformation" => Shape.new(
            "AwsLambdaTransformation",
            "structure",
            [





              ShapeMember.new(
                "FunctionArn",
                "FunctionArnString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FunctionPayload",
                "AwsLambdaTransformationPayload",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "AwsLambdaTransformationPayload" => Shape.new(
            "AwsLambdaTransformationPayload",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "AwsOrgArn" => Shape.new(
            "AwsOrgArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BadRequestException" => Shape.new(
            "BadRequestException",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "ExceptionMessage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Boolean" => Shape.new(
            "Boolean",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketAlreadyExists" => Shape.new(
            "BucketAlreadyExists",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "BucketAlreadyOwnedByYou" => Shape.new(
            "BucketAlreadyOwnedByYou",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "BucketCannedACL" => Shape.new(
            "BucketCannedACL",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketIdentifierString" => Shape.new(
            "BucketIdentifierString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketLevel" => Shape.new(
            "BucketLevel",
            "structure",
            [





              ShapeMember.new(
                "ActivityMetrics",
                "ActivityMetrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AdvancedCostOptimizationMetrics",
                "AdvancedCostOptimizationMetrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AdvancedDataProtectionMetrics",
                "AdvancedDataProtectionMetrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AdvancedPerformanceMetrics",
                "AdvancedPerformanceMetrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DetailedStatusCodesMetrics",
                "DetailedStatusCodesMetrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PrefixLevel",
                "PrefixLevel",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "BucketLocationConstraint" => Shape.new(
            "BucketLocationConstraint",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketName" => Shape.new(
            "BucketName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "BucketVersioningStatus" => Shape.new(
            "BucketVersioningStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "Buckets" => Shape.new(
            "Buckets",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "S3BucketArnString",
              nil,
              "Arn",
              false
            ),
            false
          ),









          "CallerAccessGrantsList" => Shape.new(
            "CallerAccessGrantsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ListCallerAccessGrantsEntry",
              nil,
              "AccessGrant",
              false
            ),
            false
          ),





          "CloudWatchMetrics" => Shape.new(
            "CloudWatchMetrics",
            "structure",
            [





              ShapeMember.new(
                "IsEnabled",
                "IsEnabled",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ComputeObjectChecksumAlgorithm" => Shape.new(
            "ComputeObjectChecksumAlgorithm",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ComputeObjectChecksumType" => Shape.new(
            "ComputeObjectChecksumType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ConfigId" => Shape.new(
            "ConfigId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ConfirmRemoveSelfBucketAccess" => Shape.new(
            "ConfirmRemoveSelfBucketAccess",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "ConfirmationRequired" => Shape.new(
            "ConfirmationRequired",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "ContinuationToken" => Shape.new(
            "ContinuationToken",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "CreateAccessGrantRequest" => Shape.new(
            "CreateAccessGrantRequest",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsLocationConfiguration",
                "AccessGrantsLocationConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsLocationId",
                "AccessGrantsLocationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ApplicationArn",
                "IdentityCenterApplicationArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Grantee",
                "Grantee",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Permission",
                "Permission",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3PrefixType",
                "S3PrefixType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "TagList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateAccessGrantResult" => Shape.new(
            "CreateAccessGrantResult",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantArn",
                "AccessGrantArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantId",
                "AccessGrantId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsLocationConfiguration",
                "AccessGrantsLocationConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsLocationId",
                "AccessGrantsLocationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ApplicationArn",
                "IdentityCenterApplicationArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "GrantScope",
                "S3Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Grantee",
                "Grantee",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Permission",
                "Permission",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateAccessGrantsInstanceRequest" => Shape.new(
            "CreateAccessGrantsInstanceRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "IdentityCenterArn",
                "IdentityCenterArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "TagList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateAccessGrantsInstanceResult" => Shape.new(
            "CreateAccessGrantsInstanceResult",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsInstanceArn",
                "AccessGrantsInstanceArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsInstanceId",
                "AccessGrantsInstanceId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IdentityCenterApplicationArn",
                "IdentityCenterApplicationArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IdentityCenterArn",
                "IdentityCenterArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IdentityCenterInstanceArn",
                "IdentityCenterArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateAccessGrantsLocationRequest" => Shape.new(
            "CreateAccessGrantsLocationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "IAMRoleArn",
                "IAMRoleArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LocationScope",
                "S3Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "TagList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateAccessGrantsLocationResult" => Shape.new(
            "CreateAccessGrantsLocationResult",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsLocationArn",
                "AccessGrantsLocationArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsLocationId",
                "AccessGrantsLocationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IAMRoleArn",
                "IAMRoleArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LocationScope",
                "S3Prefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateAccessPointForObjectLambdaRequest" => Shape.new(
            "CreateAccessPointForObjectLambdaRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Configuration",
                "ObjectLambdaConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "ObjectLambdaAccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateAccessPointForObjectLambdaResult" => Shape.new(
            "CreateAccessPointForObjectLambdaResult",
            "structure",
            [





              ShapeMember.new(
                "Alias",
                "ObjectLambdaAccessPointAlias",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectLambdaAccessPointArn",
                "ObjectLambdaAccessPointArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateAccessPointRequest" => Shape.new(
            "CreateAccessPointRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketAccountId",
                "AccountId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "AccessPointName",
                "uri",
                "name",
                false
              ),





              ShapeMember.new(
                "PublicAccessBlockConfiguration",
                "PublicAccessBlockConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Scope",
                "Scope",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "TagList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VpcConfiguration",
                "VpcConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateAccessPointResult" => Shape.new(
            "CreateAccessPointResult",
            "structure",
            [





              ShapeMember.new(
                "AccessPointArn",
                "S3AccessPointArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Alias",
                "Alias",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateBucketConfiguration" => Shape.new(
            "CreateBucketConfiguration",
            "structure",
            [





              ShapeMember.new(
                "LocationConstraint",
                "BucketLocationConstraint",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateBucketRequest" => Shape.new(
            "CreateBucketRequest",
            "structure",
            [





              ShapeMember.new(
                "ACL",
                "BucketCannedACL",
                "header",
                "x-amz-acl",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),





              ShapeMember.new(
                "CreateBucketConfiguration",
                "CreateBucketConfiguration",
                nil,
                "CreateBucketConfiguration",
                false
              ),





              ShapeMember.new(
                "GrantFullControl",
                "GrantFullControl",
                "header",
                "x-amz-grant-full-control",
                false
              ),





              ShapeMember.new(
                "GrantRead",
                "GrantRead",
                "header",
                "x-amz-grant-read",
                false
              ),





              ShapeMember.new(
                "GrantReadACP",
                "GrantReadACP",
                "header",
                "x-amz-grant-read-acp",
                false
              ),





              ShapeMember.new(
                "GrantWrite",
                "GrantWrite",
                "header",
                "x-amz-grant-write",
                false
              ),





              ShapeMember.new(
                "GrantWriteACP",
                "GrantWriteACP",
                "header",
                "x-amz-grant-write-acp",
                false
              ),





              ShapeMember.new(
                "ObjectLockEnabledForBucket",
                "ObjectLockEnabledForBucket",
                "header",
                "x-amz-bucket-object-lock-enabled",
                false
              ),





              ShapeMember.new(
                "OutpostId",
                "NonEmptyMaxLength64String",
                "header",
                "x-amz-outpost-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateBucketResult" => Shape.new(
            "CreateBucketResult",
            "structure",
            [





              ShapeMember.new(
                "BucketArn",
                "S3RegionalBucketArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Location",
                "Location",
                "header",
                "Location",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateJobRequest" => Shape.new(
            "CreateJobRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ClientRequestToken",
                "NonEmptyMaxLength64String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ConfirmationRequired",
                "ConfirmationRequired",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Description",
                "NonEmptyMaxLength256String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Manifest",
                "JobManifest",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ManifestGenerator",
                "JobManifestGenerator",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Operation",
                "JobOperation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Priority",
                "JobPriority",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Report",
                "JobReport",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RoleArn",
                "IAMRoleArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "S3TagSet",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateJobResult" => Shape.new(
            "CreateJobResult",
            "structure",
            [





              ShapeMember.new(
                "JobId",
                "JobId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateMultiRegionAccessPointInput" => Shape.new(
            "CreateMultiRegionAccessPointInput",
            "structure",
            [





              ShapeMember.new(
                "Name",
                "MultiRegionAccessPointName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PublicAccessBlock",
                "PublicAccessBlockConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Regions",
                "RegionCreationList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateMultiRegionAccessPointRequest" => Shape.new(
            "CreateMultiRegionAccessPointRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ClientToken",
                "MultiRegionAccessPointClientToken",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Details",
                "CreateMultiRegionAccessPointInput",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateMultiRegionAccessPointResult" => Shape.new(
            "CreateMultiRegionAccessPointResult",
            "structure",
            [





              ShapeMember.new(
                "RequestTokenARN",
                "AsyncRequestTokenARN",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreateStorageLensGroupRequest" => Shape.new(
            "CreateStorageLensGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "StorageLensGroup",
                "StorageLensGroup",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "TagList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "CreationDate" => Shape.new(
            "CreationDate",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "CreationTimestamp" => Shape.new(
            "CreationTimestamp",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "Credentials" => Shape.new(
            "Credentials",
            "structure",
            [





              ShapeMember.new(
                "AccessKeyId",
                "AccessKeyId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Expiration",
                "Expiration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SecretAccessKey",
                "SecretAccessKey",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SessionToken",
                "SessionToken",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DSSEKMSFilter" => Shape.new(
            "DSSEKMSFilter",
            "structure",
            [





              ShapeMember.new(
                "KmsKeyArn",
                "NonEmptyKmsKeyArnString",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DataSourceId" => Shape.new(
            "DataSourceId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "DataSourceType" => Shape.new(
            "DataSourceType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Date" => Shape.new(
            "Date",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "Days" => Shape.new(
            "Days",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "DaysAfterInitiation" => Shape.new(
            "DaysAfterInitiation",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "DeleteAccessGrantRequest" => Shape.new(
            "DeleteAccessGrantRequest",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantId",
                "AccessGrantId",
                "uri",
                "id",
                false
              ),





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteAccessGrantsInstanceRequest" => Shape.new(
            "DeleteAccessGrantsInstanceRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteAccessGrantsInstanceResourcePolicyRequest" => Shape.new(
            "DeleteAccessGrantsInstanceResourcePolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteAccessGrantsLocationRequest" => Shape.new(
            "DeleteAccessGrantsLocationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsLocationId",
                "AccessGrantsLocationId",
                "uri",
                "id",
                false
              ),





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteAccessPointForObjectLambdaRequest" => Shape.new(
            "DeleteAccessPointForObjectLambdaRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "ObjectLambdaAccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteAccessPointPolicyForObjectLambdaRequest" => Shape.new(
            "DeleteAccessPointPolicyForObjectLambdaRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "ObjectLambdaAccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteAccessPointPolicyRequest" => Shape.new(
            "DeleteAccessPointPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "AccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteAccessPointRequest" => Shape.new(
            "DeleteAccessPointRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "AccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteAccessPointScopeRequest" => Shape.new(
            "DeleteAccessPointScopeRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "AccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketLifecycleConfigurationRequest" => Shape.new(
            "DeleteBucketLifecycleConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketPolicyRequest" => Shape.new(
            "DeleteBucketPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketReplicationRequest" => Shape.new(
            "DeleteBucketReplicationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketRequest" => Shape.new(
            "DeleteBucketRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteBucketTaggingRequest" => Shape.new(
            "DeleteBucketTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteJobTaggingRequest" => Shape.new(
            "DeleteJobTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "JobId",
                "JobId",
                "uri",
                "id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteJobTaggingResult" => Shape.new(
            "DeleteJobTaggingResult",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteMarkerReplication" => Shape.new(
            "DeleteMarkerReplication",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "DeleteMarkerReplicationStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteMarkerReplicationStatus" => Shape.new(
            "DeleteMarkerReplicationStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "DeleteMultiRegionAccessPointInput" => Shape.new(
            "DeleteMultiRegionAccessPointInput",
            "structure",
            [





              ShapeMember.new(
                "Name",
                "MultiRegionAccessPointName",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteMultiRegionAccessPointRequest" => Shape.new(
            "DeleteMultiRegionAccessPointRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ClientToken",
                "MultiRegionAccessPointClientToken",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Details",
                "DeleteMultiRegionAccessPointInput",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteMultiRegionAccessPointResult" => Shape.new(
            "DeleteMultiRegionAccessPointResult",
            "structure",
            [





              ShapeMember.new(
                "RequestTokenARN",
                "AsyncRequestTokenARN",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeletePublicAccessBlockRequest" => Shape.new(
            "DeletePublicAccessBlockRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteStorageLensConfigurationRequest" => Shape.new(
            "DeleteStorageLensConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ConfigId",
                "ConfigId",
                "uri",
                "storagelensid",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteStorageLensConfigurationTaggingRequest" => Shape.new(
            "DeleteStorageLensConfigurationTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ConfigId",
                "ConfigId",
                "uri",
                "storagelensid",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteStorageLensConfigurationTaggingResult" => Shape.new(
            "DeleteStorageLensConfigurationTaggingResult",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "DeleteStorageLensGroupRequest" => Shape.new(
            "DeleteStorageLensGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "StorageLensGroupName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DescribeJobRequest" => Shape.new(
            "DescribeJobRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "JobId",
                "JobId",
                "uri",
                "id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DescribeJobResult" => Shape.new(
            "DescribeJobResult",
            "structure",
            [





              ShapeMember.new(
                "Job",
                "JobDescriptor",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DescribeMultiRegionAccessPointOperationRequest" => Shape.new(
            "DescribeMultiRegionAccessPointOperationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "RequestTokenARN",
                "AsyncRequestTokenARN",
                "uri",
                "request_token",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DescribeMultiRegionAccessPointOperationResult" => Shape.new(
            "DescribeMultiRegionAccessPointOperationResult",
            "structure",
            [





              ShapeMember.new(
                "AsyncOperation",
                "AsyncOperation",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Destination" => Shape.new(
            "Destination",
            "structure",
            [





              ShapeMember.new(
                "AccessControlTranslation",
                "AccessControlTranslation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Account",
                "AccountId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketIdentifierString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EncryptionConfiguration",
                "EncryptionConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Metrics",
                "Metrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ReplicationTime",
                "ReplicationTime",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "ReplicationStorageClass",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DetailedStatusCodesMetrics" => Shape.new(
            "DetailedStatusCodesMetrics",
            "structure",
            [





              ShapeMember.new(
                "IsEnabled",
                "IsEnabled",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DissociateAccessGrantsIdentityCenterRequest" => Shape.new(
            "DissociateAccessGrantsIdentityCenterRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "DurationSeconds" => Shape.new(
            "DurationSeconds",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "EncryptionConfiguration" => Shape.new(
            "EncryptionConfiguration",
            "structure",
            [





              ShapeMember.new(
                "ReplicaKmsKeyID",
                "ReplicaKmsKeyID",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Endpoints" => Shape.new(
            "Endpoints",
            "map",
            [] of ShapeMember,
            nil,
            false
          ),




          "EstablishedMultiRegionAccessPointPolicy" => Shape.new(
            "EstablishedMultiRegionAccessPointPolicy",
            "structure",
            [





              ShapeMember.new(
                "Policy",
                "Policy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ExceptionMessage" => Shape.new(
            "ExceptionMessage",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Exclude" => Shape.new(
            "Exclude",
            "structure",
            [





              ShapeMember.new(
                "Buckets",
                "Buckets",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Regions",
                "Regions",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ExistingObjectReplication" => Shape.new(
            "ExistingObjectReplication",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "ExistingObjectReplicationStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ExistingObjectReplicationStatus" => Shape.new(
            "ExistingObjectReplicationStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Expiration" => Shape.new(
            "Expiration",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "ExpirationStatus" => Shape.new(
            "ExpirationStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ExpiredObjectDeleteMarker" => Shape.new(
            "ExpiredObjectDeleteMarker",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "Format" => Shape.new(
            "Format",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "FunctionArnString" => Shape.new(
            "FunctionArnString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GeneratedManifestEncryption" => Shape.new(
            "GeneratedManifestEncryption",
            "structure",
            [





              ShapeMember.new(
                "SSEKMS",
                "SSEKMSEncryption",
                nil,
                "SSE-KMS",
                false
              ),





              ShapeMember.new(
                "SSES3",
                "SSES3Encryption",
                nil,
                "SSE-S3",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GeneratedManifestFormat" => Shape.new(
            "GeneratedManifestFormat",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GetAccessGrantRequest" => Shape.new(
            "GetAccessGrantRequest",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantId",
                "AccessGrantId",
                "uri",
                "id",
                false
              ),





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessGrantResult" => Shape.new(
            "GetAccessGrantResult",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantArn",
                "AccessGrantArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantId",
                "AccessGrantId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsLocationConfiguration",
                "AccessGrantsLocationConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsLocationId",
                "AccessGrantsLocationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ApplicationArn",
                "IdentityCenterApplicationArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "GrantScope",
                "S3Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Grantee",
                "Grantee",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Permission",
                "Permission",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessGrantsInstanceForPrefixRequest" => Shape.new(
            "GetAccessGrantsInstanceForPrefixRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "S3Prefix",
                "S3Prefix",
                "querystring",
                "s3prefix",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessGrantsInstanceForPrefixResult" => Shape.new(
            "GetAccessGrantsInstanceForPrefixResult",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsInstanceArn",
                "AccessGrantsInstanceArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsInstanceId",
                "AccessGrantsInstanceId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessGrantsInstanceRequest" => Shape.new(
            "GetAccessGrantsInstanceRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessGrantsInstanceResourcePolicyRequest" => Shape.new(
            "GetAccessGrantsInstanceResourcePolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessGrantsInstanceResourcePolicyResult" => Shape.new(
            "GetAccessGrantsInstanceResourcePolicyResult",
            "structure",
            [





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Organization",
                "Organization",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Policy",
                "PolicyDocument",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessGrantsInstanceResult" => Shape.new(
            "GetAccessGrantsInstanceResult",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsInstanceArn",
                "AccessGrantsInstanceArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsInstanceId",
                "AccessGrantsInstanceId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IdentityCenterApplicationArn",
                "IdentityCenterApplicationArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IdentityCenterArn",
                "IdentityCenterArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IdentityCenterInstanceArn",
                "IdentityCenterArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessGrantsLocationRequest" => Shape.new(
            "GetAccessGrantsLocationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsLocationId",
                "AccessGrantsLocationId",
                "uri",
                "id",
                false
              ),





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessGrantsLocationResult" => Shape.new(
            "GetAccessGrantsLocationResult",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsLocationArn",
                "AccessGrantsLocationArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsLocationId",
                "AccessGrantsLocationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IAMRoleArn",
                "IAMRoleArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LocationScope",
                "S3Prefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointConfigurationForObjectLambdaRequest" => Shape.new(
            "GetAccessPointConfigurationForObjectLambdaRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "ObjectLambdaAccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointConfigurationForObjectLambdaResult" => Shape.new(
            "GetAccessPointConfigurationForObjectLambdaResult",
            "structure",
            [





              ShapeMember.new(
                "Configuration",
                "ObjectLambdaConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointForObjectLambdaRequest" => Shape.new(
            "GetAccessPointForObjectLambdaRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "ObjectLambdaAccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointForObjectLambdaResult" => Shape.new(
            "GetAccessPointForObjectLambdaResult",
            "structure",
            [





              ShapeMember.new(
                "Alias",
                "ObjectLambdaAccessPointAlias",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreationDate",
                "CreationDate",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "ObjectLambdaAccessPointName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PublicAccessBlockConfiguration",
                "PublicAccessBlockConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointPolicyForObjectLambdaRequest" => Shape.new(
            "GetAccessPointPolicyForObjectLambdaRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "ObjectLambdaAccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointPolicyForObjectLambdaResult" => Shape.new(
            "GetAccessPointPolicyForObjectLambdaResult",
            "structure",
            [





              ShapeMember.new(
                "Policy",
                "ObjectLambdaPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointPolicyRequest" => Shape.new(
            "GetAccessPointPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "AccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointPolicyResult" => Shape.new(
            "GetAccessPointPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "Policy",
                "Policy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointPolicyStatusForObjectLambdaRequest" => Shape.new(
            "GetAccessPointPolicyStatusForObjectLambdaRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "ObjectLambdaAccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointPolicyStatusForObjectLambdaResult" => Shape.new(
            "GetAccessPointPolicyStatusForObjectLambdaResult",
            "structure",
            [





              ShapeMember.new(
                "PolicyStatus",
                "PolicyStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointPolicyStatusRequest" => Shape.new(
            "GetAccessPointPolicyStatusRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "AccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointPolicyStatusResult" => Shape.new(
            "GetAccessPointPolicyStatusResult",
            "structure",
            [





              ShapeMember.new(
                "PolicyStatus",
                "PolicyStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointRequest" => Shape.new(
            "GetAccessPointRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "AccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointResult" => Shape.new(
            "GetAccessPointResult",
            "structure",
            [





              ShapeMember.new(
                "AccessPointArn",
                "S3AccessPointArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Alias",
                "Alias",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Bucket",
                "AccessPointBucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketAccountId",
                "AccountId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreationDate",
                "CreationDate",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DataSourceId",
                "DataSourceId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DataSourceType",
                "DataSourceType",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Endpoints",
                "Endpoints",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "AccessPointName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NetworkOrigin",
                "NetworkOrigin",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PublicAccessBlockConfiguration",
                "PublicAccessBlockConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "VpcConfiguration",
                "VpcConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointScopeRequest" => Shape.new(
            "GetAccessPointScopeRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "AccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetAccessPointScopeResult" => Shape.new(
            "GetAccessPointScopeResult",
            "structure",
            [





              ShapeMember.new(
                "Scope",
                "Scope",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketLifecycleConfigurationRequest" => Shape.new(
            "GetBucketLifecycleConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketLifecycleConfigurationResult" => Shape.new(
            "GetBucketLifecycleConfigurationResult",
            "structure",
            [





              ShapeMember.new(
                "Rules",
                "LifecycleRules",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketPolicyRequest" => Shape.new(
            "GetBucketPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketPolicyResult" => Shape.new(
            "GetBucketPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "Policy",
                "Policy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketReplicationRequest" => Shape.new(
            "GetBucketReplicationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketReplicationResult" => Shape.new(
            "GetBucketReplicationResult",
            "structure",
            [





              ShapeMember.new(
                "ReplicationConfiguration",
                "ReplicationConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketRequest" => Shape.new(
            "GetBucketRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketResult" => Shape.new(
            "GetBucketResult",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreationDate",
                "CreationDate",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PublicAccessBlockEnabled",
                "PublicAccessBlockEnabled",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketTaggingRequest" => Shape.new(
            "GetBucketTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketTaggingResult" => Shape.new(
            "GetBucketTaggingResult",
            "structure",
            [





              ShapeMember.new(
                "TagSet",
                "S3TagSet",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketVersioningRequest" => Shape.new(
            "GetBucketVersioningRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetBucketVersioningResult" => Shape.new(
            "GetBucketVersioningResult",
            "structure",
            [





              ShapeMember.new(
                "MFADelete",
                "MFADeleteStatus",
                nil,
                "MfaDelete",
                false
              ),





              ShapeMember.new(
                "Status",
                "BucketVersioningStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetDataAccessRequest" => Shape.new(
            "GetDataAccessRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "DurationSeconds",
                "DurationSeconds",
                "querystring",
                "durationSeconds",
                false
              ),





              ShapeMember.new(
                "Permission",
                "Permission",
                "querystring",
                "permission",
                false
              ),





              ShapeMember.new(
                "Privilege",
                "Privilege",
                "querystring",
                "privilege",
                false
              ),





              ShapeMember.new(
                "Target",
                "S3Prefix",
                "querystring",
                "target",
                false
              ),





              ShapeMember.new(
                "TargetType",
                "S3PrefixType",
                "querystring",
                "targetType",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetDataAccessResult" => Shape.new(
            "GetDataAccessResult",
            "structure",
            [





              ShapeMember.new(
                "Credentials",
                "Credentials",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Grantee",
                "Grantee",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchedGrantTarget",
                "S3Prefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetJobTaggingRequest" => Shape.new(
            "GetJobTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "JobId",
                "JobId",
                "uri",
                "id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetJobTaggingResult" => Shape.new(
            "GetJobTaggingResult",
            "structure",
            [





              ShapeMember.new(
                "Tags",
                "S3TagSet",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetMultiRegionAccessPointPolicyRequest" => Shape.new(
            "GetMultiRegionAccessPointPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "MultiRegionAccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetMultiRegionAccessPointPolicyResult" => Shape.new(
            "GetMultiRegionAccessPointPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "Policy",
                "MultiRegionAccessPointPolicyDocument",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetMultiRegionAccessPointPolicyStatusRequest" => Shape.new(
            "GetMultiRegionAccessPointPolicyStatusRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "MultiRegionAccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetMultiRegionAccessPointPolicyStatusResult" => Shape.new(
            "GetMultiRegionAccessPointPolicyStatusResult",
            "structure",
            [





              ShapeMember.new(
                "Established",
                "PolicyStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetMultiRegionAccessPointRequest" => Shape.new(
            "GetMultiRegionAccessPointRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "MultiRegionAccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetMultiRegionAccessPointResult" => Shape.new(
            "GetMultiRegionAccessPointResult",
            "structure",
            [





              ShapeMember.new(
                "AccessPoint",
                "MultiRegionAccessPointReport",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetMultiRegionAccessPointRoutesRequest" => Shape.new(
            "GetMultiRegionAccessPointRoutesRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Mrap",
                "MultiRegionAccessPointId",
                "uri",
                "mrap",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetMultiRegionAccessPointRoutesResult" => Shape.new(
            "GetMultiRegionAccessPointRoutesResult",
            "structure",
            [





              ShapeMember.new(
                "Mrap",
                "MultiRegionAccessPointId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Routes",
                "RouteList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetPublicAccessBlockOutput" => Shape.new(
            "GetPublicAccessBlockOutput",
            "structure",
            [





              ShapeMember.new(
                "PublicAccessBlockConfiguration",
                "PublicAccessBlockConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetPublicAccessBlockRequest" => Shape.new(
            "GetPublicAccessBlockRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetStorageLensConfigurationRequest" => Shape.new(
            "GetStorageLensConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ConfigId",
                "ConfigId",
                "uri",
                "storagelensid",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetStorageLensConfigurationResult" => Shape.new(
            "GetStorageLensConfigurationResult",
            "structure",
            [





              ShapeMember.new(
                "StorageLensConfiguration",
                "StorageLensConfiguration",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetStorageLensConfigurationTaggingRequest" => Shape.new(
            "GetStorageLensConfigurationTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ConfigId",
                "ConfigId",
                "uri",
                "storagelensid",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetStorageLensConfigurationTaggingResult" => Shape.new(
            "GetStorageLensConfigurationTaggingResult",
            "structure",
            [





              ShapeMember.new(
                "Tags",
                "StorageLensTags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetStorageLensGroupRequest" => Shape.new(
            "GetStorageLensGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "StorageLensGroupName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GetStorageLensGroupResult" => Shape.new(
            "GetStorageLensGroupResult",
            "structure",
            [





              ShapeMember.new(
                "StorageLensGroup",
                "StorageLensGroup",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GrantFullControl" => Shape.new(
            "GrantFullControl",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GrantRead" => Shape.new(
            "GrantRead",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GrantReadACP" => Shape.new(
            "GrantReadACP",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GrantWrite" => Shape.new(
            "GrantWrite",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GrantWriteACP" => Shape.new(
            "GrantWriteACP",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Grantee" => Shape.new(
            "Grantee",
            "structure",
            [





              ShapeMember.new(
                "GranteeIdentifier",
                "GranteeIdentifier",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "GranteeType",
                "GranteeType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "GranteeIdentifier" => Shape.new(
            "GranteeIdentifier",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "GranteeType" => Shape.new(
            "GranteeType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "IAMRoleArn" => Shape.new(
            "IAMRoleArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ID" => Shape.new(
            "ID",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "IdempotencyException" => Shape.new(
            "IdempotencyException",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "ExceptionMessage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "IdentityCenterApplicationArn" => Shape.new(
            "IdentityCenterApplicationArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "IdentityCenterArn" => Shape.new(
            "IdentityCenterArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Include" => Shape.new(
            "Include",
            "structure",
            [





              ShapeMember.new(
                "Buckets",
                "Buckets",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Regions",
                "Regions",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InternalServiceException" => Shape.new(
            "InternalServiceException",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "ExceptionMessage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidNextTokenException" => Shape.new(
            "InvalidNextTokenException",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "ExceptionMessage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "InvalidRequestException" => Shape.new(
            "InvalidRequestException",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "ExceptionMessage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "IsEnabled" => Shape.new(
            "IsEnabled",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "IsPublic" => Shape.new(
            "IsPublic",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobArn" => Shape.new(
            "JobArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobCreationTime" => Shape.new(
            "JobCreationTime",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobDescriptor" => Shape.new(
            "JobDescriptor",
            "structure",
            [





              ShapeMember.new(
                "ConfirmationRequired",
                "ConfirmationRequired",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreationTime",
                "JobCreationTime",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Description",
                "NonEmptyMaxLength256String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FailureReasons",
                "JobFailureList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "GeneratedManifestDescriptor",
                "S3GeneratedManifestDescriptor",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "JobArn",
                "JobArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "JobId",
                "JobId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Manifest",
                "JobManifest",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ManifestGenerator",
                "JobManifestGenerator",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Operation",
                "JobOperation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Priority",
                "JobPriority",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ProgressSummary",
                "JobProgressSummary",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Report",
                "JobReport",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RoleArn",
                "IAMRoleArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "JobStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StatusUpdateReason",
                "JobStatusUpdateReason",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SuspendedCause",
                "SuspendedCause",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SuspendedDate",
                "SuspendedDate",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TerminationDate",
                "JobTerminationDate",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JobFailure" => Shape.new(
            "JobFailure",
            "structure",
            [





              ShapeMember.new(
                "FailureCode",
                "JobFailureCode",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "FailureReason",
                "JobFailureReason",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JobFailureCode" => Shape.new(
            "JobFailureCode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "JobFailureList" => Shape.new(
            "JobFailureList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "JobFailure",
              nil,
              nil,
              false
            ),
            false
          ),





          "JobFailureReason" => Shape.new(
            "JobFailureReason",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobId" => Shape.new(
            "JobId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobListDescriptor" => Shape.new(
            "JobListDescriptor",
            "structure",
            [





              ShapeMember.new(
                "CreationTime",
                "JobCreationTime",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Description",
                "NonEmptyMaxLength256String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "JobId",
                "JobId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Operation",
                "OperationName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Priority",
                "JobPriority",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ProgressSummary",
                "JobProgressSummary",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "JobStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TerminationDate",
                "JobTerminationDate",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "JobListDescriptorList" => Shape.new(
            "JobListDescriptorList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "JobListDescriptor",
              nil,
              nil,
              false
            ),
            false
          ),





          "JobManifest" => Shape.new(
            "JobManifest",
            "structure",
            [





              ShapeMember.new(
                "Location",
                "JobManifestLocation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Spec",
                "JobManifestSpec",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "JobManifestFieldList" => Shape.new(
            "JobManifestFieldList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "JobManifestFieldName",
              nil,
              nil,
              false
            ),
            false
          ),





          "JobManifestFieldName" => Shape.new(
            "JobManifestFieldName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobManifestFormat" => Shape.new(
            "JobManifestFormat",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobManifestGenerator" => Shape.new(
            "JobManifestGenerator",
            "structure",
            [





              ShapeMember.new(
                "S3JobManifestGenerator",
                "S3JobManifestGenerator",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JobManifestGeneratorFilter" => Shape.new(
            "JobManifestGeneratorFilter",
            "structure",
            [





              ShapeMember.new(
                "CreatedAfter",
                "ObjectCreationTime",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedBefore",
                "ObjectCreationTime",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "EligibleForReplication",
                "Boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "KeyNameConstraint",
                "KeyNameConstraint",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchAnyObjectEncryption",
                "ObjectEncryptionFilterList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchAnyStorageClass",
                "StorageClassList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectReplicationStatuses",
                "ReplicationStatusFilterList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectSizeGreaterThanBytes",
                "ObjectSizeGreaterThanBytes",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectSizeLessThanBytes",
                "ObjectSizeLessThanBytes",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JobManifestLocation" => Shape.new(
            "JobManifestLocation",
            "structure",
            [





              ShapeMember.new(
                "ETag",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectArn",
                "S3KeyArnString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectVersionId",
                "S3ObjectVersionId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JobManifestSpec" => Shape.new(
            "JobManifestSpec",
            "structure",
            [





              ShapeMember.new(
                "Fields",
                "JobManifestFieldList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Format",
                "JobManifestFormat",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JobNumberOfTasksFailed" => Shape.new(
            "JobNumberOfTasksFailed",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobNumberOfTasksSucceeded" => Shape.new(
            "JobNumberOfTasksSucceeded",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobOperation" => Shape.new(
            "JobOperation",
            "structure",
            [





              ShapeMember.new(
                "LambdaInvoke",
                "LambdaInvokeOperation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3ComputeObjectChecksum",
                "S3ComputeObjectChecksumOperation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3DeleteObjectTagging",
                "S3DeleteObjectTaggingOperation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3InitiateRestoreObject",
                "S3InitiateRestoreObjectOperation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3PutObjectAcl",
                "S3SetObjectAclOperation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3PutObjectCopy",
                "S3CopyObjectOperation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3PutObjectLegalHold",
                "S3SetObjectLegalHoldOperation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3PutObjectRetention",
                "S3SetObjectRetentionOperation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3PutObjectTagging",
                "S3SetObjectTaggingOperation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3ReplicateObject",
                "S3ReplicateObjectOperation",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JobPriority" => Shape.new(
            "JobPriority",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobProgressSummary" => Shape.new(
            "JobProgressSummary",
            "structure",
            [





              ShapeMember.new(
                "NumberOfTasksFailed",
                "JobNumberOfTasksFailed",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NumberOfTasksSucceeded",
                "JobNumberOfTasksSucceeded",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Timers",
                "JobTimers",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TotalNumberOfTasks",
                "JobTotalNumberOfTasks",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JobReport" => Shape.new(
            "JobReport",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "S3BucketArnString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Enabled",
                "Boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Format",
                "JobReportFormat",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "ReportPrefixString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ReportScope",
                "JobReportScope",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JobReportFormat" => Shape.new(
            "JobReportFormat",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobReportScope" => Shape.new(
            "JobReportScope",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobStatus" => Shape.new(
            "JobStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobStatusException" => Shape.new(
            "JobStatusException",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "ExceptionMessage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "JobStatusList" => Shape.new(
            "JobStatusList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "JobStatus",
              nil,
              nil,
              false
            ),
            false
          ),





          "JobStatusUpdateReason" => Shape.new(
            "JobStatusUpdateReason",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobTerminationDate" => Shape.new(
            "JobTerminationDate",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobTimeInStateSeconds" => Shape.new(
            "JobTimeInStateSeconds",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "JobTimers" => Shape.new(
            "JobTimers",
            "structure",
            [





              ShapeMember.new(
                "ElapsedTimeInActiveSeconds",
                "JobTimeInStateSeconds",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "JobTotalNumberOfTasks" => Shape.new(
            "JobTotalNumberOfTasks",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "KeyNameConstraint" => Shape.new(
            "KeyNameConstraint",
            "structure",
            [





              ShapeMember.new(
                "MatchAnyPrefix",
                "NonEmptyMaxLength1024StringList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchAnySubstring",
                "NonEmptyMaxLength1024StringList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchAnySuffix",
                "NonEmptyMaxLength1024StringList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "KmsKeyArnString" => Shape.new(
            "KmsKeyArnString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "LambdaInvokeOperation" => Shape.new(
            "LambdaInvokeOperation",
            "structure",
            [





              ShapeMember.new(
                "FunctionArn",
                "FunctionArnString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "InvocationSchemaVersion",
                "NonEmptyMaxLength64String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "UserArguments",
                "UserArguments",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "LifecycleConfiguration" => Shape.new(
            "LifecycleConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Rules",
                "LifecycleRules",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "LifecycleExpiration" => Shape.new(
            "LifecycleExpiration",
            "structure",
            [





              ShapeMember.new(
                "Date",
                "Date",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Days",
                "Days",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ExpiredObjectDeleteMarker",
                "ExpiredObjectDeleteMarker",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "LifecycleRule" => Shape.new(
            "LifecycleRule",
            "structure",
            [





              ShapeMember.new(
                "AbortIncompleteMultipartUpload",
                "AbortIncompleteMultipartUpload",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Expiration",
                "LifecycleExpiration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Filter",
                "LifecycleRuleFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ID",
                "ID",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NoncurrentVersionExpiration",
                "NoncurrentVersionExpiration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NoncurrentVersionTransitions",
                "NoncurrentVersionTransitionList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "ExpirationStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Transitions",
                "TransitionList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "LifecycleRuleAndOperator" => Shape.new(
            "LifecycleRuleAndOperator",
            "structure",
            [





              ShapeMember.new(
                "ObjectSizeGreaterThan",
                "ObjectSizeGreaterThanBytes",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectSizeLessThan",
                "ObjectSizeLessThanBytes",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "S3TagSet",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "LifecycleRuleFilter" => Shape.new(
            "LifecycleRuleFilter",
            "structure",
            [





              ShapeMember.new(
                "And",
                "LifecycleRuleAndOperator",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectSizeGreaterThan",
                "ObjectSizeGreaterThanBytes",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectSizeLessThan",
                "ObjectSizeLessThanBytes",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tag",
                "S3Tag",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "LifecycleRules" => Shape.new(
            "LifecycleRules",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "LifecycleRule",
              nil,
              "Rule",
              false
            ),
            false
          ),





          "ListAccessGrantEntry" => Shape.new(
            "ListAccessGrantEntry",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantArn",
                "AccessGrantArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantId",
                "AccessGrantId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsLocationConfiguration",
                "AccessGrantsLocationConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsLocationId",
                "AccessGrantsLocationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ApplicationArn",
                "IdentityCenterApplicationArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "GrantScope",
                "S3Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Grantee",
                "Grantee",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Permission",
                "Permission",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessGrantsInstanceEntry" => Shape.new(
            "ListAccessGrantsInstanceEntry",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsInstanceArn",
                "AccessGrantsInstanceArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsInstanceId",
                "AccessGrantsInstanceId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IdentityCenterApplicationArn",
                "IdentityCenterApplicationArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IdentityCenterArn",
                "IdentityCenterArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IdentityCenterInstanceArn",
                "IdentityCenterArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessGrantsInstancesRequest" => Shape.new(
            "ListAccessGrantsInstancesRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxResults",
                false
              ),





              ShapeMember.new(
                "NextToken",
                "ContinuationToken",
                "querystring",
                "nextToken",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessGrantsInstancesResult" => Shape.new(
            "ListAccessGrantsInstancesResult",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsInstancesList",
                "AccessGrantsInstancesList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextToken",
                "ContinuationToken",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessGrantsLocationsEntry" => Shape.new(
            "ListAccessGrantsLocationsEntry",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsLocationArn",
                "AccessGrantsLocationArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsLocationId",
                "AccessGrantsLocationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IAMRoleArn",
                "IAMRoleArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LocationScope",
                "S3Prefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessGrantsLocationsRequest" => Shape.new(
            "ListAccessGrantsLocationsRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "LocationScope",
                "S3Prefix",
                "querystring",
                "locationscope",
                false
              ),





              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxResults",
                false
              ),





              ShapeMember.new(
                "NextToken",
                "ContinuationToken",
                "querystring",
                "nextToken",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessGrantsLocationsResult" => Shape.new(
            "ListAccessGrantsLocationsResult",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsLocationsList",
                "AccessGrantsLocationsList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextToken",
                "ContinuationToken",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessGrantsRequest" => Shape.new(
            "ListAccessGrantsRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ApplicationArn",
                "IdentityCenterApplicationArn",
                "querystring",
                "application_arn",
                false
              ),





              ShapeMember.new(
                "GrantScope",
                "S3Prefix",
                "querystring",
                "grantscope",
                false
              ),





              ShapeMember.new(
                "GranteeIdentifier",
                "GranteeIdentifier",
                "querystring",
                "granteeidentifier",
                false
              ),





              ShapeMember.new(
                "GranteeType",
                "GranteeType",
                "querystring",
                "granteetype",
                false
              ),





              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxResults",
                false
              ),





              ShapeMember.new(
                "NextToken",
                "ContinuationToken",
                "querystring",
                "nextToken",
                false
              ),





              ShapeMember.new(
                "Permission",
                "Permission",
                "querystring",
                "permission",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessGrantsResult" => Shape.new(
            "ListAccessGrantsResult",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsList",
                "AccessGrantsList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextToken",
                "ContinuationToken",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessPointsForDirectoryBucketsRequest" => Shape.new(
            "ListAccessPointsForDirectoryBucketsRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "DirectoryBucket",
                "BucketName",
                "querystring",
                "directoryBucket",
                false
              ),





              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxResults",
                false
              ),





              ShapeMember.new(
                "NextToken",
                "NonEmptyMaxLength1024String",
                "querystring",
                "nextToken",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessPointsForDirectoryBucketsResult" => Shape.new(
            "ListAccessPointsForDirectoryBucketsResult",
            "structure",
            [





              ShapeMember.new(
                "AccessPointList",
                "AccessPointList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextToken",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessPointsForObjectLambdaRequest" => Shape.new(
            "ListAccessPointsForObjectLambdaRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxResults",
                false
              ),





              ShapeMember.new(
                "NextToken",
                "NonEmptyMaxLength1024String",
                "querystring",
                "nextToken",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessPointsForObjectLambdaResult" => Shape.new(
            "ListAccessPointsForObjectLambdaResult",
            "structure",
            [





              ShapeMember.new(
                "NextToken",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectLambdaAccessPointList",
                "ObjectLambdaAccessPointList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessPointsRequest" => Shape.new(
            "ListAccessPointsRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "querystring",
                "bucket",
                false
              ),





              ShapeMember.new(
                "DataSourceId",
                "DataSourceId",
                "querystring",
                "dataSourceId",
                false
              ),





              ShapeMember.new(
                "DataSourceType",
                "DataSourceType",
                "querystring",
                "dataSourceType",
                false
              ),





              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxResults",
                false
              ),





              ShapeMember.new(
                "NextToken",
                "NonEmptyMaxLength1024String",
                "querystring",
                "nextToken",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListAccessPointsResult" => Shape.new(
            "ListAccessPointsResult",
            "structure",
            [





              ShapeMember.new(
                "AccessPointList",
                "AccessPointList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextToken",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListCallerAccessGrantsEntry" => Shape.new(
            "ListCallerAccessGrantsEntry",
            "structure",
            [





              ShapeMember.new(
                "ApplicationArn",
                "IdentityCenterApplicationArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "GrantScope",
                "S3Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Permission",
                "Permission",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListCallerAccessGrantsRequest" => Shape.new(
            "ListCallerAccessGrantsRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "AllowedByApplication",
                "Boolean",
                "querystring",
                "allowedByApplication",
                false
              ),





              ShapeMember.new(
                "GrantScope",
                "S3Prefix",
                "querystring",
                "grantscope",
                false
              ),





              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxResults",
                false
              ),





              ShapeMember.new(
                "NextToken",
                "ContinuationToken",
                "querystring",
                "nextToken",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListCallerAccessGrantsResult" => Shape.new(
            "ListCallerAccessGrantsResult",
            "structure",
            [





              ShapeMember.new(
                "CallerAccessGrantsList",
                "CallerAccessGrantsList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextToken",
                "ContinuationToken",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListJobsRequest" => Shape.new(
            "ListJobsRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "JobStatuses",
                "JobStatusList",
                "querystring",
                "jobStatuses",
                false
              ),





              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxResults",
                false
              ),





              ShapeMember.new(
                "NextToken",
                "StringForNextToken",
                "querystring",
                "nextToken",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListJobsResult" => Shape.new(
            "ListJobsResult",
            "structure",
            [





              ShapeMember.new(
                "Jobs",
                "JobListDescriptorList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextToken",
                "StringForNextToken",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListMultiRegionAccessPointsRequest" => Shape.new(
            "ListMultiRegionAccessPointsRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxResults",
                false
              ),





              ShapeMember.new(
                "NextToken",
                "NonEmptyMaxLength1024String",
                "querystring",
                "nextToken",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListMultiRegionAccessPointsResult" => Shape.new(
            "ListMultiRegionAccessPointsResult",
            "structure",
            [





              ShapeMember.new(
                "AccessPoints",
                "MultiRegionAccessPointReportList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NextToken",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListRegionalBucketsRequest" => Shape.new(
            "ListRegionalBucketsRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "MaxResults",
                "MaxResults",
                "querystring",
                "maxResults",
                false
              ),





              ShapeMember.new(
                "NextToken",
                "NonEmptyMaxLength1024String",
                "querystring",
                "nextToken",
                false
              ),





              ShapeMember.new(
                "OutpostId",
                "NonEmptyMaxLength64String",
                "header",
                "x-amz-outpost-id",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListRegionalBucketsResult" => Shape.new(
            "ListRegionalBucketsResult",
            "structure",
            [





              ShapeMember.new(
                "NextToken",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RegionalBucketList",
                "RegionalBucketList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListStorageLensConfigurationEntry" => Shape.new(
            "ListStorageLensConfigurationEntry",
            "structure",
            [





              ShapeMember.new(
                "HomeRegion",
                "S3AWSRegion",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "ConfigId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsEnabled",
                "IsEnabled",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageLensArn",
                "StorageLensArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListStorageLensConfigurationsRequest" => Shape.new(
            "ListStorageLensConfigurationsRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "NextToken",
                "ContinuationToken",
                "querystring",
                "nextToken",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListStorageLensConfigurationsResult" => Shape.new(
            "ListStorageLensConfigurationsResult",
            "structure",
            [





              ShapeMember.new(
                "NextToken",
                "ContinuationToken",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageLensConfigurationList",
                "StorageLensConfigurationList",
                nil,
                "StorageLensConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListStorageLensGroupEntry" => Shape.new(
            "ListStorageLensGroupEntry",
            "structure",
            [





              ShapeMember.new(
                "HomeRegion",
                "S3AWSRegion",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "StorageLensGroupName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageLensGroupArn",
                "StorageLensGroupArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListStorageLensGroupsRequest" => Shape.new(
            "ListStorageLensGroupsRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "NextToken",
                "ContinuationToken",
                "querystring",
                "nextToken",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListStorageLensGroupsResult" => Shape.new(
            "ListStorageLensGroupsResult",
            "structure",
            [





              ShapeMember.new(
                "NextToken",
                "ContinuationToken",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageLensGroupList",
                "StorageLensGroupList",
                nil,
                "StorageLensGroup",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListTagsForResourceRequest" => Shape.new(
            "ListTagsForResourceRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ResourceArn",
                "S3ResourceArn",
                "uri",
                "resourceArn",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ListTagsForResourceResult" => Shape.new(
            "ListTagsForResourceResult",
            "structure",
            [





              ShapeMember.new(
                "Tags",
                "TagList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Location" => Shape.new(
            "Location",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MFA" => Shape.new(
            "MFA",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MFADelete" => Shape.new(
            "MFADelete",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MFADeleteStatus" => Shape.new(
            "MFADeleteStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ManifestPrefixString" => Shape.new(
            "ManifestPrefixString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "MatchAnyPrefix" => Shape.new(
            "MatchAnyPrefix",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Prefix",
              nil,
              "Prefix",
              false
            ),
            false
          ),









          "MatchAnySuffix" => Shape.new(
            "MatchAnySuffix",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Suffix",
              nil,
              "Suffix",
              false
            ),
            false
          ),









          "MatchAnyTag" => Shape.new(
            "MatchAnyTag",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "S3Tag",
              nil,
              "Tag",
              false
            ),
            false
          ),





          "MatchObjectAge" => Shape.new(
            "MatchObjectAge",
            "structure",
            [





              ShapeMember.new(
                "DaysGreaterThan",
                "ObjectAgeValue",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DaysLessThan",
                "ObjectAgeValue",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MatchObjectSize" => Shape.new(
            "MatchObjectSize",
            "structure",
            [





              ShapeMember.new(
                "BytesGreaterThan",
                "ObjectSizeValue",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BytesLessThan",
                "ObjectSizeValue",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MaxLength1024String" => Shape.new(
            "MaxLength1024String",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MaxResults" => Shape.new(
            "MaxResults",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "Metrics" => Shape.new(
            "Metrics",
            "structure",
            [





              ShapeMember.new(
                "EventThreshold",
                "ReplicationTimeValue",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "MetricsStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MetricsStatus" => Shape.new(
            "MetricsStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MinStorageBytesPercentage" => Shape.new(
            "MinStorageBytesPercentage",
            "double",
            [] of ShapeMember,
            nil,
            false
          ),




          "Minutes" => Shape.new(
            "Minutes",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "MultiRegionAccessPointAlias" => Shape.new(
            "MultiRegionAccessPointAlias",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MultiRegionAccessPointClientToken" => Shape.new(
            "MultiRegionAccessPointClientToken",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MultiRegionAccessPointId" => Shape.new(
            "MultiRegionAccessPointId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MultiRegionAccessPointName" => Shape.new(
            "MultiRegionAccessPointName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MultiRegionAccessPointPolicyDocument" => Shape.new(
            "MultiRegionAccessPointPolicyDocument",
            "structure",
            [





              ShapeMember.new(
                "Established",
                "EstablishedMultiRegionAccessPointPolicy",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Proposed",
                "ProposedMultiRegionAccessPointPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MultiRegionAccessPointRegionalResponse" => Shape.new(
            "MultiRegionAccessPointRegionalResponse",
            "structure",
            [





              ShapeMember.new(
                "Name",
                "RegionName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequestStatus",
                "AsyncRequestStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "MultiRegionAccessPointRegionalResponseList" => Shape.new(
            "MultiRegionAccessPointRegionalResponseList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "MultiRegionAccessPointRegionalResponse",
              nil,
              "Region",
              false
            ),
            false
          ),





          "MultiRegionAccessPointReport" => Shape.new(
            "MultiRegionAccessPointReport",
            "structure",
            [





              ShapeMember.new(
                "Alias",
                "MultiRegionAccessPointAlias",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "MultiRegionAccessPointName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PublicAccessBlock",
                "PublicAccessBlockConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Regions",
                "RegionReportList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "MultiRegionAccessPointStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "MultiRegionAccessPointReportList" => Shape.new(
            "MultiRegionAccessPointReportList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "MultiRegionAccessPointReport",
              nil,
              "AccessPoint",
              false
            ),
            false
          ),





          "MultiRegionAccessPointRoute" => Shape.new(
            "MultiRegionAccessPointRoute",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Region",
                "RegionName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TrafficDialPercentage",
                "TrafficDialPercentage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "MultiRegionAccessPointStatus" => Shape.new(
            "MultiRegionAccessPointStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "MultiRegionAccessPointsAsyncResponse" => Shape.new(
            "MultiRegionAccessPointsAsyncResponse",
            "structure",
            [





              ShapeMember.new(
                "Regions",
                "MultiRegionAccessPointRegionalResponseList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NetworkOrigin" => Shape.new(
            "NetworkOrigin",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "NoSuchPublicAccessBlockConfiguration" => Shape.new(
            "NoSuchPublicAccessBlockConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "NoSuchPublicAccessBlockConfigurationMessage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoSuchPublicAccessBlockConfigurationMessage" => Shape.new(
            "NoSuchPublicAccessBlockConfigurationMessage",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "NonEmptyKmsKeyArnString" => Shape.new(
            "NonEmptyKmsKeyArnString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "NonEmptyMaxLength1024String" => Shape.new(
            "NonEmptyMaxLength1024String",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "NonEmptyMaxLength1024StringList" => Shape.new(
            "NonEmptyMaxLength1024StringList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "NonEmptyMaxLength1024String",
              nil,
              nil,
              false
            ),
            false
          ),





          "NonEmptyMaxLength2048String" => Shape.new(
            "NonEmptyMaxLength2048String",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "NonEmptyMaxLength256String" => Shape.new(
            "NonEmptyMaxLength256String",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "NonEmptyMaxLength64String" => Shape.new(
            "NonEmptyMaxLength64String",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "NoncurrentVersionCount" => Shape.new(
            "NoncurrentVersionCount",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "NoncurrentVersionExpiration" => Shape.new(
            "NoncurrentVersionExpiration",
            "structure",
            [





              ShapeMember.new(
                "NewerNoncurrentVersions",
                "NoncurrentVersionCount",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NoncurrentDays",
                "Days",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NoncurrentVersionTransition" => Shape.new(
            "NoncurrentVersionTransition",
            "structure",
            [





              ShapeMember.new(
                "NoncurrentDays",
                "Days",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "TransitionStorageClass",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "NoncurrentVersionTransitionList" => Shape.new(
            "NoncurrentVersionTransitionList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "NoncurrentVersionTransition",
              nil,
              "NoncurrentVersionTransition",
              false
            ),
            false
          ),





          "NotFoundException" => Shape.new(
            "NotFoundException",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "ExceptionMessage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "NotSSEFilter" => Shape.new(
            "NotSSEFilter",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectAgeValue" => Shape.new(
            "ObjectAgeValue",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectCreationTime" => Shape.new(
            "ObjectCreationTime",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectEncryptionFilter" => Shape.new(
            "ObjectEncryptionFilter",
            "structure",
            [





              ShapeMember.new(
                "DSSEKMS",
                "DSSEKMSFilter",
                nil,
                "DSSE-KMS",
                false
              ),





              ShapeMember.new(
                "NOTSSE",
                "NotSSEFilter",
                nil,
                "NOT-SSE",
                false
              ),





              ShapeMember.new(
                "SSEC",
                "SSECFilter",
                nil,
                "SSE-C",
                false
              ),





              ShapeMember.new(
                "SSEKMS",
                "SSEKMSFilter",
                nil,
                "SSE-KMS",
                false
              ),





              ShapeMember.new(
                "SSES3",
                "SSES3Filter",
                nil,
                "SSE-S3",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "ObjectEncryptionFilterList" => Shape.new(
            "ObjectEncryptionFilterList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ObjectEncryptionFilter",
              nil,
              "ObjectEncryption",
              false
            ),
            false
          ),





          "ObjectLambdaAccessPoint" => Shape.new(
            "ObjectLambdaAccessPoint",
            "structure",
            [





              ShapeMember.new(
                "Alias",
                "ObjectLambdaAccessPointAlias",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "ObjectLambdaAccessPointName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectLambdaAccessPointArn",
                "ObjectLambdaAccessPointArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectLambdaAccessPointAlias" => Shape.new(
            "ObjectLambdaAccessPointAlias",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "ObjectLambdaAccessPointAliasStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Value",
                "ObjectLambdaAccessPointAliasValue",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectLambdaAccessPointAliasStatus" => Shape.new(
            "ObjectLambdaAccessPointAliasStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectLambdaAccessPointAliasValue" => Shape.new(
            "ObjectLambdaAccessPointAliasValue",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectLambdaAccessPointArn" => Shape.new(
            "ObjectLambdaAccessPointArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "ObjectLambdaAccessPointList" => Shape.new(
            "ObjectLambdaAccessPointList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ObjectLambdaAccessPoint",
              nil,
              "ObjectLambdaAccessPoint",
              false
            ),
            false
          ),





          "ObjectLambdaAccessPointName" => Shape.new(
            "ObjectLambdaAccessPointName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectLambdaAllowedFeature" => Shape.new(
            "ObjectLambdaAllowedFeature",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "ObjectLambdaAllowedFeaturesList" => Shape.new(
            "ObjectLambdaAllowedFeaturesList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ObjectLambdaAllowedFeature",
              nil,
              "AllowedFeature",
              false
            ),
            false
          ),





          "ObjectLambdaConfiguration" => Shape.new(
            "ObjectLambdaConfiguration",
            "structure",
            [





              ShapeMember.new(
                "AllowedFeatures",
                "ObjectLambdaAllowedFeaturesList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CloudWatchMetricsEnabled",
                "Boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SupportingAccessPoint",
                "ObjectLambdaSupportingAccessPointArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TransformationConfigurations",
                "ObjectLambdaTransformationConfigurationsList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectLambdaContentTransformation" => Shape.new(
            "ObjectLambdaContentTransformation",
            "structure",
            [





              ShapeMember.new(
                "AwsLambda",
                "AwsLambdaTransformation",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectLambdaPolicy" => Shape.new(
            "ObjectLambdaPolicy",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectLambdaSupportingAccessPointArn" => Shape.new(
            "ObjectLambdaSupportingAccessPointArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectLambdaTransformationConfiguration" => Shape.new(
            "ObjectLambdaTransformationConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Actions",
                "ObjectLambdaTransformationConfigurationActionsList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContentTransformation",
                "ObjectLambdaContentTransformation",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ObjectLambdaTransformationConfigurationAction" => Shape.new(
            "ObjectLambdaTransformationConfigurationAction",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "ObjectLambdaTransformationConfigurationActionsList" => Shape.new(
            "ObjectLambdaTransformationConfigurationActionsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ObjectLambdaTransformationConfigurationAction",
              nil,
              "Action",
              false
            ),
            false
          ),









          "ObjectLambdaTransformationConfigurationsList" => Shape.new(
            "ObjectLambdaTransformationConfigurationsList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ObjectLambdaTransformationConfiguration",
              nil,
              "TransformationConfiguration",
              false
            ),
            false
          ),





          "ObjectLockEnabledForBucket" => Shape.new(
            "ObjectLockEnabledForBucket",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectSizeGreaterThanBytes" => Shape.new(
            "ObjectSizeGreaterThanBytes",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectSizeLessThanBytes" => Shape.new(
            "ObjectSizeLessThanBytes",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "ObjectSizeValue" => Shape.new(
            "ObjectSizeValue",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "OperationName" => Shape.new(
            "OperationName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Organization" => Shape.new(
            "Organization",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OutputSchemaVersion" => Shape.new(
            "OutputSchemaVersion",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "OwnerOverride" => Shape.new(
            "OwnerOverride",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Permission" => Shape.new(
            "Permission",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Policy" => Shape.new(
            "Policy",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "PolicyDocument" => Shape.new(
            "PolicyDocument",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "PolicyStatus" => Shape.new(
            "PolicyStatus",
            "structure",
            [





              ShapeMember.new(
                "IsPublic",
                "IsPublic",
                nil,
                "IsPublic",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "Prefix" => Shape.new(
            "Prefix",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "PrefixLevel" => Shape.new(
            "PrefixLevel",
            "structure",
            [





              ShapeMember.new(
                "StorageMetrics",
                "PrefixLevelStorageMetrics",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PrefixLevelStorageMetrics" => Shape.new(
            "PrefixLevelStorageMetrics",
            "structure",
            [





              ShapeMember.new(
                "IsEnabled",
                "IsEnabled",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SelectionCriteria",
                "SelectionCriteria",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "PrefixesList" => Shape.new(
            "PrefixesList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Prefix",
              nil,
              "Prefix",
              false
            ),
            false
          ),





          "Priority" => Shape.new(
            "Priority",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "Privilege" => Shape.new(
            "Privilege",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ProposedMultiRegionAccessPointPolicy" => Shape.new(
            "ProposedMultiRegionAccessPointPolicy",
            "structure",
            [





              ShapeMember.new(
                "Policy",
                "Policy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PublicAccessBlockConfiguration" => Shape.new(
            "PublicAccessBlockConfiguration",
            "structure",
            [





              ShapeMember.new(
                "BlockPublicAcls",
                "Setting",
                nil,
                "BlockPublicAcls",
                false
              ),





              ShapeMember.new(
                "BlockPublicPolicy",
                "Setting",
                nil,
                "BlockPublicPolicy",
                false
              ),





              ShapeMember.new(
                "IgnorePublicAcls",
                "Setting",
                nil,
                "IgnorePublicAcls",
                false
              ),





              ShapeMember.new(
                "RestrictPublicBuckets",
                "Setting",
                nil,
                "RestrictPublicBuckets",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PublicAccessBlockEnabled" => Shape.new(
            "PublicAccessBlockEnabled",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "PutAccessGrantsInstanceResourcePolicyRequest" => Shape.new(
            "PutAccessGrantsInstanceResourcePolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Organization",
                "Organization",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Policy",
                "PolicyDocument",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutAccessGrantsInstanceResourcePolicyResult" => Shape.new(
            "PutAccessGrantsInstanceResourcePolicyResult",
            "structure",
            [





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Organization",
                "Organization",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Policy",
                "PolicyDocument",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutAccessPointConfigurationForObjectLambdaRequest" => Shape.new(
            "PutAccessPointConfigurationForObjectLambdaRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Configuration",
                "ObjectLambdaConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "ObjectLambdaAccessPointName",
                "uri",
                "name",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutAccessPointPolicyForObjectLambdaRequest" => Shape.new(
            "PutAccessPointPolicyForObjectLambdaRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "ObjectLambdaAccessPointName",
                "uri",
                "name",
                false
              ),





              ShapeMember.new(
                "Policy",
                "ObjectLambdaPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutAccessPointPolicyRequest" => Shape.new(
            "PutAccessPointPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "AccessPointName",
                "uri",
                "name",
                false
              ),





              ShapeMember.new(
                "Policy",
                "Policy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutAccessPointScopeRequest" => Shape.new(
            "PutAccessPointScopeRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "AccessPointName",
                "uri",
                "name",
                false
              ),





              ShapeMember.new(
                "Scope",
                "Scope",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketLifecycleConfigurationRequest" => Shape.new(
            "PutBucketLifecycleConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),





              ShapeMember.new(
                "LifecycleConfiguration",
                "LifecycleConfiguration",
                nil,
                "LifecycleConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketPolicyRequest" => Shape.new(
            "PutBucketPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),





              ShapeMember.new(
                "ConfirmRemoveSelfBucketAccess",
                "ConfirmRemoveSelfBucketAccess",
                "header",
                "x-amz-confirm-remove-self-bucket-access",
                false
              ),





              ShapeMember.new(
                "Policy",
                "Policy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketReplicationRequest" => Shape.new(
            "PutBucketReplicationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),





              ShapeMember.new(
                "ReplicationConfiguration",
                "ReplicationConfiguration",
                nil,
                "ReplicationConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketTaggingRequest" => Shape.new(
            "PutBucketTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),





              ShapeMember.new(
                "Tagging",
                "Tagging",
                nil,
                "Tagging",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutBucketVersioningRequest" => Shape.new(
            "PutBucketVersioningRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Bucket",
                "BucketName",
                "uri",
                "name",
                false
              ),





              ShapeMember.new(
                "MFA",
                "MFA",
                "header",
                "x-amz-mfa",
                false
              ),





              ShapeMember.new(
                "VersioningConfiguration",
                "VersioningConfiguration",
                nil,
                "VersioningConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutJobTaggingRequest" => Shape.new(
            "PutJobTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "JobId",
                "JobId",
                "uri",
                "id",
                false
              ),





              ShapeMember.new(
                "Tags",
                "S3TagSet",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutJobTaggingResult" => Shape.new(
            "PutJobTaggingResult",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "PutMultiRegionAccessPointPolicyInput" => Shape.new(
            "PutMultiRegionAccessPointPolicyInput",
            "structure",
            [





              ShapeMember.new(
                "Name",
                "MultiRegionAccessPointName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Policy",
                "Policy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutMultiRegionAccessPointPolicyRequest" => Shape.new(
            "PutMultiRegionAccessPointPolicyRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ClientToken",
                "MultiRegionAccessPointClientToken",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Details",
                "PutMultiRegionAccessPointPolicyInput",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutMultiRegionAccessPointPolicyResult" => Shape.new(
            "PutMultiRegionAccessPointPolicyResult",
            "structure",
            [





              ShapeMember.new(
                "RequestTokenARN",
                "AsyncRequestTokenARN",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutPublicAccessBlockRequest" => Shape.new(
            "PutPublicAccessBlockRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "PublicAccessBlockConfiguration",
                "PublicAccessBlockConfiguration",
                nil,
                "PublicAccessBlockConfiguration",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutStorageLensConfigurationRequest" => Shape.new(
            "PutStorageLensConfigurationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ConfigId",
                "ConfigId",
                "uri",
                "storagelensid",
                false
              ),





              ShapeMember.new(
                "StorageLensConfiguration",
                "StorageLensConfiguration",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "StorageLensTags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutStorageLensConfigurationTaggingRequest" => Shape.new(
            "PutStorageLensConfigurationTaggingRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ConfigId",
                "ConfigId",
                "uri",
                "storagelensid",
                false
              ),





              ShapeMember.new(
                "Tags",
                "StorageLensTags",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "PutStorageLensConfigurationTaggingResult" => Shape.new(
            "PutStorageLensConfigurationTaggingResult",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "Region" => Shape.new(
            "Region",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketAccountId",
                "AccountId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "RegionCreationList" => Shape.new(
            "RegionCreationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Region",
              nil,
              "Region",
              false
            ),
            false
          ),





          "RegionName" => Shape.new(
            "RegionName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RegionReport" => Shape.new(
            "RegionReport",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketAccountId",
                "AccountId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Region",
                "RegionName",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "RegionReportList" => Shape.new(
            "RegionReportList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "RegionReport",
              nil,
              "Region",
              false
            ),
            false
          ),





          "RegionalBucket" => Shape.new(
            "RegionalBucket",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketArn",
                "S3RegionalBucketArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreationDate",
                "CreationDate",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OutpostId",
                "NonEmptyMaxLength64String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PublicAccessBlockEnabled",
                "PublicAccessBlockEnabled",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "RegionalBucketList" => Shape.new(
            "RegionalBucketList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "RegionalBucket",
              nil,
              "RegionalBucket",
              false
            ),
            false
          ),









          "Regions" => Shape.new(
            "Regions",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "S3AWSRegion",
              nil,
              "Region",
              false
            ),
            false
          ),





          "ReplicaKmsKeyID" => Shape.new(
            "ReplicaKmsKeyID",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ReplicaModifications" => Shape.new(
            "ReplicaModifications",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "ReplicaModificationsStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReplicaModificationsStatus" => Shape.new(
            "ReplicaModificationsStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ReplicationConfiguration" => Shape.new(
            "ReplicationConfiguration",
            "structure",
            [





              ShapeMember.new(
                "Role",
                "Role",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Rules",
                "ReplicationRules",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReplicationRule" => Shape.new(
            "ReplicationRule",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "BucketIdentifierString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DeleteMarkerReplication",
                "DeleteMarkerReplication",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Destination",
                "Destination",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ExistingObjectReplication",
                "ExistingObjectReplication",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Filter",
                "ReplicationRuleFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ID",
                "ID",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Priority",
                "Priority",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SourceSelectionCriteria",
                "SourceSelectionCriteria",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "ReplicationRuleStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReplicationRuleAndOperator" => Shape.new(
            "ReplicationRuleAndOperator",
            "structure",
            [





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tags",
                "S3TagSet",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReplicationRuleFilter" => Shape.new(
            "ReplicationRuleFilter",
            "structure",
            [





              ShapeMember.new(
                "And",
                "ReplicationRuleAndOperator",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Tag",
                "S3Tag",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReplicationRuleStatus" => Shape.new(
            "ReplicationRuleStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "ReplicationRules" => Shape.new(
            "ReplicationRules",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ReplicationRule",
              nil,
              "Rule",
              false
            ),
            false
          ),





          "ReplicationStatus" => Shape.new(
            "ReplicationStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "ReplicationStatusFilterList" => Shape.new(
            "ReplicationStatusFilterList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ReplicationStatus",
              nil,
              nil,
              false
            ),
            false
          ),





          "ReplicationStorageClass" => Shape.new(
            "ReplicationStorageClass",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ReplicationTime" => Shape.new(
            "ReplicationTime",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "ReplicationTimeStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Time",
                "ReplicationTimeValue",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReplicationTimeStatus" => Shape.new(
            "ReplicationTimeStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "ReplicationTimeValue" => Shape.new(
            "ReplicationTimeValue",
            "structure",
            [





              ShapeMember.new(
                "Minutes",
                "Minutes",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ReportPrefixString" => Shape.new(
            "ReportPrefixString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "RequestedJobStatus" => Shape.new(
            "RequestedJobStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Role" => Shape.new(
            "Role",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "RouteList" => Shape.new(
            "RouteList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "MultiRegionAccessPointRoute",
              nil,
              "Route",
              false
            ),
            false
          ),





          "S3AWSRegion" => Shape.new(
            "S3AWSRegion",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3AccessControlList" => Shape.new(
            "S3AccessControlList",
            "structure",
            [





              ShapeMember.new(
                "Grants",
                "S3GrantList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Owner",
                "S3ObjectOwner",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3AccessControlPolicy" => Shape.new(
            "S3AccessControlPolicy",
            "structure",
            [





              ShapeMember.new(
                "AccessControlList",
                "S3AccessControlList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CannedAccessControlList",
                "S3CannedAccessControlList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3AccessPointArn" => Shape.new(
            "S3AccessPointArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3BucketArnString" => Shape.new(
            "S3BucketArnString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3BucketDestination" => Shape.new(
            "S3BucketDestination",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Arn",
                "S3BucketArnString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Encryption",
                "StorageLensDataExportEncryption",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Format",
                "Format",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "OutputSchemaVersion",
                "OutputSchemaVersion",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Prefix",
                "Prefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3CannedAccessControlList" => Shape.new(
            "S3CannedAccessControlList",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3ChecksumAlgorithm" => Shape.new(
            "S3ChecksumAlgorithm",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3ComputeObjectChecksumOperation" => Shape.new(
            "S3ComputeObjectChecksumOperation",
            "structure",
            [





              ShapeMember.new(
                "ChecksumAlgorithm",
                "ComputeObjectChecksumAlgorithm",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumType",
                "ComputeObjectChecksumType",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3ContentLength" => Shape.new(
            "S3ContentLength",
            "long",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3CopyObjectOperation" => Shape.new(
            "S3CopyObjectOperation",
            "structure",
            [





              ShapeMember.new(
                "AccessControlGrants",
                "S3GrantList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "BucketKeyEnabled",
                "Boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CannedAccessControlList",
                "S3CannedAccessControlList",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ChecksumAlgorithm",
                "S3ChecksumAlgorithm",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MetadataDirective",
                "S3MetadataDirective",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ModifiedSinceConstraint",
                "TimeStamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NewObjectMetadata",
                "S3ObjectMetadata",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "NewObjectTagging",
                "S3TagSet",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectLockLegalHoldStatus",
                "S3ObjectLockLegalHoldStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectLockMode",
                "S3ObjectLockMode",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ObjectLockRetainUntilDate",
                "TimeStamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RedirectLocation",
                "NonEmptyMaxLength2048String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequesterPays",
                "Boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SSEAwsKmsKeyId",
                "KmsKeyArnString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "S3StorageClass",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TargetKeyPrefix",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TargetResource",
                "S3RegionalOrS3ExpressBucketArnString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "UnModifiedSinceConstraint",
                "TimeStamp",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3DeleteObjectTaggingOperation" => Shape.new(
            "S3DeleteObjectTaggingOperation",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "S3ExpirationInDays" => Shape.new(
            "S3ExpirationInDays",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3GeneratedManifestDescriptor" => Shape.new(
            "S3GeneratedManifestDescriptor",
            "structure",
            [





              ShapeMember.new(
                "Format",
                "GeneratedManifestFormat",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Location",
                "JobManifestLocation",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3GlacierJobTier" => Shape.new(
            "S3GlacierJobTier",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3Grant" => Shape.new(
            "S3Grant",
            "structure",
            [





              ShapeMember.new(
                "Grantee",
                "S3Grantee",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Permission",
                "S3Permission",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "S3GrantList" => Shape.new(
            "S3GrantList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "S3Grant",
              nil,
              nil,
              false
            ),
            false
          ),





          "S3Grantee" => Shape.new(
            "S3Grantee",
            "structure",
            [





              ShapeMember.new(
                "DisplayName",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Identifier",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "TypeIdentifier",
                "S3GranteeTypeIdentifier",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3GranteeTypeIdentifier" => Shape.new(
            "S3GranteeTypeIdentifier",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3InitiateRestoreObjectOperation" => Shape.new(
            "S3InitiateRestoreObjectOperation",
            "structure",
            [





              ShapeMember.new(
                "ExpirationInDays",
                "S3ExpirationInDays",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "GlacierJobTier",
                "S3GlacierJobTier",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3JobManifestGenerator" => Shape.new(
            "S3JobManifestGenerator",
            "structure",
            [





              ShapeMember.new(
                "EnableManifestOutput",
                "Boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ExpectedBucketOwner",
                "AccountId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Filter",
                "JobManifestGeneratorFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ManifestOutputLocation",
                "S3ManifestOutputLocation",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SourceBucket",
                "S3BucketArnString",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3KeyArnString" => Shape.new(
            "S3KeyArnString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3ManifestOutputLocation" => Shape.new(
            "S3ManifestOutputLocation",
            "structure",
            [





              ShapeMember.new(
                "Bucket",
                "S3BucketArnString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ExpectedManifestBucketOwner",
                "AccountId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ManifestEncryption",
                "GeneratedManifestEncryption",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ManifestFormat",
                "GeneratedManifestFormat",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ManifestPrefix",
                "ManifestPrefixString",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3MetadataDirective" => Shape.new(
            "S3MetadataDirective",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3ObjectLockLegalHold" => Shape.new(
            "S3ObjectLockLegalHold",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "S3ObjectLockLegalHoldStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3ObjectLockLegalHoldStatus" => Shape.new(
            "S3ObjectLockLegalHoldStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3ObjectLockMode" => Shape.new(
            "S3ObjectLockMode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3ObjectLockRetentionMode" => Shape.new(
            "S3ObjectLockRetentionMode",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3ObjectMetadata" => Shape.new(
            "S3ObjectMetadata",
            "structure",
            [





              ShapeMember.new(
                "CacheControl",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContentDisposition",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContentEncoding",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContentLanguage",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContentLength",
                "S3ContentLength",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContentMD5",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ContentType",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "HttpExpiresDate",
                "TimeStamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RequesterCharged",
                "Boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SSEAlgorithm",
                "S3SSEAlgorithm",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "UserMetadata",
                "S3UserMetadata",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3ObjectOwner" => Shape.new(
            "S3ObjectOwner",
            "structure",
            [





              ShapeMember.new(
                "DisplayName",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ID",
                "NonEmptyMaxLength1024String",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3ObjectVersionId" => Shape.new(
            "S3ObjectVersionId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3Permission" => Shape.new(
            "S3Permission",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3Prefix" => Shape.new(
            "S3Prefix",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3PrefixType" => Shape.new(
            "S3PrefixType",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3RegionalBucketArn" => Shape.new(
            "S3RegionalBucketArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3RegionalOrS3ExpressBucketArnString" => Shape.new(
            "S3RegionalOrS3ExpressBucketArnString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3ReplicateObjectOperation" => Shape.new(
            "S3ReplicateObjectOperation",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "S3ResourceArn" => Shape.new(
            "S3ResourceArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3Retention" => Shape.new(
            "S3Retention",
            "structure",
            [





              ShapeMember.new(
                "Mode",
                "S3ObjectLockRetentionMode",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "RetainUntilDate",
                "TimeStamp",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3SSEAlgorithm" => Shape.new(
            "S3SSEAlgorithm",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3SetObjectAclOperation" => Shape.new(
            "S3SetObjectAclOperation",
            "structure",
            [





              ShapeMember.new(
                "AccessControlPolicy",
                "S3AccessControlPolicy",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3SetObjectLegalHoldOperation" => Shape.new(
            "S3SetObjectLegalHoldOperation",
            "structure",
            [





              ShapeMember.new(
                "LegalHold",
                "S3ObjectLockLegalHold",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3SetObjectRetentionOperation" => Shape.new(
            "S3SetObjectRetentionOperation",
            "structure",
            [





              ShapeMember.new(
                "BypassGovernanceRetention",
                "Boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Retention",
                "S3Retention",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3SetObjectTaggingOperation" => Shape.new(
            "S3SetObjectTaggingOperation",
            "structure",
            [





              ShapeMember.new(
                "TagSet",
                "S3TagSet",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "S3StorageClass" => Shape.new(
            "S3StorageClass",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "S3Tag" => Shape.new(
            "S3Tag",
            "structure",
            [





              ShapeMember.new(
                "Key",
                "TagKeyString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Value",
                "TagValueString",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "S3TagSet" => Shape.new(
            "S3TagSet",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "S3Tag",
              nil,
              nil,
              false
            ),
            false
          ),





          "S3UserMetadata" => Shape.new(
            "S3UserMetadata",
            "map",
            [] of ShapeMember,
            nil,
            false
          ),




          "SSECFilter" => Shape.new(
            "SSECFilter",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "SSEKMS" => Shape.new(
            "SSEKMS",
            "structure",
            [





              ShapeMember.new(
                "KeyId",
                "SSEKMSKeyId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SSEKMSEncryption" => Shape.new(
            "SSEKMSEncryption",
            "structure",
            [





              ShapeMember.new(
                "KeyId",
                "KmsKeyArnString",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SSEKMSFilter" => Shape.new(
            "SSEKMSFilter",
            "structure",
            [





              ShapeMember.new(
                "BucketKeyEnabled",
                "Boolean",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "KmsKeyArn",
                "NonEmptyKmsKeyArnString",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SSEKMSKeyId" => Shape.new(
            "SSEKMSKeyId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SSES3" => Shape.new(
            "SSES3",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "SSES3Encryption" => Shape.new(
            "SSES3Encryption",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "SSES3Filter" => Shape.new(
            "SSES3Filter",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "Scope" => Shape.new(
            "Scope",
            "structure",
            [





              ShapeMember.new(
                "Permissions",
                "ScopePermissionList",
                nil,
                "Permissions",
                false
              ),





              ShapeMember.new(
                "Prefixes",
                "PrefixesList",
                nil,
                "Prefixes",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "ScopePermission" => Shape.new(
            "ScopePermission",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "ScopePermissionList" => Shape.new(
            "ScopePermissionList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ScopePermission",
              nil,
              "Permission",
              false
            ),
            false
          ),





          "SecretAccessKey" => Shape.new(
            "SecretAccessKey",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SelectionCriteria" => Shape.new(
            "SelectionCriteria",
            "structure",
            [





              ShapeMember.new(
                "Delimiter",
                "StorageLensPrefixLevelDelimiter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MaxDepth",
                "StorageLensPrefixLevelMaxDepth",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MinStorageBytesPercentage",
                "MinStorageBytesPercentage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SessionToken" => Shape.new(
            "SessionToken",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Setting" => Shape.new(
            "Setting",
            "boolean",
            [] of ShapeMember,
            nil,
            false
          ),




          "SourceSelectionCriteria" => Shape.new(
            "SourceSelectionCriteria",
            "structure",
            [





              ShapeMember.new(
                "ReplicaModifications",
                "ReplicaModifications",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "SseKmsEncryptedObjects",
                "SseKmsEncryptedObjects",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SseKmsEncryptedObjects" => Shape.new(
            "SseKmsEncryptedObjects",
            "structure",
            [





              ShapeMember.new(
                "Status",
                "SseKmsEncryptedObjectsStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SseKmsEncryptedObjectsStatus" => Shape.new(
            "SseKmsEncryptedObjectsStatus",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "StorageClassList" => Shape.new(
            "StorageClassList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "S3StorageClass",
              nil,
              nil,
              false
            ),
            false
          ),





          "StorageLensArn" => Shape.new(
            "StorageLensArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "StorageLensAwsOrg" => Shape.new(
            "StorageLensAwsOrg",
            "structure",
            [





              ShapeMember.new(
                "Arn",
                "AwsOrgArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StorageLensConfiguration" => Shape.new(
            "StorageLensConfiguration",
            "structure",
            [





              ShapeMember.new(
                "AccountLevel",
                "AccountLevel",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AwsOrg",
                "StorageLensAwsOrg",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "DataExport",
                "StorageLensDataExport",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Exclude",
                "Exclude",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "ExpandedPrefixesDataExport",
                "StorageLensExpandedPrefixesDataExport",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Id",
                "ConfigId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Include",
                "Include",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsEnabled",
                "IsEnabled",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "PrefixDelimiter",
                "StorageLensPrefixLevelDelimiter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageLensArn",
                "StorageLensArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "StorageLensConfigurationList" => Shape.new(
            "StorageLensConfigurationList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ListStorageLensConfigurationEntry",
              nil,
              "StorageLensConfiguration",
              false
            ),
            true
          ),





          "StorageLensDataExport" => Shape.new(
            "StorageLensDataExport",
            "structure",
            [





              ShapeMember.new(
                "CloudWatchMetrics",
                "CloudWatchMetrics",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "S3BucketDestination",
                "S3BucketDestination",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageLensTableDestination",
                "StorageLensTableDestination",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StorageLensDataExportEncryption" => Shape.new(
            "StorageLensDataExportEncryption",
            "structure",
            [





              ShapeMember.new(
                "SSEKMS",
                "SSEKMS",
                nil,
                "SSE-KMS",
                false
              ),





              ShapeMember.new(
                "SSES3",
                "SSES3",
                nil,
                "SSE-S3",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StorageLensExpandedPrefixesDataExport" => Shape.new(
            "StorageLensExpandedPrefixesDataExport",
            "structure",
            [





              ShapeMember.new(
                "S3BucketDestination",
                "S3BucketDestination",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageLensTableDestination",
                "StorageLensTableDestination",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StorageLensGroup" => Shape.new(
            "StorageLensGroup",
            "structure",
            [





              ShapeMember.new(
                "Filter",
                "StorageLensGroupFilter",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Name",
                "StorageLensGroupName",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageLensGroupArn",
                "StorageLensGroupArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StorageLensGroupAndOperator" => Shape.new(
            "StorageLensGroupAndOperator",
            "structure",
            [





              ShapeMember.new(
                "MatchAnyPrefix",
                "MatchAnyPrefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchAnySuffix",
                "MatchAnySuffix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchAnyTag",
                "MatchAnyTag",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchObjectAge",
                "MatchObjectAge",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchObjectSize",
                "MatchObjectSize",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StorageLensGroupArn" => Shape.new(
            "StorageLensGroupArn",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "StorageLensGroupFilter" => Shape.new(
            "StorageLensGroupFilter",
            "structure",
            [





              ShapeMember.new(
                "And",
                "StorageLensGroupAndOperator",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchAnyPrefix",
                "MatchAnyPrefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchAnySuffix",
                "MatchAnySuffix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchAnyTag",
                "MatchAnyTag",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchObjectAge",
                "MatchObjectAge",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchObjectSize",
                "MatchObjectSize",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Or",
                "StorageLensGroupOrOperator",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StorageLensGroupLevel" => Shape.new(
            "StorageLensGroupLevel",
            "structure",
            [





              ShapeMember.new(
                "SelectionCriteria",
                "StorageLensGroupLevelSelectionCriteria",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "StorageLensGroupLevelExclude" => Shape.new(
            "StorageLensGroupLevelExclude",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "StorageLensGroupArn",
              nil,
              "Arn",
              false
            ),
            false
          ),









          "StorageLensGroupLevelInclude" => Shape.new(
            "StorageLensGroupLevelInclude",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "StorageLensGroupArn",
              nil,
              "Arn",
              false
            ),
            false
          ),





          "StorageLensGroupLevelSelectionCriteria" => Shape.new(
            "StorageLensGroupLevelSelectionCriteria",
            "structure",
            [





              ShapeMember.new(
                "Exclude",
                "StorageLensGroupLevelExclude",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Include",
                "StorageLensGroupLevelInclude",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "StorageLensGroupList" => Shape.new(
            "StorageLensGroupList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "ListStorageLensGroupEntry",
              nil,
              "StorageLensGroup",
              false
            ),
            true
          ),





          "StorageLensGroupName" => Shape.new(
            "StorageLensGroupName",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "StorageLensGroupOrOperator" => Shape.new(
            "StorageLensGroupOrOperator",
            "structure",
            [





              ShapeMember.new(
                "MatchAnyPrefix",
                "MatchAnyPrefix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchAnySuffix",
                "MatchAnySuffix",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchAnyTag",
                "MatchAnyTag",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchObjectAge",
                "MatchObjectAge",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "MatchObjectSize",
                "MatchObjectSize",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StorageLensPrefixLevelDelimiter" => Shape.new(
            "StorageLensPrefixLevelDelimiter",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "StorageLensPrefixLevelMaxDepth" => Shape.new(
            "StorageLensPrefixLevelMaxDepth",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "StorageLensTableDestination" => Shape.new(
            "StorageLensTableDestination",
            "structure",
            [





              ShapeMember.new(
                "Encryption",
                "StorageLensDataExportEncryption",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IsEnabled",
                "IsEnabled",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "StorageLensTag" => Shape.new(
            "StorageLensTag",
            "structure",
            [





              ShapeMember.new(
                "Key",
                "TagKeyString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Value",
                "TagValueString",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "StorageLensTags" => Shape.new(
            "StorageLensTags",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "StorageLensTag",
              nil,
              "Tag",
              false
            ),
            false
          ),





          "StringForNextToken" => Shape.new(
            "StringForNextToken",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SubmitMultiRegionAccessPointRoutesRequest" => Shape.new(
            "SubmitMultiRegionAccessPointRoutesRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Mrap",
                "MultiRegionAccessPointId",
                "uri",
                "mrap",
                false
              ),





              ShapeMember.new(
                "RouteUpdates",
                "RouteList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "SubmitMultiRegionAccessPointRoutesResult" => Shape.new(
            "SubmitMultiRegionAccessPointRoutesResult",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "Suffix" => Shape.new(
            "Suffix",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SuspendedCause" => Shape.new(
            "SuspendedCause",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "SuspendedDate" => Shape.new(
            "SuspendedDate",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "Tag" => Shape.new(
            "Tag",
            "structure",
            [





              ShapeMember.new(
                "Key",
                "TagKeyString",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Value",
                "TagValueString",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "TagKeyList" => Shape.new(
            "TagKeyList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "TagKeyString",
              nil,
              nil,
              false
            ),
            false
          ),





          "TagKeyString" => Shape.new(
            "TagKeyString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),








          "TagList" => Shape.new(
            "TagList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Tag",
              nil,
              "Tag",
              false
            ),
            false
          ),





          "TagResourceRequest" => Shape.new(
            "TagResourceRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ResourceArn",
                "S3ResourceArn",
                "uri",
                "resourceArn",
                false
              ),





              ShapeMember.new(
                "Tags",
                "TagList",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TagResourceResult" => Shape.new(
            "TagResourceResult",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "TagValueString" => Shape.new(
            "TagValueString",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "Tagging" => Shape.new(
            "Tagging",
            "structure",
            [





              ShapeMember.new(
                "TagSet",
                "S3TagSet",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TimeStamp" => Shape.new(
            "TimeStamp",
            "timestamp",
            [] of ShapeMember,
            nil,
            false
          ),




          "TooManyRequestsException" => Shape.new(
            "TooManyRequestsException",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "ExceptionMessage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TooManyTagsException" => Shape.new(
            "TooManyTagsException",
            "structure",
            [





              ShapeMember.new(
                "Message",
                "ExceptionMessage",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "TrafficDialPercentage" => Shape.new(
            "TrafficDialPercentage",
            "integer",
            [] of ShapeMember,
            nil,
            false
          ),




          "Transition" => Shape.new(
            "Transition",
            "structure",
            [





              ShapeMember.new(
                "Date",
                "Date",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Days",
                "Days",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StorageClass",
                "TransitionStorageClass",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),








          "TransitionList" => Shape.new(
            "TransitionList",
            "list",
            [] of ShapeMember,
            ShapeMember.new(
              "member",
              "Transition",
              nil,
              "Transition",
              false
            ),
            false
          ),





          "TransitionStorageClass" => Shape.new(
            "TransitionStorageClass",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),




          "UntagResourceRequest" => Shape.new(
            "UntagResourceRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "ResourceArn",
                "S3ResourceArn",
                "uri",
                "resourceArn",
                false
              ),





              ShapeMember.new(
                "TagKeys",
                "TagKeyList",
                "querystring",
                "tagKeys",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UntagResourceResult" => Shape.new(
            "UntagResourceResult",
            "structure",
            [

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateAccessGrantsLocationRequest" => Shape.new(
            "UpdateAccessGrantsLocationRequest",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsLocationId",
                "AccessGrantsLocationId",
                "uri",
                "id",
                false
              ),





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "IAMRoleArn",
                "IAMRoleArn",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateAccessGrantsLocationResult" => Shape.new(
            "UpdateAccessGrantsLocationResult",
            "structure",
            [





              ShapeMember.new(
                "AccessGrantsLocationArn",
                "AccessGrantsLocationArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "AccessGrantsLocationId",
                "AccessGrantsLocationId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "CreatedAt",
                "CreationTimestamp",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "IAMRoleArn",
                "IAMRoleArn",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "LocationScope",
                "S3Prefix",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateJobPriorityRequest" => Shape.new(
            "UpdateJobPriorityRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "JobId",
                "JobId",
                "uri",
                "id",
                false
              ),





              ShapeMember.new(
                "Priority",
                "JobPriority",
                "querystring",
                "priority",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateJobPriorityResult" => Shape.new(
            "UpdateJobPriorityResult",
            "structure",
            [





              ShapeMember.new(
                "JobId",
                "JobId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Priority",
                "JobPriority",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateJobStatusRequest" => Shape.new(
            "UpdateJobStatusRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "JobId",
                "JobId",
                "uri",
                "id",
                false
              ),





              ShapeMember.new(
                "RequestedJobStatus",
                "RequestedJobStatus",
                "querystring",
                "requestedJobStatus",
                false
              ),





              ShapeMember.new(
                "StatusUpdateReason",
                "JobStatusUpdateReason",
                "querystring",
                "statusUpdateReason",
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateJobStatusResult" => Shape.new(
            "UpdateJobStatusResult",
            "structure",
            [





              ShapeMember.new(
                "JobId",
                "JobId",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "Status",
                "JobStatus",
                nil,
                nil,
                false
              ),





              ShapeMember.new(
                "StatusUpdateReason",
                "JobStatusUpdateReason",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UpdateStorageLensGroupRequest" => Shape.new(
            "UpdateStorageLensGroupRequest",
            "structure",
            [





              ShapeMember.new(
                "AccountId",
                "AccountId",
                "header",
                "x-amz-account-id",
                false
              ),





              ShapeMember.new(
                "Name",
                "StorageLensGroupName",
                "uri",
                "name",
                false
              ),





              ShapeMember.new(
                "StorageLensGroup",
                "StorageLensGroup",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "UserArguments" => Shape.new(
            "UserArguments",
            "map",
            [] of ShapeMember,
            nil,
            false
          ),




          "VersioningConfiguration" => Shape.new(
            "VersioningConfiguration",
            "structure",
            [





              ShapeMember.new(
                "MFADelete",
                "MFADelete",
                nil,
                "MfaDelete",
                false
              ),





              ShapeMember.new(
                "Status",
                "BucketVersioningStatus",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "VpcConfiguration" => Shape.new(
            "VpcConfiguration",
            "structure",
            [





              ShapeMember.new(
                "VpcId",
                "VpcId",
                nil,
                nil,
                false
              ),

            ] of ShapeMember,
            nil,
            false
          ),




          "VpcId" => Shape.new(
            "VpcId",
            "string",
            [] of ShapeMember,
            nil,
            false
          ),


        }

        def self.build_request(operation : Model::OperationModel, input, endpoint : String) : AwsSdk::Runtime::Http::Request
          raise ArgumentError.new("endpoint must not be empty") if endpoint.empty?
          payload = input ? JSON.parse(input.to_json).as_h : {} of String => JSON::Any
          input_shape = OPERATION_INPUT_SHAPES[operation.name]?
          raise ArgumentError.new("input shape missing for #{operation.name}") if input && input_shape.nil?
          uri = endpoint.rstrip("/") + operation.request_uri
          uri = apply_uri_labels(uri, input_shape, payload) if input_shape
          params = URI::Params.new
          headers = {"content-type" => CONTENT_TYPE}
          apply_query_params(params, input_shape, payload) if input_shape
          apply_header_params(headers, input_shape, payload) if input_shape
          query = params.to_s
          uri = "#{uri}?#{query}" unless query.empty?
          body = if input_shape
            body_payload = body_payload(input_shape, payload)
            if body_payload.empty?
              nil
            else
              root_name = OPERATION_INPUT_ROOTS[operation.name]? || input_shape
              namespace = OPERATION_INPUT_NAMESPACES[operation.name]?
              build_xml(root_name, input_shape, body_payload, namespace)
            end
          else
            nil
          end
          AwsSdk::Runtime::Http::Request.new(operation.http_method, uri, headers, body)
        end

        def self.parse_error(response : AwsSdk::Runtime::Http::Response) : Exception
          error_type = error_type_from_body(response.body)
          message = error_message_from_body(response.body)
          Errors.build(error_type, message)
        end

        def self.parse_response(response : AwsSdk::Runtime::Http::Response, output_type : T.class, operation_name : String) : T forall T
          payload = {} of String => JSON::Any
          output_shape = OPERATION_OUTPUT_SHAPES[operation_name]?
          if (body = response.body)
            document = XML.parse(body)
            node = result_node(document, operation_name) || document.root
            if node && output_shape
              parsed = parse_node(node, output_shape)
              payload = parsed.as_h? || payload
            end
          end
          apply_header_values(payload, output_shape, response.headers) if output_shape
          output_type.from_json(JSON::Any.new(payload).to_json)
        rescue XML::Error
          output_type.from_json("{}")
        end

        private def self.shape(name : String) : Shape
          SHAPES[name]? || raise ArgumentError.new("shape not found: #{name}")
        end

        private def self.member_key(member : ShapeMember) : String
          member.location_name || member.name
        end

        private def self.apply_uri_labels(uri : String, input_shape : String, payload : Hash(String, JSON::Any)) : String
          result = uri
          labels = uri.scan(/\{([^\}]+)\}/).map { |match| match[1] }
          return result if labels.empty?
          shape = shape(input_shape)
          labels.each do |label|
            member = shape.members.find { |item| item.location == "uri" && member_key(item) == label }
            raise ArgumentError.new("missing uri label #{label}") unless member
            value = payload[member_key(member)]?
            raise ArgumentError.new("missing value for uri label #{label}") unless value
            member_shape = shape(member.shape)
            result = result.gsub("{#{label}}", scalar_text(member_shape.type, value))
          end
          result
        end

        private def self.apply_query_params(params : URI::Params, input_shape : String, payload : Hash(String, JSON::Any)) : Nil
          shape = shape(input_shape)
          shape.members.each do |member|
            next unless member.location == "querystring"
            key = member_key(member)
            value = payload[key]?
            next unless value
            add_param(params, key, value)
          end
        end

        private def self.apply_header_params(headers : Hash(String, String), input_shape : String, payload : Hash(String, JSON::Any)) : Nil
          shape = shape(input_shape)
          shape.members.each do |member|
            next unless member.location == "header"
            key = member_key(member)
            value = payload[key]?
            next unless value
            headers[key] = scalar_text(shape(member.shape).type, value)
          end
        end

        private def self.body_payload(input_shape : String, payload : Hash(String, JSON::Any)) : Hash(String, JSON::Any)
          shape = shape(input_shape)
          return {} of String => JSON::Any unless shape.type == "structure"
          body = {} of String => JSON::Any
          shape.members.each do |member|
            next unless member.location.nil?
            key = member_key(member)
            value = payload[key]?
            next unless value
            next if value.raw.nil?
            body[key] = value
          end
          body
        end

        private def self.build_xml(root_name : String, root_shape : String, payload : Hash(String, JSON::Any), xml_namespace : String?) : String
          XML.build do |xml|
            shape = shape(root_shape)
            if xml_namespace
              xml.element(root_name, {"xmlns" => xml_namespace}) do
                serialize_structure(xml, shape, payload)
              end
            else
              xml.element(root_name) do
                serialize_structure(xml, shape, payload)
              end
            end
          end
        end

        private def self.serialize_structure(xml : XML::Builder, shape : Shape, payload : Hash(String, JSON::Any)) : Nil
          shape.members.each do |member|
            next unless member.location.nil?
            key = member_key(member)
            value = payload[key]?
            next unless value
            serialize_member(xml, member, value)
          end
        end

        private def self.serialize_member(xml : XML::Builder, member : ShapeMember, value : JSON::Any) : Nil
          shape = shape(member.shape)
          element_name = member_key(member)
          case shape.type
          when "structure"
            xml.element(element_name) do
              serialize_structure(xml, shape, value.as_h? || {} of String => JSON::Any)
            end
          when "list"
            serialize_list(xml, element_name, shape, value, member.flattened)
          else
            xml.element(element_name) { xml.text(scalar_text(shape.type, value)) }
          end
        end

        private def self.serialize_list(xml : XML::Builder, element_name : String, shape : Shape, value : JSON::Any, member_flattened : Bool) : Nil
          items = value.as_a? || [] of JSON::Any
          list_member = shape.list_member
          return unless list_member
          member_name = list_member.location_name || "member"
          flattened = shape.flattened || member_flattened
          if flattened
            items.each do |item|
              serialize_value(xml, member_name, list_member.shape, item)
            end
          else
            xml.element(element_name) do
              items.each do |item|
                serialize_value(xml, member_name, list_member.shape, item)
              end
            end
          end
        end

        private def self.serialize_value(xml : XML::Builder, element_name : String, shape_name : String, value : JSON::Any) : Nil
          shape = shape(shape_name)
          case shape.type
          when "structure"
            xml.element(element_name) do
              serialize_structure(xml, shape, value.as_h? || {} of String => JSON::Any)
            end
          when "list"
            serialize_list(xml, element_name, shape, value, false)
          else
            xml.element(element_name) { xml.text(scalar_text(shape.type, value)) }
          end
        end

        private def self.scalar_text(shape_type : String, value : JSON::Any) : String
          case value.raw
          when Nil
            ""
          when String
            value.as_s
          when Int64
            value.as_i.to_s
          when Float64
            value.as_f.to_s
          when Bool
            value.as_bool ? "true" : "false"
          else
            value.to_json
          end
        end

        private def self.parse_node(node : XML::Node, shape_name : String) : JSON::Any
          shape = shape(shape_name)
          case shape.type
          when "structure"
            JSON::Any.new(parse_structure(node, shape))
          when "list"
            JSON::Any.new(parse_list(node, shape))
          else
            parse_scalar(shape.type, node.content)
          end
        end

        private def self.parse_structure(node : XML::Node, shape : Shape) : Hash(String, JSON::Any)
          result = {} of String => JSON::Any
          shape.members.each do |member|
            next unless member.location.nil?
            shape_ref = shape(member.shape)
            key = member_key(member)
            if shape_ref.type == "list" && (shape_ref.flattened || member.flattened)
              list_member = shape_ref.list_member
              next unless list_member
              member_name = list_member.location_name || "member"
              items = node.children.select(&.element?).select { |child| child.name == member_name }
              values = items.map { |child| parse_node(child, list_member.shape) }
              result[key] = JSON::Any.new(values)
            else
              child = node.children.find { |item| item.element? && item.name == key }
              next unless child
              result[key] = parse_node(child, member.shape)
            end
          end
          result
        end

        private def self.parse_list(node : XML::Node, shape : Shape) : Array(JSON::Any)
          member = shape.list_member
          return [] of JSON::Any unless member
          member_name = member.location_name || "member"
          items = node.children.select(&.element?).select { |child| child.name == member_name }
          items.map { |child| parse_node(child, member.shape) }
        end

        private def self.parse_scalar(shape_type : String, value : String) : JSON::Any
          case shape_type
          when "integer", "short", "byte"
            JSON::Any.new(value.to_i)
          when "long", "bigInteger"
            JSON::Any.new(value.to_i64)
          when "float", "double", "bigDecimal"
            JSON::Any.new(value.to_f)
          when "boolean"
            JSON::Any.new(value.downcase == "true")
          else
            JSON::Any.new(value)
          end
        end

        private def self.apply_header_values(payload : Hash(String, JSON::Any), output_shape : String, headers : Hash(String, String)) : Nil
          shape = shape(output_shape)
          shape.members.each do |member|
            next unless member.location == "header"
            header_name = member_key(member)
            value = header_value(headers, header_name)
            next unless value
            payload[header_name] = parse_scalar(shape(member.shape).type, value)
          end
        end

        private def self.header_value(headers : Hash(String, String), name : String) : String?
          headers[name]? || headers[name.downcase]? || headers[name.upcase]? || headers.find { |key, _| key.downcase == name.downcase }.try(&.[1])
        end

        private def self.result_node(document : XML::Node, operation_name : String) : XML::Node?
          document.xpath_node("//*[local-name()=\"#{operation_name}Result\"]") ||
            document.xpath_node("//*[local-name()=\"#{operation_name}Response\"]")
        end

        private def self.add_param(params : URI::Params, key : String, value : JSON::Any) : Nil
          case value.raw
          when Nil
          when Array
            value.as_a.each do |item|
              add_param(params, key, item)
            end
          when Hash
            params.add(key, value.to_json)
          when String
            params.add(key, value.as_s)
          when Int64
            params.add(key, value.as_i.to_s)
          when Float64
            params.add(key, value.as_f.to_s)
          when Bool
            params.add(key, value.as_bool ? "true" : "false")
          else
            params.add(key, value.to_json)
          end
        end

        private def self.error_type_from_body(body : String?) : String?
          return nil unless body
          document = XML.parse(body)
          node = document.xpath_node("//Code")
          node.try(&.content)
        rescue XML::Error
          nil
        end

        private def self.error_message_from_body(body : String?) : String?
          return nil unless body
          document = XML.parse(body)
          node = document.xpath_node("//Message")
          node.try(&.content)
        rescue XML::Error
          nil
        end
      end
    end
  end
end
