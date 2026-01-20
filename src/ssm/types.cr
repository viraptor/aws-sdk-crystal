require "json"
require "time"

module Aws
  module SSM
    module Types

      # The requester doesn't have permissions to perform the requested operation.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Information includes the Amazon Web Services account ID where the current document is shared and the
      # version shared with that account.

      struct AccountSharingInfo
        include JSON::Serializable

        # The Amazon Web Services account ID where the current document is shared.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The version of the current document shared with the account.

        @[JSON::Field(key: "SharedDocumentVersion")]
        getter shared_document_version : String?

        def initialize(
          @account_id : String? = nil,
          @shared_document_version : String? = nil
        )
        end
      end

      # An activation registers one or more on-premises servers or virtual machines (VMs) with Amazon Web
      # Services so that you can configure those servers or VMs using Run Command. A server or VM that has
      # been registered with Amazon Web Services Systems Manager is called a managed node.

      struct Activation
        include JSON::Serializable

        # The ID created by Systems Manager when you submitted the activation.

        @[JSON::Field(key: "ActivationId")]
        getter activation_id : String?

        # The date the activation was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # A name for the managed node when it is created.

        @[JSON::Field(key: "DefaultInstanceName")]
        getter default_instance_name : String?

        # A user defined description of the activation.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date when this activation can no longer be used to register managed nodes.

        @[JSON::Field(key: "ExpirationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiration_date : Time?

        # Whether or not the activation is expired.

        @[JSON::Field(key: "Expired")]
        getter expired : Bool?

        # The Identity and Access Management (IAM) role to assign to the managed node.

        @[JSON::Field(key: "IamRole")]
        getter iam_role : String?

        # The maximum number of managed nodes that can be registered using this activation.

        @[JSON::Field(key: "RegistrationLimit")]
        getter registration_limit : Int32?

        # The number of managed nodes already registered with this activation.

        @[JSON::Field(key: "RegistrationsCount")]
        getter registrations_count : Int32?

        # Tags assigned to the activation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @activation_id : String? = nil,
          @created_date : Time? = nil,
          @default_instance_name : String? = nil,
          @description : String? = nil,
          @expiration_date : Time? = nil,
          @expired : Bool? = nil,
          @iam_role : String? = nil,
          @registration_limit : Int32? = nil,
          @registrations_count : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct AddTagsToResourceRequest
        include JSON::Serializable

        # The resource ID you want to tag. Use the ID of the resource. Here are some examples:
        # MaintenanceWindow : mw-012345abcde PatchBaseline : pb-012345abcde Automation :
        # example-c160-4567-8519-012345abcde OpsMetadata object: ResourceID for tagging is created from the
        # Amazon Resource Name (ARN) for the object. Specifically, ResourceID is created from the strings that
        # come after the word opsmetadata in the ARN. For example, an OpsMetadata object with an ARN of
        # arn:aws:ssm:us-east-2:1234567890:opsmetadata/aws/ssm/MyGroup/appmanager has a ResourceID of either
        # aws/ssm/MyGroup/appmanager or /aws/ssm/MyGroup/appmanager . For the Document and Parameter values,
        # use the name of the resource. If you're tagging a shared document, you must use the full ARN of the
        # document. ManagedInstance : mi-012345abcde The ManagedInstance type for this API operation is only
        # for on-premises managed nodes. You must specify the name of the managed node in the following
        # format: mi- ID_number . For example, mi-1a2b3c4d5e6f .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Specifies the type of resource you are tagging. The ManagedInstance type for this API operation is
        # for on-premises managed nodes. You must specify the name of the managed node in the following
        # format: mi- ID_number . For example, mi-1a2b3c4d5e6f .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # One or more tags. The value parameter is required. Don't enter personally identifiable information
        # in this field.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_id : String,
          @resource_type : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct AddTagsToResourceResult
        include JSON::Serializable

        def initialize
        end
      end

      # A CloudWatch alarm you apply to an automation or command.

      struct Alarm
        include JSON::Serializable

        # The name of your CloudWatch alarm.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # The details for the CloudWatch alarm you want to apply to an automation or command.

      struct AlarmConfiguration
        include JSON::Serializable

        # The name of the CloudWatch alarm specified in the configuration.

        @[JSON::Field(key: "Alarms")]
        getter alarms : Array(Types::Alarm)

        # When this value is true , your automation or command continues to run in cases where we can’t
        # retrieve alarm status information from CloudWatch. In cases where we successfully retrieve an alarm
        # status of OK or INSUFFICIENT_DATA, the automation or command continues to run, regardless of this
        # value. Default is false .

        @[JSON::Field(key: "IgnorePollAlarmFailure")]
        getter ignore_poll_alarm_failure : Bool?

        def initialize(
          @alarms : Array(Types::Alarm),
          @ignore_poll_alarm_failure : Bool? = nil
        )
        end
      end

      # The details about the state of your CloudWatch alarm.

      struct AlarmStateInformation
        include JSON::Serializable

        # The name of your CloudWatch alarm.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The state of your CloudWatch alarm.

        @[JSON::Field(key: "State")]
        getter state : String

        def initialize(
          @name : String,
          @state : String
        )
        end
      end

      # Error returned if an attempt is made to register a patch group with a patch baseline that is already
      # registered with a different patch baseline.

      struct AlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AssociateOpsItemRelatedItemRequest
        include JSON::Serializable

        # The type of association that you want to create between an OpsItem and a resource. OpsCenter
        # supports IsParentOf and RelatesTo association types.

        @[JSON::Field(key: "AssociationType")]
        getter association_type : String

        # The ID of the OpsItem to which you want to associate a resource as a related item.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String

        # The type of resource that you want to associate with an OpsItem. OpsCenter supports the following
        # types: AWS::SSMIncidents::IncidentRecord : an Incident Manager incident. AWS::SSM::Document : a
        # Systems Manager (SSM) document.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The Amazon Resource Name (ARN) of the Amazon Web Services resource that you want to associate with
        # the OpsItem.

        @[JSON::Field(key: "ResourceUri")]
        getter resource_uri : String

        def initialize(
          @association_type : String,
          @ops_item_id : String,
          @resource_type : String,
          @resource_uri : String
        )
        end
      end


      struct AssociateOpsItemRelatedItemResponse
        include JSON::Serializable

        # The association ID.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        def initialize(
          @association_id : String? = nil
        )
        end
      end

      # You must disassociate a document from all managed nodes before you can delete it.

      struct AssociatedInstances
        include JSON::Serializable

        def initialize
        end
      end

      # Describes an association of a Amazon Web Services Systems Manager document (SSM document) and a
      # managed node.

      struct Association
        include JSON::Serializable

        # The ID created by the system when you create an association. An association is a binding between a
        # document and a set of targets with a schedule.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # The association name.

        @[JSON::Field(key: "AssociationName")]
        getter association_name : String?

        # The association version.

        @[JSON::Field(key: "AssociationVersion")]
        getter association_version : String?

        # The version of the document used in the association. If you change a document version for a State
        # Manager association, Systems Manager immediately runs the association unless you previously specifed
        # the apply-only-at-cron-interval parameter. State Manager doesn't support running associations that
        # use a new version of a document if that document is shared from another account. State Manager
        # always runs the default version of a document if shared from another account, even though the
        # Systems Manager console shows that a new version was processed. If you want to run an association
        # using a new version of a document shared form another account, you must set the document version to
        # default .

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The number of hours that an association can run on specified targets. After the resulting cutoff
        # time passes, associations that are currently running are cancelled, and no pending executions are
        # started on remaining targets.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The managed node ID.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The date on which the association was last run.

        @[JSON::Field(key: "LastExecutionDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_execution_date : Time?

        # The name of the SSM document.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Information about the association.

        @[JSON::Field(key: "Overview")]
        getter overview : Types::AssociationOverview?

        # A cron expression that specifies a schedule when the association runs. The schedule runs in
        # Coordinated Universal Time (UTC).

        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # Number of days to wait after the scheduled day to run an association.

        @[JSON::Field(key: "ScheduleOffset")]
        getter schedule_offset : Int32?

        # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be
        # specified together.

        @[JSON::Field(key: "TargetMaps")]
        getter target_maps : Array(Hash(String, Array(String)))?

        # The managed nodes targeted by the request to create an association. You can target all managed nodes
        # in an Amazon Web Services account by specifying the InstanceIds key with a value of * .

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        def initialize(
          @association_id : String? = nil,
          @association_name : String? = nil,
          @association_version : String? = nil,
          @document_version : String? = nil,
          @duration : Int32? = nil,
          @instance_id : String? = nil,
          @last_execution_date : Time? = nil,
          @name : String? = nil,
          @overview : Types::AssociationOverview? = nil,
          @schedule_expression : String? = nil,
          @schedule_offset : Int32? = nil,
          @target_maps : Array(Hash(String, Array(String)))? = nil,
          @targets : Array(Types::Target)? = nil
        )
        end
      end

      # The specified association already exists.

      struct AssociationAlreadyExists
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the parameters for a document.

      struct AssociationDescription
        include JSON::Serializable


        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # By default, when you create a new associations, the system runs it immediately after it is created
        # and then according to the schedule you specified. Specify this option if you don't want an
        # association to run immediately after you create it. This parameter isn't supported for rate
        # expressions.

        @[JSON::Field(key: "ApplyOnlyAtCronInterval")]
        getter apply_only_at_cron_interval : Bool?

        # The association ID.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # The association name.

        @[JSON::Field(key: "AssociationName")]
        getter association_name : String?

        # The association version.

        @[JSON::Field(key: "AssociationVersion")]
        getter association_version : String?

        # Choose the parameter that will define how your automation will branch out. This target is required
        # for associations that use an Automation runbook and target resources by using rate controls.
        # Automation is a tool in Amazon Web Services Systems Manager.

        @[JSON::Field(key: "AutomationTargetParameterName")]
        getter automation_target_parameter_name : String?

        # The names or Amazon Resource Names (ARNs) of the Change Calendar type documents your associations
        # are gated under. The associations only run when that change calendar is open. For more information,
        # see Amazon Web Services Systems Manager Change Calendar in the Amazon Web Services Systems Manager
        # User Guide .

        @[JSON::Field(key: "CalendarNames")]
        getter calendar_names : Array(String)?

        # The severity level that is assigned to the association.

        @[JSON::Field(key: "ComplianceSeverity")]
        getter compliance_severity : String?

        # The date when the association was made.

        @[JSON::Field(key: "Date", converter: Aws::Runtime::UnixTimestampConverter)]
        getter date : Time?

        # The document version.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The number of hours that an association can run on specified targets. After the resulting cutoff
        # time passes, associations that are currently running are cancelled, and no pending executions are
        # started on remaining targets.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The managed node ID.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The date on which the association was last run.

        @[JSON::Field(key: "LastExecutionDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_execution_date : Time?

        # The last date on which the association was successfully run.

        @[JSON::Field(key: "LastSuccessfulExecutionDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_successful_execution_date : Time?

        # The date when the association was last updated.

        @[JSON::Field(key: "LastUpdateAssociationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_update_association_date : Time?

        # The maximum number of targets allowed to run the association at the same time. You can specify a
        # number, for example 10, or a percentage of the target set, for example 10%. The default value is
        # 100%, which means all targets run the association at the same time. If a new managed node starts and
        # attempts to run an association while Systems Manager is running MaxConcurrency associations, the
        # association is allowed to run. During the next association interval, the new managed node will
        # process its association within the limit specified for MaxConcurrency .

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The number of errors that are allowed before the system stops sending requests to run the
        # association on additional targets. You can specify either an absolute number of errors, for example
        # 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system
        # stops sending requests when the fourth error is received. If you specify 0, then the system stops
        # sending requests after the first error is returned. If you run an association on 50 managed nodes
        # and set MaxError to 10%, then the system stops sending the request when the sixth error is received.
        # Executions that are already running an association when MaxErrors is reached are allowed to
        # complete, but some of these executions may fail as well. If you need to ensure that there won't be
        # more than max-errors failed executions, set MaxConcurrency to 1 so that executions proceed one at a
        # time.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # The name of the SSM document.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An S3 bucket where you want to store the output details of the request.

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : Types::InstanceAssociationOutputLocation?

        # Information about the association.

        @[JSON::Field(key: "Overview")]
        getter overview : Types::AssociationOverview?

        # A description of the parameters for a document.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # A cron expression that specifies a schedule when the association runs.

        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # Number of days to wait after the scheduled day to run an association.

        @[JSON::Field(key: "ScheduleOffset")]
        getter schedule_offset : Int32?

        # The association status.

        @[JSON::Field(key: "Status")]
        getter status : Types::AssociationStatus?

        # The mode for generating association compliance. You can specify AUTO or MANUAL . In AUTO mode, the
        # system uses the status of the association execution to determine the compliance status. If the
        # association execution runs successfully, then the association is COMPLIANT . If the association
        # execution doesn't run successfully, the association is NON-COMPLIANT . In MANUAL mode, you must
        # specify the AssociationId as a parameter for the PutComplianceItems API operation. In this case,
        # compliance data isn't managed by State Manager, a tool in Amazon Web Services Systems Manager. It is
        # managed by your direct call to the PutComplianceItems API operation. By default, all associations
        # use AUTO mode.

        @[JSON::Field(key: "SyncCompliance")]
        getter sync_compliance : String?

        # The combination of Amazon Web Services Regions and Amazon Web Services accounts where you want to
        # run the association.

        @[JSON::Field(key: "TargetLocations")]
        getter target_locations : Array(Types::TargetLocation)?

        # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be
        # specified together.

        @[JSON::Field(key: "TargetMaps")]
        getter target_maps : Array(Hash(String, Array(String)))?

        # The managed nodes targeted by the request.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The CloudWatch alarm that was invoked during the association.

        @[JSON::Field(key: "TriggeredAlarms")]
        getter triggered_alarms : Array(Types::AlarmStateInformation)?

        def initialize(
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @apply_only_at_cron_interval : Bool? = nil,
          @association_id : String? = nil,
          @association_name : String? = nil,
          @association_version : String? = nil,
          @automation_target_parameter_name : String? = nil,
          @calendar_names : Array(String)? = nil,
          @compliance_severity : String? = nil,
          @date : Time? = nil,
          @document_version : String? = nil,
          @duration : Int32? = nil,
          @instance_id : String? = nil,
          @last_execution_date : Time? = nil,
          @last_successful_execution_date : Time? = nil,
          @last_update_association_date : Time? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @name : String? = nil,
          @output_location : Types::InstanceAssociationOutputLocation? = nil,
          @overview : Types::AssociationOverview? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @schedule_expression : String? = nil,
          @schedule_offset : Int32? = nil,
          @status : Types::AssociationStatus? = nil,
          @sync_compliance : String? = nil,
          @target_locations : Array(Types::TargetLocation)? = nil,
          @target_maps : Array(Hash(String, Array(String)))? = nil,
          @targets : Array(Types::Target)? = nil,
          @triggered_alarms : Array(Types::AlarmStateInformation)? = nil
        )
        end
      end

      # The specified association doesn't exist.

      struct AssociationDoesNotExist
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Includes information about the specified association.

      struct AssociationExecution
        include JSON::Serializable


        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # The association ID.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # The association version.

        @[JSON::Field(key: "AssociationVersion")]
        getter association_version : String?

        # The time the execution started.

        @[JSON::Field(key: "CreatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # Detailed status information about the execution.

        @[JSON::Field(key: "DetailedStatus")]
        getter detailed_status : String?

        # The execution ID for the association.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String?

        # The date of the last execution.

        @[JSON::Field(key: "LastExecutionDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_execution_date : Time?

        # An aggregate status of the resources in the execution based on the status type.

        @[JSON::Field(key: "ResourceCountByStatus")]
        getter resource_count_by_status : String?

        # The status of the association execution.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The CloudWatch alarms that were invoked by the association.

        @[JSON::Field(key: "TriggeredAlarms")]
        getter triggered_alarms : Array(Types::AlarmStateInformation)?

        def initialize(
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @association_id : String? = nil,
          @association_version : String? = nil,
          @created_time : Time? = nil,
          @detailed_status : String? = nil,
          @execution_id : String? = nil,
          @last_execution_date : Time? = nil,
          @resource_count_by_status : String? = nil,
          @status : String? = nil,
          @triggered_alarms : Array(Types::AlarmStateInformation)? = nil
        )
        end
      end

      # The specified execution ID doesn't exist. Verify the ID number and try again.

      struct AssociationExecutionDoesNotExist
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Filters used in the request.

      struct AssociationExecutionFilter
        include JSON::Serializable

        # The key value used in the request.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The filter type specified in the request.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The value specified for the key.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @type : String,
          @value : String
        )
        end
      end

      # Includes information about the specified association execution.

      struct AssociationExecutionTarget
        include JSON::Serializable

        # The association ID.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # The association version.

        @[JSON::Field(key: "AssociationVersion")]
        getter association_version : String?

        # Detailed information about the execution status.

        @[JSON::Field(key: "DetailedStatus")]
        getter detailed_status : String?

        # The execution ID.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String?

        # The date of the last execution.

        @[JSON::Field(key: "LastExecutionDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_execution_date : Time?

        # The location where the association details are saved.

        @[JSON::Field(key: "OutputSource")]
        getter output_source : Types::OutputSource?

        # The resource ID, for example, the managed node ID where the association ran.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The resource type, for example, EC2.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The association execution status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @association_id : String? = nil,
          @association_version : String? = nil,
          @detailed_status : String? = nil,
          @execution_id : String? = nil,
          @last_execution_date : Time? = nil,
          @output_source : Types::OutputSource? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Filters for the association execution.

      struct AssociationExecutionTargetsFilter
        include JSON::Serializable

        # The key value used in the request.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value specified for the key.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Describes a filter.

      struct AssociationFilter
        include JSON::Serializable

        # The name of the filter. InstanceId has been deprecated.

        @[JSON::Field(key: "key")]
        getter key : String

        # The filter value.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # You can have at most 2,000 active associations.

      struct AssociationLimitExceeded
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the association.

      struct AssociationOverview
        include JSON::Serializable

        # Returns the number of targets for the association status. For example, if you created an association
        # with two managed nodes, and one of them was successful, this would return the count of managed nodes
        # by status.

        @[JSON::Field(key: "AssociationStatusAggregatedCount")]
        getter association_status_aggregated_count : Hash(String, Int32)?

        # A detailed status of the association.

        @[JSON::Field(key: "DetailedStatus")]
        getter detailed_status : String?

        # The status of the association. Status can be: Pending, Success, or Failed.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @association_status_aggregated_count : Hash(String, Int32)? = nil,
          @detailed_status : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes an association status.

      struct AssociationStatus
        include JSON::Serializable

        # The date when the status changed.

        @[JSON::Field(key: "Date", converter: Aws::Runtime::UnixTimestampConverter)]
        getter date : Time

        # The reason for the status.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The status.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A user-defined string.

        @[JSON::Field(key: "AdditionalInfo")]
        getter additional_info : String?

        def initialize(
          @date : Time,
          @message : String,
          @name : String,
          @additional_info : String? = nil
        )
        end
      end

      # Information about the association version.

      struct AssociationVersionInfo
        include JSON::Serializable

        # By default, when you create new associations, the system runs it immediately after it is created and
        # then according to the schedule you specified. Specify this option if you don't want an association
        # to run immediately after you create it. This parameter isn't supported for rate expressions.

        @[JSON::Field(key: "ApplyOnlyAtCronInterval")]
        getter apply_only_at_cron_interval : Bool?

        # The ID created by the system when the association was created.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # The name specified for the association version when the association version was created.

        @[JSON::Field(key: "AssociationName")]
        getter association_name : String?

        # The association version.

        @[JSON::Field(key: "AssociationVersion")]
        getter association_version : String?

        # The names or Amazon Resource Names (ARNs) of the Change Calendar type documents your associations
        # are gated under. The associations for this version only run when that Change Calendar is open. For
        # more information, see Amazon Web Services Systems Manager Change Calendar in the Amazon Web Services
        # Systems Manager User Guide .

        @[JSON::Field(key: "CalendarNames")]
        getter calendar_names : Array(String)?

        # The severity level that is assigned to the association.

        @[JSON::Field(key: "ComplianceSeverity")]
        getter compliance_severity : String?

        # The date the association version was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The version of an Amazon Web Services Systems Manager document (SSM document) used when the
        # association version was created.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The number of hours that an association can run on specified targets. After the resulting cutoff
        # time passes, associations that are currently running are cancelled, and no pending executions are
        # started on remaining targets.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The maximum number of targets allowed to run the association at the same time. You can specify a
        # number, for example 10, or a percentage of the target set, for example 10%. The default value is
        # 100%, which means all targets run the association at the same time. If a new managed node starts and
        # attempts to run an association while Systems Manager is running MaxConcurrency associations, the
        # association is allowed to run. During the next association interval, the new managed node will
        # process its association within the limit specified for MaxConcurrency .

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The number of errors that are allowed before the system stops sending requests to run the
        # association on additional targets. You can specify either an absolute number of errors, for example
        # 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system
        # stops sending requests when the fourth error is received. If you specify 0, then the system stops
        # sending requests after the first error is returned. If you run an association on 50 managed nodes
        # and set MaxError to 10%, then the system stops sending the request when the sixth error is received.
        # Executions that are already running an association when MaxErrors is reached are allowed to
        # complete, but some of these executions may fail as well. If you need to ensure that there won't be
        # more than max-errors failed executions, set MaxConcurrency to 1 so that executions proceed one at a
        # time.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # The name specified when the association was created.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The location in Amazon S3 specified for the association when the association version was created.

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : Types::InstanceAssociationOutputLocation?

        # Parameters specified when the association version was created.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # The cron or rate schedule specified for the association when the association version was created.

        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # Number of days to wait after the scheduled day to run an association.

        @[JSON::Field(key: "ScheduleOffset")]
        getter schedule_offset : Int32?

        # The mode for generating association compliance. You can specify AUTO or MANUAL . In AUTO mode, the
        # system uses the status of the association execution to determine the compliance status. If the
        # association execution runs successfully, then the association is COMPLIANT . If the association
        # execution doesn't run successfully, the association is NON-COMPLIANT . In MANUAL mode, you must
        # specify the AssociationId as a parameter for the PutComplianceItems API operation. In this case,
        # compliance data isn't managed by State Manager, a tool in Amazon Web Services Systems Manager. It is
        # managed by your direct call to the PutComplianceItems API operation. By default, all associations
        # use AUTO mode.

        @[JSON::Field(key: "SyncCompliance")]
        getter sync_compliance : String?

        # The combination of Amazon Web Services Regions and Amazon Web Services accounts where you wanted to
        # run the association when this association version was created.

        @[JSON::Field(key: "TargetLocations")]
        getter target_locations : Array(Types::TargetLocation)?

        # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be
        # specified together.

        @[JSON::Field(key: "TargetMaps")]
        getter target_maps : Array(Hash(String, Array(String)))?

        # The targets specified for the association when the association version was created.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        def initialize(
          @apply_only_at_cron_interval : Bool? = nil,
          @association_id : String? = nil,
          @association_name : String? = nil,
          @association_version : String? = nil,
          @calendar_names : Array(String)? = nil,
          @compliance_severity : String? = nil,
          @created_date : Time? = nil,
          @document_version : String? = nil,
          @duration : Int32? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @name : String? = nil,
          @output_location : Types::InstanceAssociationOutputLocation? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @schedule_expression : String? = nil,
          @schedule_offset : Int32? = nil,
          @sync_compliance : String? = nil,
          @target_locations : Array(Types::TargetLocation)? = nil,
          @target_maps : Array(Hash(String, Array(String)))? = nil,
          @targets : Array(Types::Target)? = nil
        )
        end
      end

      # You have reached the maximum number versions allowed for an association. Each association has a
      # limit of 1,000 versions.

      struct AssociationVersionLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure that includes attributes that describe a document attachment.

      struct AttachmentContent
        include JSON::Serializable

        # The cryptographic hash value of the document content.

        @[JSON::Field(key: "Hash")]
        getter hash : String?

        # The hash algorithm used to calculate the hash value.

        @[JSON::Field(key: "HashType")]
        getter hash_type : String?

        # The name of an attachment.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The size of an attachment in bytes.

        @[JSON::Field(key: "Size")]
        getter size : Int64?

        # The URL location of the attachment content.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @hash : String? = nil,
          @hash_type : String? = nil,
          @name : String? = nil,
          @size : Int64? = nil,
          @url : String? = nil
        )
        end
      end

      # An attribute of an attachment, such as the attachment name.

      struct AttachmentInformation
        include JSON::Serializable

        # The name of the attachment.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Identifying information about a document attachment, including the file name and a key-value pair
      # that identifies the location of an attachment to a document.

      struct AttachmentsSource
        include JSON::Serializable

        # The key of a key-value pair that identifies the location of an attachment to a document.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The name of the document attachment file.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value of a key-value pair that identifies the location of an attachment to a document. The
        # format for Value depends on the type of key you specify. For the key SourceUrl , the value is an S3
        # bucket location. For example: "Values": [ "s3://amzn-s3-demo-bucket/my-prefix" ] For the key
        # S3FileUrl , the value is a file in an S3 bucket. For example: "Values": [
        # "s3://amzn-s3-demo-bucket/my-prefix/my-file.py" ] For the key AttachmentReference , the value is
        # constructed from the name of another SSM document in your account, a version number of that
        # document, and a file attached to that document version that you want to reuse. For example:
        # "Values": [ "MyOtherDocument/3/my-other-file.py" ] However, if the SSM document is shared with you
        # from another account, the full SSM document ARN must be specified instead of the document name only.
        # For example: "Values": [
        # "arn:aws:ssm:us-east-2:111122223333:document/OtherAccountDocument/3/their-file.py" ]

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Indicates that the Change Manager change template used in the change request was rejected or is
      # still in a pending state.

      struct AutomationDefinitionNotApprovedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An Automation runbook with the specified name couldn't be found.

      struct AutomationDefinitionNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An Automation runbook with the specified name and version couldn't be found.

      struct AutomationDefinitionVersionNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Detailed information about the current state of an individual Automation execution.

      struct AutomationExecution
        include JSON::Serializable

        # The details for the CloudWatch alarm applied to your automation.

        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # The ID of a State Manager association used in the Automation operation.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # The execution ID.

        @[JSON::Field(key: "AutomationExecutionId")]
        getter automation_execution_id : String?

        # The execution status of the Automation.

        @[JSON::Field(key: "AutomationExecutionStatus")]
        getter automation_execution_status : String?

        # The subtype of the Automation operation. Currently, the only supported value is ChangeRequest .

        @[JSON::Field(key: "AutomationSubtype")]
        getter automation_subtype : String?

        # The name of the Change Manager change request.

        @[JSON::Field(key: "ChangeRequestName")]
        getter change_request_name : String?

        # The action of the step that is currently running.

        @[JSON::Field(key: "CurrentAction")]
        getter current_action : String?

        # The name of the step that is currently running.

        @[JSON::Field(key: "CurrentStepName")]
        getter current_step_name : String?

        # The name of the Automation runbook used during the execution.

        @[JSON::Field(key: "DocumentName")]
        getter document_name : String?

        # The version of the document to use during execution.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The Amazon Resource Name (ARN) of the user who ran the automation.

        @[JSON::Field(key: "ExecutedBy")]
        getter executed_by : String?

        # The time the execution finished.

        @[JSON::Field(key: "ExecutionEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter execution_end_time : Time?

        # The time the execution started.

        @[JSON::Field(key: "ExecutionStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter execution_start_time : Time?

        # A message describing why an execution has failed, if the status is set to Failed.

        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        # The MaxConcurrency value specified by the user when the execution started.

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The MaxErrors value specified by the user when the execution started.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # The automation execution mode.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The ID of an OpsItem that is created to represent a Change Manager change request.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String?

        # The list of execution outputs as defined in the Automation runbook.

        @[JSON::Field(key: "Outputs")]
        getter outputs : Hash(String, Array(String))?

        # The key-value map of execution parameters, which were supplied when calling StartAutomationExecution
        # .

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # The AutomationExecutionId of the parent automation.

        @[JSON::Field(key: "ParentAutomationExecutionId")]
        getter parent_automation_execution_id : String?

        # An aggregate of step execution statuses displayed in the Amazon Web Services Systems Manager console
        # for a multi-Region and multi-account Automation execution.

        @[JSON::Field(key: "ProgressCounters")]
        getter progress_counters : Types::ProgressCounters?

        # A list of resolved targets in the rate control execution.

        @[JSON::Field(key: "ResolvedTargets")]
        getter resolved_targets : Types::ResolvedTargets?

        # Information about the Automation runbooks that are run as part of a runbook workflow. The Automation
        # runbooks specified for the runbook workflow can't run until all required approvals for the change
        # request have been received.

        @[JSON::Field(key: "Runbooks")]
        getter runbooks : Array(Types::Runbook)?

        # The date and time the Automation operation is scheduled to start.

        @[JSON::Field(key: "ScheduledTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter scheduled_time : Time?

        # A list of details about the current state of all steps that comprise an execution. An Automation
        # runbook contains a list of steps that are run in order.

        @[JSON::Field(key: "StepExecutions")]
        getter step_executions : Array(Types::StepExecution)?

        # A boolean value that indicates if the response contains the full list of the Automation step
        # executions. If true, use the DescribeAutomationStepExecutions API operation to get the full list of
        # step executions.

        @[JSON::Field(key: "StepExecutionsTruncated")]
        getter step_executions_truncated : Bool?

        # The target of the execution.

        @[JSON::Field(key: "Target")]
        getter target : String?

        # The combination of Amazon Web Services Regions and/or Amazon Web Services accounts where you want to
        # run the Automation.

        @[JSON::Field(key: "TargetLocations")]
        getter target_locations : Array(Types::TargetLocation)?

        # A publicly accessible URL for a file that contains the TargetLocations body. Currently, only files
        # in presigned Amazon S3 buckets are supported

        @[JSON::Field(key: "TargetLocationsURL")]
        getter target_locations_url : String?

        # The specified key-value mapping of document parameters to target resources.

        @[JSON::Field(key: "TargetMaps")]
        getter target_maps : Array(Hash(String, Array(String)))?

        # The parameter name.

        @[JSON::Field(key: "TargetParameterName")]
        getter target_parameter_name : String?

        # The specified targets.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The CloudWatch alarm that was invoked by the automation.

        @[JSON::Field(key: "TriggeredAlarms")]
        getter triggered_alarms : Array(Types::AlarmStateInformation)?

        # Variables defined for the automation.

        @[JSON::Field(key: "Variables")]
        getter variables : Hash(String, Array(String))?

        def initialize(
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @association_id : String? = nil,
          @automation_execution_id : String? = nil,
          @automation_execution_status : String? = nil,
          @automation_subtype : String? = nil,
          @change_request_name : String? = nil,
          @current_action : String? = nil,
          @current_step_name : String? = nil,
          @document_name : String? = nil,
          @document_version : String? = nil,
          @executed_by : String? = nil,
          @execution_end_time : Time? = nil,
          @execution_start_time : Time? = nil,
          @failure_message : String? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @mode : String? = nil,
          @ops_item_id : String? = nil,
          @outputs : Hash(String, Array(String))? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @parent_automation_execution_id : String? = nil,
          @progress_counters : Types::ProgressCounters? = nil,
          @resolved_targets : Types::ResolvedTargets? = nil,
          @runbooks : Array(Types::Runbook)? = nil,
          @scheduled_time : Time? = nil,
          @step_executions : Array(Types::StepExecution)? = nil,
          @step_executions_truncated : Bool? = nil,
          @target : String? = nil,
          @target_locations : Array(Types::TargetLocation)? = nil,
          @target_locations_url : String? = nil,
          @target_maps : Array(Hash(String, Array(String)))? = nil,
          @target_parameter_name : String? = nil,
          @targets : Array(Types::Target)? = nil,
          @triggered_alarms : Array(Types::AlarmStateInformation)? = nil,
          @variables : Hash(String, Array(String))? = nil
        )
        end
      end

      # A filter used to match specific automation executions. This is used to limit the scope of Automation
      # execution information returned.

      struct AutomationExecutionFilter
        include JSON::Serializable

        # One or more keys to limit the results.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The values used to limit the execution information associated with the filter's key.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @values : Array(String)
        )
        end
      end

      # Information about the optional inputs that can be specified for an automation execution preview.

      struct AutomationExecutionInputs
        include JSON::Serializable

        # Information about parameters that can be specified for the preview operation.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # Information about the Amazon Web Services Regions and Amazon Web Services accounts targeted by the
        # Automation execution preview operation.

        @[JSON::Field(key: "TargetLocations")]
        getter target_locations : Array(Types::TargetLocation)?

        # A publicly accessible URL for a file that contains the TargetLocations body. Currently, only files
        # in presigned Amazon S3 buckets are supported.

        @[JSON::Field(key: "TargetLocationsURL")]
        getter target_locations_url : String?

        # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be
        # specified together.

        @[JSON::Field(key: "TargetMaps")]
        getter target_maps : Array(Hash(String, Array(String)))?

        # The name of the parameter used as the target resource for the rate-controlled execution. Required if
        # you specify targets.

        @[JSON::Field(key: "TargetParameterName")]
        getter target_parameter_name : String?

        # Information about the resources that would be included in the actual runbook execution, if it were
        # to be run. Both Targets and TargetMaps can't be specified together.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        def initialize(
          @parameters : Hash(String, Array(String))? = nil,
          @target_locations : Array(Types::TargetLocation)? = nil,
          @target_locations_url : String? = nil,
          @target_maps : Array(Hash(String, Array(String)))? = nil,
          @target_parameter_name : String? = nil,
          @targets : Array(Types::Target)? = nil
        )
        end
      end

      # The number of simultaneously running Automation executions exceeded the allowable limit.

      struct AutomationExecutionLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details about a specific Automation execution.

      struct AutomationExecutionMetadata
        include JSON::Serializable

        # The details for the CloudWatch alarm applied to your automation.

        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # The ID of a State Manager association used in the Automation operation.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # The execution ID.

        @[JSON::Field(key: "AutomationExecutionId")]
        getter automation_execution_id : String?

        # The status of the execution.

        @[JSON::Field(key: "AutomationExecutionStatus")]
        getter automation_execution_status : String?

        # The subtype of the Automation operation. Currently, the only supported value is ChangeRequest .

        @[JSON::Field(key: "AutomationSubtype")]
        getter automation_subtype : String?

        # Use this filter with DescribeAutomationExecutions . Specify either Local or CrossAccount.
        # CrossAccount is an Automation that runs in multiple Amazon Web Services Regions and Amazon Web
        # Services accounts. For more information, see Running automations in multiple Amazon Web Services
        # Regions and accounts in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "AutomationType")]
        getter automation_type : String?

        # The name of the Change Manager change request.

        @[JSON::Field(key: "ChangeRequestName")]
        getter change_request_name : String?

        # The action of the step that is currently running.

        @[JSON::Field(key: "CurrentAction")]
        getter current_action : String?

        # The name of the step that is currently running.

        @[JSON::Field(key: "CurrentStepName")]
        getter current_step_name : String?

        # The name of the Automation runbook used during execution.

        @[JSON::Field(key: "DocumentName")]
        getter document_name : String?

        # The document version used during the execution.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The IAM role ARN of the user who ran the automation.

        @[JSON::Field(key: "ExecutedBy")]
        getter executed_by : String?

        # The time the execution finished. This isn't populated if the execution is still in progress.

        @[JSON::Field(key: "ExecutionEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter execution_end_time : Time?

        # The time the execution started.

        @[JSON::Field(key: "ExecutionStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter execution_start_time : Time?

        # The list of execution outputs as defined in the Automation runbook.

        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        # An S3 bucket where execution information is stored.

        @[JSON::Field(key: "LogFile")]
        getter log_file : String?

        # The MaxConcurrency value specified by the user when starting the automation.

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The MaxErrors value specified by the user when starting the automation.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # The Automation execution mode.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The ID of an OpsItem that is created to represent a Change Manager change request.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String?

        # The list of execution outputs as defined in the Automation runbook.

        @[JSON::Field(key: "Outputs")]
        getter outputs : Hash(String, Array(String))?

        # The execution ID of the parent automation.

        @[JSON::Field(key: "ParentAutomationExecutionId")]
        getter parent_automation_execution_id : String?

        # A list of targets that resolved during the execution.

        @[JSON::Field(key: "ResolvedTargets")]
        getter resolved_targets : Types::ResolvedTargets?

        # Information about the Automation runbooks that are run during a runbook workflow in Change Manager.
        # The Automation runbooks specified for the runbook workflow can't run until all required approvals
        # for the change request have been received.

        @[JSON::Field(key: "Runbooks")]
        getter runbooks : Array(Types::Runbook)?

        # The date and time the Automation operation is scheduled to start.

        @[JSON::Field(key: "ScheduledTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter scheduled_time : Time?

        # The list of execution outputs as defined in the Automation runbook.

        @[JSON::Field(key: "Target")]
        getter target : String?

        # A publicly accessible URL for a file that contains the TargetLocations body. Currently, only files
        # in presigned Amazon S3 buckets are supported

        @[JSON::Field(key: "TargetLocationsURL")]
        getter target_locations_url : String?

        # The specified key-value mapping of document parameters to target resources.

        @[JSON::Field(key: "TargetMaps")]
        getter target_maps : Array(Hash(String, Array(String)))?

        # The list of execution outputs as defined in the Automation runbook.

        @[JSON::Field(key: "TargetParameterName")]
        getter target_parameter_name : String?

        # The targets defined by the user when starting the automation.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The CloudWatch alarm that was invoked by the automation.

        @[JSON::Field(key: "TriggeredAlarms")]
        getter triggered_alarms : Array(Types::AlarmStateInformation)?

        def initialize(
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @association_id : String? = nil,
          @automation_execution_id : String? = nil,
          @automation_execution_status : String? = nil,
          @automation_subtype : String? = nil,
          @automation_type : String? = nil,
          @change_request_name : String? = nil,
          @current_action : String? = nil,
          @current_step_name : String? = nil,
          @document_name : String? = nil,
          @document_version : String? = nil,
          @executed_by : String? = nil,
          @execution_end_time : Time? = nil,
          @execution_start_time : Time? = nil,
          @failure_message : String? = nil,
          @log_file : String? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @mode : String? = nil,
          @ops_item_id : String? = nil,
          @outputs : Hash(String, Array(String))? = nil,
          @parent_automation_execution_id : String? = nil,
          @resolved_targets : Types::ResolvedTargets? = nil,
          @runbooks : Array(Types::Runbook)? = nil,
          @scheduled_time : Time? = nil,
          @target : String? = nil,
          @target_locations_url : String? = nil,
          @target_maps : Array(Hash(String, Array(String)))? = nil,
          @target_parameter_name : String? = nil,
          @targets : Array(Types::Target)? = nil,
          @triggered_alarms : Array(Types::AlarmStateInformation)? = nil
        )
        end
      end

      # There is no automation execution information for the requested automation execution ID.

      struct AutomationExecutionNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about the results of the execution preview.

      struct AutomationExecutionPreview
        include JSON::Serializable

        # Information about the Amazon Web Services Regions targeted by the execution preview.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        # Information about the type of impact a runbook step would have on a resource. Mutating : The runbook
        # step would make changes to the targets through actions that create, modify, or delete resources.
        # Non_Mutating : The runbook step would retrieve data about resources but not make changes to them.
        # This category generally includes Describe* , List* , Get* , and similar read-only API actions.
        # Undetermined : An undetermined step invokes executions performed by another orchestration service
        # like Lambda, Step Functions, or Amazon Web Services Systems Manager Run Command. An undetermined
        # step might also call a third-party API. Systems Manager Automation doesn't know the outcome of the
        # orchestration processes or third-party API executions, so the results of the steps are undetermined.

        @[JSON::Field(key: "StepPreviews")]
        getter step_previews : Hash(String, Int32)?

        # Information that provides a preview of what the impact of running the specified Automation runbook
        # would be.

        @[JSON::Field(key: "TargetPreviews")]
        getter target_previews : Array(Types::TargetPreview)?

        # Information about the Amazon Web Services accounts that were included in the execution preview.

        @[JSON::Field(key: "TotalAccounts")]
        getter total_accounts : Int32?

        def initialize(
          @regions : Array(String)? = nil,
          @step_previews : Hash(String, Int32)? = nil,
          @target_previews : Array(Types::TargetPreview)? = nil,
          @total_accounts : Int32? = nil
        )
        end
      end

      # The specified step name and execution ID don't exist. Verify the information and try again.

      struct AutomationStepNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Defines the basic information about a patch baseline override.

      struct BaselineOverride
        include JSON::Serializable


        @[JSON::Field(key: "ApprovalRules")]
        getter approval_rules : Types::PatchRuleGroup?

        # A list of explicitly approved patches for the baseline. For information about accepted formats for
        # lists of approved patches and rejected patches, see Package name formats for approved and rejected
        # patch lists in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "ApprovedPatches")]
        getter approved_patches : Array(String)?

        # Defines the compliance level for approved patches. When an approved patch is reported as missing,
        # this value describes the severity of the compliance violation.

        @[JSON::Field(key: "ApprovedPatchesComplianceLevel")]
        getter approved_patches_compliance_level : String?

        # Indicates whether the list of approved patches includes non-security updates that should be applied
        # to the managed nodes. The default value is false . Applies to Linux managed nodes only.

        @[JSON::Field(key: "ApprovedPatchesEnableNonSecurity")]
        getter approved_patches_enable_non_security : Bool?

        # Indicates whether managed nodes for which there are available security-related patches that have not
        # been approved by the baseline are being defined as COMPLIANT or NON_COMPLIANT . This option is
        # specified when the CreatePatchBaseline or UpdatePatchBaseline commands are run. Applies to Windows
        # Server managed nodes only.

        @[JSON::Field(key: "AvailableSecurityUpdatesComplianceStatus")]
        getter available_security_updates_compliance_status : String?


        @[JSON::Field(key: "GlobalFilters")]
        getter global_filters : Types::PatchFilterGroup?

        # The operating system rule used by the patch baseline override.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        # A list of explicitly rejected patches for the baseline. For information about accepted formats for
        # lists of approved patches and rejected patches, see Package name formats for approved and rejected
        # patch lists in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "RejectedPatches")]
        getter rejected_patches : Array(String)?

        # The action for Patch Manager to take on patches included in the RejectedPackages list. A patch can
        # be allowed only if it is a dependency of another package, or blocked entirely along with packages
        # that include it as a dependency.

        @[JSON::Field(key: "RejectedPatchesAction")]
        getter rejected_patches_action : String?

        # Information about the patches to use to update the managed nodes, including target operating systems
        # and source repositories. Applies to Linux managed nodes only.

        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::PatchSource)?

        def initialize(
          @approval_rules : Types::PatchRuleGroup? = nil,
          @approved_patches : Array(String)? = nil,
          @approved_patches_compliance_level : String? = nil,
          @approved_patches_enable_non_security : Bool? = nil,
          @available_security_updates_compliance_status : String? = nil,
          @global_filters : Types::PatchFilterGroup? = nil,
          @operating_system : String? = nil,
          @rejected_patches : Array(String)? = nil,
          @rejected_patches_action : String? = nil,
          @sources : Array(Types::PatchSource)? = nil
        )
        end
      end


      struct CancelCommandRequest
        include JSON::Serializable

        # The ID of the command you want to cancel.

        @[JSON::Field(key: "CommandId")]
        getter command_id : String

        # (Optional) A list of managed node IDs on which you want to cancel the command. If not provided, the
        # command is canceled on every node on which it was requested.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)?

        def initialize(
          @command_id : String,
          @instance_ids : Array(String)? = nil
        )
        end
      end

      # Whether or not the command was successfully canceled. There is no guarantee that a request can be
      # canceled.

      struct CancelCommandResult
        include JSON::Serializable

        def initialize
        end
      end


      struct CancelMaintenanceWindowExecutionRequest
        include JSON::Serializable

        # The ID of the maintenance window execution to stop.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String

        def initialize(
          @window_execution_id : String
        )
        end
      end


      struct CancelMaintenanceWindowExecutionResult
        include JSON::Serializable

        # The ID of the maintenance window execution that has been stopped.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String?

        def initialize(
          @window_execution_id : String? = nil
        )
        end
      end

      # Configuration options for sending command output to Amazon CloudWatch Logs.

      struct CloudWatchOutputConfig
        include JSON::Serializable

        # The name of the CloudWatch Logs log group where you want to send command output. If you don't
        # specify a group name, Amazon Web Services Systems Manager automatically creates a log group for you.
        # The log group uses the following naming format: aws/ssm/ SystemsManagerDocumentName

        @[JSON::Field(key: "CloudWatchLogGroupName")]
        getter cloud_watch_log_group_name : String?

        # Enables Systems Manager to send command output to CloudWatch Logs.

        @[JSON::Field(key: "CloudWatchOutputEnabled")]
        getter cloud_watch_output_enabled : Bool?

        def initialize(
          @cloud_watch_log_group_name : String? = nil,
          @cloud_watch_output_enabled : Bool? = nil
        )
        end
      end

      # Describes a command request.

      struct Command
        include JSON::Serializable

        # The details for the CloudWatch alarm applied to your command.

        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # Amazon CloudWatch Logs information where you want Amazon Web Services Systems Manager to send the
        # command output.

        @[JSON::Field(key: "CloudWatchOutputConfig")]
        getter cloud_watch_output_config : Types::CloudWatchOutputConfig?

        # A unique identifier for this command.

        @[JSON::Field(key: "CommandId")]
        getter command_id : String?

        # User-specified information about the command, such as a brief description of what the command should
        # do.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The number of targets for which the command invocation reached a terminal state. Terminal states
        # include the following: Success, Failed, Execution Timed Out, Delivery Timed Out, Cancelled,
        # Terminated, or Undeliverable.

        @[JSON::Field(key: "CompletedCount")]
        getter completed_count : Int32?

        # The number of targets for which the status is Delivery Timed Out.

        @[JSON::Field(key: "DeliveryTimedOutCount")]
        getter delivery_timed_out_count : Int32?

        # The name of the document requested for execution.

        @[JSON::Field(key: "DocumentName")]
        getter document_name : String?

        # The Systems Manager document (SSM document) version.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The number of targets for which the status is Failed or Execution Timed Out.

        @[JSON::Field(key: "ErrorCount")]
        getter error_count : Int32?

        # If a command expires, it changes status to DeliveryTimedOut for all invocations that have the status
        # InProgress , Pending , or Delayed . ExpiresAfter is calculated based on the total timeout for the
        # overall command. For more information, see Understanding command timeout values in the Amazon Web
        # Services Systems Manager User Guide .

        @[JSON::Field(key: "ExpiresAfter", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expires_after : Time?

        # The managed node IDs against which this command was requested.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)?

        # The maximum number of managed nodes that are allowed to run the command at the same time. You can
        # specify a number of managed nodes, such as 10, or a percentage of nodes, such as 10%. The default
        # value is 50. For more information about how to use MaxConcurrency , see Amazon Web Services Systems
        # Manager Run Command in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The maximum number of errors allowed before the system stops sending the command to additional
        # targets. You can specify a number of errors, such as 10, or a percentage or errors, such as 10%. The
        # default value is 0 . For more information about how to use MaxErrors , see Amazon Web Services
        # Systems Manager Run Command in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # Configurations for sending notifications about command status changes.

        @[JSON::Field(key: "NotificationConfig")]
        getter notification_config : Types::NotificationConfig?

        # The S3 bucket where the responses to the command executions should be stored. This was requested
        # when issuing the command.

        @[JSON::Field(key: "OutputS3BucketName")]
        getter output_s3_bucket_name : String?

        # The S3 directory path inside the bucket where the responses to the command executions should be
        # stored. This was requested when issuing the command.

        @[JSON::Field(key: "OutputS3KeyPrefix")]
        getter output_s3_key_prefix : String?

        # (Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Systems
        # Manager automatically determines the Amazon Web Services Region of the S3 bucket.

        @[JSON::Field(key: "OutputS3Region")]
        getter output_s3_region : String?

        # The parameter values to be inserted in the document when running the command.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # The date and time the command was requested.

        @[JSON::Field(key: "RequestedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter requested_date_time : Time?

        # The Identity and Access Management (IAM) service role that Run Command, a tool in Amazon Web
        # Services Systems Manager, uses to act on your behalf when sending notifications about command status
        # changes.

        @[JSON::Field(key: "ServiceRole")]
        getter service_role : String?

        # The status of the command.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed status of the command execution. StatusDetails includes more information than Status
        # because it includes states resulting from error and concurrency control parameters. StatusDetails
        # can show different results than Status. For more information about these statuses, see Understanding
        # command statuses in the Amazon Web Services Systems Manager User Guide . StatusDetails can be one of
        # the following values: Pending: The command hasn't been sent to any managed nodes. In Progress: The
        # command has been sent to at least one managed node but hasn't reached a final state on all managed
        # nodes. Success: The command successfully ran on all invocations. This is a terminal state. Delivery
        # Timed Out: The value of MaxErrors or more command invocations shows a status of Delivery Timed Out.
        # This is a terminal state. Execution Timed Out: The value of MaxErrors or more command invocations
        # shows a status of Execution Timed Out. This is a terminal state. Failed: The value of MaxErrors or
        # more command invocations shows a status of Failed. This is a terminal state. Incomplete: The command
        # was attempted on all managed nodes and one or more invocations doesn't have a value of Success but
        # not enough invocations failed for the status to be Failed. This is a terminal state. Cancelled: The
        # command was terminated before it was completed. This is a terminal state. Rate Exceeded: The number
        # of managed nodes targeted by the command exceeded the account limit for pending invocations. The
        # system has canceled the command before running it on any managed node. This is a terminal state.
        # Delayed: The system attempted to send the command to the managed node but wasn't successful. The
        # system retries again.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : String?

        # The number of targets for the command.

        @[JSON::Field(key: "TargetCount")]
        getter target_count : Int32?

        # An array of search criteria that targets managed nodes using a Key,Value combination that you
        # specify. Targets is required if you don't provide one or more managed node IDs in the call.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The TimeoutSeconds value specified for a command.

        @[JSON::Field(key: "TimeoutSeconds")]
        getter timeout_seconds : Int32?

        # The CloudWatch alarm that was invoked by the command.

        @[JSON::Field(key: "TriggeredAlarms")]
        getter triggered_alarms : Array(Types::AlarmStateInformation)?

        def initialize(
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @cloud_watch_output_config : Types::CloudWatchOutputConfig? = nil,
          @command_id : String? = nil,
          @comment : String? = nil,
          @completed_count : Int32? = nil,
          @delivery_timed_out_count : Int32? = nil,
          @document_name : String? = nil,
          @document_version : String? = nil,
          @error_count : Int32? = nil,
          @expires_after : Time? = nil,
          @instance_ids : Array(String)? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @notification_config : Types::NotificationConfig? = nil,
          @output_s3_bucket_name : String? = nil,
          @output_s3_key_prefix : String? = nil,
          @output_s3_region : String? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @requested_date_time : Time? = nil,
          @service_role : String? = nil,
          @status : String? = nil,
          @status_details : String? = nil,
          @target_count : Int32? = nil,
          @targets : Array(Types::Target)? = nil,
          @timeout_seconds : Int32? = nil,
          @triggered_alarms : Array(Types::AlarmStateInformation)? = nil
        )
        end
      end

      # Describes a command filter. A managed node ID can't be specified when a command status is Pending
      # because the command hasn't run on the node yet.

      struct CommandFilter
        include JSON::Serializable

        # The name of the filter. The ExecutionStage filter can't be used with the ListCommandInvocations
        # operation, only with ListCommands .

        @[JSON::Field(key: "key")]
        getter key : String

        # The filter value. Valid values for each filter key are as follows: InvokedAfter : Specify a
        # timestamp to limit your results. For example, specify 2024-07-07T00:00:00Z to see a list of command
        # executions occurring July 7, 2021, and later. InvokedBefore : Specify a timestamp to limit your
        # results. For example, specify 2024-07-07T00:00:00Z to see a list of command executions from before
        # July 7, 2021. Status : Specify a valid command status to see a list of all command executions with
        # that status. The status choices depend on the API you call. The status values you can specify for
        # ListCommands are: Pending InProgress Success Cancelled Failed TimedOut (this includes both Delivery
        # and Execution time outs) AccessDenied DeliveryTimedOut ExecutionTimedOut Incomplete NoInstancesInTag
        # LimitExceeded The status values you can specify for ListCommandInvocations are: Pending InProgress
        # Delayed Success Cancelled Failed TimedOut (this includes both Delivery and Execution time outs)
        # AccessDenied DeliveryTimedOut ExecutionTimedOut Undeliverable InvalidPlatform Terminated
        # DocumentName : Specify name of the Amazon Web Services Systems Manager document (SSM document) for
        # which you want to see command execution results. For example, specify AWS-RunPatchBaseline to see
        # command executions that used this SSM document to perform security patching operations on managed
        # nodes. ExecutionStage : Specify one of the following values ( ListCommands operations only):
        # Executing : Returns a list of command executions that are currently still running. Complete :
        # Returns a list of command executions that have already completed.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # An invocation is a copy of a command sent to a specific managed node. A command can apply to one or
      # more managed nodes. A command invocation applies to one managed node. For example, if a user runs
      # SendCommand against three managed nodes, then a command invocation is created for each requested
      # managed node ID. A command invocation returns status and detail information about a command you ran.

      struct CommandInvocation
        include JSON::Serializable

        # Amazon CloudWatch Logs information where you want Amazon Web Services Systems Manager to send the
        # command output.

        @[JSON::Field(key: "CloudWatchOutputConfig")]
        getter cloud_watch_output_config : Types::CloudWatchOutputConfig?

        # The command against which this invocation was requested.

        @[JSON::Field(key: "CommandId")]
        getter command_id : String?

        # Plugins processed by the command.

        @[JSON::Field(key: "CommandPlugins")]
        getter command_plugins : Array(Types::CommandPlugin)?

        # User-specified information about the command, such as a brief description of what the command should
        # do.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The document name that was requested for execution.

        @[JSON::Field(key: "DocumentName")]
        getter document_name : String?

        # The Systems Manager document (SSM document) version.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The managed node ID in which this invocation was requested.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The fully qualified host name of the managed node.

        @[JSON::Field(key: "InstanceName")]
        getter instance_name : String?

        # Configurations for sending notifications about command status changes on a per managed node basis.

        @[JSON::Field(key: "NotificationConfig")]
        getter notification_config : Types::NotificationConfig?

        # The time and date the request was sent to this managed node.

        @[JSON::Field(key: "RequestedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter requested_date_time : Time?

        # The Identity and Access Management (IAM) service role that Run Command, a tool in Amazon Web
        # Services Systems Manager, uses to act on your behalf when sending notifications about command status
        # changes on a per managed node basis.

        @[JSON::Field(key: "ServiceRole")]
        getter service_role : String?

        # The URL to the plugin's StdErr file in Amazon Simple Storage Service (Amazon S3), if the S3 bucket
        # was defined for the parent command. For an invocation, StandardErrorUrl is populated if there is
        # just one plugin defined for the command, and the S3 bucket was defined for the command.

        @[JSON::Field(key: "StandardErrorUrl")]
        getter standard_error_url : String?

        # The URL to the plugin's StdOut file in Amazon Simple Storage Service (Amazon S3), if the S3 bucket
        # was defined for the parent command. For an invocation, StandardOutputUrl is populated if there is
        # just one plugin defined for the command, and the S3 bucket was defined for the command.

        @[JSON::Field(key: "StandardOutputUrl")]
        getter standard_output_url : String?

        # Whether or not the invocation succeeded, failed, or is pending.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed status of the command execution for each invocation (each managed node targeted by the
        # command). StatusDetails includes more information than Status because it includes states resulting
        # from error and concurrency control parameters. StatusDetails can show different results than Status.
        # For more information about these statuses, see Understanding command statuses in the Amazon Web
        # Services Systems Manager User Guide . StatusDetails can be one of the following values: Pending: The
        # command hasn't been sent to the managed node. In Progress: The command has been sent to the managed
        # node but hasn't reached a terminal state. Success: The execution of the command or plugin was
        # successfully completed. This is a terminal state. Delivery Timed Out: The command wasn't delivered
        # to the managed node before the delivery timeout expired. Delivery timeouts don't count against the
        # parent command's MaxErrors limit, but they do contribute to whether the parent command status is
        # Success or Incomplete. This is a terminal state. Execution Timed Out: Command execution started on
        # the managed node, but the execution wasn't complete before the execution timeout expired. Execution
        # timeouts count against the MaxErrors limit of the parent command. This is a terminal state. Failed:
        # The command wasn't successful on the managed node. For a plugin, this indicates that the result code
        # wasn't zero. For a command invocation, this indicates that the result code for one or more plugins
        # wasn't zero. Invocation failures count against the MaxErrors limit of the parent command. This is a
        # terminal state. Cancelled: The command was terminated before it was completed. This is a terminal
        # state. Undeliverable: The command can't be delivered to the managed node. The managed node might not
        # exist or might not be responding. Undeliverable invocations don't count against the parent command's
        # MaxErrors limit and don't contribute to whether the parent command status is Success or Incomplete.
        # This is a terminal state. Terminated: The parent command exceeded its MaxErrors limit and subsequent
        # command invocations were canceled by the system. This is a terminal state. Delayed: The system
        # attempted to send the command to the managed node but wasn't successful. The system retries again.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : String?

        # Gets the trace output sent by the agent.

        @[JSON::Field(key: "TraceOutput")]
        getter trace_output : String?

        def initialize(
          @cloud_watch_output_config : Types::CloudWatchOutputConfig? = nil,
          @command_id : String? = nil,
          @command_plugins : Array(Types::CommandPlugin)? = nil,
          @comment : String? = nil,
          @document_name : String? = nil,
          @document_version : String? = nil,
          @instance_id : String? = nil,
          @instance_name : String? = nil,
          @notification_config : Types::NotificationConfig? = nil,
          @requested_date_time : Time? = nil,
          @service_role : String? = nil,
          @standard_error_url : String? = nil,
          @standard_output_url : String? = nil,
          @status : String? = nil,
          @status_details : String? = nil,
          @trace_output : String? = nil
        )
        end
      end

      # Describes plugin details.

      struct CommandPlugin
        include JSON::Serializable

        # The name of the plugin. Must be one of the following: aws:updateAgent , aws:domainjoin ,
        # aws:applications , aws:runPowerShellScript , aws:psmodule , aws:cloudWatch , aws:runShellScript , or
        # aws:updateSSMAgent .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Output of the plugin execution.

        @[JSON::Field(key: "Output")]
        getter output : String?

        # The S3 bucket where the responses to the command executions should be stored. This was requested
        # when issuing the command. For example, in the following response:
        # amzn-s3-demo-bucket/my-prefix/i-02573cafcfEXAMPLE/awsrunShellScript amzn-s3-demo-bucket is the name
        # of the S3 bucket; my-prefix is the name of the S3 prefix; i-02573cafcfEXAMPLE is the managed node
        # ID; awsrunShellScript is the name of the plugin.

        @[JSON::Field(key: "OutputS3BucketName")]
        getter output_s3_bucket_name : String?

        # The S3 directory path inside the bucket where the responses to the command executions should be
        # stored. This was requested when issuing the command. For example, in the following response:
        # amzn-s3-demo-bucket/my-prefix/i-02573cafcfEXAMPLE/awsrunShellScript amzn-s3-demo-bucket is the name
        # of the S3 bucket; my-prefix is the name of the S3 prefix; i-02573cafcfEXAMPLE is the managed node
        # ID; awsrunShellScript is the name of the plugin.

        @[JSON::Field(key: "OutputS3KeyPrefix")]
        getter output_s3_key_prefix : String?

        # (Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Amazon Web
        # Services Systems Manager automatically determines the S3 bucket region.

        @[JSON::Field(key: "OutputS3Region")]
        getter output_s3_region : String?

        # A numeric response code generated after running the plugin.

        @[JSON::Field(key: "ResponseCode")]
        getter response_code : Int32?

        # The time the plugin stopped running. Could stop prematurely if, for example, a cancel command was
        # sent.

        @[JSON::Field(key: "ResponseFinishDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter response_finish_date_time : Time?

        # The time the plugin started running.

        @[JSON::Field(key: "ResponseStartDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter response_start_date_time : Time?

        # The URL for the complete text written by the plugin to stderr. If execution isn't yet complete, then
        # this string is empty.

        @[JSON::Field(key: "StandardErrorUrl")]
        getter standard_error_url : String?

        # The URL for the complete text written by the plugin to stdout in Amazon S3. If the S3 bucket for the
        # command wasn't specified, then this string is empty.

        @[JSON::Field(key: "StandardOutputUrl")]
        getter standard_output_url : String?

        # The status of this plugin. You can run a document with multiple plugins.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed status of the plugin execution. StatusDetails includes more information than Status
        # because it includes states resulting from error and concurrency control parameters. StatusDetails
        # can show different results than Status. For more information about these statuses, see Understanding
        # command statuses in the Amazon Web Services Systems Manager User Guide . StatusDetails can be one of
        # the following values: Pending: The command hasn't been sent to the managed node. In Progress: The
        # command has been sent to the managed node but hasn't reached a terminal state. Success: The
        # execution of the command or plugin was successfully completed. This is a terminal state. Delivery
        # Timed Out: The command wasn't delivered to the managed node before the delivery timeout expired.
        # Delivery timeouts don't count against the parent command's MaxErrors limit, but they do contribute
        # to whether the parent command status is Success or Incomplete. This is a terminal state. Execution
        # Timed Out: Command execution started on the managed node, but the execution wasn't complete before
        # the execution timeout expired. Execution timeouts count against the MaxErrors limit of the parent
        # command. This is a terminal state. Failed: The command wasn't successful on the managed node. For a
        # plugin, this indicates that the result code wasn't zero. For a command invocation, this indicates
        # that the result code for one or more plugins wasn't zero. Invocation failures count against the
        # MaxErrors limit of the parent command. This is a terminal state. Cancelled: The command was
        # terminated before it was completed. This is a terminal state. Undeliverable: The command can't be
        # delivered to the managed node. The managed node might not exist, or it might not be responding.
        # Undeliverable invocations don't count against the parent command's MaxErrors limit, and they don't
        # contribute to whether the parent command status is Success or Incomplete. This is a terminal state.
        # Terminated: The parent command exceeded its MaxErrors limit and subsequent command invocations were
        # canceled by the system. This is a terminal state.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : String?

        def initialize(
          @name : String? = nil,
          @output : String? = nil,
          @output_s3_bucket_name : String? = nil,
          @output_s3_key_prefix : String? = nil,
          @output_s3_region : String? = nil,
          @response_code : Int32? = nil,
          @response_finish_date_time : Time? = nil,
          @response_start_date_time : Time? = nil,
          @standard_error_url : String? = nil,
          @standard_output_url : String? = nil,
          @status : String? = nil,
          @status_details : String? = nil
        )
        end
      end

      # A summary of the call execution that includes an execution ID, the type of execution (for example,
      # Command ), and the date/time of the execution using a datetime object that is saved in the following
      # format: yyyy-MM-dd'T'HH:mm:ss'Z'

      struct ComplianceExecutionSummary
        include JSON::Serializable

        # The time the execution ran as a datetime object that is saved in the following format:
        # yyyy-MM-dd'T'HH:mm:ss'Z' For State Manager associations, this timestamp represents when the
        # compliance status was captured and reported by the Systems Manager service, not when the underlying
        # association was actually executed on the managed node. To track actual association execution times,
        # use the DescribeAssociationExecutionTargets command or check the association execution history in
        # the Systems Manager console.

        @[JSON::Field(key: "ExecutionTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter execution_time : Time

        # An ID created by the system when PutComplianceItems was called. For example, CommandID is a valid
        # execution ID. You can use this ID in subsequent calls.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String?

        # The type of execution. For example, Command is a valid execution type.

        @[JSON::Field(key: "ExecutionType")]
        getter execution_type : String?

        def initialize(
          @execution_time : Time,
          @execution_id : String? = nil,
          @execution_type : String? = nil
        )
        end
      end

      # Information about the compliance as defined by the resource type. For example, for a patch resource
      # type, Items includes information about the PatchSeverity, Classification, and so on.

      struct ComplianceItem
        include JSON::Serializable

        # The compliance type. For example, Association (for a State Manager association), Patch, or Custom:
        # string are all valid compliance types.

        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        # A "Key": "Value" tag combination for the compliance item.

        @[JSON::Field(key: "Details")]
        getter details : Hash(String, String)?

        # A summary for the compliance item. The summary includes an execution ID, the execution type (for
        # example, command), and the execution time. For State Manager associations, the ExecutionTime value
        # represents when the compliance status was captured and aggregated by the Systems Manager service,
        # not necessarily when the underlying association was executed on the managed node. State Manager
        # updates compliance status for all associations on an instance whenever any association executes,
        # which means multiple associations may show the same execution time even if they were executed at
        # different times.

        @[JSON::Field(key: "ExecutionSummary")]
        getter execution_summary : Types::ComplianceExecutionSummary?

        # An ID for the compliance item. For example, if the compliance item is a Windows patch, the ID could
        # be the number of the KB article; for example: KB4010320.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # An ID for the resource. For a managed node, this is the node ID.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of resource. ManagedInstance is currently the only supported resource type.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The severity of the compliance status. Severity can be one of the following: Critical, High, Medium,
        # Low, Informational, Unspecified.

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The status of the compliance item. An item is either COMPLIANT, NON_COMPLIANT, or an empty string
        # (for Windows patches that aren't applicable).

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A title for the compliance item. For example, if the compliance item is a Windows patch, the title
        # could be the title of the KB article for the patch; for example: Security Update for Active
        # Directory Federation Services.

        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @compliance_type : String? = nil,
          @details : Hash(String, String)? = nil,
          @execution_summary : Types::ComplianceExecutionSummary? = nil,
          @id : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @severity : String? = nil,
          @status : String? = nil,
          @title : String? = nil
        )
        end
      end

      # Information about a compliance item.

      struct ComplianceItemEntry
        include JSON::Serializable

        # The severity of the compliance status. Severity can be one of the following: Critical, High, Medium,
        # Low, Informational, Unspecified.

        @[JSON::Field(key: "Severity")]
        getter severity : String

        # The status of the compliance item. An item is either COMPLIANT or NON_COMPLIANT.

        @[JSON::Field(key: "Status")]
        getter status : String

        # A "Key": "Value" tag combination for the compliance item.

        @[JSON::Field(key: "Details")]
        getter details : Hash(String, String)?

        # The compliance item ID. For example, if the compliance item is a Windows patch, the ID could be the
        # number of the KB article.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The title of the compliance item. For example, if the compliance item is a Windows patch, the title
        # could be the title of the KB article for the patch; for example: Security Update for Active
        # Directory Federation Services.

        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @severity : String,
          @status : String,
          @details : Hash(String, String)? = nil,
          @id : String? = nil,
          @title : String? = nil
        )
        end
      end

      # One or more filters. Use a filter to return a more specific list of results.

      struct ComplianceStringFilter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The type of comparison that should be performed for the value: Equal, NotEqual, BeginWith, LessThan,
        # or GreaterThan.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The value for which to search.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @type : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # A summary of compliance information by compliance type.

      struct ComplianceSummaryItem
        include JSON::Serializable

        # The type of compliance item. For example, the compliance type can be Association, Patch, or
        # Custom:string.

        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        # A list of COMPLIANT items for the specified compliance type.

        @[JSON::Field(key: "CompliantSummary")]
        getter compliant_summary : Types::CompliantSummary?

        # A list of NON_COMPLIANT items for the specified compliance type.

        @[JSON::Field(key: "NonCompliantSummary")]
        getter non_compliant_summary : Types::NonCompliantSummary?

        def initialize(
          @compliance_type : String? = nil,
          @compliant_summary : Types::CompliantSummary? = nil,
          @non_compliant_summary : Types::NonCompliantSummary? = nil
        )
        end
      end

      # You specified too many custom compliance types. You can specify a maximum of 10 different types.

      struct ComplianceTypeCountLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A summary of resources that are compliant. The summary is organized according to the resource count
      # for each compliance type.

      struct CompliantSummary
        include JSON::Serializable

        # The total number of resources that are compliant.

        @[JSON::Field(key: "CompliantCount")]
        getter compliant_count : Int32?

        # A summary of the compliance severity by compliance type.

        @[JSON::Field(key: "SeveritySummary")]
        getter severity_summary : Types::SeveritySummary?

        def initialize(
          @compliant_count : Int32? = nil,
          @severity_summary : Types::SeveritySummary? = nil
        )
        end
      end


      struct CreateActivationRequest
        include JSON::Serializable

        # The name of the Identity and Access Management (IAM) role that you want to assign to the managed
        # node. This IAM role must provide AssumeRole permissions for the Amazon Web Services Systems Manager
        # service principal ssm.amazonaws.com . For more information, see Create the IAM service role required
        # for Systems Manager in a hybrid and multicloud environments in the Amazon Web Services Systems
        # Manager User Guide . You can't specify an IAM service-linked role for this parameter. You must
        # create a unique role.

        @[JSON::Field(key: "IamRole")]
        getter iam_role : String

        # The name of the registered, managed node as it will appear in the Amazon Web Services Systems
        # Manager console or when you use the Amazon Web Services command line tools to list Systems Manager
        # resources. Don't enter personally identifiable information in this field.

        @[JSON::Field(key: "DefaultInstanceName")]
        getter default_instance_name : String?

        # A user-defined description of the resource that you want to register with Systems Manager. Don't
        # enter personally identifiable information in this field.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date by which this activation request should expire, in timestamp format, such as
        # "2024-07-07T00:00:00". You can specify a date up to 30 days in advance. If you don't provide an
        # expiration date, the activation code expires in 24 hours.

        @[JSON::Field(key: "ExpirationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiration_date : Time?

        # Specify the maximum number of managed nodes you want to register. The default value is 1 .

        @[JSON::Field(key: "RegistrationLimit")]
        getter registration_limit : Int32?

        # Reserved for internal use.

        @[JSON::Field(key: "RegistrationMetadata")]
        getter registration_metadata : Array(Types::RegistrationMetadataItem)?

        # Optional metadata that you assign to a resource. Tags enable you to categorize a resource in
        # different ways, such as by purpose, owner, or environment. For example, you might want to tag an
        # activation to identify which servers or virtual machines (VMs) in your on-premises environment you
        # intend to activate. In this case, you could specify the following key-value pairs:
        # Key=OS,Value=Windows Key=Environment,Value=Production When you install SSM Agent on your on-premises
        # servers and VMs, you specify an activation ID and code. When you specify the activation ID and code,
        # tags assigned to the activation are automatically applied to the on-premises servers or VMs. You
        # can't add tags to or delete tags from an existing activation. You can tag your on-premises servers,
        # edge devices, and VMs after they connect to Systems Manager for the first time and are assigned a
        # managed node ID. This means they are listed in the Amazon Web Services Systems Manager console with
        # an ID that is prefixed with "mi-". For information about how to add tags to your managed nodes, see
        # AddTagsToResource . For information about how to remove tags from your managed nodes, see
        # RemoveTagsFromResource .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @iam_role : String,
          @default_instance_name : String? = nil,
          @description : String? = nil,
          @expiration_date : Time? = nil,
          @registration_limit : Int32? = nil,
          @registration_metadata : Array(Types::RegistrationMetadataItem)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateActivationResult
        include JSON::Serializable

        # The code the system generates when it processes the activation. The activation code functions like a
        # password to validate the activation ID.

        @[JSON::Field(key: "ActivationCode")]
        getter activation_code : String?

        # The ID number generated by the system when it processed the activation. The activation ID functions
        # like a user name.

        @[JSON::Field(key: "ActivationId")]
        getter activation_id : String?

        def initialize(
          @activation_code : String? = nil,
          @activation_id : String? = nil
        )
        end
      end


      struct CreateAssociationBatchRequest
        include JSON::Serializable

        # One or more associations.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::CreateAssociationBatchRequestEntry)

        def initialize(
          @entries : Array(Types::CreateAssociationBatchRequestEntry)
        )
        end
      end

      # Describes the association of a Amazon Web Services Systems Manager document (SSM document) and a
      # managed node.

      struct CreateAssociationBatchRequestEntry
        include JSON::Serializable

        # The name of the SSM document that contains the configuration information for the managed node. You
        # can specify Command or Automation runbooks. You can specify Amazon Web Services-predefined
        # documents, documents you created, or a document that is shared with you from another account. For
        # SSM documents that are shared with you from other Amazon Web Services accounts, you must specify the
        # complete SSM document ARN, in the following format: arn:aws:ssm: region : account-id :document/
        # document-name For example: arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document For Amazon
        # Web Services-predefined documents and SSM documents you created in your account, you only need to
        # specify the document name. For example, AWS-ApplyPatchBaseline or My-Document .

        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # By default, when you create a new association, the system runs it immediately after it is created
        # and then according to the schedule you specified and when target changes are detected. Specify true
        # for ApplyOnlyAtCronInterval if you want the association to run only according to the schedule you
        # specified. For more information, see Understanding when associations are applied to resources and
        # &gt;About target updates with Automation runbooks in the Amazon Web Services Systems Manager User
        # Guide . This parameter isn't supported for rate expressions.

        @[JSON::Field(key: "ApplyOnlyAtCronInterval")]
        getter apply_only_at_cron_interval : Bool?

        # Specify a descriptive name for the association.

        @[JSON::Field(key: "AssociationName")]
        getter association_name : String?

        # Specify the target for the association. This target is required for associations that use an
        # Automation runbook and target resources by using rate controls. Automation is a tool in Amazon Web
        # Services Systems Manager.

        @[JSON::Field(key: "AutomationTargetParameterName")]
        getter automation_target_parameter_name : String?

        # The names or Amazon Resource Names (ARNs) of the Change Calendar type documents your associations
        # are gated under. The associations only run when that Change Calendar is open. For more information,
        # see Amazon Web Services Systems Manager Change Calendar in the Amazon Web Services Systems Manager
        # User Guide .

        @[JSON::Field(key: "CalendarNames")]
        getter calendar_names : Array(String)?

        # The severity level to assign to the association.

        @[JSON::Field(key: "ComplianceSeverity")]
        getter compliance_severity : String?

        # The document version.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The number of hours the association can run before it is canceled. Duration applies to associations
        # that are currently running, and any pending and in progress commands on all targets. If a target was
        # taken offline for the association to run, it is made available again immediately, without a reboot.
        # The Duration parameter applies only when both these conditions are true: The association for which
        # you specify a duration is cancelable according to the parameters of the SSM command document or
        # Automation runbook associated with this execution. The command specifies the ApplyOnlyAtCronInterval
        # parameter, which means that the association doesn't run immediately after it is created, but only
        # according to the specified schedule.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The managed node ID. InstanceId has been deprecated. To specify a managed node ID for an
        # association, use the Targets parameter. Requests that include the parameter InstanceID with Systems
        # Manager documents (SSM documents) that use schema version 2.0 or later will fail. In addition, if
        # you use the parameter InstanceId , you can't use the parameters AssociationName , DocumentVersion ,
        # MaxErrors , MaxConcurrency , OutputLocation , or ScheduleExpression . To use these parameters, you
        # must use the Targets parameter.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The maximum number of targets allowed to run the association at the same time. You can specify a
        # number, for example 10, or a percentage of the target set, for example 10%. The default value is
        # 100%, which means all targets run the association at the same time. If a new managed node starts and
        # attempts to run an association while Systems Manager is running MaxConcurrency associations, the
        # association is allowed to run. During the next association interval, the new managed node will
        # process its association within the limit specified for MaxConcurrency .

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The number of errors that are allowed before the system stops sending requests to run the
        # association on additional targets. You can specify either an absolute number of errors, for example
        # 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system
        # stops sending requests when the fourth error is received. If you specify 0, then the system stops
        # sending requests after the first error is returned. If you run an association on 50 managed nodes
        # and set MaxError to 10%, then the system stops sending the request when the sixth error is received.
        # Executions that are already running an association when MaxErrors is reached are allowed to
        # complete, but some of these executions may fail as well. If you need to ensure that there won't be
        # more than max-errors failed executions, set MaxConcurrency to 1 so that executions proceed one at a
        # time.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # An S3 bucket where you want to store the results of this request.

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : Types::InstanceAssociationOutputLocation?

        # A description of the parameters for a document.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # A cron expression that specifies a schedule when the association runs.

        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # Number of days to wait after the scheduled day to run an association.

        @[JSON::Field(key: "ScheduleOffset")]
        getter schedule_offset : Int32?

        # The mode for generating association compliance. You can specify AUTO or MANUAL . In AUTO mode, the
        # system uses the status of the association execution to determine the compliance status. If the
        # association execution runs successfully, then the association is COMPLIANT . If the association
        # execution doesn't run successfully, the association is NON-COMPLIANT . In MANUAL mode, you must
        # specify the AssociationId as a parameter for the PutComplianceItems API operation. In this case,
        # compliance data isn't managed by State Manager, a tool in Amazon Web Services Systems Manager. It is
        # managed by your direct call to the PutComplianceItems API operation. By default, all associations
        # use AUTO mode.

        @[JSON::Field(key: "SyncCompliance")]
        getter sync_compliance : String?

        # Use this action to create an association in multiple Regions and multiple accounts.

        @[JSON::Field(key: "TargetLocations")]
        getter target_locations : Array(Types::TargetLocation)?

        # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be
        # specified together.

        @[JSON::Field(key: "TargetMaps")]
        getter target_maps : Array(Hash(String, Array(String)))?

        # The managed nodes targeted by the request.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        def initialize(
          @name : String,
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @apply_only_at_cron_interval : Bool? = nil,
          @association_name : String? = nil,
          @automation_target_parameter_name : String? = nil,
          @calendar_names : Array(String)? = nil,
          @compliance_severity : String? = nil,
          @document_version : String? = nil,
          @duration : Int32? = nil,
          @instance_id : String? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @output_location : Types::InstanceAssociationOutputLocation? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @schedule_expression : String? = nil,
          @schedule_offset : Int32? = nil,
          @sync_compliance : String? = nil,
          @target_locations : Array(Types::TargetLocation)? = nil,
          @target_maps : Array(Hash(String, Array(String)))? = nil,
          @targets : Array(Types::Target)? = nil
        )
        end
      end


      struct CreateAssociationBatchResult
        include JSON::Serializable

        # Information about the associations that failed.

        @[JSON::Field(key: "Failed")]
        getter failed : Array(Types::FailedCreateAssociation)?

        # Information about the associations that succeeded.

        @[JSON::Field(key: "Successful")]
        getter successful : Array(Types::AssociationDescription)?

        def initialize(
          @failed : Array(Types::FailedCreateAssociation)? = nil,
          @successful : Array(Types::AssociationDescription)? = nil
        )
        end
      end


      struct CreateAssociationRequest
        include JSON::Serializable

        # The name of the SSM Command document or Automation runbook that contains the configuration
        # information for the managed node. You can specify Amazon Web Services-predefined documents,
        # documents you created, or a document that is shared with you from another Amazon Web Services
        # account. For Systems Manager documents (SSM documents) that are shared with you from other Amazon
        # Web Services accounts, you must specify the complete SSM document ARN, in the following format: arn:
        # partition :ssm: region : account-id :document/ document-name For example:
        # arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document For Amazon Web Services-predefined
        # documents and SSM documents you created in your account, you only need to specify the document name.
        # For example, AWS-ApplyPatchBaseline or My-Document .

        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # By default, when you create a new association, the system runs it immediately after it is created
        # and then according to the schedule you specified and when target changes are detected. Specify true
        # for ApplyOnlyAtCronInterval if you want the association to run only according to the schedule you
        # specified. For more information, see Understanding when associations are applied to resources and
        # &gt;About target updates with Automation runbooks in the Amazon Web Services Systems Manager User
        # Guide . This parameter isn't supported for rate expressions.

        @[JSON::Field(key: "ApplyOnlyAtCronInterval")]
        getter apply_only_at_cron_interval : Bool?

        # Specify a descriptive name for the association.

        @[JSON::Field(key: "AssociationName")]
        getter association_name : String?

        # Choose the parameter that will define how your automation will branch out. This target is required
        # for associations that use an Automation runbook and target resources by using rate controls.
        # Automation is a tool in Amazon Web Services Systems Manager.

        @[JSON::Field(key: "AutomationTargetParameterName")]
        getter automation_target_parameter_name : String?

        # The names of Amazon Resource Names (ARNs) of the Change Calendar type documents you want to gate
        # your associations under. The associations only run when that change calendar is open. For more
        # information, see Amazon Web Services Systems Manager Change Calendar in the Amazon Web Services
        # Systems Manager User Guide .

        @[JSON::Field(key: "CalendarNames")]
        getter calendar_names : Array(String)?

        # The severity level to assign to the association.

        @[JSON::Field(key: "ComplianceSeverity")]
        getter compliance_severity : String?

        # The document version you want to associate with the targets. Can be a specific version or the
        # default version. State Manager doesn't support running associations that use a new version of a
        # document if that document is shared from another account. State Manager always runs the default
        # version of a document if shared from another account, even though the Systems Manager console shows
        # that a new version was processed. If you want to run an association using a new version of a
        # document shared form another account, you must set the document version to default .

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The number of hours the association can run before it is canceled. Duration applies to associations
        # that are currently running, and any pending and in progress commands on all targets. If a target was
        # taken offline for the association to run, it is made available again immediately, without a reboot.
        # The Duration parameter applies only when both these conditions are true: The association for which
        # you specify a duration is cancelable according to the parameters of the SSM command document or
        # Automation runbook associated with this execution. The command specifies the ApplyOnlyAtCronInterval
        # parameter, which means that the association doesn't run immediately after it is created, but only
        # according to the specified schedule.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The managed node ID. InstanceId has been deprecated. To specify a managed node ID for an
        # association, use the Targets parameter. Requests that include the parameter InstanceID with Systems
        # Manager documents (SSM documents) that use schema version 2.0 or later will fail. In addition, if
        # you use the parameter InstanceId , you can't use the parameters AssociationName , DocumentVersion ,
        # MaxErrors , MaxConcurrency , OutputLocation , or ScheduleExpression . To use these parameters, you
        # must use the Targets parameter.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The maximum number of targets allowed to run the association at the same time. You can specify a
        # number, for example 10, or a percentage of the target set, for example 10%. The default value is
        # 100%, which means all targets run the association at the same time. If a new managed node starts and
        # attempts to run an association while Systems Manager is running MaxConcurrency associations, the
        # association is allowed to run. During the next association interval, the new managed node will
        # process its association within the limit specified for MaxConcurrency .

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The number of errors that are allowed before the system stops sending requests to run the
        # association on additional targets. You can specify either an absolute number of errors, for example
        # 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system
        # stops sending requests when the fourth error is received. If you specify 0, then the system stops
        # sending requests after the first error is returned. If you run an association on 50 managed nodes
        # and set MaxError to 10%, then the system stops sending the request when the sixth error is received.
        # Executions that are already running an association when MaxErrors is reached are allowed to
        # complete, but some of these executions may fail as well. If you need to ensure that there won't be
        # more than max-errors failed executions, set MaxConcurrency to 1 so that executions proceed one at a
        # time.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # An Amazon Simple Storage Service (Amazon S3) bucket where you want to store the output details of
        # the request.

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : Types::InstanceAssociationOutputLocation?

        # The parameters for the runtime configuration of the document.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # A cron expression when the association will be applied to the targets.

        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # Number of days to wait after the scheduled day to run an association. For example, if you specified
        # a cron schedule of cron(0 0 ? * THU#2 *) , you could specify an offset of 3 to run the association
        # each Sunday after the second Thursday of the month. For more information about cron schedules for
        # associations, see Reference: Cron and rate expressions for Systems Manager in the Amazon Web
        # Services Systems Manager User Guide . To use offsets, you must specify the ApplyOnlyAtCronInterval
        # parameter. This option tells the system not to run an association immediately after you create it.

        @[JSON::Field(key: "ScheduleOffset")]
        getter schedule_offset : Int32?

        # The mode for generating association compliance. You can specify AUTO or MANUAL . In AUTO mode, the
        # system uses the status of the association execution to determine the compliance status. If the
        # association execution runs successfully, then the association is COMPLIANT . If the association
        # execution doesn't run successfully, the association is NON-COMPLIANT . In MANUAL mode, you must
        # specify the AssociationId as a parameter for the PutComplianceItems API operation. In this case,
        # compliance data isn't managed by State Manager. It is managed by your direct call to the
        # PutComplianceItems API operation. By default, all associations use AUTO mode.

        @[JSON::Field(key: "SyncCompliance")]
        getter sync_compliance : String?

        # Adds or overwrites one or more tags for a State Manager association. Tags are metadata that you can
        # assign to your Amazon Web Services resources. Tags enable you to categorize your resources in
        # different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an
        # optional value, both of which you define.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A location is a combination of Amazon Web Services Regions and Amazon Web Services accounts where
        # you want to run the association. Use this action to create an association in multiple Regions and
        # multiple accounts. The IncludeChildOrganizationUnits parameter is not supported by State Manager.

        @[JSON::Field(key: "TargetLocations")]
        getter target_locations : Array(Types::TargetLocation)?

        # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be
        # specified together.

        @[JSON::Field(key: "TargetMaps")]
        getter target_maps : Array(Hash(String, Array(String)))?

        # The targets for the association. You can target managed nodes by using tags, Amazon Web Services
        # resource groups, all managed nodes in an Amazon Web Services account, or individual managed node
        # IDs. You can target all managed nodes in an Amazon Web Services account by specifying the
        # InstanceIds key with a value of * . For more information about choosing targets for an association,
        # see Understanding targets and rate controls in State Manager associations in the Amazon Web Services
        # Systems Manager User Guide .

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        def initialize(
          @name : String,
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @apply_only_at_cron_interval : Bool? = nil,
          @association_name : String? = nil,
          @automation_target_parameter_name : String? = nil,
          @calendar_names : Array(String)? = nil,
          @compliance_severity : String? = nil,
          @document_version : String? = nil,
          @duration : Int32? = nil,
          @instance_id : String? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @output_location : Types::InstanceAssociationOutputLocation? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @schedule_expression : String? = nil,
          @schedule_offset : Int32? = nil,
          @sync_compliance : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_locations : Array(Types::TargetLocation)? = nil,
          @target_maps : Array(Hash(String, Array(String)))? = nil,
          @targets : Array(Types::Target)? = nil
        )
        end
      end


      struct CreateAssociationResult
        include JSON::Serializable

        # Information about the association.

        @[JSON::Field(key: "AssociationDescription")]
        getter association_description : Types::AssociationDescription?

        def initialize(
          @association_description : Types::AssociationDescription? = nil
        )
        end
      end


      struct CreateDocumentRequest
        include JSON::Serializable

        # The content for the new SSM document in JSON or YAML format. The content of the document must not
        # exceed 64KB. This quota also includes the content specified for input parameters at runtime. We
        # recommend storing the contents for your new document in an external JSON or YAML file and
        # referencing the file in a command. For examples, see the following topics in the Amazon Web Services
        # Systems Manager User Guide . Create an SSM document (console) Create an SSM document (command line)
        # Create an SSM document (API)

        @[JSON::Field(key: "Content")]
        getter content : String

        # A name for the SSM document. You can't use the following strings as document name prefixes. These
        # are reserved by Amazon Web Services for use as document name prefixes: aws amazon amzn AWSEC2
        # AWSConfigRemediation AWSSupport

        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of key-value pairs that describe attachments to a version of a document.

        @[JSON::Field(key: "Attachments")]
        getter attachments : Array(Types::AttachmentsSource)?

        # An optional field where you can specify a friendly name for the SSM document. This value can differ
        # for each version of the document. You can update this value at a later time using the UpdateDocument
        # operation.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Specify the document format for the request. The document format can be JSON, YAML, or TEXT. JSON is
        # the default format.

        @[JSON::Field(key: "DocumentFormat")]
        getter document_format : String?

        # The type of document to create. The DeploymentStrategy document type is an internal-use-only
        # document type reserved for AppConfig.

        @[JSON::Field(key: "DocumentType")]
        getter document_type : String?

        # A list of SSM documents required by a document. This parameter is used exclusively by AppConfig.
        # When a user creates an AppConfig configuration in an SSM document, the user must also specify a
        # required document for validation purposes. In this case, an ApplicationConfiguration document
        # requires an ApplicationConfigurationSchema document for validation purposes. For more information,
        # see What is AppConfig? in the AppConfig User Guide .

        @[JSON::Field(key: "Requires")]
        getter requires : Array(Types::DocumentRequires)?

        # Optional metadata that you assign to a resource. Tags enable you to categorize a resource in
        # different ways, such as by purpose, owner, or environment. For example, you might want to tag an SSM
        # document to identify the types of targets or the environment where it will run. In this case, you
        # could specify the following key-value pairs: Key=OS,Value=Windows Key=Environment,Value=Production
        # To add tags to an existing SSM document, use the AddTagsToResource operation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specify a target type to define the kinds of resources the document can run on. For example, to run
        # a document on EC2 instances, specify the following value: /AWS::EC2::Instance . If you specify a
        # value of '/' the document can run on all types of resources. If you don't specify a value, the
        # document can't run on any resources. For a list of valid resource types, see Amazon Web Services
        # resource and property types reference in the CloudFormation User Guide .

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        # An optional field specifying the version of the artifact you are creating with the document. For
        # example, Release12.1 . This value is unique across all versions of a document, and can't be changed.

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @content : String,
          @name : String,
          @attachments : Array(Types::AttachmentsSource)? = nil,
          @display_name : String? = nil,
          @document_format : String? = nil,
          @document_type : String? = nil,
          @requires : Array(Types::DocumentRequires)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_type : String? = nil,
          @version_name : String? = nil
        )
        end
      end


      struct CreateDocumentResult
        include JSON::Serializable

        # Information about the SSM document.

        @[JSON::Field(key: "DocumentDescription")]
        getter document_description : Types::DocumentDescription?

        def initialize(
          @document_description : Types::DocumentDescription? = nil
        )
        end
      end


      struct CreateMaintenanceWindowRequest
        include JSON::Serializable

        # Enables a maintenance window task to run on managed nodes, even if you haven't registered those
        # nodes as targets. If enabled, then you must specify the unregistered managed nodes (by node ID) when
        # you register a task with the maintenance window. If you don't enable this option, then you must
        # specify previously-registered targets when you register a task with the maintenance window.

        @[JSON::Field(key: "AllowUnassociatedTargets")]
        getter allow_unassociated_targets : Bool

        # The number of hours before the end of the maintenance window that Amazon Web Services Systems
        # Manager stops scheduling new tasks for execution.

        @[JSON::Field(key: "Cutoff")]
        getter cutoff : Int32

        # The duration of the maintenance window in hours.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32

        # The name of the maintenance window.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The schedule of the maintenance window in the form of a cron or rate expression.

        @[JSON::Field(key: "Schedule")]
        getter schedule : String

        # User-provided idempotency token.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # An optional description for the maintenance window. We recommend specifying a description to help
        # you organize your maintenance windows.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become
        # inactive. EndDate allows you to set a date and time in the future when the maintenance window will
        # no longer run.

        @[JSON::Field(key: "EndDate")]
        getter end_date : String?

        # The number of days to wait after the date and time specified by a cron expression before running the
        # maintenance window. For example, the following cron expression schedules a maintenance window to run
        # on the third Tuesday of every month at 11:30 PM. cron(30 23 ? * TUE#3 *) If the schedule offset is 2
        # , the maintenance window won't run until two days later.

        @[JSON::Field(key: "ScheduleOffset")]
        getter schedule_offset : Int32?

        # The time zone that the scheduled maintenance window executions are based on, in Internet Assigned
        # Numbers Authority (IANA) format. For example: "America/Los_Angeles", "UTC", or "Asia/Seoul". For
        # more information, see the Time Zone Database on the IANA website.

        @[JSON::Field(key: "ScheduleTimezone")]
        getter schedule_timezone : String?

        # The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become
        # active. StartDate allows you to delay activation of the maintenance window until the specified
        # future date. When using a rate schedule, if you provide a start date that occurs in the past, the
        # current date and time are used as the start date.

        @[JSON::Field(key: "StartDate")]
        getter start_date : String?

        # Optional metadata that you assign to a resource. Tags enable you to categorize a resource in
        # different ways, such as by purpose, owner, or environment. For example, you might want to tag a
        # maintenance window to identify the type of tasks it will run, the types of targets, and the
        # environment it will run in. In this case, you could specify the following key-value pairs:
        # Key=TaskType,Value=AgentUpdate Key=OS,Value=Windows Key=Environment,Value=Production To add tags to
        # an existing maintenance window, use the AddTagsToResource operation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @allow_unassociated_targets : Bool,
          @cutoff : Int32,
          @duration : Int32,
          @name : String,
          @schedule : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @end_date : String? = nil,
          @schedule_offset : Int32? = nil,
          @schedule_timezone : String? = nil,
          @start_date : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateMaintenanceWindowResult
        include JSON::Serializable

        # The ID of the created maintenance window.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        def initialize(
          @window_id : String? = nil
        )
        end
      end


      struct CreateOpsItemRequest
        include JSON::Serializable

        # User-defined text that contains information about the OpsItem, in Markdown format. Provide enough
        # information so that users viewing this OpsItem for the first time understand the issue.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The origin of the OpsItem, such as Amazon EC2 or Systems Manager. The source name can't contain the
        # following strings: aws , amazon , and amzn .

        @[JSON::Field(key: "Source")]
        getter source : String

        # A short heading that describes the nature of the OpsItem and the impacted resource.

        @[JSON::Field(key: "Title")]
        getter title : String

        # The target Amazon Web Services account where you want to create an OpsItem. To make this call, your
        # account must be configured to work with OpsItems across accounts. For more information, see Set up
        # OpsCenter in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The time a runbook workflow ended. Currently reported only for the OpsItem type /aws/changerequest .

        @[JSON::Field(key: "ActualEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter actual_end_time : Time?

        # The time a runbook workflow started. Currently reported only for the OpsItem type /aws/changerequest
        # .

        @[JSON::Field(key: "ActualStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter actual_start_time : Time?

        # Specify a category to assign to an OpsItem.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The Amazon Resource Name (ARN) of an SNS topic where notifications are sent when this OpsItem is
        # edited or changed.

        @[JSON::Field(key: "Notifications")]
        getter notifications : Array(Types::OpsItemNotification)?

        # Operational data is custom data that provides useful reference details about the OpsItem. For
        # example, you can specify log files, error strings, license keys, troubleshooting tips, or other
        # relevant data. You enter operational data as key-value pairs. The key has a maximum length of 128
        # characters. The value has a maximum size of 20 KB. Operational data keys can't begin with the
        # following: amazon , aws , amzn , ssm , /amazon , /aws , /amzn , /ssm . You can choose to make the
        # data searchable by other users in the account or you can restrict search access. Searchable data
        # means that all users with access to the OpsItem Overview page (as provided by the DescribeOpsItems
        # API operation) can view and search on the specified data. Operational data that isn't searchable is
        # only viewable by users who have access to the OpsItem (as provided by the GetOpsItem API operation).
        # Use the /aws/resources key in OperationalData to specify a related resource in the request. Use the
        # /aws/automations key in OperationalData to associate an Automation runbook with the OpsItem. To view
        # Amazon Web Services CLI example commands that use these keys, see Create OpsItems manually in the
        # Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "OperationalData")]
        getter operational_data : Hash(String, Types::OpsItemDataValue)?

        # The type of OpsItem to create. Systems Manager supports the following types of OpsItems: /aws/issue
        # This type of OpsItem is used for default OpsItems created by OpsCenter. /aws/insight This type of
        # OpsItem is used by OpsCenter for aggregating and reporting on duplicate OpsItems. /aws/changerequest
        # This type of OpsItem is used by Change Manager for reviewing and approving or rejecting change
        # requests. Amazon Web Services Systems Manager Change Manager will no longer be open to new customers
        # starting November 7, 2025. If you would like to use Change Manager, sign up prior to that date.
        # Existing customers can continue to use the service as normal. For more information, see Amazon Web
        # Services Systems Manager Change Manager availability change .

        @[JSON::Field(key: "OpsItemType")]
        getter ops_item_type : String?

        # The time specified in a change request for a runbook workflow to end. Currently supported only for
        # the OpsItem type /aws/changerequest .

        @[JSON::Field(key: "PlannedEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter planned_end_time : Time?

        # The time specified in a change request for a runbook workflow to start. Currently supported only for
        # the OpsItem type /aws/changerequest .

        @[JSON::Field(key: "PlannedStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter planned_start_time : Time?

        # The importance of this OpsItem in relation to other OpsItems in the system.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # One or more OpsItems that share something in common with the current OpsItems. For example, related
        # OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the
        # impacted resource.

        @[JSON::Field(key: "RelatedOpsItems")]
        getter related_ops_items : Array(Types::RelatedOpsItem)?

        # Specify a severity to assign to an OpsItem.

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # Optional metadata that you assign to a resource. Tags use a key-value pair. For example:
        # Key=Department,Value=Finance To add tags to a new OpsItem, a user must have IAM permissions for both
        # the ssm:CreateOpsItems operation and the ssm:AddTagsToResource operation. To add tags to an existing
        # OpsItem, use the AddTagsToResource operation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @description : String,
          @source : String,
          @title : String,
          @account_id : String? = nil,
          @actual_end_time : Time? = nil,
          @actual_start_time : Time? = nil,
          @category : String? = nil,
          @notifications : Array(Types::OpsItemNotification)? = nil,
          @operational_data : Hash(String, Types::OpsItemDataValue)? = nil,
          @ops_item_type : String? = nil,
          @planned_end_time : Time? = nil,
          @planned_start_time : Time? = nil,
          @priority : Int32? = nil,
          @related_ops_items : Array(Types::RelatedOpsItem)? = nil,
          @severity : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateOpsItemResponse
        include JSON::Serializable

        # The OpsItem Amazon Resource Name (ARN).

        @[JSON::Field(key: "OpsItemArn")]
        getter ops_item_arn : String?

        # The ID of the OpsItem.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String?

        def initialize(
          @ops_item_arn : String? = nil,
          @ops_item_id : String? = nil
        )
        end
      end


      struct CreateOpsMetadataRequest
        include JSON::Serializable

        # A resource ID for a new Application Manager application.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Metadata for a new Application Manager application.

        @[JSON::Field(key: "Metadata")]
        getter metadata : Hash(String, Types::MetadataValue)?

        # Optional metadata that you assign to a resource. You can specify a maximum of five tags for an
        # OpsMetadata object. Tags enable you to categorize a resource in different ways, such as by purpose,
        # owner, or environment. For example, you might want to tag an OpsMetadata object to identify an
        # environment or target Amazon Web Services Region. In this case, you could specify the following
        # key-value pairs: Key=Environment,Value=Production Key=Region,Value=us-east-2

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_id : String,
          @metadata : Hash(String, Types::MetadataValue)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateOpsMetadataResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the OpsMetadata Object or blob created by the call.

        @[JSON::Field(key: "OpsMetadataArn")]
        getter ops_metadata_arn : String?

        def initialize(
          @ops_metadata_arn : String? = nil
        )
        end
      end


      struct CreatePatchBaselineRequest
        include JSON::Serializable

        # The name of the patch baseline.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A set of rules used to include patches in the baseline.

        @[JSON::Field(key: "ApprovalRules")]
        getter approval_rules : Types::PatchRuleGroup?

        # A list of explicitly approved patches for the baseline. For information about accepted formats for
        # lists of approved patches and rejected patches, see Package name formats for approved and rejected
        # patch lists in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "ApprovedPatches")]
        getter approved_patches : Array(String)?

        # Defines the compliance level for approved patches. When an approved patch is reported as missing,
        # this value describes the severity of the compliance violation. The default value is UNSPECIFIED .

        @[JSON::Field(key: "ApprovedPatchesComplianceLevel")]
        getter approved_patches_compliance_level : String?

        # Indicates whether the list of approved patches includes non-security updates that should be applied
        # to the managed nodes. The default value is false . Applies to Linux managed nodes only.

        @[JSON::Field(key: "ApprovedPatchesEnableNonSecurity")]
        getter approved_patches_enable_non_security : Bool?

        # Indicates the status you want to assign to security patches that are available but not approved
        # because they don't meet the installation criteria specified in the patch baseline. Example scenario:
        # Security patches that you might want installed can be skipped if you have specified a long period to
        # wait after a patch is released before installation. If an update to the patch is released during
        # your specified waiting period, the waiting period for installing the patch starts over. If the
        # waiting period is too long, multiple versions of the patch could be released but never installed.
        # Supported for Windows Server managed nodes only.

        @[JSON::Field(key: "AvailableSecurityUpdatesComplianceStatus")]
        getter available_security_updates_compliance_status : String?

        # User-provided idempotency token.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description of the patch baseline.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A set of global filters used to include patches in the baseline. The GlobalFilters parameter can be
        # configured only by using the CLI or an Amazon Web Services SDK. It can't be configured from the
        # Patch Manager console, and its value isn't displayed in the console.

        @[JSON::Field(key: "GlobalFilters")]
        getter global_filters : Types::PatchFilterGroup?

        # Defines the operating system the patch baseline applies to. The default value is WINDOWS .

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        # A list of explicitly rejected patches for the baseline. For information about accepted formats for
        # lists of approved patches and rejected patches, see Package name formats for approved and rejected
        # patch lists in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "RejectedPatches")]
        getter rejected_patches : Array(String)?

        # The action for Patch Manager to take on patches included in the RejectedPackages list.
        # ALLOW_AS_DEPENDENCY Linux and macOS : A package in the rejected patches list is installed only if it
        # is a dependency of another package. It is considered compliant with the patch baseline, and its
        # status is reported as INSTALLED_OTHER . This is the default action if no option is specified.
        # Windows Server : Windows Server doesn't support the concept of package dependencies. If a package in
        # the rejected patches list and already installed on the node, its status is reported as
        # INSTALLED_OTHER . Any package not already installed on the node is skipped. This is the default
        # action if no option is specified. BLOCK All OSs : Packages in the rejected patches list, and
        # packages that include them as dependencies, aren't installed by Patch Manager under any
        # circumstances. State value assignment for patch compliance: If a package was installed before it was
        # added to the rejected patches list, or is installed outside of Patch Manager afterward, it's
        # considered noncompliant with the patch baseline and its status is reported as INSTALLED_REJECTED .
        # If an update attempts to install a dependency package that is now rejected by the baseline, when
        # previous versions of the package were not rejected, the package being updated is reported as MISSING
        # for SCAN operations and as FAILED for INSTALL operations.

        @[JSON::Field(key: "RejectedPatchesAction")]
        getter rejected_patches_action : String?

        # Information about the patches to use to update the managed nodes, including target operating systems
        # and source repositories. Applies to Linux managed nodes only.

        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::PatchSource)?

        # Optional metadata that you assign to a resource. Tags enable you to categorize a resource in
        # different ways, such as by purpose, owner, or environment. For example, you might want to tag a
        # patch baseline to identify the severity level of patches it specifies and the operating system
        # family it applies to. In this case, you could specify the following key-value pairs:
        # Key=PatchSeverity,Value=Critical Key=OS,Value=Windows To add tags to an existing patch baseline, use
        # the AddTagsToResource operation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @approval_rules : Types::PatchRuleGroup? = nil,
          @approved_patches : Array(String)? = nil,
          @approved_patches_compliance_level : String? = nil,
          @approved_patches_enable_non_security : Bool? = nil,
          @available_security_updates_compliance_status : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @global_filters : Types::PatchFilterGroup? = nil,
          @operating_system : String? = nil,
          @rejected_patches : Array(String)? = nil,
          @rejected_patches_action : String? = nil,
          @sources : Array(Types::PatchSource)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePatchBaselineResult
        include JSON::Serializable

        # The ID of the created patch baseline.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String?

        def initialize(
          @baseline_id : String? = nil
        )
        end
      end


      struct CreateResourceDataSyncRequest
        include JSON::Serializable

        # A name for the configuration.

        @[JSON::Field(key: "SyncName")]
        getter sync_name : String

        # Amazon S3 configuration details for the sync. This parameter is required if the SyncType value is
        # SyncToDestination.

        @[JSON::Field(key: "S3Destination")]
        getter s3_destination : Types::ResourceDataSyncS3Destination?

        # Specify information about the data sources to synchronize. This parameter is required if the
        # SyncType value is SyncFromSource.

        @[JSON::Field(key: "SyncSource")]
        getter sync_source : Types::ResourceDataSyncSource?

        # Specify SyncToDestination to create a resource data sync that synchronizes data to an S3 bucket for
        # Inventory. If you specify SyncToDestination , you must provide a value for S3Destination . Specify
        # SyncFromSource to synchronize data from a single account and multiple Regions, or multiple Amazon
        # Web Services accounts and Amazon Web Services Regions, as listed in Organizations for Explorer. If
        # you specify SyncFromSource , you must provide a value for SyncSource . The default value is
        # SyncToDestination .

        @[JSON::Field(key: "SyncType")]
        getter sync_type : String?

        def initialize(
          @sync_name : String,
          @s3_destination : Types::ResourceDataSyncS3Destination? = nil,
          @sync_source : Types::ResourceDataSyncSource? = nil,
          @sync_type : String? = nil
        )
        end
      end


      struct CreateResourceDataSyncResult
        include JSON::Serializable

        def initialize
        end
      end

      # The temporary security credentials, which include an access key ID, a secret access key, and a
      # security (or session) token.

      struct Credentials
        include JSON::Serializable

        # The access key ID that identifies the temporary security credentials.

        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String

        # The datetime on which the current credentials expire.

        @[JSON::Field(key: "ExpirationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiration_time : Time

        # The secret access key that can be used to sign requests.

        @[JSON::Field(key: "SecretAccessKey")]
        getter secret_access_key : String

        # The token that users must pass to the service API to use the temporary credentials.

        @[JSON::Field(key: "SessionToken")]
        getter session_token : String

        def initialize(
          @access_key_id : String,
          @expiration_time : Time,
          @secret_access_key : String,
          @session_token : String
        )
        end
      end

      # You have exceeded the limit for custom schemas. Delete one or more custom schemas and try again.

      struct CustomSchemaCountLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteActivationRequest
        include JSON::Serializable

        # The ID of the activation that you want to delete.

        @[JSON::Field(key: "ActivationId")]
        getter activation_id : String

        def initialize(
          @activation_id : String
        )
        end
      end


      struct DeleteActivationResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAssociationRequest
        include JSON::Serializable

        # The association ID that you want to delete.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # The managed node ID. InstanceId has been deprecated. To specify a managed node ID for an
        # association, use the Targets parameter. Requests that include the parameter InstanceID with Systems
        # Manager documents (SSM documents) that use schema version 2.0 or later will fail. In addition, if
        # you use the parameter InstanceId , you can't use the parameters AssociationName , DocumentVersion ,
        # MaxErrors , MaxConcurrency , OutputLocation , or ScheduleExpression . To use these parameters, you
        # must use the Targets parameter.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The name of the SSM document.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @association_id : String? = nil,
          @instance_id : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct DeleteAssociationResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDocumentRequest
        include JSON::Serializable

        # The name of the document.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The version of the document that you want to delete. If not provided, all versions of the document
        # are deleted.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # Some SSM document types require that you specify a Force flag before you can delete the document.
        # For example, you must specify a Force flag to delete a document of type
        # ApplicationConfigurationSchema . You can restrict access to the Force flag in an Identity and Access
        # Management (IAM) policy.

        @[JSON::Field(key: "Force")]
        getter force : Bool?

        # The version name of the document that you want to delete. If not provided, all versions of the
        # document are deleted.

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @name : String,
          @document_version : String? = nil,
          @force : Bool? = nil,
          @version_name : String? = nil
        )
        end
      end


      struct DeleteDocumentResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteInventoryRequest
        include JSON::Serializable

        # The name of the custom inventory type for which you want to delete either all previously collected
        # data or the inventory type itself.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        # User-provided idempotency token.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Use this option to view a summary of the deletion request without deleting any data or the data
        # type. This option is useful when you only want to understand what will be deleted. Once you validate
        # that the data to be deleted is what you intend to delete, you can run the same command without
        # specifying the DryRun option.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # Use the SchemaDeleteOption to delete a custom inventory type (schema). If you don't choose this
        # option, the system only deletes existing inventory data associated with the custom inventory type.
        # Choose one of the following options: DisableSchema: If you choose this option, the system ignores
        # all inventory data for the specified version, and any earlier versions. To enable this schema again,
        # you must call the PutInventory operation for a version greater than the disabled version.
        # DeleteSchema: This option deletes the specified custom type from the Inventory service. You can
        # recreate the schema later, if you want.

        @[JSON::Field(key: "SchemaDeleteOption")]
        getter schema_delete_option : String?

        def initialize(
          @type_name : String,
          @client_token : String? = nil,
          @dry_run : Bool? = nil,
          @schema_delete_option : String? = nil
        )
        end
      end


      struct DeleteInventoryResult
        include JSON::Serializable

        # Every DeleteInventory operation is assigned a unique ID. This option returns a unique ID. You can
        # use this ID to query the status of a delete operation. This option is useful for ensuring that a
        # delete operation has completed before you begin other operations.

        @[JSON::Field(key: "DeletionId")]
        getter deletion_id : String?

        # A summary of the delete operation. For more information about this summary, see Deleting custom
        # inventory in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "DeletionSummary")]
        getter deletion_summary : Types::InventoryDeletionSummary?

        # The name of the inventory data type specified in the request.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @deletion_id : String? = nil,
          @deletion_summary : Types::InventoryDeletionSummary? = nil,
          @type_name : String? = nil
        )
        end
      end


      struct DeleteMaintenanceWindowRequest
        include JSON::Serializable

        # The ID of the maintenance window to delete.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        def initialize(
          @window_id : String
        )
        end
      end


      struct DeleteMaintenanceWindowResult
        include JSON::Serializable

        # The ID of the deleted maintenance window.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        def initialize(
          @window_id : String? = nil
        )
        end
      end


      struct DeleteOpsItemRequest
        include JSON::Serializable

        # The ID of the OpsItem that you want to delete.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String

        def initialize(
          @ops_item_id : String
        )
        end
      end


      struct DeleteOpsItemResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteOpsMetadataRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an OpsMetadata Object to delete.

        @[JSON::Field(key: "OpsMetadataArn")]
        getter ops_metadata_arn : String

        def initialize(
          @ops_metadata_arn : String
        )
        end
      end


      struct DeleteOpsMetadataResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteParameterRequest
        include JSON::Serializable

        # The name of the parameter to delete. You can't enter the Amazon Resource Name (ARN) for a parameter,
        # only the parameter name itself.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteParameterResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteParametersRequest
        include JSON::Serializable

        # The names of the parameters to delete. After deleting a parameter, wait for at least 30 seconds to
        # create a parameter with the same name. You can't enter the Amazon Resource Name (ARN) for a
        # parameter, only the parameter name itself.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)

        def initialize(
          @names : Array(String)
        )
        end
      end


      struct DeleteParametersResult
        include JSON::Serializable

        # The names of the deleted parameters.

        @[JSON::Field(key: "DeletedParameters")]
        getter deleted_parameters : Array(String)?

        # The names of parameters that weren't deleted because the parameters aren't valid.

        @[JSON::Field(key: "InvalidParameters")]
        getter invalid_parameters : Array(String)?

        def initialize(
          @deleted_parameters : Array(String)? = nil,
          @invalid_parameters : Array(String)? = nil
        )
        end
      end


      struct DeletePatchBaselineRequest
        include JSON::Serializable

        # The ID of the patch baseline to delete.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String

        def initialize(
          @baseline_id : String
        )
        end
      end


      struct DeletePatchBaselineResult
        include JSON::Serializable

        # The ID of the deleted patch baseline.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String?

        def initialize(
          @baseline_id : String? = nil
        )
        end
      end


      struct DeleteResourceDataSyncRequest
        include JSON::Serializable

        # The name of the configuration to delete.

        @[JSON::Field(key: "SyncName")]
        getter sync_name : String

        # Specify the type of resource data sync to delete.

        @[JSON::Field(key: "SyncType")]
        getter sync_type : String?

        def initialize(
          @sync_name : String,
          @sync_type : String? = nil
        )
        end
      end


      struct DeleteResourceDataSyncResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # ID of the current policy version. The hash helps to prevent multiple calls from attempting to
        # overwrite a policy.

        @[JSON::Field(key: "PolicyHash")]
        getter policy_hash : String

        # The policy ID.

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        # Amazon Resource Name (ARN) of the resource to which the policies are attached.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @policy_hash : String,
          @policy_id : String,
          @resource_arn : String
        )
        end
      end


      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterManagedInstanceRequest
        include JSON::Serializable

        # The ID assigned to the managed node when you registered it using the activation process.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        def initialize(
          @instance_id : String
        )
        end
      end


      struct DeregisterManagedInstanceResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterPatchBaselineForPatchGroupRequest
        include JSON::Serializable

        # The ID of the patch baseline to deregister the patch group from.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String

        # The name of the patch group that should be deregistered from the patch baseline.

        @[JSON::Field(key: "PatchGroup")]
        getter patch_group : String

        def initialize(
          @baseline_id : String,
          @patch_group : String
        )
        end
      end


      struct DeregisterPatchBaselineForPatchGroupResult
        include JSON::Serializable

        # The ID of the patch baseline the patch group was deregistered from.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String?

        # The name of the patch group deregistered from the patch baseline.

        @[JSON::Field(key: "PatchGroup")]
        getter patch_group : String?

        def initialize(
          @baseline_id : String? = nil,
          @patch_group : String? = nil
        )
        end
      end


      struct DeregisterTargetFromMaintenanceWindowRequest
        include JSON::Serializable

        # The ID of the maintenance window the target should be removed from.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        # The ID of the target definition to remove.

        @[JSON::Field(key: "WindowTargetId")]
        getter window_target_id : String

        # The system checks if the target is being referenced by a task. If the target is being referenced,
        # the system returns an error and doesn't deregister the target from the maintenance window.

        @[JSON::Field(key: "Safe")]
        getter safe : Bool?

        def initialize(
          @window_id : String,
          @window_target_id : String,
          @safe : Bool? = nil
        )
        end
      end


      struct DeregisterTargetFromMaintenanceWindowResult
        include JSON::Serializable

        # The ID of the maintenance window the target was removed from.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        # The ID of the removed target definition.

        @[JSON::Field(key: "WindowTargetId")]
        getter window_target_id : String?

        def initialize(
          @window_id : String? = nil,
          @window_target_id : String? = nil
        )
        end
      end


      struct DeregisterTaskFromMaintenanceWindowRequest
        include JSON::Serializable

        # The ID of the maintenance window the task should be removed from.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        # The ID of the task to remove from the maintenance window.

        @[JSON::Field(key: "WindowTaskId")]
        getter window_task_id : String

        def initialize(
          @window_id : String,
          @window_task_id : String
        )
        end
      end


      struct DeregisterTaskFromMaintenanceWindowResult
        include JSON::Serializable

        # The ID of the maintenance window the task was removed from.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        # The ID of the task removed from the maintenance window.

        @[JSON::Field(key: "WindowTaskId")]
        getter window_task_id : String?

        def initialize(
          @window_id : String? = nil,
          @window_task_id : String? = nil
        )
        end
      end

      # Filter for the DescribeActivation API.

      struct DescribeActivationsFilter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "FilterKey")]
        getter filter_key : String?

        # The filter values.

        @[JSON::Field(key: "FilterValues")]
        getter filter_values : Array(String)?

        def initialize(
          @filter_key : String? = nil,
          @filter_values : Array(String)? = nil
        )
        end
      end


      struct DescribeActivationsRequest
        include JSON::Serializable

        # A filter to view information about your activations.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::DescribeActivationsFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::DescribeActivationsFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeActivationsResult
        include JSON::Serializable

        # A list of activations for your Amazon Web Services account.

        @[JSON::Field(key: "ActivationList")]
        getter activation_list : Array(Types::Activation)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @activation_list : Array(Types::Activation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAssociationExecutionTargetsRequest
        include JSON::Serializable

        # The association ID that includes the execution for which you want to view details.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String

        # The execution ID for which you want to view details.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String

        # Filters for the request. You can specify the following filters and values. Status (EQUAL) ResourceId
        # (EQUAL) ResourceType (EQUAL)

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::AssociationExecutionTargetsFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @association_id : String,
          @execution_id : String,
          @filters : Array(Types::AssociationExecutionTargetsFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAssociationExecutionTargetsResult
        include JSON::Serializable

        # Information about the execution.

        @[JSON::Field(key: "AssociationExecutionTargets")]
        getter association_execution_targets : Array(Types::AssociationExecutionTarget)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @association_execution_targets : Array(Types::AssociationExecutionTarget)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAssociationExecutionsRequest
        include JSON::Serializable

        # The association ID for which you want to view execution history details.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String

        # Filters for the request. You can specify the following filters and values. ExecutionId (EQUAL)
        # Status (EQUAL) CreatedTime (EQUAL, GREATER_THAN, LESS_THAN)

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::AssociationExecutionFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @association_id : String,
          @filters : Array(Types::AssociationExecutionFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAssociationExecutionsResult
        include JSON::Serializable

        # A list of the executions for the specified association ID.

        @[JSON::Field(key: "AssociationExecutions")]
        getter association_executions : Array(Types::AssociationExecution)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @association_executions : Array(Types::AssociationExecution)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAssociationRequest
        include JSON::Serializable

        # The association ID for which you want information.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # Specify the association version to retrieve. To view the latest version, either specify $LATEST for
        # this parameter, or omit this parameter. To view a list of all associations for a managed node, use
        # ListAssociations . To get a list of versions for a specific association, use ListAssociationVersions
        # .

        @[JSON::Field(key: "AssociationVersion")]
        getter association_version : String?

        # The managed node ID.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The name of the SSM document.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @association_id : String? = nil,
          @association_version : String? = nil,
          @instance_id : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct DescribeAssociationResult
        include JSON::Serializable

        # Information about the association.

        @[JSON::Field(key: "AssociationDescription")]
        getter association_description : Types::AssociationDescription?

        def initialize(
          @association_description : Types::AssociationDescription? = nil
        )
        end
      end


      struct DescribeAutomationExecutionsRequest
        include JSON::Serializable

        # Filters used to limit the scope of executions that are requested.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::AutomationExecutionFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::AutomationExecutionFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAutomationExecutionsResult
        include JSON::Serializable

        # The list of details about each automation execution which has occurred which matches the filter
        # specification, if any.

        @[JSON::Field(key: "AutomationExecutionMetadataList")]
        getter automation_execution_metadata_list : Array(Types::AutomationExecutionMetadata)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @automation_execution_metadata_list : Array(Types::AutomationExecutionMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAutomationStepExecutionsRequest
        include JSON::Serializable

        # The Automation execution ID for which you want step execution descriptions.

        @[JSON::Field(key: "AutomationExecutionId")]
        getter automation_execution_id : String

        # One or more filters to limit the number of step executions returned by the request.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::StepExecutionFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Indicates whether to list step executions in reverse order by start time. The default value is
        # 'false'.

        @[JSON::Field(key: "ReverseOrder")]
        getter reverse_order : Bool?

        def initialize(
          @automation_execution_id : String,
          @filters : Array(Types::StepExecutionFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @reverse_order : Bool? = nil
        )
        end
      end


      struct DescribeAutomationStepExecutionsResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of details about the current state of all steps that make up an execution.

        @[JSON::Field(key: "StepExecutions")]
        getter step_executions : Array(Types::StepExecution)?

        def initialize(
          @next_token : String? = nil,
          @step_executions : Array(Types::StepExecution)? = nil
        )
        end
      end


      struct DescribeAvailablePatchesRequest
        include JSON::Serializable

        # Each element in the array is a structure containing a key-value pair. Windows Server Supported keys
        # for Windows Server managed node patches include the following: PATCH_SET Sample values: OS |
        # APPLICATION PRODUCT Sample values: WindowsServer2012 | Office 2010 | MicrosoftDefenderAntivirus
        # PRODUCT_FAMILY Sample values: Windows | Office MSRC_SEVERITY Sample values: ServicePacks | Important
        # | Moderate CLASSIFICATION Sample values: ServicePacks | SecurityUpdates | DefinitionUpdates PATCH_ID
        # Sample values: KB123456 | KB4516046 Linux When specifying filters for Linux patches, you must
        # specify a key-pair for PRODUCT . For example, using the Command Line Interface (CLI), the following
        # command fails: aws ssm describe-available-patches --filters Key=CVE_ID,Values=CVE-2018-3615 However,
        # the following command succeeds: aws ssm describe-available-patches --filters
        # Key=PRODUCT,Values=AmazonLinux2018.03 Key=CVE_ID,Values=CVE-2018-3615 Supported keys for Linux
        # managed node patches include the following: PRODUCT Sample values: AmazonLinux2018.03 |
        # AmazonLinux2.0 NAME Sample values: kernel-headers | samba-python | php SEVERITY Sample values:
        # Critical | Important | Medium | Low EPOCH Sample values: 0 | 1 VERSION Sample values: 78.6.1 |
        # 4.10.16 RELEASE Sample values: 9.56.amzn1 | 1.amzn2 ARCH Sample values: i686 | x86_64 REPOSITORY
        # Sample values: Core | Updates ADVISORY_ID Sample values: ALAS-2018-1058 | ALAS2-2021-1594 CVE_ID
        # Sample values: CVE-2018-3615 | CVE-2020-1472 BUGZILLA_ID Sample values: 1463241

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::PatchOrchestratorFilter)?

        # The maximum number of patches to return (per page).

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::PatchOrchestratorFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAvailablePatchesResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of patches. Each entry in the array is a patch structure.

        @[JSON::Field(key: "Patches")]
        getter patches : Array(Types::Patch)?

        def initialize(
          @next_token : String? = nil,
          @patches : Array(Types::Patch)? = nil
        )
        end
      end


      struct DescribeDocumentPermissionRequest
        include JSON::Serializable

        # The name of the document for which you are the owner.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The permission type for the document. The permission type can be Share .

        @[JSON::Field(key: "PermissionType")]
        getter permission_type : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @permission_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDocumentPermissionResponse
        include JSON::Serializable

        # The account IDs that have permission to use this document. The ID can be either an Amazon Web
        # Services account number or all .

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # A list of Amazon Web Services accounts where the current document is shared and the version shared
        # with each account.

        @[JSON::Field(key: "AccountSharingInfoList")]
        getter account_sharing_info_list : Array(Types::AccountSharingInfo)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_ids : Array(String)? = nil,
          @account_sharing_info_list : Array(Types::AccountSharingInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDocumentRequest
        include JSON::Serializable

        # The name of the SSM document. If you're calling a shared SSM document from a different Amazon Web
        # Services account, Name is the full Amazon Resource Name (ARN) of the document.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The document version for which you want information. Can be a specific version or the default
        # version.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # An optional field specifying the version of the artifact associated with the document. For example,
        # 12.6. This value is unique across all versions of a document, and can't be changed.

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @name : String,
          @document_version : String? = nil,
          @version_name : String? = nil
        )
        end
      end


      struct DescribeDocumentResult
        include JSON::Serializable

        # Information about the SSM document.

        @[JSON::Field(key: "Document")]
        getter document : Types::DocumentDescription?

        def initialize(
          @document : Types::DocumentDescription? = nil
        )
        end
      end


      struct DescribeEffectiveInstanceAssociationsRequest
        include JSON::Serializable

        # The managed node ID for which you want to view all associations.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEffectiveInstanceAssociationsResult
        include JSON::Serializable

        # The associations for the requested managed node.

        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::InstanceAssociation)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @associations : Array(Types::InstanceAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEffectivePatchesForPatchBaselineRequest
        include JSON::Serializable

        # The ID of the patch baseline to retrieve the effective patches for.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String

        # The maximum number of patches to return (per page).

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @baseline_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEffectivePatchesForPatchBaselineResult
        include JSON::Serializable

        # An array of patches and patch status.

        @[JSON::Field(key: "EffectivePatches")]
        getter effective_patches : Array(Types::EffectivePatch)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @effective_patches : Array(Types::EffectivePatch)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstanceAssociationsStatusRequest
        include JSON::Serializable

        # The managed node IDs for which you want association status information.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstanceAssociationsStatusResult
        include JSON::Serializable

        # Status information about the association.

        @[JSON::Field(key: "InstanceAssociationStatusInfos")]
        getter instance_association_status_infos : Array(Types::InstanceAssociationStatusInfo)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_association_status_infos : Array(Types::InstanceAssociationStatusInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstanceInformationRequest
        include JSON::Serializable

        # One or more filters. Use a filter to return a more specific list of managed nodes. You can filter
        # based on tags applied to your managed nodes. Tag filters can't be combined with other filter types.
        # Use this Filters data type instead of InstanceInformationFilterList , which is deprecated.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::InstanceInformationStringFilter)?

        # This is a legacy method. We recommend that you don't use this method. Instead, use the Filters data
        # type. Filters enables you to return node information by filtering based on tags applied to managed
        # nodes. Attempting to use InstanceInformationFilterList and Filters leads to an exception error.

        @[JSON::Field(key: "InstanceInformationFilterList")]
        getter instance_information_filter_list : Array(Types::InstanceInformationFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results. The default value is 10 items.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::InstanceInformationStringFilter)? = nil,
          @instance_information_filter_list : Array(Types::InstanceInformationFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstanceInformationResult
        include JSON::Serializable

        # The managed node information list.

        @[JSON::Field(key: "InstanceInformationList")]
        getter instance_information_list : Array(Types::InstanceInformation)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_information_list : Array(Types::InstanceInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstancePatchStatesForPatchGroupRequest
        include JSON::Serializable

        # The name of the patch group for which the patch state information should be retrieved.

        @[JSON::Field(key: "PatchGroup")]
        getter patch_group : String

        # Each entry in the array is a structure containing: Key (string between 1 and 200 characters) Values
        # (array containing a single string) Type (string "Equal", "NotEqual", "LessThan", "GreaterThan")

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::InstancePatchStateFilter)?

        # The maximum number of patches to return (per page).

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @patch_group : String,
          @filters : Array(Types::InstancePatchStateFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstancePatchStatesForPatchGroupResult
        include JSON::Serializable

        # The high-level patch state for the requested managed nodes.

        @[JSON::Field(key: "InstancePatchStates")]
        getter instance_patch_states : Array(Types::InstancePatchState)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_patch_states : Array(Types::InstancePatchState)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstancePatchStatesRequest
        include JSON::Serializable

        # The ID of the managed node for which patch state information should be retrieved.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)

        # The maximum number of managed nodes to return (per page).

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_ids : Array(String),
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstancePatchStatesResult
        include JSON::Serializable

        # The high-level patch state for the requested managed nodes.

        @[JSON::Field(key: "InstancePatchStates")]
        getter instance_patch_states : Array(Types::InstancePatchState)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_patch_states : Array(Types::InstancePatchState)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstancePatchesRequest
        include JSON::Serializable

        # The ID of the managed node whose patch state information should be retrieved.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # Each element in the array is a structure containing a key-value pair. Supported keys for
        # DescribeInstancePatches include the following: Classification Sample values: Security |
        # SecurityUpdates KBId Sample values: KB4480056 | java-1.7.0-openjdk.x86_64 Severity Sample values:
        # Important | Medium | Low State Sample values: Installed | InstalledOther | InstalledPendingReboot
        # For lists of all State values, see Patch compliance state values in the Amazon Web Services Systems
        # Manager User Guide .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::PatchOrchestratorFilter)?

        # The maximum number of patches to return (per page).

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_id : String,
          @filters : Array(Types::PatchOrchestratorFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstancePatchesResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Each entry in the array is a structure containing: Title (string) KBId (string) Classification
        # (string) Severity (string) State (string, such as "INSTALLED" or "FAILED") InstalledTime (DateTime)
        # InstalledBy (string)

        @[JSON::Field(key: "Patches")]
        getter patches : Array(Types::PatchComplianceData)?

        def initialize(
          @next_token : String? = nil,
          @patches : Array(Types::PatchComplianceData)? = nil
        )
        end
      end


      struct DescribeInstancePropertiesRequest
        include JSON::Serializable

        # The request filters to use with the operator.

        @[JSON::Field(key: "FiltersWithOperator")]
        getter filters_with_operator : Array(Types::InstancePropertyStringFilter)?

        # An array of instance property filters.

        @[JSON::Field(key: "InstancePropertyFilterList")]
        getter instance_property_filter_list : Array(Types::InstancePropertyFilter)?

        # The maximum number of items to return for the call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token provided by a previous request to use to return the next set of properties.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters_with_operator : Array(Types::InstancePropertyStringFilter)? = nil,
          @instance_property_filter_list : Array(Types::InstancePropertyFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInstancePropertiesResult
        include JSON::Serializable

        # Properties for the managed instances.

        @[JSON::Field(key: "InstanceProperties")]
        getter instance_properties : Array(Types::InstanceProperty)?

        # The token for the next set of properties to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_properties : Array(Types::InstanceProperty)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInventoryDeletionsRequest
        include JSON::Serializable

        # Specify the delete inventory ID for which you want information. This ID was returned by the
        # DeleteInventory operation.

        @[JSON::Field(key: "DeletionId")]
        getter deletion_id : String?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @deletion_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInventoryDeletionsResult
        include JSON::Serializable

        # A list of status items for deleted inventory.

        @[JSON::Field(key: "InventoryDeletions")]
        getter inventory_deletions : Array(Types::InventoryDeletionStatusItem)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @inventory_deletions : Array(Types::InventoryDeletionStatusItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowExecutionTaskInvocationsRequest
        include JSON::Serializable

        # The ID of the specific task in the maintenance window task that should be retrieved.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        # The ID of the maintenance window execution the task is part of.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String

        # Optional filters used to scope down the returned task invocations. The supported filter key is
        # STATUS with the corresponding values PENDING , IN_PROGRESS , SUCCESS , FAILED , TIMED_OUT ,
        # CANCELLING , and CANCELLED .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::MaintenanceWindowFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @task_id : String,
          @window_execution_id : String,
          @filters : Array(Types::MaintenanceWindowFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowExecutionTaskInvocationsResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the task invocation results per invocation.

        @[JSON::Field(key: "WindowExecutionTaskInvocationIdentities")]
        getter window_execution_task_invocation_identities : Array(Types::MaintenanceWindowExecutionTaskInvocationIdentity)?

        def initialize(
          @next_token : String? = nil,
          @window_execution_task_invocation_identities : Array(Types::MaintenanceWindowExecutionTaskInvocationIdentity)? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowExecutionTasksRequest
        include JSON::Serializable

        # The ID of the maintenance window execution whose task executions should be retrieved.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String

        # Optional filters used to scope down the returned tasks. The supported filter key is STATUS with the
        # corresponding values PENDING , IN_PROGRESS , SUCCESS , FAILED , TIMED_OUT , CANCELLING , and
        # CANCELLED .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::MaintenanceWindowFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @window_execution_id : String,
          @filters : Array(Types::MaintenanceWindowFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowExecutionTasksResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the task executions.

        @[JSON::Field(key: "WindowExecutionTaskIdentities")]
        getter window_execution_task_identities : Array(Types::MaintenanceWindowExecutionTaskIdentity)?

        def initialize(
          @next_token : String? = nil,
          @window_execution_task_identities : Array(Types::MaintenanceWindowExecutionTaskIdentity)? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowExecutionsRequest
        include JSON::Serializable

        # The ID of the maintenance window whose executions should be retrieved.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        # Each entry in the array is a structure containing: Key. A string between 1 and 128 characters.
        # Supported keys include ExecutedBefore and ExecutedAfter . Values. An array of strings, each between
        # 1 and 256 characters. Supported values are date/time strings in a valid ISO 8601 date/time format,
        # such as 2024-11-04T05:00:00Z .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::MaintenanceWindowFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @window_id : String,
          @filters : Array(Types::MaintenanceWindowFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowExecutionsResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the maintenance window executions.

        @[JSON::Field(key: "WindowExecutions")]
        getter window_executions : Array(Types::MaintenanceWindowExecution)?

        def initialize(
          @next_token : String? = nil,
          @window_executions : Array(Types::MaintenanceWindowExecution)? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowScheduleRequest
        include JSON::Serializable

        # Filters used to limit the range of results. For example, you can limit maintenance window executions
        # to only those scheduled before or after a certain date and time.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::PatchOrchestratorFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The type of resource you want to retrieve information about. For example, INSTANCE .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The managed node ID or key-value pair to retrieve information about.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The ID of the maintenance window to retrieve information about.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        def initialize(
          @filters : Array(Types::PatchOrchestratorFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_type : String? = nil,
          @targets : Array(Types::Target)? = nil,
          @window_id : String? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowScheduleResult
        include JSON::Serializable

        # The token for the next set of items to return. (You use this token in the next call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about maintenance window executions scheduled for the specified time range.

        @[JSON::Field(key: "ScheduledWindowExecutions")]
        getter scheduled_window_executions : Array(Types::ScheduledWindowExecution)?

        def initialize(
          @next_token : String? = nil,
          @scheduled_window_executions : Array(Types::ScheduledWindowExecution)? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowTargetsRequest
        include JSON::Serializable

        # The ID of the maintenance window whose targets should be retrieved.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        # Optional filters that can be used to narrow down the scope of the returned window targets. The
        # supported filter keys are Type , WindowTargetId , and OwnerInformation .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::MaintenanceWindowFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @window_id : String,
          @filters : Array(Types::MaintenanceWindowFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowTargetsResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the targets in the maintenance window.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::MaintenanceWindowTarget)?

        def initialize(
          @next_token : String? = nil,
          @targets : Array(Types::MaintenanceWindowTarget)? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowTasksRequest
        include JSON::Serializable

        # The ID of the maintenance window whose tasks should be retrieved.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        # Optional filters used to narrow down the scope of the returned tasks. The supported filter keys are
        # WindowTaskId , TaskArn , Priority , and TaskType .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::MaintenanceWindowFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @window_id : String,
          @filters : Array(Types::MaintenanceWindowFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowTasksResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the tasks in the maintenance window.

        @[JSON::Field(key: "Tasks")]
        getter tasks : Array(Types::MaintenanceWindowTask)?

        def initialize(
          @next_token : String? = nil,
          @tasks : Array(Types::MaintenanceWindowTask)? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowsForTargetRequest
        include JSON::Serializable

        # The type of resource you want to retrieve information about. For example, INSTANCE .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The managed node ID or key-value pair to retrieve information about.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_type : String,
          @targets : Array(Types::Target),
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowsForTargetResult
        include JSON::Serializable

        # The token for the next set of items to return. (You use this token in the next call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the maintenance window targets and tasks a managed node is associated with.

        @[JSON::Field(key: "WindowIdentities")]
        getter window_identities : Array(Types::MaintenanceWindowIdentityForTarget)?

        def initialize(
          @next_token : String? = nil,
          @window_identities : Array(Types::MaintenanceWindowIdentityForTarget)? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowsRequest
        include JSON::Serializable

        # Optional filters used to narrow down the scope of the returned maintenance windows. Supported filter
        # keys are Name and Enabled . For example, Name=MyMaintenanceWindow and Enabled=True .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::MaintenanceWindowFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::MaintenanceWindowFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMaintenanceWindowsResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the maintenance windows.

        @[JSON::Field(key: "WindowIdentities")]
        getter window_identities : Array(Types::MaintenanceWindowIdentity)?

        def initialize(
          @next_token : String? = nil,
          @window_identities : Array(Types::MaintenanceWindowIdentity)? = nil
        )
        end
      end


      struct DescribeOpsItemsRequest
        include JSON::Serializable

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # One or more filters to limit the response. Key: CreatedTime Operations: GreaterThan, LessThan Key:
        # LastModifiedBy Operations: Contains, Equals Key: LastModifiedTime Operations: GreaterThan, LessThan
        # Key: Priority Operations: Equals Key: Source Operations: Contains, Equals Key: Status Operations:
        # Equals Key: Title* Operations: Equals,Contains Key: OperationalData** Operations: Equals Key:
        # OperationalDataKey Operations: Equals Key: OperationalDataValue Operations: Equals, Contains Key:
        # OpsItemId Operations: Equals Key: ResourceId Operations: Contains Key: AutomationId Operations:
        # Equals Key: AccountId Operations: Equals *The Equals operator for Title matches the first 100
        # characters. If you specify more than 100 characters, they system returns an error that the filter
        # value exceeds the length limit. **If you filter the response by using the OperationalData operator,
        # specify a key-value pair by using the following JSON format: {"key":"key_name","value":"a_value"}

        @[JSON::Field(key: "OpsItemFilters")]
        getter ops_item_filters : Array(Types::OpsItemFilter)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @ops_item_filters : Array(Types::OpsItemFilter)? = nil
        )
        end
      end


      struct DescribeOpsItemsResponse
        include JSON::Serializable

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of OpsItems.

        @[JSON::Field(key: "OpsItemSummaries")]
        getter ops_item_summaries : Array(Types::OpsItemSummary)?

        def initialize(
          @next_token : String? = nil,
          @ops_item_summaries : Array(Types::OpsItemSummary)? = nil
        )
        end
      end


      struct DescribeParametersRequest
        include JSON::Serializable

        # This data type is deprecated. Instead, use ParameterFilters .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ParametersFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters to limit the request results.

        @[JSON::Field(key: "ParameterFilters")]
        getter parameter_filters : Array(Types::ParameterStringFilter)?

        # Lists parameters that are shared with you. By default when using this option, the command returns
        # parameters that have been shared using a standard Resource Access Manager Resource Share. In order
        # for a parameter that was shared using the PutResourcePolicy command to be returned, the associated
        # RAM Resource Share Created From Policy must have been promoted to a standard Resource Share using
        # the RAM PromoteResourceShareCreatedFromPolicy API operation. For more information about sharing
        # parameters, see Working with shared parameters in the Amazon Web Services Systems Manager User Guide
        # .

        @[JSON::Field(key: "Shared")]
        getter shared : Bool?

        def initialize(
          @filters : Array(Types::ParametersFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @parameter_filters : Array(Types::ParameterStringFilter)? = nil,
          @shared : Bool? = nil
        )
        end
      end


      struct DescribeParametersResult
        include JSON::Serializable

        # The token to use when requesting the next set of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Parameters returned by the request.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::ParameterMetadata)?

        def initialize(
          @next_token : String? = nil,
          @parameters : Array(Types::ParameterMetadata)? = nil
        )
        end
      end


      struct DescribePatchBaselinesRequest
        include JSON::Serializable

        # Each element in the array is a structure containing a key-value pair. Supported keys for
        # DescribePatchBaselines include the following: NAME_PREFIX Sample values: AWS- | My- OWNER Sample
        # values: AWS | Self OPERATING_SYSTEM Sample values: AMAZON_LINUX | SUSE | WINDOWS

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::PatchOrchestratorFilter)?

        # The maximum number of patch baselines to return (per page).

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::PatchOrchestratorFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribePatchBaselinesResult
        include JSON::Serializable

        # An array of PatchBaselineIdentity elements.

        @[JSON::Field(key: "BaselineIdentities")]
        getter baseline_identities : Array(Types::PatchBaselineIdentity)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @baseline_identities : Array(Types::PatchBaselineIdentity)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribePatchGroupStateRequest
        include JSON::Serializable

        # The name of the patch group whose patch snapshot should be retrieved.

        @[JSON::Field(key: "PatchGroup")]
        getter patch_group : String

        def initialize(
          @patch_group : String
        )
        end
      end


      struct DescribePatchGroupStateResult
        include JSON::Serializable

        # The number of managed nodes in the patch group.

        @[JSON::Field(key: "Instances")]
        getter instances : Int32?

        # The number of managed nodes for which security-related patches are available but not approved
        # because because they didn't meet the patch baseline requirements. For example, an updated version of
        # a patch might have been released before the specified auto-approval period was over. Applies to
        # Windows Server managed nodes only.

        @[JSON::Field(key: "InstancesWithAvailableSecurityUpdates")]
        getter instances_with_available_security_updates : Int32?

        # The number of managed nodes where patches that are specified as Critical for compliance reporting in
        # the patch baseline aren't installed. These patches might be missing, have failed installation, were
        # rejected, or were installed but awaiting a required managed node reboot. The status of these managed
        # nodes is NON_COMPLIANT .

        @[JSON::Field(key: "InstancesWithCriticalNonCompliantPatches")]
        getter instances_with_critical_non_compliant_patches : Int32?

        # The number of managed nodes with patches from the patch baseline that failed to install.

        @[JSON::Field(key: "InstancesWithFailedPatches")]
        getter instances_with_failed_patches : Int32?

        # The number of managed nodes with patches installed that aren't defined in the patch baseline.

        @[JSON::Field(key: "InstancesWithInstalledOtherPatches")]
        getter instances_with_installed_other_patches : Int32?

        # The number of managed nodes with installed patches.

        @[JSON::Field(key: "InstancesWithInstalledPatches")]
        getter instances_with_installed_patches : Int32?

        # The number of managed nodes with patches installed by Patch Manager that haven't been rebooted after
        # the patch installation. The status of these managed nodes is NON_COMPLIANT .

        @[JSON::Field(key: "InstancesWithInstalledPendingRebootPatches")]
        getter instances_with_installed_pending_reboot_patches : Int32?

        # The number of managed nodes with patches installed that are specified in a RejectedPatches list.
        # Patches with a status of INSTALLED_REJECTED were typically installed before they were added to a
        # RejectedPatches list. If ALLOW_AS_DEPENDENCY is the specified option for RejectedPatchesAction , the
        # value of InstancesWithInstalledRejectedPatches will always be 0 (zero).

        @[JSON::Field(key: "InstancesWithInstalledRejectedPatches")]
        getter instances_with_installed_rejected_patches : Int32?

        # The number of managed nodes with missing patches from the patch baseline.

        @[JSON::Field(key: "InstancesWithMissingPatches")]
        getter instances_with_missing_patches : Int32?

        # The number of managed nodes with patches that aren't applicable.

        @[JSON::Field(key: "InstancesWithNotApplicablePatches")]
        getter instances_with_not_applicable_patches : Int32?

        # The number of managed nodes with patches installed that are specified as other than Critical or
        # Security but aren't compliant with the patch baseline. The status of these managed nodes is
        # NON_COMPLIANT .

        @[JSON::Field(key: "InstancesWithOtherNonCompliantPatches")]
        getter instances_with_other_non_compliant_patches : Int32?

        # The number of managed nodes where patches that are specified as Security in a patch advisory aren't
        # installed. These patches might be missing, have failed installation, were rejected, or were
        # installed but awaiting a required managed node reboot. The status of these managed nodes is
        # NON_COMPLIANT .

        @[JSON::Field(key: "InstancesWithSecurityNonCompliantPatches")]
        getter instances_with_security_non_compliant_patches : Int32?

        # The number of managed nodes with NotApplicable patches beyond the supported limit, which aren't
        # reported by name to Inventory. Inventory is a tool in Amazon Web Services Systems Manager.

        @[JSON::Field(key: "InstancesWithUnreportedNotApplicablePatches")]
        getter instances_with_unreported_not_applicable_patches : Int32?

        def initialize(
          @instances : Int32? = nil,
          @instances_with_available_security_updates : Int32? = nil,
          @instances_with_critical_non_compliant_patches : Int32? = nil,
          @instances_with_failed_patches : Int32? = nil,
          @instances_with_installed_other_patches : Int32? = nil,
          @instances_with_installed_patches : Int32? = nil,
          @instances_with_installed_pending_reboot_patches : Int32? = nil,
          @instances_with_installed_rejected_patches : Int32? = nil,
          @instances_with_missing_patches : Int32? = nil,
          @instances_with_not_applicable_patches : Int32? = nil,
          @instances_with_other_non_compliant_patches : Int32? = nil,
          @instances_with_security_non_compliant_patches : Int32? = nil,
          @instances_with_unreported_not_applicable_patches : Int32? = nil
        )
        end
      end


      struct DescribePatchGroupsRequest
        include JSON::Serializable

        # Each element in the array is a structure containing a key-value pair. Supported keys for
        # DescribePatchGroups include the following: NAME_PREFIX Sample values: AWS- | My- . OPERATING_SYSTEM
        # Sample values: AMAZON_LINUX | SUSE | WINDOWS

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::PatchOrchestratorFilter)?

        # The maximum number of patch groups to return (per page).

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::PatchOrchestratorFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribePatchGroupsResult
        include JSON::Serializable

        # Each entry in the array contains: PatchGroup : string (between 1 and 256 characters. Regex:
        # ^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$) PatchBaselineIdentity : A PatchBaselineIdentity element.

        @[JSON::Field(key: "Mappings")]
        getter mappings : Array(Types::PatchGroupPatchBaselineMapping)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @mappings : Array(Types::PatchGroupPatchBaselineMapping)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribePatchPropertiesRequest
        include JSON::Serializable

        # The operating system type for which to list patches.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String

        # The patch property for which you want to view patch details.

        @[JSON::Field(key: "Property")]
        getter property : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Indicates whether to list patches for the Windows operating system or for applications released by
        # Microsoft. Not applicable for the Linux or macOS operating systems.

        @[JSON::Field(key: "PatchSet")]
        getter patch_set : String?

        def initialize(
          @operating_system : String,
          @property : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @patch_set : String? = nil
        )
        end
      end


      struct DescribePatchPropertiesResult
        include JSON::Serializable

        # The token for the next set of items to return. (You use this token in the next call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of the properties for patches matching the filter request parameters.

        @[JSON::Field(key: "Properties")]
        getter properties : Array(Hash(String, String))?

        def initialize(
          @next_token : String? = nil,
          @properties : Array(Hash(String, String))? = nil
        )
        end
      end


      struct DescribeSessionsRequest
        include JSON::Serializable

        # The session status to retrieve a list of sessions for. For example, "Active".

        @[JSON::Field(key: "State")]
        getter state : String

        # One or more filters to limit the type of sessions returned by the request.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::SessionFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @state : String,
          @filters : Array(Types::SessionFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeSessionsResponse
        include JSON::Serializable

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of sessions meeting the request parameters.

        @[JSON::Field(key: "Sessions")]
        getter sessions : Array(Types::Session)?

        def initialize(
          @next_token : String? = nil,
          @sessions : Array(Types::Session)? = nil
        )
        end
      end


      struct DisassociateOpsItemRelatedItemRequest
        include JSON::Serializable

        # The ID of the association for which you want to delete an association between the OpsItem and a
        # related item.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String

        # The ID of the OpsItem for which you want to delete an association between the OpsItem and a related
        # item.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String

        def initialize(
          @association_id : String,
          @ops_item_id : String
        )
        end
      end


      struct DisassociateOpsItemRelatedItemResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The specified document already exists.

      struct DocumentAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A default version of a document.

      struct DocumentDefaultVersionDescription
        include JSON::Serializable

        # The default version of the document.

        @[JSON::Field(key: "DefaultVersion")]
        getter default_version : String?

        # The default version of the artifact associated with the document.

        @[JSON::Field(key: "DefaultVersionName")]
        getter default_version_name : String?

        # The name of the document.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @default_version : String? = nil,
          @default_version_name : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Describes an Amazon Web Services Systems Manager document (SSM document).

      struct DocumentDescription
        include JSON::Serializable

        # The version of the document currently approved for use in the organization.

        @[JSON::Field(key: "ApprovedVersion")]
        getter approved_version : String?

        # Details about the document attachments, including names, locations, sizes, and so on.

        @[JSON::Field(key: "AttachmentsInformation")]
        getter attachments_information : Array(Types::AttachmentInformation)?

        # The user in your organization who created the document.

        @[JSON::Field(key: "Author")]
        getter author : String?

        # The classification of a document to help you identify and categorize its use.

        @[JSON::Field(key: "Category")]
        getter category : Array(String)?

        # The value that identifies a document's category.

        @[JSON::Field(key: "CategoryEnum")]
        getter category_enum : Array(String)?

        # The date when the document was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The default version.

        @[JSON::Field(key: "DefaultVersion")]
        getter default_version : String?

        # A description of the document.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The friendly name of the SSM document. This value can differ for each version of the document. If
        # you want to update this value, see UpdateDocument .

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The document format, either JSON or YAML.

        @[JSON::Field(key: "DocumentFormat")]
        getter document_format : String?

        # The type of document.

        @[JSON::Field(key: "DocumentType")]
        getter document_type : String?

        # The document version.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The Sha256 or Sha1 hash created by the system when the document was created. Sha1 hashes have been
        # deprecated.

        @[JSON::Field(key: "Hash")]
        getter hash : String?

        # The hash type of the document. Valid values include Sha256 or Sha1 . Sha1 hashes have been
        # deprecated.

        @[JSON::Field(key: "HashType")]
        getter hash_type : String?

        # The latest version of the document.

        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : String?

        # The name of the SSM document.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services user that created the document.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # A description of the parameters for a document.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::DocumentParameter)?

        # The version of the document that is currently under review.

        @[JSON::Field(key: "PendingReviewVersion")]
        getter pending_review_version : String?

        # The list of operating system (OS) platforms compatible with this SSM document.

        @[JSON::Field(key: "PlatformTypes")]
        getter platform_types : Array(String)?

        # A list of SSM documents required by a document. For example, an ApplicationConfiguration document
        # requires an ApplicationConfigurationSchema document.

        @[JSON::Field(key: "Requires")]
        getter requires : Array(Types::DocumentRequires)?

        # Details about the review of a document.

        @[JSON::Field(key: "ReviewInformation")]
        getter review_information : Array(Types::ReviewInformation)?

        # The current status of the review.

        @[JSON::Field(key: "ReviewStatus")]
        getter review_status : String?

        # The schema version.

        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?

        # The SHA1 hash of the document, which you can use for verification.

        @[JSON::Field(key: "Sha1")]
        getter sha1 : String?

        # The status of the SSM document.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message returned by Amazon Web Services Systems Manager that explains the Status value. For
        # example, a Failed status might be explained by the StatusInformation message, "The specified S3
        # bucket doesn't exist. Verify that the URL of the S3 bucket is correct."

        @[JSON::Field(key: "StatusInformation")]
        getter status_information : String?

        # The tags, or metadata, that have been applied to the document.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The target type which defines the kinds of resources the document can run on. For example,
        # /AWS::EC2::Instance . For a list of valid resource types, see Amazon Web Services resource and
        # property types reference in the CloudFormation User Guide .

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        # The version of the artifact associated with the document.

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @approved_version : String? = nil,
          @attachments_information : Array(Types::AttachmentInformation)? = nil,
          @author : String? = nil,
          @category : Array(String)? = nil,
          @category_enum : Array(String)? = nil,
          @created_date : Time? = nil,
          @default_version : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @document_format : String? = nil,
          @document_type : String? = nil,
          @document_version : String? = nil,
          @hash : String? = nil,
          @hash_type : String? = nil,
          @latest_version : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @parameters : Array(Types::DocumentParameter)? = nil,
          @pending_review_version : String? = nil,
          @platform_types : Array(String)? = nil,
          @requires : Array(Types::DocumentRequires)? = nil,
          @review_information : Array(Types::ReviewInformation)? = nil,
          @review_status : String? = nil,
          @schema_version : String? = nil,
          @sha1 : String? = nil,
          @status : String? = nil,
          @status_information : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_type : String? = nil,
          @version_name : String? = nil
        )
        end
      end

      # This data type is deprecated. Instead, use DocumentKeyValuesFilter .

      struct DocumentFilter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the filter.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Describes the name of a SSM document.

      struct DocumentIdentifier
        include JSON::Serializable

        # The user in your organization who created the document.

        @[JSON::Field(key: "Author")]
        getter author : String?

        # The date the SSM document was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # An optional field where you can specify a friendly name for the SSM document. This value can differ
        # for each version of the document. If you want to update this value, see UpdateDocument .

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The document format, either JSON or YAML.

        @[JSON::Field(key: "DocumentFormat")]
        getter document_format : String?

        # The document type.

        @[JSON::Field(key: "DocumentType")]
        getter document_type : String?

        # The document version.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The name of the SSM document.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services user that created the document.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The operating system platform.

        @[JSON::Field(key: "PlatformTypes")]
        getter platform_types : Array(String)?

        # A list of SSM documents required by a document. For example, an ApplicationConfiguration document
        # requires an ApplicationConfigurationSchema document.

        @[JSON::Field(key: "Requires")]
        getter requires : Array(Types::DocumentRequires)?

        # The current status of a document review.

        @[JSON::Field(key: "ReviewStatus")]
        getter review_status : String?

        # The schema version.

        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?

        # The tags, or metadata, that have been applied to the document.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The target type which defines the kinds of resources the document can run on. For example,
        # /AWS::EC2::Instance . For a list of valid resource types, see Amazon Web Services resource and
        # property types reference in the CloudFormation User Guide .

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        # An optional field specifying the version of the artifact associated with the document. For example,
        # 12.6. This value is unique across all versions of a document, and can't be changed.

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @author : String? = nil,
          @created_date : Time? = nil,
          @display_name : String? = nil,
          @document_format : String? = nil,
          @document_type : String? = nil,
          @document_version : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @platform_types : Array(String)? = nil,
          @requires : Array(Types::DocumentRequires)? = nil,
          @review_status : String? = nil,
          @schema_version : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_type : String? = nil,
          @version_name : String? = nil
        )
        end
      end

      # One or more filters. Use a filter to return a more specific list of documents. For keys, you can
      # specify one or more tags that have been applied to a document. You can also use Amazon Web
      # Services-provided keys, some of which have specific allowed values. These keys and their associated
      # values are as follows: DocumentType ApplicationConfiguration ApplicationConfigurationSchema
      # Automation ChangeCalendar Command Package Policy Session Owner Note that only one Owner can be
      # specified in a request. For example: Key=Owner,Values=Self . Amazon Private Public Self ThirdParty
      # PlatformTypes Linux Windows Name is another Amazon Web Services-provided key. If you use Name as a
      # key, you can use a name prefix to return a list of documents. For example, in the Amazon Web
      # Services CLI, to return a list of all documents that begin with Te , run the following command: aws
      # ssm list-documents --filters Key=Name,Values=Te You can also use the TargetType Amazon Web
      # Services-provided key. For a list of valid resource type values that can be used with this key, see
      # Amazon Web Services resource and property types reference in the CloudFormation User Guide . If you
      # specify more than two keys, only documents that are identified by all the tags are returned in the
      # results. If you specify more than two values for a key, documents that are identified by any of the
      # values are returned in the results. To specify a custom key-value pair, use the format
      # Key=tag:tagName,Values=valueName . For example, if you created a key called region and are using the
      # Amazon Web Services CLI to call the list-documents command: aws ssm list-documents --filters
      # Key=tag:region,Values=east,west Key=Owner,Values=Self

      struct DocumentKeyValuesFilter
        include JSON::Serializable

        # The name of the filter key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value for the filter key.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # You can have at most 500 active SSM documents.

      struct DocumentLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details about the response to a document review request.

      struct DocumentMetadataResponseInfo
        include JSON::Serializable

        # Details about a reviewer's response to a document review request.

        @[JSON::Field(key: "ReviewerResponse")]
        getter reviewer_response : Array(Types::DocumentReviewerResponseSource)?

        def initialize(
          @reviewer_response : Array(Types::DocumentReviewerResponseSource)? = nil
        )
        end
      end

      # Parameters specified in a Systems Manager document that run on the server when the command is run.

      struct DocumentParameter
        include JSON::Serializable

        # If specified, the default values for the parameters. Parameters without a default value are
        # required. Parameters with a default value are optional.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # A description of what the parameter does, how to use it, the default value, and whether or not the
        # parameter is optional.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the parameter.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of parameter. The type can be either String or StringList.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @default_value : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The document can't be shared with more Amazon Web Services accounts. You can specify a maximum of 20
      # accounts per API operation to share a private document. By default, you can share a private document
      # with a maximum of 1,000 accounts and publicly share up to five documents. If you need to increase
      # the quota for privately or publicly shared Systems Manager documents, contact Amazon Web Services
      # Support.

      struct DocumentPermissionLimit
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An SSM document required by the current document.

      struct DocumentRequires
        include JSON::Serializable

        # The name of the required SSM document. The name can be an Amazon Resource Name (ARN).

        @[JSON::Field(key: "Name")]
        getter name : String

        # The document type of the required SSM document.

        @[JSON::Field(key: "RequireType")]
        getter require_type : String?

        # The document version required by the current document.

        @[JSON::Field(key: "Version")]
        getter version : String?

        # An optional field specifying the version of the artifact associated with the document. For example,
        # 12.6. This value is unique across all versions of a document, and can't be changed.

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @name : String,
          @require_type : String? = nil,
          @version : String? = nil,
          @version_name : String? = nil
        )
        end
      end

      # Information about comments added to a document review request.

      struct DocumentReviewCommentSource
        include JSON::Serializable

        # The content of a comment entered by a user who requests a review of a new document version, or who
        # reviews the new version.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The type of information added to a review request. Currently, only the value Comment is supported.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @content : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about a reviewer's response to a document review request.

      struct DocumentReviewerResponseSource
        include JSON::Serializable

        # The comment entered by a reviewer as part of their document review response.

        @[JSON::Field(key: "Comment")]
        getter comment : Array(Types::DocumentReviewCommentSource)?

        # The date and time that a reviewer entered a response to a document review request.

        @[JSON::Field(key: "CreateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The current review status of a new custom SSM document created by a member of your organization, or
        # of the latest version of an existing SSM document. Only one version of a document can be in the
        # APPROVED state at a time. When a new version is approved, the status of the previous version changes
        # to REJECTED. Only one version of a document can be in review, or PENDING, at a time.

        @[JSON::Field(key: "ReviewStatus")]
        getter review_status : String?

        # The user in your organization assigned to review a document request.

        @[JSON::Field(key: "Reviewer")]
        getter reviewer : String?

        # The date and time that a reviewer last updated a response to a document review request.

        @[JSON::Field(key: "UpdatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_time : Time?

        def initialize(
          @comment : Array(Types::DocumentReviewCommentSource)? = nil,
          @create_time : Time? = nil,
          @review_status : String? = nil,
          @reviewer : String? = nil,
          @updated_time : Time? = nil
        )
        end
      end

      # Information about a document approval review.

      struct DocumentReviews
        include JSON::Serializable

        # The action to take on a document approval review request.

        @[JSON::Field(key: "Action")]
        getter action : String

        # A comment entered by a user in your organization about the document review request.

        @[JSON::Field(key: "Comment")]
        getter comment : Array(Types::DocumentReviewCommentSource)?

        def initialize(
          @action : String,
          @comment : Array(Types::DocumentReviewCommentSource)? = nil
        )
        end
      end

      # Version information about the document.

      struct DocumentVersionInfo
        include JSON::Serializable

        # The date the document was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The friendly name of the SSM document. This value can differ for each version of the document. If
        # you want to update this value, see UpdateDocument .

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The document format, either JSON or YAML.

        @[JSON::Field(key: "DocumentFormat")]
        getter document_format : String?

        # The document version.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # An identifier for the default version of the document.

        @[JSON::Field(key: "IsDefaultVersion")]
        getter is_default_version : Bool?

        # The document name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current status of the approval review for the latest version of the document.

        @[JSON::Field(key: "ReviewStatus")]
        getter review_status : String?

        # The status of the SSM document, such as Creating , Active , Failed , and Deleting .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message returned by Amazon Web Services Systems Manager that explains the Status value. For
        # example, a Failed status might be explained by the StatusInformation message, "The specified S3
        # bucket doesn't exist. Verify that the URL of the S3 bucket is correct."

        @[JSON::Field(key: "StatusInformation")]
        getter status_information : String?

        # The version of the artifact associated with the document. For example, 12.6. This value is unique
        # across all versions of a document, and can't be changed.

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @created_date : Time? = nil,
          @display_name : String? = nil,
          @document_format : String? = nil,
          @document_version : String? = nil,
          @is_default_version : Bool? = nil,
          @name : String? = nil,
          @review_status : String? = nil,
          @status : String? = nil,
          @status_information : String? = nil,
          @version_name : String? = nil
        )
        end
      end

      # The document has too many versions. Delete one or more document versions and try again.

      struct DocumentVersionLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Error returned when the ID specified for a resource, such as a maintenance window or patch baseline,
      # doesn't exist. For information about resource quotas in Amazon Web Services Systems Manager, see
      # Systems Manager service quotas in the Amazon Web Services General Reference .

      struct DoesNotExistException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The content of the association document matches another document. Change the content of the document
      # and try again.

      struct DuplicateDocumentContent
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The version name has already been used in this document. Specify a different version name, and then
      # try again.

      struct DuplicateDocumentVersionName
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You can't specify a managed node ID in more than one association.

      struct DuplicateInstanceId
        include JSON::Serializable

        def initialize
        end
      end

      # The EffectivePatch structure defines metadata about a patch along with the approval state of the
      # patch in a particular patch baseline. The approval state includes information about whether the
      # patch is currently approved, due to be approved by a rule, explicitly approved, or explicitly
      # rejected and the date the patch was or will be approved.

      struct EffectivePatch
        include JSON::Serializable

        # Provides metadata for a patch, including information such as the KB ID, severity, classification and
        # a URL for where more information can be obtained about the patch.

        @[JSON::Field(key: "Patch")]
        getter patch : Types::Patch?

        # The status of the patch in a patch baseline. This includes information about whether the patch is
        # currently approved, due to be approved by a rule, explicitly approved, or explicitly rejected and
        # the date the patch was or will be approved.

        @[JSON::Field(key: "PatchStatus")]
        getter patch_status : Types::PatchStatus?

        def initialize(
          @patch : Types::Patch? = nil,
          @patch_status : Types::PatchStatus? = nil
        )
        end
      end

      # Information about the inputs for an execution preview.

      struct ExecutionInputs
        include JSON::Serializable

        # Information about the optional inputs that can be specified for an automation execution preview.

        @[JSON::Field(key: "Automation")]
        getter automation : Types::AutomationExecutionInputs?

        def initialize(
          @automation : Types::AutomationExecutionInputs? = nil
        )
        end
      end

      # Information about the changes that would be made if an execution were run.

      struct ExecutionPreview
        include JSON::Serializable

        # Information about the changes that would be made if an Automation workflow were run.

        @[JSON::Field(key: "Automation")]
        getter automation : Types::AutomationExecutionPreview?

        def initialize(
          @automation : Types::AutomationExecutionPreview? = nil
        )
        end
      end

      # Describes a failed association.

      struct FailedCreateAssociation
        include JSON::Serializable

        # The association.

        @[JSON::Field(key: "Entry")]
        getter entry : Types::CreateAssociationBatchRequestEntry?

        # The source of the failure.

        @[JSON::Field(key: "Fault")]
        getter fault : String?

        # A description of the failure.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @entry : Types::CreateAssociationBatchRequestEntry? = nil,
          @fault : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Information about an Automation failure.

      struct FailureDetails
        include JSON::Serializable

        # Detailed information about the Automation step failure.

        @[JSON::Field(key: "Details")]
        getter details : Hash(String, Array(String))?

        # The stage of the Automation execution when the failure occurred. The stages include the following:
        # InputValidation, PreVerification, Invocation, PostVerification.

        @[JSON::Field(key: "FailureStage")]
        getter failure_stage : String?

        # The type of Automation failure. Failure types include the following: Action, Permission, Throttling,
        # Verification, Internal.

        @[JSON::Field(key: "FailureType")]
        getter failure_type : String?

        def initialize(
          @details : Hash(String, Array(String))? = nil,
          @failure_stage : String? = nil,
          @failure_type : String? = nil
        )
        end
      end

      # You attempted to register a LAMBDA or STEP_FUNCTIONS task in a region where the corresponding
      # service isn't available.

      struct FeatureNotAvailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetAccessTokenRequest
        include JSON::Serializable

        # The ID of a just-in-time node access request.

        @[JSON::Field(key: "AccessRequestId")]
        getter access_request_id : String

        def initialize(
          @access_request_id : String
        )
        end
      end


      struct GetAccessTokenResponse
        include JSON::Serializable

        # The status of the access request.

        @[JSON::Field(key: "AccessRequestStatus")]
        getter access_request_status : String?

        # The temporary security credentials which can be used to start just-in-time node access sessions.

        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::Credentials?

        def initialize(
          @access_request_status : String? = nil,
          @credentials : Types::Credentials? = nil
        )
        end
      end


      struct GetAutomationExecutionRequest
        include JSON::Serializable

        # The unique identifier for an existing automation execution to examine. The execution ID is returned
        # by StartAutomationExecution when the execution of an Automation runbook is initiated.

        @[JSON::Field(key: "AutomationExecutionId")]
        getter automation_execution_id : String

        def initialize(
          @automation_execution_id : String
        )
        end
      end


      struct GetAutomationExecutionResult
        include JSON::Serializable

        # Detailed information about the current state of an automation execution.

        @[JSON::Field(key: "AutomationExecution")]
        getter automation_execution : Types::AutomationExecution?

        def initialize(
          @automation_execution : Types::AutomationExecution? = nil
        )
        end
      end


      struct GetCalendarStateRequest
        include JSON::Serializable

        # The names of Amazon Resource Names (ARNs) of the Systems Manager documents (SSM documents) that
        # represent the calendar entries for which you want to get the state.

        @[JSON::Field(key: "CalendarNames")]
        getter calendar_names : Array(String)

        # (Optional) The specific time for which you want to get calendar state information, in ISO 8601
        # format. If you don't specify a value or AtTime , the current time is used.

        @[JSON::Field(key: "AtTime")]
        getter at_time : String?

        def initialize(
          @calendar_names : Array(String),
          @at_time : String? = nil
        )
        end
      end


      struct GetCalendarStateResponse
        include JSON::Serializable

        # The time, as an ISO 8601 string, that you specified in your command. If you don't specify a time,
        # GetCalendarState uses the current time.

        @[JSON::Field(key: "AtTime")]
        getter at_time : String?

        # The time, as an ISO 8601 string, that the calendar state will change. If the current calendar state
        # is OPEN , NextTransitionTime indicates when the calendar state changes to CLOSED , and vice-versa.

        @[JSON::Field(key: "NextTransitionTime")]
        getter next_transition_time : String?

        # The state of the calendar. An OPEN calendar indicates that actions are allowed to proceed, and a
        # CLOSED calendar indicates that actions aren't allowed to proceed.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @at_time : String? = nil,
          @next_transition_time : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct GetCommandInvocationRequest
        include JSON::Serializable

        # (Required) The parent command ID of the invocation plugin.

        @[JSON::Field(key: "CommandId")]
        getter command_id : String

        # (Required) The ID of the managed node targeted by the command. A managed node can be an Amazon
        # Elastic Compute Cloud (Amazon EC2) instance, edge device, and on-premises server or VM in your
        # hybrid environment that is configured for Amazon Web Services Systems Manager.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The name of the step for which you want detailed results. If the document contains only one step,
        # you can omit the name and details for that step. If the document contains more than one step, you
        # must specify the name of the step for which you want to view details. Be sure to specify the name of
        # the step, not the name of a plugin like aws:RunShellScript . To find the PluginName , check the
        # document content and find the name of the step you want details for. Alternatively, use
        # ListCommandInvocations with the CommandId and Details parameters. The PluginName is the Name
        # attribute of the CommandPlugin object in the CommandPlugins list.

        @[JSON::Field(key: "PluginName")]
        getter plugin_name : String?

        def initialize(
          @command_id : String,
          @instance_id : String,
          @plugin_name : String? = nil
        )
        end
      end


      struct GetCommandInvocationResult
        include JSON::Serializable

        # Amazon CloudWatch Logs information where Systems Manager sent the command output.

        @[JSON::Field(key: "CloudWatchOutputConfig")]
        getter cloud_watch_output_config : Types::CloudWatchOutputConfig?

        # The parent command ID of the invocation plugin.

        @[JSON::Field(key: "CommandId")]
        getter command_id : String?

        # The comment text for the command.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The name of the document that was run. For example, AWS-RunShellScript .

        @[JSON::Field(key: "DocumentName")]
        getter document_name : String?

        # The Systems Manager document (SSM document) version used in the request.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # Duration since ExecutionStartDateTime .

        @[JSON::Field(key: "ExecutionElapsedTime")]
        getter execution_elapsed_time : String?

        # The date and time the plugin finished running. Date and time are written in ISO 8601 format. For
        # example, June 7, 2017 is represented as 2017-06-7. The following sample Amazon Web Services CLI
        # command uses the InvokedAfter filter. aws ssm list-commands --filters
        # key=InvokedAfter,value=2017-06-07T00:00:00Z If the plugin hasn't started to run, the string is
        # empty.

        @[JSON::Field(key: "ExecutionEndDateTime")]
        getter execution_end_date_time : String?

        # The date and time the plugin started running. Date and time are written in ISO 8601 format. For
        # example, June 7, 2017 is represented as 2017-06-7. The following sample Amazon Web Services CLI
        # command uses the InvokedBefore filter. aws ssm list-commands --filters
        # key=InvokedBefore,value=2017-06-07T00:00:00Z If the plugin hasn't started to run, the string is
        # empty.

        @[JSON::Field(key: "ExecutionStartDateTime")]
        getter execution_start_date_time : String?

        # The ID of the managed node targeted by the command. A managed node can be an Amazon Elastic Compute
        # Cloud (Amazon EC2) instance, edge device, or on-premises server or VM in your hybrid environment
        # that is configured for Amazon Web Services Systems Manager.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The name of the plugin, or step name , for which details are reported. For example,
        # aws:RunShellScript is a plugin.

        @[JSON::Field(key: "PluginName")]
        getter plugin_name : String?

        # The error level response code for the plugin script. If the response code is -1 , then the command
        # hasn't started running on the managed node, or it wasn't received by the node.

        @[JSON::Field(key: "ResponseCode")]
        getter response_code : Int32?

        # The first 8,000 characters written by the plugin to stderr . If the command hasn't finished running,
        # then this string is empty.

        @[JSON::Field(key: "StandardErrorContent")]
        getter standard_error_content : String?

        # The URL for the complete text written by the plugin to stderr . If the command hasn't finished
        # running, then this string is empty.

        @[JSON::Field(key: "StandardErrorUrl")]
        getter standard_error_url : String?

        # The first 24,000 characters written by the plugin to stdout . If the command hasn't finished
        # running, if ExecutionStatus is neither Succeeded nor Failed, then this string is empty.

        @[JSON::Field(key: "StandardOutputContent")]
        getter standard_output_content : String?

        # The URL for the complete text written by the plugin to stdout in Amazon Simple Storage Service
        # (Amazon S3). If an S3 bucket wasn't specified, then this string is empty.

        @[JSON::Field(key: "StandardOutputUrl")]
        getter standard_output_url : String?

        # The status of this invocation plugin. This status can be different than StatusDetails .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed status of the command execution for an invocation. StatusDetails includes more
        # information than Status because it includes states resulting from error and concurrency control
        # parameters. StatusDetails can show different results than Status . For more information about these
        # statuses, see Understanding command statuses in the Amazon Web Services Systems Manager User Guide .
        # StatusDetails can be one of the following values: Pending: The command hasn't been sent to the
        # managed node. In Progress: The command has been sent to the managed node but hasn't reached a
        # terminal state. Delayed: The system attempted to send the command to the target, but the target
        # wasn't available. The managed node might not be available because of network issues, because the
        # node was stopped, or for similar reasons. The system will try to send the command again. Success:
        # The command or plugin ran successfully. This is a terminal state. Delivery Timed Out: The command
        # wasn't delivered to the managed node before the delivery timeout expired. Delivery timeouts don't
        # count against the parent command's MaxErrors limit, but they do contribute to whether the parent
        # command status is Success or Incomplete. This is a terminal state. Execution Timed Out: The command
        # started to run on the managed node, but the execution wasn't complete before the timeout expired.
        # Execution timeouts count against the MaxErrors limit of the parent command. This is a terminal
        # state. Failed: The command wasn't run successfully on the managed node. For a plugin, this indicates
        # that the result code wasn't zero. For a command invocation, this indicates that the result code for
        # one or more plugins wasn't zero. Invocation failures count against the MaxErrors limit of the parent
        # command. This is a terminal state. Cancelled: The command was terminated before it was completed.
        # This is a terminal state. Undeliverable: The command can't be delivered to the managed node. The
        # node might not exist or might not be responding. Undeliverable invocations don't count against the
        # parent command's MaxErrors limit and don't contribute to whether the parent command status is
        # Success or Incomplete. This is a terminal state. Terminated: The parent command exceeded its
        # MaxErrors limit and subsequent command invocations were canceled by the system. This is a terminal
        # state.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : String?

        def initialize(
          @cloud_watch_output_config : Types::CloudWatchOutputConfig? = nil,
          @command_id : String? = nil,
          @comment : String? = nil,
          @document_name : String? = nil,
          @document_version : String? = nil,
          @execution_elapsed_time : String? = nil,
          @execution_end_date_time : String? = nil,
          @execution_start_date_time : String? = nil,
          @instance_id : String? = nil,
          @plugin_name : String? = nil,
          @response_code : Int32? = nil,
          @standard_error_content : String? = nil,
          @standard_error_url : String? = nil,
          @standard_output_content : String? = nil,
          @standard_output_url : String? = nil,
          @status : String? = nil,
          @status_details : String? = nil
        )
        end
      end


      struct GetConnectionStatusRequest
        include JSON::Serializable

        # The managed node ID.

        @[JSON::Field(key: "Target")]
        getter target : String

        def initialize(
          @target : String
        )
        end
      end


      struct GetConnectionStatusResponse
        include JSON::Serializable

        # The status of the connection to the managed node.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The ID of the managed node to check connection status.

        @[JSON::Field(key: "Target")]
        getter target : String?

        def initialize(
          @status : String? = nil,
          @target : String? = nil
        )
        end
      end


      struct GetDefaultPatchBaselineRequest
        include JSON::Serializable

        # Returns the default patch baseline for the specified operating system.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        def initialize(
          @operating_system : String? = nil
        )
        end
      end


      struct GetDefaultPatchBaselineResult
        include JSON::Serializable

        # The ID of the default patch baseline.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String?

        # The operating system for the returned patch baseline.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        def initialize(
          @baseline_id : String? = nil,
          @operating_system : String? = nil
        )
        end
      end


      struct GetDeployablePatchSnapshotForInstanceRequest
        include JSON::Serializable

        # The ID of the managed node for which the appropriate patch snapshot should be retrieved.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The snapshot ID provided by the user when running AWS-RunPatchBaseline .

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String

        # Defines the basic information about a patch baseline override.

        @[JSON::Field(key: "BaselineOverride")]
        getter baseline_override : Types::BaselineOverride?

        # Specifies whether to use S3 dualstack endpoints for the patch snapshot download URL. Set to true to
        # receive a presigned URL that supports both IPv4 and IPv6 connectivity. Set to false to use standard
        # IPv4-only endpoints. Default is false . This parameter is required for managed nodes in IPv6-only
        # environments.

        @[JSON::Field(key: "UseS3DualStackEndpoint")]
        getter use_s3_dual_stack_endpoint : Bool?

        def initialize(
          @instance_id : String,
          @snapshot_id : String,
          @baseline_override : Types::BaselineOverride? = nil,
          @use_s3_dual_stack_endpoint : Bool? = nil
        )
        end
      end


      struct GetDeployablePatchSnapshotForInstanceResult
        include JSON::Serializable

        # The managed node ID.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # Returns the specific operating system (for example Windows Server 2012 or Amazon Linux 2015.09) on
        # the managed node for the specified patch snapshot.

        @[JSON::Field(key: "Product")]
        getter product : String?

        # A pre-signed Amazon Simple Storage Service (Amazon S3) URL that can be used to download the patch
        # snapshot.

        @[JSON::Field(key: "SnapshotDownloadUrl")]
        getter snapshot_download_url : String?

        # The user-defined snapshot ID.

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        def initialize(
          @instance_id : String? = nil,
          @product : String? = nil,
          @snapshot_download_url : String? = nil,
          @snapshot_id : String? = nil
        )
        end
      end


      struct GetDocumentRequest
        include JSON::Serializable

        # The name of the SSM document.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Returns the document in the specified format. The document format can be either JSON or YAML. JSON
        # is the default format.

        @[JSON::Field(key: "DocumentFormat")]
        getter document_format : String?

        # The document version for which you want information.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # An optional field specifying the version of the artifact associated with the document. For example,
        # 12.6. This value is unique across all versions of a document and can't be changed.

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @name : String,
          @document_format : String? = nil,
          @document_version : String? = nil,
          @version_name : String? = nil
        )
        end
      end


      struct GetDocumentResult
        include JSON::Serializable

        # A description of the document attachments, including names, locations, sizes, and so on.

        @[JSON::Field(key: "AttachmentsContent")]
        getter attachments_content : Array(Types::AttachmentContent)?

        # The contents of the SSM document.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The date the SSM document was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The friendly name of the SSM document. This value can differ for each version of the document. If
        # you want to update this value, see UpdateDocument .

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The document format, either JSON or YAML.

        @[JSON::Field(key: "DocumentFormat")]
        getter document_format : String?

        # The document type.

        @[JSON::Field(key: "DocumentType")]
        getter document_type : String?

        # The document version.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The name of the SSM document.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of SSM documents required by a document. For example, an ApplicationConfiguration document
        # requires an ApplicationConfigurationSchema document.

        @[JSON::Field(key: "Requires")]
        getter requires : Array(Types::DocumentRequires)?

        # The current review status of a new custom Systems Manager document (SSM document) created by a
        # member of your organization, or of the latest version of an existing SSM document. Only one version
        # of an SSM document can be in the APPROVED state at a time. When a new version is approved, the
        # status of the previous version changes to REJECTED. Only one version of an SSM document can be in
        # review, or PENDING, at a time.

        @[JSON::Field(key: "ReviewStatus")]
        getter review_status : String?

        # The status of the SSM document, such as Creating , Active , Updating , Failed , and Deleting .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message returned by Amazon Web Services Systems Manager that explains the Status value. For
        # example, a Failed status might be explained by the StatusInformation message, "The specified S3
        # bucket doesn't exist. Verify that the URL of the S3 bucket is correct."

        @[JSON::Field(key: "StatusInformation")]
        getter status_information : String?

        # The version of the artifact associated with the document. For example, 12.6. This value is unique
        # across all versions of a document, and can't be changed.

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @attachments_content : Array(Types::AttachmentContent)? = nil,
          @content : String? = nil,
          @created_date : Time? = nil,
          @display_name : String? = nil,
          @document_format : String? = nil,
          @document_type : String? = nil,
          @document_version : String? = nil,
          @name : String? = nil,
          @requires : Array(Types::DocumentRequires)? = nil,
          @review_status : String? = nil,
          @status : String? = nil,
          @status_information : String? = nil,
          @version_name : String? = nil
        )
        end
      end


      struct GetExecutionPreviewRequest
        include JSON::Serializable

        # The ID of the existing execution preview.

        @[JSON::Field(key: "ExecutionPreviewId")]
        getter execution_preview_id : String

        def initialize(
          @execution_preview_id : String
        )
        end
      end


      struct GetExecutionPreviewResponse
        include JSON::Serializable

        # A UTC timestamp indicating when the execution preview operation ended.

        @[JSON::Field(key: "EndedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter ended_at : Time?


        @[JSON::Field(key: "ExecutionPreview")]
        getter execution_preview : Types::ExecutionPreview?

        # The generated ID for the existing execution preview.

        @[JSON::Field(key: "ExecutionPreviewId")]
        getter execution_preview_id : String?

        # The current status of the execution preview operation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Supplemental information about the current status of the execution preview.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @ended_at : Time? = nil,
          @execution_preview : Types::ExecutionPreview? = nil,
          @execution_preview_id : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct GetInventoryRequest
        include JSON::Serializable

        # Returns counts of inventory types based on one or more expressions. For example, if you aggregate by
        # using an expression that uses the AWS:InstanceInformation.PlatformType type, you can see a count of
        # how many Windows and Linux managed nodes exist in your inventoried fleet.

        @[JSON::Field(key: "Aggregators")]
        getter aggregators : Array(Types::InventoryAggregator)?

        # One or more filters. Use a filter to return a more specific list of results.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::InventoryFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of inventory item types to return.

        @[JSON::Field(key: "ResultAttributes")]
        getter result_attributes : Array(Types::ResultAttribute)?

        def initialize(
          @aggregators : Array(Types::InventoryAggregator)? = nil,
          @filters : Array(Types::InventoryFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @result_attributes : Array(Types::ResultAttribute)? = nil
        )
        end
      end


      struct GetInventoryResult
        include JSON::Serializable

        # Collection of inventory entities such as a collection of managed node inventory.

        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::InventoryResultEntity)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entities : Array(Types::InventoryResultEntity)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetInventorySchemaRequest
        include JSON::Serializable

        # Returns inventory schemas that support aggregation. For example, this call returns the
        # AWS:InstanceInformation type, because it supports aggregation based on the PlatformName ,
        # PlatformType , and PlatformVersion attributes.

        @[JSON::Field(key: "Aggregator")]
        getter aggregator : Bool?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns the sub-type schema for a specified inventory type.

        @[JSON::Field(key: "SubType")]
        getter sub_type : Bool?

        # The type of inventory item to return.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @aggregator : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sub_type : Bool? = nil,
          @type_name : String? = nil
        )
        end
      end


      struct GetInventorySchemaResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Inventory schemas returned by the request.

        @[JSON::Field(key: "Schemas")]
        getter schemas : Array(Types::InventoryItemSchema)?

        def initialize(
          @next_token : String? = nil,
          @schemas : Array(Types::InventoryItemSchema)? = nil
        )
        end
      end


      struct GetMaintenanceWindowExecutionRequest
        include JSON::Serializable

        # The ID of the maintenance window execution that includes the task.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String

        def initialize(
          @window_execution_id : String
        )
        end
      end


      struct GetMaintenanceWindowExecutionResult
        include JSON::Serializable

        # The time the maintenance window finished running.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The time the maintenance window started running.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the maintenance window execution.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The details explaining the status. Not available for all status values.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : String?

        # The ID of the task executions from the maintenance window execution.

        @[JSON::Field(key: "TaskIds")]
        getter task_ids : Array(String)?

        # The ID of the maintenance window execution.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String?

        def initialize(
          @end_time : Time? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_details : String? = nil,
          @task_ids : Array(String)? = nil,
          @window_execution_id : String? = nil
        )
        end
      end


      struct GetMaintenanceWindowExecutionTaskInvocationRequest
        include JSON::Serializable

        # The invocation ID to retrieve.

        @[JSON::Field(key: "InvocationId")]
        getter invocation_id : String

        # The ID of the specific task in the maintenance window task that should be retrieved.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        # The ID of the maintenance window execution for which the task is a part.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String

        def initialize(
          @invocation_id : String,
          @task_id : String,
          @window_execution_id : String
        )
        end
      end


      struct GetMaintenanceWindowExecutionTaskInvocationResult
        include JSON::Serializable

        # The time that the task finished running on the target.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The execution ID.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String?

        # The invocation ID.

        @[JSON::Field(key: "InvocationId")]
        getter invocation_id : String?

        # User-provided value to be included in any Amazon CloudWatch Events or Amazon EventBridge events
        # raised while running tasks for these targets in this maintenance window.

        @[JSON::Field(key: "OwnerInformation")]
        getter owner_information : String?

        # The parameters used at the time that the task ran.

        @[JSON::Field(key: "Parameters")]
        getter parameters : String?

        # The time that the task started running on the target.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The task status for an invocation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The details explaining the status. Details are only available for certain status values.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : String?

        # The task execution ID.

        @[JSON::Field(key: "TaskExecutionId")]
        getter task_execution_id : String?

        # Retrieves the task type for a maintenance window.

        @[JSON::Field(key: "TaskType")]
        getter task_type : String?

        # The maintenance window execution ID.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String?

        # The maintenance window target ID.

        @[JSON::Field(key: "WindowTargetId")]
        getter window_target_id : String?

        def initialize(
          @end_time : Time? = nil,
          @execution_id : String? = nil,
          @invocation_id : String? = nil,
          @owner_information : String? = nil,
          @parameters : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_details : String? = nil,
          @task_execution_id : String? = nil,
          @task_type : String? = nil,
          @window_execution_id : String? = nil,
          @window_target_id : String? = nil
        )
        end
      end


      struct GetMaintenanceWindowExecutionTaskRequest
        include JSON::Serializable

        # The ID of the specific task execution in the maintenance window task that should be retrieved.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        # The ID of the maintenance window execution that includes the task.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String

        def initialize(
          @task_id : String,
          @window_execution_id : String
        )
        end
      end


      struct GetMaintenanceWindowExecutionTaskResult
        include JSON::Serializable

        # The details for the CloudWatch alarm you applied to your maintenance window task.

        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # The time the task execution completed.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The defined maximum number of task executions that could be run in parallel.

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The defined maximum number of task execution errors allowed before scheduling of the task execution
        # would have been stopped.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # The priority of the task.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The role that was assumed when running the task.

        @[JSON::Field(key: "ServiceRole")]
        getter service_role : String?

        # The time the task execution started.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the task.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The details explaining the status. Not available for all status values.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : String?

        # The Amazon Resource Name (ARN) of the task that ran.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The ID of the specific task execution in the maintenance window task that was retrieved.

        @[JSON::Field(key: "TaskExecutionId")]
        getter task_execution_id : String?

        # The parameters passed to the task when it was run. TaskParameters has been deprecated. To specify
        # parameters to pass to a task when it runs, instead use the Parameters option in the
        # TaskInvocationParameters structure. For information about how Systems Manager handles these options
        # for the supported maintenance window task types, see MaintenanceWindowTaskInvocationParameters . The
        # map has the following format: Key : string, between 1 and 255 characters Value : an array of
        # strings, each between 1 and 255 characters

        @[JSON::Field(key: "TaskParameters")]
        getter task_parameters : Array(Hash(String, Types::MaintenanceWindowTaskParameterValueExpression))?

        # The CloudWatch alarms that were invoked by the maintenance window task.

        @[JSON::Field(key: "TriggeredAlarms")]
        getter triggered_alarms : Array(Types::AlarmStateInformation)?

        # The type of task that was run.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The ID of the maintenance window execution that includes the task.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String?

        def initialize(
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @end_time : Time? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @priority : Int32? = nil,
          @service_role : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_details : String? = nil,
          @task_arn : String? = nil,
          @task_execution_id : String? = nil,
          @task_parameters : Array(Hash(String, Types::MaintenanceWindowTaskParameterValueExpression))? = nil,
          @triggered_alarms : Array(Types::AlarmStateInformation)? = nil,
          @type : String? = nil,
          @window_execution_id : String? = nil
        )
        end
      end


      struct GetMaintenanceWindowRequest
        include JSON::Serializable

        # The ID of the maintenance window for which you want to retrieve information.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        def initialize(
          @window_id : String
        )
        end
      end


      struct GetMaintenanceWindowResult
        include JSON::Serializable

        # Whether targets must be registered with the maintenance window before tasks can be defined for those
        # targets.

        @[JSON::Field(key: "AllowUnassociatedTargets")]
        getter allow_unassociated_targets : Bool?

        # The date the maintenance window was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The number of hours before the end of the maintenance window that Amazon Web Services Systems
        # Manager stops scheduling new tasks for execution.

        @[JSON::Field(key: "Cutoff")]
        getter cutoff : Int32?

        # The description of the maintenance window.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The duration of the maintenance window in hours.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # Indicates whether the maintenance window is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to
        # become inactive. The maintenance window won't run after this specified time.

        @[JSON::Field(key: "EndDate")]
        getter end_date : String?

        # The date the maintenance window was last modified.

        @[JSON::Field(key: "ModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_date : Time?

        # The name of the maintenance window.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The next time the maintenance window will actually run, taking into account any specified times for
        # the maintenance window to become active or inactive.

        @[JSON::Field(key: "NextExecutionTime")]
        getter next_execution_time : String?

        # The schedule of the maintenance window in the form of a cron or rate expression.

        @[JSON::Field(key: "Schedule")]
        getter schedule : String?

        # The number of days to wait to run a maintenance window after the scheduled cron expression date and
        # time.

        @[JSON::Field(key: "ScheduleOffset")]
        getter schedule_offset : Int32?

        # The time zone that the scheduled maintenance window executions are based on, in Internet Assigned
        # Numbers Authority (IANA) format. For example: "America/Los_Angeles", "UTC", or "Asia/Seoul". For
        # more information, see the Time Zone Database on the IANA website.

        @[JSON::Field(key: "ScheduleTimezone")]
        getter schedule_timezone : String?

        # The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to
        # become active. The maintenance window won't run before this specified time.

        @[JSON::Field(key: "StartDate")]
        getter start_date : String?

        # The ID of the created maintenance window.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        def initialize(
          @allow_unassociated_targets : Bool? = nil,
          @created_date : Time? = nil,
          @cutoff : Int32? = nil,
          @description : String? = nil,
          @duration : Int32? = nil,
          @enabled : Bool? = nil,
          @end_date : String? = nil,
          @modified_date : Time? = nil,
          @name : String? = nil,
          @next_execution_time : String? = nil,
          @schedule : String? = nil,
          @schedule_offset : Int32? = nil,
          @schedule_timezone : String? = nil,
          @start_date : String? = nil,
          @window_id : String? = nil
        )
        end
      end


      struct GetMaintenanceWindowTaskRequest
        include JSON::Serializable

        # The maintenance window ID that includes the task to retrieve.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        # The maintenance window task ID to retrieve.

        @[JSON::Field(key: "WindowTaskId")]
        getter window_task_id : String

        def initialize(
          @window_id : String,
          @window_task_id : String
        )
        end
      end


      struct GetMaintenanceWindowTaskResult
        include JSON::Serializable

        # The details for the CloudWatch alarm you applied to your maintenance window task.

        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # The action to take on tasks when the maintenance window cutoff time is reached. CONTINUE_TASK means
        # that tasks continue to run. For Automation, Lambda, Step Functions tasks, CANCEL_TASK means that
        # currently running task invocations continue, but no new task invocations are started. For Run
        # Command tasks, CANCEL_TASK means the system attempts to stop the task by sending a CancelCommand
        # operation.

        @[JSON::Field(key: "CutoffBehavior")]
        getter cutoff_behavior : String?

        # The retrieved task description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The location in Amazon Simple Storage Service (Amazon S3) where the task results are logged.
        # LoggingInfo has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to
        # contain logs, instead use the OutputS3BucketName and OutputS3KeyPrefix options in the
        # TaskInvocationParameters structure. For information about how Amazon Web Services Systems Manager
        # handles these options for the supported maintenance window task types, see
        # MaintenanceWindowTaskInvocationParameters .

        @[JSON::Field(key: "LoggingInfo")]
        getter logging_info : Types::LoggingInfo?

        # The maximum number of targets allowed to run this task in parallel. For maintenance window tasks
        # without a target specified, you can't supply a value for this option. Instead, the system inserts a
        # placeholder value of 1 , which may be reported in the response to this command. This value doesn't
        # affect the running of your task and can be ignored.

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The maximum number of errors allowed before the task stops being scheduled. For maintenance window
        # tasks without a target specified, you can't supply a value for this option. Instead, the system
        # inserts a placeholder value of 1 , which may be reported in the response to this command. This value
        # doesn't affect the running of your task and can be ignored.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # The retrieved task name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The priority of the task when it runs. The lower the number, the higher the priority. Tasks that
        # have the same priority are scheduled in parallel.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to
        # assume when running a maintenance window task. If you do not specify a service role ARN, Systems
        # Manager uses a service-linked role in your account. If no appropriate service-linked role for
        # Systems Manager exists in your account, it is created when you run RegisterTaskWithMaintenanceWindow
        # . However, for an improved security posture, we strongly recommend creating a custom policy and
        # custom service role for running your maintenance window tasks. The policy can be crafted to provide
        # only the permissions needed for your particular maintenance window tasks. For more information, see
        # Setting up Maintenance Windows in the in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "ServiceRoleArn")]
        getter service_role_arn : String?

        # The targets where the task should run.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The resource that the task used during execution. For RUN_COMMAND and AUTOMATION task types, the
        # value of TaskArn is the SSM document name/ARN. For LAMBDA tasks, the value is the function name/ARN.
        # For STEP_FUNCTIONS tasks, the value is the state machine ARN.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The parameters to pass to the task when it runs.

        @[JSON::Field(key: "TaskInvocationParameters")]
        getter task_invocation_parameters : Types::MaintenanceWindowTaskInvocationParameters?

        # The parameters to pass to the task when it runs. TaskParameters has been deprecated. To specify
        # parameters to pass to a task when it runs, instead use the Parameters option in the
        # TaskInvocationParameters structure. For information about how Systems Manager handles these options
        # for the supported maintenance window task types, see MaintenanceWindowTaskInvocationParameters .

        @[JSON::Field(key: "TaskParameters")]
        getter task_parameters : Hash(String, Types::MaintenanceWindowTaskParameterValueExpression)?

        # The type of task to run.

        @[JSON::Field(key: "TaskType")]
        getter task_type : String?

        # The retrieved maintenance window ID.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        # The retrieved maintenance window task ID.

        @[JSON::Field(key: "WindowTaskId")]
        getter window_task_id : String?

        def initialize(
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @cutoff_behavior : String? = nil,
          @description : String? = nil,
          @logging_info : Types::LoggingInfo? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @service_role_arn : String? = nil,
          @targets : Array(Types::Target)? = nil,
          @task_arn : String? = nil,
          @task_invocation_parameters : Types::MaintenanceWindowTaskInvocationParameters? = nil,
          @task_parameters : Hash(String, Types::MaintenanceWindowTaskParameterValueExpression)? = nil,
          @task_type : String? = nil,
          @window_id : String? = nil,
          @window_task_id : String? = nil
        )
        end
      end


      struct GetOpsItemRequest
        include JSON::Serializable

        # The ID of the OpsItem that you want to get.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String

        # The OpsItem Amazon Resource Name (ARN).

        @[JSON::Field(key: "OpsItemArn")]
        getter ops_item_arn : String?

        def initialize(
          @ops_item_id : String,
          @ops_item_arn : String? = nil
        )
        end
      end


      struct GetOpsItemResponse
        include JSON::Serializable

        # The OpsItem.

        @[JSON::Field(key: "OpsItem")]
        getter ops_item : Types::OpsItem?

        def initialize(
          @ops_item : Types::OpsItem? = nil
        )
        end
      end


      struct GetOpsMetadataRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an OpsMetadata Object to view.

        @[JSON::Field(key: "OpsMetadataArn")]
        getter ops_metadata_arn : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @ops_metadata_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetOpsMetadataResult
        include JSON::Serializable

        # OpsMetadata for an Application Manager application.

        @[JSON::Field(key: "Metadata")]
        getter metadata : Hash(String, Types::MetadataValue)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The resource ID of the Application Manager application.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @metadata : Hash(String, Types::MetadataValue)? = nil,
          @next_token : String? = nil,
          @resource_id : String? = nil
        )
        end
      end


      struct GetOpsSummaryRequest
        include JSON::Serializable

        # Optional aggregators that return counts of OpsData based on one or more expressions.

        @[JSON::Field(key: "Aggregators")]
        getter aggregators : Array(Types::OpsAggregator)?

        # Optional filters used to scope down the returned OpsData.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::OpsFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The OpsData data type to return.

        @[JSON::Field(key: "ResultAttributes")]
        getter result_attributes : Array(Types::OpsResultAttribute)?

        # Specify the name of a resource data sync to get.

        @[JSON::Field(key: "SyncName")]
        getter sync_name : String?

        def initialize(
          @aggregators : Array(Types::OpsAggregator)? = nil,
          @filters : Array(Types::OpsFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @result_attributes : Array(Types::OpsResultAttribute)? = nil,
          @sync_name : String? = nil
        )
        end
      end


      struct GetOpsSummaryResult
        include JSON::Serializable

        # The list of aggregated details and filtered OpsData.

        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::OpsEntity)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entities : Array(Types::OpsEntity)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetParameterHistoryRequest
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the parameter for which you want to review history. For
        # parameters shared with you from another account, you must use the full ARN.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Return decrypted values for secure string parameters. This flag is ignored for String and StringList
        # parameter types.

        @[JSON::Field(key: "WithDecryption")]
        getter with_decryption : Bool?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @with_decryption : Bool? = nil
        )
        end
      end


      struct GetParameterHistoryResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of parameters returned by the request.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::ParameterHistory)?

        def initialize(
          @next_token : String? = nil,
          @parameters : Array(Types::ParameterHistory)? = nil
        )
        end
      end


      struct GetParameterRequest
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the parameter that you want to query. For parameters
        # shared with you from another account, you must use the full ARN. To query by parameter label, use
        # "Name": "name:label" . To query by parameter version, use "Name": "name:version" . For more
        # information about shared parameters, see Working with shared parameters in the Amazon Web Services
        # Systems Manager User Guide .

        @[JSON::Field(key: "Name")]
        getter name : String

        # Return decrypted values for secure string parameters. This flag is ignored for String and StringList
        # parameter types.

        @[JSON::Field(key: "WithDecryption")]
        getter with_decryption : Bool?

        def initialize(
          @name : String,
          @with_decryption : Bool? = nil
        )
        end
      end


      struct GetParameterResult
        include JSON::Serializable

        # Information about a parameter.

        @[JSON::Field(key: "Parameter")]
        getter parameter : Types::Parameter?

        def initialize(
          @parameter : Types::Parameter? = nil
        )
        end
      end


      struct GetParametersByPathRequest
        include JSON::Serializable

        # The hierarchy for the parameter. Hierarchies start with a forward slash (/). The hierarchy is the
        # parameter name except the last part of the parameter. For the API call to succeed, the last part of
        # the parameter name can't be in the path. A parameter name hierarchy can have a maximum of 15 levels.
        # Here is an example of a hierarchy: /Finance/Prod/IAD/WinServ2016/license33

        @[JSON::Field(key: "Path")]
        getter path : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters to limit the request results. The following Key values are supported for GetParametersByPath
        # : Type , KeyId , and Label . The following Key values aren't supported for GetParametersByPath : tag
        # , DataType , Name , Path , and Tier .

        @[JSON::Field(key: "ParameterFilters")]
        getter parameter_filters : Array(Types::ParameterStringFilter)?

        # Retrieve all parameters within a hierarchy. If a user has access to a path, then the user can access
        # all levels of that path. For example, if a user has permission to access path /a , then the user can
        # also access /a/b . Even if a user has explicitly been denied access in IAM for parameter /a/b , they
        # can still call the GetParametersByPath API operation recursively for /a and view /a/b .

        @[JSON::Field(key: "Recursive")]
        getter recursive : Bool?

        # Retrieve all parameters in a hierarchy with their value decrypted.

        @[JSON::Field(key: "WithDecryption")]
        getter with_decryption : Bool?

        def initialize(
          @path : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @parameter_filters : Array(Types::ParameterStringFilter)? = nil,
          @recursive : Bool? = nil,
          @with_decryption : Bool? = nil
        )
        end
      end


      struct GetParametersByPathResult
        include JSON::Serializable

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of parameters found in the specified hierarchy.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @next_token : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end


      struct GetParametersRequest
        include JSON::Serializable

        # The names or Amazon Resource Names (ARNs) of the parameters that you want to query. For parameters
        # shared with you from another account, you must use the full ARNs. To query by parameter label, use
        # "Name": "name:label" . To query by parameter version, use "Name": "name:version" . The results for
        # GetParameters requests are listed in alphabetical order in query responses. For information about
        # shared parameters, see Working with shared parameters in the Amazon Web Services Systems Manager
        # User Guide .

        @[JSON::Field(key: "Names")]
        getter names : Array(String)

        # Return decrypted secure string value. Return decrypted values for secure string parameters. This
        # flag is ignored for String and StringList parameter types.

        @[JSON::Field(key: "WithDecryption")]
        getter with_decryption : Bool?

        def initialize(
          @names : Array(String),
          @with_decryption : Bool? = nil
        )
        end
      end


      struct GetParametersResult
        include JSON::Serializable

        # A list of parameters that aren't formatted correctly or don't run during an execution.

        @[JSON::Field(key: "InvalidParameters")]
        getter invalid_parameters : Array(String)?

        # A list of details for a parameter.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @invalid_parameters : Array(String)? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end


      struct GetPatchBaselineForPatchGroupRequest
        include JSON::Serializable

        # The name of the patch group whose patch baseline should be retrieved.

        @[JSON::Field(key: "PatchGroup")]
        getter patch_group : String

        # Returns the operating system rule specified for patch groups using the patch baseline.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        def initialize(
          @patch_group : String,
          @operating_system : String? = nil
        )
        end
      end


      struct GetPatchBaselineForPatchGroupResult
        include JSON::Serializable

        # The ID of the patch baseline that should be used for the patch group.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String?

        # The operating system rule specified for patch groups using the patch baseline.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        # The name of the patch group.

        @[JSON::Field(key: "PatchGroup")]
        getter patch_group : String?

        def initialize(
          @baseline_id : String? = nil,
          @operating_system : String? = nil,
          @patch_group : String? = nil
        )
        end
      end


      struct GetPatchBaselineRequest
        include JSON::Serializable

        # The ID of the patch baseline to retrieve. To retrieve information about an Amazon Web Services
        # managed patch baseline, specify the full Amazon Resource Name (ARN) of the baseline. For example,
        # for the baseline AWS-AmazonLinuxDefaultPatchBaseline , specify
        # arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0e392de35e7c563b7 instead of
        # pb-0e392de35e7c563b7 .

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String

        def initialize(
          @baseline_id : String
        )
        end
      end


      struct GetPatchBaselineResult
        include JSON::Serializable

        # A set of rules used to include patches in the baseline.

        @[JSON::Field(key: "ApprovalRules")]
        getter approval_rules : Types::PatchRuleGroup?

        # A list of explicitly approved patches for the baseline.

        @[JSON::Field(key: "ApprovedPatches")]
        getter approved_patches : Array(String)?

        # Returns the specified compliance severity level for approved patches in the patch baseline.

        @[JSON::Field(key: "ApprovedPatchesComplianceLevel")]
        getter approved_patches_compliance_level : String?

        # Indicates whether the list of approved patches includes non-security updates that should be applied
        # to the managed nodes. The default value is false . Applies to Linux managed nodes only.

        @[JSON::Field(key: "ApprovedPatchesEnableNonSecurity")]
        getter approved_patches_enable_non_security : Bool?

        # Indicates the compliance status of managed nodes for which security-related patches are available
        # but were not approved. This preference is specified when the CreatePatchBaseline or
        # UpdatePatchBaseline commands are run. Applies to Windows Server managed nodes only.

        @[JSON::Field(key: "AvailableSecurityUpdatesComplianceStatus")]
        getter available_security_updates_compliance_status : String?

        # The ID of the retrieved patch baseline.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String?

        # The date the patch baseline was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # A description of the patch baseline.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A set of global filters used to exclude patches from the baseline.

        @[JSON::Field(key: "GlobalFilters")]
        getter global_filters : Types::PatchFilterGroup?

        # The date the patch baseline was last modified.

        @[JSON::Field(key: "ModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_date : Time?

        # The name of the patch baseline.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Returns the operating system specified for the patch baseline.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        # Patch groups included in the patch baseline.

        @[JSON::Field(key: "PatchGroups")]
        getter patch_groups : Array(String)?

        # A list of explicitly rejected patches for the baseline.

        @[JSON::Field(key: "RejectedPatches")]
        getter rejected_patches : Array(String)?

        # The action specified to take on patches included in the RejectedPatches list. A patch can be allowed
        # only if it is a dependency of another package, or blocked entirely along with packages that include
        # it as a dependency.

        @[JSON::Field(key: "RejectedPatchesAction")]
        getter rejected_patches_action : String?

        # Information about the patches to use to update the managed nodes, including target operating systems
        # and source repositories. Applies to Linux managed nodes only.

        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::PatchSource)?

        def initialize(
          @approval_rules : Types::PatchRuleGroup? = nil,
          @approved_patches : Array(String)? = nil,
          @approved_patches_compliance_level : String? = nil,
          @approved_patches_enable_non_security : Bool? = nil,
          @available_security_updates_compliance_status : String? = nil,
          @baseline_id : String? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @global_filters : Types::PatchFilterGroup? = nil,
          @modified_date : Time? = nil,
          @name : String? = nil,
          @operating_system : String? = nil,
          @patch_groups : Array(String)? = nil,
          @rejected_patches : Array(String)? = nil,
          @rejected_patches_action : String? = nil,
          @sources : Array(Types::PatchSource)? = nil
        )
        end
      end


      struct GetResourcePoliciesRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resource to which the policies are attached.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetResourcePoliciesResponse
        include JSON::Serializable

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of the Policy object.

        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::GetResourcePoliciesResponseEntry)?

        def initialize(
          @next_token : String? = nil,
          @policies : Array(Types::GetResourcePoliciesResponseEntry)? = nil
        )
        end
      end

      # A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account)
      # that can manage your Systems Manager resources. Currently, OpsItemGroup is the only resource that
      # supports Systems Manager resource policies. The resource policy for OpsItemGroup enables Amazon Web
      # Services accounts to view and interact with OpsCenter operational work items (OpsItems).

      struct GetResourcePoliciesResponseEntry
        include JSON::Serializable

        # A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account)
        # that can manage your Systems Manager resources. Currently, OpsItemGroup is the only resource that
        # supports Systems Manager resource policies. The resource policy for OpsItemGroup enables Amazon Web
        # Services accounts to view and interact with OpsCenter operational work items (OpsItems).

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # ID of the current policy version. The hash helps to prevent a situation where multiple users attempt
        # to overwrite a policy. You must provide this hash when updating or deleting a policy.

        @[JSON::Field(key: "PolicyHash")]
        getter policy_hash : String?

        # A policy ID.

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        def initialize(
          @policy : String? = nil,
          @policy_hash : String? = nil,
          @policy_id : String? = nil
        )
        end
      end

      # The request body of the GetServiceSetting API operation.

      struct GetServiceSettingRequest
        include JSON::Serializable

        # The ID of the service setting to get. The setting ID can be one of the following.
        # /ssm/appmanager/appmanager-enabled /ssm/automation/customer-script-log-destination
        # /ssm/automation/customer-script-log-group-name /ssm/automation/enable-adaptive-concurrency
        # /ssm/documents/console/public-sharing-permission /ssm/managed-instance/activation-tier
        # /ssm/managed-instance/default-ec2-instance-management-role /ssm/opsinsights/opscenter
        # /ssm/parameter-store/default-parameter-tier /ssm/parameter-store/high-throughput-enabled

        @[JSON::Field(key: "SettingId")]
        getter setting_id : String

        def initialize(
          @setting_id : String
        )
        end
      end

      # The query result body of the GetServiceSetting API operation.

      struct GetServiceSettingResult
        include JSON::Serializable

        # The query result of the current service setting.

        @[JSON::Field(key: "ServiceSetting")]
        getter service_setting : Types::ServiceSetting?

        def initialize(
          @service_setting : Types::ServiceSetting? = nil
        )
        end
      end

      # A hierarchy can have a maximum of 15 levels. For more information, see Requirements and constraints
      # for parameter names in the Amazon Web Services Systems Manager User Guide .

      struct HierarchyLevelLimitExceededException
        include JSON::Serializable

        # A hierarchy can have a maximum of 15 levels. For more information, see About requirements and
        # constraints for parameter names in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Parameter Store doesn't support changing a parameter type in a hierarchy. For example, you can't
      # change a parameter from a String type to a SecureString type. You must create a new, unique
      # parameter.

      struct HierarchyTypeMismatchException
        include JSON::Serializable

        # Parameter Store doesn't support changing a parameter type in a hierarchy. For example, you can't
        # change a parameter from a String type to a SecureString type. You must create a new, unique
        # parameter.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Error returned when an idempotent operation is retried and the parameters don't match the original
      # call to the API with the same idempotency token.

      struct IdempotentParameterMismatch
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # There is a conflict in the policies specified for this parameter. You can't, for example, specify
      # two Expiration policies for a parameter. Review your policies, and try again.

      struct IncompatiblePolicyException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Status information about the aggregated associations.

      struct InstanceAggregatedAssociationOverview
        include JSON::Serializable

        # Detailed status information about the aggregated associations.

        @[JSON::Field(key: "DetailedStatus")]
        getter detailed_status : String?

        # The number of associations for the managed nodes.

        @[JSON::Field(key: "InstanceAssociationStatusAggregatedCount")]
        getter instance_association_status_aggregated_count : Hash(String, Int32)?

        def initialize(
          @detailed_status : String? = nil,
          @instance_association_status_aggregated_count : Hash(String, Int32)? = nil
        )
        end
      end

      # One or more association documents on the managed node.

      struct InstanceAssociation
        include JSON::Serializable

        # The association ID.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # Version information for the association on the managed node.

        @[JSON::Field(key: "AssociationVersion")]
        getter association_version : String?

        # The content of the association document for the managed nodes.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The managed node ID.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        def initialize(
          @association_id : String? = nil,
          @association_version : String? = nil,
          @content : String? = nil,
          @instance_id : String? = nil
        )
        end
      end

      # An S3 bucket where you want to store the results of this request. For the minimal permissions
      # required to enable Amazon S3 output for an association, see Create an association (console) in the
      # Systems Manager User Guide .

      struct InstanceAssociationOutputLocation
        include JSON::Serializable

        # An S3 bucket where you want to store the results of this request.

        @[JSON::Field(key: "S3Location")]
        getter s3_location : Types::S3OutputLocation?

        def initialize(
          @s3_location : Types::S3OutputLocation? = nil
        )
        end
      end

      # The URL of S3 bucket where you want to store the results of this request.

      struct InstanceAssociationOutputUrl
        include JSON::Serializable

        # The URL of S3 bucket where you want to store the results of this request.

        @[JSON::Field(key: "S3OutputUrl")]
        getter s3_output_url : Types::S3OutputUrl?

        def initialize(
          @s3_output_url : Types::S3OutputUrl? = nil
        )
        end
      end

      # Status information about the association.

      struct InstanceAssociationStatusInfo
        include JSON::Serializable

        # The association ID.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # The name of the association applied to the managed node.

        @[JSON::Field(key: "AssociationName")]
        getter association_name : String?

        # The version of the association applied to the managed node.

        @[JSON::Field(key: "AssociationVersion")]
        getter association_version : String?

        # Detailed status information about the association.

        @[JSON::Field(key: "DetailedStatus")]
        getter detailed_status : String?

        # The association document versions.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # An error code returned by the request to create the association.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The date the association ran.

        @[JSON::Field(key: "ExecutionDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter execution_date : Time?

        # Summary information about association execution.

        @[JSON::Field(key: "ExecutionSummary")]
        getter execution_summary : String?

        # The managed node ID where the association was created.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The name of the association.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A URL for an S3 bucket where you want to store the results of this request.

        @[JSON::Field(key: "OutputUrl")]
        getter output_url : Types::InstanceAssociationOutputUrl?

        # Status information about the association.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @association_id : String? = nil,
          @association_name : String? = nil,
          @association_version : String? = nil,
          @detailed_status : String? = nil,
          @document_version : String? = nil,
          @error_code : String? = nil,
          @execution_date : Time? = nil,
          @execution_summary : String? = nil,
          @instance_id : String? = nil,
          @name : String? = nil,
          @output_url : Types::InstanceAssociationOutputUrl? = nil,
          @status : String? = nil
        )
        end
      end

      # Details about a specific managed node.

      struct InstanceInfo
        include JSON::Serializable

        # The type of agent installed on the node.

        @[JSON::Field(key: "AgentType")]
        getter agent_type : String?

        # The version number of the agent installed on the node.

        @[JSON::Field(key: "AgentVersion")]
        getter agent_version : String?

        # The fully qualified host name of the managed node.

        @[JSON::Field(key: "ComputerName")]
        getter computer_name : String?

        # The current status of the managed node.

        @[JSON::Field(key: "InstanceStatus")]
        getter instance_status : String?

        # The IP address of the managed node.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # Indicates whether the node is managed by Systems Manager.

        @[JSON::Field(key: "ManagedStatus")]
        getter managed_status : String?

        # The name of the operating system platform running on your managed node.

        @[JSON::Field(key: "PlatformName")]
        getter platform_name : String?

        # The operating system platform type of the managed node.

        @[JSON::Field(key: "PlatformType")]
        getter platform_type : String?

        # The version of the OS platform running on your managed node.

        @[JSON::Field(key: "PlatformVersion")]
        getter platform_version : String?

        # The type of instance, either an EC2 instance or another supported machine type in a hybrid fleet.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @agent_type : String? = nil,
          @agent_version : String? = nil,
          @computer_name : String? = nil,
          @instance_status : String? = nil,
          @ip_address : String? = nil,
          @managed_status : String? = nil,
          @platform_name : String? = nil,
          @platform_type : String? = nil,
          @platform_version : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Describes a filter for a specific list of managed nodes.

      struct InstanceInformation
        include JSON::Serializable

        # The activation ID created by Amazon Web Services Systems Manager when the server or virtual machine
        # (VM) was registered.

        @[JSON::Field(key: "ActivationId")]
        getter activation_id : String?

        # The version of SSM Agent running on your Linux managed node.

        @[JSON::Field(key: "AgentVersion")]
        getter agent_version : String?

        # Information about the association.

        @[JSON::Field(key: "AssociationOverview")]
        getter association_overview : Types::InstanceAggregatedAssociationOverview?

        # The status of the association.

        @[JSON::Field(key: "AssociationStatus")]
        getter association_status : String?

        # The fully qualified host name of the managed node.

        @[JSON::Field(key: "ComputerName")]
        getter computer_name : String?

        # The IP address of the managed node.

        @[JSON::Field(key: "IPAddress")]
        getter ip_address : String?

        # The role assigned to an Amazon EC2 instance configured with a Systems Manager Quick Setup host
        # management configuration or the role assigned to an on-premises managed node. This call doesn't
        # return the IAM role for unmanaged Amazon EC2 instances (instances not configured for Systems
        # Manager). To retrieve the role for an unmanaged instance, use the Amazon EC2 DescribeInstances
        # operation. For information, see DescribeInstances in the Amazon EC2 API Reference or
        # describe-instances in the Amazon Web Services CLI Command Reference .

        @[JSON::Field(key: "IamRole")]
        getter iam_role : String?

        # The managed node ID.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # Indicates whether the latest version of SSM Agent is running on your Linux managed node. This field
        # doesn't indicate whether or not the latest version is installed on Windows managed nodes, because
        # some older versions of Windows Server use the EC2Config service to process Systems Manager requests.

        @[JSON::Field(key: "IsLatestVersion")]
        getter is_latest_version : Bool?

        # The date the association was last run.

        @[JSON::Field(key: "LastAssociationExecutionDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_association_execution_date : Time?

        # The date and time when the agent last pinged the Systems Manager service.

        @[JSON::Field(key: "LastPingDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_ping_date_time : Time?

        # The last date the association was successfully run.

        @[JSON::Field(key: "LastSuccessfulAssociationExecutionDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_successful_association_execution_date : Time?

        # The name assigned to an on-premises server, edge device, or virtual machine (VM) when it is
        # activated as a Systems Manager managed node. The name is specified as the DefaultInstanceName
        # property using the CreateActivation command. It is applied to the managed node by specifying the
        # Activation Code and Activation ID when you install SSM Agent on the node, as explained in How to
        # install SSM Agent on hybrid Linux nodes and How to install SSM Agent on hybrid Windows Server nodes
        # . To retrieve the Name tag of an EC2 instance, use the Amazon EC2 DescribeInstances operation. For
        # information, see DescribeInstances in the Amazon EC2 API Reference or describe-instances in the
        # Amazon Web Services CLI Command Reference .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Connection status of SSM Agent. The status Inactive has been deprecated and is no longer in use.

        @[JSON::Field(key: "PingStatus")]
        getter ping_status : String?

        # The name of the operating system platform running on your managed node.

        @[JSON::Field(key: "PlatformName")]
        getter platform_name : String?

        # The operating system platform type.

        @[JSON::Field(key: "PlatformType")]
        getter platform_type : String?

        # The version of the OS platform running on your managed node.

        @[JSON::Field(key: "PlatformVersion")]
        getter platform_version : String?

        # The date the server or VM was registered with Amazon Web Services as a managed node.

        @[JSON::Field(key: "RegistrationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter registration_date : Time?

        # The type of instance. Instances are either EC2 instances or managed instances.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The ID of the source resource. For IoT Greengrass devices, SourceId is the Thing name.

        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        # The type of the source resource. For IoT Greengrass devices, SourceType is AWS::IoT::Thing .

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @activation_id : String? = nil,
          @agent_version : String? = nil,
          @association_overview : Types::InstanceAggregatedAssociationOverview? = nil,
          @association_status : String? = nil,
          @computer_name : String? = nil,
          @ip_address : String? = nil,
          @iam_role : String? = nil,
          @instance_id : String? = nil,
          @is_latest_version : Bool? = nil,
          @last_association_execution_date : Time? = nil,
          @last_ping_date_time : Time? = nil,
          @last_successful_association_execution_date : Time? = nil,
          @name : String? = nil,
          @ping_status : String? = nil,
          @platform_name : String? = nil,
          @platform_type : String? = nil,
          @platform_version : String? = nil,
          @registration_date : Time? = nil,
          @resource_type : String? = nil,
          @source_id : String? = nil,
          @source_type : String? = nil
        )
        end
      end

      # Describes a filter for a specific list of managed nodes. You can filter node information by using
      # tags. You specify tags by using a key-value mapping. Use this operation instead of the
      # DescribeInstanceInformationRequest$InstanceInformationFilterList method. The
      # InstanceInformationFilterList method is a legacy method and doesn't support tags.

      struct InstanceInformationFilter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "key")]
        getter key : String

        # The filter values.

        @[JSON::Field(key: "valueSet")]
        getter value_set : Array(String)

        def initialize(
          @key : String,
          @value_set : Array(String)
        )
        end
      end

      # The filters to describe or get information about your managed nodes.

      struct InstanceInformationStringFilter
        include JSON::Serializable

        # The filter key name to describe your managed nodes. Valid filter key values: ActivationIds |
        # AgentVersion | AssociationStatus | IamRole | InstanceIds | PingStatus | PlatformType | ResourceType
        # | SourceIds | SourceTypes | "tag-key" | "tag: {keyname} Valid values for the AssociationStatus
        # filter key: Success | Pending | Failed Valid values for the PingStatus filter key: Online |
        # ConnectionLost | Inactive (deprecated) Valid values for the PlatformType filter key: Windows | Linux
        # | MacOS Valid values for the ResourceType filter key: EC2Instance | ManagedInstance Valid values for
        # the SourceType filter key: AWS::EC2::Instance | AWS::SSM::ManagedInstance | AWS::IoT::Thing Valid
        # tag examples: Key=tag-key,Values=Purpose | Key=tag:Purpose,Values=Test .

        @[JSON::Field(key: "Key")]
        getter key : String

        # The filter values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @values : Array(String)
        )
        end
      end

      # Defines the high-level patch compliance state for a managed node, providing information about the
      # number of installed, missing, not applicable, and failed patches along with metadata about the
      # operation when this information was gathered for the managed node.

      struct InstancePatchState
        include JSON::Serializable

        # The ID of the patch baseline used to patch the managed node.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String

        # The ID of the managed node the high-level patch compliance information was collected for.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The type of patching operation that was performed: or SCAN assesses the patch compliance state.
        # INSTALL installs missing patches.

        @[JSON::Field(key: "Operation")]
        getter operation : String

        # The time the most recent patching operation completed on the managed node.

        @[JSON::Field(key: "OperationEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter operation_end_time : Time

        # The time the most recent patching operation was started on the managed node.

        @[JSON::Field(key: "OperationStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter operation_start_time : Time

        # The name of the patch group the managed node belongs to.

        @[JSON::Field(key: "PatchGroup")]
        getter patch_group : String

        # The number of security-related patches that are available but not approved because they didn't meet
        # the patch baseline requirements. For example, an updated version of a patch might have been released
        # before the specified auto-approval period was over. Applies to Windows Server managed nodes only.

        @[JSON::Field(key: "AvailableSecurityUpdateCount")]
        getter available_security_update_count : Int32?

        # The number of patches per node that are specified as Critical for compliance reporting in the patch
        # baseline aren't installed. These patches might be missing, have failed installation, were rejected,
        # or were installed but awaiting a required managed node reboot. The status of these managed nodes is
        # NON_COMPLIANT .

        @[JSON::Field(key: "CriticalNonCompliantCount")]
        getter critical_non_compliant_count : Int32?

        # The number of patches from the patch baseline that were attempted to be installed during the last
        # patching operation, but failed to install.

        @[JSON::Field(key: "FailedCount")]
        getter failed_count : Int32?

        # An https URL or an Amazon Simple Storage Service (Amazon S3) path-style URL to a list of patches to
        # be installed. This patch installation list, which you maintain in an S3 bucket in YAML format and
        # specify in the SSM document AWS-RunPatchBaseline , overrides the patches specified by the default
        # patch baseline. For more information about the InstallOverrideList parameter, see SSM Command
        # document for patching: AWS-RunPatchBaseline in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "InstallOverrideList")]
        getter install_override_list : String?

        # The number of patches from the patch baseline that are installed on the managed node.

        @[JSON::Field(key: "InstalledCount")]
        getter installed_count : Int32?

        # The number of patches not specified in the patch baseline that are installed on the managed node.

        @[JSON::Field(key: "InstalledOtherCount")]
        getter installed_other_count : Int32?

        # The number of patches installed by Patch Manager since the last time the managed node was rebooted.

        @[JSON::Field(key: "InstalledPendingRebootCount")]
        getter installed_pending_reboot_count : Int32?

        # The number of patches installed on a managed node that are specified in a RejectedPatches list.
        # Patches with a status of InstalledRejected were typically installed before they were added to a
        # RejectedPatches list. If ALLOW_AS_DEPENDENCY is the specified option for RejectedPatchesAction , the
        # value of InstalledRejectedCount will always be 0 (zero).

        @[JSON::Field(key: "InstalledRejectedCount")]
        getter installed_rejected_count : Int32?

        # The time of the last attempt to patch the managed node with NoReboot specified as the reboot option.

        @[JSON::Field(key: "LastNoRebootInstallOperationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_no_reboot_install_operation_time : Time?

        # The number of patches from the patch baseline that are applicable for the managed node but aren't
        # currently installed.

        @[JSON::Field(key: "MissingCount")]
        getter missing_count : Int32?

        # The number of patches from the patch baseline that aren't applicable for the managed node and
        # therefore aren't installed on the node. This number may be truncated if the list of patch names is
        # very large. The number of patches beyond this limit are reported in UnreportedNotApplicableCount .

        @[JSON::Field(key: "NotApplicableCount")]
        getter not_applicable_count : Int32?

        # The number of patches per node that are specified as other than Critical or Security but aren't
        # compliant with the patch baseline. The status of these managed nodes is NON_COMPLIANT .

        @[JSON::Field(key: "OtherNonCompliantCount")]
        getter other_non_compliant_count : Int32?

        # Placeholder information. This field will always be empty in the current release of the service.

        @[JSON::Field(key: "OwnerInformation")]
        getter owner_information : String?

        # Indicates the reboot option specified in the patch baseline. Reboot options apply to Install
        # operations only. Reboots aren't attempted for Patch Manager Scan operations. RebootIfNeeded : Patch
        # Manager tries to reboot the managed node if it installed any patches, or if any patches are detected
        # with a status of InstalledPendingReboot . NoReboot : Patch Manager attempts to install missing
        # packages without trying to reboot the system. Patches installed with this option are assigned a
        # status of InstalledPendingReboot . These patches might not be in effect until a reboot is performed.

        @[JSON::Field(key: "RebootOption")]
        getter reboot_option : String?

        # The number of patches per node that are specified as Security in a patch advisory aren't installed.
        # These patches might be missing, have failed installation, were rejected, or were installed but
        # awaiting a required managed node reboot. The status of these managed nodes is NON_COMPLIANT .

        @[JSON::Field(key: "SecurityNonCompliantCount")]
        getter security_non_compliant_count : Int32?

        # The ID of the patch baseline snapshot used during the patching operation when this compliance data
        # was collected.

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        # The number of patches beyond the supported limit of NotApplicableCount that aren't reported by name
        # to Inventory. Inventory is a tool in Amazon Web Services Systems Manager.

        @[JSON::Field(key: "UnreportedNotApplicableCount")]
        getter unreported_not_applicable_count : Int32?

        def initialize(
          @baseline_id : String,
          @instance_id : String,
          @operation : String,
          @operation_end_time : Time,
          @operation_start_time : Time,
          @patch_group : String,
          @available_security_update_count : Int32? = nil,
          @critical_non_compliant_count : Int32? = nil,
          @failed_count : Int32? = nil,
          @install_override_list : String? = nil,
          @installed_count : Int32? = nil,
          @installed_other_count : Int32? = nil,
          @installed_pending_reboot_count : Int32? = nil,
          @installed_rejected_count : Int32? = nil,
          @last_no_reboot_install_operation_time : Time? = nil,
          @missing_count : Int32? = nil,
          @not_applicable_count : Int32? = nil,
          @other_non_compliant_count : Int32? = nil,
          @owner_information : String? = nil,
          @reboot_option : String? = nil,
          @security_non_compliant_count : Int32? = nil,
          @snapshot_id : String? = nil,
          @unreported_not_applicable_count : Int32? = nil
        )
        end
      end

      # Defines a filter used in DescribeInstancePatchStatesForPatchGroup to scope down the information
      # returned by the API. Example : To filter for all managed nodes in a patch group having more than
      # three patches with a FailedCount status, use the following for the filter: Value for Key :
      # FailedCount Value for Type : GreaterThan Value for Values : 3

      struct InstancePatchStateFilter
        include JSON::Serializable

        # The key for the filter. Supported values include the following: InstalledCount InstalledOtherCount
        # InstalledPendingRebootCount InstalledRejectedCount MissingCount FailedCount
        # UnreportedNotApplicableCount NotApplicableCount

        @[JSON::Field(key: "Key")]
        getter key : String

        # The type of comparison that should be performed for the value.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The value for the filter. Must be an integer greater than or equal to 0.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @type : String,
          @values : Array(String)
        )
        end
      end

      # An object containing various properties of a managed node.

      struct InstanceProperty
        include JSON::Serializable

        # The activation ID created by Systems Manager when the server or virtual machine (VM) was registered

        @[JSON::Field(key: "ActivationId")]
        getter activation_id : String?

        # The version of SSM Agent running on your managed node.

        @[JSON::Field(key: "AgentVersion")]
        getter agent_version : String?

        # The CPU architecture of the node. For example, x86_64 .

        @[JSON::Field(key: "Architecture")]
        getter architecture : String?


        @[JSON::Field(key: "AssociationOverview")]
        getter association_overview : Types::InstanceAggregatedAssociationOverview?

        # The status of the State Manager association applied to the managed node.

        @[JSON::Field(key: "AssociationStatus")]
        getter association_status : String?

        # The fully qualified host name of the managed node.

        @[JSON::Field(key: "ComputerName")]
        getter computer_name : String?

        # The public IPv4 address assigned to the node. If a public IPv4 address isn't assigned to the node,
        # this value is blank.

        @[JSON::Field(key: "IPAddress")]
        getter ip_address : String?

        # The IAM role used in the hybrid activation to register the node with Systems Manager.

        @[JSON::Field(key: "IamRole")]
        getter iam_role : String?

        # The ID of the managed node.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The instance profile attached to the node. If an instance profile isn't attached to the node, this
        # value is blank.

        @[JSON::Field(key: "InstanceRole")]
        getter instance_role : String?

        # The current state of the node.

        @[JSON::Field(key: "InstanceState")]
        getter instance_state : String?

        # The instance type of the managed node. For example, t3.large.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The name of the key pair associated with the node. If a key pair isnt't associated with the node,
        # this value is blank.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String?

        # The date the association was last run.

        @[JSON::Field(key: "LastAssociationExecutionDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_association_execution_date : Time?

        # The date and time when the SSM Agent last pinged the Systems Manager service.

        @[JSON::Field(key: "LastPingDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_ping_date_time : Time?

        # The last date the association was successfully run.

        @[JSON::Field(key: "LastSuccessfulAssociationExecutionDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_successful_association_execution_date : Time?

        # The timestamp for when the node was launched.

        @[JSON::Field(key: "LaunchTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter launch_time : Time?

        # The value of the EC2 Name tag associated with the node. If a Name tag hasn't been applied to the
        # node, this value is blank.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Connection status of the SSM Agent on the managed node.

        @[JSON::Field(key: "PingStatus")]
        getter ping_status : String?

        # The name of the operating system platform running on your managed node.

        @[JSON::Field(key: "PlatformName")]
        getter platform_name : String?

        # The operating system platform type of the managed node. For example, Windows Server or Amazon Linux
        # 2.

        @[JSON::Field(key: "PlatformType")]
        getter platform_type : String?

        # The version of the OS platform running on your managed node.

        @[JSON::Field(key: "PlatformVersion")]
        getter platform_version : String?

        # The date the node was registered with Systems Manager.

        @[JSON::Field(key: "RegistrationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter registration_date : Time?

        # The type of managed node.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The ID of the source resource.

        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        # The type of the source resource.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @activation_id : String? = nil,
          @agent_version : String? = nil,
          @architecture : String? = nil,
          @association_overview : Types::InstanceAggregatedAssociationOverview? = nil,
          @association_status : String? = nil,
          @computer_name : String? = nil,
          @ip_address : String? = nil,
          @iam_role : String? = nil,
          @instance_id : String? = nil,
          @instance_role : String? = nil,
          @instance_state : String? = nil,
          @instance_type : String? = nil,
          @key_name : String? = nil,
          @last_association_execution_date : Time? = nil,
          @last_ping_date_time : Time? = nil,
          @last_successful_association_execution_date : Time? = nil,
          @launch_time : Time? = nil,
          @name : String? = nil,
          @ping_status : String? = nil,
          @platform_name : String? = nil,
          @platform_type : String? = nil,
          @platform_version : String? = nil,
          @registration_date : Time? = nil,
          @resource_type : String? = nil,
          @source_id : String? = nil,
          @source_type : String? = nil
        )
        end
      end

      # Describes a filter for a specific list of managed nodes. You can filter node information by using
      # tags. You specify tags by using a key-value mapping.

      struct InstancePropertyFilter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "key")]
        getter key : String

        # The filter values.

        @[JSON::Field(key: "valueSet")]
        getter value_set : Array(String)

        def initialize(
          @key : String,
          @value_set : Array(String)
        )
        end
      end

      # The filters to describe or get information about your managed nodes.

      struct InstancePropertyStringFilter
        include JSON::Serializable

        # The filter key name to describe your managed nodes.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The filter key name to describe your managed nodes.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        # The operator used by the filter call.

        @[JSON::Field(key: "Operator")]
        getter operator : String?

        def initialize(
          @key : String,
          @values : Array(String),
          @operator : String? = nil
        )
        end
      end

      # An error occurred on the server side.

      struct InternalServerError
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The activation isn't valid. The activation might have been deleted, or the ActivationId and the
      # ActivationCode don't match.

      struct InvalidActivation
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The activation ID isn't valid. Verify that you entered the correct ActivationId or ActivationCode
      # and try again.

      struct InvalidActivationId
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified aggregator isn't valid for the group type. Verify that the aggregator you provided is
      # supported.

      struct InvalidAggregatorException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request doesn't meet the regular expression requirement.

      struct InvalidAllowedPatternException
        include JSON::Serializable

        # The request doesn't meet the regular expression requirement.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The association isn't valid or doesn't exist.

      struct InvalidAssociation
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The version you specified isn't valid. Use ListAssociationVersions to view all versions of an
      # association according to the association ID. Or, use the $LATEST parameter to view the latest
      # version of the association.

      struct InvalidAssociationVersion
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The supplied parameters for invoking the specified Automation runbook are incorrect. For example,
      # they may not match the set of parameters permitted for the specified Automation document.

      struct InvalidAutomationExecutionParametersException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The signal isn't valid for the current Automation execution.

      struct InvalidAutomationSignalException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified update status operation isn't valid.

      struct InvalidAutomationStatusUpdateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified command ID isn't valid. Verify the ID and try again.

      struct InvalidCommandId
        include JSON::Serializable

        def initialize
        end
      end

      # One or more of the parameters specified for the delete operation isn't valid. Verify all parameters
      # and try again.

      struct InvalidDeleteInventoryParametersException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The ID specified for the delete operation doesn't exist or isn't valid. Verify the ID and try again.

      struct InvalidDeletionIdException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified SSM document doesn't exist.

      struct InvalidDocument
        include JSON::Serializable

        # The SSM document doesn't exist or the document isn't available to the user. This exception can be
        # issued by various API operations.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The content for the document isn't valid.

      struct InvalidDocumentContent
        include JSON::Serializable

        # A description of the validation error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You attempted to delete a document while it is still shared. You must stop sharing the document
      # before you can delete it.

      struct InvalidDocumentOperation
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The version of the document schema isn't supported.

      struct InvalidDocumentSchemaVersion
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The SSM document type isn't valid. Valid document types are described in the DocumentType property.

      struct InvalidDocumentType
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The document version isn't valid or doesn't exist.

      struct InvalidDocumentVersion
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The filter name isn't valid. Verify that you entered the correct name and try again.

      struct InvalidFilter
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified key isn't valid.

      struct InvalidFilterKey
        include JSON::Serializable

        def initialize
        end
      end

      # The specified filter option isn't valid. Valid options are Equals and BeginsWith. For Path filter,
      # valid options are Recursive and OneLevel.

      struct InvalidFilterOption
        include JSON::Serializable

        # The specified filter option isn't valid. Valid options are Equals and BeginsWith. For Path filter,
        # valid options are Recursive and OneLevel.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The filter value isn't valid. Verify the value and try again.

      struct InvalidFilterValue
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The following problems can cause this exception: You don't have permission to access the managed
      # node. Amazon Web Services Systems Manager Agent (SSM Agent) isn't running. Verify that SSM Agent is
      # running. SSM Agent isn't registered with the SSM endpoint. Try reinstalling SSM Agent. The managed
      # node isn't in a valid state. Valid states are: Running , Pending , Stopped , and Stopping . Invalid
      # states are: Shutting-down and Terminated .

      struct InvalidInstanceId
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified filter value isn't valid.

      struct InvalidInstanceInformationFilterValue
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified filter value isn't valid.

      struct InvalidInstancePropertyFilterValue
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified inventory group isn't valid.

      struct InvalidInventoryGroupException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You specified invalid keys or values in the Context attribute for InventoryItem . Verify the keys
      # and values, and try again.

      struct InvalidInventoryItemContextException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request isn't valid.

      struct InvalidInventoryRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more content items isn't valid.

      struct InvalidItemContentException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @message : String? = nil,
          @type_name : String? = nil
        )
        end
      end

      # The query key ID isn't valid.

      struct InvalidKeyId
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified token isn't valid.

      struct InvalidNextToken
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more configuration items isn't valid. Verify that a valid Amazon Resource Name (ARN) was
      # provided for an Amazon Simple Notification Service topic.

      struct InvalidNotificationConfig
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The delete inventory option specified isn't valid. Verify the option and try again.

      struct InvalidOptionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The S3 bucket doesn't exist.

      struct InvalidOutputFolder
        include JSON::Serializable

        def initialize
        end
      end

      # The output location isn't valid or doesn't exist.

      struct InvalidOutputLocation
        include JSON::Serializable

        def initialize
        end
      end

      # You must specify values for all required parameters in the Amazon Web Services Systems Manager
      # document (SSM document). You can only supply values to parameters defined in the SSM document.

      struct InvalidParameters
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The permission type isn't supported. Share is the only supported permission type.

      struct InvalidPermissionType
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The plugin name isn't valid.

      struct InvalidPluginName
        include JSON::Serializable

        def initialize
        end
      end

      # A policy attribute or its value is invalid.

      struct InvalidPolicyAttributeException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The policy type isn't supported. Parameter Store supports the following policy types: Expiration,
      # ExpirationNotification, and NoChangeNotification.

      struct InvalidPolicyTypeException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource ID isn't valid. Verify that you entered the correct ID and try again.

      struct InvalidResourceId
        include JSON::Serializable

        def initialize
        end
      end

      # The resource type isn't valid. For example, if you are attempting to tag an EC2 instance, the
      # instance must be a registered managed node.

      struct InvalidResourceType
        include JSON::Serializable

        def initialize
        end
      end

      # The specified inventory item result attribute isn't valid.

      struct InvalidResultAttributeException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The role name can't contain invalid characters. Also verify that you specified an IAM role for
      # notifications that includes the required trust policy. For information about configuring the IAM
      # role for Run Command notifications, see Monitoring Systems Manager status changes using Amazon SNS
      # notifications in the Amazon Web Services Systems Manager User Guide .

      struct InvalidRole
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The schedule is invalid. Verify your cron or rate expression and try again.

      struct InvalidSchedule
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified tag key or value isn't valid.

      struct InvalidTag
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The target isn't valid or doesn't exist. It might not be configured for Systems Manager or you might
      # not have permission to perform the operation.

      struct InvalidTarget
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # TargetMap parameter isn't valid.

      struct InvalidTargetMaps
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The parameter type name isn't valid.

      struct InvalidTypeNameException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The update isn't valid.

      struct InvalidUpdate
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies the inventory type and attribute for the aggregation execution.

      struct InventoryAggregator
        include JSON::Serializable

        # Nested aggregators to further refine aggregation for an inventory type.

        @[JSON::Field(key: "Aggregators")]
        getter aggregators : Array(Types::InventoryAggregator)?

        # The inventory type and attribute name for aggregation.

        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # A user-defined set of one or more filters on which to aggregate inventory data. Groups return a
        # count of resources that match and don't match the specified criteria.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::InventoryGroup)?

        def initialize(
          @aggregators : Array(Types::InventoryAggregator)? = nil,
          @expression : String? = nil,
          @groups : Array(Types::InventoryGroup)? = nil
        )
        end
      end

      # Status information returned by the DeleteInventory operation.

      struct InventoryDeletionStatusItem
        include JSON::Serializable

        # The deletion ID returned by the DeleteInventory operation.

        @[JSON::Field(key: "DeletionId")]
        getter deletion_id : String?

        # The UTC timestamp when the delete operation started.

        @[JSON::Field(key: "DeletionStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter deletion_start_time : Time?

        # Information about the delete operation. For more information about this summary, see Understanding
        # the delete inventory summary in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "DeletionSummary")]
        getter deletion_summary : Types::InventoryDeletionSummary?

        # The status of the operation. Possible values are InProgress and Complete.

        @[JSON::Field(key: "LastStatus")]
        getter last_status : String?

        # Information about the status.

        @[JSON::Field(key: "LastStatusMessage")]
        getter last_status_message : String?

        # The UTC timestamp of when the last status report.

        @[JSON::Field(key: "LastStatusUpdateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_status_update_time : Time?

        # The name of the inventory data type.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @deletion_id : String? = nil,
          @deletion_start_time : Time? = nil,
          @deletion_summary : Types::InventoryDeletionSummary? = nil,
          @last_status : String? = nil,
          @last_status_message : String? = nil,
          @last_status_update_time : Time? = nil,
          @type_name : String? = nil
        )
        end
      end

      # Information about the delete operation.

      struct InventoryDeletionSummary
        include JSON::Serializable

        # Remaining number of items to delete.

        @[JSON::Field(key: "RemainingCount")]
        getter remaining_count : Int32?

        # A list of counts and versions for deleted items.

        @[JSON::Field(key: "SummaryItems")]
        getter summary_items : Array(Types::InventoryDeletionSummaryItem)?

        # The total number of items to delete. This count doesn't change during the delete operation.

        @[JSON::Field(key: "TotalCount")]
        getter total_count : Int32?

        def initialize(
          @remaining_count : Int32? = nil,
          @summary_items : Array(Types::InventoryDeletionSummaryItem)? = nil,
          @total_count : Int32? = nil
        )
        end
      end

      # Either a count, remaining count, or a version number in a delete inventory summary.

      struct InventoryDeletionSummaryItem
        include JSON::Serializable

        # A count of the number of deleted items.

        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # The remaining number of items to delete.

        @[JSON::Field(key: "RemainingCount")]
        getter remaining_count : Int32?

        # The inventory type version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @count : Int32? = nil,
          @remaining_count : Int32? = nil,
          @version : String? = nil
        )
        end
      end

      # One or more filters. Use a filter to return a more specific list of results. Example formats for the
      # aws ssm get-inventory command: --filters
      # Key=AWS:InstanceInformation.AgentType,Values=amazon-ssm-agent,Type=Equal --filters
      # Key=AWS:InstanceInformation.AgentVersion,Values=3.3.2299.0,Type=Equal --filters
      # Key=AWS:InstanceInformation.ComputerName,Values=ip-192.0.2.0.us-east-2.compute.internal,Type=Equal
      # --filters
      # Key=AWS:InstanceInformation.InstanceId,Values=i-0a4cd6ceffEXAMPLE,i-1a2b3c4d5e6EXAMPLE,Type=Equal
      # --filters Key=AWS:InstanceInformation.InstanceStatus,Values=Active,Type=Equal --filters
      # Key=AWS:InstanceInformation.IpAddress,Values=198.51.100.0,Type=Equal --filters
      # Key=AWS:InstanceInformation.PlatformName,Values="Amazon Linux",Type=Equal --filters
      # Key=AWS:InstanceInformation.PlatformType,Values=Linux,Type=Equal --filters
      # Key=AWS:InstanceInformation.PlatformVersion,Values=2023,Type=BeginWith --filters
      # Key=AWS:InstanceInformation.ResourceType,Values=EC2Instance,Type=Equal

      struct InventoryFilter
        include JSON::Serializable

        # The name of the filter key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Inventory filter values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        # The type of filter. The Exists filter must be used with aggregators. For more information, see
        # Aggregating inventory data in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @key : String,
          @values : Array(String),
          @type : String? = nil
        )
        end
      end

      # A user-defined set of one or more filters on which to aggregate inventory data. Groups return a
      # count of resources that match and don't match the specified criteria.

      struct InventoryGroup
        include JSON::Serializable

        # Filters define the criteria for the group. The matchingCount field displays the number of resources
        # that match the criteria. The notMatchingCount field displays the number of resources that don't
        # match the criteria.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::InventoryFilter)

        # The name of the group.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @filters : Array(Types::InventoryFilter),
          @name : String
        )
        end
      end

      # Information collected from managed nodes based on your inventory policy document

      struct InventoryItem
        include JSON::Serializable

        # The time the inventory information was collected.

        @[JSON::Field(key: "CaptureTime")]
        getter capture_time : String

        # The schema version for the inventory item.

        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String

        # The name of the inventory type. Default inventory item type names start with AWS . Custom inventory
        # type names will start with Custom. Default inventory item types include the following:
        # AWS:AWSComponent , AWS:Application , AWS:InstanceInformation , AWS:Network , and AWS:WindowsUpdate .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        # The inventory data of the inventory type.

        @[JSON::Field(key: "Content")]
        getter content : Array(Hash(String, String))?

        # MD5 hash of the inventory item type contents. The content hash is used to determine whether to
        # update inventory information. The PutInventory API doesn't update the inventory item type contents
        # if the MD5 hash hasn't changed since last update.

        @[JSON::Field(key: "ContentHash")]
        getter content_hash : String?

        # A map of associated properties for a specified inventory type. For example, with this attribute, you
        # can specify the ExecutionId , ExecutionType , ComplianceType properties of the AWS:ComplianceItem
        # type.

        @[JSON::Field(key: "Context")]
        getter context : Hash(String, String)?

        def initialize(
          @capture_time : String,
          @schema_version : String,
          @type_name : String,
          @content : Array(Hash(String, String))? = nil,
          @content_hash : String? = nil,
          @context : Hash(String, String)? = nil
        )
        end
      end

      # Attributes are the entries within the inventory item content. It contains name and value.

      struct InventoryItemAttribute
        include JSON::Serializable

        # The data type of the inventory item attribute.

        @[JSON::Field(key: "DataType")]
        getter data_type : String

        # Name of the inventory item attribute.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @data_type : String,
          @name : String
        )
        end
      end

      # The inventory item schema definition. Users can use this to compose inventory query filters.

      struct InventoryItemSchema
        include JSON::Serializable

        # The schema attributes for inventory. This contains data type and attribute name.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::InventoryItemAttribute)

        # The name of the inventory type. Default inventory item type names start with Amazon Web Services.
        # Custom inventory type names will start with Custom. Default inventory item types include the
        # following: AWS:AWSComponent , AWS:Application , AWS:InstanceInformation , AWS:Network , and
        # AWS:WindowsUpdate .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        # The alias name of the inventory type. The alias name is used for display purposes.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The schema version for the inventory item.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @attributes : Array(Types::InventoryItemAttribute),
          @type_name : String,
          @display_name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Inventory query results.

      struct InventoryResultEntity
        include JSON::Serializable

        # The data section in the inventory result entity JSON.

        @[JSON::Field(key: "Data")]
        getter data : Hash(String, Types::InventoryResultItem)?

        # ID of the inventory result entity. For example, for managed node inventory the result will be the
        # managed node ID. For EC2 instance inventory, the result will be the instance ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @data : Hash(String, Types::InventoryResultItem)? = nil,
          @id : String? = nil
        )
        end
      end

      # The inventory result item.

      struct InventoryResultItem
        include JSON::Serializable

        # Contains all the inventory data of the item type. Results include attribute names and values.

        @[JSON::Field(key: "Content")]
        getter content : Array(Hash(String, String))

        # The schema version for the inventory result item/

        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String

        # The name of the inventory result item type.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        # The time inventory item data was captured.

        @[JSON::Field(key: "CaptureTime")]
        getter capture_time : String?

        # MD5 hash of the inventory item type contents. The content hash is used to determine whether to
        # update inventory information. The PutInventory API doesn't update the inventory item type contents
        # if the MD5 hash hasn't changed since last update.

        @[JSON::Field(key: "ContentHash")]
        getter content_hash : String?

        def initialize(
          @content : Array(Hash(String, String)),
          @schema_version : String,
          @type_name : String,
          @capture_time : String? = nil,
          @content_hash : String? = nil
        )
        end
      end

      # The command ID and managed node ID you specified didn't match any invocations. Verify the command ID
      # and the managed node ID and try again.

      struct InvocationDoesNotExist
        include JSON::Serializable

        def initialize
        end
      end

      # The inventory item has invalid content.

      struct ItemContentMismatchException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @message : String? = nil,
          @type_name : String? = nil
        )
        end
      end

      # The inventory item size has exceeded the size limit.

      struct ItemSizeLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @message : String? = nil,
          @type_name : String? = nil
        )
        end
      end


      struct LabelParameterVersionRequest
        include JSON::Serializable

        # One or more labels to attach to the specified parameter version.

        @[JSON::Field(key: "Labels")]
        getter labels : Array(String)

        # The parameter name on which you want to attach one or more labels. You can't enter the Amazon
        # Resource Name (ARN) for a parameter, only the parameter name itself.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The specific version of the parameter on which you want to attach one or more labels. If no version
        # is specified, the system attaches the label to the latest version.

        @[JSON::Field(key: "ParameterVersion")]
        getter parameter_version : Int64?

        def initialize(
          @labels : Array(String),
          @name : String,
          @parameter_version : Int64? = nil
        )
        end
      end


      struct LabelParameterVersionResult
        include JSON::Serializable

        # The label doesn't meet the requirements. For information about parameter label requirements, see
        # Working with parameter labels in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "InvalidLabels")]
        getter invalid_labels : Array(String)?

        # The version of the parameter that has been labeled.

        @[JSON::Field(key: "ParameterVersion")]
        getter parameter_version : Int64?

        def initialize(
          @invalid_labels : Array(String)? = nil,
          @parameter_version : Int64? = nil
        )
        end
      end


      struct ListAssociationVersionsRequest
        include JSON::Serializable

        # The association ID for which you want to view all versions.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @association_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociationVersionsResult
        include JSON::Serializable

        # Information about all versions of the association for the specified association ID.

        @[JSON::Field(key: "AssociationVersions")]
        getter association_versions : Array(Types::AssociationVersionInfo)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @association_versions : Array(Types::AssociationVersionInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociationsRequest
        include JSON::Serializable

        # One or more filters. Use a filter to return a more specific list of results. Filtering associations
        # using the InstanceID attribute only returns legacy associations created using the InstanceID
        # attribute. Associations targeting the managed node that are part of the Target Attributes
        # ResourceGroup or Tags aren't returned.

        @[JSON::Field(key: "AssociationFilterList")]
        getter association_filter_list : Array(Types::AssociationFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @association_filter_list : Array(Types::AssociationFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociationsResult
        include JSON::Serializable

        # The associations.

        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::Association)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @associations : Array(Types::Association)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCommandInvocationsRequest
        include JSON::Serializable

        # (Optional) The invocations for a specific command ID.

        @[JSON::Field(key: "CommandId")]
        getter command_id : String?

        # (Optional) If set this returns the response of the command executions and any command output. The
        # default value is false .

        @[JSON::Field(key: "Details")]
        getter details : Bool?

        # (Optional) One or more filters. Use a filter to return a more specific list of results.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::CommandFilter)?

        # (Optional) The command execution details for a specific managed node ID.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # (Optional) The maximum number of items to return for this call. The call also returns a token that
        # you can specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # (Optional) The token for the next set of items to return. (You received this token from a previous
        # call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @command_id : String? = nil,
          @details : Bool? = nil,
          @filters : Array(Types::CommandFilter)? = nil,
          @instance_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCommandInvocationsResult
        include JSON::Serializable

        # (Optional) A list of all invocations.

        @[JSON::Field(key: "CommandInvocations")]
        getter command_invocations : Array(Types::CommandInvocation)?

        # (Optional) The token for the next set of items to return. (You received this token from a previous
        # call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @command_invocations : Array(Types::CommandInvocation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCommandsRequest
        include JSON::Serializable

        # (Optional) If provided, lists only the specified command.

        @[JSON::Field(key: "CommandId")]
        getter command_id : String?

        # (Optional) One or more filters. Use a filter to return a more specific list of results.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::CommandFilter)?

        # (Optional) Lists commands issued against this managed node ID. You can't specify a managed node ID
        # in the same command that you specify Status = Pending . This is because the command hasn't reached
        # the managed node yet.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # (Optional) The maximum number of items to return for this call. The call also returns a token that
        # you can specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # (Optional) The token for the next set of items to return. (You received this token from a previous
        # call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @command_id : String? = nil,
          @filters : Array(Types::CommandFilter)? = nil,
          @instance_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCommandsResult
        include JSON::Serializable

        # (Optional) The list of commands requested by the user.

        @[JSON::Field(key: "Commands")]
        getter commands : Array(Types::Command)?

        # (Optional) The token for the next set of items to return. (You received this token from a previous
        # call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @commands : Array(Types::Command)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComplianceItemsRequest
        include JSON::Serializable

        # One or more compliance filters. Use a filter to return a more specific list of results.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ComplianceStringFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID for the resources from which to get compliance information. Currently, you can only specify
        # one resource ID.

        @[JSON::Field(key: "ResourceIds")]
        getter resource_ids : Array(String)?

        # The type of resource from which to get compliance information. Currently, the only supported
        # resource type is ManagedInstance .

        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        def initialize(
          @filters : Array(Types::ComplianceStringFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_ids : Array(String)? = nil,
          @resource_types : Array(String)? = nil
        )
        end
      end


      struct ListComplianceItemsResult
        include JSON::Serializable

        # A list of compliance information for the specified resource ID.

        @[JSON::Field(key: "ComplianceItems")]
        getter compliance_items : Array(Types::ComplianceItem)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @compliance_items : Array(Types::ComplianceItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComplianceSummariesRequest
        include JSON::Serializable

        # One or more compliance or inventory filters. Use a filter to return a more specific list of results.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ComplianceStringFilter)?

        # The maximum number of items to return for this call. Currently, you can specify null or 50. The call
        # also returns a token that you can specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::ComplianceStringFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComplianceSummariesResult
        include JSON::Serializable

        # A list of compliant and non-compliant summary counts based on compliance types. For example, this
        # call returns State Manager associations, patches, or custom compliance types according to the filter
        # criteria that you specified.

        @[JSON::Field(key: "ComplianceSummaryItems")]
        getter compliance_summary_items : Array(Types::ComplianceSummaryItem)?

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @compliance_summary_items : Array(Types::ComplianceSummaryItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDocumentMetadataHistoryRequest
        include JSON::Serializable

        # The type of data for which details are being requested. Currently, the only supported value is
        # DocumentReviews .

        @[JSON::Field(key: "Metadata")]
        getter metadata : String

        # The name of the change template.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The version of the change template.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @metadata : String,
          @name : String,
          @document_version : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDocumentMetadataHistoryResponse
        include JSON::Serializable

        # The user ID of the person in the organization who requested the review of the change template.

        @[JSON::Field(key: "Author")]
        getter author : String?

        # The version of the change template.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # Information about the response to the change template approval request.

        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::DocumentMetadataResponseInfo?

        # The name of the change template.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @author : String? = nil,
          @document_version : String? = nil,
          @metadata : Types::DocumentMetadataResponseInfo? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDocumentVersionsRequest
        include JSON::Serializable

        # The name of the document. You can specify an Amazon Resource Name (ARN).

        @[JSON::Field(key: "Name")]
        getter name : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDocumentVersionsResult
        include JSON::Serializable

        # The document versions.

        @[JSON::Field(key: "DocumentVersions")]
        getter document_versions : Array(Types::DocumentVersionInfo)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @document_versions : Array(Types::DocumentVersionInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDocumentsRequest
        include JSON::Serializable

        # This data type is deprecated. Instead, use Filters .

        @[JSON::Field(key: "DocumentFilterList")]
        getter document_filter_list : Array(Types::DocumentFilter)?

        # One or more DocumentKeyValuesFilter objects. Use a filter to return a more specific list of results.
        # For keys, you can specify one or more key-value pair tags that have been applied to a document.
        # Other valid keys include Owner , Name , PlatformTypes , DocumentType , and TargetType . For example,
        # to return documents you own use Key=Owner,Values=Self . To specify a custom key-value pair, use the
        # format Key=tag:tagName,Values=valueName . This API operation only supports filtering documents by
        # using a single tag key and one or more tag values. For example:
        # Key=tag:tagName,Values=valueName1,valueName2

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::DocumentKeyValuesFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @document_filter_list : Array(Types::DocumentFilter)? = nil,
          @filters : Array(Types::DocumentKeyValuesFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDocumentsResult
        include JSON::Serializable

        # The names of the SSM documents.

        @[JSON::Field(key: "DocumentIdentifiers")]
        getter document_identifiers : Array(Types::DocumentIdentifier)?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @document_identifiers : Array(Types::DocumentIdentifier)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInventoryEntriesRequest
        include JSON::Serializable

        # The managed node ID for which you want inventory information.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The type of inventory item for which you want information.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        # One or more filters. Use a filter to return a more specific list of results.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::InventoryFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_id : String,
          @type_name : String,
          @filters : Array(Types::InventoryFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInventoryEntriesResult
        include JSON::Serializable

        # The time that inventory information was collected for the managed nodes.

        @[JSON::Field(key: "CaptureTime")]
        getter capture_time : String?

        # A list of inventory items on the managed nodes.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Hash(String, String))?

        # The managed node ID targeted by the request to query inventory information.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The inventory schema version used by the managed nodes.

        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?

        # The type of inventory item returned by the request.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @capture_time : String? = nil,
          @entries : Array(Hash(String, String))? = nil,
          @instance_id : String? = nil,
          @next_token : String? = nil,
          @schema_version : String? = nil,
          @type_name : String? = nil
        )
        end
      end


      struct ListNodesRequest
        include JSON::Serializable

        # One or more filters. Use a filter to return a more specific list of managed nodes.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::NodeFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the Amazon Web Services managed resource data sync to retrieve information about. For
        # cross-account/cross-Region configurations, this parameter is required, and the name of the supported
        # resource data sync is AWS-QuickSetup-ManagedNode . For single account/single-Region configurations,
        # the parameter is not required.

        @[JSON::Field(key: "SyncName")]
        getter sync_name : String?

        def initialize(
          @filters : Array(Types::NodeFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sync_name : String? = nil
        )
        end
      end


      struct ListNodesResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of managed nodes that match the specified filter criteria.

        @[JSON::Field(key: "Nodes")]
        getter nodes : Array(Types::Node)?

        def initialize(
          @next_token : String? = nil,
          @nodes : Array(Types::Node)? = nil
        )
        end
      end


      struct ListNodesSummaryRequest
        include JSON::Serializable

        # Specify one or more aggregators to return a count of managed nodes that match that expression. For
        # example, a count of managed nodes by operating system.

        @[JSON::Field(key: "Aggregators")]
        getter aggregators : Array(Types::NodeAggregator)

        # One or more filters. Use a filter to generate a summary that matches your specified filter criteria.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::NodeFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.) The
        # call also returns a token that you can specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the Amazon Web Services managed resource data sync to retrieve information about. For
        # cross-account/cross-Region configurations, this parameter is required, and the name of the supported
        # resource data sync is AWS-QuickSetup-ManagedNode . For single account/single-Region configurations,
        # the parameter is not required.

        @[JSON::Field(key: "SyncName")]
        getter sync_name : String?

        def initialize(
          @aggregators : Array(Types::NodeAggregator),
          @filters : Array(Types::NodeFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sync_name : String? = nil
        )
        end
      end


      struct ListNodesSummaryResult
        include JSON::Serializable

        # The token to use when requesting the next set of items. If there are no additional items to return,
        # the string is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A collection of objects reporting information about your managed nodes, such as the count of nodes
        # by operating system.

        @[JSON::Field(key: "Summary")]
        getter summary : Array(Hash(String, String))?

        def initialize(
          @next_token : String? = nil,
          @summary : Array(Hash(String, String))? = nil
        )
        end
      end


      struct ListOpsItemEventsRequest
        include JSON::Serializable

        # One or more OpsItem filters. Use a filter to return a more specific list of results.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::OpsItemEventFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::OpsItemEventFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOpsItemEventsResponse
        include JSON::Serializable

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of event information for the specified OpsItems.

        @[JSON::Field(key: "Summaries")]
        getter summaries : Array(Types::OpsItemEventSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::OpsItemEventSummary)? = nil
        )
        end
      end


      struct ListOpsItemRelatedItemsRequest
        include JSON::Serializable

        # One or more OpsItem filters. Use a filter to return a more specific list of results.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::OpsItemRelatedItemsFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID of the OpsItem for which you want to list all related-item resources.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String?

        def initialize(
          @filters : Array(Types::OpsItemRelatedItemsFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @ops_item_id : String? = nil
        )
        end
      end


      struct ListOpsItemRelatedItemsResponse
        include JSON::Serializable

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of related-item resources for the specified OpsItem.

        @[JSON::Field(key: "Summaries")]
        getter summaries : Array(Types::OpsItemRelatedItemSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::OpsItemRelatedItemSummary)? = nil
        )
        end
      end


      struct ListOpsMetadataRequest
        include JSON::Serializable

        # One or more filters to limit the number of OpsMetadata objects returned by the call.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::OpsMetadataFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::OpsMetadataFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOpsMetadataResult
        include JSON::Serializable

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a list of OpsMetadata objects.

        @[JSON::Field(key: "OpsMetadataList")]
        getter ops_metadata_list : Array(Types::OpsMetadata)?

        def initialize(
          @next_token : String? = nil,
          @ops_metadata_list : Array(Types::OpsMetadata)? = nil
        )
        end
      end


      struct ListResourceComplianceSummariesRequest
        include JSON::Serializable

        # One or more filters. Use a filter to return a more specific list of results.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ComplianceStringFilter)?

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::ComplianceStringFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceComplianceSummariesResult
        include JSON::Serializable

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A summary count for specified or targeted managed nodes. Summary count includes information about
        # compliant and non-compliant State Manager associations, patch status, or custom items according to
        # the filter criteria that you specify.

        @[JSON::Field(key: "ResourceComplianceSummaryItems")]
        getter resource_compliance_summary_items : Array(Types::ResourceComplianceSummaryItem)?

        def initialize(
          @next_token : String? = nil,
          @resource_compliance_summary_items : Array(Types::ResourceComplianceSummaryItem)? = nil
        )
        end
      end


      struct ListResourceDataSyncRequest
        include JSON::Serializable

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # View a list of resource data syncs according to the sync type. Specify SyncToDestination to view
        # resource data syncs that synchronize data to an Amazon S3 bucket. Specify SyncFromSource to view
        # resource data syncs from Organizations or from multiple Amazon Web Services Regions.

        @[JSON::Field(key: "SyncType")]
        getter sync_type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sync_type : String? = nil
        )
        end
      end


      struct ListResourceDataSyncResult
        include JSON::Serializable

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of your current resource data sync configurations and their statuses.

        @[JSON::Field(key: "ResourceDataSyncItems")]
        getter resource_data_sync_items : Array(Types::ResourceDataSyncItem)?

        def initialize(
          @next_token : String? = nil,
          @resource_data_sync_items : Array(Types::ResourceDataSyncItem)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The resource ID for which you want to see a list of tags.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Returns a list of tags for a specific resource type.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct ListTagsForResourceResult
        include JSON::Serializable

        # A list of tags.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about an Amazon Simple Storage Service (Amazon S3) bucket to write managed node-level
      # logs to. LoggingInfo has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3)
      # bucket to contain logs, instead use the OutputS3BucketName and OutputS3KeyPrefix options in the
      # TaskInvocationParameters structure. For information about how Amazon Web Services Systems Manager
      # handles these options for the supported maintenance window task types, see
      # MaintenanceWindowTaskInvocationParameters .

      struct LoggingInfo
        include JSON::Serializable

        # The name of an S3 bucket where execution logs are stored.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String

        # The Amazon Web Services Region where the S3 bucket is located.

        @[JSON::Field(key: "S3Region")]
        getter s3_region : String

        # (Optional) The S3 bucket subfolder.

        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        def initialize(
          @s3_bucket_name : String,
          @s3_region : String,
          @s3_key_prefix : String? = nil
        )
        end
      end

      # The parameters for an AUTOMATION task type.

      struct MaintenanceWindowAutomationParameters
        include JSON::Serializable

        # The version of an Automation runbook to use during task execution.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The parameters for the AUTOMATION task. For information about specifying and updating task
        # parameters, see RegisterTaskWithMaintenanceWindow and UpdateMaintenanceWindowTask . LoggingInfo has
        # been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs,
        # instead use the OutputS3BucketName and OutputS3KeyPrefix options in the TaskInvocationParameters
        # structure. For information about how Amazon Web Services Systems Manager handles these options for
        # the supported maintenance window task types, see MaintenanceWindowTaskInvocationParameters .
        # TaskParameters has been deprecated. To specify parameters to pass to a task when it runs, instead
        # use the Parameters option in the TaskInvocationParameters structure. For information about how
        # Systems Manager handles these options for the supported maintenance window task types, see
        # MaintenanceWindowTaskInvocationParameters . For AUTOMATION task types, Amazon Web Services Systems
        # Manager ignores any values specified for these parameters.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        def initialize(
          @document_version : String? = nil,
          @parameters : Hash(String, Array(String))? = nil
        )
        end
      end

      # Describes the information about an execution of a maintenance window.

      struct MaintenanceWindowExecution
        include JSON::Serializable

        # The time the execution finished.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The time the execution started.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the execution.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The details explaining the status. Not available for all status values.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : String?

        # The ID of the maintenance window execution.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String?

        # The ID of the maintenance window.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        def initialize(
          @end_time : Time? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_details : String? = nil,
          @window_execution_id : String? = nil,
          @window_id : String? = nil
        )
        end
      end

      # Information about a task execution performed as part of a maintenance window execution.

      struct MaintenanceWindowExecutionTaskIdentity
        include JSON::Serializable

        # The details for the CloudWatch alarm applied to your maintenance window task.

        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # The time the task execution finished.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The time the task execution started.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the task execution.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The details explaining the status of the task execution. Not available for all status values.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : String?

        # The Amazon Resource Name (ARN) of the task that ran.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The ID of the specific task execution in the maintenance window execution.

        @[JSON::Field(key: "TaskExecutionId")]
        getter task_execution_id : String?

        # The type of task that ran.

        @[JSON::Field(key: "TaskType")]
        getter task_type : String?

        # The CloudWatch alarm that was invoked by the maintenance window task.

        @[JSON::Field(key: "TriggeredAlarms")]
        getter triggered_alarms : Array(Types::AlarmStateInformation)?

        # The ID of the maintenance window execution that ran the task.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String?

        def initialize(
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @end_time : Time? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_details : String? = nil,
          @task_arn : String? = nil,
          @task_execution_id : String? = nil,
          @task_type : String? = nil,
          @triggered_alarms : Array(Types::AlarmStateInformation)? = nil,
          @window_execution_id : String? = nil
        )
        end
      end

      # Describes the information about a task invocation for a particular target as part of a task
      # execution performed as part of a maintenance window execution.

      struct MaintenanceWindowExecutionTaskInvocationIdentity
        include JSON::Serializable

        # The time the invocation finished.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The ID of the action performed in the service that actually handled the task invocation. If the task
        # type is RUN_COMMAND , this value is the command ID.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String?

        # The ID of the task invocation.

        @[JSON::Field(key: "InvocationId")]
        getter invocation_id : String?

        # User-provided value that was specified when the target was registered with the maintenance window.
        # This was also included in any Amazon CloudWatch Events events raised during the task invocation.

        @[JSON::Field(key: "OwnerInformation")]
        getter owner_information : String?

        # The parameters that were provided for the invocation when it was run.

        @[JSON::Field(key: "Parameters")]
        getter parameters : String?

        # The time the invocation started.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the task invocation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The details explaining the status of the task invocation. Not available for all status values.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : String?

        # The ID of the specific task execution in the maintenance window execution.

        @[JSON::Field(key: "TaskExecutionId")]
        getter task_execution_id : String?

        # The task type.

        @[JSON::Field(key: "TaskType")]
        getter task_type : String?

        # The ID of the maintenance window execution that ran the task.

        @[JSON::Field(key: "WindowExecutionId")]
        getter window_execution_id : String?

        # The ID of the target definition in this maintenance window the invocation was performed for.

        @[JSON::Field(key: "WindowTargetId")]
        getter window_target_id : String?

        def initialize(
          @end_time : Time? = nil,
          @execution_id : String? = nil,
          @invocation_id : String? = nil,
          @owner_information : String? = nil,
          @parameters : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_details : String? = nil,
          @task_execution_id : String? = nil,
          @task_type : String? = nil,
          @window_execution_id : String? = nil,
          @window_target_id : String? = nil
        )
        end
      end

      # Filter used in the request. Supported filter keys depend on the API operation that includes the
      # filter. API operations that use MaintenanceWindowFilter&gt; include the following:
      # DescribeMaintenanceWindowExecutions DescribeMaintenanceWindowExecutionTaskInvocations
      # DescribeMaintenanceWindowExecutionTasks DescribeMaintenanceWindows DescribeMaintenanceWindowTargets
      # DescribeMaintenanceWindowTasks

      struct MaintenanceWindowFilter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The filter values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Information about the maintenance window.

      struct MaintenanceWindowIdentity
        include JSON::Serializable

        # The number of hours before the end of the maintenance window that Amazon Web Services Systems
        # Manager stops scheduling new tasks for execution.

        @[JSON::Field(key: "Cutoff")]
        getter cutoff : Int32?

        # A description of the maintenance window.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The duration of the maintenance window in hours.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # Indicates whether the maintenance window is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to
        # become inactive.

        @[JSON::Field(key: "EndDate")]
        getter end_date : String?

        # The name of the maintenance window.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The next time the maintenance window will actually run, taking into account any specified times for
        # the maintenance window to become active or inactive.

        @[JSON::Field(key: "NextExecutionTime")]
        getter next_execution_time : String?

        # The schedule of the maintenance window in the form of a cron or rate expression.

        @[JSON::Field(key: "Schedule")]
        getter schedule : String?

        # The number of days to wait to run a maintenance window after the scheduled cron expression date and
        # time.

        @[JSON::Field(key: "ScheduleOffset")]
        getter schedule_offset : Int32?

        # The time zone that the scheduled maintenance window executions are based on, in Internet Assigned
        # Numbers Authority (IANA) format.

        @[JSON::Field(key: "ScheduleTimezone")]
        getter schedule_timezone : String?

        # The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to
        # become active.

        @[JSON::Field(key: "StartDate")]
        getter start_date : String?

        # The ID of the maintenance window.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        def initialize(
          @cutoff : Int32? = nil,
          @description : String? = nil,
          @duration : Int32? = nil,
          @enabled : Bool? = nil,
          @end_date : String? = nil,
          @name : String? = nil,
          @next_execution_time : String? = nil,
          @schedule : String? = nil,
          @schedule_offset : Int32? = nil,
          @schedule_timezone : String? = nil,
          @start_date : String? = nil,
          @window_id : String? = nil
        )
        end
      end

      # The maintenance window to which the specified target belongs.

      struct MaintenanceWindowIdentityForTarget
        include JSON::Serializable

        # The name of the maintenance window.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the maintenance window.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        def initialize(
          @name : String? = nil,
          @window_id : String? = nil
        )
        end
      end

      # The parameters for a LAMBDA task type. For information about specifying and updating task
      # parameters, see RegisterTaskWithMaintenanceWindow and UpdateMaintenanceWindowTask . LoggingInfo has
      # been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs,
      # instead use the OutputS3BucketName and OutputS3KeyPrefix options in the TaskInvocationParameters
      # structure. For information about how Amazon Web Services Systems Manager handles these options for
      # the supported maintenance window task types, see MaintenanceWindowTaskInvocationParameters .
      # TaskParameters has been deprecated. To specify parameters to pass to a task when it runs, instead
      # use the Parameters option in the TaskInvocationParameters structure. For information about how
      # Systems Manager handles these options for the supported maintenance window task types, see
      # MaintenanceWindowTaskInvocationParameters . For Lambda tasks, Systems Manager ignores any values
      # specified for TaskParameters and LoggingInfo.

      struct MaintenanceWindowLambdaParameters
        include JSON::Serializable

        # Pass client-specific information to the Lambda function that you are invoking. You can then process
        # the client information in your Lambda function as you choose through the context variable.

        @[JSON::Field(key: "ClientContext")]
        getter client_context : String?

        # JSON to provide to your Lambda function as input.

        @[JSON::Field(key: "Payload")]
        getter payload : Bytes?

        # (Optional) Specify an Lambda function version or alias name. If you specify a function version, the
        # operation uses the qualified function Amazon Resource Name (ARN) to invoke a specific Lambda
        # function. If you specify an alias name, the operation uses the alias ARN to invoke the Lambda
        # function version to which the alias points.

        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @client_context : String? = nil,
          @payload : Bytes? = nil,
          @qualifier : String? = nil
        )
        end
      end

      # The parameters for a RUN_COMMAND task type. For information about specifying and updating task
      # parameters, see RegisterTaskWithMaintenanceWindow and UpdateMaintenanceWindowTask . LoggingInfo has
      # been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs,
      # instead use the OutputS3BucketName and OutputS3KeyPrefix options in the TaskInvocationParameters
      # structure. For information about how Amazon Web Services Systems Manager handles these options for
      # the supported maintenance window task types, see MaintenanceWindowTaskInvocationParameters .
      # TaskParameters has been deprecated. To specify parameters to pass to a task when it runs, instead
      # use the Parameters option in the TaskInvocationParameters structure. For information about how
      # Systems Manager handles these options for the supported maintenance window task types, see
      # MaintenanceWindowTaskInvocationParameters . For RUN_COMMAND tasks, Systems Manager uses specified
      # values for TaskParameters and LoggingInfo only if no values are specified for
      # TaskInvocationParameters .

      struct MaintenanceWindowRunCommandParameters
        include JSON::Serializable


        @[JSON::Field(key: "CloudWatchOutputConfig")]
        getter cloud_watch_output_config : Types::CloudWatchOutputConfig?

        # Information about the commands to run.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The SHA-256 or SHA-1 hash created by the system when the document was created. SHA-1 hashes have
        # been deprecated.

        @[JSON::Field(key: "DocumentHash")]
        getter document_hash : String?

        # SHA-256 or SHA-1. SHA-1 hashes have been deprecated.

        @[JSON::Field(key: "DocumentHashType")]
        getter document_hash_type : String?

        # The Amazon Web Services Systems Manager document (SSM document) version to use in the request. You
        # can specify $DEFAULT , $LATEST , or a specific version number. If you run commands by using the
        # Amazon Web Services CLI, then you must escape the first two options by using a backslash. If you
        # specify a version number, then you don't need to use the backslash. For example: --document-version
        # "\$DEFAULT" --document-version "\$LATEST" --document-version "3"

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # Configurations for sending notifications about command status changes on a per-managed node basis.

        @[JSON::Field(key: "NotificationConfig")]
        getter notification_config : Types::NotificationConfig?

        # The name of the Amazon Simple Storage Service (Amazon S3) bucket.

        @[JSON::Field(key: "OutputS3BucketName")]
        getter output_s3_bucket_name : String?

        # The S3 bucket subfolder.

        @[JSON::Field(key: "OutputS3KeyPrefix")]
        getter output_s3_key_prefix : String?

        # The parameters for the RUN_COMMAND task execution.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to
        # assume when running a maintenance window task. If you do not specify a service role ARN, Systems
        # Manager uses a service-linked role in your account. If no appropriate service-linked role for
        # Systems Manager exists in your account, it is created when you run RegisterTaskWithMaintenanceWindow
        # . However, for an improved security posture, we strongly recommend creating a custom policy and
        # custom service role for running your maintenance window tasks. The policy can be crafted to provide
        # only the permissions needed for your particular maintenance window tasks. For more information, see
        # Setting up Maintenance Windows in the in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "ServiceRoleArn")]
        getter service_role_arn : String?

        # If this time is reached and the command hasn't already started running, it doesn't run.

        @[JSON::Field(key: "TimeoutSeconds")]
        getter timeout_seconds : Int32?

        def initialize(
          @cloud_watch_output_config : Types::CloudWatchOutputConfig? = nil,
          @comment : String? = nil,
          @document_hash : String? = nil,
          @document_hash_type : String? = nil,
          @document_version : String? = nil,
          @notification_config : Types::NotificationConfig? = nil,
          @output_s3_bucket_name : String? = nil,
          @output_s3_key_prefix : String? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @service_role_arn : String? = nil,
          @timeout_seconds : Int32? = nil
        )
        end
      end

      # The parameters for a STEP_FUNCTIONS task. For information about specifying and updating task
      # parameters, see RegisterTaskWithMaintenanceWindow and UpdateMaintenanceWindowTask . LoggingInfo has
      # been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs,
      # instead use the OutputS3BucketName and OutputS3KeyPrefix options in the TaskInvocationParameters
      # structure. For information about how Amazon Web Services Systems Manager handles these options for
      # the supported maintenance window task types, see MaintenanceWindowTaskInvocationParameters .
      # TaskParameters has been deprecated. To specify parameters to pass to a task when it runs, instead
      # use the Parameters option in the TaskInvocationParameters structure. For information about how
      # Systems Manager handles these options for the supported maintenance window task types, see
      # MaintenanceWindowTaskInvocationParameters . For Step Functions tasks, Systems Manager ignores any
      # values specified for TaskParameters and LoggingInfo .

      struct MaintenanceWindowStepFunctionsParameters
        include JSON::Serializable

        # The inputs for the STEP_FUNCTIONS task.

        @[JSON::Field(key: "Input")]
        getter input : String?

        # The name of the STEP_FUNCTIONS task.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @input : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The target registered with the maintenance window.

      struct MaintenanceWindowTarget
        include JSON::Serializable

        # A description for the target.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name for the maintenance window target.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A user-provided value that will be included in any Amazon CloudWatch Events events that are raised
        # while running tasks for these targets in this maintenance window.

        @[JSON::Field(key: "OwnerInformation")]
        getter owner_information : String?

        # The type of target that is being registered with the maintenance window.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The targets, either managed nodes or tags. Specify managed nodes using the following format:
        # Key=instanceids,Values=&lt;instanceid1&gt;,&lt;instanceid2&gt; Tags are specified using the
        # following format: Key=&lt;tag name&gt;,Values=&lt;tag value&gt; .

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The ID of the maintenance window to register the target with.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        # The ID of the target.

        @[JSON::Field(key: "WindowTargetId")]
        getter window_target_id : String?

        def initialize(
          @description : String? = nil,
          @name : String? = nil,
          @owner_information : String? = nil,
          @resource_type : String? = nil,
          @targets : Array(Types::Target)? = nil,
          @window_id : String? = nil,
          @window_target_id : String? = nil
        )
        end
      end

      # Information about a task defined for a maintenance window.

      struct MaintenanceWindowTask
        include JSON::Serializable

        # The details for the CloudWatch alarm applied to your maintenance window task.

        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # The specification for whether tasks should continue to run after the cutoff time specified in the
        # maintenance windows is reached.

        @[JSON::Field(key: "CutoffBehavior")]
        getter cutoff_behavior : String?

        # A description of the task.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information about an S3 bucket to write task-level logs to. LoggingInfo has been deprecated. To
        # specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the
        # OutputS3BucketName and OutputS3KeyPrefix options in the TaskInvocationParameters structure. For
        # information about how Amazon Web Services Systems Manager handles these options for the supported
        # maintenance window task types, see MaintenanceWindowTaskInvocationParameters .

        @[JSON::Field(key: "LoggingInfo")]
        getter logging_info : Types::LoggingInfo?

        # The maximum number of targets this task can be run for, in parallel. Although this element is listed
        # as "Required: No", a value can be omitted only when you are registering or updating a targetless
        # task You must provide a value in all other cases. For maintenance window tasks without a target
        # specified, you can't supply a value for this option. Instead, the system inserts a placeholder value
        # of 1 . This value doesn't affect the running of your task.

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The maximum number of errors allowed before this task stops being scheduled. Although this element
        # is listed as "Required: No", a value can be omitted only when you are registering or updating a
        # targetless task You must provide a value in all other cases. For maintenance window tasks without a
        # target specified, you can't supply a value for this option. Instead, the system inserts a
        # placeholder value of 1 . This value doesn't affect the running of your task.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # The task name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The priority of the task in the maintenance window. The lower the number, the higher the priority.
        # Tasks that have the same priority are scheduled in parallel.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to
        # assume when running a maintenance window task. If you do not specify a service role ARN, Systems
        # Manager uses a service-linked role in your account. If no appropriate service-linked role for
        # Systems Manager exists in your account, it is created when you run RegisterTaskWithMaintenanceWindow
        # . However, for an improved security posture, we strongly recommend creating a custom policy and
        # custom service role for running your maintenance window tasks. The policy can be crafted to provide
        # only the permissions needed for your particular maintenance window tasks. For more information, see
        # Setting up Maintenance Windows in the in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "ServiceRoleArn")]
        getter service_role_arn : String?

        # The targets (either managed nodes or tags). Managed nodes are specified using
        # Key=instanceids,Values=&lt;instanceid1&gt;,&lt;instanceid2&gt; . Tags are specified using
        # Key=&lt;tag name&gt;,Values=&lt;tag value&gt; .

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The resource that the task uses during execution. For RUN_COMMAND and AUTOMATION task types, TaskArn
        # is the Amazon Web Services Systems Manager (SSM document) name or ARN. For LAMBDA tasks, it's the
        # function name or ARN. For STEP_FUNCTIONS tasks, it's the state machine ARN.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The parameters that should be passed to the task when it is run. TaskParameters has been deprecated.
        # To specify parameters to pass to a task when it runs, instead use the Parameters option in the
        # TaskInvocationParameters structure. For information about how Systems Manager handles these options
        # for the supported maintenance window task types, see MaintenanceWindowTaskInvocationParameters .

        @[JSON::Field(key: "TaskParameters")]
        getter task_parameters : Hash(String, Types::MaintenanceWindowTaskParameterValueExpression)?

        # The type of task.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The ID of the maintenance window where the task is registered.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        # The task ID.

        @[JSON::Field(key: "WindowTaskId")]
        getter window_task_id : String?

        def initialize(
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @cutoff_behavior : String? = nil,
          @description : String? = nil,
          @logging_info : Types::LoggingInfo? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @service_role_arn : String? = nil,
          @targets : Array(Types::Target)? = nil,
          @task_arn : String? = nil,
          @task_parameters : Hash(String, Types::MaintenanceWindowTaskParameterValueExpression)? = nil,
          @type : String? = nil,
          @window_id : String? = nil,
          @window_task_id : String? = nil
        )
        end
      end

      # The parameters for task execution.

      struct MaintenanceWindowTaskInvocationParameters
        include JSON::Serializable

        # The parameters for an AUTOMATION task type.

        @[JSON::Field(key: "Automation")]
        getter automation : Types::MaintenanceWindowAutomationParameters?

        # The parameters for a LAMBDA task type.

        @[JSON::Field(key: "Lambda")]
        getter lambda : Types::MaintenanceWindowLambdaParameters?

        # The parameters for a RUN_COMMAND task type.

        @[JSON::Field(key: "RunCommand")]
        getter run_command : Types::MaintenanceWindowRunCommandParameters?

        # The parameters for a STEP_FUNCTIONS task type.

        @[JSON::Field(key: "StepFunctions")]
        getter step_functions : Types::MaintenanceWindowStepFunctionsParameters?

        def initialize(
          @automation : Types::MaintenanceWindowAutomationParameters? = nil,
          @lambda : Types::MaintenanceWindowLambdaParameters? = nil,
          @run_command : Types::MaintenanceWindowRunCommandParameters? = nil,
          @step_functions : Types::MaintenanceWindowStepFunctionsParameters? = nil
        )
        end
      end

      # Defines the values for a task parameter.

      struct MaintenanceWindowTaskParameterValueExpression
        include JSON::Serializable

        # This field contains an array of 0 or more strings, each 1 to 255 characters in length.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @values : Array(String)? = nil
        )
        end
      end

      # The specified policy document is malformed or invalid, or excessive PutResourcePolicy or
      # DeleteResourcePolicy calls have been made.

      struct MalformedResourcePolicyDocumentException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The size limit of a document is 64 KB.

      struct MaxDocumentSizeExceeded
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Metadata to assign to an Application Manager application.

      struct MetadataValue
        include JSON::Serializable

        # Metadata value to assign to an Application Manager application.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @value : String? = nil
        )
        end
      end


      struct ModifyDocumentPermissionRequest
        include JSON::Serializable

        # The name of the document that you want to share.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The permission type for the document. The permission type can be Share .

        @[JSON::Field(key: "PermissionType")]
        getter permission_type : String

        # The Amazon Web Services users that should have access to the document. The account IDs can either be
        # a group of account IDs or All . You must specify a value for this parameter or the
        # AccountIdsToRemove parameter.

        @[JSON::Field(key: "AccountIdsToAdd")]
        getter account_ids_to_add : Array(String)?

        # The Amazon Web Services users that should no longer have access to the document. The Amazon Web
        # Services user can either be a group of account IDs or All . This action has a higher priority than
        # AccountIdsToAdd . If you specify an ID to add and the same ID to remove, the system removes access
        # to the document. You must specify a value for this parameter or the AccountIdsToAdd parameter.

        @[JSON::Field(key: "AccountIdsToRemove")]
        getter account_ids_to_remove : Array(String)?

        # (Optional) The version of the document to share. If it isn't specified, the system choose the
        # Default version to share.

        @[JSON::Field(key: "SharedDocumentVersion")]
        getter shared_document_version : String?

        def initialize(
          @name : String,
          @permission_type : String,
          @account_ids_to_add : Array(String)? = nil,
          @account_ids_to_remove : Array(String)? = nil,
          @shared_document_version : String? = nil
        )
        end
      end


      struct ModifyDocumentPermissionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The requested operation is no longer supported by Systems Manager.

      struct NoLongerSupportedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details about an individual managed node.

      struct Node
        include JSON::Serializable

        # The UTC timestamp for when the managed node data was last captured.

        @[JSON::Field(key: "CaptureTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter capture_time : Time?

        # The ID of the managed node.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Information about the type of node.

        @[JSON::Field(key: "NodeType")]
        getter node_type : Types::NodeType?

        # Information about the ownership of the managed node.

        @[JSON::Field(key: "Owner")]
        getter owner : Types::NodeOwnerInfo?

        # The Amazon Web Services Region that a managed node was created in or assigned to.

        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @capture_time : Time? = nil,
          @id : String? = nil,
          @node_type : Types::NodeType? = nil,
          @owner : Types::NodeOwnerInfo? = nil,
          @region : String? = nil
        )
        end
      end

      # One or more aggregators for viewing counts of nodes using different dimensions.

      struct NodeAggregator
        include JSON::Serializable

        # The aggregator type for limiting a node summary. Currently, only Count is supported.

        @[JSON::Field(key: "AggregatorType")]
        getter aggregator_type : String

        # The name of a node attribute on which to limit the count of nodes.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The data type name to use for viewing counts of nodes. Currently, only Instance is supported.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        # Information about aggregators used to refine a node summary.

        @[JSON::Field(key: "Aggregators")]
        getter aggregators : Array(Types::NodeAggregator)?

        def initialize(
          @aggregator_type : String,
          @attribute_name : String,
          @type_name : String,
          @aggregators : Array(Types::NodeAggregator)? = nil
        )
        end
      end

      # The filters for the operation.

      struct NodeFilter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "Key")]
        getter key : String

        # A filter value supported by the specified key. For example, for the key PlatformType , supported
        # values include Linux and Windows .

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        # The type of filter operator.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @key : String,
          @values : Array(String),
          @type : String? = nil
        )
        end
      end

      # Information about ownership of a managed node.

      struct NodeOwnerInfo
        include JSON::Serializable

        # The ID of the Amazon Web Services account that owns the managed node.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The ID of the organization unit (OU) that the account is part of.

        @[JSON::Field(key: "OrganizationalUnitId")]
        getter organizational_unit_id : String?

        # The path for the organizational unit (OU) that owns the managed node. The path for the OU is built
        # using the IDs of the organization, root, and all OUs in the path down to and including the OU. For
        # example: o-a1b2c3d4e5/r-f6g7h8i9j0example/ou-ghi0-awsccccc/ou-jkl0-awsddddd/

        @[JSON::Field(key: "OrganizationalUnitPath")]
        getter organizational_unit_path : String?

        def initialize(
          @account_id : String? = nil,
          @organizational_unit_id : String? = nil,
          @organizational_unit_path : String? = nil
        )
        end
      end

      # Information about a managed node's type.

      struct NodeType
        include JSON::Serializable

        # Information about a specific managed node.

        @[JSON::Field(key: "Instance")]
        getter instance : Types::InstanceInfo?

        def initialize(
          @instance : Types::InstanceInfo? = nil
        )
        end
      end

      # A summary of resources that aren't compliant. The summary is organized according to resource type.

      struct NonCompliantSummary
        include JSON::Serializable

        # The total number of compliance items that aren't compliant.

        @[JSON::Field(key: "NonCompliantCount")]
        getter non_compliant_count : Int32?

        # A summary of the non-compliance severity by compliance type

        @[JSON::Field(key: "SeveritySummary")]
        getter severity_summary : Types::SeveritySummary?

        def initialize(
          @non_compliant_count : Int32? = nil,
          @severity_summary : Types::SeveritySummary? = nil
        )
        end
      end

      # Configurations for sending notifications.

      struct NotificationConfig
        include JSON::Serializable

        # An Amazon Resource Name (ARN) for an Amazon Simple Notification Service (Amazon SNS) topic. Run
        # Command pushes notifications about command status changes to this topic.

        @[JSON::Field(key: "NotificationArn")]
        getter notification_arn : String?

        # The different events for which you can receive notifications. To learn more about these events, see
        # Monitoring Systems Manager status changes using Amazon SNS notifications in the Amazon Web Services
        # Systems Manager User Guide .

        @[JSON::Field(key: "NotificationEvents")]
        getter notification_events : Array(String)?

        # The type of notification. Command : Receive notification when the status of a command changes.
        # Invocation : For commands sent to multiple managed nodes, receive notification on a per-node basis
        # when the status of a command changes.

        @[JSON::Field(key: "NotificationType")]
        getter notification_type : String?

        def initialize(
          @notification_arn : String? = nil,
          @notification_events : Array(String)? = nil,
          @notification_type : String? = nil
        )
        end
      end

      # One or more aggregators for viewing counts of OpsData using different dimensions such as Source ,
      # CreatedTime , or Source and CreatedTime , to name a few.

      struct OpsAggregator
        include JSON::Serializable

        # Either a Range or Count aggregator for limiting an OpsData summary.

        @[JSON::Field(key: "AggregatorType")]
        getter aggregator_type : String?

        # A nested aggregator for viewing counts of OpsData.

        @[JSON::Field(key: "Aggregators")]
        getter aggregators : Array(Types::OpsAggregator)?

        # The name of an OpsData attribute on which to limit the count of OpsData.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # The aggregator filters.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::OpsFilter)?

        # The data type name to use for viewing counts of OpsData.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # The aggregator value.

        @[JSON::Field(key: "Values")]
        getter values : Hash(String, String)?

        def initialize(
          @aggregator_type : String? = nil,
          @aggregators : Array(Types::OpsAggregator)? = nil,
          @attribute_name : String? = nil,
          @filters : Array(Types::OpsFilter)? = nil,
          @type_name : String? = nil,
          @values : Hash(String, String)? = nil
        )
        end
      end

      # The result of the query.

      struct OpsEntity
        include JSON::Serializable

        # The data returned by the query.

        @[JSON::Field(key: "Data")]
        getter data : Hash(String, Types::OpsEntityItem)?

        # The query ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @data : Hash(String, Types::OpsEntityItem)? = nil,
          @id : String? = nil
        )
        end
      end

      # The OpsData summary.

      struct OpsEntityItem
        include JSON::Serializable

        # The time the OpsData was captured.

        @[JSON::Field(key: "CaptureTime")]
        getter capture_time : String?

        # The details of an OpsData summary.

        @[JSON::Field(key: "Content")]
        getter content : Array(Hash(String, String))?

        def initialize(
          @capture_time : String? = nil,
          @content : Array(Hash(String, String))? = nil
        )
        end
      end

      # A filter for viewing OpsData summaries.

      struct OpsFilter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The filter value.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        # The type of filter.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @key : String,
          @values : Array(String),
          @type : String? = nil
        )
        end
      end

      # Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view,
      # investigate, and remediate operational work items (OpsItems) impacting the performance and health of
      # their Amazon Web Services resources. OpsCenter is integrated with Amazon EventBridge and Amazon
      # CloudWatch. This means you can configure these services to automatically create an OpsItem in
      # OpsCenter when a CloudWatch alarm enters the ALARM state or when EventBridge processes an event from
      # any Amazon Web Services service that publishes events. Configuring Amazon CloudWatch alarms and
      # EventBridge events to automatically create OpsItems allows you to quickly diagnose and remediate
      # issues with Amazon Web Services resources from a single console. To help you diagnose issues, each
      # OpsItem includes contextually relevant information such as the name and ID of the Amazon Web
      # Services resource that generated the OpsItem, alarm or event details, alarm history, and an alarm
      # timeline graph. For the Amazon Web Services resource, OpsCenter aggregates information from Config,
      # CloudTrail logs, and EventBridge, so you don't have to navigate across multiple console pages during
      # your investigation. For more information, see Amazon Web Services Systems Manager OpsCenter in the
      # Amazon Web Services Systems Manager User Guide .

      struct OpsItem
        include JSON::Serializable

        # The time a runbook workflow ended. Currently reported only for the OpsItem type /aws/changerequest .

        @[JSON::Field(key: "ActualEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter actual_end_time : Time?

        # The time a runbook workflow started. Currently reported only for the OpsItem type /aws/changerequest
        # .

        @[JSON::Field(key: "ActualStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter actual_start_time : Time?

        # An OpsItem category. Category options include: Availability, Cost, Performance, Recovery, Security.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The ARN of the Amazon Web Services account that created the OpsItem.

        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The date and time the OpsItem was created.

        @[JSON::Field(key: "CreatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The OpsItem description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN of the Amazon Web Services account that last updated the OpsItem.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time the OpsItem was last updated.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The Amazon Resource Name (ARN) of an Amazon Simple Notification Service (Amazon SNS) topic where
        # notifications are sent when this OpsItem is edited or changed.

        @[JSON::Field(key: "Notifications")]
        getter notifications : Array(Types::OpsItemNotification)?

        # Operational data is custom data that provides useful reference details about the OpsItem. For
        # example, you can specify log files, error strings, license keys, troubleshooting tips, or other
        # relevant data. You enter operational data as key-value pairs. The key has a maximum length of 128
        # characters. The value has a maximum size of 20 KB. Operational data keys can't begin with the
        # following: amazon , aws , amzn , ssm , /amazon , /aws , /amzn , /ssm . You can choose to make the
        # data searchable by other users in the account or you can restrict search access. Searchable data
        # means that all users with access to the OpsItem Overview page (as provided by the DescribeOpsItems
        # API operation) can view and search on the specified data. Operational data that isn't searchable is
        # only viewable by users who have access to the OpsItem (as provided by the GetOpsItem API operation).
        # Use the /aws/resources key in OperationalData to specify a related resource in the request. Use the
        # /aws/automations key in OperationalData to associate an Automation runbook with the OpsItem. To view
        # Amazon Web Services CLI example commands that use these keys, see Creating OpsItems manually in the
        # Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "OperationalData")]
        getter operational_data : Hash(String, Types::OpsItemDataValue)?

        # The OpsItem Amazon Resource Name (ARN).

        @[JSON::Field(key: "OpsItemArn")]
        getter ops_item_arn : String?

        # The ID of the OpsItem.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String?

        # The type of OpsItem. Systems Manager supports the following types of OpsItems: /aws/issue This type
        # of OpsItem is used for default OpsItems created by OpsCenter. /aws/changerequest This type of
        # OpsItem is used by Change Manager for reviewing and approving or rejecting change requests.
        # /aws/insight This type of OpsItem is used by OpsCenter for aggregating and reporting on duplicate
        # OpsItems.

        @[JSON::Field(key: "OpsItemType")]
        getter ops_item_type : String?

        # The time specified in a change request for a runbook workflow to end. Currently supported only for
        # the OpsItem type /aws/changerequest .

        @[JSON::Field(key: "PlannedEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter planned_end_time : Time?

        # The time specified in a change request for a runbook workflow to start. Currently supported only for
        # the OpsItem type /aws/changerequest .

        @[JSON::Field(key: "PlannedStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter planned_start_time : Time?

        # The importance of this OpsItem in relation to other OpsItems in the system.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # One or more OpsItems that share something in common with the current OpsItem. For example, related
        # OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the
        # impacted resource.

        @[JSON::Field(key: "RelatedOpsItems")]
        getter related_ops_items : Array(Types::RelatedOpsItem)?

        # The severity of the OpsItem. Severity options range from 1 to 4.

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The origin of the OpsItem, such as Amazon EC2 or Systems Manager. The impacted resource is a subset
        # of source.

        @[JSON::Field(key: "Source")]
        getter source : String?

        # The OpsItem status. For more information, see Editing OpsItem details in the Amazon Web Services
        # Systems Manager User Guide .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short heading that describes the nature of the OpsItem and the impacted resource.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # The version of this OpsItem. Each time the OpsItem is edited the version number increments by one.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @actual_end_time : Time? = nil,
          @actual_start_time : Time? = nil,
          @category : String? = nil,
          @created_by : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @last_modified_by : String? = nil,
          @last_modified_time : Time? = nil,
          @notifications : Array(Types::OpsItemNotification)? = nil,
          @operational_data : Hash(String, Types::OpsItemDataValue)? = nil,
          @ops_item_arn : String? = nil,
          @ops_item_id : String? = nil,
          @ops_item_type : String? = nil,
          @planned_end_time : Time? = nil,
          @planned_start_time : Time? = nil,
          @priority : Int32? = nil,
          @related_ops_items : Array(Types::RelatedOpsItem)? = nil,
          @severity : String? = nil,
          @source : String? = nil,
          @status : String? = nil,
          @title : String? = nil,
          @version : String? = nil
        )
        end
      end

      # You don't have permission to view OpsItems in the specified account. Verify that your account is
      # configured either as a Systems Manager delegated administrator or that you are logged into the
      # Organizations management account.

      struct OpsItemAccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The OpsItem already exists.

      struct OpsItemAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String?

        def initialize(
          @message : String? = nil,
          @ops_item_id : String? = nil
        )
        end
      end

      # The specified OpsItem is in the process of being deleted.

      struct OpsItemConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that defines the value of the key and its type in the OperationalData map.

      struct OpsItemDataValue
        include JSON::Serializable

        # The type of key-value pair. Valid types include SearchableString and String .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The value of the OperationalData key.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Describes a filter for a specific list of OpsItem events. You can filter event information by using
      # tags. You specify tags by using a key-value pair mapping.

      struct OpsItemEventFilter
        include JSON::Serializable

        # The name of the filter key. Currently, the only supported value is OpsItemId .

        @[JSON::Field(key: "Key")]
        getter key : String

        # The operator used by the filter call. Currently, the only supported value is Equal .

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The values for the filter, consisting of one or more OpsItem IDs.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Summary information about an OpsItem event or that associated an OpsItem with a related item.

      struct OpsItemEventSummary
        include JSON::Serializable

        # Information about the user or resource that created the OpsItem event.

        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::OpsItemIdentity?

        # The date and time the OpsItem event was created.

        @[JSON::Field(key: "CreatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # Specific information about the OpsItem event.

        @[JSON::Field(key: "Detail")]
        getter detail : String?

        # The type of information provided as a detail.

        @[JSON::Field(key: "DetailType")]
        getter detail_type : String?

        # The ID of the OpsItem event.

        @[JSON::Field(key: "EventId")]
        getter event_id : String?

        # The ID of the OpsItem.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String?

        # The source of the OpsItem event.

        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @created_by : Types::OpsItemIdentity? = nil,
          @created_time : Time? = nil,
          @detail : String? = nil,
          @detail_type : String? = nil,
          @event_id : String? = nil,
          @ops_item_id : String? = nil,
          @source : String? = nil
        )
        end
      end

      # Describes an OpsItem filter.

      struct OpsItemFilter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The operator used by the filter call.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The filter value.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Information about the user or resource that created an OpsItem event.

      struct OpsItemIdentity
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem event.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # A specified parameter argument isn't valid. Verify the available arguments and try again.

      struct OpsItemInvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "ParameterNames")]
        getter parameter_names : Array(String)?

        def initialize(
          @message : String? = nil,
          @parameter_names : Array(String)? = nil
        )
        end
      end

      # The request caused OpsItems to exceed one or more quotas.

      struct OpsItemLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Limit")]
        getter limit : Int32?


        @[JSON::Field(key: "LimitType")]
        getter limit_type : String?


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        def initialize(
          @limit : Int32? = nil,
          @limit_type : String? = nil,
          @message : String? = nil,
          @resource_types : Array(String)? = nil
        )
        end
      end

      # The specified OpsItem ID doesn't exist. Verify the ID and try again.

      struct OpsItemNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A notification about the OpsItem.

      struct OpsItemNotification
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Amazon Simple Notification Service (Amazon SNS) topic where
        # notifications are sent when this OpsItem is edited or changed.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # The Amazon Resource Name (ARN) is already associated with the OpsItem.

      struct OpsItemRelatedItemAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String?


        @[JSON::Field(key: "ResourceUri")]
        getter resource_uri : String?

        def initialize(
          @message : String? = nil,
          @ops_item_id : String? = nil,
          @resource_uri : String? = nil
        )
        end
      end

      # The association wasn't found using the parameters you specified in the call. Verify the information
      # and try again.

      struct OpsItemRelatedItemAssociationNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Summary information about related-item resources for an OpsItem.

      struct OpsItemRelatedItemSummary
        include JSON::Serializable

        # The association ID.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # The association type.

        @[JSON::Field(key: "AssociationType")]
        getter association_type : String?


        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::OpsItemIdentity?

        # The time the related-item association was created.

        @[JSON::Field(key: "CreatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_time : Time?


        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : Types::OpsItemIdentity?

        # The time the related-item association was last updated.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The OpsItem ID.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String?

        # The resource type.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The Amazon Resource Name (ARN) of the related-item resource.

        @[JSON::Field(key: "ResourceUri")]
        getter resource_uri : String?

        def initialize(
          @association_id : String? = nil,
          @association_type : String? = nil,
          @created_by : Types::OpsItemIdentity? = nil,
          @created_time : Time? = nil,
          @last_modified_by : Types::OpsItemIdentity? = nil,
          @last_modified_time : Time? = nil,
          @ops_item_id : String? = nil,
          @resource_type : String? = nil,
          @resource_uri : String? = nil
        )
        end
      end

      # Describes a filter for a specific list of related-item resources.

      struct OpsItemRelatedItemsFilter
        include JSON::Serializable

        # The name of the filter key. Supported values include ResourceUri , ResourceType , or AssociationId .

        @[JSON::Field(key: "Key")]
        getter key : String

        # The operator used by the filter call. The only supported operator is EQUAL .

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The values for the filter.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # A count of OpsItems.

      struct OpsItemSummary
        include JSON::Serializable

        # The time a runbook workflow ended. Currently reported only for the OpsItem type /aws/changerequest .

        @[JSON::Field(key: "ActualEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter actual_end_time : Time?

        # The time a runbook workflow started. Currently reported only for the OpsItem type /aws/changerequest
        # .

        @[JSON::Field(key: "ActualStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter actual_start_time : Time?

        # A list of OpsItems by category.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.

        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The date and time the OpsItem was created.

        @[JSON::Field(key: "CreatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time the OpsItem was last updated.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # Operational data is custom data that provides useful reference details about the OpsItem.

        @[JSON::Field(key: "OperationalData")]
        getter operational_data : Hash(String, Types::OpsItemDataValue)?

        # The ID of the OpsItem.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String?

        # The type of OpsItem. Systems Manager supports the following types of OpsItems: /aws/issue This type
        # of OpsItem is used for default OpsItems created by OpsCenter. /aws/changerequest This type of
        # OpsItem is used by Change Manager for reviewing and approving or rejecting change requests.
        # /aws/insight This type of OpsItem is used by OpsCenter for aggregating and reporting on duplicate
        # OpsItems.

        @[JSON::Field(key: "OpsItemType")]
        getter ops_item_type : String?

        # The time specified in a change request for a runbook workflow to end. Currently supported only for
        # the OpsItem type /aws/changerequest .

        @[JSON::Field(key: "PlannedEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter planned_end_time : Time?

        # The time specified in a change request for a runbook workflow to start. Currently supported only for
        # the OpsItem type /aws/changerequest .

        @[JSON::Field(key: "PlannedStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter planned_start_time : Time?

        # The importance of this OpsItem in relation to other OpsItems in the system.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # A list of OpsItems by severity.

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The impacted Amazon Web Services resource.

        @[JSON::Field(key: "Source")]
        getter source : String?

        # The OpsItem status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short heading that describes the nature of the OpsItem and the impacted resource.

        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @actual_end_time : Time? = nil,
          @actual_start_time : Time? = nil,
          @category : String? = nil,
          @created_by : String? = nil,
          @created_time : Time? = nil,
          @last_modified_by : String? = nil,
          @last_modified_time : Time? = nil,
          @operational_data : Hash(String, Types::OpsItemDataValue)? = nil,
          @ops_item_id : String? = nil,
          @ops_item_type : String? = nil,
          @planned_end_time : Time? = nil,
          @planned_start_time : Time? = nil,
          @priority : Int32? = nil,
          @severity : String? = nil,
          @source : String? = nil,
          @status : String? = nil,
          @title : String? = nil
        )
        end
      end

      # Operational metadata for an application in Application Manager.

      struct OpsMetadata
        include JSON::Serializable

        # The date the OpsMetadata objects was created.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The date the OpsMetadata object was last updated.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # The user name who last updated the OpsMetadata object.

        @[JSON::Field(key: "LastModifiedUser")]
        getter last_modified_user : String?

        # The Amazon Resource Name (ARN) of the OpsMetadata Object or blob.

        @[JSON::Field(key: "OpsMetadataArn")]
        getter ops_metadata_arn : String?

        # The ID of the Application Manager application.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @creation_date : Time? = nil,
          @last_modified_date : Time? = nil,
          @last_modified_user : String? = nil,
          @ops_metadata_arn : String? = nil,
          @resource_id : String? = nil
        )
        end
      end

      # An OpsMetadata object already exists for the selected resource.

      struct OpsMetadataAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A filter to limit the number of OpsMetadata objects displayed.

      struct OpsMetadataFilter
        include JSON::Serializable

        # A filter key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # A filter value.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @values : Array(String)
        )
        end
      end

      # One of the arguments passed is invalid.

      struct OpsMetadataInvalidArgumentException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The OpsMetadata object exceeds the maximum number of OpsMetadata keys that you can assign to an
      # application in Application Manager.

      struct OpsMetadataKeyLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your account reached the maximum number of OpsMetadata objects allowed by Application Manager. The
      # maximum is 200 OpsMetadata objects. Delete one or more OpsMetadata object and try again.

      struct OpsMetadataLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The OpsMetadata object doesn't exist.

      struct OpsMetadataNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The system is processing too many concurrent updates. Wait a few moments and try again.

      struct OpsMetadataTooManyUpdatesException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The OpsItem data type to return.

      struct OpsResultAttribute
        include JSON::Serializable

        # Name of the data type. Valid value: AWS:OpsItem , AWS:EC2InstanceInformation , AWS:OpsItemTrendline
        # , or AWS:ComplianceSummary .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        def initialize(
          @type_name : String
        )
        end
      end

      # Information about the source where the association execution details are stored.

      struct OutputSource
        include JSON::Serializable

        # The ID of the output source, for example the URL of an S3 bucket.

        @[JSON::Field(key: "OutputSourceId")]
        getter output_source_id : String?

        # The type of source where the association execution details are stored, for example, Amazon S3.

        @[JSON::Field(key: "OutputSourceType")]
        getter output_source_type : String?

        def initialize(
          @output_source_id : String? = nil,
          @output_source_type : String? = nil
        )
        end
      end

      # An Amazon Web Services Systems Manager parameter in Parameter Store.

      struct Parameter
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the parameter.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The data type of the parameter, such as text or aws:ec2:image . The default is text .

        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # Date the parameter was last changed or updated and the parameter version was created.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # The name of the parameter.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Either the version number or the label used to retrieve the parameter value. Specify selectors by
        # using one of the following formats: parameter_name:version parameter_name:label

        @[JSON::Field(key: "Selector")]
        getter selector : String?

        # Applies to parameters that reference information in other Amazon Web Services services. SourceResult
        # is the raw result or response from the source.

        @[JSON::Field(key: "SourceResult")]
        getter source_result : String?

        # The type of parameter. Valid values include the following: String , StringList , and SecureString .
        # If type is StringList , the system returns a comma-separated string with no spaces between commas in
        # the Value field.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The parameter value. If type is StringList , the system returns a comma-separated string with no
        # spaces between commas in the Value field.

        @[JSON::Field(key: "Value")]
        getter value : String?

        # The parameter version.

        @[JSON::Field(key: "Version")]
        getter version : Int64?

        def initialize(
          @arn : String? = nil,
          @data_type : String? = nil,
          @last_modified_date : Time? = nil,
          @name : String? = nil,
          @selector : String? = nil,
          @source_result : String? = nil,
          @type : String? = nil,
          @value : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      # The parameter already exists. You can't create duplicate parameters.

      struct ParameterAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about parameter usage.

      struct ParameterHistory
        include JSON::Serializable

        # Parameter names can include the following letters and symbols. a-zA-Z0-9_.-

        @[JSON::Field(key: "AllowedPattern")]
        getter allowed_pattern : String?

        # The data type of the parameter, such as text or aws:ec2:image . The default is text .

        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # Information about the parameter.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The alias of the Key Management Service (KMS) key used to encrypt the parameter. Applies to
        # SecureString parameters only

        @[JSON::Field(key: "KeyId")]
        getter key_id : String?

        # Labels assigned to the parameter version.

        @[JSON::Field(key: "Labels")]
        getter labels : Array(String)?

        # Date the parameter was last changed or updated.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # Amazon Resource Name (ARN) of the Amazon Web Services user who last changed the parameter.

        @[JSON::Field(key: "LastModifiedUser")]
        getter last_modified_user : String?

        # The name of the parameter.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Information about the policies assigned to a parameter. Assigning parameter policies in the Amazon
        # Web Services Systems Manager User Guide .

        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::ParameterInlinePolicy)?

        # The parameter tier.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # The type of parameter used.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The parameter value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        # The parameter version.

        @[JSON::Field(key: "Version")]
        getter version : Int64?

        def initialize(
          @allowed_pattern : String? = nil,
          @data_type : String? = nil,
          @description : String? = nil,
          @key_id : String? = nil,
          @labels : Array(String)? = nil,
          @last_modified_date : Time? = nil,
          @last_modified_user : String? = nil,
          @name : String? = nil,
          @policies : Array(Types::ParameterInlinePolicy)? = nil,
          @tier : String? = nil,
          @type : String? = nil,
          @value : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      # One or more policies assigned to a parameter.

      struct ParameterInlinePolicy
        include JSON::Serializable

        # The status of the policy. Policies report the following statuses: Pending (the policy hasn't been
        # enforced or applied yet), Finished (the policy was applied), Failed (the policy wasn't applied), or
        # InProgress (the policy is being applied now).

        @[JSON::Field(key: "PolicyStatus")]
        getter policy_status : String?

        # The JSON text of the policy.

        @[JSON::Field(key: "PolicyText")]
        getter policy_text : String?

        # The type of policy. Parameter Store, a tool in Amazon Web Services Systems Manager, supports the
        # following policy types: Expiration, ExpirationNotification, and NoChangeNotification.

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        def initialize(
          @policy_status : String? = nil,
          @policy_text : String? = nil,
          @policy_type : String? = nil
        )
        end
      end

      # You have exceeded the number of parameters for this Amazon Web Services account. Delete one or more
      # parameters and try again.

      struct ParameterLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Parameter Store retains the 100 most recently created versions of a parameter. After this number of
      # versions has been created, Parameter Store deletes the oldest version when a new one is created.
      # However, if the oldest version has a label attached to it, Parameter Store won't delete the version
      # and instead presents this error message: An error occurred (ParameterMaxVersionLimitExceeded) when
      # calling the PutParameter operation: You attempted to create a new version of parameter-name by
      # calling the PutParameter API with the overwrite flag. Version version-number , the oldest version,
      # can't be deleted because it has a label associated with it. Move the label to another version of the
      # parameter, and try again. This safeguard is to prevent parameter versions with mission critical
      # labels assigned to them from being deleted. To continue creating new parameters, first move the
      # label from the oldest version of the parameter to a newer one for use in your operations. For
      # information about moving parameter labels, see Move a parameter label (console) or Move a parameter
      # label (CLI) in the Amazon Web Services Systems Manager User Guide .

      struct ParameterMaxVersionLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Metadata includes information like the Amazon Resource Name (ARN) of the last user to update the
      # parameter and the date and time the parameter was last used.

      struct ParameterMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the parameter.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A parameter name can include only the following letters and symbols. a-zA-Z0-9_.-

        @[JSON::Field(key: "AllowedPattern")]
        getter allowed_pattern : String?

        # The data type of the parameter, such as text or aws:ec2:image . The default is text .

        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # Description of the parameter actions.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The alias of the Key Management Service (KMS) key used to encrypt the parameter. Applies to
        # SecureString parameters only.

        @[JSON::Field(key: "KeyId")]
        getter key_id : String?

        # Date the parameter was last changed or updated.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # Amazon Resource Name (ARN) of the Amazon Web Services user who last changed the parameter.

        @[JSON::Field(key: "LastModifiedUser")]
        getter last_modified_user : String?

        # The parameter name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of policies associated with a parameter.

        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::ParameterInlinePolicy)?

        # The parameter tier.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # The type of parameter. Valid parameter types include the following: String , StringList , and
        # SecureString .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The parameter version.

        @[JSON::Field(key: "Version")]
        getter version : Int64?

        def initialize(
          @arn : String? = nil,
          @allowed_pattern : String? = nil,
          @data_type : String? = nil,
          @description : String? = nil,
          @key_id : String? = nil,
          @last_modified_date : Time? = nil,
          @last_modified_user : String? = nil,
          @name : String? = nil,
          @policies : Array(Types::ParameterInlinePolicy)? = nil,
          @tier : String? = nil,
          @type : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      # The parameter couldn't be found. Verify the name and try again. For the DeleteParameter and
      # GetParameter actions, if the specified parameter doesn't exist, the ParameterNotFound exception is
      # not recorded in CloudTrail event logs.

      struct ParameterNotFound
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The parameter name isn't valid.

      struct ParameterPatternMismatchException
        include JSON::Serializable

        # The parameter name isn't valid.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more filters. Use a filter to return a more specific list of results.

      struct ParameterStringFilter
        include JSON::Serializable

        # The name of the filter. The ParameterStringFilter object is used by the DescribeParameters and
        # GetParametersByPath API operations. However, not all of the pattern values listed for Key can be
        # used with both operations. For DescribeParameters , all of the listed patterns are valid except
        # Label . For GetParametersByPath , the following patterns listed for Key aren't valid: tag , DataType
        # , Name , Path , and Tier . For examples of Amazon Web Services CLI commands demonstrating valid
        # parameter filter constructions, see Searching for Systems Manager parameters in the Amazon Web
        # Services Systems Manager User Guide .

        @[JSON::Field(key: "Key")]
        getter key : String

        # For all filters used with DescribeParameters , valid options include Equals and BeginsWith . The
        # Name filter additionally supports the Contains option. (Exception: For filters using the key Path ,
        # valid options include Recursive and OneLevel .) For filters used with GetParametersByPath , valid
        # options include Equals and BeginsWith . (Exception: For filters using Label as the Key name, the
        # only valid option is Equals .)

        @[JSON::Field(key: "Option")]
        getter option : String?

        # The value you want to search for.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String,
          @option : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # A parameter version can have a maximum of ten labels.

      struct ParameterVersionLabelLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified parameter version wasn't found. Verify the parameter name and version, and try again.

      struct ParameterVersionNotFound
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This data type is deprecated. Instead, use ParameterStringFilter .

      struct ParametersFilter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The filter values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @values : Array(String)
        )
        end
      end

      # A detailed status of the parent step.

      struct ParentStepDetails
        include JSON::Serializable

        # The name of the automation action.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The current repetition of the loop represented by an integer.

        @[JSON::Field(key: "Iteration")]
        getter iteration : Int32?

        # The current value of the specified iterator in the loop.

        @[JSON::Field(key: "IteratorValue")]
        getter iterator_value : String?

        # The unique ID of a step execution.

        @[JSON::Field(key: "StepExecutionId")]
        getter step_execution_id : String?

        # The name of the step.

        @[JSON::Field(key: "StepName")]
        getter step_name : String?

        def initialize(
          @action : String? = nil,
          @iteration : Int32? = nil,
          @iterator_value : String? = nil,
          @step_execution_id : String? = nil,
          @step_name : String? = nil
        )
        end
      end

      # Represents metadata about a patch.

      struct Patch
        include JSON::Serializable

        # The Advisory ID of the patch. For example, RHSA-2020:3779 . Applies to Linux-based managed nodes
        # only.

        @[JSON::Field(key: "AdvisoryIds")]
        getter advisory_ids : Array(String)?

        # The architecture of the patch. For example, in example-pkg-0.710.10-2.7.abcd.x86_64 , the
        # architecture is indicated by x86_64 . Applies to Linux-based managed nodes only.

        @[JSON::Field(key: "Arch")]
        getter arch : String?

        # The Bugzilla ID of the patch. For example, 1600646 . Applies to Linux-based managed nodes only.

        @[JSON::Field(key: "BugzillaIds")]
        getter bugzilla_ids : Array(String)?

        # The Common Vulnerabilities and Exposures (CVE) ID of the patch. For example, CVE-2011-3192 . Applies
        # to Linux-based managed nodes only.

        @[JSON::Field(key: "CVEIds")]
        getter cve_ids : Array(String)?

        # The classification of the patch. For example, SecurityUpdates , Updates , or CriticalUpdates .

        @[JSON::Field(key: "Classification")]
        getter classification : String?

        # The URL where more information can be obtained about the patch.

        @[JSON::Field(key: "ContentUrl")]
        getter content_url : String?

        # The description of the patch.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The epoch of the patch. For example in pkg-example-EE-20180914-2.2.amzn1.noarch , the epoch value is
        # 20180914-2 . Applies to Linux-based managed nodes only.

        @[JSON::Field(key: "Epoch")]
        getter epoch : Int32?

        # The ID of the patch. Applies to Windows patches only. This ID isn't the same as the Microsoft
        # Knowledge Base ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The Microsoft Knowledge Base ID of the patch. Applies to Windows patches only.

        @[JSON::Field(key: "KbNumber")]
        getter kb_number : String?

        # The language of the patch if it's language-specific.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # The ID of the Microsoft Security Response Center (MSRC) bulletin the patch is related to. For
        # example, MS14-045 . Applies to Windows patches only.

        @[JSON::Field(key: "MsrcNumber")]
        getter msrc_number : String?

        # The severity of the patch, such as Critical , Important , or Moderate . Applies to Windows patches
        # only.

        @[JSON::Field(key: "MsrcSeverity")]
        getter msrc_severity : String?

        # The name of the patch. Applies to Linux-based managed nodes only.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The specific product the patch is applicable for. For example, WindowsServer2016 or
        # AmazonLinux2018.03 .

        @[JSON::Field(key: "Product")]
        getter product : String?

        # The product family the patch is applicable for. For example, Windows or Amazon Linux 2 .

        @[JSON::Field(key: "ProductFamily")]
        getter product_family : String?

        # The particular release of a patch. For example, in pkg-example-EE-20180914-2.2.amzn1.noarch , the
        # release is 2.amaz1 . Applies to Linux-based managed nodes only.

        @[JSON::Field(key: "Release")]
        getter release : String?

        # The date the patch was released.

        @[JSON::Field(key: "ReleaseDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter release_date : Time?

        # The source patch repository for the operating system and version, such as trusty-security for Ubuntu
        # Server 14.04 LTE and focal-security for Ubuntu Server 20.04 LTE. Applies to Linux-based managed
        # nodes only.

        @[JSON::Field(key: "Repository")]
        getter repository : String?

        # The severity level of the patch. For example, CRITICAL or MODERATE .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The title of the patch.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # The name of the vendor providing the patch.

        @[JSON::Field(key: "Vendor")]
        getter vendor : String?

        # The version number of the patch. For example, in example-pkg-1.710.10-2.7.abcd.x86_64 , the version
        # number is indicated by -1 . Applies to Linux-based managed nodes only.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @advisory_ids : Array(String)? = nil,
          @arch : String? = nil,
          @bugzilla_ids : Array(String)? = nil,
          @cve_ids : Array(String)? = nil,
          @classification : String? = nil,
          @content_url : String? = nil,
          @description : String? = nil,
          @epoch : Int32? = nil,
          @id : String? = nil,
          @kb_number : String? = nil,
          @language : String? = nil,
          @msrc_number : String? = nil,
          @msrc_severity : String? = nil,
          @name : String? = nil,
          @product : String? = nil,
          @product_family : String? = nil,
          @release : String? = nil,
          @release_date : Time? = nil,
          @repository : String? = nil,
          @severity : String? = nil,
          @title : String? = nil,
          @vendor : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Defines the basic information about a patch baseline.

      struct PatchBaselineIdentity
        include JSON::Serializable

        # The description of the patch baseline.

        @[JSON::Field(key: "BaselineDescription")]
        getter baseline_description : String?

        # The ID of the patch baseline.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String?

        # The name of the patch baseline.

        @[JSON::Field(key: "BaselineName")]
        getter baseline_name : String?

        # Indicates whether this is the default baseline. Amazon Web Services Systems Manager supports
        # creating multiple default patch baselines. For example, you can create a default patch baseline for
        # each operating system.

        @[JSON::Field(key: "DefaultBaseline")]
        getter default_baseline : Bool?

        # Defines the operating system the patch baseline applies to. The default value is WINDOWS .

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        def initialize(
          @baseline_description : String? = nil,
          @baseline_id : String? = nil,
          @baseline_name : String? = nil,
          @default_baseline : Bool? = nil,
          @operating_system : String? = nil
        )
        end
      end

      # Information about the state of a patch on a particular managed node as it relates to the patch
      # baseline used to patch the node.

      struct PatchComplianceData
        include JSON::Serializable

        # The classification of the patch, such as SecurityUpdates , Updates , and CriticalUpdates .

        @[JSON::Field(key: "Classification")]
        getter classification : String

        # The date/time the patch was installed on the managed node. Not all operating systems provide this
        # level of information.

        @[JSON::Field(key: "InstalledTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter installed_time : Time

        # The operating system-specific ID of the patch.

        @[JSON::Field(key: "KBId")]
        getter kb_id : String

        # The severity of the patch such as Critical , Important , and Moderate .

        @[JSON::Field(key: "Severity")]
        getter severity : String

        # The state of the patch on the managed node, such as INSTALLED or FAILED. For descriptions of each
        # patch state, see About patch compliance in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "State")]
        getter state : String

        # The title of the patch.

        @[JSON::Field(key: "Title")]
        getter title : String

        # The IDs of one or more Common Vulnerabilities and Exposure (CVE) issues that are resolved by the
        # patch. Currently, CVE ID values are reported only for patches with a status of Missing or Failed .

        @[JSON::Field(key: "CVEIds")]
        getter cve_ids : String?

        def initialize(
          @classification : String,
          @installed_time : Time,
          @kb_id : String,
          @severity : String,
          @state : String,
          @title : String,
          @cve_ids : String? = nil
        )
        end
      end

      # Defines which patches should be included in a patch baseline. A patch filter consists of a key and a
      # set of values. The filter key is a patch property. For example, the available filter keys for
      # WINDOWS are PATCH_SET , PRODUCT , PRODUCT_FAMILY , CLASSIFICATION , and MSRC_SEVERITY . The filter
      # values define a matching criterion for the patch property indicated by the key. For example, if the
      # filter key is PRODUCT and the filter values are ["Office 2013", "Office 2016"] , then the filter
      # accepts all patches where product name is either "Office 2013" or "Office 2016". The filter values
      # can be exact values for the patch property given as a key, or a wildcard (*), which matches all
      # values. You can view lists of valid values for the patch properties by running the
      # DescribePatchProperties command. For information about which patch properties can be used with each
      # major operating system, see DescribePatchProperties .

      struct PatchFilter
        include JSON::Serializable

        # The key for the filter. Run the DescribePatchProperties command to view lists of valid keys for each
        # operating system type.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value for the filter key. Run the DescribePatchProperties command to view lists of valid values
        # for each key based on operating system type.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @values : Array(String)
        )
        end
      end

      # A set of patch filters, typically used for approval rules.

      struct PatchFilterGroup
        include JSON::Serializable

        # The set of patch filters that make up the group.

        @[JSON::Field(key: "PatchFilters")]
        getter patch_filters : Array(Types::PatchFilter)

        def initialize(
          @patch_filters : Array(Types::PatchFilter)
        )
        end
      end

      # The mapping between a patch group and the patch baseline the patch group is registered with.

      struct PatchGroupPatchBaselineMapping
        include JSON::Serializable

        # The patch baseline the patch group is registered with.

        @[JSON::Field(key: "BaselineIdentity")]
        getter baseline_identity : Types::PatchBaselineIdentity?

        # The name of the patch group registered with the patch baseline.

        @[JSON::Field(key: "PatchGroup")]
        getter patch_group : String?

        def initialize(
          @baseline_identity : Types::PatchBaselineIdentity? = nil,
          @patch_group : String? = nil
        )
        end
      end

      # Defines a filter used in Patch Manager APIs. Supported filter keys depend on the API operation that
      # includes the filter. Patch Manager API operations that use PatchOrchestratorFilter include the
      # following: DescribeAvailablePatches DescribeInstancePatches DescribePatchBaselines
      # DescribePatchGroups

      struct PatchOrchestratorFilter
        include JSON::Serializable

        # The key for the filter.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value for the filter.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Defines an approval rule for a patch baseline.

      struct PatchRule
        include JSON::Serializable

        # The patch filter group that defines the criteria for the rule.

        @[JSON::Field(key: "PatchFilterGroup")]
        getter patch_filter_group : Types::PatchFilterGroup

        # The number of days after the release date of each patch matched by the rule that the patch is marked
        # as approved in the patch baseline. For example, a value of 7 means that patches are approved seven
        # days after they are released. Patch Manager evaluates patch release dates using Coordinated
        # Universal Time (UTC). If the day represented by 7 is 2025-11-16 , patches released between
        # 2025-11-16T00:00:00Z and 2025-11-16T23:59:59Z will be included in the approval. This parameter is
        # marked as Required: No , but your request must include a value for either ApproveAfterDays or
        # ApproveUntilDate . Not supported for Debian Server or Ubuntu Server. Use caution when setting this
        # value for Windows Server patch baselines. Because patch updates that are replaced by later updates
        # are removed, setting too broad a value for this parameter can result in crucial patches not being
        # installed. For more information, see the Windows Server tab in the topic How security patches are
        # selected in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "ApproveAfterDays")]
        getter approve_after_days : Int32?

        # The cutoff date for auto approval of released patches. Any patches released on or before this date
        # are installed automatically. Enter dates in the format YYYY-MM-DD . For example, 2025-11-16 . Patch
        # Manager evaluates patch release dates using Coordinated Universal Time (UTC). If you enter the date
        # 2025-11-16 , patches released between 2025-11-16T00:00:00Z and 2025-11-16T23:59:59Z will be included
        # in the approval. This parameter is marked as Required: No , but your request must include a value
        # for either ApproveUntilDate or ApproveAfterDays . Not supported for Debian Server or Ubuntu Server.
        # Use caution when setting this value for Windows Server patch baselines. Because patch updates that
        # are replaced by later updates are removed, setting too broad a value for this parameter can result
        # in crucial patches not being installed. For more information, see the Windows Server tab in the
        # topic How security patches are selected in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "ApproveUntilDate")]
        getter approve_until_date : String?

        # A compliance severity level for all approved patches in a patch baseline.

        @[JSON::Field(key: "ComplianceLevel")]
        getter compliance_level : String?

        # For managed nodes identified by the approval rule filters, enables a patch baseline to apply
        # non-security updates available in the specified repository. The default value is false . Applies to
        # Linux managed nodes only.

        @[JSON::Field(key: "EnableNonSecurity")]
        getter enable_non_security : Bool?

        def initialize(
          @patch_filter_group : Types::PatchFilterGroup,
          @approve_after_days : Int32? = nil,
          @approve_until_date : String? = nil,
          @compliance_level : String? = nil,
          @enable_non_security : Bool? = nil
        )
        end
      end

      # A set of rules defining the approval rules for a patch baseline.

      struct PatchRuleGroup
        include JSON::Serializable

        # The rules that make up the rule group.

        @[JSON::Field(key: "PatchRules")]
        getter patch_rules : Array(Types::PatchRule)

        def initialize(
          @patch_rules : Array(Types::PatchRule)
        )
        end
      end

      # Information about the patches to use to update the managed nodes, including target operating systems
      # and source repository. Applies to Linux managed nodes only.

      struct PatchSource
        include JSON::Serializable

        # The value of the repo configuration. Example for yum repositories [main] name=MyCustomRepository
        # baseurl=https://my-custom-repository enabled=1 For information about other options available for
        # your yum repository configuration, see dnf.conf(5) on the man7.org website. Examples for Ubuntu
        # Server and Debian Server deb http://security.ubuntu.com/ubuntu jammy main deb
        # https://site.example.com/debian distribution component1 component2 component3 Repo information for
        # Ubuntu Server repositories must be specifed in a single line. For more examples and information, see
        # jammy (5) sources.list.5.gz on the Ubuntu Server Manuals website and sources.list format on the
        # Debian Wiki .

        @[JSON::Field(key: "Configuration")]
        getter configuration : String

        # The name specified to identify the patch source.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The specific operating system versions a patch repository applies to, such as "Ubuntu16.04",
        # "AmazonLinux2016.09", "RedhatEnterpriseLinux7.2" or "Suse12.7". For lists of supported product
        # values, see PatchFilter .

        @[JSON::Field(key: "Products")]
        getter products : Array(String)

        def initialize(
          @configuration : String,
          @name : String,
          @products : Array(String)
        )
        end
      end

      # Information about the approval status of a patch.

      struct PatchStatus
        include JSON::Serializable

        # The date the patch was approved (or will be approved if the status is PENDING_APPROVAL ).

        @[JSON::Field(key: "ApprovalDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter approval_date : Time?

        # The compliance severity level for a patch.

        @[JSON::Field(key: "ComplianceLevel")]
        getter compliance_level : String?

        # The approval status of a patch.

        @[JSON::Field(key: "DeploymentStatus")]
        getter deployment_status : String?

        def initialize(
          @approval_date : Time? = nil,
          @compliance_level : String? = nil,
          @deployment_status : String? = nil
        )
        end
      end

      # You specified more than the maximum number of allowed policies for the parameter. The maximum is 10.

      struct PoliciesLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An aggregate of step execution statuses displayed in the Amazon Web Services Systems Manager console
      # for a multi-Region and multi-account Automation execution.

      struct ProgressCounters
        include JSON::Serializable

        # The total number of steps that the system cancelled in all specified Amazon Web Services Regions and
        # Amazon Web Services accounts for the current Automation execution.

        @[JSON::Field(key: "CancelledSteps")]
        getter cancelled_steps : Int32?

        # The total number of steps that failed to run in all specified Amazon Web Services Regions and Amazon
        # Web Services accounts for the current Automation execution.

        @[JSON::Field(key: "FailedSteps")]
        getter failed_steps : Int32?

        # The total number of steps that successfully completed in all specified Amazon Web Services Regions
        # and Amazon Web Services accounts for the current Automation execution.

        @[JSON::Field(key: "SuccessSteps")]
        getter success_steps : Int32?

        # The total number of steps that timed out in all specified Amazon Web Services Regions and Amazon Web
        # Services accounts for the current Automation execution.

        @[JSON::Field(key: "TimedOutSteps")]
        getter timed_out_steps : Int32?

        # The total number of steps run in all specified Amazon Web Services Regions and Amazon Web Services
        # accounts for the current Automation execution.

        @[JSON::Field(key: "TotalSteps")]
        getter total_steps : Int32?

        def initialize(
          @cancelled_steps : Int32? = nil,
          @failed_steps : Int32? = nil,
          @success_steps : Int32? = nil,
          @timed_out_steps : Int32? = nil,
          @total_steps : Int32? = nil
        )
        end
      end


      struct PutComplianceItemsRequest
        include JSON::Serializable

        # Specify the compliance type. For example, specify Association (for a State Manager association),
        # Patch, or Custom: string .

        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String

        # A summary of the call execution that includes an execution ID, the type of execution (for example,
        # Command ), and the date/time of the execution using a datetime object that is saved in the following
        # format: yyyy-MM-dd'T'HH:mm:ss'Z'

        @[JSON::Field(key: "ExecutionSummary")]
        getter execution_summary : Types::ComplianceExecutionSummary

        # Information about the compliance as defined by the resource type. For example, for a patch
        # compliance type, Items includes information about the PatchSeverity, Classification, and so on.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ComplianceItemEntry)

        # Specify an ID for this resource. For a managed node, this is the node ID.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Specify the type of resource. ManagedInstance is currently the only supported resource type.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # MD5 or SHA-256 content hash. The content hash is used to determine if existing information should be
        # overwritten or ignored. If the content hashes match, the request to put compliance information is
        # ignored.

        @[JSON::Field(key: "ItemContentHash")]
        getter item_content_hash : String?

        # The mode for uploading compliance items. You can specify COMPLETE or PARTIAL . In COMPLETE mode, the
        # system overwrites all existing compliance information for the resource. You must provide a full list
        # of compliance items each time you send the request. In PARTIAL mode, the system overwrites
        # compliance information for a specific association. The association must be configured with
        # SyncCompliance set to MANUAL . By default, all requests use COMPLETE mode. This attribute is only
        # valid for association compliance.

        @[JSON::Field(key: "UploadType")]
        getter upload_type : String?

        def initialize(
          @compliance_type : String,
          @execution_summary : Types::ComplianceExecutionSummary,
          @items : Array(Types::ComplianceItemEntry),
          @resource_id : String,
          @resource_type : String,
          @item_content_hash : String? = nil,
          @upload_type : String? = nil
        )
        end
      end


      struct PutComplianceItemsResult
        include JSON::Serializable

        def initialize
        end
      end


      struct PutInventoryRequest
        include JSON::Serializable

        # An managed node ID where you want to add or update inventory items.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The inventory items that you want to add or update on managed nodes.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::InventoryItem)

        def initialize(
          @instance_id : String,
          @items : Array(Types::InventoryItem)
        )
        end
      end


      struct PutInventoryResult
        include JSON::Serializable

        # Information about the request.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct PutParameterRequest
        include JSON::Serializable

        # The fully qualified name of the parameter that you want to create or update. You can't enter the
        # Amazon Resource Name (ARN) for a parameter, only the parameter name itself. The fully qualified name
        # includes the complete hierarchy of the parameter path and name. For parameters in a hierarchy, you
        # must include a leading forward slash character (/) when you create or reference a parameter. For
        # example: /Dev/DBServer/MySQL/db-string13 Naming Constraints: Parameter names are case sensitive. A
        # parameter name must be unique within an Amazon Web Services Region A parameter name can't be
        # prefixed with " aws " or " ssm " (case-insensitive). Parameter names can include only the following
        # symbols and letters: a-zA-Z0-9_.- In addition, the slash character ( / ) is used to delineate
        # hierarchies in parameter names. For example: /Dev/Production/East/Project-ABC/MyParameter Parameter
        # names can't contain spaces. The service removes any spaces specified for the beginning or end of a
        # parameter name. If the specified name for a parameter contains spaces between characters, the
        # request fails with a ValidationException error. Parameter hierarchies are limited to a maximum depth
        # of fifteen levels. For additional information about valid values for parameter names, see Creating
        # Systems Manager parameters in the Amazon Web Services Systems Manager User Guide . The reported
        # maximum length of 2048 characters for a parameter name includes 1037 characters that are reserved
        # for internal use by Systems Manager. The maximum length for a parameter name that you specify is
        # 1011 characters. This count of 1011 characters includes the characters in the ARN that precede the
        # name you specify. This ARN length will vary depending on your partition and Region. For example, the
        # following 45 characters count toward the 1011 character maximum for a parameter created in the US
        # East (Ohio) Region: arn:aws:ssm:us-east-2:111122223333:parameter/ .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The parameter value that you want to add to the system. Standard parameters have a value limit of 4
        # KB. Advanced parameters have a value limit of 8 KB. Parameters can't be referenced or nested in the
        # values of other parameters. You can't include values wrapped in double brackets {{}} or {{ssm:
        # parameter-name }} in a parameter value.

        @[JSON::Field(key: "Value")]
        getter value : String

        # A regular expression used to validate the parameter value. For example, for String types with values
        # restricted to numbers, you can specify the following: AllowedPattern=^\d+$

        @[JSON::Field(key: "AllowedPattern")]
        getter allowed_pattern : String?

        # The data type for a String parameter. Supported data types include plain text and Amazon Machine
        # Image (AMI) IDs. The following data type values are supported. text aws:ec2:image
        # aws:ssm:integration When you create a String parameter and specify aws:ec2:image , Amazon Web
        # Services Systems Manager validates the parameter value is in the required format, such as
        # ami-12345abcdeEXAMPLE , and that the specified AMI is available in your Amazon Web Services account.
        # If the action is successful, the service sends back an HTTP 200 response which indicates a
        # successful PutParameter call for all cases except for data type aws:ec2:image . If you call
        # PutParameter with aws:ec2:image data type, a successful HTTP 200 response does not guarantee that
        # your parameter was successfully created or updated. The aws:ec2:image value is validated
        # asynchronously, and the PutParameter call returns before the validation is complete. If you submit
        # an invalid AMI value, the PutParameter operation will return success, but the asynchronous
        # validation will fail and the parameter will not be created or updated. To monitor whether your
        # aws:ec2:image parameters are created successfully, see Setting up notifications or trigger actions
        # based on Parameter Store events . For more information about AMI format validation , see Native
        # parameter support for Amazon Machine Image IDs .

        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # Information about the parameter that you want to add to the system. Optional but recommended. Don't
        # enter personally identifiable information in this field.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Key Management Service (KMS) ID that you want to use to encrypt a parameter. Use a custom key
        # for better security. Required for parameters that use the SecureString data type. If you don't
        # specify a key ID, the system uses the default key associated with your Amazon Web Services account,
        # which is not as secure as using a custom key. To use a custom KMS key, choose the SecureString data
        # type with the Key ID parameter.

        @[JSON::Field(key: "KeyId")]
        getter key_id : String?

        # Overwrite an existing parameter. The default value is false .

        @[JSON::Field(key: "Overwrite")]
        getter overwrite : Bool?

        # One or more policies to apply to a parameter. This operation takes a JSON array. Parameter Store, a
        # tool in Amazon Web Services Systems Manager supports the following policy types: Expiration: This
        # policy deletes the parameter after it expires. When you create the policy, you specify the
        # expiration date. You can update the expiration date and time by updating the policy. Updating the
        # parameter doesn't affect the expiration date and time. When the expiration time is reached,
        # Parameter Store deletes the parameter. ExpirationNotification: This policy initiates an event in
        # Amazon CloudWatch Events that notifies you about the expiration. By using this policy, you can
        # receive notification before or after the expiration time is reached, in units of days or hours.
        # NoChangeNotification: This policy initiates a CloudWatch Events event if a parameter hasn't been
        # modified for a specified period of time. This policy type is useful when, for example, a secret
        # needs to be changed within a period of time, but it hasn't been changed. All existing policies are
        # preserved until you send new policies or an empty policy. For more information about parameter
        # policies, see Assigning parameter policies .

        @[JSON::Field(key: "Policies")]
        getter policies : String?

        # Optional metadata that you assign to a resource. Tags enable you to categorize a resource in
        # different ways, such as by purpose, owner, or environment. For example, you might want to tag a
        # Systems Manager parameter to identify the type of resource to which it applies, the environment, or
        # the type of configuration data referenced by the parameter. In this case, you could specify the
        # following key-value pairs: Key=Resource,Value=S3bucket Key=OS,Value=Windows
        # Key=ParameterType,Value=LicenseKey To add tags to an existing Systems Manager parameter, use the
        # AddTagsToResource operation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The parameter tier to assign to a parameter. Parameter Store offers a standard tier and an advanced
        # tier for parameters. Standard parameters have a content size limit of 4 KB and can't be configured
        # to use parameter policies. You can create a maximum of 10,000 standard parameters for each Region in
        # an Amazon Web Services account. Standard parameters are offered at no additional cost. Advanced
        # parameters have a content size limit of 8 KB and can be configured to use parameter policies. You
        # can create a maximum of 100,000 advanced parameters for each Region in an Amazon Web Services
        # account. Advanced parameters incur a charge. For more information, see Managing parameter tiers in
        # the Amazon Web Services Systems Manager User Guide . You can change a standard parameter to an
        # advanced parameter any time. But you can't revert an advanced parameter to a standard parameter.
        # Reverting an advanced parameter to a standard parameter would result in data loss because the system
        # would truncate the size of the parameter from 8 KB to 4 KB. Reverting would also remove any policies
        # attached to the parameter. Lastly, advanced parameters use a different form of encryption than
        # standard parameters. If you no longer need an advanced parameter, or if you no longer want to incur
        # charges for an advanced parameter, you must delete it and recreate it as a new standard parameter.
        # Using the Default Tier Configuration In PutParameter requests, you can specify the tier to create
        # the parameter in. Whenever you specify a tier in the request, Parameter Store creates or updates the
        # parameter according to that request. However, if you don't specify a tier in a request, Parameter
        # Store assigns the tier based on the current Parameter Store default tier configuration. The default
        # tier when you begin using Parameter Store is the standard-parameter tier. If you use the
        # advanced-parameter tier, you can specify one of the following as the default: Advanced : With this
        # option, Parameter Store evaluates all requests as advanced parameters. Intelligent-Tiering : With
        # this option, Parameter Store evaluates each request to determine if the parameter is standard or
        # advanced. If the request doesn't include any options that require an advanced parameter, the
        # parameter is created in the standard-parameter tier. If one or more options requiring an advanced
        # parameter are included in the request, Parameter Store create a parameter in the advanced-parameter
        # tier. This approach helps control your parameter-related costs by always creating standard
        # parameters unless an advanced parameter is necessary. Options that require an advanced parameter
        # include the following: The content size of the parameter is more than 4 KB. The parameter uses a
        # parameter policy. More than 10,000 parameters already exist in your Amazon Web Services account in
        # the current Amazon Web Services Region. For more information about configuring the default tier
        # option, see Specifying a default parameter tier in the Amazon Web Services Systems Manager User
        # Guide .

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # The type of parameter that you want to create. SecureString isn't currently supported for
        # CloudFormation templates. Items in a StringList must be separated by a comma (,). You can't use
        # other punctuation or special character to escape items in the list. If you have a parameter value
        # that requires a comma, then use the String data type. Specifying a parameter type isn't required
        # when updating a parameter. You must specify a parameter type when creating a parameter.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String,
          @value : String,
          @allowed_pattern : String? = nil,
          @data_type : String? = nil,
          @description : String? = nil,
          @key_id : String? = nil,
          @overwrite : Bool? = nil,
          @policies : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tier : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct PutParameterResult
        include JSON::Serializable

        # The tier assigned to the parameter.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # The new version number of a parameter. If you edit a parameter value, Parameter Store automatically
        # creates a new version and assigns this new version a unique ID. You can reference a parameter
        # version ID in API operations or in Systems Manager documents (SSM documents). By default, if you
        # don't specify a specific version, the system returns the latest parameter value when a parameter is
        # called.

        @[JSON::Field(key: "Version")]
        getter version : Int64?

        def initialize(
          @tier : String? = nil,
          @version : Int64? = nil
        )
        end
      end


      struct PutResourcePolicyRequest
        include JSON::Serializable

        # A policy you want to associate with a resource.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # Amazon Resource Name (ARN) of the resource to which you want to attach a policy.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # ID of the current policy version. The hash helps to prevent a situation where multiple users attempt
        # to overwrite a policy. You must provide this hash when updating or deleting a policy.

        @[JSON::Field(key: "PolicyHash")]
        getter policy_hash : String?

        # The policy ID.

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        def initialize(
          @policy : String,
          @resource_arn : String,
          @policy_hash : String? = nil,
          @policy_id : String? = nil
        )
        end
      end


      struct PutResourcePolicyResponse
        include JSON::Serializable

        # ID of the current policy version.

        @[JSON::Field(key: "PolicyHash")]
        getter policy_hash : String?

        # The policy ID. To update a policy, you must specify PolicyId and PolicyHash .

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        def initialize(
          @policy_hash : String? = nil,
          @policy_id : String? = nil
        )
        end
      end


      struct RegisterDefaultPatchBaselineRequest
        include JSON::Serializable

        # The ID of the patch baseline that should be the default patch baseline.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String

        def initialize(
          @baseline_id : String
        )
        end
      end


      struct RegisterDefaultPatchBaselineResult
        include JSON::Serializable

        # The ID of the default patch baseline.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String?

        def initialize(
          @baseline_id : String? = nil
        )
        end
      end


      struct RegisterPatchBaselineForPatchGroupRequest
        include JSON::Serializable

        # The ID of the patch baseline to register with the patch group.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String

        # The name of the patch group to be registered with the patch baseline.

        @[JSON::Field(key: "PatchGroup")]
        getter patch_group : String

        def initialize(
          @baseline_id : String,
          @patch_group : String
        )
        end
      end


      struct RegisterPatchBaselineForPatchGroupResult
        include JSON::Serializable

        # The ID of the patch baseline the patch group was registered with.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String?

        # The name of the patch group registered with the patch baseline.

        @[JSON::Field(key: "PatchGroup")]
        getter patch_group : String?

        def initialize(
          @baseline_id : String? = nil,
          @patch_group : String? = nil
        )
        end
      end


      struct RegisterTargetWithMaintenanceWindowRequest
        include JSON::Serializable

        # The type of target being registered with the maintenance window.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The targets to register with the maintenance window. In other words, the managed nodes to run
        # commands on when the maintenance window runs. If a single maintenance window task is registered with
        # multiple targets, its task invocations occur sequentially and not in parallel. If your task must run
        # on multiple targets at the same time, register a task for each target individually and assign each
        # task the same priority level. You can specify targets using managed node IDs, resource group names,
        # or tags that have been applied to managed nodes. Example 1 : Specify managed node IDs
        # Key=InstanceIds,Values=&lt;instance-id-1&gt;,&lt;instance-id-2&gt;,&lt;instance-id-3&gt; Example 2 :
        # Use tag key-pairs applied to managed nodes
        # Key=tag:&lt;my-tag-key&gt;,Values=&lt;my-tag-value-1&gt;,&lt;my-tag-value-2&gt; Example 3 : Use
        # tag-keys applied to managed nodes Key=tag-key,Values=&lt;my-tag-key-1&gt;,&lt;my-tag-key-2&gt;
        # Example 4 : Use resource group names Key=resource-groups:Name,Values=&lt;resource-group-name&gt;
        # Example 5 : Use filters for resource group types
        # Key=resource-groups:ResourceTypeFilters,Values=&lt;resource-type-1&gt;,&lt;resource-type-2&gt; For
        # Key=resource-groups:ResourceTypeFilters , specify resource types in the following format
        # Key=resource-groups:ResourceTypeFilters,Values=AWS::EC2::INSTANCE,AWS::EC2::VPC For more information
        # about these examples formats, including the best use case for each one, see Examples: Register
        # targets with a maintenance window in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)

        # The ID of the maintenance window the target should be registered with.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        # User-provided idempotency token.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # An optional description for the target.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # An optional name for the target.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # User-provided value that will be included in any Amazon CloudWatch Events events raised while
        # running tasks for these targets in this maintenance window.

        @[JSON::Field(key: "OwnerInformation")]
        getter owner_information : String?

        def initialize(
          @resource_type : String,
          @targets : Array(Types::Target),
          @window_id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @owner_information : String? = nil
        )
        end
      end


      struct RegisterTargetWithMaintenanceWindowResult
        include JSON::Serializable

        # The ID of the target definition in this maintenance window.

        @[JSON::Field(key: "WindowTargetId")]
        getter window_target_id : String?

        def initialize(
          @window_target_id : String? = nil
        )
        end
      end


      struct RegisterTaskWithMaintenanceWindowRequest
        include JSON::Serializable

        # The ARN of the task to run.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String

        # The type of task being registered.

        @[JSON::Field(key: "TaskType")]
        getter task_type : String

        # The ID of the maintenance window the task should be added to.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        # The CloudWatch alarm you want to apply to your maintenance window task.

        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # User-provided idempotency token.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Indicates whether tasks should continue to run after the cutoff time specified in the maintenance
        # windows is reached. CONTINUE_TASK : When the cutoff time is reached, any tasks that are running
        # continue. The default value. CANCEL_TASK : For Automation, Lambda, Step Functions tasks: When the
        # cutoff time is reached, any task invocations that are already running continue, but no new task
        # invocations are started. For Run Command tasks: When the cutoff time is reached, the system sends a
        # CancelCommand operation that attempts to cancel the command associated with the task. However, there
        # is no guarantee that the command will be terminated and the underlying process stopped. The status
        # for tasks that are not completed is TIMED_OUT .

        @[JSON::Field(key: "CutoffBehavior")]
        getter cutoff_behavior : String?

        # An optional description for the task.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A structure containing information about an Amazon Simple Storage Service (Amazon S3) bucket to
        # write managed node-level logs to. LoggingInfo has been deprecated. To specify an Amazon Simple
        # Storage Service (Amazon S3) bucket to contain logs, instead use the OutputS3BucketName and
        # OutputS3KeyPrefix options in the TaskInvocationParameters structure. For information about how
        # Amazon Web Services Systems Manager handles these options for the supported maintenance window task
        # types, see MaintenanceWindowTaskInvocationParameters .

        @[JSON::Field(key: "LoggingInfo")]
        getter logging_info : Types::LoggingInfo?

        # The maximum number of targets this task can be run for, in parallel. Although this element is listed
        # as "Required: No", a value can be omitted only when you are registering or updating a targetless
        # task You must provide a value in all other cases. For maintenance window tasks without a target
        # specified, you can't supply a value for this option. Instead, the system inserts a placeholder value
        # of 1 . This value doesn't affect the running of your task.

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The maximum number of errors allowed before this task stops being scheduled. Although this element
        # is listed as "Required: No", a value can be omitted only when you are registering or updating a
        # targetless task You must provide a value in all other cases. For maintenance window tasks without a
        # target specified, you can't supply a value for this option. Instead, the system inserts a
        # placeholder value of 1 . This value doesn't affect the running of your task.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # An optional name for the task.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The priority of the task in the maintenance window, the lower the number the higher the priority.
        # Tasks in a maintenance window are scheduled in priority order with tasks that have the same priority
        # scheduled in parallel.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to
        # assume when running a maintenance window task. If you do not specify a service role ARN, Systems
        # Manager uses a service-linked role in your account. If no appropriate service-linked role for
        # Systems Manager exists in your account, it is created when you run RegisterTaskWithMaintenanceWindow
        # . However, for an improved security posture, we strongly recommend creating a custom policy and
        # custom service role for running your maintenance window tasks. The policy can be crafted to provide
        # only the permissions needed for your particular maintenance window tasks. For more information, see
        # Setting up Maintenance Windows in the in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "ServiceRoleArn")]
        getter service_role_arn : String?

        # The targets (either managed nodes or maintenance window targets). One or more targets must be
        # specified for maintenance window Run Command-type tasks. Depending on the task, targets are optional
        # for other maintenance window task types (Automation, Lambda, and Step Functions). For more
        # information about running tasks that don't specify targets, see Registering maintenance window tasks
        # without targets in the Amazon Web Services Systems Manager User Guide . Specify managed nodes using
        # the following format: Key=InstanceIds,Values=&lt;instance-id-1&gt;,&lt;instance-id-2&gt; Specify
        # maintenance window targets using the following format:
        # Key=WindowTargetIds,Values=&lt;window-target-id-1&gt;,&lt;window-target-id-2&gt;

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The parameters that the task should use during execution. Populate only the fields that match the
        # task type. All other fields should be empty.

        @[JSON::Field(key: "TaskInvocationParameters")]
        getter task_invocation_parameters : Types::MaintenanceWindowTaskInvocationParameters?

        # The parameters that should be passed to the task when it is run. TaskParameters has been deprecated.
        # To specify parameters to pass to a task when it runs, instead use the Parameters option in the
        # TaskInvocationParameters structure. For information about how Systems Manager handles these options
        # for the supported maintenance window task types, see MaintenanceWindowTaskInvocationParameters .

        @[JSON::Field(key: "TaskParameters")]
        getter task_parameters : Hash(String, Types::MaintenanceWindowTaskParameterValueExpression)?

        def initialize(
          @task_arn : String,
          @task_type : String,
          @window_id : String,
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @client_token : String? = nil,
          @cutoff_behavior : String? = nil,
          @description : String? = nil,
          @logging_info : Types::LoggingInfo? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @service_role_arn : String? = nil,
          @targets : Array(Types::Target)? = nil,
          @task_invocation_parameters : Types::MaintenanceWindowTaskInvocationParameters? = nil,
          @task_parameters : Hash(String, Types::MaintenanceWindowTaskParameterValueExpression)? = nil
        )
        end
      end


      struct RegisterTaskWithMaintenanceWindowResult
        include JSON::Serializable

        # The ID of the task in the maintenance window.

        @[JSON::Field(key: "WindowTaskId")]
        getter window_task_id : String?

        def initialize(
          @window_task_id : String? = nil
        )
        end
      end

      # Reserved for internal use.

      struct RegistrationMetadataItem
        include JSON::Serializable

        # Reserved for internal use.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Reserved for internal use.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # An OpsItems that shares something in common with the current OpsItem. For example, related OpsItems
      # can include OpsItems with similar error messages, impacted resources, or statuses for the impacted
      # resource.

      struct RelatedOpsItem
        include JSON::Serializable

        # The ID of an OpsItem related to the current OpsItem.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String

        def initialize(
          @ops_item_id : String
        )
        end
      end


      struct RemoveTagsFromResourceRequest
        include JSON::Serializable

        # The ID of the resource from which you want to remove tags. For example: ManagedInstance:
        # mi-012345abcde MaintenanceWindow: mw-012345abcde Automation : example-c160-4567-8519-012345abcde
        # PatchBaseline: pb-012345abcde OpsMetadata object: ResourceID for tagging is created from the Amazon
        # Resource Name (ARN) for the object. Specifically, ResourceID is created from the strings that come
        # after the word opsmetadata in the ARN. For example, an OpsMetadata object with an ARN of
        # arn:aws:ssm:us-east-2:1234567890:opsmetadata/aws/ssm/MyGroup/appmanager has a ResourceID of either
        # aws/ssm/MyGroup/appmanager or /aws/ssm/MyGroup/appmanager . For the Document and Parameter values,
        # use the name of the resource. The ManagedInstance type for this API operation is only for
        # on-premises managed nodes. Specify the name of the managed node in the following format:
        # mi-ID_number. For example, mi-1a2b3c4d5e6f.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of resource from which you want to remove a tag. The ManagedInstance type for this API
        # operation is only for on-premises managed nodes. Specify the name of the managed node in the
        # following format: mi- ID_number . For example, mi-1a2b3c4d5e6f .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Tag keys that you want to remove from the specified resource.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_id : String,
          @resource_type : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct RemoveTagsFromResourceResult
        include JSON::Serializable

        def initialize
        end
      end

      # The request body of the ResetServiceSetting API operation.

      struct ResetServiceSettingRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service setting to reset. The setting ID can be one of the
        # following. /ssm/appmanager/appmanager-enabled /ssm/automation/customer-script-log-destination
        # /ssm/automation/customer-script-log-group-name /ssm/automation/enable-adaptive-concurrency
        # /ssm/documents/console/public-sharing-permission /ssm/managed-instance/activation-tier
        # /ssm/managed-instance/default-ec2-instance-management-role /ssm/opsinsights/opscenter
        # /ssm/parameter-store/default-parameter-tier /ssm/parameter-store/high-throughput-enabled

        @[JSON::Field(key: "SettingId")]
        getter setting_id : String

        def initialize(
          @setting_id : String
        )
        end
      end

      # The result body of the ResetServiceSetting API operation.

      struct ResetServiceSettingResult
        include JSON::Serializable

        # The current, effective service setting after calling the ResetServiceSetting API operation.

        @[JSON::Field(key: "ServiceSetting")]
        getter service_setting : Types::ServiceSetting?

        def initialize(
          @service_setting : Types::ServiceSetting? = nil
        )
        end
      end

      # Information about targets that resolved during the Automation execution.

      struct ResolvedTargets
        include JSON::Serializable

        # A list of parameter values sent to targets that resolved during the Automation execution.

        @[JSON::Field(key: "ParameterValues")]
        getter parameter_values : Array(String)?

        # A boolean value indicating whether the resolved target list is truncated.

        @[JSON::Field(key: "Truncated")]
        getter truncated : Bool?

        def initialize(
          @parameter_values : Array(String)? = nil,
          @truncated : Bool? = nil
        )
        end
      end

      # Compliance summary information for a specific resource.

      struct ResourceComplianceSummaryItem
        include JSON::Serializable

        # The compliance type.

        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        # A list of items that are compliant for the resource.

        @[JSON::Field(key: "CompliantSummary")]
        getter compliant_summary : Types::CompliantSummary?

        # Information about the execution.

        @[JSON::Field(key: "ExecutionSummary")]
        getter execution_summary : Types::ComplianceExecutionSummary?

        # A list of items that aren't compliant for the resource.

        @[JSON::Field(key: "NonCompliantSummary")]
        getter non_compliant_summary : Types::NonCompliantSummary?

        # The highest severity item found for the resource. The resource is compliant for this item.

        @[JSON::Field(key: "OverallSeverity")]
        getter overall_severity : String?

        # The resource ID.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The resource type.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The compliance status for the resource.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @compliance_type : String? = nil,
          @compliant_summary : Types::CompliantSummary? = nil,
          @execution_summary : Types::ComplianceExecutionSummary? = nil,
          @non_compliant_summary : Types::NonCompliantSummary? = nil,
          @overall_severity : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A sync configuration with the same name already exists.

      struct ResourceDataSyncAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "SyncName")]
        getter sync_name : String?

        def initialize(
          @sync_name : String? = nil
        )
        end
      end

      # Information about the AwsOrganizationsSource resource data sync source. A sync source of this type
      # can synchronize data from Organizations or, if an Amazon Web Services organization isn't present,
      # from multiple Amazon Web Services Regions.

      struct ResourceDataSyncAwsOrganizationsSource
        include JSON::Serializable

        # If an Amazon Web Services organization is present, this is either OrganizationalUnits or
        # EntireOrganization . For OrganizationalUnits , the data is aggregated from a set of organization
        # units. For EntireOrganization , the data is aggregated from the entire Amazon Web Services
        # organization.

        @[JSON::Field(key: "OrganizationSourceType")]
        getter organization_source_type : String

        # The Organizations organization units included in the sync.

        @[JSON::Field(key: "OrganizationalUnits")]
        getter organizational_units : Array(Types::ResourceDataSyncOrganizationalUnit)?

        def initialize(
          @organization_source_type : String,
          @organizational_units : Array(Types::ResourceDataSyncOrganizationalUnit)? = nil
        )
        end
      end

      # Another UpdateResourceDataSync request is being processed. Wait a few minutes and try again.

      struct ResourceDataSyncConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have exceeded the allowed maximum sync configurations.

      struct ResourceDataSyncCountExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Synchronize Amazon Web Services Systems Manager Inventory data from multiple Amazon Web Services
      # accounts defined in Organizations to a centralized Amazon S3 bucket. Data is synchronized to
      # individual key prefixes in the central bucket. Each key prefix represents a different Amazon Web
      # Services account ID.

      struct ResourceDataSyncDestinationDataSharing
        include JSON::Serializable

        # The sharing data type. Only Organization is supported.

        @[JSON::Field(key: "DestinationDataSharingType")]
        getter destination_data_sharing_type : String?

        def initialize(
          @destination_data_sharing_type : String? = nil
        )
        end
      end

      # The specified sync configuration is invalid.

      struct ResourceDataSyncInvalidConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a resource data sync configuration, including its current status and last
      # successful sync.

      struct ResourceDataSyncItem
        include JSON::Serializable

        # The status reported by the last sync.

        @[JSON::Field(key: "LastStatus")]
        getter last_status : String?

        # The last time the sync operations returned a status of SUCCESSFUL (UTC).

        @[JSON::Field(key: "LastSuccessfulSyncTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_successful_sync_time : Time?

        # The status message details reported by the last sync.

        @[JSON::Field(key: "LastSyncStatusMessage")]
        getter last_sync_status_message : String?

        # The last time the configuration attempted to sync (UTC).

        @[JSON::Field(key: "LastSyncTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_sync_time : Time?

        # Configuration information for the target S3 bucket.

        @[JSON::Field(key: "S3Destination")]
        getter s3_destination : Types::ResourceDataSyncS3Destination?

        # The date and time the configuration was created (UTC).

        @[JSON::Field(key: "SyncCreatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter sync_created_time : Time?

        # The date and time the resource data sync was changed.

        @[JSON::Field(key: "SyncLastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter sync_last_modified_time : Time?

        # The name of the resource data sync.

        @[JSON::Field(key: "SyncName")]
        getter sync_name : String?

        # Information about the source where the data was synchronized.

        @[JSON::Field(key: "SyncSource")]
        getter sync_source : Types::ResourceDataSyncSourceWithState?

        # The type of resource data sync. If SyncType is SyncToDestination , then the resource data sync
        # synchronizes data to an S3 bucket. If the SyncType is SyncFromSource then the resource data sync
        # synchronizes data from Organizations or from multiple Amazon Web Services Regions.

        @[JSON::Field(key: "SyncType")]
        getter sync_type : String?

        def initialize(
          @last_status : String? = nil,
          @last_successful_sync_time : Time? = nil,
          @last_sync_status_message : String? = nil,
          @last_sync_time : Time? = nil,
          @s3_destination : Types::ResourceDataSyncS3Destination? = nil,
          @sync_created_time : Time? = nil,
          @sync_last_modified_time : Time? = nil,
          @sync_name : String? = nil,
          @sync_source : Types::ResourceDataSyncSourceWithState? = nil,
          @sync_type : String? = nil
        )
        end
      end

      # The specified sync name wasn't found.

      struct ResourceDataSyncNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "SyncName")]
        getter sync_name : String?


        @[JSON::Field(key: "SyncType")]
        getter sync_type : String?

        def initialize(
          @message : String? = nil,
          @sync_name : String? = nil,
          @sync_type : String? = nil
        )
        end
      end

      # The Organizations organizational unit data source for the sync.

      struct ResourceDataSyncOrganizationalUnit
        include JSON::Serializable

        # The Organizations unit ID data source for the sync.

        @[JSON::Field(key: "OrganizationalUnitId")]
        getter organizational_unit_id : String?

        def initialize(
          @organizational_unit_id : String? = nil
        )
        end
      end

      # Information about the target S3 bucket for the resource data sync.

      struct ResourceDataSyncS3Destination
        include JSON::Serializable

        # The name of the S3 bucket where the aggregated data is stored.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # The Amazon Web Services Region with the S3 bucket targeted by the resource data sync.

        @[JSON::Field(key: "Region")]
        getter region : String

        # A supported sync format. The following format is currently supported: JsonSerDe

        @[JSON::Field(key: "SyncFormat")]
        getter sync_format : String

        # The ARN of an encryption key for a destination in Amazon S3. Must belong to the same Region as the
        # destination S3 bucket.

        @[JSON::Field(key: "AWSKMSKeyARN")]
        getter awskms_key_arn : String?

        # Enables destination data sharing. By default, this field is null .

        @[JSON::Field(key: "DestinationDataSharing")]
        getter destination_data_sharing : Types::ResourceDataSyncDestinationDataSharing?

        # An Amazon S3 prefix for the bucket.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket_name : String,
          @region : String,
          @sync_format : String,
          @awskms_key_arn : String? = nil,
          @destination_data_sharing : Types::ResourceDataSyncDestinationDataSharing? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Information about the source of the data included in the resource data sync.

      struct ResourceDataSyncSource
        include JSON::Serializable

        # The SyncSource Amazon Web Services Regions included in the resource data sync.

        @[JSON::Field(key: "SourceRegions")]
        getter source_regions : Array(String)

        # The type of data source for the resource data sync. SourceType is either AwsOrganizations (if an
        # organization is present in Organizations) or SingleAccountMultiRegions .

        @[JSON::Field(key: "SourceType")]
        getter source_type : String

        # Information about the AwsOrganizationsSource resource data sync source. A sync source of this type
        # can synchronize data from Organizations.

        @[JSON::Field(key: "AwsOrganizationsSource")]
        getter aws_organizations_source : Types::ResourceDataSyncAwsOrganizationsSource?

        # When you create a resource data sync, if you choose one of the Organizations options, then Systems
        # Manager automatically enables all OpsData sources in the selected Amazon Web Services Regions for
        # all Amazon Web Services accounts in your organization (or in the selected organization units). For
        # more information, see Setting up Systems Manager Explorer to display data from multiple accounts and
        # Regions in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "EnableAllOpsDataSources")]
        getter enable_all_ops_data_sources : Bool?

        # Whether to automatically synchronize and aggregate data from new Amazon Web Services Regions when
        # those Regions come online.

        @[JSON::Field(key: "IncludeFutureRegions")]
        getter include_future_regions : Bool?

        def initialize(
          @source_regions : Array(String),
          @source_type : String,
          @aws_organizations_source : Types::ResourceDataSyncAwsOrganizationsSource? = nil,
          @enable_all_ops_data_sources : Bool? = nil,
          @include_future_regions : Bool? = nil
        )
        end
      end

      # The data type name for including resource data sync state. There are four sync states:
      # OrganizationNotExists (Your organization doesn't exist) NoPermissions (The system can't locate the
      # service-linked role. This role is automatically created when a user creates a resource data sync in
      # Amazon Web Services Systems Manager Explorer.) InvalidOrganizationalUnit (You specified or selected
      # an invalid unit in the resource data sync configuration.) TrustedAccessDisabled (You disabled
      # Systems Manager access in the organization in Organizations.)

      struct ResourceDataSyncSourceWithState
        include JSON::Serializable

        # The field name in SyncSource for the ResourceDataSyncAwsOrganizationsSource type.

        @[JSON::Field(key: "AwsOrganizationsSource")]
        getter aws_organizations_source : Types::ResourceDataSyncAwsOrganizationsSource?

        # When you create a resource data sync, if you choose one of the Organizations options, then Systems
        # Manager automatically enables all OpsData sources in the selected Amazon Web Services Regions for
        # all Amazon Web Services accounts in your organization (or in the selected organization units). For
        # more information, see Setting up Systems Manager Explorer to display data from multiple accounts and
        # Regions in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "EnableAllOpsDataSources")]
        getter enable_all_ops_data_sources : Bool?

        # Whether to automatically synchronize and aggregate data from new Amazon Web Services Regions when
        # those Regions come online.

        @[JSON::Field(key: "IncludeFutureRegions")]
        getter include_future_regions : Bool?

        # The SyncSource Amazon Web Services Regions included in the resource data sync.

        @[JSON::Field(key: "SourceRegions")]
        getter source_regions : Array(String)?

        # The type of data source for the resource data sync. SourceType is either AwsOrganizations (if an
        # organization is present in Organizations) or singleAccountMultiRegions .

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The data type name for including resource data sync state. There are four sync states:
        # OrganizationNotExists : Your organization doesn't exist. NoPermissions : The system can't locate the
        # service-linked role. This role is automatically created when a user creates a resource data sync in
        # Explorer. InvalidOrganizationalUnit : You specified or selected an invalid unit in the resource data
        # sync configuration. TrustedAccessDisabled : You disabled Systems Manager access in the organization
        # in Organizations.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @aws_organizations_source : Types::ResourceDataSyncAwsOrganizationsSource? = nil,
          @enable_all_ops_data_sources : Bool? = nil,
          @include_future_regions : Bool? = nil,
          @source_regions : Array(String)? = nil,
          @source_type : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Error returned if an attempt is made to delete a patch baseline that is registered for a patch
      # group.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Error returned when the caller has exceeded the default resource quotas. For example, too many
      # maintenance windows or patch baselines have been created. For information about resource quotas in
      # Systems Manager, see Systems Manager service quotas in the Amazon Web Services General Reference .

      struct ResourceLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified parameter to be shared could not be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The hash provided in the call doesn't match the stored hash. This exception is thrown when trying to
      # update an obsolete policy version or when multiple requests to update a policy are sent.

      struct ResourcePolicyConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more parameters specified for the call aren't valid. Verify the parameters and their values
      # and try again.

      struct ResourcePolicyInvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "ParameterNames")]
        getter parameter_names : Array(String)?

        def initialize(
          @message : String? = nil,
          @parameter_names : Array(String)? = nil
        )
        end
      end

      # The PutResourcePolicy API action enforces two limits. A policy can't be greater than 1024 bytes in
      # size. And only one policy can be attached to OpsItemGroup . Verify these limits and try again.

      struct ResourcePolicyLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Limit")]
        getter limit : Int32?


        @[JSON::Field(key: "LimitType")]
        getter limit_type : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @limit : Int32? = nil,
          @limit_type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # No policies with the specified policy ID and hash could be found.

      struct ResourcePolicyNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The inventory item result attribute.

      struct ResultAttribute
        include JSON::Serializable

        # Name of the inventory item type. Valid value: AWS:InstanceInformation . Default Value:
        # AWS:InstanceInformation .

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        def initialize(
          @type_name : String
        )
        end
      end


      struct ResumeSessionRequest
        include JSON::Serializable

        # The ID of the disconnected session to resume.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end


      struct ResumeSessionResponse
        include JSON::Serializable

        # The ID of the session.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # A URL back to SSM Agent on the managed node that the Session Manager client uses to send commands
        # and receive output from the managed node. Format: wss://ssmmessages. region
        # .amazonaws.com/v1/data-channel/ session-id ?stream=(input|output) . region represents the Region
        # identifier for an Amazon Web Services Region supported by Amazon Web Services Systems Manager, such
        # as us-east-2 for the US East (Ohio) Region. For a list of supported region values, see the Region
        # column in Systems Manager service endpoints in the Amazon Web Services General Reference .
        # session-id represents the ID of a Session Manager session, such as 1a2b3c4dEXAMPLE .

        @[JSON::Field(key: "StreamUrl")]
        getter stream_url : String?

        # An encrypted token value containing session and caller information. Used to authenticate the
        # connection to the managed node.

        @[JSON::Field(key: "TokenValue")]
        getter token_value : String?

        def initialize(
          @session_id : String? = nil,
          @stream_url : String? = nil,
          @token_value : String? = nil
        )
        end
      end

      # Information about the result of a document review request.

      struct ReviewInformation
        include JSON::Serializable

        # The time that the reviewer took action on the document review request.

        @[JSON::Field(key: "ReviewedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter reviewed_time : Time?

        # The reviewer assigned to take action on the document review request.

        @[JSON::Field(key: "Reviewer")]
        getter reviewer : String?

        # The current status of the document review request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @reviewed_time : Time? = nil,
          @reviewer : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about an Automation runbook used in a runbook workflow in Change Manager. The Automation
      # runbooks specified for the runbook workflow can't run until all required approvals for the change
      # request have been received.

      struct Runbook
        include JSON::Serializable

        # The name of the Automation runbook used in a runbook workflow.

        @[JSON::Field(key: "DocumentName")]
        getter document_name : String

        # The version of the Automation runbook used in a runbook workflow.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The MaxConcurrency value specified by the user when the operation started, indicating the maximum
        # number of resources that the runbook operation can run on at the same time.

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The MaxErrors value specified by the user when the execution started, indicating the maximum number
        # of errors that can occur during the operation before the updates are stopped or rolled back.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # The key-value map of execution parameters, which were supplied when calling
        # StartChangeRequestExecution .

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # Information about the Amazon Web Services Regions and Amazon Web Services accounts targeted by the
        # current Runbook operation.

        @[JSON::Field(key: "TargetLocations")]
        getter target_locations : Array(Types::TargetLocation)?

        # A key-value mapping of runbook parameters to target resources. Both Targets and TargetMaps can't be
        # specified together.

        @[JSON::Field(key: "TargetMaps")]
        getter target_maps : Array(Hash(String, Array(String)))?

        # The name of the parameter used as the target resource for the rate-controlled runbook workflow.
        # Required if you specify Targets .

        @[JSON::Field(key: "TargetParameterName")]
        getter target_parameter_name : String?

        # A key-value mapping to target resources that the runbook operation performs tasks on. Required if
        # you specify TargetParameterName .

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        def initialize(
          @document_name : String,
          @document_version : String? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @target_locations : Array(Types::TargetLocation)? = nil,
          @target_maps : Array(Hash(String, Array(String)))? = nil,
          @target_parameter_name : String? = nil,
          @targets : Array(Types::Target)? = nil
        )
        end
      end

      # An S3 bucket where you want to store the results of this request.

      struct S3OutputLocation
        include JSON::Serializable

        # The name of the S3 bucket.

        @[JSON::Field(key: "OutputS3BucketName")]
        getter output_s3_bucket_name : String?

        # The S3 bucket subfolder.

        @[JSON::Field(key: "OutputS3KeyPrefix")]
        getter output_s3_key_prefix : String?

        # The Amazon Web Services Region of the S3 bucket.

        @[JSON::Field(key: "OutputS3Region")]
        getter output_s3_region : String?

        def initialize(
          @output_s3_bucket_name : String? = nil,
          @output_s3_key_prefix : String? = nil,
          @output_s3_region : String? = nil
        )
        end
      end

      # A URL for the Amazon Web Services Systems Manager (Systems Manager) bucket where you want to store
      # the results of this request.

      struct S3OutputUrl
        include JSON::Serializable

        # A URL for an S3 bucket where you want to store the results of this request.

        @[JSON::Field(key: "OutputUrl")]
        getter output_url : String?

        def initialize(
          @output_url : String? = nil
        )
        end
      end

      # Information about a scheduled execution for a maintenance window.

      struct ScheduledWindowExecution
        include JSON::Serializable

        # The time, in ISO-8601 Extended format, that the maintenance window is scheduled to be run.

        @[JSON::Field(key: "ExecutionTime")]
        getter execution_time : String?

        # The name of the maintenance window to be run.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the maintenance window to be run.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        def initialize(
          @execution_time : String? = nil,
          @name : String? = nil,
          @window_id : String? = nil
        )
        end
      end


      struct SendAutomationSignalRequest
        include JSON::Serializable

        # The unique identifier for an existing Automation execution that you want to send the signal to.

        @[JSON::Field(key: "AutomationExecutionId")]
        getter automation_execution_id : String

        # The type of signal to send to an Automation execution.

        @[JSON::Field(key: "SignalType")]
        getter signal_type : String

        # The data sent with the signal. The data schema depends on the type of signal used in the request.
        # For Approve and Reject signal types, the payload is an optional comment that you can send with the
        # signal type. For example: Comment="Looks good" For StartStep and Resume signal types, you must send
        # the name of the Automation step to start or resume as the payload. For example: StepName="step1" For
        # the StopStep signal type, you must send the step execution ID as the payload. For example:
        # StepExecutionId="97fff367-fc5a-4299-aed8-0123456789ab"

        @[JSON::Field(key: "Payload")]
        getter payload : Hash(String, Array(String))?

        def initialize(
          @automation_execution_id : String,
          @signal_type : String,
          @payload : Hash(String, Array(String))? = nil
        )
        end
      end


      struct SendAutomationSignalResult
        include JSON::Serializable

        def initialize
        end
      end


      struct SendCommandRequest
        include JSON::Serializable

        # The name of the Amazon Web Services Systems Manager document (SSM document) to run. This can be a
        # public document or a custom document. To run a shared document belonging to another account, specify
        # the document Amazon Resource Name (ARN). For more information about how to use shared documents, see
        # Sharing SSM documents in the Amazon Web Services Systems Manager User Guide . If you specify a
        # document name or ARN that hasn't been shared with your account, you receive an InvalidDocument
        # error.

        @[JSON::Field(key: "DocumentName")]
        getter document_name : String

        # The CloudWatch alarm you want to apply to your command.

        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # Enables Amazon Web Services Systems Manager to send Run Command output to Amazon CloudWatch Logs.
        # Run Command is a tool in Amazon Web Services Systems Manager.

        @[JSON::Field(key: "CloudWatchOutputConfig")]
        getter cloud_watch_output_config : Types::CloudWatchOutputConfig?

        # User-specified information about the command, such as a brief description of what the command should
        # do.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The Sha256 or Sha1 hash created by the system when the document was created. Sha1 hashes have been
        # deprecated.

        @[JSON::Field(key: "DocumentHash")]
        getter document_hash : String?

        # Sha256 or Sha1. Sha1 hashes have been deprecated.

        @[JSON::Field(key: "DocumentHashType")]
        getter document_hash_type : String?

        # The SSM document version to use in the request. You can specify $DEFAULT, $LATEST, or a specific
        # version number. If you run commands by using the Command Line Interface (Amazon Web Services CLI),
        # then you must escape the first two options by using a backslash. If you specify a version number,
        # then you don't need to use the backslash. For example: --document-version "\$DEFAULT"
        # --document-version "\$LATEST" --document-version "3"

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The IDs of the managed nodes where the command should run. Specifying managed node IDs is most
        # useful when you are targeting a limited number of managed nodes, though you can specify up to 50
        # IDs. To target a larger number of managed nodes, or if you prefer not to list individual node IDs,
        # we recommend using the Targets option instead. Using Targets , which accepts tag key-value pairs to
        # identify the managed nodes to send commands to, you can a send command to tens, hundreds, or
        # thousands of nodes at once. For more information about how to use targets, see Run commands at scale
        # in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)?

        # (Optional) The maximum number of managed nodes that are allowed to run the command at the same time.
        # You can specify a number such as 10 or a percentage such as 10%. The default value is 50 . For more
        # information about how to use MaxConcurrency , see Using concurrency controls in the Amazon Web
        # Services Systems Manager User Guide .

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The maximum number of errors allowed without the command failing. When the command fails one more
        # time beyond the value of MaxErrors , the systems stops sending the command to additional targets.
        # You can specify a number like 10 or a percentage like 10%. The default value is 0 . For more
        # information about how to use MaxErrors , see Using error controls in the Amazon Web Services Systems
        # Manager User Guide .

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # Configurations for sending notifications.

        @[JSON::Field(key: "NotificationConfig")]
        getter notification_config : Types::NotificationConfig?

        # The name of the S3 bucket where command execution responses should be stored.

        @[JSON::Field(key: "OutputS3BucketName")]
        getter output_s3_bucket_name : String?

        # The directory structure within the S3 bucket where the responses should be stored.

        @[JSON::Field(key: "OutputS3KeyPrefix")]
        getter output_s3_key_prefix : String?

        # (Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Systems
        # Manager automatically determines the Amazon Web Services Region of the S3 bucket.

        @[JSON::Field(key: "OutputS3Region")]
        getter output_s3_region : String?

        # The required and optional parameters specified in the document being run.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # The ARN of the Identity and Access Management (IAM) service role to use to publish Amazon Simple
        # Notification Service (Amazon SNS) notifications for Run Command commands. This role must provide the
        # sns:Publish permission for your notification topic. For information about creating and using this
        # service role, see Monitoring Systems Manager status changes using Amazon SNS notifications in the
        # Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "ServiceRoleArn")]
        getter service_role_arn : String?

        # An array of search criteria that targets managed nodes using a Key,Value combination that you
        # specify. Specifying targets is most useful when you want to send a command to a large number of
        # managed nodes at once. Using Targets , which accepts tag key-value pairs to identify managed nodes,
        # you can send a command to tens, hundreds, or thousands of nodes at once. To send a command to a
        # smaller number of managed nodes, you can use the InstanceIds option instead. For more information
        # about how to use targets, see Run commands at scale in the Amazon Web Services Systems Manager User
        # Guide .

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # If this time is reached and the command hasn't already started running, it won't run.

        @[JSON::Field(key: "TimeoutSeconds")]
        getter timeout_seconds : Int32?

        def initialize(
          @document_name : String,
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @cloud_watch_output_config : Types::CloudWatchOutputConfig? = nil,
          @comment : String? = nil,
          @document_hash : String? = nil,
          @document_hash_type : String? = nil,
          @document_version : String? = nil,
          @instance_ids : Array(String)? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @notification_config : Types::NotificationConfig? = nil,
          @output_s3_bucket_name : String? = nil,
          @output_s3_key_prefix : String? = nil,
          @output_s3_region : String? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @service_role_arn : String? = nil,
          @targets : Array(Types::Target)? = nil,
          @timeout_seconds : Int32? = nil
        )
        end
      end


      struct SendCommandResult
        include JSON::Serializable

        # The request as it was received by Systems Manager. Also provides the command ID which can be used
        # future references to this request.

        @[JSON::Field(key: "Command")]
        getter command : Types::Command?

        def initialize(
          @command : Types::Command? = nil
        )
        end
      end

      # The request exceeds the service quota. Service quotas, also referred to as limits, are the maximum
      # number of service resources or operations for your Amazon Web Services account.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The quota code recognized by the Amazon Web Services Service Quotas service.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # The code for the Amazon Web Services service that owns the quota.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # The unique ID of the resource referenced in the failed request.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The resource type of the resource referenced in the failed request.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @quota_code : String,
          @service_code : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The service setting data structure. ServiceSetting is an account-level setting for an Amazon Web
      # Services service. This setting defines how a user interacts with or uses a service or a feature of a
      # service. For example, if an Amazon Web Services service charges money to the account based on
      # feature or service usage, then the Amazon Web Services service team might create a default setting
      # of "false". This means the user can't use this feature unless they change the setting to "true" and
      # intentionally opt in for a paid feature. Services map a SettingId object to a setting value. Amazon
      # Web Services services teams define the default value for a SettingId . You can't create a new
      # SettingId , but you can overwrite the default value if you have the ssm:UpdateServiceSetting
      # permission for the setting. Use the UpdateServiceSetting API operation to change the default
      # setting. Or, use the ResetServiceSetting to change the value back to the original value defined by
      # the Amazon Web Services service team.

      struct ServiceSetting
        include JSON::Serializable

        # The ARN of the service setting.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The last time the service setting was modified.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # The ARN of the last modified user. This field is populated only if the setting value was
        # overwritten.

        @[JSON::Field(key: "LastModifiedUser")]
        getter last_modified_user : String?

        # The ID of the service setting.

        @[JSON::Field(key: "SettingId")]
        getter setting_id : String?

        # The value of the service setting.

        @[JSON::Field(key: "SettingValue")]
        getter setting_value : String?

        # The status of the service setting. The value can be Default, Customized or PendingUpdate. Default:
        # The current setting uses a default value provisioned by the Amazon Web Services service team.
        # Customized: The current setting use a custom value specified by the customer. PendingUpdate: The
        # current setting uses a default or custom value, but a setting change request is pending approval.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @last_modified_date : Time? = nil,
          @last_modified_user : String? = nil,
          @setting_id : String? = nil,
          @setting_value : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The specified service setting wasn't found. Either the service name or the setting hasn't been
      # provisioned by the Amazon Web Services service team.

      struct ServiceSettingNotFound
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a Session Manager connection to a managed node.

      struct Session
        include JSON::Serializable

        # Standard access type is the default for Session Manager sessions. JustInTime is the access type for
        # Just-in-time node access .

        @[JSON::Field(key: "AccessType")]
        getter access_type : String?

        # Reserved for future use.

        @[JSON::Field(key: "Details")]
        getter details : String?

        # The name of the Session Manager SSM document used to define the parameters and plugin settings for
        # the session. For example, SSM-SessionManagerRunShell .

        @[JSON::Field(key: "DocumentName")]
        getter document_name : String?

        # The date and time, in ISO-8601 Extended format, when the session was terminated.

        @[JSON::Field(key: "EndDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_date : Time?

        # The maximum duration of a session before it terminates.

        @[JSON::Field(key: "MaxSessionDuration")]
        getter max_session_duration : String?

        # Reserved for future use.

        @[JSON::Field(key: "OutputUrl")]
        getter output_url : Types::SessionManagerOutputUrl?

        # The ID of the Amazon Web Services user that started the session.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The reason for connecting to the instance.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The ID of the session.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # The date and time, in ISO-8601 Extended format, when the session began.

        @[JSON::Field(key: "StartDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_date : Time?

        # The status of the session. For example, "Connected" or "Terminated".

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The managed node that the Session Manager session connected to.

        @[JSON::Field(key: "Target")]
        getter target : String?

        def initialize(
          @access_type : String? = nil,
          @details : String? = nil,
          @document_name : String? = nil,
          @end_date : Time? = nil,
          @max_session_duration : String? = nil,
          @output_url : Types::SessionManagerOutputUrl? = nil,
          @owner : String? = nil,
          @reason : String? = nil,
          @session_id : String? = nil,
          @start_date : Time? = nil,
          @status : String? = nil,
          @target : String? = nil
        )
        end
      end

      # Describes a filter for Session Manager information.

      struct SessionFilter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "key")]
        getter key : String

        # The filter value. Valid values for each filter key are as follows: InvokedAfter: Specify a timestamp
        # to limit your results. For example, specify 2024-08-29T00:00:00Z to see sessions that started August
        # 29, 2024, and later. InvokedBefore: Specify a timestamp to limit your results. For example, specify
        # 2024-08-29T00:00:00Z to see sessions that started before August 29, 2024. Target: Specify a managed
        # node to which session connections have been made. Owner: Specify an Amazon Web Services user to see
        # a list of sessions started by that user. Status: Specify a valid session status to see a list of all
        # sessions with that status. Status values you can specify include: Connected Connecting Disconnected
        # Terminated Terminating Failed SessionId: Specify a session ID to return details about the session.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Reserved for future use.

      struct SessionManagerOutputUrl
        include JSON::Serializable

        # Reserved for future use.

        @[JSON::Field(key: "CloudWatchOutputUrl")]
        getter cloud_watch_output_url : String?

        # Reserved for future use.

        @[JSON::Field(key: "S3OutputUrl")]
        getter s3_output_url : String?

        def initialize(
          @cloud_watch_output_url : String? = nil,
          @s3_output_url : String? = nil
        )
        end
      end

      # The number of managed nodes found for each patch severity level defined in the request filter.

      struct SeveritySummary
        include JSON::Serializable

        # The total number of resources or compliance items that have a severity level of Critical . Critical
        # severity is determined by the organization that published the compliance items.

        @[JSON::Field(key: "CriticalCount")]
        getter critical_count : Int32?

        # The total number of resources or compliance items that have a severity level of high. High severity
        # is determined by the organization that published the compliance items.

        @[JSON::Field(key: "HighCount")]
        getter high_count : Int32?

        # The total number of resources or compliance items that have a severity level of informational.
        # Informational severity is determined by the organization that published the compliance items.

        @[JSON::Field(key: "InformationalCount")]
        getter informational_count : Int32?

        # The total number of resources or compliance items that have a severity level of low. Low severity is
        # determined by the organization that published the compliance items.

        @[JSON::Field(key: "LowCount")]
        getter low_count : Int32?

        # The total number of resources or compliance items that have a severity level of medium. Medium
        # severity is determined by the organization that published the compliance items.

        @[JSON::Field(key: "MediumCount")]
        getter medium_count : Int32?

        # The total number of resources or compliance items that have a severity level of unspecified.
        # Unspecified severity is determined by the organization that published the compliance items.

        @[JSON::Field(key: "UnspecifiedCount")]
        getter unspecified_count : Int32?

        def initialize(
          @critical_count : Int32? = nil,
          @high_count : Int32? = nil,
          @informational_count : Int32? = nil,
          @low_count : Int32? = nil,
          @medium_count : Int32? = nil,
          @unspecified_count : Int32? = nil
        )
        end
      end


      struct StartAccessRequestRequest
        include JSON::Serializable

        # A brief description explaining why you are requesting access to the node.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        # The node you are requesting access to.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)

        # Key-value pairs of metadata you want to assign to the access request.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @reason : String,
          @targets : Array(Types::Target),
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct StartAccessRequestResponse
        include JSON::Serializable

        # The ID of the access request.

        @[JSON::Field(key: "AccessRequestId")]
        getter access_request_id : String?

        def initialize(
          @access_request_id : String? = nil
        )
        end
      end


      struct StartAssociationsOnceRequest
        include JSON::Serializable

        # The association IDs that you want to run immediately and only one time.

        @[JSON::Field(key: "AssociationIds")]
        getter association_ids : Array(String)

        def initialize(
          @association_ids : Array(String)
        )
        end
      end


      struct StartAssociationsOnceResult
        include JSON::Serializable

        def initialize
        end
      end


      struct StartAutomationExecutionRequest
        include JSON::Serializable

        # The name of the SSM document to run. This can be a public document or a custom document. To run a
        # shared document belonging to another account, specify the document ARN. For more information about
        # how to use shared documents, see Sharing SSM documents in the Amazon Web Services Systems Manager
        # User Guide .

        @[JSON::Field(key: "DocumentName")]
        getter document_name : String

        # The CloudWatch alarm you want to apply to your automation.

        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # User-provided idempotency token. The token must be unique, is case insensitive, enforces the UUID
        # format, and can't be reused.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The version of the Automation runbook to use for this execution.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The maximum number of targets allowed to run this task in parallel. You can specify a number, such
        # as 10, or a percentage, such as 10%. The default value is 10 . If both this parameter and the
        # TargetLocation:TargetsMaxConcurrency are supplied, TargetLocation:TargetsMaxConcurrency takes
        # precedence.

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The number of errors that are allowed before the system stops running the automation on additional
        # targets. You can specify either an absolute number of errors, for example 10, or a percentage of the
        # target set, for example 10%. If you specify 3, for example, the system stops running the automation
        # when the fourth error is received. If you specify 0, then the system stops running the automation on
        # additional targets after the first error result is returned. If you run an automation on 50
        # resources and set max-errors to 10%, then the system stops running the automation on additional
        # targets when the sixth error is received. Executions that are already running an automation when
        # max-errors is reached are allowed to complete, but some of these executions may fail as well. If you
        # need to ensure that there won't be more than max-errors failed executions, set max-concurrency to 1
        # so the executions proceed one at a time. If this parameter and the TargetLocation:TargetsMaxErrors
        # parameter are both supplied, TargetLocation:TargetsMaxErrors takes precedence.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # The execution mode of the automation. Valid modes include the following: Auto and Interactive. The
        # default mode is Auto.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # A key-value map of execution parameters, which match the declared parameters in the Automation
        # runbook.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # Optional metadata that you assign to a resource. You can specify a maximum of five tags for an
        # automation. Tags enable you to categorize a resource in different ways, such as by purpose, owner,
        # or environment. For example, you might want to tag an automation to identify an environment or
        # operating system. In this case, you could specify the following key-value pairs:
        # Key=environment,Value=test Key=OS,Value=Windows The Array Members maximum value is reported as 1000.
        # This number includes capacity reserved for internal operations. When calling the
        # StartAutomationExecution action, you can specify a maximum of 5 tags. You can, however, use the
        # AddTagsToResource action to add up to a total of 50 tags to an existing automation configuration.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A location is a combination of Amazon Web Services Regions and/or Amazon Web Services accounts where
        # you want to run the automation. Use this operation to start an automation in multiple Amazon Web
        # Services Regions and multiple Amazon Web Services accounts. For more information, see Running
        # automations in multiple Amazon Web Services Regions and accounts in the Amazon Web Services Systems
        # Manager User Guide .

        @[JSON::Field(key: "TargetLocations")]
        getter target_locations : Array(Types::TargetLocation)?

        # Specify a publicly accessible URL for a file that contains the TargetLocations body. Currently, only
        # files in presigned Amazon S3 buckets are supported.

        @[JSON::Field(key: "TargetLocationsURL")]
        getter target_locations_url : String?

        # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be
        # specified together.

        @[JSON::Field(key: "TargetMaps")]
        getter target_maps : Array(Hash(String, Array(String)))?

        # The name of the parameter used as the target resource for the rate-controlled execution. Required if
        # you specify targets.

        @[JSON::Field(key: "TargetParameterName")]
        getter target_parameter_name : String?

        # A key-value mapping to target resources. Required if you specify TargetParameterName. If both this
        # parameter and the TargetLocation:Targets parameter are supplied, TargetLocation:Targets takes
        # precedence.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        def initialize(
          @document_name : String,
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @client_token : String? = nil,
          @document_version : String? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @mode : String? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_locations : Array(Types::TargetLocation)? = nil,
          @target_locations_url : String? = nil,
          @target_maps : Array(Hash(String, Array(String)))? = nil,
          @target_parameter_name : String? = nil,
          @targets : Array(Types::Target)? = nil
        )
        end
      end


      struct StartAutomationExecutionResult
        include JSON::Serializable

        # The unique ID of a newly scheduled automation execution.

        @[JSON::Field(key: "AutomationExecutionId")]
        getter automation_execution_id : String?

        def initialize(
          @automation_execution_id : String? = nil
        )
        end
      end


      struct StartChangeRequestExecutionRequest
        include JSON::Serializable

        # The name of the change template document to run during the runbook workflow.

        @[JSON::Field(key: "DocumentName")]
        getter document_name : String

        # Information about the Automation runbooks that are run during the runbook workflow. The Automation
        # runbooks specified for the runbook workflow can't run until all required approvals for the change
        # request have been received.

        @[JSON::Field(key: "Runbooks")]
        getter runbooks : Array(Types::Runbook)

        # Indicates whether the change request can be approved automatically without the need for manual
        # approvals. If AutoApprovable is enabled in a change template, then setting AutoApprove to true in
        # StartChangeRequestExecution creates a change request that bypasses approver review. Change Calendar
        # restrictions are not bypassed in this scenario. If the state of an associated calendar is CLOSED ,
        # change freeze approvers must still grant permission for this change request to run. If they don't,
        # the change won't be processed until the calendar state is again OPEN .

        @[JSON::Field(key: "AutoApprove")]
        getter auto_approve : Bool?

        # User-provided details about the change. If no details are provided, content specified in the
        # Template information section of the associated change template is added.

        @[JSON::Field(key: "ChangeDetails")]
        getter change_details : String?

        # The name of the change request associated with the runbook workflow to be run.

        @[JSON::Field(key: "ChangeRequestName")]
        getter change_request_name : String?

        # The user-provided idempotency token. The token must be unique, is case insensitive, enforces the
        # UUID format, and can't be reused.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The version of the change template document to run during the runbook workflow.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # A key-value map of parameters that match the declared parameters in the change template document.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # The time that the requester expects the runbook workflow related to the change request to complete.
        # The time is an estimate only that the requester provides for reviewers.

        @[JSON::Field(key: "ScheduledEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter scheduled_end_time : Time?

        # The date and time specified in the change request to run the Automation runbooks. The Automation
        # runbooks specified for the runbook workflow can't run until all required approvals for the change
        # request have been received.

        @[JSON::Field(key: "ScheduledTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter scheduled_time : Time?

        # Optional metadata that you assign to a resource. You can specify a maximum of five tags for a change
        # request. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or
        # environment. For example, you might want to tag a change request to identify an environment or
        # target Amazon Web Services Region. In this case, you could specify the following key-value pairs:
        # Key=Environment,Value=Production Key=Region,Value=us-east-2 The Array Members maximum value is
        # reported as 1000. This number includes capacity reserved for internal operations. When calling the
        # StartChangeRequestExecution action, you can specify a maximum of 5 tags. You can, however, use the
        # AddTagsToResource action to add up to a total of 50 tags to an existing change request
        # configuration.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @document_name : String,
          @runbooks : Array(Types::Runbook),
          @auto_approve : Bool? = nil,
          @change_details : String? = nil,
          @change_request_name : String? = nil,
          @client_token : String? = nil,
          @document_version : String? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @scheduled_end_time : Time? = nil,
          @scheduled_time : Time? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct StartChangeRequestExecutionResult
        include JSON::Serializable

        # The unique ID of a runbook workflow operation. (A runbook workflow is a type of Automation
        # operation.)

        @[JSON::Field(key: "AutomationExecutionId")]
        getter automation_execution_id : String?

        def initialize(
          @automation_execution_id : String? = nil
        )
        end
      end


      struct StartExecutionPreviewRequest
        include JSON::Serializable

        # The name of the Automation runbook to run. The result of the execution preview indicates what the
        # impact would be of running this runbook.

        @[JSON::Field(key: "DocumentName")]
        getter document_name : String

        # The version of the Automation runbook to run. The default value is $DEFAULT .

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # Information about the inputs that can be specified for the preview operation.

        @[JSON::Field(key: "ExecutionInputs")]
        getter execution_inputs : Types::ExecutionInputs?

        def initialize(
          @document_name : String,
          @document_version : String? = nil,
          @execution_inputs : Types::ExecutionInputs? = nil
        )
        end
      end


      struct StartExecutionPreviewResponse
        include JSON::Serializable

        # The ID of the execution preview generated by the system.

        @[JSON::Field(key: "ExecutionPreviewId")]
        getter execution_preview_id : String?

        def initialize(
          @execution_preview_id : String? = nil
        )
        end
      end


      struct StartSessionRequest
        include JSON::Serializable

        # The managed node to connect to for the session.

        @[JSON::Field(key: "Target")]
        getter target : String

        # The name of the SSM document you want to use to define the type of session, input parameters, or
        # preferences for the session. For example, SSM-SessionManagerRunShell . You can call the GetDocument
        # API to verify the document exists before attempting to start a session. If no document name is
        # provided, a shell to the managed node is launched by default. For more information, see Start a
        # session in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "DocumentName")]
        getter document_name : String?

        # The values you want to specify for the parameters defined in the Session document. For more
        # information about these parameters, see Create a Session Manager preferences document in the Amazon
        # Web Services Systems Manager User Guide .

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # The reason for connecting to the instance. This value is included in the details for the Amazon
        # CloudWatch Events event created when you start the session.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @target : String,
          @document_name : String? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @reason : String? = nil
        )
        end
      end


      struct StartSessionResponse
        include JSON::Serializable

        # The ID of the session.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # A URL back to SSM Agent on the managed node that the Session Manager client uses to send commands
        # and receive output from the node. Format: wss://ssmmessages. region .amazonaws.com/v1/data-channel/
        # session-id ?stream=(input|output) region represents the Region identifier for an Amazon Web Services
        # Region supported by Amazon Web Services Systems Manager, such as us-east-2 for the US East (Ohio)
        # Region. For a list of supported region values, see the Region column in Systems Manager service
        # endpoints in the Amazon Web Services General Reference . session-id represents the ID of a Session
        # Manager session, such as 1a2b3c4dEXAMPLE .

        @[JSON::Field(key: "StreamUrl")]
        getter stream_url : String?

        # An encrypted token value containing session and caller information. This token is used to
        # authenticate the connection to the managed node, and is valid only long enough to ensure the
        # connection is successful. Never share your session's token.

        @[JSON::Field(key: "TokenValue")]
        getter token_value : String?

        def initialize(
          @session_id : String? = nil,
          @stream_url : String? = nil,
          @token_value : String? = nil
        )
        end
      end

      # The updated status is the same as the current status.

      struct StatusUnchanged
        include JSON::Serializable

        def initialize
        end
      end

      # Detailed information about an the execution state of an Automation step.

      struct StepExecution
        include JSON::Serializable

        # The action this step performs. The action determines the behavior of the step.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # If a step has finished execution, this contains the time the execution ended. If the step hasn't yet
        # concluded, this field isn't populated.

        @[JSON::Field(key: "ExecutionEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter execution_end_time : Time?

        # If a step has begun execution, this contains the time the step started. If the step is in Pending
        # status, this field isn't populated.

        @[JSON::Field(key: "ExecutionStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter execution_start_time : Time?

        # Information about the Automation failure.

        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::FailureDetails?

        # If a step failed, this message explains why the execution failed.

        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        # Fully-resolved values passed into the step before execution.

        @[JSON::Field(key: "Inputs")]
        getter inputs : Hash(String, String)?

        # The flag which can be used to help decide whether the failure of current step leads to the
        # Automation failure.

        @[JSON::Field(key: "IsCritical")]
        getter is_critical : Bool?

        # The flag which can be used to end automation no matter whether the step succeeds or fails.

        @[JSON::Field(key: "IsEnd")]
        getter is_end : Bool?

        # The maximum number of tries to run the action of the step. The default value is 1 .

        @[JSON::Field(key: "MaxAttempts")]
        getter max_attempts : Int32?

        # The next step after the step succeeds.

        @[JSON::Field(key: "NextStep")]
        getter next_step : String?

        # The action to take if the step fails. The default value is Abort .

        @[JSON::Field(key: "OnFailure")]
        getter on_failure : String?

        # Returned values from the execution of the step.

        @[JSON::Field(key: "Outputs")]
        getter outputs : Hash(String, Array(String))?

        # A user-specified list of parameters to override when running a step.

        @[JSON::Field(key: "OverriddenParameters")]
        getter overridden_parameters : Hash(String, Array(String))?

        # Information about the parent step.

        @[JSON::Field(key: "ParentStepDetails")]
        getter parent_step_details : Types::ParentStepDetails?

        # A message associated with the response code for an execution.

        @[JSON::Field(key: "Response")]
        getter response : String?

        # The response code returned by the execution of the step.

        @[JSON::Field(key: "ResponseCode")]
        getter response_code : String?

        # The unique ID of a step execution.

        @[JSON::Field(key: "StepExecutionId")]
        getter step_execution_id : String?

        # The name of this execution step.

        @[JSON::Field(key: "StepName")]
        getter step_name : String?

        # The execution status for this step.

        @[JSON::Field(key: "StepStatus")]
        getter step_status : String?

        # The combination of Amazon Web Services Regions and Amazon Web Services accounts targeted by the
        # current Automation execution.

        @[JSON::Field(key: "TargetLocation")]
        getter target_location : Types::TargetLocation?

        # The targets for the step execution.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The timeout seconds of the step.

        @[JSON::Field(key: "TimeoutSeconds")]
        getter timeout_seconds : Int64?

        # The CloudWatch alarms that were invoked by the automation.

        @[JSON::Field(key: "TriggeredAlarms")]
        getter triggered_alarms : Array(Types::AlarmStateInformation)?

        # Strategies used when step fails, we support Continue and Abort. Abort will fail the automation when
        # the step fails. Continue will ignore the failure of current step and allow automation to run the
        # next step. With conditional branching, we add step:stepName to support the automation to go to
        # another specific step.

        @[JSON::Field(key: "ValidNextSteps")]
        getter valid_next_steps : Array(String)?

        def initialize(
          @action : String? = nil,
          @execution_end_time : Time? = nil,
          @execution_start_time : Time? = nil,
          @failure_details : Types::FailureDetails? = nil,
          @failure_message : String? = nil,
          @inputs : Hash(String, String)? = nil,
          @is_critical : Bool? = nil,
          @is_end : Bool? = nil,
          @max_attempts : Int32? = nil,
          @next_step : String? = nil,
          @on_failure : String? = nil,
          @outputs : Hash(String, Array(String))? = nil,
          @overridden_parameters : Hash(String, Array(String))? = nil,
          @parent_step_details : Types::ParentStepDetails? = nil,
          @response : String? = nil,
          @response_code : String? = nil,
          @step_execution_id : String? = nil,
          @step_name : String? = nil,
          @step_status : String? = nil,
          @target_location : Types::TargetLocation? = nil,
          @targets : Array(Types::Target)? = nil,
          @timeout_seconds : Int64? = nil,
          @triggered_alarms : Array(Types::AlarmStateInformation)? = nil,
          @valid_next_steps : Array(String)? = nil
        )
        end
      end

      # A filter to limit the amount of step execution information returned by the call.

      struct StepExecutionFilter
        include JSON::Serializable

        # One or more keys to limit the results.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The values of the filter key.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @values : Array(String)
        )
        end
      end


      struct StopAutomationExecutionRequest
        include JSON::Serializable

        # The execution ID of the Automation to stop.

        @[JSON::Field(key: "AutomationExecutionId")]
        getter automation_execution_id : String

        # The stop request type. Valid types include the following: Cancel and Complete. The default type is
        # Cancel.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @automation_execution_id : String,
          @type : String? = nil
        )
        end
      end


      struct StopAutomationExecutionResult
        include JSON::Serializable

        def initialize
        end
      end

      # The sub-type count exceeded the limit for the inventory type.

      struct SubTypeCountLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Metadata that you assign to your Amazon Web Services resources. Tags enable you to categorize your
      # resources in different ways, for example, by purpose, owner, or environment. In Amazon Web Services
      # Systems Manager, you can apply tags to Systems Manager documents (SSM documents), managed nodes,
      # maintenance windows, parameters, patch baselines, OpsItems, and OpsMetadata.

      struct Tag
        include JSON::Serializable

        # The name of the tag.

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

      # An array of search criteria that targets managed nodes using a key-value pair that you specify. One
      # or more targets must be specified for maintenance window Run Command-type tasks. Depending on the
      # task, targets are optional for other maintenance window task types (Automation, Lambda, and Step
      # Functions). For more information about running tasks that don't specify targets, see Registering
      # maintenance window tasks without targets in the Amazon Web Services Systems Manager User Guide .
      # Supported formats include the following. For all Systems Manager tools:
      # Key=tag-key,Values=tag-value-1,tag-value-2 For Automation and Change Manager:
      # Key=tag:tag-key,Values=tag-value Key=ResourceGroup,Values=resource-group-name
      # Key=ParameterValues,Values=value-1,value-2,value-3 To target all instances in the Amazon Web
      # Services Region: Key=AWS::EC2::Instance,Values=* Key=InstanceIds,Values=* For Run Command and
      # Maintenance Windows: Key=InstanceIds,Values=instance-id-1,instance-id-2,instance-id-3
      # Key=tag:tag-key,Values=tag-value-1,tag-value-2 Key=resource-groups:Name,Values=resource-group-name
      # Additionally, Maintenance Windows support targeting resource types:
      # Key=resource-groups:ResourceTypeFilters,Values=resource-type-1,resource-type-2 For State Manager:
      # Key=InstanceIds,Values=instance-id-1,instance-id-2,instance-id-3
      # Key=tag:tag-key,Values=tag-value-1,tag-value-2 To target all instances in the Amazon Web Services
      # Region: Key=InstanceIds,Values=* For more information about how to send commands that target managed
      # nodes using Key,Value parameters, see Targeting multiple managed nodes in the Amazon Web Services
      # Systems Manager User Guide .

      struct Target
        include JSON::Serializable

        # User-defined criteria for sending commands that target managed nodes that meet the criteria.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # User-defined criteria that maps to Key . For example, if you specified tag:ServerRole , you could
        # specify value:WebServer to run a command on instances that include EC2 tags of ServerRole,WebServer
        # . Depending on the type of target, the maximum number of values for a key might be lower than the
        # global maximum of 50.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # You specified the Safe option for the DeregisterTargetFromMaintenanceWindow operation, but the
      # target is still referenced in a task.

      struct TargetInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The combination of Amazon Web Services Regions and Amazon Web Services accounts targeted by the
      # current Automation execution.

      struct TargetLocation
        include JSON::Serializable

        # The Amazon Web Services accounts targeted by the current Automation execution.

        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(String)?

        # Amazon Web Services accounts or organizational units to exclude as expanded targets.

        @[JSON::Field(key: "ExcludeAccounts")]
        getter exclude_accounts : Array(String)?

        # The Automation execution role used by the currently running Automation. If not specified, the
        # default value is AWS-SystemsManager-AutomationExecutionRole .

        @[JSON::Field(key: "ExecutionRoleName")]
        getter execution_role_name : String?

        # Indicates whether to include child organizational units (OUs) that are children of the targeted OUs.
        # The default is false . This parameter is not supported by State Manager.

        @[JSON::Field(key: "IncludeChildOrganizationUnits")]
        getter include_child_organization_units : Bool?

        # The Amazon Web Services Regions targeted by the current Automation execution.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?


        @[JSON::Field(key: "TargetLocationAlarmConfiguration")]
        getter target_location_alarm_configuration : Types::AlarmConfiguration?

        # The maximum number of Amazon Web Services Regions and Amazon Web Services accounts allowed to run
        # the Automation concurrently. TargetLocationMaxConcurrency has a default value of 1.

        @[JSON::Field(key: "TargetLocationMaxConcurrency")]
        getter target_location_max_concurrency : String?

        # The maximum number of errors allowed before the system stops queueing additional Automation
        # executions for the currently running Automation. TargetLocationMaxErrors has a default value of 0.

        @[JSON::Field(key: "TargetLocationMaxErrors")]
        getter target_location_max_errors : String?

        # A list of key-value mappings to target resources. If you specify values for this data type, you must
        # also specify a value for TargetParameterName . This Targets parameter takes precedence over the
        # StartAutomationExecution:Targets parameter if both are supplied.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The maximum number of targets allowed to run this task in parallel. This TargetsMaxConcurrency takes
        # precedence over the StartAutomationExecution:MaxConcurrency parameter if both are supplied.

        @[JSON::Field(key: "TargetsMaxConcurrency")]
        getter targets_max_concurrency : String?

        # The maximum number of errors that are allowed before the system stops running the automation on
        # additional targets. This TargetsMaxErrors parameter takes precedence over the
        # StartAutomationExecution:MaxErrors parameter if both are supplied.

        @[JSON::Field(key: "TargetsMaxErrors")]
        getter targets_max_errors : String?

        def initialize(
          @accounts : Array(String)? = nil,
          @exclude_accounts : Array(String)? = nil,
          @execution_role_name : String? = nil,
          @include_child_organization_units : Bool? = nil,
          @regions : Array(String)? = nil,
          @target_location_alarm_configuration : Types::AlarmConfiguration? = nil,
          @target_location_max_concurrency : String? = nil,
          @target_location_max_errors : String? = nil,
          @targets : Array(Types::Target)? = nil,
          @targets_max_concurrency : String? = nil,
          @targets_max_errors : String? = nil
        )
        end
      end

      # The specified target managed node for the session isn't fully configured for use with Session
      # Manager. For more information, see Setting up Session Manager in the Amazon Web Services Systems
      # Manager User Guide . This error is also returned if you attempt to start a session on a managed node
      # that is located in a different account or Region

      struct TargetNotConnected
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about the resources that would be included in the actual runbook execution, if it were
      # to be run.

      struct TargetPreview
        include JSON::Serializable

        # The number of resources of a certain type included in an execution preview.

        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # A type of resource that was included in the execution preview.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        def initialize(
          @count : Int32? = nil,
          @target_type : String? = nil
        )
        end
      end


      struct TerminateSessionRequest
        include JSON::Serializable

        # The ID of the session to terminate.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end


      struct TerminateSessionResponse
        include JSON::Serializable

        # The ID of the session that has been terminated.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        def initialize(
          @session_id : String? = nil
        )
        end
      end

      # The request or operation couldn't be performed because the service is throttling requests.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The quota code recognized by the Amazon Web Services Service Quotas service.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # The code for the Amazon Web Services service that owns the quota.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # The Targets parameter includes too many tags. Remove one or more tags and try the command again.

      struct TooManyTagsError
        include JSON::Serializable

        def initialize
        end
      end

      # There are concurrent updates for a resource that supports one update at a time.

      struct TooManyUpdates
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The size of inventory data has exceeded the total size limit for the resource.

      struct TotalSizeLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UnlabelParameterVersionRequest
        include JSON::Serializable

        # One or more labels to delete from the specified parameter version.

        @[JSON::Field(key: "Labels")]
        getter labels : Array(String)

        # The name of the parameter from which you want to delete one or more labels. You can't enter the
        # Amazon Resource Name (ARN) for a parameter, only the parameter name itself.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The specific version of the parameter which you want to delete one or more labels from. If it isn't
        # present, the call will fail.

        @[JSON::Field(key: "ParameterVersion")]
        getter parameter_version : Int64

        def initialize(
          @labels : Array(String),
          @name : String,
          @parameter_version : Int64
        )
        end
      end


      struct UnlabelParameterVersionResult
        include JSON::Serializable

        # The labels that aren't attached to the given parameter version.

        @[JSON::Field(key: "InvalidLabels")]
        getter invalid_labels : Array(String)?

        # A list of all labels deleted from the parameter.

        @[JSON::Field(key: "RemovedLabels")]
        getter removed_labels : Array(String)?

        def initialize(
          @invalid_labels : Array(String)? = nil,
          @removed_labels : Array(String)? = nil
        )
        end
      end

      # The calendar entry contained in the specified SSM document isn't supported.

      struct UnsupportedCalendarException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Patching for applications released by Microsoft is only available on EC2 instances and advanced
      # instances. To patch applications released by Microsoft on on-premises servers and VMs, you must
      # enable advanced instances. For more information, see Turning on the advanced-instances tier in the
      # Amazon Web Services Systems Manager User Guide .

      struct UnsupportedFeatureRequiredException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Context attribute that you specified for the InventoryItem isn't allowed for this inventory
      # type. You can only use the Context attribute with inventory types like AWS:ComplianceItem .

      struct UnsupportedInventoryItemContextException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @message : String? = nil,
          @type_name : String? = nil
        )
        end
      end

      # Inventory item type schema version has to match supported versions in the service. Check output of
      # GetInventorySchema to see the available schema version for each type.

      struct UnsupportedInventorySchemaVersionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operating systems you specified isn't supported, or the operation isn't supported for the
      # operating system.

      struct UnsupportedOperatingSystem
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This operation is not supported for the current account. You must first enable the Systems Manager
      # integrated experience in your account.

      struct UnsupportedOperationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The parameter type isn't supported.

      struct UnsupportedParameterType
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The document doesn't support the platform type of the given managed node IDs. For example, you sent
      # an document for a Windows managed node to a Linux node.

      struct UnsupportedPlatformType
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateAssociationRequest
        include JSON::Serializable

        # The ID of the association you want to update.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String


        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # By default, when you update an association, the system runs it immediately after it is updated and
        # then according to the schedule you specified. Specify true for ApplyOnlyAtCronInterval if you want
        # the association to run only according to the schedule you specified. If you chose this option when
        # you created an association and later you edit that association or you make changes to the Automation
        # runbook or SSM document on which that association is based, State Manager applies the association at
        # the next specified cron interval. For example, if you chose the Latest version of an SSM document
        # when you created an association and you edit the association by choosing a different document
        # version on the Documents page, State Manager applies the association at the next specified cron
        # interval if you previously set ApplyOnlyAtCronInterval to true . If this option wasn't selected,
        # State Manager immediately runs the association. For more information, see Understanding when
        # associations are applied to resources and About target updates with Automation runbooks in the
        # Amazon Web Services Systems Manager User Guide . This parameter isn't supported for rate
        # expressions. You can reset this parameter. To do so, specify the no-apply-only-at-cron-interval
        # parameter when you update the association from the command line. This parameter forces the
        # association to run immediately after updating it and according to the interval specified.

        @[JSON::Field(key: "ApplyOnlyAtCronInterval")]
        getter apply_only_at_cron_interval : Bool?

        # The name of the association that you want to update.

        @[JSON::Field(key: "AssociationName")]
        getter association_name : String?

        # This parameter is provided for concurrency control purposes. You must specify the latest association
        # version in the service. If you want to ensure that this request succeeds, either specify $LATEST ,
        # or omit this parameter.

        @[JSON::Field(key: "AssociationVersion")]
        getter association_version : String?

        # Choose the parameter that will define how your automation will branch out. This target is required
        # for associations that use an Automation runbook and target resources by using rate controls.
        # Automation is a tool in Amazon Web Services Systems Manager.

        @[JSON::Field(key: "AutomationTargetParameterName")]
        getter automation_target_parameter_name : String?

        # The names or Amazon Resource Names (ARNs) of the Change Calendar type documents you want to gate
        # your associations under. The associations only run when that change calendar is open. For more
        # information, see Amazon Web Services Systems Manager Change Calendar in the Amazon Web Services
        # Systems Manager User Guide .

        @[JSON::Field(key: "CalendarNames")]
        getter calendar_names : Array(String)?

        # The severity level to assign to the association.

        @[JSON::Field(key: "ComplianceSeverity")]
        getter compliance_severity : String?

        # The document version you want update for the association. State Manager doesn't support running
        # associations that use a new version of a document if that document is shared from another account.
        # State Manager always runs the default version of a document if shared from another account, even
        # though the Systems Manager console shows that a new version was processed. If you want to run an
        # association using a new version of a document shared form another account, you must set the document
        # version to default .

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # The number of hours the association can run before it is canceled. Duration applies to associations
        # that are currently running, and any pending and in progress commands on all targets. If a target was
        # taken offline for the association to run, it is made available again immediately, without a reboot.
        # The Duration parameter applies only when both these conditions are true: The association for which
        # you specify a duration is cancelable according to the parameters of the SSM command document or
        # Automation runbook associated with this execution. The command specifies the ApplyOnlyAtCronInterval
        # parameter, which means that the association doesn't run immediately after it is updated, but only
        # according to the specified schedule.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The maximum number of targets allowed to run the association at the same time. You can specify a
        # number, for example 10, or a percentage of the target set, for example 10%. The default value is
        # 100%, which means all targets run the association at the same time. If a new managed node starts and
        # attempts to run an association while Systems Manager is running MaxConcurrency associations, the
        # association is allowed to run. During the next association interval, the new managed node will
        # process its association within the limit specified for MaxConcurrency .

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The number of errors that are allowed before the system stops sending requests to run the
        # association on additional targets. You can specify either an absolute number of errors, for example
        # 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system
        # stops sending requests when the fourth error is received. If you specify 0, then the system stops
        # sending requests after the first error is returned. If you run an association on 50 managed nodes
        # and set MaxError to 10%, then the system stops sending the request when the sixth error is received.
        # Executions that are already running an association when MaxErrors is reached are allowed to
        # complete, but some of these executions may fail as well. If you need to ensure that there won't be
        # more than max-errors failed executions, set MaxConcurrency to 1 so that executions proceed one at a
        # time.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # The name of the SSM Command document or Automation runbook that contains the configuration
        # information for the managed node. You can specify Amazon Web Services-predefined documents,
        # documents you created, or a document that is shared with you from another account. For Systems
        # Manager document (SSM document) that are shared with you from other Amazon Web Services accounts,
        # you must specify the complete SSM document ARN, in the following format: arn:aws:ssm: region :
        # account-id :document/ document-name For example:
        # arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document For Amazon Web Services-predefined
        # documents and SSM documents you created in your account, you only need to specify the document name.
        # For example, AWS-ApplyPatchBaseline or My-Document .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An S3 bucket where you want to store the results of this request.

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : Types::InstanceAssociationOutputLocation?

        # The parameters you want to update for the association. If you create a parameter using Parameter
        # Store, a tool in Amazon Web Services Systems Manager, you can reference the parameter using
        # {{ssm:parameter-name}} .

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Array(String))?

        # The cron expression used to schedule the association that you want to update.

        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # Number of days to wait after the scheduled day to run an association. For example, if you specified
        # a cron schedule of cron(0 0 ? * THU#2 *) , you could specify an offset of 3 to run the association
        # each Sunday after the second Thursday of the month. For more information about cron schedules for
        # associations, see Reference: Cron and rate expressions for Systems Manager in the Amazon Web
        # Services Systems Manager User Guide . To use offsets, you must specify the ApplyOnlyAtCronInterval
        # parameter. This option tells the system not to run an association immediately after you create it.

        @[JSON::Field(key: "ScheduleOffset")]
        getter schedule_offset : Int32?

        # The mode for generating association compliance. You can specify AUTO or MANUAL . In AUTO mode, the
        # system uses the status of the association execution to determine the compliance status. If the
        # association execution runs successfully, then the association is COMPLIANT . If the association
        # execution doesn't run successfully, the association is NON-COMPLIANT . In MANUAL mode, you must
        # specify the AssociationId as a parameter for the PutComplianceItems API operation. In this case,
        # compliance data isn't managed by State Manager, a tool in Amazon Web Services Systems Manager. It is
        # managed by your direct call to the PutComplianceItems API operation. By default, all associations
        # use AUTO mode.

        @[JSON::Field(key: "SyncCompliance")]
        getter sync_compliance : String?

        # A location is a combination of Amazon Web Services Regions and Amazon Web Services accounts where
        # you want to run the association. Use this action to update an association in multiple Regions and
        # multiple accounts. The IncludeChildOrganizationUnits parameter is not supported by State Manager.

        @[JSON::Field(key: "TargetLocations")]
        getter target_locations : Array(Types::TargetLocation)?

        # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be
        # specified together.

        @[JSON::Field(key: "TargetMaps")]
        getter target_maps : Array(Hash(String, Array(String)))?

        # The targets of the association.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        def initialize(
          @association_id : String,
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @apply_only_at_cron_interval : Bool? = nil,
          @association_name : String? = nil,
          @association_version : String? = nil,
          @automation_target_parameter_name : String? = nil,
          @calendar_names : Array(String)? = nil,
          @compliance_severity : String? = nil,
          @document_version : String? = nil,
          @duration : Int32? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @name : String? = nil,
          @output_location : Types::InstanceAssociationOutputLocation? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @schedule_expression : String? = nil,
          @schedule_offset : Int32? = nil,
          @sync_compliance : String? = nil,
          @target_locations : Array(Types::TargetLocation)? = nil,
          @target_maps : Array(Hash(String, Array(String)))? = nil,
          @targets : Array(Types::Target)? = nil
        )
        end
      end


      struct UpdateAssociationResult
        include JSON::Serializable

        # The description of the association that was updated.

        @[JSON::Field(key: "AssociationDescription")]
        getter association_description : Types::AssociationDescription?

        def initialize(
          @association_description : Types::AssociationDescription? = nil
        )
        end
      end


      struct UpdateAssociationStatusRequest
        include JSON::Serializable

        # The association status.

        @[JSON::Field(key: "AssociationStatus")]
        getter association_status : Types::AssociationStatus

        # The managed node ID.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The name of the SSM document.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @association_status : Types::AssociationStatus,
          @instance_id : String,
          @name : String
        )
        end
      end


      struct UpdateAssociationStatusResult
        include JSON::Serializable

        # Information about the association.

        @[JSON::Field(key: "AssociationDescription")]
        getter association_description : Types::AssociationDescription?

        def initialize(
          @association_description : Types::AssociationDescription? = nil
        )
        end
      end


      struct UpdateDocumentDefaultVersionRequest
        include JSON::Serializable

        # The version of a custom document that you want to set as the default version.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String

        # The name of a custom document that you want to set as the default version.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @document_version : String,
          @name : String
        )
        end
      end


      struct UpdateDocumentDefaultVersionResult
        include JSON::Serializable

        # The description of a custom document that you want to set as the default version.

        @[JSON::Field(key: "Description")]
        getter description : Types::DocumentDefaultVersionDescription?

        def initialize(
          @description : Types::DocumentDefaultVersionDescription? = nil
        )
        end
      end


      struct UpdateDocumentMetadataRequest
        include JSON::Serializable

        # The change template review details to update.

        @[JSON::Field(key: "DocumentReviews")]
        getter document_reviews : Types::DocumentReviews

        # The name of the change template for which a version's metadata is to be updated.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The version of a change template in which to update approval metadata.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        def initialize(
          @document_reviews : Types::DocumentReviews,
          @name : String,
          @document_version : String? = nil
        )
        end
      end


      struct UpdateDocumentMetadataResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDocumentRequest
        include JSON::Serializable

        # A valid JSON or YAML string.

        @[JSON::Field(key: "Content")]
        getter content : String

        # The name of the SSM document that you want to update.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of key-value pairs that describe attachments to a version of a document.

        @[JSON::Field(key: "Attachments")]
        getter attachments : Array(Types::AttachmentsSource)?

        # The friendly name of the SSM document that you want to update. This value can differ for each
        # version of the document. If you don't specify a value for this parameter in your request, the
        # existing value is applied to the new document version.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Specify the document format for the new document version. Systems Manager supports JSON and YAML
        # documents. JSON is the default format.

        @[JSON::Field(key: "DocumentFormat")]
        getter document_format : String?

        # The version of the document that you want to update. Currently, Systems Manager supports updating
        # only the latest version of the document. You can specify the version number of the latest version or
        # use the $LATEST variable. If you change a document version for a State Manager association, Systems
        # Manager immediately runs the association unless you previously specifed the
        # apply-only-at-cron-interval parameter.

        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        # Specify a new target type for the document.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        # An optional field specifying the version of the artifact you are updating with the document. For
        # example, 12.6. This value is unique across all versions of a document, and can't be changed.

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @content : String,
          @name : String,
          @attachments : Array(Types::AttachmentsSource)? = nil,
          @display_name : String? = nil,
          @document_format : String? = nil,
          @document_version : String? = nil,
          @target_type : String? = nil,
          @version_name : String? = nil
        )
        end
      end


      struct UpdateDocumentResult
        include JSON::Serializable

        # A description of the document that was updated.

        @[JSON::Field(key: "DocumentDescription")]
        getter document_description : Types::DocumentDescription?

        def initialize(
          @document_description : Types::DocumentDescription? = nil
        )
        end
      end


      struct UpdateMaintenanceWindowRequest
        include JSON::Serializable

        # The ID of the maintenance window to update.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        # Whether targets must be registered with the maintenance window before tasks can be defined for those
        # targets.

        @[JSON::Field(key: "AllowUnassociatedTargets")]
        getter allow_unassociated_targets : Bool?

        # The number of hours before the end of the maintenance window that Amazon Web Services Systems
        # Manager stops scheduling new tasks for execution.

        @[JSON::Field(key: "Cutoff")]
        getter cutoff : Int32?

        # An optional description for the update request.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The duration of the maintenance window in hours.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # Whether the maintenance window is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become
        # inactive. EndDate allows you to set a date and time in the future when the maintenance window will
        # no longer run.

        @[JSON::Field(key: "EndDate")]
        getter end_date : String?

        # The name of the maintenance window.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # If True , then all fields that are required by the CreateMaintenanceWindow operation are also
        # required for this API request. Optional fields that aren't specified are set to null.

        @[JSON::Field(key: "Replace")]
        getter replace : Bool?

        # The schedule of the maintenance window in the form of a cron or rate expression.

        @[JSON::Field(key: "Schedule")]
        getter schedule : String?

        # The number of days to wait after the date and time specified by a cron expression before running the
        # maintenance window. For example, the following cron expression schedules a maintenance window to run
        # the third Tuesday of every month at 11:30 PM. cron(30 23 ? * TUE#3 *) If the schedule offset is 2 ,
        # the maintenance window won't run until two days later.

        @[JSON::Field(key: "ScheduleOffset")]
        getter schedule_offset : Int32?

        # The time zone that the scheduled maintenance window executions are based on, in Internet Assigned
        # Numbers Authority (IANA) format. For example: "America/Los_Angeles", "UTC", or "Asia/Seoul". For
        # more information, see the Time Zone Database on the IANA website.

        @[JSON::Field(key: "ScheduleTimezone")]
        getter schedule_timezone : String?

        # The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become
        # active. StartDate allows you to delay activation of the maintenance window until the specified
        # future date. When using a rate schedule, if you provide a start date that occurs in the past, the
        # current date and time are used as the start date.

        @[JSON::Field(key: "StartDate")]
        getter start_date : String?

        def initialize(
          @window_id : String,
          @allow_unassociated_targets : Bool? = nil,
          @cutoff : Int32? = nil,
          @description : String? = nil,
          @duration : Int32? = nil,
          @enabled : Bool? = nil,
          @end_date : String? = nil,
          @name : String? = nil,
          @replace : Bool? = nil,
          @schedule : String? = nil,
          @schedule_offset : Int32? = nil,
          @schedule_timezone : String? = nil,
          @start_date : String? = nil
        )
        end
      end


      struct UpdateMaintenanceWindowResult
        include JSON::Serializable

        # Whether targets must be registered with the maintenance window before tasks can be defined for those
        # targets.

        @[JSON::Field(key: "AllowUnassociatedTargets")]
        getter allow_unassociated_targets : Bool?

        # The number of hours before the end of the maintenance window that Amazon Web Services Systems
        # Manager stops scheduling new tasks for execution.

        @[JSON::Field(key: "Cutoff")]
        getter cutoff : Int32?

        # An optional description of the update.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The duration of the maintenance window in hours.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # Whether the maintenance window is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to
        # become inactive. The maintenance window won't run after this specified time.

        @[JSON::Field(key: "EndDate")]
        getter end_date : String?

        # The name of the maintenance window.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The schedule of the maintenance window in the form of a cron or rate expression.

        @[JSON::Field(key: "Schedule")]
        getter schedule : String?

        # The number of days to wait to run a maintenance window after the scheduled cron expression date and
        # time.

        @[JSON::Field(key: "ScheduleOffset")]
        getter schedule_offset : Int32?

        # The time zone that the scheduled maintenance window executions are based on, in Internet Assigned
        # Numbers Authority (IANA) format. For example: "America/Los_Angeles", "UTC", or "Asia/Seoul". For
        # more information, see the Time Zone Database on the IANA website.

        @[JSON::Field(key: "ScheduleTimezone")]
        getter schedule_timezone : String?

        # The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to
        # become active. The maintenance window won't run before this specified time.

        @[JSON::Field(key: "StartDate")]
        getter start_date : String?

        # The ID of the created maintenance window.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        def initialize(
          @allow_unassociated_targets : Bool? = nil,
          @cutoff : Int32? = nil,
          @description : String? = nil,
          @duration : Int32? = nil,
          @enabled : Bool? = nil,
          @end_date : String? = nil,
          @name : String? = nil,
          @schedule : String? = nil,
          @schedule_offset : Int32? = nil,
          @schedule_timezone : String? = nil,
          @start_date : String? = nil,
          @window_id : String? = nil
        )
        end
      end


      struct UpdateMaintenanceWindowTargetRequest
        include JSON::Serializable

        # The maintenance window ID with which to modify the target.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        # The target ID to modify.

        @[JSON::Field(key: "WindowTargetId")]
        getter window_target_id : String

        # An optional description for the update.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A name for the update.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # User-provided value that will be included in any Amazon CloudWatch Events events raised while
        # running tasks for these targets in this maintenance window.

        @[JSON::Field(key: "OwnerInformation")]
        getter owner_information : String?

        # If True , then all fields that are required by the RegisterTargetWithMaintenanceWindow operation are
        # also required for this API request. Optional fields that aren't specified are set to null.

        @[JSON::Field(key: "Replace")]
        getter replace : Bool?

        # The targets to add or replace.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        def initialize(
          @window_id : String,
          @window_target_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @owner_information : String? = nil,
          @replace : Bool? = nil,
          @targets : Array(Types::Target)? = nil
        )
        end
      end


      struct UpdateMaintenanceWindowTargetResult
        include JSON::Serializable

        # The updated description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The updated name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The updated owner.

        @[JSON::Field(key: "OwnerInformation")]
        getter owner_information : String?

        # The updated targets.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The maintenance window ID specified in the update request.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        # The target ID specified in the update request.

        @[JSON::Field(key: "WindowTargetId")]
        getter window_target_id : String?

        def initialize(
          @description : String? = nil,
          @name : String? = nil,
          @owner_information : String? = nil,
          @targets : Array(Types::Target)? = nil,
          @window_id : String? = nil,
          @window_target_id : String? = nil
        )
        end
      end


      struct UpdateMaintenanceWindowTaskRequest
        include JSON::Serializable

        # The maintenance window ID that contains the task to modify.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String

        # The task ID to modify.

        @[JSON::Field(key: "WindowTaskId")]
        getter window_task_id : String

        # The CloudWatch alarm you want to apply to your maintenance window task.

        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # Indicates whether tasks should continue to run after the cutoff time specified in the maintenance
        # windows is reached. CONTINUE_TASK : When the cutoff time is reached, any tasks that are running
        # continue. The default value. CANCEL_TASK : For Automation, Lambda, Step Functions tasks: When the
        # cutoff time is reached, any task invocations that are already running continue, but no new task
        # invocations are started. For Run Command tasks: When the cutoff time is reached, the system sends a
        # CancelCommand operation that attempts to cancel the command associated with the task. However, there
        # is no guarantee that the command will be terminated and the underlying process stopped. The status
        # for tasks that are not completed is TIMED_OUT .

        @[JSON::Field(key: "CutoffBehavior")]
        getter cutoff_behavior : String?

        # The new task description to specify.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The new logging location in Amazon S3 to specify. LoggingInfo has been deprecated. To specify an
        # Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the OutputS3BucketName
        # and OutputS3KeyPrefix options in the TaskInvocationParameters structure. For information about how
        # Amazon Web Services Systems Manager handles these options for the supported maintenance window task
        # types, see MaintenanceWindowTaskInvocationParameters .

        @[JSON::Field(key: "LoggingInfo")]
        getter logging_info : Types::LoggingInfo?

        # The new MaxConcurrency value you want to specify. MaxConcurrency is the number of targets that are
        # allowed to run this task, in parallel. Although this element is listed as "Required: No", a value
        # can be omitted only when you are registering or updating a targetless task You must provide a value
        # in all other cases. For maintenance window tasks without a target specified, you can't supply a
        # value for this option. Instead, the system inserts a placeholder value of 1 . This value doesn't
        # affect the running of your task.

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The new MaxErrors value to specify. MaxErrors is the maximum number of errors that are allowed
        # before the task stops being scheduled. Although this element is listed as "Required: No", a value
        # can be omitted only when you are registering or updating a targetless task You must provide a value
        # in all other cases. For maintenance window tasks without a target specified, you can't supply a
        # value for this option. Instead, the system inserts a placeholder value of 1 . This value doesn't
        # affect the running of your task.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # The new task name to specify.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The new task priority to specify. The lower the number, the higher the priority. Tasks that have the
        # same priority are scheduled in parallel.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # If True, then all fields that are required by the RegisterTaskWithMaintenanceWindow operation are
        # also required for this API request. Optional fields that aren't specified are set to null.

        @[JSON::Field(key: "Replace")]
        getter replace : Bool?

        # The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to
        # assume when running a maintenance window task. If you do not specify a service role ARN, Systems
        # Manager uses a service-linked role in your account. If no appropriate service-linked role for
        # Systems Manager exists in your account, it is created when you run RegisterTaskWithMaintenanceWindow
        # . However, for an improved security posture, we strongly recommend creating a custom policy and
        # custom service role for running your maintenance window tasks. The policy can be crafted to provide
        # only the permissions needed for your particular maintenance window tasks. For more information, see
        # Setting up Maintenance Windows in the in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "ServiceRoleArn")]
        getter service_role_arn : String?

        # The targets (either managed nodes or tags) to modify. Managed nodes are specified using the format
        # Key=instanceids,Values=instanceID_1,instanceID_2 . Tags are specified using the format
        # Key=tag_name,Values=tag_value . One or more targets must be specified for maintenance window Run
        # Command-type tasks. Depending on the task, targets are optional for other maintenance window task
        # types (Automation, Lambda, and Step Functions). For more information about running tasks that don't
        # specify targets, see Registering maintenance window tasks without targets in the Amazon Web Services
        # Systems Manager User Guide .

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The task ARN to modify.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The parameters that the task should use during execution. Populate only the fields that match the
        # task type. All other fields should be empty. When you update a maintenance window task that has
        # options specified in TaskInvocationParameters , you must provide again all the
        # TaskInvocationParameters values that you want to retain. The values you don't specify again are
        # removed. For example, suppose that when you registered a Run Command task, you specified
        # TaskInvocationParameters values for Comment , NotificationConfig , and OutputS3BucketName . If you
        # update the maintenance window task and specify only a different OutputS3BucketName value, the values
        # for Comment and NotificationConfig are removed.

        @[JSON::Field(key: "TaskInvocationParameters")]
        getter task_invocation_parameters : Types::MaintenanceWindowTaskInvocationParameters?

        # The parameters to modify. TaskParameters has been deprecated. To specify parameters to pass to a
        # task when it runs, instead use the Parameters option in the TaskInvocationParameters structure. For
        # information about how Systems Manager handles these options for the supported maintenance window
        # task types, see MaintenanceWindowTaskInvocationParameters . The map has the following format: Key:
        # string, between 1 and 255 characters Value: an array of strings, each string is between 1 and 255
        # characters

        @[JSON::Field(key: "TaskParameters")]
        getter task_parameters : Hash(String, Types::MaintenanceWindowTaskParameterValueExpression)?

        def initialize(
          @window_id : String,
          @window_task_id : String,
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @cutoff_behavior : String? = nil,
          @description : String? = nil,
          @logging_info : Types::LoggingInfo? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @replace : Bool? = nil,
          @service_role_arn : String? = nil,
          @targets : Array(Types::Target)? = nil,
          @task_arn : String? = nil,
          @task_invocation_parameters : Types::MaintenanceWindowTaskInvocationParameters? = nil,
          @task_parameters : Hash(String, Types::MaintenanceWindowTaskParameterValueExpression)? = nil
        )
        end
      end


      struct UpdateMaintenanceWindowTaskResult
        include JSON::Serializable

        # The details for the CloudWatch alarm you applied to your maintenance window task.

        @[JSON::Field(key: "AlarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # The specification for whether tasks should continue to run after the cutoff time specified in the
        # maintenance windows is reached.

        @[JSON::Field(key: "CutoffBehavior")]
        getter cutoff_behavior : String?

        # The updated task description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The updated logging information in Amazon S3. LoggingInfo has been deprecated. To specify an Amazon
        # Simple Storage Service (Amazon S3) bucket to contain logs, instead use the OutputS3BucketName and
        # OutputS3KeyPrefix options in the TaskInvocationParameters structure. For information about how
        # Amazon Web Services Systems Manager handles these options for the supported maintenance window task
        # types, see MaintenanceWindowTaskInvocationParameters .

        @[JSON::Field(key: "LoggingInfo")]
        getter logging_info : Types::LoggingInfo?

        # The updated MaxConcurrency value.

        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : String?

        # The updated MaxErrors value.

        @[JSON::Field(key: "MaxErrors")]
        getter max_errors : String?

        # The updated task name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The updated priority value.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to
        # assume when running a maintenance window task. If you do not specify a service role ARN, Systems
        # Manager uses a service-linked role in your account. If no appropriate service-linked role for
        # Systems Manager exists in your account, it is created when you run RegisterTaskWithMaintenanceWindow
        # . However, for an improved security posture, we strongly recommend creating a custom policy and
        # custom service role for running your maintenance window tasks. The policy can be crafted to provide
        # only the permissions needed for your particular maintenance window tasks. For more information, see
        # Setting up Maintenance Windows in the in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "ServiceRoleArn")]
        getter service_role_arn : String?

        # The updated target values.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        # The updated task ARN value.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The updated parameter values.

        @[JSON::Field(key: "TaskInvocationParameters")]
        getter task_invocation_parameters : Types::MaintenanceWindowTaskInvocationParameters?

        # The updated parameter values. TaskParameters has been deprecated. To specify parameters to pass to a
        # task when it runs, instead use the Parameters option in the TaskInvocationParameters structure. For
        # information about how Systems Manager handles these options for the supported maintenance window
        # task types, see MaintenanceWindowTaskInvocationParameters .

        @[JSON::Field(key: "TaskParameters")]
        getter task_parameters : Hash(String, Types::MaintenanceWindowTaskParameterValueExpression)?

        # The ID of the maintenance window that was updated.

        @[JSON::Field(key: "WindowId")]
        getter window_id : String?

        # The task ID of the maintenance window that was updated.

        @[JSON::Field(key: "WindowTaskId")]
        getter window_task_id : String?

        def initialize(
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @cutoff_behavior : String? = nil,
          @description : String? = nil,
          @logging_info : Types::LoggingInfo? = nil,
          @max_concurrency : String? = nil,
          @max_errors : String? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @service_role_arn : String? = nil,
          @targets : Array(Types::Target)? = nil,
          @task_arn : String? = nil,
          @task_invocation_parameters : Types::MaintenanceWindowTaskInvocationParameters? = nil,
          @task_parameters : Hash(String, Types::MaintenanceWindowTaskParameterValueExpression)? = nil,
          @window_id : String? = nil,
          @window_task_id : String? = nil
        )
        end
      end


      struct UpdateManagedInstanceRoleRequest
        include JSON::Serializable

        # The name of the Identity and Access Management (IAM) role that you want to assign to the managed
        # node. This IAM role must provide AssumeRole permissions for the Amazon Web Services Systems Manager
        # service principal ssm.amazonaws.com . For more information, see Create the IAM service role required
        # for Systems Manager in hybrid and multicloud environments in the Amazon Web Services Systems Manager
        # User Guide . You can't specify an IAM service-linked role for this parameter. You must create a
        # unique role.

        @[JSON::Field(key: "IamRole")]
        getter iam_role : String

        # The ID of the managed node where you want to update the role.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        def initialize(
          @iam_role : String,
          @instance_id : String
        )
        end
      end


      struct UpdateManagedInstanceRoleResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateOpsItemRequest
        include JSON::Serializable

        # The ID of the OpsItem.

        @[JSON::Field(key: "OpsItemId")]
        getter ops_item_id : String

        # The time a runbook workflow ended. Currently reported only for the OpsItem type /aws/changerequest .

        @[JSON::Field(key: "ActualEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter actual_end_time : Time?

        # The time a runbook workflow started. Currently reported only for the OpsItem type /aws/changerequest
        # .

        @[JSON::Field(key: "ActualStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter actual_start_time : Time?

        # Specify a new category for an OpsItem.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # User-defined text that contains information about the OpsItem, in Markdown format.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of an SNS topic where notifications are sent when this OpsItem is
        # edited or changed.

        @[JSON::Field(key: "Notifications")]
        getter notifications : Array(Types::OpsItemNotification)?

        # Add new keys or edit existing key-value pairs of the OperationalData map in the OpsItem object.
        # Operational data is custom data that provides useful reference details about the OpsItem. For
        # example, you can specify log files, error strings, license keys, troubleshooting tips, or other
        # relevant data. You enter operational data as key-value pairs. The key has a maximum length of 128
        # characters. The value has a maximum size of 20 KB. Operational data keys can't begin with the
        # following: amazon , aws , amzn , ssm , /amazon , /aws , /amzn , /ssm . You can choose to make the
        # data searchable by other users in the account or you can restrict search access. Searchable data
        # means that all users with access to the OpsItem Overview page (as provided by the DescribeOpsItems
        # API operation) can view and search on the specified data. Operational data that isn't searchable is
        # only viewable by users who have access to the OpsItem (as provided by the GetOpsItem API operation).
        # Use the /aws/resources key in OperationalData to specify a related resource in the request. Use the
        # /aws/automations key in OperationalData to associate an Automation runbook with the OpsItem. To view
        # Amazon Web Services CLI example commands that use these keys, see Creating OpsItems manually in the
        # Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "OperationalData")]
        getter operational_data : Hash(String, Types::OpsItemDataValue)?

        # Keys that you want to remove from the OperationalData map.

        @[JSON::Field(key: "OperationalDataToDelete")]
        getter operational_data_to_delete : Array(String)?

        # The OpsItem Amazon Resource Name (ARN).

        @[JSON::Field(key: "OpsItemArn")]
        getter ops_item_arn : String?

        # The time specified in a change request for a runbook workflow to end. Currently supported only for
        # the OpsItem type /aws/changerequest .

        @[JSON::Field(key: "PlannedEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter planned_end_time : Time?

        # The time specified in a change request for a runbook workflow to start. Currently supported only for
        # the OpsItem type /aws/changerequest .

        @[JSON::Field(key: "PlannedStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter planned_start_time : Time?

        # The importance of this OpsItem in relation to other OpsItems in the system.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # One or more OpsItems that share something in common with the current OpsItems. For example, related
        # OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the
        # impacted resource.

        @[JSON::Field(key: "RelatedOpsItems")]
        getter related_ops_items : Array(Types::RelatedOpsItem)?

        # Specify a new severity for an OpsItem.

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The OpsItem status. For more information, see Editing OpsItem details in the Amazon Web Services
        # Systems Manager User Guide .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short heading that describes the nature of the OpsItem and the impacted resource.

        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @ops_item_id : String,
          @actual_end_time : Time? = nil,
          @actual_start_time : Time? = nil,
          @category : String? = nil,
          @description : String? = nil,
          @notifications : Array(Types::OpsItemNotification)? = nil,
          @operational_data : Hash(String, Types::OpsItemDataValue)? = nil,
          @operational_data_to_delete : Array(String)? = nil,
          @ops_item_arn : String? = nil,
          @planned_end_time : Time? = nil,
          @planned_start_time : Time? = nil,
          @priority : Int32? = nil,
          @related_ops_items : Array(Types::RelatedOpsItem)? = nil,
          @severity : String? = nil,
          @status : String? = nil,
          @title : String? = nil
        )
        end
      end


      struct UpdateOpsItemResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateOpsMetadataRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the OpsMetadata Object to update.

        @[JSON::Field(key: "OpsMetadataArn")]
        getter ops_metadata_arn : String

        # The metadata keys to delete from the OpsMetadata object.

        @[JSON::Field(key: "KeysToDelete")]
        getter keys_to_delete : Array(String)?

        # Metadata to add to an OpsMetadata object.

        @[JSON::Field(key: "MetadataToUpdate")]
        getter metadata_to_update : Hash(String, Types::MetadataValue)?

        def initialize(
          @ops_metadata_arn : String,
          @keys_to_delete : Array(String)? = nil,
          @metadata_to_update : Hash(String, Types::MetadataValue)? = nil
        )
        end
      end


      struct UpdateOpsMetadataResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the OpsMetadata Object that was updated.

        @[JSON::Field(key: "OpsMetadataArn")]
        getter ops_metadata_arn : String?

        def initialize(
          @ops_metadata_arn : String? = nil
        )
        end
      end


      struct UpdatePatchBaselineRequest
        include JSON::Serializable

        # The ID of the patch baseline to update.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String

        # A set of rules used to include patches in the baseline.

        @[JSON::Field(key: "ApprovalRules")]
        getter approval_rules : Types::PatchRuleGroup?

        # A list of explicitly approved patches for the baseline. For information about accepted formats for
        # lists of approved patches and rejected patches, see Package name formats for approved and rejected
        # patch lists in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "ApprovedPatches")]
        getter approved_patches : Array(String)?

        # Assigns a new compliance severity level to an existing patch baseline.

        @[JSON::Field(key: "ApprovedPatchesComplianceLevel")]
        getter approved_patches_compliance_level : String?

        # Indicates whether the list of approved patches includes non-security updates that should be applied
        # to the managed nodes. The default value is false . Applies to Linux managed nodes only.

        @[JSON::Field(key: "ApprovedPatchesEnableNonSecurity")]
        getter approved_patches_enable_non_security : Bool?

        # Indicates the status to be assigned to security patches that are available but not approved because
        # they don't meet the installation criteria specified in the patch baseline. Example scenario:
        # Security patches that you might want installed can be skipped if you have specified a long period to
        # wait after a patch is released before installation. If an update to the patch is released during
        # your specified waiting period, the waiting period for installing the patch starts over. If the
        # waiting period is too long, multiple versions of the patch could be released but never installed.
        # Supported for Windows Server managed nodes only.

        @[JSON::Field(key: "AvailableSecurityUpdatesComplianceStatus")]
        getter available_security_updates_compliance_status : String?

        # A description of the patch baseline.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A set of global filters used to include patches in the baseline. The GlobalFilters parameter can be
        # configured only by using the CLI or an Amazon Web Services SDK. It can't be configured from the
        # Patch Manager console, and its value isn't displayed in the console.

        @[JSON::Field(key: "GlobalFilters")]
        getter global_filters : Types::PatchFilterGroup?

        # The name of the patch baseline.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of explicitly rejected patches for the baseline. For information about accepted formats for
        # lists of approved patches and rejected patches, see Package name formats for approved and rejected
        # patch lists in the Amazon Web Services Systems Manager User Guide .

        @[JSON::Field(key: "RejectedPatches")]
        getter rejected_patches : Array(String)?

        # The action for Patch Manager to take on patches included in the RejectedPackages list.
        # ALLOW_AS_DEPENDENCY Linux and macOS : A package in the rejected patches list is installed only if it
        # is a dependency of another package. It is considered compliant with the patch baseline, and its
        # status is reported as INSTALLED_OTHER . This is the default action if no option is specified.
        # Windows Server : Windows Server doesn't support the concept of package dependencies. If a package in
        # the rejected patches list and already installed on the node, its status is reported as
        # INSTALLED_OTHER . Any package not already installed on the node is skipped. This is the default
        # action if no option is specified. BLOCK All OSs : Packages in the rejected patches list, and
        # packages that include them as dependencies, aren't installed by Patch Manager under any
        # circumstances. State value assignment for patch compliance: If a package was installed before it was
        # added to the rejected patches list, or is installed outside of Patch Manager afterward, it's
        # considered noncompliant with the patch baseline and its status is reported as INSTALLED_REJECTED .
        # If an update attempts to install a dependency package that is now rejected by the baseline, when
        # previous versions of the package were not rejected, the package being updated is reported as MISSING
        # for SCAN operations and as FAILED for INSTALL operations.

        @[JSON::Field(key: "RejectedPatchesAction")]
        getter rejected_patches_action : String?

        # If True, then all fields that are required by the CreatePatchBaseline operation are also required
        # for this API request. Optional fields that aren't specified are set to null.

        @[JSON::Field(key: "Replace")]
        getter replace : Bool?

        # Information about the patches to use to update the managed nodes, including target operating systems
        # and source repositories. Applies to Linux managed nodes only.

        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::PatchSource)?

        def initialize(
          @baseline_id : String,
          @approval_rules : Types::PatchRuleGroup? = nil,
          @approved_patches : Array(String)? = nil,
          @approved_patches_compliance_level : String? = nil,
          @approved_patches_enable_non_security : Bool? = nil,
          @available_security_updates_compliance_status : String? = nil,
          @description : String? = nil,
          @global_filters : Types::PatchFilterGroup? = nil,
          @name : String? = nil,
          @rejected_patches : Array(String)? = nil,
          @rejected_patches_action : String? = nil,
          @replace : Bool? = nil,
          @sources : Array(Types::PatchSource)? = nil
        )
        end
      end


      struct UpdatePatchBaselineResult
        include JSON::Serializable

        # A set of rules used to include patches in the baseline.

        @[JSON::Field(key: "ApprovalRules")]
        getter approval_rules : Types::PatchRuleGroup?

        # A list of explicitly approved patches for the baseline.

        @[JSON::Field(key: "ApprovedPatches")]
        getter approved_patches : Array(String)?

        # The compliance severity level assigned to the patch baseline after the update completed.

        @[JSON::Field(key: "ApprovedPatchesComplianceLevel")]
        getter approved_patches_compliance_level : String?

        # Indicates whether the list of approved patches includes non-security updates that should be applied
        # to the managed nodes. The default value is false . Applies to Linux managed nodes only.

        @[JSON::Field(key: "ApprovedPatchesEnableNonSecurity")]
        getter approved_patches_enable_non_security : Bool?

        # Indicates the compliance status of managed nodes for which security-related patches are available
        # but were not approved. This preference is specified when the CreatePatchBaseline or
        # UpdatePatchBaseline commands are run. Applies to Windows Server managed nodes only.

        @[JSON::Field(key: "AvailableSecurityUpdatesComplianceStatus")]
        getter available_security_updates_compliance_status : String?

        # The ID of the deleted patch baseline.

        @[JSON::Field(key: "BaselineId")]
        getter baseline_id : String?

        # The date when the patch baseline was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # A description of the patch baseline.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A set of global filters used to exclude patches from the baseline.

        @[JSON::Field(key: "GlobalFilters")]
        getter global_filters : Types::PatchFilterGroup?

        # The date when the patch baseline was last modified.

        @[JSON::Field(key: "ModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_date : Time?

        # The name of the patch baseline.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The operating system rule used by the updated patch baseline.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : String?

        # A list of explicitly rejected patches for the baseline.

        @[JSON::Field(key: "RejectedPatches")]
        getter rejected_patches : Array(String)?

        # The action specified to take on patches included in the RejectedPatches list. A patch can be allowed
        # only if it is a dependency of another package, or blocked entirely along with packages that include
        # it as a dependency.

        @[JSON::Field(key: "RejectedPatchesAction")]
        getter rejected_patches_action : String?

        # Information about the patches to use to update the managed nodes, including target operating systems
        # and source repositories. Applies to Linux managed nodes only.

        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::PatchSource)?

        def initialize(
          @approval_rules : Types::PatchRuleGroup? = nil,
          @approved_patches : Array(String)? = nil,
          @approved_patches_compliance_level : String? = nil,
          @approved_patches_enable_non_security : Bool? = nil,
          @available_security_updates_compliance_status : String? = nil,
          @baseline_id : String? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @global_filters : Types::PatchFilterGroup? = nil,
          @modified_date : Time? = nil,
          @name : String? = nil,
          @operating_system : String? = nil,
          @rejected_patches : Array(String)? = nil,
          @rejected_patches_action : String? = nil,
          @sources : Array(Types::PatchSource)? = nil
        )
        end
      end


      struct UpdateResourceDataSyncRequest
        include JSON::Serializable

        # The name of the resource data sync you want to update.

        @[JSON::Field(key: "SyncName")]
        getter sync_name : String

        # Specify information about the data sources to synchronize.

        @[JSON::Field(key: "SyncSource")]
        getter sync_source : Types::ResourceDataSyncSource

        # The type of resource data sync. The supported SyncType is SyncFromSource.

        @[JSON::Field(key: "SyncType")]
        getter sync_type : String

        def initialize(
          @sync_name : String,
          @sync_source : Types::ResourceDataSyncSource,
          @sync_type : String
        )
        end
      end


      struct UpdateResourceDataSyncResult
        include JSON::Serializable

        def initialize
        end
      end

      # The request body of the UpdateServiceSetting API operation.

      struct UpdateServiceSettingRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service setting to update. For example,
        # arn:aws:ssm:us-east-1:111122223333:servicesetting/ssm/parameter-store/high-throughput-enabled . The
        # setting ID can be one of the following. /ssm/appmanager/appmanager-enabled
        # /ssm/automation/customer-script-log-destination /ssm/automation/customer-script-log-group-name
        # /ssm/automation/enable-adaptive-concurrency /ssm/documents/console/public-sharing-permission
        # /ssm/managed-instance/activation-tier /ssm/managed-instance/default-ec2-instance-management-role
        # /ssm/opsinsights/opscenter /ssm/parameter-store/default-parameter-tier
        # /ssm/parameter-store/high-throughput-enabled Permissions to update the
        # /ssm/managed-instance/default-ec2-instance-management-role setting should only be provided to
        # administrators. Implement least privilege access when allowing individuals to configure or modify
        # the Default Host Management Configuration.

        @[JSON::Field(key: "SettingId")]
        getter setting_id : String

        # The new value to specify for the service setting. The following list specifies the available values
        # for each setting. For /ssm/appmanager/appmanager-enabled , enter True or False . For
        # /ssm/automation/customer-script-log-destination , enter CloudWatch . For
        # /ssm/automation/customer-script-log-group-name , enter the name of an Amazon CloudWatch Logs log
        # group. For /ssm/documents/console/public-sharing-permission , enter Enable or Disable . For
        # /ssm/managed-instance/activation-tier , enter standard or advanced . For
        # /ssm/managed-instance/default-ec2-instance-management-role , enter the name of an IAM role. For
        # /ssm/opsinsights/opscenter , enter Enabled or Disabled . For
        # /ssm/parameter-store/default-parameter-tier , enter Standard , Advanced , or Intelligent-Tiering For
        # /ssm/parameter-store/high-throughput-enabled , enter true or false .

        @[JSON::Field(key: "SettingValue")]
        getter setting_value : String

        def initialize(
          @setting_id : String,
          @setting_value : String
        )
        end
      end

      # The result body of the UpdateServiceSetting API operation.

      struct UpdateServiceSettingResult
        include JSON::Serializable

        def initialize
        end
      end

      # The request isn't valid. Verify that you entered valid contents for the command and try again.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason code for the invalid request.

        @[JSON::Field(key: "ReasonCode")]
        getter reason_code : String?

        def initialize(
          @message : String? = nil,
          @reason_code : String? = nil
        )
        end
      end
    end
  end
end
