require "json"
require "time"

module Aws
  module ControlTower
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # An object of shape BaselineOperation , returning details about the specified Baseline operation ID.

      struct BaselineOperation
        include JSON::Serializable

        # The end time of the operation (if applicable), in ISO 8601 format.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The identifier of the specified operation.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String?

        # An enumerated type ( enum ) with possible values of ENABLE_BASELINE , DISABLE_BASELINE ,
        # UPDATE_ENABLED_BASELINE , or RESET_ENABLED_BASELINE .

        @[JSON::Field(key: "operationType")]
        getter operation_type : String?

        # The start time of the operation, in ISO 8601 format.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # An enumerated type ( enum ) with possible values of SUCCEEDED , FAILED , or IN_PROGRESS .

        @[JSON::Field(key: "status")]
        getter status : String?

        # A status message that gives more information about the operation's status, if applicable.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @end_time : Time? = nil,
          @operation_identifier : String? = nil,
          @operation_type : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Returns a summary of information about a Baseline object.

      struct BaselineSummary
        include JSON::Serializable

        # The full ARN of a Baseline.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The human-readable name of a Baseline.

        @[JSON::Field(key: "name")]
        getter name : String

        # A summary description of a Baseline.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @name : String,
          @description : String? = nil
        )
        end
      end

      # Updating or deleting the resource can cause an inconsistent state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # An operation performed by the control.

      struct ControlOperation
        include JSON::Serializable

        # The controlIdentifier of the control for the operation.

        @[JSON::Field(key: "controlIdentifier")]
        getter control_identifier : String?

        # The controlIdentifier of the enabled control.

        @[JSON::Field(key: "enabledControlIdentifier")]
        getter enabled_control_identifier : String?

        # The time that the operation finished.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The identifier of the specified operation.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String?

        # One of ENABLE_CONTROL or DISABLE_CONTROL .

        @[JSON::Field(key: "operationType")]
        getter operation_type : String?

        # The time that the operation began.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # One of IN_PROGRESS , SUCEEDED , or FAILED .

        @[JSON::Field(key: "status")]
        getter status : String?

        # If the operation result is FAILED , this string contains a message explaining why the operation
        # failed.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The target upon which the control operation is working.

        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : String?

        def initialize(
          @control_identifier : String? = nil,
          @enabled_control_identifier : String? = nil,
          @end_time : Time? = nil,
          @operation_identifier : String? = nil,
          @operation_type : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @target_identifier : String? = nil
        )
        end
      end

      # A filter object that lets you call ListControlOperations with a specific filter.

      struct ControlOperationFilter
        include JSON::Serializable

        # The set of controlIdentifier returned by the filter.

        @[JSON::Field(key: "controlIdentifiers")]
        getter control_identifiers : Array(String)?

        # The set of ControlOperation objects returned by the filter.

        @[JSON::Field(key: "controlOperationTypes")]
        getter control_operation_types : Array(String)?

        # The set controlIdentifier of enabled controls selected by the filter.

        @[JSON::Field(key: "enabledControlIdentifiers")]
        getter enabled_control_identifiers : Array(String)?

        # Lists the status of control operations.

        @[JSON::Field(key: "statuses")]
        getter statuses : Array(String)?

        # The set of targetIdentifier objects returned by the filter.

        @[JSON::Field(key: "targetIdentifiers")]
        getter target_identifiers : Array(String)?

        def initialize(
          @control_identifiers : Array(String)? = nil,
          @control_operation_types : Array(String)? = nil,
          @enabled_control_identifiers : Array(String)? = nil,
          @statuses : Array(String)? = nil,
          @target_identifiers : Array(String)? = nil
        )
        end
      end

      # A summary of information about the specified control operation.

      struct ControlOperationSummary
        include JSON::Serializable

        # The controlIdentifier of a control.

        @[JSON::Field(key: "controlIdentifier")]
        getter control_identifier : String?

        # The controlIdentifier of an enabled control.

        @[JSON::Field(key: "enabledControlIdentifier")]
        getter enabled_control_identifier : String?

        # The time at which the control operation was completed.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The unique identifier of a control operation.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String?

        # The type of operation.

        @[JSON::Field(key: "operationType")]
        getter operation_type : String?

        # The time at which a control operation began.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The status of the specified control operation.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A speficic message displayed as part of the control status.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The unique identifier of the target of a control operation.

        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : String?

        def initialize(
          @control_identifier : String? = nil,
          @enabled_control_identifier : String? = nil,
          @end_time : Time? = nil,
          @operation_identifier : String? = nil,
          @operation_type : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @target_identifier : String? = nil
        )
        end
      end


      struct CreateLandingZoneInput
        include JSON::Serializable

        # The landing zone version, for example, 3.0.

        @[JSON::Field(key: "version")]
        getter version : String

        # The manifest JSON file is a text file that describes your Amazon Web Services resources. For
        # examples, review Launch your landing zone .

        @[JSON::Field(key: "manifest")]
        getter manifest : Types::Manifest?

        # Specifies the types of remediation actions to apply when creating the landing zone, such as
        # automatic drift correction or compliance enforcement.

        @[JSON::Field(key: "remediationTypes")]
        getter remediation_types : Array(String)?

        # Tags to be applied to the landing zone.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @version : String,
          @manifest : Types::Manifest? = nil,
          @remediation_types : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateLandingZoneOutput
        include JSON::Serializable

        # The ARN of the landing zone resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # A unique identifier assigned to a CreateLandingZone operation. You can use this identifier as an
        # input of GetLandingZoneOperation to check the operation's status.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @arn : String,
          @operation_identifier : String
        )
        end
      end


      struct DeleteLandingZoneInput
        include JSON::Serializable

        # The unique identifier of the landing zone.

        @[JSON::Field(key: "landingZoneIdentifier")]
        getter landing_zone_identifier : String

        def initialize(
          @landing_zone_identifier : String
        )
        end
      end


      struct DeleteLandingZoneOutput
        include JSON::Serializable

        # &gt;A unique identifier assigned to a DeleteLandingZone operation. You can use this identifier as an
        # input parameter of GetLandingZoneOperation to check the operation's status.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @operation_identifier : String
        )
        end
      end


      struct DisableBaselineInput
        include JSON::Serializable

        # Identifier of the EnabledBaseline resource to be deactivated, in ARN format.

        @[JSON::Field(key: "enabledBaselineIdentifier")]
        getter enabled_baseline_identifier : String

        def initialize(
          @enabled_baseline_identifier : String
        )
        end
      end


      struct DisableBaselineOutput
        include JSON::Serializable

        # The ID (in UUID format) of the asynchronous DisableBaseline operation. This operationIdentifier is
        # used to track status through calls to the GetBaselineOperation API.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @operation_identifier : String
        )
        end
      end


      struct DisableControlInput
        include JSON::Serializable

        # The ARN of the control. Only Strongly recommended and Elective controls are permitted, with the
        # exception of the Region deny control. For information on how to find the controlIdentifier , see the
        # overview page .

        @[JSON::Field(key: "controlIdentifier")]
        getter control_identifier : String?

        # The ARN of the enabled control to be disabled, which uniquely identifies the control instance on the
        # target organizational unit.

        @[JSON::Field(key: "enabledControlIdentifier")]
        getter enabled_control_identifier : String?

        # The ARN of the organizational unit. For information on how to find the targetIdentifier , see the
        # overview page .

        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : String?

        def initialize(
          @control_identifier : String? = nil,
          @enabled_control_identifier : String? = nil,
          @target_identifier : String? = nil
        )
        end
      end


      struct DisableControlOutput
        include JSON::Serializable

        # The ID of the asynchronous operation, which is used to track status. The operation is available for
        # 90 days.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @operation_identifier : String
        )
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # The drift summary of the enabled control. Amazon Web Services Control Tower expects the enabled
      # control configuration to include all supported and governed Regions. If the enabled control differs
      # from the expected configuration, it is defined to be in a state of drift. You can repair this drift
      # by resetting the enabled control.

      struct DriftStatusSummary
        include JSON::Serializable

        # The drift status of the enabled control. Valid values: DRIFTED : The enabledControl deployed in this
        # configuration doesn’t match the configuration that Amazon Web Services Control Tower expected.
        # IN_SYNC : The enabledControl deployed in this configuration matches the configuration that Amazon
        # Web Services Control Tower expected. NOT_CHECKING : Amazon Web Services Control Tower does not check
        # drift for this enabled control. Drift is not supported for the control type. UNKNOWN : Amazon Web
        # Services Control Tower is not able to check the drift status for the enabled control.

        @[JSON::Field(key: "driftStatus")]
        getter drift_status : String?

        # An object that categorizes the different types of drift detected for the enabled control.

        @[JSON::Field(key: "types")]
        getter types : Types::EnabledControlDriftTypes?

        def initialize(
          @drift_status : String? = nil,
          @types : Types::EnabledControlDriftTypes? = nil
        )
        end
      end


      struct EnableBaselineInput
        include JSON::Serializable

        # The ARN of the baseline to be enabled.

        @[JSON::Field(key: "baselineIdentifier")]
        getter baseline_identifier : String

        # The specific version to be enabled of the specified baseline.

        @[JSON::Field(key: "baselineVersion")]
        getter baseline_version : String

        # The ARN of the target on which the baseline will be enabled. Only OUs are supported as targets.

        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : String

        # A list of key-value objects that specify enablement parameters, where key is a string and value is a
        # document of any type.

        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::EnabledBaselineParameter)?

        # Tags associated with input to EnableBaseline .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @baseline_identifier : String,
          @baseline_version : String,
          @target_identifier : String,
          @parameters : Array(Types::EnabledBaselineParameter)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct EnableBaselineOutput
        include JSON::Serializable

        # The ARN of the EnabledBaseline resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID (in UUID format) of the asynchronous EnableBaseline operation. This operationIdentifier is
        # used to track status through calls to the GetBaselineOperation API.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @arn : String,
          @operation_identifier : String
        )
        end
      end


      struct EnableControlInput
        include JSON::Serializable

        # The ARN of the control. Only Strongly recommended and Elective controls are permitted, with the
        # exception of the Region deny control. For information on how to find the controlIdentifier , see the
        # overview page .

        @[JSON::Field(key: "controlIdentifier")]
        getter control_identifier : String

        # The ARN of the organizational unit. For information on how to find the targetIdentifier , see the
        # overview page .

        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : String

        # A list of input parameter values, which are specified to configure the control when you enable it.

        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::EnabledControlParameter)?

        # Tags to be applied to the EnabledControl resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @control_identifier : String,
          @target_identifier : String,
          @parameters : Array(Types::EnabledControlParameter)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct EnableControlOutput
        include JSON::Serializable

        # The ID of the asynchronous operation, which is used to track status. The operation is available for
        # 90 days.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        # The ARN of the EnabledControl resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        def initialize(
          @operation_identifier : String,
          @arn : String? = nil
        )
        end
      end

      # Details of the EnabledBaseline resource.

      struct EnabledBaselineDetails
        include JSON::Serializable

        # The ARN of the EnabledBaseline resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The specific Baseline enabled as part of the EnabledBaseline resource.

        @[JSON::Field(key: "baselineIdentifier")]
        getter baseline_identifier : String


        @[JSON::Field(key: "statusSummary")]
        getter status_summary : Types::EnablementStatusSummary

        # The target on which to enable the Baseline .

        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : String

        # The enabled version of the Baseline .

        @[JSON::Field(key: "baselineVersion")]
        getter baseline_version : String?

        # The drift status of the enabled baseline.

        @[JSON::Field(key: "driftStatusSummary")]
        getter drift_status_summary : Types::EnabledBaselineDriftStatusSummary?

        # Shows the parameters that are applied when enabling this Baseline .

        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::EnabledBaselineParameterSummary)?

        # An ARN that represents the parent EnabledBaseline at the Organizational Unit (OU) level, from which
        # the child EnabledBaseline inherits its configuration. The value is returned by GetEnabledBaseline .

        @[JSON::Field(key: "parentIdentifier")]
        getter parent_identifier : String?

        def initialize(
          @arn : String,
          @baseline_identifier : String,
          @status_summary : Types::EnablementStatusSummary,
          @target_identifier : String,
          @baseline_version : String? = nil,
          @drift_status_summary : Types::EnabledBaselineDriftStatusSummary? = nil,
          @parameters : Array(Types::EnabledBaselineParameterSummary)? = nil,
          @parent_identifier : String? = nil
        )
        end
      end

      # The drift summary of the enabled baseline. Amazon Web Services Control Tower reports inheritance
      # drift when an enabled baseline configuration of a member account is different than the configuration
      # that applies to the OU. Amazon Web Services Control Tower reports this type of drift for a parent or
      # child enabled baseline. One way to repair this drift by resetting the parent enabled baseline, on
      # the OU. For example, you may see this type of drift if you move accounts between OUs, but the
      # accounts are not yet (re-)enrolled.

      struct EnabledBaselineDriftStatusSummary
        include JSON::Serializable

        # The types of drift that can be detected for an enabled baseline. Amazon Web Services Control Tower
        # detects inheritance drift on enabled baselines that apply at the OU level.

        @[JSON::Field(key: "types")]
        getter types : Types::EnabledBaselineDriftTypes?

        def initialize(
          @types : Types::EnabledBaselineDriftTypes? = nil
        )
        end
      end

      # The types of drift that can be detected for an enabled baseline. Amazon Web Services Control Tower
      # detects inheritance drift on the enabled baselines that target OUs: AWSControlTowerBaseline and
      # BackupBaseline . Amazon Web Services Control Tower does not detect drift on the baselines that apply
      # to your landing zone: IdentityCenterBaseline , AuditBaseline , LogArchiveBaseline ,
      # BackupCentralVaultBaseline , or BackupAdminBaseline . For more information, see Types of baselines .
      # Baselines enabled on an OU are inherited by its member accounts as child EnabledBaseline resources.
      # The baseline on the OU serves as the parent EnabledBaseline , which governs the configuration of
      # each child EnabledBaseline . If the baseline configuration of a member account in an OU does not
      # match the configuration of the parent OU, the parent and child baseline is in a state of inheritance
      # drift. This drift could occur in the AWSControlTowerBaseline or the BackupBaseline related to that
      # account.

      struct EnabledBaselineDriftTypes
        include JSON::Serializable

        # At least one account within the target OU does not match the baseline configuration defined on that
        # OU. An account is in inheritance drift when it does not match the configuration of a parent OU,
        # possibly a new parent OU, if the account is moved.

        @[JSON::Field(key: "inheritance")]
        getter inheritance : Types::EnabledBaselineInheritanceDrift?

        def initialize(
          @inheritance : Types::EnabledBaselineInheritanceDrift? = nil
        )
        end
      end

      # A filter applied on the ListEnabledBaseline operation. Allowed filters are baselineIdentifiers and
      # targetIdentifiers . The filter can be applied for either, or both.

      struct EnabledBaselineFilter
        include JSON::Serializable

        # Identifiers for the Baseline objects returned as part of the filter operation.

        @[JSON::Field(key: "baselineIdentifiers")]
        getter baseline_identifiers : Array(String)?

        # A list of EnabledBaselineDriftStatus items for enabled baselines.

        @[JSON::Field(key: "inheritanceDriftStatuses")]
        getter inheritance_drift_statuses : Array(String)?

        # An optional filter that sets up a list of parentIdentifiers to filter the results of the
        # ListEnabledBaseline output.

        @[JSON::Field(key: "parentIdentifiers")]
        getter parent_identifiers : Array(String)?

        # A list of EnablementStatus items.

        @[JSON::Field(key: "statuses")]
        getter statuses : Array(String)?

        # Identifiers for the targets of the Baseline filter operation.

        @[JSON::Field(key: "targetIdentifiers")]
        getter target_identifiers : Array(String)?

        def initialize(
          @baseline_identifiers : Array(String)? = nil,
          @inheritance_drift_statuses : Array(String)? = nil,
          @parent_identifiers : Array(String)? = nil,
          @statuses : Array(String)? = nil,
          @target_identifiers : Array(String)? = nil
        )
        end
      end

      # The inheritance drift summary for the enabled baseline. Inheritance drift occurs when any accounts
      # in the target OU do not match the baseline configuration defined on that OU.

      struct EnabledBaselineInheritanceDrift
        include JSON::Serializable

        # The inheritance drift status for enabled baselines.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # A key-value parameter to an EnabledBaseline resource.

      struct EnabledBaselineParameter
        include JSON::Serializable

        # A string denoting the parameter key.

        @[JSON::Field(key: "key")]
        getter key : String

        # A low-level Document object of any type (for example, a Java Object).

        @[JSON::Field(key: "value")]
        getter value : Types::EnabledBaselineParameterDocument

        def initialize(
          @key : String,
          @value : Types::EnabledBaselineParameterDocument
        )
        end
      end


      struct EnabledBaselineParameterDocument
        include JSON::Serializable

        def initialize
        end
      end

      # Summary of an applied parameter to an EnabledBaseline resource.

      struct EnabledBaselineParameterSummary
        include JSON::Serializable

        # A string denoting the parameter key.

        @[JSON::Field(key: "key")]
        getter key : String

        # A low-level document object of any type (for example, a Java Object).

        @[JSON::Field(key: "value")]
        getter value : Types::EnabledBaselineParameterDocument

        def initialize(
          @key : String,
          @value : Types::EnabledBaselineParameterDocument
        )
        end
      end

      # Returns a summary of information about an EnabledBaseline object.

      struct EnabledBaselineSummary
        include JSON::Serializable

        # The ARN of the EnabledBaseline resource

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The specific baseline that is enabled as part of the EnabledBaseline resource.

        @[JSON::Field(key: "baselineIdentifier")]
        getter baseline_identifier : String


        @[JSON::Field(key: "statusSummary")]
        getter status_summary : Types::EnablementStatusSummary

        # The target upon which the baseline is enabled.

        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : String

        # The enabled version of the baseline.

        @[JSON::Field(key: "baselineVersion")]
        getter baseline_version : String?

        # The drift status of the enabled baseline.

        @[JSON::Field(key: "driftStatusSummary")]
        getter drift_status_summary : Types::EnabledBaselineDriftStatusSummary?

        # An ARN that represents an object returned by ListEnabledBaseline , to describe an enabled baseline.

        @[JSON::Field(key: "parentIdentifier")]
        getter parent_identifier : String?

        def initialize(
          @arn : String,
          @baseline_identifier : String,
          @status_summary : Types::EnablementStatusSummary,
          @target_identifier : String,
          @baseline_version : String? = nil,
          @drift_status_summary : Types::EnabledBaselineDriftStatusSummary? = nil,
          @parent_identifier : String? = nil
        )
        end
      end

      # Information about the enabled control.

      struct EnabledControlDetails
        include JSON::Serializable

        # The ARN of the enabled control.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The control identifier of the enabled control. For information on how to find the controlIdentifier
        # , see the overview page .

        @[JSON::Field(key: "controlIdentifier")]
        getter control_identifier : String?

        # The drift status of the enabled control.

        @[JSON::Field(key: "driftStatusSummary")]
        getter drift_status_summary : Types::DriftStatusSummary?

        # Array of EnabledControlParameter objects.

        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::EnabledControlParameterSummary)?

        # The ARN of the parent enabled control from which this control inherits its configuration, if
        # applicable.

        @[JSON::Field(key: "parentIdentifier")]
        getter parent_identifier : String?

        # The deployment summary of the enabled control.

        @[JSON::Field(key: "statusSummary")]
        getter status_summary : Types::EnablementStatusSummary?

        # The ARN of the organizational unit. For information on how to find the targetIdentifier , see the
        # overview page .

        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : String?

        # Target Amazon Web Services Regions for the enabled control.

        @[JSON::Field(key: "targetRegions")]
        getter target_regions : Array(Types::Region)?

        def initialize(
          @arn : String? = nil,
          @control_identifier : String? = nil,
          @drift_status_summary : Types::DriftStatusSummary? = nil,
          @parameters : Array(Types::EnabledControlParameterSummary)? = nil,
          @parent_identifier : String? = nil,
          @status_summary : Types::EnablementStatusSummary? = nil,
          @target_identifier : String? = nil,
          @target_regions : Array(Types::Region)? = nil
        )
        end
      end

      # Defines the various categories of drift that can occur for an enabled control resource.

      struct EnabledControlDriftTypes
        include JSON::Serializable

        # Indicates drift related to inheritance configuration between parent and child controls.

        @[JSON::Field(key: "inheritance")]
        getter inheritance : Types::EnabledControlInheritanceDrift?

        # Indicates drift related to the underlying Amazon Web Services resources managed by the control.

        @[JSON::Field(key: "resource")]
        getter resource : Types::EnabledControlResourceDrift?

        def initialize(
          @inheritance : Types::EnabledControlInheritanceDrift? = nil,
          @resource : Types::EnabledControlResourceDrift? = nil
        )
        end
      end

      # A structure that returns a set of control identifiers, the control status for each control in the
      # set, and the drift status for each control in the set.

      struct EnabledControlFilter
        include JSON::Serializable

        # The set of controlIdentifier returned by the filter.

        @[JSON::Field(key: "controlIdentifiers")]
        getter control_identifiers : Array(String)?

        # A list of DriftStatus items.

        @[JSON::Field(key: "driftStatuses")]
        getter drift_statuses : Array(String)?

        # Filters enabled controls by their inheritance drift status, allowing you to find controls with
        # specific inheritance-related drift conditions.

        @[JSON::Field(key: "inheritanceDriftStatuses")]
        getter inheritance_drift_statuses : Array(String)?

        # Filters enabled controls by their parent control identifiers, allowing you to find child controls of
        # specific parent controls.

        @[JSON::Field(key: "parentIdentifiers")]
        getter parent_identifiers : Array(String)?

        # Filters enabled controls by their resource drift status, allowing you to find controls with specific
        # resource-related drift conditions.

        @[JSON::Field(key: "resourceDriftStatuses")]
        getter resource_drift_statuses : Array(String)?

        # A list of EnablementStatus items.

        @[JSON::Field(key: "statuses")]
        getter statuses : Array(String)?

        def initialize(
          @control_identifiers : Array(String)? = nil,
          @drift_statuses : Array(String)? = nil,
          @inheritance_drift_statuses : Array(String)? = nil,
          @parent_identifiers : Array(String)? = nil,
          @resource_drift_statuses : Array(String)? = nil,
          @statuses : Array(String)? = nil
        )
        end
      end

      # Represents drift information related to control inheritance between organizational units.

      struct EnabledControlInheritanceDrift
        include JSON::Serializable

        # The status of inheritance drift for the enabled control, indicating whether inheritance
        # configuration matches expectations.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # A key/value pair, where Key is of type String and Value is of type Document .

      struct EnabledControlParameter
        include JSON::Serializable

        # The key of a key/value pair.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of a key/value pair.

        @[JSON::Field(key: "value")]
        getter value : Types::Document

        def initialize(
          @key : String,
          @value : Types::Document
        )
        end
      end

      # Returns a summary of information about the parameters of an enabled control.

      struct EnabledControlParameterSummary
        include JSON::Serializable

        # The key of a key/value pair.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of a key/value pair.

        @[JSON::Field(key: "value")]
        getter value : Types::Document

        def initialize(
          @key : String,
          @value : Types::Document
        )
        end
      end

      # Represents drift information related to the underlying Amazon Web Services resources managed by the
      # control.

      struct EnabledControlResourceDrift
        include JSON::Serializable

        # The status of resource drift for the enabled control, indicating whether the underlying resources
        # match the expected configuration.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # Returns a summary of information about an enabled control.

      struct EnabledControlSummary
        include JSON::Serializable

        # The ARN of the enabled control.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The controlIdentifier of the enabled control.

        @[JSON::Field(key: "controlIdentifier")]
        getter control_identifier : String?

        # The drift status of the enabled control.

        @[JSON::Field(key: "driftStatusSummary")]
        getter drift_status_summary : Types::DriftStatusSummary?

        # The ARN of the parent enabled control from which this control inherits its configuration, if
        # applicable.

        @[JSON::Field(key: "parentIdentifier")]
        getter parent_identifier : String?

        # A short description of the status of the enabled control.

        @[JSON::Field(key: "statusSummary")]
        getter status_summary : Types::EnablementStatusSummary?

        # The ARN of the organizational unit.

        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : String?

        def initialize(
          @arn : String? = nil,
          @control_identifier : String? = nil,
          @drift_status_summary : Types::DriftStatusSummary? = nil,
          @parent_identifier : String? = nil,
          @status_summary : Types::EnablementStatusSummary? = nil,
          @target_identifier : String? = nil
        )
        end
      end

      # The deployment summary of an EnabledControl or EnabledBaseline resource.

      struct EnablementStatusSummary
        include JSON::Serializable

        # The last operation identifier for the enabled resource.

        @[JSON::Field(key: "lastOperationIdentifier")]
        getter last_operation_identifier : String?

        # The deployment status of the enabled resource. Valid values: SUCCEEDED : The EnabledControl or
        # EnabledBaseline configuration was deployed successfully. UNDER_CHANGE : The EnabledControl or
        # EnabledBaseline configuration is changing. FAILED : The EnabledControl or EnabledBaseline
        # configuration failed to deploy.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @last_operation_identifier : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetBaselineInput
        include JSON::Serializable

        # The ARN of the Baseline resource to be retrieved.

        @[JSON::Field(key: "baselineIdentifier")]
        getter baseline_identifier : String

        def initialize(
          @baseline_identifier : String
        )
        end
      end


      struct GetBaselineOperationInput
        include JSON::Serializable

        # The operation ID returned from mutating asynchronous APIs (Enable, Disable, Update, Reset).

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @operation_identifier : String
        )
        end
      end


      struct GetBaselineOperationOutput
        include JSON::Serializable

        # A baselineOperation object that shows information about the specified operation ID.

        @[JSON::Field(key: "baselineOperation")]
        getter baseline_operation : Types::BaselineOperation

        def initialize(
          @baseline_operation : Types::BaselineOperation
        )
        end
      end


      struct GetBaselineOutput
        include JSON::Serializable

        # The baseline ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # A user-friendly name for the baseline.

        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the baseline.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @name : String,
          @description : String? = nil
        )
        end
      end


      struct GetControlOperationInput
        include JSON::Serializable

        # The ID of the asynchronous operation, which is used to track status. The operation is available for
        # 90 days.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @operation_identifier : String
        )
        end
      end


      struct GetControlOperationOutput
        include JSON::Serializable

        # An operation performed by the control.

        @[JSON::Field(key: "controlOperation")]
        getter control_operation : Types::ControlOperation

        def initialize(
          @control_operation : Types::ControlOperation
        )
        end
      end


      struct GetEnabledBaselineInput
        include JSON::Serializable

        # Identifier of the EnabledBaseline resource to be retrieved, in ARN format.

        @[JSON::Field(key: "enabledBaselineIdentifier")]
        getter enabled_baseline_identifier : String

        def initialize(
          @enabled_baseline_identifier : String
        )
        end
      end


      struct GetEnabledBaselineOutput
        include JSON::Serializable

        # Details of the EnabledBaseline resource.

        @[JSON::Field(key: "enabledBaselineDetails")]
        getter enabled_baseline_details : Types::EnabledBaselineDetails?

        def initialize(
          @enabled_baseline_details : Types::EnabledBaselineDetails? = nil
        )
        end
      end


      struct GetEnabledControlInput
        include JSON::Serializable

        # The controlIdentifier of the enabled control.

        @[JSON::Field(key: "enabledControlIdentifier")]
        getter enabled_control_identifier : String

        def initialize(
          @enabled_control_identifier : String
        )
        end
      end


      struct GetEnabledControlOutput
        include JSON::Serializable

        # Information about the enabled control.

        @[JSON::Field(key: "enabledControlDetails")]
        getter enabled_control_details : Types::EnabledControlDetails

        def initialize(
          @enabled_control_details : Types::EnabledControlDetails
        )
        end
      end


      struct GetLandingZoneInput
        include JSON::Serializable

        # The unique identifier of the landing zone.

        @[JSON::Field(key: "landingZoneIdentifier")]
        getter landing_zone_identifier : String

        def initialize(
          @landing_zone_identifier : String
        )
        end
      end


      struct GetLandingZoneOperationInput
        include JSON::Serializable

        # A unique identifier assigned to a landing zone operation.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @operation_identifier : String
        )
        end
      end


      struct GetLandingZoneOperationOutput
        include JSON::Serializable

        # Details about a landing zone operation.

        @[JSON::Field(key: "operationDetails")]
        getter operation_details : Types::LandingZoneOperationDetail

        def initialize(
          @operation_details : Types::LandingZoneOperationDetail
        )
        end
      end


      struct GetLandingZoneOutput
        include JSON::Serializable

        # Information about the landing zone.

        @[JSON::Field(key: "landingZone")]
        getter landing_zone : Types::LandingZoneDetail

        def initialize(
          @landing_zone : Types::LandingZoneDetail
        )
        end
      end

      # An unexpected error occurred during processing of a request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Information about the landing zone.

      struct LandingZoneDetail
        include JSON::Serializable

        # The landing zone manifest JSON text file that specifies the landing zone configurations.

        @[JSON::Field(key: "manifest")]
        getter manifest : Types::Manifest

        # The landing zone's current deployed version.

        @[JSON::Field(key: "version")]
        getter version : String

        # The ARN of the landing zone.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The drift status of the landing zone.

        @[JSON::Field(key: "driftStatus")]
        getter drift_status : Types::LandingZoneDriftStatusSummary?

        # The latest available version of the landing zone.

        @[JSON::Field(key: "latestAvailableVersion")]
        getter latest_available_version : String?

        # The types of remediation actions configured for the landing zone, such as automatic drift correction
        # or compliance enforcement.

        @[JSON::Field(key: "remediationTypes")]
        getter remediation_types : Array(String)?

        # The landing zone deployment status. One of ACTIVE , PROCESSING , FAILED .

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @manifest : Types::Manifest,
          @version : String,
          @arn : String? = nil,
          @drift_status : Types::LandingZoneDriftStatusSummary? = nil,
          @latest_available_version : String? = nil,
          @remediation_types : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      # The drift status summary of the landing zone. If the landing zone differs from the expected
      # configuration, it is defined to be in a state of drift. You can repair this drift by resetting the
      # landing zone.

      struct LandingZoneDriftStatusSummary
        include JSON::Serializable

        # The drift status of the landing zone. Valid values: DRIFTED : The landing zone deployed in this
        # configuration does not match the configuration that Amazon Web Services Control Tower expected.
        # IN_SYNC : The landing zone deployed in this configuration matches the configuration that Amazon Web
        # Services Control Tower expected.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # Information about a landing zone operation.

      struct LandingZoneOperationDetail
        include JSON::Serializable

        # The landing zone operation end time.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The operationIdentifier of the landing zone operation.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String?

        # The landing zone operation type. Valid values: DELETE : The DeleteLandingZone operation. CREATE :
        # The CreateLandingZone operation. UPDATE : The UpdateLandingZone operation. RESET : The
        # ResetLandingZone operation.

        @[JSON::Field(key: "operationType")]
        getter operation_type : String?

        # The landing zone operation start time.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Valid values: SUCCEEDED : The landing zone operation succeeded. IN_PROGRESS : The landing zone
        # operation is in progress. FAILED : The landing zone operation failed.

        @[JSON::Field(key: "status")]
        getter status : String?

        # If the operation result is FAILED, this string contains a message explaining why the operation
        # failed.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @end_time : Time? = nil,
          @operation_identifier : String? = nil,
          @operation_type : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # A filter object that lets you call ListLandingZoneOperations with a specific filter.

      struct LandingZoneOperationFilter
        include JSON::Serializable

        # The statuses of the set of landing zone operations selected by the filter.

        @[JSON::Field(key: "statuses")]
        getter statuses : Array(String)?

        # The set of landing zone operation types selected by the filter.

        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @statuses : Array(String)? = nil,
          @types : Array(String)? = nil
        )
        end
      end

      # Returns a summary of information about a landing zone operation.

      struct LandingZoneOperationSummary
        include JSON::Serializable

        # The operationIdentifier of the landing zone operation.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String?

        # The type of the landing zone operation.

        @[JSON::Field(key: "operationType")]
        getter operation_type : String?

        # The status of the landing zone operation.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @operation_identifier : String? = nil,
          @operation_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Returns a summary of information about a landing zone.

      struct LandingZoneSummary
        include JSON::Serializable

        # The ARN of the landing zone.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct ListBaselinesInput
        include JSON::Serializable

        # The maximum number of results to be shown.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBaselinesOutput
        include JSON::Serializable

        # A list of Baseline object details.

        @[JSON::Field(key: "baselines")]
        getter baselines : Array(Types::BaselineSummary)

        # A pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @baselines : Array(Types::BaselineSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListControlOperationsInput
        include JSON::Serializable

        # An input filter for the ListControlOperations API that lets you select the types of control
        # operations to view.

        @[JSON::Field(key: "filter")]
        getter filter : Types::ControlOperationFilter?

        # The maximum number of results to be shown.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ControlOperationFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListControlOperationsOutput
        include JSON::Serializable

        # Returns a list of output from control operations.

        @[JSON::Field(key: "controlOperations")]
        getter control_operations : Array(Types::ControlOperationSummary)

        # A pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @control_operations : Array(Types::ControlOperationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListEnabledBaselinesInput
        include JSON::Serializable

        # A filter applied on the ListEnabledBaseline operation. Allowed filters are baselineIdentifiers and
        # targetIdentifiers . The filter can be applied for either, or both.

        @[JSON::Field(key: "filter")]
        getter filter : Types::EnabledBaselineFilter?

        # A value that can be set to include the child enabled baselines in responses. The default value is
        # false.

        @[JSON::Field(key: "includeChildren")]
        getter include_children : Bool?

        # The maximum number of results to be shown.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::EnabledBaselineFilter? = nil,
          @include_children : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnabledBaselinesOutput
        include JSON::Serializable

        # Retuens a list of summaries of EnabledBaseline resources.

        @[JSON::Field(key: "enabledBaselines")]
        getter enabled_baselines : Array(Types::EnabledBaselineSummary)

        # A pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @enabled_baselines : Array(Types::EnabledBaselineSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListEnabledControlsInput
        include JSON::Serializable

        # An input filter for the ListEnabledControls API that lets you select the types of control operations
        # to view.

        @[JSON::Field(key: "filter")]
        getter filter : Types::EnabledControlFilter?

        # A boolean value that determines whether to include enabled controls from child organizational units
        # in the response.

        @[JSON::Field(key: "includeChildren")]
        getter include_children : Bool?

        # How many results to return per API call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to continue the list from a previous API call with the same parameters.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ARN of the organizational unit. For information on how to find the targetIdentifier , see the
        # overview page .

        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : String?

        def initialize(
          @filter : Types::EnabledControlFilter? = nil,
          @include_children : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @target_identifier : String? = nil
        )
        end
      end


      struct ListEnabledControlsOutput
        include JSON::Serializable

        # Lists the controls enabled by Amazon Web Services Control Tower on the specified organizational unit
        # and the accounts it contains.

        @[JSON::Field(key: "enabledControls")]
        getter enabled_controls : Array(Types::EnabledControlSummary)

        # Retrieves the next page of results. If the string is empty, the response is the end of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @enabled_controls : Array(Types::EnabledControlSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListLandingZoneOperationsInput
        include JSON::Serializable

        # An input filter for the ListLandingZoneOperations API that lets you select the types of landing zone
        # operations to view.

        @[JSON::Field(key: "filter")]
        getter filter : Types::LandingZoneOperationFilter?

        # How many results to return per API call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to continue the list from a previous API call with the same parameters.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::LandingZoneOperationFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLandingZoneOperationsOutput
        include JSON::Serializable

        # Lists landing zone operations.

        @[JSON::Field(key: "landingZoneOperations")]
        getter landing_zone_operations : Array(Types::LandingZoneOperationSummary)

        # Retrieves the next page of results. If the string is empty, the response is the end of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @landing_zone_operations : Array(Types::LandingZoneOperationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListLandingZonesInput
        include JSON::Serializable

        # The maximum number of returned landing zone ARNs, which is one.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to continue the list from a previous API call with the same parameters.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLandingZonesOutput
        include JSON::Serializable

        # The ARN of the landing zone.

        @[JSON::Field(key: "landingZones")]
        getter landing_zones : Array(Types::LandingZoneSummary)

        # Retrieves the next page of results. If the string is empty, the response is the end of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @landing_zones : Array(Types::LandingZoneSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # A list of tags, as key:value strings.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end


      struct Manifest
        include JSON::Serializable

        def initialize
        end
      end

      # An Amazon Web Services Region in which Amazon Web Services Control Tower expects to find the control
      # deployed. The expected Regions are based on the Regions that are governed by the landing zone. In
      # certain cases, a control is not actually enabled in the Region as expected, such as during drift, or
      # mixed governance .

      struct Region
        include JSON::Serializable

        # The Amazon Web Services Region name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end


      struct ResetEnabledBaselineInput
        include JSON::Serializable

        # Specifies the ID of the EnabledBaseline resource to be re-enabled, in ARN format.

        @[JSON::Field(key: "enabledBaselineIdentifier")]
        getter enabled_baseline_identifier : String

        def initialize(
          @enabled_baseline_identifier : String
        )
        end
      end


      struct ResetEnabledBaselineOutput
        include JSON::Serializable

        # The ID (in UUID format) of the asynchronous ResetEnabledBaseline operation. This operationIdentifier
        # is used to track status through calls to the GetBaselineOperation API.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @operation_identifier : String
        )
        end
      end


      struct ResetEnabledControlInput
        include JSON::Serializable

        # The ARN of the enabled control to be reset.

        @[JSON::Field(key: "enabledControlIdentifier")]
        getter enabled_control_identifier : String

        def initialize(
          @enabled_control_identifier : String
        )
        end
      end


      struct ResetEnabledControlOutput
        include JSON::Serializable

        # The operation identifier for this ResetEnabledControl operation.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @operation_identifier : String
        )
        end
      end


      struct ResetLandingZoneInput
        include JSON::Serializable

        # The unique identifier of the landing zone.

        @[JSON::Field(key: "landingZoneIdentifier")]
        getter landing_zone_identifier : String

        def initialize(
          @landing_zone_identifier : String
        )
        end
      end


      struct ResetLandingZoneOutput
        include JSON::Serializable

        # A unique identifier assigned to a ResetLandingZone operation. You can use this identifier as an
        # input parameter of GetLandingZoneOperation to check the operation's status.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @operation_identifier : String
        )
        end
      end

      # The request references a resource that does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request would cause a service quota to be exceeded. See Service quotas .

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The ARN of the resource to be tagged.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Tags to be applied to the resource.

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

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the service quota that was exceeded.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The number of seconds the caller should wait before retrying.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The ID of the service that is associated with the error.

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


      struct UntagResourceInput
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Tag keys to be removed from the resource.

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


      struct UpdateEnabledBaselineInput
        include JSON::Serializable

        # Specifies the new Baseline version, to which the EnabledBaseline should be updated.

        @[JSON::Field(key: "baselineVersion")]
        getter baseline_version : String

        # Specifies the EnabledBaseline resource to be updated.

        @[JSON::Field(key: "enabledBaselineIdentifier")]
        getter enabled_baseline_identifier : String

        # Parameters to apply when making an update.

        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::EnabledBaselineParameter)?

        def initialize(
          @baseline_version : String,
          @enabled_baseline_identifier : String,
          @parameters : Array(Types::EnabledBaselineParameter)? = nil
        )
        end
      end


      struct UpdateEnabledBaselineOutput
        include JSON::Serializable

        # The ID (in UUID format) of the asynchronous UpdateEnabledBaseline operation. This
        # operationIdentifier is used to track status through calls to the GetBaselineOperation API.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @operation_identifier : String
        )
        end
      end


      struct UpdateEnabledControlInput
        include JSON::Serializable

        # The ARN of the enabled control that will be updated.

        @[JSON::Field(key: "enabledControlIdentifier")]
        getter enabled_control_identifier : String

        # A key/value pair, where Key is of type String and Value is of type Document .

        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::EnabledControlParameter)

        def initialize(
          @enabled_control_identifier : String,
          @parameters : Array(Types::EnabledControlParameter)
        )
        end
      end


      struct UpdateEnabledControlOutput
        include JSON::Serializable

        # The operation identifier for this UpdateEnabledControl operation.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @operation_identifier : String
        )
        end
      end


      struct UpdateLandingZoneInput
        include JSON::Serializable

        # The unique identifier of the landing zone.

        @[JSON::Field(key: "landingZoneIdentifier")]
        getter landing_zone_identifier : String

        # The landing zone version, for example, 3.2.

        @[JSON::Field(key: "version")]
        getter version : String

        # The manifest file (JSON) is a text file that describes your Amazon Web Services resources. For an
        # example, review Launch your landing zone . The example manifest file contains each of the available
        # parameters. The schema for the landing zone's JSON manifest file is not published, by design.

        @[JSON::Field(key: "manifest")]
        getter manifest : Types::Manifest?

        # Specifies the types of remediation actions to apply when updating the landing zone configuration.

        @[JSON::Field(key: "remediationTypes")]
        getter remediation_types : Array(String)?

        def initialize(
          @landing_zone_identifier : String,
          @version : String,
          @manifest : Types::Manifest? = nil,
          @remediation_types : Array(String)? = nil
        )
        end
      end


      struct UpdateLandingZoneOutput
        include JSON::Serializable

        # A unique identifier assigned to a UpdateLandingZone operation. You can use this identifier as an
        # input of GetLandingZoneOperation to check the operation's status.

        @[JSON::Field(key: "operationIdentifier")]
        getter operation_identifier : String

        def initialize(
          @operation_identifier : String
        )
        end
      end

      # The input does not satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
