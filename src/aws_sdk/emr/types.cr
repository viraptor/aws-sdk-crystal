require "json"
require "time"

module AwsSdk
  module EMR
    module Types


      struct AddInstanceFleetInput
        include JSON::Serializable

        # The unique identifier of the cluster.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # Specifies the configuration of the instance fleet.

        @[JSON::Field(key: "InstanceFleet")]
        getter instance_fleet : Types::InstanceFleetConfig

        def initialize(
          @cluster_id : String,
          @instance_fleet : Types::InstanceFleetConfig
        )
        end
      end


      struct AddInstanceFleetOutput
        include JSON::Serializable

        # The Amazon Resource Name of the cluster.

        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String?

        # The unique identifier of the cluster.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String?

        # The unique identifier of the instance fleet.

        @[JSON::Field(key: "InstanceFleetId")]
        getter instance_fleet_id : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_id : String? = nil,
          @instance_fleet_id : String? = nil
        )
        end
      end

      # Input to an AddInstanceGroups call.

      struct AddInstanceGroupsInput
        include JSON::Serializable

        # Instance groups to add.

        @[JSON::Field(key: "InstanceGroups")]
        getter instance_groups : Array(Types::InstanceGroupConfig)

        # Job flow in which to add the instance groups.

        @[JSON::Field(key: "JobFlowId")]
        getter job_flow_id : String

        def initialize(
          @instance_groups : Array(Types::InstanceGroupConfig),
          @job_flow_id : String
        )
        end
      end

      # Output from an AddInstanceGroups call.

      struct AddInstanceGroupsOutput
        include JSON::Serializable

        # The Amazon Resource Name of the cluster.

        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String?

        # Instance group IDs of the newly created instance groups.

        @[JSON::Field(key: "InstanceGroupIds")]
        getter instance_group_ids : Array(String)?

        # The job flow ID in which the instance groups are added.

        @[JSON::Field(key: "JobFlowId")]
        getter job_flow_id : String?

        def initialize(
          @cluster_arn : String? = nil,
          @instance_group_ids : Array(String)? = nil,
          @job_flow_id : String? = nil
        )
        end
      end

      # The input argument to the AddJobFlowSteps operation.

      struct AddJobFlowStepsInput
        include JSON::Serializable

        # A string that uniquely identifies the job flow. This identifier is returned by RunJobFlow and can
        # also be obtained from ListClusters .

        @[JSON::Field(key: "JobFlowId")]
        getter job_flow_id : String

        # A list of StepConfig to be executed by the job flow.

        @[JSON::Field(key: "Steps")]
        getter steps : Array(Types::StepConfig)

        # The Amazon Resource Name (ARN) of the runtime role for a step on the cluster. The runtime role can
        # be a cross-account IAM role. The runtime role ARN is a combination of account ID, role name, and
        # role type using the following format: arn:partition:service:region:account:resource . For example,
        # arn:aws:IAM::1234567890:role/ReadOnly is a correctly formatted runtime role ARN.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        def initialize(
          @job_flow_id : String,
          @steps : Array(Types::StepConfig),
          @execution_role_arn : String? = nil
        )
        end
      end

      # The output for the AddJobFlowSteps operation.

      struct AddJobFlowStepsOutput
        include JSON::Serializable

        # The identifiers of the list of steps added to the job flow.

        @[JSON::Field(key: "StepIds")]
        getter step_ids : Array(String)?

        def initialize(
          @step_ids : Array(String)? = nil
        )
        end
      end

      # This input identifies an Amazon EMR resource and a list of tags to attach.

      struct AddTagsInput
        include JSON::Serializable

        # The Amazon EMR resource identifier to which tags will be added. For example, a cluster identifier or
        # an Amazon EMR Studio ID.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # A list of tags to associate with a resource. Tags are user-defined key-value pairs that consist of a
        # required key string with a maximum of 128 characters, and an optional value string with a maximum of
        # 256 characters.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_id : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # This output indicates the result of adding tags to a resource.

      struct AddTagsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # With Amazon EMR release version 4.0 and later, the only accepted parameter is the application name.
      # To pass arguments to applications, you use configuration classifications specified using
      # configuration JSON objects. For more information, see Configuring Applications . With earlier Amazon
      # EMR releases, the application is any Amazon or third-party software that you can add to the cluster.
      # This structure contains a list of strings that indicates the software to use with the cluster and
      # accepts a user argument list. Amazon EMR accepts and forwards the argument list to the corresponding
      # installation script as bootstrap action argument.

      struct Application
        include JSON::Serializable

        # This option is for advanced users only. This is meta information about third-party applications that
        # third-party vendors use for testing purposes.

        @[JSON::Field(key: "AdditionalInfo")]
        getter additional_info : Hash(String, String)?

        # Arguments for Amazon EMR to pass to the application.

        @[JSON::Field(key: "Args")]
        getter args : Array(String)?

        # The name of the application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The version of the application.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @additional_info : Hash(String, String)? = nil,
          @args : Array(String)? = nil,
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # An automatic scaling policy for a core instance group or task instance group in an Amazon EMR
      # cluster. An automatic scaling policy defines how an instance group dynamically adds and terminates
      # Amazon EC2 instances in response to the value of a CloudWatch metric. See PutAutoScalingPolicy .

      struct AutoScalingPolicy
        include JSON::Serializable

        # The upper and lower Amazon EC2 instance limits for an automatic scaling policy. Automatic scaling
        # activity will not cause an instance group to grow above or below these limits.

        @[JSON::Field(key: "Constraints")]
        getter constraints : Types::ScalingConstraints

        # The scale-in and scale-out rules that comprise the automatic scaling policy.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::ScalingRule)

        def initialize(
          @constraints : Types::ScalingConstraints,
          @rules : Array(Types::ScalingRule)
        )
        end
      end

      # An automatic scaling policy for a core instance group or task instance group in an Amazon EMR
      # cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates
      # Amazon EC2 instances in response to the value of a CloudWatch metric. See PutAutoScalingPolicy .

      struct AutoScalingPolicyDescription
        include JSON::Serializable

        # The upper and lower Amazon EC2 instance limits for an automatic scaling policy. Automatic scaling
        # activity will not cause an instance group to grow above or below these limits.

        @[JSON::Field(key: "Constraints")]
        getter constraints : Types::ScalingConstraints?

        # The scale-in and scale-out rules that comprise the automatic scaling policy.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::ScalingRule)?

        # The status of an automatic scaling policy.

        @[JSON::Field(key: "Status")]
        getter status : Types::AutoScalingPolicyStatus?

        def initialize(
          @constraints : Types::ScalingConstraints? = nil,
          @rules : Array(Types::ScalingRule)? = nil,
          @status : Types::AutoScalingPolicyStatus? = nil
        )
        end
      end

      # The reason for an AutoScalingPolicyStatus change.

      struct AutoScalingPolicyStateChangeReason
        include JSON::Serializable

        # The code indicating the reason for the change in status. USER_REQUEST indicates that the scaling
        # policy status was changed by a user. PROVISION_FAILURE indicates that the status change was because
        # the policy failed to provision. CLEANUP_FAILURE indicates an error.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # A friendly, more verbose message that accompanies an automatic scaling policy state change.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The status of an automatic scaling policy.

      struct AutoScalingPolicyStatus
        include JSON::Serializable

        # Indicates the status of the automatic scaling policy.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason for a change in status.

        @[JSON::Field(key: "StateChangeReason")]
        getter state_change_reason : Types::AutoScalingPolicyStateChangeReason?

        def initialize(
          @state : String? = nil,
          @state_change_reason : Types::AutoScalingPolicyStateChangeReason? = nil
        )
        end
      end

      # An auto-termination policy for an Amazon EMR cluster. An auto-termination policy defines the amount
      # of idle time in seconds after which a cluster automatically terminates. For alternative cluster
      # termination options, see Control cluster termination .

      struct AutoTerminationPolicy
        include JSON::Serializable

        # Specifies the amount of idle time in seconds after which the cluster automatically terminates. You
        # can specify a minimum of 60 seconds and a maximum of 604800 seconds (seven days).

        @[JSON::Field(key: "IdleTimeout")]
        getter idle_timeout : Int64?

        def initialize(
          @idle_timeout : Int64? = nil
        )
        end
      end

      # A configuration for Amazon EMR block public access. When BlockPublicSecurityGroupRules is set to
      # true , Amazon EMR prevents cluster creation if one of the cluster's security groups has a rule that
      # allows inbound traffic from 0.0.0.0/0 or ::/0 on a port, unless the port is specified as an
      # exception using PermittedPublicSecurityGroupRuleRanges .

      struct BlockPublicAccessConfiguration
        include JSON::Serializable

        # Indicates whether Amazon EMR block public access is enabled ( true ) or disabled ( false ). By
        # default, the value is false for accounts that have created Amazon EMR clusters before July 2019. For
        # accounts created after this, the default is true .

        @[JSON::Field(key: "BlockPublicSecurityGroupRules")]
        getter block_public_security_group_rules : Bool

        # Specifies ports and port ranges that are permitted to have security group rules that allow inbound
        # traffic from all public sources. For example, if Port 23 (Telnet) is specified for
        # PermittedPublicSecurityGroupRuleRanges , Amazon EMR allows cluster creation if a security group
        # associated with the cluster has a rule that allows inbound traffic on Port 23 from IPv4 0.0.0.0/0 or
        # IPv6 port ::/0 as the source. By default, Port 22, which is used for SSH access to the cluster
        # Amazon EC2 instances, is in the list of PermittedPublicSecurityGroupRuleRanges .

        @[JSON::Field(key: "PermittedPublicSecurityGroupRuleRanges")]
        getter permitted_public_security_group_rule_ranges : Array(Types::PortRange)?

        def initialize(
          @block_public_security_group_rules : Bool,
          @permitted_public_security_group_rule_ranges : Array(Types::PortRange)? = nil
        )
        end
      end

      # Properties that describe the Amazon Web Services principal that created the
      # BlockPublicAccessConfiguration using the PutBlockPublicAccessConfiguration action as well as the
      # date and time that the configuration was created. Each time a configuration for block public access
      # is updated, Amazon EMR updates this metadata.

      struct BlockPublicAccessConfigurationMetadata
        include JSON::Serializable

        # The Amazon Resource Name that created or last modified the configuration.

        @[JSON::Field(key: "CreatedByArn")]
        getter created_by_arn : String

        # The date and time that the configuration was created.

        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time

        def initialize(
          @created_by_arn : String,
          @creation_date_time : Time
        )
        end
      end

      # Configuration of a bootstrap action.

      struct BootstrapActionConfig
        include JSON::Serializable

        # The name of the bootstrap action.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The script run by the bootstrap action.

        @[JSON::Field(key: "ScriptBootstrapAction")]
        getter script_bootstrap_action : Types::ScriptBootstrapActionConfig

        def initialize(
          @name : String,
          @script_bootstrap_action : Types::ScriptBootstrapActionConfig
        )
        end
      end

      # Reports the configuration of a bootstrap action in a cluster (job flow).

      struct BootstrapActionDetail
        include JSON::Serializable

        # A description of the bootstrap action.

        @[JSON::Field(key: "BootstrapActionConfig")]
        getter bootstrap_action_config : Types::BootstrapActionConfig?

        def initialize(
          @bootstrap_action_config : Types::BootstrapActionConfig? = nil
        )
        end
      end

      # Specification of the status of a CancelSteps request. Available only in Amazon EMR version 4.8.0 and
      # later, excluding version 5.0.0.

      struct CancelStepsInfo
        include JSON::Serializable

        # The reason for the failure if the CancelSteps request fails.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The status of a CancelSteps Request. The value may be SUBMITTED or FAILED.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The encrypted StepId of a step.

        @[JSON::Field(key: "StepId")]
        getter step_id : String?

        def initialize(
          @reason : String? = nil,
          @status : String? = nil,
          @step_id : String? = nil
        )
        end
      end

      # The input argument to the CancelSteps operation.

      struct CancelStepsInput
        include JSON::Serializable

        # The ClusterID for the specified steps that will be canceled. Use RunJobFlow and ListClusters to get
        # ClusterIDs.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The list of StepIDs to cancel. Use ListSteps to get steps and their states for the specified
        # cluster.

        @[JSON::Field(key: "StepIds")]
        getter step_ids : Array(String)

        # The option to choose to cancel RUNNING steps. By default, the value is SEND_INTERRUPT .

        @[JSON::Field(key: "StepCancellationOption")]
        getter step_cancellation_option : String?

        def initialize(
          @cluster_id : String,
          @step_ids : Array(String),
          @step_cancellation_option : String? = nil
        )
        end
      end

      # The output for the CancelSteps operation.

      struct CancelStepsOutput
        include JSON::Serializable

        # A list of CancelStepsInfo , which shows the status of specified cancel requests for each StepID
        # specified.

        @[JSON::Field(key: "CancelStepsInfoList")]
        getter cancel_steps_info_list : Array(Types::CancelStepsInfo)?

        def initialize(
          @cancel_steps_info_list : Array(Types::CancelStepsInfo)? = nil
        )
        end
      end

      # The definition of a CloudWatch metric alarm, which determines when an automatic scaling activity is
      # triggered. When the defined alarm conditions are satisfied, scaling activity begins.

      struct CloudWatchAlarmDefinition
        include JSON::Serializable

        # Determines how the metric specified by MetricName is compared to the value specified by Threshold .

        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String

        # The name of the CloudWatch metric that is watched to determine an alarm condition.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # The period, in seconds, over which the statistic is applied. CloudWatch metrics for Amazon EMR are
        # emitted every five minutes (300 seconds), so if you specify a CloudWatch metric, specify 300 .

        @[JSON::Field(key: "Period")]
        getter period : Int32

        # The value against which the specified statistic is compared.

        @[JSON::Field(key: "Threshold")]
        getter threshold : Float64

        # A CloudWatch metric dimension.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::MetricDimension)?

        # The number of periods, in five-minute increments, during which the alarm condition must exist before
        # the alarm triggers automatic scaling activity. The default value is 1 .

        @[JSON::Field(key: "EvaluationPeriods")]
        getter evaluation_periods : Int32?

        # The namespace for the CloudWatch metric. The default is AWS/ElasticMapReduce .

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # The statistic to apply to the metric associated with the alarm. The default is AVERAGE .

        @[JSON::Field(key: "Statistic")]
        getter statistic : String?

        # The unit of measure associated with the CloudWatch metric being watched. The value specified for
        # Unit must correspond to the units specified in the CloudWatch metric.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @comparison_operator : String,
          @metric_name : String,
          @period : Int32,
          @threshold : Float64,
          @dimensions : Array(Types::MetricDimension)? = nil,
          @evaluation_periods : Int32? = nil,
          @namespace : String? = nil,
          @statistic : String? = nil,
          @unit : String? = nil
        )
        end
      end

      # Holds CloudWatch log configuration settings and metadata that specify settings like log files to
      # monitor and where to send them.

      struct CloudWatchLogConfiguration
        include JSON::Serializable

        # Specifies if CloudWatch logging is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The ARN of the encryption key used to encrypt the logs.

        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The name of the CloudWatch log group where logs are published.

        @[JSON::Field(key: "LogGroupName")]
        getter log_group_name : String?

        # The prefix of the log stream name.

        @[JSON::Field(key: "LogStreamNamePrefix")]
        getter log_stream_name_prefix : String?

        # A map of log types to file names for publishing logs to the standard output or standard error
        # streams for CloudWatch. Valid log types include STEP_LOGS, SPARK_DRIVER, and SPARK_EXECUTOR. Valid
        # file names for each type include STDOUT and STDERR.

        @[JSON::Field(key: "LogTypes")]
        getter log_types : Hash(String, Array(String))?

        def initialize(
          @enabled : Bool,
          @encryption_key_arn : String? = nil,
          @log_group_name : String? = nil,
          @log_stream_name_prefix : String? = nil,
          @log_types : Hash(String, Array(String))? = nil
        )
        end
      end

      # The detailed description of the cluster.

      struct Cluster
        include JSON::Serializable

        # The applications installed on this cluster.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(Types::Application)?

        # An IAM role for automatic scaling policies. The default role is EMR_AutoScaling_DefaultRole . The
        # IAM role provides permissions that the automatic scaling feature requires to launch and terminate
        # Amazon EC2 instances in an instance group.

        @[JSON::Field(key: "AutoScalingRole")]
        getter auto_scaling_role : String?

        # Specifies whether the cluster should terminate after completing all steps.

        @[JSON::Field(key: "AutoTerminate")]
        getter auto_terminate : Bool?

        # The Amazon Resource Name of the cluster.

        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String?

        # Applies only to Amazon EMR releases 4.x and later. The list of configurations that are supplied to
        # the Amazon EMR cluster.

        @[JSON::Field(key: "Configurations")]
        getter configurations : Array(Types::Configuration)?

        # Available only in Amazon EMR releases 5.7.0 and later. The ID of a custom Amazon EBS-backed Linux
        # AMI if the cluster uses a custom AMI.

        @[JSON::Field(key: "CustomAmiId")]
        getter custom_ami_id : String?

        # The IOPS, of the Amazon EBS root device volume of the Linux AMI that is used for each Amazon EC2
        # instance. Available in Amazon EMR releases 6.15.0 and later.

        @[JSON::Field(key: "EbsRootVolumeIops")]
        getter ebs_root_volume_iops : Int32?

        # The size, in GiB, of the Amazon EBS root device volume of the Linux AMI that is used for each Amazon
        # EC2 instance. Available in Amazon EMR releases 4.x and later.

        @[JSON::Field(key: "EbsRootVolumeSize")]
        getter ebs_root_volume_size : Int32?

        # The throughput, in MiB/s, of the Amazon EBS root device volume of the Linux AMI that is used for
        # each Amazon EC2 instance. Available in Amazon EMR releases 6.15.0 and later.

        @[JSON::Field(key: "EbsRootVolumeThroughput")]
        getter ebs_root_volume_throughput : Int32?

        # Provides information about the Amazon EC2 instances in a cluster grouped by category. For example,
        # key name, subnet ID, IAM instance profile, and so on.

        @[JSON::Field(key: "Ec2InstanceAttributes")]
        getter ec2_instance_attributes : Types::Ec2InstanceAttributes?

        # Reserved.

        @[JSON::Field(key: "ExtendedSupport")]
        getter extended_support : Bool?

        # The unique identifier for the cluster.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, excluding
        # 5.0.x versions. The instance group configuration of the cluster. A value of INSTANCE_GROUP indicates
        # a uniform instance group configuration. A value of INSTANCE_FLEET indicates an instance fleets
        # configuration.

        @[JSON::Field(key: "InstanceCollectionType")]
        getter instance_collection_type : String?

        # Attributes for Kerberos configuration when Kerberos authentication is enabled using a security
        # configuration. For more information see Use Kerberos Authentication in the Amazon EMR Management
        # Guide .

        @[JSON::Field(key: "KerberosAttributes")]
        getter kerberos_attributes : Types::KerberosAttributes?

        # The KMS key used for encrypting log files. This attribute is only available with Amazon EMR 5.30.0
        # and later, excluding Amazon EMR 6.0.0.

        @[JSON::Field(key: "LogEncryptionKmsKeyId")]
        getter log_encryption_kms_key_id : String?

        # The path to the Amazon S3 location where logs for this cluster are stored.

        @[JSON::Field(key: "LogUri")]
        getter log_uri : String?

        # The DNS name of the master node. If the cluster is on a private subnet, this is the private DNS
        # name. On a public subnet, this is the public DNS name.

        @[JSON::Field(key: "MasterPublicDnsName")]
        getter master_public_dns_name : String?

        # Contains Cloudwatch log configuration metadata and settings.

        @[JSON::Field(key: "MonitoringConfiguration")]
        getter monitoring_configuration : Types::MonitoringConfiguration?

        # The name of the cluster. This parameter can't contain the characters &lt;, &gt;, $, |, or `
        # (backtick).

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An approximation of the cost of the cluster, represented in m1.small/hours. This value is
        # incremented one time for every hour an m1.small instance runs. Larger instances are weighted more,
        # so an Amazon EC2 instance that is roughly four times more expensive would result in the normalized
        # instance hours being incremented by four. This result is only an approximation and does not reflect
        # the actual billing rate.

        @[JSON::Field(key: "NormalizedInstanceHours")]
        getter normalized_instance_hours : Int32?

        # The Amazon Linux release specified in a cluster launch RunJobFlow request. If no Amazon Linux
        # release was specified, the default Amazon Linux release is shown in the response.

        @[JSON::Field(key: "OSReleaseLabel")]
        getter os_release_label : String?

        # The Amazon Resource Name (ARN) of the Outpost where the cluster is launched.

        @[JSON::Field(key: "OutpostArn")]
        getter outpost_arn : String?

        # Placement group configured for an Amazon EMR cluster.

        @[JSON::Field(key: "PlacementGroups")]
        getter placement_groups : Array(Types::PlacementGroupConfig)?

        # The Amazon EMR release label, which determines the version of open-source application packages
        # installed on the cluster. Release labels are in the form emr-x.x.x , where x.x.x is an Amazon EMR
        # release version such as emr-5.14.0 . For more information about Amazon EMR release versions and
        # included application versions and features, see https://docs.aws.amazon.com/emr/latest/ReleaseGuide/
        # . The release label applies only to Amazon EMR releases version 4.0 and later. Earlier versions use
        # AmiVersion .

        @[JSON::Field(key: "ReleaseLabel")]
        getter release_label : String?

        # Applies only when CustomAmiID is used. Specifies the type of updates that the Amazon Linux AMI
        # package repositories apply when an instance boots using the AMI.

        @[JSON::Field(key: "RepoUpgradeOnBoot")]
        getter repo_upgrade_on_boot : String?

        # The AMI version requested for this cluster.

        @[JSON::Field(key: "RequestedAmiVersion")]
        getter requested_ami_version : String?

        # The AMI version running on this cluster.

        @[JSON::Field(key: "RunningAmiVersion")]
        getter running_ami_version : String?

        # The way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or
        # an instance group is resized. TERMINATE_AT_INSTANCE_HOUR indicates that Amazon EMR terminates nodes
        # at the instance-hour boundary, regardless of when the request to terminate the instance was
        # submitted. This option is only available with Amazon EMR 5.1.0 and later and is the default for
        # clusters created using that version. TERMINATE_AT_TASK_COMPLETION indicates that Amazon EMR adds
        # nodes to a deny list and drains tasks from nodes before terminating the Amazon EC2 instances,
        # regardless of the instance-hour boundary. With either behavior, Amazon EMR removes the least active
        # nodes first and blocks instance termination if it could lead to HDFS corruption.
        # TERMINATE_AT_TASK_COMPLETION is available only in Amazon EMR releases 4.1.0 and later, and is the
        # default for versions of Amazon EMR earlier than 5.1.0.

        @[JSON::Field(key: "ScaleDownBehavior")]
        getter scale_down_behavior : String?

        # The name of the security configuration applied to the cluster.

        @[JSON::Field(key: "SecurityConfiguration")]
        getter security_configuration : String?

        # The IAM role that Amazon EMR assumes in order to access Amazon Web Services resources on your
        # behalf.

        @[JSON::Field(key: "ServiceRole")]
        getter service_role : String?

        # The current status details about the cluster.

        @[JSON::Field(key: "Status")]
        getter status : Types::ClusterStatus?

        # Specifies the number of steps that can be executed concurrently.

        @[JSON::Field(key: "StepConcurrencyLevel")]
        getter step_concurrency_level : Int32?

        # A list of tags associated with a cluster.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Indicates whether Amazon EMR will lock the cluster to prevent the Amazon EC2 instances from being
        # terminated by an API call or user intervention, or in the event of a cluster error.

        @[JSON::Field(key: "TerminationProtected")]
        getter termination_protected : Bool?

        # Indicates whether Amazon EMR should gracefully replace Amazon EC2 core instances that have degraded
        # within the cluster.

        @[JSON::Field(key: "UnhealthyNodeReplacement")]
        getter unhealthy_node_replacement : Bool?

        # Indicates whether the cluster is visible to IAM principals in the Amazon Web Services account
        # associated with the cluster. When true , IAM principals in the Amazon Web Services account can
        # perform Amazon EMR cluster actions on the cluster that their IAM policies allow. When false , only
        # the IAM principal that created the cluster and the Amazon Web Services account root user can perform
        # Amazon EMR actions, regardless of IAM permissions policies attached to other IAM principals. The
        # default value is true if a value is not provided when creating a cluster using the Amazon EMR API
        # RunJobFlow command, the CLI create-cluster command, or the Amazon Web Services Management Console.

        @[JSON::Field(key: "VisibleToAllUsers")]
        getter visible_to_all_users : Bool?

        def initialize(
          @applications : Array(Types::Application)? = nil,
          @auto_scaling_role : String? = nil,
          @auto_terminate : Bool? = nil,
          @cluster_arn : String? = nil,
          @configurations : Array(Types::Configuration)? = nil,
          @custom_ami_id : String? = nil,
          @ebs_root_volume_iops : Int32? = nil,
          @ebs_root_volume_size : Int32? = nil,
          @ebs_root_volume_throughput : Int32? = nil,
          @ec2_instance_attributes : Types::Ec2InstanceAttributes? = nil,
          @extended_support : Bool? = nil,
          @id : String? = nil,
          @instance_collection_type : String? = nil,
          @kerberos_attributes : Types::KerberosAttributes? = nil,
          @log_encryption_kms_key_id : String? = nil,
          @log_uri : String? = nil,
          @master_public_dns_name : String? = nil,
          @monitoring_configuration : Types::MonitoringConfiguration? = nil,
          @name : String? = nil,
          @normalized_instance_hours : Int32? = nil,
          @os_release_label : String? = nil,
          @outpost_arn : String? = nil,
          @placement_groups : Array(Types::PlacementGroupConfig)? = nil,
          @release_label : String? = nil,
          @repo_upgrade_on_boot : String? = nil,
          @requested_ami_version : String? = nil,
          @running_ami_version : String? = nil,
          @scale_down_behavior : String? = nil,
          @security_configuration : String? = nil,
          @service_role : String? = nil,
          @status : Types::ClusterStatus? = nil,
          @step_concurrency_level : Int32? = nil,
          @tags : Array(Types::Tag)? = nil,
          @termination_protected : Bool? = nil,
          @unhealthy_node_replacement : Bool? = nil,
          @visible_to_all_users : Bool? = nil
        )
        end
      end

      # The reason that the cluster changed to its current state.

      struct ClusterStateChangeReason
        include JSON::Serializable

        # The programmatic code for the state change reason.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The descriptive message for the state change reason.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The detailed status of the cluster.

      struct ClusterStatus
        include JSON::Serializable

        # A list of tuples that provides information about the errors that caused a cluster to terminate. This
        # structure can contain up to 10 different ErrorDetail tuples.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Array(Types::ErrorDetail)?

        # The current state of the cluster.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason for the cluster status change.

        @[JSON::Field(key: "StateChangeReason")]
        getter state_change_reason : Types::ClusterStateChangeReason?

        # A timeline that represents the status of a cluster over the lifetime of the cluster.

        @[JSON::Field(key: "Timeline")]
        getter timeline : Types::ClusterTimeline?

        def initialize(
          @error_details : Array(Types::ErrorDetail)? = nil,
          @state : String? = nil,
          @state_change_reason : Types::ClusterStateChangeReason? = nil,
          @timeline : Types::ClusterTimeline? = nil
        )
        end
      end

      # The summary description of the cluster.

      struct ClusterSummary
        include JSON::Serializable

        # The Amazon Resource Name of the cluster.

        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String?

        # The unique identifier for the cluster.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the cluster.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An approximation of the cost of the cluster, represented in m1.small/hours. This value is
        # incremented one time for every hour an m1.small instance runs. Larger instances are weighted more,
        # so an Amazon EC2 instance that is roughly four times more expensive would result in the normalized
        # instance hours being incremented by four. This result is only an approximation and does not reflect
        # the actual billing rate.

        @[JSON::Field(key: "NormalizedInstanceHours")]
        getter normalized_instance_hours : Int32?

        # The Amazon Resource Name (ARN) of the Outpost where the cluster is launched.

        @[JSON::Field(key: "OutpostArn")]
        getter outpost_arn : String?

        # The details about the current status of the cluster.

        @[JSON::Field(key: "Status")]
        getter status : Types::ClusterStatus?

        def initialize(
          @cluster_arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @normalized_instance_hours : Int32? = nil,
          @outpost_arn : String? = nil,
          @status : Types::ClusterStatus? = nil
        )
        end
      end

      # Represents the timeline of the cluster's lifecycle.

      struct ClusterTimeline
        include JSON::Serializable

        # The creation date and time of the cluster.

        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The date and time when the cluster was terminated.

        @[JSON::Field(key: "EndDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date_time : Time?

        # The date and time when the cluster was ready to run steps.

        @[JSON::Field(key: "ReadyDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ready_date_time : Time?

        def initialize(
          @creation_date_time : Time? = nil,
          @end_date_time : Time? = nil,
          @ready_date_time : Time? = nil
        )
        end
      end

      # An entity describing an executable that runs on a cluster.

      struct Command
        include JSON::Serializable

        # Arguments for Amazon EMR to pass to the command for execution.

        @[JSON::Field(key: "Args")]
        getter args : Array(String)?

        # The name of the command.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon S3 location of the command script.

        @[JSON::Field(key: "ScriptPath")]
        getter script_path : String?

        def initialize(
          @args : Array(String)? = nil,
          @name : String? = nil,
          @script_path : String? = nil
        )
        end
      end

      # The Amazon EC2 unit limits for a managed scaling policy. The managed scaling activity of a cluster
      # can not be above or below these limits. The limit only applies to the core and task nodes. The
      # master node cannot be scaled after initial configuration.

      struct ComputeLimits
        include JSON::Serializable

        # The upper boundary of Amazon EC2 units. It is measured through vCPU cores or instances for instance
        # groups and measured through units for instance fleets. Managed scaling activities are not allowed
        # beyond this boundary. The limit only applies to the core and task nodes. The master node cannot be
        # scaled after initial configuration.

        @[JSON::Field(key: "MaximumCapacityUnits")]
        getter maximum_capacity_units : Int32

        # The lower boundary of Amazon EC2 units. It is measured through vCPU cores or instances for instance
        # groups and measured through units for instance fleets. Managed scaling activities are not allowed
        # beyond this boundary. The limit only applies to the core and task nodes. The master node cannot be
        # scaled after initial configuration.

        @[JSON::Field(key: "MinimumCapacityUnits")]
        getter minimum_capacity_units : Int32

        # The unit type used for specifying a managed scaling policy.

        @[JSON::Field(key: "UnitType")]
        getter unit_type : String

        # The upper boundary of Amazon EC2 units for core node type in a cluster. It is measured through vCPU
        # cores or instances for instance groups and measured through units for instance fleets. The core
        # units are not allowed to scale beyond this boundary. The parameter is used to split capacity
        # allocation between core and task nodes.

        @[JSON::Field(key: "MaximumCoreCapacityUnits")]
        getter maximum_core_capacity_units : Int32?

        # The upper boundary of On-Demand Amazon EC2 units. It is measured through vCPU cores or instances for
        # instance groups and measured through units for instance fleets. The On-Demand units are not allowed
        # to scale beyond this boundary. The parameter is used to split capacity allocation between On-Demand
        # and Spot Instances.

        @[JSON::Field(key: "MaximumOnDemandCapacityUnits")]
        getter maximum_on_demand_capacity_units : Int32?

        def initialize(
          @maximum_capacity_units : Int32,
          @minimum_capacity_units : Int32,
          @unit_type : String,
          @maximum_core_capacity_units : Int32? = nil,
          @maximum_on_demand_capacity_units : Int32? = nil
        )
        end
      end

      # Amazon EMR releases 4.x or later. An optional configuration specification to be used when
      # provisioning cluster instances, which can include configurations for applications and software
      # bundled with Amazon EMR. A configuration consists of a classification, properties, and optional
      # nested configurations. A classification refers to an application-specific configuration file.
      # Properties are the settings you want to change in that file. For more information, see Configuring
      # Applications .

      struct Configuration
        include JSON::Serializable

        # The classification within a configuration.

        @[JSON::Field(key: "Classification")]
        getter classification : String?

        # A list of additional configurations to apply within a configuration object.

        @[JSON::Field(key: "Configurations")]
        getter configurations : Array(Types::Configuration)?

        # A set of properties specified within a configuration classification.

        @[JSON::Field(key: "Properties")]
        getter properties : Hash(String, String)?

        def initialize(
          @classification : String? = nil,
          @configurations : Array(Types::Configuration)? = nil,
          @properties : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePersistentAppUIInput
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) of the target resource.

        @[JSON::Field(key: "TargetResourceArn")]
        getter target_resource_arn : String

        # The EMR containers configuration.

        @[JSON::Field(key: "EMRContainersConfig")]
        getter emr_containers_config : Types::EMRContainersConfig?

        # The profiler type for the persistent application user interface.

        @[JSON::Field(key: "ProfilerType")]
        getter profiler_type : String?

        # Tags for the persistent application user interface.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The cross reference for the persistent application user interface.

        @[JSON::Field(key: "XReferer")]
        getter x_referer : String?

        def initialize(
          @target_resource_arn : String,
          @emr_containers_config : Types::EMRContainersConfig? = nil,
          @profiler_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @x_referer : String? = nil
        )
        end
      end


      struct CreatePersistentAppUIOutput
        include JSON::Serializable

        # The persistent application user interface identifier.

        @[JSON::Field(key: "PersistentAppUIId")]
        getter persistent_app_ui_id : String?

        # Represents if the EMR on EC2 cluster that the persisent application user interface is created for is
        # a runtime role enabled cluster or not.

        @[JSON::Field(key: "RuntimeRoleEnabledCluster")]
        getter runtime_role_enabled_cluster : Bool?

        def initialize(
          @persistent_app_ui_id : String? = nil,
          @runtime_role_enabled_cluster : Bool? = nil
        )
        end
      end


      struct CreateSecurityConfigurationInput
        include JSON::Serializable

        # The name of the security configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The security configuration details in JSON format. For JSON parameters and examples, see Use
        # Security Configurations to Set Up Cluster Security in the Amazon EMR Management Guide .

        @[JSON::Field(key: "SecurityConfiguration")]
        getter security_configuration : String

        def initialize(
          @name : String,
          @security_configuration : String
        )
        end
      end


      struct CreateSecurityConfigurationOutput
        include JSON::Serializable

        # The date and time the security configuration was created.

        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time

        # The name of the security configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @creation_date_time : Time,
          @name : String
        )
        end
      end


      struct CreateStudioInput
        include JSON::Serializable

        # Specifies whether the Studio authenticates users using IAM or IAM Identity Center.

        @[JSON::Field(key: "AuthMode")]
        getter auth_mode : String

        # The Amazon S3 location to back up Amazon EMR Studio Workspaces and notebook files.

        @[JSON::Field(key: "DefaultS3Location")]
        getter default_s3_location : String

        # The ID of the Amazon EMR Studio Engine security group. The Engine security group allows inbound
        # network traffic from the Workspace security group, and it must be in the same VPC specified by VpcId
        # .

        @[JSON::Field(key: "EngineSecurityGroupId")]
        getter engine_security_group_id : String

        # A descriptive name for the Amazon EMR Studio.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The IAM role that the Amazon EMR Studio assumes. The service role provides a way for Amazon EMR
        # Studio to interoperate with other Amazon Web Services services.

        @[JSON::Field(key: "ServiceRole")]
        getter service_role : String

        # A list of subnet IDs to associate with the Amazon EMR Studio. A Studio can have a maximum of 5
        # subnets. The subnets must belong to the VPC specified by VpcId . Studio users can create a Workspace
        # in any of the specified subnets.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # The ID of the Amazon Virtual Private Cloud (Amazon VPC) to associate with the Studio.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String

        # The ID of the Amazon EMR Studio Workspace security group. The Workspace security group allows
        # outbound network traffic to resources in the Engine security group, and it must be in the same VPC
        # specified by VpcId .

        @[JSON::Field(key: "WorkspaceSecurityGroupId")]
        getter workspace_security_group_id : String

        # A detailed description of the Amazon EMR Studio.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The KMS key identifier (ARN) used to encrypt Amazon EMR Studio workspace and notebook files when
        # backed up to Amazon S3.

        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The ARN of the IAM Identity Center instance to create the Studio application.

        @[JSON::Field(key: "IdcInstanceArn")]
        getter idc_instance_arn : String?

        # Specifies whether IAM Identity Center user assignment is REQUIRED or OPTIONAL . If the value is set
        # to REQUIRED , users must be explicitly assigned to the Studio application to access the Studio.

        @[JSON::Field(key: "IdcUserAssignment")]
        getter idc_user_assignment : String?

        # The authentication endpoint of your identity provider (IdP). Specify this value when you use IAM
        # authentication and want to let federated users log in to a Studio with the Studio URL and
        # credentials from your IdP. Amazon EMR Studio redirects users to this endpoint to enter credentials.

        @[JSON::Field(key: "IdpAuthUrl")]
        getter idp_auth_url : String?

        # The name that your identity provider (IdP) uses for its RelayState parameter. For example,
        # RelayState or TargetSource . Specify this value when you use IAM authentication and want to let
        # federated users log in to a Studio using the Studio URL. The RelayState parameter differs by IdP.

        @[JSON::Field(key: "IdpRelayStateParameterName")]
        getter idp_relay_state_parameter_name : String?

        # A list of tags to associate with the Amazon EMR Studio. Tags are user-defined key-value pairs that
        # consist of a required key string with a maximum of 128 characters, and an optional value string with
        # a maximum of 256 characters.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A Boolean indicating whether to enable Trusted identity propagation for the Studio. The default
        # value is false .

        @[JSON::Field(key: "TrustedIdentityPropagationEnabled")]
        getter trusted_identity_propagation_enabled : Bool?

        # The IAM user role that users and groups assume when logged in to an Amazon EMR Studio. Only specify
        # a UserRole when you use IAM Identity Center authentication. The permissions attached to the UserRole
        # can be scoped down for each user or group using session policies.

        @[JSON::Field(key: "UserRole")]
        getter user_role : String?

        def initialize(
          @auth_mode : String,
          @default_s3_location : String,
          @engine_security_group_id : String,
          @name : String,
          @service_role : String,
          @subnet_ids : Array(String),
          @vpc_id : String,
          @workspace_security_group_id : String,
          @description : String? = nil,
          @encryption_key_arn : String? = nil,
          @idc_instance_arn : String? = nil,
          @idc_user_assignment : String? = nil,
          @idp_auth_url : String? = nil,
          @idp_relay_state_parameter_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @trusted_identity_propagation_enabled : Bool? = nil,
          @user_role : String? = nil
        )
        end
      end


      struct CreateStudioOutput
        include JSON::Serializable

        # The ID of the Amazon EMR Studio.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String?

        # The unique Studio access URL.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @studio_id : String? = nil,
          @url : String? = nil
        )
        end
      end


      struct CreateStudioSessionMappingInput
        include JSON::Serializable

        # Specifies whether the identity to map to the Amazon EMR Studio is a user or a group.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String

        # The Amazon Resource Name (ARN) for the session policy that will be applied to the user or group. You
        # should specify the ARN for the session policy that you want to apply, not the ARN of your user role.
        # For more information, see Create an Amazon EMR Studio User Role with Session Policies .

        @[JSON::Field(key: "SessionPolicyArn")]
        getter session_policy_arn : String

        # The ID of the Amazon EMR Studio to which the user or group will be mapped.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String

        # The globally unique identifier (GUID) of the user or group from the IAM Identity Center Identity
        # Store. For more information, see UserId and GroupId in the IAM Identity Center Identity Store API
        # Reference . Either IdentityName or IdentityId must be specified, but not both.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # The name of the user or group. For more information, see UserName and DisplayName in the IAM
        # Identity Center Identity Store API Reference . Either IdentityName or IdentityId must be specified,
        # but not both.

        @[JSON::Field(key: "IdentityName")]
        getter identity_name : String?

        def initialize(
          @identity_type : String,
          @session_policy_arn : String,
          @studio_id : String,
          @identity_id : String? = nil,
          @identity_name : String? = nil
        )
        end
      end

      # The credentials that you can use to connect to cluster endpoints. Credentials consist of a username
      # and a password.

      struct Credentials
        include JSON::Serializable

        # The username and password that you use to connect to cluster endpoints.

        @[JSON::Field(key: "UsernamePassword")]
        getter username_password : Types::UsernamePassword?

        def initialize(
          @username_password : Types::UsernamePassword? = nil
        )
        end
      end


      struct DeleteSecurityConfigurationInput
        include JSON::Serializable

        # The name of the security configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteSecurityConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteStudioInput
        include JSON::Serializable

        # The ID of the Amazon EMR Studio.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String

        def initialize(
          @studio_id : String
        )
        end
      end


      struct DeleteStudioSessionMappingInput
        include JSON::Serializable

        # Specifies whether the identity to delete from the Amazon EMR Studio is a user or a group.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String

        # The ID of the Amazon EMR Studio.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String

        # The globally unique identifier (GUID) of the user or group to remove from the Amazon EMR Studio. For
        # more information, see UserId and GroupId in the IAM Identity Center Identity Store API Reference .
        # Either IdentityName or IdentityId must be specified.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # The name of the user name or group to remove from the Amazon EMR Studio. For more information, see
        # UserName and DisplayName in the IAM Identity Center Store API Reference . Either IdentityName or
        # IdentityId must be specified.

        @[JSON::Field(key: "IdentityName")]
        getter identity_name : String?

        def initialize(
          @identity_type : String,
          @studio_id : String,
          @identity_id : String? = nil,
          @identity_name : String? = nil
        )
        end
      end

      # This input determines which cluster to describe.

      struct DescribeClusterInput
        include JSON::Serializable

        # The identifier of the cluster to describe.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        def initialize(
          @cluster_id : String
        )
        end
      end

      # This output contains the description of the cluster.

      struct DescribeClusterOutput
        include JSON::Serializable

        # This output contains the details for the requested cluster.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # The input for the DescribeJobFlows operation.

      struct DescribeJobFlowsInput
        include JSON::Serializable

        # Return only job flows created after this date and time.

        @[JSON::Field(key: "CreatedAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_after : Time?

        # Return only job flows created before this date and time.

        @[JSON::Field(key: "CreatedBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_before : Time?

        # Return only job flows whose job flow ID is contained in this list.

        @[JSON::Field(key: "JobFlowIds")]
        getter job_flow_ids : Array(String)?

        # Return only job flows whose state is contained in this list.

        @[JSON::Field(key: "JobFlowStates")]
        getter job_flow_states : Array(String)?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @job_flow_ids : Array(String)? = nil,
          @job_flow_states : Array(String)? = nil
        )
        end
      end

      # The output for the DescribeJobFlows operation.

      struct DescribeJobFlowsOutput
        include JSON::Serializable

        # A list of job flows matching the parameters supplied.

        @[JSON::Field(key: "JobFlows")]
        getter job_flows : Array(Types::JobFlowDetail)?

        def initialize(
          @job_flows : Array(Types::JobFlowDetail)? = nil
        )
        end
      end


      struct DescribeNotebookExecutionInput
        include JSON::Serializable

        # The unique identifier of the notebook execution.

        @[JSON::Field(key: "NotebookExecutionId")]
        getter notebook_execution_id : String

        def initialize(
          @notebook_execution_id : String
        )
        end
      end


      struct DescribeNotebookExecutionOutput
        include JSON::Serializable

        # Properties of the notebook execution.

        @[JSON::Field(key: "NotebookExecution")]
        getter notebook_execution : Types::NotebookExecution?

        def initialize(
          @notebook_execution : Types::NotebookExecution? = nil
        )
        end
      end


      struct DescribePersistentAppUIInput
        include JSON::Serializable

        # The identifier for the persistent application user interface.

        @[JSON::Field(key: "PersistentAppUIId")]
        getter persistent_app_ui_id : String

        def initialize(
          @persistent_app_ui_id : String
        )
        end
      end


      struct DescribePersistentAppUIOutput
        include JSON::Serializable

        # The persistent application user interface.

        @[JSON::Field(key: "PersistentAppUI")]
        getter persistent_app_ui : Types::PersistentAppUI?

        def initialize(
          @persistent_app_ui : Types::PersistentAppUI? = nil
        )
        end
      end


      struct DescribeReleaseLabelInput
        include JSON::Serializable

        # Reserved for future use. Currently set to null.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token. Reserved for future use. Currently set to null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The target release label to be described.

        @[JSON::Field(key: "ReleaseLabel")]
        getter release_label : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @release_label : String? = nil
        )
        end
      end


      struct DescribeReleaseLabelOutput
        include JSON::Serializable

        # The list of applications available for the target release label. Name is the name of the
        # application. Version is the concise version of the application.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(Types::SimplifiedApplication)?

        # The list of available Amazon Linux release versions for an Amazon EMR release. Contains a Label
        # field that is formatted as shown in Amazon Linux 2 Release Notes . For example, 2.0.20220218.1 .

        @[JSON::Field(key: "AvailableOSReleases")]
        getter available_os_releases : Array(Types::OSRelease)?

        # The pagination token. Reserved for future use. Currently set to null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The target release label described in the response.

        @[JSON::Field(key: "ReleaseLabel")]
        getter release_label : String?

        def initialize(
          @applications : Array(Types::SimplifiedApplication)? = nil,
          @available_os_releases : Array(Types::OSRelease)? = nil,
          @next_token : String? = nil,
          @release_label : String? = nil
        )
        end
      end


      struct DescribeSecurityConfigurationInput
        include JSON::Serializable

        # The name of the security configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DescribeSecurityConfigurationOutput
        include JSON::Serializable

        # The date and time the security configuration was created

        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The name of the security configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The security configuration details in JSON format.

        @[JSON::Field(key: "SecurityConfiguration")]
        getter security_configuration : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @name : String? = nil,
          @security_configuration : String? = nil
        )
        end
      end

      # This input determines which step to describe.

      struct DescribeStepInput
        include JSON::Serializable

        # The identifier of the cluster with steps to describe.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The identifier of the step to describe.

        @[JSON::Field(key: "StepId")]
        getter step_id : String

        def initialize(
          @cluster_id : String,
          @step_id : String
        )
        end
      end

      # This output contains the description of the cluster step.

      struct DescribeStepOutput
        include JSON::Serializable

        # The step details for the requested step identifier.

        @[JSON::Field(key: "Step")]
        getter step : Types::Step?

        def initialize(
          @step : Types::Step? = nil
        )
        end
      end


      struct DescribeStudioInput
        include JSON::Serializable

        # The Amazon EMR Studio ID.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String

        def initialize(
          @studio_id : String
        )
        end
      end


      struct DescribeStudioOutput
        include JSON::Serializable

        # The Amazon EMR Studio details.

        @[JSON::Field(key: "Studio")]
        getter studio : Types::Studio?

        def initialize(
          @studio : Types::Studio? = nil
        )
        end
      end

      # The EMR container configuration.

      struct EMRContainersConfig
        include JSON::Serializable

        # The Job run ID for the container configuration.

        @[JSON::Field(key: "JobRunId")]
        getter job_run_id : String?

        def initialize(
          @job_run_id : String? = nil
        )
        end
      end

      # Configuration of requested EBS block device associated with the instance group.

      struct EbsBlockDevice
        include JSON::Serializable

        # The device name that is exposed to the instance, such as /dev/sdh.

        @[JSON::Field(key: "Device")]
        getter device : String?

        # EBS volume specifications such as volume type, IOPS, size (GiB) and throughput (MiB/s) that are
        # requested for the EBS volume attached to an Amazon EC2 instance in the cluster.

        @[JSON::Field(key: "VolumeSpecification")]
        getter volume_specification : Types::VolumeSpecification?

        def initialize(
          @device : String? = nil,
          @volume_specification : Types::VolumeSpecification? = nil
        )
        end
      end

      # Configuration of requested EBS block device associated with the instance group with count of volumes
      # that are associated to every instance.

      struct EbsBlockDeviceConfig
        include JSON::Serializable

        # EBS volume specifications such as volume type, IOPS, size (GiB) and throughput (MiB/s) that are
        # requested for the EBS volume attached to an Amazon EC2 instance in the cluster.

        @[JSON::Field(key: "VolumeSpecification")]
        getter volume_specification : Types::VolumeSpecification

        # Number of EBS volumes with a specific volume configuration that are associated with every instance
        # in the instance group

        @[JSON::Field(key: "VolumesPerInstance")]
        getter volumes_per_instance : Int32?

        def initialize(
          @volume_specification : Types::VolumeSpecification,
          @volumes_per_instance : Int32? = nil
        )
        end
      end

      # The Amazon EBS configuration of a cluster instance.

      struct EbsConfiguration
        include JSON::Serializable

        # An array of Amazon EBS volume specifications attached to a cluster instance.

        @[JSON::Field(key: "EbsBlockDeviceConfigs")]
        getter ebs_block_device_configs : Array(Types::EbsBlockDeviceConfig)?

        # Indicates whether an Amazon EBS volume is EBS-optimized. The default is false. You should explicitly
        # set this value to true to enable the Amazon EBS-optimized setting for an EC2 instance.

        @[JSON::Field(key: "EbsOptimized")]
        getter ebs_optimized : Bool?

        def initialize(
          @ebs_block_device_configs : Array(Types::EbsBlockDeviceConfig)? = nil,
          @ebs_optimized : Bool? = nil
        )
        end
      end

      # EBS block device that's attached to an Amazon EC2 instance.

      struct EbsVolume
        include JSON::Serializable

        # The device name that is exposed to the instance, such as /dev/sdh.

        @[JSON::Field(key: "Device")]
        getter device : String?

        # The volume identifier of the EBS volume.

        @[JSON::Field(key: "VolumeId")]
        getter volume_id : String?

        def initialize(
          @device : String? = nil,
          @volume_id : String? = nil
        )
        end
      end

      # Provides information about the Amazon EC2 instances in a cluster grouped by category. For example,
      # key name, subnet ID, IAM instance profile, and so on.

      struct Ec2InstanceAttributes
        include JSON::Serializable

        # A list of additional Amazon EC2 security group IDs for the master node.

        @[JSON::Field(key: "AdditionalMasterSecurityGroups")]
        getter additional_master_security_groups : Array(String)?

        # A list of additional Amazon EC2 security group IDs for the core and task nodes.

        @[JSON::Field(key: "AdditionalSlaveSecurityGroups")]
        getter additional_slave_security_groups : Array(String)?

        # The Availability Zone in which the cluster will run.

        @[JSON::Field(key: "Ec2AvailabilityZone")]
        getter ec2_availability_zone : String?

        # The name of the Amazon EC2 key pair to use when connecting with SSH into the master node as a user
        # named "hadoop".

        @[JSON::Field(key: "Ec2KeyName")]
        getter ec2_key_name : String?

        # Set this parameter to the identifier of the Amazon VPC subnet where you want the cluster to launch.
        # If you do not specify this value, and your account supports EC2-Classic, the cluster launches in
        # EC2-Classic.

        @[JSON::Field(key: "Ec2SubnetId")]
        getter ec2_subnet_id : String?

        # The identifier of the Amazon EC2 security group for the master node.

        @[JSON::Field(key: "EmrManagedMasterSecurityGroup")]
        getter emr_managed_master_security_group : String?

        # The identifier of the Amazon EC2 security group for the core and task nodes.

        @[JSON::Field(key: "EmrManagedSlaveSecurityGroup")]
        getter emr_managed_slave_security_group : String?

        # The IAM role that was specified when the cluster was launched. The Amazon EC2 instances of the
        # cluster assume this role.

        @[JSON::Field(key: "IamInstanceProfile")]
        getter iam_instance_profile : String?

        # Applies to clusters configured with the instance fleets option. Specifies one or more Availability
        # Zones in which to launch Amazon EC2 cluster instances when the EC2-Classic network configuration is
        # supported. Amazon EMR chooses the Availability Zone with the best fit from among the list of
        # RequestedEc2AvailabilityZones , and then launches all cluster instances within that Availability
        # Zone. If you do not specify this value, Amazon EMR chooses the Availability Zone for you.
        # RequestedEc2SubnetIDs and RequestedEc2AvailabilityZones cannot be specified together.

        @[JSON::Field(key: "RequestedEc2AvailabilityZones")]
        getter requested_ec2_availability_zones : Array(String)?

        # Applies to clusters configured with the instance fleets option. Specifies the unique identifier of
        # one or more Amazon EC2 subnets in which to launch Amazon EC2 cluster instances. Subnets must exist
        # within the same VPC. Amazon EMR chooses the Amazon EC2 subnet with the best fit from among the list
        # of RequestedEc2SubnetIds , and then launches all cluster instances within that Subnet. If this value
        # is not specified, and the account and Region support EC2-Classic networks, the cluster launches
        # instances in the EC2-Classic network and uses RequestedEc2AvailabilityZones instead of this setting.
        # If EC2-Classic is not supported, and no Subnet is specified, Amazon EMR chooses the subnet for you.
        # RequestedEc2SubnetIDs and RequestedEc2AvailabilityZones cannot be specified together.

        @[JSON::Field(key: "RequestedEc2SubnetIds")]
        getter requested_ec2_subnet_ids : Array(String)?

        # The identifier of the Amazon EC2 security group for the Amazon EMR service to access clusters in VPC
        # private subnets.

        @[JSON::Field(key: "ServiceAccessSecurityGroup")]
        getter service_access_security_group : String?

        def initialize(
          @additional_master_security_groups : Array(String)? = nil,
          @additional_slave_security_groups : Array(String)? = nil,
          @ec2_availability_zone : String? = nil,
          @ec2_key_name : String? = nil,
          @ec2_subnet_id : String? = nil,
          @emr_managed_master_security_group : String? = nil,
          @emr_managed_slave_security_group : String? = nil,
          @iam_instance_profile : String? = nil,
          @requested_ec2_availability_zones : Array(String)? = nil,
          @requested_ec2_subnet_ids : Array(String)? = nil,
          @service_access_security_group : String? = nil
        )
        end
      end

      # A tuple that provides information about an error that caused a cluster to terminate.

      struct ErrorDetail
        include JSON::Serializable

        # The name or code associated with the error.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A list of key value pairs that provides contextual information about why an error occured.

        @[JSON::Field(key: "ErrorData")]
        getter error_data : Array(Hash(String, String))?

        # A message that describes the error.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_data : Array(Hash(String, String))? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Specifies the execution engine (cluster) to run the notebook and perform the notebook execution, for
      # example, an Amazon EMR cluster.

      struct ExecutionEngineConfig
        include JSON::Serializable

        # The unique identifier of the execution engine. For an Amazon EMR cluster, this is the cluster ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The execution role ARN required for the notebook execution.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # An optional unique ID of an Amazon EC2 security group to associate with the master instance of the
        # Amazon EMR cluster for this notebook execution. For more information see Specifying Amazon EC2
        # Security Groups for Amazon EMR Notebooks in the EMR Management Guide .

        @[JSON::Field(key: "MasterInstanceSecurityGroupId")]
        getter master_instance_security_group_id : String?

        # The type of execution engine. A value of EMR specifies an Amazon EMR cluster.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @id : String,
          @execution_role_arn : String? = nil,
          @master_instance_security_group_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The details of the step failure. The service attempts to detect the root cause for many common
      # failures.

      struct FailureDetails
        include JSON::Serializable

        # The path to the log file where the step failure root cause was originally recorded.

        @[JSON::Field(key: "LogFile")]
        getter log_file : String?

        # The descriptive message including the error the Amazon EMR service has identified as the cause of
        # step failure. This is text from an error log that describes the root cause of the failure.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the step failure. In the case where the service cannot successfully determine the
        # root cause of the failure, it returns "Unknown Error" as a reason.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @log_file : String? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct GetAutoTerminationPolicyInput
        include JSON::Serializable

        # Specifies the ID of the Amazon EMR cluster for which the auto-termination policy will be fetched.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        def initialize(
          @cluster_id : String
        )
        end
      end


      struct GetAutoTerminationPolicyOutput
        include JSON::Serializable

        # Specifies the auto-termination policy that is attached to an Amazon EMR cluster.

        @[JSON::Field(key: "AutoTerminationPolicy")]
        getter auto_termination_policy : Types::AutoTerminationPolicy?

        def initialize(
          @auto_termination_policy : Types::AutoTerminationPolicy? = nil
        )
        end
      end


      struct GetBlockPublicAccessConfigurationInput
        include JSON::Serializable

        def initialize
        end
      end


      struct GetBlockPublicAccessConfigurationOutput
        include JSON::Serializable

        # A configuration for Amazon EMR block public access. The configuration applies to all clusters
        # created in your account for the current Region. The configuration specifies whether block public
        # access is enabled. If block public access is enabled, security groups associated with the cluster
        # cannot have rules that allow inbound traffic from 0.0.0.0/0 or ::/0 on a port, unless the port is
        # specified as an exception using PermittedPublicSecurityGroupRuleRanges in the
        # BlockPublicAccessConfiguration . By default, Port 22 (SSH) is an exception, and public access is
        # allowed on this port. You can change this by updating the block public access configuration to
        # remove the exception. For accounts that created clusters in a Region before November 25, 2019, block
        # public access is disabled by default in that Region. To use this feature, you must manually enable
        # and configure it. For accounts that did not create an Amazon EMR cluster in a Region before this
        # date, block public access is enabled by default in that Region.

        @[JSON::Field(key: "BlockPublicAccessConfiguration")]
        getter block_public_access_configuration : Types::BlockPublicAccessConfiguration

        # Properties that describe the Amazon Web Services principal that created the
        # BlockPublicAccessConfiguration using the PutBlockPublicAccessConfiguration action as well as the
        # date and time that the configuration was created. Each time a configuration for block public access
        # is updated, Amazon EMR updates this metadata.

        @[JSON::Field(key: "BlockPublicAccessConfigurationMetadata")]
        getter block_public_access_configuration_metadata : Types::BlockPublicAccessConfigurationMetadata

        def initialize(
          @block_public_access_configuration : Types::BlockPublicAccessConfiguration,
          @block_public_access_configuration_metadata : Types::BlockPublicAccessConfigurationMetadata
        )
        end
      end


      struct GetClusterSessionCredentialsInput
        include JSON::Serializable

        # The unique identifier of the cluster.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The Amazon Resource Name (ARN) of the runtime role for interactive workload submission on the
        # cluster. The runtime role can be a cross-account IAM role. The runtime role ARN is a combination of
        # account ID, role name, and role type using the following format:
        # arn:partition:service:region:account:resource .

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        def initialize(
          @cluster_id : String,
          @execution_role_arn : String? = nil
        )
        end
      end


      struct GetClusterSessionCredentialsOutput
        include JSON::Serializable

        # The credentials that you can use to connect to cluster endpoints that support username and password
        # authentication.

        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::Credentials?

        # The time when the credentials that are returned by the GetClusterSessionCredentials API expire.

        @[JSON::Field(key: "ExpiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        def initialize(
          @credentials : Types::Credentials? = nil,
          @expires_at : Time? = nil
        )
        end
      end


      struct GetManagedScalingPolicyInput
        include JSON::Serializable

        # Specifies the ID of the cluster for which the managed scaling policy will be fetched.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        def initialize(
          @cluster_id : String
        )
        end
      end


      struct GetManagedScalingPolicyOutput
        include JSON::Serializable

        # Specifies the managed scaling policy that is attached to an Amazon EMR cluster.

        @[JSON::Field(key: "ManagedScalingPolicy")]
        getter managed_scaling_policy : Types::ManagedScalingPolicy?

        def initialize(
          @managed_scaling_policy : Types::ManagedScalingPolicy? = nil
        )
        end
      end


      struct GetOnClusterAppUIPresignedURLInput
        include JSON::Serializable

        # The cluster ID associated with the cluster's application user interface presigned URL.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The application ID associated with the cluster's application user interface presigned URL.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # Determines if the user interface presigned URL is for a dry run.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # The execution role ARN associated with the cluster's application user interface presigned URL.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # The application UI type associated with the cluster's application user interface presigned URL.

        @[JSON::Field(key: "OnClusterAppUIType")]
        getter on_cluster_app_ui_type : String?

        def initialize(
          @cluster_id : String,
          @application_id : String? = nil,
          @dry_run : Bool? = nil,
          @execution_role_arn : String? = nil,
          @on_cluster_app_ui_type : String? = nil
        )
        end
      end


      struct GetOnClusterAppUIPresignedURLOutput
        include JSON::Serializable

        # The cluster's generated presigned URL.

        @[JSON::Field(key: "PresignedURL")]
        getter presigned_url : String?

        # Used to determine if the presigned URL is ready.

        @[JSON::Field(key: "PresignedURLReady")]
        getter presigned_url_ready : Bool?

        def initialize(
          @presigned_url : String? = nil,
          @presigned_url_ready : Bool? = nil
        )
        end
      end


      struct GetPersistentAppUIPresignedURLInput
        include JSON::Serializable

        # The persistent application user interface ID associated with the presigned URL.

        @[JSON::Field(key: "PersistentAppUIId")]
        getter persistent_app_ui_id : String

        # The application ID associated with the presigned URL.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # A boolean that represents if the caller is an authentication proxy call.

        @[JSON::Field(key: "AuthProxyCall")]
        getter auth_proxy_call : Bool?

        # The execution role ARN associated with the presigned URL.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # The persistent application user interface type associated with the presigned URL.

        @[JSON::Field(key: "PersistentAppUIType")]
        getter persistent_app_ui_type : String?

        def initialize(
          @persistent_app_ui_id : String,
          @application_id : String? = nil,
          @auth_proxy_call : Bool? = nil,
          @execution_role_arn : String? = nil,
          @persistent_app_ui_type : String? = nil
        )
        end
      end


      struct GetPersistentAppUIPresignedURLOutput
        include JSON::Serializable

        # The returned presigned URL.

        @[JSON::Field(key: "PresignedURL")]
        getter presigned_url : String?

        # Used to determine if the presigned URL is ready.

        @[JSON::Field(key: "PresignedURLReady")]
        getter presigned_url_ready : Bool?

        def initialize(
          @presigned_url : String? = nil,
          @presigned_url_ready : Bool? = nil
        )
        end
      end


      struct GetStudioSessionMappingInput
        include JSON::Serializable

        # Specifies whether the identity to fetch is a user or a group.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String

        # The ID of the Amazon EMR Studio.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String

        # The globally unique identifier (GUID) of the user or group. For more information, see UserId and
        # GroupId in the IAM Identity Center Identity Store API Reference . Either IdentityName or IdentityId
        # must be specified.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # The name of the user or group to fetch. For more information, see UserName and DisplayName in the
        # IAM Identity Center Identity Store API Reference . Either IdentityName or IdentityId must be
        # specified.

        @[JSON::Field(key: "IdentityName")]
        getter identity_name : String?

        def initialize(
          @identity_type : String,
          @studio_id : String,
          @identity_id : String? = nil,
          @identity_name : String? = nil
        )
        end
      end


      struct GetStudioSessionMappingOutput
        include JSON::Serializable

        # The session mapping details for the specified Amazon EMR Studio and identity, including session
        # policy ARN and creation time.

        @[JSON::Field(key: "SessionMapping")]
        getter session_mapping : Types::SessionMappingDetail?

        def initialize(
          @session_mapping : Types::SessionMappingDetail? = nil
        )
        end
      end

      # A job flow step consisting of a JAR file whose main function will be executed. The main function
      # submits a job for Hadoop to execute and waits for the job to finish or fail.

      struct HadoopJarStepConfig
        include JSON::Serializable

        # A path to a JAR file run during the step.

        @[JSON::Field(key: "Jar")]
        getter jar : String

        # A list of command line arguments passed to the JAR file's main function when executed.

        @[JSON::Field(key: "Args")]
        getter args : Array(String)?

        # The name of the main class in the specified Java file. If not specified, the JAR file should specify
        # a Main-Class in its manifest file.

        @[JSON::Field(key: "MainClass")]
        getter main_class : String?

        # A list of Java properties that are set when the step runs. You can use these properties to pass
        # key-value pairs to your main function.

        @[JSON::Field(key: "Properties")]
        getter properties : Array(Types::KeyValue)?

        def initialize(
          @jar : String,
          @args : Array(String)? = nil,
          @main_class : String? = nil,
          @properties : Array(Types::KeyValue)? = nil
        )
        end
      end

      # A cluster step consisting of a JAR file whose main function will be executed. The main function
      # submits a job for Hadoop to execute and waits for the job to finish or fail.

      struct HadoopStepConfig
        include JSON::Serializable

        # The list of command line arguments to pass to the JAR file's main function for execution.

        @[JSON::Field(key: "Args")]
        getter args : Array(String)?

        # The path to the JAR file that runs during the step.

        @[JSON::Field(key: "Jar")]
        getter jar : String?

        # The name of the main class in the specified Java file. If not specified, the JAR file should specify
        # a main class in its manifest file.

        @[JSON::Field(key: "MainClass")]
        getter main_class : String?

        # The list of Java properties that are set when the step runs. You can use these properties to pass
        # key-value pairs to your main function.

        @[JSON::Field(key: "Properties")]
        getter properties : Hash(String, String)?

        def initialize(
          @args : Array(String)? = nil,
          @jar : String? = nil,
          @main_class : String? = nil,
          @properties : Hash(String, String)? = nil
        )
        end
      end

      # Represents an Amazon EC2 instance provisioned as part of cluster.

      struct Instance
        include JSON::Serializable

        # The list of Amazon EBS volumes that are attached to this instance.

        @[JSON::Field(key: "EbsVolumes")]
        getter ebs_volumes : Array(Types::EbsVolume)?

        # The unique identifier of the instance in Amazon EC2.

        @[JSON::Field(key: "Ec2InstanceId")]
        getter ec2_instance_id : String?

        # The unique identifier for the instance in Amazon EMR.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The unique identifier of the instance fleet to which an Amazon EC2 instance belongs.

        @[JSON::Field(key: "InstanceFleetId")]
        getter instance_fleet_id : String?

        # The identifier of the instance group to which this instance belongs.

        @[JSON::Field(key: "InstanceGroupId")]
        getter instance_group_id : String?

        # The Amazon EC2 instance type, for example m3.xlarge .

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The instance purchasing option. Valid values are ON_DEMAND or SPOT .

        @[JSON::Field(key: "Market")]
        getter market : String?

        # The private DNS name of the instance.

        @[JSON::Field(key: "PrivateDnsName")]
        getter private_dns_name : String?

        # The private IP address of the instance.

        @[JSON::Field(key: "PrivateIpAddress")]
        getter private_ip_address : String?

        # The public DNS name of the instance.

        @[JSON::Field(key: "PublicDnsName")]
        getter public_dns_name : String?

        # The public IP address of the instance.

        @[JSON::Field(key: "PublicIpAddress")]
        getter public_ip_address : String?

        # The current status of the instance.

        @[JSON::Field(key: "Status")]
        getter status : Types::InstanceStatus?

        def initialize(
          @ebs_volumes : Array(Types::EbsVolume)? = nil,
          @ec2_instance_id : String? = nil,
          @id : String? = nil,
          @instance_fleet_id : String? = nil,
          @instance_group_id : String? = nil,
          @instance_type : String? = nil,
          @market : String? = nil,
          @private_dns_name : String? = nil,
          @private_ip_address : String? = nil,
          @public_dns_name : String? = nil,
          @public_ip_address : String? = nil,
          @status : Types::InstanceStatus? = nil
        )
        end
      end

      # Describes an instance fleet, which is a group of Amazon EC2 instances that host a particular node
      # type (master, core, or task) in an Amazon EMR cluster. Instance fleets can consist of a mix of
      # instance types and On-Demand and Spot Instances, which are provisioned to meet a defined target
      # capacity. The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later,
      # excluding 5.0.x versions.

      struct InstanceFleet
        include JSON::Serializable

        # Reserved.

        @[JSON::Field(key: "Context")]
        getter context : String?

        # The unique identifier of the instance fleet.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The node type that the instance fleet hosts. Valid values are MASTER, CORE, or TASK.

        @[JSON::Field(key: "InstanceFleetType")]
        getter instance_fleet_type : String?

        # An array of specifications for the instance types that comprise an instance fleet.

        @[JSON::Field(key: "InstanceTypeSpecifications")]
        getter instance_type_specifications : Array(Types::InstanceTypeSpecification)?

        # Describes the launch specification for an instance fleet.

        @[JSON::Field(key: "LaunchSpecifications")]
        getter launch_specifications : Types::InstanceFleetProvisioningSpecifications?

        # A friendly name for the instance fleet.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The number of On-Demand units that have been provisioned for the instance fleet to fulfill
        # TargetOnDemandCapacity . This provisioned capacity might be less than or greater than
        # TargetOnDemandCapacity .

        @[JSON::Field(key: "ProvisionedOnDemandCapacity")]
        getter provisioned_on_demand_capacity : Int32?

        # The number of Spot units that have been provisioned for this instance fleet to fulfill
        # TargetSpotCapacity . This provisioned capacity might be less than or greater than TargetSpotCapacity
        # .

        @[JSON::Field(key: "ProvisionedSpotCapacity")]
        getter provisioned_spot_capacity : Int32?

        # The resize specification for the instance fleet.

        @[JSON::Field(key: "ResizeSpecifications")]
        getter resize_specifications : Types::InstanceFleetResizingSpecifications?

        # The current status of the instance fleet.

        @[JSON::Field(key: "Status")]
        getter status : Types::InstanceFleetStatus?

        # The target capacity of On-Demand units for the instance fleet, which determines how many On-Demand
        # Instances to provision. When the instance fleet launches, Amazon EMR tries to provision On-Demand
        # Instances as specified by InstanceTypeConfig . Each instance configuration has a specified
        # WeightedCapacity . When an On-Demand Instance is provisioned, the WeightedCapacity units count
        # toward the target capacity. Amazon EMR provisions instances until the target capacity is totally
        # fulfilled, even if this results in an overage. For example, if there are 2 units remaining to
        # fulfill capacity, and Amazon EMR can only provision an instance with a WeightedCapacity of 5 units,
        # the instance is provisioned, and the target capacity is exceeded by 3 units. You can use
        # InstanceFleet$ProvisionedOnDemandCapacity to determine the Spot capacity units that have been
        # provisioned for the instance fleet. If not specified or set to 0, only Spot Instances are
        # provisioned for the instance fleet using TargetSpotCapacity . At least one of TargetSpotCapacity and
        # TargetOnDemandCapacity should be greater than 0. For a master instance fleet, only one of
        # TargetSpotCapacity and TargetOnDemandCapacity can be specified, and its value must be 1.

        @[JSON::Field(key: "TargetOnDemandCapacity")]
        getter target_on_demand_capacity : Int32?

        # The target capacity of Spot units for the instance fleet, which determines how many Spot Instances
        # to provision. When the instance fleet launches, Amazon EMR tries to provision Spot Instances as
        # specified by InstanceTypeConfig . Each instance configuration has a specified WeightedCapacity .
        # When a Spot instance is provisioned, the WeightedCapacity units count toward the target capacity.
        # Amazon EMR provisions instances until the target capacity is totally fulfilled, even if this results
        # in an overage. For example, if there are 2 units remaining to fulfill capacity, and Amazon EMR can
        # only provision an instance with a WeightedCapacity of 5 units, the instance is provisioned, and the
        # target capacity is exceeded by 3 units. You can use InstanceFleet$ProvisionedSpotCapacity to
        # determine the Spot capacity units that have been provisioned for the instance fleet. If not
        # specified or set to 0, only On-Demand Instances are provisioned for the instance fleet. At least one
        # of TargetSpotCapacity and TargetOnDemandCapacity should be greater than 0. For a master instance
        # fleet, only one of TargetSpotCapacity and TargetOnDemandCapacity can be specified, and its value
        # must be 1.

        @[JSON::Field(key: "TargetSpotCapacity")]
        getter target_spot_capacity : Int32?

        def initialize(
          @context : String? = nil,
          @id : String? = nil,
          @instance_fleet_type : String? = nil,
          @instance_type_specifications : Array(Types::InstanceTypeSpecification)? = nil,
          @launch_specifications : Types::InstanceFleetProvisioningSpecifications? = nil,
          @name : String? = nil,
          @provisioned_on_demand_capacity : Int32? = nil,
          @provisioned_spot_capacity : Int32? = nil,
          @resize_specifications : Types::InstanceFleetResizingSpecifications? = nil,
          @status : Types::InstanceFleetStatus? = nil,
          @target_on_demand_capacity : Int32? = nil,
          @target_spot_capacity : Int32? = nil
        )
        end
      end

      # The configuration that defines an instance fleet. The instance fleet configuration is available only
      # in Amazon EMR releases 4.8.0 and later, excluding 5.0.x versions.

      struct InstanceFleetConfig
        include JSON::Serializable

        # The node type that the instance fleet hosts. Valid values are MASTER, CORE, and TASK.

        @[JSON::Field(key: "InstanceFleetType")]
        getter instance_fleet_type : String

        # Reserved.

        @[JSON::Field(key: "Context")]
        getter context : String?

        # The instance type configurations that define the Amazon EC2 instances in the instance fleet.

        @[JSON::Field(key: "InstanceTypeConfigs")]
        getter instance_type_configs : Array(Types::InstanceTypeConfig)?

        # The launch specification for the instance fleet.

        @[JSON::Field(key: "LaunchSpecifications")]
        getter launch_specifications : Types::InstanceFleetProvisioningSpecifications?

        # The friendly name of the instance fleet.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The resize specification for the instance fleet.

        @[JSON::Field(key: "ResizeSpecifications")]
        getter resize_specifications : Types::InstanceFleetResizingSpecifications?

        # The target capacity of On-Demand units for the instance fleet, which determines how many On-Demand
        # Instances to provision. When the instance fleet launches, Amazon EMR tries to provision On-Demand
        # Instances as specified by InstanceTypeConfig . Each instance configuration has a specified
        # WeightedCapacity . When an On-Demand Instance is provisioned, the WeightedCapacity units count
        # toward the target capacity. Amazon EMR provisions instances until the target capacity is totally
        # fulfilled, even if this results in an overage. For example, if there are 2 units remaining to
        # fulfill capacity, and Amazon EMR can only provision an instance with a WeightedCapacity of 5 units,
        # the instance is provisioned, and the target capacity is exceeded by 3 units. If not specified or set
        # to 0, only Spot Instances are provisioned for the instance fleet using TargetSpotCapacity . At least
        # one of TargetSpotCapacity and TargetOnDemandCapacity should be greater than 0. For a master instance
        # fleet, only one of TargetSpotCapacity and TargetOnDemandCapacity can be specified, and its value
        # must be 1.

        @[JSON::Field(key: "TargetOnDemandCapacity")]
        getter target_on_demand_capacity : Int32?

        # The target capacity of Spot units for the instance fleet, which determines how many Spot Instances
        # to provision. When the instance fleet launches, Amazon EMR tries to provision Spot Instances as
        # specified by InstanceTypeConfig . Each instance configuration has a specified WeightedCapacity .
        # When a Spot Instance is provisioned, the WeightedCapacity units count toward the target capacity.
        # Amazon EMR provisions instances until the target capacity is totally fulfilled, even if this results
        # in an overage. For example, if there are 2 units remaining to fulfill capacity, and Amazon EMR can
        # only provision an instance with a WeightedCapacity of 5 units, the instance is provisioned, and the
        # target capacity is exceeded by 3 units. If not specified or set to 0, only On-Demand Instances are
        # provisioned for the instance fleet. At least one of TargetSpotCapacity and TargetOnDemandCapacity
        # should be greater than 0. For a master instance fleet, only one of TargetSpotCapacity and
        # TargetOnDemandCapacity can be specified, and its value must be 1.

        @[JSON::Field(key: "TargetSpotCapacity")]
        getter target_spot_capacity : Int32?

        def initialize(
          @instance_fleet_type : String,
          @context : String? = nil,
          @instance_type_configs : Array(Types::InstanceTypeConfig)? = nil,
          @launch_specifications : Types::InstanceFleetProvisioningSpecifications? = nil,
          @name : String? = nil,
          @resize_specifications : Types::InstanceFleetResizingSpecifications? = nil,
          @target_on_demand_capacity : Int32? = nil,
          @target_spot_capacity : Int32? = nil
        )
        end
      end

      # Configuration parameters for an instance fleet modification request. The instance fleet
      # configuration is available only in Amazon EMR releases 4.8.0 and later, excluding 5.0.x versions.

      struct InstanceFleetModifyConfig
        include JSON::Serializable

        # A unique identifier for the instance fleet.

        @[JSON::Field(key: "InstanceFleetId")]
        getter instance_fleet_id : String

        # Reserved.

        @[JSON::Field(key: "Context")]
        getter context : String?

        # An array of InstanceTypeConfig objects that specify how Amazon EMR provisions Amazon EC2 instances
        # when it fulfills On-Demand and Spot capacities. For more information, see InstanceTypeConfig .

        @[JSON::Field(key: "InstanceTypeConfigs")]
        getter instance_type_configs : Array(Types::InstanceTypeConfig)?

        # The resize specification for the instance fleet.

        @[JSON::Field(key: "ResizeSpecifications")]
        getter resize_specifications : Types::InstanceFleetResizingSpecifications?

        # The target capacity of On-Demand units for the instance fleet. For more information see
        # InstanceFleetConfig$TargetOnDemandCapacity .

        @[JSON::Field(key: "TargetOnDemandCapacity")]
        getter target_on_demand_capacity : Int32?

        # The target capacity of Spot units for the instance fleet. For more information, see
        # InstanceFleetConfig$TargetSpotCapacity .

        @[JSON::Field(key: "TargetSpotCapacity")]
        getter target_spot_capacity : Int32?

        def initialize(
          @instance_fleet_id : String,
          @context : String? = nil,
          @instance_type_configs : Array(Types::InstanceTypeConfig)? = nil,
          @resize_specifications : Types::InstanceFleetResizingSpecifications? = nil,
          @target_on_demand_capacity : Int32? = nil,
          @target_spot_capacity : Int32? = nil
        )
        end
      end

      # The launch specification for On-Demand and Spot Instances in the fleet. The instance fleet
      # configuration is available only in Amazon EMR releases 4.8.0 and later, excluding 5.0.x versions.
      # On-Demand and Spot instance allocation strategies are available in Amazon EMR releases 5.12.1 and
      # later.

      struct InstanceFleetProvisioningSpecifications
        include JSON::Serializable

        # The launch specification for On-Demand Instances in the instance fleet, which determines the
        # allocation strategy and capacity reservation options. The instance fleet configuration is available
        # only in Amazon EMR releases 4.8.0 and later, excluding 5.0.x versions. On-Demand Instances
        # allocation strategy is available in Amazon EMR releases 5.12.1 and later.

        @[JSON::Field(key: "OnDemandSpecification")]
        getter on_demand_specification : Types::OnDemandProvisioningSpecification?

        # The launch specification for Spot instances in the fleet, which determines the allocation strategy,
        # defined duration, and provisioning timeout behavior.

        @[JSON::Field(key: "SpotSpecification")]
        getter spot_specification : Types::SpotProvisioningSpecification?

        def initialize(
          @on_demand_specification : Types::OnDemandProvisioningSpecification? = nil,
          @spot_specification : Types::SpotProvisioningSpecification? = nil
        )
        end
      end

      # The resize specification for On-Demand and Spot Instances in the fleet.

      struct InstanceFleetResizingSpecifications
        include JSON::Serializable

        # The resize specification for On-Demand Instances in the instance fleet, which contains the
        # allocation strategy, capacity reservation options, and the resize timeout period.

        @[JSON::Field(key: "OnDemandResizeSpecification")]
        getter on_demand_resize_specification : Types::OnDemandResizingSpecification?

        # The resize specification for Spot Instances in the instance fleet, which contains the allocation
        # strategy and the resize timeout period.

        @[JSON::Field(key: "SpotResizeSpecification")]
        getter spot_resize_specification : Types::SpotResizingSpecification?

        def initialize(
          @on_demand_resize_specification : Types::OnDemandResizingSpecification? = nil,
          @spot_resize_specification : Types::SpotResizingSpecification? = nil
        )
        end
      end

      # Provides status change reason details for the instance fleet. The instance fleet configuration is
      # available only in Amazon EMR releases 4.8.0 and later, excluding 5.0.x versions.

      struct InstanceFleetStateChangeReason
        include JSON::Serializable

        # A code corresponding to the reason the state change occurred.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # An explanatory message.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The status of the instance fleet. The instance fleet configuration is available only in Amazon EMR
      # releases 4.8.0 and later, excluding 5.0.x versions.

      struct InstanceFleetStatus
        include JSON::Serializable

        # A code representing the instance fleet status. PROVISIONING —The instance fleet is provisioning
        # Amazon EC2 resources and is not yet ready to run jobs. BOOTSTRAPPING —Amazon EC2 instances and other
        # resources have been provisioned and the bootstrap actions specified for the instances are underway.
        # RUNNING —Amazon EC2 instances and other resources are running. They are either executing jobs or
        # waiting to execute jobs. RESIZING —A resize operation is underway. Amazon EC2 instances are either
        # being added or removed. SUSPENDED —A resize operation could not complete. Existing Amazon EC2
        # instances are running, but instances can't be added or removed. TERMINATING —The instance fleet is
        # terminating Amazon EC2 instances. TERMINATED —The instance fleet is no longer active, and all Amazon
        # EC2 instances have been terminated.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Provides status change reason details for the instance fleet.

        @[JSON::Field(key: "StateChangeReason")]
        getter state_change_reason : Types::InstanceFleetStateChangeReason?

        # Provides historical timestamps for the instance fleet, including the time of creation, the time it
        # became ready to run jobs, and the time of termination.

        @[JSON::Field(key: "Timeline")]
        getter timeline : Types::InstanceFleetTimeline?

        def initialize(
          @state : String? = nil,
          @state_change_reason : Types::InstanceFleetStateChangeReason? = nil,
          @timeline : Types::InstanceFleetTimeline? = nil
        )
        end
      end

      # Provides historical timestamps for the instance fleet, including the time of creation, the time it
      # became ready to run jobs, and the time of termination. The instance fleet configuration is available
      # only in Amazon EMR releases 4.8.0 and later, excluding 5.0.x versions.

      struct InstanceFleetTimeline
        include JSON::Serializable

        # The time and date the instance fleet was created.

        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The time and date the instance fleet terminated.

        @[JSON::Field(key: "EndDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date_time : Time?

        # The time and date the instance fleet was ready to run jobs.

        @[JSON::Field(key: "ReadyDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ready_date_time : Time?

        def initialize(
          @creation_date_time : Time? = nil,
          @end_date_time : Time? = nil,
          @ready_date_time : Time? = nil
        )
        end
      end

      # This entity represents an instance group, which is a group of instances that have common purpose.
      # For example, CORE instance group is used for HDFS.

      struct InstanceGroup
        include JSON::Serializable

        # An automatic scaling policy for a core instance group or task instance group in an Amazon EMR
        # cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates
        # Amazon EC2 instances in response to the value of a CloudWatch metric. See PutAutoScalingPolicy.

        @[JSON::Field(key: "AutoScalingPolicy")]
        getter auto_scaling_policy : Types::AutoScalingPolicyDescription?

        # The bid price for each Amazon EC2 Spot Instance type as defined by InstanceType . Expressed in USD.
        # If neither BidPrice nor BidPriceAsPercentageOfOnDemandPrice is provided,
        # BidPriceAsPercentageOfOnDemandPrice defaults to 100%.

        @[JSON::Field(key: "BidPrice")]
        getter bid_price : String?

        # Amazon EMR releases 4.x or later. The list of configurations supplied for an Amazon EMR cluster
        # instance group. You can specify a separate configuration for each instance group (master, core, and
        # task).

        @[JSON::Field(key: "Configurations")]
        getter configurations : Array(Types::Configuration)?

        # The version number of the requested configuration specification for this instance group.

        @[JSON::Field(key: "ConfigurationsVersion")]
        getter configurations_version : Int64?

        # The custom AMI ID to use for the provisioned instance group.

        @[JSON::Field(key: "CustomAmiId")]
        getter custom_ami_id : String?

        # The EBS block devices that are mapped to this instance group.

        @[JSON::Field(key: "EbsBlockDevices")]
        getter ebs_block_devices : Array(Types::EbsBlockDevice)?

        # If the instance group is EBS-optimized. An Amazon EBS-optimized instance uses an optimized
        # configuration stack and provides additional, dedicated capacity for Amazon EBS I/O.

        @[JSON::Field(key: "EbsOptimized")]
        getter ebs_optimized : Bool?

        # The identifier of the instance group.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The type of the instance group. Valid values are MASTER, CORE or TASK.

        @[JSON::Field(key: "InstanceGroupType")]
        getter instance_group_type : String?

        # The Amazon EC2 instance type for all instances in the instance group.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # A list of configurations that were successfully applied for an instance group last time.

        @[JSON::Field(key: "LastSuccessfullyAppliedConfigurations")]
        getter last_successfully_applied_configurations : Array(Types::Configuration)?

        # The version number of a configuration specification that was successfully applied for an instance
        # group last time.

        @[JSON::Field(key: "LastSuccessfullyAppliedConfigurationsVersion")]
        getter last_successfully_applied_configurations_version : Int64?

        # The marketplace to provision instances for this group. Valid values are ON_DEMAND or SPOT.

        @[JSON::Field(key: "Market")]
        getter market : String?

        # The name of the instance group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The target number of instances for the instance group.

        @[JSON::Field(key: "RequestedInstanceCount")]
        getter requested_instance_count : Int32?

        # The number of instances currently running in this instance group.

        @[JSON::Field(key: "RunningInstanceCount")]
        getter running_instance_count : Int32?

        # Policy for customizing shrink operations.

        @[JSON::Field(key: "ShrinkPolicy")]
        getter shrink_policy : Types::ShrinkPolicy?

        # The current status of the instance group.

        @[JSON::Field(key: "Status")]
        getter status : Types::InstanceGroupStatus?

        def initialize(
          @auto_scaling_policy : Types::AutoScalingPolicyDescription? = nil,
          @bid_price : String? = nil,
          @configurations : Array(Types::Configuration)? = nil,
          @configurations_version : Int64? = nil,
          @custom_ami_id : String? = nil,
          @ebs_block_devices : Array(Types::EbsBlockDevice)? = nil,
          @ebs_optimized : Bool? = nil,
          @id : String? = nil,
          @instance_group_type : String? = nil,
          @instance_type : String? = nil,
          @last_successfully_applied_configurations : Array(Types::Configuration)? = nil,
          @last_successfully_applied_configurations_version : Int64? = nil,
          @market : String? = nil,
          @name : String? = nil,
          @requested_instance_count : Int32? = nil,
          @running_instance_count : Int32? = nil,
          @shrink_policy : Types::ShrinkPolicy? = nil,
          @status : Types::InstanceGroupStatus? = nil
        )
        end
      end

      # Configuration defining a new instance group.

      struct InstanceGroupConfig
        include JSON::Serializable

        # Target number of instances for the instance group.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32

        # The role of the instance group in the cluster.

        @[JSON::Field(key: "InstanceRole")]
        getter instance_role : String

        # The Amazon EC2 instance type for all instances in the instance group.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # An automatic scaling policy for a core instance group or task instance group in an Amazon EMR
        # cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates
        # Amazon EC2 instances in response to the value of a CloudWatch metric. See PutAutoScalingPolicy .

        @[JSON::Field(key: "AutoScalingPolicy")]
        getter auto_scaling_policy : Types::AutoScalingPolicy?

        # The bid price for each Amazon EC2 Spot Instance type as defined by InstanceType . Expressed in USD.
        # If neither BidPrice nor BidPriceAsPercentageOfOnDemandPrice is provided,
        # BidPriceAsPercentageOfOnDemandPrice defaults to 100%.

        @[JSON::Field(key: "BidPrice")]
        getter bid_price : String?

        # Amazon EMR releases 4.x or later. The list of configurations supplied for an Amazon EMR cluster
        # instance group. You can specify a separate configuration for each instance group (master, core, and
        # task).

        @[JSON::Field(key: "Configurations")]
        getter configurations : Array(Types::Configuration)?

        # The custom AMI ID to use for the provisioned instance group.

        @[JSON::Field(key: "CustomAmiId")]
        getter custom_ami_id : String?

        # EBS configurations that will be attached to each Amazon EC2 instance in the instance group.

        @[JSON::Field(key: "EbsConfiguration")]
        getter ebs_configuration : Types::EbsConfiguration?

        # Market type of the Amazon EC2 instances used to create a cluster node.

        @[JSON::Field(key: "Market")]
        getter market : String?

        # Friendly name given to the instance group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @instance_count : Int32,
          @instance_role : String,
          @instance_type : String,
          @auto_scaling_policy : Types::AutoScalingPolicy? = nil,
          @bid_price : String? = nil,
          @configurations : Array(Types::Configuration)? = nil,
          @custom_ami_id : String? = nil,
          @ebs_configuration : Types::EbsConfiguration? = nil,
          @market : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Detailed information about an instance group.

      struct InstanceGroupDetail
        include JSON::Serializable

        # The date/time the instance group was created.

        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time

        # Target number of instances to run in the instance group.

        @[JSON::Field(key: "InstanceRequestCount")]
        getter instance_request_count : Int32

        # Instance group role in the cluster

        @[JSON::Field(key: "InstanceRole")]
        getter instance_role : String

        # Actual count of running instances.

        @[JSON::Field(key: "InstanceRunningCount")]
        getter instance_running_count : Int32

        # Amazon EC2 instance type.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # Market type of the Amazon EC2 instances used to create a cluster node.

        @[JSON::Field(key: "Market")]
        getter market : String

        # State of instance group. The following values are no longer supported: STARTING, TERMINATED, and
        # FAILED.

        @[JSON::Field(key: "State")]
        getter state : String

        # The bid price for each Amazon EC2 Spot Instance type as defined by InstanceType . Expressed in USD.
        # If neither BidPrice nor BidPriceAsPercentageOfOnDemandPrice is provided,
        # BidPriceAsPercentageOfOnDemandPrice defaults to 100%.

        @[JSON::Field(key: "BidPrice")]
        getter bid_price : String?

        # The custom AMI ID to use for the provisioned instance group.

        @[JSON::Field(key: "CustomAmiId")]
        getter custom_ami_id : String?

        # The date/time the instance group was terminated.

        @[JSON::Field(key: "EndDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date_time : Time?

        # Unique identifier for the instance group.

        @[JSON::Field(key: "InstanceGroupId")]
        getter instance_group_id : String?

        # Details regarding the state of the instance group.

        @[JSON::Field(key: "LastStateChangeReason")]
        getter last_state_change_reason : String?

        # Friendly name for the instance group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The date/time the instance group was available to the cluster.

        @[JSON::Field(key: "ReadyDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ready_date_time : Time?

        # The date/time the instance group was started.

        @[JSON::Field(key: "StartDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date_time : Time?

        def initialize(
          @creation_date_time : Time,
          @instance_request_count : Int32,
          @instance_role : String,
          @instance_running_count : Int32,
          @instance_type : String,
          @market : String,
          @state : String,
          @bid_price : String? = nil,
          @custom_ami_id : String? = nil,
          @end_date_time : Time? = nil,
          @instance_group_id : String? = nil,
          @last_state_change_reason : String? = nil,
          @name : String? = nil,
          @ready_date_time : Time? = nil,
          @start_date_time : Time? = nil
        )
        end
      end

      # Modify the size or configurations of an instance group.

      struct InstanceGroupModifyConfig
        include JSON::Serializable

        # Unique ID of the instance group to modify.

        @[JSON::Field(key: "InstanceGroupId")]
        getter instance_group_id : String

        # A list of new or modified configurations to apply for an instance group.

        @[JSON::Field(key: "Configurations")]
        getter configurations : Array(Types::Configuration)?

        # The Amazon EC2 InstanceIds to terminate. After you terminate the instances, the instance group will
        # not return to its original requested size.

        @[JSON::Field(key: "EC2InstanceIdsToTerminate")]
        getter ec2_instance_ids_to_terminate : Array(String)?

        # Target size for the instance group.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32?

        # Type of reconfiguration requested. Valid values are MERGE and OVERWRITE.

        @[JSON::Field(key: "ReconfigurationType")]
        getter reconfiguration_type : String?

        # Policy for customizing shrink operations.

        @[JSON::Field(key: "ShrinkPolicy")]
        getter shrink_policy : Types::ShrinkPolicy?

        def initialize(
          @instance_group_id : String,
          @configurations : Array(Types::Configuration)? = nil,
          @ec2_instance_ids_to_terminate : Array(String)? = nil,
          @instance_count : Int32? = nil,
          @reconfiguration_type : String? = nil,
          @shrink_policy : Types::ShrinkPolicy? = nil
        )
        end
      end

      # The status change reason details for the instance group.

      struct InstanceGroupStateChangeReason
        include JSON::Serializable

        # The programmable code for the state change reason.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The status change reason description.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The details of the instance group status.

      struct InstanceGroupStatus
        include JSON::Serializable

        # The current state of the instance group.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The status change reason details for the instance group.

        @[JSON::Field(key: "StateChangeReason")]
        getter state_change_reason : Types::InstanceGroupStateChangeReason?

        # The timeline of the instance group status over time.

        @[JSON::Field(key: "Timeline")]
        getter timeline : Types::InstanceGroupTimeline?

        def initialize(
          @state : String? = nil,
          @state_change_reason : Types::InstanceGroupStateChangeReason? = nil,
          @timeline : Types::InstanceGroupTimeline? = nil
        )
        end
      end

      # The timeline of the instance group lifecycle.

      struct InstanceGroupTimeline
        include JSON::Serializable

        # The creation date and time of the instance group.

        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The date and time when the instance group terminated.

        @[JSON::Field(key: "EndDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date_time : Time?

        # The date and time when the instance group became ready to perform tasks.

        @[JSON::Field(key: "ReadyDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ready_date_time : Time?

        def initialize(
          @creation_date_time : Time? = nil,
          @end_date_time : Time? = nil,
          @ready_date_time : Time? = nil
        )
        end
      end

      # Custom policy for requesting termination protection or termination of specific instances when
      # shrinking an instance group.

      struct InstanceResizePolicy
        include JSON::Serializable

        # Decommissioning timeout override for the specific list of instances to be terminated.

        @[JSON::Field(key: "InstanceTerminationTimeout")]
        getter instance_termination_timeout : Int32?

        # Specific list of instances to be protected when shrinking an instance group.

        @[JSON::Field(key: "InstancesToProtect")]
        getter instances_to_protect : Array(String)?

        # Specific list of instances to be terminated when shrinking an instance group.

        @[JSON::Field(key: "InstancesToTerminate")]
        getter instances_to_terminate : Array(String)?

        def initialize(
          @instance_termination_timeout : Int32? = nil,
          @instances_to_protect : Array(String)? = nil,
          @instances_to_terminate : Array(String)? = nil
        )
        end
      end

      # The details of the status change reason for the instance.

      struct InstanceStateChangeReason
        include JSON::Serializable

        # The programmable code for the state change reason.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The status change reason description.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The instance status details.

      struct InstanceStatus
        include JSON::Serializable

        # The current state of the instance.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The details of the status change reason for the instance.

        @[JSON::Field(key: "StateChangeReason")]
        getter state_change_reason : Types::InstanceStateChangeReason?

        # The timeline of the instance status over time.

        @[JSON::Field(key: "Timeline")]
        getter timeline : Types::InstanceTimeline?

        def initialize(
          @state : String? = nil,
          @state_change_reason : Types::InstanceStateChangeReason? = nil,
          @timeline : Types::InstanceTimeline? = nil
        )
        end
      end

      # The timeline of the instance lifecycle.

      struct InstanceTimeline
        include JSON::Serializable

        # The creation date and time of the instance.

        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The date and time when the instance was terminated.

        @[JSON::Field(key: "EndDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date_time : Time?

        # The date and time when the instance was ready to perform tasks.

        @[JSON::Field(key: "ReadyDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ready_date_time : Time?

        def initialize(
          @creation_date_time : Time? = nil,
          @end_date_time : Time? = nil,
          @ready_date_time : Time? = nil
        )
        end
      end

      # An instance type configuration for each instance type in an instance fleet, which determines the
      # Amazon EC2 instances Amazon EMR attempts to provision to fulfill On-Demand and Spot target
      # capacities. When you use an allocation strategy, you can include a maximum of 30 instance type
      # configurations for a fleet. For more information about how to use an allocation strategy, see
      # Configure Instance Fleets . Without an allocation strategy, you may specify a maximum of five
      # instance type configurations for a fleet. The instance fleet configuration is available only in
      # Amazon EMR releases 4.8.0 and later, excluding 5.0.x versions.

      struct InstanceTypeConfig
        include JSON::Serializable

        # An Amazon EC2 instance type, such as m3.xlarge .

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # The bid price for each Amazon EC2 Spot Instance type as defined by InstanceType . Expressed in USD.
        # If neither BidPrice nor BidPriceAsPercentageOfOnDemandPrice is provided,
        # BidPriceAsPercentageOfOnDemandPrice defaults to 100%.

        @[JSON::Field(key: "BidPrice")]
        getter bid_price : String?

        # The bid price, as a percentage of On-Demand price, for each Amazon EC2 Spot Instance as defined by
        # InstanceType . Expressed as a number (for example, 20 specifies 20%). If neither BidPrice nor
        # BidPriceAsPercentageOfOnDemandPrice is provided, BidPriceAsPercentageOfOnDemandPrice defaults to
        # 100%.

        @[JSON::Field(key: "BidPriceAsPercentageOfOnDemandPrice")]
        getter bid_price_as_percentage_of_on_demand_price : Float64?

        # A configuration classification that applies when provisioning cluster instances, which can include
        # configurations for applications and software that run on the cluster.

        @[JSON::Field(key: "Configurations")]
        getter configurations : Array(Types::Configuration)?

        # The custom AMI ID to use for the instance type.

        @[JSON::Field(key: "CustomAmiId")]
        getter custom_ami_id : String?

        # The configuration of Amazon Elastic Block Store (Amazon EBS) attached to each instance as defined by
        # InstanceType .

        @[JSON::Field(key: "EbsConfiguration")]
        getter ebs_configuration : Types::EbsConfiguration?

        # The priority at which Amazon EMR launches the Amazon EC2 instances with this instance type. Priority
        # starts at 0, which is the highest priority. Amazon EMR considers the highest priority first.

        @[JSON::Field(key: "Priority")]
        getter priority : Float64?

        # The number of units that a provisioned instance of this type provides toward fulfilling the target
        # capacities defined in InstanceFleetConfig . This value is 1 for a master instance fleet, and must be
        # 1 or greater for core and task instance fleets. Defaults to 1 if not specified.

        @[JSON::Field(key: "WeightedCapacity")]
        getter weighted_capacity : Int32?

        def initialize(
          @instance_type : String,
          @bid_price : String? = nil,
          @bid_price_as_percentage_of_on_demand_price : Float64? = nil,
          @configurations : Array(Types::Configuration)? = nil,
          @custom_ami_id : String? = nil,
          @ebs_configuration : Types::EbsConfiguration? = nil,
          @priority : Float64? = nil,
          @weighted_capacity : Int32? = nil
        )
        end
      end

      # The configuration specification for each instance type in an instance fleet. The instance fleet
      # configuration is available only in Amazon EMR releases 4.8.0 and later, excluding 5.0.x versions.

      struct InstanceTypeSpecification
        include JSON::Serializable

        # The bid price for each Amazon EC2 Spot Instance type as defined by InstanceType . Expressed in USD.
        # If neither BidPrice nor BidPriceAsPercentageOfOnDemandPrice is provided,
        # BidPriceAsPercentageOfOnDemandPrice defaults to 100%.

        @[JSON::Field(key: "BidPrice")]
        getter bid_price : String?

        # The bid price, as a percentage of On-Demand price, for each Amazon EC2 Spot Instance as defined by
        # InstanceType . Expressed as a number (for example, 20 specifies 20%).

        @[JSON::Field(key: "BidPriceAsPercentageOfOnDemandPrice")]
        getter bid_price_as_percentage_of_on_demand_price : Float64?

        # A configuration classification that applies when provisioning cluster instances, which can include
        # configurations for applications and software bundled with Amazon EMR.

        @[JSON::Field(key: "Configurations")]
        getter configurations : Array(Types::Configuration)?

        # The custom AMI ID to use for the instance type.

        @[JSON::Field(key: "CustomAmiId")]
        getter custom_ami_id : String?

        # The configuration of Amazon Elastic Block Store (Amazon EBS) attached to each instance as defined by
        # InstanceType .

        @[JSON::Field(key: "EbsBlockDevices")]
        getter ebs_block_devices : Array(Types::EbsBlockDevice)?

        # Evaluates to TRUE when the specified InstanceType is EBS-optimized.

        @[JSON::Field(key: "EbsOptimized")]
        getter ebs_optimized : Bool?

        # The Amazon EC2 instance type, for example m3.xlarge .

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The priority at which Amazon EMR launches the Amazon EC2 instances with this instance type. Priority
        # starts at 0, which is the highest priority. Amazon EMR considers the highest priority first.

        @[JSON::Field(key: "Priority")]
        getter priority : Float64?

        # The number of units that a provisioned instance of this type provides toward fulfilling the target
        # capacities defined in InstanceFleetConfig . Capacity values represent performance characteristics
        # such as vCPUs, memory, or I/O. If not specified, the default value is 1.

        @[JSON::Field(key: "WeightedCapacity")]
        getter weighted_capacity : Int32?

        def initialize(
          @bid_price : String? = nil,
          @bid_price_as_percentage_of_on_demand_price : Float64? = nil,
          @configurations : Array(Types::Configuration)? = nil,
          @custom_ami_id : String? = nil,
          @ebs_block_devices : Array(Types::EbsBlockDevice)? = nil,
          @ebs_optimized : Bool? = nil,
          @instance_type : String? = nil,
          @priority : Float64? = nil,
          @weighted_capacity : Int32? = nil
        )
        end
      end

      # Indicates that an error occurred while processing the request and that the request was not
      # completed.

      struct InternalServerError
        include JSON::Serializable

        def initialize
        end
      end

      # This exception occurs when there is an internal failure in the Amazon EMR service.

      struct InternalServerException
        include JSON::Serializable

        # The message associated with the exception.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception occurs when there is something wrong with user input.

      struct InvalidRequestException
        include JSON::Serializable

        # The error code associated with the exception.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The message associated with the exception.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # A description of a cluster (job flow).

      struct JobFlowDetail
        include JSON::Serializable

        # Describes the execution status of the job flow.

        @[JSON::Field(key: "ExecutionStatusDetail")]
        getter execution_status_detail : Types::JobFlowExecutionStatusDetail

        # Describes the Amazon EC2 instances of the job flow.

        @[JSON::Field(key: "Instances")]
        getter instances : Types::JobFlowInstancesDetail

        # The job flow identifier.

        @[JSON::Field(key: "JobFlowId")]
        getter job_flow_id : String

        # The name of the job flow.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Applies only to Amazon EMR AMI versions 3.x and 2.x. For Amazon EMR releases 4.0 and later,
        # ReleaseLabel is used. To specify a custom AMI, use CustomAmiID .

        @[JSON::Field(key: "AmiVersion")]
        getter ami_version : String?

        # An IAM role for automatic scaling policies. The default role is EMR_AutoScaling_DefaultRole . The
        # IAM role provides a way for the automatic scaling feature to get the required permissions it needs
        # to launch and terminate Amazon EC2 instances in an instance group.

        @[JSON::Field(key: "AutoScalingRole")]
        getter auto_scaling_role : String?

        # A list of the bootstrap actions run by the job flow.

        @[JSON::Field(key: "BootstrapActions")]
        getter bootstrap_actions : Array(Types::BootstrapActionDetail)?

        # The IAM role that was specified when the job flow was launched. The Amazon EC2 instances of the job
        # flow assume this role.

        @[JSON::Field(key: "JobFlowRole")]
        getter job_flow_role : String?

        # The KMS key used for encrypting log files. This attribute is only available with Amazon EMR 5.30.0
        # and later, excluding 6.0.0.

        @[JSON::Field(key: "LogEncryptionKmsKeyId")]
        getter log_encryption_kms_key_id : String?

        # The location in Amazon S3 where log files for the job are stored.

        @[JSON::Field(key: "LogUri")]
        getter log_uri : String?

        # The way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or
        # an instance group is resized. TERMINATE_AT_INSTANCE_HOUR indicates that Amazon EMR terminates nodes
        # at the instance-hour boundary, regardless of when the request to terminate the instance was
        # submitted. This option is only available with Amazon EMR 5.1.0 and later and is the default for
        # clusters created using that version. TERMINATE_AT_TASK_COMPLETION indicates that Amazon EMR adds
        # nodes to a deny list and drains tasks from nodes before terminating the Amazon EC2 instances,
        # regardless of the instance-hour boundary. With either behavior, Amazon EMR removes the least active
        # nodes first and blocks instance termination if it could lead to HDFS corruption.
        # TERMINATE_AT_TASK_COMPLETION available only in Amazon EMR releases 4.1.0 and later, and is the
        # default for releases of Amazon EMR earlier than 5.1.0.

        @[JSON::Field(key: "ScaleDownBehavior")]
        getter scale_down_behavior : String?

        # The IAM role that is assumed by the Amazon EMR service to access Amazon Web Services resources on
        # your behalf.

        @[JSON::Field(key: "ServiceRole")]
        getter service_role : String?

        # A list of steps run by the job flow.

        @[JSON::Field(key: "Steps")]
        getter steps : Array(Types::StepDetail)?

        # A list of strings set by third-party software when the job flow is launched. If you are not using
        # third-party software to manage the job flow, this value is empty.

        @[JSON::Field(key: "SupportedProducts")]
        getter supported_products : Array(String)?

        # Indicates whether the cluster is visible to IAM principals in the Amazon Web Services account
        # associated with the cluster. When true , IAM principals in the Amazon Web Services account can
        # perform Amazon EMR cluster actions that their IAM policies allow. When false , only the IAM
        # principal that created the cluster and the Amazon Web Services account root user can perform Amazon
        # EMR actions, regardless of IAM permissions policies attached to other IAM principals. The default
        # value is true if a value is not provided when creating a cluster using the Amazon EMR API RunJobFlow
        # command, the CLI create-cluster command, or the Amazon Web Services Management Console.

        @[JSON::Field(key: "VisibleToAllUsers")]
        getter visible_to_all_users : Bool?

        def initialize(
          @execution_status_detail : Types::JobFlowExecutionStatusDetail,
          @instances : Types::JobFlowInstancesDetail,
          @job_flow_id : String,
          @name : String,
          @ami_version : String? = nil,
          @auto_scaling_role : String? = nil,
          @bootstrap_actions : Array(Types::BootstrapActionDetail)? = nil,
          @job_flow_role : String? = nil,
          @log_encryption_kms_key_id : String? = nil,
          @log_uri : String? = nil,
          @scale_down_behavior : String? = nil,
          @service_role : String? = nil,
          @steps : Array(Types::StepDetail)? = nil,
          @supported_products : Array(String)? = nil,
          @visible_to_all_users : Bool? = nil
        )
        end
      end

      # Describes the status of the cluster (job flow).

      struct JobFlowExecutionStatusDetail
        include JSON::Serializable

        # The creation date and time of the job flow.

        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time

        # The state of the job flow.

        @[JSON::Field(key: "State")]
        getter state : String

        # The completion date and time of the job flow.

        @[JSON::Field(key: "EndDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date_time : Time?

        # Description of the job flow last changed state.

        @[JSON::Field(key: "LastStateChangeReason")]
        getter last_state_change_reason : String?

        # The date and time when the job flow was ready to start running bootstrap actions.

        @[JSON::Field(key: "ReadyDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ready_date_time : Time?

        # The start date and time of the job flow.

        @[JSON::Field(key: "StartDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date_time : Time?

        def initialize(
          @creation_date_time : Time,
          @state : String,
          @end_date_time : Time? = nil,
          @last_state_change_reason : String? = nil,
          @ready_date_time : Time? = nil,
          @start_date_time : Time? = nil
        )
        end
      end

      # A description of the Amazon EC2 instance on which the cluster (job flow) runs. A valid
      # JobFlowInstancesConfig must contain either InstanceGroups or InstanceFleets. They cannot be used
      # together. You may also have MasterInstanceType, SlaveInstanceType, and InstanceCount (all three must
      # be present), but we don't recommend this configuration.

      struct JobFlowInstancesConfig
        include JSON::Serializable

        # A list of additional Amazon EC2 security group IDs for the master node.

        @[JSON::Field(key: "AdditionalMasterSecurityGroups")]
        getter additional_master_security_groups : Array(String)?

        # A list of additional Amazon EC2 security group IDs for the core and task nodes.

        @[JSON::Field(key: "AdditionalSlaveSecurityGroups")]
        getter additional_slave_security_groups : Array(String)?

        # The name of the Amazon EC2 key pair that can be used to connect to the master node using SSH as the
        # user called "hadoop."

        @[JSON::Field(key: "Ec2KeyName")]
        getter ec2_key_name : String?

        # Applies to clusters that use the uniform instance group configuration. To launch the cluster in
        # Amazon Virtual Private Cloud (Amazon VPC), set this parameter to the identifier of the Amazon VPC
        # subnet where you want the cluster to launch. If you do not specify this value and your account
        # supports EC2-Classic, the cluster launches in EC2-Classic.

        @[JSON::Field(key: "Ec2SubnetId")]
        getter ec2_subnet_id : String?

        # Applies to clusters that use the instance fleet configuration. When multiple Amazon EC2 subnet IDs
        # are specified, Amazon EMR evaluates them and launches instances in the optimal subnet. The instance
        # fleet configuration is available only in Amazon EMR releases 4.8.0 and later, excluding 5.0.x
        # versions.

        @[JSON::Field(key: "Ec2SubnetIds")]
        getter ec2_subnet_ids : Array(String)?

        # The identifier of the Amazon EC2 security group for the master node. If you specify
        # EmrManagedMasterSecurityGroup , you must also specify EmrManagedSlaveSecurityGroup .

        @[JSON::Field(key: "EmrManagedMasterSecurityGroup")]
        getter emr_managed_master_security_group : String?

        # The identifier of the Amazon EC2 security group for the core and task nodes. If you specify
        # EmrManagedSlaveSecurityGroup , you must also specify EmrManagedMasterSecurityGroup .

        @[JSON::Field(key: "EmrManagedSlaveSecurityGroup")]
        getter emr_managed_slave_security_group : String?

        # Applies only to Amazon EMR release versions earlier than 4.0. The Hadoop version for the cluster.
        # Valid inputs are "0.18" (no longer maintained), "0.20" (no longer maintained), "0.20.205" (no longer
        # maintained), "1.0.3", "2.2.0", or "2.4.0". If you do not set this value, the default of 0.18 is
        # used, unless the AmiVersion parameter is set in the RunJobFlow call, in which case the default
        # version of Hadoop for that AMI version is used.

        @[JSON::Field(key: "HadoopVersion")]
        getter hadoop_version : String?

        # The number of Amazon EC2 instances in the cluster.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32?

        # The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, excluding
        # 5.0.x versions. Describes the Amazon EC2 instances and instance configurations for clusters that use
        # the instance fleet configuration.

        @[JSON::Field(key: "InstanceFleets")]
        getter instance_fleets : Array(Types::InstanceFleetConfig)?

        # Configuration for the instance groups in a cluster.

        @[JSON::Field(key: "InstanceGroups")]
        getter instance_groups : Array(Types::InstanceGroupConfig)?

        # Specifies whether the cluster should remain available after completing all steps. Defaults to false
        # . For more information about configuring cluster termination, see Control Cluster Termination in the
        # EMR Management Guide .

        @[JSON::Field(key: "KeepJobFlowAliveWhenNoSteps")]
        getter keep_job_flow_alive_when_no_steps : Bool?

        # The Amazon EC2 instance type of the master node.

        @[JSON::Field(key: "MasterInstanceType")]
        getter master_instance_type : String?

        # The Availability Zone in which the cluster runs.

        @[JSON::Field(key: "Placement")]
        getter placement : Types::PlacementType?

        # The identifier of the Amazon EC2 security group for the Amazon EMR service to access clusters in VPC
        # private subnets.

        @[JSON::Field(key: "ServiceAccessSecurityGroup")]
        getter service_access_security_group : String?

        # The Amazon EC2 instance type of the core and task nodes.

        @[JSON::Field(key: "SlaveInstanceType")]
        getter slave_instance_type : String?

        # Specifies whether to lock the cluster to prevent the Amazon EC2 instances from being terminated by
        # API call, user intervention, or in the event of a job-flow error.

        @[JSON::Field(key: "TerminationProtected")]
        getter termination_protected : Bool?

        # Indicates whether Amazon EMR should gracefully replace core nodes that have degraded within the
        # cluster.

        @[JSON::Field(key: "UnhealthyNodeReplacement")]
        getter unhealthy_node_replacement : Bool?

        def initialize(
          @additional_master_security_groups : Array(String)? = nil,
          @additional_slave_security_groups : Array(String)? = nil,
          @ec2_key_name : String? = nil,
          @ec2_subnet_id : String? = nil,
          @ec2_subnet_ids : Array(String)? = nil,
          @emr_managed_master_security_group : String? = nil,
          @emr_managed_slave_security_group : String? = nil,
          @hadoop_version : String? = nil,
          @instance_count : Int32? = nil,
          @instance_fleets : Array(Types::InstanceFleetConfig)? = nil,
          @instance_groups : Array(Types::InstanceGroupConfig)? = nil,
          @keep_job_flow_alive_when_no_steps : Bool? = nil,
          @master_instance_type : String? = nil,
          @placement : Types::PlacementType? = nil,
          @service_access_security_group : String? = nil,
          @slave_instance_type : String? = nil,
          @termination_protected : Bool? = nil,
          @unhealthy_node_replacement : Bool? = nil
        )
        end
      end

      # Specify the type of Amazon EC2 instances that the cluster (job flow) runs on.

      struct JobFlowInstancesDetail
        include JSON::Serializable

        # The number of Amazon EC2 instances in the cluster. If the value is 1, the same instance serves as
        # both the master and core and task node. If the value is greater than 1, one instance is the master
        # node and all others are core and task nodes.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32

        # The Amazon EC2 master node instance type.

        @[JSON::Field(key: "MasterInstanceType")]
        getter master_instance_type : String

        # The Amazon EC2 core and task node instance type.

        @[JSON::Field(key: "SlaveInstanceType")]
        getter slave_instance_type : String

        # The name of an Amazon EC2 key pair that can be used to connect to the master node using SSH.

        @[JSON::Field(key: "Ec2KeyName")]
        getter ec2_key_name : String?

        # For clusters launched within Amazon Virtual Private Cloud, this is the identifier of the subnet
        # where the cluster was launched.

        @[JSON::Field(key: "Ec2SubnetId")]
        getter ec2_subnet_id : String?

        # The Hadoop version for the cluster.

        @[JSON::Field(key: "HadoopVersion")]
        getter hadoop_version : String?

        # Details about the instance groups in a cluster.

        @[JSON::Field(key: "InstanceGroups")]
        getter instance_groups : Array(Types::InstanceGroupDetail)?

        # Specifies whether the cluster should remain available after completing all steps.

        @[JSON::Field(key: "KeepJobFlowAliveWhenNoSteps")]
        getter keep_job_flow_alive_when_no_steps : Bool?

        # The Amazon EC2 instance identifier of the master node.

        @[JSON::Field(key: "MasterInstanceId")]
        getter master_instance_id : String?

        # The DNS name of the master node. If the cluster is on a private subnet, this is the private DNS
        # name. On a public subnet, this is the public DNS name.

        @[JSON::Field(key: "MasterPublicDnsName")]
        getter master_public_dns_name : String?

        # An approximation of the cost of the cluster, represented in m1.small/hours. This value is increased
        # one time for every hour that an m1.small instance runs. Larger instances are weighted more heavily,
        # so an Amazon EC2 instance that is roughly four times more expensive would result in the normalized
        # instance hours being increased incrementally four times. This result is only an approximation and
        # does not reflect the actual billing rate.

        @[JSON::Field(key: "NormalizedInstanceHours")]
        getter normalized_instance_hours : Int32?

        # The Amazon EC2 Availability Zone for the cluster.

        @[JSON::Field(key: "Placement")]
        getter placement : Types::PlacementType?

        # Specifies whether the Amazon EC2 instances in the cluster are protected from termination by API
        # calls, user intervention, or in the event of a job-flow error.

        @[JSON::Field(key: "TerminationProtected")]
        getter termination_protected : Bool?

        # Indicates whether Amazon EMR should gracefully replace core nodes that have degraded within the
        # cluster.

        @[JSON::Field(key: "UnhealthyNodeReplacement")]
        getter unhealthy_node_replacement : Bool?

        def initialize(
          @instance_count : Int32,
          @master_instance_type : String,
          @slave_instance_type : String,
          @ec2_key_name : String? = nil,
          @ec2_subnet_id : String? = nil,
          @hadoop_version : String? = nil,
          @instance_groups : Array(Types::InstanceGroupDetail)? = nil,
          @keep_job_flow_alive_when_no_steps : Bool? = nil,
          @master_instance_id : String? = nil,
          @master_public_dns_name : String? = nil,
          @normalized_instance_hours : Int32? = nil,
          @placement : Types::PlacementType? = nil,
          @termination_protected : Bool? = nil,
          @unhealthy_node_replacement : Bool? = nil
        )
        end
      end

      # Attributes for Kerberos configuration when Kerberos authentication is enabled using a security
      # configuration. For more information see Use Kerberos Authentication in the Amazon EMR Management
      # Guide .

      struct KerberosAttributes
        include JSON::Serializable

        # The password used within the cluster for the kadmin service on the cluster-dedicated KDC, which
        # maintains Kerberos principals, password policies, and keytabs for the cluster.

        @[JSON::Field(key: "KdcAdminPassword")]
        getter kdc_admin_password : String

        # The name of the Kerberos realm to which all nodes in a cluster belong. For example, EC2.INTERNAL .

        @[JSON::Field(key: "Realm")]
        getter realm : String

        # The Active Directory password for ADDomainJoinUser .

        @[JSON::Field(key: "ADDomainJoinPassword")]
        getter ad_domain_join_password : String?

        # Required only when establishing a cross-realm trust with an Active Directory domain. A user with
        # sufficient privileges to join resources to the domain.

        @[JSON::Field(key: "ADDomainJoinUser")]
        getter ad_domain_join_user : String?

        # Required only when establishing a cross-realm trust with a KDC in a different realm. The cross-realm
        # principal password, which must be identical across realms.

        @[JSON::Field(key: "CrossRealmTrustPrincipalPassword")]
        getter cross_realm_trust_principal_password : String?

        def initialize(
          @kdc_admin_password : String,
          @realm : String,
          @ad_domain_join_password : String? = nil,
          @ad_domain_join_user : String? = nil,
          @cross_realm_trust_principal_password : String? = nil
        )
        end
      end

      # A key-value pair.

      struct KeyValue
        include JSON::Serializable

        # The unique identifier of a key-value pair.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value part of the identified key.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # This input determines which bootstrap actions to retrieve.

      struct ListBootstrapActionsInput
        include JSON::Serializable

        # The cluster identifier for the bootstrap actions to list.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cluster_id : String,
          @marker : String? = nil
        )
        end
      end

      # This output contains the bootstrap actions detail.

      struct ListBootstrapActionsOutput
        include JSON::Serializable

        # The bootstrap actions associated with the cluster.

        @[JSON::Field(key: "BootstrapActions")]
        getter bootstrap_actions : Array(Types::Command)?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @bootstrap_actions : Array(Types::Command)? = nil,
          @marker : String? = nil
        )
        end
      end

      # This input determines how the ListClusters action filters the list of clusters that it returns.

      struct ListClustersInput
        include JSON::Serializable

        # The cluster state filters to apply when listing clusters. Clusters that change state while this
        # action runs may be not be returned as expected in the list of clusters.

        @[JSON::Field(key: "ClusterStates")]
        getter cluster_states : Array(String)?

        # The creation date and time beginning value filter for listing clusters.

        @[JSON::Field(key: "CreatedAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_after : Time?

        # The creation date and time end value filter for listing clusters.

        @[JSON::Field(key: "CreatedBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_before : Time?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cluster_states : Array(String)? = nil,
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @marker : String? = nil
        )
        end
      end

      # This contains a ClusterSummaryList with the cluster details; for example, the cluster IDs, names,
      # and status.

      struct ListClustersOutput
        include JSON::Serializable

        # The list of clusters for the account based on the given filters.

        @[JSON::Field(key: "Clusters")]
        getter clusters : Array(Types::ClusterSummary)?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @clusters : Array(Types::ClusterSummary)? = nil,
          @marker : String? = nil
        )
        end
      end


      struct ListInstanceFleetsInput
        include JSON::Serializable

        # The unique identifier of the cluster.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cluster_id : String,
          @marker : String? = nil
        )
        end
      end


      struct ListInstanceFleetsOutput
        include JSON::Serializable

        # The list of instance fleets for the cluster and given filters.

        @[JSON::Field(key: "InstanceFleets")]
        getter instance_fleets : Array(Types::InstanceFleet)?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @instance_fleets : Array(Types::InstanceFleet)? = nil,
          @marker : String? = nil
        )
        end
      end

      # This input determines which instance groups to retrieve.

      struct ListInstanceGroupsInput
        include JSON::Serializable

        # The identifier of the cluster for which to list the instance groups.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cluster_id : String,
          @marker : String? = nil
        )
        end
      end

      # This input determines which instance groups to retrieve.

      struct ListInstanceGroupsOutput
        include JSON::Serializable

        # The list of instance groups for the cluster and given filters.

        @[JSON::Field(key: "InstanceGroups")]
        getter instance_groups : Array(Types::InstanceGroup)?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @instance_groups : Array(Types::InstanceGroup)? = nil,
          @marker : String? = nil
        )
        end
      end

      # This input determines which instances to list.

      struct ListInstancesInput
        include JSON::Serializable

        # The identifier of the cluster for which to list the instances.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The unique identifier of the instance fleet.

        @[JSON::Field(key: "InstanceFleetId")]
        getter instance_fleet_id : String?

        # The node type of the instance fleet. For example MASTER, CORE, or TASK.

        @[JSON::Field(key: "InstanceFleetType")]
        getter instance_fleet_type : String?

        # The identifier of the instance group for which to list the instances.

        @[JSON::Field(key: "InstanceGroupId")]
        getter instance_group_id : String?

        # The type of instance group for which to list the instances.

        @[JSON::Field(key: "InstanceGroupTypes")]
        getter instance_group_types : Array(String)?

        # A list of instance states that will filter the instances returned with this request.

        @[JSON::Field(key: "InstanceStates")]
        getter instance_states : Array(String)?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cluster_id : String,
          @instance_fleet_id : String? = nil,
          @instance_fleet_type : String? = nil,
          @instance_group_id : String? = nil,
          @instance_group_types : Array(String)? = nil,
          @instance_states : Array(String)? = nil,
          @marker : String? = nil
        )
        end
      end

      # This output contains the list of instances.

      struct ListInstancesOutput
        include JSON::Serializable

        # The list of instances for the cluster and given filters.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @instances : Array(Types::Instance)? = nil,
          @marker : String? = nil
        )
        end
      end


      struct ListNotebookExecutionsInput
        include JSON::Serializable

        # The unique ID of the editor associated with the notebook execution.

        @[JSON::Field(key: "EditorId")]
        getter editor_id : String?

        # The unique ID of the execution engine.

        @[JSON::Field(key: "ExecutionEngineId")]
        getter execution_engine_id : String?

        # The beginning of time range filter for listing notebook executions. The default is the timestamp of
        # 30 days ago.

        @[JSON::Field(key: "From", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter from : Time?

        # The pagination token, returned by a previous ListNotebookExecutions call, that indicates the start
        # of the list for this ListNotebookExecutions call.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The status filter for listing notebook executions. START_PENDING indicates that the cluster has
        # received the execution request but execution has not begun. STARTING indicates that the execution is
        # starting on the cluster. RUNNING indicates that the execution is being processed by the cluster.
        # FINISHING indicates that execution processing is in the final stages. FINISHED indicates that the
        # execution has completed without error. FAILING indicates that the execution is failing and will not
        # finish successfully. FAILED indicates that the execution failed. STOP_PENDING indicates that the
        # cluster has received a StopNotebookExecution request and the stop is pending. STOPPING indicates
        # that the cluster is in the process of stopping the execution as a result of a StopNotebookExecution
        # request. STOPPED indicates that the execution stopped because of a StopNotebookExecution request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The end of time range filter for listing notebook executions. The default is the current timestamp.

        @[JSON::Field(key: "To", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter to : Time?

        def initialize(
          @editor_id : String? = nil,
          @execution_engine_id : String? = nil,
          @from : Time? = nil,
          @marker : String? = nil,
          @status : String? = nil,
          @to : Time? = nil
        )
        end
      end


      struct ListNotebookExecutionsOutput
        include JSON::Serializable

        # A pagination token that a subsequent ListNotebookExecutions can use to determine the next set of
        # results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of notebook executions.

        @[JSON::Field(key: "NotebookExecutions")]
        getter notebook_executions : Array(Types::NotebookExecutionSummary)?

        def initialize(
          @marker : String? = nil,
          @notebook_executions : Array(Types::NotebookExecutionSummary)? = nil
        )
        end
      end


      struct ListReleaseLabelsInput
        include JSON::Serializable

        # Filters the results of the request. Prefix specifies the prefix of release labels to return.
        # Application specifies the application (with/without version) of release labels to return.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ReleaseLabelFilter?

        # Defines the maximum number of release labels to return in a single response. The default is 100 .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies the next page of results. If NextToken is not specified, which is usually the case for the
        # first request of ListReleaseLabels, the first page of results are determined by other filtering
        # parameters or by the latest version. The ListReleaseLabels request fails if the identity (Amazon Web
        # Services account ID) and all filtering parameters are different from the original request, or if the
        # NextToken is expired or tampered with.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Types::ReleaseLabelFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReleaseLabelsOutput
        include JSON::Serializable

        # Used to paginate the next page of results if specified in the next ListReleaseLabels request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The returned release labels.

        @[JSON::Field(key: "ReleaseLabels")]
        getter release_labels : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @release_labels : Array(String)? = nil
        )
        end
      end


      struct ListSecurityConfigurationsInput
        include JSON::Serializable

        # The pagination token that indicates the set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @marker : String? = nil
        )
        end
      end


      struct ListSecurityConfigurationsOutput
        include JSON::Serializable

        # A pagination token that indicates the next set of results to retrieve. Include the marker in the
        # next ListSecurityConfiguration call to retrieve the next page of results, if required.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The creation date and time, and name, of each security configuration.

        @[JSON::Field(key: "SecurityConfigurations")]
        getter security_configurations : Array(Types::SecurityConfigurationSummary)?

        def initialize(
          @marker : String? = nil,
          @security_configurations : Array(Types::SecurityConfigurationSummary)? = nil
        )
        end
      end

      # This input determines which steps to list.

      struct ListStepsInput
        include JSON::Serializable

        # The identifier of the cluster for which to list the steps.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The maximum number of steps that a single ListSteps action returns is 50. To return a longer list of
        # steps, use multiple ListSteps actions along with the Marker parameter, which is a pagination token
        # that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The filter to limit the step list based on the identifier of the steps. You can specify a maximum of
        # ten Step IDs. The character constraint applies to the overall length of the array.

        @[JSON::Field(key: "StepIds")]
        getter step_ids : Array(String)?

        # The filter to limit the step list based on certain states.

        @[JSON::Field(key: "StepStates")]
        getter step_states : Array(String)?

        def initialize(
          @cluster_id : String,
          @marker : String? = nil,
          @step_ids : Array(String)? = nil,
          @step_states : Array(String)? = nil
        )
        end
      end

      # This output contains the list of steps returned in reverse order. This means that the last step is
      # the first element in the list.

      struct ListStepsOutput
        include JSON::Serializable

        # The maximum number of steps that a single ListSteps action returns is 50. To return a longer list of
        # steps, use multiple ListSteps actions along with the Marker parameter, which is a pagination token
        # that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The filtered list of steps for the cluster.

        @[JSON::Field(key: "Steps")]
        getter steps : Array(Types::StepSummary)?

        def initialize(
          @marker : String? = nil,
          @steps : Array(Types::StepSummary)? = nil
        )
        end
      end


      struct ListStudioSessionMappingsInput
        include JSON::Serializable

        # Specifies whether to return session mappings for users or groups. If not specified, the results
        # include session mapping details for both users and groups.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String?

        # The pagination token that indicates the set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The ID of the Amazon EMR Studio.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String?

        def initialize(
          @identity_type : String? = nil,
          @marker : String? = nil,
          @studio_id : String? = nil
        )
        end
      end


      struct ListStudioSessionMappingsOutput
        include JSON::Serializable

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of session mapping summary objects. Each object includes session mapping details such as
        # creation time, identity type (user or group), and Amazon EMR Studio ID.

        @[JSON::Field(key: "SessionMappings")]
        getter session_mappings : Array(Types::SessionMappingSummary)?

        def initialize(
          @marker : String? = nil,
          @session_mappings : Array(Types::SessionMappingSummary)? = nil
        )
        end
      end


      struct ListStudiosInput
        include JSON::Serializable

        # The pagination token that indicates the set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @marker : String? = nil
        )
        end
      end


      struct ListStudiosOutput
        include JSON::Serializable

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The list of Studio summary objects.

        @[JSON::Field(key: "Studios")]
        getter studios : Array(Types::StudioSummary)?

        def initialize(
          @marker : String? = nil,
          @studios : Array(Types::StudioSummary)? = nil
        )
        end
      end


      struct ListSupportedInstanceTypesInput
        include JSON::Serializable

        # The Amazon EMR release label determines the versions of open-source application packages that Amazon
        # EMR has installed on the cluster. Release labels are in the format emr-x.x.x , where x.x.x is an
        # Amazon EMR release number such as emr-6.10.0 . For more information about Amazon EMR releases and
        # their included application versions and features, see the Amazon EMR Release Guide .

        @[JSON::Field(key: "ReleaseLabel")]
        getter release_label : String

        # The pagination token that marks the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @release_label : String,
          @marker : String? = nil
        )
        end
      end


      struct ListSupportedInstanceTypesOutput
        include JSON::Serializable

        # The pagination token that marks the next set of results to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The list of instance types that the release specified in
        # ListSupportedInstanceTypesInput$ReleaseLabel supports, filtered by Amazon Web Services Region.

        @[JSON::Field(key: "SupportedInstanceTypes")]
        getter supported_instance_types : Array(Types::SupportedInstanceType)?

        def initialize(
          @marker : String? = nil,
          @supported_instance_types : Array(Types::SupportedInstanceType)? = nil
        )
        end
      end

      # Managed scaling policy for an Amazon EMR cluster. The policy specifies the limits for resources that
      # can be added or terminated from a cluster. The policy only applies to the core and task nodes. The
      # master node cannot be scaled after initial configuration.

      struct ManagedScalingPolicy
        include JSON::Serializable

        # The Amazon EC2 unit limits for a managed scaling policy. The managed scaling activity of a cluster
        # is not allowed to go above or below these limits. The limit only applies to the core and task nodes.
        # The master node cannot be scaled after initial configuration.

        @[JSON::Field(key: "ComputeLimits")]
        getter compute_limits : Types::ComputeLimits?

        # Determines whether a custom scaling utilization performance index can be set. Possible values
        # include ADVANCED or DEFAULT .

        @[JSON::Field(key: "ScalingStrategy")]
        getter scaling_strategy : String?

        # An integer value that represents an advanced scaling strategy. Setting a higher value optimizes for
        # performance. Setting a lower value optimizes for resource conservation. Setting the value to 50
        # balances performance and resource conservation. Possible values are 1, 25, 50, 75, and 100.

        @[JSON::Field(key: "UtilizationPerformanceIndex")]
        getter utilization_performance_index : Int32?

        def initialize(
          @compute_limits : Types::ComputeLimits? = nil,
          @scaling_strategy : String? = nil,
          @utilization_performance_index : Int32? = nil
        )
        end
      end

      # A CloudWatch dimension, which is specified using a Key (known as a Name in CloudWatch), Value pair.
      # By default, Amazon EMR uses one dimension whose Key is JobFlowID and Value is a variable
      # representing the cluster ID, which is ${emr.clusterId} . This enables the rule to bootstrap when the
      # cluster ID becomes available.

      struct MetricDimension
        include JSON::Serializable

        # The dimension name.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The dimension value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct ModifyClusterInput
        include JSON::Serializable

        # The unique identifier of the cluster.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # Reserved.

        @[JSON::Field(key: "ExtendedSupport")]
        getter extended_support : Bool?

        # The number of steps that can be executed concurrently. You can specify a minimum of 1 step and a
        # maximum of 256 steps. We recommend that you do not change this parameter while steps are running or
        # the ActionOnFailure setting may not behave as expected. For more information see
        # Step$ActionOnFailure .

        @[JSON::Field(key: "StepConcurrencyLevel")]
        getter step_concurrency_level : Int32?

        def initialize(
          @cluster_id : String,
          @extended_support : Bool? = nil,
          @step_concurrency_level : Int32? = nil
        )
        end
      end


      struct ModifyClusterOutput
        include JSON::Serializable

        # Reserved.

        @[JSON::Field(key: "ExtendedSupport")]
        getter extended_support : Bool?

        # The number of steps that can be executed concurrently.

        @[JSON::Field(key: "StepConcurrencyLevel")]
        getter step_concurrency_level : Int32?

        def initialize(
          @extended_support : Bool? = nil,
          @step_concurrency_level : Int32? = nil
        )
        end
      end


      struct ModifyInstanceFleetInput
        include JSON::Serializable

        # The unique identifier of the cluster.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The configuration parameters of the instance fleet.

        @[JSON::Field(key: "InstanceFleet")]
        getter instance_fleet : Types::InstanceFleetModifyConfig

        def initialize(
          @cluster_id : String,
          @instance_fleet : Types::InstanceFleetModifyConfig
        )
        end
      end

      # Change the size of some instance groups.

      struct ModifyInstanceGroupsInput
        include JSON::Serializable

        # The ID of the cluster to which the instance group belongs.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String?

        # Instance groups to change.

        @[JSON::Field(key: "InstanceGroups")]
        getter instance_groups : Array(Types::InstanceGroupModifyConfig)?

        def initialize(
          @cluster_id : String? = nil,
          @instance_groups : Array(Types::InstanceGroupModifyConfig)? = nil
        )
        end
      end

      # Contains CloudWatch log configuration metadata and settings.

      struct MonitoringConfiguration
        include JSON::Serializable

        # CloudWatch log configuration settings and metadata that specify settings like log files to monitor
        # and where to send them.

        @[JSON::Field(key: "CloudWatchLogConfiguration")]
        getter cloud_watch_log_configuration : Types::CloudWatchLogConfiguration?

        def initialize(
          @cloud_watch_log_configuration : Types::CloudWatchLogConfiguration? = nil
        )
        end
      end

      # A notebook execution. An execution is a specific instance that an Amazon EMR Notebook is run using
      # the StartNotebookExecution action.

      struct NotebookExecution
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the notebook execution.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier of the Amazon EMR Notebook that is used for the notebook execution.

        @[JSON::Field(key: "EditorId")]
        getter editor_id : String?

        # The timestamp when notebook execution ended.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The environment variables associated with the notebook execution.

        @[JSON::Field(key: "EnvironmentVariables")]
        getter environment_variables : Hash(String, String)?

        # The execution engine, such as an Amazon EMR cluster, used to run the Amazon EMR notebook and perform
        # the notebook execution.

        @[JSON::Field(key: "ExecutionEngine")]
        getter execution_engine : Types::ExecutionEngineConfig?

        # The reason for the latest status change of the notebook execution.

        @[JSON::Field(key: "LastStateChangeReason")]
        getter last_state_change_reason : String?

        # The unique identifier of a notebook execution.

        @[JSON::Field(key: "NotebookExecutionId")]
        getter notebook_execution_id : String?

        # A name for the notebook execution.

        @[JSON::Field(key: "NotebookExecutionName")]
        getter notebook_execution_name : String?

        # The unique identifier of the Amazon EC2 security group associated with the Amazon EMR Notebook
        # instance. For more information see Specifying Amazon EC2 Security Groups for Amazon EMR Notebooks in
        # the Amazon EMR Management Guide .

        @[JSON::Field(key: "NotebookInstanceSecurityGroupId")]
        getter notebook_instance_security_group_id : String?

        # Input parameters in JSON format passed to the Amazon EMR Notebook at runtime for execution.

        @[JSON::Field(key: "NotebookParams")]
        getter notebook_params : String?

        # The Amazon S3 location that stores the notebook execution input.

        @[JSON::Field(key: "NotebookS3Location")]
        getter notebook_s3_location : Types::NotebookS3LocationForOutput?

        # The output format for the notebook execution.

        @[JSON::Field(key: "OutputNotebookFormat")]
        getter output_notebook_format : String?

        # The Amazon S3 location for the notebook execution output.

        @[JSON::Field(key: "OutputNotebookS3Location")]
        getter output_notebook_s3_location : Types::OutputNotebookS3LocationForOutput?

        # The location of the notebook execution's output file in Amazon S3.

        @[JSON::Field(key: "OutputNotebookURI")]
        getter output_notebook_uri : String?

        # The timestamp when notebook execution started.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the notebook execution. START_PENDING indicates that the cluster has received the
        # execution request but execution has not begun. STARTING indicates that the execution is starting on
        # the cluster. RUNNING indicates that the execution is being processed by the cluster. FINISHING
        # indicates that execution processing is in the final stages. FINISHED indicates that the execution
        # has completed without error. FAILING indicates that the execution is failing and will not finish
        # successfully. FAILED indicates that the execution failed. STOP_PENDING indicates that the cluster
        # has received a StopNotebookExecution request and the stop is pending. STOPPING indicates that the
        # cluster is in the process of stopping the execution as a result of a StopNotebookExecution request.
        # STOPPED indicates that the execution stopped because of a StopNotebookExecution request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A list of tags associated with a notebook execution. Tags are user-defined key-value pairs that
        # consist of a required key string with a maximum of 128 characters and an optional value string with
        # a maximum of 256 characters.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @editor_id : String? = nil,
          @end_time : Time? = nil,
          @environment_variables : Hash(String, String)? = nil,
          @execution_engine : Types::ExecutionEngineConfig? = nil,
          @last_state_change_reason : String? = nil,
          @notebook_execution_id : String? = nil,
          @notebook_execution_name : String? = nil,
          @notebook_instance_security_group_id : String? = nil,
          @notebook_params : String? = nil,
          @notebook_s3_location : Types::NotebookS3LocationForOutput? = nil,
          @output_notebook_format : String? = nil,
          @output_notebook_s3_location : Types::OutputNotebookS3LocationForOutput? = nil,
          @output_notebook_uri : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Details for a notebook execution. The details include information such as the unique ID and status
      # of the notebook execution.

      struct NotebookExecutionSummary
        include JSON::Serializable

        # The unique identifier of the editor associated with the notebook execution.

        @[JSON::Field(key: "EditorId")]
        getter editor_id : String?

        # The timestamp when notebook execution started.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The unique ID of the execution engine for the notebook execution.

        @[JSON::Field(key: "ExecutionEngineId")]
        getter execution_engine_id : String?

        # The unique identifier of the notebook execution.

        @[JSON::Field(key: "NotebookExecutionId")]
        getter notebook_execution_id : String?

        # The name of the notebook execution.

        @[JSON::Field(key: "NotebookExecutionName")]
        getter notebook_execution_name : String?

        # The Amazon S3 location that stores the notebook execution input.

        @[JSON::Field(key: "NotebookS3Location")]
        getter notebook_s3_location : Types::NotebookS3LocationForOutput?

        # The timestamp when notebook execution started.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the notebook execution. START_PENDING indicates that the cluster has received the
        # execution request but execution has not begun. STARTING indicates that the execution is starting on
        # the cluster. RUNNING indicates that the execution is being processed by the cluster. FINISHING
        # indicates that execution processing is in the final stages. FINISHED indicates that the execution
        # has completed without error. FAILING indicates that the execution is failing and will not finish
        # successfully. FAILED indicates that the execution failed. STOP_PENDING indicates that the cluster
        # has received a StopNotebookExecution request and the stop is pending. STOPPING indicates that the
        # cluster is in the process of stopping the execution as a result of a StopNotebookExecution request.
        # STOPPED indicates that the execution stopped because of a StopNotebookExecution request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @editor_id : String? = nil,
          @end_time : Time? = nil,
          @execution_engine_id : String? = nil,
          @notebook_execution_id : String? = nil,
          @notebook_execution_name : String? = nil,
          @notebook_s3_location : Types::NotebookS3LocationForOutput? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # The Amazon S3 location that stores the notebook execution input.

      struct NotebookS3LocationForOutput
        include JSON::Serializable

        # The Amazon S3 bucket that stores the notebook execution input.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The key to the Amazon S3 location that stores the notebook execution input.

        @[JSON::Field(key: "Key")]
        getter key : String?

        def initialize(
          @bucket : String? = nil,
          @key : String? = nil
        )
        end
      end

      # The Amazon S3 location that stores the notebook execution input.

      struct NotebookS3LocationFromInput
        include JSON::Serializable

        # The Amazon S3 bucket that stores the notebook execution input.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The key to the Amazon S3 location that stores the notebook execution input.

        @[JSON::Field(key: "Key")]
        getter key : String?

        def initialize(
          @bucket : String? = nil,
          @key : String? = nil
        )
        end
      end

      # The Amazon Linux release specified for a cluster in the RunJobFlow request.

      struct OSRelease
        include JSON::Serializable

        # The Amazon Linux release specified for a cluster in the RunJobFlow request. The format is as shown
        # in Amazon Linux 2 Release Notes . For example, 2.0.20220218.1.

        @[JSON::Field(key: "Label")]
        getter label : String?

        def initialize(
          @label : String? = nil
        )
        end
      end

      # Describes the strategy for using unused Capacity Reservations for fulfilling On-Demand capacity.

      struct OnDemandCapacityReservationOptions
        include JSON::Serializable

        # Indicates the instance's Capacity Reservation preferences. Possible preferences include: open - The
        # instance can run in any open Capacity Reservation that has matching attributes (instance type,
        # platform, Availability Zone). none - The instance avoids running in a Capacity Reservation even if
        # one is available. The instance runs as an On-Demand Instance.

        @[JSON::Field(key: "CapacityReservationPreference")]
        getter capacity_reservation_preference : String?

        # The ARN of the Capacity Reservation resource group in which to run the instance.

        @[JSON::Field(key: "CapacityReservationResourceGroupArn")]
        getter capacity_reservation_resource_group_arn : String?

        # Indicates whether to use unused Capacity Reservations for fulfilling On-Demand capacity. If you
        # specify use-capacity-reservations-first , the fleet uses unused Capacity Reservations to fulfill
        # On-Demand capacity up to the target On-Demand capacity. If multiple instance pools have unused
        # Capacity Reservations, the On-Demand allocation strategy ( lowest-price ) is applied. If the number
        # of unused Capacity Reservations is less than the On-Demand target capacity, the remaining On-Demand
        # target capacity is launched according to the On-Demand allocation strategy ( lowest-price ). If you
        # do not specify a value, the fleet fulfills the On-Demand capacity according to the chosen On-Demand
        # allocation strategy.

        @[JSON::Field(key: "UsageStrategy")]
        getter usage_strategy : String?

        def initialize(
          @capacity_reservation_preference : String? = nil,
          @capacity_reservation_resource_group_arn : String? = nil,
          @usage_strategy : String? = nil
        )
        end
      end

      # The launch specification for On-Demand Instances in the instance fleet, which determines the
      # allocation strategy. The instance fleet configuration is available only in Amazon EMR releases 4.8.0
      # and later, excluding 5.0.x versions. On-Demand Instances allocation strategy is available in Amazon
      # EMR releases 5.12.1 and later.

      struct OnDemandProvisioningSpecification
        include JSON::Serializable

        # Specifies the strategy to use in launching On-Demand instance fleets. Available options are
        # lowest-price and prioritized . lowest-price specifies to launch the instances with the lowest price
        # first, and prioritized specifies that Amazon EMR should launch the instances with the highest
        # priority first. The default is lowest-price .

        @[JSON::Field(key: "AllocationStrategy")]
        getter allocation_strategy : String

        # The launch specification for On-Demand instances in the instance fleet, which determines the
        # allocation strategy.

        @[JSON::Field(key: "CapacityReservationOptions")]
        getter capacity_reservation_options : Types::OnDemandCapacityReservationOptions?

        def initialize(
          @allocation_strategy : String,
          @capacity_reservation_options : Types::OnDemandCapacityReservationOptions? = nil
        )
        end
      end

      # The resize specification for On-Demand Instances in the instance fleet, which contains the resize
      # timeout period.

      struct OnDemandResizingSpecification
        include JSON::Serializable

        # Specifies the allocation strategy to use to launch On-Demand instances during a resize. The default
        # is lowest-price .

        @[JSON::Field(key: "AllocationStrategy")]
        getter allocation_strategy : String?


        @[JSON::Field(key: "CapacityReservationOptions")]
        getter capacity_reservation_options : Types::OnDemandCapacityReservationOptions?

        # On-Demand resize timeout in minutes. If On-Demand Instances are not provisioned within this time,
        # the resize workflow stops. The minimum value is 5 minutes, and the maximum value is 10,080 minutes
        # (7 days). The timeout applies to all resize workflows on the Instance Fleet. The resize could be
        # triggered by Amazon EMR Managed Scaling or by the customer (via Amazon EMR Console, Amazon EMR CLI
        # modify-instance-fleet or Amazon EMR SDK ModifyInstanceFleet API) or by Amazon EMR due to Amazon EC2
        # Spot Reclamation.

        @[JSON::Field(key: "TimeoutDurationMinutes")]
        getter timeout_duration_minutes : Int32?

        def initialize(
          @allocation_strategy : String? = nil,
          @capacity_reservation_options : Types::OnDemandCapacityReservationOptions? = nil,
          @timeout_duration_minutes : Int32? = nil
        )
        end
      end

      # The Amazon S3 location that stores the notebook execution output.

      struct OutputNotebookS3LocationForOutput
        include JSON::Serializable

        # The Amazon S3 bucket that stores the notebook execution output.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The key to the Amazon S3 location that stores the notebook execution output.

        @[JSON::Field(key: "Key")]
        getter key : String?

        def initialize(
          @bucket : String? = nil,
          @key : String? = nil
        )
        end
      end

      # The Amazon S3 location that stores the notebook execution output.

      struct OutputNotebookS3LocationFromInput
        include JSON::Serializable

        # The Amazon S3 bucket that stores the notebook execution output.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The key to the Amazon S3 location that stores the notebook execution output.

        @[JSON::Field(key: "Key")]
        getter key : String?

        def initialize(
          @bucket : String? = nil,
          @key : String? = nil
        )
        end
      end

      # Holds persistent application user interface information. Applications installed on the Amazon EMR
      # cluster publish user interfaces as web sites to monitor cluster activity.

      struct PersistentAppUI
        include JSON::Serializable

        # The author ID for the persistent application user interface object.

        @[JSON::Field(key: "AuthorId")]
        getter author_id : String?

        # The creation date and time for the persistent application user interface object.

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The date and time the persistent application user interface object was last changed.

        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The reason the persistent application user interface object was last changed.

        @[JSON::Field(key: "LastStateChangeReason")]
        getter last_state_change_reason : String?

        # The identifier for the persistent application user interface object.

        @[JSON::Field(key: "PersistentAppUIId")]
        getter persistent_app_ui_id : String?

        # The status for the persistent application user interface object.

        @[JSON::Field(key: "PersistentAppUIStatus")]
        getter persistent_app_ui_status : String?

        # The type list for the persistent application user interface object. Valid values include SHS, YTS,
        # or TEZ.

        @[JSON::Field(key: "PersistentAppUITypeList")]
        getter persistent_app_ui_type_list : Array(String)?

        # A collection of tags for the persistent application user interface object.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @author_id : String? = nil,
          @creation_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @last_state_change_reason : String? = nil,
          @persistent_app_ui_id : String? = nil,
          @persistent_app_ui_status : String? = nil,
          @persistent_app_ui_type_list : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Placement group configuration for an Amazon EMR cluster. The configuration specifies the placement
      # strategy that can be applied to instance roles during cluster creation. To use this configuration,
      # consider attaching managed policy AmazonElasticMapReducePlacementGroupPolicy to the Amazon EMR role.

      struct PlacementGroupConfig
        include JSON::Serializable

        # Role of the instance in the cluster. Starting with Amazon EMR release 5.23.0, the only supported
        # instance role is MASTER .

        @[JSON::Field(key: "InstanceRole")]
        getter instance_role : String

        # Amazon EC2 Placement Group strategy associated with instance role. Starting with Amazon EMR release
        # 5.23.0, the only supported placement strategy is SPREAD for the MASTER instance role.

        @[JSON::Field(key: "PlacementStrategy")]
        getter placement_strategy : String?

        def initialize(
          @instance_role : String,
          @placement_strategy : String? = nil
        )
        end
      end

      # The Amazon EC2 Availability Zone configuration of the cluster (job flow).

      struct PlacementType
        include JSON::Serializable

        # The Amazon EC2 Availability Zone for the cluster. AvailabilityZone is used for uniform instance
        # groups, while AvailabilityZones (plural) is used for instance fleets.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # When multiple Availability Zones are specified, Amazon EMR evaluates them and launches instances in
        # the optimal Availability Zone. AvailabilityZones is used for instance fleets, while AvailabilityZone
        # (singular) is used for uniform instance groups. The instance fleet configuration is available only
        # in Amazon EMR releases 4.8.0 and later, excluding 5.0.x versions.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        def initialize(
          @availability_zone : String? = nil,
          @availability_zones : Array(String)? = nil
        )
        end
      end

      # A list of port ranges that are permitted to allow inbound traffic from all public IP addresses. To
      # specify a single port, use the same value for MinRange and MaxRange .

      struct PortRange
        include JSON::Serializable

        # The smallest port number in a specified range of port numbers.

        @[JSON::Field(key: "MinRange")]
        getter min_range : Int32

        # The smallest port number in a specified range of port numbers.

        @[JSON::Field(key: "MaxRange")]
        getter max_range : Int32?

        def initialize(
          @min_range : Int32,
          @max_range : Int32? = nil
        )
        end
      end


      struct PutAutoScalingPolicyInput
        include JSON::Serializable

        # Specifies the definition of the automatic scaling policy.

        @[JSON::Field(key: "AutoScalingPolicy")]
        getter auto_scaling_policy : Types::AutoScalingPolicy

        # Specifies the ID of a cluster. The instance group to which the automatic scaling policy is applied
        # is within this cluster.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # Specifies the ID of the instance group to which the automatic scaling policy is applied.

        @[JSON::Field(key: "InstanceGroupId")]
        getter instance_group_id : String

        def initialize(
          @auto_scaling_policy : Types::AutoScalingPolicy,
          @cluster_id : String,
          @instance_group_id : String
        )
        end
      end


      struct PutAutoScalingPolicyOutput
        include JSON::Serializable

        # The automatic scaling policy definition.

        @[JSON::Field(key: "AutoScalingPolicy")]
        getter auto_scaling_policy : Types::AutoScalingPolicyDescription?

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String?

        # Specifies the ID of a cluster. The instance group to which the automatic scaling policy is applied
        # is within this cluster.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String?

        # Specifies the ID of the instance group to which the scaling policy is applied.

        @[JSON::Field(key: "InstanceGroupId")]
        getter instance_group_id : String?

        def initialize(
          @auto_scaling_policy : Types::AutoScalingPolicyDescription? = nil,
          @cluster_arn : String? = nil,
          @cluster_id : String? = nil,
          @instance_group_id : String? = nil
        )
        end
      end


      struct PutAutoTerminationPolicyInput
        include JSON::Serializable

        # Specifies the ID of the Amazon EMR cluster to which the auto-termination policy will be attached.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # Specifies the auto-termination policy to attach to the cluster.

        @[JSON::Field(key: "AutoTerminationPolicy")]
        getter auto_termination_policy : Types::AutoTerminationPolicy?

        def initialize(
          @cluster_id : String,
          @auto_termination_policy : Types::AutoTerminationPolicy? = nil
        )
        end
      end


      struct PutAutoTerminationPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct PutBlockPublicAccessConfigurationInput
        include JSON::Serializable

        # A configuration for Amazon EMR block public access. The configuration applies to all clusters
        # created in your account for the current Region. The configuration specifies whether block public
        # access is enabled. If block public access is enabled, security groups associated with the cluster
        # cannot have rules that allow inbound traffic from 0.0.0.0/0 or ::/0 on a port, unless the port is
        # specified as an exception using PermittedPublicSecurityGroupRuleRanges in the
        # BlockPublicAccessConfiguration . By default, Port 22 (SSH) is an exception, and public access is
        # allowed on this port. You can change this by updating BlockPublicSecurityGroupRules to remove the
        # exception. For accounts that created clusters in a Region before November 25, 2019, block public
        # access is disabled by default in that Region. To use this feature, you must manually enable and
        # configure it. For accounts that did not create an Amazon EMR cluster in a Region before this date,
        # block public access is enabled by default in that Region.

        @[JSON::Field(key: "BlockPublicAccessConfiguration")]
        getter block_public_access_configuration : Types::BlockPublicAccessConfiguration

        def initialize(
          @block_public_access_configuration : Types::BlockPublicAccessConfiguration
        )
        end
      end


      struct PutBlockPublicAccessConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct PutManagedScalingPolicyInput
        include JSON::Serializable

        # Specifies the ID of an Amazon EMR cluster where the managed scaling policy is attached.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # Specifies the constraints for the managed scaling policy.

        @[JSON::Field(key: "ManagedScalingPolicy")]
        getter managed_scaling_policy : Types::ManagedScalingPolicy

        def initialize(
          @cluster_id : String,
          @managed_scaling_policy : Types::ManagedScalingPolicy
        )
        end
      end


      struct PutManagedScalingPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The release label filters by application or version prefix.

      struct ReleaseLabelFilter
        include JSON::Serializable

        # Optional release label application filter. For example, spark@2.1.0 .

        @[JSON::Field(key: "Application")]
        getter application : String?

        # Optional release label version prefix filter. For example, emr-5 .

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @application : String? = nil,
          @prefix : String? = nil
        )
        end
      end


      struct RemoveAutoScalingPolicyInput
        include JSON::Serializable

        # Specifies the ID of a cluster. The instance group to which the automatic scaling policy is applied
        # is within this cluster.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # Specifies the ID of the instance group to which the scaling policy is applied.

        @[JSON::Field(key: "InstanceGroupId")]
        getter instance_group_id : String

        def initialize(
          @cluster_id : String,
          @instance_group_id : String
        )
        end
      end


      struct RemoveAutoScalingPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct RemoveAutoTerminationPolicyInput
        include JSON::Serializable

        # Specifies the ID of the Amazon EMR cluster from which the auto-termination policy will be removed.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        def initialize(
          @cluster_id : String
        )
        end
      end


      struct RemoveAutoTerminationPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct RemoveManagedScalingPolicyInput
        include JSON::Serializable

        # Specifies the ID of the cluster from which the managed scaling policy will be removed.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        def initialize(
          @cluster_id : String
        )
        end
      end


      struct RemoveManagedScalingPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end

      # This input identifies an Amazon EMR resource and a list of tags to remove.

      struct RemoveTagsInput
        include JSON::Serializable

        # The Amazon EMR resource identifier from which tags will be removed. For example, a cluster
        # identifier or an Amazon EMR Studio ID.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # A list of tag keys to remove from the resource.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_id : String,
          @tag_keys : Array(String)
        )
        end
      end

      # This output indicates the result of removing tags from the resource.

      struct RemoveTagsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Input to the RunJobFlow operation.

      struct RunJobFlowInput
        include JSON::Serializable

        # A specification of the number and type of Amazon EC2 instances.

        @[JSON::Field(key: "Instances")]
        getter instances : Types::JobFlowInstancesConfig

        # The name of the job flow.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A JSON string for selecting additional features.

        @[JSON::Field(key: "AdditionalInfo")]
        getter additional_info : String?

        # Applies only to Amazon EMR AMI versions 3.x and 2.x. For Amazon EMR releases 4.0 and later,
        # ReleaseLabel is used. To specify a custom AMI, use CustomAmiID .

        @[JSON::Field(key: "AmiVersion")]
        getter ami_version : String?

        # Applies to Amazon EMR releases 4.0 and later. A case-insensitive list of applications for Amazon EMR
        # to install and configure when launching the cluster. For a list of applications available for each
        # Amazon EMR release version, see the Amazon EMRRelease Guide .

        @[JSON::Field(key: "Applications")]
        getter applications : Array(Types::Application)?

        # An IAM role for automatic scaling policies. The default role is EMR_AutoScaling_DefaultRole . The
        # IAM role provides permissions that the automatic scaling feature requires to launch and terminate
        # Amazon EC2 instances in an instance group.

        @[JSON::Field(key: "AutoScalingRole")]
        getter auto_scaling_role : String?


        @[JSON::Field(key: "AutoTerminationPolicy")]
        getter auto_termination_policy : Types::AutoTerminationPolicy?

        # A list of bootstrap actions to run before Hadoop starts on the cluster nodes.

        @[JSON::Field(key: "BootstrapActions")]
        getter bootstrap_actions : Array(Types::BootstrapActionConfig)?

        # For Amazon EMR releases 4.0 and later. The list of configurations supplied for the Amazon EMR
        # cluster that you are creating.

        @[JSON::Field(key: "Configurations")]
        getter configurations : Array(Types::Configuration)?

        # Available only in Amazon EMR releases 5.7.0 and later. The ID of a custom Amazon EBS-backed Linux
        # AMI. If specified, Amazon EMR uses this AMI when it launches cluster Amazon EC2 instances. For more
        # information about custom AMIs in Amazon EMR, see Using a Custom AMI in the Amazon EMR Management
        # Guide . If omitted, the cluster uses the base Linux AMI for the ReleaseLabel specified. For Amazon
        # EMR releases 2.x and 3.x, use AmiVersion instead. For information about creating a custom AMI, see
        # Creating an Amazon EBS-Backed Linux AMI in the Amazon Elastic Compute Cloud User Guide for Linux
        # Instances . For information about finding an AMI ID, see Finding a Linux AMI .

        @[JSON::Field(key: "CustomAmiId")]
        getter custom_ami_id : String?

        # The IOPS, of the Amazon EBS root device volume of the Linux AMI that is used for each Amazon EC2
        # instance. Available in Amazon EMR releases 6.15.0 and later.

        @[JSON::Field(key: "EbsRootVolumeIops")]
        getter ebs_root_volume_iops : Int32?

        # The size, in GiB, of the Amazon EBS root device volume of the Linux AMI that is used for each Amazon
        # EC2 instance. Available in Amazon EMR releases 4.x and later.

        @[JSON::Field(key: "EbsRootVolumeSize")]
        getter ebs_root_volume_size : Int32?

        # The throughput, in MiB/s, of the Amazon EBS root device volume of the Linux AMI that is used for
        # each Amazon EC2 instance. Available in Amazon EMR releases 6.15.0 and later.

        @[JSON::Field(key: "EbsRootVolumeThroughput")]
        getter ebs_root_volume_throughput : Int32?

        # Reserved.

        @[JSON::Field(key: "ExtendedSupport")]
        getter extended_support : Bool?

        # Also called instance profile and Amazon EC2 role. An IAM role for an Amazon EMR cluster. The Amazon
        # EC2 instances of the cluster assume this role. The default role is EMR_EC2_DefaultRole . In order to
        # use the default role, you must have already created it using the CLI or console.

        @[JSON::Field(key: "JobFlowRole")]
        getter job_flow_role : String?

        # Attributes for Kerberos configuration when Kerberos authentication is enabled using a security
        # configuration. For more information see Use Kerberos Authentication in the Amazon EMR Management
        # Guide .

        @[JSON::Field(key: "KerberosAttributes")]
        getter kerberos_attributes : Types::KerberosAttributes?

        # The KMS key used for encrypting log files. If a value is not provided, the logs remain encrypted by
        # AES-256. This attribute is only available with Amazon EMR releases 5.30.0 and later, excluding
        # Amazon EMR 6.0.0.

        @[JSON::Field(key: "LogEncryptionKmsKeyId")]
        getter log_encryption_kms_key_id : String?

        # The location in Amazon S3 to write the log files of the job flow. If a value is not provided, logs
        # are not created.

        @[JSON::Field(key: "LogUri")]
        getter log_uri : String?

        # The specified managed scaling policy for an Amazon EMR cluster.

        @[JSON::Field(key: "ManagedScalingPolicy")]
        getter managed_scaling_policy : Types::ManagedScalingPolicy?

        # Contains CloudWatch log configuration metadata and settings.

        @[JSON::Field(key: "MonitoringConfiguration")]
        getter monitoring_configuration : Types::MonitoringConfiguration?

        # For Amazon EMR releases 3.x and 2.x. For Amazon EMR releases 4.x and later, use Applications. A list
        # of strings that indicates third-party software to use with the job flow that accepts a user argument
        # list. Amazon EMR accepts and forwards the argument list to the corresponding installation script as
        # bootstrap action arguments. For more information, see "Launch a Job Flow on the MapR Distribution
        # for Hadoop" in the Amazon EMR Developer Guide . Supported values are: "mapr-m3" - launch the cluster
        # using MapR M3 Edition. "mapr-m5" - launch the cluster using MapR M5 Edition. "mapr" with the user
        # arguments specifying "--edition,m3" or "--edition,m5" - launch the job flow using MapR M3 or M5
        # Edition respectively. "mapr-m7" - launch the cluster using MapR M7 Edition. "hunk" - launch the
        # cluster with the Hunk Big Data Analytics Platform. "hue"- launch the cluster with Hue installed.
        # "spark" - launch the cluster with Apache Spark installed. "ganglia" - launch the cluster with the
        # Ganglia Monitoring System installed.

        @[JSON::Field(key: "NewSupportedProducts")]
        getter new_supported_products : Array(Types::SupportedProductConfig)?

        # Specifies a particular Amazon Linux release for all nodes in a cluster launch RunJobFlow request. If
        # a release is not specified, Amazon EMR uses the latest validated Amazon Linux release for cluster
        # launch.

        @[JSON::Field(key: "OSReleaseLabel")]
        getter os_release_label : String?

        # The specified placement group configuration for an Amazon EMR cluster.

        @[JSON::Field(key: "PlacementGroupConfigs")]
        getter placement_group_configs : Array(Types::PlacementGroupConfig)?

        # The Amazon EMR release label, which determines the version of open-source application packages
        # installed on the cluster. Release labels are in the form emr-x.x.x , where x.x.x is an Amazon EMR
        # release version such as emr-5.14.0 . For more information about Amazon EMR release versions and
        # included application versions and features, see https://docs.aws.amazon.com/emr/latest/ReleaseGuide/
        # . The release label applies only to Amazon EMR releases version 4.0 and later. Earlier versions use
        # AmiVersion .

        @[JSON::Field(key: "ReleaseLabel")]
        getter release_label : String?

        # Applies only when CustomAmiID is used. Specifies which updates from the Amazon Linux AMI package
        # repositories to apply automatically when the instance boots using the AMI. If omitted, the default
        # is SECURITY , which indicates that only security updates are applied. If NONE is specified, no
        # updates are applied, and all updates must be applied manually.

        @[JSON::Field(key: "RepoUpgradeOnBoot")]
        getter repo_upgrade_on_boot : String?

        # Specifies the way that individual Amazon EC2 instances terminate when an automatic scale-in activity
        # occurs or an instance group is resized. TERMINATE_AT_INSTANCE_HOUR indicates that Amazon EMR
        # terminates nodes at the instance-hour boundary, regardless of when the request to terminate the
        # instance was submitted. This option is only available with Amazon EMR 5.1.0 and later and is the
        # default for clusters created using that version. TERMINATE_AT_TASK_COMPLETION indicates that Amazon
        # EMR adds nodes to a deny list and drains tasks from nodes before terminating the Amazon EC2
        # instances, regardless of the instance-hour boundary. With either behavior, Amazon EMR removes the
        # least active nodes first and blocks instance termination if it could lead to HDFS corruption.
        # TERMINATE_AT_TASK_COMPLETION available only in Amazon EMR releases 4.1.0 and later, and is the
        # default for releases of Amazon EMR earlier than 5.1.0.

        @[JSON::Field(key: "ScaleDownBehavior")]
        getter scale_down_behavior : String?

        # The name of a security configuration to apply to the cluster.

        @[JSON::Field(key: "SecurityConfiguration")]
        getter security_configuration : String?

        # The IAM role that Amazon EMR assumes in order to access Amazon Web Services resources on your
        # behalf. If you've created a custom service role path, you must specify it for the service role when
        # you launch your cluster.

        @[JSON::Field(key: "ServiceRole")]
        getter service_role : String?

        # Specifies the number of steps that can be executed concurrently. The default value is 1 . The
        # maximum value is 256 .

        @[JSON::Field(key: "StepConcurrencyLevel")]
        getter step_concurrency_level : Int32?

        # A list of steps to run.

        @[JSON::Field(key: "Steps")]
        getter steps : Array(Types::StepConfig)?

        # For Amazon EMR releases 3.x and 2.x. For Amazon EMR releases 4.x and later, use Applications. A list
        # of strings that indicates third-party software to use. For more information, see the Amazon EMR
        # Developer Guide . Currently supported values are: "mapr-m3" - launch the job flow using MapR M3
        # Edition. "mapr-m5" - launch the job flow using MapR M5 Edition.

        @[JSON::Field(key: "SupportedProducts")]
        getter supported_products : Array(String)?

        # A list of tags to associate with a cluster and propagate to Amazon EC2 instances.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The VisibleToAllUsers parameter is no longer supported. By default, the value is set to true .
        # Setting it to false now has no effect. Set this value to true so that IAM principals in the Amazon
        # Web Services account associated with the cluster can perform Amazon EMR actions on the cluster that
        # their IAM policies allow. This value defaults to true for clusters created using the Amazon EMR API
        # or the CLI create-cluster command. When set to false , only the IAM principal that created the
        # cluster and the Amazon Web Services account root user can perform Amazon EMR actions for the
        # cluster, regardless of the IAM permissions policies attached to other IAM principals. For more
        # information, see Understanding the Amazon EMR cluster VisibleToAllUsers setting in the Amazon EMR
        # Management Guide .

        @[JSON::Field(key: "VisibleToAllUsers")]
        getter visible_to_all_users : Bool?

        def initialize(
          @instances : Types::JobFlowInstancesConfig,
          @name : String,
          @additional_info : String? = nil,
          @ami_version : String? = nil,
          @applications : Array(Types::Application)? = nil,
          @auto_scaling_role : String? = nil,
          @auto_termination_policy : Types::AutoTerminationPolicy? = nil,
          @bootstrap_actions : Array(Types::BootstrapActionConfig)? = nil,
          @configurations : Array(Types::Configuration)? = nil,
          @custom_ami_id : String? = nil,
          @ebs_root_volume_iops : Int32? = nil,
          @ebs_root_volume_size : Int32? = nil,
          @ebs_root_volume_throughput : Int32? = nil,
          @extended_support : Bool? = nil,
          @job_flow_role : String? = nil,
          @kerberos_attributes : Types::KerberosAttributes? = nil,
          @log_encryption_kms_key_id : String? = nil,
          @log_uri : String? = nil,
          @managed_scaling_policy : Types::ManagedScalingPolicy? = nil,
          @monitoring_configuration : Types::MonitoringConfiguration? = nil,
          @new_supported_products : Array(Types::SupportedProductConfig)? = nil,
          @os_release_label : String? = nil,
          @placement_group_configs : Array(Types::PlacementGroupConfig)? = nil,
          @release_label : String? = nil,
          @repo_upgrade_on_boot : String? = nil,
          @scale_down_behavior : String? = nil,
          @security_configuration : String? = nil,
          @service_role : String? = nil,
          @step_concurrency_level : Int32? = nil,
          @steps : Array(Types::StepConfig)? = nil,
          @supported_products : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @visible_to_all_users : Bool? = nil
        )
        end
      end

      # The result of the RunJobFlow operation.

      struct RunJobFlowOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String?

        # A unique identifier for the job flow.

        @[JSON::Field(key: "JobFlowId")]
        getter job_flow_id : String?

        def initialize(
          @cluster_arn : String? = nil,
          @job_flow_id : String? = nil
        )
        end
      end

      # The Amazon S3 configuration for monitoring log publishing. You can configure your step to send log
      # information to Amazon S3. When it's specified, it takes precedence over the cluster's logging
      # configuration. If you don't specify this configuration entirely, or omit individual fields, EMR
      # falls back to cluster-level logging behavior.

      struct S3MonitoringConfiguration
        include JSON::Serializable

        # The KMS key ARN to encrypt the logs published to the given Amazon S3 destination.

        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The Amazon S3 destination URI for log publishing.

        @[JSON::Field(key: "LogUri")]
        getter log_uri : String?

        def initialize(
          @encryption_key_arn : String? = nil,
          @log_uri : String? = nil
        )
        end
      end

      # The type of adjustment the automatic scaling activity makes when triggered, and the periodicity of
      # the adjustment.

      struct ScalingAction
        include JSON::Serializable

        # The type of adjustment the automatic scaling activity makes when triggered, and the periodicity of
        # the adjustment.

        @[JSON::Field(key: "SimpleScalingPolicyConfiguration")]
        getter simple_scaling_policy_configuration : Types::SimpleScalingPolicyConfiguration

        # Not available for instance groups. Instance groups use the market type specified for the group.

        @[JSON::Field(key: "Market")]
        getter market : String?

        def initialize(
          @simple_scaling_policy_configuration : Types::SimpleScalingPolicyConfiguration,
          @market : String? = nil
        )
        end
      end

      # The upper and lower Amazon EC2 instance limits for an automatic scaling policy. Automatic scaling
      # activities triggered by automatic scaling rules will not cause an instance group to grow above or
      # below these limits.

      struct ScalingConstraints
        include JSON::Serializable

        # The upper boundary of Amazon EC2 instances in an instance group beyond which scaling activities are
        # not allowed to grow. Scale-out activities will not add instances beyond this boundary.

        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Int32

        # The lower boundary of Amazon EC2 instances in an instance group below which scaling activities are
        # not allowed to shrink. Scale-in activities will not terminate instances below this boundary.

        @[JSON::Field(key: "MinCapacity")]
        getter min_capacity : Int32

        def initialize(
          @max_capacity : Int32,
          @min_capacity : Int32
        )
        end
      end

      # A scale-in or scale-out rule that defines scaling activity, including the CloudWatch metric alarm
      # that triggers activity, how Amazon EC2 instances are added or removed, and the periodicity of
      # adjustments. The automatic scaling policy for an instance group can comprise one or more automatic
      # scaling rules.

      struct ScalingRule
        include JSON::Serializable

        # The conditions that trigger an automatic scaling activity.

        @[JSON::Field(key: "Action")]
        getter action : Types::ScalingAction

        # The name used to identify an automatic scaling rule. Rule names must be unique within a scaling
        # policy.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The CloudWatch alarm definition that determines when automatic scaling activity is triggered.

        @[JSON::Field(key: "Trigger")]
        getter trigger : Types::ScalingTrigger

        # A friendly, more verbose description of the automatic scaling rule.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @action : Types::ScalingAction,
          @name : String,
          @trigger : Types::ScalingTrigger,
          @description : String? = nil
        )
        end
      end

      # The conditions that trigger an automatic scaling activity.

      struct ScalingTrigger
        include JSON::Serializable

        # The definition of a CloudWatch metric alarm. When the defined alarm conditions are met along with
        # other trigger parameters, scaling activity begins.

        @[JSON::Field(key: "CloudWatchAlarmDefinition")]
        getter cloud_watch_alarm_definition : Types::CloudWatchAlarmDefinition

        def initialize(
          @cloud_watch_alarm_definition : Types::CloudWatchAlarmDefinition
        )
        end
      end

      # Configuration of the script to run during a bootstrap action.

      struct ScriptBootstrapActionConfig
        include JSON::Serializable

        # Location in Amazon S3 of the script to run during a bootstrap action.

        @[JSON::Field(key: "Path")]
        getter path : String

        # A list of command line arguments to pass to the bootstrap action script.

        @[JSON::Field(key: "Args")]
        getter args : Array(String)?

        def initialize(
          @path : String,
          @args : Array(String)? = nil
        )
        end
      end

      # The creation date and time, and name, of a security configuration.

      struct SecurityConfigurationSummary
        include JSON::Serializable

        # The date and time the security configuration was created.

        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The name of the security configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # Details for an Amazon EMR Studio session mapping including creation time, user or group ID, Studio
      # ID, and so on.

      struct SessionMappingDetail
        include JSON::Serializable

        # The time the session mapping was created.

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The globally unique identifier (GUID) of the user or group.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # The name of the user or group. For more information, see UserName and DisplayName in the IAM
        # Identity Center Identity Store API Reference .

        @[JSON::Field(key: "IdentityName")]
        getter identity_name : String?

        # Specifies whether the identity mapped to the Amazon EMR Studio is a user or a group.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String?

        # The time the session mapping was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The Amazon Resource Name (ARN) of the session policy associated with the user or group.

        @[JSON::Field(key: "SessionPolicyArn")]
        getter session_policy_arn : String?

        # The ID of the Amazon EMR Studio.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String?

        def initialize(
          @creation_time : Time? = nil,
          @identity_id : String? = nil,
          @identity_name : String? = nil,
          @identity_type : String? = nil,
          @last_modified_time : Time? = nil,
          @session_policy_arn : String? = nil,
          @studio_id : String? = nil
        )
        end
      end

      # Details for an Amazon EMR Studio session mapping. The details do not include the time the session
      # mapping was last modified.

      struct SessionMappingSummary
        include JSON::Serializable

        # The time the session mapping was created.

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The globally unique identifier (GUID) of the user or group from the IAM Identity Center Identity
        # Store.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # The name of the user or group. For more information, see UserName and DisplayName in the IAM
        # Identity Center Identity Store API Reference .

        @[JSON::Field(key: "IdentityName")]
        getter identity_name : String?

        # Specifies whether the identity mapped to the Amazon EMR Studio is a user or a group.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String?

        # The Amazon Resource Name (ARN) of the session policy associated with the user or group.

        @[JSON::Field(key: "SessionPolicyArn")]
        getter session_policy_arn : String?

        # The ID of the Amazon EMR Studio.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String?

        def initialize(
          @creation_time : Time? = nil,
          @identity_id : String? = nil,
          @identity_name : String? = nil,
          @identity_type : String? = nil,
          @session_policy_arn : String? = nil,
          @studio_id : String? = nil
        )
        end
      end


      struct SetKeepJobFlowAliveWhenNoStepsInput
        include JSON::Serializable

        # A list of strings that uniquely identify the clusters to protect. This identifier is returned by
        # RunJobFlow and can also be obtained from DescribeJobFlows .

        @[JSON::Field(key: "JobFlowIds")]
        getter job_flow_ids : Array(String)

        # A Boolean that indicates whether to terminate the cluster after all steps are executed.

        @[JSON::Field(key: "KeepJobFlowAliveWhenNoSteps")]
        getter keep_job_flow_alive_when_no_steps : Bool

        def initialize(
          @job_flow_ids : Array(String),
          @keep_job_flow_alive_when_no_steps : Bool
        )
        end
      end

      # The input argument to the TerminationProtection operation.

      struct SetTerminationProtectionInput
        include JSON::Serializable

        # A list of strings that uniquely identify the clusters to protect. This identifier is returned by
        # RunJobFlow and can also be obtained from DescribeJobFlows .

        @[JSON::Field(key: "JobFlowIds")]
        getter job_flow_ids : Array(String)

        # A Boolean that indicates whether to protect the cluster and prevent the Amazon EC2 instances in the
        # cluster from shutting down due to API calls, user intervention, or job-flow error.

        @[JSON::Field(key: "TerminationProtected")]
        getter termination_protected : Bool

        def initialize(
          @job_flow_ids : Array(String),
          @termination_protected : Bool
        )
        end
      end


      struct SetUnhealthyNodeReplacementInput
        include JSON::Serializable

        # The list of strings that uniquely identify the clusters for which to turn on unhealthy node
        # replacement. You can get these identifiers by running the RunJobFlow or the DescribeJobFlows
        # operations.

        @[JSON::Field(key: "JobFlowIds")]
        getter job_flow_ids : Array(String)

        # Indicates whether to turn on or turn off graceful unhealthy node replacement.

        @[JSON::Field(key: "UnhealthyNodeReplacement")]
        getter unhealthy_node_replacement : Bool

        def initialize(
          @job_flow_ids : Array(String),
          @unhealthy_node_replacement : Bool
        )
        end
      end

      # The input to the SetVisibleToAllUsers action.

      struct SetVisibleToAllUsersInput
        include JSON::Serializable

        # The unique identifier of the job flow (cluster).

        @[JSON::Field(key: "JobFlowIds")]
        getter job_flow_ids : Array(String)

        # A value of true indicates that an IAM principal in the Amazon Web Services account can perform
        # Amazon EMR actions on the cluster that the IAM policies attached to the principal allow. A value of
        # false indicates that only the IAM principal that created the cluster and the Amazon Web Services
        # root user can perform Amazon EMR actions on the cluster.

        @[JSON::Field(key: "VisibleToAllUsers")]
        getter visible_to_all_users : Bool

        def initialize(
          @job_flow_ids : Array(String),
          @visible_to_all_users : Bool
        )
        end
      end

      # Policy for customizing shrink operations. Allows configuration of decommissioning timeout and
      # targeted instance shrinking.

      struct ShrinkPolicy
        include JSON::Serializable

        # The desired timeout for decommissioning an instance. Overrides the default YARN decommissioning
        # timeout.

        @[JSON::Field(key: "DecommissionTimeout")]
        getter decommission_timeout : Int32?

        # Custom policy for requesting termination protection or termination of specific instances when
        # shrinking an instance group.

        @[JSON::Field(key: "InstanceResizePolicy")]
        getter instance_resize_policy : Types::InstanceResizePolicy?

        def initialize(
          @decommission_timeout : Int32? = nil,
          @instance_resize_policy : Types::InstanceResizePolicy? = nil
        )
        end
      end

      # An automatic scaling configuration, which describes how the policy adds or removes instances, the
      # cooldown period, and the number of Amazon EC2 instances that will be added each time the CloudWatch
      # metric alarm condition is satisfied.

      struct SimpleScalingPolicyConfiguration
        include JSON::Serializable

        # The amount by which to scale in or scale out, based on the specified AdjustmentType . A positive
        # value adds to the instance group's Amazon EC2 instance count while a negative number removes
        # instances. If AdjustmentType is set to EXACT_CAPACITY , the number should only be a positive
        # integer. If AdjustmentType is set to PERCENT_CHANGE_IN_CAPACITY , the value should express the
        # percentage as an integer. For example, -20 indicates a decrease in 20% increments of cluster
        # capacity.

        @[JSON::Field(key: "ScalingAdjustment")]
        getter scaling_adjustment : Int32

        # The way in which Amazon EC2 instances are added (if ScalingAdjustment is a positive number) or
        # terminated (if ScalingAdjustment is a negative number) each time the scaling activity is triggered.
        # CHANGE_IN_CAPACITY is the default. CHANGE_IN_CAPACITY indicates that the Amazon EC2 instance count
        # increments or decrements by ScalingAdjustment , which should be expressed as an integer.
        # PERCENT_CHANGE_IN_CAPACITY indicates the instance count increments or decrements by the percentage
        # specified by ScalingAdjustment , which should be expressed as an integer. For example, 20 indicates
        # an increase in 20% increments of cluster capacity. EXACT_CAPACITY indicates the scaling activity
        # results in an instance group with the number of Amazon EC2 instances specified by ScalingAdjustment
        # , which should be expressed as a positive integer.

        @[JSON::Field(key: "AdjustmentType")]
        getter adjustment_type : String?

        # The amount of time, in seconds, after a scaling activity completes before any further
        # trigger-related scaling activities can start. The default value is 0.

        @[JSON::Field(key: "CoolDown")]
        getter cool_down : Int32?

        def initialize(
          @scaling_adjustment : Int32,
          @adjustment_type : String? = nil,
          @cool_down : Int32? = nil
        )
        end
      end

      # The returned release label application names or versions.

      struct SimplifiedApplication
        include JSON::Serializable

        # The returned release label application name. For example, hadoop .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The returned release label application version. For example, 3.2.1 .

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # The launch specification for Spot Instances in the instance fleet, which determines the defined
      # duration, provisioning timeout behavior, and allocation strategy. The instance fleet configuration
      # is available only in Amazon EMR releases 4.8.0 and later, excluding 5.0.x versions. Spot Instance
      # allocation strategy is available in Amazon EMR releases 5.12.1 and later. Spot Instances with a
      # defined duration (also known as Spot blocks) are no longer available to new customers from July 1,
      # 2021. For customers who have previously used the feature, we will continue to support Spot Instances
      # with a defined duration until December 31, 2022.

      struct SpotProvisioningSpecification
        include JSON::Serializable

        # The action to take when TargetSpotCapacity has not been fulfilled when the TimeoutDurationMinutes
        # has expired; that is, when all Spot Instances could not be provisioned within the Spot provisioning
        # timeout. Valid values are TERMINATE_CLUSTER and SWITCH_TO_ON_DEMAND . SWITCH_TO_ON_DEMAND specifies
        # that if no Spot Instances are available, On-Demand Instances should be provisioned to fulfill any
        # remaining Spot capacity.

        @[JSON::Field(key: "TimeoutAction")]
        getter timeout_action : String

        # The Spot provisioning timeout period in minutes. If Spot Instances are not provisioned within this
        # time period, the TimeOutAction is taken. Minimum value is 5 and maximum value is 1440. The timeout
        # applies only during initial provisioning, when the cluster is first created.

        @[JSON::Field(key: "TimeoutDurationMinutes")]
        getter timeout_duration_minutes : Int32

        # Specifies one of the following strategies to launch Spot Instance fleets: capacity-optimized ,
        # price-capacity-optimized , lowest-price , or diversified , and capacity-optimized-prioritized . For
        # more information on the provisioning strategies, see Allocation strategies for Spot Instances in the
        # Amazon EC2 User Guide for Linux Instances . When you launch a Spot Instance fleet with the old
        # console, it automatically launches with the capacity-optimized strategy. You can't change the
        # allocation strategy from the old console.

        @[JSON::Field(key: "AllocationStrategy")]
        getter allocation_strategy : String?

        # The defined duration for Spot Instances (also known as Spot blocks) in minutes. When specified, the
        # Spot Instance does not terminate before the defined duration expires, and defined duration pricing
        # for Spot Instances applies. Valid values are 60, 120, 180, 240, 300, or 360. The duration period
        # starts as soon as a Spot Instance receives its instance ID. At the end of the duration, Amazon EC2
        # marks the Spot Instance for termination and provides a Spot Instance termination notice, which gives
        # the instance a two-minute warning before it terminates. Spot Instances with a defined duration (also
        # known as Spot blocks) are no longer available to new customers from July 1, 2021. For customers who
        # have previously used the feature, we will continue to support Spot Instances with a defined duration
        # until December 31, 2022.

        @[JSON::Field(key: "BlockDurationMinutes")]
        getter block_duration_minutes : Int32?

        def initialize(
          @timeout_action : String,
          @timeout_duration_minutes : Int32,
          @allocation_strategy : String? = nil,
          @block_duration_minutes : Int32? = nil
        )
        end
      end

      # The resize specification for Spot Instances in the instance fleet, which contains the resize timeout
      # period.

      struct SpotResizingSpecification
        include JSON::Serializable

        # Specifies the allocation strategy to use to launch Spot instances during a resize. If you run Amazon
        # EMR releases 6.9.0 or higher, the default is price-capacity-optimized . If you run Amazon EMR
        # releases 6.8.0 or lower, the default is capacity-optimized .

        @[JSON::Field(key: "AllocationStrategy")]
        getter allocation_strategy : String?

        # Spot resize timeout in minutes. If Spot Instances are not provisioned within this time, the resize
        # workflow will stop provisioning of Spot instances. Minimum value is 5 minutes and maximum value is
        # 10,080 minutes (7 days). The timeout applies to all resize workflows on the Instance Fleet. The
        # resize could be triggered by Amazon EMR Managed Scaling or by the customer (via Amazon EMR Console,
        # Amazon EMR CLI modify-instance-fleet or Amazon EMR SDK ModifyInstanceFleet API) or by Amazon EMR due
        # to Amazon EC2 Spot Reclamation.

        @[JSON::Field(key: "TimeoutDurationMinutes")]
        getter timeout_duration_minutes : Int32?

        def initialize(
          @allocation_strategy : String? = nil,
          @timeout_duration_minutes : Int32? = nil
        )
        end
      end


      struct StartNotebookExecutionInput
        include JSON::Serializable

        # Specifies the execution engine (cluster) that runs the notebook execution.

        @[JSON::Field(key: "ExecutionEngine")]
        getter execution_engine : Types::ExecutionEngineConfig

        # The name or ARN of the IAM role that is used as the service role for Amazon EMR (the Amazon EMR
        # role) for the notebook execution.

        @[JSON::Field(key: "ServiceRole")]
        getter service_role : String

        # The unique identifier of the Amazon EMR Notebook to use for notebook execution.

        @[JSON::Field(key: "EditorId")]
        getter editor_id : String?

        # The environment variables associated with the notebook execution.

        @[JSON::Field(key: "EnvironmentVariables")]
        getter environment_variables : Hash(String, String)?

        # An optional name for the notebook execution.

        @[JSON::Field(key: "NotebookExecutionName")]
        getter notebook_execution_name : String?

        # The unique identifier of the Amazon EC2 security group to associate with the Amazon EMR Notebook for
        # this notebook execution.

        @[JSON::Field(key: "NotebookInstanceSecurityGroupId")]
        getter notebook_instance_security_group_id : String?

        # Input parameters in JSON format passed to the Amazon EMR Notebook at runtime for execution.

        @[JSON::Field(key: "NotebookParams")]
        getter notebook_params : String?

        # The Amazon S3 location for the notebook execution input.

        @[JSON::Field(key: "NotebookS3Location")]
        getter notebook_s3_location : Types::NotebookS3LocationFromInput?

        # The output format for the notebook execution.

        @[JSON::Field(key: "OutputNotebookFormat")]
        getter output_notebook_format : String?

        # The Amazon S3 location for the notebook execution output.

        @[JSON::Field(key: "OutputNotebookS3Location")]
        getter output_notebook_s3_location : Types::OutputNotebookS3LocationFromInput?

        # The path and file name of the notebook file for this execution, relative to the path specified for
        # the Amazon EMR Notebook. For example, if you specify a path of s3://MyBucket/MyNotebooks when you
        # create an Amazon EMR Notebook for a notebook with an ID of e-ABCDEFGHIJK1234567890ABCD (the EditorID
        # of this request), and you specify a RelativePath of my_notebook_executions/notebook_execution.ipynb
        # , the location of the file for the notebook execution is
        # s3://MyBucket/MyNotebooks/e-ABCDEFGHIJK1234567890ABCD/my_notebook_executions/notebook_execution.ipynb
        # .

        @[JSON::Field(key: "RelativePath")]
        getter relative_path : String?

        # A list of tags associated with a notebook execution. Tags are user-defined key-value pairs that
        # consist of a required key string with a maximum of 128 characters and an optional value string with
        # a maximum of 256 characters.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @execution_engine : Types::ExecutionEngineConfig,
          @service_role : String,
          @editor_id : String? = nil,
          @environment_variables : Hash(String, String)? = nil,
          @notebook_execution_name : String? = nil,
          @notebook_instance_security_group_id : String? = nil,
          @notebook_params : String? = nil,
          @notebook_s3_location : Types::NotebookS3LocationFromInput? = nil,
          @output_notebook_format : String? = nil,
          @output_notebook_s3_location : Types::OutputNotebookS3LocationFromInput? = nil,
          @relative_path : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct StartNotebookExecutionOutput
        include JSON::Serializable

        # The unique identifier of the notebook execution.

        @[JSON::Field(key: "NotebookExecutionId")]
        getter notebook_execution_id : String?

        def initialize(
          @notebook_execution_id : String? = nil
        )
        end
      end

      # This represents a step in a cluster.

      struct Step
        include JSON::Serializable

        # The action to take when the cluster step fails. Possible values are TERMINATE_CLUSTER ,
        # CANCEL_AND_WAIT , and CONTINUE . TERMINATE_JOB_FLOW is provided for backward compatibility. We
        # recommend using TERMINATE_CLUSTER instead. If a cluster's StepConcurrencyLevel is greater than 1 ,
        # do not use AddJobFlowSteps to submit a step with this parameter set to CANCEL_AND_WAIT or
        # TERMINATE_CLUSTER . The step is not submitted and the action fails with a message that the
        # ActionOnFailure setting is not valid. If you change a cluster's StepConcurrencyLevel to be greater
        # than 1 while a step is running, the ActionOnFailure parameter may not behave as you expect. In this
        # case, for a step that fails with this parameter set to CANCEL_AND_WAIT , pending steps and the
        # running step are not canceled; for a step that fails with this parameter set to TERMINATE_CLUSTER ,
        # the cluster does not terminate.

        @[JSON::Field(key: "ActionOnFailure")]
        getter action_on_failure : String?

        # The Hadoop job configuration of the cluster step.

        @[JSON::Field(key: "Config")]
        getter config : Types::HadoopStepConfig?

        # The KMS key ARN to encrypt the logs published to the given Amazon S3 destination.

        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The Amazon Resource Name (ARN) of the runtime role for a step on the cluster. The runtime role can
        # be a cross-account IAM role. The runtime role ARN is a combination of account ID, role name, and
        # role type using the following format: arn:partition:service:region:account:resource . For example,
        # arn:aws:IAM::1234567890:role/ReadOnly is a correctly formatted runtime role ARN.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # The identifier of the cluster step.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The Amazon S3 destination URI for log publishing.

        @[JSON::Field(key: "LogUri")]
        getter log_uri : String?

        # The name of the cluster step.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current execution status details of the cluster step.

        @[JSON::Field(key: "Status")]
        getter status : Types::StepStatus?

        def initialize(
          @action_on_failure : String? = nil,
          @config : Types::HadoopStepConfig? = nil,
          @encryption_key_arn : String? = nil,
          @execution_role_arn : String? = nil,
          @id : String? = nil,
          @log_uri : String? = nil,
          @name : String? = nil,
          @status : Types::StepStatus? = nil
        )
        end
      end

      # Specification for a cluster (job flow) step.

      struct StepConfig
        include JSON::Serializable

        # The JAR file used for the step.

        @[JSON::Field(key: "HadoopJarStep")]
        getter hadoop_jar_step : Types::HadoopJarStepConfig

        # The name of the step.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The action to take when the step fails. Use one of the following values: TERMINATE_CLUSTER - Shuts
        # down the cluster. CANCEL_AND_WAIT - Cancels any pending steps and returns the cluster to the WAITING
        # state. CONTINUE - Continues to the next step in the queue. TERMINATE_JOB_FLOW - Shuts down the
        # cluster. TERMINATE_JOB_FLOW is provided for backward compatibility. We recommend using
        # TERMINATE_CLUSTER instead. If a cluster's StepConcurrencyLevel is greater than 1 , do not use
        # AddJobFlowSteps to submit a step with this parameter set to CANCEL_AND_WAIT or TERMINATE_CLUSTER .
        # The step is not submitted and the action fails with a message that the ActionOnFailure setting is
        # not valid. If you change a cluster's StepConcurrencyLevel to be greater than 1 while a step is
        # running, the ActionOnFailure parameter may not behave as you expect. In this case, for a step that
        # fails with this parameter set to CANCEL_AND_WAIT , pending steps and the running step are not
        # canceled; for a step that fails with this parameter set to TERMINATE_CLUSTER , the cluster does not
        # terminate.

        @[JSON::Field(key: "ActionOnFailure")]
        getter action_on_failure : String?

        # Object that holds configuration properties for logging.

        @[JSON::Field(key: "StepMonitoringConfiguration")]
        getter step_monitoring_configuration : Types::StepMonitoringConfiguration?

        def initialize(
          @hadoop_jar_step : Types::HadoopJarStepConfig,
          @name : String,
          @action_on_failure : String? = nil,
          @step_monitoring_configuration : Types::StepMonitoringConfiguration? = nil
        )
        end
      end

      # Combines the execution state and configuration of a step.

      struct StepDetail
        include JSON::Serializable

        # The description of the step status.

        @[JSON::Field(key: "ExecutionStatusDetail")]
        getter execution_status_detail : Types::StepExecutionStatusDetail

        # The step configuration.

        @[JSON::Field(key: "StepConfig")]
        getter step_config : Types::StepConfig

        def initialize(
          @execution_status_detail : Types::StepExecutionStatusDetail,
          @step_config : Types::StepConfig
        )
        end
      end

      # The execution state of a step.

      struct StepExecutionStatusDetail
        include JSON::Serializable

        # The creation date and time of the step.

        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time

        # The state of the step.

        @[JSON::Field(key: "State")]
        getter state : String

        # The completion date and time of the step.

        @[JSON::Field(key: "EndDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date_time : Time?

        # A description of the step's current state.

        @[JSON::Field(key: "LastStateChangeReason")]
        getter last_state_change_reason : String?

        # The start date and time of the step.

        @[JSON::Field(key: "StartDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date_time : Time?

        def initialize(
          @creation_date_time : Time,
          @state : String,
          @end_date_time : Time? = nil,
          @last_state_change_reason : String? = nil,
          @start_date_time : Time? = nil
        )
        end
      end

      # Object that holds configuration properties for logging.

      struct StepMonitoringConfiguration
        include JSON::Serializable

        # The Amazon S3 configuration for monitoring log publishing. You can configure your step to send log
        # information to Amazon S3. When it's specified, it takes precedence over the cluster's logging
        # configuration. If you don't specify this configuration entirely, or omit individual fields, EMR
        # falls back to cluster-level logging behavior.

        @[JSON::Field(key: "S3MonitoringConfiguration")]
        getter s3_monitoring_configuration : Types::S3MonitoringConfiguration?

        def initialize(
          @s3_monitoring_configuration : Types::S3MonitoringConfiguration? = nil
        )
        end
      end

      # The details of the step state change reason.

      struct StepStateChangeReason
        include JSON::Serializable

        # The programmable code for the state change reason. Note: Currently, the service provides no code for
        # the state change.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The descriptive message for the state change reason.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The execution status details of the cluster step.

      struct StepStatus
        include JSON::Serializable

        # The details for the step failure including reason, message, and log file path where the root cause
        # was identified.

        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::FailureDetails?

        # The execution state of the cluster step.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason for the step execution status change.

        @[JSON::Field(key: "StateChangeReason")]
        getter state_change_reason : Types::StepStateChangeReason?

        # The timeline of the cluster step status over time.

        @[JSON::Field(key: "Timeline")]
        getter timeline : Types::StepTimeline?

        def initialize(
          @failure_details : Types::FailureDetails? = nil,
          @state : String? = nil,
          @state_change_reason : Types::StepStateChangeReason? = nil,
          @timeline : Types::StepTimeline? = nil
        )
        end
      end

      # The summary of the cluster step.

      struct StepSummary
        include JSON::Serializable

        # The action to take when the cluster step fails. Possible values are TERMINATE_CLUSTER,
        # CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is available for backward compatibility.

        @[JSON::Field(key: "ActionOnFailure")]
        getter action_on_failure : String?

        # The Hadoop job configuration of the cluster step.

        @[JSON::Field(key: "Config")]
        getter config : Types::HadoopStepConfig?

        # The KMS key ARN to encrypt the logs published to the given Amazon S3 destination.

        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The identifier of the cluster step.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The Amazon S3 destination URI for log publishing.

        @[JSON::Field(key: "LogUri")]
        getter log_uri : String?

        # The name of the cluster step.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current execution status details of the cluster step.

        @[JSON::Field(key: "Status")]
        getter status : Types::StepStatus?

        def initialize(
          @action_on_failure : String? = nil,
          @config : Types::HadoopStepConfig? = nil,
          @encryption_key_arn : String? = nil,
          @id : String? = nil,
          @log_uri : String? = nil,
          @name : String? = nil,
          @status : Types::StepStatus? = nil
        )
        end
      end

      # The timeline of the cluster step lifecycle.

      struct StepTimeline
        include JSON::Serializable

        # The date and time when the cluster step was created.

        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The date and time when the cluster step execution completed or failed.

        @[JSON::Field(key: "EndDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date_time : Time?

        # The date and time when the cluster step execution started.

        @[JSON::Field(key: "StartDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date_time : Time?

        def initialize(
          @creation_date_time : Time? = nil,
          @end_date_time : Time? = nil,
          @start_date_time : Time? = nil
        )
        end
      end


      struct StopNotebookExecutionInput
        include JSON::Serializable

        # The unique identifier of the notebook execution.

        @[JSON::Field(key: "NotebookExecutionId")]
        getter notebook_execution_id : String

        def initialize(
          @notebook_execution_id : String
        )
        end
      end

      # Details for an Amazon EMR Studio including ID, creation time, name, and so on.

      struct Studio
        include JSON::Serializable

        # Specifies whether the Amazon EMR Studio authenticates users with IAM or IAM Identity Center.

        @[JSON::Field(key: "AuthMode")]
        getter auth_mode : String?

        # The time the Amazon EMR Studio was created.

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Amazon S3 location to back up Amazon EMR Studio Workspaces and notebook files.

        @[JSON::Field(key: "DefaultS3Location")]
        getter default_s3_location : String?

        # The detailed description of the Amazon EMR Studio.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The KMS key identifier (ARN) used to encrypt Amazon EMR Studio workspace and notebook files when
        # backed up to Amazon S3.

        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The ID of the Engine security group associated with the Amazon EMR Studio. The Engine security group
        # allows inbound network traffic from resources in the Workspace security group.

        @[JSON::Field(key: "EngineSecurityGroupId")]
        getter engine_security_group_id : String?

        # The ARN of the IAM Identity Center instance the Studio application belongs to.

        @[JSON::Field(key: "IdcInstanceArn")]
        getter idc_instance_arn : String?

        # Indicates whether the Studio has REQUIRED or OPTIONAL IAM Identity Center user assignment. If the
        # value is set to REQUIRED , users must be explicitly assigned to the Studio application to access the
        # Studio.

        @[JSON::Field(key: "IdcUserAssignment")]
        getter idc_user_assignment : String?

        # Your identity provider's authentication endpoint. Amazon EMR Studio redirects federated users to
        # this endpoint for authentication when logging in to a Studio with the Studio URL.

        @[JSON::Field(key: "IdpAuthUrl")]
        getter idp_auth_url : String?

        # The name of your identity provider's RelayState parameter.

        @[JSON::Field(key: "IdpRelayStateParameterName")]
        getter idp_relay_state_parameter_name : String?

        # The name of the Amazon EMR Studio.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The name of the IAM role assumed by the Amazon EMR Studio.

        @[JSON::Field(key: "ServiceRole")]
        getter service_role : String?

        # The Amazon Resource Name (ARN) of the Amazon EMR Studio.

        @[JSON::Field(key: "StudioArn")]
        getter studio_arn : String?

        # The ID of the Amazon EMR Studio.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String?

        # The list of IDs of the subnets associated with the Amazon EMR Studio.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # A list of tags associated with the Amazon EMR Studio.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Indicates whether the Studio has Trusted identity propagation enabled. The default value is false .

        @[JSON::Field(key: "TrustedIdentityPropagationEnabled")]
        getter trusted_identity_propagation_enabled : Bool?

        # The unique access URL of the Amazon EMR Studio.

        @[JSON::Field(key: "Url")]
        getter url : String?

        # The name of the IAM role assumed by users logged in to the Amazon EMR Studio. A Studio only requires
        # a UserRole when you use IAM authentication.

        @[JSON::Field(key: "UserRole")]
        getter user_role : String?

        # The ID of the VPC associated with the Amazon EMR Studio.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        # The ID of the Workspace security group associated with the Amazon EMR Studio. The Workspace security
        # group allows outbound network traffic to resources in the Engine security group and to the internet.

        @[JSON::Field(key: "WorkspaceSecurityGroupId")]
        getter workspace_security_group_id : String?

        def initialize(
          @auth_mode : String? = nil,
          @creation_time : Time? = nil,
          @default_s3_location : String? = nil,
          @description : String? = nil,
          @encryption_key_arn : String? = nil,
          @engine_security_group_id : String? = nil,
          @idc_instance_arn : String? = nil,
          @idc_user_assignment : String? = nil,
          @idp_auth_url : String? = nil,
          @idp_relay_state_parameter_name : String? = nil,
          @name : String? = nil,
          @service_role : String? = nil,
          @studio_arn : String? = nil,
          @studio_id : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @trusted_identity_propagation_enabled : Bool? = nil,
          @url : String? = nil,
          @user_role : String? = nil,
          @vpc_id : String? = nil,
          @workspace_security_group_id : String? = nil
        )
        end
      end

      # Details for an Amazon EMR Studio, including ID, Name, VPC, and Description. To fetch additional
      # details such as subnets, IAM roles, security groups, and tags for the Studio, use the DescribeStudio
      # API.

      struct StudioSummary
        include JSON::Serializable

        # Specifies whether the Studio authenticates users using IAM or IAM Identity Center.

        @[JSON::Field(key: "AuthMode")]
        getter auth_mode : String?

        # The time when the Amazon EMR Studio was created.

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The detailed description of the Amazon EMR Studio.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the Amazon EMR Studio.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the Amazon EMR Studio.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String?

        # The unique access URL of the Amazon EMR Studio.

        @[JSON::Field(key: "Url")]
        getter url : String?

        # The ID of the Virtual Private Cloud (Amazon VPC) associated with the Amazon EMR Studio.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @auth_mode : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @studio_id : String? = nil,
          @url : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # An instance type that the specified Amazon EMR release supports.

      struct SupportedInstanceType
        include JSON::Serializable

        # The CPU architecture, for example X86_64 or AARCH64 .

        @[JSON::Field(key: "Architecture")]
        getter architecture : String?

        # Indicates whether the SupportedInstanceType supports Amazon EBS optimization.

        @[JSON::Field(key: "EbsOptimizedAvailable")]
        getter ebs_optimized_available : Bool?

        # Indicates whether the SupportedInstanceType uses Amazon EBS optimization by default.

        @[JSON::Field(key: "EbsOptimizedByDefault")]
        getter ebs_optimized_by_default : Bool?

        # Indicates whether the SupportedInstanceType only supports Amazon EBS.

        @[JSON::Field(key: "EbsStorageOnly")]
        getter ebs_storage_only : Bool?

        # The Amazon EC2 family and generation for the SupportedInstanceType .

        @[JSON::Field(key: "InstanceFamilyId")]
        getter instance_family_id : String?

        # Indicates whether the SupportedInstanceType only supports 64-bit architecture.

        @[JSON::Field(key: "Is64BitsOnly")]
        getter is64_bits_only : Bool?

        # The amount of memory that is available to Amazon EMR from the SupportedInstanceType . The kernel and
        # hypervisor software consume some memory, so this value might be lower than the overall memory for
        # the instance type.

        @[JSON::Field(key: "MemoryGB")]
        getter memory_gb : Float64?

        # Number of disks for the SupportedInstanceType . This value is 0 for Amazon EBS-only instance types.

        @[JSON::Field(key: "NumberOfDisks")]
        getter number_of_disks : Int32?

        # StorageGB represents the storage capacity of the SupportedInstanceType . This value is 0 for Amazon
        # EBS-only instance types.

        @[JSON::Field(key: "StorageGB")]
        getter storage_gb : Int32?

        # The Amazon EC2 instance type , for example m5.xlarge , of the SupportedInstanceType .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The number of vCPUs available for the SupportedInstanceType .

        @[JSON::Field(key: "VCPU")]
        getter vcpu : Int32?

        def initialize(
          @architecture : String? = nil,
          @ebs_optimized_available : Bool? = nil,
          @ebs_optimized_by_default : Bool? = nil,
          @ebs_storage_only : Bool? = nil,
          @instance_family_id : String? = nil,
          @is64_bits_only : Bool? = nil,
          @memory_gb : Float64? = nil,
          @number_of_disks : Int32? = nil,
          @storage_gb : Int32? = nil,
          @type : String? = nil,
          @vcpu : Int32? = nil
        )
        end
      end

      # The list of supported product configurations that allow user-supplied arguments. Amazon EMR accepts
      # these arguments and forwards them to the corresponding installation script as bootstrap action
      # arguments.

      struct SupportedProductConfig
        include JSON::Serializable

        # The list of user-supplied arguments.

        @[JSON::Field(key: "Args")]
        getter args : Array(String)?

        # The name of the product configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @args : Array(String)? = nil,
          @name : String? = nil
        )
        end
      end

      # A key-value pair containing user-defined metadata that you can associate with an Amazon EMR
      # resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to
      # track your Amazon EMR resource allocation costs. For more information, see Tag Clusters .

      struct Tag
        include JSON::Serializable

        # A user-defined key, which is the minimum required information for a valid tag. For more information,
        # see Tag .

        @[JSON::Field(key: "Key")]
        getter key : String?

        # A user-defined value, which is optional in a tag. For more information, see Tag Clusters .

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Input to the TerminateJobFlows operation.

      struct TerminateJobFlowsInput
        include JSON::Serializable

        # A list of job flows to be shut down.

        @[JSON::Field(key: "JobFlowIds")]
        getter job_flow_ids : Array(String)

        def initialize(
          @job_flow_ids : Array(String)
        )
        end
      end


      struct UpdateStudioInput
        include JSON::Serializable

        # The ID of the Amazon EMR Studio to update.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String

        # The Amazon S3 location to back up Workspaces and notebook files for the Amazon EMR Studio.

        @[JSON::Field(key: "DefaultS3Location")]
        getter default_s3_location : String?

        # A detailed description to assign to the Amazon EMR Studio.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The KMS key identifier (ARN) used to encrypt Amazon EMR Studio workspace and notebook files when
        # backed up to Amazon S3.

        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # A descriptive name for the Amazon EMR Studio.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of subnet IDs to associate with the Amazon EMR Studio. The list can include new subnet IDs,
        # but must also include all of the subnet IDs previously associated with the Studio. The list order
        # does not matter. A Studio can have a maximum of 5 subnets. The subnets must belong to the same VPC
        # as the Studio.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @studio_id : String,
          @default_s3_location : String? = nil,
          @description : String? = nil,
          @encryption_key_arn : String? = nil,
          @name : String? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end


      struct UpdateStudioSessionMappingInput
        include JSON::Serializable

        # Specifies whether the identity to update is a user or a group.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String

        # The Amazon Resource Name (ARN) of the session policy to associate with the specified user or group.

        @[JSON::Field(key: "SessionPolicyArn")]
        getter session_policy_arn : String

        # The ID of the Amazon EMR Studio.

        @[JSON::Field(key: "StudioId")]
        getter studio_id : String

        # The globally unique identifier (GUID) of the user or group. For more information, see UserId and
        # GroupId in the IAM Identity Center Identity Store API Reference . Either IdentityName or IdentityId
        # must be specified.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # The name of the user or group to update. For more information, see UserName and DisplayName in the
        # IAM Identity Center Identity Store API Reference . Either IdentityName or IdentityId must be
        # specified.

        @[JSON::Field(key: "IdentityName")]
        getter identity_name : String?

        def initialize(
          @identity_type : String,
          @session_policy_arn : String,
          @studio_id : String,
          @identity_id : String? = nil,
          @identity_name : String? = nil
        )
        end
      end

      # The username and password that you use to connect to cluster endpoints.

      struct UsernamePassword
        include JSON::Serializable

        # The password associated with the temporary credentials that you use to connect to cluster endpoints.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The username associated with the temporary credentials that you use to connect to cluster endpoints.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @password : String? = nil,
          @username : String? = nil
        )
        end
      end

      # EBS volume specifications such as volume type, IOPS, size (GiB) and throughput (MiB/s) that are
      # requested for the EBS volume attached to an Amazon EC2 instance in the cluster.

      struct VolumeSpecification
        include JSON::Serializable

        # The volume size, in gibibytes (GiB). This can be a number from 1 - 1024. If the volume type is
        # EBS-optimized, the minimum value is 10.

        @[JSON::Field(key: "SizeInGB")]
        getter size_in_gb : Int32

        # The volume type. Volume types supported are gp3, gp2, io1, st1, sc1, and standard.

        @[JSON::Field(key: "VolumeType")]
        getter volume_type : String

        # The number of I/O operations per second (IOPS) that the volume supports.

        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # The throughput, in mebibyte per second (MiB/s). This optional parameter can be a number from 125 -
        # 1000 and is valid only for gp3 volumes.

        @[JSON::Field(key: "Throughput")]
        getter throughput : Int32?

        def initialize(
          @size_in_gb : Int32,
          @volume_type : String,
          @iops : Int32? = nil,
          @throughput : Int32? = nil
        )
        end
      end
    end
  end
end
