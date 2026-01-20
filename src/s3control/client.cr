module Aws
  module S3Control
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Associate your S3 Access Grants instance with an Amazon Web Services IAM Identity Center instance.
      # Use this action if you want to create access grants for users or groups from your corporate identity
      # directory. First, you must add your corporate identity directory to Amazon Web Services IAM Identity
      # Center. Then, you can associate this IAM Identity Center instance with your S3 Access Grants
      # instance. Permissions You must have the s3:AssociateAccessGrantsIdentityCenter permission to use
      # this operation. Additional Permissions You must also have the following permissions:
      # sso:CreateApplication , sso:PutApplicationGrant , and sso:PutApplicationAuthenticationMethod .

      def associate_access_grants_identity_center(
        account_id : String,
        identity_center_arn : String
      ) : Nil

        input = Types::AssociateAccessGrantsIdentityCenterRequest.new(account_id: account_id, identity_center_arn: identity_center_arn)
        associate_access_grants_identity_center(input)
      end

      def associate_access_grants_identity_center(input : Types::AssociateAccessGrantsIdentityCenterRequest) : Nil
        request = Protocol::RestXml.build_request(Model::ASSOCIATE_ACCESS_GRANTS_IDENTITY_CENTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Creates an access grant that gives a grantee access to your S3 data. The grantee can be an IAM user
      # or role or a directory user, or group. Before you can create a grant, you must have an S3 Access
      # Grants instance in the same Region as the S3 data. You can create an S3 Access Grants instance using
      # the CreateAccessGrantsInstance . You must also have registered at least one S3 data location in your
      # S3 Access Grants instance using CreateAccessGrantsLocation . Permissions You must have the
      # s3:CreateAccessGrant permission to use this operation. Additional Permissions For any directory
      # identity - sso:DescribeInstance and sso:DescribeApplication For directory users -
      # identitystore:DescribeUser For directory groups - identitystore:DescribeGroup

      def create_access_grant(
        access_grants_location_id : String,
        account_id : String,
        grantee : Types::Grantee,
        permission : String,
        access_grants_location_configuration : Types::AccessGrantsLocationConfiguration? = nil,
        application_arn : String? = nil,
        s3_prefix_type : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAccessGrantResult

        input = Types::CreateAccessGrantRequest.new(access_grants_location_id: access_grants_location_id, account_id: account_id, grantee: grantee, permission: permission, access_grants_location_configuration: access_grants_location_configuration, application_arn: application_arn, s3_prefix_type: s3_prefix_type, tags: tags)
        create_access_grant(input)
      end

      def create_access_grant(input : Types::CreateAccessGrantRequest) : Types::CreateAccessGrantResult
        request = Protocol::RestXml.build_request(Model::CREATE_ACCESS_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateAccessGrantResult, "CreateAccessGrant")
      end

      # Creates an S3 Access Grants instance, which serves as a logical grouping for access grants. You can
      # create one S3 Access Grants instance per Region per account. Permissions You must have the
      # s3:CreateAccessGrantsInstance permission to use this operation. Additional Permissions To associate
      # an IAM Identity Center instance with your S3 Access Grants instance, you must also have the
      # sso:DescribeInstance , sso:CreateApplication , sso:PutApplicationGrant , and
      # sso:PutApplicationAuthenticationMethod permissions.

      def create_access_grants_instance(
        account_id : String,
        identity_center_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAccessGrantsInstanceResult

        input = Types::CreateAccessGrantsInstanceRequest.new(account_id: account_id, identity_center_arn: identity_center_arn, tags: tags)
        create_access_grants_instance(input)
      end

      def create_access_grants_instance(input : Types::CreateAccessGrantsInstanceRequest) : Types::CreateAccessGrantsInstanceResult
        request = Protocol::RestXml.build_request(Model::CREATE_ACCESS_GRANTS_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateAccessGrantsInstanceResult, "CreateAccessGrantsInstance")
      end

      # The S3 data location that you would like to register in your S3 Access Grants instance. Your S3 data
      # must be in the same Region as your S3 Access Grants instance. The location can be one of the
      # following: The default S3 location s3:// A bucket - S3://&lt;bucket-name&gt; A bucket and prefix -
      # S3://&lt;bucket-name&gt;/&lt;prefix&gt; When you register a location, you must include the IAM role
      # that has permission to manage the S3 location that you are registering. Give S3 Access Grants
      # permission to assume this role using a policy . S3 Access Grants assumes this role to manage access
      # to the location and to vend temporary credentials to grantees or client applications. Permissions
      # You must have the s3:CreateAccessGrantsLocation permission to use this operation. Additional
      # Permissions You must also have the following permission for the specified IAM role: iam:PassRole

      def create_access_grants_location(
        account_id : String,
        iam_role_arn : String,
        location_scope : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAccessGrantsLocationResult

        input = Types::CreateAccessGrantsLocationRequest.new(account_id: account_id, iam_role_arn: iam_role_arn, location_scope: location_scope, tags: tags)
        create_access_grants_location(input)
      end

      def create_access_grants_location(input : Types::CreateAccessGrantsLocationRequest) : Types::CreateAccessGrantsLocationResult
        request = Protocol::RestXml.build_request(Model::CREATE_ACCESS_GRANTS_LOCATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateAccessGrantsLocationResult, "CreateAccessGrantsLocation")
      end

      # Creates an access point and associates it to a specified bucket. For more information, see Managing
      # access to shared datasets with access points or Managing access to shared datasets in directory
      # buckets with access points in the Amazon S3 User Guide . To create an access point and attach it to
      # a volume on an Amazon FSx file system, see CreateAndAttachS3AccessPoint in the Amazon FSx API
      # Reference . S3 on Outposts only supports VPC-style access points. For more information, see
      # Accessing Amazon S3 on Outposts using virtual private cloud (VPC) only access points in the Amazon
      # S3 User Guide . All Amazon S3 on Outposts REST API requests for this action require an additional
      # parameter of x-amz-outpost-id to be passed with the request. In addition, you must use an S3 on
      # Outposts endpoint hostname prefix instead of s3-control . For an example of the request syntax for
      # Amazon S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id
      # derived by using the access point ARN, see the Examples section. The following actions are related
      # to CreateAccessPoint : GetAccessPoint DeleteAccessPoint ListAccessPoints
      # ListAccessPointsForDirectoryBuckets

      def create_access_point(
        account_id : String,
        bucket : String,
        name : String,
        bucket_account_id : String? = nil,
        public_access_block_configuration : Types::PublicAccessBlockConfiguration? = nil,
        scope : Types::Scope? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_configuration : Types::VpcConfiguration? = nil
      ) : Types::CreateAccessPointResult

        input = Types::CreateAccessPointRequest.new(account_id: account_id, bucket: bucket, name: name, bucket_account_id: bucket_account_id, public_access_block_configuration: public_access_block_configuration, scope: scope, tags: tags, vpc_configuration: vpc_configuration)
        create_access_point(input)
      end

      def create_access_point(input : Types::CreateAccessPointRequest) : Types::CreateAccessPointResult
        request = Protocol::RestXml.build_request(Model::CREATE_ACCESS_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateAccessPointResult, "CreateAccessPoint")
      end

      # This operation is not supported by directory buckets. Creates an Object Lambda Access Point. For
      # more information, see Transforming objects with Object Lambda Access Points in the Amazon S3 User
      # Guide . The following actions are related to CreateAccessPointForObjectLambda :
      # DeleteAccessPointForObjectLambda GetAccessPointForObjectLambda ListAccessPointsForObjectLambda

      def create_access_point_for_object_lambda(
        account_id : String,
        configuration : Types::ObjectLambdaConfiguration,
        name : String
      ) : Types::CreateAccessPointForObjectLambdaResult

        input = Types::CreateAccessPointForObjectLambdaRequest.new(account_id: account_id, configuration: configuration, name: name)
        create_access_point_for_object_lambda(input)
      end

      def create_access_point_for_object_lambda(input : Types::CreateAccessPointForObjectLambdaRequest) : Types::CreateAccessPointForObjectLambdaResult
        request = Protocol::RestXml.build_request(Model::CREATE_ACCESS_POINT_FOR_OBJECT_LAMBDA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateAccessPointForObjectLambdaResult, "CreateAccessPointForObjectLambda")
      end

      # This action creates an Amazon S3 on Outposts bucket. To create an S3 bucket, see Create Bucket in
      # the Amazon S3 API Reference . Creates a new Outposts bucket. By creating the bucket, you become the
      # bucket owner. To create an Outposts bucket, you must have S3 on Outposts. For more information, see
      # Using Amazon S3 on Outposts in Amazon S3 User Guide . Not every string is an acceptable bucket name.
      # For information on bucket naming restrictions, see Working with Amazon S3 Buckets . S3 on Outposts
      # buckets support: Tags LifecycleConfigurations for deleting expired objects For a complete list of
      # restrictions and Amazon S3 feature limitations on S3 on Outposts, see Amazon S3 on Outposts
      # Restrictions and Limitations . For an example of the request syntax for Amazon S3 on Outposts that
      # uses the S3 on Outposts endpoint hostname prefix and x-amz-outpost-id in your API request, see the
      # Examples section. The following actions are related to CreateBucket for Amazon S3 on Outposts:
      # PutObject GetBucket DeleteBucket CreateAccessPoint PutAccessPointPolicy

      def create_bucket(
        bucket : String,
        acl : String? = nil,
        create_bucket_configuration : Types::CreateBucketConfiguration? = nil,
        grant_full_control : String? = nil,
        grant_read : String? = nil,
        grant_read_acp : String? = nil,
        grant_write : String? = nil,
        grant_write_acp : String? = nil,
        object_lock_enabled_for_bucket : Bool? = nil,
        outpost_id : String? = nil
      ) : Types::CreateBucketResult

        input = Types::CreateBucketRequest.new(bucket: bucket, acl: acl, create_bucket_configuration: create_bucket_configuration, grant_full_control: grant_full_control, grant_read: grant_read, grant_read_acp: grant_read_acp, grant_write: grant_write, grant_write_acp: grant_write_acp, object_lock_enabled_for_bucket: object_lock_enabled_for_bucket, outpost_id: outpost_id)
        create_bucket(input)
      end

      def create_bucket(input : Types::CreateBucketRequest) : Types::CreateBucketResult
        request = Protocol::RestXml.build_request(Model::CREATE_BUCKET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateBucketResult, "CreateBucket")
      end

      # This operation creates an S3 Batch Operations job. You can use S3 Batch Operations to perform
      # large-scale batch actions on Amazon S3 objects. Batch Operations can run a single action on lists of
      # Amazon S3 objects that you specify. For more information, see S3 Batch Operations in the Amazon S3
      # User Guide . Permissions For information about permissions required to use the Batch Operations, see
      # Granting permissions for S3 Batch Operations in the Amazon S3 User Guide . Related actions include:
      # DescribeJob ListJobs UpdateJobPriority UpdateJobStatus JobOperation

      def create_job(
        account_id : String,
        client_request_token : String,
        operation : Types::JobOperation,
        priority : Int32,
        report : Types::JobReport,
        role_arn : String,
        confirmation_required : Bool? = nil,
        description : String? = nil,
        manifest : Types::JobManifest? = nil,
        manifest_generator : Types::JobManifestGenerator? = nil,
        tags : Array(Types::S3Tag)? = nil
      ) : Types::CreateJobResult

        input = Types::CreateJobRequest.new(account_id: account_id, client_request_token: client_request_token, operation: operation, priority: priority, report: report, role_arn: role_arn, confirmation_required: confirmation_required, description: description, manifest: manifest, manifest_generator: manifest_generator, tags: tags)
        create_job(input)
      end

      def create_job(input : Types::CreateJobRequest) : Types::CreateJobResult
        request = Protocol::RestXml.build_request(Model::CREATE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateJobResult, "CreateJob")
      end

      # This operation is not supported by directory buckets. Creates a Multi-Region Access Point and
      # associates it with the specified buckets. For more information about creating Multi-Region Access
      # Points, see Creating Multi-Region Access Points in the Amazon S3 User Guide . This action will
      # always be routed to the US West (Oregon) Region. For more information about the restrictions around
      # working with Multi-Region Access Points, see Multi-Region Access Point restrictions and limitations
      # in the Amazon S3 User Guide . This request is asynchronous, meaning that you might receive a
      # response before the command has completed. When this request provides a response, it provides a
      # token that you can use to monitor the status of the request with
      # DescribeMultiRegionAccessPointOperation . The following actions are related to
      # CreateMultiRegionAccessPoint : DeleteMultiRegionAccessPoint DescribeMultiRegionAccessPointOperation
      # GetMultiRegionAccessPoint ListMultiRegionAccessPoints

      def create_multi_region_access_point(
        account_id : String,
        client_token : String,
        details : Types::CreateMultiRegionAccessPointInput
      ) : Types::CreateMultiRegionAccessPointResult

        input = Types::CreateMultiRegionAccessPointRequest.new(account_id: account_id, client_token: client_token, details: details)
        create_multi_region_access_point(input)
      end

      def create_multi_region_access_point(input : Types::CreateMultiRegionAccessPointRequest) : Types::CreateMultiRegionAccessPointResult
        request = Protocol::RestXml.build_request(Model::CREATE_MULTI_REGION_ACCESS_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateMultiRegionAccessPointResult, "CreateMultiRegionAccessPoint")
      end

      # Creates a new S3 Storage Lens group and associates it with the specified Amazon Web Services account
      # ID. An S3 Storage Lens group is a custom grouping of objects based on prefix, suffix, object tags,
      # object size, object age, or a combination of these filters. For each Storage Lens group that you’ve
      # created, you can also optionally add Amazon Web Services resource tags. For more information about
      # S3 Storage Lens groups, see Working with S3 Storage Lens groups . To use this operation, you must
      # have the permission to perform the s3:CreateStorageLensGroup action. If you’re trying to create a
      # Storage Lens group with Amazon Web Services resource tags, you must also have permission to perform
      # the s3:TagResource action. For more information about the required Storage Lens Groups permissions,
      # see Setting account permissions to use S3 Storage Lens groups . For information about Storage Lens
      # groups errors, see List of Amazon S3 Storage Lens error codes .

      def create_storage_lens_group(
        account_id : String,
        storage_lens_group : Types::StorageLensGroup,
        tags : Array(Types::Tag)? = nil
      ) : Nil

        input = Types::CreateStorageLensGroupRequest.new(account_id: account_id, storage_lens_group: storage_lens_group, tags: tags)
        create_storage_lens_group(input)
      end

      def create_storage_lens_group(input : Types::CreateStorageLensGroupRequest) : Nil
        request = Protocol::RestXml.build_request(Model::CREATE_STORAGE_LENS_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the access grant from the S3 Access Grants instance. You cannot undo an access grant
      # deletion and the grantee will no longer have access to the S3 data. Permissions You must have the
      # s3:DeleteAccessGrant permission to use this operation.

      def delete_access_grant(
        access_grant_id : String,
        account_id : String
      ) : Nil

        input = Types::DeleteAccessGrantRequest.new(access_grant_id: access_grant_id, account_id: account_id)
        delete_access_grant(input)
      end

      def delete_access_grant(input : Types::DeleteAccessGrantRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_ACCESS_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes your S3 Access Grants instance. You must first delete the access grants and locations before
      # S3 Access Grants can delete the instance. See DeleteAccessGrant and DeleteAccessGrantsLocation . If
      # you have associated an IAM Identity Center instance with your S3 Access Grants instance, you must
      # first dissassociate the Identity Center instance from the S3 Access Grants instance before you can
      # delete the S3 Access Grants instance. See AssociateAccessGrantsIdentityCenter and
      # DissociateAccessGrantsIdentityCenter . Permissions You must have the s3:DeleteAccessGrantsInstance
      # permission to use this operation.

      def delete_access_grants_instance(
        account_id : String
      ) : Nil

        input = Types::DeleteAccessGrantsInstanceRequest.new(account_id: account_id)
        delete_access_grants_instance(input)
      end

      def delete_access_grants_instance(input : Types::DeleteAccessGrantsInstanceRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_ACCESS_GRANTS_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the resource policy of the S3 Access Grants instance. The resource policy is used to manage
      # cross-account access to your S3 Access Grants instance. By deleting the resource policy, you delete
      # any cross-account permissions to your S3 Access Grants instance. Permissions You must have the
      # s3:DeleteAccessGrantsInstanceResourcePolicy permission to use this operation.

      def delete_access_grants_instance_resource_policy(
        account_id : String
      ) : Nil

        input = Types::DeleteAccessGrantsInstanceResourcePolicyRequest.new(account_id: account_id)
        delete_access_grants_instance_resource_policy(input)
      end

      def delete_access_grants_instance_resource_policy(input : Types::DeleteAccessGrantsInstanceResourcePolicyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_ACCESS_GRANTS_INSTANCE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deregisters a location from your S3 Access Grants instance. You can only delete a location
      # registration from an S3 Access Grants instance if there are no grants associated with this location.
      # See Delete a grant for information on how to delete grants. You need to have at least one registered
      # location in your S3 Access Grants instance in order to create access grants. Permissions You must
      # have the s3:DeleteAccessGrantsLocation permission to use this operation.

      def delete_access_grants_location(
        access_grants_location_id : String,
        account_id : String
      ) : Nil

        input = Types::DeleteAccessGrantsLocationRequest.new(access_grants_location_id: access_grants_location_id, account_id: account_id)
        delete_access_grants_location(input)
      end

      def delete_access_grants_location(input : Types::DeleteAccessGrantsLocationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_ACCESS_GRANTS_LOCATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified access point. All Amazon S3 on Outposts REST API requests for this action
      # require an additional parameter of x-amz-outpost-id to be passed with the request. In addition, you
      # must use an S3 on Outposts endpoint hostname prefix instead of s3-control . For an example of the
      # request syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
      # the x-amz-outpost-id derived by using the access point ARN, see the Examples section. The following
      # actions are related to DeleteAccessPoint : CreateAccessPoint GetAccessPoint ListAccessPoints

      def delete_access_point(
        account_id : String,
        name : String
      ) : Nil

        input = Types::DeleteAccessPointRequest.new(account_id: account_id, name: name)
        delete_access_point(input)
      end

      def delete_access_point(input : Types::DeleteAccessPointRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_ACCESS_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported by directory buckets. Deletes the specified Object Lambda Access
      # Point. The following actions are related to DeleteAccessPointForObjectLambda :
      # CreateAccessPointForObjectLambda GetAccessPointForObjectLambda ListAccessPointsForObjectLambda

      def delete_access_point_for_object_lambda(
        account_id : String,
        name : String
      ) : Nil

        input = Types::DeleteAccessPointForObjectLambdaRequest.new(account_id: account_id, name: name)
        delete_access_point_for_object_lambda(input)
      end

      def delete_access_point_for_object_lambda(input : Types::DeleteAccessPointForObjectLambdaRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_ACCESS_POINT_FOR_OBJECT_LAMBDA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the access point policy for the specified access point. All Amazon S3 on Outposts REST API
      # requests for this action require an additional parameter of x-amz-outpost-id to be passed with the
      # request. In addition, you must use an S3 on Outposts endpoint hostname prefix instead of s3-control
      # . For an example of the request syntax for Amazon S3 on Outposts that uses the S3 on Outposts
      # endpoint hostname prefix and the x-amz-outpost-id derived by using the access point ARN, see the
      # Examples section. The following actions are related to DeleteAccessPointPolicy :
      # PutAccessPointPolicy GetAccessPointPolicy

      def delete_access_point_policy(
        account_id : String,
        name : String
      ) : Nil

        input = Types::DeleteAccessPointPolicyRequest.new(account_id: account_id, name: name)
        delete_access_point_policy(input)
      end

      def delete_access_point_policy(input : Types::DeleteAccessPointPolicyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_ACCESS_POINT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported by directory buckets. Removes the resource policy for an Object
      # Lambda Access Point. The following actions are related to DeleteAccessPointPolicyForObjectLambda :
      # GetAccessPointPolicyForObjectLambda PutAccessPointPolicyForObjectLambda

      def delete_access_point_policy_for_object_lambda(
        account_id : String,
        name : String
      ) : Nil

        input = Types::DeleteAccessPointPolicyForObjectLambdaRequest.new(account_id: account_id, name: name)
        delete_access_point_policy_for_object_lambda(input)
      end

      def delete_access_point_policy_for_object_lambda(input : Types::DeleteAccessPointPolicyForObjectLambdaRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_ACCESS_POINT_POLICY_FOR_OBJECT_LAMBDA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an existing access point scope for a directory bucket. When you delete the scope of an
      # access point, all prefixes and permissions are deleted. To use this operation, you must have the
      # permission to perform the s3express:DeleteAccessPointScope action. For information about REST API
      # errors, see REST error responses .

      def delete_access_point_scope(
        account_id : String,
        name : String
      ) : Nil

        input = Types::DeleteAccessPointScopeRequest.new(account_id: account_id, name: name)
        delete_access_point_scope(input)
      end

      def delete_access_point_scope(input : Types::DeleteAccessPointScopeRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_ACCESS_POINT_SCOPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This action deletes an Amazon S3 on Outposts bucket. To delete an S3 bucket, see DeleteBucket in the
      # Amazon S3 API Reference . Deletes the Amazon S3 on Outposts bucket. All objects (including all
      # object versions and delete markers) in the bucket must be deleted before the bucket itself can be
      # deleted. For more information, see Using Amazon S3 on Outposts in Amazon S3 User Guide . All Amazon
      # S3 on Outposts REST API requests for this action require an additional parameter of x-amz-outpost-id
      # to be passed with the request. In addition, you must use an S3 on Outposts endpoint hostname prefix
      # instead of s3-control . For an example of the request syntax for Amazon S3 on Outposts that uses the
      # S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id derived by using the access point
      # ARN, see the Examples section. Related Resources CreateBucket GetBucket DeleteObject

      def delete_bucket(
        account_id : String,
        bucket : String
      ) : Nil

        input = Types::DeleteBucketRequest.new(account_id: account_id, bucket: bucket)
        delete_bucket(input)
      end

      def delete_bucket(input : Types::DeleteBucketRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This action deletes an Amazon S3 on Outposts bucket's lifecycle configuration. To delete an S3
      # bucket's lifecycle configuration, see DeleteBucketLifecycle in the Amazon S3 API Reference . Deletes
      # the lifecycle configuration from the specified Outposts bucket. Amazon S3 on Outposts removes all
      # the lifecycle configuration rules in the lifecycle subresource associated with the bucket. Your
      # objects never expire, and Amazon S3 on Outposts no longer automatically deletes any objects on the
      # basis of rules contained in the deleted lifecycle configuration. For more information, see Using
      # Amazon S3 on Outposts in Amazon S3 User Guide . To use this operation, you must have permission to
      # perform the s3-outposts:PutLifecycleConfiguration action. By default, the bucket owner has this
      # permission and the Outposts bucket owner can grant this permission to others. All Amazon S3 on
      # Outposts REST API requests for this action require an additional parameter of x-amz-outpost-id to be
      # passed with the request. In addition, you must use an S3 on Outposts endpoint hostname prefix
      # instead of s3-control . For an example of the request syntax for Amazon S3 on Outposts that uses the
      # S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id derived by using the access point
      # ARN, see the Examples section. For more information about object expiration, see Elements to
      # Describe Lifecycle Actions . Related actions include: PutBucketLifecycleConfiguration
      # GetBucketLifecycleConfiguration

      def delete_bucket_lifecycle_configuration(
        account_id : String,
        bucket : String
      ) : Nil

        input = Types::DeleteBucketLifecycleConfigurationRequest.new(account_id: account_id, bucket: bucket)
        delete_bucket_lifecycle_configuration(input)
      end

      def delete_bucket_lifecycle_configuration(input : Types::DeleteBucketLifecycleConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_LIFECYCLE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This action deletes an Amazon S3 on Outposts bucket policy. To delete an S3 bucket policy, see
      # DeleteBucketPolicy in the Amazon S3 API Reference . This implementation of the DELETE action uses
      # the policy subresource to delete the policy of a specified Amazon S3 on Outposts bucket. If you are
      # using an identity other than the root user of the Amazon Web Services account that owns the bucket,
      # the calling identity must have the s3-outposts:DeleteBucketPolicy permissions on the specified
      # Outposts bucket and belong to the bucket owner's account to use this action. For more information,
      # see Using Amazon S3 on Outposts in Amazon S3 User Guide . If you don't have DeleteBucketPolicy
      # permissions, Amazon S3 returns a 403 Access Denied error. If you have the correct permissions, but
      # you're not using an identity that belongs to the bucket owner's account, Amazon S3 returns a 405
      # Method Not Allowed error. As a security precaution, the root user of the Amazon Web Services account
      # that owns a bucket can always use this action, even if the policy explicitly denies the root user
      # the ability to perform this action. For more information about bucket policies, see Using Bucket
      # Policies and User Policies . All Amazon S3 on Outposts REST API requests for this action require an
      # additional parameter of x-amz-outpost-id to be passed with the request. In addition, you must use an
      # S3 on Outposts endpoint hostname prefix instead of s3-control . For an example of the request syntax
      # for Amazon S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and the
      # x-amz-outpost-id derived by using the access point ARN, see the Examples section. The following
      # actions are related to DeleteBucketPolicy : GetBucketPolicy PutBucketPolicy

      def delete_bucket_policy(
        account_id : String,
        bucket : String
      ) : Nil

        input = Types::DeleteBucketPolicyRequest.new(account_id: account_id, bucket: bucket)
        delete_bucket_policy(input)
      end

      def delete_bucket_policy(input : Types::DeleteBucketPolicyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation deletes an Amazon S3 on Outposts bucket's replication configuration. To delete an S3
      # bucket's replication configuration, see DeleteBucketReplication in the Amazon S3 API Reference .
      # Deletes the replication configuration from the specified S3 on Outposts bucket. To use this
      # operation, you must have permissions to perform the s3-outposts:PutReplicationConfiguration action.
      # The Outposts bucket owner has this permission by default and can grant it to others. For more
      # information about permissions, see Setting up IAM with S3 on Outposts and Managing access to S3 on
      # Outposts buckets in the Amazon S3 User Guide . It can take a while to propagate PUT or DELETE
      # requests for a replication configuration to all S3 on Outposts systems. Therefore, the replication
      # configuration that's returned by a GET request soon after a PUT or DELETE request might return a
      # more recent result than what's on the Outpost. If an Outpost is offline, the delay in updating the
      # replication configuration on that Outpost can be significant. All Amazon S3 on Outposts REST API
      # requests for this action require an additional parameter of x-amz-outpost-id to be passed with the
      # request. In addition, you must use an S3 on Outposts endpoint hostname prefix instead of s3-control
      # . For an example of the request syntax for Amazon S3 on Outposts that uses the S3 on Outposts
      # endpoint hostname prefix and the x-amz-outpost-id derived by using the access point ARN, see the
      # Examples section. For information about S3 replication on Outposts configuration, see Replicating
      # objects for S3 on Outposts in the Amazon S3 User Guide . The following operations are related to
      # DeleteBucketReplication : PutBucketReplication GetBucketReplication

      def delete_bucket_replication(
        account_id : String,
        bucket : String
      ) : Nil

        input = Types::DeleteBucketReplicationRequest.new(account_id: account_id, bucket: bucket)
        delete_bucket_replication(input)
      end

      def delete_bucket_replication(input : Types::DeleteBucketReplicationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_REPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This action deletes an Amazon S3 on Outposts bucket's tags. To delete an S3 bucket tags, see
      # DeleteBucketTagging in the Amazon S3 API Reference . Deletes the tags from the Outposts bucket. For
      # more information, see Using Amazon S3 on Outposts in Amazon S3 User Guide . To use this action, you
      # must have permission to perform the PutBucketTagging action. By default, the bucket owner has this
      # permission and can grant this permission to others. All Amazon S3 on Outposts REST API requests for
      # this action require an additional parameter of x-amz-outpost-id to be passed with the request. In
      # addition, you must use an S3 on Outposts endpoint hostname prefix instead of s3-control . For an
      # example of the request syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
      # hostname prefix and the x-amz-outpost-id derived by using the access point ARN, see the Examples
      # section. The following actions are related to DeleteBucketTagging : GetBucketTagging
      # PutBucketTagging

      def delete_bucket_tagging(
        account_id : String,
        bucket : String
      ) : Nil

        input = Types::DeleteBucketTaggingRequest.new(account_id: account_id, bucket: bucket)
        delete_bucket_tagging(input)
      end

      def delete_bucket_tagging(input : Types::DeleteBucketTaggingRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the entire tag set from the specified S3 Batch Operations job. Permissions To use the
      # DeleteJobTagging operation, you must have permission to perform the s3:DeleteJobTagging action. For
      # more information, see Controlling access and labeling jobs using tags in the Amazon S3 User Guide .
      # Related actions include: CreateJob GetJobTagging PutJobTagging

      def delete_job_tagging(
        account_id : String,
        job_id : String
      ) : Types::DeleteJobTaggingResult

        input = Types::DeleteJobTaggingRequest.new(account_id: account_id, job_id: job_id)
        delete_job_tagging(input)
      end

      def delete_job_tagging(input : Types::DeleteJobTaggingRequest) : Types::DeleteJobTaggingResult
        request = Protocol::RestXml.build_request(Model::DELETE_JOB_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteJobTaggingResult, "DeleteJobTagging")
      end

      # This operation is not supported by directory buckets. Deletes a Multi-Region Access Point. This
      # action does not delete the buckets associated with the Multi-Region Access Point, only the
      # Multi-Region Access Point itself. This action will always be routed to the US West (Oregon) Region.
      # For more information about the restrictions around working with Multi-Region Access Points, see
      # Multi-Region Access Point restrictions and limitations in the Amazon S3 User Guide . This request is
      # asynchronous, meaning that you might receive a response before the command has completed. When this
      # request provides a response, it provides a token that you can use to monitor the status of the
      # request with DescribeMultiRegionAccessPointOperation . The following actions are related to
      # DeleteMultiRegionAccessPoint : CreateMultiRegionAccessPoint DescribeMultiRegionAccessPointOperation
      # GetMultiRegionAccessPoint ListMultiRegionAccessPoints

      def delete_multi_region_access_point(
        account_id : String,
        client_token : String,
        details : Types::DeleteMultiRegionAccessPointInput
      ) : Types::DeleteMultiRegionAccessPointResult

        input = Types::DeleteMultiRegionAccessPointRequest.new(account_id: account_id, client_token: client_token, details: details)
        delete_multi_region_access_point(input)
      end

      def delete_multi_region_access_point(input : Types::DeleteMultiRegionAccessPointRequest) : Types::DeleteMultiRegionAccessPointResult
        request = Protocol::RestXml.build_request(Model::DELETE_MULTI_REGION_ACCESS_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteMultiRegionAccessPointResult, "DeleteMultiRegionAccessPoint")
      end

      # This operation is not supported by directory buckets. Removes the PublicAccessBlock configuration
      # for an Amazon Web Services account. This operation might be restricted when the account is managed
      # by organization-level Block Public Access policies. You’ll get an Access Denied (403) error when the
      # account is managed by organization-level Block Public Access policies. Organization-level policies
      # override account-level settings, preventing direct account-level modifications. For more
      # information, see Using Amazon S3 block public access . Related actions include: GetPublicAccessBlock
      # PutPublicAccessBlock

      def delete_public_access_block(
        account_id : String
      ) : Nil

        input = Types::DeletePublicAccessBlockRequest.new(account_id: account_id)
        delete_public_access_block(input)
      end

      def delete_public_access_block(input : Types::DeletePublicAccessBlockRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_PUBLIC_ACCESS_BLOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported by directory buckets. Deletes the Amazon S3 Storage Lens
      # configuration. For more information about S3 Storage Lens, see Assessing your storage activity and
      # usage with Amazon S3 Storage Lens in the Amazon S3 User Guide . To use this action, you must have
      # permission to perform the s3:DeleteStorageLensConfiguration action. For more information, see
      # Setting permissions to use Amazon S3 Storage Lens in the Amazon S3 User Guide .

      def delete_storage_lens_configuration(
        account_id : String,
        config_id : String
      ) : Nil

        input = Types::DeleteStorageLensConfigurationRequest.new(account_id: account_id, config_id: config_id)
        delete_storage_lens_configuration(input)
      end

      def delete_storage_lens_configuration(input : Types::DeleteStorageLensConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_STORAGE_LENS_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported by directory buckets. Deletes the Amazon S3 Storage Lens
      # configuration tags. For more information about S3 Storage Lens, see Assessing your storage activity
      # and usage with Amazon S3 Storage Lens in the Amazon S3 User Guide . To use this action, you must
      # have permission to perform the s3:DeleteStorageLensConfigurationTagging action. For more
      # information, see Setting permissions to use Amazon S3 Storage Lens in the Amazon S3 User Guide .

      def delete_storage_lens_configuration_tagging(
        account_id : String,
        config_id : String
      ) : Types::DeleteStorageLensConfigurationTaggingResult

        input = Types::DeleteStorageLensConfigurationTaggingRequest.new(account_id: account_id, config_id: config_id)
        delete_storage_lens_configuration_tagging(input)
      end

      def delete_storage_lens_configuration_tagging(input : Types::DeleteStorageLensConfigurationTaggingRequest) : Types::DeleteStorageLensConfigurationTaggingResult
        request = Protocol::RestXml.build_request(Model::DELETE_STORAGE_LENS_CONFIGURATION_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteStorageLensConfigurationTaggingResult, "DeleteStorageLensConfigurationTagging")
      end

      # Deletes an existing S3 Storage Lens group. To use this operation, you must have the permission to
      # perform the s3:DeleteStorageLensGroup action. For more information about the required Storage Lens
      # Groups permissions, see Setting account permissions to use S3 Storage Lens groups . For information
      # about Storage Lens groups errors, see List of Amazon S3 Storage Lens error codes .

      def delete_storage_lens_group(
        account_id : String,
        name : String
      ) : Nil

        input = Types::DeleteStorageLensGroupRequest.new(account_id: account_id, name: name)
        delete_storage_lens_group(input)
      end

      def delete_storage_lens_group(input : Types::DeleteStorageLensGroupRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_STORAGE_LENS_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Retrieves the configuration parameters and status for a Batch Operations job. For more information,
      # see S3 Batch Operations in the Amazon S3 User Guide . Permissions To use the DescribeJob operation,
      # you must have permission to perform the s3:DescribeJob action. Related actions include: CreateJob
      # ListJobs UpdateJobPriority UpdateJobStatus

      def describe_job(
        account_id : String,
        job_id : String
      ) : Types::DescribeJobResult

        input = Types::DescribeJobRequest.new(account_id: account_id, job_id: job_id)
        describe_job(input)
      end

      def describe_job(input : Types::DescribeJobRequest) : Types::DescribeJobResult
        request = Protocol::RestXml.build_request(Model::DESCRIBE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DescribeJobResult, "DescribeJob")
      end

      # This operation is not supported by directory buckets. Retrieves the status of an asynchronous
      # request to manage a Multi-Region Access Point. For more information about managing Multi-Region
      # Access Points and how asynchronous requests work, see Using Multi-Region Access Points in the Amazon
      # S3 User Guide . The following actions are related to GetMultiRegionAccessPoint :
      # CreateMultiRegionAccessPoint DeleteMultiRegionAccessPoint GetMultiRegionAccessPoint
      # ListMultiRegionAccessPoints

      def describe_multi_region_access_point_operation(
        account_id : String,
        request_token_arn : String
      ) : Types::DescribeMultiRegionAccessPointOperationResult

        input = Types::DescribeMultiRegionAccessPointOperationRequest.new(account_id: account_id, request_token_arn: request_token_arn)
        describe_multi_region_access_point_operation(input)
      end

      def describe_multi_region_access_point_operation(input : Types::DescribeMultiRegionAccessPointOperationRequest) : Types::DescribeMultiRegionAccessPointOperationResult
        request = Protocol::RestXml.build_request(Model::DESCRIBE_MULTI_REGION_ACCESS_POINT_OPERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DescribeMultiRegionAccessPointOperationResult, "DescribeMultiRegionAccessPointOperation")
      end

      # Dissociates the Amazon Web Services IAM Identity Center instance from the S3 Access Grants instance.
      # Permissions You must have the s3:DissociateAccessGrantsIdentityCenter permission to use this
      # operation. Additional Permissions You must have the sso:DeleteApplication permission to use this
      # operation.

      def dissociate_access_grants_identity_center(
        account_id : String
      ) : Nil

        input = Types::DissociateAccessGrantsIdentityCenterRequest.new(account_id: account_id)
        dissociate_access_grants_identity_center(input)
      end

      def dissociate_access_grants_identity_center(input : Types::DissociateAccessGrantsIdentityCenterRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DISSOCIATE_ACCESS_GRANTS_IDENTITY_CENTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Get the details of an access grant from your S3 Access Grants instance. Permissions You must have
      # the s3:GetAccessGrant permission to use this operation.

      def get_access_grant(
        access_grant_id : String,
        account_id : String
      ) : Types::GetAccessGrantResult

        input = Types::GetAccessGrantRequest.new(access_grant_id: access_grant_id, account_id: account_id)
        get_access_grant(input)
      end

      def get_access_grant(input : Types::GetAccessGrantRequest) : Types::GetAccessGrantResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessGrantResult, "GetAccessGrant")
      end

      # Retrieves the S3 Access Grants instance for a Region in your account. Permissions You must have the
      # s3:GetAccessGrantsInstance permission to use this operation. GetAccessGrantsInstance is not
      # supported for cross-account access. You can only call the API from the account that owns the S3
      # Access Grants instance.

      def get_access_grants_instance(
        account_id : String
      ) : Types::GetAccessGrantsInstanceResult

        input = Types::GetAccessGrantsInstanceRequest.new(account_id: account_id)
        get_access_grants_instance(input)
      end

      def get_access_grants_instance(input : Types::GetAccessGrantsInstanceRequest) : Types::GetAccessGrantsInstanceResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_GRANTS_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessGrantsInstanceResult, "GetAccessGrantsInstance")
      end

      # Retrieve the S3 Access Grants instance that contains a particular prefix. Permissions You must have
      # the s3:GetAccessGrantsInstanceForPrefix permission for the caller account to use this operation.
      # Additional Permissions The prefix owner account must grant you the following permissions to their S3
      # Access Grants instance: s3:GetAccessGrantsInstanceForPrefix .

      def get_access_grants_instance_for_prefix(
        account_id : String,
        s3_prefix : String
      ) : Types::GetAccessGrantsInstanceForPrefixResult

        input = Types::GetAccessGrantsInstanceForPrefixRequest.new(account_id: account_id, s3_prefix: s3_prefix)
        get_access_grants_instance_for_prefix(input)
      end

      def get_access_grants_instance_for_prefix(input : Types::GetAccessGrantsInstanceForPrefixRequest) : Types::GetAccessGrantsInstanceForPrefixResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_GRANTS_INSTANCE_FOR_PREFIX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessGrantsInstanceForPrefixResult, "GetAccessGrantsInstanceForPrefix")
      end

      # Returns the resource policy of the S3 Access Grants instance. Permissions You must have the
      # s3:GetAccessGrantsInstanceResourcePolicy permission to use this operation.

      def get_access_grants_instance_resource_policy(
        account_id : String
      ) : Types::GetAccessGrantsInstanceResourcePolicyResult

        input = Types::GetAccessGrantsInstanceResourcePolicyRequest.new(account_id: account_id)
        get_access_grants_instance_resource_policy(input)
      end

      def get_access_grants_instance_resource_policy(input : Types::GetAccessGrantsInstanceResourcePolicyRequest) : Types::GetAccessGrantsInstanceResourcePolicyResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_GRANTS_INSTANCE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessGrantsInstanceResourcePolicyResult, "GetAccessGrantsInstanceResourcePolicy")
      end

      # Retrieves the details of a particular location registered in your S3 Access Grants instance.
      # Permissions You must have the s3:GetAccessGrantsLocation permission to use this operation.

      def get_access_grants_location(
        access_grants_location_id : String,
        account_id : String
      ) : Types::GetAccessGrantsLocationResult

        input = Types::GetAccessGrantsLocationRequest.new(access_grants_location_id: access_grants_location_id, account_id: account_id)
        get_access_grants_location(input)
      end

      def get_access_grants_location(input : Types::GetAccessGrantsLocationRequest) : Types::GetAccessGrantsLocationResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_GRANTS_LOCATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessGrantsLocationResult, "GetAccessGrantsLocation")
      end

      # Returns configuration information about the specified access point. All Amazon S3 on Outposts REST
      # API requests for this action require an additional parameter of x-amz-outpost-id to be passed with
      # the request. In addition, you must use an S3 on Outposts endpoint hostname prefix instead of
      # s3-control . For an example of the request syntax for Amazon S3 on Outposts that uses the S3 on
      # Outposts endpoint hostname prefix and the x-amz-outpost-id derived by using the access point ARN,
      # see the Examples section. The following actions are related to GetAccessPoint : CreateAccessPoint
      # DeleteAccessPoint ListAccessPoints

      def get_access_point(
        account_id : String,
        name : String
      ) : Types::GetAccessPointResult

        input = Types::GetAccessPointRequest.new(account_id: account_id, name: name)
        get_access_point(input)
      end

      def get_access_point(input : Types::GetAccessPointRequest) : Types::GetAccessPointResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessPointResult, "GetAccessPoint")
      end

      # This operation is not supported by directory buckets. Returns configuration for an Object Lambda
      # Access Point. The following actions are related to GetAccessPointConfigurationForObjectLambda :
      # PutAccessPointConfigurationForObjectLambda

      def get_access_point_configuration_for_object_lambda(
        account_id : String,
        name : String
      ) : Types::GetAccessPointConfigurationForObjectLambdaResult

        input = Types::GetAccessPointConfigurationForObjectLambdaRequest.new(account_id: account_id, name: name)
        get_access_point_configuration_for_object_lambda(input)
      end

      def get_access_point_configuration_for_object_lambda(input : Types::GetAccessPointConfigurationForObjectLambdaRequest) : Types::GetAccessPointConfigurationForObjectLambdaResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_POINT_CONFIGURATION_FOR_OBJECT_LAMBDA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessPointConfigurationForObjectLambdaResult, "GetAccessPointConfigurationForObjectLambda")
      end

      # This operation is not supported by directory buckets. Returns configuration information about the
      # specified Object Lambda Access Point The following actions are related to
      # GetAccessPointForObjectLambda : CreateAccessPointForObjectLambda DeleteAccessPointForObjectLambda
      # ListAccessPointsForObjectLambda

      def get_access_point_for_object_lambda(
        account_id : String,
        name : String
      ) : Types::GetAccessPointForObjectLambdaResult

        input = Types::GetAccessPointForObjectLambdaRequest.new(account_id: account_id, name: name)
        get_access_point_for_object_lambda(input)
      end

      def get_access_point_for_object_lambda(input : Types::GetAccessPointForObjectLambdaRequest) : Types::GetAccessPointForObjectLambdaResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_POINT_FOR_OBJECT_LAMBDA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessPointForObjectLambdaResult, "GetAccessPointForObjectLambda")
      end

      # Returns the access point policy associated with the specified access point. The following actions
      # are related to GetAccessPointPolicy : PutAccessPointPolicy DeleteAccessPointPolicy

      def get_access_point_policy(
        account_id : String,
        name : String
      ) : Types::GetAccessPointPolicyResult

        input = Types::GetAccessPointPolicyRequest.new(account_id: account_id, name: name)
        get_access_point_policy(input)
      end

      def get_access_point_policy(input : Types::GetAccessPointPolicyRequest) : Types::GetAccessPointPolicyResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_POINT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessPointPolicyResult, "GetAccessPointPolicy")
      end

      # This operation is not supported by directory buckets. Returns the resource policy for an Object
      # Lambda Access Point. The following actions are related to GetAccessPointPolicyForObjectLambda :
      # DeleteAccessPointPolicyForObjectLambda PutAccessPointPolicyForObjectLambda

      def get_access_point_policy_for_object_lambda(
        account_id : String,
        name : String
      ) : Types::GetAccessPointPolicyForObjectLambdaResult

        input = Types::GetAccessPointPolicyForObjectLambdaRequest.new(account_id: account_id, name: name)
        get_access_point_policy_for_object_lambda(input)
      end

      def get_access_point_policy_for_object_lambda(input : Types::GetAccessPointPolicyForObjectLambdaRequest) : Types::GetAccessPointPolicyForObjectLambdaResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_POINT_POLICY_FOR_OBJECT_LAMBDA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessPointPolicyForObjectLambdaResult, "GetAccessPointPolicyForObjectLambda")
      end

      # This operation is not supported by directory buckets. Indicates whether the specified access point
      # currently has a policy that allows public access. For more information about public access through
      # access points, see Managing Data Access with Amazon S3 access points in the Amazon S3 User Guide .

      def get_access_point_policy_status(
        account_id : String,
        name : String
      ) : Types::GetAccessPointPolicyStatusResult

        input = Types::GetAccessPointPolicyStatusRequest.new(account_id: account_id, name: name)
        get_access_point_policy_status(input)
      end

      def get_access_point_policy_status(input : Types::GetAccessPointPolicyStatusRequest) : Types::GetAccessPointPolicyStatusResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_POINT_POLICY_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessPointPolicyStatusResult, "GetAccessPointPolicyStatus")
      end

      # This operation is not supported by directory buckets. Returns the status of the resource policy
      # associated with an Object Lambda Access Point.

      def get_access_point_policy_status_for_object_lambda(
        account_id : String,
        name : String
      ) : Types::GetAccessPointPolicyStatusForObjectLambdaResult

        input = Types::GetAccessPointPolicyStatusForObjectLambdaRequest.new(account_id: account_id, name: name)
        get_access_point_policy_status_for_object_lambda(input)
      end

      def get_access_point_policy_status_for_object_lambda(input : Types::GetAccessPointPolicyStatusForObjectLambdaRequest) : Types::GetAccessPointPolicyStatusForObjectLambdaResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_POINT_POLICY_STATUS_FOR_OBJECT_LAMBDA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessPointPolicyStatusForObjectLambdaResult, "GetAccessPointPolicyStatusForObjectLambda")
      end

      # Returns the access point scope for a directory bucket. To use this operation, you must have the
      # permission to perform the s3express:GetAccessPointScope action. For information about REST API
      # errors, see REST error responses .

      def get_access_point_scope(
        account_id : String,
        name : String
      ) : Types::GetAccessPointScopeResult

        input = Types::GetAccessPointScopeRequest.new(account_id: account_id, name: name)
        get_access_point_scope(input)
      end

      def get_access_point_scope(input : Types::GetAccessPointScopeRequest) : Types::GetAccessPointScopeResult
        request = Protocol::RestXml.build_request(Model::GET_ACCESS_POINT_SCOPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccessPointScopeResult, "GetAccessPointScope")
      end

      # Gets an Amazon S3 on Outposts bucket. For more information, see Using Amazon S3 on Outposts in the
      # Amazon S3 User Guide . If you are using an identity other than the root user of the Amazon Web
      # Services account that owns the Outposts bucket, the calling identity must have the
      # s3-outposts:GetBucket permissions on the specified Outposts bucket and belong to the Outposts bucket
      # owner's account in order to use this action. Only users from Outposts bucket owner account with the
      # right permissions can perform actions on an Outposts bucket. If you don't have s3-outposts:GetBucket
      # permissions or you're not using an identity that belongs to the bucket owner's account, Amazon S3
      # returns a 403 Access Denied error. The following actions are related to GetBucket for Amazon S3 on
      # Outposts: All Amazon S3 on Outposts REST API requests for this action require an additional
      # parameter of x-amz-outpost-id to be passed with the request. In addition, you must use an S3 on
      # Outposts endpoint hostname prefix instead of s3-control . For an example of the request syntax for
      # Amazon S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id
      # derived by using the access point ARN, see the Examples section. PutObject CreateBucket DeleteBucket

      def get_bucket(
        account_id : String,
        bucket : String
      ) : Types::GetBucketResult

        input = Types::GetBucketRequest.new(account_id: account_id, bucket: bucket)
        get_bucket(input)
      end

      def get_bucket(input : Types::GetBucketRequest) : Types::GetBucketResult
        request = Protocol::RestXml.build_request(Model::GET_BUCKET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketResult, "GetBucket")
      end

      # This action gets an Amazon S3 on Outposts bucket's lifecycle configuration. To get an S3 bucket's
      # lifecycle configuration, see GetBucketLifecycleConfiguration in the Amazon S3 API Reference .
      # Returns the lifecycle configuration information set on the Outposts bucket. For more information,
      # see Using Amazon S3 on Outposts and for information about lifecycle configuration, see Object
      # Lifecycle Management in Amazon S3 User Guide . To use this action, you must have permission to
      # perform the s3-outposts:GetLifecycleConfiguration action. The Outposts bucket owner has this
      # permission, by default. The bucket owner can grant this permission to others. For more information
      # about permissions, see Permissions Related to Bucket Subresource Operations and Managing Access
      # Permissions to Your Amazon S3 Resources . All Amazon S3 on Outposts REST API requests for this
      # action require an additional parameter of x-amz-outpost-id to be passed with the request. In
      # addition, you must use an S3 on Outposts endpoint hostname prefix instead of s3-control . For an
      # example of the request syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
      # hostname prefix and the x-amz-outpost-id derived by using the access point ARN, see the Examples
      # section. GetBucketLifecycleConfiguration has the following special error: Error code:
      # NoSuchLifecycleConfiguration Description: The lifecycle configuration does not exist. HTTP Status
      # Code: 404 Not Found SOAP Fault Code Prefix: Client The following actions are related to
      # GetBucketLifecycleConfiguration : PutBucketLifecycleConfiguration DeleteBucketLifecycleConfiguration

      def get_bucket_lifecycle_configuration(
        account_id : String,
        bucket : String
      ) : Types::GetBucketLifecycleConfigurationResult

        input = Types::GetBucketLifecycleConfigurationRequest.new(account_id: account_id, bucket: bucket)
        get_bucket_lifecycle_configuration(input)
      end

      def get_bucket_lifecycle_configuration(input : Types::GetBucketLifecycleConfigurationRequest) : Types::GetBucketLifecycleConfigurationResult
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_LIFECYCLE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketLifecycleConfigurationResult, "GetBucketLifecycleConfiguration")
      end

      # This action gets a bucket policy for an Amazon S3 on Outposts bucket. To get a policy for an S3
      # bucket, see GetBucketPolicy in the Amazon S3 API Reference . Returns the policy of a specified
      # Outposts bucket. For more information, see Using Amazon S3 on Outposts in the Amazon S3 User Guide .
      # If you are using an identity other than the root user of the Amazon Web Services account that owns
      # the bucket, the calling identity must have the GetBucketPolicy permissions on the specified bucket
      # and belong to the bucket owner's account in order to use this action. Only users from Outposts
      # bucket owner account with the right permissions can perform actions on an Outposts bucket. If you
      # don't have s3-outposts:GetBucketPolicy permissions or you're not using an identity that belongs to
      # the bucket owner's account, Amazon S3 returns a 403 Access Denied error. As a security precaution,
      # the root user of the Amazon Web Services account that owns a bucket can always use this action, even
      # if the policy explicitly denies the root user the ability to perform this action. For more
      # information about bucket policies, see Using Bucket Policies and User Policies . All Amazon S3 on
      # Outposts REST API requests for this action require an additional parameter of x-amz-outpost-id to be
      # passed with the request. In addition, you must use an S3 on Outposts endpoint hostname prefix
      # instead of s3-control . For an example of the request syntax for Amazon S3 on Outposts that uses the
      # S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id derived by using the access point
      # ARN, see the Examples section. The following actions are related to GetBucketPolicy : GetObject
      # PutBucketPolicy DeleteBucketPolicy

      def get_bucket_policy(
        account_id : String,
        bucket : String
      ) : Types::GetBucketPolicyResult

        input = Types::GetBucketPolicyRequest.new(account_id: account_id, bucket: bucket)
        get_bucket_policy(input)
      end

      def get_bucket_policy(input : Types::GetBucketPolicyRequest) : Types::GetBucketPolicyResult
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketPolicyResult, "GetBucketPolicy")
      end

      # This operation gets an Amazon S3 on Outposts bucket's replication configuration. To get an S3
      # bucket's replication configuration, see GetBucketReplication in the Amazon S3 API Reference .
      # Returns the replication configuration of an S3 on Outposts bucket. For more information about S3 on
      # Outposts, see Using Amazon S3 on Outposts in the Amazon S3 User Guide . For information about S3
      # replication on Outposts configuration, see Replicating objects for S3 on Outposts in the Amazon S3
      # User Guide . It can take a while to propagate PUT or DELETE requests for a replication configuration
      # to all S3 on Outposts systems. Therefore, the replication configuration that's returned by a GET
      # request soon after a PUT or DELETE request might return a more recent result than what's on the
      # Outpost. If an Outpost is offline, the delay in updating the replication configuration on that
      # Outpost can be significant. This action requires permissions for the
      # s3-outposts:GetReplicationConfiguration action. The Outposts bucket owner has this permission by
      # default and can grant it to others. For more information about permissions, see Setting up IAM with
      # S3 on Outposts and Managing access to S3 on Outposts bucket in the Amazon S3 User Guide . All Amazon
      # S3 on Outposts REST API requests for this action require an additional parameter of x-amz-outpost-id
      # to be passed with the request. In addition, you must use an S3 on Outposts endpoint hostname prefix
      # instead of s3-control . For an example of the request syntax for Amazon S3 on Outposts that uses the
      # S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id derived by using the access point
      # ARN, see the Examples section. If you include the Filter element in a replication configuration, you
      # must also include the DeleteMarkerReplication , Status , and Priority elements. The response also
      # returns those elements. For information about S3 on Outposts replication failure reasons, see
      # Replication failure reasons in the Amazon S3 User Guide . The following operations are related to
      # GetBucketReplication : PutBucketReplication DeleteBucketReplication

      def get_bucket_replication(
        account_id : String,
        bucket : String
      ) : Types::GetBucketReplicationResult

        input = Types::GetBucketReplicationRequest.new(account_id: account_id, bucket: bucket)
        get_bucket_replication(input)
      end

      def get_bucket_replication(input : Types::GetBucketReplicationRequest) : Types::GetBucketReplicationResult
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_REPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketReplicationResult, "GetBucketReplication")
      end

      # This action gets an Amazon S3 on Outposts bucket's tags. To get an S3 bucket tags, see
      # GetBucketTagging in the Amazon S3 API Reference . Returns the tag set associated with the Outposts
      # bucket. For more information, see Using Amazon S3 on Outposts in the Amazon S3 User Guide . To use
      # this action, you must have permission to perform the GetBucketTagging action. By default, the bucket
      # owner has this permission and can grant this permission to others. GetBucketTagging has the
      # following special error: Error code: NoSuchTagSetError Description: There is no tag set associated
      # with the bucket. All Amazon S3 on Outposts REST API requests for this action require an additional
      # parameter of x-amz-outpost-id to be passed with the request. In addition, you must use an S3 on
      # Outposts endpoint hostname prefix instead of s3-control . For an example of the request syntax for
      # Amazon S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id
      # derived by using the access point ARN, see the Examples section. The following actions are related
      # to GetBucketTagging : PutBucketTagging DeleteBucketTagging

      def get_bucket_tagging(
        account_id : String,
        bucket : String
      ) : Types::GetBucketTaggingResult

        input = Types::GetBucketTaggingRequest.new(account_id: account_id, bucket: bucket)
        get_bucket_tagging(input)
      end

      def get_bucket_tagging(input : Types::GetBucketTaggingRequest) : Types::GetBucketTaggingResult
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketTaggingResult, "GetBucketTagging")
      end

      # This operation returns the versioning state for S3 on Outposts buckets only. To return the
      # versioning state for an S3 bucket, see GetBucketVersioning in the Amazon S3 API Reference . Returns
      # the versioning state for an S3 on Outposts bucket. With S3 Versioning, you can save multiple
      # distinct copies of your objects and recover from unintended user actions and application failures.
      # If you've never set versioning on your bucket, it has no versioning state. In that case, the
      # GetBucketVersioning request does not return a versioning state value. For more information about
      # versioning, see Versioning in the Amazon S3 User Guide . All Amazon S3 on Outposts REST API requests
      # for this action require an additional parameter of x-amz-outpost-id to be passed with the request.
      # In addition, you must use an S3 on Outposts endpoint hostname prefix instead of s3-control . For an
      # example of the request syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
      # hostname prefix and the x-amz-outpost-id derived by using the access point ARN, see the Examples
      # section. The following operations are related to GetBucketVersioning for S3 on Outposts.
      # PutBucketVersioning PutBucketLifecycleConfiguration GetBucketLifecycleConfiguration

      def get_bucket_versioning(
        account_id : String,
        bucket : String
      ) : Types::GetBucketVersioningResult

        input = Types::GetBucketVersioningRequest.new(account_id: account_id, bucket: bucket)
        get_bucket_versioning(input)
      end

      def get_bucket_versioning(input : Types::GetBucketVersioningRequest) : Types::GetBucketVersioningResult
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_VERSIONING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketVersioningResult, "GetBucketVersioning")
      end

      # Returns a temporary access credential from S3 Access Grants to the grantee or client application.
      # The temporary credential is an Amazon Web Services STS token that grants them access to the S3 data.
      # Permissions You must have the s3:GetDataAccess permission to use this operation. Additional
      # Permissions The IAM role that S3 Access Grants assumes must have the following permissions specified
      # in the trust policy when registering the location: sts:AssumeRole , for directory users or groups
      # sts:SetContext , and for IAM users or roles sts:SetSourceIdentity .

      def get_data_access(
        account_id : String,
        permission : String,
        target : String,
        duration_seconds : Int32? = nil,
        privilege : String? = nil,
        target_type : String? = nil
      ) : Types::GetDataAccessResult

        input = Types::GetDataAccessRequest.new(account_id: account_id, permission: permission, target: target, duration_seconds: duration_seconds, privilege: privilege, target_type: target_type)
        get_data_access(input)
      end

      def get_data_access(input : Types::GetDataAccessRequest) : Types::GetDataAccessResult
        request = Protocol::RestXml.build_request(Model::GET_DATA_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetDataAccessResult, "GetDataAccess")
      end

      # Returns the tags on an S3 Batch Operations job. Permissions To use the GetJobTagging operation, you
      # must have permission to perform the s3:GetJobTagging action. For more information, see Controlling
      # access and labeling jobs using tags in the Amazon S3 User Guide . Related actions include: CreateJob
      # PutJobTagging DeleteJobTagging

      def get_job_tagging(
        account_id : String,
        job_id : String
      ) : Types::GetJobTaggingResult

        input = Types::GetJobTaggingRequest.new(account_id: account_id, job_id: job_id)
        get_job_tagging(input)
      end

      def get_job_tagging(input : Types::GetJobTaggingRequest) : Types::GetJobTaggingResult
        request = Protocol::RestXml.build_request(Model::GET_JOB_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetJobTaggingResult, "GetJobTagging")
      end

      # This operation is not supported by directory buckets. Returns configuration information about the
      # specified Multi-Region Access Point. This action will always be routed to the US West (Oregon)
      # Region. For more information about the restrictions around working with Multi-Region Access Points,
      # see Multi-Region Access Point restrictions and limitations in the Amazon S3 User Guide . The
      # following actions are related to GetMultiRegionAccessPoint : CreateMultiRegionAccessPoint
      # DeleteMultiRegionAccessPoint DescribeMultiRegionAccessPointOperation ListMultiRegionAccessPoints

      def get_multi_region_access_point(
        account_id : String,
        name : String
      ) : Types::GetMultiRegionAccessPointResult

        input = Types::GetMultiRegionAccessPointRequest.new(account_id: account_id, name: name)
        get_multi_region_access_point(input)
      end

      def get_multi_region_access_point(input : Types::GetMultiRegionAccessPointRequest) : Types::GetMultiRegionAccessPointResult
        request = Protocol::RestXml.build_request(Model::GET_MULTI_REGION_ACCESS_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetMultiRegionAccessPointResult, "GetMultiRegionAccessPoint")
      end

      # This operation is not supported by directory buckets. Returns the access control policy of the
      # specified Multi-Region Access Point. This action will always be routed to the US West (Oregon)
      # Region. For more information about the restrictions around working with Multi-Region Access Points,
      # see Multi-Region Access Point restrictions and limitations in the Amazon S3 User Guide . The
      # following actions are related to GetMultiRegionAccessPointPolicy :
      # GetMultiRegionAccessPointPolicyStatus PutMultiRegionAccessPointPolicy

      def get_multi_region_access_point_policy(
        account_id : String,
        name : String
      ) : Types::GetMultiRegionAccessPointPolicyResult

        input = Types::GetMultiRegionAccessPointPolicyRequest.new(account_id: account_id, name: name)
        get_multi_region_access_point_policy(input)
      end

      def get_multi_region_access_point_policy(input : Types::GetMultiRegionAccessPointPolicyRequest) : Types::GetMultiRegionAccessPointPolicyResult
        request = Protocol::RestXml.build_request(Model::GET_MULTI_REGION_ACCESS_POINT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetMultiRegionAccessPointPolicyResult, "GetMultiRegionAccessPointPolicy")
      end

      # This operation is not supported by directory buckets. Indicates whether the specified Multi-Region
      # Access Point has an access control policy that allows public access. This action will always be
      # routed to the US West (Oregon) Region. For more information about the restrictions around working
      # with Multi-Region Access Points, see Multi-Region Access Point restrictions and limitations in the
      # Amazon S3 User Guide . The following actions are related to GetMultiRegionAccessPointPolicyStatus :
      # GetMultiRegionAccessPointPolicy PutMultiRegionAccessPointPolicy

      def get_multi_region_access_point_policy_status(
        account_id : String,
        name : String
      ) : Types::GetMultiRegionAccessPointPolicyStatusResult

        input = Types::GetMultiRegionAccessPointPolicyStatusRequest.new(account_id: account_id, name: name)
        get_multi_region_access_point_policy_status(input)
      end

      def get_multi_region_access_point_policy_status(input : Types::GetMultiRegionAccessPointPolicyStatusRequest) : Types::GetMultiRegionAccessPointPolicyStatusResult
        request = Protocol::RestXml.build_request(Model::GET_MULTI_REGION_ACCESS_POINT_POLICY_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetMultiRegionAccessPointPolicyStatusResult, "GetMultiRegionAccessPointPolicyStatus")
      end

      # This operation is not supported by directory buckets. Returns the routing configuration for a
      # Multi-Region Access Point, indicating which Regions are active or passive. To obtain routing control
      # changes and failover requests, use the Amazon S3 failover control infrastructure endpoints in these
      # five Amazon Web Services Regions: us-east-1 us-west-2 ap-southeast-2 ap-northeast-1 eu-west-1

      def get_multi_region_access_point_routes(
        account_id : String,
        mrap : String
      ) : Types::GetMultiRegionAccessPointRoutesResult

        input = Types::GetMultiRegionAccessPointRoutesRequest.new(account_id: account_id, mrap: mrap)
        get_multi_region_access_point_routes(input)
      end

      def get_multi_region_access_point_routes(input : Types::GetMultiRegionAccessPointRoutesRequest) : Types::GetMultiRegionAccessPointRoutesResult
        request = Protocol::RestXml.build_request(Model::GET_MULTI_REGION_ACCESS_POINT_ROUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetMultiRegionAccessPointRoutesResult, "GetMultiRegionAccessPointRoutes")
      end

      # This operation is not supported by directory buckets. Retrieves the PublicAccessBlock configuration
      # for an Amazon Web Services account. This operation returns the effective account-level
      # configuration, which may inherit from organization-level policies. For more information, see Using
      # Amazon S3 block public access . Related actions include: DeletePublicAccessBlock
      # PutPublicAccessBlock

      def get_public_access_block(
        account_id : String
      ) : Types::GetPublicAccessBlockOutput

        input = Types::GetPublicAccessBlockRequest.new(account_id: account_id)
        get_public_access_block(input)
      end

      def get_public_access_block(input : Types::GetPublicAccessBlockRequest) : Types::GetPublicAccessBlockOutput
        request = Protocol::RestXml.build_request(Model::GET_PUBLIC_ACCESS_BLOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetPublicAccessBlockOutput, "GetPublicAccessBlock")
      end

      # This operation is not supported by directory buckets. Gets the Amazon S3 Storage Lens configuration.
      # For more information, see Assessing your storage activity and usage with Amazon S3 Storage Lens in
      # the Amazon S3 User Guide . For a complete list of S3 Storage Lens metrics, see S3 Storage Lens
      # metrics glossary in the Amazon S3 User Guide . To use this action, you must have permission to
      # perform the s3:GetStorageLensConfiguration action. For more information, see Setting permissions to
      # use Amazon S3 Storage Lens in the Amazon S3 User Guide .

      def get_storage_lens_configuration(
        account_id : String,
        config_id : String
      ) : Types::GetStorageLensConfigurationResult

        input = Types::GetStorageLensConfigurationRequest.new(account_id: account_id, config_id: config_id)
        get_storage_lens_configuration(input)
      end

      def get_storage_lens_configuration(input : Types::GetStorageLensConfigurationRequest) : Types::GetStorageLensConfigurationResult
        request = Protocol::RestXml.build_request(Model::GET_STORAGE_LENS_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetStorageLensConfigurationResult, "GetStorageLensConfiguration")
      end

      # This operation is not supported by directory buckets. Gets the tags of Amazon S3 Storage Lens
      # configuration. For more information about S3 Storage Lens, see Assessing your storage activity and
      # usage with Amazon S3 Storage Lens in the Amazon S3 User Guide . To use this action, you must have
      # permission to perform the s3:GetStorageLensConfigurationTagging action. For more information, see
      # Setting permissions to use Amazon S3 Storage Lens in the Amazon S3 User Guide .

      def get_storage_lens_configuration_tagging(
        account_id : String,
        config_id : String
      ) : Types::GetStorageLensConfigurationTaggingResult

        input = Types::GetStorageLensConfigurationTaggingRequest.new(account_id: account_id, config_id: config_id)
        get_storage_lens_configuration_tagging(input)
      end

      def get_storage_lens_configuration_tagging(input : Types::GetStorageLensConfigurationTaggingRequest) : Types::GetStorageLensConfigurationTaggingResult
        request = Protocol::RestXml.build_request(Model::GET_STORAGE_LENS_CONFIGURATION_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetStorageLensConfigurationTaggingResult, "GetStorageLensConfigurationTagging")
      end

      # Retrieves the Storage Lens group configuration details. To use this operation, you must have the
      # permission to perform the s3:GetStorageLensGroup action. For more information about the required
      # Storage Lens Groups permissions, see Setting account permissions to use S3 Storage Lens groups . For
      # information about Storage Lens groups errors, see List of Amazon S3 Storage Lens error codes .

      def get_storage_lens_group(
        account_id : String,
        name : String
      ) : Types::GetStorageLensGroupResult

        input = Types::GetStorageLensGroupRequest.new(account_id: account_id, name: name)
        get_storage_lens_group(input)
      end

      def get_storage_lens_group(input : Types::GetStorageLensGroupRequest) : Types::GetStorageLensGroupResult
        request = Protocol::RestXml.build_request(Model::GET_STORAGE_LENS_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetStorageLensGroupResult, "GetStorageLensGroup")
      end

      # Returns the list of access grants in your S3 Access Grants instance. Permissions You must have the
      # s3:ListAccessGrants permission to use this operation.

      def list_access_grants(
        account_id : String,
        application_arn : String? = nil,
        grant_scope : String? = nil,
        grantee_identifier : String? = nil,
        grantee_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        permission : String? = nil
      ) : Types::ListAccessGrantsResult

        input = Types::ListAccessGrantsRequest.new(account_id: account_id, application_arn: application_arn, grant_scope: grant_scope, grantee_identifier: grantee_identifier, grantee_type: grantee_type, max_results: max_results, next_token: next_token, permission: permission)
        list_access_grants(input)
      end

      def list_access_grants(input : Types::ListAccessGrantsRequest) : Types::ListAccessGrantsResult
        request = Protocol::RestXml.build_request(Model::LIST_ACCESS_GRANTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListAccessGrantsResult, "ListAccessGrants")
      end

      # Returns a list of S3 Access Grants instances. An S3 Access Grants instance serves as a logical
      # grouping for your individual access grants. You can only have one S3 Access Grants instance per
      # Region per account. Permissions You must have the s3:ListAccessGrantsInstances permission to use
      # this operation.

      def list_access_grants_instances(
        account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccessGrantsInstancesResult

        input = Types::ListAccessGrantsInstancesRequest.new(account_id: account_id, max_results: max_results, next_token: next_token)
        list_access_grants_instances(input)
      end

      def list_access_grants_instances(input : Types::ListAccessGrantsInstancesRequest) : Types::ListAccessGrantsInstancesResult
        request = Protocol::RestXml.build_request(Model::LIST_ACCESS_GRANTS_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListAccessGrantsInstancesResult, "ListAccessGrantsInstances")
      end

      # Returns a list of the locations registered in your S3 Access Grants instance. Permissions You must
      # have the s3:ListAccessGrantsLocations permission to use this operation.

      def list_access_grants_locations(
        account_id : String,
        location_scope : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccessGrantsLocationsResult

        input = Types::ListAccessGrantsLocationsRequest.new(account_id: account_id, location_scope: location_scope, max_results: max_results, next_token: next_token)
        list_access_grants_locations(input)
      end

      def list_access_grants_locations(input : Types::ListAccessGrantsLocationsRequest) : Types::ListAccessGrantsLocationsResult
        request = Protocol::RestXml.build_request(Model::LIST_ACCESS_GRANTS_LOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListAccessGrantsLocationsResult, "ListAccessGrantsLocations")
      end

      # This operation is not supported by directory buckets. Returns a list of the access points. You can
      # retrieve up to 1,000 access points per call. If the call returns more than 1,000 access points (or
      # the number specified in maxResults , whichever is less), the response will include a continuation
      # token that you can use to list the additional access points. Returns only access points attached to
      # S3 buckets by default. To return all access points specify DataSourceType as ALL . All Amazon S3 on
      # Outposts REST API requests for this action require an additional parameter of x-amz-outpost-id to be
      # passed with the request. In addition, you must use an S3 on Outposts endpoint hostname prefix
      # instead of s3-control . For an example of the request syntax for Amazon S3 on Outposts that uses the
      # S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id derived by using the access point
      # ARN, see the Examples section. The following actions are related to ListAccessPoints :
      # CreateAccessPoint DeleteAccessPoint GetAccessPoint

      def list_access_points(
        account_id : String,
        bucket : String? = nil,
        data_source_id : String? = nil,
        data_source_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccessPointsResult

        input = Types::ListAccessPointsRequest.new(account_id: account_id, bucket: bucket, data_source_id: data_source_id, data_source_type: data_source_type, max_results: max_results, next_token: next_token)
        list_access_points(input)
      end

      def list_access_points(input : Types::ListAccessPointsRequest) : Types::ListAccessPointsResult
        request = Protocol::RestXml.build_request(Model::LIST_ACCESS_POINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListAccessPointsResult, "ListAccessPoints")
      end

      # Returns a list of the access points that are owned by the Amazon Web Services account and that are
      # associated with the specified directory bucket. To list access points for general purpose buckets,
      # see ListAccesspoints . To use this operation, you must have the permission to perform the
      # s3express:ListAccessPointsForDirectoryBuckets action. For information about REST API errors, see
      # REST error responses .

      def list_access_points_for_directory_buckets(
        account_id : String,
        directory_bucket : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccessPointsForDirectoryBucketsResult

        input = Types::ListAccessPointsForDirectoryBucketsRequest.new(account_id: account_id, directory_bucket: directory_bucket, max_results: max_results, next_token: next_token)
        list_access_points_for_directory_buckets(input)
      end

      def list_access_points_for_directory_buckets(input : Types::ListAccessPointsForDirectoryBucketsRequest) : Types::ListAccessPointsForDirectoryBucketsResult
        request = Protocol::RestXml.build_request(Model::LIST_ACCESS_POINTS_FOR_DIRECTORY_BUCKETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListAccessPointsForDirectoryBucketsResult, "ListAccessPointsForDirectoryBuckets")
      end

      # This operation is not supported by directory buckets. Returns some or all (up to 1,000) access
      # points associated with the Object Lambda Access Point per call. If there are more access points than
      # what can be returned in one call, the response will include a continuation token that you can use to
      # list the additional access points. The following actions are related to
      # ListAccessPointsForObjectLambda : CreateAccessPointForObjectLambda DeleteAccessPointForObjectLambda
      # GetAccessPointForObjectLambda

      def list_access_points_for_object_lambda(
        account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccessPointsForObjectLambdaResult

        input = Types::ListAccessPointsForObjectLambdaRequest.new(account_id: account_id, max_results: max_results, next_token: next_token)
        list_access_points_for_object_lambda(input)
      end

      def list_access_points_for_object_lambda(input : Types::ListAccessPointsForObjectLambdaRequest) : Types::ListAccessPointsForObjectLambdaResult
        request = Protocol::RestXml.build_request(Model::LIST_ACCESS_POINTS_FOR_OBJECT_LAMBDA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListAccessPointsForObjectLambdaResult, "ListAccessPointsForObjectLambda")
      end

      # Use this API to list the access grants that grant the caller access to Amazon S3 data through S3
      # Access Grants. The caller (grantee) can be an Identity and Access Management (IAM) identity or
      # Amazon Web Services Identity Center corporate directory identity. You must pass the Amazon Web
      # Services account of the S3 data owner (grantor) in the request. You can, optionally, narrow the
      # results by GrantScope , using a fragment of the data's S3 path, and S3 Access Grants will return
      # only the grants with a path that contains the path fragment. You can also pass the
      # AllowedByApplication filter in the request, which returns only the grants authorized for
      # applications, whether the application is the caller's Identity Center application or any other
      # application ( ALL ). For more information, see List the caller's access grants in the Amazon S3 User
      # Guide . Permissions You must have the s3:ListCallerAccessGrants permission to use this operation.

      def list_caller_access_grants(
        account_id : String,
        allowed_by_application : Bool? = nil,
        grant_scope : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCallerAccessGrantsResult

        input = Types::ListCallerAccessGrantsRequest.new(account_id: account_id, allowed_by_application: allowed_by_application, grant_scope: grant_scope, max_results: max_results, next_token: next_token)
        list_caller_access_grants(input)
      end

      def list_caller_access_grants(input : Types::ListCallerAccessGrantsRequest) : Types::ListCallerAccessGrantsResult
        request = Protocol::RestXml.build_request(Model::LIST_CALLER_ACCESS_GRANTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListCallerAccessGrantsResult, "ListCallerAccessGrants")
      end

      # Lists current S3 Batch Operations jobs as well as the jobs that have ended within the last 90 days
      # for the Amazon Web Services account making the request. For more information, see S3 Batch
      # Operations in the Amazon S3 User Guide . Permissions To use the ListJobs operation, you must have
      # permission to perform the s3:ListJobs action. Related actions include: CreateJob DescribeJob
      # UpdateJobPriority UpdateJobStatus

      def list_jobs(
        account_id : String,
        job_statuses : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListJobsResult

        input = Types::ListJobsRequest.new(account_id: account_id, job_statuses: job_statuses, max_results: max_results, next_token: next_token)
        list_jobs(input)
      end

      def list_jobs(input : Types::ListJobsRequest) : Types::ListJobsResult
        request = Protocol::RestXml.build_request(Model::LIST_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListJobsResult, "ListJobs")
      end

      # This operation is not supported by directory buckets. Returns a list of the Multi-Region Access
      # Points currently associated with the specified Amazon Web Services account. Each call can return up
      # to 100 Multi-Region Access Points, the maximum number of Multi-Region Access Points that can be
      # associated with a single account. This action will always be routed to the US West (Oregon) Region.
      # For more information about the restrictions around working with Multi-Region Access Points, see
      # Multi-Region Access Point restrictions and limitations in the Amazon S3 User Guide . The following
      # actions are related to ListMultiRegionAccessPoint : CreateMultiRegionAccessPoint
      # DeleteMultiRegionAccessPoint DescribeMultiRegionAccessPointOperation GetMultiRegionAccessPoint

      def list_multi_region_access_points(
        account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListMultiRegionAccessPointsResult

        input = Types::ListMultiRegionAccessPointsRequest.new(account_id: account_id, max_results: max_results, next_token: next_token)
        list_multi_region_access_points(input)
      end

      def list_multi_region_access_points(input : Types::ListMultiRegionAccessPointsRequest) : Types::ListMultiRegionAccessPointsResult
        request = Protocol::RestXml.build_request(Model::LIST_MULTI_REGION_ACCESS_POINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListMultiRegionAccessPointsResult, "ListMultiRegionAccessPoints")
      end

      # This operation is not supported by directory buckets. Returns a list of all Outposts buckets in an
      # Outpost that are owned by the authenticated sender of the request. For more information, see Using
      # Amazon S3 on Outposts in the Amazon S3 User Guide . For an example of the request syntax for Amazon
      # S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and x-amz-outpost-id in your
      # request, see the Examples section.

      def list_regional_buckets(
        account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        outpost_id : String? = nil
      ) : Types::ListRegionalBucketsResult

        input = Types::ListRegionalBucketsRequest.new(account_id: account_id, max_results: max_results, next_token: next_token, outpost_id: outpost_id)
        list_regional_buckets(input)
      end

      def list_regional_buckets(input : Types::ListRegionalBucketsRequest) : Types::ListRegionalBucketsResult
        request = Protocol::RestXml.build_request(Model::LIST_REGIONAL_BUCKETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListRegionalBucketsResult, "ListRegionalBuckets")
      end

      # This operation is not supported by directory buckets. Gets a list of Amazon S3 Storage Lens
      # configurations. For more information about S3 Storage Lens, see Assessing your storage activity and
      # usage with Amazon S3 Storage Lens in the Amazon S3 User Guide . To use this action, you must have
      # permission to perform the s3:ListStorageLensConfigurations action. For more information, see Setting
      # permissions to use Amazon S3 Storage Lens in the Amazon S3 User Guide .

      def list_storage_lens_configurations(
        account_id : String,
        next_token : String? = nil
      ) : Types::ListStorageLensConfigurationsResult

        input = Types::ListStorageLensConfigurationsRequest.new(account_id: account_id, next_token: next_token)
        list_storage_lens_configurations(input)
      end

      def list_storage_lens_configurations(input : Types::ListStorageLensConfigurationsRequest) : Types::ListStorageLensConfigurationsResult
        request = Protocol::RestXml.build_request(Model::LIST_STORAGE_LENS_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListStorageLensConfigurationsResult, "ListStorageLensConfigurations")
      end

      # Lists all the Storage Lens groups in the specified home Region. To use this operation, you must have
      # the permission to perform the s3:ListStorageLensGroups action. For more information about the
      # required Storage Lens Groups permissions, see Setting account permissions to use S3 Storage Lens
      # groups . For information about Storage Lens groups errors, see List of Amazon S3 Storage Lens error
      # codes .

      def list_storage_lens_groups(
        account_id : String,
        next_token : String? = nil
      ) : Types::ListStorageLensGroupsResult

        input = Types::ListStorageLensGroupsRequest.new(account_id: account_id, next_token: next_token)
        list_storage_lens_groups(input)
      end

      def list_storage_lens_groups(input : Types::ListStorageLensGroupsRequest) : Types::ListStorageLensGroupsResult
        request = Protocol::RestXml.build_request(Model::LIST_STORAGE_LENS_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListStorageLensGroupsResult, "ListStorageLensGroups")
      end

      # This operation allows you to list all of the tags for a specified resource. Each tag is a label
      # consisting of a key and value. Tags can help you organize, track costs for, and control access to
      # resources. This operation is only supported for the following Amazon S3 resources: General purpose
      # buckets Access Points for directory buckets Access Points for general purpose buckets Directory
      # buckets S3 Storage Lens groups S3 Access Grants instances, registered locations, and grants .
      # Permissions For general purpose buckets, access points for general purpose buckets, Storage Lens
      # groups, and S3 Access Grants, you must have the s3:ListTagsForResource permission to use this
      # operation. Directory bucket permissions For directory buckets, you must have the
      # s3express:ListTagsForResource permission to use this operation. For more information about directory
      # buckets policies and permissions, see Identity and Access Management (IAM) for S3 Express One Zone
      # in the Amazon S3 User Guide . HTTP Host header syntax Directory buckets - The HTTP Host header
      # syntax is s3express-control. region .amazonaws.com . For information about S3 Tagging errors, see
      # List of Amazon S3 Tagging error codes .

      def list_tags_for_resource(
        account_id : String,
        resource_arn : String
      ) : Types::ListTagsForResourceResult

        input = Types::ListTagsForResourceRequest.new(account_id: account_id, resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResult
        request = Protocol::RestXml.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListTagsForResourceResult, "ListTagsForResource")
      end

      # Updates the resource policy of the S3 Access Grants instance. Permissions You must have the
      # s3:PutAccessGrantsInstanceResourcePolicy permission to use this operation.

      def put_access_grants_instance_resource_policy(
        account_id : String,
        policy : String,
        organization : String? = nil
      ) : Types::PutAccessGrantsInstanceResourcePolicyResult

        input = Types::PutAccessGrantsInstanceResourcePolicyRequest.new(account_id: account_id, policy: policy, organization: organization)
        put_access_grants_instance_resource_policy(input)
      end

      def put_access_grants_instance_resource_policy(input : Types::PutAccessGrantsInstanceResourcePolicyRequest) : Types::PutAccessGrantsInstanceResourcePolicyResult
        request = Protocol::RestXml.build_request(Model::PUT_ACCESS_GRANTS_INSTANCE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PutAccessGrantsInstanceResourcePolicyResult, "PutAccessGrantsInstanceResourcePolicy")
      end

      # This operation is not supported by directory buckets. Replaces configuration for an Object Lambda
      # Access Point. The following actions are related to PutAccessPointConfigurationForObjectLambda :
      # GetAccessPointConfigurationForObjectLambda

      def put_access_point_configuration_for_object_lambda(
        account_id : String,
        configuration : Types::ObjectLambdaConfiguration,
        name : String
      ) : Nil

        input = Types::PutAccessPointConfigurationForObjectLambdaRequest.new(account_id: account_id, configuration: configuration, name: name)
        put_access_point_configuration_for_object_lambda(input)
      end

      def put_access_point_configuration_for_object_lambda(input : Types::PutAccessPointConfigurationForObjectLambdaRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_ACCESS_POINT_CONFIGURATION_FOR_OBJECT_LAMBDA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Associates an access policy with the specified access point. Each access point can have only one
      # policy, so a request made to this API replaces any existing policy associated with the specified
      # access point. All Amazon S3 on Outposts REST API requests for this action require an additional
      # parameter of x-amz-outpost-id to be passed with the request. In addition, you must use an S3 on
      # Outposts endpoint hostname prefix instead of s3-control . For an example of the request syntax for
      # Amazon S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id
      # derived by using the access point ARN, see the Examples section. The following actions are related
      # to PutAccessPointPolicy : GetAccessPointPolicy DeleteAccessPointPolicy

      def put_access_point_policy(
        account_id : String,
        name : String,
        policy : String
      ) : Nil

        input = Types::PutAccessPointPolicyRequest.new(account_id: account_id, name: name, policy: policy)
        put_access_point_policy(input)
      end

      def put_access_point_policy(input : Types::PutAccessPointPolicyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_ACCESS_POINT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported by directory buckets. Creates or replaces resource policy for an
      # Object Lambda Access Point. For an example policy, see Creating Object Lambda Access Points in the
      # Amazon S3 User Guide . The following actions are related to PutAccessPointPolicyForObjectLambda :
      # DeleteAccessPointPolicyForObjectLambda GetAccessPointPolicyForObjectLambda

      def put_access_point_policy_for_object_lambda(
        account_id : String,
        name : String,
        policy : String
      ) : Nil

        input = Types::PutAccessPointPolicyForObjectLambdaRequest.new(account_id: account_id, name: name, policy: policy)
        put_access_point_policy_for_object_lambda(input)
      end

      def put_access_point_policy_for_object_lambda(input : Types::PutAccessPointPolicyForObjectLambdaRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_ACCESS_POINT_POLICY_FOR_OBJECT_LAMBDA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Creates or replaces the access point scope for a directory bucket. You can use the access point
      # scope to restrict access to specific prefixes, API operations, or a combination of both. You can
      # specify any amount of prefixes, but the total length of characters of all prefixes must be less than
      # 256 bytes in size. To use this operation, you must have the permission to perform the
      # s3express:PutAccessPointScope action. For information about REST API errors, see REST error
      # responses .

      def put_access_point_scope(
        account_id : String,
        name : String,
        scope : Types::Scope
      ) : Nil

        input = Types::PutAccessPointScopeRequest.new(account_id: account_id, name: name, scope: scope)
        put_access_point_scope(input)
      end

      def put_access_point_scope(input : Types::PutAccessPointScopeRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_ACCESS_POINT_SCOPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This action puts a lifecycle configuration to an Amazon S3 on Outposts bucket. To put a lifecycle
      # configuration to an S3 bucket, see PutBucketLifecycleConfiguration in the Amazon S3 API Reference .
      # Creates a new lifecycle configuration for the S3 on Outposts bucket or replaces an existing
      # lifecycle configuration. Outposts buckets only support lifecycle configurations that delete/expire
      # objects after a certain period of time and abort incomplete multipart uploads. All Amazon S3 on
      # Outposts REST API requests for this action require an additional parameter of x-amz-outpost-id to be
      # passed with the request. In addition, you must use an S3 on Outposts endpoint hostname prefix
      # instead of s3-control . For an example of the request syntax for Amazon S3 on Outposts that uses the
      # S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id derived by using the access point
      # ARN, see the Examples section. The following actions are related to PutBucketLifecycleConfiguration
      # : GetBucketLifecycleConfiguration DeleteBucketLifecycleConfiguration

      def put_bucket_lifecycle_configuration(
        account_id : String,
        bucket : String,
        lifecycle_configuration : Types::LifecycleConfiguration? = nil
      ) : Nil

        input = Types::PutBucketLifecycleConfigurationRequest.new(account_id: account_id, bucket: bucket, lifecycle_configuration: lifecycle_configuration)
        put_bucket_lifecycle_configuration(input)
      end

      def put_bucket_lifecycle_configuration(input : Types::PutBucketLifecycleConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_LIFECYCLE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This action puts a bucket policy to an Amazon S3 on Outposts bucket. To put a policy on an S3
      # bucket, see PutBucketPolicy in the Amazon S3 API Reference . Applies an Amazon S3 bucket policy to
      # an Outposts bucket. For more information, see Using Amazon S3 on Outposts in the Amazon S3 User
      # Guide . If you are using an identity other than the root user of the Amazon Web Services account
      # that owns the Outposts bucket, the calling identity must have the PutBucketPolicy permissions on the
      # specified Outposts bucket and belong to the bucket owner's account in order to use this action. If
      # you don't have PutBucketPolicy permissions, Amazon S3 returns a 403 Access Denied error. If you have
      # the correct permissions, but you're not using an identity that belongs to the bucket owner's
      # account, Amazon S3 returns a 405 Method Not Allowed error. As a security precaution, the root user
      # of the Amazon Web Services account that owns a bucket can always use this action, even if the policy
      # explicitly denies the root user the ability to perform this action. For more information about
      # bucket policies, see Using Bucket Policies and User Policies . All Amazon S3 on Outposts REST API
      # requests for this action require an additional parameter of x-amz-outpost-id to be passed with the
      # request. In addition, you must use an S3 on Outposts endpoint hostname prefix instead of s3-control
      # . For an example of the request syntax for Amazon S3 on Outposts that uses the S3 on Outposts
      # endpoint hostname prefix and the x-amz-outpost-id derived by using the access point ARN, see the
      # Examples section. The following actions are related to PutBucketPolicy : GetBucketPolicy
      # DeleteBucketPolicy

      def put_bucket_policy(
        account_id : String,
        bucket : String,
        policy : String,
        confirm_remove_self_bucket_access : Bool? = nil
      ) : Nil

        input = Types::PutBucketPolicyRequest.new(account_id: account_id, bucket: bucket, policy: policy, confirm_remove_self_bucket_access: confirm_remove_self_bucket_access)
        put_bucket_policy(input)
      end

      def put_bucket_policy(input : Types::PutBucketPolicyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This action creates an Amazon S3 on Outposts bucket's replication configuration. To create an S3
      # bucket's replication configuration, see PutBucketReplication in the Amazon S3 API Reference .
      # Creates a replication configuration or replaces an existing one. For information about S3
      # replication on Outposts configuration, see Replicating objects for S3 on Outposts in the Amazon S3
      # User Guide . It can take a while to propagate PUT or DELETE requests for a replication configuration
      # to all S3 on Outposts systems. Therefore, the replication configuration that's returned by a GET
      # request soon after a PUT or DELETE request might return a more recent result than what's on the
      # Outpost. If an Outpost is offline, the delay in updating the replication configuration on that
      # Outpost can be significant. Specify the replication configuration in the request body. In the
      # replication configuration, you provide the following information: The name of the destination bucket
      # or buckets where you want S3 on Outposts to replicate objects The Identity and Access Management
      # (IAM) role that S3 on Outposts can assume to replicate objects on your behalf Other relevant
      # information, such as replication rules A replication configuration must include at least one rule
      # and can contain a maximum of 100. Each rule identifies a subset of objects to replicate by filtering
      # the objects in the source Outposts bucket. To choose additional subsets of objects to replicate, add
      # a rule for each subset. To specify a subset of the objects in the source Outposts bucket to apply a
      # replication rule to, add the Filter element as a child of the Rule element. You can filter objects
      # based on an object key prefix, one or more object tags, or both. When you add the Filter element in
      # the configuration, you must also add the following elements: DeleteMarkerReplication , Status , and
      # Priority . Using PutBucketReplication on Outposts requires that both the source and destination
      # buckets must have versioning enabled. For information about enabling versioning on a bucket, see
      # Managing S3 Versioning for your S3 on Outposts bucket . For information about S3 on Outposts
      # replication failure reasons, see Replication failure reasons in the Amazon S3 User Guide . Handling
      # Replication of Encrypted Objects Outposts buckets are encrypted at all times. All the objects in the
      # source Outposts bucket are encrypted and can be replicated. Also, all the replicas in the
      # destination Outposts bucket are encrypted with the same encryption key as the objects in the source
      # Outposts bucket. Permissions To create a PutBucketReplication request, you must have
      # s3-outposts:PutReplicationConfiguration permissions for the bucket. The Outposts bucket owner has
      # this permission by default and can grant it to others. For more information about permissions, see
      # Setting up IAM with S3 on Outposts and Managing access to S3 on Outposts buckets . To perform this
      # operation, the user or role must also have the iam:CreateRole and iam:PassRole permissions. For more
      # information, see Granting a user permissions to pass a role to an Amazon Web Services service . All
      # Amazon S3 on Outposts REST API requests for this action require an additional parameter of
      # x-amz-outpost-id to be passed with the request. In addition, you must use an S3 on Outposts endpoint
      # hostname prefix instead of s3-control . For an example of the request syntax for Amazon S3 on
      # Outposts that uses the S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id derived by
      # using the access point ARN, see the Examples section. The following operations are related to
      # PutBucketReplication : GetBucketReplication DeleteBucketReplication

      def put_bucket_replication(
        account_id : String,
        bucket : String,
        replication_configuration : Types::ReplicationConfiguration
      ) : Nil

        input = Types::PutBucketReplicationRequest.new(account_id: account_id, bucket: bucket, replication_configuration: replication_configuration)
        put_bucket_replication(input)
      end

      def put_bucket_replication(input : Types::PutBucketReplicationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_REPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This action puts tags on an Amazon S3 on Outposts bucket. To put tags on an S3 bucket, see
      # PutBucketTagging in the Amazon S3 API Reference . Sets the tags for an S3 on Outposts bucket. For
      # more information, see Using Amazon S3 on Outposts in the Amazon S3 User Guide . Use tags to organize
      # your Amazon Web Services bill to reflect your own cost structure. To do this, sign up to get your
      # Amazon Web Services account bill with tag key values included. Then, to see the cost of combined
      # resources, organize your billing information according to resources with the same tag key values.
      # For example, you can tag several resources with a specific application name, and then organize your
      # billing information to see the total cost of that application across several services. For more
      # information, see Cost allocation and tagging . Within a bucket, if you add a tag that has the same
      # key as an existing tag, the new value overwrites the old value. For more information, see Using cost
      # allocation in Amazon S3 bucket tags . To use this action, you must have permissions to perform the
      # s3-outposts:PutBucketTagging action. The Outposts bucket owner has this permission by default and
      # can grant this permission to others. For more information about permissions, see Permissions Related
      # to Bucket Subresource Operations and Managing access permissions to your Amazon S3 resources .
      # PutBucketTagging has the following special errors: Error code: InvalidTagError Description: The tag
      # provided was not a valid tag. This error can occur if the tag did not pass input validation. For
      # information about tag restrictions, see User-Defined Tag Restrictions and Amazon Web
      # Services-Generated Cost Allocation Tag Restrictions . Error code: MalformedXMLError Description: The
      # XML provided does not match the schema. Error code: OperationAbortedError Description: A conflicting
      # conditional action is currently in progress against this resource. Try again. Error code:
      # InternalError Description: The service was unable to apply the provided tag to the bucket. All
      # Amazon S3 on Outposts REST API requests for this action require an additional parameter of
      # x-amz-outpost-id to be passed with the request. In addition, you must use an S3 on Outposts endpoint
      # hostname prefix instead of s3-control . For an example of the request syntax for Amazon S3 on
      # Outposts that uses the S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id derived by
      # using the access point ARN, see the Examples section. The following actions are related to
      # PutBucketTagging : GetBucketTagging DeleteBucketTagging

      def put_bucket_tagging(
        account_id : String,
        bucket : String,
        tagging : Types::Tagging
      ) : Nil

        input = Types::PutBucketTaggingRequest.new(account_id: account_id, bucket: bucket, tagging: tagging)
        put_bucket_tagging(input)
      end

      def put_bucket_tagging(input : Types::PutBucketTaggingRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation sets the versioning state for S3 on Outposts buckets only. To set the versioning
      # state for an S3 bucket, see PutBucketVersioning in the Amazon S3 API Reference . Sets the versioning
      # state for an S3 on Outposts bucket. With S3 Versioning, you can save multiple distinct copies of
      # your objects and recover from unintended user actions and application failures. You can set the
      # versioning state to one of the following: Enabled - Enables versioning for the objects in the
      # bucket. All objects added to the bucket receive a unique version ID. Suspended - Suspends versioning
      # for the objects in the bucket. All objects added to the bucket receive the version ID null . If
      # you've never set versioning on your bucket, it has no versioning state. In that case, a
      # GetBucketVersioning request does not return a versioning state value. When you enable S3 Versioning,
      # for each object in your bucket, you have a current version and zero or more noncurrent versions. You
      # can configure your bucket S3 Lifecycle rules to expire noncurrent versions after a specified time
      # period. For more information, see Creating and managing a lifecycle configuration for your S3 on
      # Outposts bucket in the Amazon S3 User Guide . If you have an object expiration lifecycle
      # configuration in your non-versioned bucket and you want to maintain the same permanent delete
      # behavior when you enable versioning, you must add a noncurrent expiration policy. The noncurrent
      # expiration lifecycle configuration will manage the deletes of the noncurrent object versions in the
      # version-enabled bucket. For more information, see Versioning in the Amazon S3 User Guide . All
      # Amazon S3 on Outposts REST API requests for this action require an additional parameter of
      # x-amz-outpost-id to be passed with the request. In addition, you must use an S3 on Outposts endpoint
      # hostname prefix instead of s3-control . For an example of the request syntax for Amazon S3 on
      # Outposts that uses the S3 on Outposts endpoint hostname prefix and the x-amz-outpost-id derived by
      # using the access point ARN, see the Examples section. The following operations are related to
      # PutBucketVersioning for S3 on Outposts. GetBucketVersioning PutBucketLifecycleConfiguration
      # GetBucketLifecycleConfiguration

      def put_bucket_versioning(
        account_id : String,
        bucket : String,
        versioning_configuration : Types::VersioningConfiguration,
        mfa : String? = nil
      ) : Nil

        input = Types::PutBucketVersioningRequest.new(account_id: account_id, bucket: bucket, versioning_configuration: versioning_configuration, mfa: mfa)
        put_bucket_versioning(input)
      end

      def put_bucket_versioning(input : Types::PutBucketVersioningRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_VERSIONING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Sets the supplied tag-set on an S3 Batch Operations job. A tag is a key-value pair. You can
      # associate S3 Batch Operations tags with any job by sending a PUT request against the tagging
      # subresource that is associated with the job. To modify the existing tag set, you can either replace
      # the existing tag set entirely, or make changes within the existing tag set by retrieving the
      # existing tag set using GetJobTagging , modify that tag set, and use this operation to replace the
      # tag set with the one you modified. For more information, see Controlling access and labeling jobs
      # using tags in the Amazon S3 User Guide . If you send this request with an empty tag set, Amazon S3
      # deletes the existing tag set on the Batch Operations job. If you use this method, you are charged
      # for a Tier 1 Request (PUT). For more information, see Amazon S3 pricing . For deleting existing tags
      # for your Batch Operations job, a DeleteJobTagging request is preferred because it achieves the same
      # result without incurring charges. A few things to consider about using tags: Amazon S3 limits the
      # maximum number of tags to 50 tags per job. You can associate up to 50 tags with a job as long as
      # they have unique tag keys. A tag key can be up to 128 Unicode characters in length, and tag values
      # can be up to 256 Unicode characters in length. The key and values are case sensitive. For
      # tagging-related restrictions related to characters and encodings, see User-Defined Tag Restrictions
      # in the Billing and Cost Management User Guide . Permissions To use the PutJobTagging operation, you
      # must have permission to perform the s3:PutJobTagging action. Related actions include: CreateJob
      # GetJobTagging DeleteJobTagging

      def put_job_tagging(
        account_id : String,
        job_id : String,
        tags : Array(Types::S3Tag)
      ) : Types::PutJobTaggingResult

        input = Types::PutJobTaggingRequest.new(account_id: account_id, job_id: job_id, tags: tags)
        put_job_tagging(input)
      end

      def put_job_tagging(input : Types::PutJobTaggingRequest) : Types::PutJobTaggingResult
        request = Protocol::RestXml.build_request(Model::PUT_JOB_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PutJobTaggingResult, "PutJobTagging")
      end

      # This operation is not supported by directory buckets. Associates an access control policy with the
      # specified Multi-Region Access Point. Each Multi-Region Access Point can have only one policy, so a
      # request made to this action replaces any existing policy that is associated with the specified
      # Multi-Region Access Point. This action will always be routed to the US West (Oregon) Region. For
      # more information about the restrictions around working with Multi-Region Access Points, see
      # Multi-Region Access Point restrictions and limitations in the Amazon S3 User Guide . The following
      # actions are related to PutMultiRegionAccessPointPolicy : GetMultiRegionAccessPointPolicy
      # GetMultiRegionAccessPointPolicyStatus

      def put_multi_region_access_point_policy(
        account_id : String,
        client_token : String,
        details : Types::PutMultiRegionAccessPointPolicyInput
      ) : Types::PutMultiRegionAccessPointPolicyResult

        input = Types::PutMultiRegionAccessPointPolicyRequest.new(account_id: account_id, client_token: client_token, details: details)
        put_multi_region_access_point_policy(input)
      end

      def put_multi_region_access_point_policy(input : Types::PutMultiRegionAccessPointPolicyRequest) : Types::PutMultiRegionAccessPointPolicyResult
        request = Protocol::RestXml.build_request(Model::PUT_MULTI_REGION_ACCESS_POINT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PutMultiRegionAccessPointPolicyResult, "PutMultiRegionAccessPointPolicy")
      end

      # This operation is not supported by directory buckets. Creates or modifies the PublicAccessBlock
      # configuration for an Amazon Web Services account. This operation may be restricted when the account
      # is managed by organization-level Block Public Access policies. You might get an Access Denied (403)
      # error when the account is managed by organization-level Block Public Access policies.
      # Organization-level policies override account-level settings, preventing direct account-level
      # modifications. For this operation, users must have the s3:PutAccountPublicAccessBlock permission.
      # For more information, see Using Amazon S3 block public access . Related actions include:
      # GetPublicAccessBlock DeletePublicAccessBlock

      def put_public_access_block(
        account_id : String,
        public_access_block_configuration : Types::PublicAccessBlockConfiguration
      ) : Nil

        input = Types::PutPublicAccessBlockRequest.new(account_id: account_id, public_access_block_configuration: public_access_block_configuration)
        put_public_access_block(input)
      end

      def put_public_access_block(input : Types::PutPublicAccessBlockRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_PUBLIC_ACCESS_BLOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported by directory buckets. Puts an Amazon S3 Storage Lens configuration.
      # For more information about S3 Storage Lens, see Working with Amazon S3 Storage Lens in the Amazon S3
      # User Guide . For a complete list of S3 Storage Lens metrics, see S3 Storage Lens metrics glossary in
      # the Amazon S3 User Guide . To use this action, you must have permission to perform the
      # s3:PutStorageLensConfiguration action. For more information, see Setting permissions to use Amazon
      # S3 Storage Lens in the Amazon S3 User Guide .

      def put_storage_lens_configuration(
        account_id : String,
        config_id : String,
        storage_lens_configuration : Types::StorageLensConfiguration,
        tags : Array(Types::StorageLensTag)? = nil
      ) : Nil

        input = Types::PutStorageLensConfigurationRequest.new(account_id: account_id, config_id: config_id, storage_lens_configuration: storage_lens_configuration, tags: tags)
        put_storage_lens_configuration(input)
      end

      def put_storage_lens_configuration(input : Types::PutStorageLensConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_STORAGE_LENS_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported by directory buckets. Put or replace tags on an existing Amazon S3
      # Storage Lens configuration. For more information about S3 Storage Lens, see Assessing your storage
      # activity and usage with Amazon S3 Storage Lens in the Amazon S3 User Guide . To use this action, you
      # must have permission to perform the s3:PutStorageLensConfigurationTagging action. For more
      # information, see Setting permissions to use Amazon S3 Storage Lens in the Amazon S3 User Guide .

      def put_storage_lens_configuration_tagging(
        account_id : String,
        config_id : String,
        tags : Array(Types::StorageLensTag)
      ) : Types::PutStorageLensConfigurationTaggingResult

        input = Types::PutStorageLensConfigurationTaggingRequest.new(account_id: account_id, config_id: config_id, tags: tags)
        put_storage_lens_configuration_tagging(input)
      end

      def put_storage_lens_configuration_tagging(input : Types::PutStorageLensConfigurationTaggingRequest) : Types::PutStorageLensConfigurationTaggingResult
        request = Protocol::RestXml.build_request(Model::PUT_STORAGE_LENS_CONFIGURATION_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PutStorageLensConfigurationTaggingResult, "PutStorageLensConfigurationTagging")
      end

      # This operation is not supported by directory buckets. Submits an updated route configuration for a
      # Multi-Region Access Point. This API operation updates the routing status for the specified Regions
      # from active to passive, or from passive to active. A value of 0 indicates a passive status, which
      # means that traffic won't be routed to the specified Region. A value of 100 indicates an active
      # status, which means that traffic will be routed to the specified Region. At least one Region must be
      # active at all times. When the routing configuration is changed, any in-progress operations (uploads,
      # copies, deletes, and so on) to formerly active Regions will continue to run to their final
      # completion state (success or failure). The routing configurations of any Regions that aren’t
      # specified remain unchanged. Updated routing configurations might not be immediately applied. It can
      # take up to 2 minutes for your changes to take effect. To submit routing control changes and failover
      # requests, use the Amazon S3 failover control infrastructure endpoints in these five Amazon Web
      # Services Regions: us-east-1 us-west-2 ap-southeast-2 ap-northeast-1 eu-west-1

      def submit_multi_region_access_point_routes(
        account_id : String,
        mrap : String,
        route_updates : Array(Types::MultiRegionAccessPointRoute)
      ) : Types::SubmitMultiRegionAccessPointRoutesResult

        input = Types::SubmitMultiRegionAccessPointRoutesRequest.new(account_id: account_id, mrap: mrap, route_updates: route_updates)
        submit_multi_region_access_point_routes(input)
      end

      def submit_multi_region_access_point_routes(input : Types::SubmitMultiRegionAccessPointRoutesRequest) : Types::SubmitMultiRegionAccessPointRoutesResult
        request = Protocol::RestXml.build_request(Model::SUBMIT_MULTI_REGION_ACCESS_POINT_ROUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::SubmitMultiRegionAccessPointRoutesResult, "SubmitMultiRegionAccessPointRoutes")
      end

      # Creates a new user-defined tag or updates an existing tag. Each tag is a label consisting of a key
      # and value that is applied to your resource. Tags can help you organize, track costs for, and control
      # access to your resources. You can add up to 50 Amazon Web Services resource tags for each S3
      # resource. This operation is only supported for the following Amazon S3 resource: General purpose
      # buckets Access Points for directory buckets Access Points for general purpose buckets Directory
      # buckets S3 Storage Lens groups S3 Access Grants instances, registered locations, or grants .
      # Permissions For general purpose buckets, access points for general purpose buckets, Storage Lens
      # groups, and S3 Access Grants, you must have the s3:TagResource permission to use this operation.
      # Directory bucket permissions For directory buckets, you must have the s3express:TagResource
      # permission to use this operation. For more information about directory buckets policies and
      # permissions, see Identity and Access Management (IAM) for S3 Express One Zone in the Amazon S3 User
      # Guide . HTTP Host header syntax Directory buckets - The HTTP Host header syntax is
      # s3express-control. region .amazonaws.com . For information about S3 Tagging errors, see List of
      # Amazon S3 Tagging error codes .

      def tag_resource(
        account_id : String,
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResult

        input = Types::TagResourceRequest.new(account_id: account_id, resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResult
        request = Protocol::RestXml.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::TagResourceResult, "TagResource")
      end

      # This operation removes the specified user-defined tags from an S3 resource. You can pass one or more
      # tag keys. This operation is only supported for the following Amazon S3 resources: General purpose
      # buckets Access Points for directory buckets Access Points for general purpose buckets Directory
      # buckets S3 Storage Lens groups S3 Access Grants instances, registered locations, and grants .
      # Permissions For general purpose buckets, access points for general purpose buckets, Storage Lens
      # groups, and S3 Access Grants, you must have the s3:UntagResource permission to use this operation.
      # Directory bucket permissions For directory buckets, you must have the s3express:UntagResource
      # permission to use this operation. For more information about directory buckets policies and
      # permissions, see Identity and Access Management (IAM) for S3 Express One Zone in the Amazon S3 User
      # Guide . HTTP Host header syntax Directory buckets - The HTTP Host header syntax is
      # s3express-control. region .amazonaws.com . For information about S3 Tagging errors, see List of
      # Amazon S3 Tagging error codes .

      def untag_resource(
        account_id : String,
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResult

        input = Types::UntagResourceRequest.new(account_id: account_id, resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResult
        request = Protocol::RestXml.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UntagResourceResult, "UntagResource")
      end

      # Updates the IAM role of a registered location in your S3 Access Grants instance. Permissions You
      # must have the s3:UpdateAccessGrantsLocation permission to use this operation. Additional Permissions
      # You must also have the following permission: iam:PassRole

      def update_access_grants_location(
        access_grants_location_id : String,
        account_id : String,
        iam_role_arn : String
      ) : Types::UpdateAccessGrantsLocationResult

        input = Types::UpdateAccessGrantsLocationRequest.new(access_grants_location_id: access_grants_location_id, account_id: account_id, iam_role_arn: iam_role_arn)
        update_access_grants_location(input)
      end

      def update_access_grants_location(input : Types::UpdateAccessGrantsLocationRequest) : Types::UpdateAccessGrantsLocationResult
        request = Protocol::RestXml.build_request(Model::UPDATE_ACCESS_GRANTS_LOCATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateAccessGrantsLocationResult, "UpdateAccessGrantsLocation")
      end

      # Updates an existing S3 Batch Operations job's priority. For more information, see S3 Batch
      # Operations in the Amazon S3 User Guide . Permissions To use the UpdateJobPriority operation, you
      # must have permission to perform the s3:UpdateJobPriority action. Related actions include: CreateJob
      # ListJobs DescribeJob UpdateJobStatus

      def update_job_priority(
        account_id : String,
        job_id : String,
        priority : Int32
      ) : Types::UpdateJobPriorityResult

        input = Types::UpdateJobPriorityRequest.new(account_id: account_id, job_id: job_id, priority: priority)
        update_job_priority(input)
      end

      def update_job_priority(input : Types::UpdateJobPriorityRequest) : Types::UpdateJobPriorityResult
        request = Protocol::RestXml.build_request(Model::UPDATE_JOB_PRIORITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateJobPriorityResult, "UpdateJobPriority")
      end

      # Updates the status for the specified job. Use this operation to confirm that you want to run a job
      # or to cancel an existing job. For more information, see S3 Batch Operations in the Amazon S3 User
      # Guide . Permissions To use the UpdateJobStatus operation, you must have permission to perform the
      # s3:UpdateJobStatus action. Related actions include: CreateJob ListJobs DescribeJob UpdateJobStatus

      def update_job_status(
        account_id : String,
        job_id : String,
        requested_job_status : String,
        status_update_reason : String? = nil
      ) : Types::UpdateJobStatusResult

        input = Types::UpdateJobStatusRequest.new(account_id: account_id, job_id: job_id, requested_job_status: requested_job_status, status_update_reason: status_update_reason)
        update_job_status(input)
      end

      def update_job_status(input : Types::UpdateJobStatusRequest) : Types::UpdateJobStatusResult
        request = Protocol::RestXml.build_request(Model::UPDATE_JOB_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateJobStatusResult, "UpdateJobStatus")
      end

      # Updates the existing Storage Lens group. To use this operation, you must have the permission to
      # perform the s3:UpdateStorageLensGroup action. For more information about the required Storage Lens
      # Groups permissions, see Setting account permissions to use S3 Storage Lens groups . For information
      # about Storage Lens groups errors, see List of Amazon S3 Storage Lens error codes .

      def update_storage_lens_group(
        account_id : String,
        name : String,
        storage_lens_group : Types::StorageLensGroup
      ) : Nil

        input = Types::UpdateStorageLensGroupRequest.new(account_id: account_id, name: name, storage_lens_group: storage_lens_group)
        update_storage_lens_group(input)
      end

      def update_storage_lens_group(input : Types::UpdateStorageLensGroupRequest) : Nil
        request = Protocol::RestXml.build_request(Model::UPDATE_STORAGE_LENS_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
