require "json"

module AwsSdk
  module DirectoryServiceData
    module Types

      # You don't have permission to perform the request or access the directory. It can also occur when the
      # DirectoryId doesn't exist or the user, member, or group might be outside of your organizational unit
      # (OU). Make sure that you have the authentication and authorization to perform the action. Review the
      # directory information in the request, and make sure that the object isn't outside of your OU.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Reason the request was unauthorized.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct AddGroupMemberRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the group.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The SAMAccountName of the user, group, or computer to add as a group member.

        @[JSON::Field(key: "MemberName")]
        getter member_name : String

        # A unique and case-sensitive identifier that you provide to make sure the idempotency of the request,
        # so multiple identical calls have the same effect as one single call. A client token is valid for 8
        # hours after the first request that uses it completes. After 8 hours, any request with the same
        # client token is treated as a new request. If the request succeeds, any future uses of that token
        # will be idempotent for another 8 hours. If you submit a request with the same client token but
        # change one of the other parameters within the 8-hour idempotency window, Directory Service Data
        # returns an ConflictException . This parameter is optional when using the CLI or SDK.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The domain name that's associated with the group member. This parameter is required only when adding
        # a member outside of your Managed Microsoft AD domain to a group inside of your Managed Microsoft AD
        # domain. This parameter defaults to the Managed Microsoft AD domain. This parameter is case
        # insensitive.

        @[JSON::Field(key: "MemberRealm")]
        getter member_realm : String?

        def initialize(
          @directory_id : String,
          @group_name : String,
          @member_name : String,
          @client_token : String? = nil,
          @member_realm : String? = nil
        )
        end
      end


      struct AddGroupMemberResult
        include JSON::Serializable

        def initialize
        end
      end

      # The data type for an attribute. Each attribute value is described as a name-value pair. The name is
      # the AD schema name, and the value is the data itself. For a list of supported attributes, see
      # Directory Service Data Attributes .

      struct AttributeValue
        include JSON::Serializable

        # Indicates that the attribute type value is a boolean. For example: "BOOL": true

        @[JSON::Field(key: "BOOL")]
        getter bool : Bool?

        # Indicates that the attribute type value is a number. For example: "N": "16"

        @[JSON::Field(key: "N")]
        getter n : Int64?

        # Indicates that the attribute type value is a string. For example: "S": "S Group"

        @[JSON::Field(key: "S")]
        getter s : String?

        # Indicates that the attribute type value is a string set. For example: "SS":
        # ["sample_service_class/host.sample.com:1234/sample_service_name_1",
        # "sample_service_class/host.sample.com:1234/sample_service_name_2"]

        @[JSON::Field(key: "SS")]
        getter ss : Array(String)?

        def initialize(
          @bool : Bool? = nil,
          @n : Int64? = nil,
          @s : String? = nil,
          @ss : Array(String)? = nil
        )
        end
      end

      # This error will occur when you try to create a resource that conflicts with an existing object. It
      # can also occur when adding a member to a group that the member is already in. This error can be
      # caused by a request sent within the 8-hour idempotency window with the same client token but
      # different input parameters. Client tokens should not be re-used across different requests. After 8
      # hours, any request with the same client token is treated as a new request.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateGroupRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the group.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # A unique and case-sensitive identifier that you provide to make sure the idempotency of the request,
        # so multiple identical calls have the same effect as one single call. A client token is valid for 8
        # hours after the first request that uses it completes. After 8 hours, any request with the same
        # client token is treated as a new request. If the request succeeds, any future uses of that token
        # will be idempotent for another 8 hours. If you submit a request with the same client token but
        # change one of the other parameters within the 8-hour idempotency window, Directory Service Data
        # returns an ConflictException . This parameter is optional when using the CLI or SDK.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The scope of the AD group. For details, see Active Directory security group scope .

        @[JSON::Field(key: "GroupScope")]
        getter group_scope : String?

        # The AD group type. For details, see Active Directory security group type .

        @[JSON::Field(key: "GroupType")]
        getter group_type : String?

        # An expression that defines one or more attributes with the data type and value of each attribute.

        @[JSON::Field(key: "OtherAttributes")]
        getter other_attributes : Hash(String, Types::AttributeValue)?

        def initialize(
          @directory_id : String,
          @sam_account_name : String,
          @client_token : String? = nil,
          @group_scope : String? = nil,
          @group_type : String? = nil,
          @other_attributes : Hash(String, Types::AttributeValue)? = nil
        )
        end
      end


      struct CreateGroupResult
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The name of the group.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String?

        # The unique security identifier (SID) of the group.

        @[JSON::Field(key: "SID")]
        getter sid : String?

        def initialize(
          @directory_id : String? = nil,
          @sam_account_name : String? = nil,
          @sid : String? = nil
        )
        end
      end


      struct CreateUserRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that’s associated with the user.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the user.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # A unique and case-sensitive identifier that you provide to make sure the idempotency of the request,
        # so multiple identical calls have the same effect as one single call. A client token is valid for 8
        # hours after the first request that uses it completes. After 8 hours, any request with the same
        # client token is treated as a new request. If the request succeeds, any future uses of that token
        # will be idempotent for another 8 hours. If you submit a request with the same client token but
        # change one of the other parameters within the 8-hour idempotency window, Directory Service Data
        # returns an ConflictException . This parameter is optional when using the CLI or SDK.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The email address of the user.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # The first name of the user.

        @[JSON::Field(key: "GivenName")]
        getter given_name : String?

        # An expression that defines one or more attribute names with the data type and value of each
        # attribute. A key is an attribute name, and the value is a list of maps. For a list of supported
        # attributes, see Directory Service Data Attributes . Attribute names are case insensitive.

        @[JSON::Field(key: "OtherAttributes")]
        getter other_attributes : Hash(String, Types::AttributeValue)?

        # The last name of the user.

        @[JSON::Field(key: "Surname")]
        getter surname : String?

        def initialize(
          @directory_id : String,
          @sam_account_name : String,
          @client_token : String? = nil,
          @email_address : String? = nil,
          @given_name : String? = nil,
          @other_attributes : Hash(String, Types::AttributeValue)? = nil,
          @surname : String? = nil
        )
        end
      end


      struct CreateUserResult
        include JSON::Serializable

        # The identifier (ID) of the directory where the address block is added.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The name of the user.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String?

        # The unique security identifier (SID) of the user.

        @[JSON::Field(key: "SID")]
        getter sid : String?

        def initialize(
          @directory_id : String? = nil,
          @sam_account_name : String? = nil,
          @sid : String? = nil
        )
        end
      end


      struct DeleteGroupRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the group.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # A unique and case-sensitive identifier that you provide to make sure the idempotency of the request,
        # so multiple identical calls have the same effect as one single call. A client token is valid for 8
        # hours after the first request that uses it completes. After 8 hours, any request with the same
        # client token is treated as a new request. If the request succeeds, any future uses of that token
        # will be idempotent for another 8 hours. If you submit a request with the same client token but
        # change one of the other parameters within the 8-hour idempotency window, Directory Service Data
        # returns an ConflictException . This parameter is optional when using the CLI or SDK.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @directory_id : String,
          @sam_account_name : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteGroupResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteUserRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the user.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the user.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # A unique and case-sensitive identifier that you provide to make sure the idempotency of the request,
        # so multiple identical calls have the same effect as one single call. A client token is valid for 8
        # hours after the first request that uses it completes. After 8 hours, any request with the same
        # client token is treated as a new request. If the request succeeds, any future uses of that token
        # will be idempotent for another 8 hours. If you submit a request with the same client token but
        # change one of the other parameters within the 8-hour idempotency window, Directory Service Data
        # returns an ConflictException . This parameter is optional when using the CLI or SDK.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @directory_id : String,
          @sam_account_name : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteUserResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeGroupRequest
        include JSON::Serializable

        # The Identifier (ID) of the directory associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the group.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # One or more attributes to be returned for the group. For a list of supported attributes, see
        # Directory Service Data Attributes .

        @[JSON::Field(key: "OtherAttributes")]
        getter other_attributes : Array(String)?

        # The domain name that's associated with the group. This parameter is optional, so you can return
        # groups outside of your Managed Microsoft AD domain. When no value is defined, only your Managed
        # Microsoft AD groups are returned. This value is case insensitive.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        def initialize(
          @directory_id : String,
          @sam_account_name : String,
          @other_attributes : Array(String)? = nil,
          @realm : String? = nil
        )
        end
      end


      struct DescribeGroupResult
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The distinguished name of the object.

        @[JSON::Field(key: "DistinguishedName")]
        getter distinguished_name : String?

        # The scope of the AD group. For details, see Active Directory security groups .

        @[JSON::Field(key: "GroupScope")]
        getter group_scope : String?

        # The AD group type. For details, see Active Directory security group type .

        @[JSON::Field(key: "GroupType")]
        getter group_type : String?

        # The attribute values that are returned for the attribute names that are included in the request.

        @[JSON::Field(key: "OtherAttributes")]
        getter other_attributes : Hash(String, Types::AttributeValue)?

        # The domain name that's associated with the group.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        # The name of the group.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String?

        # The unique security identifier (SID) of the group.

        @[JSON::Field(key: "SID")]
        getter sid : String?

        def initialize(
          @directory_id : String? = nil,
          @distinguished_name : String? = nil,
          @group_scope : String? = nil,
          @group_type : String? = nil,
          @other_attributes : Hash(String, Types::AttributeValue)? = nil,
          @realm : String? = nil,
          @sam_account_name : String? = nil,
          @sid : String? = nil
        )
        end
      end


      struct DescribeUserRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the user.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the user.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # One or more attribute names to be returned for the user. A key is an attribute name, and the value
        # is a list of maps. For a list of supported attributes, see Directory Service Data Attributes .

        @[JSON::Field(key: "OtherAttributes")]
        getter other_attributes : Array(String)?

        # The domain name that's associated with the user. This parameter is optional, so you can return users
        # outside your Managed Microsoft AD domain. When no value is defined, only your Managed Microsoft AD
        # users are returned. This value is case insensitive.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        def initialize(
          @directory_id : String,
          @sam_account_name : String,
          @other_attributes : Array(String)? = nil,
          @realm : String? = nil
        )
        end
      end


      struct DescribeUserResult
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the user.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The distinguished name of the object.

        @[JSON::Field(key: "DistinguishedName")]
        getter distinguished_name : String?

        # The email address of the user.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # Indicates whether the user account is active.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The first name of the user.

        @[JSON::Field(key: "GivenName")]
        getter given_name : String?

        # The attribute values that are returned for the attribute names that are included in the request.
        # Attribute names are case insensitive.

        @[JSON::Field(key: "OtherAttributes")]
        getter other_attributes : Hash(String, Types::AttributeValue)?

        # The domain name that's associated with the user.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        # The name of the user.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String?

        # The unique security identifier (SID) of the user.

        @[JSON::Field(key: "SID")]
        getter sid : String?

        # The last name of the user.

        @[JSON::Field(key: "Surname")]
        getter surname : String?

        # The UPN that is an Internet-style login name for a user and is based on the Internet standard RFC
        # 822 . The UPN is shorter than the distinguished name and easier to remember.

        @[JSON::Field(key: "UserPrincipalName")]
        getter user_principal_name : String?

        def initialize(
          @directory_id : String? = nil,
          @distinguished_name : String? = nil,
          @email_address : String? = nil,
          @enabled : Bool? = nil,
          @given_name : String? = nil,
          @other_attributes : Hash(String, Types::AttributeValue)? = nil,
          @realm : String? = nil,
          @sam_account_name : String? = nil,
          @sid : String? = nil,
          @surname : String? = nil,
          @user_principal_name : String? = nil
        )
        end
      end

      # The request could not be completed due to a problem in the configuration or current state of the
      # specified directory.

      struct DirectoryUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Reason the request failed for the specified directory.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct DisableUserRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the user.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the user.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # A unique and case-sensitive identifier that you provide to make sure the idempotency of the request,
        # so multiple identical calls have the same effect as one single call. A client token is valid for 8
        # hours after the first request that uses it completes. After 8 hours, any request with the same
        # client token is treated as a new request. If the request succeeds, any future uses of that token
        # will be idempotent for another 8 hours. If you submit a request with the same client token but
        # change one of the other parameters within the 8-hour idempotency window, Directory Service Data
        # returns an ConflictException . This parameter is optional when using the CLI or SDK.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @directory_id : String,
          @sam_account_name : String,
          @client_token : String? = nil
        )
        end
      end


      struct DisableUserResult
        include JSON::Serializable

        def initialize
        end
      end

      # A group object that contains identifying information and attributes for a specified group.

      struct Group
        include JSON::Serializable

        # The name of the group.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # The distinguished name of the object.

        @[JSON::Field(key: "DistinguishedName")]
        getter distinguished_name : String?

        # The scope of the AD group. For details, see Active Directory security groups

        @[JSON::Field(key: "GroupScope")]
        getter group_scope : String?

        # The AD group type. For details, see Active Directory security group type .

        @[JSON::Field(key: "GroupType")]
        getter group_type : String?

        # An expression of one or more attributes, data types, and the values of a group.

        @[JSON::Field(key: "OtherAttributes")]
        getter other_attributes : Hash(String, Types::AttributeValue)?

        # The unique security identifier (SID) of the group.

        @[JSON::Field(key: "SID")]
        getter sid : String?

        def initialize(
          @sam_account_name : String,
          @distinguished_name : String? = nil,
          @group_scope : String? = nil,
          @group_type : String? = nil,
          @other_attributes : Hash(String, Types::AttributeValue)? = nil,
          @sid : String? = nil
        )
        end
      end

      # A structure containing a subset of fields of a group object from a directory.

      struct GroupSummary
        include JSON::Serializable

        # The scope of the AD group. For details, see Active Directory security groups .

        @[JSON::Field(key: "GroupScope")]
        getter group_scope : String

        # The AD group type. For details, see Active Directory security group type .

        @[JSON::Field(key: "GroupType")]
        getter group_type : String

        # The name of the group.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # The unique security identifier (SID) of the group.

        @[JSON::Field(key: "SID")]
        getter sid : String

        def initialize(
          @group_scope : String,
          @group_type : String,
          @sam_account_name : String,
          @sid : String
        )
        end
      end

      # The operation didn't succeed because an internal error occurred. Try again later.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListGroupMembersRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the group.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # The maximum number of results to be returned per request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The domain name that's associated with the group member. This parameter defaults to the Managed
        # Microsoft AD domain. This parameter is optional and case insensitive.

        @[JSON::Field(key: "MemberRealm")]
        getter member_realm : String?

        # An encoded paging token for paginated calls that can be passed back to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The domain name that's associated with the group. This parameter is optional, so you can return
        # members from a group outside of your Managed Microsoft AD domain. When no value is defined, only
        # members of your Managed Microsoft AD groups are returned. This value is case insensitive.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        def initialize(
          @directory_id : String,
          @sam_account_name : String,
          @max_results : Int32? = nil,
          @member_realm : String? = nil,
          @next_token : String? = nil,
          @realm : String? = nil
        )
        end
      end


      struct ListGroupMembersResult
        include JSON::Serializable

        # Identifier (ID) of the directory associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The domain name that's associated with the member.

        @[JSON::Field(key: "MemberRealm")]
        getter member_realm : String?

        # The member information that the request returns.

        @[JSON::Field(key: "Members")]
        getter members : Array(Types::Member)?

        # An encoded paging token for paginated calls that can be passed back to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The domain name that's associated with the group.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        def initialize(
          @directory_id : String? = nil,
          @member_realm : String? = nil,
          @members : Array(Types::Member)? = nil,
          @next_token : String? = nil,
          @realm : String? = nil
        )
        end
      end


      struct ListGroupsForMemberRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the member.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The SAMAccountName of the user, group, or computer that's a member of the group.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # The maximum number of results to be returned per request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The domain name that's associated with the group member. This parameter is optional, so you can
        # limit your results to the group members in a specific domain. This parameter is case insensitive and
        # defaults to Realm

        @[JSON::Field(key: "MemberRealm")]
        getter member_realm : String?

        # An encoded paging token for paginated calls that can be passed back to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The domain name that's associated with the group. This parameter is optional, so you can return
        # groups outside of your Managed Microsoft AD domain. When no value is defined, only your Managed
        # Microsoft AD groups are returned. This value is case insensitive and defaults to your Managed
        # Microsoft AD domain.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        def initialize(
          @directory_id : String,
          @sam_account_name : String,
          @max_results : Int32? = nil,
          @member_realm : String? = nil,
          @next_token : String? = nil,
          @realm : String? = nil
        )
        end
      end


      struct ListGroupsForMemberResult
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the member.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The group information that the request returns.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::GroupSummary)?

        # The domain that's associated with the member.

        @[JSON::Field(key: "MemberRealm")]
        getter member_realm : String?

        # An encoded paging token for paginated calls that can be passed back to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The domain that's associated with the group.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        def initialize(
          @directory_id : String? = nil,
          @groups : Array(Types::GroupSummary)? = nil,
          @member_realm : String? = nil,
          @next_token : String? = nil,
          @realm : String? = nil
        )
        end
      end


      struct ListGroupsRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The maximum number of results to be returned per request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An encoded paging token for paginated calls that can be passed back to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The domain name associated with the directory. This parameter is optional, so you can return groups
        # outside of your Managed Microsoft AD domain. When no value is defined, only your Managed Microsoft
        # AD groups are returned. This value is case insensitive.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        def initialize(
          @directory_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @realm : String? = nil
        )
        end
      end


      struct ListGroupsResult
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The group information that the request returns.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::GroupSummary)?

        # An encoded paging token for paginated calls that can be passed back to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The domain name associated with the group.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        def initialize(
          @directory_id : String? = nil,
          @groups : Array(Types::GroupSummary)? = nil,
          @next_token : String? = nil,
          @realm : String? = nil
        )
        end
      end


      struct ListUsersRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the user.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The maximum number of results to be returned per request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An encoded paging token for paginated calls that can be passed back to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The domain name that's associated with the user. This parameter is optional, so you can return users
        # outside of your Managed Microsoft AD domain. When no value is defined, only your Managed Microsoft
        # AD users are returned. This value is case insensitive.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        def initialize(
          @directory_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @realm : String? = nil
        )
        end
      end


      struct ListUsersResult
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the user.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # An encoded paging token for paginated calls that can be passed back to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The domain that's associated with the user.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        # The user information that the request returns.

        @[JSON::Field(key: "Users")]
        getter users : Array(Types::UserSummary)?

        def initialize(
          @directory_id : String? = nil,
          @next_token : String? = nil,
          @realm : String? = nil,
          @users : Array(Types::UserSummary)? = nil
        )
        end
      end

      # A member object that contains identifying information for a specified member.

      struct Member
        include JSON::Serializable

        # The AD type of the member object.

        @[JSON::Field(key: "MemberType")]
        getter member_type : String

        # The name of the group member.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # The unique security identifier (SID) of the group member.

        @[JSON::Field(key: "SID")]
        getter sid : String

        def initialize(
          @member_type : String,
          @sam_account_name : String,
          @sid : String
        )
        end
      end


      struct RemoveGroupMemberRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the member.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the group.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The SAMAccountName of the user, group, or computer to remove from the group.

        @[JSON::Field(key: "MemberName")]
        getter member_name : String

        # A unique and case-sensitive identifier that you provide to make sure the idempotency of the request,
        # so multiple identical calls have the same effect as one single call. A client token is valid for 8
        # hours after the first request that uses it completes. After 8 hours, any request with the same
        # client token is treated as a new request. If the request succeeds, any future uses of that token
        # will be idempotent for another 8 hours. If you submit a request with the same client token but
        # change one of the other parameters within the 8-hour idempotency window, Directory Service Data
        # returns an ConflictException . This parameter is optional when using the CLI or SDK.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The domain name that's associated with the group member. This parameter defaults to the Managed
        # Microsoft AD domain. This parameter is optional and case insensitive.

        @[JSON::Field(key: "MemberRealm")]
        getter member_realm : String?

        def initialize(
          @directory_id : String,
          @group_name : String,
          @member_name : String,
          @client_token : String? = nil,
          @member_realm : String? = nil
        )
        end
      end


      struct RemoveGroupMemberResult
        include JSON::Serializable

        def initialize
        end
      end

      # The resource couldn't be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct SearchGroupsRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # One or more data attributes that are used to search for a group. For a list of supported attributes,
        # see Directory Service Data Attributes .

        @[JSON::Field(key: "SearchAttributes")]
        getter search_attributes : Array(String)

        # The attribute value that you want to search for. Wildcard (*) searches aren't supported. For a list
        # of supported attributes, see Directory Service Data Attributes .

        @[JSON::Field(key: "SearchString")]
        getter search_string : String

        # The maximum number of results to be returned per request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An encoded paging token for paginated calls that can be passed back to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The domain name that's associated with the group. This parameter is optional, so you can return
        # groups outside of your Managed Microsoft AD domain. When no value is defined, only your Managed
        # Microsoft AD groups are returned. This value is case insensitive.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        def initialize(
          @directory_id : String,
          @search_attributes : Array(String),
          @search_string : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @realm : String? = nil
        )
        end
      end


      struct SearchGroupsResult
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The group information that the request returns.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::Group)?

        # An encoded paging token for paginated calls that can be passed back to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The domain that's associated with the group.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        def initialize(
          @directory_id : String? = nil,
          @groups : Array(Types::Group)? = nil,
          @next_token : String? = nil,
          @realm : String? = nil
        )
        end
      end


      struct SearchUsersRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the user.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # One or more data attributes that are used to search for a user. For a list of supported attributes,
        # see Directory Service Data Attributes .

        @[JSON::Field(key: "SearchAttributes")]
        getter search_attributes : Array(String)

        # The attribute value that you want to search for. Wildcard (*) searches aren't supported. For a list
        # of supported attributes, see Directory Service Data Attributes .

        @[JSON::Field(key: "SearchString")]
        getter search_string : String

        # The maximum number of results to be returned per request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An encoded paging token for paginated calls that can be passed back to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The domain name that's associated with the user. This parameter is optional, so you can return users
        # outside of your Managed Microsoft AD domain. When no value is defined, only your Managed Microsoft
        # AD users are returned. This value is case insensitive.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        def initialize(
          @directory_id : String,
          @search_attributes : Array(String),
          @search_string : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @realm : String? = nil
        )
        end
      end


      struct SearchUsersResult
        include JSON::Serializable

        # The identifier (ID) of the directory where the address block is added.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # An encoded paging token for paginated calls that can be passed back to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The domain that's associated with the user.

        @[JSON::Field(key: "Realm")]
        getter realm : String?

        # The user information that the request returns.

        @[JSON::Field(key: "Users")]
        getter users : Array(Types::User)?

        def initialize(
          @directory_id : String? = nil,
          @next_token : String? = nil,
          @realm : String? = nil,
          @users : Array(Types::User)? = nil
        )
        end
      end

      # The limit on the number of requests per second has been exceeded.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The recommended amount of seconds to retry after a throttling exception.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end


      struct UpdateGroupRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the group.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # A unique and case-sensitive identifier that you provide to make sure the idempotency of the request,
        # so multiple identical calls have the same effect as one single call. A client token is valid for 8
        # hours after the first request that uses it completes. After 8 hours, any request with the same
        # client token is treated as a new request. If the request succeeds, any future uses of that token
        # will be idempotent for another 8 hours. If you submit a request with the same client token but
        # change one of the other parameters within the 8-hour idempotency window, Directory Service Data
        # returns an ConflictException . This parameter is optional when using the CLI or SDK.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The scope of the AD group. For details, see Active Directory security groups .

        @[JSON::Field(key: "GroupScope")]
        getter group_scope : String?

        # The AD group type. For details, see Active Directory security group type .

        @[JSON::Field(key: "GroupType")]
        getter group_type : String?

        # An expression that defines one or more attributes with the data type and the value of each
        # attribute.

        @[JSON::Field(key: "OtherAttributes")]
        getter other_attributes : Hash(String, Types::AttributeValue)?

        # The type of update to be performed. If no value exists for the attribute, use ADD . Otherwise, use
        # REPLACE to change an attribute value or REMOVE to clear the attribute value.

        @[JSON::Field(key: "UpdateType")]
        getter update_type : String?

        def initialize(
          @directory_id : String,
          @sam_account_name : String,
          @client_token : String? = nil,
          @group_scope : String? = nil,
          @group_type : String? = nil,
          @other_attributes : Hash(String, Types::AttributeValue)? = nil,
          @update_type : String? = nil
        )
        end
      end


      struct UpdateGroupResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateUserRequest
        include JSON::Serializable

        # The identifier (ID) of the directory that's associated with the user.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the user.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # A unique and case-sensitive identifier that you provide to make sure the idempotency of the request,
        # so multiple identical calls have the same effect as one single call. A client token is valid for 8
        # hours after the first request that uses it completes. After 8 hours, any request with the same
        # client token is treated as a new request. If the request succeeds, any future uses of that token
        # will be idempotent for another 8 hours. If you submit a request with the same client token but
        # change one of the other parameters within the 8-hour idempotency window, Directory Service Data
        # returns an ConflictException . This parameter is optional when using the CLI or SDK.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The email address of the user.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # The first name of the user.

        @[JSON::Field(key: "GivenName")]
        getter given_name : String?

        # An expression that defines one or more attribute names with the data type and value of each
        # attribute. A key is an attribute name, and the value is a list of maps. For a list of supported
        # attributes, see Directory Service Data Attributes . Attribute names are case insensitive.

        @[JSON::Field(key: "OtherAttributes")]
        getter other_attributes : Hash(String, Types::AttributeValue)?

        # The last name of the user.

        @[JSON::Field(key: "Surname")]
        getter surname : String?

        # The type of update to be performed. If no value exists for the attribute, use ADD . Otherwise, use
        # REPLACE to change an attribute value or REMOVE to clear the attribute value.

        @[JSON::Field(key: "UpdateType")]
        getter update_type : String?

        def initialize(
          @directory_id : String,
          @sam_account_name : String,
          @client_token : String? = nil,
          @email_address : String? = nil,
          @given_name : String? = nil,
          @other_attributes : Hash(String, Types::AttributeValue)? = nil,
          @surname : String? = nil,
          @update_type : String? = nil
        )
        end
      end


      struct UpdateUserResult
        include JSON::Serializable

        def initialize
        end
      end

      # A user object that contains identifying information and attributes for a specified user.

      struct User
        include JSON::Serializable

        # The name of the user.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # The distinguished name of the object.

        @[JSON::Field(key: "DistinguishedName")]
        getter distinguished_name : String?

        # The email address of the user.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # Indicates whether the user account is active.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The first name of the user.

        @[JSON::Field(key: "GivenName")]
        getter given_name : String?

        # An expression that includes one or more attributes, data types, and values of a user.

        @[JSON::Field(key: "OtherAttributes")]
        getter other_attributes : Hash(String, Types::AttributeValue)?

        # The unique security identifier (SID) of the user.

        @[JSON::Field(key: "SID")]
        getter sid : String?

        # The last name of the user.

        @[JSON::Field(key: "Surname")]
        getter surname : String?

        # The UPN that is an internet-style login name for a user and based on the internet standard RFC 822 .
        # The UPN is shorter than the distinguished name and easier to remember.

        @[JSON::Field(key: "UserPrincipalName")]
        getter user_principal_name : String?

        def initialize(
          @sam_account_name : String,
          @distinguished_name : String? = nil,
          @email_address : String? = nil,
          @enabled : Bool? = nil,
          @given_name : String? = nil,
          @other_attributes : Hash(String, Types::AttributeValue)? = nil,
          @sid : String? = nil,
          @surname : String? = nil,
          @user_principal_name : String? = nil
        )
        end
      end

      # A structure containing a subset of the fields of a user object from a directory.

      struct UserSummary
        include JSON::Serializable

        # Indicates whether the user account is active.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The name of the user.

        @[JSON::Field(key: "SAMAccountName")]
        getter sam_account_name : String

        # The unique security identifier (SID) of the user.

        @[JSON::Field(key: "SID")]
        getter sid : String

        # The first name of the user.

        @[JSON::Field(key: "GivenName")]
        getter given_name : String?

        # The last name of the user.

        @[JSON::Field(key: "Surname")]
        getter surname : String?

        def initialize(
          @enabled : Bool,
          @sam_account_name : String,
          @sid : String,
          @given_name : String? = nil,
          @surname : String? = nil
        )
        end
      end

      # The request isn't valid. Review the details in the error message to update the invalid parameters or
      # values in your request.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Reason the request failed validation.

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
