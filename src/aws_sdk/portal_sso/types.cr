require "json"

module AwsSdk
  module SSO
    module Types

      # Provides information about your AWS account.
      struct AccountInfo
        include JSON::Serializable

        # The identifier of the AWS account that is assigned to the user.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The display name of the AWS account that is assigned to the user.
        @[JSON::Field(key: "accountName")]
        getter account_name : String?

        # The email address of the AWS account that is assigned to the user.
        @[JSON::Field(key: "emailAddress")]
        getter email_address : String?

        def initialize(
          @account_id : String? = nil,
          @account_name : String? = nil,
          @email_address : String? = nil
        )
        end
      end

      struct GetRoleCredentialsRequest
        include JSON::Serializable

        # The token issued by the CreateToken API call. For more information, see CreateToken in the IAM
        # Identity Center OIDC API Reference Guide .
        @[JSON::Field(key: "x-amz-sso_bearer_token")]
        getter access_token : String

        # The identifier for the AWS account that is assigned to the user.
        @[JSON::Field(key: "account_id")]
        getter account_id : String

        # The friendly name of the role that is assigned to the user.
        @[JSON::Field(key: "role_name")]
        getter role_name : String

        def initialize(
          @access_token : String,
          @account_id : String,
          @role_name : String
        )
        end
      end

      struct GetRoleCredentialsResponse
        include JSON::Serializable

        # The credentials for the role that is assigned to the user.
        @[JSON::Field(key: "roleCredentials")]
        getter role_credentials : Types::RoleCredentials?

        def initialize(
          @role_credentials : Types::RoleCredentials? = nil
        )
        end
      end

      # Indicates that a problem occurred with the input to the request. For example, a required parameter
      # might be missing or out of range.
      struct InvalidRequestException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListAccountRolesRequest
        include JSON::Serializable

        # The token issued by the CreateToken API call. For more information, see CreateToken in the IAM
        # Identity Center OIDC API Reference Guide .
        @[JSON::Field(key: "x-amz-sso_bearer_token")]
        getter access_token : String

        # The identifier for the AWS account that is assigned to the user.
        @[JSON::Field(key: "account_id")]
        getter account_id : String

        # The number of items that clients can request per page.
        @[JSON::Field(key: "max_result")]
        getter max_results : Int32?

        # The page token from the previous response output when you request subsequent pages.
        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @access_token : String,
          @account_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAccountRolesResponse
        include JSON::Serializable

        # The page token client that is used to retrieve the list of accounts.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A paginated response with the list of roles and the next token if more results are available.
        @[JSON::Field(key: "roleList")]
        getter role_list : Array(Types::RoleInfo)?

        def initialize(
          @next_token : String? = nil,
          @role_list : Array(Types::RoleInfo)? = nil
        )
        end
      end

      struct ListAccountsRequest
        include JSON::Serializable

        # The token issued by the CreateToken API call. For more information, see CreateToken in the IAM
        # Identity Center OIDC API Reference Guide .
        @[JSON::Field(key: "x-amz-sso_bearer_token")]
        getter access_token : String

        # This is the number of items clients can request per page.
        @[JSON::Field(key: "max_result")]
        getter max_results : Int32?

        # (Optional) When requesting subsequent pages, this is the page token from the previous response
        # output.
        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @access_token : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAccountsResponse
        include JSON::Serializable

        # A paginated response with the list of account information and the next token if more results are
        # available.
        @[JSON::Field(key: "accountList")]
        getter account_list : Array(Types::AccountInfo)?

        # The page token client that is used to retrieve the list of accounts.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_list : Array(Types::AccountInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct LogoutRequest
        include JSON::Serializable

        # The token issued by the CreateToken API call. For more information, see CreateToken in the IAM
        # Identity Center OIDC API Reference Guide .
        @[JSON::Field(key: "x-amz-sso_bearer_token")]
        getter access_token : String

        def initialize(
          @access_token : String
        )
        end
      end

      # The specified resource doesn't exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information about the role credentials that are assigned to the user.
      struct RoleCredentials
        include JSON::Serializable

        # The identifier used for the temporary security credentials. For more information, see Using
        # Temporary Security Credentials to Request Access to AWS Resources in the AWS IAM User Guide .
        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String?

        # The date on which temporary security credentials expire.
        @[JSON::Field(key: "expiration")]
        getter expiration : Int64?

        # The key that is used to sign the request. For more information, see Using Temporary Security
        # Credentials to Request Access to AWS Resources in the AWS IAM User Guide .
        @[JSON::Field(key: "secretAccessKey")]
        getter secret_access_key : String?

        # The token used for temporary credentials. For more information, see Using Temporary Security
        # Credentials to Request Access to AWS Resources in the AWS IAM User Guide .
        @[JSON::Field(key: "sessionToken")]
        getter session_token : String?

        def initialize(
          @access_key_id : String? = nil,
          @expiration : Int64? = nil,
          @secret_access_key : String? = nil,
          @session_token : String? = nil
        )
        end
      end

      # Provides information about the role that is assigned to the user.
      struct RoleInfo
        include JSON::Serializable

        # The identifier of the AWS account assigned to the user.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The friendly name of the role that is assigned to the user.
        @[JSON::Field(key: "roleName")]
        getter role_name : String?

        def initialize(
          @account_id : String? = nil,
          @role_name : String? = nil
        )
        end
      end

      # Indicates that the request is being made too frequently and is more than what the server can handle.
      struct TooManyRequestsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that the request is not authorized. This can happen due to an invalid access token in the
      # request.
      struct UnauthorizedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
