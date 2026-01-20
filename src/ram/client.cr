module Aws
  module RAM
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Accepts an invitation to a resource share from another Amazon Web Services account. After you accept
      # the invitation, the resources included in the resource share are available to interact with in the
      # relevant Amazon Web Services Management Consoles and tools.

      def accept_resource_share_invitation(
        resource_share_invitation_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AcceptResourceShareInvitationRequest.new(resource_share_invitation_arn: resource_share_invitation_arn, client_token: client_token)
        accept_resource_share_invitation(input)
      end

      def accept_resource_share_invitation(input : Types::AcceptResourceShareInvitationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_RESOURCE_SHARE_INVITATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified list of principals and list of resources to a resource share. Principals that
      # already have access to this resource share immediately receive access to the added resources. Newly
      # added principals immediately receive access to the resources shared in this resource share.

      def associate_resource_share(
        resource_share_arn : String,
        client_token : String? = nil,
        principals : Array(String)? = nil,
        resource_arns : Array(String)? = nil,
        sources : Array(String)? = nil
      ) : Protocol::Request
        input = Types::AssociateResourceShareRequest.new(resource_share_arn: resource_share_arn, client_token: client_token, principals: principals, resource_arns: resource_arns, sources: sources)
        associate_resource_share(input)
      end

      def associate_resource_share(input : Types::AssociateResourceShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_RESOURCE_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or replaces the RAM permission for a resource type included in a resource share. You can have
      # exactly one permission associated with each resource type in the resource share. You can add a new
      # RAM permission only if there are currently no resources of that resource type currently in the
      # resource share.

      def associate_resource_share_permission(
        permission_arn : String,
        resource_share_arn : String,
        client_token : String? = nil,
        permission_version : Int32? = nil,
        replace : Bool? = nil
      ) : Protocol::Request
        input = Types::AssociateResourceSharePermissionRequest.new(permission_arn: permission_arn, resource_share_arn: resource_share_arn, client_token: client_token, permission_version: permission_version, replace: replace)
        associate_resource_share_permission(input)
      end

      def associate_resource_share_permission(input : Types::AssociateResourceSharePermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_RESOURCE_SHARE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a customer managed permission for a specified resource type that you can attach to resource
      # shares. It is created in the Amazon Web Services Region in which you call the operation.

      def create_permission(
        name : String,
        policy_template : String,
        resource_type : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreatePermissionRequest.new(name: name, policy_template: policy_template, resource_type: resource_type, client_token: client_token, tags: tags)
        create_permission(input)
      end

      def create_permission(input : Types::CreatePermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new version of the specified customer managed permission. The new version is automatically
      # set as the default version of the customer managed permission. New resource shares automatically use
      # the default permission. Existing resource shares continue to use their original permission versions,
      # but you can use ReplacePermissionAssociations to update them. If the specified customer managed
      # permission already has the maximum of 5 versions, then you must delete one of the existing versions
      # before you can create a new one.

      def create_permission_version(
        permission_arn : String,
        policy_template : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreatePermissionVersionRequest.new(permission_arn: permission_arn, policy_template: policy_template, client_token: client_token)
        create_permission_version(input)
      end

      def create_permission_version(input : Types::CreatePermissionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PERMISSION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a resource share. You can provide a list of the Amazon Resource Names (ARNs) for the
      # resources that you want to share, a list of principals you want to share the resources with, and the
      # permissions to grant those principals. Sharing a resource makes it available for use by principals
      # outside of the Amazon Web Services account that created the resource. Sharing doesn't change any
      # permissions or quotas that apply to the resource in the account that created it.

      def create_resource_share(
        name : String,
        allow_external_principals : Bool? = nil,
        client_token : String? = nil,
        permission_arns : Array(String)? = nil,
        principals : Array(String)? = nil,
        resource_arns : Array(String)? = nil,
        sources : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateResourceShareRequest.new(name: name, allow_external_principals: allow_external_principals, client_token: client_token, permission_arns: permission_arns, principals: principals, resource_arns: resource_arns, sources: sources, tags: tags)
        create_resource_share(input)
      end

      def create_resource_share(input : Types::CreateResourceShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESOURCE_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified customer managed permission in the Amazon Web Services Region in which you
      # call this operation. You can delete a customer managed permission only if it isn't attached to any
      # resource share. The operation deletes all versions associated with the customer managed permission.

      def delete_permission(
        permission_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeletePermissionRequest.new(permission_arn: permission_arn, client_token: client_token)
        delete_permission(input)
      end

      def delete_permission(input : Types::DeletePermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes one version of a customer managed permission. The version you specify must not be attached
      # to any resource share and must not be the default version for the permission. If a customer managed
      # permission has the maximum of 5 versions, then you must delete at least one version before you can
      # create another.

      def delete_permission_version(
        permission_arn : String,
        permission_version : Int32,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeletePermissionVersionRequest.new(permission_arn: permission_arn, permission_version: permission_version, client_token: client_token)
        delete_permission_version(input)
      end

      def delete_permission_version(input : Types::DeletePermissionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PERMISSION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified resource share. This doesn't delete any of the resources that were associated
      # with the resource share; it only stops the sharing of those resources through this resource share.

      def delete_resource_share(
        resource_share_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteResourceShareRequest.new(resource_share_arn: resource_share_arn, client_token: client_token)
        delete_resource_share(input)
      end

      def delete_resource_share(input : Types::DeleteResourceShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified principals or resources from participating in the specified resource share.

      def disassociate_resource_share(
        resource_share_arn : String,
        client_token : String? = nil,
        principals : Array(String)? = nil,
        resource_arns : Array(String)? = nil,
        sources : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DisassociateResourceShareRequest.new(resource_share_arn: resource_share_arn, client_token: client_token, principals: principals, resource_arns: resource_arns, sources: sources)
        disassociate_resource_share(input)
      end

      def disassociate_resource_share(input : Types::DisassociateResourceShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_RESOURCE_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a managed permission from a resource share. Permission changes take effect immediately. You
      # can remove a managed permission from a resource share only if there are currently no resources of
      # the relevant resource type currently attached to the resource share.

      def disassociate_resource_share_permission(
        permission_arn : String,
        resource_share_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateResourceSharePermissionRequest.new(permission_arn: permission_arn, resource_share_arn: resource_share_arn, client_token: client_token)
        disassociate_resource_share_permission(input)
      end

      def disassociate_resource_share_permission(input : Types::DisassociateResourceSharePermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_RESOURCE_SHARE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables resource sharing within your organization in Organizations. This operation creates a
      # service-linked role called AWSServiceRoleForResourceAccessManager that has the IAM managed policy
      # named AWSResourceAccessManagerServiceRolePolicy attached. This role permits RAM to retrieve
      # information about the organization and its structure. This lets you share resources with all of the
      # accounts in the calling account's organization by specifying the organization ID, or all of the
      # accounts in an organizational unit (OU) by specifying the OU ID. Until you enable sharing within the
      # organization, you can specify only individual Amazon Web Services accounts, or for supported
      # resource types, IAM roles and users. You must call this operation from an IAM role or user in the
      # organization's management account.

      def enable_sharing_with_aws_organization : Protocol::Request
        input = Types::EnableSharingWithAwsOrganizationRequest.new
        enable_sharing_with_aws_organization(input)
      end

      def enable_sharing_with_aws_organization(input : Types::EnableSharingWithAwsOrganizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_SHARING_WITH_AWS_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the contents of a managed permission in JSON format.

      def get_permission(
        permission_arn : String,
        permission_version : Int32? = nil
      ) : Protocol::Request
        input = Types::GetPermissionRequest.new(permission_arn: permission_arn, permission_version: permission_version)
        get_permission(input)
      end

      def get_permission(input : Types::GetPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the resource policies for the specified resources that you own and have shared.

      def get_resource_policies(
        resource_arns : Array(String),
        max_results : Int32? = nil,
        next_token : String? = nil,
        principal : String? = nil
      ) : Protocol::Request
        input = Types::GetResourcePoliciesRequest.new(resource_arns: resource_arns, max_results: max_results, next_token: next_token, principal: principal)
        get_resource_policies(input)
      end

      def get_resource_policies(input : Types::GetResourcePoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the lists of resources and principals that associated for resource shares that you own.

      def get_resource_share_associations(
        association_type : String,
        association_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        principal : String? = nil,
        resource_arn : String? = nil,
        resource_share_arns : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetResourceShareAssociationsRequest.new(association_type: association_type, association_status: association_status, max_results: max_results, next_token: next_token, principal: principal, resource_arn: resource_arn, resource_share_arns: resource_share_arns)
        get_resource_share_associations(input)
      end

      def get_resource_share_associations(input : Types::GetResourceShareAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_SHARE_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about invitations that you have received for resource shares.

      def get_resource_share_invitations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_share_arns : Array(String)? = nil,
        resource_share_invitation_arns : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetResourceShareInvitationsRequest.new(max_results: max_results, next_token: next_token, resource_share_arns: resource_share_arns, resource_share_invitation_arns: resource_share_invitation_arns)
        get_resource_share_invitations(input)
      end

      def get_resource_share_invitations(input : Types::GetResourceShareInvitationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_SHARE_INVITATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about the resource shares that you own or that are shared with you.

      def get_resource_shares(
        resource_owner : String,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        permission_arn : String? = nil,
        permission_version : Int32? = nil,
        resource_share_arns : Array(String)? = nil,
        resource_share_status : String? = nil,
        tag_filters : Array(Types::TagFilter)? = nil
      ) : Protocol::Request
        input = Types::GetResourceSharesRequest.new(resource_owner: resource_owner, max_results: max_results, name: name, next_token: next_token, permission_arn: permission_arn, permission_version: permission_version, resource_share_arns: resource_share_arns, resource_share_status: resource_share_status, tag_filters: tag_filters)
        get_resource_shares(input)
      end

      def get_resource_shares(input : Types::GetResourceSharesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_SHARES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the resources in a resource share that is shared with you but for which the invitation is
      # still PENDING . That means that you haven't accepted or rejected the invitation and the invitation
      # hasn't expired.

      def list_pending_invitation_resources(
        resource_share_invitation_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_region_scope : String? = nil
      ) : Protocol::Request
        input = Types::ListPendingInvitationResourcesRequest.new(resource_share_invitation_arn: resource_share_invitation_arn, max_results: max_results, next_token: next_token, resource_region_scope: resource_region_scope)
        list_pending_invitation_resources(input)
      end

      def list_pending_invitation_resources(input : Types::ListPendingInvitationResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PENDING_INVITATION_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about the managed permission and its associations to any resource shares that use
      # this managed permission. This lets you see which resource shares use which versions of the specified
      # managed permission.

      def list_permission_associations(
        association_status : String? = nil,
        default_version : Bool? = nil,
        feature_set : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        permission_arn : String? = nil,
        permission_version : Int32? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListPermissionAssociationsRequest.new(association_status: association_status, default_version: default_version, feature_set: feature_set, max_results: max_results, next_token: next_token, permission_arn: permission_arn, permission_version: permission_version, resource_type: resource_type)
        list_permission_associations(input)
      end

      def list_permission_associations(input : Types::ListPermissionAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PERMISSION_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the available versions of the specified RAM permission.

      def list_permission_versions(
        permission_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPermissionVersionsRequest.new(permission_arn: permission_arn, max_results: max_results, next_token: next_token)
        list_permission_versions(input)
      end

      def list_permission_versions(input : Types::ListPermissionVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PERMISSION_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of available RAM permissions that you can use for the supported resource types.

      def list_permissions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        permission_type : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListPermissionsRequest.new(max_results: max_results, next_token: next_token, permission_type: permission_type, resource_type: resource_type)
        list_permissions(input)
      end

      def list_permissions(input : Types::ListPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the principals that you are sharing resources with or that are sharing resources with you.

      def list_principals(
        resource_owner : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        principals : Array(String)? = nil,
        resource_arn : String? = nil,
        resource_share_arns : Array(String)? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListPrincipalsRequest.new(resource_owner: resource_owner, max_results: max_results, next_token: next_token, principals: principals, resource_arn: resource_arn, resource_share_arns: resource_share_arns, resource_type: resource_type)
        list_principals(input)
      end

      def list_principals(input : Types::ListPrincipalsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRINCIPALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current status of the asynchronous tasks performed by RAM when you perform the
      # ReplacePermissionAssociationsWork operation.

      def list_replace_permission_associations_work(
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil,
        work_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListReplacePermissionAssociationsWorkRequest.new(max_results: max_results, next_token: next_token, status: status, work_ids: work_ids)
        list_replace_permission_associations_work(input)
      end

      def list_replace_permission_associations_work(input : Types::ListReplacePermissionAssociationsWorkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REPLACE_PERMISSION_ASSOCIATIONS_WORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the RAM permissions that are associated with a resource share.

      def list_resource_share_permissions(
        resource_share_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResourceSharePermissionsRequest.new(resource_share_arn: resource_share_arn, max_results: max_results, next_token: next_token)
        list_resource_share_permissions(input)
      end

      def list_resource_share_permissions(input : Types::ListResourceSharePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_SHARE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the resource types that can be shared by RAM.

      def list_resource_types(
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_region_scope : String? = nil
      ) : Protocol::Request
        input = Types::ListResourceTypesRequest.new(max_results: max_results, next_token: next_token, resource_region_scope: resource_region_scope)
        list_resource_types(input)
      end

      def list_resource_types(input : Types::ListResourceTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the resources that you added to a resource share or the resources that are shared with you.

      def list_resources(
        resource_owner : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        principal : String? = nil,
        resource_arns : Array(String)? = nil,
        resource_region_scope : String? = nil,
        resource_share_arns : Array(String)? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListResourcesRequest.new(resource_owner: resource_owner, max_results: max_results, next_token: next_token, principal: principal, resource_arns: resource_arns, resource_region_scope: resource_region_scope, resource_share_arns: resource_share_arns, resource_type: resource_type)
        list_resources(input)
      end

      def list_resources(input : Types::ListResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # When you attach a resource-based policy to a resource, RAM automatically creates a resource share of
      # featureSet = CREATED_FROM_POLICY with a managed permission that has the same IAM permissions as the
      # original resource-based policy. However, this type of managed permission is visible to only the
      # resource share owner, and the associated resource share can't be modified by using RAM. This
      # operation creates a separate, fully manageable customer managed permission that has the same IAM
      # permissions as the original resource-based policy. You can associate this customer managed
      # permission to any resource shares. Before you use PromoteResourceShareCreatedFromPolicy , you should
      # first run this operation to ensure that you have an appropriate customer managed permission that can
      # be associated with the promoted resource share. The original CREATED_FROM_POLICY policy isn't
      # deleted, and resource shares using that original policy aren't automatically updated. You can't
      # modify a CREATED_FROM_POLICY resource share so you can't associate the new customer managed
      # permission by using ReplacePermsissionAssociations . However, if you use
      # PromoteResourceShareCreatedFromPolicy , that operation automatically associates the fully manageable
      # customer managed permission to the newly promoted STANDARD resource share. After you promote a
      # resource share, if the original CREATED_FROM_POLICY managed permission has no other associations to
      # A resource share, then RAM automatically deletes it.

      def promote_permission_created_from_policy(
        name : String,
        permission_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::PromotePermissionCreatedFromPolicyRequest.new(name: name, permission_arn: permission_arn, client_token: client_token)
        promote_permission_created_from_policy(input)
      end

      def promote_permission_created_from_policy(input : Types::PromotePermissionCreatedFromPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PROMOTE_PERMISSION_CREATED_FROM_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # When you attach a resource-based policy to a resource, RAM automatically creates a resource share of
      # featureSet = CREATED_FROM_POLICY with a managed permission that has the same IAM permissions as the
      # original resource-based policy. However, this type of managed permission is visible to only the
      # resource share owner, and the associated resource share can't be modified by using RAM. This
      # operation promotes the resource share to a STANDARD resource share that is fully manageable in RAM.
      # When you promote a resource share, you can then manage the resource share in RAM and it becomes
      # visible to all of the principals you shared it with. Before you perform this operation, you should
      # first run PromotePermissionCreatedFromPolicy to ensure that you have an appropriate customer managed
      # permission that can be associated with this resource share after its is promoted. If this operation
      # can't find a managed permission that exactly matches the existing CREATED_FROM_POLICY permission,
      # then this operation fails.

      def promote_resource_share_created_from_policy(
        resource_share_arn : String
      ) : Protocol::Request
        input = Types::PromoteResourceShareCreatedFromPolicyRequest.new(resource_share_arn: resource_share_arn)
        promote_resource_share_created_from_policy(input)
      end

      def promote_resource_share_created_from_policy(input : Types::PromoteResourceShareCreatedFromPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PROMOTE_RESOURCE_SHARE_CREATED_FROM_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Rejects an invitation to a resource share from another Amazon Web Services account.

      def reject_resource_share_invitation(
        resource_share_invitation_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::RejectResourceShareInvitationRequest.new(resource_share_invitation_arn: resource_share_invitation_arn, client_token: client_token)
        reject_resource_share_invitation(input)
      end

      def reject_resource_share_invitation(input : Types::RejectResourceShareInvitationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_RESOURCE_SHARE_INVITATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates all resource shares that use a managed permission to a different managed permission. This
      # operation always applies the default version of the target managed permission. You can optionally
      # specify that the update applies to only resource shares that currently use a specified version. This
      # enables you to update to the latest version, without changing the which managed permission is used.
      # You can use this operation to update all of your resource shares to use the current default version
      # of the permission by specifying the same value for the fromPermissionArn and toPermissionArn
      # parameters. You can use the optional fromPermissionVersion parameter to update only those resources
      # that use a specified version of the managed permission to the new managed permission. To
      # successfully perform this operation, you must have permission to update the resource-based policy on
      # all affected resource types.

      def replace_permission_associations(
        from_permission_arn : String,
        to_permission_arn : String,
        client_token : String? = nil,
        from_permission_version : Int32? = nil
      ) : Protocol::Request
        input = Types::ReplacePermissionAssociationsRequest.new(from_permission_arn: from_permission_arn, to_permission_arn: to_permission_arn, client_token: client_token, from_permission_version: from_permission_version)
        replace_permission_associations(input)
      end

      def replace_permission_associations(input : Types::ReplacePermissionAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REPLACE_PERMISSION_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Designates the specified version number as the default version for the specified customer managed
      # permission. New resource shares automatically use this new default permission. Existing resource
      # shares continue to use their original permission version, but you can use
      # ReplacePermissionAssociations to update them.

      def set_default_permission_version(
        permission_arn : String,
        permission_version : Int32,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::SetDefaultPermissionVersionRequest.new(permission_arn: permission_arn, permission_version: permission_version, client_token: client_token)
        set_default_permission_version(input)
      end

      def set_default_permission_version(input : Types::SetDefaultPermissionVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SET_DEFAULT_PERMISSION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified tag keys and values to a resource share or managed permission. If you choose a
      # resource share, the tags are attached to only the resource share, not to the resources that are in
      # the resource share. The tags on a managed permission are the same for all versions of the managed
      # permission.

      def tag_resource(
        tags : Array(Types::Tag),
        resource_arn : String? = nil,
        resource_share_arn : String? = nil
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(tags: tags, resource_arn: resource_arn, resource_share_arn: resource_share_arn)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified tag key and value pairs from the specified resource share or managed
      # permission.

      def untag_resource(
        tag_keys : Array(String),
        resource_arn : String? = nil,
        resource_share_arn : String? = nil
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(tag_keys: tag_keys, resource_arn: resource_arn, resource_share_arn: resource_share_arn)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies some of the properties of the specified resource share.

      def update_resource_share(
        resource_share_arn : String,
        allow_external_principals : Bool? = nil,
        client_token : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateResourceShareRequest.new(resource_share_arn: resource_share_arn, allow_external_principals: allow_external_principals, client_token: client_token, name: name)
        update_resource_share(input)
      end

      def update_resource_share(input : Types::UpdateResourceShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
