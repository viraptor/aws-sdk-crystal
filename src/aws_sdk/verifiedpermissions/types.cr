require "json"
require "time"

module AwsSdk
  module VerifiedPermissions
    module Types

      # You don't have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains information about an action for a request for which an authorization decision is made. This
      # data type is used as a request parameter to the IsAuthorized , BatchIsAuthorized , and
      # IsAuthorizedWithToken operations. Example: { "actionId": "&lt;action name&gt;", "actionType":
      # "Action" }
      struct ActionIdentifier
        include JSON::Serializable

        # The ID of an action.
        @[JSON::Field(key: "actionId")]
        getter action_id : String

        # The type of an action.
        @[JSON::Field(key: "actionType")]
        getter action_type : String

        def initialize(
          @action_id : String,
          @action_type : String
        )
        end
      end

      # The value of an attribute. Contains information about the runtime context for a request for which an
      # authorization decision is made. This data type is used as a member of the ContextDefinition
      # structure which is used as a request parameter for the IsAuthorized , BatchIsAuthorized , and
      # IsAuthorizedWithToken operations.
      struct AttributeValue
        include JSON::Serializable

        # An attribute value of Boolean type. Example: {"boolean": true}
        @[JSON::Field(key: "boolean")]
        getter boolean : Bool?

        # An attribute value of datetime type. Example: {"datetime": "2024-10-15T11:35:00Z"}
        @[JSON::Field(key: "datetime")]
        getter datetime : String?

        # An attribute value of decimal type. Example: {"decimal": "1.1"}
        @[JSON::Field(key: "decimal")]
        getter decimal : String?

        # An attribute value of duration type. Example: {"duration": "1h30m"}
        @[JSON::Field(key: "duration")]
        getter duration : String?

        # An attribute value of type EntityIdentifier . Example: {"entityIdentifier": { "entityId": "alice",
        # "entityType": "User"} }
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : Types::EntityIdentifier?

        # An attribute value of ipaddr type. Example: {"ip": "192.168.1.100"}
        @[JSON::Field(key: "ipaddr")]
        getter ipaddr : String?

        # An attribute value of Long type. Example: {"long": 0}
        @[JSON::Field(key: "long")]
        getter long : Int64?

        # An attribute value of Record type. Example: {"record": { "keyName": {} } }
        @[JSON::Field(key: "record")]
        getter record : Hash(String, Types::AttributeValue)?

        # An attribute value of Set type. Example: {"set": [ {} ] }
        @[JSON::Field(key: "set")]
        getter set : Array(Types::AttributeValue)?

        # An attribute value of String type. Example: {"string": "abc"}
        @[JSON::Field(key: "string")]
        getter string : String?

        def initialize(
          @boolean : Bool? = nil,
          @datetime : String? = nil,
          @decimal : String? = nil,
          @duration : String? = nil,
          @entity_identifier : Types::EntityIdentifier? = nil,
          @ipaddr : String? = nil,
          @long : Int64? = nil,
          @record : Hash(String, Types::AttributeValue)? = nil,
          @set : Array(Types::AttributeValue)? = nil,
          @string : String? = nil
        )
        end
      end

      # Contains the information about an error resulting from a BatchGetPolicy API call.
      struct BatchGetPolicyErrorItem
        include JSON::Serializable

        # The error code that was returned.
        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed error message.
        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the policy associated with the failed request.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The identifier of the policy store associated with the failed request.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @code : String,
          @message : String,
          @policy_id : String,
          @policy_store_id : String
        )
        end
      end

      struct BatchGetPolicyInput
        include JSON::Serializable

        # An array of up to 100 policies you want information about.
        @[JSON::Field(key: "requests")]
        getter requests : Array(Types::BatchGetPolicyInputItem)

        def initialize(
          @requests : Array(Types::BatchGetPolicyInputItem)
        )
        end
      end

      # Information about a policy that you include in a BatchGetPolicy API request.
      struct BatchGetPolicyInputItem
        include JSON::Serializable

        # The identifier of the policy you want information about.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The identifier of the policy store where the policy you want information about is stored.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @policy_id : String,
          @policy_store_id : String
        )
        end
      end

      struct BatchGetPolicyOutput
        include JSON::Serializable

        # Information about the policies from the request that resulted in an error. These results are
        # returned in the order they were requested.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchGetPolicyErrorItem)

        # Information about the policies listed in the request that were successfully returned. These results
        # are returned in the order they were requested.
        @[JSON::Field(key: "results")]
        getter results : Array(Types::BatchGetPolicyOutputItem)

        def initialize(
          @errors : Array(Types::BatchGetPolicyErrorItem),
          @results : Array(Types::BatchGetPolicyOutputItem)
        )
        end
      end

      # Contains information about a policy returned from a BatchGetPolicy API request.
      struct BatchGetPolicyOutputItem
        include JSON::Serializable

        # The date and time the policy was created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The policy definition of an item in the list of policies returned.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PolicyDefinitionDetail

        # The date and time the policy was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The identifier of the policy you want information about.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The identifier of the policy store where the policy you want information about is stored.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The type of the policy. This is one of the following values: STATIC TEMPLATE_LINKED
        @[JSON::Field(key: "policyType")]
        getter policy_type : String

        def initialize(
          @created_date : Time,
          @definition : Types::PolicyDefinitionDetail,
          @last_updated_date : Time,
          @policy_id : String,
          @policy_store_id : String,
          @policy_type : String
        )
        end
      end

      struct BatchIsAuthorizedInput
        include JSON::Serializable

        # Specifies the ID of the policy store. Policies in this policy store will be used to make the
        # authorization decisions for the input.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # An array of up to 30 requests that you want Verified Permissions to evaluate.
        @[JSON::Field(key: "requests")]
        getter requests : Array(Types::BatchIsAuthorizedInputItem)

        # (Optional) Specifies the list of resources and principals and their associated attributes that
        # Verified Permissions can examine when evaluating the policies. These additional entities and their
        # attributes can be referenced and checked by conditional elements in the policies in the specified
        # policy store. You can include only principal and resource entities in this parameter; you can't
        # include actions. You must specify actions in the schema.
        @[JSON::Field(key: "entities")]
        getter entities : Types::EntitiesDefinition?

        def initialize(
          @policy_store_id : String,
          @requests : Array(Types::BatchIsAuthorizedInputItem),
          @entities : Types::EntitiesDefinition? = nil
        )
        end
      end

      # An authorization request that you include in a BatchIsAuthorized API request.
      struct BatchIsAuthorizedInputItem
        include JSON::Serializable

        # Specifies the requested action to be authorized. For example, PhotoFlash::ReadPhoto .
        @[JSON::Field(key: "action")]
        getter action : Types::ActionIdentifier?

        # Specifies additional context that can be used to make more granular authorization decisions.
        @[JSON::Field(key: "context")]
        getter context : Types::ContextDefinition?

        # Specifies the principal for which the authorization decision is to be made.
        @[JSON::Field(key: "principal")]
        getter principal : Types::EntityIdentifier?

        # Specifies the resource that you want an authorization decision for. For example, PhotoFlash::Photo .
        @[JSON::Field(key: "resource")]
        getter resource : Types::EntityIdentifier?

        def initialize(
          @action : Types::ActionIdentifier? = nil,
          @context : Types::ContextDefinition? = nil,
          @principal : Types::EntityIdentifier? = nil,
          @resource : Types::EntityIdentifier? = nil
        )
        end
      end

      struct BatchIsAuthorizedOutput
        include JSON::Serializable

        # A series of Allow or Deny decisions for each request, and the policies that produced them. These
        # results are returned in the order they were requested.
        @[JSON::Field(key: "results")]
        getter results : Array(Types::BatchIsAuthorizedOutputItem)

        def initialize(
          @results : Array(Types::BatchIsAuthorizedOutputItem)
        )
        end
      end

      # The decision, based on policy evaluation, from an individual authorization request in a
      # BatchIsAuthorized API request.
      struct BatchIsAuthorizedOutputItem
        include JSON::Serializable

        # An authorization decision that indicates if the authorization request should be allowed or denied.
        @[JSON::Field(key: "decision")]
        getter decision : String

        # The list of determining policies used to make the authorization decision. For example, if there are
        # two matching policies, where one is a forbid and the other is a permit, then the forbid policy will
        # be the determining policy. In the case of multiple matching permit policies then there would be
        # multiple determining policies. In the case that no policies match, and hence the response is DENY,
        # there would be no determining policies.
        @[JSON::Field(key: "determiningPolicies")]
        getter determining_policies : Array(Types::DeterminingPolicyItem)

        # Errors that occurred while making an authorization decision. For example, a policy might reference
        # an entity or attribute that doesn't exist in the request.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::EvaluationErrorItem)

        # The authorization request that initiated the decision.
        @[JSON::Field(key: "request")]
        getter request : Types::BatchIsAuthorizedInputItem

        def initialize(
          @decision : String,
          @determining_policies : Array(Types::DeterminingPolicyItem),
          @errors : Array(Types::EvaluationErrorItem),
          @request : Types::BatchIsAuthorizedInputItem
        )
        end
      end

      struct BatchIsAuthorizedWithTokenInput
        include JSON::Serializable

        # Specifies the ID of the policy store. Policies in this policy store will be used to make an
        # authorization decision for the input.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # An array of up to 30 requests that you want Verified Permissions to evaluate.
        @[JSON::Field(key: "requests")]
        getter requests : Array(Types::BatchIsAuthorizedWithTokenInputItem)

        # Specifies an access token for the principal that you want to authorize in each request. This token
        # is provided to you by the identity provider (IdP) associated with the specified identity source. You
        # must specify either an accessToken , an identityToken , or both. Must be an access token. Verified
        # Permissions returns an error if the token_use claim in the submitted token isn't access .
        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # (Optional) Specifies the list of resources and their associated attributes that Verified Permissions
        # can examine when evaluating the policies. These additional entities and their attributes can be
        # referenced and checked by conditional elements in the policies in the specified policy store. You
        # can't include principals in this parameter, only resource and action entities. This parameter can't
        # include any entities of a type that matches the user or group entity types that you defined in your
        # identity source. The BatchIsAuthorizedWithToken operation takes principal attributes from only the
        # identityToken or accessToken passed to the operation. For action entities, you can include only
        # their Identifier and EntityType .
        @[JSON::Field(key: "entities")]
        getter entities : Types::EntitiesDefinition?

        # Specifies an identity (ID) token for the principal that you want to authorize in each request. This
        # token is provided to you by the identity provider (IdP) associated with the specified identity
        # source. You must specify either an accessToken , an identityToken , or both. Must be an ID token.
        # Verified Permissions returns an error if the token_use claim in the submitted token isn't id .
        @[JSON::Field(key: "identityToken")]
        getter identity_token : String?

        def initialize(
          @policy_store_id : String,
          @requests : Array(Types::BatchIsAuthorizedWithTokenInputItem),
          @access_token : String? = nil,
          @entities : Types::EntitiesDefinition? = nil,
          @identity_token : String? = nil
        )
        end
      end

      # An authorization request that you include in a BatchIsAuthorizedWithToken API request.
      struct BatchIsAuthorizedWithTokenInputItem
        include JSON::Serializable

        # Specifies the requested action to be authorized. For example, PhotoFlash::ReadPhoto .
        @[JSON::Field(key: "action")]
        getter action : Types::ActionIdentifier?

        # Specifies additional context that can be used to make more granular authorization decisions.
        @[JSON::Field(key: "context")]
        getter context : Types::ContextDefinition?

        # Specifies the resource that you want an authorization decision for. For example, PhotoFlash::Photo .
        @[JSON::Field(key: "resource")]
        getter resource : Types::EntityIdentifier?

        def initialize(
          @action : Types::ActionIdentifier? = nil,
          @context : Types::ContextDefinition? = nil,
          @resource : Types::EntityIdentifier? = nil
        )
        end
      end

      struct BatchIsAuthorizedWithTokenOutput
        include JSON::Serializable

        # A series of Allow or Deny decisions for each request, and the policies that produced them. These
        # results are returned in the order they were requested.
        @[JSON::Field(key: "results")]
        getter results : Array(Types::BatchIsAuthorizedWithTokenOutputItem)

        # The identifier of the principal in the ID or access token.
        @[JSON::Field(key: "principal")]
        getter principal : Types::EntityIdentifier?

        def initialize(
          @results : Array(Types::BatchIsAuthorizedWithTokenOutputItem),
          @principal : Types::EntityIdentifier? = nil
        )
        end
      end

      # The decision, based on policy evaluation, from an individual authorization request in a
      # BatchIsAuthorizedWithToken API request.
      struct BatchIsAuthorizedWithTokenOutputItem
        include JSON::Serializable

        # An authorization decision that indicates if the authorization request should be allowed or denied.
        @[JSON::Field(key: "decision")]
        getter decision : String

        # The list of determining policies used to make the authorization decision. For example, if there are
        # two matching policies, where one is a forbid and the other is a permit, then the forbid policy will
        # be the determining policy. In the case of multiple matching permit policies then there would be
        # multiple determining policies. In the case that no policies match, and hence the response is DENY,
        # there would be no determining policies.
        @[JSON::Field(key: "determiningPolicies")]
        getter determining_policies : Array(Types::DeterminingPolicyItem)

        # Errors that occurred while making an authorization decision. For example, a policy might reference
        # an entity or attribute that doesn't exist in the request.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::EvaluationErrorItem)

        # The authorization request that initiated the decision.
        @[JSON::Field(key: "request")]
        getter request : Types::BatchIsAuthorizedWithTokenInputItem

        def initialize(
          @decision : String,
          @determining_policies : Array(Types::DeterminingPolicyItem),
          @errors : Array(Types::EvaluationErrorItem),
          @request : Types::BatchIsAuthorizedWithTokenInputItem
        )
        end
      end

      # The value of an entity's Cedar tag. This data type is used as a member of the EntityItem structure
      # that forms the body of the Entities request parameter for the IsAuthorized , BatchIsAuthorized ,
      # IsAuthorizedWithToken , and BatchIsAuthorizedWithToken operations.
      struct CedarTagValue
        include JSON::Serializable

        # A Cedar tag value of Boolean type. Example: {"boolean": false}
        @[JSON::Field(key: "boolean")]
        getter boolean : Bool?

        # A Cedar tag value of datetime type. Example: {"datetime": "2025-11-04T11:35:00.000+0100"}
        @[JSON::Field(key: "datetime")]
        getter datetime : String?

        # A Cedar tag value of decimal type. Example: {"decimal": "-2.0"}
        @[JSON::Field(key: "decimal")]
        getter decimal : String?

        # A Cedar tag value of duration type. Example: {"duration": "-1d12h"}
        @[JSON::Field(key: "duration")]
        getter duration : String?

        # A Cedar tag value of type EntityIdentifier . Example: {"entityIdentifier": { "entityId": "alice",
        # "entityType": "User"} }
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : Types::EntityIdentifier?

        # A Cedar tag value of ipaddr type. Example: {"ip": "10.50.0.0/24"}
        @[JSON::Field(key: "ipaddr")]
        getter ipaddr : String?

        # A Cedar tag value of Long type. Example: {"long": 0}
        @[JSON::Field(key: "long")]
        getter long : Int64?

        # A Cedar tag value of Record type. Example: {"record": { "keyName": {} } }
        @[JSON::Field(key: "record")]
        getter record : Hash(String, Types::CedarTagValue)?

        # A Cedar tag value of Set type. Example: {"set": [ { "string": "abc" } ] }
        @[JSON::Field(key: "set")]
        getter set : Array(Types::CedarTagValue)?

        # A Cedar tag value of String type. Example: {"string": "abc"}
        @[JSON::Field(key: "string")]
        getter string : String?

        def initialize(
          @boolean : Bool? = nil,
          @datetime : String? = nil,
          @decimal : String? = nil,
          @duration : String? = nil,
          @entity_identifier : Types::EntityIdentifier? = nil,
          @ipaddr : String? = nil,
          @long : Int64? = nil,
          @record : Hash(String, Types::CedarTagValue)? = nil,
          @set : Array(Types::CedarTagValue)? = nil,
          @string : String? = nil
        )
        end
      end

      # The type of entity that a policy store maps to groups from an Amazon Cognito user pool identity
      # source. This data type is part of a CognitoUserPoolConfiguration structure and is a request
      # parameter in CreateIdentitySource .
      struct CognitoGroupConfiguration
        include JSON::Serializable

        # The name of the schema entity type that's mapped to the user pool group. Defaults to
        # AWS::CognitoGroup .
        @[JSON::Field(key: "groupEntityType")]
        getter group_entity_type : String

        def initialize(
          @group_entity_type : String
        )
        end
      end

      # The type of entity that a policy store maps to groups from an Amazon Cognito user pool identity
      # source. This data type is part of an CognitoUserPoolConfigurationDetail structure and is a response
      # parameter to GetIdentitySource .
      struct CognitoGroupConfigurationDetail
        include JSON::Serializable

        # The name of the schema entity type that's mapped to the user pool group. Defaults to
        # AWS::CognitoGroup .
        @[JSON::Field(key: "groupEntityType")]
        getter group_entity_type : String?

        def initialize(
          @group_entity_type : String? = nil
        )
        end
      end

      # The type of entity that a policy store maps to groups from an Amazon Cognito user pool identity
      # source. This data type is part of an CognitoUserPoolConfigurationItem structure and is a response
      # parameter to ListIdentitySources .
      struct CognitoGroupConfigurationItem
        include JSON::Serializable

        # The name of the schema entity type that's mapped to the user pool group. Defaults to
        # AWS::CognitoGroup .
        @[JSON::Field(key: "groupEntityType")]
        getter group_entity_type : String?

        def initialize(
          @group_entity_type : String? = nil
        )
        end
      end

      # The configuration for an identity source that represents a connection to an Amazon Cognito user pool
      # used as an identity provider for Verified Permissions. This data type part of a Configuration
      # structure that is used as a parameter to CreateIdentitySource . Example:
      # "CognitoUserPoolConfiguration":{"UserPoolArn":"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5","ClientIds":
      # ["a1b2c3d4e5f6g7h8i9j0kalbmc"],"groupConfiguration": {"groupEntityType": "MyCorp::Group"}}
      struct CognitoUserPoolConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Cognito user pool that contains the identities to be
        # authorized. Example: "UserPoolArn":
        # "arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5"
        @[JSON::Field(key: "userPoolArn")]
        getter user_pool_arn : String

        # The unique application client IDs that are associated with the specified Amazon Cognito user pool.
        # Example: "ClientIds": ["&amp;ExampleCogClientId;"]
        @[JSON::Field(key: "clientIds")]
        getter client_ids : Array(String)?

        # The type of entity that a policy store maps to groups from an Amazon Cognito user pool identity
        # source.
        @[JSON::Field(key: "groupConfiguration")]
        getter group_configuration : Types::CognitoGroupConfiguration?

        def initialize(
          @user_pool_arn : String,
          @client_ids : Array(String)? = nil,
          @group_configuration : Types::CognitoGroupConfiguration? = nil
        )
        end
      end

      # The configuration for an identity source that represents a connection to an Amazon Cognito user pool
      # used as an identity provider for Verified Permissions. This data type is used as a field that is
      # part of an ConfigurationDetail structure that is part of the response to GetIdentitySource .
      # Example:
      # "CognitoUserPoolConfiguration":{"UserPoolArn":"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5","ClientIds":
      # ["a1b2c3d4e5f6g7h8i9j0kalbmc"],"groupConfiguration": {"groupEntityType": "MyCorp::Group"}}
      struct CognitoUserPoolConfigurationDetail
        include JSON::Serializable

        # The unique application client IDs that are associated with the specified Amazon Cognito user pool.
        # Example: "clientIds": ["&amp;ExampleCogClientId;"]
        @[JSON::Field(key: "clientIds")]
        getter client_ids : Array(String)

        # The OpenID Connect (OIDC) issuer ID of the Amazon Cognito user pool that contains the identities to
        # be authorized. Example: "issuer": "https://cognito-idp.us-east-1.amazonaws.com/us-east-1_1a2b3c4d5"
        @[JSON::Field(key: "issuer")]
        getter issuer : String

        # The Amazon Resource Name (ARN) of the Amazon Cognito user pool that contains the identities to be
        # authorized. Example: "userPoolArn":
        # "arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5"
        @[JSON::Field(key: "userPoolArn")]
        getter user_pool_arn : String

        # The type of entity that a policy store maps to groups from an Amazon Cognito user pool identity
        # source.
        @[JSON::Field(key: "groupConfiguration")]
        getter group_configuration : Types::CognitoGroupConfigurationDetail?

        def initialize(
          @client_ids : Array(String),
          @issuer : String,
          @user_pool_arn : String,
          @group_configuration : Types::CognitoGroupConfigurationDetail? = nil
        )
        end
      end

      # The configuration for an identity source that represents a connection to an Amazon Cognito user pool
      # used as an identity provider for Verified Permissions. This data type is used as a field that is
      # part of the ConfigurationItem structure that is part of the response to ListIdentitySources .
      # Example:
      # "CognitoUserPoolConfiguration":{"UserPoolArn":"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5","ClientIds":
      # ["a1b2c3d4e5f6g7h8i9j0kalbmc"],"groupConfiguration": {"groupEntityType": "MyCorp::Group"}}
      struct CognitoUserPoolConfigurationItem
        include JSON::Serializable

        # The unique application client IDs that are associated with the specified Amazon Cognito user pool.
        # Example: "clientIds": ["&amp;ExampleCogClientId;"]
        @[JSON::Field(key: "clientIds")]
        getter client_ids : Array(String)

        # The OpenID Connect (OIDC) issuer ID of the Amazon Cognito user pool that contains the identities to
        # be authorized. Example: "issuer": "https://cognito-idp.us-east-1.amazonaws.com/us-east-1_1a2b3c4d5"
        @[JSON::Field(key: "issuer")]
        getter issuer : String

        # The Amazon Resource Name (ARN) of the Amazon Cognito user pool that contains the identities to be
        # authorized. Example: "userPoolArn":
        # "arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5"
        @[JSON::Field(key: "userPoolArn")]
        getter user_pool_arn : String

        # The type of entity that a policy store maps to groups from an Amazon Cognito user pool identity
        # source.
        @[JSON::Field(key: "groupConfiguration")]
        getter group_configuration : Types::CognitoGroupConfigurationItem?

        def initialize(
          @client_ids : Array(String),
          @issuer : String,
          @user_pool_arn : String,
          @group_configuration : Types::CognitoGroupConfigurationItem? = nil
        )
        end
      end

      # Contains configuration information used when creating a new identity source. This data type is used
      # as a request parameter for the CreateIdentitySource operation.
      struct Configuration
        include JSON::Serializable

        # Contains configuration details of a Amazon Cognito user pool that Verified Permissions can use as a
        # source of authenticated identities as entities. It specifies the Amazon Resource Name (ARN) of a
        # Amazon Cognito user pool and one or more application client IDs. Example:
        # "configuration":{"cognitoUserPoolConfiguration":{"userPoolArn":"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5","clientIds":
        # ["a1b2c3d4e5f6g7h8i9j0kalbmc"],"groupConfiguration": {"groupEntityType": "MyCorp::Group"}}}
        @[JSON::Field(key: "cognitoUserPoolConfiguration")]
        getter cognito_user_pool_configuration : Types::CognitoUserPoolConfiguration?

        # Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity source,
        # that Verified Permissions can use to generate entities from authenticated identities. It specifies
        # the issuer URL, token type that you want to use, and policy store entity details. Example:
        # "configuration":{"openIdConnectConfiguration":{"issuer":"https://auth.example.com","tokenSelection":{"accessTokenOnly":{"audiences":["https://myapp.example.com","https://myapp2.example.com"],"principalIdClaim":"sub"}},"entityIdPrefix":"MyOIDCProvider","groupConfiguration":{"groupClaim":"groups","groupEntityType":"MyCorp::UserGroup"}}}
        @[JSON::Field(key: "openIdConnectConfiguration")]
        getter open_id_connect_configuration : Types::OpenIdConnectConfiguration?

        def initialize(
          @cognito_user_pool_configuration : Types::CognitoUserPoolConfiguration? = nil,
          @open_id_connect_configuration : Types::OpenIdConnectConfiguration? = nil
        )
        end
      end

      # Contains configuration information about an identity source. This data type is a response parameter
      # to the GetIdentitySource operation.
      struct ConfigurationDetail
        include JSON::Serializable

        # Contains configuration details of a Amazon Cognito user pool that Verified Permissions can use as a
        # source of authenticated identities as entities. It specifies the Amazon Resource Name (ARN) of a
        # Amazon Cognito user pool, the policy store entity that you want to assign to user groups, and one or
        # more application client IDs. Example:
        # "configuration":{"cognitoUserPoolConfiguration":{"userPoolArn":"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5","clientIds":
        # ["a1b2c3d4e5f6g7h8i9j0kalbmc"],"groupConfiguration": {"groupEntityType": "MyCorp::Group"}}}
        @[JSON::Field(key: "cognitoUserPoolConfiguration")]
        getter cognito_user_pool_configuration : Types::CognitoUserPoolConfigurationDetail?

        # Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity source,
        # that Verified Permissions can use to generate entities from authenticated identities. It specifies
        # the issuer URL, token type that you want to use, and policy store entity details. Example:
        # "configuration":{"openIdConnectConfiguration":{"issuer":"https://auth.example.com","tokenSelection":{"accessTokenOnly":{"audiences":["https://myapp.example.com","https://myapp2.example.com"],"principalIdClaim":"sub"}},"entityIdPrefix":"MyOIDCProvider","groupConfiguration":{"groupClaim":"groups","groupEntityType":"MyCorp::UserGroup"}}}
        @[JSON::Field(key: "openIdConnectConfiguration")]
        getter open_id_connect_configuration : Types::OpenIdConnectConfigurationDetail?

        def initialize(
          @cognito_user_pool_configuration : Types::CognitoUserPoolConfigurationDetail? = nil,
          @open_id_connect_configuration : Types::OpenIdConnectConfigurationDetail? = nil
        )
        end
      end

      # Contains configuration information about an identity source. This data type is a response parameter
      # to the ListIdentitySources operation.
      struct ConfigurationItem
        include JSON::Serializable

        # Contains configuration details of a Amazon Cognito user pool that Verified Permissions can use as a
        # source of authenticated identities as entities. It specifies the Amazon Resource Name (ARN) of a
        # Amazon Cognito user pool, the policy store entity that you want to assign to user groups, and one or
        # more application client IDs. Example:
        # "configuration":{"cognitoUserPoolConfiguration":{"userPoolArn":"arn:aws:cognito-idp:us-east-1:123456789012:userpool/us-east-1_1a2b3c4d5","clientIds":
        # ["a1b2c3d4e5f6g7h8i9j0kalbmc"],"groupConfiguration": {"groupEntityType": "MyCorp::Group"}}}
        @[JSON::Field(key: "cognitoUserPoolConfiguration")]
        getter cognito_user_pool_configuration : Types::CognitoUserPoolConfigurationItem?

        # Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity source,
        # that Verified Permissions can use to generate entities from authenticated identities. It specifies
        # the issuer URL, token type that you want to use, and policy store entity details. Example:
        # "configuration":{"openIdConnectConfiguration":{"issuer":"https://auth.example.com","tokenSelection":{"accessTokenOnly":{"audiences":["https://myapp.example.com","https://myapp2.example.com"],"principalIdClaim":"sub"}},"entityIdPrefix":"MyOIDCProvider","groupConfiguration":{"groupClaim":"groups","groupEntityType":"MyCorp::UserGroup"}}}
        @[JSON::Field(key: "openIdConnectConfiguration")]
        getter open_id_connect_configuration : Types::OpenIdConnectConfigurationItem?

        def initialize(
          @cognito_user_pool_configuration : Types::CognitoUserPoolConfigurationItem? = nil,
          @open_id_connect_configuration : Types::OpenIdConnectConfigurationItem? = nil
        )
        end
      end

      # The request failed because another request to modify a resource occurred at the same.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The list of resources referenced with this failed request.
        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::ResourceConflict)

        def initialize(
          @message : String,
          @resources : Array(Types::ResourceConflict)
        )
        end
      end

      # Contains additional details about the context of the request. Verified Permissions evaluates this
      # information in an authorization request as part of the when and unless clauses in a policy. This
      # data type is used as a request parameter for the IsAuthorized , BatchIsAuthorized , and
      # IsAuthorizedWithToken operations. If you're passing context as part of the request, exactly one
      # instance of context must be passed. If you don't want to pass context, omit the context parameter
      # from your request rather than sending context {} . Example:
      # "context":{"contextMap":{"&lt;KeyName1&gt;":{"boolean":true},"&lt;KeyName2&gt;":{"long":1234}}}
      struct ContextDefinition
        include JSON::Serializable

        # A Cedar JSON string representation of the context needed to successfully evaluate an authorization
        # request. Example: {"cedarJson":"{\"&lt;KeyName1&gt;\": true, \"&lt;KeyName2&gt;\": 1234}" }
        @[JSON::Field(key: "cedarJson")]
        getter cedar_json : String?

        # An list of attributes that are needed to successfully evaluate an authorization request. Each
        # attribute in this array must include a map of a data type and its value. Example:
        # "contextMap":{"&lt;KeyName1&gt;":{"boolean":true},"&lt;KeyName2&gt;":{"long":1234}}
        @[JSON::Field(key: "contextMap")]
        getter context_map : Hash(String, Types::AttributeValue)?

        def initialize(
          @cedar_json : String? = nil,
          @context_map : Hash(String, Types::AttributeValue)? = nil
        )
        end
      end

      struct CreateIdentitySourceInput
        include JSON::Serializable

        # Specifies the details required to communicate with the identity provider (IdP) associated with this
        # identity source.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::Configuration

        # Specifies the ID of the policy store in which you want to store this identity source. Only policies
        # and requests made using this policy store can reference identities from the identity provider
        # configured in the new identity source.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the request.
        # This lets you safely retry the request without accidentally performing the same operation a second
        # time. Passing the same value to a later call to an operation requires that you also pass the same
        # value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # ConflictException error. Verified Permissions recognizes a ClientToken for eight hours. After eight
        # hours, the next request with the same parameters performs the operation again regardless of the
        # value of ClientToken .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies the namespace and data type of the principals generated for identities authenticated by
        # the new identity source.
        @[JSON::Field(key: "principalEntityType")]
        getter principal_entity_type : String?

        def initialize(
          @configuration : Types::Configuration,
          @policy_store_id : String,
          @client_token : String? = nil,
          @principal_entity_type : String? = nil
        )
        end
      end

      struct CreateIdentitySourceOutput
        include JSON::Serializable

        # The date and time the identity source was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The unique ID of the new identity source.
        @[JSON::Field(key: "identitySourceId")]
        getter identity_source_id : String

        # The date and time the identity source was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The ID of the policy store that contains the identity source.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @created_date : Time,
          @identity_source_id : String,
          @last_updated_date : Time,
          @policy_store_id : String
        )
        end
      end

      struct CreatePolicyInput
        include JSON::Serializable

        # A structure that specifies the policy type and content to use for the new policy. You must include
        # either a static or a templateLinked element. The policy content must be written in the Cedar policy
        # language.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PolicyDefinition

        # Specifies the PolicyStoreId of the policy store you want to store the policy in.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the request.
        # This lets you safely retry the request without accidentally performing the same operation a second
        # time. Passing the same value to a later call to an operation requires that you also pass the same
        # value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # ConflictException error. Verified Permissions recognizes a ClientToken for eight hours. After eight
        # hours, the next request with the same parameters performs the operation again regardless of the
        # value of ClientToken .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @definition : Types::PolicyDefinition,
          @policy_store_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct CreatePolicyOutput
        include JSON::Serializable

        # The date and time the policy was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The date and time the policy was last updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The unique ID of the new policy.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The ID of the policy store that contains the new policy.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The policy type of the new policy.
        @[JSON::Field(key: "policyType")]
        getter policy_type : String

        # The action that a policy permits or forbids. For example, {"actions": [{"actionId": "ViewPhoto",
        # "actionType": "PhotoFlash::Action"}, {"entityID": "SharePhoto", "entityType":
        # "PhotoFlash::Action"}]} .
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::ActionIdentifier)?

        # The effect of the decision that a policy returns to an authorization request. For example, "effect":
        # "Permit" .
        @[JSON::Field(key: "effect")]
        getter effect : String?

        # The principal specified in the new policy's scope. This response element isn't present when
        # principal isn't specified in the policy content.
        @[JSON::Field(key: "principal")]
        getter principal : Types::EntityIdentifier?

        # The resource specified in the new policy's scope. This response element isn't present when the
        # resource isn't specified in the policy content.
        @[JSON::Field(key: "resource")]
        getter resource : Types::EntityIdentifier?

        def initialize(
          @created_date : Time,
          @last_updated_date : Time,
          @policy_id : String,
          @policy_store_id : String,
          @policy_type : String,
          @actions : Array(Types::ActionIdentifier)? = nil,
          @effect : String? = nil,
          @principal : Types::EntityIdentifier? = nil,
          @resource : Types::EntityIdentifier? = nil
        )
        end
      end

      struct CreatePolicyStoreInput
        include JSON::Serializable

        # Specifies the validation setting for this policy store. Currently, the only valid and required value
        # is Mode . We recommend that you turn on STRICT mode only after you define a schema. If a schema
        # doesn't exist, then STRICT mode causes any policy to fail validation, and Verified Permissions
        # rejects the policy. You can turn off validation by using the UpdatePolicyStore . Then, when you have
        # a schema defined, use UpdatePolicyStore again to turn validation back on.
        @[JSON::Field(key: "validationSettings")]
        getter validation_settings : Types::ValidationSettings

        # Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the request.
        # This lets you safely retry the request without accidentally performing the same operation a second
        # time. Passing the same value to a later call to an operation requires that you also pass the same
        # value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # ConflictException error. Verified Permissions recognizes a ClientToken for eight hours. After eight
        # hours, the next request with the same parameters performs the operation again regardless of the
        # value of ClientToken .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies whether the policy store can be deleted. If enabled, the policy store can't be deleted.
        # The default state is DISABLED .
        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : String?

        # Descriptive text that you can provide to help with identification of the current policy store.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The list of key-value pairs to associate with the policy store.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @validation_settings : Types::ValidationSettings,
          @client_token : String? = nil,
          @deletion_protection : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreatePolicyStoreOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new policy store.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time the policy store was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The date and time the policy store was last updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The unique ID of the new policy store.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @arn : String,
          @created_date : Time,
          @last_updated_date : Time,
          @policy_store_id : String
        )
        end
      end

      struct CreatePolicyTemplateInput
        include JSON::Serializable

        # The ID of the policy store in which to create the policy template.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies the content that you want to use for the new policy template, written in the Cedar policy
        # language.
        @[JSON::Field(key: "statement")]
        getter statement : String

        # Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the request.
        # This lets you safely retry the request without accidentally performing the same operation a second
        # time. Passing the same value to a later call to an operation requires that you also pass the same
        # value for all other parameters. We recommend that you use a UUID type of value. . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # ConflictException error. Verified Permissions recognizes a ClientToken for eight hours. After eight
        # hours, the next request with the same parameters performs the operation again regardless of the
        # value of ClientToken .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies a description for the policy template.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @policy_store_id : String,
          @statement : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreatePolicyTemplateOutput
        include JSON::Serializable

        # The date and time the policy template was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The date and time the policy template was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The ID of the policy store that contains the policy template.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The unique ID of the new policy template.
        @[JSON::Field(key: "policyTemplateId")]
        getter policy_template_id : String

        def initialize(
          @created_date : Time,
          @last_updated_date : Time,
          @policy_store_id : String,
          @policy_template_id : String
        )
        end
      end

      struct DeleteIdentitySourceInput
        include JSON::Serializable

        # Specifies the ID of the identity source that you want to delete.
        @[JSON::Field(key: "identitySourceId")]
        getter identity_source_id : String

        # Specifies the ID of the policy store that contains the identity source that you want to delete.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @identity_source_id : String,
          @policy_store_id : String
        )
        end
      end

      struct DeleteIdentitySourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeletePolicyInput
        include JSON::Serializable

        # Specifies the ID of the policy that you want to delete.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # Specifies the ID of the policy store that contains the policy that you want to delete.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @policy_id : String,
          @policy_store_id : String
        )
        end
      end

      struct DeletePolicyOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeletePolicyStoreInput
        include JSON::Serializable

        # Specifies the ID of the policy store that you want to delete.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @policy_store_id : String
        )
        end
      end

      struct DeletePolicyStoreOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeletePolicyTemplateInput
        include JSON::Serializable

        # Specifies the ID of the policy store that contains the policy template that you want to delete.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies the ID of the policy template that you want to delete.
        @[JSON::Field(key: "policyTemplateId")]
        getter policy_template_id : String

        def initialize(
          @policy_store_id : String,
          @policy_template_id : String
        )
        end
      end

      struct DeletePolicyTemplateOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about one of the policies that determined an authorization decision. This data
      # type is used as an element in a response parameter for the IsAuthorized , BatchIsAuthorized , and
      # IsAuthorizedWithToken operations. Example:
      # "determiningPolicies":[{"policyId":"SPEXAMPLEabcdefg111111"}]
      struct DeterminingPolicyItem
        include JSON::Serializable

        # The Id of a policy that determined to an authorization decision. Example:
        # "policyId":"SPEXAMPLEabcdefg111111"
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        def initialize(
          @policy_id : String
        )
        end
      end

      # Contains the list of entities to be considered during an authorization request. This includes all
      # principals, resources, and actions required to successfully evaluate the request. This data type is
      # used as a field in the response parameter for the IsAuthorized and IsAuthorizedWithToken operations.
      struct EntitiesDefinition
        include JSON::Serializable

        # A Cedar JSON string representation of the entities needed to successfully evaluate an authorization
        # request. Example: {"cedarJson":
        # "[{\"uid\":{\"type\":\"Photo\",\"id\":\"VacationPhoto94.jpg\"},\"attrs\":{\"accessLevel\":\"public\"},\"parents\":[]}]"}
        @[JSON::Field(key: "cedarJson")]
        getter cedar_json : String?

        # An array of entities that are needed to successfully evaluate an authorization request. Each entity
        # in this array must include an identifier for the entity, the attributes of the entity, and a list of
        # any parent entities. If you include multiple entities with the same identifier , only the last one
        # is processed in the request.
        @[JSON::Field(key: "entityList")]
        getter entity_list : Array(Types::EntityItem)?

        def initialize(
          @cedar_json : String? = nil,
          @entity_list : Array(Types::EntityItem)? = nil
        )
        end
      end

      # Contains the identifier of an entity, including its ID and type. This data type is used as a request
      # parameter for IsAuthorized operation, and as a response parameter for the CreatePolicy , GetPolicy ,
      # and UpdatePolicy operations. Example: {"entityId":" string ","entityType":" string "}
      struct EntityIdentifier
        include JSON::Serializable

        # The identifier of an entity. "entityId":" identifier "
        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The type of an entity. Example: "entityType":" typeName "
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        def initialize(
          @entity_id : String,
          @entity_type : String
        )
        end
      end

      # Contains information about an entity that can be referenced in a Cedar policy. This data type is
      # used as one of the fields in the EntitiesDefinition structure. { "identifier": { "entityType":
      # "Photo", "entityId": "VacationPhoto94.jpg" }, "attributes": {}, "parents": [ { "entityType":
      # "Album", "entityId": "alice_folder" } ] }
      struct EntityItem
        include JSON::Serializable

        # The identifier of the entity.
        @[JSON::Field(key: "identifier")]
        getter identifier : Types::EntityIdentifier

        # A list of attributes for the entity.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, Types::AttributeValue)?

        # The parent entities in the hierarchy that contains the entity. A principal or resource entity can be
        # defined with at most 99 transitive parents per authorization request. A transitive parent is an
        # entity in the hierarchy of entities including all direct parents, and parents of parents. For
        # example, a user can be a member of 91 groups if one of those groups is a member of eight groups, for
        # a total of 100: one entity, 91 entity parents, and eight parents of parents.
        @[JSON::Field(key: "parents")]
        getter parents : Array(Types::EntityIdentifier)?

        # A list of cedar tags for the entity.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, Types::CedarTagValue)?

        def initialize(
          @identifier : Types::EntityIdentifier,
          @attributes : Hash(String, Types::AttributeValue)? = nil,
          @parents : Array(Types::EntityIdentifier)? = nil,
          @tags : Hash(String, Types::CedarTagValue)? = nil
        )
        end
      end

      # Contains information about a principal or resource that can be referenced in a Cedar policy. This
      # data type is used as part of the PolicyFilter structure that is used as a request parameter for the
      # ListPolicies operation..
      struct EntityReference
        include JSON::Serializable

        # The identifier of the entity. It can consist of either an EntityType and EntityId, a principal, or a
        # resource.
        @[JSON::Field(key: "identifier")]
        getter identifier : Types::EntityIdentifier?

        # Used to indicate that a principal or resource is not specified. This can be used to search for
        # policies that are not associated with a specific principal or resource.
        @[JSON::Field(key: "unspecified")]
        getter unspecified : Bool?

        def initialize(
          @identifier : Types::EntityIdentifier? = nil,
          @unspecified : Bool? = nil
        )
        end
      end

      # Contains a description of an evaluation error. This data type is a response parameter of the
      # IsAuthorized , BatchIsAuthorized , and IsAuthorizedWithToken operations.
      struct EvaluationErrorItem
        include JSON::Serializable

        # The error description.
        @[JSON::Field(key: "errorDescription")]
        getter error_description : String

        def initialize(
          @error_description : String
        )
        end
      end

      struct GetIdentitySourceInput
        include JSON::Serializable

        # Specifies the ID of the identity source you want information about.
        @[JSON::Field(key: "identitySourceId")]
        getter identity_source_id : String

        # Specifies the ID of the policy store that contains the identity source you want information about.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @identity_source_id : String,
          @policy_store_id : String
        )
        end
      end

      struct GetIdentitySourceOutput
        include JSON::Serializable

        # The date and time that the identity source was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The ID of the identity source.
        @[JSON::Field(key: "identitySourceId")]
        getter identity_source_id : String

        # The date and time that the identity source was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The ID of the policy store that contains the identity source.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The data type of principals generated for identities authenticated by this identity source.
        @[JSON::Field(key: "principalEntityType")]
        getter principal_entity_type : String

        # Contains configuration information about an identity source.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ConfigurationDetail?

        # A structure that describes the configuration of the identity source.
        @[JSON::Field(key: "details")]
        getter details : Types::IdentitySourceDetails?

        def initialize(
          @created_date : Time,
          @identity_source_id : String,
          @last_updated_date : Time,
          @policy_store_id : String,
          @principal_entity_type : String,
          @configuration : Types::ConfigurationDetail? = nil,
          @details : Types::IdentitySourceDetails? = nil
        )
        end
      end

      struct GetPolicyInput
        include JSON::Serializable

        # Specifies the ID of the policy you want information about.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # Specifies the ID of the policy store that contains the policy that you want information about.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @policy_id : String,
          @policy_store_id : String
        )
        end
      end

      struct GetPolicyOutput
        include JSON::Serializable

        # The date and time that the policy was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The definition of the requested policy.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PolicyDefinitionDetail

        # The date and time that the policy was last updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The unique ID of the policy that you want information about.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The ID of the policy store that contains the policy that you want information about.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The type of the policy.
        @[JSON::Field(key: "policyType")]
        getter policy_type : String

        # The action that a policy permits or forbids. For example, {"actions": [{"actionId": "ViewPhoto",
        # "actionType": "PhotoFlash::Action"}, {"entityID": "SharePhoto", "entityType":
        # "PhotoFlash::Action"}]} .
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::ActionIdentifier)?

        # The effect of the decision that a policy returns to an authorization request. For example, "effect":
        # "Permit" .
        @[JSON::Field(key: "effect")]
        getter effect : String?

        # The principal specified in the policy's scope. This element isn't included in the response when
        # Principal isn't present in the policy content.
        @[JSON::Field(key: "principal")]
        getter principal : Types::EntityIdentifier?

        # The resource specified in the policy's scope. This element isn't included in the response when
        # Resource isn't present in the policy content.
        @[JSON::Field(key: "resource")]
        getter resource : Types::EntityIdentifier?

        def initialize(
          @created_date : Time,
          @definition : Types::PolicyDefinitionDetail,
          @last_updated_date : Time,
          @policy_id : String,
          @policy_store_id : String,
          @policy_type : String,
          @actions : Array(Types::ActionIdentifier)? = nil,
          @effect : String? = nil,
          @principal : Types::EntityIdentifier? = nil,
          @resource : Types::EntityIdentifier? = nil
        )
        end
      end

      struct GetPolicyStoreInput
        include JSON::Serializable

        # Specifies the ID of the policy store that you want information about.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies whether to return the tags that are attached to the policy store. If this parameter is
        # included in the API call, the tags are returned, otherwise they are not returned. If this parameter
        # is included in the API call but there are no tags attached to the policy store, the tags response
        # parameter is omitted from the response.
        @[JSON::Field(key: "tags")]
        getter tags : Bool?

        def initialize(
          @policy_store_id : String,
          @tags : Bool? = nil
        )
        end
      end

      struct GetPolicyStoreOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the policy store.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the policy store was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The date and time that the policy store was last updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The ID of the policy store;
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The current validation settings for the policy store.
        @[JSON::Field(key: "validationSettings")]
        getter validation_settings : Types::ValidationSettings

        # The version of the Cedar language used with policies, policy templates, and schemas in this policy
        # store. For more information, see Amazon Verified Permissions upgrade to Cedar v4 FAQ .
        @[JSON::Field(key: "cedarVersion")]
        getter cedar_version : String?

        # Specifies whether the policy store can be deleted. If enabled, the policy store can't be deleted.
        # The default state is DISABLED .
        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : String?

        # Descriptive text that you can provide to help with identification of the current policy store.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The list of tags associated with the policy store.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_date : Time,
          @last_updated_date : Time,
          @policy_store_id : String,
          @validation_settings : Types::ValidationSettings,
          @cedar_version : String? = nil,
          @deletion_protection : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetPolicyTemplateInput
        include JSON::Serializable

        # Specifies the ID of the policy store that contains the policy template that you want information
        # about.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies the ID of the policy template that you want information about.
        @[JSON::Field(key: "policyTemplateId")]
        getter policy_template_id : String

        def initialize(
          @policy_store_id : String,
          @policy_template_id : String
        )
        end
      end

      struct GetPolicyTemplateOutput
        include JSON::Serializable

        # The date and time that the policy template was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The date and time that the policy template was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The ID of the policy store that contains the policy template.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The ID of the policy template.
        @[JSON::Field(key: "policyTemplateId")]
        getter policy_template_id : String

        # The content of the body of the policy template written in the Cedar policy language.
        @[JSON::Field(key: "statement")]
        getter statement : String

        # The description of the policy template.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_date : Time,
          @last_updated_date : Time,
          @policy_store_id : String,
          @policy_template_id : String,
          @statement : String,
          @description : String? = nil
        )
        end
      end

      struct GetSchemaInput
        include JSON::Serializable

        # Specifies the ID of the policy store that contains the schema.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @policy_store_id : String
        )
        end
      end

      struct GetSchemaOutput
        include JSON::Serializable

        # The date and time that the schema was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The date and time that the schema was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The ID of the policy store that contains the schema.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The body of the schema, written in Cedar schema JSON.
        @[JSON::Field(key: "schema")]
        getter schema : String

        # The namespaces of the entities referenced by this schema.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)?

        def initialize(
          @created_date : Time,
          @last_updated_date : Time,
          @policy_store_id : String,
          @schema : String,
          @namespaces : Array(String)? = nil
        )
        end
      end

      # A structure that contains configuration of the identity source. This data type was a response
      # parameter for the GetIdentitySource operation. Replaced by ConfigurationDetail .
      struct IdentitySourceDetails
        include JSON::Serializable

        # The application client IDs associated with the specified Amazon Cognito user pool that are enabled
        # for this identity source.
        @[JSON::Field(key: "clientIds")]
        getter client_ids : Array(String)?

        # The well-known URL that points to this user pool's OIDC discovery endpoint. This is a URL string in
        # the following format. This URL replaces the placeholders for both the Amazon Web Services Region and
        # the user pool identifier with those appropriate for this user pool. https://cognito-idp.
        # &lt;region&gt; .amazonaws.com/ &lt;user-pool-id&gt; /.well-known/openid-configuration
        @[JSON::Field(key: "discoveryUrl")]
        getter discovery_url : String?

        # A string that identifies the type of OIDC service represented by this identity source. At this time,
        # the only valid value is cognito .
        @[JSON::Field(key: "openIdIssuer")]
        getter open_id_issuer : String?

        # The Amazon Resource Name (ARN) of the Amazon Cognito user pool whose identities are accessible to
        # this Verified Permissions policy store.
        @[JSON::Field(key: "userPoolArn")]
        getter user_pool_arn : String?

        def initialize(
          @client_ids : Array(String)? = nil,
          @discovery_url : String? = nil,
          @open_id_issuer : String? = nil,
          @user_pool_arn : String? = nil
        )
        end
      end

      # A structure that defines characteristics of an identity source that you can use to filter. This data
      # type is a request parameter for the ListIdentityStores operation.
      struct IdentitySourceFilter
        include JSON::Serializable

        # The Cedar entity type of the principals returned by the identity provider (IdP) associated with this
        # identity source.
        @[JSON::Field(key: "principalEntityType")]
        getter principal_entity_type : String?

        def initialize(
          @principal_entity_type : String? = nil
        )
        end
      end

      # A structure that defines an identity source. This data type is a response parameter to the
      # ListIdentitySources operation.
      struct IdentitySourceItem
        include JSON::Serializable

        # The date and time the identity source was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The unique identifier of the identity source.
        @[JSON::Field(key: "identitySourceId")]
        getter identity_source_id : String

        # The date and time the identity source was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The identifier of the policy store that contains the identity source.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The Cedar entity type of the principals returned from the IdP associated with this identity source.
        @[JSON::Field(key: "principalEntityType")]
        getter principal_entity_type : String

        # Contains configuration information about an identity source.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ConfigurationItem?

        # A structure that contains the details of the associated identity provider (IdP).
        @[JSON::Field(key: "details")]
        getter details : Types::IdentitySourceItemDetails?

        def initialize(
          @created_date : Time,
          @identity_source_id : String,
          @last_updated_date : Time,
          @policy_store_id : String,
          @principal_entity_type : String,
          @configuration : Types::ConfigurationItem? = nil,
          @details : Types::IdentitySourceItemDetails? = nil
        )
        end
      end

      # A structure that contains configuration of the identity source. This data type was a response
      # parameter for the ListIdentitySources operation. Replaced by ConfigurationItem .
      struct IdentitySourceItemDetails
        include JSON::Serializable

        # The application client IDs associated with the specified Amazon Cognito user pool that are enabled
        # for this identity source.
        @[JSON::Field(key: "clientIds")]
        getter client_ids : Array(String)?

        # The well-known URL that points to this user pool's OIDC discovery endpoint. This is a URL string in
        # the following format. This URL replaces the placeholders for both the Amazon Web Services Region and
        # the user pool identifier with those appropriate for this user pool. https://cognito-idp.
        # &lt;region&gt; .amazonaws.com/ &lt;user-pool-id&gt; /.well-known/openid-configuration
        @[JSON::Field(key: "discoveryUrl")]
        getter discovery_url : String?

        # A string that identifies the type of OIDC service represented by this identity source. At this time,
        # the only valid value is cognito .
        @[JSON::Field(key: "openIdIssuer")]
        getter open_id_issuer : String?

        # The Amazon Cognito user pool whose identities are accessible to this Verified Permissions policy
        # store.
        @[JSON::Field(key: "userPoolArn")]
        getter user_pool_arn : String?

        def initialize(
          @client_ids : Array(String)? = nil,
          @discovery_url : String? = nil,
          @open_id_issuer : String? = nil,
          @user_pool_arn : String? = nil
        )
        end
      end

      # The request failed because of an internal error. Try your request again later
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The policy store can't be deleted because deletion protection is enabled. To delete this policy
      # store, disable deletion protection.
      struct InvalidStateException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct IsAuthorizedInput
        include JSON::Serializable

        # Specifies the ID of the policy store. Policies in this policy store will be used to make an
        # authorization decision for the input.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies the requested action to be authorized. For example, is the principal authorized to perform
        # this action on the resource?
        @[JSON::Field(key: "action")]
        getter action : Types::ActionIdentifier?

        # Specifies additional context that can be used to make more granular authorization decisions.
        @[JSON::Field(key: "context")]
        getter context : Types::ContextDefinition?

        # (Optional) Specifies the list of resources and principals and their associated attributes that
        # Verified Permissions can examine when evaluating the policies. These additional entities and their
        # attributes can be referenced and checked by conditional elements in the policies in the specified
        # policy store. You can include only principal and resource entities in this parameter; you can't
        # include actions. You must specify actions in the schema.
        @[JSON::Field(key: "entities")]
        getter entities : Types::EntitiesDefinition?

        # Specifies the principal for which the authorization decision is to be made.
        @[JSON::Field(key: "principal")]
        getter principal : Types::EntityIdentifier?

        # Specifies the resource for which the authorization decision is to be made.
        @[JSON::Field(key: "resource")]
        getter resource : Types::EntityIdentifier?

        def initialize(
          @policy_store_id : String,
          @action : Types::ActionIdentifier? = nil,
          @context : Types::ContextDefinition? = nil,
          @entities : Types::EntitiesDefinition? = nil,
          @principal : Types::EntityIdentifier? = nil,
          @resource : Types::EntityIdentifier? = nil
        )
        end
      end

      struct IsAuthorizedOutput
        include JSON::Serializable

        # An authorization decision that indicates if the authorization request should be allowed or denied.
        @[JSON::Field(key: "decision")]
        getter decision : String

        # The list of determining policies used to make the authorization decision. For example, if there are
        # two matching policies, where one is a forbid and the other is a permit, then the forbid policy will
        # be the determining policy. In the case of multiple matching permit policies then there would be
        # multiple determining policies. In the case that no policies match, and hence the response is DENY,
        # there would be no determining policies.
        @[JSON::Field(key: "determiningPolicies")]
        getter determining_policies : Array(Types::DeterminingPolicyItem)

        # Errors that occurred while making an authorization decision, for example, a policy references an
        # Entity or entity Attribute that does not exist in the slice.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::EvaluationErrorItem)

        def initialize(
          @decision : String,
          @determining_policies : Array(Types::DeterminingPolicyItem),
          @errors : Array(Types::EvaluationErrorItem)
        )
        end
      end

      struct IsAuthorizedWithTokenInput
        include JSON::Serializable

        # Specifies the ID of the policy store. Policies in this policy store will be used to make an
        # authorization decision for the input.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies an access token for the principal to be authorized. This token is provided to you by the
        # identity provider (IdP) associated with the specified identity source. You must specify either an
        # accessToken , an identityToken , or both. Must be an access token. Verified Permissions returns an
        # error if the token_use claim in the submitted token isn't access .
        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # Specifies the requested action to be authorized. Is the specified principal authorized to perform
        # this action on the specified resource.
        @[JSON::Field(key: "action")]
        getter action : Types::ActionIdentifier?

        # Specifies additional context that can be used to make more granular authorization decisions.
        @[JSON::Field(key: "context")]
        getter context : Types::ContextDefinition?

        # (Optional) Specifies the list of resources and their associated attributes that Verified Permissions
        # can examine when evaluating the policies. These additional entities and their attributes can be
        # referenced and checked by conditional elements in the policies in the specified policy store. You
        # can't include principals in this parameter, only resource and action entities. This parameter can't
        # include any entities of a type that matches the user or group entity types that you defined in your
        # identity source. The IsAuthorizedWithToken operation takes principal attributes from only the
        # identityToken or accessToken passed to the operation. For action entities, you can include only
        # their Identifier and EntityType .
        @[JSON::Field(key: "entities")]
        getter entities : Types::EntitiesDefinition?

        # Specifies an identity token for the principal to be authorized. This token is provided to you by the
        # identity provider (IdP) associated with the specified identity source. You must specify either an
        # accessToken , an identityToken , or both. Must be an ID token. Verified Permissions returns an error
        # if the token_use claim in the submitted token isn't id .
        @[JSON::Field(key: "identityToken")]
        getter identity_token : String?

        # Specifies the resource for which the authorization decision is made. For example, is the principal
        # allowed to perform the action on the resource?
        @[JSON::Field(key: "resource")]
        getter resource : Types::EntityIdentifier?

        def initialize(
          @policy_store_id : String,
          @access_token : String? = nil,
          @action : Types::ActionIdentifier? = nil,
          @context : Types::ContextDefinition? = nil,
          @entities : Types::EntitiesDefinition? = nil,
          @identity_token : String? = nil,
          @resource : Types::EntityIdentifier? = nil
        )
        end
      end

      struct IsAuthorizedWithTokenOutput
        include JSON::Serializable

        # An authorization decision that indicates if the authorization request should be allowed or denied.
        @[JSON::Field(key: "decision")]
        getter decision : String

        # The list of determining policies used to make the authorization decision. For example, if there are
        # multiple matching policies, where at least one is a forbid policy, then because forbid always
        # overrides permit the forbid policies are the determining policies. If all matching policies are
        # permit policies, then those policies are the determining policies. When no policies match and the
        # response is the default DENY, there are no determining policies.
        @[JSON::Field(key: "determiningPolicies")]
        getter determining_policies : Array(Types::DeterminingPolicyItem)

        # Errors that occurred while making an authorization decision. For example, a policy references an
        # entity or entity attribute that does not exist in the slice.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::EvaluationErrorItem)

        # The identifier of the principal in the ID or access token.
        @[JSON::Field(key: "principal")]
        getter principal : Types::EntityIdentifier?

        def initialize(
          @decision : String,
          @determining_policies : Array(Types::DeterminingPolicyItem),
          @errors : Array(Types::EvaluationErrorItem),
          @principal : Types::EntityIdentifier? = nil
        )
        end
      end

      struct ListIdentitySourcesInput
        include JSON::Serializable

        # Specifies the ID of the policy store that contains the identity sources that you want to list.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies characteristics of an identity source that you can use to limit the output to matching
        # identity sources.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::IdentitySourceFilter)?

        # Specifies the total number of results that you want included in each response. If additional items
        # exist beyond the number you specify, the NextToken response element is returned with a value (not
        # null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next set of results. Note that the service might return fewer results than the
        # maximum even when there are more results available. You should check NextToken after every operation
        # to ensure that you receive all of the results. If you do not specify this parameter, the operation
        # defaults to 10 identity sources per response. You can specify a maximum of 50 identity sources per
        # response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policy_store_id : String,
          @filters : Array(Types::IdentitySourceFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIdentitySourcesOutput
        include JSON::Serializable

        # The list of identity sources stored in the specified policy store.
        @[JSON::Field(key: "identitySources")]
        getter identity_sources : Array(Types::IdentitySourceItem)

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @identity_sources : Array(Types::IdentitySourceItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListPoliciesInput
        include JSON::Serializable

        # Specifies the ID of the policy store you want to list policies from.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies a filter that limits the response to only policies that match the specified criteria. For
        # example, you list only the policies that reference a specified principal.
        @[JSON::Field(key: "filter")]
        getter filter : Types::PolicyFilter?

        # Specifies the total number of results that you want included in each response. If additional items
        # exist beyond the number you specify, the NextToken response element is returned with a value (not
        # null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next set of results. Note that the service might return fewer results than the
        # maximum even when there are more results available. You should check NextToken after every operation
        # to ensure that you receive all of the results. If you do not specify this parameter, the operation
        # defaults to 10 policies per response. You can specify a maximum of 50 policies per response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policy_store_id : String,
          @filter : Types::PolicyFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPoliciesOutput
        include JSON::Serializable

        # Lists all policies that are available in the specified policy store.
        @[JSON::Field(key: "policies")]
        getter policies : Array(Types::PolicyItem)

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policies : Array(Types::PolicyItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListPolicyStoresInput
        include JSON::Serializable

        # Specifies the total number of results that you want included in each response. If additional items
        # exist beyond the number you specify, the NextToken response element is returned with a value (not
        # null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next set of results. Note that the service might return fewer results than the
        # maximum even when there are more results available. You should check NextToken after every operation
        # to ensure that you receive all of the results. If you do not specify this parameter, the operation
        # defaults to 10 policy stores per response. You can specify a maximum of 50 policy stores per
        # response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPolicyStoresOutput
        include JSON::Serializable

        # The list of policy stores in the account.
        @[JSON::Field(key: "policyStores")]
        getter policy_stores : Array(Types::PolicyStoreItem)

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policy_stores : Array(Types::PolicyStoreItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListPolicyTemplatesInput
        include JSON::Serializable

        # Specifies the ID of the policy store that contains the policy templates you want to list.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies the total number of results that you want included in each response. If additional items
        # exist beyond the number you specify, the NextToken response element is returned with a value (not
        # null). Include the specified value as the NextToken request parameter in the next call to the
        # operation to get the next set of results. Note that the service might return fewer results than the
        # maximum even when there are more results available. You should check NextToken after every operation
        # to ensure that you receive all of the results. If you do not specify this parameter, the operation
        # defaults to 10 policy templates per response. You can specify a maximum of 50 policy templates per
        # response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a NextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's NextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policy_store_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPolicyTemplatesOutput
        include JSON::Serializable

        # The list of the policy templates in the specified policy store.
        @[JSON::Field(key: "policyTemplates")]
        getter policy_templates : Array(Types::PolicyTemplateItem)

        # If present, this value indicates that more output is available than is included in the current
        # response. Use this value in the NextToken request parameter in a subsequent call to the operation to
        # get the next part of the output. You should repeat this until the NextToken response element comes
        # back as null . This indicates that this is the last page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policy_templates : Array(Types::PolicyTemplateItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceInput
        include JSON::Serializable

        # The ARN of the resource for which you want to view tags.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The list of tags associated with the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration of an OpenID Connect (OIDC) identity source for handling access token claims.
      # Contains the claim that you want to identify as the principal in an authorization request, and the
      # values of the aud claim, or audiences, that you want to accept. This data type is part of a
      # OpenIdConnectTokenSelection structure, which is a parameter of CreateIdentitySource .
      struct OpenIdConnectAccessTokenConfiguration
        include JSON::Serializable

        # The access token aud claim values that you want to accept in your policy store. For example,
        # https://myapp.example.com, https://myapp2.example.com .
        @[JSON::Field(key: "audiences")]
        getter audiences : Array(String)?

        # The claim that determines the principal in OIDC access tokens. For example, sub .
        @[JSON::Field(key: "principalIdClaim")]
        getter principal_id_claim : String?

        def initialize(
          @audiences : Array(String)? = nil,
          @principal_id_claim : String? = nil
        )
        end
      end

      # The configuration of an OpenID Connect (OIDC) identity source for handling access token claims.
      # Contains the claim that you want to identify as the principal in an authorization request, and the
      # values of the aud claim, or audiences, that you want to accept. This data type is part of a
      # OpenIdConnectTokenSelectionDetail structure, which is a parameter of GetIdentitySource .
      struct OpenIdConnectAccessTokenConfigurationDetail
        include JSON::Serializable

        # The access token aud claim values that you want to accept in your policy store. For example,
        # https://myapp.example.com, https://myapp2.example.com .
        @[JSON::Field(key: "audiences")]
        getter audiences : Array(String)?

        # The claim that determines the principal in OIDC access tokens. For example, sub .
        @[JSON::Field(key: "principalIdClaim")]
        getter principal_id_claim : String?

        def initialize(
          @audiences : Array(String)? = nil,
          @principal_id_claim : String? = nil
        )
        end
      end

      # The configuration of an OpenID Connect (OIDC) identity source for handling access token claims.
      # Contains the claim that you want to identify as the principal in an authorization request, and the
      # values of the aud claim, or audiences, that you want to accept. This data type is part of a
      # OpenIdConnectTokenSelectionItem structure, which is a parameter of ListIdentitySources .
      struct OpenIdConnectAccessTokenConfigurationItem
        include JSON::Serializable

        # The access token aud claim values that you want to accept in your policy store. For example,
        # https://myapp.example.com, https://myapp2.example.com .
        @[JSON::Field(key: "audiences")]
        getter audiences : Array(String)?

        # The claim that determines the principal in OIDC access tokens. For example, sub .
        @[JSON::Field(key: "principalIdClaim")]
        getter principal_id_claim : String?

        def initialize(
          @audiences : Array(String)? = nil,
          @principal_id_claim : String? = nil
        )
        end
      end

      # Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity source,
      # that Verified Permissions can use to generate entities from authenticated identities. It specifies
      # the issuer URL, token type that you want to use, and policy store entity details. This data type is
      # part of a Configuration structure, which is a parameter to CreateIdentitySource .
      struct OpenIdConnectConfiguration
        include JSON::Serializable

        # The issuer URL of an OIDC identity provider. This URL must have an OIDC discovery endpoint at the
        # path .well-known/openid-configuration .
        @[JSON::Field(key: "issuer")]
        getter issuer : String

        # The token type that you want to process from your OIDC identity provider. Your policy store can
        # process either identity (ID) or access tokens from a given OIDC identity source.
        @[JSON::Field(key: "tokenSelection")]
        getter token_selection : Types::OpenIdConnectTokenSelection

        # A descriptive string that you want to prefix to user entities from your OIDC identity provider. For
        # example, if you set an entityIdPrefix of MyOIDCProvider , you can reference principals in your
        # policies in the format MyCorp::User::MyOIDCProvider|Carlos .
        @[JSON::Field(key: "entityIdPrefix")]
        getter entity_id_prefix : String?

        # The claim in OIDC identity provider tokens that indicates a user's group membership, and the entity
        # type that you want to map it to. For example, this object can map the contents of a groups claim to
        # MyCorp::UserGroup .
        @[JSON::Field(key: "groupConfiguration")]
        getter group_configuration : Types::OpenIdConnectGroupConfiguration?

        def initialize(
          @issuer : String,
          @token_selection : Types::OpenIdConnectTokenSelection,
          @entity_id_prefix : String? = nil,
          @group_configuration : Types::OpenIdConnectGroupConfiguration? = nil
        )
        end
      end

      # Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity source,
      # that Verified Permissions can use to generate entities from authenticated identities. It specifies
      # the issuer URL, token type that you want to use, and policy store entity details. This data type is
      # part of a ConfigurationDetail structure, which is a parameter to GetIdentitySource .
      struct OpenIdConnectConfigurationDetail
        include JSON::Serializable

        # The issuer URL of an OIDC identity provider. This URL must have an OIDC discovery endpoint at the
        # path .well-known/openid-configuration .
        @[JSON::Field(key: "issuer")]
        getter issuer : String

        # The token type that you want to process from your OIDC identity provider. Your policy store can
        # process either identity (ID) or access tokens from a given OIDC identity source.
        @[JSON::Field(key: "tokenSelection")]
        getter token_selection : Types::OpenIdConnectTokenSelectionDetail

        # A descriptive string that you want to prefix to user entities from your OIDC identity provider. For
        # example, if you set an entityIdPrefix of MyOIDCProvider , you can reference principals in your
        # policies in the format MyCorp::User::MyOIDCProvider|Carlos .
        @[JSON::Field(key: "entityIdPrefix")]
        getter entity_id_prefix : String?

        # The claim in OIDC identity provider tokens that indicates a user's group membership, and the entity
        # type that you want to map it to. For example, this object can map the contents of a groups claim to
        # MyCorp::UserGroup .
        @[JSON::Field(key: "groupConfiguration")]
        getter group_configuration : Types::OpenIdConnectGroupConfigurationDetail?

        def initialize(
          @issuer : String,
          @token_selection : Types::OpenIdConnectTokenSelectionDetail,
          @entity_id_prefix : String? = nil,
          @group_configuration : Types::OpenIdConnectGroupConfigurationDetail? = nil
        )
        end
      end

      # Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity source,
      # that Verified Permissions can use to generate entities from authenticated identities. It specifies
      # the issuer URL, token type that you want to use, and policy store entity details. This data type is
      # part of a ConfigurationItem structure, which is a parameter to ListIdentitySources .
      struct OpenIdConnectConfigurationItem
        include JSON::Serializable

        # The issuer URL of an OIDC identity provider. This URL must have an OIDC discovery endpoint at the
        # path .well-known/openid-configuration .
        @[JSON::Field(key: "issuer")]
        getter issuer : String

        # The token type that you want to process from your OIDC identity provider. Your policy store can
        # process either identity (ID) or access tokens from a given OIDC identity source.
        @[JSON::Field(key: "tokenSelection")]
        getter token_selection : Types::OpenIdConnectTokenSelectionItem

        # A descriptive string that you want to prefix to user entities from your OIDC identity provider. For
        # example, if you set an entityIdPrefix of MyOIDCProvider , you can reference principals in your
        # policies in the format MyCorp::User::MyOIDCProvider|Carlos .
        @[JSON::Field(key: "entityIdPrefix")]
        getter entity_id_prefix : String?

        # The claim in OIDC identity provider tokens that indicates a user's group membership, and the entity
        # type that you want to map it to. For example, this object can map the contents of a groups claim to
        # MyCorp::UserGroup .
        @[JSON::Field(key: "groupConfiguration")]
        getter group_configuration : Types::OpenIdConnectGroupConfigurationItem?

        def initialize(
          @issuer : String,
          @token_selection : Types::OpenIdConnectTokenSelectionItem,
          @entity_id_prefix : String? = nil,
          @group_configuration : Types::OpenIdConnectGroupConfigurationItem? = nil
        )
        end
      end

      # The claim in OIDC identity provider tokens that indicates a user's group membership, and the entity
      # type that you want to map it to. For example, this object can map the contents of a groups claim to
      # MyCorp::UserGroup . This data type is part of a OpenIdConnectConfiguration structure, which is a
      # parameter of CreateIdentitySource .
      struct OpenIdConnectGroupConfiguration
        include JSON::Serializable

        # The token claim that you want Verified Permissions to interpret as group membership. For example,
        # groups .
        @[JSON::Field(key: "groupClaim")]
        getter group_claim : String

        # The policy store entity type that you want to map your users' group claim to. For example,
        # MyCorp::UserGroup . A group entity type is an entity that can have a user entity type as a member.
        @[JSON::Field(key: "groupEntityType")]
        getter group_entity_type : String

        def initialize(
          @group_claim : String,
          @group_entity_type : String
        )
        end
      end

      # The claim in OIDC identity provider tokens that indicates a user's group membership, and the entity
      # type that you want to map it to. For example, this object can map the contents of a groups claim to
      # MyCorp::UserGroup . This data type is part of a OpenIdConnectConfigurationDetail structure, which is
      # a parameter of GetIdentitySource .
      struct OpenIdConnectGroupConfigurationDetail
        include JSON::Serializable

        # The token claim that you want Verified Permissions to interpret as group membership. For example,
        # groups .
        @[JSON::Field(key: "groupClaim")]
        getter group_claim : String

        # The policy store entity type that you want to map your users' group claim to. For example,
        # MyCorp::UserGroup . A group entity type is an entity that can have a user entity type as a member.
        @[JSON::Field(key: "groupEntityType")]
        getter group_entity_type : String

        def initialize(
          @group_claim : String,
          @group_entity_type : String
        )
        end
      end

      # The claim in OIDC identity provider tokens that indicates a user's group membership, and the entity
      # type that you want to map it to. For example, this object can map the contents of a groups claim to
      # MyCorp::UserGroup . This data type is part of a OpenIdConnectConfigurationItem structure, which is a
      # parameter of ListIdentitySourcea .
      struct OpenIdConnectGroupConfigurationItem
        include JSON::Serializable

        # The token claim that you want Verified Permissions to interpret as group membership. For example,
        # groups .
        @[JSON::Field(key: "groupClaim")]
        getter group_claim : String

        # The policy store entity type that you want to map your users' group claim to. For example,
        # MyCorp::UserGroup . A group entity type is an entity that can have a user entity type as a member.
        @[JSON::Field(key: "groupEntityType")]
        getter group_entity_type : String

        def initialize(
          @group_claim : String,
          @group_entity_type : String
        )
        end
      end

      # The configuration of an OpenID Connect (OIDC) identity source for handling identity (ID) token
      # claims. Contains the claim that you want to identify as the principal in an authorization request,
      # and the values of the aud claim, or audiences, that you want to accept. This data type is part of a
      # OpenIdConnectTokenSelection structure, which is a parameter of CreateIdentitySource .
      struct OpenIdConnectIdentityTokenConfiguration
        include JSON::Serializable

        # The ID token audience, or client ID, claim values that you want to accept in your policy store from
        # an OIDC identity provider. For example, 1example23456789, 2example10111213 .
        @[JSON::Field(key: "clientIds")]
        getter client_ids : Array(String)?

        # The claim that determines the principal in OIDC access tokens. For example, sub .
        @[JSON::Field(key: "principalIdClaim")]
        getter principal_id_claim : String?

        def initialize(
          @client_ids : Array(String)? = nil,
          @principal_id_claim : String? = nil
        )
        end
      end

      # The configuration of an OpenID Connect (OIDC) identity source for handling identity (ID) token
      # claims. Contains the claim that you want to identify as the principal in an authorization request,
      # and the values of the aud claim, or audiences, that you want to accept. This data type is part of a
      # OpenIdConnectTokenSelectionDetail structure, which is a parameter of GetIdentitySource .
      struct OpenIdConnectIdentityTokenConfigurationDetail
        include JSON::Serializable

        # The ID token audience, or client ID, claim values that you want to accept in your policy store from
        # an OIDC identity provider. For example, 1example23456789, 2example10111213 .
        @[JSON::Field(key: "clientIds")]
        getter client_ids : Array(String)?

        # The claim that determines the principal in OIDC access tokens. For example, sub .
        @[JSON::Field(key: "principalIdClaim")]
        getter principal_id_claim : String?

        def initialize(
          @client_ids : Array(String)? = nil,
          @principal_id_claim : String? = nil
        )
        end
      end

      # The configuration of an OpenID Connect (OIDC) identity source for handling identity (ID) token
      # claims. Contains the claim that you want to identify as the principal in an authorization request,
      # and the values of the aud claim, or audiences, that you want to accept. This data type is part of a
      # OpenIdConnectTokenSelectionItem structure, which is a parameter of ListIdentitySources .
      struct OpenIdConnectIdentityTokenConfigurationItem
        include JSON::Serializable

        # The ID token audience, or client ID, claim values that you want to accept in your policy store from
        # an OIDC identity provider. For example, 1example23456789, 2example10111213 .
        @[JSON::Field(key: "clientIds")]
        getter client_ids : Array(String)?

        # The claim that determines the principal in OIDC access tokens. For example, sub .
        @[JSON::Field(key: "principalIdClaim")]
        getter principal_id_claim : String?

        def initialize(
          @client_ids : Array(String)? = nil,
          @principal_id_claim : String? = nil
        )
        end
      end

      # The token type that you want to process from your OIDC identity provider. Your policy store can
      # process either identity (ID) or access tokens from a given OIDC identity source. This data type is
      # part of a OpenIdConnectConfiguration structure, which is a parameter of CreateIdentitySource .
      struct OpenIdConnectTokenSelection
        include JSON::Serializable

        # The OIDC configuration for processing access tokens. Contains allowed audience claims, for example
        # https://auth.example.com , and the claim that you want to map to the principal, for example sub .
        @[JSON::Field(key: "accessTokenOnly")]
        getter access_token_only : Types::OpenIdConnectAccessTokenConfiguration?

        # The OIDC configuration for processing identity (ID) tokens. Contains allowed client ID claims, for
        # example 1example23456789 , and the claim that you want to map to the principal, for example sub .
        @[JSON::Field(key: "identityTokenOnly")]
        getter identity_token_only : Types::OpenIdConnectIdentityTokenConfiguration?

        def initialize(
          @access_token_only : Types::OpenIdConnectAccessTokenConfiguration? = nil,
          @identity_token_only : Types::OpenIdConnectIdentityTokenConfiguration? = nil
        )
        end
      end

      # The token type that you want to process from your OIDC identity provider. Your policy store can
      # process either identity (ID) or access tokens from a given OIDC identity source. This data type is
      # part of a OpenIdConnectConfigurationDetail structure, which is a parameter of GetIdentitySource .
      struct OpenIdConnectTokenSelectionDetail
        include JSON::Serializable

        # The OIDC configuration for processing access tokens. Contains allowed audience claims, for example
        # https://auth.example.com , and the claim that you want to map to the principal, for example sub .
        @[JSON::Field(key: "accessTokenOnly")]
        getter access_token_only : Types::OpenIdConnectAccessTokenConfigurationDetail?

        # The OIDC configuration for processing identity (ID) tokens. Contains allowed client ID claims, for
        # example 1example23456789 , and the claim that you want to map to the principal, for example sub .
        @[JSON::Field(key: "identityTokenOnly")]
        getter identity_token_only : Types::OpenIdConnectIdentityTokenConfigurationDetail?

        def initialize(
          @access_token_only : Types::OpenIdConnectAccessTokenConfigurationDetail? = nil,
          @identity_token_only : Types::OpenIdConnectIdentityTokenConfigurationDetail? = nil
        )
        end
      end

      # The token type that you want to process from your OIDC identity provider. Your policy store can
      # process either identity (ID) or access tokens from a given OIDC identity source. This data type is
      # part of a OpenIdConnectConfigurationItem structure, which is a parameter of ListIdentitySources .
      struct OpenIdConnectTokenSelectionItem
        include JSON::Serializable

        # The OIDC configuration for processing access tokens. Contains allowed audience claims, for example
        # https://auth.example.com , and the claim that you want to map to the principal, for example sub .
        @[JSON::Field(key: "accessTokenOnly")]
        getter access_token_only : Types::OpenIdConnectAccessTokenConfigurationItem?

        # The OIDC configuration for processing identity (ID) tokens. Contains allowed client ID claims, for
        # example 1example23456789 , and the claim that you want to map to the principal, for example sub .
        @[JSON::Field(key: "identityTokenOnly")]
        getter identity_token_only : Types::OpenIdConnectIdentityTokenConfigurationItem?

        def initialize(
          @access_token_only : Types::OpenIdConnectAccessTokenConfigurationItem? = nil,
          @identity_token_only : Types::OpenIdConnectIdentityTokenConfigurationItem? = nil
        )
        end
      end

      # A structure that contains the details for a Cedar policy definition. It includes the policy type, a
      # description, and a policy body. This is a top level data type used to create a policy. This data
      # type is used as a request parameter for the CreatePolicy operation. This structure must always have
      # either an static or a templateLinked element.
      struct PolicyDefinition
        include JSON::Serializable

        # A structure that describes a static policy. An static policy doesn't use a template or allow
        # placeholders for entities.
        @[JSON::Field(key: "static")]
        getter static : Types::StaticPolicyDefinition?

        # A structure that describes a policy that was instantiated from a template. The template can specify
        # placeholders for principal and resource . When you use CreatePolicy to create a policy from a
        # template, you specify the exact principal and resource to use for the instantiated policy.
        @[JSON::Field(key: "templateLinked")]
        getter template_linked : Types::TemplateLinkedPolicyDefinition?

        def initialize(
          @static : Types::StaticPolicyDefinition? = nil,
          @template_linked : Types::TemplateLinkedPolicyDefinition? = nil
        )
        end
      end

      # A structure that describes a policy definition. It must always have either an static or a
      # templateLinked element. This data type is used as a response parameter for the GetPolicy operation.
      struct PolicyDefinitionDetail
        include JSON::Serializable

        # Information about a static policy that wasn't created with a policy template.
        @[JSON::Field(key: "static")]
        getter static : Types::StaticPolicyDefinitionDetail?

        # Information about a template-linked policy that was created by instantiating a policy template.
        @[JSON::Field(key: "templateLinked")]
        getter template_linked : Types::TemplateLinkedPolicyDefinitionDetail?

        def initialize(
          @static : Types::StaticPolicyDefinitionDetail? = nil,
          @template_linked : Types::TemplateLinkedPolicyDefinitionDetail? = nil
        )
        end
      end

      # A structure that describes a PolicyDefinintion . It will always have either an StaticPolicy or a
      # TemplateLinkedPolicy element. This data type is used as a response parameter for the CreatePolicy
      # and ListPolicies operations.
      struct PolicyDefinitionItem
        include JSON::Serializable

        # Information about a static policy that wasn't created with a policy template.
        @[JSON::Field(key: "static")]
        getter static : Types::StaticPolicyDefinitionItem?

        # Information about a template-linked policy that was created by instantiating a policy template.
        @[JSON::Field(key: "templateLinked")]
        getter template_linked : Types::TemplateLinkedPolicyDefinitionItem?

        def initialize(
          @static : Types::StaticPolicyDefinitionItem? = nil,
          @template_linked : Types::TemplateLinkedPolicyDefinitionItem? = nil
        )
        end
      end

      # Contains information about a filter to refine policies returned in a query. This data type is used
      # as a response parameter for the ListPolicies operation.
      struct PolicyFilter
        include JSON::Serializable

        # Filters the output to only template-linked policies that were instantiated from the specified policy
        # template.
        @[JSON::Field(key: "policyTemplateId")]
        getter policy_template_id : String?

        # Filters the output to only policies of the specified type.
        @[JSON::Field(key: "policyType")]
        getter policy_type : String?

        # Filters the output to only policies that reference the specified principal.
        @[JSON::Field(key: "principal")]
        getter principal : Types::EntityReference?

        # Filters the output to only policies that reference the specified resource.
        @[JSON::Field(key: "resource")]
        getter resource : Types::EntityReference?

        def initialize(
          @policy_template_id : String? = nil,
          @policy_type : String? = nil,
          @principal : Types::EntityReference? = nil,
          @resource : Types::EntityReference? = nil
        )
        end
      end

      # Contains information about a policy. This data type is used as a response parameter for the
      # ListPolicies operation.
      struct PolicyItem
        include JSON::Serializable

        # The date and time the policy was created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The policy definition of an item in the list of policies returned.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PolicyDefinitionItem

        # The date and time the policy was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The identifier of the policy you want information about.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The identifier of the policy store where the policy you want information about is stored.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The type of the policy. This is one of the following values: STATIC TEMPLATE_LINKED
        @[JSON::Field(key: "policyType")]
        getter policy_type : String

        # The action that a policy permits or forbids. For example, {"actions": [{"actionId": "ViewPhoto",
        # "actionType": "PhotoFlash::Action"}, {"entityID": "SharePhoto", "entityType":
        # "PhotoFlash::Action"}]} .
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::ActionIdentifier)?

        # The effect of the decision that a policy returns to an authorization request. For example, "effect":
        # "Permit" .
        @[JSON::Field(key: "effect")]
        getter effect : String?

        # The principal associated with the policy.
        @[JSON::Field(key: "principal")]
        getter principal : Types::EntityIdentifier?

        # The resource associated with the policy.
        @[JSON::Field(key: "resource")]
        getter resource : Types::EntityIdentifier?

        def initialize(
          @created_date : Time,
          @definition : Types::PolicyDefinitionItem,
          @last_updated_date : Time,
          @policy_id : String,
          @policy_store_id : String,
          @policy_type : String,
          @actions : Array(Types::ActionIdentifier)? = nil,
          @effect : String? = nil,
          @principal : Types::EntityIdentifier? = nil,
          @resource : Types::EntityIdentifier? = nil
        )
        end
      end

      # Contains information about a policy store. This data type is used as a response parameter for the
      # ListPolicyStores operation.
      struct PolicyStoreItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the policy store.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time the policy was created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The unique identifier of the policy store.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Descriptive text that you can provide to help with identification of the current policy store.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time the policy store was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time?

        def initialize(
          @arn : String,
          @created_date : Time,
          @policy_store_id : String,
          @description : String? = nil,
          @last_updated_date : Time? = nil
        )
        end
      end

      # Contains details about a policy template This data type is used as a response parameter for the
      # ListPolicyTemplates operation.
      struct PolicyTemplateItem
        include JSON::Serializable

        # The date and time that the policy template was created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The date and time that the policy template was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The unique identifier of the policy store that contains the template.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The unique identifier of the policy template.
        @[JSON::Field(key: "policyTemplateId")]
        getter policy_template_id : String

        # The description attached to the policy template.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_date : Time,
          @last_updated_date : Time,
          @policy_store_id : String,
          @policy_template_id : String,
          @description : String? = nil
        )
        end
      end

      struct PutSchemaInput
        include JSON::Serializable

        # Specifies the definition of the schema to be stored. The schema definition must be written in Cedar
        # schema JSON.
        @[JSON::Field(key: "definition")]
        getter definition : Types::SchemaDefinition

        # Specifies the ID of the policy store in which to place the schema.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @definition : Types::SchemaDefinition,
          @policy_store_id : String
        )
        end
      end

      struct PutSchemaOutput
        include JSON::Serializable

        # The date and time that the schema was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The date and time that the schema was last updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # Identifies the namespaces of the entities referenced by this schema.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)

        # The unique ID of the policy store that contains the schema.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @created_date : Time,
          @last_updated_date : Time,
          @namespaces : Array(String),
          @policy_store_id : String
        )
        end
      end

      # Contains information about a resource conflict.
      struct ResourceConflict
        include JSON::Serializable

        # The unique identifier of the resource involved in a conflict.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource involved in a conflict.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The request failed because it references a resource that doesn't exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The unique ID of the resource referenced in the failed request.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resource type of the resource referenced in the failed request.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Contains a list of principal types, resource types, and actions that can be specified in policies
      # stored in the same policy store. If the validation mode for the policy store is set to STRICT , then
      # policies that can't be validated by this schema are rejected by Verified Permissions and can't be
      # stored in the policy store.
      struct SchemaDefinition
        include JSON::Serializable

        # A JSON string representation of the schema supported by applications that use this policy store. To
        # delete the schema, run PutSchema with {} for this parameter. For more information, see Policy store
        # schema in the Amazon Verified Permissions User Guide .
        @[JSON::Field(key: "cedarJson")]
        getter cedar_json : String?

        def initialize(
          @cedar_json : String? = nil
        )
        end
      end

      # The request failed because it would cause a service quota to be exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The resource type of the resource referenced in the failed request.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The quota code recognized by the Amazon Web Services Service Quotas service.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The unique ID of the resource referenced in the failed request.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The code for the Amazon Web Services service that owns the quota.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @resource_type : String,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # Contains information about a static policy. This data type is used as a field that is part of the
      # PolicyDefinitionDetail type.
      struct StaticPolicyDefinition
        include JSON::Serializable

        # The policy content of the static policy, written in the Cedar policy language.
        @[JSON::Field(key: "statement")]
        getter statement : String

        # The description of the static policy.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @statement : String,
          @description : String? = nil
        )
        end
      end

      # A structure that contains details about a static policy. It includes the description and policy
      # body. This data type is used within a PolicyDefinition structure as part of a request parameter for
      # the CreatePolicy operation.
      struct StaticPolicyDefinitionDetail
        include JSON::Serializable

        # The content of the static policy written in the Cedar policy language.
        @[JSON::Field(key: "statement")]
        getter statement : String

        # A description of the static policy.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @statement : String,
          @description : String? = nil
        )
        end
      end

      # A structure that contains details about a static policy. It includes the description and policy
      # statement. This data type is used within a PolicyDefinition structure as part of a request parameter
      # for the CreatePolicy operation.
      struct StaticPolicyDefinitionItem
        include JSON::Serializable

        # A description of the static policy.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @description : String? = nil
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # The ARN of the resource that you're adding tags to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of key-value pairs to associate with the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about a policy created by instantiating a policy template.
      struct TemplateLinkedPolicyDefinition
        include JSON::Serializable

        # The unique identifier of the policy template used to create this policy.
        @[JSON::Field(key: "policyTemplateId")]
        getter policy_template_id : String

        # The principal associated with this template-linked policy. Verified Permissions substitutes this
        # principal for the ?principal placeholder in the policy template when it evaluates an authorization
        # request.
        @[JSON::Field(key: "principal")]
        getter principal : Types::EntityIdentifier?

        # The resource associated with this template-linked policy. Verified Permissions substitutes this
        # resource for the ?resource placeholder in the policy template when it evaluates an authorization
        # request.
        @[JSON::Field(key: "resource")]
        getter resource : Types::EntityIdentifier?

        def initialize(
          @policy_template_id : String,
          @principal : Types::EntityIdentifier? = nil,
          @resource : Types::EntityIdentifier? = nil
        )
        end
      end

      # Contains information about a policy that was created by instantiating a policy template.
      struct TemplateLinkedPolicyDefinitionDetail
        include JSON::Serializable

        # The unique identifier of the policy template used to create this policy.
        @[JSON::Field(key: "policyTemplateId")]
        getter policy_template_id : String

        # The principal associated with this template-linked policy. Verified Permissions substitutes this
        # principal for the ?principal placeholder in the policy template when it evaluates an authorization
        # request.
        @[JSON::Field(key: "principal")]
        getter principal : Types::EntityIdentifier?

        # The resource associated with this template-linked policy. Verified Permissions substitutes this
        # resource for the ?resource placeholder in the policy template when it evaluates an authorization
        # request.
        @[JSON::Field(key: "resource")]
        getter resource : Types::EntityIdentifier?

        def initialize(
          @policy_template_id : String,
          @principal : Types::EntityIdentifier? = nil,
          @resource : Types::EntityIdentifier? = nil
        )
        end
      end

      # Contains information about a policy created by instantiating a policy template.
      struct TemplateLinkedPolicyDefinitionItem
        include JSON::Serializable

        # The unique identifier of the policy template used to create this policy.
        @[JSON::Field(key: "policyTemplateId")]
        getter policy_template_id : String

        # The principal associated with this template-linked policy. Verified Permissions substitutes this
        # principal for the ?principal placeholder in the policy template when it evaluates an authorization
        # request.
        @[JSON::Field(key: "principal")]
        getter principal : Types::EntityIdentifier?

        # The resource associated with this template-linked policy. Verified Permissions substitutes this
        # resource for the ?resource placeholder in the policy template when it evaluates an authorization
        # request.
        @[JSON::Field(key: "resource")]
        getter resource : Types::EntityIdentifier?

        def initialize(
          @policy_template_id : String,
          @principal : Types::EntityIdentifier? = nil,
          @resource : Types::EntityIdentifier? = nil
        )
        end
      end

      # The request failed because it exceeded a throttling quota.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The quota code recognized by the Amazon Web Services Service Quotas service.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The code for the Amazon Web Services service that owns the quota.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # No more tags be added because the limit (50) has been reached. To add new tags, use UntagResource to
      # remove existing tags.
      struct TooManyTagsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # The ARN of the resource from which you are removing tags.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the resource.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The user group entities from an Amazon Cognito user pool identity source.
      struct UpdateCognitoGroupConfiguration
        include JSON::Serializable

        # The name of the schema entity type that's mapped to the user pool group. Defaults to
        # AWS::CognitoGroup .
        @[JSON::Field(key: "groupEntityType")]
        getter group_entity_type : String

        def initialize(
          @group_entity_type : String
        )
        end
      end

      # Contains configuration details of a Amazon Cognito user pool for use with an identity source.
      struct UpdateCognitoUserPoolConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Cognito user pool associated with this identity source.
        @[JSON::Field(key: "userPoolArn")]
        getter user_pool_arn : String

        # The client ID of an app client that is configured for the specified Amazon Cognito user pool.
        @[JSON::Field(key: "clientIds")]
        getter client_ids : Array(String)?

        # The configuration of the user groups from an Amazon Cognito user pool identity source.
        @[JSON::Field(key: "groupConfiguration")]
        getter group_configuration : Types::UpdateCognitoGroupConfiguration?

        def initialize(
          @user_pool_arn : String,
          @client_ids : Array(String)? = nil,
          @group_configuration : Types::UpdateCognitoGroupConfiguration? = nil
        )
        end
      end

      # Contains an update to replace the configuration in an existing identity source.
      struct UpdateConfiguration
        include JSON::Serializable

        # Contains configuration details of a Amazon Cognito user pool.
        @[JSON::Field(key: "cognitoUserPoolConfiguration")]
        getter cognito_user_pool_configuration : Types::UpdateCognitoUserPoolConfiguration?

        # Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity source,
        # that Verified Permissions can use to generate entities from authenticated identities. It specifies
        # the issuer URL, token type that you want to use, and policy store entity details.
        @[JSON::Field(key: "openIdConnectConfiguration")]
        getter open_id_connect_configuration : Types::UpdateOpenIdConnectConfiguration?

        def initialize(
          @cognito_user_pool_configuration : Types::UpdateCognitoUserPoolConfiguration? = nil,
          @open_id_connect_configuration : Types::UpdateOpenIdConnectConfiguration? = nil
        )
        end
      end

      struct UpdateIdentitySourceInput
        include JSON::Serializable

        # Specifies the ID of the identity source that you want to update.
        @[JSON::Field(key: "identitySourceId")]
        getter identity_source_id : String

        # Specifies the ID of the policy store that contains the identity source that you want to update.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies the details required to communicate with the identity provider (IdP) associated with this
        # identity source.
        @[JSON::Field(key: "updateConfiguration")]
        getter update_configuration : Types::UpdateConfiguration

        # Specifies the data type of principals generated for identities authenticated by the identity source.
        @[JSON::Field(key: "principalEntityType")]
        getter principal_entity_type : String?

        def initialize(
          @identity_source_id : String,
          @policy_store_id : String,
          @update_configuration : Types::UpdateConfiguration,
          @principal_entity_type : String? = nil
        )
        end
      end

      struct UpdateIdentitySourceOutput
        include JSON::Serializable

        # The date and time that the updated identity source was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The ID of the updated identity source.
        @[JSON::Field(key: "identitySourceId")]
        getter identity_source_id : String

        # The date and time that the identity source was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The ID of the policy store that contains the updated identity source.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @created_date : Time,
          @identity_source_id : String,
          @last_updated_date : Time,
          @policy_store_id : String
        )
        end
      end

      # The configuration of an OpenID Connect (OIDC) identity source for handling access token claims.
      # Contains the claim that you want to identify as the principal in an authorization request, and the
      # values of the aud claim, or audiences, that you want to accept. This data type is part of a
      # UpdateOpenIdConnectTokenSelection structure, which is a parameter to UpdateIdentitySource .
      struct UpdateOpenIdConnectAccessTokenConfiguration
        include JSON::Serializable

        # The access token aud claim values that you want to accept in your policy store. For example,
        # https://myapp.example.com, https://myapp2.example.com .
        @[JSON::Field(key: "audiences")]
        getter audiences : Array(String)?

        # The claim that determines the principal in OIDC access tokens. For example, sub .
        @[JSON::Field(key: "principalIdClaim")]
        getter principal_id_claim : String?

        def initialize(
          @audiences : Array(String)? = nil,
          @principal_id_claim : String? = nil
        )
        end
      end

      # Contains configuration details of an OpenID Connect (OIDC) identity provider, or identity source,
      # that Verified Permissions can use to generate entities from authenticated identities. It specifies
      # the issuer URL, token type that you want to use, and policy store entity details. This data type is
      # part of a UpdateConfiguration structure, which is a parameter to UpdateIdentitySource .
      struct UpdateOpenIdConnectConfiguration
        include JSON::Serializable

        # The issuer URL of an OIDC identity provider. This URL must have an OIDC discovery endpoint at the
        # path .well-known/openid-configuration .
        @[JSON::Field(key: "issuer")]
        getter issuer : String

        # The token type that you want to process from your OIDC identity provider. Your policy store can
        # process either identity (ID) or access tokens from a given OIDC identity source.
        @[JSON::Field(key: "tokenSelection")]
        getter token_selection : Types::UpdateOpenIdConnectTokenSelection

        # A descriptive string that you want to prefix to user entities from your OIDC identity provider. For
        # example, if you set an entityIdPrefix of MyOIDCProvider , you can reference principals in your
        # policies in the format MyCorp::User::MyOIDCProvider|Carlos .
        @[JSON::Field(key: "entityIdPrefix")]
        getter entity_id_prefix : String?

        # The claim in OIDC identity provider tokens that indicates a user's group membership, and the entity
        # type that you want to map it to. For example, this object can map the contents of a groups claim to
        # MyCorp::UserGroup .
        @[JSON::Field(key: "groupConfiguration")]
        getter group_configuration : Types::UpdateOpenIdConnectGroupConfiguration?

        def initialize(
          @issuer : String,
          @token_selection : Types::UpdateOpenIdConnectTokenSelection,
          @entity_id_prefix : String? = nil,
          @group_configuration : Types::UpdateOpenIdConnectGroupConfiguration? = nil
        )
        end
      end

      # The claim in OIDC identity provider tokens that indicates a user's group membership, and the entity
      # type that you want to map it to. For example, this object can map the contents of a groups claim to
      # MyCorp::UserGroup . This data type is part of a UpdateOpenIdConnectConfiguration structure, which is
      # a parameter to UpdateIdentitySource .
      struct UpdateOpenIdConnectGroupConfiguration
        include JSON::Serializable

        # The token claim that you want Verified Permissions to interpret as group membership. For example,
        # groups .
        @[JSON::Field(key: "groupClaim")]
        getter group_claim : String

        # The policy store entity type that you want to map your users' group claim to. For example,
        # MyCorp::UserGroup . A group entity type is an entity that can have a user entity type as a member.
        @[JSON::Field(key: "groupEntityType")]
        getter group_entity_type : String

        def initialize(
          @group_claim : String,
          @group_entity_type : String
        )
        end
      end

      # The configuration of an OpenID Connect (OIDC) identity source for handling identity (ID) token
      # claims. Contains the claim that you want to identify as the principal in an authorization request,
      # and the values of the aud claim, or audiences, that you want to accept. This data type is part of a
      # UpdateOpenIdConnectTokenSelection structure, which is a parameter to UpdateIdentitySource .
      struct UpdateOpenIdConnectIdentityTokenConfiguration
        include JSON::Serializable

        # The ID token audience, or client ID, claim values that you want to accept in your policy store from
        # an OIDC identity provider. For example, 1example23456789, 2example10111213 .
        @[JSON::Field(key: "clientIds")]
        getter client_ids : Array(String)?

        # The claim that determines the principal in OIDC access tokens. For example, sub .
        @[JSON::Field(key: "principalIdClaim")]
        getter principal_id_claim : String?

        def initialize(
          @client_ids : Array(String)? = nil,
          @principal_id_claim : String? = nil
        )
        end
      end

      # The token type that you want to process from your OIDC identity provider. Your policy store can
      # process either identity (ID) or access tokens from a given OIDC identity source. This data type is
      # part of a UpdateOpenIdConnectConfiguration structure, which is a parameter to UpdateIdentitySource .
      struct UpdateOpenIdConnectTokenSelection
        include JSON::Serializable

        # The OIDC configuration for processing access tokens. Contains allowed audience claims, for example
        # https://auth.example.com , and the claim that you want to map to the principal, for example sub .
        @[JSON::Field(key: "accessTokenOnly")]
        getter access_token_only : Types::UpdateOpenIdConnectAccessTokenConfiguration?

        # The OIDC configuration for processing identity (ID) tokens. Contains allowed client ID claims, for
        # example 1example23456789 , and the claim that you want to map to the principal, for example sub .
        @[JSON::Field(key: "identityTokenOnly")]
        getter identity_token_only : Types::UpdateOpenIdConnectIdentityTokenConfiguration?

        def initialize(
          @access_token_only : Types::UpdateOpenIdConnectAccessTokenConfiguration? = nil,
          @identity_token_only : Types::UpdateOpenIdConnectIdentityTokenConfiguration? = nil
        )
        end
      end

      # Contains information about updates to be applied to a policy. This data type is used as a request
      # parameter in the UpdatePolicy operation.
      struct UpdatePolicyDefinition
        include JSON::Serializable

        # Contains details about the updates to be applied to a static policy.
        @[JSON::Field(key: "static")]
        getter static : Types::UpdateStaticPolicyDefinition?

        def initialize(
          @static : Types::UpdateStaticPolicyDefinition? = nil
        )
        end
      end

      struct UpdatePolicyInput
        include JSON::Serializable

        # Specifies the updated policy content that you want to replace on the specified policy. The content
        # must be valid Cedar policy language text. You can change only the following elements from the policy
        # definition: The action referenced by the policy. Any conditional clauses, such as when or unless
        # clauses. You can't change the following elements: Changing from static to templateLinked . Changing
        # the effect of the policy from permit or forbid . The principal referenced by the policy. The
        # resource referenced by the policy.
        @[JSON::Field(key: "definition")]
        getter definition : Types::UpdatePolicyDefinition

        # Specifies the ID of the policy that you want to update. To find this value, you can use ListPolicies
        # .
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # Specifies the ID of the policy store that contains the policy that you want to update.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @definition : Types::UpdatePolicyDefinition,
          @policy_id : String,
          @policy_store_id : String
        )
        end
      end

      struct UpdatePolicyOutput
        include JSON::Serializable

        # The date and time that the policy was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The date and time that the policy was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The ID of the policy that was updated.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The ID of the policy store that contains the policy that was updated.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The type of the policy that was updated.
        @[JSON::Field(key: "policyType")]
        getter policy_type : String

        # The action that a policy permits or forbids. For example, {"actions": [{"actionId": "ViewPhoto",
        # "actionType": "PhotoFlash::Action"}, {"entityID": "SharePhoto", "entityType":
        # "PhotoFlash::Action"}]} .
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::ActionIdentifier)?

        # The effect of the decision that a policy returns to an authorization request. For example, "effect":
        # "Permit" .
        @[JSON::Field(key: "effect")]
        getter effect : String?

        # The principal specified in the policy's scope. This element isn't included in the response when
        # Principal isn't present in the policy content.
        @[JSON::Field(key: "principal")]
        getter principal : Types::EntityIdentifier?

        # The resource specified in the policy's scope. This element isn't included in the response when
        # Resource isn't present in the policy content.
        @[JSON::Field(key: "resource")]
        getter resource : Types::EntityIdentifier?

        def initialize(
          @created_date : Time,
          @last_updated_date : Time,
          @policy_id : String,
          @policy_store_id : String,
          @policy_type : String,
          @actions : Array(Types::ActionIdentifier)? = nil,
          @effect : String? = nil,
          @principal : Types::EntityIdentifier? = nil,
          @resource : Types::EntityIdentifier? = nil
        )
        end
      end

      struct UpdatePolicyStoreInput
        include JSON::Serializable

        # Specifies the ID of the policy store that you want to update
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # A structure that defines the validation settings that want to enable for the policy store.
        @[JSON::Field(key: "validationSettings")]
        getter validation_settings : Types::ValidationSettings

        # Specifies whether the policy store can be deleted. If enabled, the policy store can't be deleted.
        # When you call UpdatePolicyStore , this parameter is unchanged unless explicitly included in the
        # call.
        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : String?

        # Descriptive text that you can provide to help with identification of the current policy store.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @policy_store_id : String,
          @validation_settings : Types::ValidationSettings,
          @deletion_protection : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct UpdatePolicyStoreOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated policy store.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the policy store was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The date and time that the policy store was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The ID of the updated policy store.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        def initialize(
          @arn : String,
          @created_date : Time,
          @last_updated_date : Time,
          @policy_store_id : String
        )
        end
      end

      struct UpdatePolicyTemplateInput
        include JSON::Serializable

        # Specifies the ID of the policy store that contains the policy template that you want to update.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # Specifies the ID of the policy template that you want to update.
        @[JSON::Field(key: "policyTemplateId")]
        getter policy_template_id : String

        # Specifies new statement content written in Cedar policy language to replace the current body of the
        # policy template. You can change only the following elements of the policy body: The action
        # referenced by the policy template. Any conditional clauses, such as when or unless clauses. You
        # can't change the following elements: The effect ( permit or forbid ) of the policy template. The
        # principal referenced by the policy template. The resource referenced by the policy template.
        @[JSON::Field(key: "statement")]
        getter statement : String

        # Specifies a new description to apply to the policy template.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @policy_store_id : String,
          @policy_template_id : String,
          @statement : String,
          @description : String? = nil
        )
        end
      end

      struct UpdatePolicyTemplateOutput
        include JSON::Serializable

        # The date and time that the policy template was originally created.
        @[JSON::Field(key: "createdDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The date and time that the policy template was most recently updated.
        @[JSON::Field(key: "lastUpdatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time

        # The ID of the policy store that contains the updated policy template.
        @[JSON::Field(key: "policyStoreId")]
        getter policy_store_id : String

        # The ID of the updated policy template.
        @[JSON::Field(key: "policyTemplateId")]
        getter policy_template_id : String

        def initialize(
          @created_date : Time,
          @last_updated_date : Time,
          @policy_store_id : String,
          @policy_template_id : String
        )
        end
      end

      # Contains information about an update to a static policy.
      struct UpdateStaticPolicyDefinition
        include JSON::Serializable

        # Specifies the Cedar policy language text to be added to or replaced on the static policy. You can
        # change only the following elements from the original content: The action referenced by the policy.
        # Any conditional clauses, such as when or unless clauses. You can't change the following elements:
        # Changing from StaticPolicy to TemplateLinkedPolicy . The effect ( permit or forbid ) of the policy.
        # The principal referenced by the policy. The resource referenced by the policy.
        @[JSON::Field(key: "statement")]
        getter statement : String

        # Specifies the description to be added to or replaced on the static policy.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @statement : String,
          @description : String? = nil
        )
        end
      end

      # The request failed because one or more input parameters don't satisfy their constraint requirements.
      # The output is provided as a list of fields and a reason for each field that isn't valid. The
      # possible reasons include the following: UnrecognizedEntityType The policy includes an entity type
      # that isn't found in the schema. UnrecognizedActionId The policy includes an action id that isn't
      # found in the schema. InvalidActionApplication The policy includes an action that, according to the
      # schema, doesn't support the specified principal and resource. UnexpectedType The policy included an
      # operand that isn't a valid type for the specified operation. IncompatibleTypes The types of elements
      # included in a set , or the types of expressions used in an if...then...else clause aren't compatible
      # in this context. MissingAttribute The policy attempts to access a record or entity attribute that
      # isn't specified in the schema. Test for the existence of the attribute first before attempting to
      # access its value. For more information, see the has (presence of attribute test) operator in the
      # Cedar Policy Language Guide . UnsafeOptionalAttributeAccess The policy attempts to access a record
      # or entity attribute that is optional and isn't guaranteed to be present. Test for the existence of
      # the attribute first before attempting to access its value. For more information, see the has
      # (presence of attribute test) operator in the Cedar Policy Language Guide . ImpossiblePolicy Cedar
      # has determined that a policy condition always evaluates to false. If the policy is always false, it
      # can never apply to any query, and so it can never affect an authorization decision.
      # WrongNumberArguments The policy references an extension type with the wrong number of arguments.
      # FunctionArgumentValidationError Cedar couldn't parse the argument passed to an extension type. For
      # example, a string that is to be parsed as an IPv4 address can contain only digits and the period
      # character.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The list of fields that aren't valid.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Details about a field that failed policy validation.
      struct ValidationExceptionField
        include JSON::Serializable

        # Describes the policy validation error.
        @[JSON::Field(key: "message")]
        getter message : String

        # The path to the specific element that Verified Permissions found to be not valid.
        @[JSON::Field(key: "path")]
        getter path : String

        def initialize(
          @message : String,
          @path : String
        )
        end
      end

      # A structure that contains Cedar policy validation settings for the policy store. The validation mode
      # determines which validation failures that Cedar considers serious enough to block acceptance of a
      # new or edited static policy or policy template. This data type is used as a request parameter in the
      # CreatePolicyStore and UpdatePolicyStore operations.
      struct ValidationSettings
        include JSON::Serializable

        # The validation mode currently configured for this policy store. The valid values are: OFF – Neither
        # Verified Permissions nor Cedar perform any validation on policies. No validation errors are reported
        # by either service. STRICT – Requires a schema to be present in the policy store. Cedar performs
        # validation on all submitted new or updated static policies and policy templates. Any that fail
        # validation are rejected and Cedar doesn't store them in the policy store. If Mode=STRICT and the
        # policy store doesn't contain a schema, Verified Permissions rejects all static policies and policy
        # templates because there is no schema to validate against. To submit a static policy or policy
        # template without a schema, you must turn off validation.
        @[JSON::Field(key: "mode")]
        getter mode : String

        def initialize(
          @mode : String
        )
        end
      end
    end
  end
end
