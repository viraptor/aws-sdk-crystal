require "json"
require "time"

module AwsSdk
  module SSOAdmin
    module Types

      # These are IAM Identity Center identity store attributes that you can configure for use in
      # attributes-based access control (ABAC). You can create permissions policies that determine who can
      # access your Amazon Web Services resources based upon the configured attribute values. When you
      # enable ABAC and specify AccessControlAttributes , IAM Identity Center passes the attribute values of
      # the authenticated user into IAM for use in policy evaluation.

      struct AccessControlAttribute
        include JSON::Serializable

        # The name of the attribute associated with your identities in your identity source. This is used to
        # map a specified attribute in your identity source with an attribute in IAM Identity Center.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value used for mapping a specified attribute to an identity source.

        @[JSON::Field(key: "Value")]
        getter value : Types::AccessControlAttributeValue

        def initialize(
          @key : String,
          @value : Types::AccessControlAttributeValue
        )
        end
      end

      # The value used for mapping a specified attribute to an identity source. For more information, see
      # Attribute mappings in the IAM Identity Center User Guide .

      struct AccessControlAttributeValue
        include JSON::Serializable

        # The identity source to use when mapping a specified attribute to IAM Identity Center.

        @[JSON::Field(key: "Source")]
        getter source : Array(String)

        def initialize(
          @source : Array(String)
        )
        end
      end

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the access denied exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The assignment that indicates a principal's limited access to a specified Amazon Web Services
      # account with a specified permission set. The term principal here refers to a user or group that is
      # defined in IAM Identity Center.

      struct AccountAssignment
        include JSON::Serializable

        # The identifier of the Amazon Web Services account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The ARN of the permission set. For more information about ARNs, see Amazon Resource Names (ARNs) and
        # Amazon Web Services Service Namespaces in the Amazon Web Services General Reference .

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String?

        # An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds are GUIDs
        # (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about PrincipalIds in IAM
        # Identity Center, see the IAM Identity Center Identity Store API Reference .

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String?

        # The entity type for which the assignment will be created.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String?

        def initialize(
          @account_id : String? = nil,
          @permission_set_arn : String? = nil,
          @principal_id : String? = nil,
          @principal_type : String? = nil
        )
        end
      end

      # A structure that describes an assignment of an Amazon Web Services account to a principal and the
      # permissions that principal has in the account.

      struct AccountAssignmentForPrincipal
        include JSON::Serializable

        # The account ID number of the Amazon Web Services account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The ARN of the IAM Identity Center permission set assigned to this principal for this Amazon Web
        # Services account.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String?

        # The ID of the principal.

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String?

        # The type of the principal.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String?

        def initialize(
          @account_id : String? = nil,
          @permission_set_arn : String? = nil,
          @principal_id : String? = nil,
          @principal_type : String? = nil
        )
        end
      end

      # The status of the creation or deletion operation of an assignment that a principal needs to access
      # an account.

      struct AccountAssignmentOperationStatus
        include JSON::Serializable

        # The date that the permission set was created.

        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The message that contains an error or exception in case of an operation failure.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The ARN of the permission set. For more information about ARNs, see Amazon Resource Names (ARNs) and
        # Amazon Web Services Service Namespaces in the Amazon Web Services General Reference .

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String?

        # An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds are GUIDs
        # (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about PrincipalIds in IAM
        # Identity Center, see the IAM Identity Center Identity Store API Reference .

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String?

        # The entity type for which the assignment will be created.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String?

        # The identifier for tracking the request operation that is generated by the universally unique
        # identifier (UUID) workflow.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # The status of the permission set provisioning process.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # TargetID is an Amazon Web Services account identifier, (For example, 123456789012).

        @[JSON::Field(key: "TargetId")]
        getter target_id : String?

        # The entity type for which the assignment will be created.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        def initialize(
          @created_date : Time? = nil,
          @failure_reason : String? = nil,
          @permission_set_arn : String? = nil,
          @principal_id : String? = nil,
          @principal_type : String? = nil,
          @request_id : String? = nil,
          @status : String? = nil,
          @target_id : String? = nil,
          @target_type : String? = nil
        )
        end
      end

      # Provides information about the AccountAssignment creation request.

      struct AccountAssignmentOperationStatusMetadata
        include JSON::Serializable

        # The date that the permission set was created.

        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The identifier for tracking the request operation that is generated by the universally unique
        # identifier (UUID) workflow.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # The status of the permission set provisioning process.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_date : Time? = nil,
          @request_id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ActorPolicyDocument
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that describes an application that uses IAM Identity Center for access management.

      struct Application
        include JSON::Serializable

        # The Amazon Web Services account ID number of the application.

        @[JSON::Field(key: "ApplicationAccount")]
        getter application_account : String?

        # The ARN of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The ARN of the application provider for this application.

        @[JSON::Field(key: "ApplicationProviderArn")]
        getter application_provider_arn : String?

        # The date and time when the application was originally created.

        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The description of the application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN of the instance of IAM Identity Center that is configured with this application.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        # The name of the application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A structure that describes the options for the access portal associated with this application.

        @[JSON::Field(key: "PortalOptions")]
        getter portal_options : Types::PortalOptions?

        # The current status of the application in this instance of IAM Identity Center.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @application_account : String? = nil,
          @application_arn : String? = nil,
          @application_provider_arn : String? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @instance_arn : String? = nil,
          @name : String? = nil,
          @portal_options : Types::PortalOptions? = nil,
          @status : String? = nil
        )
        end
      end

      # A structure that describes an assignment of a principal to an application.

      struct ApplicationAssignment
        include JSON::Serializable

        # The ARN of the application that has principals assigned.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # The unique identifier of the principal assigned to the application.

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String

        # The type of the principal assigned to the application.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String

        def initialize(
          @application_arn : String,
          @principal_id : String,
          @principal_type : String
        )
        end
      end

      # A structure that describes an application to which a principal is assigned.

      struct ApplicationAssignmentForPrincipal
        include JSON::Serializable

        # The ARN of the application to which the specified principal is assigned.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The unique identifier of the principal assigned to the application.

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String?

        # The type of the principal assigned to the application.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String?

        def initialize(
          @application_arn : String? = nil,
          @principal_id : String? = nil,
          @principal_type : String? = nil
        )
        end
      end

      # A structure that describes a provider that can be used to connect an Amazon Web Services managed
      # application or customer managed application to IAM Identity Center.

      struct ApplicationProvider
        include JSON::Serializable

        # The ARN of the application provider.

        @[JSON::Field(key: "ApplicationProviderArn")]
        getter application_provider_arn : String

        # A structure that describes how IAM Identity Center represents the application provider in the
        # portal.

        @[JSON::Field(key: "DisplayData")]
        getter display_data : Types::DisplayData?

        # The protocol that the application provider uses to perform federation.

        @[JSON::Field(key: "FederationProtocol")]
        getter federation_protocol : String?

        # A structure that describes the application provider's resource server.

        @[JSON::Field(key: "ResourceServerConfig")]
        getter resource_server_config : Types::ResourceServerConfig?

        def initialize(
          @application_provider_arn : String,
          @display_data : Types::DisplayData? = nil,
          @federation_protocol : String? = nil,
          @resource_server_config : Types::ResourceServerConfig? = nil
        )
        end
      end


      struct AttachCustomerManagedPolicyReferenceToPermissionSetRequest
        include JSON::Serializable

        # Specifies the name and path of a customer managed policy. You must have an IAM policy that matches
        # the name and path in each Amazon Web Services account where you want to deploy your permission set.

        @[JSON::Field(key: "CustomerManagedPolicyReference")]
        getter customer_managed_policy_reference : Types::CustomerManagedPolicyReference

        # The ARN of the IAM Identity Center instance under which the operation will be executed.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the PermissionSet .

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        def initialize(
          @customer_managed_policy_reference : Types::CustomerManagedPolicyReference,
          @instance_arn : String,
          @permission_set_arn : String
        )
        end
      end


      struct AttachCustomerManagedPolicyReferenceToPermissionSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AttachManagedPolicyToPermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The Amazon Web Services managed policy ARN to be attached to a permission set.

        @[JSON::Field(key: "ManagedPolicyArn")]
        getter managed_policy_arn : String

        # The ARN of the PermissionSet that the managed policy should be attached to.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        def initialize(
          @instance_arn : String,
          @managed_policy_arn : String,
          @permission_set_arn : String
        )
        end
      end


      struct AttachManagedPolicyToPermissionSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that stores a list of managed policy ARNs that describe the associated Amazon Web
      # Services managed policy.

      struct AttachedManagedPolicy
        include JSON::Serializable

        # The ARN of the Amazon Web Services managed policy. For more information about ARNs, see Amazon
        # Resource Names (ARNs) and Amazon Web Services Service Namespaces in the Amazon Web Services General
        # Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the Amazon Web Services managed policy.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A structure that describes an authentication method that can be used by an application.

      struct AuthenticationMethod
        include JSON::Serializable

        # A structure that describes details for IAM authentication.

        @[JSON::Field(key: "Iam")]
        getter iam : Types::IamAuthenticationMethod?

        def initialize(
          @iam : Types::IamAuthenticationMethod? = nil
        )
        end
      end

      # A structure that describes an authentication method and its type.

      struct AuthenticationMethodItem
        include JSON::Serializable

        # A structure that describes an authentication method. The contents of this structure is determined by
        # the AuthenticationMethodType .

        @[JSON::Field(key: "AuthenticationMethod")]
        getter authentication_method : Types::AuthenticationMethod?

        # The type of authentication that is used by this method.

        @[JSON::Field(key: "AuthenticationMethodType")]
        getter authentication_method_type : String?

        def initialize(
          @authentication_method : Types::AuthenticationMethod? = nil,
          @authentication_method_type : String? = nil
        )
        end
      end

      # A structure that defines configuration settings for an application that supports the OAuth 2.0
      # Authorization Code Grant.

      struct AuthorizationCodeGrant
        include JSON::Serializable

        # A list of URIs that are valid locations to redirect a user's browser after the user is authorized.
        # RedirectUris is required when the grant type is authorization_code .

        @[JSON::Field(key: "RedirectUris")]
        getter redirect_uris : Array(String)?

        def initialize(
          @redirect_uris : Array(String)? = nil
        )
        end
      end

      # A structure that describes a trusted token issuer and associates it with a set of authorized
      # audiences.

      struct AuthorizedTokenIssuer
        include JSON::Serializable

        # An array list of authorized audiences, or applications, that can consume the tokens generated by the
        # associated trusted token issuer.

        @[JSON::Field(key: "AuthorizedAudiences")]
        getter authorized_audiences : Array(String)?

        # The ARN of the trusted token issuer.

        @[JSON::Field(key: "TrustedTokenIssuerArn")]
        getter trusted_token_issuer_arn : String?

        def initialize(
          @authorized_audiences : Array(String)? = nil,
          @trusted_token_issuer_arn : String? = nil
        )
        end
      end

      # Occurs when a conflict with a previous successful write is detected. This generally occurs when the
      # previous write did not have time to propagate to the host serving the current request. A retry (with
      # appropriate backoff logic) is the recommended response to this exception.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateAccountAssignmentRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the permission set that the admin wants to grant the principal access to.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        # An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds are GUIDs
        # (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about PrincipalIds in IAM
        # Identity Center, see the IAM Identity Center Identity Store API Reference .

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String

        # The entity type for which the assignment will be created.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String

        # TargetID is an Amazon Web Services account identifier, (For example, 123456789012).

        @[JSON::Field(key: "TargetId")]
        getter target_id : String

        # The entity type for which the assignment will be created.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String,
          @principal_id : String,
          @principal_type : String,
          @target_id : String,
          @target_type : String
        )
        end
      end


      struct CreateAccountAssignmentResponse
        include JSON::Serializable

        # The status object for the account assignment creation operation.

        @[JSON::Field(key: "AccountAssignmentCreationStatus")]
        getter account_assignment_creation_status : Types::AccountAssignmentOperationStatus?

        def initialize(
          @account_assignment_creation_status : Types::AccountAssignmentOperationStatus? = nil
        )
        end
      end


      struct CreateApplicationAssignmentRequest
        include JSON::Serializable

        # The ARN of the application for which the assignment is created.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds are GUIDs
        # (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about PrincipalIds in IAM
        # Identity Center, see the IAM Identity Center Identity Store API Reference .

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String

        # The entity type for which the assignment will be created.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String

        def initialize(
          @application_arn : String,
          @principal_id : String,
          @principal_type : String
        )
        end
      end


      struct CreateApplicationAssignmentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateApplicationRequest
        include JSON::Serializable

        # The ARN of the application provider under which the operation will run.

        @[JSON::Field(key: "ApplicationProviderArn")]
        getter application_provider_arn : String

        # The ARN of the instance of IAM Identity Center under which the operation will run. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The name of the .

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the request.
        # This lets you safely retry the request without accidentally performing the same operation a second
        # time. Passing the same value to a later call to an operation requires that you also pass the same
        # value for all other parameters. We recommend that you use a UUID type of value . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description of the .

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A structure that describes the options for the portal associated with an application.

        @[JSON::Field(key: "PortalOptions")]
        getter portal_options : Types::PortalOptions?

        # Specifies whether the application is enabled or disabled.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Specifies tags to be attached to the application.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @application_provider_arn : String,
          @instance_arn : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @portal_options : Types::PortalOptions? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateApplicationResponse
        include JSON::Serializable

        # Specifies the ARN of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        def initialize(
          @application_arn : String? = nil
        )
        end
      end


      struct CreateInstanceAccessControlAttributeConfigurationRequest
        include JSON::Serializable

        # Specifies the IAM Identity Center identity store attributes to add to your ABAC configuration. When
        # using an external identity provider as an identity source, you can pass attributes through the SAML
        # assertion. Doing so provides an alternative to configuring attributes from the IAM Identity Center
        # identity store. If a SAML assertion passes any of these attributes, IAM Identity Center will replace
        # the attribute value with the value from the IAM Identity Center identity store.

        @[JSON::Field(key: "InstanceAccessControlAttributeConfiguration")]
        getter instance_access_control_attribute_configuration : Types::InstanceAccessControlAttributeConfiguration

        # The ARN of the IAM Identity Center instance under which the operation will be executed.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        def initialize(
          @instance_access_control_attribute_configuration : Types::InstanceAccessControlAttributeConfiguration,
          @instance_arn : String
        )
        end
      end


      struct CreateInstanceAccessControlAttributeConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateInstanceRequest
        include JSON::Serializable

        # Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the request.
        # This lets you safely retry the request without accidentally performing the same operation a second
        # time. Passing the same value to a later call to an operation requires that you also pass the same
        # value for all other parameters. We recommend that you use a UUID type of value . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The name of the instance of IAM Identity Center.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies tags to be attached to the instance of IAM Identity Center.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String? = nil,
          @name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateInstanceResponse
        include JSON::Serializable

        # The ARN of the instance of IAM Identity Center under which the operation will run. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        def initialize(
          @instance_arn : String? = nil
        )
        end
      end


      struct CreatePermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The name of the PermissionSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The description of the PermissionSet .

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Used to redirect users within the application during the federation authentication process.

        @[JSON::Field(key: "RelayState")]
        getter relay_state : String?

        # The length of time that the application user sessions are valid in the ISO-8601 standard.

        @[JSON::Field(key: "SessionDuration")]
        getter session_duration : String?

        # The tags to attach to the new PermissionSet .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @instance_arn : String,
          @name : String,
          @description : String? = nil,
          @relay_state : String? = nil,
          @session_duration : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePermissionSetResponse
        include JSON::Serializable

        # Defines the level of access on an Amazon Web Services account.

        @[JSON::Field(key: "PermissionSet")]
        getter permission_set : Types::PermissionSet?

        def initialize(
          @permission_set : Types::PermissionSet? = nil
        )
        end
      end


      struct CreateTrustedTokenIssuerRequest
        include JSON::Serializable

        # Specifies the ARN of the instance of IAM Identity Center to contain the new trusted token issuer
        # configuration.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # Specifies the name of the new trusted token issuer configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies settings that apply to the new trusted token issuer configuration. The settings that are
        # available depend on what TrustedTokenIssuerType you specify.

        @[JSON::Field(key: "TrustedTokenIssuerConfiguration")]
        getter trusted_token_issuer_configuration : Types::TrustedTokenIssuerConfiguration

        # Specifies the type of the new trusted token issuer.

        @[JSON::Field(key: "TrustedTokenIssuerType")]
        getter trusted_token_issuer_type : String

        # Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the request.
        # This lets you safely retry the request without accidentally performing the same operation a second
        # time. Passing the same value to a later call to an operation requires that you also pass the same
        # value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Specifies tags to be attached to the new trusted token issuer configuration.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @instance_arn : String,
          @name : String,
          @trusted_token_issuer_configuration : Types::TrustedTokenIssuerConfiguration,
          @trusted_token_issuer_type : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateTrustedTokenIssuerResponse
        include JSON::Serializable

        # The ARN of the new trusted token issuer configuration.

        @[JSON::Field(key: "TrustedTokenIssuerArn")]
        getter trusted_token_issuer_arn : String?

        def initialize(
          @trusted_token_issuer_arn : String? = nil
        )
        end
      end

      # Specifies the name and path of a customer managed policy. You must have an IAM policy that matches
      # the name and path in each Amazon Web Services account where you want to deploy your permission set.

      struct CustomerManagedPolicyReference
        include JSON::Serializable

        # The name of the IAM policy that you have configured in each account where you want to deploy your
        # permission set.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The path to the IAM policy that you have configured in each account where you want to deploy your
        # permission set. The default is / . For more information, see Friendly names and paths in the IAM
        # User Guide .

        @[JSON::Field(key: "Path")]
        getter path : String?

        def initialize(
          @name : String,
          @path : String? = nil
        )
        end
      end


      struct DeleteAccountAssignmentRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the permission set that will be used to remove access.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        # An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds are GUIDs
        # (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about PrincipalIds in IAM
        # Identity Center, see the IAM Identity Center Identity Store API Reference .

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String

        # The entity type for which the assignment will be deleted.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String

        # TargetID is an Amazon Web Services account identifier, (For example, 123456789012).

        @[JSON::Field(key: "TargetId")]
        getter target_id : String

        # The entity type for which the assignment will be deleted.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String,
          @principal_id : String,
          @principal_type : String,
          @target_id : String,
          @target_type : String
        )
        end
      end


      struct DeleteAccountAssignmentResponse
        include JSON::Serializable

        # The status object for the account assignment deletion operation.

        @[JSON::Field(key: "AccountAssignmentDeletionStatus")]
        getter account_assignment_deletion_status : Types::AccountAssignmentOperationStatus?

        def initialize(
          @account_assignment_deletion_status : Types::AccountAssignmentOperationStatus? = nil
        )
        end
      end


      struct DeleteApplicationAccessScopeRequest
        include JSON::Serializable

        # Specifies the ARN of the application with the access scope to delete.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies the name of the access scope to remove from the application.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @application_arn : String,
          @scope : String
        )
        end
      end


      struct DeleteApplicationAssignmentRequest
        include JSON::Serializable

        # Specifies the ARN of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds are GUIDs
        # (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about PrincipalIds in IAM
        # Identity Center, see the IAM Identity Center Identity Store API Reference .

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String

        # The entity type for which the assignment will be deleted.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String

        def initialize(
          @application_arn : String,
          @principal_id : String,
          @principal_type : String
        )
        end
      end


      struct DeleteApplicationAssignmentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteApplicationAuthenticationMethodRequest
        include JSON::Serializable

        # Specifies the ARN of the application with the authentication method to delete.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies the authentication method type to delete from the application.

        @[JSON::Field(key: "AuthenticationMethodType")]
        getter authentication_method_type : String

        def initialize(
          @application_arn : String,
          @authentication_method_type : String
        )
        end
      end


      struct DeleteApplicationGrantRequest
        include JSON::Serializable

        # Specifies the ARN of the application with the grant to delete.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies the type of grant to delete from the application.

        @[JSON::Field(key: "GrantType")]
        getter grant_type : String

        def initialize(
          @application_arn : String,
          @grant_type : String
        )
        end
      end


      struct DeleteApplicationRequest
        include JSON::Serializable

        # Specifies the ARN of the application. For more information about ARNs, see Amazon Resource Names
        # (ARNs) and Amazon Web Services Service Namespaces in the Amazon Web Services General Reference .

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        def initialize(
          @application_arn : String
        )
        end
      end


      struct DeleteApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteInlinePolicyFromPermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the permission set that will be used to remove access.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String
        )
        end
      end


      struct DeleteInlinePolicyFromPermissionSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteInstanceAccessControlAttributeConfigurationRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        def initialize(
          @instance_arn : String
        )
        end
      end


      struct DeleteInstanceAccessControlAttributeConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteInstanceRequest
        include JSON::Serializable

        # The ARN of the instance of IAM Identity Center under which the operation will run.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        def initialize(
          @instance_arn : String
        )
        end
      end


      struct DeleteInstanceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeletePermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the permission set that should be deleted.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String
        )
        end
      end


      struct DeletePermissionSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeletePermissionsBoundaryFromPermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the PermissionSet .

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String
        )
        end
      end


      struct DeletePermissionsBoundaryFromPermissionSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteTrustedTokenIssuerRequest
        include JSON::Serializable

        # Specifies the ARN of the trusted token issuer configuration to delete.

        @[JSON::Field(key: "TrustedTokenIssuerArn")]
        getter trusted_token_issuer_arn : String

        def initialize(
          @trusted_token_issuer_arn : String
        )
        end
      end


      struct DeleteTrustedTokenIssuerResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAccountAssignmentCreationStatusRequest
        include JSON::Serializable

        # The identifier that is used to track the request operation progress.

        @[JSON::Field(key: "AccountAssignmentCreationRequestId")]
        getter account_assignment_creation_request_id : String

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        def initialize(
          @account_assignment_creation_request_id : String,
          @instance_arn : String
        )
        end
      end


      struct DescribeAccountAssignmentCreationStatusResponse
        include JSON::Serializable

        # The status object for the account assignment creation operation.

        @[JSON::Field(key: "AccountAssignmentCreationStatus")]
        getter account_assignment_creation_status : Types::AccountAssignmentOperationStatus?

        def initialize(
          @account_assignment_creation_status : Types::AccountAssignmentOperationStatus? = nil
        )
        end
      end


      struct DescribeAccountAssignmentDeletionStatusRequest
        include JSON::Serializable

        # The identifier that is used to track the request operation progress.

        @[JSON::Field(key: "AccountAssignmentDeletionRequestId")]
        getter account_assignment_deletion_request_id : String

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        def initialize(
          @account_assignment_deletion_request_id : String,
          @instance_arn : String
        )
        end
      end


      struct DescribeAccountAssignmentDeletionStatusResponse
        include JSON::Serializable

        # The status object for the account assignment deletion operation.

        @[JSON::Field(key: "AccountAssignmentDeletionStatus")]
        getter account_assignment_deletion_status : Types::AccountAssignmentOperationStatus?

        def initialize(
          @account_assignment_deletion_status : Types::AccountAssignmentOperationStatus? = nil
        )
        end
      end


      struct DescribeApplicationAssignmentRequest
        include JSON::Serializable

        # Specifies the ARN of the application. For more information about ARNs, see Amazon Resource Names
        # (ARNs) and Amazon Web Services Service Namespaces in the Amazon Web Services General Reference .

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds are GUIDs
        # (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about PrincipalIds in IAM
        # Identity Center, see the IAM Identity Center Identity Store API Reference .

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String

        # The entity type for which the assignment will be created.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String

        def initialize(
          @application_arn : String,
          @principal_id : String,
          @principal_type : String
        )
        end
      end


      struct DescribeApplicationAssignmentResponse
        include JSON::Serializable

        # Specifies the ARN of the application. For more information about ARNs, see Amazon Resource Names
        # (ARNs) and Amazon Web Services Service Namespaces in the Amazon Web Services General Reference .

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds are GUIDs
        # (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about PrincipalIds in IAM
        # Identity Center, see the IAM Identity Center Identity Store API Reference .

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String?

        # The entity type for which the assignment will be created.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String?

        def initialize(
          @application_arn : String? = nil,
          @principal_id : String? = nil,
          @principal_type : String? = nil
        )
        end
      end


      struct DescribeApplicationProviderRequest
        include JSON::Serializable

        # Specifies the ARN of the application provider for which you want details.

        @[JSON::Field(key: "ApplicationProviderArn")]
        getter application_provider_arn : String

        def initialize(
          @application_provider_arn : String
        )
        end
      end


      struct DescribeApplicationProviderResponse
        include JSON::Serializable

        # The ARN of the application provider.

        @[JSON::Field(key: "ApplicationProviderArn")]
        getter application_provider_arn : String

        # A structure with details about the display data for the application provider.

        @[JSON::Field(key: "DisplayData")]
        getter display_data : Types::DisplayData?

        # The protocol used to federate to the application provider.

        @[JSON::Field(key: "FederationProtocol")]
        getter federation_protocol : String?

        # A structure with details about the receiving application.

        @[JSON::Field(key: "ResourceServerConfig")]
        getter resource_server_config : Types::ResourceServerConfig?

        def initialize(
          @application_provider_arn : String,
          @display_data : Types::DisplayData? = nil,
          @federation_protocol : String? = nil,
          @resource_server_config : Types::ResourceServerConfig? = nil
        )
        end
      end


      struct DescribeApplicationRequest
        include JSON::Serializable

        # Specifies the ARN of the application. For more information about ARNs, see Amazon Resource Names
        # (ARNs) and Amazon Web Services Service Namespaces in the Amazon Web Services General Reference .

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        def initialize(
          @application_arn : String
        )
        end
      end


      struct DescribeApplicationResponse
        include JSON::Serializable

        # The account ID.

        @[JSON::Field(key: "ApplicationAccount")]
        getter application_account : String?

        # Specifies the ARN of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The ARN of the application provider under which the operation will run.

        @[JSON::Field(key: "ApplicationProviderArn")]
        getter application_provider_arn : String?

        # The date the application was created.

        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The description of the .

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN of the IAM Identity Center application under which the operation will run. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        # The application name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A structure that describes the options for the portal associated with an application.

        @[JSON::Field(key: "PortalOptions")]
        getter portal_options : Types::PortalOptions?

        # Specifies whether the application is enabled or disabled.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @application_account : String? = nil,
          @application_arn : String? = nil,
          @application_provider_arn : String? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @instance_arn : String? = nil,
          @name : String? = nil,
          @portal_options : Types::PortalOptions? = nil,
          @status : String? = nil
        )
        end
      end


      struct DescribeInstanceAccessControlAttributeConfigurationRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        def initialize(
          @instance_arn : String
        )
        end
      end


      struct DescribeInstanceAccessControlAttributeConfigurationResponse
        include JSON::Serializable

        # Gets the list of IAM Identity Center identity store attributes that have been added to your ABAC
        # configuration.

        @[JSON::Field(key: "InstanceAccessControlAttributeConfiguration")]
        getter instance_access_control_attribute_configuration : Types::InstanceAccessControlAttributeConfiguration?

        # The status of the attribute configuration process.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Provides more details about the current status of the specified attribute.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @instance_access_control_attribute_configuration : Types::InstanceAccessControlAttributeConfiguration? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct DescribeInstanceRequest
        include JSON::Serializable

        # The ARN of the instance of IAM Identity Center under which the operation will run.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        def initialize(
          @instance_arn : String
        )
        end
      end


      struct DescribeInstanceResponse
        include JSON::Serializable

        # The date the instance was created.

        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # Contains the encryption configuration for your IAM Identity Center instance, including the
        # encryption status, KMS key type, and KMS key ARN.

        @[JSON::Field(key: "EncryptionConfigurationDetails")]
        getter encryption_configuration_details : Types::EncryptionConfigurationDetails?

        # The identifier of the identity store that is connected to the instance of IAM Identity Center.

        @[JSON::Field(key: "IdentityStoreId")]
        getter identity_store_id : String?

        # The ARN of the instance of IAM Identity Center under which the operation will run. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        # Specifies the instance name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The identifier of the Amazon Web Services account for which the instance was created.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The status of the instance.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Provides additional context about the current status of the IAM Identity Center instance. This field
        # is particularly useful when an instance is in a non-ACTIVE state, such as CREATE_FAILED. When an
        # instance fails to create or update, this field contains information about the cause, which may
        # include issues with KMS key configuration, permission problems with the specified KMS key, or
        # service-related errors.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @created_date : Time? = nil,
          @encryption_configuration_details : Types::EncryptionConfigurationDetails? = nil,
          @identity_store_id : String? = nil,
          @instance_arn : String? = nil,
          @name : String? = nil,
          @owner_account_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct DescribePermissionSetProvisioningStatusRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The identifier that is provided by the ProvisionPermissionSet call to retrieve the current status of
        # the provisioning workflow.

        @[JSON::Field(key: "ProvisionPermissionSetRequestId")]
        getter provision_permission_set_request_id : String

        def initialize(
          @instance_arn : String,
          @provision_permission_set_request_id : String
        )
        end
      end


      struct DescribePermissionSetProvisioningStatusResponse
        include JSON::Serializable

        # The status object for the permission set provisioning operation.

        @[JSON::Field(key: "PermissionSetProvisioningStatus")]
        getter permission_set_provisioning_status : Types::PermissionSetProvisioningStatus?

        def initialize(
          @permission_set_provisioning_status : Types::PermissionSetProvisioningStatus? = nil
        )
        end
      end


      struct DescribePermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the permission set.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String
        )
        end
      end


      struct DescribePermissionSetResponse
        include JSON::Serializable

        # Describes the level of access on an Amazon Web Services account.

        @[JSON::Field(key: "PermissionSet")]
        getter permission_set : Types::PermissionSet?

        def initialize(
          @permission_set : Types::PermissionSet? = nil
        )
        end
      end


      struct DescribeTrustedTokenIssuerRequest
        include JSON::Serializable

        # Specifies the ARN of the trusted token issuer configuration that you want details about.

        @[JSON::Field(key: "TrustedTokenIssuerArn")]
        getter trusted_token_issuer_arn : String

        def initialize(
          @trusted_token_issuer_arn : String
        )
        end
      end


      struct DescribeTrustedTokenIssuerResponse
        include JSON::Serializable

        # The name of the trusted token issuer configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of the trusted token issuer configuration.

        @[JSON::Field(key: "TrustedTokenIssuerArn")]
        getter trusted_token_issuer_arn : String?

        # A structure the describes the settings that apply of this trusted token issuer.

        @[JSON::Field(key: "TrustedTokenIssuerConfiguration")]
        getter trusted_token_issuer_configuration : Types::TrustedTokenIssuerConfiguration?

        # The type of the trusted token issuer.

        @[JSON::Field(key: "TrustedTokenIssuerType")]
        getter trusted_token_issuer_type : String?

        def initialize(
          @name : String? = nil,
          @trusted_token_issuer_arn : String? = nil,
          @trusted_token_issuer_configuration : Types::TrustedTokenIssuerConfiguration? = nil,
          @trusted_token_issuer_type : String? = nil
        )
        end
      end


      struct DetachCustomerManagedPolicyReferenceFromPermissionSetRequest
        include JSON::Serializable

        # Specifies the name and path of a customer managed policy. You must have an IAM policy that matches
        # the name and path in each Amazon Web Services account where you want to deploy your permission set.

        @[JSON::Field(key: "CustomerManagedPolicyReference")]
        getter customer_managed_policy_reference : Types::CustomerManagedPolicyReference

        # The ARN of the IAM Identity Center instance under which the operation will be executed.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the PermissionSet .

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        def initialize(
          @customer_managed_policy_reference : Types::CustomerManagedPolicyReference,
          @instance_arn : String,
          @permission_set_arn : String
        )
        end
      end


      struct DetachCustomerManagedPolicyReferenceFromPermissionSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DetachManagedPolicyFromPermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The Amazon Web Services managed policy ARN to be detached from a permission set.

        @[JSON::Field(key: "ManagedPolicyArn")]
        getter managed_policy_arn : String

        # The ARN of the PermissionSet from which the policy should be detached.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        def initialize(
          @instance_arn : String,
          @managed_policy_arn : String,
          @permission_set_arn : String
        )
        end
      end


      struct DetachManagedPolicyFromPermissionSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that describes how the portal represents an application provider.

      struct DisplayData
        include JSON::Serializable

        # The description of the application provider that appears in the portal.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the application provider that appears in the portal.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # A URL that points to an icon that represents the application provider.

        @[JSON::Field(key: "IconUrl")]
        getter icon_url : String?

        def initialize(
          @description : String? = nil,
          @display_name : String? = nil,
          @icon_url : String? = nil
        )
        end
      end

      # A structure that specifies the KMS key type and KMS key ARN used to encrypt data in your IAM
      # Identity Center instance.

      struct EncryptionConfiguration
        include JSON::Serializable

        # The type of KMS key used for encryption.

        @[JSON::Field(key: "KeyType")]
        getter key_type : String

        # The ARN of the KMS key used to encrypt data. Required when KeyType is CUSTOMER_MANAGED_KEY. Cannot
        # be specified when KeyType is AWS_OWNED_KMS_KEY.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @key_type : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      # The encryption configuration of your IAM Identity Center instance, including the key type, KMS key
      # ARN, and current encryption status.

      struct EncryptionConfigurationDetails
        include JSON::Serializable

        # The current status of encryption configuration.

        @[JSON::Field(key: "EncryptionStatus")]
        getter encryption_status : String?

        # Provides additional context about the current encryption status. This field is particularly useful
        # when the encryption status is UPDATE_FAILED. When encryption configuration update fails, this field
        # contains information about the cause, which may include KMS key access issues, key not found errors,
        # invalid key configuration, key in an invalid state, or a disabled key.

        @[JSON::Field(key: "EncryptionStatusReason")]
        getter encryption_status_reason : String?

        # The type of KMS key used for encryption.

        @[JSON::Field(key: "KeyType")]
        getter key_type : String?

        # The ARN of the KMS key currently used to encrypt data in your IAM Identity Center instance.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @encryption_status : String? = nil,
          @encryption_status_reason : String? = nil,
          @key_type : String? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end


      struct GetApplicationAccessScopeRequest
        include JSON::Serializable

        # Specifies the ARN of the application with the access scope that you want to retrieve.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies the name of the access scope for which you want the authorized targets.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @application_arn : String,
          @scope : String
        )
        end
      end


      struct GetApplicationAccessScopeResponse
        include JSON::Serializable

        # The name of the access scope that can be used with the authorized targets.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # An array of authorized targets associated with this access scope.

        @[JSON::Field(key: "AuthorizedTargets")]
        getter authorized_targets : Array(String)?

        def initialize(
          @scope : String,
          @authorized_targets : Array(String)? = nil
        )
        end
      end


      struct GetApplicationAssignmentConfigurationRequest
        include JSON::Serializable

        # Specifies the ARN of the application. For more information about ARNs, see Amazon Resource Names
        # (ARNs) and Amazon Web Services Service Namespaces in the Amazon Web Services General Reference .

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        def initialize(
          @application_arn : String
        )
        end
      end


      struct GetApplicationAssignmentConfigurationResponse
        include JSON::Serializable

        # If AssignmentsRequired is true (default value), users don’t have access to the application unless an
        # assignment is created using the CreateApplicationAssignment API . If false , all users have access
        # to the application.

        @[JSON::Field(key: "AssignmentRequired")]
        getter assignment_required : Bool

        def initialize(
          @assignment_required : Bool
        )
        end
      end


      struct GetApplicationAuthenticationMethodRequest
        include JSON::Serializable

        # Specifies the ARN of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies the type of authentication method for which you want details.

        @[JSON::Field(key: "AuthenticationMethodType")]
        getter authentication_method_type : String

        def initialize(
          @application_arn : String,
          @authentication_method_type : String
        )
        end
      end


      struct GetApplicationAuthenticationMethodResponse
        include JSON::Serializable

        # A structure that contains details about the requested authentication method.

        @[JSON::Field(key: "AuthenticationMethod")]
        getter authentication_method : Types::AuthenticationMethod?

        def initialize(
          @authentication_method : Types::AuthenticationMethod? = nil
        )
        end
      end


      struct GetApplicationGrantRequest
        include JSON::Serializable

        # Specifies the ARN of the application that contains the grant.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies the type of grant.

        @[JSON::Field(key: "GrantType")]
        getter grant_type : String

        def initialize(
          @application_arn : String,
          @grant_type : String
        )
        end
      end


      struct GetApplicationGrantResponse
        include JSON::Serializable

        # A structure that describes the requested grant.

        @[JSON::Field(key: "Grant")]
        getter grant : Types::Grant

        def initialize(
          @grant : Types::Grant
        )
        end
      end


      struct GetApplicationSessionConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application for which to retrieve the session configuration.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        def initialize(
          @application_arn : String
        )
        end
      end


      struct GetApplicationSessionConfigurationResponse
        include JSON::Serializable

        # The status of user background sessions for the application.

        @[JSON::Field(key: "UserBackgroundSessionApplicationStatus")]
        getter user_background_session_application_status : String?

        def initialize(
          @user_background_session_application_status : String? = nil
        )
        end
      end


      struct GetInlinePolicyForPermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the permission set.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String
        )
        end
      end


      struct GetInlinePolicyForPermissionSetResponse
        include JSON::Serializable

        # The inline policy that is attached to the permission set. For Length Constraints , if a valid ARN is
        # provided for a permission set, it is possible for an empty inline policy to be returned.

        @[JSON::Field(key: "InlinePolicy")]
        getter inline_policy : String?

        def initialize(
          @inline_policy : String? = nil
        )
        end
      end


      struct GetPermissionsBoundaryForPermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the PermissionSet .

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String
        )
        end
      end


      struct GetPermissionsBoundaryForPermissionSetResponse
        include JSON::Serializable

        # The permissions boundary attached to the specified permission set.

        @[JSON::Field(key: "PermissionsBoundary")]
        getter permissions_boundary : Types::PermissionsBoundary?

        def initialize(
          @permissions_boundary : Types::PermissionsBoundary? = nil
        )
        end
      end

      # The Grant union represents the set of possible configuration options for the selected grant type.
      # Exactly one member of the union must be specified, and must match the grant type selected.

      struct Grant
        include JSON::Serializable

        # Configuration options for the authorization_code grant type.

        @[JSON::Field(key: "AuthorizationCode")]
        getter authorization_code : Types::AuthorizationCodeGrant?

        # Configuration options for the urn:ietf:params:oauth:grant-type:jwt-bearer grant type.

        @[JSON::Field(key: "JwtBearer")]
        getter jwt_bearer : Types::JwtBearerGrant?

        # Configuration options for the refresh_token grant type.

        @[JSON::Field(key: "RefreshToken")]
        getter refresh_token : Types::RefreshTokenGrant?

        # Configuration options for the urn:ietf:params:oauth:grant-type:token-exchange grant type.

        @[JSON::Field(key: "TokenExchange")]
        getter token_exchange : Types::TokenExchangeGrant?

        def initialize(
          @authorization_code : Types::AuthorizationCodeGrant? = nil,
          @jwt_bearer : Types::JwtBearerGrant? = nil,
          @refresh_token : Types::RefreshTokenGrant? = nil,
          @token_exchange : Types::TokenExchangeGrant? = nil
        )
        end
      end

      # A structure that defines a single grant and its configuration.

      struct GrantItem
        include JSON::Serializable

        # The configuration structure for the selected grant.

        @[JSON::Field(key: "Grant")]
        getter grant : Types::Grant

        # The type of the selected grant.

        @[JSON::Field(key: "GrantType")]
        getter grant_type : String

        def initialize(
          @grant : Types::Grant,
          @grant_type : String
        )
        end
      end

      # A structure that describes details for authentication that uses IAM.

      struct IamAuthenticationMethod
        include JSON::Serializable

        # An IAM policy document in JSON.

        @[JSON::Field(key: "ActorPolicy")]
        getter actor_policy : Types::ActorPolicyDocument

        def initialize(
          @actor_policy : Types::ActorPolicyDocument
        )
        end
      end

      # Specifies the attributes to add to your attribute-based access control (ABAC) configuration.

      struct InstanceAccessControlAttributeConfiguration
        include JSON::Serializable

        # Lists the attributes that are configured for ABAC in the specified IAM Identity Center instance.

        @[JSON::Field(key: "AccessControlAttributes")]
        getter access_control_attributes : Array(Types::AccessControlAttribute)

        def initialize(
          @access_control_attributes : Array(Types::AccessControlAttribute)
        )
        end
      end

      # Provides information about the IAM Identity Center instance.

      struct InstanceMetadata
        include JSON::Serializable

        # The date and time that the Identity Center instance was created.

        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The identifier of the identity store that is connected to the Identity Center instance.

        @[JSON::Field(key: "IdentityStoreId")]
        getter identity_store_id : String?

        # The ARN of the Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        # The name of the Identity Center instance.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID number of the owner of the Identity Center instance.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The current status of this Identity Center instance.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Provides additional context about the current status of the IAM Identity Center instance. This field
        # is particularly useful when an instance is in a non-ACTIVE state, such as CREATE_FAILED. When an
        # instance creation fails, this field contains information about the cause, which may include issues
        # with KMS key configuration or insufficient permissions.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @created_date : Time? = nil,
          @identity_store_id : String? = nil,
          @instance_arn : String? = nil,
          @name : String? = nil,
          @owner_account_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception, or failure with an
      # internal server.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure that defines configuration settings for an application that supports the JWT Bearer
      # Token Authorization Grant. The AuthorizedAudience field is the aud claim. For more information, see
      # RFC 7523 .

      struct JwtBearerGrant
        include JSON::Serializable

        # A list of allowed token issuers trusted by the Identity Center instances for this application.
        # AuthorizedTokenIssuers is required when the grant type is JwtBearerGrant .

        @[JSON::Field(key: "AuthorizedTokenIssuers")]
        getter authorized_token_issuers : Array(Types::AuthorizedTokenIssuer)?

        def initialize(
          @authorized_token_issuers : Array(Types::AuthorizedTokenIssuer)? = nil
        )
        end
      end


      struct ListAccountAssignmentCreationStatusRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # Filters results based on the passed attribute value.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::OperationStatusFilter?

        # The maximum number of results to display for the assignment.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_arn : String,
          @filter : Types::OperationStatusFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountAssignmentCreationStatusResponse
        include JSON::Serializable

        # The status object for the account assignment creation operation.

        @[JSON::Field(key: "AccountAssignmentsCreationStatus")]
        getter account_assignments_creation_status : Array(Types::AccountAssignmentOperationStatusMetadata)?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_assignments_creation_status : Array(Types::AccountAssignmentOperationStatusMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountAssignmentDeletionStatusRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # Filters results based on the passed attribute value.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::OperationStatusFilter?

        # The maximum number of results to display for the assignment.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_arn : String,
          @filter : Types::OperationStatusFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountAssignmentDeletionStatusResponse
        include JSON::Serializable

        # The status object for the account assignment deletion operation.

        @[JSON::Field(key: "AccountAssignmentsDeletionStatus")]
        getter account_assignments_deletion_status : Array(Types::AccountAssignmentOperationStatusMetadata)?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_assignments_deletion_status : Array(Types::AccountAssignmentOperationStatusMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A structure that describes a filter for account assignments.

      struct ListAccountAssignmentsFilter
        include JSON::Serializable

        # The ID number of an Amazon Web Services account that filters the results in the response.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @account_id : String? = nil
        )
        end
      end


      struct ListAccountAssignmentsForPrincipalRequest
        include JSON::Serializable

        # Specifies the ARN of the instance of IAM Identity Center that contains the principal.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # Specifies the principal for which you want to retrieve the list of account assignments.

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String

        # Specifies the type of the principal.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String

        # Specifies an Amazon Web Services account ID number. Results are filtered to only those that match
        # this ID number.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ListAccountAssignmentsFilter?

        # Specifies the total number of results that you want included in each response. If additional items
        # exist beyond the number you specify, the NextToken response element is returned with a value (not
        # null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next set of results. Note that the service might return fewer results than the
        # maximum even when there are more results available. You should check NextToken after every operation
        # to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_arn : String,
          @principal_id : String,
          @principal_type : String,
          @filter : Types::ListAccountAssignmentsFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountAssignmentsForPrincipalResponse
        include JSON::Serializable

        # An array list of the account assignments for the principal.

        @[JSON::Field(key: "AccountAssignments")]
        getter account_assignments : Array(Types::AccountAssignmentForPrincipal)?

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_assignments : Array(Types::AccountAssignmentForPrincipal)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountAssignmentsRequest
        include JSON::Serializable

        # The identifier of the Amazon Web Services account from which to list the assignments.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the permission set from which to list assignments.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        # The maximum number of results to display for the assignment.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @instance_arn : String,
          @permission_set_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountAssignmentsResponse
        include JSON::Serializable

        # The list of assignments that match the input Amazon Web Services account and permission set.

        @[JSON::Field(key: "AccountAssignments")]
        getter account_assignments : Array(Types::AccountAssignment)?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_assignments : Array(Types::AccountAssignment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountsForProvisionedPermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the PermissionSet from which the associated Amazon Web Services accounts will be listed.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        # The maximum number of results to display for the PermissionSet .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The permission set provisioning status for an Amazon Web Services account.

        @[JSON::Field(key: "ProvisioningStatus")]
        getter provisioning_status : String?

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @provisioning_status : String? = nil
        )
        end
      end


      struct ListAccountsForProvisionedPermissionSetResponse
        include JSON::Serializable

        # The list of Amazon Web Services AccountIds .

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationAccessScopesRequest
        include JSON::Serializable

        # Specifies the ARN of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies the total number of results that you want included in each response. If additional items
        # exist beyond the number you specify, the NextToken response element is returned with a value (not
        # null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next set of results. Note that the service might return fewer results than the
        # maximum even when there are more results available. You should check NextToken after every operation
        # to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationAccessScopesResponse
        include JSON::Serializable

        # An array list of access scopes and their authorized targets that are associated with the
        # application.

        @[JSON::Field(key: "Scopes")]
        getter scopes : Array(Types::ScopeDetails)

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @scopes : Array(Types::ScopeDetails),
          @next_token : String? = nil
        )
        end
      end

      # A structure that describes a filter for application assignments.

      struct ListApplicationAssignmentsFilter
        include JSON::Serializable

        # The ARN of an application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        def initialize(
          @application_arn : String? = nil
        )
        end
      end


      struct ListApplicationAssignmentsForPrincipalRequest
        include JSON::Serializable

        # Specifies the instance of IAM Identity Center that contains principal and applications.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # Specifies the unique identifier of the principal for which you want to retrieve its assignments.

        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String

        # Specifies the type of the principal for which you want to retrieve its assignments.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String

        # Filters the output to include only assignments associated with the application that has the
        # specified ARN.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ListApplicationAssignmentsFilter?

        # Specifies the total number of results that you want included in each response. If additional items
        # exist beyond the number you specify, the NextToken response element is returned with a value (not
        # null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next set of results. Note that the service might return fewer results than the
        # maximum even when there are more results available. You should check NextToken after every operation
        # to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_arn : String,
          @principal_id : String,
          @principal_type : String,
          @filter : Types::ListApplicationAssignmentsFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationAssignmentsForPrincipalResponse
        include JSON::Serializable

        # An array list of the application assignments for the specified principal.

        @[JSON::Field(key: "ApplicationAssignments")]
        getter application_assignments : Array(Types::ApplicationAssignmentForPrincipal)?

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_assignments : Array(Types::ApplicationAssignmentForPrincipal)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationAssignmentsRequest
        include JSON::Serializable

        # Specifies the ARN of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies the total number of results that you want included in each response. If additional items
        # exist beyond the number you specify, the NextToken response element is returned with a value (not
        # null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next set of results. Note that the service might return fewer results than the
        # maximum even when there are more results available. You should check NextToken after every operation
        # to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationAssignmentsResponse
        include JSON::Serializable

        # The list of users assigned to an application.

        @[JSON::Field(key: "ApplicationAssignments")]
        getter application_assignments : Array(Types::ApplicationAssignment)?

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_assignments : Array(Types::ApplicationAssignment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationAuthenticationMethodsRequest
        include JSON::Serializable

        # Specifies the ARN of the application with the authentication methods you want to list.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_arn : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationAuthenticationMethodsResponse
        include JSON::Serializable

        # An array list of authentication methods for the specified application.

        @[JSON::Field(key: "AuthenticationMethods")]
        getter authentication_methods : Array(Types::AuthenticationMethodItem)?

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @authentication_methods : Array(Types::AuthenticationMethodItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationGrantsRequest
        include JSON::Serializable

        # Specifies the ARN of the application whose grants you want to list.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_arn : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationGrantsResponse
        include JSON::Serializable

        # An array list of structures that describe the requested grants.

        @[JSON::Field(key: "Grants")]
        getter grants : Array(Types::GrantItem)

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @grants : Array(Types::GrantItem),
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationProvidersRequest
        include JSON::Serializable

        # Specifies the total number of results that you want included in each response. If additional items
        # exist beyond the number you specify, the NextToken response element is returned with a value (not
        # null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next set of results. Note that the service might return fewer results than the
        # maximum even when there are more results available. You should check NextToken after every operation
        # to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationProvidersResponse
        include JSON::Serializable

        # An array list of structures that describe application providers.

        @[JSON::Field(key: "ApplicationProviders")]
        getter application_providers : Array(Types::ApplicationProvider)?

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_providers : Array(Types::ApplicationProvider)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A structure that describes a filter for applications.

      struct ListApplicationsFilter
        include JSON::Serializable

        # An Amazon Web Services account ID number that filters the results in the response.

        @[JSON::Field(key: "ApplicationAccount")]
        getter application_account : String?

        # The ARN of an application provider that can filter the results in the response.

        @[JSON::Field(key: "ApplicationProvider")]
        getter application_provider : String?

        def initialize(
          @application_account : String? = nil,
          @application_provider : String? = nil
        )
        end
      end


      struct ListApplicationsRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center application under which the operation will run. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # Filters response results.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ListApplicationsFilter?

        # Specifies the total number of results that you want included in each response. If additional items
        # exist beyond the number you specify, the NextToken response element is returned with a value (not
        # null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next set of results. Note that the service might return fewer results than the
        # maximum even when there are more results available. You should check NextToken after every operation
        # to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_arn : String,
          @filter : Types::ListApplicationsFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationsResponse
        include JSON::Serializable

        # Retrieves all applications associated with the instance.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(Types::Application)?

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @applications : Array(Types::Application)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomerManagedPolicyReferencesInPermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the PermissionSet .

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        # The maximum number of results to display for the list call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomerManagedPolicyReferencesInPermissionSetResponse
        include JSON::Serializable

        # Specifies the names and paths of the customer managed policies that you have attached to your
        # permission set.

        @[JSON::Field(key: "CustomerManagedPolicyReferences")]
        getter customer_managed_policy_references : Array(Types::CustomerManagedPolicyReference)?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @customer_managed_policy_references : Array(Types::CustomerManagedPolicyReference)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInstancesRequest
        include JSON::Serializable

        # The maximum number of results to display for the instance.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInstancesResponse
        include JSON::Serializable

        # Lists the IAM Identity Center instances that the caller has access to.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::InstanceMetadata)?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instances : Array(Types::InstanceMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedPoliciesInPermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the PermissionSet whose managed policies will be listed.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        # The maximum number of results to display for the PermissionSet .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedPoliciesInPermissionSetResponse
        include JSON::Serializable

        # An array of the AttachedManagedPolicy data type object.

        @[JSON::Field(key: "AttachedManagedPolicies")]
        getter attached_managed_policies : Array(Types::AttachedManagedPolicy)?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attached_managed_policies : Array(Types::AttachedManagedPolicy)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPermissionSetProvisioningStatusRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # Filters results based on the passed attribute value.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::OperationStatusFilter?

        # The maximum number of results to display for the assignment.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_arn : String,
          @filter : Types::OperationStatusFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPermissionSetProvisioningStatusResponse
        include JSON::Serializable

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The status object for the permission set provisioning operation.

        @[JSON::Field(key: "PermissionSetsProvisioningStatus")]
        getter permission_sets_provisioning_status : Array(Types::PermissionSetProvisioningStatusMetadata)?

        def initialize(
          @next_token : String? = nil,
          @permission_sets_provisioning_status : Array(Types::PermissionSetProvisioningStatusMetadata)? = nil
        )
        end
      end


      struct ListPermissionSetsProvisionedToAccountRequest
        include JSON::Serializable

        # The identifier of the Amazon Web Services account from which to list the assignments.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The maximum number of results to display for the assignment.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The status object for the permission set provisioning operation.

        @[JSON::Field(key: "ProvisioningStatus")]
        getter provisioning_status : String?

        def initialize(
          @account_id : String,
          @instance_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @provisioning_status : String? = nil
        )
        end
      end


      struct ListPermissionSetsProvisionedToAccountResponse
        include JSON::Serializable

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Defines the level of access that an Amazon Web Services account has.

        @[JSON::Field(key: "PermissionSets")]
        getter permission_sets : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @permission_sets : Array(String)? = nil
        )
        end
      end


      struct ListPermissionSetsRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The maximum number of results to display for the assignment.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPermissionSetsResponse
        include JSON::Serializable

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Defines the level of access on an Amazon Web Services account.

        @[JSON::Field(key: "PermissionSets")]
        getter permission_sets : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @permission_sets : Array(String)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource with the tags to be listed.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @instance_arn : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The pagination token for the list API. Initially the value is null. Use the output of previous API
        # calls to make subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A set of key-value pairs that are used to manage the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListTrustedTokenIssuersRequest
        include JSON::Serializable

        # Specifies the ARN of the instance of IAM Identity Center with the trusted token issuer
        # configurations that you want to list.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # Specifies the total number of results that you want included in each response. If additional items
        # exist beyond the number you specify, the NextToken response element is returned with a value (not
        # null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next set of results. Note that the service might return fewer results than the
        # maximum even when there are more results available. You should check NextToken after every operation
        # to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTrustedTokenIssuersResponse
        include JSON::Serializable

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array list of the trusted token issuer configurations.

        @[JSON::Field(key: "TrustedTokenIssuers")]
        getter trusted_token_issuers : Array(Types::TrustedTokenIssuerMetadata)?

        def initialize(
          @next_token : String? = nil,
          @trusted_token_issuers : Array(Types::TrustedTokenIssuerMetadata)? = nil
        )
        end
      end

      # A structure that describes configuration settings for a trusted token issuer that supports OpenID
      # Connect (OIDC) and JSON Web Tokens (JWTs).

      struct OidcJwtConfiguration
        include JSON::Serializable

        # The path of the source attribute in the JWT from the trusted token issuer. The attribute mapped by
        # this JMESPath expression is compared against the attribute mapped by IdentityStoreAttributePath when
        # a trusted token issuer token is exchanged for an IAM Identity Center token.

        @[JSON::Field(key: "ClaimAttributePath")]
        getter claim_attribute_path : String

        # The path of the destination attribute in a JWT from IAM Identity Center. The attribute mapped by
        # this JMESPath expression is compared against the attribute mapped by ClaimAttributePath when a
        # trusted token issuer token is exchanged for an IAM Identity Center token.

        @[JSON::Field(key: "IdentityStoreAttributePath")]
        getter identity_store_attribute_path : String

        # The URL that IAM Identity Center uses for OpenID Discovery. OpenID Discovery is used to obtain the
        # information required to verify the tokens that the trusted token issuer generates.

        @[JSON::Field(key: "IssuerUrl")]
        getter issuer_url : String

        # The method that the trusted token issuer can use to retrieve the JSON Web Key Set used to verify a
        # JWT.

        @[JSON::Field(key: "JwksRetrievalOption")]
        getter jwks_retrieval_option : String

        def initialize(
          @claim_attribute_path : String,
          @identity_store_attribute_path : String,
          @issuer_url : String,
          @jwks_retrieval_option : String
        )
        end
      end

      # A structure that describes updated configuration settings for a trusted token issuer that supports
      # OpenID Connect (OIDC) and JSON Web Tokens (JWTs).

      struct OidcJwtUpdateConfiguration
        include JSON::Serializable

        # The path of the source attribute in the JWT from the trusted token issuer. The attribute mapped by
        # this JMESPath expression is compared against the attribute mapped by IdentityStoreAttributePath when
        # a trusted token issuer token is exchanged for an IAM Identity Center token.

        @[JSON::Field(key: "ClaimAttributePath")]
        getter claim_attribute_path : String?

        # The path of the destination attribute in a JWT from IAM Identity Center. The attribute mapped by
        # this JMESPath expression is compared against the attribute mapped by ClaimAttributePath when a
        # trusted token issuer token is exchanged for an IAM Identity Center token.

        @[JSON::Field(key: "IdentityStoreAttributePath")]
        getter identity_store_attribute_path : String?

        # The method that the trusted token issuer can use to retrieve the JSON Web Key Set used to verify a
        # JWT.

        @[JSON::Field(key: "JwksRetrievalOption")]
        getter jwks_retrieval_option : String?

        def initialize(
          @claim_attribute_path : String? = nil,
          @identity_store_attribute_path : String? = nil,
          @jwks_retrieval_option : String? = nil
        )
        end
      end

      # Filters the operation status list based on the passed attribute value.

      struct OperationStatusFilter
        include JSON::Serializable

        # Filters the list operations result based on the status attribute.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # An entity that contains IAM policies.

      struct PermissionSet
        include JSON::Serializable

        # The date that the permission set was created.

        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The description of the PermissionSet .

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the permission set.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of the permission set. For more information about ARNs, see Amazon Resource Names (ARNs) and
        # Amazon Web Services Service Namespaces in the Amazon Web Services General Reference .

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String?

        # Used to redirect users within the application during the federation authentication process.

        @[JSON::Field(key: "RelayState")]
        getter relay_state : String?

        # The length of time that the application user sessions are valid for in the ISO-8601 standard.

        @[JSON::Field(key: "SessionDuration")]
        getter session_duration : String?

        def initialize(
          @created_date : Time? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @permission_set_arn : String? = nil,
          @relay_state : String? = nil,
          @session_duration : String? = nil
        )
        end
      end

      # A structure that is used to provide the status of the provisioning operation for a specified
      # permission set.

      struct PermissionSetProvisioningStatus
        include JSON::Serializable

        # The identifier of the Amazon Web Services account from which to list the assignments.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The date that the permission set was created.

        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The message that contains an error or exception in case of an operation failure.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The ARN of the permission set that is being provisioned. For more information about ARNs, see Amazon
        # Resource Names (ARNs) and Amazon Web Services Service Namespaces in the Amazon Web Services General
        # Reference .

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String?

        # The identifier for tracking the request operation that is generated by the universally unique
        # identifier (UUID) workflow.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # The status of the permission set provisioning process.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @account_id : String? = nil,
          @created_date : Time? = nil,
          @failure_reason : String? = nil,
          @permission_set_arn : String? = nil,
          @request_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides information about the permission set provisioning status.

      struct PermissionSetProvisioningStatusMetadata
        include JSON::Serializable

        # The date that the permission set was created.

        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The identifier for tracking the request operation that is generated by the universally unique
        # identifier (UUID) workflow.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # The status of the permission set provisioning process.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_date : Time? = nil,
          @request_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies the configuration of the Amazon Web Services managed or customer managed policy that you
      # want to set as a permissions boundary. Specify either CustomerManagedPolicyReference to use the name
      # and path of a customer managed policy, or ManagedPolicyArn to use the ARN of an Amazon Web Services
      # managed policy. A permissions boundary represents the maximum permissions that any policy can grant
      # your role. For more information, see Permissions boundaries for IAM entities in the IAM User Guide .
      # Policies used as permissions boundaries don't provide permissions. You must also attach an IAM
      # policy to the role. To learn how the effective permissions for a role are evaluated, see IAM JSON
      # policy evaluation logic in the IAM User Guide .

      struct PermissionsBoundary
        include JSON::Serializable

        # Specifies the name and path of a customer managed policy. You must have an IAM policy that matches
        # the name and path in each Amazon Web Services account where you want to deploy your permission set.

        @[JSON::Field(key: "CustomerManagedPolicyReference")]
        getter customer_managed_policy_reference : Types::CustomerManagedPolicyReference?

        # The Amazon Web Services managed policy ARN that you want to attach to a permission set as a
        # permissions boundary.

        @[JSON::Field(key: "ManagedPolicyArn")]
        getter managed_policy_arn : String?

        def initialize(
          @customer_managed_policy_reference : Types::CustomerManagedPolicyReference? = nil,
          @managed_policy_arn : String? = nil
        )
        end
      end

      # A structure that describes the options for the access portal associated with an application.

      struct PortalOptions
        include JSON::Serializable

        # A structure that describes the sign-in options for the access portal.

        @[JSON::Field(key: "SignInOptions")]
        getter sign_in_options : Types::SignInOptions?

        # Indicates whether this application is visible in the access portal.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @sign_in_options : Types::SignInOptions? = nil,
          @visibility : String? = nil
        )
        end
      end


      struct ProvisionPermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the permission set.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        # The entity type for which the assignment will be created.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String

        # TargetID is an Amazon Web Services account identifier, (For example, 123456789012).

        @[JSON::Field(key: "TargetId")]
        getter target_id : String?

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String,
          @target_type : String,
          @target_id : String? = nil
        )
        end
      end


      struct ProvisionPermissionSetResponse
        include JSON::Serializable

        # The status object for the permission set provisioning operation.

        @[JSON::Field(key: "PermissionSetProvisioningStatus")]
        getter permission_set_provisioning_status : Types::PermissionSetProvisioningStatus?

        def initialize(
          @permission_set_provisioning_status : Types::PermissionSetProvisioningStatus? = nil
        )
        end
      end


      struct PutApplicationAccessScopeRequest
        include JSON::Serializable

        # Specifies the ARN of the application with the access scope with the targets to add or update.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies the name of the access scope to be associated with the specified targets.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # Specifies an array list of ARNs that represent the authorized targets for this access scope.

        @[JSON::Field(key: "AuthorizedTargets")]
        getter authorized_targets : Array(String)?

        def initialize(
          @application_arn : String,
          @scope : String,
          @authorized_targets : Array(String)? = nil
        )
        end
      end


      struct PutApplicationAssignmentConfigurationRequest
        include JSON::Serializable

        # Specifies the ARN of the application. For more information about ARNs, see Amazon Resource Names
        # (ARNs) and Amazon Web Services Service Namespaces in the Amazon Web Services General Reference .

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # If AssignmentsRequired is true (default value), users don’t have access to the application unless an
        # assignment is created using the CreateApplicationAssignment API . If false , all users have access
        # to the application.

        @[JSON::Field(key: "AssignmentRequired")]
        getter assignment_required : Bool

        def initialize(
          @application_arn : String,
          @assignment_required : Bool
        )
        end
      end


      struct PutApplicationAssignmentConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutApplicationAuthenticationMethodRequest
        include JSON::Serializable

        # Specifies the ARN of the application with the authentication method to add or update.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies a structure that describes the authentication method to add or update. The structure type
        # you provide is determined by the AuthenticationMethodType parameter.

        @[JSON::Field(key: "AuthenticationMethod")]
        getter authentication_method : Types::AuthenticationMethod

        # Specifies the type of the authentication method that you want to add or update.

        @[JSON::Field(key: "AuthenticationMethodType")]
        getter authentication_method_type : String

        def initialize(
          @application_arn : String,
          @authentication_method : Types::AuthenticationMethod,
          @authentication_method_type : String
        )
        end
      end


      struct PutApplicationGrantRequest
        include JSON::Serializable

        # Specifies the ARN of the application to update.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # Specifies a structure that describes the grant to update.

        @[JSON::Field(key: "Grant")]
        getter grant : Types::Grant

        # Specifies the type of grant to update.

        @[JSON::Field(key: "GrantType")]
        getter grant_type : String

        def initialize(
          @application_arn : String,
          @grant : Types::Grant,
          @grant_type : String
        )
        end
      end


      struct PutApplicationSessionConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application for which to update the session configuration.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # The status of user background sessions for the application.

        @[JSON::Field(key: "UserBackgroundSessionApplicationStatus")]
        getter user_background_session_application_status : String?

        def initialize(
          @application_arn : String,
          @user_background_session_application_status : String? = nil
        )
        end
      end


      struct PutApplicationSessionConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutInlinePolicyToPermissionSetRequest
        include JSON::Serializable

        # The inline policy to attach to a PermissionSet .

        @[JSON::Field(key: "InlinePolicy")]
        getter inline_policy : String

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the permission set.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        def initialize(
          @inline_policy : String,
          @instance_arn : String,
          @permission_set_arn : String
        )
        end
      end


      struct PutInlinePolicyToPermissionSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutPermissionsBoundaryToPermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the PermissionSet .

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        # The permissions boundary that you want to attach to a PermissionSet .

        @[JSON::Field(key: "PermissionsBoundary")]
        getter permissions_boundary : Types::PermissionsBoundary

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String,
          @permissions_boundary : Types::PermissionsBoundary
        )
        end
      end


      struct PutPermissionsBoundaryToPermissionSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that defines configuration settings for an application that supports the OAuth 2.0
      # Refresh Token Grant. For more, see RFC 6749 .

      struct RefreshTokenGrant
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates that a requested resource is not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the resource not found exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # A structure that describes the configuration of a resource server.

      struct ResourceServerConfig
        include JSON::Serializable

        # A list of the IAM Identity Center access scopes that are associated with this resource server.

        @[JSON::Field(key: "Scopes")]
        getter scopes : Hash(String, Types::ResourceServerScopeDetails)?

        def initialize(
          @scopes : Hash(String, Types::ResourceServerScopeDetails)? = nil
        )
        end
      end

      # A structure that describes details for an IAM Identity Center access scope that is associated with a
      # resource server.

      struct ResourceServerScopeDetails
        include JSON::Serializable

        # The title of an access scope for a resource server.

        @[JSON::Field(key: "DetailedTitle")]
        getter detailed_title : String?

        # The description of an access scope for a resource server.

        @[JSON::Field(key: "LongDescription")]
        getter long_description : String?

        def initialize(
          @detailed_title : String? = nil,
          @long_description : String? = nil
        )
        end
      end

      # A structure that describes an IAM Identity Center access scope and its authorized targets.

      struct ScopeDetails
        include JSON::Serializable

        # The name of the access scope.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # An array list of ARNs of applications.

        @[JSON::Field(key: "AuthorizedTargets")]
        getter authorized_targets : Array(String)?

        def initialize(
          @scope : String,
          @authorized_targets : Array(String)? = nil
        )
        end
      end

      # Indicates that the principal has crossed the permitted number of resources that can be created.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure that describes the sign-in options for an application portal.

      struct SignInOptions
        include JSON::Serializable

        # This determines how IAM Identity Center navigates the user to the target application. It can be one
        # of the following values: APPLICATION : IAM Identity Center redirects the customer to the configured
        # ApplicationUrl . IDENTITY_CENTER : IAM Identity Center uses SAML identity-provider initiated
        # authentication to sign the customer directly into a SAML-based application.

        @[JSON::Field(key: "Origin")]
        getter origin : String

        # The URL that accepts authentication requests for an application. This is a required parameter if the
        # Origin parameter is APPLICATION .

        @[JSON::Field(key: "ApplicationUrl")]
        getter application_url : String?

        def initialize(
          @origin : String,
          @application_url : String? = nil
        )
        end
      end

      # A set of key-value pairs that are used to manage the resource. Tags can only be applied to
      # permission sets and cannot be applied to corresponding roles that IAM Identity Center creates in
      # Amazon Web Services accounts.

      struct Tag
        include JSON::Serializable

        # The key for the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource with the tags to be listed.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A set of key-value pairs that are used to manage the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag),
          @instance_arn : String? = nil
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates that the principal has crossed the throttling limits of the API operations.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the throttling exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # A structure that defines configuration settings for an application that supports the OAuth 2.0 Token
      # Exchange Grant. For more information, see RFC 8693 .

      struct TokenExchangeGrant
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that describes the configuration of a trusted token issuer. The structure and available
      # settings are determined by the type of the trusted token issuer.

      struct TrustedTokenIssuerConfiguration
        include JSON::Serializable

        # A structure that describes the settings for a trusted token issuer that works with OpenID Connect
        # (OIDC) by using JSON Web Tokens (JWT).

        @[JSON::Field(key: "OidcJwtConfiguration")]
        getter oidc_jwt_configuration : Types::OidcJwtConfiguration?

        def initialize(
          @oidc_jwt_configuration : Types::OidcJwtConfiguration? = nil
        )
        end
      end

      # A structure that describes a trusted token issuer.

      struct TrustedTokenIssuerMetadata
        include JSON::Serializable

        # The name of the trusted token issuer configuration in the instance of IAM Identity Center.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of the trusted token issuer configuration in the instance of IAM Identity Center.

        @[JSON::Field(key: "TrustedTokenIssuerArn")]
        getter trusted_token_issuer_arn : String?

        # The type of trusted token issuer.

        @[JSON::Field(key: "TrustedTokenIssuerType")]
        getter trusted_token_issuer_type : String?

        def initialize(
          @name : String? = nil,
          @trusted_token_issuer_arn : String? = nil,
          @trusted_token_issuer_type : String? = nil
        )
        end
      end

      # A structure that contains details to be updated for a trusted token issuer configuration. The
      # structure and settings that you can include depend on the type of the trusted token issuer being
      # updated.

      struct TrustedTokenIssuerUpdateConfiguration
        include JSON::Serializable

        # A structure that describes an updated configuration for a trusted token issuer that uses OpenID
        # Connect (OIDC) with JSON web tokens (JWT).

        @[JSON::Field(key: "OidcJwtConfiguration")]
        getter oidc_jwt_configuration : Types::OidcJwtUpdateConfiguration?

        def initialize(
          @oidc_jwt_configuration : Types::OidcJwtUpdateConfiguration? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource with the tags to be listed.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The keys of tags that are attached to the resource.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String),
          @instance_arn : String? = nil
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that describes the options for the access portal associated with an application that can
      # be updated.

      struct UpdateApplicationPortalOptions
        include JSON::Serializable


        @[JSON::Field(key: "SignInOptions")]
        getter sign_in_options : Types::SignInOptions?

        def initialize(
          @sign_in_options : Types::SignInOptions? = nil
        )
        end
      end


      struct UpdateApplicationRequest
        include JSON::Serializable

        # Specifies the ARN of the application. For more information about ARNs, see Amazon Resource Names
        # (ARNs) and Amazon Web Services Service Namespaces in the Amazon Web Services General Reference .

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # The description of the .

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies the updated name for the application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A structure that describes the options for the portal associated with an application.

        @[JSON::Field(key: "PortalOptions")]
        getter portal_options : Types::UpdateApplicationPortalOptions?

        # Specifies whether the application is enabled or disabled.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @application_arn : String,
          @description : String? = nil,
          @name : String? = nil,
          @portal_options : Types::UpdateApplicationPortalOptions? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateInstanceAccessControlAttributeConfigurationRequest
        include JSON::Serializable

        # Updates the attributes for your ABAC configuration.

        @[JSON::Field(key: "InstanceAccessControlAttributeConfiguration")]
        getter instance_access_control_attribute_configuration : Types::InstanceAccessControlAttributeConfiguration

        # The ARN of the IAM Identity Center instance under which the operation will be executed.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        def initialize(
          @instance_access_control_attribute_configuration : Types::InstanceAccessControlAttributeConfiguration,
          @instance_arn : String
        )
        end
      end


      struct UpdateInstanceAccessControlAttributeConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateInstanceRequest
        include JSON::Serializable

        # The ARN of the instance of IAM Identity Center under which the operation will run. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # Specifies the encryption configuration for your IAM Identity Center instance. You can use this to
        # configure customer managed KMS keys (CMK) or Amazon Web Services owned KMS keys for encrypting your
        # instance data.

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # Updates the instance name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @instance_arn : String,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateInstanceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdatePermissionSetRequest
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance under which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference .

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The ARN of the permission set.

        @[JSON::Field(key: "PermissionSetArn")]
        getter permission_set_arn : String

        # The description of the PermissionSet .

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Used to redirect users within the application during the federation authentication process.

        @[JSON::Field(key: "RelayState")]
        getter relay_state : String?

        # The length of time that the application user sessions are valid for in the ISO-8601 standard.

        @[JSON::Field(key: "SessionDuration")]
        getter session_duration : String?

        def initialize(
          @instance_arn : String,
          @permission_set_arn : String,
          @description : String? = nil,
          @relay_state : String? = nil,
          @session_duration : String? = nil
        )
        end
      end


      struct UpdatePermissionSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateTrustedTokenIssuerRequest
        include JSON::Serializable

        # Specifies the ARN of the trusted token issuer configuration that you want to update.

        @[JSON::Field(key: "TrustedTokenIssuerArn")]
        getter trusted_token_issuer_arn : String

        # Specifies the updated name to be applied to the trusted token issuer configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies a structure with settings to apply to the specified trusted token issuer. The settings
        # that you can provide are determined by the type of the trusted token issuer that you are updating.

        @[JSON::Field(key: "TrustedTokenIssuerConfiguration")]
        getter trusted_token_issuer_configuration : Types::TrustedTokenIssuerUpdateConfiguration?

        def initialize(
          @trusted_token_issuer_arn : String,
          @name : String? = nil,
          @trusted_token_issuer_configuration : Types::TrustedTokenIssuerUpdateConfiguration? = nil
        )
        end
      end


      struct UpdateTrustedTokenIssuerResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request failed because it contains a syntax error.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the validation exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end
    end
  end
end
