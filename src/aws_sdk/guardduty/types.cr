require "json"
require "time"

module AwsSdk
  module GuardDuty
    module Types

      struct AcceptAdministratorInvitationRequest
        include JSON::Serializable

        # The account ID of the GuardDuty administrator account whose invitation you're accepting.
        @[JSON::Field(key: "administratorId")]
        getter administrator_id : String

        # The unique ID of the detector of the GuardDuty member account.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The value that is used to validate the administrator account to the member account.
        @[JSON::Field(key: "invitationId")]
        getter invitation_id : String

        def initialize(
          @administrator_id : String,
          @detector_id : String,
          @invitation_id : String
        )
        end
      end

      struct AcceptAdministratorInvitationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct AcceptInvitationRequest
        include JSON::Serializable

        # The unique ID of the detector of the GuardDuty member account. To find the detectorId in the current
        # Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The value that is used to validate the administrator account to the member account.
        @[JSON::Field(key: "invitationId")]
        getter invitation_id : String

        # The account ID of the GuardDuty administrator account whose invitation you're accepting.
        @[JSON::Field(key: "masterId")]
        getter master_id : String

        def initialize(
          @detector_id : String,
          @invitation_id : String,
          @master_id : String
        )
        end
      end

      struct AcceptInvitationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information on the current access control policies for the bucket.
      struct AccessControlList
        include JSON::Serializable

        # A value that indicates whether public read access for the bucket is enabled through an Access
        # Control List (ACL).
        @[JSON::Field(key: "allowsPublicReadAccess")]
        getter allows_public_read_access : Bool?

        # A value that indicates whether public write access for the bucket is enabled through an Access
        # Control List (ACL).
        @[JSON::Field(key: "allowsPublicWriteAccess")]
        getter allows_public_write_access : Bool?

        def initialize(
          @allows_public_read_access : Bool? = nil,
          @allows_public_write_access : Bool? = nil
        )
        end
      end

      # An access denied exception object.
      struct AccessDeniedException
        include JSON::Serializable

        # The error message.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The error type.
        @[JSON::Field(key: "__type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains information about the access keys.
      struct AccessKey
        include JSON::Serializable

        # Principal ID of the user.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        # Name of the user.
        @[JSON::Field(key: "userName")]
        getter user_name : String?

        # Type of the user.
        @[JSON::Field(key: "userType")]
        getter user_type : String?

        def initialize(
          @principal_id : String? = nil,
          @user_name : String? = nil,
          @user_type : String? = nil
        )
        end
      end

      # Contains information about the access keys.
      struct AccessKeyDetails
        include JSON::Serializable

        # The access key ID of the user.
        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String?

        # The principal ID of the user.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        # The name of the user.
        @[JSON::Field(key: "userName")]
        getter user_name : String?

        # The type of the user.
        @[JSON::Field(key: "userType")]
        getter user_type : String?

        def initialize(
          @access_key_id : String? = nil,
          @principal_id : String? = nil,
          @user_name : String? = nil,
          @user_type : String? = nil
        )
        end
      end

      # Contains information about the account.
      struct Account
        include JSON::Serializable

        # ID of the member's Amazon Web Services account
        @[JSON::Field(key: "uid")]
        getter uid : String

        # Name of the member's Amazon Web Services account.
        @[JSON::Field(key: "account")]
        getter name : String?

        def initialize(
          @uid : String,
          @name : String? = nil
        )
        end
      end

      # Contains information about the account.
      struct AccountDetail
        include JSON::Serializable

        # The member account ID.
        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The email address of the member account. The following list includes the rules for a valid email
        # address: The email address must be a minimum of 6 and a maximum of 64 characters long. All
        # characters must be 7-bit ASCII characters. There must be one and only one @ symbol, which separates
        # the local name from the domain name. The local name can't contain any of the following characters:
        # whitespace, " ' ( ) &lt; &gt; [ ] : ' , \ | % &amp; The local name can't begin with a dot (.). The
        # domain name can consist of only the characters [a-z], [A-Z], [0-9], hyphen (-), or dot (.). The
        # domain name can't begin or end with a dot (.) or hyphen (-). The domain name must contain at least
        # one dot.
        @[JSON::Field(key: "email")]
        getter email : String

        def initialize(
          @account_id : String,
          @email : String
        )
        end
      end

      # Provides details of the GuardDuty member account that uses a free trial service.
      struct AccountFreeTrialInfo
        include JSON::Serializable

        # The account identifier of the GuardDuty member account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Describes the data source enabled for the GuardDuty member account.
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Types::DataSourcesFreeTrial?

        # A list of features enabled for the GuardDuty account.
        @[JSON::Field(key: "features")]
        getter features : Array(Types::FreeTrialFeatureConfigurationResult)?

        def initialize(
          @account_id : String? = nil,
          @data_sources : Types::DataSourcesFreeTrial? = nil,
          @features : Array(Types::FreeTrialFeatureConfigurationResult)? = nil
        )
        end
      end

      # Contains information about the account level permissions on the S3 bucket.
      struct AccountLevelPermissions
        include JSON::Serializable

        # Describes the S3 Block Public Access settings of the bucket's parent account.
        @[JSON::Field(key: "blockPublicAccess")]
        getter block_public_access : Types::BlockPublicAccess?

        def initialize(
          @block_public_access : Types::BlockPublicAccess? = nil
        )
        end
      end

      # Represents a list of map of accounts with the number of findings associated with each account.
      struct AccountStatistics
        include JSON::Serializable

        # The ID of the Amazon Web Services account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The timestamp at which the finding for this account was last generated.
        @[JSON::Field(key: "lastGeneratedAt")]
        getter last_generated_at : Time?

        # The total number of findings associated with an account.
        @[JSON::Field(key: "totalFindings")]
        getter total_findings : Int32?

        def initialize(
          @account_id : String? = nil,
          @last_generated_at : Time? = nil,
          @total_findings : Int32? = nil
        )
        end
      end

      # Contains information about actions.
      struct Action
        include JSON::Serializable

        # The GuardDuty finding activity type.
        @[JSON::Field(key: "actionType")]
        getter action_type : String?

        # Information about the AWS_API_CALL action described in this finding.
        @[JSON::Field(key: "awsApiCallAction")]
        getter aws_api_call_action : Types::AwsApiCallAction?

        # Information about the DNS_REQUEST action described in this finding.
        @[JSON::Field(key: "dnsRequestAction")]
        getter dns_request_action : Types::DnsRequestAction?

        # Information about the Kubernetes API call action described in this finding.
        @[JSON::Field(key: "kubernetesApiCallAction")]
        getter kubernetes_api_call_action : Types::KubernetesApiCallAction?

        # Information whether the user has the permission to use a specific Kubernetes API.
        @[JSON::Field(key: "kubernetesPermissionCheckedDetails")]
        getter kubernetes_permission_checked_details : Types::KubernetesPermissionCheckedDetails?

        # Information about the role binding that grants the permission defined in a Kubernetes role.
        @[JSON::Field(key: "kubernetesRoleBindingDetails")]
        getter kubernetes_role_binding_details : Types::KubernetesRoleBindingDetails?

        # Information about the Kubernetes role name and role type.
        @[JSON::Field(key: "kubernetesRoleDetails")]
        getter kubernetes_role_details : Types::KubernetesRoleDetails?

        # Information about the NETWORK_CONNECTION action described in this finding.
        @[JSON::Field(key: "networkConnectionAction")]
        getter network_connection_action : Types::NetworkConnectionAction?

        # Information about the PORT_PROBE action described in this finding.
        @[JSON::Field(key: "portProbeAction")]
        getter port_probe_action : Types::PortProbeAction?

        # Information about RDS_LOGIN_ATTEMPT action described in this finding.
        @[JSON::Field(key: "rdsLoginAttemptAction")]
        getter rds_login_attempt_action : Types::RdsLoginAttemptAction?

        def initialize(
          @action_type : String? = nil,
          @aws_api_call_action : Types::AwsApiCallAction? = nil,
          @dns_request_action : Types::DnsRequestAction? = nil,
          @kubernetes_api_call_action : Types::KubernetesApiCallAction? = nil,
          @kubernetes_permission_checked_details : Types::KubernetesPermissionCheckedDetails? = nil,
          @kubernetes_role_binding_details : Types::KubernetesRoleBindingDetails? = nil,
          @kubernetes_role_details : Types::KubernetesRoleDetails? = nil,
          @network_connection_action : Types::NetworkConnectionAction? = nil,
          @port_probe_action : Types::PortProbeAction? = nil,
          @rds_login_attempt_action : Types::RdsLoginAttemptAction? = nil
        )
        end
      end

      # Information about the actors involved in an attack sequence.
      struct Actor
        include JSON::Serializable

        # ID of the threat actor.
        @[JSON::Field(key: "id")]
        getter id : String

        # Contains information about the process associated with the threat actor. This includes details such
        # as process name, path, execution time, and unique identifiers that help track the actor's activities
        # within the system.
        @[JSON::Field(key: "process")]
        getter process : Types::ActorProcess?

        # Contains information about the user session where the activity initiated.
        @[JSON::Field(key: "session")]
        getter session : Types::Session?

        # Contains information about the user credentials used by the threat actor.
        @[JSON::Field(key: "user")]
        getter user : Types::User?

        def initialize(
          @id : String,
          @process : Types::ActorProcess? = nil,
          @session : Types::Session? = nil,
          @user : Types::User? = nil
        )
        end
      end

      # Contains information about a process involved in a GuardDuty finding, including process
      # identification, execution details, and file information.
      struct ActorProcess
        include JSON::Serializable

        # The name of the process as it appears in the system.
        @[JSON::Field(key: "name")]
        getter name : String

        # The full file path to the process executable on the system.
        @[JSON::Field(key: "path")]
        getter path : String

        # The SHA256 hash of the process executable file, which can be used for identification and
        # verification purposes.
        @[JSON::Field(key: "sha256")]
        getter sha256 : String?

        def initialize(
          @name : String,
          @path : String,
          @sha256 : String? = nil
        )
        end
      end

      # Contains additional information about the detected threat.
      struct AdditionalInfo
        include JSON::Serializable

        # The device name of the EBS volume, if applicable.
        @[JSON::Field(key: "deviceName")]
        getter device_name : String?

        # The version ID of the S3 object, if applicable.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @device_name : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Information about the installed EKS add-on (GuardDuty security agent).
      struct AddonDetails
        include JSON::Serializable

        # Status of the installed EKS add-on.
        @[JSON::Field(key: "addonStatus")]
        getter addon_status : String?

        # Version of the installed EKS add-on.
        @[JSON::Field(key: "addonVersion")]
        getter addon_version : String?

        def initialize(
          @addon_status : String? = nil,
          @addon_version : String? = nil
        )
        end
      end

      # The account within the organization specified as the GuardDuty delegated administrator.
      struct AdminAccount
        include JSON::Serializable

        # The Amazon Web Services account ID for the account.
        @[JSON::Field(key: "adminAccountId")]
        getter admin_account_id : String?

        # Indicates whether the account is enabled as the delegated administrator.
        @[JSON::Field(key: "adminStatus")]
        getter admin_status : String?

        def initialize(
          @admin_account_id : String? = nil,
          @admin_status : String? = nil
        )
        end
      end

      # Contains information about the administrator account and invitation.
      struct Administrator
        include JSON::Serializable

        # The ID of the account used as the administrator account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The value that is used to validate the administrator account to the member account.
        @[JSON::Field(key: "invitationId")]
        getter invitation_id : String?

        # The timestamp when the invitation was sent.
        @[JSON::Field(key: "invitedAt")]
        getter invited_at : String?

        # The status of the relationship between the administrator and member accounts.
        @[JSON::Field(key: "relationshipStatus")]
        getter relationship_status : String?

        def initialize(
          @account_id : String? = nil,
          @invitation_id : String? = nil,
          @invited_at : String? = nil,
          @relationship_status : String? = nil
        )
        end
      end

      # Information about the installed GuardDuty security agent.
      struct AgentDetails
        include JSON::Serializable

        # Version of the installed GuardDuty security agent.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @version : String? = nil
        )
        end
      end

      # Contains information about the anomalies.
      struct Anomaly
        include JSON::Serializable

        # Information about the types of profiles.
        @[JSON::Field(key: "profiles")]
        getter profiles : Hash(String, Hash(String, Array(Types::AnomalyObject)))?

        # Information about the behavior of the anomalies.
        @[JSON::Field(key: "unusual")]
        getter unusual : Types::AnomalyUnusual?

        def initialize(
          @profiles : Hash(String, Hash(String, Array(Types::AnomalyObject)))? = nil,
          @unusual : Types::AnomalyUnusual? = nil
        )
        end
      end

      # Contains information about the unusual anomalies.
      struct AnomalyObject
        include JSON::Serializable

        # The recorded value.
        @[JSON::Field(key: "observations")]
        getter observations : Types::Observations?

        # The frequency of the anomaly.
        @[JSON::Field(key: "profileSubtype")]
        getter profile_subtype : String?

        # The type of behavior of the profile.
        @[JSON::Field(key: "profileType")]
        getter profile_type : String?

        def initialize(
          @observations : Types::Observations? = nil,
          @profile_subtype : String? = nil,
          @profile_type : String? = nil
        )
        end
      end

      # Contains information about the behavior of the anomaly that is new to GuardDuty.
      struct AnomalyUnusual
        include JSON::Serializable

        # The behavior of the anomalous activity that caused GuardDuty to generate the finding.
        @[JSON::Field(key: "behavior")]
        getter behavior : Hash(String, Hash(String, Types::AnomalyObject))?

        def initialize(
          @behavior : Hash(String, Hash(String, Types::AnomalyObject))? = nil
        )
        end
      end

      struct ArchiveFindingsRequest
        include JSON::Serializable

        # The ID of the detector that specifies the GuardDuty service whose findings you want to archive. To
        # find the detectorId in the current Region, see the Settings page in the GuardDuty console, or run
        # the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The IDs of the findings that you want to archive.
        @[JSON::Field(key: "findingIds")]
        getter finding_ids : Array(String)

        def initialize(
          @detector_id : String,
          @finding_ids : Array(String)
        )
        end
      end

      struct ArchiveFindingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about the Autonomous System (AS) associated with the network endpoints involved
      # in an attack sequence.
      struct AutonomousSystem
        include JSON::Serializable

        # Name associated with the Autonomous System (AS).
        @[JSON::Field(key: "name")]
        getter name : String

        # The unique number that identifies the Autonomous System (AS).
        @[JSON::Field(key: "number")]
        getter number : Int32

        def initialize(
          @name : String,
          @number : Int32
        )
        end
      end

      # Contains information about the Auto Scaling Group involved in a GuardDuty finding, including unique
      # identifiers of the Amazon EC2 instances.
      struct AutoscalingAutoScalingGroup
        include JSON::Serializable

        # A list of unique identifiers for the compromised Amazon EC2 instances that are part of the same Auto
        # Scaling Group.
        @[JSON::Field(key: "ec2InstanceUids")]
        getter ec2_instance_uids : Array(String)?

        def initialize(
          @ec2_instance_uids : Array(String)? = nil
        )
        end
      end

      # Contains information about the API action.
      struct AwsApiCallAction
        include JSON::Serializable

        # The details of the Amazon Web Services account that made the API call. This field identifies the
        # resources that were affected by this API call.
        @[JSON::Field(key: "affectedResources")]
        getter affected_resources : Hash(String, String)?

        # The Amazon Web Services API name.
        @[JSON::Field(key: "api")]
        getter api : String?

        # The Amazon Web Services API caller type.
        @[JSON::Field(key: "callerType")]
        getter caller_type : String?

        # The domain information for the Amazon Web Services API call.
        @[JSON::Field(key: "domainDetails")]
        getter domain_details : Types::DomainDetails?

        # The error code of the failed Amazon Web Services API action.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The details of the Amazon Web Services account that made the API call. This field appears if the
        # call was made from outside your account.
        @[JSON::Field(key: "remoteAccountDetails")]
        getter remote_account_details : Types::RemoteAccountDetails?

        # The remote IP information of the connection that initiated the Amazon Web Services API call.
        @[JSON::Field(key: "remoteIpDetails")]
        getter remote_ip_details : Types::RemoteIpDetails?

        # The Amazon Web Services service name whose API was invoked.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The agent through which the API request was made.
        @[JSON::Field(key: "userAgent")]
        getter user_agent : String?

        def initialize(
          @affected_resources : Hash(String, String)? = nil,
          @api : String? = nil,
          @caller_type : String? = nil,
          @domain_details : Types::DomainDetails? = nil,
          @error_code : String? = nil,
          @remote_account_details : Types::RemoteAccountDetails? = nil,
          @remote_ip_details : Types::RemoteIpDetails? = nil,
          @service_name : String? = nil,
          @user_agent : String? = nil
        )
        end
      end

      # A bad request exception object.
      struct BadRequestException
        include JSON::Serializable

        # The error message.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The error type.
        @[JSON::Field(key: "__type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains information on how the bucker owner's S3 Block Public Access settings are being applied to
      # the S3 bucket. See S3 Block Public Access for more information.
      struct BlockPublicAccess
        include JSON::Serializable

        # Indicates if S3 Block Public Access is set to BlockPublicAcls .
        @[JSON::Field(key: "blockPublicAcls")]
        getter block_public_acls : Bool?

        # Indicates if S3 Block Public Access is set to BlockPublicPolicy .
        @[JSON::Field(key: "blockPublicPolicy")]
        getter block_public_policy : Bool?

        # Indicates if S3 Block Public Access is set to IgnorePublicAcls .
        @[JSON::Field(key: "ignorePublicAcls")]
        getter ignore_public_acls : Bool?

        # Indicates if S3 Block Public Access is set to RestrictPublicBuckets .
        @[JSON::Field(key: "restrictPublicBuckets")]
        getter restrict_public_buckets : Bool?

        def initialize(
          @block_public_acls : Bool? = nil,
          @block_public_policy : Bool? = nil,
          @ignore_public_acls : Bool? = nil,
          @restrict_public_buckets : Bool? = nil
        )
        end
      end

      # Contains information about the bucket level permissions for the S3 bucket.
      struct BucketLevelPermissions
        include JSON::Serializable

        # Contains information on how Access Control Policies are applied to the bucket.
        @[JSON::Field(key: "accessControlList")]
        getter access_control_list : Types::AccessControlList?

        # Contains information on which account level S3 Block Public Access settings are applied to the S3
        # bucket.
        @[JSON::Field(key: "blockPublicAccess")]
        getter block_public_access : Types::BlockPublicAccess?

        # Contains information on the bucket policies for the S3 bucket.
        @[JSON::Field(key: "bucketPolicy")]
        getter bucket_policy : Types::BucketPolicy?

        def initialize(
          @access_control_list : Types::AccessControlList? = nil,
          @block_public_access : Types::BlockPublicAccess? = nil,
          @bucket_policy : Types::BucketPolicy? = nil
        )
        end
      end

      # Contains information on the current bucket policies for the S3 bucket.
      struct BucketPolicy
        include JSON::Serializable

        # A value that indicates whether public read access for the bucket is enabled through a bucket policy.
        @[JSON::Field(key: "allowsPublicReadAccess")]
        getter allows_public_read_access : Bool?

        # A value that indicates whether public write access for the bucket is enabled through a bucket
        # policy.
        @[JSON::Field(key: "allowsPublicWriteAccess")]
        getter allows_public_write_access : Bool?

        def initialize(
          @allows_public_read_access : Bool? = nil,
          @allows_public_write_access : Bool? = nil
        )
        end
      end

      # Contains information about the city associated with the IP address.
      struct City
        include JSON::Serializable

        # The city name of the remote IP address.
        @[JSON::Field(key: "cityName")]
        getter city_name : String?

        def initialize(
          @city_name : String? = nil
        )
        end
      end

      # Contains information on the status of CloudTrail as a data source for the detector.
      struct CloudTrailConfigurationResult
        include JSON::Serializable

        # Describes whether CloudTrail is enabled as a data source for the detector.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Contains information about the CloudFormation stack involved in a GuardDuty finding, including
      # unique identifiers of the Amazon EC2 instances.
      struct CloudformationStack
        include JSON::Serializable

        # A list of unique identifiers for the compromised Amazon EC2 instances that were created as part of
        # the same CloudFormation stack.
        @[JSON::Field(key: "ec2InstanceUids")]
        getter ec2_instance_uids : Array(String)?

        def initialize(
          @ec2_instance_uids : Array(String)? = nil
        )
        end
      end

      # Contains information about the condition.
      struct Condition
        include JSON::Serializable

        # Represents the equal condition to be applied to a single field when querying for findings.
        @[JSON::Field(key: "eq")]
        getter eq : Array(String)?

        # Represents an equal condition to be applied to a single field when querying for findings.
        @[JSON::Field(key: "equals")]
        getter equals : Array(String)?

        # Represents a greater than condition to be applied to a single field when querying for findings.
        @[JSON::Field(key: "greaterThan")]
        getter greater_than : Int64?

        # Represents a greater than or equal condition to be applied to a single field when querying for
        # findings.
        @[JSON::Field(key: "greaterThanOrEqual")]
        getter greater_than_or_equal : Int64?

        # Represents a greater than condition to be applied to a single field when querying for findings.
        @[JSON::Field(key: "gt")]
        getter gt : Int32?

        # Represents a greater than or equal condition to be applied to a single field when querying for
        # findings.
        @[JSON::Field(key: "gte")]
        getter gte : Int32?

        # Represents a less than condition to be applied to a single field when querying for findings.
        @[JSON::Field(key: "lessThan")]
        getter less_than : Int64?

        # Represents a less than or equal condition to be applied to a single field when querying for
        # findings.
        @[JSON::Field(key: "lessThanOrEqual")]
        getter less_than_or_equal : Int64?

        # Represents a less than condition to be applied to a single field when querying for findings.
        @[JSON::Field(key: "lt")]
        getter lt : Int32?

        # Represents a less than or equal condition to be applied to a single field when querying for
        # findings.
        @[JSON::Field(key: "lte")]
        getter lte : Int32?

        # Represents the match condition to be applied to a single field when querying for findings. The
        # matches condition is available only for create-filter and update-filter APIs.
        @[JSON::Field(key: "matches")]
        getter matches : Array(String)?

        # Represents the not equal condition to be applied to a single field when querying for findings.
        @[JSON::Field(key: "neq")]
        getter neq : Array(String)?

        # Represents a not equal condition to be applied to a single field when querying for findings.
        @[JSON::Field(key: "notEquals")]
        getter not_equals : Array(String)?

        # Represents the not match condition to be applied to a single field when querying for findings. The
        # not-matches condition is available only for create-filter and update-filter APIs.
        @[JSON::Field(key: "notMatches")]
        getter not_matches : Array(String)?

        def initialize(
          @eq : Array(String)? = nil,
          @equals : Array(String)? = nil,
          @greater_than : Int64? = nil,
          @greater_than_or_equal : Int64? = nil,
          @gt : Int32? = nil,
          @gte : Int32? = nil,
          @less_than : Int64? = nil,
          @less_than_or_equal : Int64? = nil,
          @lt : Int32? = nil,
          @lte : Int32? = nil,
          @matches : Array(String)? = nil,
          @neq : Array(String)? = nil,
          @not_equals : Array(String)? = nil,
          @not_matches : Array(String)? = nil
        )
        end
      end

      # A request conflict exception object.
      struct ConflictException
        include JSON::Serializable

        # The error message.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The error type.
        @[JSON::Field(key: "__type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Details of a container.
      struct Container
        include JSON::Serializable

        # The container runtime (such as, Docker or containerd) used to run the container.
        @[JSON::Field(key: "containerRuntime")]
        getter container_runtime : String?

        # Container ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Container image.
        @[JSON::Field(key: "image")]
        getter image : String?

        # Part of the image name before the last slash. For example, imagePrefix for
        # public.ecr.aws/amazonlinux/amazonlinux:latest would be public.ecr.aws/amazonlinux. If the image name
        # is relative and does not have a slash, this field is empty.
        @[JSON::Field(key: "imagePrefix")]
        getter image_prefix : String?

        # Container name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Container security context.
        @[JSON::Field(key: "securityContext")]
        getter security_context : Types::SecurityContext?

        # Container volume mounts.
        @[JSON::Field(key: "volumeMounts")]
        getter volume_mounts : Array(Types::VolumeMount)?

        def initialize(
          @container_runtime : String? = nil,
          @id : String? = nil,
          @image : String? = nil,
          @image_prefix : String? = nil,
          @name : String? = nil,
          @security_context : Types::SecurityContext? = nil,
          @volume_mounts : Array(Types::VolumeMount)? = nil
        )
        end
      end

      # Contains information about container resources involved in a GuardDuty finding. This structure
      # provides details about containers that were identified as part of suspicious or malicious activity.
      struct ContainerFindingResource
        include JSON::Serializable

        # The container image information, including the image name and tag used to run the container that was
        # involved in the finding.
        @[JSON::Field(key: "image")]
        getter image : String

        # The unique ID associated with the container image.
        @[JSON::Field(key: "imageUid")]
        getter image_uid : String?

        def initialize(
          @image : String,
          @image_uid : String? = nil
        )
        end
      end

      # Contains information about the Amazon EC2 instance that is running the Amazon ECS container.
      struct ContainerInstanceDetails
        include JSON::Serializable

        # Represents total number of nodes in the Amazon ECS cluster.
        @[JSON::Field(key: "compatibleContainerInstances")]
        getter compatible_container_instances : Int64?

        # Represents the nodes in the Amazon ECS cluster that has a HEALTHY coverage status.
        @[JSON::Field(key: "coveredContainerInstances")]
        getter covered_container_instances : Int64?

        def initialize(
          @compatible_container_instances : Int64? = nil,
          @covered_container_instances : Int64? = nil
        )
        end
      end

      # Contains information about the country where the remote IP address is located.
      struct Country
        include JSON::Serializable

        # The country code of the remote IP address.
        @[JSON::Field(key: "countryCode")]
        getter country_code : String?

        # The country name of the remote IP address.
        @[JSON::Field(key: "countryName")]
        getter country_name : String?

        def initialize(
          @country_code : String? = nil,
          @country_name : String? = nil
        )
        end
      end

      # Contains information about the Amazon EC2 instance runtime coverage details.
      struct CoverageEc2InstanceDetails
        include JSON::Serializable

        # Information about the installed security agent.
        @[JSON::Field(key: "agentDetails")]
        getter agent_details : Types::AgentDetails?

        # The cluster ARN of the Amazon ECS cluster running on the Amazon EC2 instance.
        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon EC2 instance ID.
        @[JSON::Field(key: "instanceId")]
        getter instance_id : String?

        # The instance type of the Amazon EC2 instance.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # Indicates how the GuardDuty security agent is managed for this resource. AUTO_MANAGED indicates that
        # GuardDuty deploys and manages updates for this resource. MANUAL indicates that you are responsible
        # to deploy, update, and manage the GuardDuty security agent updates for this resource. The DISABLED
        # status doesn't apply to Amazon EC2 instances and Amazon EKS clusters.
        @[JSON::Field(key: "managementType")]
        getter management_type : String?

        def initialize(
          @agent_details : Types::AgentDetails? = nil,
          @cluster_arn : String? = nil,
          @instance_id : String? = nil,
          @instance_type : String? = nil,
          @management_type : String? = nil
        )
        end
      end

      # Contains information about Amazon ECS cluster runtime coverage details.
      struct CoverageEcsClusterDetails
        include JSON::Serializable

        # The name of the Amazon ECS cluster.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # Information about the Amazon ECS container running on Amazon EC2 instance.
        @[JSON::Field(key: "containerInstanceDetails")]
        getter container_instance_details : Types::ContainerInstanceDetails?

        # Information about the Fargate details associated with the Amazon ECS cluster.
        @[JSON::Field(key: "fargateDetails")]
        getter fargate_details : Types::FargateDetails?

        def initialize(
          @cluster_name : String? = nil,
          @container_instance_details : Types::ContainerInstanceDetails? = nil,
          @fargate_details : Types::FargateDetails? = nil
        )
        end
      end

      # Information about the EKS cluster that has a coverage status.
      struct CoverageEksClusterDetails
        include JSON::Serializable

        # Information about the installed EKS add-on.
        @[JSON::Field(key: "addonDetails")]
        getter addon_details : Types::AddonDetails?

        # Name of the EKS cluster.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # Represents all the nodes within the EKS cluster in your account.
        @[JSON::Field(key: "compatibleNodes")]
        getter compatible_nodes : Int64?

        # Represents the nodes within the EKS cluster that have a HEALTHY coverage status.
        @[JSON::Field(key: "coveredNodes")]
        getter covered_nodes : Int64?

        # Indicates how the Amazon EKS add-on GuardDuty agent is managed for this EKS cluster. AUTO_MANAGED
        # indicates GuardDuty deploys and manages updates for this resource. MANUAL indicates that you are
        # responsible to deploy, update, and manage the Amazon EKS add-on GuardDuty agent for this resource.
        @[JSON::Field(key: "managementType")]
        getter management_type : String?

        def initialize(
          @addon_details : Types::AddonDetails? = nil,
          @cluster_name : String? = nil,
          @compatible_nodes : Int64? = nil,
          @covered_nodes : Int64? = nil,
          @management_type : String? = nil
        )
        end
      end

      # Represents a condition that when matched will be added to the response of the operation.
      struct CoverageFilterCondition
        include JSON::Serializable

        # Represents an equal condition that is applied to a single field while retrieving the coverage
        # details.
        @[JSON::Field(key: "equals")]
        getter equals : Array(String)?

        # Represents a not equal condition that is applied to a single field while retrieving the coverage
        # details.
        @[JSON::Field(key: "notEquals")]
        getter not_equals : Array(String)?

        def initialize(
          @equals : Array(String)? = nil,
          @not_equals : Array(String)? = nil
        )
        end
      end

      # Represents the criteria used in the filter.
      struct CoverageFilterCriteria
        include JSON::Serializable

        # Represents a condition that when matched will be added to the response of the operation.
        @[JSON::Field(key: "filterCriterion")]
        getter filter_criterion : Array(Types::CoverageFilterCriterion)?

        def initialize(
          @filter_criterion : Array(Types::CoverageFilterCriterion)? = nil
        )
        end
      end

      # Represents a condition that when matched will be added to the response of the operation.
      struct CoverageFilterCriterion
        include JSON::Serializable

        # An enum value representing possible filter fields. Replace the enum value CLUSTER_NAME with
        # EKS_CLUSTER_NAME . CLUSTER_NAME has been deprecated.
        @[JSON::Field(key: "criterionKey")]
        getter criterion_key : String?

        # Contains information about the condition.
        @[JSON::Field(key: "filterCondition")]
        getter filter_condition : Types::CoverageFilterCondition?

        def initialize(
          @criterion_key : String? = nil,
          @filter_condition : Types::CoverageFilterCondition? = nil
        )
        end
      end

      # Information about the resource of the GuardDuty account.
      struct CoverageResource
        include JSON::Serializable

        # The unique ID of the Amazon Web Services account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Represents the status of the EKS cluster coverage.
        @[JSON::Field(key: "coverageStatus")]
        getter coverage_status : String?

        # The unique ID of the GuardDuty detector associated with the resource.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # Represents the reason why a coverage status was UNHEALTHY for the EKS cluster.
        @[JSON::Field(key: "issue")]
        getter issue : String?

        # Information about the resource for which the coverage statistics are retrieved.
        @[JSON::Field(key: "resourceDetails")]
        getter resource_details : Types::CoverageResourceDetails?

        # The unique ID of the resource.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The timestamp at which the coverage details for the resource were last updated. This is in UTC
        # format.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @account_id : String? = nil,
          @coverage_status : String? = nil,
          @detector_id : String? = nil,
          @issue : String? = nil,
          @resource_details : Types::CoverageResourceDetails? = nil,
          @resource_id : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Information about the resource for each individual EKS cluster.
      struct CoverageResourceDetails
        include JSON::Serializable

        # Information about the Amazon EC2 instance assessed for runtime coverage.
        @[JSON::Field(key: "ec2InstanceDetails")]
        getter ec2_instance_details : Types::CoverageEc2InstanceDetails?

        # Information about the Amazon ECS cluster that is assessed for runtime coverage.
        @[JSON::Field(key: "ecsClusterDetails")]
        getter ecs_cluster_details : Types::CoverageEcsClusterDetails?

        # EKS cluster details involved in the coverage statistics.
        @[JSON::Field(key: "eksClusterDetails")]
        getter eks_cluster_details : Types::CoverageEksClusterDetails?

        # The type of Amazon Web Services resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @ec2_instance_details : Types::CoverageEc2InstanceDetails? = nil,
          @ecs_cluster_details : Types::CoverageEcsClusterDetails? = nil,
          @eks_cluster_details : Types::CoverageEksClusterDetails? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Information about the sorting criteria used in the coverage statistics.
      struct CoverageSortCriteria
        include JSON::Serializable

        # Represents the field name used to sort the coverage details. Replace the enum value CLUSTER_NAME
        # with EKS_CLUSTER_NAME . CLUSTER_NAME has been deprecated.
        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String?

        # The order in which the sorted findings are to be displayed.
        @[JSON::Field(key: "orderBy")]
        getter order_by : String?

        def initialize(
          @attribute_name : String? = nil,
          @order_by : String? = nil
        )
        end
      end

      # Information about the coverage statistics for a resource.
      struct CoverageStatistics
        include JSON::Serializable

        # Represents coverage statistics for EKS clusters aggregated by coverage status.
        @[JSON::Field(key: "countByCoverageStatus")]
        getter count_by_coverage_status : Hash(String, Int64)?

        # Represents coverage statistics for EKS clusters aggregated by resource type.
        @[JSON::Field(key: "countByResourceType")]
        getter count_by_resource_type : Hash(String, Int64)?

        def initialize(
          @count_by_coverage_status : Hash(String, Int64)? = nil,
          @count_by_resource_type : Hash(String, Int64)? = nil
        )
        end
      end

      struct CreateDetectorRequest
        include JSON::Serializable

        # A Boolean value that specifies whether the detector is to be enabled.
        @[JSON::Field(key: "enable")]
        getter enable : Bool

        # The idempotency token for the create request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Describes which data sources will be enabled for the detector. There might be regional differences
        # because some data sources might not be available in all the Amazon Web Services Regions where
        # GuardDuty is presently supported. For more information, see Regions and endpoints .
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Types::DataSourceConfigurations?

        # A list of features that will be configured for the detector.
        @[JSON::Field(key: "features")]
        getter features : Array(Types::DetectorFeatureConfiguration)?

        # A value that specifies how frequently updated findings are exported.
        @[JSON::Field(key: "findingPublishingFrequency")]
        getter finding_publishing_frequency : String?

        # The tags to be added to a new detector resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @enable : Bool,
          @client_token : String? = nil,
          @data_sources : Types::DataSourceConfigurations? = nil,
          @features : Array(Types::DetectorFeatureConfiguration)? = nil,
          @finding_publishing_frequency : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDetectorResponse
        include JSON::Serializable

        # The unique ID of the created detector.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # Specifies the data sources that couldn't be enabled when GuardDuty was enabled for the first time.
        @[JSON::Field(key: "unprocessedDataSources")]
        getter unprocessed_data_sources : Types::UnprocessedDataSourcesResult?

        def initialize(
          @detector_id : String? = nil,
          @unprocessed_data_sources : Types::UnprocessedDataSourcesResult? = nil
        )
        end
      end

      struct CreateFilterRequest
        include JSON::Serializable

        # The detector ID associated with the GuardDuty account for which you want to create a filter. To find
        # the detectorId in the current Region, see the Settings page in the GuardDuty console, or run the
        # ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # Represents the criteria to be used in the filter for querying findings. You can only use the
        # following attributes to query findings: accountId id region severity To filter on the basis of
        # severity, the API and CLI use the following input list for the FindingCriteria condition: Low :
        # ["1", "2", "3"] Medium : ["4", "5", "6"] High : ["7", "8"] Critical : ["9", "10"] For more
        # information, see Findings severity levels in the Amazon GuardDuty User Guide . type updatedAt Type:
        # ISO 8601 string format: YYYY-MM-DDTHH:MM:SS.SSSZ or YYYY-MM-DDTHH:MM:SSZ depending on whether the
        # value contains milliseconds. resource.accessKeyDetails.accessKeyId
        # resource.accessKeyDetails.principalId resource.accessKeyDetails.userName
        # resource.accessKeyDetails.userType resource.instanceDetails.iamInstanceProfile.id
        # resource.instanceDetails.imageId resource.instanceDetails.instanceId
        # resource.instanceDetails.tags.key resource.instanceDetails.tags.value
        # resource.instanceDetails.networkInterfaces.ipv6Addresses
        # resource.instanceDetails.networkInterfaces.privateIpAddresses.privateIpAddress
        # resource.instanceDetails.networkInterfaces.publicDnsName
        # resource.instanceDetails.networkInterfaces.publicIp
        # resource.instanceDetails.networkInterfaces.securityGroups.groupId
        # resource.instanceDetails.networkInterfaces.securityGroups.groupName
        # resource.instanceDetails.networkInterfaces.subnetId resource.instanceDetails.networkInterfaces.vpcId
        # resource.instanceDetails.outpostArn resource.resourceType
        # resource.s3BucketDetails.publicAccess.effectivePermissions resource.s3BucketDetails.name
        # resource.s3BucketDetails.tags.key resource.s3BucketDetails.tags.value resource.s3BucketDetails.type
        # service.action.actionType service.action.awsApiCallAction.api
        # service.action.awsApiCallAction.callerType service.action.awsApiCallAction.errorCode
        # service.action.awsApiCallAction.remoteIpDetails.city.cityName
        # service.action.awsApiCallAction.remoteIpDetails.country.countryName
        # service.action.awsApiCallAction.remoteIpDetails.ipAddressV4
        # service.action.awsApiCallAction.remoteIpDetails.ipAddressV6
        # service.action.awsApiCallAction.remoteIpDetails.organization.asn
        # service.action.awsApiCallAction.remoteIpDetails.organization.asnOrg
        # service.action.awsApiCallAction.serviceName service.action.dnsRequestAction.domain
        # service.action.dnsRequestAction.domainWithSuffix service.action.dnsRequestAction.vpcOwnerAccountId
        # service.action.networkConnectionAction.blocked
        # service.action.networkConnectionAction.connectionDirection
        # service.action.networkConnectionAction.localPortDetails.port
        # service.action.networkConnectionAction.protocol
        # service.action.networkConnectionAction.remoteIpDetails.city.cityName
        # service.action.networkConnectionAction.remoteIpDetails.country.countryName
        # service.action.networkConnectionAction.remoteIpDetails.ipAddressV4
        # service.action.networkConnectionAction.remoteIpDetails.ipAddressV6
        # service.action.networkConnectionAction.remoteIpDetails.organization.asn
        # service.action.networkConnectionAction.remoteIpDetails.organization.asnOrg
        # service.action.networkConnectionAction.remotePortDetails.port
        # service.action.awsApiCallAction.remoteAccountDetails.affiliated
        # service.action.kubernetesApiCallAction.remoteIpDetails.ipAddressV4
        # service.action.kubernetesApiCallAction.remoteIpDetails.ipAddressV6
        # service.action.kubernetesApiCallAction.namespace
        # service.action.kubernetesApiCallAction.remoteIpDetails.organization.asn
        # service.action.kubernetesApiCallAction.requestUri service.action.kubernetesApiCallAction.statusCode
        # service.action.networkConnectionAction.localIpDetails.ipAddressV4
        # service.action.networkConnectionAction.localIpDetails.ipAddressV6
        # service.action.networkConnectionAction.protocol service.action.awsApiCallAction.serviceName
        # service.action.awsApiCallAction.remoteAccountDetails.accountId service.additionalInfo.threatListName
        # service.resourceRole resource.eksClusterDetails.name
        # resource.kubernetesDetails.kubernetesWorkloadDetails.name
        # resource.kubernetesDetails.kubernetesWorkloadDetails.namespace
        # resource.kubernetesDetails.kubernetesUserDetails.username
        # resource.kubernetesDetails.kubernetesWorkloadDetails.containers.image
        # resource.kubernetesDetails.kubernetesWorkloadDetails.containers.imagePrefix
        # service.ebsVolumeScanDetails.scanId
        # service.ebsVolumeScanDetails.scanDetections.threatDetectedByName.threatNames.name
        # service.ebsVolumeScanDetails.scanDetections.threatDetectedByName.threatNames.severity
        # service.ebsVolumeScanDetails.scanDetections.threatDetectedByName.threatNames.filePaths.hash
        # resource.ecsClusterDetails.name resource.ecsClusterDetails.taskDetails.containers.image
        # resource.ecsClusterDetails.taskDetails.definitionArn resource.containerDetails.image
        # resource.rdsDbInstanceDetails.dbInstanceIdentifier resource.rdsDbInstanceDetails.dbClusterIdentifier
        # resource.rdsDbInstanceDetails.engine resource.rdsDbUserDetails.user
        # resource.rdsDbInstanceDetails.tags.key resource.rdsDbInstanceDetails.tags.value
        # service.runtimeDetails.process.executableSha256 service.runtimeDetails.process.name
        # service.runtimeDetails.process.executablePath resource.lambdaDetails.functionName
        # resource.lambdaDetails.functionArn resource.lambdaDetails.tags.key resource.lambdaDetails.tags.value
        @[JSON::Field(key: "findingCriteria")]
        getter finding_criteria : Types::FindingCriteria

        # The name of the filter. Valid characters include period (.), underscore (_), dash (-), and
        # alphanumeric characters. A whitespace is considered to be an invalid character.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies the action that is to be applied to the findings that match the filter.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The idempotency token for the create request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the filter. Valid characters include alphanumeric characters, and special
        # characters such as hyphen, period, colon, underscore, parentheses ( { } , [ ] , and ( ) ), forward
        # slash, horizontal tab, vertical tab, newline, form feed, return, and whitespace.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the position of the filter in the list of current filters. Also specifies the order in
        # which this filter is applied to the findings.
        @[JSON::Field(key: "rank")]
        getter rank : Int32?

        # The tags to be added to a new filter resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @detector_id : String,
          @finding_criteria : Types::FindingCriteria,
          @name : String,
          @action : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @rank : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateFilterResponse
        include JSON::Serializable

        # The name of the successfully created filter.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct CreateIPSetRequest
        include JSON::Serializable

        # A Boolean value that indicates whether GuardDuty is to start using the uploaded IPSet.
        @[JSON::Field(key: "activate")]
        getter activate : Bool

        # The unique ID of the detector of the GuardDuty account for which you want to create an IPSet. To
        # find the detectorId in the current Region, see the Settings page in the GuardDuty console, or run
        # the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The format of the file that contains the IPSet.
        @[JSON::Field(key: "format")]
        getter format : String

        # The URI of the file that contains the IPSet.
        @[JSON::Field(key: "location")]
        getter location : String

        # The user-friendly name to identify the IPSet. Allowed characters are alphanumeric, whitespace, dash
        # (-), and underscores (_).
        @[JSON::Field(key: "name")]
        getter name : String

        # The idempotency token for the create request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services account ID that owns the Amazon S3 bucket specified in the location
        # parameter.
        @[JSON::Field(key: "expectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The tags to be added to a new IP set resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @activate : Bool,
          @detector_id : String,
          @format : String,
          @location : String,
          @name : String,
          @client_token : String? = nil,
          @expected_bucket_owner : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateIPSetResponse
        include JSON::Serializable

        # The ID of the IPSet resource.
        @[JSON::Field(key: "ipSetId")]
        getter ip_set_id : String

        def initialize(
          @ip_set_id : String
        )
        end
      end

      struct CreateMalwareProtectionPlanRequest
        include JSON::Serializable

        # Information about the protected resource that is associated with the created Malware Protection
        # plan. Presently, S3Bucket is the only supported protected resource.
        @[JSON::Field(key: "protectedResource")]
        getter protected_resource : Types::CreateProtectedResource

        # Amazon Resource Name (ARN) of the IAM role that has the permissions to scan and add tags to the
        # associated protected resource.
        @[JSON::Field(key: "role")]
        getter role : String

        # Information about whether the tags will be added to the S3 object after scanning.
        @[JSON::Field(key: "actions")]
        getter actions : Types::MalwareProtectionPlanActions?

        # The idempotency token for the create request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Tags added to the Malware Protection plan resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @protected_resource : Types::CreateProtectedResource,
          @role : String,
          @actions : Types::MalwareProtectionPlanActions? = nil,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateMalwareProtectionPlanResponse
        include JSON::Serializable

        # A unique identifier associated with the Malware Protection plan resource.
        @[JSON::Field(key: "malwareProtectionPlanId")]
        getter malware_protection_plan_id : String?

        def initialize(
          @malware_protection_plan_id : String? = nil
        )
        end
      end

      struct CreateMembersRequest
        include JSON::Serializable

        # A list of account ID and email address pairs of the accounts that you want to associate with the
        # GuardDuty administrator account.
        @[JSON::Field(key: "accountDetails")]
        getter account_details : Array(Types::AccountDetail)

        # The unique ID of the detector of the GuardDuty account for which you want to associate member
        # accounts. To find the detectorId in the current Region, see the Settings page in the GuardDuty
        # console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @account_details : Array(Types::AccountDetail),
          @detector_id : String
        )
        end
      end

      struct CreateMembersResponse
        include JSON::Serializable

        # A list of objects that include the accountIds of the unprocessed accounts and a result string that
        # explains why each was unprocessed.
        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)

        def initialize(
          @unprocessed_accounts : Array(Types::UnprocessedAccount)
        )
        end
      end

      # Information about the protected resource that is associated with the created Malware Protection
      # plan. Presently, S3Bucket is the only supported protected resource.
      struct CreateProtectedResource
        include JSON::Serializable

        # Information about the protected S3 bucket resource.
        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : Types::CreateS3BucketResource?

        def initialize(
          @s3_bucket : Types::CreateS3BucketResource? = nil
        )
        end
      end

      struct CreatePublishingDestinationRequest
        include JSON::Serializable

        # The properties of the publishing destination, including the ARNs for the destination and the KMS key
        # used for encryption.
        @[JSON::Field(key: "destinationProperties")]
        getter destination_properties : Types::DestinationProperties

        # The type of resource for the publishing destination. Currently only Amazon S3 buckets are supported.
        @[JSON::Field(key: "destinationType")]
        getter destination_type : String

        # The ID of the GuardDuty detector associated with the publishing destination. To find the detectorId
        # in the current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The idempotency token for the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags to be added to a new publishing destination resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @destination_properties : Types::DestinationProperties,
          @destination_type : String,
          @detector_id : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreatePublishingDestinationResponse
        include JSON::Serializable

        # The ID of the publishing destination that is created.
        @[JSON::Field(key: "destinationId")]
        getter destination_id : String

        def initialize(
          @destination_id : String
        )
        end
      end

      # Information about the protected S3 bucket resource.
      struct CreateS3BucketResource
        include JSON::Serializable

        # Name of the S3 bucket.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # Information about the specified object prefixes. The S3 object will be scanned only if it belongs to
        # any of the specified object prefixes.
        @[JSON::Field(key: "objectPrefixes")]
        getter object_prefixes : Array(String)?

        def initialize(
          @bucket_name : String? = nil,
          @object_prefixes : Array(String)? = nil
        )
        end
      end

      struct CreateSampleFindingsRequest
        include JSON::Serializable

        # The ID of the detector for which you need to create sample findings. To find the detectorId in the
        # current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The types of sample findings to generate.
        @[JSON::Field(key: "findingTypes")]
        getter finding_types : Array(String)?

        def initialize(
          @detector_id : String,
          @finding_types : Array(String)? = nil
        )
        end
      end

      struct CreateSampleFindingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateThreatEntitySetRequest
        include JSON::Serializable

        # A boolean value that indicates whether GuardDuty should start using the uploaded threat entity set
        # to generate findings.
        @[JSON::Field(key: "activate")]
        getter activate : Bool

        # The unique ID of the detector of the GuardDuty account for which you want to create a threat entity
        # set. To find the detectorId in the current Region, see the Settings page in the GuardDuty console,
        # or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The format of the file that contains the threat entity set.
        @[JSON::Field(key: "format")]
        getter format : String

        # The URI of the file that contains the threat entity set. The format of the Location URL must be a
        # valid Amazon S3 URL format. Invalid URL formats will result in an error, regardless of whether you
        # activate the entity set or not. For more information about format of the location URLs, see Format
        # of location URL under Step 2: Adding trusted or threat intelligence data in the Amazon GuardDuty
        # User Guide .
        @[JSON::Field(key: "location")]
        getter location : String

        # A user-friendly name to identify the threat entity set. The name of your list can include lowercase
        # letters, uppercase letters, numbers, dash (-), and underscore (_).
        @[JSON::Field(key: "name")]
        getter name : String

        # The idempotency token for the create request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services account ID that owns the Amazon S3 bucket specified in the location
        # parameter.
        @[JSON::Field(key: "expectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The tags to be added to a new threat entity set resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @activate : Bool,
          @detector_id : String,
          @format : String,
          @location : String,
          @name : String,
          @client_token : String? = nil,
          @expected_bucket_owner : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateThreatEntitySetResponse
        include JSON::Serializable

        # The ID returned by GuardDuty after creation of the threat entity set resource.
        @[JSON::Field(key: "threatEntitySetId")]
        getter threat_entity_set_id : String

        def initialize(
          @threat_entity_set_id : String
        )
        end
      end

      struct CreateThreatIntelSetRequest
        include JSON::Serializable

        # A Boolean value that indicates whether GuardDuty is to start using the uploaded ThreatIntelSet.
        @[JSON::Field(key: "activate")]
        getter activate : Bool

        # The unique ID of the detector of the GuardDuty account for which you want to create a threatIntelSet
        # . To find the detectorId in the current Region, see the Settings page in the GuardDuty console, or
        # run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The format of the file that contains the ThreatIntelSet.
        @[JSON::Field(key: "format")]
        getter format : String

        # The URI of the file that contains the ThreatIntelSet.
        @[JSON::Field(key: "location")]
        getter location : String

        # A user-friendly ThreatIntelSet name displayed in all findings that are generated by activity that
        # involves IP addresses included in this ThreatIntelSet.
        @[JSON::Field(key: "name")]
        getter name : String

        # The idempotency token for the create request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services account ID that owns the Amazon S3 bucket specified in the location
        # parameter.
        @[JSON::Field(key: "expectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The tags to be added to a new threat list resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @activate : Bool,
          @detector_id : String,
          @format : String,
          @location : String,
          @name : String,
          @client_token : String? = nil,
          @expected_bucket_owner : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateThreatIntelSetResponse
        include JSON::Serializable

        # The ID of the ThreatIntelSet resource.
        @[JSON::Field(key: "threatIntelSetId")]
        getter threat_intel_set_id : String

        def initialize(
          @threat_intel_set_id : String
        )
        end
      end

      struct CreateTrustedEntitySetRequest
        include JSON::Serializable

        # A boolean value that indicates whether GuardDuty is to start using the uploaded trusted entity set.
        @[JSON::Field(key: "activate")]
        getter activate : Bool

        # The unique ID of the detector of the GuardDuty account for which you want to create a trusted entity
        # set. To find the detectorId in the current Region, see the Settings page in the GuardDuty console,
        # or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The format of the file that contains the trusted entity set.
        @[JSON::Field(key: "format")]
        getter format : String

        # The URI of the file that contains the threat entity set. The format of the Location URL must be a
        # valid Amazon S3 URL format. Invalid URL formats will result in an error, regardless of whether you
        # activate the entity set or not. For more information about format of the location URLs, see Format
        # of location URL under Step 2: Adding trusted or threat intelligence data in the Amazon GuardDuty
        # User Guide .
        @[JSON::Field(key: "location")]
        getter location : String

        # A user-friendly name to identify the trusted entity set. The name of your list can include lowercase
        # letters, uppercase letters, numbers, dash (-), and underscore (_).
        @[JSON::Field(key: "name")]
        getter name : String

        # The idempotency token for the create request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services account ID that owns the Amazon S3 bucket specified in the location
        # parameter.
        @[JSON::Field(key: "expectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The tags to be added to a new trusted entity set resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @activate : Bool,
          @detector_id : String,
          @format : String,
          @location : String,
          @name : String,
          @client_token : String? = nil,
          @expected_bucket_owner : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateTrustedEntitySetResponse
        include JSON::Serializable

        # The ID returned by GuardDuty after creation of the trusted entity set resource.
        @[JSON::Field(key: "trustedEntitySetId")]
        getter trusted_entity_set_id : String

        def initialize(
          @trusted_entity_set_id : String
        )
        end
      end

      # Contains information on the status of DNS logs as a data source.
      struct DNSLogsConfigurationResult
        include JSON::Serializable

        # Denotes whether DNS logs is enabled as a data source.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Contains information about which data sources are enabled.
      struct DataSourceConfigurations
        include JSON::Serializable

        # Describes whether any Kubernetes logs are enabled as data sources.
        @[JSON::Field(key: "kubernetes")]
        getter kubernetes : Types::KubernetesConfiguration?

        # Describes whether Malware Protection is enabled as a data source.
        @[JSON::Field(key: "malwareProtection")]
        getter malware_protection : Types::MalwareProtectionConfiguration?

        # Describes whether S3 data event logs are enabled as a data source.
        @[JSON::Field(key: "s3Logs")]
        getter s3_logs : Types::S3LogsConfiguration?

        def initialize(
          @kubernetes : Types::KubernetesConfiguration? = nil,
          @malware_protection : Types::MalwareProtectionConfiguration? = nil,
          @s3_logs : Types::S3LogsConfiguration? = nil
        )
        end
      end

      # Contains information on the status of data sources for the detector.
      struct DataSourceConfigurationsResult
        include JSON::Serializable

        # An object that contains information on the status of CloudTrail as a data source.
        @[JSON::Field(key: "cloudTrail")]
        getter cloud_trail : Types::CloudTrailConfigurationResult

        # An object that contains information on the status of DNS logs as a data source.
        @[JSON::Field(key: "dnsLogs")]
        getter dns_logs : Types::DNSLogsConfigurationResult

        # An object that contains information on the status of VPC flow logs as a data source.
        @[JSON::Field(key: "flowLogs")]
        getter flow_logs : Types::FlowLogsConfigurationResult

        # An object that contains information on the status of S3 Data event logs as a data source.
        @[JSON::Field(key: "s3Logs")]
        getter s3_logs : Types::S3LogsConfigurationResult

        # An object that contains information on the status of all Kubernetes data sources.
        @[JSON::Field(key: "kubernetes")]
        getter kubernetes : Types::KubernetesConfigurationResult?

        # Describes the configuration of Malware Protection data sources.
        @[JSON::Field(key: "malwareProtection")]
        getter malware_protection : Types::MalwareProtectionConfigurationResult?

        def initialize(
          @cloud_trail : Types::CloudTrailConfigurationResult,
          @dns_logs : Types::DNSLogsConfigurationResult,
          @flow_logs : Types::FlowLogsConfigurationResult,
          @s3_logs : Types::S3LogsConfigurationResult,
          @kubernetes : Types::KubernetesConfigurationResult? = nil,
          @malware_protection : Types::MalwareProtectionConfigurationResult? = nil
        )
        end
      end

      # Contains information about which data sources are enabled for the GuardDuty member account.
      struct DataSourceFreeTrial
        include JSON::Serializable

        # A value that specifies the number of days left to use each enabled data source.
        @[JSON::Field(key: "freeTrialDaysRemaining")]
        getter free_trial_days_remaining : Int32?

        def initialize(
          @free_trial_days_remaining : Int32? = nil
        )
        end
      end

      # Contains information about which data sources are enabled for the GuardDuty member account.
      struct DataSourcesFreeTrial
        include JSON::Serializable

        # Describes whether any Amazon Web Services CloudTrail management event logs are enabled as data
        # sources.
        @[JSON::Field(key: "cloudTrail")]
        getter cloud_trail : Types::DataSourceFreeTrial?

        # Describes whether any DNS logs are enabled as data sources.
        @[JSON::Field(key: "dnsLogs")]
        getter dns_logs : Types::DataSourceFreeTrial?

        # Describes whether any VPC Flow logs are enabled as data sources.
        @[JSON::Field(key: "flowLogs")]
        getter flow_logs : Types::DataSourceFreeTrial?

        # Describes whether any Kubernetes logs are enabled as data sources.
        @[JSON::Field(key: "kubernetes")]
        getter kubernetes : Types::KubernetesDataSourceFreeTrial?

        # Describes whether Malware Protection is enabled as a data source.
        @[JSON::Field(key: "malwareProtection")]
        getter malware_protection : Types::MalwareProtectionDataSourceFreeTrial?

        # Describes whether any S3 data event logs are enabled as data sources.
        @[JSON::Field(key: "s3Logs")]
        getter s3_logs : Types::DataSourceFreeTrial?

        def initialize(
          @cloud_trail : Types::DataSourceFreeTrial? = nil,
          @dns_logs : Types::DataSourceFreeTrial? = nil,
          @flow_logs : Types::DataSourceFreeTrial? = nil,
          @kubernetes : Types::KubernetesDataSourceFreeTrial? = nil,
          @malware_protection : Types::MalwareProtectionDataSourceFreeTrial? = nil,
          @s3_logs : Types::DataSourceFreeTrial? = nil
        )
        end
      end

      # Represents list a map of dates with a count of total findings generated on each date.
      struct DateStatistics
        include JSON::Serializable

        # The timestamp when the total findings count is observed. For example, Date would look like
        # "2024-09-05T17:00:00-07:00" whereas LastGeneratedAt would look like 2024-09-05T17:12:29-07:00".
        @[JSON::Field(key: "date")]
        getter date : Time?

        # The timestamp at which the last finding in the findings count, was generated.
        @[JSON::Field(key: "lastGeneratedAt")]
        getter last_generated_at : Time?

        # The severity of the findings generated on each date.
        @[JSON::Field(key: "severity")]
        getter severity : Float64?

        # The total number of findings that were generated per severity level on each date.
        @[JSON::Field(key: "totalFindings")]
        getter total_findings : Int32?

        def initialize(
          @date : Time? = nil,
          @last_generated_at : Time? = nil,
          @severity : Float64? = nil,
          @total_findings : Int32? = nil
        )
        end
      end

      struct DeclineInvitationsRequest
        include JSON::Serializable

        # A list of account IDs of the Amazon Web Services accounts that sent invitations to the current
        # member account that you want to decline invitations from.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        def initialize(
          @account_ids : Array(String)
        )
        end
      end

      struct DeclineInvitationsResponse
        include JSON::Serializable

        # A list of objects that contain the unprocessed account and a result string that explains why it was
        # unprocessed.
        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)

        def initialize(
          @unprocessed_accounts : Array(Types::UnprocessedAccount)
        )
        end
      end

      # Contains information on the server side encryption method used in the S3 bucket. See S3 Server-Side
      # Encryption for more information.
      struct DefaultServerSideEncryption
        include JSON::Serializable

        # The type of encryption used for objects within the S3 bucket.
        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String?

        # The Amazon Resource Name (ARN) of the KMS encryption key. Only available if the bucket
        # EncryptionType is aws:kms .
        @[JSON::Field(key: "kmsMasterKeyArn")]
        getter kms_master_key_arn : String?

        def initialize(
          @encryption_type : String? = nil,
          @kms_master_key_arn : String? = nil
        )
        end
      end

      struct DeleteDetectorRequest
        include JSON::Serializable

        # The unique ID of the detector that you want to delete. To find the detectorId in the current Region,
        # see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @detector_id : String
        )
        end
      end

      struct DeleteDetectorResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteFilterRequest
        include JSON::Serializable

        # The unique ID of the detector that is associated with the filter. To find the detectorId in the
        # current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The name of the filter that you want to delete.
        @[JSON::Field(key: "filterName")]
        getter filter_name : String

        def initialize(
          @detector_id : String,
          @filter_name : String
        )
        end
      end

      struct DeleteFilterResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteIPSetRequest
        include JSON::Serializable

        # The unique ID of the detector associated with the IPSet. To find the detectorId in the current
        # Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The unique ID of the IPSet to delete.
        @[JSON::Field(key: "ipSetId")]
        getter ip_set_id : String

        def initialize(
          @detector_id : String,
          @ip_set_id : String
        )
        end
      end

      struct DeleteIPSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteInvitationsRequest
        include JSON::Serializable

        # A list of account IDs of the Amazon Web Services accounts that sent invitations to the current
        # member account that you want to delete invitations from.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        def initialize(
          @account_ids : Array(String)
        )
        end
      end

      struct DeleteInvitationsResponse
        include JSON::Serializable

        # A list of objects that contain the unprocessed account and a result string that explains why it was
        # unprocessed.
        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)

        def initialize(
          @unprocessed_accounts : Array(Types::UnprocessedAccount)
        )
        end
      end

      struct DeleteMalwareProtectionPlanRequest
        include JSON::Serializable

        # A unique identifier associated with Malware Protection plan resource.
        @[JSON::Field(key: "malwareProtectionPlanId")]
        getter malware_protection_plan_id : String

        def initialize(
          @malware_protection_plan_id : String
        )
        end
      end

      struct DeleteMembersRequest
        include JSON::Serializable

        # A list of account IDs of the GuardDuty member accounts that you want to delete.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # The unique ID of the detector of the GuardDuty account whose members you want to delete. To find the
        # detectorId in the current Region, see the Settings page in the GuardDuty console, or run the
        # ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @account_ids : Array(String),
          @detector_id : String
        )
        end
      end

      struct DeleteMembersResponse
        include JSON::Serializable

        # The accounts that could not be processed.
        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)

        def initialize(
          @unprocessed_accounts : Array(Types::UnprocessedAccount)
        )
        end
      end

      struct DeletePublishingDestinationRequest
        include JSON::Serializable

        # The ID of the publishing destination to delete.
        @[JSON::Field(key: "destinationId")]
        getter destination_id : String

        # The unique ID of the detector associated with the publishing destination to delete. To find the
        # detectorId in the current Region, see the Settings page in the GuardDuty console, or run the
        # ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @destination_id : String,
          @detector_id : String
        )
        end
      end

      struct DeletePublishingDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteThreatEntitySetRequest
        include JSON::Serializable

        # The unique ID of the detector associated with the threat entity set resource. To find the detectorId
        # in the current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The unique ID that helps GuardDuty identify which threat entity set needs to be deleted.
        @[JSON::Field(key: "threatEntitySetId")]
        getter threat_entity_set_id : String

        def initialize(
          @detector_id : String,
          @threat_entity_set_id : String
        )
        end
      end

      struct DeleteThreatEntitySetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteThreatIntelSetRequest
        include JSON::Serializable

        # The unique ID of the detector that is associated with the threatIntelSet. To find the detectorId in
        # the current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The unique ID of the threatIntelSet that you want to delete.
        @[JSON::Field(key: "threatIntelSetId")]
        getter threat_intel_set_id : String

        def initialize(
          @detector_id : String,
          @threat_intel_set_id : String
        )
        end
      end

      struct DeleteThreatIntelSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteTrustedEntitySetRequest
        include JSON::Serializable

        # The unique ID of the detector associated with the trusted entity set resource. To find the
        # detectorId in the current Region, see the Settings page in the GuardDuty console, or run the
        # ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The unique ID that helps GuardDuty identify which trusted entity set needs to be deleted.
        @[JSON::Field(key: "trustedEntitySetId")]
        getter trusted_entity_set_id : String

        def initialize(
          @detector_id : String,
          @trusted_entity_set_id : String
        )
        end
      end

      struct DeleteTrustedEntitySetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeMalwareScansRequest
        include JSON::Serializable

        # The unique ID of the detector that the request is associated with. To find the detectorId in the
        # current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # Represents the criteria to be used in the filter for describing scan entries.
        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::FilterCriteria?

        # You can use this parameter to indicate the maximum number of items that you want in the response.
        # The default value is 50. The maximum value is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Represents the criteria used for sorting scan entries. The attributeName is required and it must be
        # scanStartTime .
        @[JSON::Field(key: "sortCriteria")]
        getter sort_criteria : Types::SortCriteria?

        def initialize(
          @detector_id : String,
          @filter_criteria : Types::FilterCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_criteria : Types::SortCriteria? = nil
        )
        end
      end

      struct DescribeMalwareScansResponse
        include JSON::Serializable

        # Contains information about malware scans associated with GuardDuty Malware Protection for EC2.
        @[JSON::Field(key: "scans")]
        getter scans : Array(Types::Scan)

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @scans : Array(Types::Scan),
          @next_token : String? = nil
        )
        end
      end

      struct DescribeOrganizationConfigurationRequest
        include JSON::Serializable

        # The detector ID of the delegated administrator for which you need to retrieve the information. To
        # find the detectorId in the current Region, see the Settings page in the GuardDuty console, or run
        # the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # You can use this parameter to indicate the maximum number of items that you want in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeOrganizationConfigurationResponse
        include JSON::Serializable

        # Indicates whether the maximum number of allowed member accounts are already associated with the
        # delegated administrator account for your organization.
        @[JSON::Field(key: "memberAccountLimitReached")]
        getter member_account_limit_reached : Bool

        # Indicates whether GuardDuty is automatically enabled for accounts added to the organization. Even
        # though this is still supported, we recommend using AutoEnableOrganizationMembers to achieve the
        # similar results.
        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Bool?

        # Indicates the auto-enablement configuration of GuardDuty or any of the corresponding protection
        # plans for the member accounts in the organization. NEW : Indicates that when a new account joins the
        # organization, they will have GuardDuty or any of the corresponding protection plans enabled
        # automatically. ALL : Indicates that all accounts in the organization have GuardDuty and any of the
        # corresponding protection plans enabled automatically. This includes NEW accounts that join the
        # organization and accounts that may have been suspended or removed from the organization in
        # GuardDuty. NONE : Indicates that GuardDuty or any of the corresponding protection plans will not be
        # automatically enabled for any account in the organization. The administrator must manage GuardDuty
        # for each account in the organization individually. When you update the auto-enable setting from ALL
        # or NEW to NONE , this action doesn't disable the corresponding option for your existing accounts.
        # This configuration will apply to the new accounts that join the organization. After you update the
        # auto-enable settings, no new account will have the corresponding option as enabled.
        @[JSON::Field(key: "autoEnableOrganizationMembers")]
        getter auto_enable_organization_members : String?

        # Describes which data sources are enabled automatically for member accounts.
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Types::OrganizationDataSourceConfigurationsResult?

        # A list of features that are configured for this organization.
        @[JSON::Field(key: "features")]
        getter features : Array(Types::OrganizationFeatureConfigurationResult)?

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @member_account_limit_reached : Bool,
          @auto_enable : Bool? = nil,
          @auto_enable_organization_members : String? = nil,
          @data_sources : Types::OrganizationDataSourceConfigurationsResult? = nil,
          @features : Array(Types::OrganizationFeatureConfigurationResult)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribePublishingDestinationRequest
        include JSON::Serializable

        # The ID of the publishing destination to retrieve.
        @[JSON::Field(key: "destinationId")]
        getter destination_id : String

        # The unique ID of the detector associated with the publishing destination to retrieve. To find the
        # detectorId in the current Region, see the Settings page in the GuardDuty console, or run the
        # ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @destination_id : String,
          @detector_id : String
        )
        end
      end

      struct DescribePublishingDestinationResponse
        include JSON::Serializable

        # The ID of the publishing destination.
        @[JSON::Field(key: "destinationId")]
        getter destination_id : String

        # A DestinationProperties object that includes the DestinationArn and KmsKeyArn of the publishing
        # destination.
        @[JSON::Field(key: "destinationProperties")]
        getter destination_properties : Types::DestinationProperties

        # The type of publishing destination. Currently, only Amazon S3 buckets are supported.
        @[JSON::Field(key: "destinationType")]
        getter destination_type : String

        # The time, in epoch millisecond format, at which GuardDuty was first unable to publish findings to
        # the destination.
        @[JSON::Field(key: "publishingFailureStartTimestamp")]
        getter publishing_failure_start_timestamp : Int64

        # The status of the publishing destination.
        @[JSON::Field(key: "status")]
        getter status : String

        # The tags of the publishing destination resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @destination_id : String,
          @destination_properties : Types::DestinationProperties,
          @destination_type : String,
          @publishing_failure_start_timestamp : Int64,
          @status : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains information about the publishing destination, including the ID, type, and status.
      struct Destination
        include JSON::Serializable

        # The unique ID of the publishing destination.
        @[JSON::Field(key: "destinationId")]
        getter destination_id : String

        # The type of resource used for the publishing destination. Currently, only Amazon S3 buckets are
        # supported.
        @[JSON::Field(key: "destinationType")]
        getter destination_type : String

        # The status of the publishing destination.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @destination_id : String,
          @destination_type : String,
          @status : String
        )
        end
      end

      # Contains the Amazon Resource Name (ARN) of the resource to publish to, such as an S3 bucket, and the
      # ARN of the KMS key to use to encrypt published findings.
      struct DestinationProperties
        include JSON::Serializable

        # The ARN of the resource to publish to. To specify an S3 bucket folder use the following format:
        # arn:aws:s3:::DOC-EXAMPLE-BUCKET/myFolder/
        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String?

        # The ARN of the KMS key to use for encryption.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @destination_arn : String? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end

      # Contains information about the detected behavior.
      struct Detection
        include JSON::Serializable

        # The details about the anomalous activity that caused GuardDuty to generate the finding.
        @[JSON::Field(key: "anomaly")]
        getter anomaly : Types::Anomaly?

        # The details about the attack sequence.
        @[JSON::Field(key: "sequence")]
        getter sequence : Types::Sequence?

        def initialize(
          @anomaly : Types::Anomaly? = nil,
          @sequence : Types::Sequence? = nil
        )
        end
      end

      # Information about the additional configuration for a feature in your GuardDuty account.
      struct DetectorAdditionalConfiguration
        include JSON::Serializable

        # Name of the additional configuration.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Status of the additional configuration.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about the additional configuration.
      struct DetectorAdditionalConfigurationResult
        include JSON::Serializable

        # Name of the additional configuration.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Status of the additional configuration.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp at which the additional configuration was last updated. This is in UTC format.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @name : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Contains information about a GuardDuty feature. Specifying both EKS Runtime Monitoring (
      # EKS_RUNTIME_MONITORING ) and Runtime Monitoring ( RUNTIME_MONITORING ) will cause an error. You can
      # add only one of these two features because Runtime Monitoring already includes the threat detection
      # for Amazon EKS resources. For more information, see Runtime Monitoring .
      struct DetectorFeatureConfiguration
        include JSON::Serializable

        # Additional configuration for a resource.
        @[JSON::Field(key: "additionalConfiguration")]
        getter additional_configuration : Array(Types::DetectorAdditionalConfiguration)?

        # The name of the feature.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the feature.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @additional_configuration : Array(Types::DetectorAdditionalConfiguration)? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about a GuardDuty feature. Specifying both EKS Runtime Monitoring (
      # EKS_RUNTIME_MONITORING ) and Runtime Monitoring ( RUNTIME_MONITORING ) will cause an error. You can
      # add only one of these two features because Runtime Monitoring already includes the threat detection
      # for Amazon EKS resources. For more information, see Runtime Monitoring .
      struct DetectorFeatureConfigurationResult
        include JSON::Serializable

        # Additional configuration for a resource.
        @[JSON::Field(key: "additionalConfiguration")]
        getter additional_configuration : Array(Types::DetectorAdditionalConfigurationResult)?

        # Indicates the name of the feature that can be enabled for the detector.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Indicates the status of the feature that is enabled for the detector.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp at which the feature object was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @additional_configuration : Array(Types::DetectorAdditionalConfigurationResult)? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct DisableOrganizationAdminAccountRequest
        include JSON::Serializable

        # The Amazon Web Services Account ID for the organizations account to be disabled as a GuardDuty
        # delegated administrator.
        @[JSON::Field(key: "adminAccountId")]
        getter admin_account_id : String

        def initialize(
          @admin_account_id : String
        )
        end
      end

      struct DisableOrganizationAdminAccountResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateFromAdministratorAccountRequest
        include JSON::Serializable

        # The unique ID of the detector of the GuardDuty member account.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @detector_id : String
        )
        end
      end

      struct DisassociateFromAdministratorAccountResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateFromMasterAccountRequest
        include JSON::Serializable

        # The unique ID of the detector of the GuardDuty member account.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @detector_id : String
        )
        end
      end

      struct DisassociateFromMasterAccountResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateMembersRequest
        include JSON::Serializable

        # A list of account IDs of the GuardDuty member accounts that you want to disassociate from the
        # administrator account.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # The unique ID of the detector of the GuardDuty account whose members you want to disassociate from
        # the administrator account.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @account_ids : Array(String),
          @detector_id : String
        )
        end
      end

      struct DisassociateMembersResponse
        include JSON::Serializable

        # A list of objects that contain the unprocessed account and a result string that explains why it was
        # unprocessed.
        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)

        def initialize(
          @unprocessed_accounts : Array(Types::UnprocessedAccount)
        )
        end
      end

      # Contains information about the DNS_REQUEST action described in this finding.
      struct DnsRequestAction
        include JSON::Serializable

        # Indicates whether the targeted port is blocked.
        @[JSON::Field(key: "blocked")]
        getter blocked : Bool?

        # The domain information for the DNS query.
        @[JSON::Field(key: "domain")]
        getter domain : String?

        # The second and top level domain involved in the activity that potentially prompted GuardDuty to
        # generate this finding. For a list of top-level and second-level domains, see public suffix list .
        @[JSON::Field(key: "domainWithSuffix")]
        getter domain_with_suffix : String?

        # The network connection protocol observed in the activity that prompted GuardDuty to generate the
        # finding.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The Amazon Web Services account ID that owns the VPC through which the DNS request was made.
        @[JSON::Field(key: "vpcOwnerAccountId")]
        getter vpc_owner_account_id : String?

        def initialize(
          @blocked : Bool? = nil,
          @domain : String? = nil,
          @domain_with_suffix : String? = nil,
          @protocol : String? = nil,
          @vpc_owner_account_id : String? = nil
        )
        end
      end

      # Contains information about the domain.
      struct DomainDetails
        include JSON::Serializable

        # The domain information for the Amazon Web Services API call.
        @[JSON::Field(key: "domain")]
        getter domain : String?

        def initialize(
          @domain : String? = nil
        )
        end
      end

      # Contains information about an EBS snapshot that was scanned for malware.
      struct EbsSnapshot
        include JSON::Serializable

        # The device name of the EBS snapshot that was scanned.
        @[JSON::Field(key: "deviceName")]
        getter device_name : String?

        def initialize(
          @device_name : String? = nil
        )
        end
      end

      # Contains details about the EBS snapshot that was scanned for malware.
      struct EbsSnapshotDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the EBS snapshot.
        @[JSON::Field(key: "snapshotArn")]
        getter snapshot_arn : String?

        def initialize(
          @snapshot_arn : String? = nil
        )
        end
      end

      # Contains list of scanned and skipped EBS volumes with details.
      struct EbsVolumeDetails
        include JSON::Serializable

        # List of EBS volumes that were scanned.
        @[JSON::Field(key: "scannedVolumeDetails")]
        getter scanned_volume_details : Array(Types::VolumeDetail)?

        # List of EBS volumes that were skipped from the malware scan.
        @[JSON::Field(key: "skippedVolumeDetails")]
        getter skipped_volume_details : Array(Types::VolumeDetail)?

        def initialize(
          @scanned_volume_details : Array(Types::VolumeDetail)? = nil,
          @skipped_volume_details : Array(Types::VolumeDetail)? = nil
        )
        end
      end

      # Contains details from the malware scan that created a finding.
      struct EbsVolumeScanDetails
        include JSON::Serializable

        # Returns the completion date and time of the malware scan.
        @[JSON::Field(key: "scanCompletedAt")]
        getter scan_completed_at : Time?

        # Contains a complete view providing malware scan result details.
        @[JSON::Field(key: "scanDetections")]
        getter scan_detections : Types::ScanDetections?

        # Unique Id of the malware scan that generated the finding.
        @[JSON::Field(key: "scanId")]
        getter scan_id : String?

        # Returns the start date and time of the malware scan.
        @[JSON::Field(key: "scanStartedAt")]
        getter scan_started_at : Time?

        # Specifies the scan type that invoked the malware scan.
        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        # Contains list of threat intelligence sources used to detect threats.
        @[JSON::Field(key: "sources")]
        getter sources : Array(String)?

        # GuardDuty finding ID that triggered a malware scan.
        @[JSON::Field(key: "triggerFindingId")]
        getter trigger_finding_id : String?

        def initialize(
          @scan_completed_at : Time? = nil,
          @scan_detections : Types::ScanDetections? = nil,
          @scan_id : String? = nil,
          @scan_started_at : Time? = nil,
          @scan_type : String? = nil,
          @sources : Array(String)? = nil,
          @trigger_finding_id : String? = nil
        )
        end
      end

      # Describes the configuration of scanning EBS volumes as a data source.
      struct EbsVolumesResult
        include JSON::Serializable

        # Specifies the reason why scanning EBS volumes (Malware Protection) was not enabled as a data source.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # Describes whether scanning EBS volumes is enabled as a data source.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about the Amazon EC2 Image involved in a GuardDuty finding, including unique
      # identifiers of the Amazon EC2 instances.
      struct Ec2Image
        include JSON::Serializable

        # A list of unique identifiers for the compromised Amazon EC2 instances that were launched with the
        # same Amazon Machine Image (AMI).
        @[JSON::Field(key: "ec2InstanceUids")]
        getter ec2_instance_uids : Array(String)?

        def initialize(
          @ec2_instance_uids : Array(String)? = nil
        )
        end
      end

      # Contains details about the EC2 AMI that was scanned.
      struct Ec2ImageDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the EC2 AMI.
        @[JSON::Field(key: "imageArn")]
        getter image_arn : String?

        def initialize(
          @image_arn : String? = nil
        )
        end
      end

      # Details about the potentially impacted Amazon EC2 instance resource.
      struct Ec2Instance
        include JSON::Serializable

        # The availability zone of the Amazon EC2 instance. For more information, see Availability zones in
        # the Amazon EC2 User Guide .
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The ID of the network interface.
        @[JSON::Field(key: "ec2NetworkInterfaceUids")]
        getter ec2_network_interface_uids : Array(String)?

        @[JSON::Field(key: "IamInstanceProfile")]
        getter iam_instance_profile : Types::IamInstanceProfile?

        # The image description of the Amazon EC2 instance.
        @[JSON::Field(key: "imageDescription")]
        getter image_description : String?

        # The state of the Amazon EC2 instance. For more information, see Amazon EC2 instance state changes in
        # the Amazon EC2 User Guide .
        @[JSON::Field(key: "instanceState")]
        getter instance_state : String?

        # Type of the Amazon EC2 instance.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The Amazon Resource Name (ARN) of the Amazon Web Services Outpost. This shows applicable Amazon Web
        # Services Outposts instances.
        @[JSON::Field(key: "outpostArn")]
        getter outpost_arn : String?

        # The platform of the Amazon EC2 instance.
        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The product code of the Amazon EC2 instance.
        @[JSON::Field(key: "productCodes")]
        getter product_codes : Array(Types::ProductCode)?

        def initialize(
          @availability_zone : String? = nil,
          @ec2_network_interface_uids : Array(String)? = nil,
          @iam_instance_profile : Types::IamInstanceProfile? = nil,
          @image_description : String? = nil,
          @instance_state : String? = nil,
          @instance_type : String? = nil,
          @outpost_arn : String? = nil,
          @platform : String? = nil,
          @product_codes : Array(Types::ProductCode)? = nil
        )
        end
      end

      # Contains information about the Amazon EC2 launch template involved in a GuardDuty finding, including
      # unique identifiers of the Amazon EC2 instances.
      struct Ec2LaunchTemplate
        include JSON::Serializable

        # A list of unique identifiers for the compromised Amazon EC2 instances that share the same Amazon EC2
        # launch template.
        @[JSON::Field(key: "ec2InstanceUids")]
        getter ec2_instance_uids : Array(String)?

        # Version of the EC2 launch template.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @ec2_instance_uids : Array(String)? = nil,
          @version : String? = nil
        )
        end
      end

      # Contains information about the elastic network interface of the Amazon EC2 instance.
      struct Ec2NetworkInterface
        include JSON::Serializable

        # A list of IPv6 addresses for the Amazon EC2 instance.
        @[JSON::Field(key: "ipv6Addresses")]
        getter ipv6_addresses : Array(String)?

        # Other private IP address information of the Amazon EC2 instance.
        @[JSON::Field(key: "privateIpAddresses")]
        getter private_ip_addresses : Array(Types::PrivateIpAddressDetails)?

        # The public IP address of the Amazon EC2 instance.
        @[JSON::Field(key: "publicIp")]
        getter public_ip : String?

        # The security groups associated with the Amazon EC2 instance.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(Types::SecurityGroup)?

        # The subnet ID of the Amazon EC2 instance.
        @[JSON::Field(key: "subNetId")]
        getter sub_net_id : String?

        # The VPC ID of the Amazon EC2 instance.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @ipv6_addresses : Array(String)? = nil,
          @private_ip_addresses : Array(Types::PrivateIpAddressDetails)? = nil,
          @public_ip : String? = nil,
          @security_groups : Array(Types::SecurityGroup)? = nil,
          @sub_net_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Contains information about the Amazon EC2 VPC involved in a GuardDuty finding, including unique
      # identifiers of the Amazon EC2 instances.
      struct Ec2Vpc
        include JSON::Serializable

        # A list of unique identifiers for the compromised Amazon EC2 instances that were launched within the
        # same Virtual Private Cloud (VPC).
        @[JSON::Field(key: "ec2InstanceUids")]
        getter ec2_instance_uids : Array(String)?

        def initialize(
          @ec2_instance_uids : Array(String)? = nil
        )
        end
      end

      # Contains information about the Amazon ECS cluster involved in a GuardDuty finding, including cluster
      # identification and status.
      struct EcsCluster
        include JSON::Serializable

        # A list of unique identifiers for the Amazon EC2 instances that serve as container instances in the
        # Amazon ECS cluster.
        @[JSON::Field(key: "ec2InstanceUids")]
        getter ec2_instance_uids : Array(String)?

        # The current status of the Amazon ECS cluster.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @ec2_instance_uids : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about the details of the ECS Cluster.
      struct EcsClusterDetails
        include JSON::Serializable

        # The number of services that are running on the cluster in an ACTIVE state.
        @[JSON::Field(key: "activeServicesCount")]
        getter active_services_count : Int32?

        # The Amazon Resource Name (ARN) that identifies the cluster.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the ECS Cluster.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The number of container instances registered into the cluster.
        @[JSON::Field(key: "registeredContainerInstancesCount")]
        getter registered_container_instances_count : Int32?

        # The number of tasks in the cluster that are in the RUNNING state.
        @[JSON::Field(key: "runningTasksCount")]
        getter running_tasks_count : Int32?

        # The status of the ECS cluster.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags of the ECS Cluster.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # Contains information about the details of the ECS Task.
        @[JSON::Field(key: "taskDetails")]
        getter task_details : Types::EcsTaskDetails?

        def initialize(
          @active_services_count : Int32? = nil,
          @arn : String? = nil,
          @name : String? = nil,
          @registered_container_instances_count : Int32? = nil,
          @running_tasks_count : Int32? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @task_details : Types::EcsTaskDetails? = nil
        )
        end
      end

      # Contains information about Amazon ECS task involved in a GuardDuty finding, including task
      # definition and container identifiers.
      struct EcsTask
        include JSON::Serializable

        # A list of unique identifiers for the containers associated with the Amazon ECS task.
        @[JSON::Field(key: "containerUids")]
        getter container_uids : Array(String)?

        # The timestamp indicating when the Amazon ECS task was created, in UTC format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The infrastructure type on which the Amazon ECS task runs.
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # The ARN of task definition which describes the container and volume definitions of the Amazon ECS
        # task.
        @[JSON::Field(key: "taskDefinitionArn")]
        getter task_definition_arn : String?

        def initialize(
          @container_uids : Array(String)? = nil,
          @created_at : Time? = nil,
          @launch_type : String? = nil,
          @task_definition_arn : String? = nil
        )
        end
      end

      # Contains information about the task in an ECS cluster.
      struct EcsTaskDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the task.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The containers that's associated with the task.
        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::Container)?

        # The ARN of the task definition that creates the task.
        @[JSON::Field(key: "definitionArn")]
        getter definition_arn : String?

        # The name of the task group that's associated with the task.
        @[JSON::Field(key: "group")]
        getter group : String?

        # A capacity on which the task is running. For example, Fargate and EC2 .
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # The Unix timestamp for the time when the task started.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # Contains the tag specified when a task is started.
        @[JSON::Field(key: "startedBy")]
        getter started_by : String?

        # The tags of the ECS Task.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The Unix timestamp for the time when the task was created.
        @[JSON::Field(key: "createdAt")]
        getter task_created_at : Time?

        # The version counter for the task.
        @[JSON::Field(key: "version")]
        getter version : String?

        # The list of data volume definitions for the task.
        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::Volume)?

        def initialize(
          @arn : String? = nil,
          @containers : Array(Types::Container)? = nil,
          @definition_arn : String? = nil,
          @group : String? = nil,
          @launch_type : String? = nil,
          @started_at : Time? = nil,
          @started_by : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @task_created_at : Time? = nil,
          @version : String? = nil,
          @volumes : Array(Types::Volume)? = nil
        )
        end
      end

      # Contains information about the Amazon EKS cluster involved in a GuardDuty finding, including cluster
      # identification, status, and network configuration.
      struct EksCluster
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that uniquely identifies the Amazon EKS cluster involved in the
        # finding.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp indicating when the Amazon EKS cluster was created, in UTC format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # A list of unique identifiers for the Amazon EC2 instances that serve as worker nodes in the Amazon
        # EKS cluster.
        @[JSON::Field(key: "ec2InstanceUids")]
        getter ec2_instance_uids : Array(String)?

        # The current status of the Amazon EKS cluster.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the Amazon Virtual Private Cloud (Amazon VPC) associated with the Amazon EKS cluster.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @ec2_instance_uids : Array(String)? = nil,
          @status : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Details about the EKS cluster involved in a Kubernetes finding.
      struct EksClusterDetails
        include JSON::Serializable

        # EKS cluster ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when the EKS cluster was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # EKS cluster name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The EKS cluster status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The EKS cluster tags.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The VPC ID to which the EKS cluster is attached.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      struct EnableOrganizationAdminAccountRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the organization account to be enabled as a GuardDuty
        # delegated administrator.
        @[JSON::Field(key: "adminAccountId")]
        getter admin_account_id : String

        def initialize(
          @admin_account_id : String
        )
        end
      end

      struct EnableOrganizationAdminAccountResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about the reason that the finding was generated.
      struct Evidence
        include JSON::Serializable

        # A list of threat intelligence details related to the evidence.
        @[JSON::Field(key: "threatIntelligenceDetails")]
        getter threat_intelligence_details : Array(Types::ThreatIntelligenceDetail)?

        def initialize(
          @threat_intelligence_details : Array(Types::ThreatIntelligenceDetail)? = nil
        )
        end
      end

      # Contains information about Amazon Web Services Fargate details associated with an Amazon ECS
      # cluster.
      struct FargateDetails
        include JSON::Serializable

        # Runtime coverage issues identified for the resource running on Amazon Web Services Fargate.
        @[JSON::Field(key: "issues")]
        getter issues : Array(String)?

        # Indicates how the GuardDuty security agent is managed for this resource. AUTO_MANAGED indicates that
        # GuardDuty deploys and manages updates for this resource. DISABLED indicates that the deployment of
        # the GuardDuty security agent is disabled for this resource. The MANUAL status doesn't apply to the
        # Amazon Web Services Fargate (Amazon ECS only) woprkloads.
        @[JSON::Field(key: "managementType")]
        getter management_type : String?

        def initialize(
          @issues : Array(String)? = nil,
          @management_type : String? = nil
        )
        end
      end

      # Contains information about the condition.
      struct FilterCondition
        include JSON::Serializable

        # Represents an equal condition to be applied to a single field when querying for scan entries.
        @[JSON::Field(key: "equalsValue")]
        getter equals_value : String?

        # Represents a greater than condition to be applied to a single field when querying for scan entries.
        @[JSON::Field(key: "greaterThan")]
        getter greater_than : Int64?

        # Represents a less than condition to be applied to a single field when querying for scan entries.
        @[JSON::Field(key: "lessThan")]
        getter less_than : Int64?

        def initialize(
          @equals_value : String? = nil,
          @greater_than : Int64? = nil,
          @less_than : Int64? = nil
        )
        end
      end

      # Represents the criteria to be used in the filter for describing scan entries.
      struct FilterCriteria
        include JSON::Serializable

        # Represents a condition that when matched will be added to the response of the operation.
        @[JSON::Field(key: "filterCriterion")]
        getter filter_criterion : Array(Types::FilterCriterion)?

        def initialize(
          @filter_criterion : Array(Types::FilterCriterion)? = nil
        )
        end
      end

      # Represents a condition that when matched will be added to the response of the operation.
      # Irrespective of using any filter criteria, an administrator account can view the scan entries for
      # all of its member accounts. However, each member account can view the scan entries only for their
      # own account.
      struct FilterCriterion
        include JSON::Serializable

        # An enum value representing possible scan properties to match with given scan entries.
        @[JSON::Field(key: "criterionKey")]
        getter criterion_key : String?

        # Contains information about the condition.
        @[JSON::Field(key: "filterCondition")]
        getter filter_condition : Types::FilterCondition?

        def initialize(
          @criterion_key : String? = nil,
          @filter_condition : Types::FilterCondition? = nil
        )
        end
      end

      # Contains information about the finding that is generated when abnormal or suspicious activity is
      # detected.
      struct Finding
        include JSON::Serializable

        # The ID of the account in which the finding was generated.
        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The ARN of the finding.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time and date when the finding was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : String

        # The ID of the finding.
        @[JSON::Field(key: "id")]
        getter id : String

        # The Region where the finding was generated. For findings generated from Global Service Events , the
        # Region value in the finding might differ from the Region where GuardDuty identifies the potential
        # threat. For more information, see How GuardDuty handles Amazon Web Services CloudTrail global events
        # in the Amazon GuardDuty User Guide .
        @[JSON::Field(key: "region")]
        getter region : String

        @[JSON::Field(key: "resource")]
        getter resource : Types::Resource

        # The version of the schema used for the finding.
        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        # The severity of the finding.
        @[JSON::Field(key: "severity")]
        getter severity : Float64

        # The type of finding.
        @[JSON::Field(key: "type")]
        getter type : String

        # The time and date when the finding was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : String

        # Amazon Resource Name (ARN) associated with the attack sequence finding.
        @[JSON::Field(key: "associatedAttackSequenceArn")]
        getter associated_attack_sequence_arn : String?

        # The confidence score for the finding.
        @[JSON::Field(key: "confidence")]
        getter confidence : Float64?

        # The description of the finding.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The partition associated with the finding.
        @[JSON::Field(key: "partition")]
        getter partition : String?

        @[JSON::Field(key: "service")]
        getter service : Types::Service?

        # The title of the finding.
        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @account_id : String,
          @arn : String,
          @created_at : String,
          @id : String,
          @region : String,
          @resource : Types::Resource,
          @schema_version : String,
          @severity : Float64,
          @type : String,
          @updated_at : String,
          @associated_attack_sequence_arn : String? = nil,
          @confidence : Float64? = nil,
          @description : String? = nil,
          @partition : String? = nil,
          @service : Types::Service? = nil,
          @title : String? = nil
        )
        end
      end

      # Contains information about the criteria used for querying findings.
      struct FindingCriteria
        include JSON::Serializable

        # Represents a map of finding properties that match specified conditions and values when querying
        # findings.
        @[JSON::Field(key: "criterion")]
        getter criterion : Hash(String, Types::Condition)?

        def initialize(
          @criterion : Hash(String, Types::Condition)? = nil
        )
        end
      end

      # Contains information about finding statistics.
      struct FindingStatistics
        include JSON::Serializable

        # Represents a list of map of severity to count statistics for a set of findings.
        @[JSON::Field(key: "countBySeverity")]
        getter count_by_severity : Hash(String, Int32)?

        # Represents a list of map of accounts with a findings count associated with each account.
        @[JSON::Field(key: "groupedByAccount")]
        getter grouped_by_account : Array(Types::AccountStatistics)?

        # Represents a list of map of dates with a count of total findings generated on each date per severity
        # level.
        @[JSON::Field(key: "groupedByDate")]
        getter grouped_by_date : Array(Types::DateStatistics)?

        # Represents a list of map of finding types with a count of total findings generated for each type.
        # Based on the orderBy parameter, this request returns either the most occurring finding types or the
        # least occurring finding types. If the orderBy parameter is ASC , this will represent the least
        # occurring finding types in your account; otherwise, this will represent the most occurring finding
        # types. The default value of orderBy is DESC .
        @[JSON::Field(key: "groupedByFindingType")]
        getter grouped_by_finding_type : Array(Types::FindingTypeStatistics)?

        # Represents a list of map of top resources with a count of total findings.
        @[JSON::Field(key: "groupedByResource")]
        getter grouped_by_resource : Array(Types::ResourceStatistics)?

        # Represents a list of map of total findings for each severity level.
        @[JSON::Field(key: "groupedBySeverity")]
        getter grouped_by_severity : Array(Types::SeverityStatistics)?

        def initialize(
          @count_by_severity : Hash(String, Int32)? = nil,
          @grouped_by_account : Array(Types::AccountStatistics)? = nil,
          @grouped_by_date : Array(Types::DateStatistics)? = nil,
          @grouped_by_finding_type : Array(Types::FindingTypeStatistics)? = nil,
          @grouped_by_resource : Array(Types::ResourceStatistics)? = nil,
          @grouped_by_severity : Array(Types::SeverityStatistics)? = nil
        )
        end
      end

      # Information about each finding type associated with the groupedByFindingType statistics.
      struct FindingTypeStatistics
        include JSON::Serializable

        # Name of the finding type.
        @[JSON::Field(key: "findingType")]
        getter finding_type : String?

        # The timestamp at which this finding type was last generated in your environment.
        @[JSON::Field(key: "lastGeneratedAt")]
        getter last_generated_at : Time?

        # The total number of findings associated with generated for each distinct finding type.
        @[JSON::Field(key: "totalFindings")]
        getter total_findings : Int32?

        def initialize(
          @finding_type : String? = nil,
          @last_generated_at : Time? = nil,
          @total_findings : Int32? = nil
        )
        end
      end

      # Contains information on the status of VPC flow logs as a data source.
      struct FlowLogsConfigurationResult
        include JSON::Serializable

        # Denotes whether VPC flow logs is enabled as a data source.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Contains information about the free trial period for a feature.
      struct FreeTrialFeatureConfigurationResult
        include JSON::Serializable

        # The number of the remaining free trial days for the feature.
        @[JSON::Field(key: "freeTrialDaysRemaining")]
        getter free_trial_days_remaining : Int32?

        # The name of the feature for which the free trial is configured.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @free_trial_days_remaining : Int32? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains information about the location of the remote IP address. By default, GuardDuty returns
      # Geolocation with Lat and Lon as 0.0 .
      struct GeoLocation
        include JSON::Serializable

        # The latitude information of the remote IP address.
        @[JSON::Field(key: "lat")]
        getter lat : Float64?

        # The longitude information of the remote IP address.
        @[JSON::Field(key: "lon")]
        getter lon : Float64?

        def initialize(
          @lat : Float64? = nil,
          @lon : Float64? = nil
        )
        end
      end

      struct GetAdministratorAccountRequest
        include JSON::Serializable

        # The unique ID of the detector of the GuardDuty member account.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @detector_id : String
        )
        end
      end

      struct GetAdministratorAccountResponse
        include JSON::Serializable

        # The administrator account details.
        @[JSON::Field(key: "administrator")]
        getter administrator : Types::Administrator

        def initialize(
          @administrator : Types::Administrator
        )
        end
      end

      struct GetCoverageStatisticsRequest
        include JSON::Serializable

        # The unique ID of the GuardDuty detector. To find the detectorId in the current Region, see the
        # Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # Represents the statistics type used to aggregate the coverage details.
        @[JSON::Field(key: "statisticsType")]
        getter statistics_type : Array(String)

        # Represents the criteria used to filter the coverage statistics.
        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::CoverageFilterCriteria?

        def initialize(
          @detector_id : String,
          @statistics_type : Array(String),
          @filter_criteria : Types::CoverageFilterCriteria? = nil
        )
        end
      end

      struct GetCoverageStatisticsResponse
        include JSON::Serializable

        # Represents the count aggregated by the statusCode and resourceType .
        @[JSON::Field(key: "coverageStatistics")]
        getter coverage_statistics : Types::CoverageStatistics?

        def initialize(
          @coverage_statistics : Types::CoverageStatistics? = nil
        )
        end
      end

      struct GetDetectorRequest
        include JSON::Serializable

        # The unique ID of the detector that you want to get. To find the detectorId in the current Region,
        # see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @detector_id : String
        )
        end
      end

      struct GetDetectorResponse
        include JSON::Serializable

        # The GuardDuty service role.
        @[JSON::Field(key: "serviceRole")]
        getter service_role : String

        # The detector status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp of when the detector was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : String?

        # Describes which data sources are enabled for the detector.
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Types::DataSourceConfigurationsResult?

        # Describes the features that have been enabled for the detector.
        @[JSON::Field(key: "features")]
        getter features : Array(Types::DetectorFeatureConfigurationResult)?

        # The publishing frequency of the finding.
        @[JSON::Field(key: "findingPublishingFrequency")]
        getter finding_publishing_frequency : String?

        # The tags of the detector resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The last-updated timestamp for the detector.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : String?

        def initialize(
          @service_role : String,
          @status : String,
          @created_at : String? = nil,
          @data_sources : Types::DataSourceConfigurationsResult? = nil,
          @features : Array(Types::DetectorFeatureConfigurationResult)? = nil,
          @finding_publishing_frequency : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : String? = nil
        )
        end
      end

      struct GetFilterRequest
        include JSON::Serializable

        # The unique ID of the detector that is associated with this filter. To find the detectorId in the
        # current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The name of the filter you want to get.
        @[JSON::Field(key: "filterName")]
        getter filter_name : String

        def initialize(
          @detector_id : String,
          @filter_name : String
        )
        end
      end

      struct GetFilterResponse
        include JSON::Serializable

        # Specifies the action that is to be applied to the findings that match the filter.
        @[JSON::Field(key: "action")]
        getter action : String

        # Represents the criteria to be used in the filter for querying findings.
        @[JSON::Field(key: "findingCriteria")]
        getter finding_criteria : Types::FindingCriteria

        # The name of the filter.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the filter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the position of the filter in the list of current filters. Also specifies the order in
        # which this filter is applied to the findings.
        @[JSON::Field(key: "rank")]
        getter rank : Int32?

        # The tags of the filter resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @action : String,
          @finding_criteria : Types::FindingCriteria,
          @name : String,
          @description : String? = nil,
          @rank : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetFindingsRequest
        include JSON::Serializable

        # The ID of the detector that specifies the GuardDuty service whose findings you want to retrieve. To
        # find the detectorId in the current Region, see the Settings page in the GuardDuty console, or run
        # the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The IDs of the findings that you want to retrieve.
        @[JSON::Field(key: "findingIds")]
        getter finding_ids : Array(String)

        # Represents the criteria used for sorting findings.
        @[JSON::Field(key: "sortCriteria")]
        getter sort_criteria : Types::SortCriteria?

        def initialize(
          @detector_id : String,
          @finding_ids : Array(String),
          @sort_criteria : Types::SortCriteria? = nil
        )
        end
      end

      struct GetFindingsResponse
        include JSON::Serializable

        # A list of findings.
        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::Finding)

        def initialize(
          @findings : Array(Types::Finding)
        )
        end
      end

      struct GetFindingsStatisticsRequest
        include JSON::Serializable

        # The ID of the detector whose findings statistics you want to retrieve. To find the detectorId in the
        # current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # Represents the criteria that is used for querying findings.
        @[JSON::Field(key: "findingCriteria")]
        getter finding_criteria : Types::FindingCriteria?

        # The types of finding statistics to retrieve.
        @[JSON::Field(key: "findingStatisticTypes")]
        getter finding_statistic_types : Array(String)?

        # Displays the findings statistics grouped by one of the listed valid values.
        @[JSON::Field(key: "groupBy")]
        getter group_by : String?

        # The maximum number of results to be returned in the response. The default value is 25. You can use
        # this parameter only with the groupBy parameter.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Displays the sorted findings in the requested order. The default value of orderBy is DESC . You can
        # use this parameter only with the groupBy parameter.
        @[JSON::Field(key: "orderBy")]
        getter order_by : String?

        def initialize(
          @detector_id : String,
          @finding_criteria : Types::FindingCriteria? = nil,
          @finding_statistic_types : Array(String)? = nil,
          @group_by : String? = nil,
          @max_results : Int32? = nil,
          @order_by : String? = nil
        )
        end
      end

      struct GetFindingsStatisticsResponse
        include JSON::Serializable

        # The finding statistics object.
        @[JSON::Field(key: "findingStatistics")]
        getter finding_statistics : Types::FindingStatistics

        # The pagination parameter to be used on the next list operation to retrieve more items. This
        # parameter is currently not supported.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @finding_statistics : Types::FindingStatistics,
          @next_token : String? = nil
        )
        end
      end

      struct GetIPSetRequest
        include JSON::Serializable

        # The unique ID of the detector that is associated with the IPSet. To find the detectorId in the
        # current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The unique ID of the IPSet to retrieve.
        @[JSON::Field(key: "ipSetId")]
        getter ip_set_id : String

        def initialize(
          @detector_id : String,
          @ip_set_id : String
        )
        end
      end

      struct GetIPSetResponse
        include JSON::Serializable

        # The format of the file that contains the IPSet.
        @[JSON::Field(key: "format")]
        getter format : String

        # The URI of the file that contains the IPSet.
        @[JSON::Field(key: "location")]
        getter location : String

        # The user-friendly name for the IPSet.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of IPSet file that was uploaded.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Web Services account ID that owns the Amazon S3 bucket specified in the location
        # parameter. This field appears in the response only if it was provided during IPSet creation or
        # update.
        @[JSON::Field(key: "expectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The tags of the IPSet resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @format : String,
          @location : String,
          @name : String,
          @status : String,
          @expected_bucket_owner : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetInvitationsCountRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetInvitationsCountResponse
        include JSON::Serializable

        # The number of received invitations.
        @[JSON::Field(key: "invitationsCount")]
        getter invitations_count : Int32?

        def initialize(
          @invitations_count : Int32? = nil
        )
        end
      end

      struct GetMalwareProtectionPlanRequest
        include JSON::Serializable

        # A unique identifier associated with Malware Protection plan resource.
        @[JSON::Field(key: "malwareProtectionPlanId")]
        getter malware_protection_plan_id : String

        def initialize(
          @malware_protection_plan_id : String
        )
        end
      end

      struct GetMalwareProtectionPlanResponse
        include JSON::Serializable

        # Information about whether the tags will be added to the S3 object after scanning.
        @[JSON::Field(key: "actions")]
        getter actions : Types::MalwareProtectionPlanActions?

        # Amazon Resource Name (ARN) of the protected resource.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when the Malware Protection plan resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Information about the protected resource that is associated with the created Malware Protection
        # plan. Presently, S3Bucket is the only supported protected resource.
        @[JSON::Field(key: "protectedResource")]
        getter protected_resource : Types::CreateProtectedResource?

        # Amazon Resource Name (ARN) of the IAM role that includes the permissions to scan and add tags to the
        # associated protected resource.
        @[JSON::Field(key: "role")]
        getter role : String?

        # Malware Protection plan status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Information about the issue code and message associated to the status of your Malware Protection
        # plan.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(Types::MalwareProtectionPlanStatusReason)?

        # Tags added to the Malware Protection plan resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @actions : Types::MalwareProtectionPlanActions? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @protected_resource : Types::CreateProtectedResource? = nil,
          @role : String? = nil,
          @status : String? = nil,
          @status_reasons : Array(Types::MalwareProtectionPlanStatusReason)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetMalwareScanRequest
        include JSON::Serializable

        # A unique identifier that gets generated when you invoke the API without any error. Each malware scan
        # has a corresponding scan ID. Using this scan ID, you can monitor the status of your malware scan.
        @[JSON::Field(key: "scanId")]
        getter scan_id : String

        def initialize(
          @scan_id : String
        )
        end
      end

      struct GetMalwareScanResponse
        include JSON::Serializable

        # The unique detector ID of the administrator account that the request is associated with. If the
        # account is an administrator, the AdminDetectorId will be the same as the one used for DetectorId. If
        # the customer is not a GuardDuty customer, this field will not be present. . To find the detectorId
        # in the current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "adminDetectorId")]
        getter admin_detector_id : String?

        # The unique ID of the detector that is associated with the request, if it belongs to an account which
        # is a GuardDuty customer. To find the detectorId in the current Region, see the Settings page in the
        # GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # The total number of resources that failed to be scanned.
        @[JSON::Field(key: "failedResourcesCount")]
        getter failed_resources_count : Int32?

        # Amazon Resource Name (ARN) of the resource on which a malware scan was invoked.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The type of resource that was scanned for malware.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The category of the malware scan, indicating the type of scan performed.
        @[JSON::Field(key: "scanCategory")]
        getter scan_category : String?

        # The timestamp representing when the malware scan was completed.
        @[JSON::Field(key: "scanCompletedAt")]
        getter scan_completed_at : Time?

        # Information about the scan configuration used for the malware scan.
        @[JSON::Field(key: "scanConfiguration")]
        getter scan_configuration : Types::ScanConfiguration?

        # A unique identifier associated with the malware scan. Each malware scan has a corresponding scan ID.
        # Using this scan ID, you can monitor the status of your malware scan.
        @[JSON::Field(key: "scanId")]
        getter scan_id : String?

        # Detailed information about the results of the malware scan, if the scan completed.
        @[JSON::Field(key: "scanResultDetails")]
        getter scan_result_details : Types::GetMalwareScanResultDetails?

        # The timestamp representing when the malware scan was started.
        @[JSON::Field(key: "scanStartedAt")]
        getter scan_started_at : Time?

        # A value representing the current status of the malware scan.
        @[JSON::Field(key: "scanStatus")]
        getter scan_status : String?

        # Represents the reason for the current scan status, if applicable.
        @[JSON::Field(key: "scanStatusReason")]
        getter scan_status_reason : String?

        # A value representing the initiator of the scan.
        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        # A list of resources along with their metadata that were scanned as part of the malware scan
        # operation.
        @[JSON::Field(key: "scannedResources")]
        getter scanned_resources : Array(Types::ScannedResource)?

        # The total number of resources that were successfully scanned. This is dependent on the resource
        # type.
        @[JSON::Field(key: "scannedResourcesCount")]
        getter scanned_resources_count : Int32?

        # The total number of resources that were skipped during the scan.
        @[JSON::Field(key: "skippedResourcesCount")]
        getter skipped_resources_count : Int32?

        def initialize(
          @admin_detector_id : String? = nil,
          @detector_id : String? = nil,
          @failed_resources_count : Int32? = nil,
          @resource_arn : String? = nil,
          @resource_type : String? = nil,
          @scan_category : String? = nil,
          @scan_completed_at : Time? = nil,
          @scan_configuration : Types::ScanConfiguration? = nil,
          @scan_id : String? = nil,
          @scan_result_details : Types::GetMalwareScanResultDetails? = nil,
          @scan_started_at : Time? = nil,
          @scan_status : String? = nil,
          @scan_status_reason : String? = nil,
          @scan_type : String? = nil,
          @scanned_resources : Array(Types::ScannedResource)? = nil,
          @scanned_resources_count : Int32? = nil,
          @skipped_resources_count : Int32? = nil
        )
        end
      end

      # Contains information about the results of the malware scan.
      struct GetMalwareScanResultDetails
        include JSON::Serializable

        # The total number of files that failed to be scanned.
        @[JSON::Field(key: "failedFileCount")]
        getter failed_file_count : Int64?

        # Status indicating whether threats were found for a completed scan.
        @[JSON::Field(key: "scanResultStatus")]
        getter scan_result_status : String?

        # The total number of files that were skipped during the scan.
        @[JSON::Field(key: "skippedFileCount")]
        getter skipped_file_count : Int64?

        # The total number of files in which threats were detected.
        @[JSON::Field(key: "threatFoundFileCount")]
        getter threat_found_file_count : Int64?

        # The threats that were detected during the malware scan.
        @[JSON::Field(key: "threats")]
        getter threats : Array(Types::ScanResultThreat)?

        # The total number of bytes that were scanned.
        @[JSON::Field(key: "totalBytes")]
        getter total_bytes : Int64?

        # The total number of files that were processed during the scan.
        @[JSON::Field(key: "totalFileCount")]
        getter total_file_count : Int64?

        # The total number of unique threats that were detected during the scan.
        @[JSON::Field(key: "uniqueThreatCount")]
        getter unique_threat_count : Int64?

        def initialize(
          @failed_file_count : Int64? = nil,
          @scan_result_status : String? = nil,
          @skipped_file_count : Int64? = nil,
          @threat_found_file_count : Int64? = nil,
          @threats : Array(Types::ScanResultThreat)? = nil,
          @total_bytes : Int64? = nil,
          @total_file_count : Int64? = nil,
          @unique_threat_count : Int64? = nil
        )
        end
      end

      struct GetMalwareScanSettingsRequest
        include JSON::Serializable

        # The unique ID of the detector that is associated with this scan. To find the detectorId in the
        # current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @detector_id : String
        )
        end
      end

      struct GetMalwareScanSettingsResponse
        include JSON::Serializable

        # An enum value representing possible snapshot preservation settings.
        @[JSON::Field(key: "ebsSnapshotPreservation")]
        getter ebs_snapshot_preservation : String?

        # Represents the criteria to be used in the filter for scanning resources.
        @[JSON::Field(key: "scanResourceCriteria")]
        getter scan_resource_criteria : Types::ScanResourceCriteria?

        def initialize(
          @ebs_snapshot_preservation : String? = nil,
          @scan_resource_criteria : Types::ScanResourceCriteria? = nil
        )
        end
      end

      struct GetMasterAccountRequest
        include JSON::Serializable

        # The unique ID of the detector of the GuardDuty member account. To find the detectorId in the current
        # Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @detector_id : String
        )
        end
      end

      struct GetMasterAccountResponse
        include JSON::Serializable

        # The administrator account details.
        @[JSON::Field(key: "master")]
        getter master : Types::Master

        def initialize(
          @master : Types::Master
        )
        end
      end

      struct GetMemberDetectorsRequest
        include JSON::Serializable

        # A list of member account IDs.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # The detector ID for the administrator account. To find the detectorId in the current Region, see the
        # Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @account_ids : Array(String),
          @detector_id : String
        )
        end
      end

      struct GetMemberDetectorsResponse
        include JSON::Serializable

        # An object that describes which data sources are enabled for a member account.
        @[JSON::Field(key: "members")]
        getter member_data_source_configurations : Array(Types::MemberDataSourceConfiguration)

        # A list of member account IDs that were unable to be processed along with an explanation for why they
        # were not processed.
        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)

        def initialize(
          @member_data_source_configurations : Array(Types::MemberDataSourceConfiguration),
          @unprocessed_accounts : Array(Types::UnprocessedAccount)
        )
        end
      end

      struct GetMembersRequest
        include JSON::Serializable

        # A list of account IDs of the GuardDuty member accounts that you want to describe.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # The unique ID of the detector of the GuardDuty account whose members you want to retrieve. To find
        # the detectorId in the current Region, see the Settings page in the GuardDuty console, or run the
        # ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @account_ids : Array(String),
          @detector_id : String
        )
        end
      end

      struct GetMembersResponse
        include JSON::Serializable

        # A list of members.
        @[JSON::Field(key: "members")]
        getter members : Array(Types::Member)

        # A list of objects that contain the unprocessed account and a result string that explains why it was
        # unprocessed.
        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)

        def initialize(
          @members : Array(Types::Member),
          @unprocessed_accounts : Array(Types::UnprocessedAccount)
        )
        end
      end

      struct GetOrganizationStatisticsResponse
        include JSON::Serializable

        # Information about the statistics report for your organization.
        @[JSON::Field(key: "organizationDetails")]
        getter organization_details : Types::OrganizationDetails?

        def initialize(
          @organization_details : Types::OrganizationDetails? = nil
        )
        end
      end

      struct GetRemainingFreeTrialDaysRequest
        include JSON::Serializable

        # A list of account identifiers of the GuardDuty member account.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # The unique ID of the detector of the GuardDuty member account. To find the detectorId in the current
        # Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @account_ids : Array(String),
          @detector_id : String
        )
        end
      end

      struct GetRemainingFreeTrialDaysResponse
        include JSON::Serializable

        # The member accounts which were included in a request and were processed successfully.
        @[JSON::Field(key: "accounts")]
        getter accounts : Array(Types::AccountFreeTrialInfo)?

        # The member account that was included in a request but for which the request could not be processed.
        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)?

        def initialize(
          @accounts : Array(Types::AccountFreeTrialInfo)? = nil,
          @unprocessed_accounts : Array(Types::UnprocessedAccount)? = nil
        )
        end
      end

      struct GetThreatEntitySetRequest
        include JSON::Serializable

        # The unique ID of the detector associated with the threat entity set resource. To find the detectorId
        # in the current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The unique ID that helps GuardDuty identify the threat entity set.
        @[JSON::Field(key: "threatEntitySetId")]
        getter threat_entity_set_id : String

        def initialize(
          @detector_id : String,
          @threat_entity_set_id : String
        )
        end
      end

      struct GetThreatEntitySetResponse
        include JSON::Serializable

        # The format of the file that contains the threat entity set.
        @[JSON::Field(key: "format")]
        getter format : String

        # The URI of the file that contains the threat entity set.
        @[JSON::Field(key: "location")]
        getter location : String

        # The name of the threat entity set associated with the specified threatEntitySetId .
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the associated threat entity set.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the associated threat entity set was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The error details when the status is shown as ERROR .
        @[JSON::Field(key: "errorDetails")]
        getter error_details : String?

        # The Amazon Web Services account ID that owns the Amazon S3 bucket specified in the location
        # parameter.
        @[JSON::Field(key: "expectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The tags associated with the threat entity set resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The timestamp when the associated threat entity set was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @format : String,
          @location : String,
          @name : String,
          @status : String,
          @created_at : Time? = nil,
          @error_details : String? = nil,
          @expected_bucket_owner : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct GetThreatIntelSetRequest
        include JSON::Serializable

        # The unique ID of the detector that is associated with the threatIntelSet. To find the detectorId in
        # the current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The unique ID of the threatIntelSet that you want to get.
        @[JSON::Field(key: "threatIntelSetId")]
        getter threat_intel_set_id : String

        def initialize(
          @detector_id : String,
          @threat_intel_set_id : String
        )
        end
      end

      struct GetThreatIntelSetResponse
        include JSON::Serializable

        # The format of the threatIntelSet.
        @[JSON::Field(key: "format")]
        getter format : String

        # The URI of the file that contains the ThreatIntelSet.
        @[JSON::Field(key: "location")]
        getter location : String

        # A user-friendly ThreatIntelSet name displayed in all findings that are generated by activity that
        # involves IP addresses included in this ThreatIntelSet.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of threatIntelSet file uploaded.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Web Services account ID that owns the Amazon S3 bucket specified in the location
        # parameter. This field appears in the response only if it was provided during ThreatIntelSet creation
        # or update.
        @[JSON::Field(key: "expectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The tags of the threat list resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @format : String,
          @location : String,
          @name : String,
          @status : String,
          @expected_bucket_owner : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetTrustedEntitySetRequest
        include JSON::Serializable

        # The unique ID of the GuardDuty detector associated with this trusted entity set.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The unique ID that helps GuardDuty identify the trusted entity set.
        @[JSON::Field(key: "trustedEntitySetId")]
        getter trusted_entity_set_id : String

        def initialize(
          @detector_id : String,
          @trusted_entity_set_id : String
        )
        end
      end

      struct GetTrustedEntitySetResponse
        include JSON::Serializable

        # The format of the file that contains the trusted entity set.
        @[JSON::Field(key: "format")]
        getter format : String

        # The URI of the file that contains the trusted entity set.
        @[JSON::Field(key: "location")]
        getter location : String

        # The name of the threat entity set associated with the specified trustedEntitySetId .
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the associated trusted entity set.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the associated trusted entity set was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The error details when the status is shown as ERROR .
        @[JSON::Field(key: "errorDetails")]
        getter error_details : String?

        # The Amazon Web Services account ID that owns the Amazon S3 bucket specified in the location
        # parameter.
        @[JSON::Field(key: "expectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The tags associated with trusted entity set resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The timestamp when the associated trusted entity set was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @format : String,
          @location : String,
          @name : String,
          @status : String,
          @created_at : Time? = nil,
          @error_details : String? = nil,
          @expected_bucket_owner : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct GetUsageStatisticsRequest
        include JSON::Serializable

        # The ID of the detector that specifies the GuardDuty service whose usage statistics you want to
        # retrieve. To find the detectorId in the current Region, see the Settings page in the GuardDuty
        # console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # Represents the criteria used for querying usage.
        @[JSON::Field(key: "usageCriteria")]
        getter usage_criteria : Types::UsageCriteria

        # The type of usage statistics to retrieve.
        @[JSON::Field(key: "usageStatisticsType")]
        getter usage_statistic_type : String

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The currency unit you would like to view your usage statistics in. Current valid values are USD.
        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @detector_id : String,
          @usage_criteria : Types::UsageCriteria,
          @usage_statistic_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @unit : String? = nil
        )
        end
      end

      struct GetUsageStatisticsResponse
        include JSON::Serializable

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The usage statistics object. If a UsageStatisticType was provided, the objects representing other
        # types will be null.
        @[JSON::Field(key: "usageStatistics")]
        getter usage_statistics : Types::UsageStatistics?

        def initialize(
          @next_token : String? = nil,
          @usage_statistics : Types::UsageStatistics? = nil
        )
        end
      end

      # Contains details of the highest severity threat detected during scan and number of infected files.
      struct HighestSeverityThreatDetails
        include JSON::Serializable

        # Total number of infected files with the highest severity threat detected.
        @[JSON::Field(key: "count")]
        getter count : Int32?

        # Severity level of the highest severity threat detected.
        @[JSON::Field(key: "severity")]
        getter severity : String?

        # Threat name of the highest severity threat detected as part of the malware scan.
        @[JSON::Field(key: "threatName")]
        getter threat_name : String?

        def initialize(
          @count : Int32? = nil,
          @severity : String? = nil,
          @threat_name : String? = nil
        )
        end
      end

      # Represents a pre-existing file or directory on the host machine that the volume maps to.
      struct HostPath
        include JSON::Serializable

        # Path of the file or directory on the host that the volume maps to.
        @[JSON::Field(key: "path")]
        getter path : String?

        def initialize(
          @path : String? = nil
        )
        end
      end

      # Contains information about the EC2 instance profile.
      struct IamInstanceProfile
        include JSON::Serializable

        # The profile ARN of the EC2 instance.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The profile ID of the EC2 instance.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Contains information about the IAM instance profile involved in a GuardDuty finding, including
      # unique identifiers of the Amazon EC2 instances.
      struct IamInstanceProfileV2
        include JSON::Serializable

        # A list of unique identifiers for the compromised Amazon EC2 instances that share the same IAM
        # instance profile.
        @[JSON::Field(key: "ec2InstanceUids")]
        getter ec2_instance_uids : Array(String)?

        def initialize(
          @ec2_instance_uids : Array(String)? = nil
        )
        end
      end

      # Contains information about the impersonated user.
      struct ImpersonatedUser
        include JSON::Serializable

        # The group to which the user name belongs.
        @[JSON::Field(key: "groups")]
        getter groups : Array(String)?

        # Information about the username that was being impersonated.
        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @groups : Array(String)? = nil,
          @username : String? = nil
        )
        end
      end

      # Contains information about the incremental scan configuration.
      struct IncrementalScanDetails
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the baseline resource used for incremental scanning. The scan will
        # only process changes since this baseline resource was created.
        @[JSON::Field(key: "baselineResourceArn")]
        getter baseline_resource_arn : String

        def initialize(
          @baseline_resource_arn : String
        )
        end
      end

      # Contains information about the indicators that include a set of signals observed in an attack
      # sequence.
      struct Indicator
        include JSON::Serializable

        # Specific indicator keys observed in the attack sequence. For description of the valid values for
        # key, see Attack sequence finding details in the Amazon GuardDuty User Guide .
        @[JSON::Field(key: "key")]
        getter key : String

        # Title describing the indicator.
        @[JSON::Field(key: "title")]
        getter title : String?

        # Values associated with each indicator key. For example, if the indicator key is SUSPICIOUS_NETWORK ,
        # then the value will be the name of the network. If the indicator key is ATTACK_TACTIC , then the
        # value will be one of the MITRE tactics.
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @key : String,
          @title : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Contains information about the details of an instance.
      struct InstanceDetails
        include JSON::Serializable

        # The Availability Zone of the EC2 instance.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The profile information of the EC2 instance.
        @[JSON::Field(key: "iamInstanceProfile")]
        getter iam_instance_profile : Types::IamInstanceProfile?

        # The image description of the EC2 instance.
        @[JSON::Field(key: "imageDescription")]
        getter image_description : String?

        # The image ID of the EC2 instance.
        @[JSON::Field(key: "imageId")]
        getter image_id : String?

        # The ID of the EC2 instance.
        @[JSON::Field(key: "instanceId")]
        getter instance_id : String?

        # The state of the EC2 instance.
        @[JSON::Field(key: "instanceState")]
        getter instance_state : String?

        # The type of the EC2 instance.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The launch time of the EC2 instance.
        @[JSON::Field(key: "launchTime")]
        getter launch_time : String?

        # The elastic network interface information of the EC2 instance.
        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # The Amazon Resource Name (ARN) of the Amazon Web Services Outpost. Only applicable to Amazon Web
        # Services Outposts instances.
        @[JSON::Field(key: "outpostArn")]
        getter outpost_arn : String?

        # The platform of the EC2 instance.
        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The product code of the EC2 instance.
        @[JSON::Field(key: "productCodes")]
        getter product_codes : Array(Types::ProductCode)?

        # The tags of the EC2 instance.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @availability_zone : String? = nil,
          @iam_instance_profile : Types::IamInstanceProfile? = nil,
          @image_description : String? = nil,
          @image_id : String? = nil,
          @instance_id : String? = nil,
          @instance_state : String? = nil,
          @instance_type : String? = nil,
          @launch_time : String? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @outpost_arn : String? = nil,
          @platform : String? = nil,
          @product_codes : Array(Types::ProductCode)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # An internal server error exception object.
      struct InternalServerErrorException
        include JSON::Serializable

        # The error message.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The error type.
        @[JSON::Field(key: "__type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains information about the invitation to become a member account.
      struct Invitation
        include JSON::Serializable

        # The ID of the account that the invitation was sent from.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The ID of the invitation. This value is used to validate the inviter account to the member account.
        @[JSON::Field(key: "invitationId")]
        getter invitation_id : String?

        # The timestamp when the invitation was sent.
        @[JSON::Field(key: "invitedAt")]
        getter invited_at : String?

        # The status of the relationship between the inviter and invitee accounts.
        @[JSON::Field(key: "relationshipStatus")]
        getter relationship_status : String?

        def initialize(
          @account_id : String? = nil,
          @invitation_id : String? = nil,
          @invited_at : String? = nil,
          @relationship_status : String? = nil
        )
        end
      end

      struct InviteMembersRequest
        include JSON::Serializable

        # A list of account IDs of the accounts that you want to invite to GuardDuty as members.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # The unique ID of the detector of the GuardDuty account with which you want to invite members. To
        # find the detectorId in the current Region, see the Settings page in the GuardDuty console, or run
        # the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # A Boolean value that specifies whether you want to disable email notification to the accounts that
        # you are inviting to GuardDuty as members.
        @[JSON::Field(key: "disableEmailNotification")]
        getter disable_email_notification : Bool?

        # The invitation message that you want to send to the accounts that you're inviting to GuardDuty as
        # members.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @account_ids : Array(String),
          @detector_id : String,
          @disable_email_notification : Bool? = nil,
          @message : String? = nil
        )
        end
      end

      struct InviteMembersResponse
        include JSON::Serializable

        # A list of objects that contain the unprocessed account and a result string that explains why it was
        # unprocessed.
        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)

        def initialize(
          @unprocessed_accounts : Array(Types::UnprocessedAccount)
        )
        end
      end

      # Contains detailed information about where a threat was detected.
      struct ItemDetails
        include JSON::Serializable

        # Additional information about the detected threat item.
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Types::AdditionalInfo?

        # The hash value of the infected item.
        @[JSON::Field(key: "hash")]
        getter hash : String?

        # The path where the threat was detected.
        @[JSON::Field(key: "itemPath")]
        getter item_path : String?

        # Amazon Resource Name (ARN) of the resource where the threat was detected.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @additional_info : Types::AdditionalInfo? = nil,
          @hash : String? = nil,
          @item_path : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # Information about the nested item path and hash of the protected resource.
      struct ItemPath
        include JSON::Serializable

        # The hash value of the infected resource.
        @[JSON::Field(key: "hash")]
        getter hash : String?

        # The nested item path where the infected file was found.
        @[JSON::Field(key: "nestedItemPath")]
        getter nested_item_path : String?

        def initialize(
          @hash : String? = nil,
          @nested_item_path : String? = nil
        )
        end
      end

      # Information about the Kubernetes API call action described in this finding.
      struct KubernetesApiCallAction
        include JSON::Serializable

        # The name of the namespace where the Kubernetes API call action takes place.
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # Parameters related to the Kubernetes API call action.
        @[JSON::Field(key: "parameters")]
        getter parameters : String?

        @[JSON::Field(key: "remoteIpDetails")]
        getter remote_ip_details : Types::RemoteIpDetails?

        # The Kubernetes API request URI.
        @[JSON::Field(key: "requestUri")]
        getter request_uri : String?

        # The resource component in the Kubernetes API call action.
        @[JSON::Field(key: "resource")]
        getter resource : String?

        # The name of the resource in the Kubernetes API call action.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # The IP of the Kubernetes API caller and the IPs of any proxies or load balancers between the caller
        # and the API endpoint.
        @[JSON::Field(key: "sourceIPs")]
        getter source_ips : Array(String)?

        # The resulting HTTP response code of the Kubernetes API call action.
        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        # The name of the sub-resource in the Kubernetes API call action.
        @[JSON::Field(key: "subresource")]
        getter subresource : String?

        # The user agent of the caller of the Kubernetes API.
        @[JSON::Field(key: "userAgent")]
        getter user_agent : String?

        # The Kubernetes API request HTTP verb.
        @[JSON::Field(key: "verb")]
        getter verb : String?

        def initialize(
          @namespace : String? = nil,
          @parameters : String? = nil,
          @remote_ip_details : Types::RemoteIpDetails? = nil,
          @request_uri : String? = nil,
          @resource : String? = nil,
          @resource_name : String? = nil,
          @source_ips : Array(String)? = nil,
          @status_code : Int32? = nil,
          @subresource : String? = nil,
          @user_agent : String? = nil,
          @verb : String? = nil
        )
        end
      end

      # Describes whether Kubernetes audit logs are enabled as a data source.
      struct KubernetesAuditLogsConfiguration
        include JSON::Serializable

        # The status of Kubernetes audit logs as a data source.
        @[JSON::Field(key: "enable")]
        getter enable : Bool

        def initialize(
          @enable : Bool
        )
        end
      end

      # Describes whether Kubernetes audit logs are enabled as a data source.
      struct KubernetesAuditLogsConfigurationResult
        include JSON::Serializable

        # A value that describes whether Kubernetes audit logs are enabled as a data source.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Describes whether any Kubernetes data sources are enabled.
      struct KubernetesConfiguration
        include JSON::Serializable

        # The status of Kubernetes audit logs as a data source.
        @[JSON::Field(key: "auditLogs")]
        getter audit_logs : Types::KubernetesAuditLogsConfiguration

        def initialize(
          @audit_logs : Types::KubernetesAuditLogsConfiguration
        )
        end
      end

      # Describes whether any Kubernetes logs will be enabled as a data source.
      struct KubernetesConfigurationResult
        include JSON::Serializable

        # Describes whether Kubernetes audit logs are enabled as a data source.
        @[JSON::Field(key: "auditLogs")]
        getter audit_logs : Types::KubernetesAuditLogsConfigurationResult

        def initialize(
          @audit_logs : Types::KubernetesAuditLogsConfigurationResult
        )
        end
      end

      # Provides details about the Kubernetes resources when it is enabled as a data source.
      struct KubernetesDataSourceFreeTrial
        include JSON::Serializable

        # Describes whether Kubernetes audit logs are enabled as a data source.
        @[JSON::Field(key: "auditLogs")]
        getter audit_logs : Types::DataSourceFreeTrial?

        def initialize(
          @audit_logs : Types::DataSourceFreeTrial? = nil
        )
        end
      end

      # Details about Kubernetes resources such as a Kubernetes user or workload resource involved in a
      # Kubernetes finding.
      struct KubernetesDetails
        include JSON::Serializable

        # Details about the Kubernetes user involved in a Kubernetes finding.
        @[JSON::Field(key: "kubernetesUserDetails")]
        getter kubernetes_user_details : Types::KubernetesUserDetails?

        # Details about the Kubernetes workload involved in a Kubernetes finding.
        @[JSON::Field(key: "kubernetesWorkloadDetails")]
        getter kubernetes_workload_details : Types::KubernetesWorkloadDetails?

        def initialize(
          @kubernetes_user_details : Types::KubernetesUserDetails? = nil,
          @kubernetes_workload_details : Types::KubernetesWorkloadDetails? = nil
        )
        end
      end

      # Information about the Kubernetes API for which you check if you have permission to call.
      struct KubernetesPermissionCheckedDetails
        include JSON::Serializable

        # Information whether the user has the permission to call the Kubernetes API.
        @[JSON::Field(key: "allowed")]
        getter allowed : Bool?

        # The namespace where the Kubernetes API action will take place.
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The Kubernetes resource with which your Kubernetes API call will interact.
        @[JSON::Field(key: "resource")]
        getter resource : String?

        # The verb component of the Kubernetes API call. For example, when you check whether or not you have
        # the permission to call the CreatePod API, the verb component will be Create .
        @[JSON::Field(key: "verb")]
        getter verb : String?

        def initialize(
          @allowed : Bool? = nil,
          @namespace : String? = nil,
          @resource : String? = nil,
          @verb : String? = nil
        )
        end
      end

      # Contains information about the role binding that grants the permission defined in a Kubernetes role.
      struct KubernetesRoleBindingDetails
        include JSON::Serializable

        # The kind of the role. For role binding, this value will be RoleBinding .
        @[JSON::Field(key: "kind")]
        getter kind : String?

        # The name of the RoleBinding .
        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of the role being referenced. This could be either Role or ClusterRole .
        @[JSON::Field(key: "roleRefKind")]
        getter role_ref_kind : String?

        # The name of the role being referenced. This must match the name of the Role or ClusterRole that you
        # want to bind to.
        @[JSON::Field(key: "roleRefName")]
        getter role_ref_name : String?

        # The unique identifier of the role binding.
        @[JSON::Field(key: "uid")]
        getter uid : String?

        def initialize(
          @kind : String? = nil,
          @name : String? = nil,
          @role_ref_kind : String? = nil,
          @role_ref_name : String? = nil,
          @uid : String? = nil
        )
        end
      end

      # Information about the Kubernetes role name and role type.
      struct KubernetesRoleDetails
        include JSON::Serializable

        # The kind of role. For this API, the value of kind will be Role .
        @[JSON::Field(key: "kind")]
        getter kind : String?

        # The name of the Kubernetes role.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The unique identifier of the Kubernetes role name.
        @[JSON::Field(key: "uid")]
        getter uid : String?

        def initialize(
          @kind : String? = nil,
          @name : String? = nil,
          @uid : String? = nil
        )
        end
      end

      # Details about the Kubernetes user involved in a Kubernetes finding.
      struct KubernetesUserDetails
        include JSON::Serializable

        # The groups that include the user who called the Kubernetes API.
        @[JSON::Field(key: "groups")]
        getter groups : Array(String)?

        # Information about the impersonated user.
        @[JSON::Field(key: "impersonatedUser")]
        getter impersonated_user : Types::ImpersonatedUser?

        # Entity that assumes the IAM role when Kubernetes RBAC permissions are assigned to that role.
        @[JSON::Field(key: "sessionName")]
        getter session_name : Array(String)?

        # The user ID of the user who called the Kubernetes API.
        @[JSON::Field(key: "uid")]
        getter uid : String?

        # The username of the user who called the Kubernetes API.
        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @groups : Array(String)? = nil,
          @impersonated_user : Types::ImpersonatedUser? = nil,
          @session_name : Array(String)? = nil,
          @uid : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Contains information about Kubernetes workloads involved in a GuardDuty finding, including pods,
      # deployments, and other Kubernetes resources.
      struct KubernetesWorkload
        include JSON::Serializable

        # A list of unique identifiers for the containers that are part of the Kubernetes workload.
        @[JSON::Field(key: "containerUids")]
        getter container_uids : Array(String)?

        # The types of Kubernetes resources involved in the workload.
        @[JSON::Field(key: "type")]
        getter kubernetes_resources_types : String?

        # The Kubernetes namespace in which the workload is running, providing logical isolation within the
        # cluster.
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @container_uids : Array(String)? = nil,
          @kubernetes_resources_types : String? = nil,
          @namespace : String? = nil
        )
        end
      end

      # Details about the Kubernetes workload involved in a Kubernetes finding.
      struct KubernetesWorkloadDetails
        include JSON::Serializable

        # Containers running as part of the Kubernetes workload.
        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::Container)?

        # Whether the host IPC flag is enabled for the pods in the workload.
        @[JSON::Field(key: "hostIPC")]
        getter host_ipc : Bool?

        # Whether the hostNetwork flag is enabled for the pods included in the workload.
        @[JSON::Field(key: "hostNetwork")]
        getter host_network : Bool?

        # Whether the host PID flag is enabled for the pods in the workload.
        @[JSON::Field(key: "hostPID")]
        getter host_pid : Bool?

        # Kubernetes workload name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Kubernetes namespace that the workload is part of.
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The service account name that is associated with a Kubernetes workload.
        @[JSON::Field(key: "serviceAccountName")]
        getter service_account_name : String?

        # Kubernetes workload type (e.g. Pod, Deployment, etc.).
        @[JSON::Field(key: "type")]
        getter type : String?

        # Kubernetes workload ID.
        @[JSON::Field(key: "uid")]
        getter uid : String?

        # Volumes used by the Kubernetes workload.
        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::Volume)?

        def initialize(
          @containers : Array(Types::Container)? = nil,
          @host_ipc : Bool? = nil,
          @host_network : Bool? = nil,
          @host_pid : Bool? = nil,
          @name : String? = nil,
          @namespace : String? = nil,
          @service_account_name : String? = nil,
          @type : String? = nil,
          @uid : String? = nil,
          @volumes : Array(Types::Volume)? = nil
        )
        end
      end

      # Information about the Lambda function involved in the finding.
      struct LambdaDetails
        include JSON::Serializable

        # Description of the Lambda function.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Amazon Resource Name (ARN) of the Lambda function.
        @[JSON::Field(key: "functionArn")]
        getter function_arn : String?

        # Name of the Lambda function.
        @[JSON::Field(key: "functionName")]
        getter function_name : String?

        # The version of the Lambda function.
        @[JSON::Field(key: "functionVersion")]
        getter function_version : String?

        # The timestamp when the Lambda function was last modified. This field is in the UTC date string
        # format (2023-03-22T19:37:20.168Z) .
        @[JSON::Field(key: "lastModifiedAt")]
        getter last_modified_at : Time?

        # The revision ID of the Lambda function version.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        # The execution role of the Lambda function.
        @[JSON::Field(key: "role")]
        getter role : String?

        # A list of tags attached to this resource, listed in the format of key : value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # Amazon Virtual Private Cloud configuration details associated with your Lambda function.
        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @description : String? = nil,
          @function_arn : String? = nil,
          @function_name : String? = nil,
          @function_version : String? = nil,
          @last_modified_at : Time? = nil,
          @revision_id : String? = nil,
          @role : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Information about the runtime process details.
      struct LineageObject
        include JSON::Serializable

        # The effective user ID that was used to execute the process.
        @[JSON::Field(key: "euid")]
        getter euid : Int32?

        # The absolute path of the process executable file.
        @[JSON::Field(key: "executablePath")]
        getter executable_path : String?

        # The name of the process.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The process ID of the child process.
        @[JSON::Field(key: "namespacePid")]
        getter namespace_pid : Int32?

        # The unique ID of the parent process. This ID is assigned to the parent process by GuardDuty.
        @[JSON::Field(key: "parentUuid")]
        getter parent_uuid : String?

        # The ID of the process.
        @[JSON::Field(key: "pid")]
        getter pid : Int32?

        # The time when the process started. This is in UTC format.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The user ID of the user that executed the process.
        @[JSON::Field(key: "userId")]
        getter user_id : Int32?

        # The unique ID assigned to the process by GuardDuty.
        @[JSON::Field(key: "uuid")]
        getter uuid : String?

        def initialize(
          @euid : Int32? = nil,
          @executable_path : String? = nil,
          @name : String? = nil,
          @namespace_pid : Int32? = nil,
          @parent_uuid : String? = nil,
          @pid : Int32? = nil,
          @start_time : Time? = nil,
          @user_id : Int32? = nil,
          @uuid : String? = nil
        )
        end
      end

      struct ListCoverageRequest
        include JSON::Serializable

        # The unique ID of the detector whose coverage details you want to retrieve. To find the detectorId in
        # the current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # Represents the criteria used to filter the coverage details.
        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::CoverageFilterCriteria?

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Represents the criteria used to sort the coverage details.
        @[JSON::Field(key: "sortCriteria")]
        getter sort_criteria : Types::CoverageSortCriteria?

        def initialize(
          @detector_id : String,
          @filter_criteria : Types::CoverageFilterCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_criteria : Types::CoverageSortCriteria? = nil
        )
        end
      end

      struct ListCoverageResponse
        include JSON::Serializable

        # A list of resources and their attributes providing cluster details.
        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::CoverageResource)

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resources : Array(Types::CoverageResource),
          @next_token : String? = nil
        )
        end
      end

      struct ListDetectorsRequest
        include JSON::Serializable

        # You can use this parameter to indicate the maximum number of items that you want in the response.
        # The default value is 50. The maximum value is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDetectorsResponse
        include JSON::Serializable

        # A list of detector IDs.
        @[JSON::Field(key: "detectorIds")]
        getter detector_ids : Array(String)

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_ids : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListFiltersRequest
        include JSON::Serializable

        # The unique ID of the detector that is associated with the filter. To find the detectorId in the
        # current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # You can use this parameter to indicate the maximum number of items that you want in the response.
        # The default value is 50. The maximum value is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFiltersResponse
        include JSON::Serializable

        # A list of filter names.
        @[JSON::Field(key: "filterNames")]
        getter filter_names : Array(String)

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter_names : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListFindingsRequest
        include JSON::Serializable

        # The ID of the detector that specifies the GuardDuty service whose findings you want to list. To find
        # the detectorId in the current Region, see the Settings page in the GuardDuty console, or run the
        # ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # Represents the criteria used for querying findings. Valid values include: JSON field name accountId
        # region confidence id resource.accessKeyDetails.accessKeyId resource.accessKeyDetails.principalId
        # resource.accessKeyDetails.userName resource.accessKeyDetails.userType
        # resource.instanceDetails.iamInstanceProfile.id resource.instanceDetails.imageId
        # resource.instanceDetails.instanceId resource.instanceDetails.networkInterfaces.ipv6Addresses
        # resource.instanceDetails.networkInterfaces.privateIpAddresses.privateIpAddress
        # resource.instanceDetails.networkInterfaces.publicDnsName
        # resource.instanceDetails.networkInterfaces.publicIp
        # resource.instanceDetails.networkInterfaces.securityGroups.groupId
        # resource.instanceDetails.networkInterfaces.securityGroups.groupName
        # resource.instanceDetails.networkInterfaces.subnetId resource.instanceDetails.networkInterfaces.vpcId
        # resource.instanceDetails.tags.key resource.instanceDetails.tags.value resource.resourceType
        # service.action.actionType service.action.awsApiCallAction.api
        # service.action.awsApiCallAction.callerType
        # service.action.awsApiCallAction.remoteIpDetails.city.cityName
        # service.action.awsApiCallAction.remoteIpDetails.country.countryName
        # service.action.awsApiCallAction.remoteIpDetails.ipAddressV4
        # service.action.awsApiCallAction.remoteIpDetails.organization.asn
        # service.action.awsApiCallAction.remoteIpDetails.organization.asnOrg
        # service.action.awsApiCallAction.serviceName service.action.dnsRequestAction.domain
        # service.action.dnsRequestAction.domainWithSuffix service.action.networkConnectionAction.blocked
        # service.action.networkConnectionAction.connectionDirection
        # service.action.networkConnectionAction.localPortDetails.port
        # service.action.networkConnectionAction.protocol
        # service.action.networkConnectionAction.remoteIpDetails.country.countryName
        # service.action.networkConnectionAction.remoteIpDetails.ipAddressV4
        # service.action.networkConnectionAction.remoteIpDetails.organization.asn
        # service.action.networkConnectionAction.remoteIpDetails.organization.asnOrg
        # service.action.networkConnectionAction.remotePortDetails.port service.additionalInfo.threatListName
        # service.archived When this attribute is set to 'true', only archived findings are listed. When it's
        # set to 'false', only unarchived findings are listed. When this attribute is not set, all existing
        # findings are listed. service.ebsVolumeScanDetails.scanId service.resourceRole severity type
        # updatedAt Type: Timestamp in Unix Epoch millisecond format: 1486685375000
        @[JSON::Field(key: "findingCriteria")]
        getter finding_criteria : Types::FindingCriteria?

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 50. The maximum value is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Represents the criteria used for sorting findings.
        @[JSON::Field(key: "sortCriteria")]
        getter sort_criteria : Types::SortCriteria?

        def initialize(
          @detector_id : String,
          @finding_criteria : Types::FindingCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_criteria : Types::SortCriteria? = nil
        )
        end
      end

      struct ListFindingsResponse
        include JSON::Serializable

        # The IDs of the findings that you're listing.
        @[JSON::Field(key: "findingIds")]
        getter finding_ids : Array(String)

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @finding_ids : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListIPSetsRequest
        include JSON::Serializable

        # The unique ID of the detector that is associated with IPSet. To find the detectorId in the current
        # Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 50. The maximum value is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIPSetsResponse
        include JSON::Serializable

        # The IDs of the IPSet resources.
        @[JSON::Field(key: "ipSetIds")]
        getter ip_set_ids : Array(String)

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ip_set_ids : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListInvitationsRequest
        include JSON::Serializable

        # You can use this parameter to indicate the maximum number of items that you want in the response.
        # The default value is 50. The maximum value is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInvitationsResponse
        include JSON::Serializable

        # A list of invitation descriptions.
        @[JSON::Field(key: "invitations")]
        getter invitations : Array(Types::Invitation)?

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @invitations : Array(Types::Invitation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMalwareProtectionPlansRequest
        include JSON::Serializable

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data. The default page
        # size is 100 plans.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      struct ListMalwareProtectionPlansResponse
        include JSON::Serializable

        # A list of unique identifiers associated with each Malware Protection plan.
        @[JSON::Field(key: "malwareProtectionPlans")]
        getter malware_protection_plans : Array(Types::MalwareProtectionPlanSummary)?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @malware_protection_plans : Array(Types::MalwareProtectionPlanSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the criteria used to filter the malware scan entries.
      struct ListMalwareScansFilterCriteria
        include JSON::Serializable

        # Represents a condition that when matched will be added to the response of the operation.
        @[JSON::Field(key: "filterCriterion")]
        getter list_malware_scans_filter_criterion : Array(Types::ListMalwareScansFilterCriterion)?

        def initialize(
          @list_malware_scans_filter_criterion : Array(Types::ListMalwareScansFilterCriterion)? = nil
        )
        end
      end

      # Represents a condition that when matched will be added to the response of the operation.
      # Irrespective of using any filter criteria, an administrator account can view the scan entries for
      # all of its member accounts. However, each member account can view the scan entries only for their
      # own account.
      struct ListMalwareScansFilterCriterion
        include JSON::Serializable

        # Contains information about the condition.
        @[JSON::Field(key: "filterCondition")]
        getter filter_condition : Types::FilterCondition?

        # An enum value representing possible scan properties to match with given scan entries.
        @[JSON::Field(key: "criterionKey")]
        getter list_malware_scans_criterion_key : String?

        def initialize(
          @filter_condition : Types::FilterCondition? = nil,
          @list_malware_scans_criterion_key : String? = nil
        )
        end
      end

      struct ListMalwareScansRequest
        include JSON::Serializable

        # Represents the criteria used to filter the malware scan entries.
        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::ListMalwareScansFilterCriteria?

        # You can use this parameter to indicate the maximum number of items that you want in the response.
        # The default value is 50. The maximum value is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Represents the criteria used for sorting malware scan entries.
        @[JSON::Field(key: "sortCriteria")]
        getter sort_criteria : Types::SortCriteria?

        def initialize(
          @filter_criteria : Types::ListMalwareScansFilterCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_criteria : Types::SortCriteria? = nil
        )
        end
      end

      struct ListMalwareScansResponse
        include JSON::Serializable

        # The list of malware scans associated with the provided input parameters.
        @[JSON::Field(key: "scans")]
        getter scans : Array(Types::MalwareScan)

        # The pagination parameter to be used on the next list operation to retrieve more scans.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @scans : Array(Types::MalwareScan),
          @next_token : String? = nil
        )
        end
      end

      struct ListMembersRequest
        include JSON::Serializable

        # The unique ID of the detector that is associated with the member. To find the detectorId in the
        # current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 50. The maximum value is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies whether to only return associated members or to return all members (including members who
        # haven't been invited yet or have been disassociated). Member accounts must have been previously
        # associated with the GuardDuty administrator account using Create Members .
        @[JSON::Field(key: "onlyAssociated")]
        getter only_associated : String?

        def initialize(
          @detector_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @only_associated : String? = nil
        )
        end
      end

      struct ListMembersResponse
        include JSON::Serializable

        # A list of members. The values for email and invitedAt are available only if the member accounts are
        # added by invitation.
        @[JSON::Field(key: "members")]
        getter members : Array(Types::Member)?

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @members : Array(Types::Member)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListOrganizationAdminAccountsRequest
        include JSON::Serializable

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListOrganizationAdminAccountsResponse
        include JSON::Serializable

        # A list of accounts configured as GuardDuty delegated administrators.
        @[JSON::Field(key: "adminAccounts")]
        getter admin_accounts : Array(Types::AdminAccount)?

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @admin_accounts : Array(Types::AdminAccount)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPublishingDestinationsRequest
        include JSON::Serializable

        # The detector ID for which you want to retrieve the publishing destination. To find the detectorId in
        # the current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPublishingDestinationsResponse
        include JSON::Serializable

        # A Destinations object that includes information about each publishing destination returned.
        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::Destination)

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @destinations : Array(Types::Destination),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the given GuardDuty resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags associated with the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListThreatEntitySetsRequest
        include JSON::Serializable

        # The unique ID of the GuardDuty detector that is associated with this threat entity set. To find the
        # detectorId in the current Region, see the Settings page in the GuardDuty console, or run the
        # ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListThreatEntitySetsResponse
        include JSON::Serializable

        # The IDs of the threat entity set resources.
        @[JSON::Field(key: "threatEntitySetIds")]
        getter threat_entity_set_ids : Array(String)

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @threat_entity_set_ids : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListThreatIntelSetsRequest
        include JSON::Serializable

        # The unique ID of the detector that is associated with the threatIntelSet. To find the detectorId in
        # the current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # You can use this parameter to indicate the maximum number of items that you want in the response.
        # The default value is 50. The maximum value is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter to paginate results in the response. Set the value of this parameter to
        # null on your first call to the list action. For subsequent calls to the action, fill nextToken in
        # the request with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListThreatIntelSetsResponse
        include JSON::Serializable

        # The IDs of the ThreatIntelSet resources.
        @[JSON::Field(key: "threatIntelSetIds")]
        getter threat_intel_set_ids : Array(String)

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @threat_intel_set_ids : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListTrustedEntitySetsRequest
        include JSON::Serializable

        # The unique ID of the GuardDuty detector that is associated with this threat entity set. To find the
        # detectorId in the current Region, see the Settings page in the GuardDuty console, or run the
        # ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the list action. For subsequent calls to the action, fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @detector_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTrustedEntitySetsResponse
        include JSON::Serializable

        # The IDs of the trusted entity set resources.
        @[JSON::Field(key: "trustedEntitySetIds")]
        getter trusted_entity_set_ids : Array(String)

        # The pagination parameter to be used on the next list operation to retrieve more items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @trusted_entity_set_ids : Array(String),
          @next_token : String? = nil
        )
        end
      end

      # Contains information about the local IP address of the connection.
      struct LocalIpDetails
        include JSON::Serializable

        # The IPv4 local address of the connection.
        @[JSON::Field(key: "ipAddressV4")]
        getter ip_address_v4 : String?

        # The IPv6 local address of the connection.
        @[JSON::Field(key: "ipAddressV6")]
        getter ip_address_v6 : String?

        def initialize(
          @ip_address_v4 : String? = nil,
          @ip_address_v6 : String? = nil
        )
        end
      end

      # Contains information about the port for the local connection.
      struct LocalPortDetails
        include JSON::Serializable

        # The port number of the local connection.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The port name of the local connection.
        @[JSON::Field(key: "portName")]
        getter port_name : String?

        def initialize(
          @port : Int32? = nil,
          @port_name : String? = nil
        )
        end
      end

      # Information about the login attempts.
      struct LoginAttribute
        include JSON::Serializable

        # Indicates the application name used to attempt log in.
        @[JSON::Field(key: "application")]
        getter application : String?

        # Represents the sum of failed (unsuccessful) login attempts made to establish a connection to the
        # database instance.
        @[JSON::Field(key: "failedLoginAttempts")]
        getter failed_login_attempts : Int32?

        # Represents the sum of successful connections (a correct combination of login attributes) made to the
        # database instance by the actor.
        @[JSON::Field(key: "successfulLoginAttempts")]
        getter successful_login_attempts : Int32?

        # Indicates the user name which attempted to log in.
        @[JSON::Field(key: "user")]
        getter user : String?

        def initialize(
          @application : String? = nil,
          @failed_login_attempts : Int32? = nil,
          @successful_login_attempts : Int32? = nil,
          @user : String? = nil
        )
        end
      end

      # Describes whether Malware Protection will be enabled as a data source.
      struct MalwareProtectionConfiguration
        include JSON::Serializable

        # Describes the configuration of Malware Protection for EC2 instances with findings.
        @[JSON::Field(key: "scanEc2InstanceWithFindings")]
        getter scan_ec2_instance_with_findings : Types::ScanEc2InstanceWithFindings?

        def initialize(
          @scan_ec2_instance_with_findings : Types::ScanEc2InstanceWithFindings? = nil
        )
        end
      end

      # An object that contains information on the status of all Malware Protection data sources.
      struct MalwareProtectionConfigurationResult
        include JSON::Serializable

        # Describes the configuration of Malware Protection for EC2 instances with findings.
        @[JSON::Field(key: "scanEc2InstanceWithFindings")]
        getter scan_ec2_instance_with_findings : Types::ScanEc2InstanceWithFindingsResult?

        # The GuardDuty Malware Protection service role.
        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        def initialize(
          @scan_ec2_instance_with_findings : Types::ScanEc2InstanceWithFindingsResult? = nil,
          @service_role : String? = nil
        )
        end
      end

      # Provides details about Malware Protection when it is enabled as a data source.
      struct MalwareProtectionDataSourceFreeTrial
        include JSON::Serializable

        # Describes whether Malware Protection for EC2 instances with findings is enabled as a data source.
        @[JSON::Field(key: "scanEc2InstanceWithFindings")]
        getter scan_ec2_instance_with_findings : Types::DataSourceFreeTrial?

        def initialize(
          @scan_ec2_instance_with_findings : Types::DataSourceFreeTrial? = nil
        )
        end
      end

      # Contains finding configuration details about the malware scan.
      struct MalwareProtectionFindingsScanConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "incrementalScanDetails")]
        getter incremental_scan_details : Types::IncrementalScanDetails?

        # The event that triggered the malware scan.
        @[JSON::Field(key: "triggerType")]
        getter trigger_type : String?

        def initialize(
          @incremental_scan_details : Types::IncrementalScanDetails? = nil,
          @trigger_type : String? = nil
        )
        end
      end

      # Information about whether the tags will be added to the S3 object after scanning.
      struct MalwareProtectionPlanActions
        include JSON::Serializable

        # Indicates whether the scanned S3 object will have tags about the scan result.
        @[JSON::Field(key: "tagging")]
        getter tagging : Types::MalwareProtectionPlanTaggingAction?

        def initialize(
          @tagging : Types::MalwareProtectionPlanTaggingAction? = nil
        )
        end
      end

      # Information about the issue code and message associated to the status of your Malware Protection
      # plan.
      struct MalwareProtectionPlanStatusReason
        include JSON::Serializable

        # Issue code.
        @[JSON::Field(key: "code")]
        getter code : String?

        # Issue message that specifies the reason. For information about potential troubleshooting steps, see
        # Troubleshooting Malware Protection for S3 status issues in the Amazon GuardDuty User Guide .
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Information about the Malware Protection plan resource.
      struct MalwareProtectionPlanSummary
        include JSON::Serializable

        # A unique identifier associated with Malware Protection plan.
        @[JSON::Field(key: "malwareProtectionPlanId")]
        getter malware_protection_plan_id : String?

        def initialize(
          @malware_protection_plan_id : String? = nil
        )
        end
      end

      # Information about adding tags to the scanned S3 object after the scan result.
      struct MalwareProtectionPlanTaggingAction
        include JSON::Serializable

        # Indicates whether or not the tags will added.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # Contains information about a particular malware scan.
      struct MalwareScan
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resource for the given malware scan.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The type of resource that was scanned for malware.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The timestamp representing when the malware scan was completed.
        @[JSON::Field(key: "scanCompletedAt")]
        getter scan_completed_at : Time?

        # A unique identifier that gets generated when you invoke the API without any error. Each malware scan
        # has a corresponding scan ID. Using this scan ID, you can monitor the status of your malware scan.
        @[JSON::Field(key: "scanId")]
        getter scan_id : String?

        # An enum value representing the result of the malware scan.
        @[JSON::Field(key: "scanResultStatus")]
        getter scan_result_status : String?

        # The timestamp representing when the malware scan was started.
        @[JSON::Field(key: "scanStartedAt")]
        getter scan_started_at : Time?

        # An enum value representing the current status of the malware scan.
        @[JSON::Field(key: "scanStatus")]
        getter scan_status : String?

        # An enum value representing the type of scan that was initiated.
        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        def initialize(
          @resource_arn : String? = nil,
          @resource_type : String? = nil,
          @scan_completed_at : Time? = nil,
          @scan_id : String? = nil,
          @scan_result_status : String? = nil,
          @scan_started_at : Time? = nil,
          @scan_status : String? = nil,
          @scan_type : String? = nil
        )
        end
      end

      # Information about the malware scan that generated a GuardDuty finding.
      struct MalwareScanDetails
        include JSON::Serializable

        # The category of the malware scan.
        @[JSON::Field(key: "scanCategory")]
        getter scan_category : String?

        # The configuration settings used for the malware scan.
        @[JSON::Field(key: "scanConfiguration")]
        getter scan_configuration : Types::MalwareProtectionFindingsScanConfiguration?

        # The unique identifier for the malware scan.
        @[JSON::Field(key: "scanId")]
        getter scan_id : String?

        # The type of malware scan performed.
        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        # Information about the detected threats associated with the generated GuardDuty finding.
        @[JSON::Field(key: "threats")]
        getter threats : Array(Types::Threat)?

        # The number of unique malware threats detected during the scan.
        @[JSON::Field(key: "uniqueThreatCount")]
        getter unique_threat_count : Int32?

        def initialize(
          @scan_category : String? = nil,
          @scan_configuration : Types::MalwareProtectionFindingsScanConfiguration? = nil,
          @scan_id : String? = nil,
          @scan_type : String? = nil,
          @threats : Array(Types::Threat)? = nil,
          @unique_threat_count : Int32? = nil
        )
        end
      end

      # Contains information about the administrator account and invitation.
      struct Master
        include JSON::Serializable

        # The ID of the account used as the administrator account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The value used to validate the administrator account to the member account.
        @[JSON::Field(key: "invitationId")]
        getter invitation_id : String?

        # The timestamp when the invitation was sent.
        @[JSON::Field(key: "invitedAt")]
        getter invited_at : String?

        # The status of the relationship between the administrator and member accounts.
        @[JSON::Field(key: "relationshipStatus")]
        getter relationship_status : String?

        def initialize(
          @account_id : String? = nil,
          @invitation_id : String? = nil,
          @invited_at : String? = nil,
          @relationship_status : String? = nil
        )
        end
      end

      # Contains information about the member account.
      struct Member
        include JSON::Serializable

        # The ID of the member account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The email address of the member account.
        @[JSON::Field(key: "email")]
        getter email : String

        # The administrator account ID.
        @[JSON::Field(key: "masterId")]
        getter master_id : String

        # The status of the relationship between the member and the administrator.
        @[JSON::Field(key: "relationshipStatus")]
        getter relationship_status : String

        # The last-updated timestamp of the member.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : String

        # The administrator account ID.
        @[JSON::Field(key: "administratorId")]
        getter administrator_id : String?

        # The detector ID of the member account.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # The timestamp when the invitation was sent.
        @[JSON::Field(key: "invitedAt")]
        getter invited_at : String?

        def initialize(
          @account_id : String,
          @email : String,
          @master_id : String,
          @relationship_status : String,
          @updated_at : String,
          @administrator_id : String? = nil,
          @detector_id : String? = nil,
          @invited_at : String? = nil
        )
        end
      end

      # Information about the additional configuration for the member account.
      struct MemberAdditionalConfiguration
        include JSON::Serializable

        # Name of the additional configuration.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Status of the additional configuration.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about the additional configuration for the member account.
      struct MemberAdditionalConfigurationResult
        include JSON::Serializable

        # Indicates the name of the additional configuration that is set for the member account.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Indicates the status of the additional configuration that is set for the member account.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp at which the additional configuration was set for the member account. This is in UTC
        # format.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @name : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Contains information on which data sources are enabled for a member account.
      struct MemberDataSourceConfiguration
        include JSON::Serializable

        # The account ID for the member account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # Contains information on the status of data sources for the account.
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Types::DataSourceConfigurationsResult?

        # Contains information about the status of the features for the member account.
        @[JSON::Field(key: "features")]
        getter features : Array(Types::MemberFeaturesConfigurationResult)?

        def initialize(
          @account_id : String,
          @data_sources : Types::DataSourceConfigurationsResult? = nil,
          @features : Array(Types::MemberFeaturesConfigurationResult)? = nil
        )
        end
      end

      # Contains information about the features for the member account.
      struct MemberFeaturesConfiguration
        include JSON::Serializable

        # Additional configuration of the feature for the member account.
        @[JSON::Field(key: "additionalConfiguration")]
        getter additional_configuration : Array(Types::MemberAdditionalConfiguration)?

        # The name of the feature.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the feature.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @additional_configuration : Array(Types::MemberAdditionalConfiguration)? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about the features for the member account.
      struct MemberFeaturesConfigurationResult
        include JSON::Serializable

        # Indicates the additional configuration of the feature that is configured for the member account.
        @[JSON::Field(key: "additionalConfiguration")]
        getter additional_configuration : Array(Types::MemberAdditionalConfigurationResult)?

        # Indicates the name of the feature that is enabled for the detector.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Indicates the status of the feature that is enabled for the detector.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp at which the feature object was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @additional_configuration : Array(Types::MemberAdditionalConfigurationResult)? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Contains information about the network connection.
      struct NetworkConnection
        include JSON::Serializable

        # The direction in which the network traffic is flowing.
        @[JSON::Field(key: "direction")]
        getter direction : String

        def initialize(
          @direction : String
        )
        end
      end

      # Contains information about the NETWORK_CONNECTION action described in the finding.
      struct NetworkConnectionAction
        include JSON::Serializable

        # Indicates whether EC2 blocked the network connection to your instance.
        @[JSON::Field(key: "blocked")]
        getter blocked : Bool?

        # The network connection direction.
        @[JSON::Field(key: "connectionDirection")]
        getter connection_direction : String?

        # The local IP information of the connection.
        @[JSON::Field(key: "localIpDetails")]
        getter local_ip_details : Types::LocalIpDetails?

        # The EC2 instance's local elastic network interface utilized for the connection.
        @[JSON::Field(key: "localNetworkInterface")]
        getter local_network_interface : String?

        # The local port information of the connection.
        @[JSON::Field(key: "localPortDetails")]
        getter local_port_details : Types::LocalPortDetails?

        # The network connection protocol.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The remote IP information of the connection.
        @[JSON::Field(key: "remoteIpDetails")]
        getter remote_ip_details : Types::RemoteIpDetails?

        # The remote port information of the connection.
        @[JSON::Field(key: "remotePortDetails")]
        getter remote_port_details : Types::RemotePortDetails?

        def initialize(
          @blocked : Bool? = nil,
          @connection_direction : String? = nil,
          @local_ip_details : Types::LocalIpDetails? = nil,
          @local_network_interface : String? = nil,
          @local_port_details : Types::LocalPortDetails? = nil,
          @protocol : String? = nil,
          @remote_ip_details : Types::RemoteIpDetails? = nil,
          @remote_port_details : Types::RemotePortDetails? = nil
        )
        end
      end

      # Contains information about network endpoints that were observed in the attack sequence.
      struct NetworkEndpoint
        include JSON::Serializable

        # The ID of the network endpoint.
        @[JSON::Field(key: "id")]
        getter id : String

        # The Autonomous System (AS) of the network endpoint.
        @[JSON::Field(key: "autonomousSystem")]
        getter autonomous_system : Types::AutonomousSystem?

        # Information about the network connection.
        @[JSON::Field(key: "connection")]
        getter connection : Types::NetworkConnection?

        # The domain information for the network endpoint.
        @[JSON::Field(key: "domain")]
        getter domain : String?

        # The IP address associated with the network endpoint.
        @[JSON::Field(key: "ip")]
        getter ip : String?

        # Information about the location of the network endpoint.
        @[JSON::Field(key: "location")]
        getter location : Types::NetworkGeoLocation?

        # The port number associated with the network endpoint.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        def initialize(
          @id : String,
          @autonomous_system : Types::AutonomousSystem? = nil,
          @connection : Types::NetworkConnection? = nil,
          @domain : String? = nil,
          @ip : String? = nil,
          @location : Types::NetworkGeoLocation? = nil,
          @port : Int32? = nil
        )
        end
      end

      # Contains information about network endpoint location.
      struct NetworkGeoLocation
        include JSON::Serializable

        # The name of the city.
        @[JSON::Field(key: "city")]
        getter city : String

        # The name of the country.
        @[JSON::Field(key: "country")]
        getter country : String

        # The latitude information of the endpoint location.
        @[JSON::Field(key: "lat")]
        getter latitude : Float64

        # The longitude information of the endpoint location.
        @[JSON::Field(key: "lon")]
        getter longitude : Float64

        def initialize(
          @city : String,
          @country : String,
          @latitude : Float64,
          @longitude : Float64
        )
        end
      end

      # Contains information about the elastic network interface of the EC2 instance.
      struct NetworkInterface
        include JSON::Serializable

        # A list of IPv6 addresses for the EC2 instance.
        @[JSON::Field(key: "ipv6Addresses")]
        getter ipv6_addresses : Array(String)?

        # The ID of the network interface.
        @[JSON::Field(key: "networkInterfaceId")]
        getter network_interface_id : String?

        # The private DNS name of the EC2 instance.
        @[JSON::Field(key: "privateDnsName")]
        getter private_dns_name : String?

        # The private IP address of the EC2 instance.
        @[JSON::Field(key: "privateIpAddress")]
        getter private_ip_address : String?

        # Other private IP address information of the EC2 instance.
        @[JSON::Field(key: "privateIpAddresses")]
        getter private_ip_addresses : Array(Types::PrivateIpAddressDetails)?

        # The public DNS name of the EC2 instance.
        @[JSON::Field(key: "publicDnsName")]
        getter public_dns_name : String?

        # The public IP address of the EC2 instance.
        @[JSON::Field(key: "publicIp")]
        getter public_ip : String?

        # The security groups associated with the EC2 instance.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(Types::SecurityGroup)?

        # The subnet ID of the EC2 instance.
        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String?

        # The VPC ID of the EC2 instance.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @ipv6_addresses : Array(String)? = nil,
          @network_interface_id : String? = nil,
          @private_dns_name : String? = nil,
          @private_ip_address : String? = nil,
          @private_ip_addresses : Array(Types::PrivateIpAddressDetails)? = nil,
          @public_dns_name : String? = nil,
          @public_ip : String? = nil,
          @security_groups : Array(Types::SecurityGroup)? = nil,
          @subnet_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Contains information about the observed behavior.
      struct Observations
        include JSON::Serializable

        # The text that was unusual.
        @[JSON::Field(key: "text")]
        getter text : Array(String)?

        def initialize(
          @text : Array(String)? = nil
        )
        end
      end

      # Contains information about the ISP organization of the remote IP address.
      struct Organization
        include JSON::Serializable

        # The Autonomous System Number (ASN) of the internet provider of the remote IP address.
        @[JSON::Field(key: "asn")]
        getter asn : String?

        # The organization that registered this ASN.
        @[JSON::Field(key: "asnOrg")]
        getter asn_org : String?

        # The ISP information for the internet provider.
        @[JSON::Field(key: "isp")]
        getter isp : String?

        # The name of the internet provider.
        @[JSON::Field(key: "org")]
        getter org : String?

        def initialize(
          @asn : String? = nil,
          @asn_org : String? = nil,
          @isp : String? = nil,
          @org : String? = nil
        )
        end
      end

      # A list of additional configurations which will be configured for the organization. Additional
      # configuration applies to only GuardDuty Runtime Monitoring protection plan.
      struct OrganizationAdditionalConfiguration
        include JSON::Serializable

        # The status of the additional configuration that will be configured for the organization. Use one of
        # the following values to configure the feature status for the entire organization: NEW : Indicates
        # that when a new account joins the organization, they will have the additional configuration enabled
        # automatically. ALL : Indicates that all accounts in the organization have the additional
        # configuration enabled automatically. This includes NEW accounts that join the organization and
        # accounts that may have been suspended or removed from the organization in GuardDuty. It may take up
        # to 24 hours to update the configuration for all the member accounts. NONE : Indicates that the
        # additional configuration will not be automatically enabled for any account in the organization. The
        # administrator must manage the additional configuration for each account individually.
        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : String?

        # The name of the additional configuration that will be configured for the organization. These values
        # are applicable to only Runtime Monitoring protection plan.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @auto_enable : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A list of additional configuration which will be configured for the organization.
      struct OrganizationAdditionalConfigurationResult
        include JSON::Serializable

        # Describes the status of the additional configuration that is configured for the member accounts
        # within the organization. One of the following values is the status for the entire organization: NEW
        # : Indicates that when a new account joins the organization, they will have the additional
        # configuration enabled automatically. ALL : Indicates that all accounts in the organization have the
        # additional configuration enabled automatically. This includes NEW accounts that join the
        # organization and accounts that may have been suspended or removed from the organization in
        # GuardDuty. It may take up to 24 hours to update the configuration for all the member accounts. NONE
        # : Indicates that the additional configuration will not be automatically enabled for any account in
        # the organization. The administrator must manage the additional configuration for each account
        # individually.
        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : String?

        # The name of the additional configuration that is configured for the member accounts within the
        # organization. These values are applicable to only Runtime Monitoring protection plan.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @auto_enable : String? = nil,
          @name : String? = nil
        )
        end
      end

      # An object that contains information on which data sources will be configured to be automatically
      # enabled for new members within the organization.
      struct OrganizationDataSourceConfigurations
        include JSON::Serializable

        # Describes the configuration of Kubernetes data sources for new members of the organization.
        @[JSON::Field(key: "kubernetes")]
        getter kubernetes : Types::OrganizationKubernetesConfiguration?

        # Describes the configuration of Malware Protection for new members of the organization.
        @[JSON::Field(key: "malwareProtection")]
        getter malware_protection : Types::OrganizationMalwareProtectionConfiguration?

        # Describes whether S3 data event logs are enabled for new members of the organization.
        @[JSON::Field(key: "s3Logs")]
        getter s3_logs : Types::OrganizationS3LogsConfiguration?

        def initialize(
          @kubernetes : Types::OrganizationKubernetesConfiguration? = nil,
          @malware_protection : Types::OrganizationMalwareProtectionConfiguration? = nil,
          @s3_logs : Types::OrganizationS3LogsConfiguration? = nil
        )
        end
      end

      # An object that contains information on which data sources are automatically enabled for new members
      # within the organization.
      struct OrganizationDataSourceConfigurationsResult
        include JSON::Serializable

        # Describes whether S3 data event logs are enabled as a data source.
        @[JSON::Field(key: "s3Logs")]
        getter s3_logs : Types::OrganizationS3LogsConfigurationResult

        # Describes the configuration of Kubernetes data sources.
        @[JSON::Field(key: "kubernetes")]
        getter kubernetes : Types::OrganizationKubernetesConfigurationResult?

        # Describes the configuration of Malware Protection data source for an organization.
        @[JSON::Field(key: "malwareProtection")]
        getter malware_protection : Types::OrganizationMalwareProtectionConfigurationResult?

        def initialize(
          @s3_logs : Types::OrganizationS3LogsConfigurationResult,
          @kubernetes : Types::OrganizationKubernetesConfigurationResult? = nil,
          @malware_protection : Types::OrganizationMalwareProtectionConfigurationResult? = nil
        )
        end
      end

      # Information about GuardDuty coverage statistics for members in your Amazon Web Services
      # organization.
      struct OrganizationDetails
        include JSON::Serializable

        # Information about the GuardDuty coverage statistics for members in your Amazon Web Services
        # organization.
        @[JSON::Field(key: "organizationStatistics")]
        getter organization_statistics : Types::OrganizationStatistics?

        # The timestamp at which the organization statistics was last updated. This is in UTC format.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @organization_statistics : Types::OrganizationStatistics? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Organization-wide EBS volumes scan configuration.
      struct OrganizationEbsVolumes
        include JSON::Serializable

        # Whether scanning EBS volumes should be auto-enabled for new members joining the organization.
        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Bool?

        def initialize(
          @auto_enable : Bool? = nil
        )
        end
      end

      # An object that contains information on the status of whether EBS volumes scanning will be enabled as
      # a data source for an organization.
      struct OrganizationEbsVolumesResult
        include JSON::Serializable

        # An object that contains the status of whether scanning EBS volumes should be auto-enabled for new
        # members joining the organization.
        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Bool?

        def initialize(
          @auto_enable : Bool? = nil
        )
        end
      end

      # A list of features which will be configured for the organization.
      struct OrganizationFeatureConfiguration
        include JSON::Serializable

        # The additional information that will be configured for the organization.
        @[JSON::Field(key: "additionalConfiguration")]
        getter additional_configuration : Array(Types::OrganizationAdditionalConfiguration)?

        # Describes the status of the feature that is configured for the member accounts within the
        # organization. One of the following values is the status for the entire organization: NEW : Indicates
        # that when a new account joins the organization, they will have the feature enabled automatically.
        # ALL : Indicates that all accounts in the organization have the feature enabled automatically. This
        # includes NEW accounts that join the organization and accounts that may have been suspended or
        # removed from the organization in GuardDuty. It may take up to 24 hours to update the configuration
        # for all the member accounts. NONE : Indicates that the feature will not be automatically enabled for
        # any account in the organization. The administrator must manage the feature for each account
        # individually.
        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : String?

        # The name of the feature that will be configured for the organization.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @additional_configuration : Array(Types::OrganizationAdditionalConfiguration)? = nil,
          @auto_enable : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A list of features which will be configured for the organization.
      struct OrganizationFeatureConfigurationResult
        include JSON::Serializable

        # The additional configuration that is configured for the member accounts within the organization.
        @[JSON::Field(key: "additionalConfiguration")]
        getter additional_configuration : Array(Types::OrganizationAdditionalConfigurationResult)?

        # Describes the status of the feature that is configured for the member accounts within the
        # organization. NEW : Indicates that when a new account joins the organization, they will have the
        # feature enabled automatically. ALL : Indicates that all accounts in the organization have the
        # feature enabled automatically. This includes NEW accounts that join the organization and accounts
        # that may have been suspended or removed from the organization in GuardDuty. NONE : Indicates that
        # the feature will not be automatically enabled for any account in the organization. In this case,
        # each account will be managed individually by the administrator.
        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : String?

        # The name of the feature that is configured for the member accounts within the organization.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @additional_configuration : Array(Types::OrganizationAdditionalConfigurationResult)? = nil,
          @auto_enable : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Information about the number of accounts that have enabled a specific feature.
      struct OrganizationFeatureStatistics
        include JSON::Serializable

        # Name of the additional configuration.
        @[JSON::Field(key: "additionalConfiguration")]
        getter additional_configuration : Array(Types::OrganizationFeatureStatisticsAdditionalConfiguration)?

        # Total number of accounts that have enabled a specific feature.
        @[JSON::Field(key: "enabledAccountsCount")]
        getter enabled_accounts_count : Int32?

        # Name of the feature.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @additional_configuration : Array(Types::OrganizationFeatureStatisticsAdditionalConfiguration)? = nil,
          @enabled_accounts_count : Int32? = nil,
          @name : String? = nil
        )
        end
      end

      # Information about the coverage statistic for the additional configuration of the feature.
      struct OrganizationFeatureStatisticsAdditionalConfiguration
        include JSON::Serializable

        # Total number of accounts that have enabled the additional configuration.
        @[JSON::Field(key: "enabledAccountsCount")]
        getter enabled_accounts_count : Int32?

        # Name of the additional configuration within a feature.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @enabled_accounts_count : Int32? = nil,
          @name : String? = nil
        )
        end
      end

      # Organization-wide Kubernetes audit logs configuration.
      struct OrganizationKubernetesAuditLogsConfiguration
        include JSON::Serializable

        # A value that contains information on whether Kubernetes audit logs should be enabled automatically
        # as a data source for the organization.
        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Bool

        def initialize(
          @auto_enable : Bool
        )
        end
      end

      # The current configuration of Kubernetes audit logs as a data source for the organization.
      struct OrganizationKubernetesAuditLogsConfigurationResult
        include JSON::Serializable

        # Whether Kubernetes audit logs data source should be auto-enabled for new members joining the
        # organization.
        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Bool

        def initialize(
          @auto_enable : Bool
        )
        end
      end

      # Organization-wide Kubernetes data sources configurations.
      struct OrganizationKubernetesConfiguration
        include JSON::Serializable

        # Whether Kubernetes audit logs data source should be auto-enabled for new members joining the
        # organization.
        @[JSON::Field(key: "auditLogs")]
        getter audit_logs : Types::OrganizationKubernetesAuditLogsConfiguration

        def initialize(
          @audit_logs : Types::OrganizationKubernetesAuditLogsConfiguration
        )
        end
      end

      # The current configuration of all Kubernetes data sources for the organization.
      struct OrganizationKubernetesConfigurationResult
        include JSON::Serializable

        # The current configuration of Kubernetes audit logs as a data source for the organization.
        @[JSON::Field(key: "auditLogs")]
        getter audit_logs : Types::OrganizationKubernetesAuditLogsConfigurationResult

        def initialize(
          @audit_logs : Types::OrganizationKubernetesAuditLogsConfigurationResult
        )
        end
      end

      # Organization-wide Malware Protection configurations.
      struct OrganizationMalwareProtectionConfiguration
        include JSON::Serializable

        # Whether Malware Protection for EC2 instances with findings should be auto-enabled for new members
        # joining the organization.
        @[JSON::Field(key: "scanEc2InstanceWithFindings")]
        getter scan_ec2_instance_with_findings : Types::OrganizationScanEc2InstanceWithFindings?

        def initialize(
          @scan_ec2_instance_with_findings : Types::OrganizationScanEc2InstanceWithFindings? = nil
        )
        end
      end

      # An object that contains information on the status of all Malware Protection data source for an
      # organization.
      struct OrganizationMalwareProtectionConfigurationResult
        include JSON::Serializable

        # Describes the configuration for scanning EC2 instances with findings for an organization.
        @[JSON::Field(key: "scanEc2InstanceWithFindings")]
        getter scan_ec2_instance_with_findings : Types::OrganizationScanEc2InstanceWithFindingsResult?

        def initialize(
          @scan_ec2_instance_with_findings : Types::OrganizationScanEc2InstanceWithFindingsResult? = nil
        )
        end
      end

      # Describes whether S3 data event logs will be automatically enabled for new members of the
      # organization.
      struct OrganizationS3LogsConfiguration
        include JSON::Serializable

        # A value that contains information on whether S3 data event logs will be enabled automatically as a
        # data source for the organization.
        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Bool

        def initialize(
          @auto_enable : Bool
        )
        end
      end

      # The current configuration of S3 data event logs as a data source for the organization.
      struct OrganizationS3LogsConfigurationResult
        include JSON::Serializable

        # A value that describes whether S3 data event logs are automatically enabled for new members of the
        # organization.
        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Bool

        def initialize(
          @auto_enable : Bool
        )
        end
      end

      # Organization-wide EC2 instances with findings scan configuration.
      struct OrganizationScanEc2InstanceWithFindings
        include JSON::Serializable

        # Whether scanning EBS volumes should be auto-enabled for new members joining the organization.
        @[JSON::Field(key: "ebsVolumes")]
        getter ebs_volumes : Types::OrganizationEbsVolumes?

        def initialize(
          @ebs_volumes : Types::OrganizationEbsVolumes? = nil
        )
        end
      end

      # An object that contains information on the status of scanning EC2 instances with findings for an
      # organization.
      struct OrganizationScanEc2InstanceWithFindingsResult
        include JSON::Serializable

        # Describes the configuration for scanning EBS volumes for an organization.
        @[JSON::Field(key: "ebsVolumes")]
        getter ebs_volumes : Types::OrganizationEbsVolumesResult?

        def initialize(
          @ebs_volumes : Types::OrganizationEbsVolumesResult? = nil
        )
        end
      end

      # Information about the coverage statistics of the features for the entire Amazon Web Services
      # organization. When you create a new Amazon Web Services organization, it might take up to 24 hours
      # to generate the statistics summary for this organization.
      struct OrganizationStatistics
        include JSON::Serializable

        # Total number of active accounts in your Amazon Web Services organization that are associated with
        # GuardDuty.
        @[JSON::Field(key: "activeAccountsCount")]
        getter active_accounts_count : Int32?

        # Retrieves the coverage statistics for each feature.
        @[JSON::Field(key: "countByFeature")]
        getter count_by_feature : Array(Types::OrganizationFeatureStatistics)?

        # Total number of accounts that have enabled GuardDuty.
        @[JSON::Field(key: "enabledAccountsCount")]
        getter enabled_accounts_count : Int32?

        # Total number of accounts in your Amazon Web Services organization that are associated with
        # GuardDuty.
        @[JSON::Field(key: "memberAccountsCount")]
        getter member_accounts_count : Int32?

        # Total number of accounts in your Amazon Web Services organization.
        @[JSON::Field(key: "totalAccountsCount")]
        getter total_accounts_count : Int32?

        def initialize(
          @active_accounts_count : Int32? = nil,
          @count_by_feature : Array(Types::OrganizationFeatureStatistics)? = nil,
          @enabled_accounts_count : Int32? = nil,
          @member_accounts_count : Int32? = nil,
          @total_accounts_count : Int32? = nil
        )
        end
      end

      # Contains information on the owner of the bucket.
      struct Owner
        include JSON::Serializable

        # The canonical user ID of the bucket owner. For information about locating your canonical user ID see
        # Finding Your Account Canonical User ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # Contains information about how permissions are configured for the S3 bucket.
      struct PermissionConfiguration
        include JSON::Serializable

        # Contains information about the account level permissions on the S3 bucket.
        @[JSON::Field(key: "accountLevelPermissions")]
        getter account_level_permissions : Types::AccountLevelPermissions?

        # Contains information about the bucket level permissions for the S3 bucket.
        @[JSON::Field(key: "bucketLevelPermissions")]
        getter bucket_level_permissions : Types::BucketLevelPermissions?

        def initialize(
          @account_level_permissions : Types::AccountLevelPermissions? = nil,
          @bucket_level_permissions : Types::BucketLevelPermissions? = nil
        )
        end
      end

      # Contains information about the PORT_PROBE action described in the finding.
      struct PortProbeAction
        include JSON::Serializable

        # Indicates whether EC2 blocked the port probe to the instance, such as with an ACL.
        @[JSON::Field(key: "blocked")]
        getter blocked : Bool?

        # A list of objects related to port probe details.
        @[JSON::Field(key: "portProbeDetails")]
        getter port_probe_details : Array(Types::PortProbeDetail)?

        def initialize(
          @blocked : Bool? = nil,
          @port_probe_details : Array(Types::PortProbeDetail)? = nil
        )
        end
      end

      # Contains information about the port probe details.
      struct PortProbeDetail
        include JSON::Serializable

        # The local IP information of the connection.
        @[JSON::Field(key: "localIpDetails")]
        getter local_ip_details : Types::LocalIpDetails?

        # The local port information of the connection.
        @[JSON::Field(key: "localPortDetails")]
        getter local_port_details : Types::LocalPortDetails?

        # The remote IP information of the connection.
        @[JSON::Field(key: "remoteIpDetails")]
        getter remote_ip_details : Types::RemoteIpDetails?

        def initialize(
          @local_ip_details : Types::LocalIpDetails? = nil,
          @local_port_details : Types::LocalPortDetails? = nil,
          @remote_ip_details : Types::RemoteIpDetails? = nil
        )
        end
      end

      # Contains other private IP address information of the EC2 instance.
      struct PrivateIpAddressDetails
        include JSON::Serializable

        # The private DNS name of the EC2 instance.
        @[JSON::Field(key: "privateDnsName")]
        getter private_dns_name : String?

        # The private IP address of the EC2 instance.
        @[JSON::Field(key: "privateIpAddress")]
        getter private_ip_address : String?

        def initialize(
          @private_dns_name : String? = nil,
          @private_ip_address : String? = nil
        )
        end
      end

      # Information about the observed process.
      struct ProcessDetails
        include JSON::Serializable

        # The effective user ID of the user that executed the process.
        @[JSON::Field(key: "euid")]
        getter euid : Int32?

        # The absolute path of the process executable file.
        @[JSON::Field(key: "executablePath")]
        getter executable_path : String?

        # The SHA256 hash of the process executable.
        @[JSON::Field(key: "executableSha256")]
        getter executable_sha256 : String?

        # Information about the process's lineage.
        @[JSON::Field(key: "lineage")]
        getter lineage : Array(Types::LineageObject)?

        # The name of the process.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the child process.
        @[JSON::Field(key: "namespacePid")]
        getter namespace_pid : Int32?

        # The unique ID of the parent process. This ID is assigned to the parent process by GuardDuty.
        @[JSON::Field(key: "parentUuid")]
        getter parent_uuid : String?

        # The ID of the process.
        @[JSON::Field(key: "pid")]
        getter pid : Int32?

        # The present working directory of the process.
        @[JSON::Field(key: "pwd")]
        getter pwd : String?

        # The time when the process started. This is in UTC format.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The user that executed the process.
        @[JSON::Field(key: "user")]
        getter user : String?

        # The unique ID of the user that executed the process.
        @[JSON::Field(key: "userId")]
        getter user_id : Int32?

        # The unique ID assigned to the process by GuardDuty.
        @[JSON::Field(key: "uuid")]
        getter uuid : String?

        def initialize(
          @euid : Int32? = nil,
          @executable_path : String? = nil,
          @executable_sha256 : String? = nil,
          @lineage : Array(Types::LineageObject)? = nil,
          @name : String? = nil,
          @namespace_pid : Int32? = nil,
          @parent_uuid : String? = nil,
          @pid : Int32? = nil,
          @pwd : String? = nil,
          @start_time : Time? = nil,
          @user : String? = nil,
          @user_id : Int32? = nil,
          @uuid : String? = nil
        )
        end
      end

      # Contains information about the product code for the EC2 instance.
      struct ProductCode
        include JSON::Serializable

        # The product code information.
        @[JSON::Field(key: "productCodeId")]
        getter code : String?

        # The product code type.
        @[JSON::Field(key: "productCodeType")]
        getter product_type : String?

        def initialize(
          @code : String? = nil,
          @product_type : String? = nil
        )
        end
      end

      # Describes the public access policies that apply to the S3 bucket.
      struct PublicAccess
        include JSON::Serializable

        # Describes the effective permission on this bucket after factoring all attached policies.
        @[JSON::Field(key: "effectivePermission")]
        getter effective_permission : String?

        # Contains information about how permissions are configured for the S3 bucket.
        @[JSON::Field(key: "permissionConfiguration")]
        getter permission_configuration : Types::PermissionConfiguration?

        def initialize(
          @effective_permission : String? = nil,
          @permission_configuration : Types::PermissionConfiguration? = nil
        )
        end
      end

      # Describes public access policies that apply to the Amazon S3 bucket. For information about each of
      # the following settings, see Blocking public access to your Amazon S3 storage in the Amazon S3 User
      # Guide .
      struct PublicAccessConfiguration
        include JSON::Serializable

        # Indicates whether or not there is a setting that allows public access to the Amazon S3 buckets
        # through access control lists (ACLs).
        @[JSON::Field(key: "publicAclAccess")]
        getter public_acl_access : String?

        # Indicates whether or not there is a setting that ignores all public access control lists (ACLs) on
        # the Amazon S3 bucket and the objects that it contains.
        @[JSON::Field(key: "publicAclIgnoreBehavior")]
        getter public_acl_ignore_behavior : String?

        # Indicates whether or not there is a setting that restricts access to the bucket with specified
        # policies.
        @[JSON::Field(key: "publicBucketRestrictBehavior")]
        getter public_bucket_restrict_behavior : String?

        # Indicates whether or not there is a setting that allows public access to the Amazon S3 bucket
        # policy.
        @[JSON::Field(key: "publicPolicyAccess")]
        getter public_policy_access : String?

        def initialize(
          @public_acl_access : String? = nil,
          @public_acl_ignore_behavior : String? = nil,
          @public_bucket_restrict_behavior : String? = nil,
          @public_policy_access : String? = nil
        )
        end
      end

      # Contains information about the resource type RDSDBInstance involved in a GuardDuty finding.
      struct RdsDbInstanceDetails
        include JSON::Serializable

        # The identifier of the database cluster that contains the database instance ID involved in the
        # finding.
        @[JSON::Field(key: "dbClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The Amazon Resource Name (ARN) that identifies the database instance involved in the finding.
        @[JSON::Field(key: "dbInstanceArn")]
        getter db_instance_arn : String?

        # The identifier associated to the database instance that was involved in the finding.
        @[JSON::Field(key: "dbInstanceIdentifier")]
        getter db_instance_identifier : String?

        # The unique ID of the database resource involved in the activity that prompted GuardDuty to generate
        # the finding.
        @[JSON::Field(key: "dbiResourceId")]
        getter dbi_resource_id : String?

        # The database engine of the database instance involved in the finding.
        @[JSON::Field(key: "engine")]
        getter engine : String?

        # The version of the database engine that was involved in the finding.
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # Information about the tag key-value pairs.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @db_cluster_identifier : String? = nil,
          @db_instance_arn : String? = nil,
          @db_instance_identifier : String? = nil,
          @dbi_resource_id : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains information about the user and authentication details for a database instance involved in
      # the finding.
      struct RdsDbUserDetails
        include JSON::Serializable

        # The application name used in the anomalous login attempt.
        @[JSON::Field(key: "application")]
        getter application : String?

        # The authentication method used by the user involved in the finding.
        @[JSON::Field(key: "authMethod")]
        getter auth_method : String?

        # The name of the database instance involved in the anomalous login attempt.
        @[JSON::Field(key: "database")]
        getter database : String?

        # The version of the Secure Socket Layer (SSL) used for the network.
        @[JSON::Field(key: "ssl")]
        getter ssl : String?

        # The user name used in the anomalous login attempt.
        @[JSON::Field(key: "user")]
        getter user : String?

        def initialize(
          @application : String? = nil,
          @auth_method : String? = nil,
          @database : String? = nil,
          @ssl : String? = nil,
          @user : String? = nil
        )
        end
      end

      # Contains information about the resource type RDSLimitlessDB that is involved in a GuardDuty finding.
      struct RdsLimitlessDbDetails
        include JSON::Serializable

        # The name of the database cluster that is a part of the Limitless Database.
        @[JSON::Field(key: "dbClusterIdentifier")]
        getter db_cluster_identifier : String?

        # The Amazon Resource Name (ARN) that identifies the DB shard group.
        @[JSON::Field(key: "dbShardGroupArn")]
        getter db_shard_group_arn : String?

        # The name associated with the Limitless DB shard group.
        @[JSON::Field(key: "dbShardGroupIdentifier")]
        getter db_shard_group_identifier : String?

        # The resource identifier of the DB shard group within the Limitless Database.
        @[JSON::Field(key: "dbShardGroupResourceId")]
        getter db_shard_group_resource_id : String?

        # The database engine of the database instance involved in the finding.
        @[JSON::Field(key: "engine")]
        getter engine : String?

        # The version of the database engine.
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # Information about the tag key-value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @db_cluster_identifier : String? = nil,
          @db_shard_group_arn : String? = nil,
          @db_shard_group_identifier : String? = nil,
          @db_shard_group_resource_id : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Indicates that a login attempt was made to the potentially compromised database from a remote IP
      # address.
      struct RdsLoginAttemptAction
        include JSON::Serializable

        # Indicates the login attributes used in the login attempt.
        @[JSON::Field(key: "LoginAttributes")]
        getter login_attributes : Array(Types::LoginAttribute)?

        @[JSON::Field(key: "remoteIpDetails")]
        getter remote_ip_details : Types::RemoteIpDetails?

        def initialize(
          @login_attributes : Array(Types::LoginAttribute)? = nil,
          @remote_ip_details : Types::RemoteIpDetails? = nil
        )
        end
      end

      # Contains information about the recovery point configuration for scanning backup data from Amazon Web
      # Services Backup.
      struct RecoveryPoint
        include JSON::Serializable

        # The name of the Amazon Web Services Backup vault that contains the name of the recovery point to be
        # scanned.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        def initialize(
          @backup_vault_name : String
        )
        end
      end

      # Contains details about the backup recovery point.
      struct RecoveryPointDetails
        include JSON::Serializable

        # The name of the backup vault containing the recovery point.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String?

        # The Amazon Resource Name (ARN) of the recovery point.
        @[JSON::Field(key: "recoveryPointArn")]
        getter recovery_point_arn : String?

        def initialize(
          @backup_vault_name : String? = nil,
          @recovery_point_arn : String? = nil
        )
        end
      end

      # Contains details about the remote Amazon Web Services account that made the API call.
      struct RemoteAccountDetails
        include JSON::Serializable

        # The Amazon Web Services account ID of the remote API caller.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Details on whether the Amazon Web Services account of the remote API caller is related to your
        # GuardDuty environment. If this value is True the API caller is affiliated to your account in some
        # way. If it is False the API caller is from outside your environment.
        @[JSON::Field(key: "affiliated")]
        getter affiliated : Bool?

        def initialize(
          @account_id : String? = nil,
          @affiliated : Bool? = nil
        )
        end
      end

      # Contains information about the remote IP address of the connection.
      struct RemoteIpDetails
        include JSON::Serializable

        # The city information of the remote IP address.
        @[JSON::Field(key: "city")]
        getter city : Types::City?

        # The country code of the remote IP address.
        @[JSON::Field(key: "country")]
        getter country : Types::Country?

        # The location information of the remote IP address.
        @[JSON::Field(key: "geoLocation")]
        getter geo_location : Types::GeoLocation?

        # The IPv4 remote address of the connection.
        @[JSON::Field(key: "ipAddressV4")]
        getter ip_address_v4 : String?

        # The IPv6 remote address of the connection.
        @[JSON::Field(key: "ipAddressV6")]
        getter ip_address_v6 : String?

        # The ISP organization information of the remote IP address.
        @[JSON::Field(key: "organization")]
        getter organization : Types::Organization?

        def initialize(
          @city : Types::City? = nil,
          @country : Types::Country? = nil,
          @geo_location : Types::GeoLocation? = nil,
          @ip_address_v4 : String? = nil,
          @ip_address_v6 : String? = nil,
          @organization : Types::Organization? = nil
        )
        end
      end

      # Contains information about the remote port.
      struct RemotePortDetails
        include JSON::Serializable

        # The port number of the remote connection.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The port name of the remote connection.
        @[JSON::Field(key: "portName")]
        getter port_name : String?

        def initialize(
          @port : Int32? = nil,
          @port_name : String? = nil
        )
        end
      end

      # Contains information about the Amazon Web Services resource associated with the activity that
      # prompted GuardDuty to generate a finding.
      struct Resource
        include JSON::Serializable

        # The IAM access key details (user information) of a user that engaged in the activity that prompted
        # GuardDuty to generate a finding.
        @[JSON::Field(key: "accessKeyDetails")]
        getter access_key_details : Types::AccessKeyDetails?

        @[JSON::Field(key: "containerDetails")]
        getter container_details : Types::Container?

        # Contains details about the EBS snapshot that was scanned.
        @[JSON::Field(key: "ebsSnapshotDetails")]
        getter ebs_snapshot_details : Types::EbsSnapshotDetails?

        # Contains list of scanned and skipped EBS volumes with details.
        @[JSON::Field(key: "ebsVolumeDetails")]
        getter ebs_volume_details : Types::EbsVolumeDetails?

        # Contains details about the EC2 image that was scanned.
        @[JSON::Field(key: "ec2ImageDetails")]
        getter ec2_image_details : Types::Ec2ImageDetails?

        # Contains information about the details of the ECS Cluster.
        @[JSON::Field(key: "ecsClusterDetails")]
        getter ecs_cluster_details : Types::EcsClusterDetails?

        # Details about the EKS cluster involved in a Kubernetes finding.
        @[JSON::Field(key: "eksClusterDetails")]
        getter eks_cluster_details : Types::EksClusterDetails?

        # The information about the EC2 instance associated with the activity that prompted GuardDuty to
        # generate a finding.
        @[JSON::Field(key: "instanceDetails")]
        getter instance_details : Types::InstanceDetails?

        # Details about the Kubernetes user and workload involved in a Kubernetes finding.
        @[JSON::Field(key: "kubernetesDetails")]
        getter kubernetes_details : Types::KubernetesDetails?

        # Contains information about the Lambda function that was involved in a finding.
        @[JSON::Field(key: "lambdaDetails")]
        getter lambda_details : Types::LambdaDetails?

        # Contains information about the database instance to which an anomalous login attempt was made.
        @[JSON::Field(key: "rdsDbInstanceDetails")]
        getter rds_db_instance_details : Types::RdsDbInstanceDetails?

        # Contains information about the user details through which anomalous login attempt was made.
        @[JSON::Field(key: "rdsDbUserDetails")]
        getter rds_db_user_details : Types::RdsDbUserDetails?

        # Contains information about the RDS Limitless database that was involved in a GuardDuty finding.
        @[JSON::Field(key: "rdsLimitlessDbDetails")]
        getter rds_limitless_db_details : Types::RdsLimitlessDbDetails?

        # Contains details about the backup recovery point that was scanned.
        @[JSON::Field(key: "recoveryPointDetails")]
        getter recovery_point_details : Types::RecoveryPointDetails?

        # The type of Amazon Web Services resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # Contains information on the S3 bucket.
        @[JSON::Field(key: "s3BucketDetails")]
        getter s3_bucket_details : Array(Types::S3BucketDetail)?

        def initialize(
          @access_key_details : Types::AccessKeyDetails? = nil,
          @container_details : Types::Container? = nil,
          @ebs_snapshot_details : Types::EbsSnapshotDetails? = nil,
          @ebs_volume_details : Types::EbsVolumeDetails? = nil,
          @ec2_image_details : Types::Ec2ImageDetails? = nil,
          @ecs_cluster_details : Types::EcsClusterDetails? = nil,
          @eks_cluster_details : Types::EksClusterDetails? = nil,
          @instance_details : Types::InstanceDetails? = nil,
          @kubernetes_details : Types::KubernetesDetails? = nil,
          @lambda_details : Types::LambdaDetails? = nil,
          @rds_db_instance_details : Types::RdsDbInstanceDetails? = nil,
          @rds_db_user_details : Types::RdsDbUserDetails? = nil,
          @rds_limitless_db_details : Types::RdsLimitlessDbDetails? = nil,
          @recovery_point_details : Types::RecoveryPointDetails? = nil,
          @resource_type : String? = nil,
          @s3_bucket_details : Array(Types::S3BucketDetail)? = nil
        )
        end
      end

      # Contains information about the Amazon Web Services resource that is associated with the activity
      # that prompted GuardDuty to generate a finding.
      struct ResourceData
        include JSON::Serializable

        # Contains information about the IAM access key details of a user that involved in the GuardDuty
        # finding.
        @[JSON::Field(key: "accessKey")]
        getter access_key : Types::AccessKey?

        # Contains detailed information about the Auto Scaling Group associated with the activity that
        # prompted GuardDuty to generate a finding.
        @[JSON::Field(key: "autoscalingAutoScalingGroup")]
        getter autoscaling_auto_scaling_group : Types::AutoscalingAutoScalingGroup?

        # Contains detailed information about the CloudFormation stack associated with the activity that
        # prompted GuardDuty to generate a finding.
        @[JSON::Field(key: "cloudformationStack")]
        getter cloudformation_stack : Types::CloudformationStack?

        # Contains detailed information about the container associated with the activity that prompted
        # GuardDuty to generate a finding.
        @[JSON::Field(key: "container")]
        getter container : Types::ContainerFindingResource?

        # Contains detailed information about the EC2 Image associated with the activity that prompted
        # GuardDuty to generate a finding.
        @[JSON::Field(key: "ec2Image")]
        getter ec2_image : Types::Ec2Image?

        # Contains information about the Amazon EC2 instance.
        @[JSON::Field(key: "ec2Instance")]
        getter ec2_instance : Types::Ec2Instance?

        # Contains detailed information about the EC2 launch template associated with the activity that
        # prompted GuardDuty to generate a finding.
        @[JSON::Field(key: "ec2LaunchTemplate")]
        getter ec2_launch_template : Types::Ec2LaunchTemplate?

        # Contains information about the elastic network interface of the Amazon EC2 instance.
        @[JSON::Field(key: "ec2NetworkInterface")]
        getter ec2_network_interface : Types::Ec2NetworkInterface?

        # Contains detailed information about the EC2 VPC associated with the activity that prompted GuardDuty
        # to generate a finding.
        @[JSON::Field(key: "ec2Vpc")]
        getter ec2_vpc : Types::Ec2Vpc?

        # Contains detailed information about the Amazon ECS cluster associated with the activity that
        # prompted GuardDuty to generate a finding.
        @[JSON::Field(key: "ecsCluster")]
        getter ecs_cluster : Types::EcsCluster?

        # Contains detailed information about the Amazon ECS task associated with the activity that prompted
        # GuardDuty to generate a finding.
        @[JSON::Field(key: "ecsTask")]
        getter ecs_task : Types::EcsTask?

        # Contains detailed information about the Amazon EKS cluster associated with the activity that
        # prompted GuardDuty to generate a finding.
        @[JSON::Field(key: "eksCluster")]
        getter eks_cluster : Types::EksCluster?

        # Contains detailed information about the IAM instance profile associated with the activity that
        # prompted GuardDuty to generate a finding.
        @[JSON::Field(key: "iamInstanceProfile")]
        getter iam_instance_profile : Types::IamInstanceProfileV2?

        # Contains detailed information about the Kubernetes workload associated with the activity that
        # prompted GuardDuty to generate a finding.
        @[JSON::Field(key: "kubernetesWorkload")]
        getter kubernetes_workload : Types::KubernetesWorkload?

        # Contains information about the Amazon S3 bucket.
        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : Types::S3Bucket?

        # Contains information about the Amazon S3 object.
        @[JSON::Field(key: "s3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @access_key : Types::AccessKey? = nil,
          @autoscaling_auto_scaling_group : Types::AutoscalingAutoScalingGroup? = nil,
          @cloudformation_stack : Types::CloudformationStack? = nil,
          @container : Types::ContainerFindingResource? = nil,
          @ec2_image : Types::Ec2Image? = nil,
          @ec2_instance : Types::Ec2Instance? = nil,
          @ec2_launch_template : Types::Ec2LaunchTemplate? = nil,
          @ec2_network_interface : Types::Ec2NetworkInterface? = nil,
          @ec2_vpc : Types::Ec2Vpc? = nil,
          @ecs_cluster : Types::EcsCluster? = nil,
          @ecs_task : Types::EcsTask? = nil,
          @eks_cluster : Types::EksCluster? = nil,
          @iam_instance_profile : Types::IamInstanceProfileV2? = nil,
          @kubernetes_workload : Types::KubernetesWorkload? = nil,
          @s3_bucket : Types::S3Bucket? = nil,
          @s3_object : Types::S3Object? = nil
        )
        end
      end

      # Represents the resources that were scanned in the scan entry.
      struct ResourceDetails
        include JSON::Serializable

        # Instance ARN that was scanned in the scan entry.
        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String?

        def initialize(
          @instance_arn : String? = nil
        )
        end
      end

      # The requested resource can't be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        # The error message.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The error type.
        @[JSON::Field(key: "__type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about each resource type associated with the groupedByResource statistics.
      struct ResourceStatistics
        include JSON::Serializable

        # The ID of the Amazon Web Services account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The timestamp at which the statistics for this resource was last generated.
        @[JSON::Field(key: "lastGeneratedAt")]
        getter last_generated_at : Time?

        # ID associated with each resource. The following list provides the mapping of the resource type and
        # resource ID. Mapping of resource and resource ID AccessKey - resource.accessKeyDetails.accessKeyId
        # Container - resource.containerDetails.id ECSCluster - resource.ecsClusterDetails.name EKSCluster -
        # resource.eksClusterDetails.name Instance - resource.instanceDetails.instanceId KubernetesCluster -
        # resource.kubernetesDetails.kubernetesWorkloadDetails.name Lambda -
        # resource.lambdaDetails.functionName RDSDBInstance -
        # resource.rdsDbInstanceDetails.dbInstanceIdentifier S3Bucket - resource.s3BucketDetails.name S3Object
        # - resource.s3BucketDetails.name
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The total number of findings associated with this resource.
        @[JSON::Field(key: "totalFindings")]
        getter total_findings : Int32?

        def initialize(
          @account_id : String? = nil,
          @last_generated_at : Time? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @total_findings : Int32? = nil
        )
        end
      end

      # Contains information about the Amazon Web Services resource that is associated with the GuardDuty
      # finding.
      struct ResourceV2
        include JSON::Serializable

        # The type of the Amazon Web Services resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The unique identifier of the resource.
        @[JSON::Field(key: "uid")]
        getter uid : String

        # The Amazon Web Services account ID to which the resource belongs.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The cloud partition within the Amazon Web Services Region to which the resource belongs.
        @[JSON::Field(key: "cloudPartition")]
        getter cloud_partition : String?

        # Contains information about the Amazon Web Services resource associated with the activity that
        # prompted GuardDuty to generate a finding.
        @[JSON::Field(key: "data")]
        getter data : Types::ResourceData?

        # The name of the resource.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Web Services Region where the resource belongs.
        @[JSON::Field(key: "region")]
        getter region : String?

        # The Amazon Web Services service of the resource.
        @[JSON::Field(key: "service")]
        getter service : String?

        # Contains information about the tags associated with the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_type : String,
          @uid : String,
          @account_id : String? = nil,
          @cloud_partition : String? = nil,
          @data : Types::ResourceData? = nil,
          @name : String? = nil,
          @region : String? = nil,
          @service : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Additional information about the suspicious activity.
      struct RuntimeContext
        include JSON::Serializable

        # Represents the communication protocol associated with the address. For example, the address family
        # AF_INET is used for IP version of 4 protocol.
        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # Example of the command line involved in the suspicious activity.
        @[JSON::Field(key: "commandLineExample")]
        getter command_line_example : String?

        # Represents the type of mounted fileSystem.
        @[JSON::Field(key: "fileSystemType")]
        getter file_system_type : String?

        # Represents options that control the behavior of a runtime operation or action. For example, a
        # filesystem mount operation may contain a read-only flag.
        @[JSON::Field(key: "flags")]
        getter flags : Array(String)?

        # Specifies a particular protocol within the address family. Usually there is a single protocol in
        # address families. For example, the address family AF_INET only has the IP protocol.
        @[JSON::Field(key: "ianaProtocolNumber")]
        getter iana_protocol_number : Int32?

        # The value of the LD_PRELOAD environment variable.
        @[JSON::Field(key: "ldPreloadValue")]
        getter ld_preload_value : String?

        # The path to the new library that was loaded.
        @[JSON::Field(key: "libraryPath")]
        getter library_path : String?

        # Specifies the Region of a process's address space such as stack and heap.
        @[JSON::Field(key: "memoryRegions")]
        getter memory_regions : Array(String)?

        # The timestamp at which the process modified the current process. The timestamp is in UTC date string
        # format.
        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # Information about the process that modified the current process. This is available for multiple
        # finding types.
        @[JSON::Field(key: "modifyingProcess")]
        getter modifying_process : Types::ProcessDetails?

        # The path to the module loaded into the kernel.
        @[JSON::Field(key: "moduleFilePath")]
        getter module_file_path : String?

        # The name of the module loaded into the kernel.
        @[JSON::Field(key: "moduleName")]
        getter module_name : String?

        # The SHA256 hash of the module.
        @[JSON::Field(key: "moduleSha256")]
        getter module_sha256 : String?

        # The path on the host that is mounted by the container.
        @[JSON::Field(key: "mountSource")]
        getter mount_source : String?

        # The path in the container that is mapped to the host directory.
        @[JSON::Field(key: "mountTarget")]
        getter mount_target : String?

        # The path in the container that modified the release agent file.
        @[JSON::Field(key: "releaseAgentPath")]
        getter release_agent_path : String?

        # The path to the leveraged runc implementation.
        @[JSON::Field(key: "runcBinaryPath")]
        getter runc_binary_path : String?

        # The path to the script that was executed.
        @[JSON::Field(key: "scriptPath")]
        getter script_path : String?

        # Name of the security service that has been potentially disabled.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The path to the modified shell history file.
        @[JSON::Field(key: "shellHistoryFilePath")]
        getter shell_history_file_path : String?

        # The path to the docket socket that was accessed.
        @[JSON::Field(key: "socketPath")]
        getter socket_path : String?

        # Information about the process that had its memory overwritten by the current process.
        @[JSON::Field(key: "targetProcess")]
        getter target_process : Types::ProcessDetails?

        # The suspicious file path for which the threat intelligence details were found.
        @[JSON::Field(key: "threatFilePath")]
        getter threat_file_path : String?

        # Category that the tool belongs to. Some of the examples are Backdoor Tool, Pentest Tool, Network
        # Scanner, and Network Sniffer.
        @[JSON::Field(key: "toolCategory")]
        getter tool_category : String?

        # Name of the potentially suspicious tool.
        @[JSON::Field(key: "toolName")]
        getter tool_name : String?

        def initialize(
          @address_family : String? = nil,
          @command_line_example : String? = nil,
          @file_system_type : String? = nil,
          @flags : Array(String)? = nil,
          @iana_protocol_number : Int32? = nil,
          @ld_preload_value : String? = nil,
          @library_path : String? = nil,
          @memory_regions : Array(String)? = nil,
          @modified_at : Time? = nil,
          @modifying_process : Types::ProcessDetails? = nil,
          @module_file_path : String? = nil,
          @module_name : String? = nil,
          @module_sha256 : String? = nil,
          @mount_source : String? = nil,
          @mount_target : String? = nil,
          @release_agent_path : String? = nil,
          @runc_binary_path : String? = nil,
          @script_path : String? = nil,
          @service_name : String? = nil,
          @shell_history_file_path : String? = nil,
          @socket_path : String? = nil,
          @target_process : Types::ProcessDetails? = nil,
          @threat_file_path : String? = nil,
          @tool_category : String? = nil,
          @tool_name : String? = nil
        )
        end
      end

      # Information about the process and any required context values for a specific finding.
      struct RuntimeDetails
        include JSON::Serializable

        # Additional information about the suspicious activity.
        @[JSON::Field(key: "context")]
        getter context : Types::RuntimeContext?

        # Information about the observed process.
        @[JSON::Field(key: "process")]
        getter process : Types::ProcessDetails?

        def initialize(
          @context : Types::RuntimeContext? = nil,
          @process : Types::ProcessDetails? = nil
        )
        end
      end

      # Contains information about the Amazon S3 bucket policies and encryption.
      struct S3Bucket
        include JSON::Serializable

        # Contains information about the public access policies that apply to the Amazon S3 bucket at the
        # account level.
        @[JSON::Field(key: "accountPublicAccess")]
        getter account_public_access : Types::PublicAccessConfiguration?

        # Contains information about public access policies that apply to the Amazon S3 bucket.
        @[JSON::Field(key: "bucketPublicAccess")]
        getter bucket_public_access : Types::PublicAccessConfiguration?

        # The timestamp at which the Amazon S3 bucket was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Describes the effective permissions on this S3 bucket, after factoring all the attached policies.
        @[JSON::Field(key: "effectivePermission")]
        getter effective_permission : String?

        # The Amazon Resource Name (ARN) of the encryption key that is used to encrypt the Amazon S3 bucket
        # and its objects.
        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        # The type of encryption used for the Amazon S3 buckets and its objects. For more information, see
        # Protecting data with server-side encryption in the Amazon S3 User Guide .
        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String?

        # The owner ID of the associated S3Amazon S3bucket.
        @[JSON::Field(key: "ownerId")]
        getter owner_id : String?

        # Indicates whether or not the public read access is allowed for an Amazon S3 bucket.
        @[JSON::Field(key: "publicReadAccess")]
        getter public_read_access : String?

        # Indicates whether or not the public write access is allowed for an Amazon S3 bucket.
        @[JSON::Field(key: "publicWriteAccess")]
        getter public_write_access : String?

        # Represents a list of Amazon S3 object identifiers.
        @[JSON::Field(key: "s3ObjectUids")]
        getter s3_object_uids : Array(String)?

        def initialize(
          @account_public_access : Types::PublicAccessConfiguration? = nil,
          @bucket_public_access : Types::PublicAccessConfiguration? = nil,
          @created_at : Time? = nil,
          @effective_permission : String? = nil,
          @encryption_key_arn : String? = nil,
          @encryption_type : String? = nil,
          @owner_id : String? = nil,
          @public_read_access : String? = nil,
          @public_write_access : String? = nil,
          @s3_object_uids : Array(String)? = nil
        )
        end
      end

      # Contains information on the S3 bucket.
      struct S3BucketDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 bucket.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time the bucket was created at.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Describes the server side encryption method used in the S3 bucket.
        @[JSON::Field(key: "defaultServerSideEncryption")]
        getter default_server_side_encryption : Types::DefaultServerSideEncryption?

        # The name of the S3 bucket.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The owner of the S3 bucket.
        @[JSON::Field(key: "owner")]
        getter owner : Types::Owner?

        # Describes the public access policies that apply to the S3 bucket.
        @[JSON::Field(key: "publicAccess")]
        getter public_access : Types::PublicAccess?

        # Information about the S3 object that was scanned.
        @[JSON::Field(key: "s3ObjectDetails")]
        getter s3_object_details : Array(Types::S3ObjectDetail)?

        # All tags attached to the S3 bucket
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # Describes whether the bucket is a source or destination bucket.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @default_server_side_encryption : Types::DefaultServerSideEncryption? = nil,
          @name : String? = nil,
          @owner : Types::Owner? = nil,
          @public_access : Types::PublicAccess? = nil,
          @s3_object_details : Array(Types::S3ObjectDetail)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes whether S3 data event logs will be enabled as a data source.
      struct S3LogsConfiguration
        include JSON::Serializable

        # The status of S3 data event logs as a data source.
        @[JSON::Field(key: "enable")]
        getter enable : Bool

        def initialize(
          @enable : Bool
        )
        end
      end

      # Describes whether S3 data event logs will be enabled as a data source.
      struct S3LogsConfigurationResult
        include JSON::Serializable

        # A value that describes whether S3 data event logs are automatically enabled for new members of the
        # organization.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Contains information about the Amazon S3 object.
      struct S3Object
        include JSON::Serializable

        # The entity tag is a hash of the Amazon S3 object. The ETag reflects changes only to the contents of
        # an object, and not its metadata.
        @[JSON::Field(key: "eTag")]
        getter e_tag : String?

        # The key of the Amazon S3 object.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The version Id of the Amazon S3 object.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @e_tag : String? = nil,
          @key : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Information about the S3 object that was scanned
      struct S3ObjectDetail
        include JSON::Serializable

        # The entity tag is a hash of the S3 object. The ETag reflects changes only to the contents of an
        # object, and not its metadata.
        @[JSON::Field(key: "eTag")]
        getter e_tag : String?

        # Hash of the threat detected in this finding.
        @[JSON::Field(key: "hash")]
        getter hash : String?

        # Key of the S3 object.
        @[JSON::Field(key: "key")]
        getter key : String?

        # Amazon Resource Name (ARN) of the S3 object.
        @[JSON::Field(key: "objectArn")]
        getter object_arn : String?

        # Version ID of the object.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @e_tag : String? = nil,
          @hash : String? = nil,
          @key : String? = nil,
          @object_arn : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # The S3 object path to initiate a scan, including bucket name, object key, and optional version ID.
      struct S3ObjectForSendObjectMalwareScan
        include JSON::Serializable

        # The name of the S3 bucket containing the object to scan. The bucket must have GuardDuty Malware
        # Protection enabled.
        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The key (name) of the S3 object to scan for malware. This must be the full key path of the object
        # within the bucket.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The version ID of the S3 object to scan. If not specified, the latest version of the object is
        # scanned.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String? = nil,
          @key : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Contains information about malware scans associated with GuardDuty Malware Protection for EC2.
      struct Scan
        include JSON::Serializable

        # The ID for the account that belongs to the scan.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The unique detector ID of the administrator account that the request is associated with. If the
        # account is an administrator, the AdminDetectorId will be the same as the one used for DetectorId .
        # To find the detectorId in the current Region, see the Settings page in the GuardDuty console, or run
        # the ListDetectors API.
        @[JSON::Field(key: "adminDetectorId")]
        getter admin_detector_id : String?

        # List of volumes that were attached to the original instance to be scanned.
        @[JSON::Field(key: "attachedVolumes")]
        getter attached_volumes : Array(Types::VolumeDetail)?

        # The unique ID of the detector that is associated with the request. To find the detectorId in the
        # current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # Represents the reason for FAILED scan status.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # Represents the number of files that were scanned.
        @[JSON::Field(key: "fileCount")]
        getter file_count : Int64?

        # Represents the resources that were scanned in the scan entry.
        @[JSON::Field(key: "resourceDetails")]
        getter resource_details : Types::ResourceDetails?

        # The timestamp of when the scan was finished.
        @[JSON::Field(key: "scanEndTime")]
        getter scan_end_time : Time?

        # The unique scan ID associated with a scan entry.
        @[JSON::Field(key: "scanId")]
        getter scan_id : String?

        # Represents the result of the scan.
        @[JSON::Field(key: "scanResultDetails")]
        getter scan_result_details : Types::ScanResultDetails?

        # The timestamp of when the scan was triggered.
        @[JSON::Field(key: "scanStartTime")]
        getter scan_start_time : Time?

        # An enum value representing possible scan statuses.
        @[JSON::Field(key: "scanStatus")]
        getter scan_status : String?

        # Specifies the scan type that invoked the malware scan.
        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        # Represents total bytes that were scanned.
        @[JSON::Field(key: "totalBytes")]
        getter total_bytes : Int64?

        # Specifies the reason why the scan was initiated.
        @[JSON::Field(key: "triggerDetails")]
        getter trigger_details : Types::TriggerDetails?

        def initialize(
          @account_id : String? = nil,
          @admin_detector_id : String? = nil,
          @attached_volumes : Array(Types::VolumeDetail)? = nil,
          @detector_id : String? = nil,
          @failure_reason : String? = nil,
          @file_count : Int64? = nil,
          @resource_details : Types::ResourceDetails? = nil,
          @scan_end_time : Time? = nil,
          @scan_id : String? = nil,
          @scan_result_details : Types::ScanResultDetails? = nil,
          @scan_start_time : Time? = nil,
          @scan_status : String? = nil,
          @scan_type : String? = nil,
          @total_bytes : Int64? = nil,
          @trigger_details : Types::TriggerDetails? = nil
        )
        end
      end

      # Contains information about the condition.
      struct ScanCondition
        include JSON::Serializable

        # Represents an mapEqual condition to be applied to a single field when triggering for malware scan.
        @[JSON::Field(key: "mapEquals")]
        getter map_equals : Array(Types::ScanConditionPair)

        def initialize(
          @map_equals : Array(Types::ScanConditionPair)
        )
        end
      end

      # Represents the key:value pair to be matched against given resource property.
      struct ScanConditionPair
        include JSON::Serializable

        # Represents the key in the map condition.
        @[JSON::Field(key: "key")]
        getter key : String

        # Represents optional value in the map condition. If not specified, only the key will be matched.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      # Contains information about the configuration used for the malware scan.
      struct ScanConfiguration
        include JSON::Serializable

        # Information about the incremental scan configuration, if applicable.
        @[JSON::Field(key: "incrementalScanDetails")]
        getter incremental_scan_details : Types::IncrementalScanDetails?

        # Information about the recovery point configuration used for the scan, if applicable.
        @[JSON::Field(key: "recoveryPoint")]
        getter recovery_point : Types::ScanConfigurationRecoveryPoint?

        # Amazon Resource Name (ARN) of the IAM role that should contain the required permissions for the
        # scan.
        @[JSON::Field(key: "role")]
        getter role : String?

        # Information about the entity that triggered the malware scan.
        @[JSON::Field(key: "triggerDetails")]
        getter trigger_details : Types::TriggerDetails?

        def initialize(
          @incremental_scan_details : Types::IncrementalScanDetails? = nil,
          @recovery_point : Types::ScanConfigurationRecoveryPoint? = nil,
          @role : String? = nil,
          @trigger_details : Types::TriggerDetails? = nil
        )
        end
      end

      # Contains information about the recovery point configuration used in the scan.
      struct ScanConfigurationRecoveryPoint
        include JSON::Serializable

        # The name of the Amazon Web Services Backup vault that contains the recovery point for the scanned.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String?

        def initialize(
          @backup_vault_name : String? = nil
        )
        end
      end

      # Contains a complete view providing malware scan result details.
      struct ScanDetections
        include JSON::Serializable

        # Details of the highest severity threat detected during malware scan and number of infected files.
        @[JSON::Field(key: "highestSeverityThreatDetails")]
        getter highest_severity_threat_details : Types::HighestSeverityThreatDetails?

        # Total number of scanned files.
        @[JSON::Field(key: "scannedItemCount")]
        getter scanned_item_count : Types::ScannedItemCount?

        # Contains details about identified threats organized by threat name.
        @[JSON::Field(key: "threatDetectedByName")]
        getter threat_detected_by_name : Types::ThreatDetectedByName?

        # Total number of infected files.
        @[JSON::Field(key: "threatsDetectedItemCount")]
        getter threats_detected_item_count : Types::ThreatsDetectedItemCount?

        def initialize(
          @highest_severity_threat_details : Types::HighestSeverityThreatDetails? = nil,
          @scanned_item_count : Types::ScannedItemCount? = nil,
          @threat_detected_by_name : Types::ThreatDetectedByName? = nil,
          @threats_detected_item_count : Types::ThreatsDetectedItemCount? = nil
        )
        end
      end

      # Describes whether Malware Protection for EC2 instances with findings will be enabled as a data
      # source.
      struct ScanEc2InstanceWithFindings
        include JSON::Serializable

        # Describes the configuration for scanning EBS volumes as data source.
        @[JSON::Field(key: "ebsVolumes")]
        getter ebs_volumes : Bool?

        def initialize(
          @ebs_volumes : Bool? = nil
        )
        end
      end

      # An object that contains information on the status of whether Malware Protection for EC2 instances
      # with findings will be enabled as a data source.
      struct ScanEc2InstanceWithFindingsResult
        include JSON::Serializable

        # Describes the configuration of scanning EBS volumes as a data source.
        @[JSON::Field(key: "ebsVolumes")]
        getter ebs_volumes : Types::EbsVolumesResult?

        def initialize(
          @ebs_volumes : Types::EbsVolumesResult? = nil
        )
        end
      end

      # Contains details of infected file including name, file path and hash.
      struct ScanFilePath
        include JSON::Serializable

        # File name of the infected file.
        @[JSON::Field(key: "fileName")]
        getter file_name : String?

        # The file path of the infected file.
        @[JSON::Field(key: "filePath")]
        getter file_path : String?

        # The hash value of the infected file.
        @[JSON::Field(key: "hash")]
        getter hash : String?

        # EBS volume ARN details of the infected file.
        @[JSON::Field(key: "volumeArn")]
        getter volume_arn : String?

        def initialize(
          @file_name : String? = nil,
          @file_path : String? = nil,
          @hash : String? = nil,
          @volume_arn : String? = nil
        )
        end
      end

      # Contains information about criteria used to filter resources before triggering malware scan.
      struct ScanResourceCriteria
        include JSON::Serializable

        # Represents condition that when matched will prevent a malware scan for a certain resource.
        @[JSON::Field(key: "exclude")]
        getter exclude : Hash(String, Types::ScanCondition)?

        # Represents condition that when matched will allow a malware scan for a certain resource.
        @[JSON::Field(key: "include")]
        getter include : Hash(String, Types::ScanCondition)?

        def initialize(
          @exclude : Hash(String, Types::ScanCondition)? = nil,
          @include : Hash(String, Types::ScanCondition)? = nil
        )
        end
      end

      # Represents the result of the scan.
      struct ScanResultDetails
        include JSON::Serializable

        # An enum value representing possible scan results.
        @[JSON::Field(key: "scanResult")]
        getter scan_result : String?

        def initialize(
          @scan_result : String? = nil
        )
        end
      end

      # Contains information about a specific threat that was detected during the malware scan.
      struct ScanResultThreat
        include JSON::Serializable

        # The number of instances of this threat that were detected.
        @[JSON::Field(key: "count")]
        getter count : Int64?

        # The hash value associated with the detected threat.
        @[JSON::Field(key: "hash")]
        getter hash : String?

        # Additional information about where this threat was detected.
        @[JSON::Field(key: "itemDetails")]
        getter item_details : Array(Types::ItemDetails)?

        # The name of the detected threat.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The source that detected this threat.
        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @count : Int64? = nil,
          @hash : String? = nil,
          @item_details : Array(Types::ItemDetails)? = nil,
          @name : String? = nil,
          @source : String? = nil
        )
        end
      end

      # Contains files infected with the given threat providing details of malware name and severity.
      struct ScanThreatName
        include JSON::Serializable

        # List of infected files in EBS volume with details.
        @[JSON::Field(key: "filePaths")]
        getter file_paths : Array(Types::ScanFilePath)?

        # Total number of files infected with given threat.
        @[JSON::Field(key: "itemCount")]
        getter item_count : Int32?

        # The name of the identified threat.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Severity of threat identified as part of the malware scan.
        @[JSON::Field(key: "severity")]
        getter severity : String?

        def initialize(
          @file_paths : Array(Types::ScanFilePath)? = nil,
          @item_count : Int32? = nil,
          @name : String? = nil,
          @severity : String? = nil
        )
        end
      end

      # Total number of scanned files.
      struct ScannedItemCount
        include JSON::Serializable

        # Number of files scanned.
        @[JSON::Field(key: "files")]
        getter files : Int32?

        # Total GB of files scanned for malware.
        @[JSON::Field(key: "totalGb")]
        getter total_gb : Int32?

        # Total number of scanned volumes.
        @[JSON::Field(key: "volumes")]
        getter volumes : Int32?

        def initialize(
          @files : Int32? = nil,
          @total_gb : Int32? = nil,
          @volumes : Int32? = nil
        )
        end
      end

      # Contains information about a resource that was scanned as part of the malware scan operation.
      struct ScannedResource
        include JSON::Serializable

        # Information about the scanned resource.
        @[JSON::Field(key: "resourceDetails")]
        getter resource_details : Types::ScannedResourceDetails?

        # The reason for the scan status of this particular resource, if applicable.
        @[JSON::Field(key: "scanStatusReason")]
        getter scan_status_reason : String?

        # Amazon Resource Name (ARN) of the scanned resource.
        @[JSON::Field(key: "scannedResourceArn")]
        getter scanned_resource_arn : String?

        # The status of the scanned resource.
        @[JSON::Field(key: "scannedResourceStatus")]
        getter scanned_resource_status : String?

        # The resource type of the scanned resource.
        @[JSON::Field(key: "scannedResourceType")]
        getter scanned_resource_type : String?

        def initialize(
          @resource_details : Types::ScannedResourceDetails? = nil,
          @scan_status_reason : String? = nil,
          @scanned_resource_arn : String? = nil,
          @scanned_resource_status : String? = nil,
          @scanned_resource_type : String? = nil
        )
        end
      end

      # Contains additional information about a resource that was scanned.
      struct ScannedResourceDetails
        include JSON::Serializable

        # Contains information about the EBS snapshot that was scanned.
        @[JSON::Field(key: "ebsSnapshot")]
        getter ebs_snapshot : Types::EbsSnapshot?

        # Contains information about the EBS volume that was scanned.
        @[JSON::Field(key: "ebsVolume")]
        getter ebs_volume : Types::VolumeDetail?

        def initialize(
          @ebs_snapshot : Types::EbsSnapshot? = nil,
          @ebs_volume : Types::VolumeDetail? = nil
        )
        end
      end

      # Container security context.
      struct SecurityContext
        include JSON::Serializable

        # Whether or not a container or a Kubernetes pod is allowed to gain more privileges than its parent
        # process.
        @[JSON::Field(key: "allowPrivilegeEscalation")]
        getter allow_privilege_escalation : Bool?

        # Whether the container is privileged.
        @[JSON::Field(key: "privileged")]
        getter privileged : Bool?

        def initialize(
          @allow_privilege_escalation : Bool? = nil,
          @privileged : Bool? = nil
        )
        end
      end

      # Contains information about the security groups associated with the EC2 instance.
      struct SecurityGroup
        include JSON::Serializable

        # The security group ID of the EC2 instance.
        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # The security group name of the EC2 instance.
        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        def initialize(
          @group_id : String? = nil,
          @group_name : String? = nil
        )
        end
      end

      struct SendObjectMalwareScanRequest
        include JSON::Serializable

        # The S3 object information for the object you want to scan. The bucket must have a Malware Protection
        # plan configured to use this API.
        @[JSON::Field(key: "s3Object")]
        getter s3_object : Types::S3ObjectForSendObjectMalwareScan?

        def initialize(
          @s3_object : Types::S3ObjectForSendObjectMalwareScan? = nil
        )
        end
      end

      struct SendObjectMalwareScanResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about the GuardDuty attack sequence finding.
      struct Sequence
        include JSON::Serializable

        # Description of the attack sequence.
        @[JSON::Field(key: "description")]
        getter description : String

        # Contains information about the signals involved in the attack sequence.
        @[JSON::Field(key: "signals")]
        getter signals : Array(Types::Signal)

        # Unique identifier of the attack sequence.
        @[JSON::Field(key: "uid")]
        getter uid : String

        # Contains information about the actors involved in the attack sequence.
        @[JSON::Field(key: "actors")]
        getter actors : Array(Types::Actor)?

        # Additional types of sequences that may be associated with the attack sequence finding, providing
        # further context about the nature of the detected threat.
        @[JSON::Field(key: "additionalSequenceTypes")]
        getter additional_sequence_types : Array(String)?

        # Contains information about the network endpoints that were used in the attack sequence.
        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(Types::NetworkEndpoint)?

        # Contains information about the resources involved in the attack sequence.
        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::ResourceV2)?

        # Contains information about the indicators observed in the attack sequence.
        @[JSON::Field(key: "sequenceIndicators")]
        getter sequence_indicators : Array(Types::Indicator)?

        def initialize(
          @description : String,
          @signals : Array(Types::Signal),
          @uid : String,
          @actors : Array(Types::Actor)? = nil,
          @additional_sequence_types : Array(String)? = nil,
          @endpoints : Array(Types::NetworkEndpoint)? = nil,
          @resources : Array(Types::ResourceV2)? = nil,
          @sequence_indicators : Array(Types::Indicator)? = nil
        )
        end
      end

      # Contains additional information about the generated finding.
      struct Service
        include JSON::Serializable

        # Information about the activity that is described in a finding.
        @[JSON::Field(key: "action")]
        getter action : Types::Action?

        # Contains additional information about the generated finding.
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Types::ServiceAdditionalInfo?

        # Indicates whether this finding is archived.
        @[JSON::Field(key: "archived")]
        getter archived : Bool?

        # The total count of the occurrences of this finding type.
        @[JSON::Field(key: "count")]
        getter count : Int32?

        # Contains information about the detected unusual behavior.
        @[JSON::Field(key: "detection")]
        getter detection : Types::Detection?

        # The detector ID for the GuardDuty service.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # Returns details from the malware scan that created a finding.
        @[JSON::Field(key: "ebsVolumeScanDetails")]
        getter ebs_volume_scan_details : Types::EbsVolumeScanDetails?

        # The first-seen timestamp of the activity that prompted GuardDuty to generate this finding.
        @[JSON::Field(key: "eventFirstSeen")]
        getter event_first_seen : String?

        # The last-seen timestamp of the activity that prompted GuardDuty to generate this finding.
        @[JSON::Field(key: "eventLastSeen")]
        getter event_last_seen : String?

        # An evidence object associated with the service.
        @[JSON::Field(key: "evidence")]
        getter evidence : Types::Evidence?

        # The name of the feature that generated a finding.
        @[JSON::Field(key: "featureName")]
        getter feature_name : String?

        # Returns details from the malware scan that generated a GuardDuty finding.
        @[JSON::Field(key: "malwareScanDetails")]
        getter malware_scan_details : Types::MalwareScanDetails?

        # The resource role information for this finding.
        @[JSON::Field(key: "resourceRole")]
        getter resource_role : String?

        # Information about the process and any required context values for a specific finding
        @[JSON::Field(key: "runtimeDetails")]
        getter runtime_details : Types::RuntimeDetails?

        # The name of the Amazon Web Services service (GuardDuty) that generated a finding.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # Feedback that was submitted about the finding.
        @[JSON::Field(key: "userFeedback")]
        getter user_feedback : String?

        def initialize(
          @action : Types::Action? = nil,
          @additional_info : Types::ServiceAdditionalInfo? = nil,
          @archived : Bool? = nil,
          @count : Int32? = nil,
          @detection : Types::Detection? = nil,
          @detector_id : String? = nil,
          @ebs_volume_scan_details : Types::EbsVolumeScanDetails? = nil,
          @event_first_seen : String? = nil,
          @event_last_seen : String? = nil,
          @evidence : Types::Evidence? = nil,
          @feature_name : String? = nil,
          @malware_scan_details : Types::MalwareScanDetails? = nil,
          @resource_role : String? = nil,
          @runtime_details : Types::RuntimeDetails? = nil,
          @service_name : String? = nil,
          @user_feedback : String? = nil
        )
        end
      end

      # Additional information about the generated finding.
      struct ServiceAdditionalInfo
        include JSON::Serializable

        # Describes the type of the additional information.
        @[JSON::Field(key: "type")]
        getter type : String?

        # This field specifies the value of the additional information.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Contains information about the authenticated session.
      struct Session
        include JSON::Serializable

        # The timestamp for when the session was created. In Amazon Web Services CloudTrail, you can find this
        # value as userIdentity.sessionContext.attributes.creationDate .
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time?

        # Identifier of the session issuer. In Amazon Web Services CloudTrail, you can find this value as
        # userIdentity.sessionContext.sessionIssuer.arn .
        @[JSON::Field(key: "issuer")]
        getter issuer : String?

        # Indicates whether or not multi-factor authencation (MFA) was used during authentication. In Amazon
        # Web Services CloudTrail, you can find this value as
        # userIdentity.sessionContext.attributes.mfaAuthenticated .
        @[JSON::Field(key: "mfaStatus")]
        getter mfa_status : String?

        # The unique identifier of the session.
        @[JSON::Field(key: "uid")]
        getter uid : String?

        def initialize(
          @created_time : Time? = nil,
          @issuer : String? = nil,
          @mfa_status : String? = nil,
          @uid : String? = nil
        )
        end
      end

      # Information about severity level for each finding type.
      struct SeverityStatistics
        include JSON::Serializable

        # The timestamp at which a finding type for a specific severity was last generated.
        @[JSON::Field(key: "lastGeneratedAt")]
        getter last_generated_at : Time?

        # The severity level associated with each finding type.
        @[JSON::Field(key: "severity")]
        getter severity : Float64?

        # The total number of findings associated with this severity.
        @[JSON::Field(key: "totalFindings")]
        getter total_findings : Int32?

        def initialize(
          @last_generated_at : Time? = nil,
          @severity : Float64? = nil,
          @total_findings : Int32? = nil
        )
        end
      end

      # Contains information about the signals involved in the attack sequence.
      struct Signal
        include JSON::Serializable

        # The number of times this signal was observed.
        @[JSON::Field(key: "count")]
        getter count : Int32

        # The timestamp when the first finding or activity related to this signal was observed.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp when the first finding or activity related to this signal was observed.
        @[JSON::Field(key: "firstSeenAt")]
        getter first_seen_at : Time

        # The timestamp when the last finding or activity related to this signal was observed.
        @[JSON::Field(key: "lastSeenAt")]
        getter last_seen_at : Time

        # The name of the signal. For example, when signal type is FINDING , the signal name is the name of
        # the finding.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the signal used to identify an attack sequence. Signals can be GuardDuty findings or
        # activities observed in data sources that GuardDuty monitors. For more information, see Foundational
        # data sources in the Amazon GuardDuty User Guide . A signal type can be one of the valid values
        # listed in this API. Here are the related descriptions: FINDING - Individually generated GuardDuty
        # finding. CLOUD_TRAIL - Activity observed from CloudTrail logs S3_DATA_EVENTS - Activity observed
        # from CloudTrail data events for S3. Activities associated with this type will show up only when you
        # have enabled GuardDuty S3 Protection feature in your account. For more information about S3
        # Protection and steps to enable it, see S3 Protection in the Amazon GuardDuty User Guide .
        @[JSON::Field(key: "type")]
        getter type : String

        # The unique identifier of the signal.
        @[JSON::Field(key: "uid")]
        getter uid : String

        # The timestamp when this signal was last observed.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Information about the IDs of the threat actors involved in the signal.
        @[JSON::Field(key: "actorIds")]
        getter actor_ids : Array(String)?

        # The description of the signal.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Information about the endpoint IDs associated with this signal.
        @[JSON::Field(key: "endpointIds")]
        getter endpoint_ids : Array(String)?

        # Information about the unique identifiers of the resources involved in the signal.
        @[JSON::Field(key: "resourceUids")]
        getter resource_uids : Array(String)?

        # The severity associated with the signal. For more information about severity, see Findings severity
        # levels in the Amazon GuardDuty User Guide .
        @[JSON::Field(key: "severity")]
        getter severity : Float64?

        # Contains information about the indicators associated with the signals.
        @[JSON::Field(key: "signalIndicators")]
        getter signal_indicators : Array(Types::Indicator)?

        def initialize(
          @count : Int32,
          @created_at : Time,
          @first_seen_at : Time,
          @last_seen_at : Time,
          @name : String,
          @type : String,
          @uid : String,
          @updated_at : Time,
          @actor_ids : Array(String)? = nil,
          @description : String? = nil,
          @endpoint_ids : Array(String)? = nil,
          @resource_uids : Array(String)? = nil,
          @severity : Float64? = nil,
          @signal_indicators : Array(Types::Indicator)? = nil
        )
        end
      end

      # Contains information about the criteria used for sorting findings.
      struct SortCriteria
        include JSON::Serializable

        # Represents the finding attribute, such as accountId , that sorts the findings.
        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String?

        # The order by which the sorted findings are to be displayed.
        @[JSON::Field(key: "orderBy")]
        getter order_by : String?

        def initialize(
          @attribute_name : String? = nil,
          @order_by : String? = nil
        )
        end
      end

      # Contains information about the configuration to be used for the malware scan.
      struct StartMalwareScanConfiguration
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the IAM role that is used for scanning the resource.
        @[JSON::Field(key: "role")]
        getter role : String

        # Contains information about the incremental scan configuration. When specified, the scan will only
        # process changes since the baseline resource.
        @[JSON::Field(key: "incrementalScanDetails")]
        getter incremental_scan_details : Types::IncrementalScanDetails?

        # Contains information about the recovery point configuration for the requested scan.
        @[JSON::Field(key: "recoveryPoint")]
        getter recovery_point : Types::RecoveryPoint?

        def initialize(
          @role : String,
          @incremental_scan_details : Types::IncrementalScanDetails? = nil,
          @recovery_point : Types::RecoveryPoint? = nil
        )
        end
      end

      struct StartMalwareScanRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resource for which you invoked the API.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The idempotency token for the create request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Contains information about the configuration to be used for the malware scan.
        @[JSON::Field(key: "scanConfiguration")]
        getter scan_configuration : Types::StartMalwareScanConfiguration?

        def initialize(
          @resource_arn : String,
          @client_token : String? = nil,
          @scan_configuration : Types::StartMalwareScanConfiguration? = nil
        )
        end
      end

      struct StartMalwareScanResponse
        include JSON::Serializable

        # A unique identifier that gets generated when you invoke the API without any error. Each malware scan
        # has a corresponding scan ID. Using this scan ID, you can monitor the status of your malware scan.
        @[JSON::Field(key: "scanId")]
        getter scan_id : String?

        def initialize(
          @scan_id : String? = nil
        )
        end
      end

      struct StartMonitoringMembersRequest
        include JSON::Serializable

        # A list of account IDs of the GuardDuty member accounts to start monitoring.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # The unique ID of the detector of the GuardDuty administrator account associated with the member
        # accounts to monitor. To find the detectorId in the current Region, see the Settings page in the
        # GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @account_ids : Array(String),
          @detector_id : String
        )
        end
      end

      struct StartMonitoringMembersResponse
        include JSON::Serializable

        # A list of objects that contain the unprocessed account and a result string that explains why it was
        # unprocessed.
        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)

        def initialize(
          @unprocessed_accounts : Array(Types::UnprocessedAccount)
        )
        end
      end

      struct StopMonitoringMembersRequest
        include JSON::Serializable

        # A list of account IDs for the member accounts to stop monitoring.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # The unique ID of the detector associated with the GuardDuty administrator account that is monitoring
        # member accounts. To find the detectorId in the current Region, see the Settings page in the
        # GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        def initialize(
          @account_ids : Array(String),
          @detector_id : String
        )
        end
      end

      struct StopMonitoringMembersResponse
        include JSON::Serializable

        # A list of objects that contain an accountId for each account that could not be processed, and a
        # result string that indicates why the account was not processed.
        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)

        def initialize(
          @unprocessed_accounts : Array(Types::UnprocessedAccount)
        )
        end
      end

      # Contains information about a tag key-value pair.
      struct Tag
        include JSON::Serializable

        # Describes the key associated with the tag.
        @[JSON::Field(key: "key")]
        getter key : String?

        # Describes the value associated with the tag key.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the GuardDuty resource to apply a tag to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to be added to a resource.
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

      # Information about the detected threats associated with the generated finding.
      struct Threat
        include JSON::Serializable

        # The number of occurrences of this specific threat detected during the scan.
        @[JSON::Field(key: "count")]
        getter count : Int64?

        # The hash identifier of the detected malware threat.
        @[JSON::Field(key: "hash")]
        getter hash : String?

        # Detailed information about the detected malware threat.
        @[JSON::Field(key: "itemDetails")]
        getter item_details : Array(Types::ItemDetails)?

        # Information about the nested item path and hash of the protected resource.
        @[JSON::Field(key: "itemPaths")]
        getter item_paths : Array(Types::ItemPath)?

        # Name of the detected threat that caused GuardDuty to generate this finding.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Source of the threat that generated this finding.
        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @count : Int64? = nil,
          @hash : String? = nil,
          @item_details : Array(Types::ItemDetails)? = nil,
          @item_paths : Array(Types::ItemPath)? = nil,
          @name : String? = nil,
          @source : String? = nil
        )
        end
      end

      # Contains details about identified threats organized by threat name.
      struct ThreatDetectedByName
        include JSON::Serializable

        # Total number of infected files identified.
        @[JSON::Field(key: "itemCount")]
        getter item_count : Int32?

        # Flag to determine if the finding contains every single infected file-path and/or every threat.
        @[JSON::Field(key: "shortened")]
        getter shortened : Bool?

        # List of identified threats with details, organized by threat name.
        @[JSON::Field(key: "threatNames")]
        getter threat_names : Array(Types::ScanThreatName)?

        # Total number of unique threats by name identified, as part of the malware scan.
        @[JSON::Field(key: "uniqueThreatNameCount")]
        getter unique_threat_name_count : Int32?

        def initialize(
          @item_count : Int32? = nil,
          @shortened : Bool? = nil,
          @threat_names : Array(Types::ScanThreatName)? = nil,
          @unique_threat_name_count : Int32? = nil
        )
        end
      end

      # An instance of a threat intelligence detail that constitutes evidence for the finding.
      struct ThreatIntelligenceDetail
        include JSON::Serializable

        # SHA256 of the file that generated the finding.
        @[JSON::Field(key: "threatFileSha256")]
        getter threat_file_sha256 : String?

        # The name of the threat intelligence list that triggered the finding.
        @[JSON::Field(key: "threatListName")]
        getter threat_list_name : String?

        # A list of names of the threats in the threat intelligence list that triggered the finding.
        @[JSON::Field(key: "threatNames")]
        getter threat_names : Array(String)?

        def initialize(
          @threat_file_sha256 : String? = nil,
          @threat_list_name : String? = nil,
          @threat_names : Array(String)? = nil
        )
        end
      end

      # Contains total number of infected files.
      struct ThreatsDetectedItemCount
        include JSON::Serializable

        # Total number of infected files.
        @[JSON::Field(key: "files")]
        getter files : Int32?

        def initialize(
          @files : Int32? = nil
        )
        end
      end

      # Contains the total usage with the corresponding currency unit for that value.
      struct Total
        include JSON::Serializable

        # The total usage.
        @[JSON::Field(key: "amount")]
        getter amount : String?

        # The currency unit that the amount is given in.
        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @amount : String? = nil,
          @unit : String? = nil
        )
        end
      end

      # Represents the reason the scan was triggered.
      struct TriggerDetails
        include JSON::Serializable

        # The description of the scan trigger.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the GuardDuty finding that triggered the malware scan.
        @[JSON::Field(key: "guardDutyFindingId")]
        getter guard_duty_finding_id : String?

        # Specifies the trigger type that started the malware scan.
        @[JSON::Field(key: "triggerType")]
        getter trigger_type : String?

        def initialize(
          @description : String? = nil,
          @guard_duty_finding_id : String? = nil,
          @trigger_type : String? = nil
        )
        end
      end

      struct UnarchiveFindingsRequest
        include JSON::Serializable

        # The ID of the detector associated with the findings to unarchive. To find the detectorId in the
        # current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The IDs of the findings to unarchive.
        @[JSON::Field(key: "findingIds")]
        getter finding_ids : Array(String)

        def initialize(
          @detector_id : String,
          @finding_ids : Array(String)
        )
        end
      end

      struct UnarchiveFindingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about the accounts that weren't processed.
      struct UnprocessedAccount
        include JSON::Serializable

        # The Amazon Web Services account ID.
        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # A reason why the account hasn't been processed.
        @[JSON::Field(key: "result")]
        getter result : String

        def initialize(
          @account_id : String,
          @result : String
        )
        end
      end

      # Specifies the names of the data sources that couldn't be enabled.
      struct UnprocessedDataSourcesResult
        include JSON::Serializable

        @[JSON::Field(key: "malwareProtection")]
        getter malware_protection : Types::MalwareProtectionConfigurationResult?

        def initialize(
          @malware_protection : Types::MalwareProtectionConfigurationResult? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the resource to remove tags from.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys to remove from the resource.
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

      struct UpdateDetectorRequest
        include JSON::Serializable

        # The unique ID of the detector to update. To find the detectorId in the current Region, see the
        # Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # Describes which data sources will be updated. There might be regional differences because some data
        # sources might not be available in all the Amazon Web Services Regions where GuardDuty is presently
        # supported. For more information, see Regions and endpoints .
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Types::DataSourceConfigurations?

        # Specifies whether the detector is enabled or not enabled.
        @[JSON::Field(key: "enable")]
        getter enable : Bool?

        # Provides the features that will be updated for the detector.
        @[JSON::Field(key: "features")]
        getter features : Array(Types::DetectorFeatureConfiguration)?

        # An enum value that specifies how frequently findings are exported, such as to CloudWatch Events.
        @[JSON::Field(key: "findingPublishingFrequency")]
        getter finding_publishing_frequency : String?

        def initialize(
          @detector_id : String,
          @data_sources : Types::DataSourceConfigurations? = nil,
          @enable : Bool? = nil,
          @features : Array(Types::DetectorFeatureConfiguration)? = nil,
          @finding_publishing_frequency : String? = nil
        )
        end
      end

      struct UpdateDetectorResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateFilterRequest
        include JSON::Serializable

        # The unique ID of the detector that specifies the GuardDuty service where you want to update a
        # filter. To find the detectorId in the current Region, see the Settings page in the GuardDuty
        # console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The name of the filter.
        @[JSON::Field(key: "filterName")]
        getter filter_name : String

        # Specifies the action that is to be applied to the findings that match the filter.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The description of the filter. Valid characters include alphanumeric characters, and special
        # characters such as hyphen, period, colon, underscore, parentheses ( { } , [ ] , and ( ) ), forward
        # slash, horizontal tab, vertical tab, newline, form feed, return, and whitespace.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Represents the criteria to be used in the filter for querying findings.
        @[JSON::Field(key: "findingCriteria")]
        getter finding_criteria : Types::FindingCriteria?

        # Specifies the position of the filter in the list of current filters. Also specifies the order in
        # which this filter is applied to the findings.
        @[JSON::Field(key: "rank")]
        getter rank : Int32?

        def initialize(
          @detector_id : String,
          @filter_name : String,
          @action : String? = nil,
          @description : String? = nil,
          @finding_criteria : Types::FindingCriteria? = nil,
          @rank : Int32? = nil
        )
        end
      end

      struct UpdateFilterResponse
        include JSON::Serializable

        # The name of the filter.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct UpdateFindingsFeedbackRequest
        include JSON::Serializable

        # The ID of the detector that is associated with the findings for which you want to update the
        # feedback. To find the detectorId in the current Region, see the Settings page in the GuardDuty
        # console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The feedback for the finding.
        @[JSON::Field(key: "feedback")]
        getter feedback : String

        # The IDs of the findings that you want to mark as useful or not useful.
        @[JSON::Field(key: "findingIds")]
        getter finding_ids : Array(String)

        # Additional feedback about the GuardDuty findings.
        @[JSON::Field(key: "comments")]
        getter comments : String?

        def initialize(
          @detector_id : String,
          @feedback : String,
          @finding_ids : Array(String),
          @comments : String? = nil
        )
        end
      end

      struct UpdateFindingsFeedbackResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateIPSetRequest
        include JSON::Serializable

        # The detectorID that specifies the GuardDuty service whose IPSet you want to update. To find the
        # detectorId in the current Region, see the Settings page in the GuardDuty console, or run the
        # ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The unique ID that specifies the IPSet that you want to update.
        @[JSON::Field(key: "ipSetId")]
        getter ip_set_id : String

        # The updated Boolean value that specifies whether the IPSet is active or not.
        @[JSON::Field(key: "activate")]
        getter activate : Bool?

        # The Amazon Web Services account ID that owns the Amazon S3 bucket specified in the location
        # parameter.
        @[JSON::Field(key: "expectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The updated URI of the file that contains the IPSet.
        @[JSON::Field(key: "location")]
        getter location : String?

        # The unique ID that specifies the IPSet that you want to update.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @detector_id : String,
          @ip_set_id : String,
          @activate : Bool? = nil,
          @expected_bucket_owner : String? = nil,
          @location : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateIPSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateMalwareProtectionPlanRequest
        include JSON::Serializable

        # A unique identifier associated with the Malware Protection plan.
        @[JSON::Field(key: "malwareProtectionPlanId")]
        getter malware_protection_plan_id : String

        # Information about whether the tags will be added to the S3 object after scanning.
        @[JSON::Field(key: "actions")]
        getter actions : Types::MalwareProtectionPlanActions?

        # Information about the protected resource that is associated with the created Malware Protection
        # plan. Presently, S3Bucket is the only supported protected resource.
        @[JSON::Field(key: "protectedResource")]
        getter protected_resource : Types::UpdateProtectedResource?

        # Amazon Resource Name (ARN) of the IAM role with permissions to scan and add tags to the associated
        # protected resource.
        @[JSON::Field(key: "role")]
        getter role : String?

        def initialize(
          @malware_protection_plan_id : String,
          @actions : Types::MalwareProtectionPlanActions? = nil,
          @protected_resource : Types::UpdateProtectedResource? = nil,
          @role : String? = nil
        )
        end
      end

      struct UpdateMalwareScanSettingsRequest
        include JSON::Serializable

        # The unique ID of the detector that specifies the GuardDuty service where you want to update scan
        # settings. To find the detectorId in the current Region, see the Settings page in the GuardDuty
        # console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # An enum value representing possible snapshot preservation settings.
        @[JSON::Field(key: "ebsSnapshotPreservation")]
        getter ebs_snapshot_preservation : String?

        # Represents the criteria to be used in the filter for selecting resources to scan.
        @[JSON::Field(key: "scanResourceCriteria")]
        getter scan_resource_criteria : Types::ScanResourceCriteria?

        def initialize(
          @detector_id : String,
          @ebs_snapshot_preservation : String? = nil,
          @scan_resource_criteria : Types::ScanResourceCriteria? = nil
        )
        end
      end

      struct UpdateMalwareScanSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateMemberDetectorsRequest
        include JSON::Serializable

        # A list of member account IDs to be updated.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # The detector ID of the administrator account. To find the detectorId in the current Region, see the
        # Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # Describes which data sources will be updated.
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Types::DataSourceConfigurations?

        # A list of features that will be updated for the specified member accounts.
        @[JSON::Field(key: "features")]
        getter features : Array(Types::MemberFeaturesConfiguration)?

        def initialize(
          @account_ids : Array(String),
          @detector_id : String,
          @data_sources : Types::DataSourceConfigurations? = nil,
          @features : Array(Types::MemberFeaturesConfiguration)? = nil
        )
        end
      end

      struct UpdateMemberDetectorsResponse
        include JSON::Serializable

        # A list of member account IDs that were unable to be processed along with an explanation for why they
        # were not processed.
        @[JSON::Field(key: "unprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)

        def initialize(
          @unprocessed_accounts : Array(Types::UnprocessedAccount)
        )
        end
      end

      struct UpdateOrganizationConfigurationRequest
        include JSON::Serializable

        # The ID of the detector that configures the delegated administrator. To find the detectorId in the
        # current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # Represents whether to automatically enable member accounts in the organization. This applies to only
        # new member accounts, not the existing member accounts. When a new account joins the organization,
        # the chosen features will be enabled for them by default. Even though this is still supported, we
        # recommend using AutoEnableOrganizationMembers to achieve the similar results. You must provide a
        # value for either autoEnableOrganizationMembers or autoEnable .
        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Bool?

        # Indicates the auto-enablement configuration of GuardDuty for the member accounts in the
        # organization. You must provide a value for either autoEnableOrganizationMembers or autoEnable . Use
        # one of the following configuration values for autoEnableOrganizationMembers : NEW : Indicates that
        # when a new account joins the organization, they will have GuardDuty enabled automatically. ALL :
        # Indicates that all accounts in the organization have GuardDuty enabled automatically. This includes
        # NEW accounts that join the organization and accounts that may have been suspended or removed from
        # the organization in GuardDuty. It may take up to 24 hours to update the configuration for all the
        # member accounts. NONE : Indicates that GuardDuty will not be automatically enabled for any account
        # in the organization. The administrator must manage GuardDuty for each account in the organization
        # individually. When you update the auto-enable setting from ALL or NEW to NONE , this action doesn't
        # disable the corresponding option for your existing accounts. This configuration will apply to the
        # new accounts that join the organization. After you update the auto-enable settings, no new account
        # will have the corresponding option as enabled.
        @[JSON::Field(key: "autoEnableOrganizationMembers")]
        getter auto_enable_organization_members : String?

        # Describes which data sources will be updated.
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Types::OrganizationDataSourceConfigurations?

        # A list of features that will be configured for the organization.
        @[JSON::Field(key: "features")]
        getter features : Array(Types::OrganizationFeatureConfiguration)?

        def initialize(
          @detector_id : String,
          @auto_enable : Bool? = nil,
          @auto_enable_organization_members : String? = nil,
          @data_sources : Types::OrganizationDataSourceConfigurations? = nil,
          @features : Array(Types::OrganizationFeatureConfiguration)? = nil
        )
        end
      end

      struct UpdateOrganizationConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the protected resource that is associated with the created Malware Protection
      # plan. Presently, S3Bucket is the only supported protected resource.
      struct UpdateProtectedResource
        include JSON::Serializable

        # Information about the protected S3 bucket resource.
        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : Types::UpdateS3BucketResource?

        def initialize(
          @s3_bucket : Types::UpdateS3BucketResource? = nil
        )
        end
      end

      struct UpdatePublishingDestinationRequest
        include JSON::Serializable

        # The ID of the publishing destination to update.
        @[JSON::Field(key: "destinationId")]
        getter destination_id : String

        # The ID of the detector associated with the publishing destinations to update. To find the detectorId
        # in the current Region, see the Settings page in the GuardDuty console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # A DestinationProperties object that includes the DestinationArn and KmsKeyArn of the publishing
        # destination.
        @[JSON::Field(key: "destinationProperties")]
        getter destination_properties : Types::DestinationProperties?

        def initialize(
          @destination_id : String,
          @detector_id : String,
          @destination_properties : Types::DestinationProperties? = nil
        )
        end
      end

      struct UpdatePublishingDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the protected S3 bucket resource.
      struct UpdateS3BucketResource
        include JSON::Serializable

        # Information about the specified object prefixes. The S3 object will be scanned only if it belongs to
        # any of the specified object prefixes.
        @[JSON::Field(key: "objectPrefixes")]
        getter object_prefixes : Array(String)?

        def initialize(
          @object_prefixes : Array(String)? = nil
        )
        end
      end

      struct UpdateThreatEntitySetRequest
        include JSON::Serializable

        # The unique ID of the GuardDuty detector associated with the threat entity set that you want to
        # update. To find the detectorId in the current Region, see the Settings page in the GuardDuty
        # console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The ID returned by GuardDuty after updating the threat entity set resource.
        @[JSON::Field(key: "threatEntitySetId")]
        getter threat_entity_set_id : String

        # A boolean value that indicates whether GuardDuty is to start using this updated threat entity set.
        # After you update an entity set, you will need to activate it again. It might take up to 15 minutes
        # for the updated entity set to be effective.
        @[JSON::Field(key: "activate")]
        getter activate : Bool?

        # The Amazon Web Services account ID that owns the Amazon S3 bucket specified in the location
        # parameter.
        @[JSON::Field(key: "expectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The URI of the file that contains the trusted entity set.
        @[JSON::Field(key: "location")]
        getter location : String?

        # A user-friendly name to identify the trusted entity set. The name of your list can include lowercase
        # letters, uppercase letters, numbers, dash (-), and underscore (_).
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @detector_id : String,
          @threat_entity_set_id : String,
          @activate : Bool? = nil,
          @expected_bucket_owner : String? = nil,
          @location : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateThreatEntitySetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateThreatIntelSetRequest
        include JSON::Serializable

        # The detectorID that specifies the GuardDuty service whose ThreatIntelSet you want to update. To find
        # the detectorId in the current Region, see the Settings page in the GuardDuty console, or run the
        # ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The unique ID that specifies the ThreatIntelSet that you want to update.
        @[JSON::Field(key: "threatIntelSetId")]
        getter threat_intel_set_id : String

        # The updated Boolean value that specifies whether the ThreateIntelSet is active or not.
        @[JSON::Field(key: "activate")]
        getter activate : Bool?

        # The Amazon Web Services account ID that owns the Amazon S3 bucket specified in the location
        # parameter.
        @[JSON::Field(key: "expectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The updated URI of the file that contains the ThreateIntelSet.
        @[JSON::Field(key: "location")]
        getter location : String?

        # The unique ID that specifies the ThreatIntelSet that you want to update.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @detector_id : String,
          @threat_intel_set_id : String,
          @activate : Bool? = nil,
          @expected_bucket_owner : String? = nil,
          @location : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateThreatIntelSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateTrustedEntitySetRequest
        include JSON::Serializable

        # The unique ID of the GuardDuty detector associated with the threat entity set that you want to
        # update. To find the detectorId in the current Region, see the Settings page in the GuardDuty
        # console, or run the ListDetectors API.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The ID returned by GuardDuty after updating the trusted entity set resource.
        @[JSON::Field(key: "trustedEntitySetId")]
        getter trusted_entity_set_id : String

        # A boolean value that indicates whether GuardDuty is to start using this updated trusted entity set.
        # After you update an entity set, you will need to activate it again. It might take up to 15 minutes
        # for the updated entity set to be effective.
        @[JSON::Field(key: "activate")]
        getter activate : Bool?

        # The Amazon Web Services account ID that owns the Amazon S3 bucket specified in the location
        # parameter.
        @[JSON::Field(key: "expectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The URI of the file that contains the trusted entity set.
        @[JSON::Field(key: "location")]
        getter location : String?

        # A user-friendly name to identify the trusted entity set. The name of your list can include lowercase
        # letters, uppercase letters, numbers, dash (-), and underscore (_).
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @detector_id : String,
          @trusted_entity_set_id : String,
          @activate : Bool? = nil,
          @expected_bucket_owner : String? = nil,
          @location : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateTrustedEntitySetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information on the total of usage based on account IDs.
      struct UsageAccountResult
        include JSON::Serializable

        # The Account ID that generated usage.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Represents the total of usage for the Account ID.
        @[JSON::Field(key: "total")]
        getter total : Types::Total?

        def initialize(
          @account_id : String? = nil,
          @total : Types::Total? = nil
        )
        end
      end

      # Contains information about the criteria used to query usage statistics.
      struct UsageCriteria
        include JSON::Serializable

        # The account IDs to aggregate usage statistics from.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The data sources to aggregate usage statistics from.
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Array(String)?

        # The features to aggregate usage statistics from.
        @[JSON::Field(key: "features")]
        getter features : Array(String)?

        # The resources to aggregate usage statistics from. Only accepts exact resource names.
        @[JSON::Field(key: "resources")]
        getter resources : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @data_sources : Array(String)? = nil,
          @features : Array(String)? = nil,
          @resources : Array(String)? = nil
        )
        end
      end

      # Contains information on the result of usage based on data source type.
      struct UsageDataSourceResult
        include JSON::Serializable

        # The data source type that generated usage.
        @[JSON::Field(key: "dataSource")]
        getter data_source : String?

        # Represents the total of usage for the specified data source.
        @[JSON::Field(key: "total")]
        getter total : Types::Total?

        def initialize(
          @data_source : String? = nil,
          @total : Types::Total? = nil
        )
        end
      end

      # Contains information about the result of the total usage based on the feature.
      struct UsageFeatureResult
        include JSON::Serializable

        # The feature that generated the usage cost.
        @[JSON::Field(key: "feature")]
        getter feature : String?

        @[JSON::Field(key: "total")]
        getter total : Types::Total?

        def initialize(
          @feature : String? = nil,
          @total : Types::Total? = nil
        )
        end
      end

      # Contains information on the sum of usage based on an Amazon Web Services resource.
      struct UsageResourceResult
        include JSON::Serializable

        # The Amazon Web Services resource that generated usage.
        @[JSON::Field(key: "resource")]
        getter resource : String?

        # Represents the sum total of usage for the specified resource type.
        @[JSON::Field(key: "total")]
        getter total : Types::Total?

        def initialize(
          @resource : String? = nil,
          @total : Types::Total? = nil
        )
        end
      end

      # Contains the result of GuardDuty usage. If a UsageStatisticType is provided the result for other
      # types will be null.
      struct UsageStatistics
        include JSON::Serializable

        # The usage statistic sum organized by account ID.
        @[JSON::Field(key: "sumByAccount")]
        getter sum_by_account : Array(Types::UsageAccountResult)?

        # The usage statistic sum organized by on data source.
        @[JSON::Field(key: "sumByDataSource")]
        getter sum_by_data_source : Array(Types::UsageDataSourceResult)?

        # The usage statistic sum organized by feature.
        @[JSON::Field(key: "sumByFeature")]
        getter sum_by_feature : Array(Types::UsageFeatureResult)?

        # The usage statistic sum organized by resource.
        @[JSON::Field(key: "sumByResource")]
        getter sum_by_resource : Array(Types::UsageResourceResult)?

        # Lists the top 50 accounts by feature that have generated the most GuardDuty usage, in the order from
        # most to least expensive. Currently, this doesn't support RDS_LOGIN_EVENTS .
        @[JSON::Field(key: "topAccountsByFeature")]
        getter top_accounts_by_feature : Array(Types::UsageTopAccountsResult)?

        # Lists the top 50 resources that have generated the most GuardDuty usage, in order from most to least
        # expensive.
        @[JSON::Field(key: "topResources")]
        getter top_resources : Array(Types::UsageResourceResult)?

        def initialize(
          @sum_by_account : Array(Types::UsageAccountResult)? = nil,
          @sum_by_data_source : Array(Types::UsageDataSourceResult)? = nil,
          @sum_by_feature : Array(Types::UsageFeatureResult)? = nil,
          @sum_by_resource : Array(Types::UsageResourceResult)? = nil,
          @top_accounts_by_feature : Array(Types::UsageTopAccountsResult)? = nil,
          @top_resources : Array(Types::UsageResourceResult)? = nil
        )
        end
      end

      # Contains information on the total of usage based on the topmost 50 account IDs.
      struct UsageTopAccountResult
        include JSON::Serializable

        # The unique account ID.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        @[JSON::Field(key: "total")]
        getter total : Types::Total?

        def initialize(
          @account_id : String? = nil,
          @total : Types::Total? = nil
        )
        end
      end

      # Information about the usage statistics, calculated by top accounts by feature.
      struct UsageTopAccountsResult
        include JSON::Serializable

        # The accounts that contributed to the total usage cost.
        @[JSON::Field(key: "accounts")]
        getter accounts : Array(Types::UsageTopAccountResult)?

        # Features by which you can generate the usage statistics. RDS_LOGIN_EVENTS is currently not supported
        # with topAccountsByFeature .
        @[JSON::Field(key: "feature")]
        getter feature : String?

        def initialize(
          @accounts : Array(Types::UsageTopAccountResult)? = nil,
          @feature : String? = nil
        )
        end
      end

      # Contains information about the user involved in the attack sequence.
      struct User
        include JSON::Serializable

        # The name of the user.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the user.
        @[JSON::Field(key: "type")]
        getter type : String

        # The unique identifier of the user.
        @[JSON::Field(key: "uid")]
        getter uid : String

        # Contains information about the Amazon Web Services account.
        @[JSON::Field(key: "account")]
        getter account : Types::Account?

        # The credentials of the user ID.
        @[JSON::Field(key: "credentialUid")]
        getter credential_uid : String?

        def initialize(
          @name : String,
          @type : String,
          @uid : String,
          @account : Types::Account? = nil,
          @credential_uid : String? = nil
        )
        end
      end

      # Volume used by the Kubernetes workload.
      struct Volume
        include JSON::Serializable

        # Represents a pre-existing file or directory on the host machine that the volume maps to.
        @[JSON::Field(key: "hostPath")]
        getter host_path : Types::HostPath?

        # Volume name.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @host_path : Types::HostPath? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains EBS volume details.
      struct VolumeDetail
        include JSON::Serializable

        # The device name for the EBS volume.
        @[JSON::Field(key: "deviceName")]
        getter device_name : String?

        # EBS volume encryption type.
        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String?

        # KMS key ARN used to encrypt the EBS volume.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # Snapshot ARN of the EBS volume.
        @[JSON::Field(key: "snapshotArn")]
        getter snapshot_arn : String?

        # EBS volume ARN information.
        @[JSON::Field(key: "volumeArn")]
        getter volume_arn : String?

        # EBS volume size in GB.
        @[JSON::Field(key: "volumeSizeInGB")]
        getter volume_size_in_gb : Int32?

        # The EBS volume type.
        @[JSON::Field(key: "volumeType")]
        getter volume_type : String?

        def initialize(
          @device_name : String? = nil,
          @encryption_type : String? = nil,
          @kms_key_arn : String? = nil,
          @snapshot_arn : String? = nil,
          @volume_arn : String? = nil,
          @volume_size_in_gb : Int32? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # Container volume mount.
      struct VolumeMount
        include JSON::Serializable

        # Volume mount path.
        @[JSON::Field(key: "mountPath")]
        getter mount_path : String?

        # Volume mount name.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @mount_path : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Amazon Virtual Private Cloud configuration details associated with your Lambda function.
      struct VpcConfig
        include JSON::Serializable

        # The identifier of the security group attached to the Lambda function.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(Types::SecurityGroup)?

        # The identifiers of the subnets that are associated with your Lambda function.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The identifier of the Amazon Virtual Private Cloud.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @security_groups : Array(Types::SecurityGroup)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end
    end
  end
end
