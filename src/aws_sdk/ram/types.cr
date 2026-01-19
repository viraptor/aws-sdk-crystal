require "json"
require "time"

module AwsSdk
  module RAM
    module Types

      struct AcceptResourceShareInvitationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the invitation that you want to accept.
        @[JSON::Field(key: "resourceShareInvitationArn")]
        getter resource_share_invitation_arn : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @resource_share_invitation_arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct AcceptResourceShareInvitationResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An object that contains information about the specified invitation.
        @[JSON::Field(key: "resourceShareInvitation")]
        getter resource_share_invitation : Types::ResourceShareInvitation?

        def initialize(
          @client_token : String? = nil,
          @resource_share_invitation : Types::ResourceShareInvitation? = nil
        )
        end
      end

      struct AssociateResourceSharePermissionRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the RAM permission to associate with the resource share.
        # To find the ARN for a permission, use either the ListPermissions operation or go to the Permissions
        # library page in the RAM console and then choose the name of the permission. The ARN is displayed on
        # the detail page.
        @[JSON::Field(key: "permissionArn")]
        getter permission_arn : String

        # Specifies the Amazon Resource Name (ARN) of the resource share to which you want to add or replace
        # permissions.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies the version of the RAM permission to associate with the resource share. You can specify
        # only the version that is currently set as the default version for the permission. If you also set
        # the replace pararameter to true , then this operation updates an outdated version of the permission
        # to the current default version. You don't need to specify this parameter because the default
        # behavior is to use the version that is currently set as the default version for the permission. This
        # parameter is supported for backwards compatibility.
        @[JSON::Field(key: "permissionVersion")]
        getter permission_version : Int32?

        # Specifies whether the specified permission should replace the existing permission associated with
        # the resource share. Use true to replace the current permissions. Use false to add the permission to
        # a resource share that currently doesn't have a permission. The default value is false . A resource
        # share can have only one permission per resource type. If a resource share already has a permission
        # for the specified resource type and you don't set replace to true then the operation returns an
        # error. This helps prevent accidental overwriting of a permission.
        @[JSON::Field(key: "replace")]
        getter replace : Bool?

        def initialize(
          @permission_arn : String,
          @resource_share_arn : String,
          @client_token : String? = nil,
          @permission_version : Int32? = nil,
          @replace : Bool? = nil
        )
        end
      end

      struct AssociateResourceSharePermissionResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A return value of true indicates that the request succeeded. A value of false indicates that the
        # request failed.
        @[JSON::Field(key: "returnValue")]
        getter return_value : Bool?

        def initialize(
          @client_token : String? = nil,
          @return_value : Bool? = nil
        )
        end
      end

      struct AssociateResourceShareRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the resource share that you want to add principals or
        # resources to.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies a list of principals to whom you want to the resource share. This can be null if you want
        # to add only resources. What the principals can do with the resources in the share is determined by
        # the RAM permissions that you associate with the resource share. See AssociateResourceSharePermission
        # . You can include the following values: An Amazon Web Services account ID, for example: 123456789012
        # An Amazon Resource Name (ARN) of an organization in Organizations, for example:
        # organizations::123456789012:organization/o-exampleorgid An ARN of an organizational unit (OU) in
        # Organizations, for example:
        # organizations::123456789012:ou/o-exampleorgid/ou-examplerootid-exampleouid123 An ARN of an IAM role,
        # for example: iam::123456789012:role/rolename An ARN of an IAM user, for example:
        # iam::123456789012user/username Not all resource types can be shared with IAM roles and users. For
        # more information, see Sharing with IAM roles and users in the Resource Access Manager User Guide .
        @[JSON::Field(key: "principals")]
        getter principals : Array(String)?

        # Specifies a list of Amazon Resource Names (ARNs) of the resources that you want to share. This can
        # be null if you want to add only principals.
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        # Specifies from which source accounts the service principal has access to the resources in this
        # resource share.
        @[JSON::Field(key: "sources")]
        getter sources : Array(String)?

        def initialize(
          @resource_share_arn : String,
          @client_token : String? = nil,
          @principals : Array(String)? = nil,
          @resource_arns : Array(String)? = nil,
          @sources : Array(String)? = nil
        )
        end
      end

      struct AssociateResourceShareResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An array of objects that contain information about the associations.
        @[JSON::Field(key: "resourceShareAssociations")]
        getter resource_share_associations : Array(Types::ResourceShareAssociation)?

        def initialize(
          @client_token : String? = nil,
          @resource_share_associations : Array(Types::ResourceShareAssociation)? = nil
        )
        end
      end

      # An object that describes a managed permission associated with a resource share.
      struct AssociatedPermission
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the associated managed permission.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Indicates whether the associated resource share is using the default version of the permission.
        @[JSON::Field(key: "defaultVersion")]
        getter default_version : Bool?

        # Indicates what features are available for this resource share. This parameter can have one of the
        # following values: STANDARD – A resource share that supports all functionality. These resource shares
        # are visible to all principals you share the resource share with. You can modify these resource
        # shares in RAM using the console or APIs. This resource share might have been created by RAM, or it
        # might have been CREATED_FROM_POLICY and then promoted. CREATED_FROM_POLICY – The customer manually
        # shared a resource by attaching a resource-based policy. That policy did not match any existing
        # managed permissions, so RAM created this customer managed permission automatically on the customer's
        # behalf based on the attached policy document. This type of resource share is visible only to the
        # Amazon Web Services account that created it. You can't modify it in RAM unless you promote it. For
        # more information, see PromoteResourceShareCreatedFromPolicy . PROMOTING_TO_STANDARD – This resource
        # share was originally CREATED_FROM_POLICY , but the customer ran the
        # PromoteResourceShareCreatedFromPolicy and that operation is still in progress. This value changes to
        # STANDARD when complete.
        @[JSON::Field(key: "featureSet")]
        getter feature_set : String?

        # The date and time when the association between the permission and the resource share was last
        # updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        # The version of the permission currently associated with the resource share.
        @[JSON::Field(key: "permissionVersion")]
        getter permission_version : String?

        # The Amazon Resource Name (ARN) of a resource share associated with this permission.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String?

        # The resource type to which this permission applies.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The current status of the association between the permission and the resource share. The following
        # are the possible values: ATTACHABLE – This permission or version can be associated with resource
        # shares. UNATTACHABLE – This permission or version can't currently be associated with resource
        # shares. DELETING – This permission or version is in the process of being deleted. DELETED – This
        # permission or version is deleted.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @default_version : Bool? = nil,
          @feature_set : String? = nil,
          @last_updated_time : Time? = nil,
          @permission_version : String? = nil,
          @resource_share_arn : String? = nil,
          @resource_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreatePermissionRequest
        include JSON::Serializable

        # Specifies the name of the customer managed permission. The name must be unique within the Amazon Web
        # Services Region.
        @[JSON::Field(key: "name")]
        getter name : String

        # A string in JSON format string that contains the following elements of a resource-based policy:
        # Effect : must be set to ALLOW . Action : specifies the actions that are allowed by this customer
        # managed permission. The list must contain only actions that are supported by the specified resource
        # type. For a list of all actions supported by each resource type, see Actions, resources, and
        # condition keys for Amazon Web Services services in the Identity and Access Management User Guide .
        # Condition : (optional) specifies conditional parameters that must evaluate to true when a user
        # attempts an action for that action to be allowed. For more information about the Condition element,
        # see IAM policies: Condition element in the Identity and Access Management User Guide . This template
        # can't include either the Resource or Principal elements. Those are both filled in by RAM when it
        # instantiates the resource-based policy on each resource shared using this managed permission. The
        # Resource comes from the ARN of the specific resource that you are sharing. The Principal comes from
        # the list of identities added to the resource share.
        @[JSON::Field(key: "policyTemplate")]
        getter policy_template : String

        # Specifies the name of the resource type that this customer managed permission applies to. The format
        # is &lt;service-code&gt; : &lt;resource-type&gt; and is not case sensitive. For example, to specify
        # an Amazon EC2 Subnet, you can use the string ec2:subnet . To see the list of valid values for this
        # parameter, query the ListResourceTypes operation.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies a list of one or more tag key and value pairs to attach to the permission.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @policy_template : String,
          @resource_type : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreatePermissionResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A structure with information about this customer managed permission.
        @[JSON::Field(key: "permission")]
        getter permission : Types::ResourceSharePermissionSummary?

        def initialize(
          @client_token : String? = nil,
          @permission : Types::ResourceSharePermissionSummary? = nil
        )
        end
      end

      struct CreatePermissionVersionRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the customer managed permission you're creating a new
        # version for.
        @[JSON::Field(key: "permissionArn")]
        getter permission_arn : String

        # A string in JSON format string that contains the following elements of a resource-based policy:
        # Effect : must be set to ALLOW . Action : specifies the actions that are allowed by this customer
        # managed permission. The list must contain only actions that are supported by the specified resource
        # type. For a list of all actions supported by each resource type, see Actions, resources, and
        # condition keys for Amazon Web Services services in the Identity and Access Management User Guide .
        # Condition : (optional) specifies conditional parameters that must evaluate to true when a user
        # attempts an action for that action to be allowed. For more information about the Condition element,
        # see IAM policies: Condition element in the Identity and Access Management User Guide . This template
        # can't include either the Resource or Principal elements. Those are both filled in by RAM when it
        # instantiates the resource-based policy on each resource shared using this managed permission. The
        # Resource comes from the ARN of the specific resource that you are sharing. The Principal comes from
        # the list of identities added to the resource share.
        @[JSON::Field(key: "policyTemplate")]
        getter policy_template : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @permission_arn : String,
          @policy_template : String,
          @client_token : String? = nil
        )
        end
      end

      struct CreatePermissionVersionResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        @[JSON::Field(key: "permission")]
        getter permission : Types::ResourceSharePermissionDetail?

        def initialize(
          @client_token : String? = nil,
          @permission : Types::ResourceSharePermissionDetail? = nil
        )
        end
      end

      struct CreateResourceShareRequest
        include JSON::Serializable

        # Specifies the name of the resource share.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether principals outside your organization in Organizations can be associated with a
        # resource share. A value of true lets you share with individual Amazon Web Services accounts that are
        # not in your organization. A value of false only has meaning if your account is a member of an Amazon
        # Web Services Organization. The default value is true .
        @[JSON::Field(key: "allowExternalPrincipals")]
        getter allow_external_principals : Bool?

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies the Amazon Resource Names (ARNs) of the RAM permission to associate with the resource
        # share. If you do not specify an ARN for the permission, RAM automatically attaches the default
        # version of the permission for each resource type. You can associate only one permission with each
        # resource type included in the resource share.
        @[JSON::Field(key: "permissionArns")]
        getter permission_arns : Array(String)?

        # Specifies a list of one or more principals to associate with the resource share. You can include the
        # following values: An Amazon Web Services account ID, for example: 123456789012 An Amazon Resource
        # Name (ARN) of an organization in Organizations, for example:
        # organizations::123456789012:organization/o-exampleorgid An ARN of an organizational unit (OU) in
        # Organizations, for example:
        # organizations::123456789012:ou/o-exampleorgid/ou-examplerootid-exampleouid123 An ARN of an IAM role,
        # for example: iam::123456789012:role/rolename An ARN of an IAM user, for example:
        # iam::123456789012user/username Not all resource types can be shared with IAM roles and users. For
        # more information, see Sharing with IAM roles and users in the Resource Access Manager User Guide .
        @[JSON::Field(key: "principals")]
        getter principals : Array(String)?

        # Specifies a list of one or more ARNs of the resources to associate with the resource share.
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        # Specifies from which source accounts the service principal has access to the resources in this
        # resource share.
        @[JSON::Field(key: "sources")]
        getter sources : Array(String)?

        # Specifies one or more tags to attach to the resource share itself. It doesn't attach the tags to the
        # resources associated with the resource share.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @allow_external_principals : Bool? = nil,
          @client_token : String? = nil,
          @permission_arns : Array(String)? = nil,
          @principals : Array(String)? = nil,
          @resource_arns : Array(String)? = nil,
          @sources : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateResourceShareResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An object with information about the new resource share.
        @[JSON::Field(key: "resourceShare")]
        getter resource_share : Types::ResourceShare?

        def initialize(
          @client_token : String? = nil,
          @resource_share : Types::ResourceShare? = nil
        )
        end
      end

      struct DeletePermissionRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the customer managed permission that you want to delete.
        @[JSON::Field(key: "permissionArn")]
        getter permission_arn : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @permission_arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeletePermissionResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # This operation is performed asynchronously, and this response parameter indicates the current
        # status.
        @[JSON::Field(key: "permissionStatus")]
        getter permission_status : String?

        # A boolean that indicates whether the delete operations succeeded.
        @[JSON::Field(key: "returnValue")]
        getter return_value : Bool?

        def initialize(
          @client_token : String? = nil,
          @permission_status : String? = nil,
          @return_value : Bool? = nil
        )
        end
      end

      struct DeletePermissionVersionRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the permission with the version you want to delete.
        @[JSON::Field(key: "permissionArn")]
        getter permission_arn : String

        # Specifies the version number to delete. You can't delete the default version for a customer managed
        # permission. You can't delete a version if it's the only version of the permission. You must either
        # first create another version, or delete the permission completely. You can't delete a version if it
        # is attached to any resource shares. If the version is the default, you must first use
        # SetDefaultPermissionVersion to set a different version as the default for the customer managed
        # permission, and then use AssociateResourceSharePermission to update your resource shares to use the
        # new default version.
        @[JSON::Field(key: "permissionVersion")]
        getter permission_version : Int32

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @permission_arn : String,
          @permission_version : Int32,
          @client_token : String? = nil
        )
        end
      end

      struct DeletePermissionVersionResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # This operation is performed asynchronously, and this response parameter indicates the current
        # status.
        @[JSON::Field(key: "permissionStatus")]
        getter permission_status : String?

        # A boolean value that indicates whether the operation is successful.
        @[JSON::Field(key: "returnValue")]
        getter return_value : Bool?

        def initialize(
          @client_token : String? = nil,
          @permission_status : String? = nil,
          @return_value : Bool? = nil
        )
        end
      end

      struct DeleteResourceShareRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the resource share to delete.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @resource_share_arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteResourceShareResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A return value of true indicates that the request succeeded. A value of false indicates that the
        # request failed.
        @[JSON::Field(key: "returnValue")]
        getter return_value : Bool?

        def initialize(
          @client_token : String? = nil,
          @return_value : Bool? = nil
        )
        end
      end

      struct DisassociateResourceSharePermissionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the managed permission to disassociate from the resource share.
        # Changes to permissions take effect immediately.
        @[JSON::Field(key: "permissionArn")]
        getter permission_arn : String

        # The Amazon Resource Name (ARN) of the resource share that you want to remove the managed permission
        # from.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @permission_arn : String,
          @resource_share_arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct DisassociateResourceSharePermissionResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A return value of true indicates that the request succeeded. A value of false indicates that the
        # request failed.
        @[JSON::Field(key: "returnValue")]
        getter return_value : Bool?

        def initialize(
          @client_token : String? = nil,
          @return_value : Bool? = nil
        )
        end
      end

      struct DisassociateResourceShareRequest
        include JSON::Serializable

        # Specifies Amazon Resource Name (ARN) of the resource share that you want to remove resources or
        # principals from.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies a list of one or more principals that no longer are to have access to the resources in
        # this resource share. You can include the following values: An Amazon Web Services account ID, for
        # example: 123456789012 An Amazon Resource Name (ARN) of an organization in Organizations, for
        # example: organizations::123456789012:organization/o-exampleorgid An ARN of an organizational unit
        # (OU) in Organizations, for example:
        # organizations::123456789012:ou/o-exampleorgid/ou-examplerootid-exampleouid123 An ARN of an IAM role,
        # for example: iam::123456789012:role/rolename An ARN of an IAM user, for example:
        # iam::123456789012user/username Not all resource types can be shared with IAM roles and users. For
        # more information, see Sharing with IAM roles and users in the Resource Access Manager User Guide .
        @[JSON::Field(key: "principals")]
        getter principals : Array(String)?

        # Specifies a list of Amazon Resource Names (ARNs) for one or more resources that you want to remove
        # from the resource share. After the operation runs, these resources are no longer shared with
        # principals associated with the resource share.
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        # Specifies from which source accounts the service principal no longer has access to the resources in
        # this resource share.
        @[JSON::Field(key: "sources")]
        getter sources : Array(String)?

        def initialize(
          @resource_share_arn : String,
          @client_token : String? = nil,
          @principals : Array(String)? = nil,
          @resource_arns : Array(String)? = nil,
          @sources : Array(String)? = nil
        )
        end
      end

      struct DisassociateResourceShareResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An array of objects with information about the updated associations for this resource share.
        @[JSON::Field(key: "resourceShareAssociations")]
        getter resource_share_associations : Array(Types::ResourceShareAssociation)?

        def initialize(
          @client_token : String? = nil,
          @resource_share_associations : Array(Types::ResourceShareAssociation)? = nil
        )
        end
      end

      struct EnableSharingWithAwsOrganizationRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct EnableSharingWithAwsOrganizationResponse
        include JSON::Serializable

        # A return value of true indicates that the request succeeded. A value of false indicates that the
        # request failed.
        @[JSON::Field(key: "returnValue")]
        getter return_value : Bool?

        def initialize(
          @return_value : Bool? = nil
        )
        end
      end

      struct GetPermissionRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the permission whose contents you want to retrieve. To
        # find the ARN for a permission, use either the ListPermissions operation or go to the Permissions
        # library page in the RAM console and then choose the name of the permission. The ARN is displayed on
        # the detail page.
        @[JSON::Field(key: "permissionArn")]
        getter permission_arn : String

        # Specifies the version number of the RAM permission to retrieve. If you don't specify this parameter,
        # the operation retrieves the default version. To see the list of available versions, use
        # ListPermissionVersions .
        @[JSON::Field(key: "permissionVersion")]
        getter permission_version : Int32?

        def initialize(
          @permission_arn : String,
          @permission_version : Int32? = nil
        )
        end
      end

      struct GetPermissionResponse
        include JSON::Serializable

        # An object with details about the permission.
        @[JSON::Field(key: "permission")]
        getter permission : Types::ResourceSharePermissionDetail?

        def initialize(
          @permission : Types::ResourceSharePermissionDetail? = nil
        )
        end
      end

      struct GetResourcePoliciesRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Names (ARNs) of the resources whose policies you want to retrieve.
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies the principal.
        @[JSON::Field(key: "principal")]
        getter principal : String?

        def initialize(
          @resource_arns : Array(String),
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @principal : String? = nil
        )
        end
      end

      struct GetResourcePoliciesResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of resource policy documents in JSON format.
        @[JSON::Field(key: "policies")]
        getter policies : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @policies : Array(String)? = nil
        )
        end
      end

      struct GetResourceShareAssociationsRequest
        include JSON::Serializable

        # Specifies whether you want to retrieve the associations that involve a specified resource or
        # principal. PRINCIPAL – list the principals whose associations you want to see. RESOURCE – list the
        # resources whose associations you want to see.
        @[JSON::Field(key: "associationType")]
        getter association_type : String

        # Specifies that you want to retrieve only associations that have this status.
        @[JSON::Field(key: "associationStatus")]
        getter association_status : String?

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies the ID of the principal whose resource shares you want to retrieve. This can be an Amazon
        # Web Services account ID, an organization ID, an organizational unit ID, or the Amazon Resource Name
        # (ARN) of an individual IAM role or user. You cannot specify this parameter if the association type
        # is RESOURCE .
        @[JSON::Field(key: "principal")]
        getter principal : String?

        # Specifies the Amazon Resource Name (ARN) of a resource whose resource shares you want to retrieve.
        # You cannot specify this parameter if the association type is PRINCIPAL .
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # Specifies a list of Amazon Resource Names (ARNs) of the resource share whose associations you want
        # to retrieve.
        @[JSON::Field(key: "resourceShareArns")]
        getter resource_share_arns : Array(String)?

        def initialize(
          @association_type : String,
          @association_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @principal : String? = nil,
          @resource_arn : String? = nil,
          @resource_share_arns : Array(String)? = nil
        )
        end
      end

      struct GetResourceShareAssociationsResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain the details about the associations.
        @[JSON::Field(key: "resourceShareAssociations")]
        getter resource_share_associations : Array(Types::ResourceShareAssociation)?

        def initialize(
          @next_token : String? = nil,
          @resource_share_associations : Array(Types::ResourceShareAssociation)? = nil
        )
        end
      end

      struct GetResourceShareInvitationsRequest
        include JSON::Serializable

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies that you want details about invitations only for the resource shares described by this
        # list of Amazon Resource Names (ARNs)
        @[JSON::Field(key: "resourceShareArns")]
        getter resource_share_arns : Array(String)?

        # Specifies the Amazon Resource Names (ARNs) of the resource share invitations you want information
        # about.
        @[JSON::Field(key: "resourceShareInvitationArns")]
        getter resource_share_invitation_arns : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_share_arns : Array(String)? = nil,
          @resource_share_invitation_arns : Array(String)? = nil
        )
        end
      end

      struct GetResourceShareInvitationsResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain the details about the invitations.
        @[JSON::Field(key: "resourceShareInvitations")]
        getter resource_share_invitations : Array(Types::ResourceShareInvitation)?

        def initialize(
          @next_token : String? = nil,
          @resource_share_invitations : Array(Types::ResourceShareInvitation)? = nil
        )
        end
      end

      struct GetResourceSharesRequest
        include JSON::Serializable

        # Specifies that you want to retrieve details of only those resource shares that match the following:
        # SELF – resource shares that your account shares with other accounts OTHER-ACCOUNTS – resource shares
        # that other accounts share with your account
        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies the name of an individual resource share that you want to retrieve details about.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies that you want to retrieve details of only those resource shares that use the managed
        # permission with this Amazon Resource Name (ARN) .
        @[JSON::Field(key: "permissionArn")]
        getter permission_arn : String?

        # Specifies that you want to retrieve details for only those resource shares that use the specified
        # version of the managed permission.
        @[JSON::Field(key: "permissionVersion")]
        getter permission_version : Int32?

        # Specifies the Amazon Resource Names (ARNs) of individual resource shares that you want information
        # about.
        @[JSON::Field(key: "resourceShareArns")]
        getter resource_share_arns : Array(String)?

        # Specifies that you want to retrieve details of only those resource shares that have this status.
        @[JSON::Field(key: "resourceShareStatus")]
        getter resource_share_status : String?

        # Specifies that you want to retrieve details of only those resource shares that match the specified
        # tag keys and values.
        @[JSON::Field(key: "tagFilters")]
        getter tag_filters : Array(Types::TagFilter)?

        def initialize(
          @resource_owner : String,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @permission_arn : String? = nil,
          @permission_version : Int32? = nil,
          @resource_share_arns : Array(String)? = nil,
          @resource_share_status : String? = nil,
          @tag_filters : Array(Types::TagFilter)? = nil
        )
        end
      end

      struct GetResourceSharesResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain the information about the resource shares.
        @[JSON::Field(key: "resourceShares")]
        getter resource_shares : Array(Types::ResourceShare)?

        def initialize(
          @next_token : String? = nil,
          @resource_shares : Array(Types::ResourceShare)? = nil
        )
        end
      end

      # The operation failed because the client token input parameter matched one that was used with a
      # previous call to the operation, but at least one of the other input parameters is different from the
      # previous call.
      struct IdempotentParameterMismatchException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because the specified client token isn't valid.
      struct InvalidClientTokenException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because the specified value for MaxResults isn't valid.
      struct InvalidMaxResultsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because the specified value for NextToken isn't valid. You must specify a value
      # you received in the NextToken response of a previous call to this operation.
      struct InvalidNextTokenException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because a parameter you specified isn't valid.
      struct InvalidParameterException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because a policy you specified isn't valid.
      struct InvalidPolicyException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because the specified resource type isn't valid.
      struct InvalidResourceTypeException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because the requested operation isn't valid for the resource share in its
      # current state.
      struct InvalidStateTransitionException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct ListPendingInvitationResourcesRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the invitation. You can use GetResourceShareInvitations
        # to find the ARN of the invitation.
        @[JSON::Field(key: "resourceShareInvitationArn")]
        getter resource_share_invitation_arn : String

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies that you want the results to include only resources that have the specified scope. ALL –
        # the results include both global and regional resources or resource types. GLOBAL – the results
        # include only global resources or resource types. REGIONAL – the results include only regional
        # resources or resource types. The default value is ALL .
        @[JSON::Field(key: "resourceRegionScope")]
        getter resource_region_scope : String?

        def initialize(
          @resource_share_invitation_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_region_scope : String? = nil
        )
        end
      end

      struct ListPendingInvitationResourcesResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain the information about the resources included the specified resource
        # share.
        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::Resource)?

        def initialize(
          @next_token : String? = nil,
          @resources : Array(Types::Resource)? = nil
        )
        end
      end

      struct ListPermissionAssociationsRequest
        include JSON::Serializable

        # Specifies that you want to list only those associations with resource shares that match this status.
        @[JSON::Field(key: "associationStatus")]
        getter association_status : String?

        # When true , specifies that you want to list only those associations with resource shares that use
        # the default version of the specified managed permission. When false (the default value), lists
        # associations with resource shares that use any version of the specified managed permission.
        @[JSON::Field(key: "defaultVersion")]
        getter default_version : Bool?

        # Specifies that you want to list only those associations with resource shares that have a featureSet
        # with this value.
        @[JSON::Field(key: "featureSet")]
        getter feature_set : String?

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies the Amazon Resource Name (ARN) of the managed permission.
        @[JSON::Field(key: "permissionArn")]
        getter permission_arn : String?

        # Specifies that you want to list only those associations with resource shares that use this version
        # of the managed permission. If you don't provide a value for this parameter, then the operation
        # returns information about associations with resource shares that use any version of the managed
        # permission.
        @[JSON::Field(key: "permissionVersion")]
        getter permission_version : Int32?

        # Specifies that you want to list only those associations with resource shares that include at least
        # one resource of this resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @association_status : String? = nil,
          @default_version : Bool? = nil,
          @feature_set : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @permission_arn : String? = nil,
          @permission_version : Int32? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct ListPermissionAssociationsResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A structure with information about this customer managed permission.
        @[JSON::Field(key: "permissions")]
        getter permissions : Array(Types::AssociatedPermission)?

        def initialize(
          @next_token : String? = nil,
          @permissions : Array(Types::AssociatedPermission)? = nil
        )
        end
      end

      struct ListPermissionVersionsRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the RAM permission whose versions you want to list. You
        # can use the permissionVersion parameter on the AssociateResourceSharePermission operation to specify
        # a non-default version to attach.
        @[JSON::Field(key: "permissionArn")]
        getter permission_arn : String

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @permission_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPermissionVersionsResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain details for each of the available versions.
        @[JSON::Field(key: "permissions")]
        getter permissions : Array(Types::ResourceSharePermissionSummary)?

        def initialize(
          @next_token : String? = nil,
          @permissions : Array(Types::ResourceSharePermissionSummary)? = nil
        )
        end
      end

      struct ListPermissionsRequest
        include JSON::Serializable

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies that you want to list only permissions of this type: AWS – returns only Amazon Web
        # Services managed permissions. LOCAL – returns only customer managed permissions ALL – returns both
        # Amazon Web Services managed permissions and customer managed permissions. If you don't specify this
        # parameter, the default is All .
        @[JSON::Field(key: "permissionType")]
        getter permission_type : String?

        # Specifies that you want to list only those permissions that apply to the specified resource type.
        # This parameter is not case sensitive. For example, to list only permissions that apply to Amazon EC2
        # subnets, specify ec2:subnet . You can use the ListResourceTypes operation to get the specific string
        # required.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @permission_type : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct ListPermissionsResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects with information about the permissions.
        @[JSON::Field(key: "permissions")]
        getter permissions : Array(Types::ResourceSharePermissionSummary)?

        def initialize(
          @next_token : String? = nil,
          @permissions : Array(Types::ResourceSharePermissionSummary)? = nil
        )
        end
      end

      struct ListPrincipalsRequest
        include JSON::Serializable

        # Specifies that you want to list information for only resource shares that match the following: SELF
        # – principals that your account is sharing resources with OTHER-ACCOUNTS – principals that are
        # sharing resources with your account
        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies that you want to list information for only the listed principals. You can include the
        # following values: An Amazon Web Services account ID, for example: 123456789012 An Amazon Resource
        # Name (ARN) of an organization in Organizations, for example:
        # organizations::123456789012:organization/o-exampleorgid An ARN of an organizational unit (OU) in
        # Organizations, for example:
        # organizations::123456789012:ou/o-exampleorgid/ou-examplerootid-exampleouid123 An ARN of an IAM role,
        # for example: iam::123456789012:role/rolename An ARN of an IAM user, for example:
        # iam::123456789012user/username Not all resource types can be shared with IAM roles and users. For
        # more information, see Sharing with IAM roles and users in the Resource Access Manager User Guide .
        @[JSON::Field(key: "principals")]
        getter principals : Array(String)?

        # Specifies that you want to list principal information for the resource share with the specified
        # Amazon Resource Name (ARN) .
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # Specifies that you want to list information for only principals associated with the resource shares
        # specified by a list the Amazon Resource Names (ARNs) .
        @[JSON::Field(key: "resourceShareArns")]
        getter resource_share_arns : Array(String)?

        # Specifies that you want to list information for only principals associated with resource shares that
        # include the specified resource type. For a list of valid values, query the ListResourceTypes
        # operation.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @resource_owner : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @principals : Array(String)? = nil,
          @resource_arn : String? = nil,
          @resource_share_arns : Array(String)? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct ListPrincipalsResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain the details about the principals.
        @[JSON::Field(key: "principals")]
        getter principals : Array(Types::Principal)?

        def initialize(
          @next_token : String? = nil,
          @principals : Array(Types::Principal)? = nil
        )
        end
      end

      struct ListReplacePermissionAssociationsWorkRequest
        include JSON::Serializable

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies that you want to see only the details about requests with a status that matches this
        # value.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of IDs. These values come from the id field of the replacePermissionAssociationsWork
        # structure returned by the ReplacePermissionAssociations operation.
        @[JSON::Field(key: "workIds")]
        getter work_ids : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil,
          @work_ids : Array(String)? = nil
        )
        end
      end

      struct ListReplacePermissionAssociationsWorkResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of data structures that provide details of the matching work IDs.
        @[JSON::Field(key: "replacePermissionAssociationsWorks")]
        getter replace_permission_associations_works : Array(Types::ReplacePermissionAssociationsWork)?

        def initialize(
          @next_token : String? = nil,
          @replace_permission_associations_works : Array(Types::ReplacePermissionAssociationsWork)? = nil
        )
        end
      end

      struct ListResourceSharePermissionsRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the resource share for which you want to retrieve the
        # associated permissions.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_share_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceSharePermissionsResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that describe the permissions associated with the resource share.
        @[JSON::Field(key: "permissions")]
        getter permissions : Array(Types::ResourceSharePermissionSummary)?

        def initialize(
          @next_token : String? = nil,
          @permissions : Array(Types::ResourceSharePermissionSummary)? = nil
        )
        end
      end

      struct ListResourceTypesRequest
        include JSON::Serializable

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies that you want the results to include only resources that have the specified scope. ALL –
        # the results include both global and regional resources or resource types. GLOBAL – the results
        # include only global resources or resource types. REGIONAL – the results include only regional
        # resources or resource types. The default value is ALL .
        @[JSON::Field(key: "resourceRegionScope")]
        getter resource_region_scope : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_region_scope : String? = nil
        )
        end
      end

      struct ListResourceTypesResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain information about the resource types that can be shared using RAM.
        @[JSON::Field(key: "resourceTypes")]
        getter resource_types : Array(Types::ServiceNameAndResourceType)?

        def initialize(
          @next_token : String? = nil,
          @resource_types : Array(Types::ServiceNameAndResourceType)? = nil
        )
        end
      end

      struct ListResourcesRequest
        include JSON::Serializable

        # Specifies that you want to list only the resource shares that match the following: SELF – resources
        # that your account shares with other accounts OTHER-ACCOUNTS – resources that other accounts share
        # with your account
        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String

        # Specifies the total number of results that you want included on each page of the response. If you do
        # not include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the number you specify, the NextToken response element is returned with a value
        # (not null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies that you want to list only the resource shares that are associated with the specified
        # principal.
        @[JSON::Field(key: "principal")]
        getter principal : String?

        # Specifies that you want to list only the resource shares that include resources with the specified
        # Amazon Resource Names (ARNs) .
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        # Specifies that you want the results to include only resources that have the specified scope. ALL –
        # the results include both global and regional resources or resource types. GLOBAL – the results
        # include only global resources or resource types. REGIONAL – the results include only regional
        # resources or resource types. The default value is ALL .
        @[JSON::Field(key: "resourceRegionScope")]
        getter resource_region_scope : String?

        # Specifies that you want to list only resources in the resource shares identified by the specified
        # Amazon Resource Names (ARNs) .
        @[JSON::Field(key: "resourceShareArns")]
        getter resource_share_arns : Array(String)?

        # Specifies that you want to list only the resource shares that include resources of the specified
        # resource type. For valid values, query the ListResourceTypes operation.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @resource_owner : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @principal : String? = nil,
          @resource_arns : Array(String)? = nil,
          @resource_region_scope : String? = nil,
          @resource_share_arns : Array(String)? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct ListResourcesResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain information about the resources.
        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::Resource)?

        def initialize(
          @next_token : String? = nil,
          @resources : Array(Types::Resource)? = nil
        )
        end
      end

      # The operation failed because the specified Amazon Resource Name (ARN) has a format that isn't valid.
      struct MalformedArnException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because the policy template that you provided isn't valid.
      struct MalformedPolicyTemplateException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because a required input parameter is missing.
      struct MissingRequiredParameterException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because the requested operation isn't permitted.
      struct OperationNotPermittedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because a permission with the specified name already exists in the requested
      # Amazon Web Services Region. Choose a different name.
      struct PermissionAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because it would exceed the maximum number of permissions you can create in
      # each Amazon Web Services Region. To view the limits for your Amazon Web Services account, see the
      # RAM page in the Service Quotas console .
      struct PermissionLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because it would exceed the limit for the number of versions you can have for a
      # permission. To view the limits for your Amazon Web Services account, see the RAM page in the Service
      # Quotas console .
      struct PermissionVersionsLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Describes a principal for use with Resource Access Manager.
      struct Principal
        include JSON::Serializable

        # The date and time when the principal was associated with the resource share.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Indicates the relationship between the Amazon Web Services account the principal belongs to and the
        # account that owns the resource share: True – The two accounts belong to same organization. False –
        # The two accounts do not belong to the same organization.
        @[JSON::Field(key: "external")]
        getter external : Bool?

        # The ID of the principal that can be associated with a resource share.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time when the association between the resource share and the principal was last
        # updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        # The Amazon Resource Name (ARN) of a resource share the principal is associated with.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String?

        def initialize(
          @creation_time : Time? = nil,
          @external : Bool? = nil,
          @id : String? = nil,
          @last_updated_time : Time? = nil,
          @resource_share_arn : String? = nil
        )
        end
      end

      struct PromotePermissionCreatedFromPolicyRequest
        include JSON::Serializable

        # Specifies a name for the promoted customer managed permission.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies the Amazon Resource Name (ARN) of the CREATED_FROM_POLICY permission that you want to
        # promote. You can get this Amazon Resource Name (ARN) by calling the ListResourceSharePermissions
        # operation.
        @[JSON::Field(key: "permissionArn")]
        getter permission_arn : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @name : String,
          @permission_arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct PromotePermissionCreatedFromPolicyResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        @[JSON::Field(key: "permission")]
        getter permission : Types::ResourceSharePermissionSummary?

        def initialize(
          @client_token : String? = nil,
          @permission : Types::ResourceSharePermissionSummary? = nil
        )
        end
      end

      struct PromoteResourceShareCreatedFromPolicyRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the resource share to promote.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String

        def initialize(
          @resource_share_arn : String
        )
        end
      end

      struct PromoteResourceShareCreatedFromPolicyResponse
        include JSON::Serializable

        # A return value of true indicates that the request succeeded. A value of false indicates that the
        # request failed.
        @[JSON::Field(key: "returnValue")]
        getter return_value : Bool?

        def initialize(
          @return_value : Bool? = nil
        )
        end
      end

      struct RejectResourceShareInvitationRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the invitation that you want to reject.
        @[JSON::Field(key: "resourceShareInvitationArn")]
        getter resource_share_invitation_arn : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @resource_share_invitation_arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct RejectResourceShareInvitationResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An object that contains the details about the rejected invitation.
        @[JSON::Field(key: "resourceShareInvitation")]
        getter resource_share_invitation : Types::ResourceShareInvitation?

        def initialize(
          @client_token : String? = nil,
          @resource_share_invitation : Types::ResourceShareInvitation? = nil
        )
        end
      end

      struct ReplacePermissionAssociationsRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the managed permission that you want to replace.
        @[JSON::Field(key: "fromPermissionArn")]
        getter from_permission_arn : String

        # Specifies the ARN of the managed permission that you want to associate with resource shares in place
        # of the one specified by fromPerssionArn and fromPermissionVersion . The operation always associates
        # the version that is currently the default for the specified managed permission.
        @[JSON::Field(key: "toPermissionArn")]
        getter to_permission_arn : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies that you want to updated the permissions for only those resource shares that use the
        # specified version of the managed permission.
        @[JSON::Field(key: "fromPermissionVersion")]
        getter from_permission_version : Int32?

        def initialize(
          @from_permission_arn : String,
          @to_permission_arn : String,
          @client_token : String? = nil,
          @from_permission_version : Int32? = nil
        )
        end
      end

      struct ReplacePermissionAssociationsResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies a data structure that you can use to track the asynchronous tasks that RAM performs to
        # complete this operation. You can use the ListReplacePermissionAssociationsWork operation and pass
        # the id value returned in this structure.
        @[JSON::Field(key: "replacePermissionAssociationsWork")]
        getter replace_permission_associations_work : Types::ReplacePermissionAssociationsWork?

        def initialize(
          @client_token : String? = nil,
          @replace_permission_associations_work : Types::ReplacePermissionAssociationsWork? = nil
        )
        end
      end

      # A structure that represents the background work that RAM performs when you invoke the
      # ReplacePermissionAssociations operation.
      struct ReplacePermissionAssociationsWork
        include JSON::Serializable

        # The date and time when this asynchronous background task was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the managed permission that this background task is replacing.
        @[JSON::Field(key: "fromPermissionArn")]
        getter from_permission_arn : String?

        # The version of the managed permission that this background task is replacing.
        @[JSON::Field(key: "fromPermissionVersion")]
        getter from_permission_version : String?

        # The unique identifier for the background task associated with one ReplacePermissionAssociations
        # request.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time when the status of this background task was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        # Specifies the current status of the background tasks for the specified ID. The output is one of the
        # following strings: IN_PROGRESS COMPLETED FAILED
        @[JSON::Field(key: "status")]
        getter status : String?

        # Specifies the reason for a FAILED status. This field is present only when there status is FAILED .
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The ARN of the managed permission that this background task is associating with the resource shares
        # in place of the managed permission and version specified in fromPermissionArn and
        # fromPermissionVersion .
        @[JSON::Field(key: "toPermissionArn")]
        getter to_permission_arn : String?

        # The version of the managed permission that this background task is associating with the resource
        # shares. This is always the version that is currently the default for this managed permission.
        @[JSON::Field(key: "toPermissionVersion")]
        getter to_permission_version : String?

        def initialize(
          @creation_time : Time? = nil,
          @from_permission_arn : String? = nil,
          @from_permission_version : String? = nil,
          @id : String? = nil,
          @last_updated_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @to_permission_arn : String? = nil,
          @to_permission_version : String? = nil
        )
        end
      end

      # Describes a resource associated with a resource share in RAM.
      struct Resource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time when the resource was associated with the resource share.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The date an time when the association between the resource and the resource share was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        # The Amazon Resource Name (ARN) of the resource group. This value is available only if the resource
        # is part of a resource group.
        @[JSON::Field(key: "resourceGroupArn")]
        getter resource_group_arn : String?

        # Specifies the scope of visibility of this resource: REGIONAL – The resource can be accessed only by
        # using requests that target the Amazon Web Services Region in which the resource exists. GLOBAL – The
        # resource can be accessed from any Amazon Web Services Region.
        @[JSON::Field(key: "resourceRegionScope")]
        getter resource_region_scope : String?

        # The Amazon Resource Name (ARN) of the resource share this resource is associated with.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String?

        # The current status of the resource.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A message about the status of the resource.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The resource type. This takes the form of: service-code : resource-code , and is case-insensitive.
        # For example, an Amazon EC2 Subnet would be represented by the string ec2:subnet .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @last_updated_time : Time? = nil,
          @resource_group_arn : String? = nil,
          @resource_region_scope : String? = nil,
          @resource_share_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The operation failed because the specified Amazon Resource Name (ARN) was not found.
      struct ResourceArnNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Describes a resource share in RAM.
      struct ResourceShare
        include JSON::Serializable

        # Indicates whether principals outside your organization in Organizations can be associated with a
        # resource share. True – the resource share can be shared with any Amazon Web Services account. False
        # – the resource share can be shared with only accounts in the same organization as the account that
        # owns the resource share.
        @[JSON::Field(key: "allowExternalPrincipals")]
        getter allow_external_principals : Bool?

        # The date and time when the resource share was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Indicates what features are available for this resource share. This parameter can have one of the
        # following values: STANDARD – A resource share that supports all functionality. These resource shares
        # are visible to all principals you share the resource share with. You can modify these resource
        # shares in RAM using the console or APIs. This resource share might have been created by RAM, or it
        # might have been CREATED_FROM_POLICY and then promoted. CREATED_FROM_POLICY – The customer manually
        # shared a resource by attaching a resource-based policy. That policy did not match any existing
        # managed permissions, so RAM created this customer managed permission automatically on the customer's
        # behalf based on the attached policy document. This type of resource share is visible only to the
        # Amazon Web Services account that created it. You can't modify it in RAM unless you promote it. For
        # more information, see PromoteResourceShareCreatedFromPolicy . PROMOTING_TO_STANDARD – This resource
        # share was originally CREATED_FROM_POLICY , but the customer ran the
        # PromoteResourceShareCreatedFromPolicy and that operation is still in progress. This value changes to
        # STANDARD when complete.
        @[JSON::Field(key: "featureSet")]
        getter feature_set : String?

        # The date and time when the resource share was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the resource share.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the Amazon Web Services account that owns the resource share.
        @[JSON::Field(key: "owningAccountId")]
        getter owning_account_id : String?

        # The Amazon Resource Name (ARN) of the resource share
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String?

        # The current status of the resource share.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A message about the status of the resource share.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The tag key and value pairs attached to the resource share.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @allow_external_principals : Bool? = nil,
          @creation_time : Time? = nil,
          @feature_set : String? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @owning_account_id : String? = nil,
          @resource_share_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes an association between a resource share and either a principal or a resource.
      struct ResourceShareAssociation
        include JSON::Serializable

        # The associated entity. This can be either of the following: For a resource association, this is the
        # Amazon Resource Name (ARN) of the resource. For principal associations, this is one of the
        # following: The ID of an Amazon Web Services account The Amazon Resource Name (ARN) of an
        # organization in Organizations The ARN of an organizational unit (OU) in Organizations The ARN of an
        # IAM role The ARN of an IAM user
        @[JSON::Field(key: "associatedEntity")]
        getter associated_entity : String?

        # The type of entity included in this association.
        @[JSON::Field(key: "associationType")]
        getter association_type : String?

        # The date and time when the association was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Indicates whether the principal belongs to the same organization in Organizations as the Amazon Web
        # Services account that owns the resource share.
        @[JSON::Field(key: "external")]
        getter external : Bool?

        # The date and time when the association was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        # The Amazon Resource Name (ARN) of the resource share.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String?

        # The name of the resource share.
        @[JSON::Field(key: "resourceShareName")]
        getter resource_share_name : String?

        # The current status of the association.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A message about the status of the association.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @associated_entity : String? = nil,
          @association_type : String? = nil,
          @creation_time : Time? = nil,
          @external : Bool? = nil,
          @last_updated_time : Time? = nil,
          @resource_share_arn : String? = nil,
          @resource_share_name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Describes an invitation for an Amazon Web Services account to join a resource share.
      struct ResourceShareInvitation
        include JSON::Serializable

        # The date and time when the invitation was sent.
        @[JSON::Field(key: "invitationTimestamp")]
        getter invitation_timestamp : Time?

        # The ID of the Amazon Web Services account that received the invitation.
        @[JSON::Field(key: "receiverAccountId")]
        getter receiver_account_id : String?

        # The Amazon Resource Name (ARN) of the IAM user or role that received the invitation.
        @[JSON::Field(key: "receiverArn")]
        getter receiver_arn : String?

        # The Amazon Resource Name (ARN) of the resource share
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String?

        # To view the resources associated with a pending resource share invitation, use
        # ListPendingInvitationResources .
        @[JSON::Field(key: "resourceShareAssociations")]
        getter resource_share_associations : Array(Types::ResourceShareAssociation)?

        # The Amazon Resource Name (ARN) of the invitation.
        @[JSON::Field(key: "resourceShareInvitationArn")]
        getter resource_share_invitation_arn : String?

        # The name of the resource share.
        @[JSON::Field(key: "resourceShareName")]
        getter resource_share_name : String?

        # The ID of the Amazon Web Services account that sent the invitation.
        @[JSON::Field(key: "senderAccountId")]
        getter sender_account_id : String?

        # The current status of the invitation.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @invitation_timestamp : Time? = nil,
          @receiver_account_id : String? = nil,
          @receiver_arn : String? = nil,
          @resource_share_arn : String? = nil,
          @resource_share_associations : Array(Types::ResourceShareAssociation)? = nil,
          @resource_share_invitation_arn : String? = nil,
          @resource_share_name : String? = nil,
          @sender_account_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The operation failed because the specified invitation was already accepted.
      struct ResourceShareInvitationAlreadyAcceptedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because the specified invitation was already rejected.
      struct ResourceShareInvitationAlreadyRejectedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because the specified Amazon Resource Name (ARN) for an invitation was not
      # found.
      struct ResourceShareInvitationArnNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because the specified invitation is past its expiration date and time.
      struct ResourceShareInvitationExpiredException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because it would exceed the limit for resource shares for your account. To view
      # the limits for your Amazon Web Services account, see the RAM page in the Service Quotas console .
      struct ResourceShareLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Information about a RAM managed permission.
      struct ResourceSharePermissionDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of this RAM managed permission.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time when the permission was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Specifies whether the version of the permission represented in this response is the default version
        # for this permission.
        @[JSON::Field(key: "defaultVersion")]
        getter default_version : Bool?

        # Indicates what features are available for this resource share. This parameter can have one of the
        # following values: STANDARD – A resource share that supports all functionality. These resource shares
        # are visible to all principals you share the resource share with. You can modify these resource
        # shares in RAM using the console or APIs. This resource share might have been created by RAM, or it
        # might have been CREATED_FROM_POLICY and then promoted. CREATED_FROM_POLICY – The customer manually
        # shared a resource by attaching a resource-based policy. That policy did not match any existing
        # managed permissions, so RAM created this customer managed permission automatically on the customer's
        # behalf based on the attached policy document. This type of resource share is visible only to the
        # Amazon Web Services account that created it. You can't modify it in RAM unless you promote it. For
        # more information, see PromoteResourceShareCreatedFromPolicy . PROMOTING_TO_STANDARD – This resource
        # share was originally CREATED_FROM_POLICY , but the customer ran the
        # PromoteResourceShareCreatedFromPolicy and that operation is still in progress. This value changes to
        # STANDARD when complete.
        @[JSON::Field(key: "featureSet")]
        getter feature_set : String?

        # Specifies whether the version of the permission represented in this response is the default version
        # for all resources of this resource type.
        @[JSON::Field(key: "isResourceTypeDefault")]
        getter is_resource_type_default : Bool?

        # The date and time when the permission was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of this permission.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The permission's effect and actions in JSON format. The effect indicates whether the specified
        # actions are allowed or denied. The actions list the operations to which the principal is granted or
        # denied access.
        @[JSON::Field(key: "permission")]
        getter permission : String?

        # The type of managed permission. This can be one of the following values: AWS_MANAGED – Amazon Web
        # Services created and manages this managed permission. You can associate it with your resource
        # shares, but you can't modify it. CUSTOMER_MANAGED – You, or another principal in your account
        # created this managed permission. You can associate it with your resource shares and create new
        # versions that have different permissions.
        @[JSON::Field(key: "permissionType")]
        getter permission_type : String?

        # The resource type to which this permission applies.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The current status of the association between the permission and the resource share. The following
        # are the possible values: ATTACHABLE – This permission or version can be associated with resource
        # shares. UNATTACHABLE – This permission or version can't currently be associated with resource
        # shares. DELETING – This permission or version is in the process of being deleted. DELETED – This
        # permission or version is deleted.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The tag key and value pairs attached to the resource share.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The version of the permission described in this response.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @default_version : Bool? = nil,
          @feature_set : String? = nil,
          @is_resource_type_default : Bool? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @permission : String? = nil,
          @permission_type : String? = nil,
          @resource_type : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @version : String? = nil
        )
        end
      end

      # Information about an RAM permission.
      struct ResourceSharePermissionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the permission you want information about.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time when the permission was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Specifies whether the version of the managed permission used by this resource share is the default
        # version for this managed permission.
        @[JSON::Field(key: "defaultVersion")]
        getter default_version : Bool?

        # Indicates what features are available for this resource share. This parameter can have one of the
        # following values: STANDARD – A resource share that supports all functionality. These resource shares
        # are visible to all principals you share the resource share with. You can modify these resource
        # shares in RAM using the console or APIs. This resource share might have been created by RAM, or it
        # might have been CREATED_FROM_POLICY and then promoted. CREATED_FROM_POLICY – The customer manually
        # shared a resource by attaching a resource-based policy. That policy did not match any existing
        # managed permissions, so RAM created this customer managed permission automatically on the customer's
        # behalf based on the attached policy document. This type of resource share is visible only to the
        # Amazon Web Services account that created it. You can't modify it in RAM unless you promote it. For
        # more information, see PromoteResourceShareCreatedFromPolicy . PROMOTING_TO_STANDARD – This resource
        # share was originally CREATED_FROM_POLICY , but the customer ran the
        # PromoteResourceShareCreatedFromPolicy and that operation is still in progress. This value changes to
        # STANDARD when complete.
        @[JSON::Field(key: "featureSet")]
        getter feature_set : String?

        # Specifies whether the managed permission associated with this resource share is the default managed
        # permission for all resources of this resource type.
        @[JSON::Field(key: "isResourceTypeDefault")]
        getter is_resource_type_default : Bool?

        # The date and time when the permission was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of this managed permission.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of managed permission. This can be one of the following values: AWS_MANAGED – Amazon Web
        # Services created and manages this managed permission. You can associate it with your resource
        # shares, but you can't modify it. CUSTOMER_MANAGED – You, or another principal in your account
        # created this managed permission. You can associate it with your resource shares and create new
        # versions that have different permissions.
        @[JSON::Field(key: "permissionType")]
        getter permission_type : String?

        # The type of resource to which this permission applies. This takes the form of: service-code :
        # resource-code , and is case-insensitive. For example, an Amazon EC2 Subnet would be represented by
        # the string ec2:subnet .
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The current status of the permission.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of the tag key value pairs currently attached to the permission.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The version of the permission associated with this resource share.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @default_version : Bool? = nil,
          @feature_set : String? = nil,
          @is_resource_type_default : Bool? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @permission_type : String? = nil,
          @resource_type : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @version : String? = nil
        )
        end
      end

      # The operation failed because the service could not respond to the request due to an internal
      # problem. Try again later.
      struct ServerInternalException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Information about a shareable resource type and the Amazon Web Services service to which resources
      # of that type belong.
      struct ServiceNameAndResourceType
        include JSON::Serializable

        # Specifies the scope of visibility of resources of this type: REGIONAL – The resource can be accessed
        # only by using requests that target the Amazon Web Services Region in which the resource exists.
        # GLOBAL – The resource can be accessed from any Amazon Web Services Region.
        @[JSON::Field(key: "resourceRegionScope")]
        getter resource_region_scope : String?

        # The type of the resource. This takes the form of: service-code : resource-code , and is
        # case-insensitive. For example, an Amazon EC2 Subnet would be represented by the string ec2:subnet .
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The name of the Amazon Web Services service to which resources of this type belong.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @resource_region_scope : String? = nil,
          @resource_type : String? = nil,
          @service_name : String? = nil
        )
        end
      end

      # The operation failed because the service isn't available. Try again later.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct SetDefaultPermissionVersionRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the customer managed permission whose default version
        # you want to change.
        @[JSON::Field(key: "permissionArn")]
        getter permission_arn : String

        # Specifies the version number that you want to designate as the default for customer managed
        # permission. To see a list of all available version numbers, use ListPermissionVersions .
        @[JSON::Field(key: "permissionVersion")]
        getter permission_version : Int32

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @permission_arn : String,
          @permission_version : Int32,
          @client_token : String? = nil
        )
        end
      end

      struct SetDefaultPermissionVersionResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A boolean value that indicates whether the operation was successful.
        @[JSON::Field(key: "returnValue")]
        getter return_value : Bool?

        def initialize(
          @client_token : String? = nil,
          @return_value : Bool? = nil
        )
        end
      end

      # A structure containing a tag. A tag is metadata that you can attach to your resources to help
      # organize and categorize them. You can also use them to help you secure your resources. For more
      # information, see Controlling access to Amazon Web Services resources using tags . For more
      # information about tags, see Tagging Amazon Web Services resources in the Amazon Web Services General
      # Reference Guide .
      struct Tag
        include JSON::Serializable

        # The key, or name, attached to the tag. Every tag must have a key. Key names are case sensitive.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The string value attached to the tag. The value can be an empty string. Key values are case
        # sensitive.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # A tag key and optional list of possible values that you can use to filter results for tagged
      # resources.
      struct TagFilter
        include JSON::Serializable

        # The tag key. This must have a valid string value and can't be empty.
        @[JSON::Field(key: "tagKey")]
        getter tag_key : String?

        # A list of zero or more tag values. If no values are provided, then the filter matches any tag with
        # the specified key, regardless of its value.
        @[JSON::Field(key: "tagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @tag_key : String? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      # The operation failed because it would exceed the limit for tags for your Amazon Web Services
      # account.
      struct TagLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because the specified tag key is a reserved word and can't be used.
      struct TagPolicyViolationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # A list of one or more tag key and value pairs. The tag key must be present and not be an empty
        # string. The tag value must be present but can be an empty string.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        # Specifies the Amazon Resource Name (ARN) of the managed permission that you want to add tags to. You
        # must specify either resourceArn , or resourceShareArn , but not both.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # Specifies the Amazon Resource Name (ARN) of the resource share that you want to add tags to. You
        # must specify either resourceShareArn , or resourceArn , but not both.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String?

        def initialize(
          @tags : Array(Types::Tag),
          @resource_arn : String? = nil,
          @resource_share_arn : String? = nil
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The operation failed because it exceeded the rate at which you are allowed to perform this
      # operation. Please try again later.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The operation failed because a specified resource couldn't be found.
      struct UnknownResourceException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # There isn't an existing managed permission defined in RAM that has the same IAM permissions as the
      # resource-based policy attached to the resource. You should first run
      # PromotePermissionCreatedFromPolicy to create that managed permission.
      struct UnmatchedPolicyPermissionException
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

        # Specifies a list of one or more tag keys that you want to remove.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        # Specifies the Amazon Resource Name (ARN) of the managed permission that you want to remove tags
        # from. You must specify either resourceArn , or resourceShareArn , but not both.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # Specifies the Amazon Resource Name (ARN) of the resource share that you want to remove tags from.
        # The tags are removed from the resource share, not the resources in the resource share. You must
        # specify either resourceShareArn , or resourceArn , but not both.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String?

        def initialize(
          @tag_keys : Array(String),
          @resource_arn : String? = nil,
          @resource_share_arn : String? = nil
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateResourceShareRequest
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the resource share that you want to modify.
        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String

        # Specifies whether principals outside your organization in Organizations can be associated with a
        # resource share.
        @[JSON::Field(key: "allowExternalPrincipals")]
        getter allow_external_principals : Bool?

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # If specified, the new name that you want to attach to the resource share.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @resource_share_arn : String,
          @allow_external_principals : Bool? = nil,
          @client_token : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateResourceShareResponse
        include JSON::Serializable

        # The idempotency identifier associated with this request. If you want to repeat the same operation in
        # an idempotent manner then you must include this value in the clientToken request parameter of that
        # later call. All other parameters must also have the same values that you used in the first call.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Information about the resource share.
        @[JSON::Field(key: "resourceShare")]
        getter resource_share : Types::ResourceShare?

        def initialize(
          @client_token : String? = nil,
          @resource_share : Types::ResourceShare? = nil
        )
        end
      end
    end
  end
end
