require "json"
require "time"

module AwsSdk
  module Cloud9
    module Types

      # The target request is invalid.

      struct BadRequestException
        include JSON::Serializable

        def initialize
        end
      end

      # A concurrent access issue occurred.

      struct ConcurrentAccessException
        include JSON::Serializable

        def initialize
        end
      end

      # A conflict occurred.

      struct ConflictException
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateEnvironmentEC2Request
        include JSON::Serializable

        # The identifier for the Amazon Machine Image (AMI) that's used to create the EC2 instance. To choose
        # an AMI for the instance, you must specify a valid AMI alias or a valid Amazon EC2 Systems Manager
        # (SSM) path. We recommend using Amazon Linux 2023 as the AMI to create your environment as it is
        # fully supported. From December 16, 2024, Ubuntu 18.04 will be removed from the list of available
        # imageIds for Cloud9. This change is necessary as Ubuntu 18.04 has ended standard support on May 31,
        # 2023. This change will only affect direct API consumers, and not Cloud9 console users. Since Ubuntu
        # 18.04 has ended standard support as of May 31, 2023, we recommend you choose Ubuntu 22.04. AMI
        # aliases Amazon Linux 2: amazonlinux-2-x86_64 Amazon Linux 2023 (recommended):
        # amazonlinux-2023-x86_64 Ubuntu 18.04: ubuntu-18.04-x86_64 Ubuntu 22.04: ubuntu-22.04-x86_64 SSM
        # paths Amazon Linux 2: resolve:ssm:/aws/service/cloud9/amis/amazonlinux-2-x86_64 Amazon Linux 2023
        # (recommended): resolve:ssm:/aws/service/cloud9/amis/amazonlinux-2023-x86_64 Ubuntu 18.04:
        # resolve:ssm:/aws/service/cloud9/amis/ubuntu-18.04-x86_64 Ubuntu 22.04:
        # resolve:ssm:/aws/service/cloud9/amis/ubuntu-22.04-x86_64

        @[JSON::Field(key: "imageId")]
        getter image_id : String

        # The type of instance to connect to the environment (for example, t2.micro ).

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The name of the environment to create. This name is visible to other IAM users in the same Amazon
        # Web Services account.

        @[JSON::Field(key: "name")]
        getter name : String

        # The number of minutes until the running instance is shut down after the environment has last been
        # used.

        @[JSON::Field(key: "automaticStopTimeMinutes")]
        getter automatic_stop_time_minutes : Int32?

        # A unique, case-sensitive string that helps Cloud9 to ensure this operation completes no more than
        # one time. For more information, see Client Tokens in the Amazon EC2 API Reference .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The connection type used for connecting to an Amazon EC2 environment. Valid values are CONNECT_SSH
        # (default) and CONNECT_SSM (connected through Amazon EC2 Systems Manager). For more information, see
        # Accessing no-ingress EC2 instances with Amazon EC2 Systems Manager in the Cloud9 User Guide .

        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?

        # The description of the environment to create.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Checks whether you have the required permissions for the action, without actually making the
        # request, and provides an error response. If you have the required permissions, the error response is
        # DryRunOperation . Otherwise, it is UnauthorizedOperation .

        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?

        # The Amazon Resource Name (ARN) of the environment owner. This ARN can be the ARN of any IAM
        # principal. If this value is not specified, the ARN defaults to this environment's creator.

        @[JSON::Field(key: "ownerArn")]
        getter owner_arn : String?

        # The ID of the subnet in Amazon VPC that Cloud9 will use to communicate with the Amazon EC2 instance.

        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String?

        # An array of key-value pairs that will be associated with the new Cloud9 development environment.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @image_id : String,
          @instance_type : String,
          @name : String,
          @automatic_stop_time_minutes : Int32? = nil,
          @client_request_token : String? = nil,
          @connection_type : String? = nil,
          @description : String? = nil,
          @dry_run : Bool? = nil,
          @owner_arn : String? = nil,
          @subnet_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateEnvironmentEC2Result
        include JSON::Serializable

        # The ID of the environment that was created.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        def initialize(
          @environment_id : String? = nil
        )
        end
      end


      struct CreateEnvironmentMembershipRequest
        include JSON::Serializable

        # The ID of the environment that contains the environment member you want to add.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The type of environment member permissions you want to associate with this environment member.
        # Available values include: read-only : Has read-only access to the environment. read-write : Has
        # read-write access to the environment.

        @[JSON::Field(key: "permissions")]
        getter permissions : String

        # The Amazon Resource Name (ARN) of the environment member you want to add.

        @[JSON::Field(key: "userArn")]
        getter user_arn : String

        def initialize(
          @environment_id : String,
          @permissions : String,
          @user_arn : String
        )
        end
      end


      struct CreateEnvironmentMembershipResult
        include JSON::Serializable

        # Information about the environment member that was added.

        @[JSON::Field(key: "membership")]
        getter membership : Types::EnvironmentMember

        def initialize(
          @membership : Types::EnvironmentMember
        )
        end
      end


      struct DeleteEnvironmentMembershipRequest
        include JSON::Serializable

        # The ID of the environment to delete the environment member from.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The Amazon Resource Name (ARN) of the environment member to delete from the environment.

        @[JSON::Field(key: "userArn")]
        getter user_arn : String

        def initialize(
          @environment_id : String,
          @user_arn : String
        )
        end
      end


      struct DeleteEnvironmentMembershipResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteEnvironmentRequest
        include JSON::Serializable

        # The ID of the environment to delete.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end


      struct DeleteEnvironmentResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeEnvironmentMembershipsRequest
        include JSON::Serializable

        # The ID of the environment to get environment member information about.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The maximum number of environment members to get information about.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # During a previous call, if there are more than 25 items in the list, only the first 25 items are
        # returned, along with a unique string called a next token . To get the next batch of items in the
        # list, call this operation again, adding the next token to the call. To get all of the items in the
        # list, keep calling this operation with each subsequent next token that is returned, until no more
        # next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of environment member permissions to get information about. Available values include: owner
        # : Owns the environment. read-only : Has read-only access to the environment. read-write : Has
        # read-write access to the environment. If no value is specified, information about all environment
        # members are returned.

        @[JSON::Field(key: "permissions")]
        getter permissions : Array(String)?

        # The Amazon Resource Name (ARN) of an individual environment member to get information about. If no
        # value is specified, information about all environment members are returned.

        @[JSON::Field(key: "userArn")]
        getter user_arn : String?

        def initialize(
          @environment_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @permissions : Array(String)? = nil,
          @user_arn : String? = nil
        )
        end
      end


      struct DescribeEnvironmentMembershipsResult
        include JSON::Serializable

        # Information about the environment members for the environment.

        @[JSON::Field(key: "memberships")]
        getter memberships : Array(Types::EnvironmentMember)?

        # If there are more than 25 items in the list, only the first 25 items are returned, along with a
        # unique string called a next token . To get the next batch of items in the list, call this operation
        # again, adding the next token to the call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @memberships : Array(Types::EnvironmentMember)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEnvironmentStatusRequest
        include JSON::Serializable

        # The ID of the environment to get status information about.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end


      struct DescribeEnvironmentStatusResult
        include JSON::Serializable

        # Any informational message about the status of the environment.

        @[JSON::Field(key: "message")]
        getter message : String

        # The status of the environment. Available values include: connecting : The environment is connecting.
        # creating : The environment is being created. deleting : The environment is being deleted. error :
        # The environment is in an error state. ready : The environment is ready. stopped : The environment is
        # stopped. stopping : The environment is stopping.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @message : String,
          @status : String
        )
        end
      end


      struct DescribeEnvironmentsRequest
        include JSON::Serializable

        # The IDs of individual environments to get information about.

        @[JSON::Field(key: "environmentIds")]
        getter environment_ids : Array(String)

        def initialize(
          @environment_ids : Array(String)
        )
        end
      end


      struct DescribeEnvironmentsResult
        include JSON::Serializable

        # Information about the environments that are returned.

        @[JSON::Field(key: "environments")]
        getter environments : Array(Types::Environment)?

        def initialize(
          @environments : Array(Types::Environment)? = nil
        )
        end
      end

      # Information about an Cloud9 development environment.

      struct Environment
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the environment.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the environment owner.

        @[JSON::Field(key: "ownerArn")]
        getter owner_arn : String

        # The type of environment. Valid values include the following: ec2 : An Amazon Elastic Compute Cloud
        # (Amazon EC2) instance connects to the environment. ssh : Your own server connects to the
        # environment.

        @[JSON::Field(key: "type")]
        getter type : String

        # The connection type used for connecting to an Amazon EC2 environment. CONNECT_SSH is selected by
        # default.

        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?

        # The description for the environment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the environment.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The state of the environment in its creation or deletion lifecycle.

        @[JSON::Field(key: "lifecycle")]
        getter lifecycle : Types::EnvironmentLifecycle?

        # Describes the status of Amazon Web Services managed temporary credentials for the Cloud9
        # environment. Available values are: ENABLED_ON_CREATE ENABLED_BY_OWNER DISABLED_BY_DEFAULT
        # DISABLED_BY_OWNER DISABLED_BY_COLLABORATOR PENDING_REMOVAL_BY_COLLABORATOR PENDING_REMOVAL_BY_OWNER
        # FAILED_REMOVAL_BY_COLLABORATOR ENABLED_BY_OWNER DISABLED_BY_DEFAULT

        @[JSON::Field(key: "managedCredentialsStatus")]
        getter managed_credentials_status : String?

        # The name of the environment.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @owner_arn : String,
          @type : String,
          @connection_type : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @lifecycle : Types::EnvironmentLifecycle? = nil,
          @managed_credentials_status : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Information about the current creation or deletion lifecycle state of an Cloud9 development
      # environment.

      struct EnvironmentLifecycle
        include JSON::Serializable

        # If the environment failed to delete, the Amazon Resource Name (ARN) of the related Amazon Web
        # Services resource.

        @[JSON::Field(key: "failureResource")]
        getter failure_resource : String?

        # Any informational message about the lifecycle state of the environment.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The current creation or deletion lifecycle state of the environment. CREATING : The environment is
        # in the process of being created. CREATED : The environment was successfully created. CREATE_FAILED :
        # The environment failed to be created. DELETING : The environment is in the process of being deleted.
        # DELETE_FAILED : The environment failed to delete.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @failure_resource : String? = nil,
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about an environment member for an Cloud9 development environment.

      struct EnvironmentMember
        include JSON::Serializable

        # The ID of the environment for the environment member.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The type of environment member permissions associated with this environment member. Available values
        # include: owner : Owns the environment. read-only : Has read-only access to the environment.
        # read-write : Has read-write access to the environment.

        @[JSON::Field(key: "permissions")]
        getter permissions : String

        # The Amazon Resource Name (ARN) of the environment member.

        @[JSON::Field(key: "userArn")]
        getter user_arn : String

        # The user ID in Identity and Access Management (IAM) of the environment member.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The time, expressed in epoch time format, when the environment member last opened the environment.

        @[JSON::Field(key: "lastAccess", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_access : Time?

        def initialize(
          @environment_id : String,
          @permissions : String,
          @user_arn : String,
          @user_id : String,
          @last_access : Time? = nil
        )
        end
      end

      # An access permissions issue occurred.

      struct ForbiddenException
        include JSON::Serializable

        def initialize
        end
      end

      # An internal server error occurred.

      struct InternalServerErrorException
        include JSON::Serializable

        def initialize
        end
      end

      # A service limit was exceeded.

      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end


      struct ListEnvironmentsRequest
        include JSON::Serializable

        # The maximum number of environments to get identifiers for.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # During a previous call, if there are more than 25 items in the list, only the first 25 items are
        # returned, along with a unique string called a next token . To get the next batch of items in the
        # list, call this operation again, adding the next token to the call. To get all of the items in the
        # list, keep calling this operation with each subsequent next token that is returned, until no more
        # next tokens are returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentsResult
        include JSON::Serializable

        # The list of environment identifiers.

        @[JSON::Field(key: "environmentIds")]
        getter environment_ids : Array(String)?

        # If there are more than 25 items in the list, only the first 25 items are returned, along with a
        # unique string called a next token . To get the next batch of items in the list, call this operation
        # again, adding the next token to the call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Cloud9 development environment to get the tags for.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags associated with the Cloud9 development environment.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The target resource cannot be found.

      struct NotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Metadata that is associated with Amazon Web Services resources. In particular, a name-value pair
      # that can be associated with an Cloud9 development environment. There are two types of tags: user
      # tags and system tags . A user tag is created by the user. A system tag is automatically created by
      # Amazon Web Services services. A system tag is prefixed with "aws:" and cannot be modified by the
      # user.

      struct Tag
        include JSON::Serializable

        # The name part of a tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value part of a tag.

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

        # The Amazon Resource Name (ARN) of the Cloud9 development environment to add tags to.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The list of tags to add to the given Cloud9 development environment.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Too many service requests were made over the given time period.

      struct TooManyRequestsException
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Cloud9 development environment to remove tags from.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tag names of the tags to remove from the given Cloud9 development environment.

        @[JSON::Field(key: "TagKeys")]
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


      struct UpdateEnvironmentMembershipRequest
        include JSON::Serializable

        # The ID of the environment for the environment member whose settings you want to change.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The replacement type of environment member permissions you want to associate with this environment
        # member. Available values include: read-only : Has read-only access to the environment. read-write :
        # Has read-write access to the environment.

        @[JSON::Field(key: "permissions")]
        getter permissions : String

        # The Amazon Resource Name (ARN) of the environment member whose settings you want to change.

        @[JSON::Field(key: "userArn")]
        getter user_arn : String

        def initialize(
          @environment_id : String,
          @permissions : String,
          @user_arn : String
        )
        end
      end


      struct UpdateEnvironmentMembershipResult
        include JSON::Serializable

        # Information about the environment member whose settings were changed.

        @[JSON::Field(key: "membership")]
        getter membership : Types::EnvironmentMember?

        def initialize(
          @membership : Types::EnvironmentMember? = nil
        )
        end
      end


      struct UpdateEnvironmentRequest
        include JSON::Serializable

        # The ID of the environment to change settings.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # Any new or replacement description for the environment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Allows the environment owner to turn on or turn off the Amazon Web Services managed temporary
        # credentials for an Cloud9 environment by using one of the following values: ENABLE DISABLE Only the
        # environment owner can change the status of managed temporary credentials. An AccessDeniedException
        # is thrown if an attempt to turn on or turn off managed temporary credentials is made by an account
        # that's not the environment owner.

        @[JSON::Field(key: "managedCredentialsAction")]
        getter managed_credentials_action : String?

        # A replacement name for the environment.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @environment_id : String,
          @description : String? = nil,
          @managed_credentials_action : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateEnvironmentResult
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
