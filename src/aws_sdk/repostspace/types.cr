require "json"
require "time"

module AwsSdk
  module Repostspace
    module Types

      # User does not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct BatchAddChannelRoleToAccessorsInput
        include JSON::Serializable

        # The user or group identifiers to add the role to.

        @[JSON::Field(key: "accessorIds")]
        getter accessor_ids : Array(String)

        # The unique ID of the private re:Post channel.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # The channel role to add to the users or groups.

        @[JSON::Field(key: "channelRole")]
        getter channel_role : String

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        def initialize(
          @accessor_ids : Array(String),
          @channel_id : String,
          @channel_role : String,
          @space_id : String
        )
        end
      end


      struct BatchAddChannelRoleToAccessorsOutput
        include JSON::Serializable

        # An array of successfully updated identifiers.

        @[JSON::Field(key: "addedAccessorIds")]
        getter added_accessor_ids : Array(String)

        # An array of errors that occurred when roles were added.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchError)

        def initialize(
          @added_accessor_ids : Array(String),
          @errors : Array(Types::BatchError)
        )
        end
      end


      struct BatchAddRoleInput
        include JSON::Serializable

        # The user or group accessor identifiers to add the role to.

        @[JSON::Field(key: "accessorIds")]
        getter accessor_ids : Array(String)

        # The role to add to the users or groups.

        @[JSON::Field(key: "role")]
        getter role : String

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        def initialize(
          @accessor_ids : Array(String),
          @role : String,
          @space_id : String
        )
        end
      end


      struct BatchAddRoleOutput
        include JSON::Serializable

        # An array of successfully updated accessor identifiers.

        @[JSON::Field(key: "addedAccessorIds")]
        getter added_accessor_ids : Array(String)

        # An array of errors that occurred when roles were added.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchError)

        def initialize(
          @added_accessor_ids : Array(String),
          @errors : Array(Types::BatchError)
        )
        end
      end

      # An error that occurred during a batch operation.

      struct BatchError
        include JSON::Serializable

        # The accessor identifier that's related to the error.

        @[JSON::Field(key: "accessorId")]
        getter accessor_id : String

        # The error code.

        @[JSON::Field(key: "error")]
        getter error : Int32

        # Description of the error.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @accessor_id : String,
          @error : Int32,
          @message : String
        )
        end
      end


      struct BatchRemoveChannelRoleFromAccessorsInput
        include JSON::Serializable

        # The users or groups identifiers to remove the role from.

        @[JSON::Field(key: "accessorIds")]
        getter accessor_ids : Array(String)

        # The unique ID of the private re:Post channel.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # The channel role to remove from the users or groups.

        @[JSON::Field(key: "channelRole")]
        getter channel_role : String

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        def initialize(
          @accessor_ids : Array(String),
          @channel_id : String,
          @channel_role : String,
          @space_id : String
        )
        end
      end


      struct BatchRemoveChannelRoleFromAccessorsOutput
        include JSON::Serializable

        # An array of errors that occurred when roles were removed.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchError)

        # An array of successfully updated identifiers.

        @[JSON::Field(key: "removedAccessorIds")]
        getter removed_accessor_ids : Array(String)

        def initialize(
          @errors : Array(Types::BatchError),
          @removed_accessor_ids : Array(String)
        )
        end
      end


      struct BatchRemoveRoleInput
        include JSON::Serializable

        # The user or group accessor identifiers to remove the role from.

        @[JSON::Field(key: "accessorIds")]
        getter accessor_ids : Array(String)

        # The role to remove from the users or groups.

        @[JSON::Field(key: "role")]
        getter role : String

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        def initialize(
          @accessor_ids : Array(String),
          @role : String,
          @space_id : String
        )
        end
      end


      struct BatchRemoveRoleOutput
        include JSON::Serializable

        # An array of errors that occurred when roles were removed.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchError)

        # An array of successfully updated accessor identifiers.

        @[JSON::Field(key: "removedAccessorIds")]
        getter removed_accessor_ids : Array(String)

        def initialize(
          @errors : Array(Types::BatchError),
          @removed_accessor_ids : Array(String)
        )
        end
      end

      # A structure that contains some information about a channel in a private re:Post.

      struct ChannelData
        include JSON::Serializable

        # The unique ID of the private re:Post channel.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # The name for the channel. This must be unique per private re:Post.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # The status pf the channel.

        @[JSON::Field(key: "channelStatus")]
        getter channel_status : String

        # The date when the channel was created.

        @[JSON::Field(key: "createDateTime")]
        getter create_date_time : Time

        # The number of groups that are part of the channel.

        @[JSON::Field(key: "groupCount")]
        getter group_count : Int32

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        # The number of users that are part of the channel.

        @[JSON::Field(key: "userCount")]
        getter user_count : Int32

        # A description for the channel. This is used only to help you identify this channel.

        @[JSON::Field(key: "channelDescription")]
        getter channel_description : String?

        # The date when the channel was deleted.

        @[JSON::Field(key: "deleteDateTime")]
        getter delete_date_time : Time?

        def initialize(
          @channel_id : String,
          @channel_name : String,
          @channel_status : String,
          @create_date_time : Time,
          @group_count : Int32,
          @space_id : String,
          @user_count : Int32,
          @channel_description : String? = nil,
          @delete_date_time : Time? = nil
        )
        end
      end

      # Updating or deleting a resource can cause an inconsistent state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct CreateChannelInput
        include JSON::Serializable

        # The name for the channel. This must be unique per private re:Post.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        # A description for the channel. This is used only to help you identify this channel.

        @[JSON::Field(key: "channelDescription")]
        getter channel_description : String?

        def initialize(
          @channel_name : String,
          @space_id : String,
          @channel_description : String? = nil
        )
        end
      end


      struct CreateChannelOutput
        include JSON::Serializable

        # The unique ID of the private re:Post channel.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        def initialize(
          @channel_id : String
        )
        end
      end


      struct CreateSpaceInput
        include JSON::Serializable

        # The name for the private re:Post. This must be unique in your account.

        @[JSON::Field(key: "name")]
        getter name : String

        # The subdomain that you use to access your AWS re:Post Private private re:Post. All custom subdomains
        # must be approved by AWS before use. In addition to your custom subdomain, all private re:Posts are
        # issued an AWS generated subdomain for immediate use.

        @[JSON::Field(key: "subdomain")]
        getter subdomain : String

        # The pricing tier for the private re:Post.

        @[JSON::Field(key: "tier")]
        getter tier : String

        # A description for the private re:Post. This is used only to help you identify this private re:Post.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The IAM role that grants permissions to the private re:Post to convert unanswered questions into AWS
        # support tickets.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "supportedEmailDomains")]
        getter supported_email_domains : Types::SupportedEmailDomainsParameters?

        # The list of tags associated with the private re:Post.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The AWS KMS key ARN that’s used for the AWS KMS encryption. If you don't provide a key, your data is
        # encrypted by default with a key that AWS owns and manages for you.

        @[JSON::Field(key: "userKMSKey")]
        getter user_kms_key : String?

        def initialize(
          @name : String,
          @subdomain : String,
          @tier : String,
          @description : String? = nil,
          @role_arn : String? = nil,
          @supported_email_domains : Types::SupportedEmailDomainsParameters? = nil,
          @tags : Hash(String, String)? = nil,
          @user_kms_key : String? = nil
        )
        end
      end


      struct CreateSpaceOutput
        include JSON::Serializable

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        def initialize(
          @space_id : String
        )
        end
      end


      struct DeleteSpaceInput
        include JSON::Serializable

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        def initialize(
          @space_id : String
        )
        end
      end


      struct DeregisterAdminInput
        include JSON::Serializable

        # The ID of the admin to remove.

        @[JSON::Field(key: "adminId")]
        getter admin_id : String

        # The ID of the private re:Post to remove the admin from.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        def initialize(
          @admin_id : String,
          @space_id : String
        )
        end
      end


      struct GetChannelInput
        include JSON::Serializable

        # The unique ID of the private re:Post channel.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        def initialize(
          @channel_id : String,
          @space_id : String
        )
        end
      end


      struct GetChannelOutput
        include JSON::Serializable

        # The unique ID of the private re:Post channel.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # The name for the channel. This must be unique per private re:Post.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # The status pf the channel.

        @[JSON::Field(key: "channelStatus")]
        getter channel_status : String

        # The date when the channel was created.

        @[JSON::Field(key: "createDateTime")]
        getter create_date_time : Time

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        # A description for the channel. This is used only to help you identify this channel.

        @[JSON::Field(key: "channelDescription")]
        getter channel_description : String?

        # The channel roles associated to the users and groups of the channel.

        @[JSON::Field(key: "channelRoles")]
        getter channel_roles : Hash(String, Array(String))?

        # The date when the channel was deleted.

        @[JSON::Field(key: "deleteDateTime")]
        getter delete_date_time : Time?

        def initialize(
          @channel_id : String,
          @channel_name : String,
          @channel_status : String,
          @create_date_time : Time,
          @space_id : String,
          @channel_description : String? = nil,
          @channel_roles : Hash(String, Array(String))? = nil,
          @delete_date_time : Time? = nil
        )
        end
      end


      struct GetSpaceInput
        include JSON::Serializable

        # The ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        def initialize(
          @space_id : String
        )
        end
      end


      struct GetSpaceOutput
        include JSON::Serializable

        # The ARN of the private re:Post.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Identity Center identifier for the Application Instance.

        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The configuration status of the private re:Post.

        @[JSON::Field(key: "configurationStatus")]
        getter configuration_status : String

        # The date when the private re:Post was created.

        @[JSON::Field(key: "createDateTime")]
        getter create_date_time : Time

        # The name of the private re:Post.

        @[JSON::Field(key: "name")]
        getter name : String

        # The AWS generated subdomain of the private re:Post

        @[JSON::Field(key: "randomDomain")]
        getter random_domain : String

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        # The creation or deletion status of the private re:Post.

        @[JSON::Field(key: "status")]
        getter status : String

        # The storage limit of the private re:Post.

        @[JSON::Field(key: "storageLimit")]
        getter storage_limit : Int64

        # The pricing tier of the private re:Post.

        @[JSON::Field(key: "tier")]
        getter tier : String

        # The custom subdomain that you use to access your private re:Post. All custom subdomains must be
        # approved by AWS before use.

        @[JSON::Field(key: "vanityDomain")]
        getter vanity_domain : String

        # The approval status of the custom subdomain.

        @[JSON::Field(key: "vanityDomainStatus")]
        getter vanity_domain_status : String


        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String?

        # The content size of the private re:Post.

        @[JSON::Field(key: "contentSize")]
        getter content_size : Int64?

        # The IAM role that grants permissions to the private re:Post to convert unanswered questions into AWS
        # support tickets.

        @[JSON::Field(key: "customerRoleArn")]
        getter customer_role_arn : String?

        # The date when the private re:Post was deleted.

        @[JSON::Field(key: "deleteDateTime")]
        getter delete_date_time : Time?

        # The description of the private re:Post.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The list of groups that are administrators of the private re:Post.

        @[JSON::Field(key: "groupAdmins")]
        getter group_admins : Array(String)?


        @[JSON::Field(key: "identityStoreId")]
        getter identity_store_id : String?

        # A map of accessor identifiers and their roles.

        @[JSON::Field(key: "roles")]
        getter roles : Hash(String, Array(String))?


        @[JSON::Field(key: "supportedEmailDomains")]
        getter supported_email_domains : Types::SupportedEmailDomainsStatus?

        # The list of users that are administrators of the private re:Post.

        @[JSON::Field(key: "userAdmins")]
        getter user_admins : Array(String)?

        # The number of users that have onboarded to the private re:Post.

        @[JSON::Field(key: "userCount")]
        getter user_count : Int32?

        # The custom AWS KMS key ARN that’s used for the AWS KMS encryption.

        @[JSON::Field(key: "userKMSKey")]
        getter user_kms_key : String?

        def initialize(
          @arn : String,
          @client_id : String,
          @configuration_status : String,
          @create_date_time : Time,
          @name : String,
          @random_domain : String,
          @space_id : String,
          @status : String,
          @storage_limit : Int64,
          @tier : String,
          @vanity_domain : String,
          @vanity_domain_status : String,
          @application_arn : String? = nil,
          @content_size : Int64? = nil,
          @customer_role_arn : String? = nil,
          @delete_date_time : Time? = nil,
          @description : String? = nil,
          @group_admins : Array(String)? = nil,
          @identity_store_id : String? = nil,
          @roles : Hash(String, Array(String))? = nil,
          @supported_email_domains : Types::SupportedEmailDomainsStatus? = nil,
          @user_admins : Array(String)? = nil,
          @user_count : Int32? = nil,
          @user_kms_key : String? = nil
        )
        end
      end

      # Unexpected error during processing of request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Advice to clients on when the call can be safely retried.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end


      struct ListChannelsInput
        include JSON::Serializable

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        # The maximum number of channels to include in the results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of channel to return. You receive this token from a previous ListChannels
        # operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @space_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChannelsOutput
        include JSON::Serializable

        # An array of structures that contain some information about the channels in the private re:Post.

        @[JSON::Field(key: "channels")]
        getter channels : Array(Types::ChannelData)

        # The token that you use when you request the next set of channels.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(Types::ChannelData),
          @next_token : String? = nil
        )
        end
      end


      struct ListSpacesInput
        include JSON::Serializable

        # The maximum number of private re:Posts to include in the results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of private re:Posts to return. You receive this token from a previous
        # ListSpaces operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSpacesOutput
        include JSON::Serializable

        # An array of structures that contain some information about the private re:Posts in the account.

        @[JSON::Field(key: "spaces")]
        getter spaces : Array(Types::SpaceData)

        # The token that you use when you request the next set of private re:Posts.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @spaces : Array(Types::SpaceData),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource that the tags are associated with.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags that are associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct RegisterAdminInput
        include JSON::Serializable

        # The ID of the administrator.

        @[JSON::Field(key: "adminId")]
        getter admin_id : String

        # The ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        def initialize(
          @admin_id : String,
          @space_id : String
        )
        end
      end

      # Request references a resource which does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct SendInvitesInput
        include JSON::Serializable

        # The array of identifiers for the users and groups.

        @[JSON::Field(key: "accessorIds")]
        getter accessor_ids : Array(String)

        # The body of the invite.

        @[JSON::Field(key: "body")]
        getter body : String

        # The ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        # The title of the invite.

        @[JSON::Field(key: "title")]
        getter title : String

        def initialize(
          @accessor_ids : Array(String),
          @body : String,
          @space_id : String,
          @title : String
        )
        end
      end

      # Request would cause a service quota to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The code to identify the quota.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The id of the resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The code to identify the service.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end

      # A structure that contains some information about a private re:Post in the account.

      struct SpaceData
        include JSON::Serializable

        # The ARN of the private re:Post.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The configuration status of the private re:Post.

        @[JSON::Field(key: "configurationStatus")]
        getter configuration_status : String

        # The date when the private re:Post was created.

        @[JSON::Field(key: "createDateTime")]
        getter create_date_time : Time

        # The name for the private re:Post.

        @[JSON::Field(key: "name")]
        getter name : String

        # The AWS generated subdomain of the private re:Post.

        @[JSON::Field(key: "randomDomain")]
        getter random_domain : String

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        # The creation/deletion status of the private re:Post.

        @[JSON::Field(key: "status")]
        getter status : String

        # The storage limit of the private re:Post.

        @[JSON::Field(key: "storageLimit")]
        getter storage_limit : Int64

        # The pricing tier of the private re:Post.

        @[JSON::Field(key: "tier")]
        getter tier : String

        # This custom subdomain that you use to access your private re:Post. All custom subdomains must be
        # approved by AWS before use.

        @[JSON::Field(key: "vanityDomain")]
        getter vanity_domain : String

        # This approval status of the custom subdomain.

        @[JSON::Field(key: "vanityDomainStatus")]
        getter vanity_domain_status : String

        # The content size of the private re:Post.

        @[JSON::Field(key: "contentSize")]
        getter content_size : Int64?

        # The date when the private re:Post was deleted.

        @[JSON::Field(key: "deleteDateTime")]
        getter delete_date_time : Time?

        # The description for the private re:Post. This is used only to help you identify this private
        # re:Post.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "supportedEmailDomains")]
        getter supported_email_domains : Types::SupportedEmailDomainsStatus?

        # The number of onboarded users to the private re:Post.

        @[JSON::Field(key: "userCount")]
        getter user_count : Int32?

        # The custom AWS KMS key ARN that’s used for the AWS KMS encryption.

        @[JSON::Field(key: "userKMSKey")]
        getter user_kms_key : String?

        def initialize(
          @arn : String,
          @configuration_status : String,
          @create_date_time : Time,
          @name : String,
          @random_domain : String,
          @space_id : String,
          @status : String,
          @storage_limit : Int64,
          @tier : String,
          @vanity_domain : String,
          @vanity_domain_status : String,
          @content_size : Int64? = nil,
          @delete_date_time : Time? = nil,
          @description : String? = nil,
          @supported_email_domains : Types::SupportedEmailDomainsStatus? = nil,
          @user_count : Int32? = nil,
          @user_kms_key : String? = nil
        )
        end
      end


      struct SupportedEmailDomainsParameters
        include JSON::Serializable


        @[JSON::Field(key: "allowedDomains")]
        getter allowed_domains : Array(String)?


        @[JSON::Field(key: "enabled")]
        getter enabled : String?

        def initialize(
          @allowed_domains : Array(String)? = nil,
          @enabled : String? = nil
        )
        end
      end


      struct SupportedEmailDomainsStatus
        include JSON::Serializable


        @[JSON::Field(key: "allowedDomains")]
        getter allowed_domains : Array(String)?


        @[JSON::Field(key: "enabled")]
        getter enabled : String?

        def initialize(
          @allowed_domains : Array(String)? = nil,
          @enabled : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource that the tag is associated with.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tag keys and values that must be associated with the resource. You can associate tag
        # keys only, tags (key and values) only, or a combination of tag keys and tags.

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

      # Request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The code to identify the quota.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # Advice to clients on when the call can be safely retried.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The code to identify the service.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The key values of the tag.

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


      struct UpdateChannelInput
        include JSON::Serializable

        # The unique ID of the private re:Post channel.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # The name for the channel. This must be unique per private re:Post.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # The unique ID of the private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        # A description for the channel. This is used only to help you identify this channel.

        @[JSON::Field(key: "channelDescription")]
        getter channel_description : String?

        def initialize(
          @channel_id : String,
          @channel_name : String,
          @space_id : String,
          @channel_description : String? = nil
        )
        end
      end


      struct UpdateChannelOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateSpaceInput
        include JSON::Serializable

        # The unique ID of this private re:Post.

        @[JSON::Field(key: "spaceId")]
        getter space_id : String

        # A description for the private re:Post. This is used only to help you identify this private re:Post.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The IAM role that grants permissions to the private re:Post to convert unanswered questions into AWS
        # support tickets.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "supportedEmailDomains")]
        getter supported_email_domains : Types::SupportedEmailDomainsParameters?

        # The pricing tier of this private re:Post.

        @[JSON::Field(key: "tier")]
        getter tier : String?

        def initialize(
          @space_id : String,
          @description : String? = nil,
          @role_arn : String? = nil,
          @supported_email_domains : Types::SupportedEmailDomainsParameters? = nil,
          @tier : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The reason why the request failed validation.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # The field that caused the error, if applicable.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Stores information about a field that’s passed inside a request that resulted in an exception.

      struct ValidationExceptionField
        include JSON::Serializable

        # The name of the field.

        @[JSON::Field(key: "message")]
        getter message : String

        # Message describing why the field failed validation.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
