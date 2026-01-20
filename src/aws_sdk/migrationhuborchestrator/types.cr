require "json"
require "time"

module AwsSdk
  module MigrationHubOrchestrator
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

      # This exception is thrown when an attempt to update or delete a resource would cause an inconsistent
      # state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct CreateMigrationWorkflowRequest
        include JSON::Serializable

        # The input parameters required to create a migration workflow.

        @[JSON::Field(key: "inputParameters")]
        getter input_parameters : Hash(String, Types::StepInput)

        # The name of the migration workflow.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        # The configuration ID of the application configured in Application Discovery Service.

        @[JSON::Field(key: "applicationConfigurationId")]
        getter application_configuration_id : String?

        # The description of the migration workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The servers on which a step will be run.

        @[JSON::Field(key: "stepTargets")]
        getter step_targets : Array(String)?

        # The tags to add on a migration workflow.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @input_parameters : Hash(String, Types::StepInput),
          @name : String,
          @template_id : String,
          @application_configuration_id : String? = nil,
          @description : String? = nil,
          @step_targets : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateMigrationWorkflowResponse
        include JSON::Serializable

        # The configuration ID of the application configured in Application Discovery Service.

        @[JSON::Field(key: "adsApplicationConfigurationId")]
        getter ads_application_configuration_id : String?

        # The Amazon Resource Name (ARN) of the migration workflow.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time at which the migration workflow was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the migration workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the migration workflow.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the migration workflow.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the migration workflow.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The servers on which a step will be run.

        @[JSON::Field(key: "stepTargets")]
        getter step_targets : Array(String)?

        # The tags to add on a migration workflow.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        # The inputs for creating a migration workflow.

        @[JSON::Field(key: "workflowInputs")]
        getter workflow_inputs : Hash(String, Types::StepInput)?

        def initialize(
          @ads_application_configuration_id : String? = nil,
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @step_targets : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @template_id : String? = nil,
          @workflow_inputs : Hash(String, Types::StepInput)? = nil
        )
        end
      end


      struct CreateTemplateRequest
        include JSON::Serializable

        # The name of the migration workflow template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The source of the migration workflow template.

        @[JSON::Field(key: "templateSource")]
        getter template_source : Types::TemplateSource

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
        # more information, see Idempotency in the Smithy documentation.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags to add to the migration workflow template.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # A description of the migration workflow template.

        @[JSON::Field(key: "templateDescription")]
        getter template_description : String?

        def initialize(
          @template_name : String,
          @template_source : Types::TemplateSource,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil,
          @template_description : String? = nil
        )
        end
      end


      struct CreateTemplateResponse
        include JSON::Serializable

        # The tags added to the migration workflow template.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the migration workflow template. The format for an Migration Hub
        # Orchestrator template ARN is
        # arn:aws:migrationhub-orchestrator:region:account:template/template-abcd1234 . For more information
        # about ARNs, see Amazon Resource Names (ARNs) in the AWS General Reference .

        @[JSON::Field(key: "templateArn")]
        getter template_arn : String?

        # The ID of the migration workflow template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        def initialize(
          @tags : Hash(String, String)? = nil,
          @template_arn : String? = nil,
          @template_id : String? = nil
        )
        end
      end


      struct CreateWorkflowStepGroupRequest
        include JSON::Serializable

        # The name of the step group.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the migration workflow that will contain the step group.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The description of the step group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The next step group.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The previous step group.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        def initialize(
          @name : String,
          @workflow_id : String,
          @description : String? = nil,
          @next : Array(String)? = nil,
          @previous : Array(String)? = nil
        )
        end
      end


      struct CreateWorkflowStepGroupResponse
        include JSON::Serializable

        # The time at which the step group is created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the step group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the step group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the step group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next step group.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The previous step group.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        # List of AWS services utilized in a migration workflow.

        @[JSON::Field(key: "tools")]
        getter tools : Array(Types::Tool)?

        # The ID of the migration workflow that contains the step group.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        def initialize(
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @next : Array(String)? = nil,
          @previous : Array(String)? = nil,
          @tools : Array(Types::Tool)? = nil,
          @workflow_id : String? = nil
        )
        end
      end


      struct CreateWorkflowStepRequest
        include JSON::Serializable

        # The name of the step.

        @[JSON::Field(key: "name")]
        getter name : String

        # The action type of the step. You must run and update the status of a manual step for the workflow to
        # continue after the completion of the step.

        @[JSON::Field(key: "stepActionType")]
        getter step_action_type : String

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The description of the step.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The next step.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The key value pairs added for the expected output.

        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::WorkflowStepOutput)?

        # The previous step.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        # The servers on which a step will be run.

        @[JSON::Field(key: "stepTarget")]
        getter step_target : Array(String)?

        # The custom script to run tests on source or target environments.

        @[JSON::Field(key: "workflowStepAutomationConfiguration")]
        getter workflow_step_automation_configuration : Types::WorkflowStepAutomationConfiguration?

        def initialize(
          @name : String,
          @step_action_type : String,
          @step_group_id : String,
          @workflow_id : String,
          @description : String? = nil,
          @next : Array(String)? = nil,
          @outputs : Array(Types::WorkflowStepOutput)? = nil,
          @previous : Array(String)? = nil,
          @step_target : Array(String)? = nil,
          @workflow_step_automation_configuration : Types::WorkflowStepAutomationConfiguration? = nil
        )
        end
      end


      struct CreateWorkflowStepResponse
        include JSON::Serializable

        # The ID of the step.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String?

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @step_group_id : String? = nil,
          @workflow_id : String? = nil
        )
        end
      end


      struct DeleteMigrationWorkflowRequest
        include JSON::Serializable

        # The ID of the migration workflow you want to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteMigrationWorkflowResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the migration workflow.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the migration workflow.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the migration workflow.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeleteTemplateRequest
        include JSON::Serializable

        # The ID of the request to delete a migration workflow template.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWorkflowStepGroupRequest
        include JSON::Serializable

        # The ID of the step group you want to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        def initialize(
          @id : String,
          @workflow_id : String
        )
        end
      end


      struct DeleteWorkflowStepGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWorkflowStepRequest
        include JSON::Serializable

        # The ID of the step you want to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the step group that contains the step you want to delete.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        def initialize(
          @id : String,
          @step_group_id : String,
          @workflow_id : String
        )
        end
      end


      struct DeleteWorkflowStepResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct GetMigrationWorkflowRequest
        include JSON::Serializable

        # The ID of the migration workflow.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetMigrationWorkflowResponse
        include JSON::Serializable

        # The configuration ID of the application configured in Application Discovery Service.

        @[JSON::Field(key: "adsApplicationConfigurationId")]
        getter ads_application_configuration_id : String?

        # The name of the application configured in Application Discovery Service.

        @[JSON::Field(key: "adsApplicationName")]
        getter ads_application_name : String?

        # The Amazon Resource Name (ARN) of the migration workflow.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Get a list of completed steps in the migration workflow.

        @[JSON::Field(key: "completedSteps")]
        getter completed_steps : Int32?

        # The time at which the migration workflow was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the migration workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time at which the migration workflow ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The ID of the migration workflow.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time at which the migration workflow was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # The time at which the migration workflow was last started.

        @[JSON::Field(key: "lastStartTime")]
        getter last_start_time : Time?

        # The time at which the migration workflow was last stopped.

        @[JSON::Field(key: "lastStopTime")]
        getter last_stop_time : Time?

        # The name of the migration workflow.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the migration workflow.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the migration workflow.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The tags added to the migration workflow.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        # List of AWS services utilized in a migration workflow.

        @[JSON::Field(key: "tools")]
        getter tools : Array(Types::Tool)?

        # The total number of steps in the migration workflow.

        @[JSON::Field(key: "totalSteps")]
        getter total_steps : Int32?

        # The Amazon S3 bucket where the migration logs are stored.

        @[JSON::Field(key: "workflowBucket")]
        getter workflow_bucket : String?

        # The inputs required for creating the migration workflow.

        @[JSON::Field(key: "workflowInputs")]
        getter workflow_inputs : Hash(String, Types::StepInput)?

        def initialize(
          @ads_application_configuration_id : String? = nil,
          @ads_application_name : String? = nil,
          @arn : String? = nil,
          @completed_steps : Int32? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @end_time : Time? = nil,
          @id : String? = nil,
          @last_modified_time : Time? = nil,
          @last_start_time : Time? = nil,
          @last_stop_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @tags : Hash(String, String)? = nil,
          @template_id : String? = nil,
          @tools : Array(Types::Tool)? = nil,
          @total_steps : Int32? = nil,
          @workflow_bucket : String? = nil,
          @workflow_inputs : Hash(String, Types::StepInput)? = nil
        )
        end
      end


      struct GetMigrationWorkflowTemplateRequest
        include JSON::Serializable

        # The ID of the template.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetMigrationWorkflowTemplateResponse
        include JSON::Serializable

        # The time at which the template was last created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The time at which the template was last created.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the template.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The inputs provided for the creation of the migration workflow.

        @[JSON::Field(key: "inputs")]
        getter inputs : Array(Types::TemplateInput)?

        # The name of the template.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The owner of the migration workflow template.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The status of the template.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of retrieving migration workflow templates.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The tags added to the migration workflow template.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # &gt;The Amazon Resource Name (ARN) of the migration workflow template. The format for an Migration
        # Hub Orchestrator template ARN is
        # arn:aws:migrationhub-orchestrator:region:account:template/template-abcd1234 . For more information
        # about ARNs, see Amazon Resource Names (ARNs) in the AWS General Reference .

        @[JSON::Field(key: "templateArn")]
        getter template_arn : String?

        # The class of the migration workflow template. The available template classes are: A2C MGN SAP_MULTI
        # SQL_EC2 SQL_RDS VMIE

        @[JSON::Field(key: "templateClass")]
        getter template_class : String?

        # List of AWS services utilized in a migration workflow.

        @[JSON::Field(key: "tools")]
        getter tools : Array(Types::Tool)?

        def initialize(
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @inputs : Array(Types::TemplateInput)? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @tags : Hash(String, String)? = nil,
          @template_arn : String? = nil,
          @template_class : String? = nil,
          @tools : Array(Types::Tool)? = nil
        )
        end
      end


      struct GetTemplateStepGroupRequest
        include JSON::Serializable

        # The ID of the step group.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        def initialize(
          @id : String,
          @template_id : String
        )
        end
      end


      struct GetTemplateStepGroupResponse
        include JSON::Serializable

        # The time at which the step group was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the step group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the step group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time at which the step group was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the step group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next step group.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The previous step group.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        # The status of the step group.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        # List of AWS services utilized in a migration workflow.

        @[JSON::Field(key: "tools")]
        getter tools : Array(Types::Tool)?

        def initialize(
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @next : Array(String)? = nil,
          @previous : Array(String)? = nil,
          @status : String? = nil,
          @template_id : String? = nil,
          @tools : Array(Types::Tool)? = nil
        )
        end
      end


      struct GetTemplateStepRequest
        include JSON::Serializable

        # The ID of the step.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        def initialize(
          @id : String,
          @step_group_id : String,
          @template_id : String
        )
        end
      end


      struct GetTemplateStepResponse
        include JSON::Serializable

        # The time at which the step was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : String?

        # The description of the step.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the step.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next step.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The outputs of the step.

        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::StepOutput)?

        # The previous step.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        # The action type of the step. You must run and update the status of a manual step for the workflow to
        # continue after the completion of the step.

        @[JSON::Field(key: "stepActionType")]
        getter step_action_type : String?

        # The custom script to run tests on source or target environments.

        @[JSON::Field(key: "stepAutomationConfiguration")]
        getter step_automation_configuration : Types::StepAutomationConfiguration?

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String?

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        def initialize(
          @creation_time : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @next : Array(String)? = nil,
          @outputs : Array(Types::StepOutput)? = nil,
          @previous : Array(String)? = nil,
          @step_action_type : String? = nil,
          @step_automation_configuration : Types::StepAutomationConfiguration? = nil,
          @step_group_id : String? = nil,
          @template_id : String? = nil
        )
        end
      end


      struct GetWorkflowStepGroupRequest
        include JSON::Serializable

        # The ID of the step group.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        def initialize(
          @id : String,
          @workflow_id : String
        )
        end
      end


      struct GetWorkflowStepGroupResponse
        include JSON::Serializable

        # The time at which the step group was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the step group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time at which the step group ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The ID of the step group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time at which the step group was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the step group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next step group.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The owner of the step group.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The previous step group.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        # The status of the step group.

        @[JSON::Field(key: "status")]
        getter status : String?

        # List of AWS services utilized in a migration workflow.

        @[JSON::Field(key: "tools")]
        getter tools : Array(Types::Tool)?

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        def initialize(
          @creation_time : Time? = nil,
          @description : String? = nil,
          @end_time : Time? = nil,
          @id : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @next : Array(String)? = nil,
          @owner : String? = nil,
          @previous : Array(String)? = nil,
          @status : String? = nil,
          @tools : Array(Types::Tool)? = nil,
          @workflow_id : String? = nil
        )
        end
      end


      struct GetWorkflowStepRequest
        include JSON::Serializable

        # The ID of the step.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        def initialize(
          @id : String,
          @step_group_id : String,
          @workflow_id : String
        )
        end
      end


      struct GetWorkflowStepResponse
        include JSON::Serializable

        # The time at which the step was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the step.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time at which the step ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The time at which the workflow was last started.

        @[JSON::Field(key: "lastStartTime")]
        getter last_start_time : Time?

        # The name of the step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next step.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The number of servers that have been migrated.

        @[JSON::Field(key: "noOfSrvCompleted")]
        getter no_of_srv_completed : Int32?

        # The number of servers that have failed to migrate.

        @[JSON::Field(key: "noOfSrvFailed")]
        getter no_of_srv_failed : Int32?

        # The outputs of the step.

        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::WorkflowStepOutput)?

        # The owner of the step.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The previous step.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        # The output location of the script.

        @[JSON::Field(key: "scriptOutputLocation")]
        getter script_output_location : String?

        # The status of the step.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the migration workflow.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The action type of the step. You must run and update the status of a manual step for the workflow to
        # continue after the completion of the step.

        @[JSON::Field(key: "stepActionType")]
        getter step_action_type : String?

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String?

        # The ID of the step.

        @[JSON::Field(key: "stepId")]
        getter step_id : String?

        # The servers on which a step will be run.

        @[JSON::Field(key: "stepTarget")]
        getter step_target : Array(String)?

        # The total number of servers that have been migrated.

        @[JSON::Field(key: "totalNoOfSrv")]
        getter total_no_of_srv : Int32?

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        # The custom script to run tests on source or target environments.

        @[JSON::Field(key: "workflowStepAutomationConfiguration")]
        getter workflow_step_automation_configuration : Types::WorkflowStepAutomationConfiguration?

        def initialize(
          @creation_time : Time? = nil,
          @description : String? = nil,
          @end_time : Time? = nil,
          @last_start_time : Time? = nil,
          @name : String? = nil,
          @next : Array(String)? = nil,
          @no_of_srv_completed : Int32? = nil,
          @no_of_srv_failed : Int32? = nil,
          @outputs : Array(Types::WorkflowStepOutput)? = nil,
          @owner : String? = nil,
          @previous : Array(String)? = nil,
          @script_output_location : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @step_action_type : String? = nil,
          @step_group_id : String? = nil,
          @step_id : String? = nil,
          @step_target : Array(String)? = nil,
          @total_no_of_srv : Int32? = nil,
          @workflow_id : String? = nil,
          @workflow_step_automation_configuration : Types::WorkflowStepAutomationConfiguration? = nil
        )
        end
      end

      # An internal error has occurred.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListMigrationWorkflowTemplatesRequest
        include JSON::Serializable

        # The maximum number of results that can be returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the template.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMigrationWorkflowTemplatesResponse
        include JSON::Serializable

        # The summary of the template.

        @[JSON::Field(key: "templateSummary")]
        getter template_summary : Array(Types::TemplateSummary)

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @template_summary : Array(Types::TemplateSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListMigrationWorkflowsRequest
        include JSON::Serializable

        # The name of the application configured in Application Discovery Service.

        @[JSON::Field(key: "adsApplicationConfigurationName")]
        getter ads_application_configuration_name : String?

        # The maximum number of results that can be returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the migration workflow.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the migration workflow.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        def initialize(
          @ads_application_configuration_name : String? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @status : String? = nil,
          @template_id : String? = nil
        )
        end
      end


      struct ListMigrationWorkflowsResponse
        include JSON::Serializable

        # The summary of the migration workflow.

        @[JSON::Field(key: "migrationWorkflowSummary")]
        getter migration_workflow_summary : Array(Types::MigrationWorkflowSummary)

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @migration_workflow_summary : Array(Types::MigrationWorkflowSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListPluginsRequest
        include JSON::Serializable

        # The maximum number of plugins that can be returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPluginsResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Migration Hub Orchestrator plugins.

        @[JSON::Field(key: "plugins")]
        getter plugins : Array(Types::PluginSummary)?

        def initialize(
          @next_token : String? = nil,
          @plugins : Array(Types::PluginSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags added to a resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListTemplateStepGroupsRequest
        include JSON::Serializable

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        # The maximum number of results that can be returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @template_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTemplateStepGroupsResponse
        include JSON::Serializable

        # The summary of the step group in the template.

        @[JSON::Field(key: "templateStepGroupSummary")]
        getter template_step_group_summary : Array(Types::TemplateStepGroupSummary)

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @template_step_group_summary : Array(Types::TemplateStepGroupSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTemplateStepsRequest
        include JSON::Serializable

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        # The maximum number of results that can be returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @step_group_id : String,
          @template_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTemplateStepsResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of summaries of steps in a template.

        @[JSON::Field(key: "templateStepSummaryList")]
        getter template_step_summary_list : Array(Types::TemplateStepSummary)?

        def initialize(
          @next_token : String? = nil,
          @template_step_summary_list : Array(Types::TemplateStepSummary)? = nil
        )
        end
      end


      struct ListWorkflowStepGroupsRequest
        include JSON::Serializable

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The maximum number of results that can be returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workflow_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkflowStepGroupsResponse
        include JSON::Serializable

        # The summary of step groups in a migration workflow.

        @[JSON::Field(key: "workflowStepGroupsSummary")]
        getter workflow_step_groups_summary : Array(Types::WorkflowStepGroupSummary)

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workflow_step_groups_summary : Array(Types::WorkflowStepGroupSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkflowStepsRequest
        include JSON::Serializable

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The maximum number of results that can be returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @step_group_id : String,
          @workflow_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkflowStepsResponse
        include JSON::Serializable

        # The summary of steps in a migration workflow.

        @[JSON::Field(key: "workflowStepsSummary")]
        getter workflow_steps_summary : Array(Types::WorkflowStepSummary)

        # The pagination token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workflow_steps_summary : Array(Types::WorkflowStepSummary),
          @next_token : String? = nil
        )
        end
      end

      # The summary of a migration workflow.

      struct MigrationWorkflowSummary
        include JSON::Serializable

        # The name of the application configured in Application Discovery Service.

        @[JSON::Field(key: "adsApplicationConfigurationName")]
        getter ads_application_configuration_name : String?

        # The steps completed in the migration workflow.

        @[JSON::Field(key: "completedSteps")]
        getter completed_steps : Int32?

        # The time at which the migration workflow was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The time at which the migration workflow ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The ID of the migration workflow.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the migration workflow.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the migration workflow.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the migration workflow.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        # All the steps in a migration workflow.

        @[JSON::Field(key: "totalSteps")]
        getter total_steps : Int32?

        def initialize(
          @ads_application_configuration_name : String? = nil,
          @completed_steps : Int32? = nil,
          @creation_time : Time? = nil,
          @end_time : Time? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @template_id : String? = nil,
          @total_steps : Int32? = nil
        )
        end
      end

      # Command to be run on a particular operating system.

      struct PlatformCommand
        include JSON::Serializable

        # Command for Linux.

        @[JSON::Field(key: "linux")]
        getter linux : String?

        # Command for Windows.

        @[JSON::Field(key: "windows")]
        getter windows : String?

        def initialize(
          @linux : String? = nil,
          @windows : String? = nil
        )
        end
      end

      # The script location for a particular operating system.

      struct PlatformScriptKey
        include JSON::Serializable

        # The script location for Linux.

        @[JSON::Field(key: "linux")]
        getter linux : String?

        # The script location for Windows.

        @[JSON::Field(key: "windows")]
        getter windows : String?

        def initialize(
          @linux : String? = nil,
          @windows : String? = nil
        )
        end
      end

      # The summary of the Migration Hub Orchestrator plugin.

      struct PluginSummary
        include JSON::Serializable

        # The name of the host.

        @[JSON::Field(key: "hostname")]
        getter hostname : String?

        # The IP address at which the plugin is located.

        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        # The ID of the plugin.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String?

        # The time at which the plugin was registered.

        @[JSON::Field(key: "registeredTime")]
        getter registered_time : String?

        # The status of the plugin.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The version of the plugin.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @hostname : String? = nil,
          @ip_address : String? = nil,
          @plugin_id : String? = nil,
          @registered_time : String? = nil,
          @status : String? = nil,
          @version : String? = nil
        )
        end
      end

      # The resource is not available.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct RetryWorkflowStepRequest
        include JSON::Serializable

        # The ID of the step.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        def initialize(
          @id : String,
          @step_group_id : String,
          @workflow_id : String
        )
        end
      end


      struct RetryWorkflowStepResponse
        include JSON::Serializable

        # The ID of the step.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the step.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String?

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        def initialize(
          @id : String? = nil,
          @status : String? = nil,
          @step_group_id : String? = nil,
          @workflow_id : String? = nil
        )
        end
      end


      struct StartMigrationWorkflowRequest
        include JSON::Serializable

        # The ID of the migration workflow.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct StartMigrationWorkflowResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the migration workflow.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the migration workflow.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time at which the migration workflow was last started.

        @[JSON::Field(key: "lastStartTime")]
        getter last_start_time : Time?

        # The status of the migration workflow.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the migration workflow.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @last_start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # The custom script to run tests on source or target environments.

      struct StepAutomationConfiguration
        include JSON::Serializable

        # The command to run the script.

        @[JSON::Field(key: "command")]
        getter command : Types::PlatformCommand?

        # The source or target environment.

        @[JSON::Field(key: "runEnvironment")]
        getter run_environment : String?

        # The Amazon S3 bucket where the script is located.

        @[JSON::Field(key: "scriptLocationS3Bucket")]
        getter script_location_s3_bucket : String?

        # The Amazon S3 key for the script location.

        @[JSON::Field(key: "scriptLocationS3Key")]
        getter script_location_s3_key : Types::PlatformScriptKey?

        # The servers on which to run the script.

        @[JSON::Field(key: "targetType")]
        getter target_type : String?

        def initialize(
          @command : Types::PlatformCommand? = nil,
          @run_environment : String? = nil,
          @script_location_s3_bucket : String? = nil,
          @script_location_s3_key : Types::PlatformScriptKey? = nil,
          @target_type : String? = nil
        )
        end
      end

      # A map of key value pairs that is generated when you create a migration workflow. The key value pairs
      # will differ based on your selection of the template.

      struct StepInput
        include JSON::Serializable

        # The value of the integer.

        @[JSON::Field(key: "integerValue")]
        getter integer_value : Int32?

        # List of string values.

        @[JSON::Field(key: "listOfStringsValue")]
        getter list_of_strings_value : Array(String)?

        # Map of string values.

        @[JSON::Field(key: "mapOfStringValue")]
        getter map_of_string_value : Hash(String, String)?

        # String value.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @integer_value : Int32? = nil,
          @list_of_strings_value : Array(String)? = nil,
          @map_of_string_value : Hash(String, String)? = nil,
          @string_value : String? = nil
        )
        end
      end

      # The output of the step.

      struct StepOutput
        include JSON::Serializable

        # The data type of the step output.

        @[JSON::Field(key: "dataType")]
        getter data_type : String?

        # The name of the step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Determine if an output is required from a step.

        @[JSON::Field(key: "required")]
        getter required : Bool?

        def initialize(
          @data_type : String? = nil,
          @name : String? = nil,
          @required : Bool? = nil
        )
        end
      end


      struct StopMigrationWorkflowRequest
        include JSON::Serializable

        # The ID of the migration workflow.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct StopMigrationWorkflowResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the migration workflow.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the migration workflow.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time at which the migration workflow was stopped.

        @[JSON::Field(key: "lastStopTime")]
        getter last_stop_time : Time?

        # The status of the migration workflow.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the migration workflow.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @last_stop_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to which you want to add tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A collection of labels, in the form of key:value pairs, that apply to this resource.

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

      # The input parameters of a template.

      struct TemplateInput
        include JSON::Serializable

        # The data type of the template input.

        @[JSON::Field(key: "dataType")]
        getter data_type : String?

        # The name of the template.

        @[JSON::Field(key: "inputName")]
        getter input_name : String?

        # Determine if an input is required from the template.

        @[JSON::Field(key: "required")]
        getter required : Bool?

        def initialize(
          @data_type : String? = nil,
          @input_name : String? = nil,
          @required : Bool? = nil
        )
        end
      end

      # The migration workflow template used as the source for the new template.

      struct TemplateSource
        include JSON::Serializable

        # The ID of the workflow from the source migration workflow template.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        def initialize(
          @workflow_id : String? = nil
        )
        end
      end

      # The summary of the step group in the template.

      struct TemplateStepGroupSummary
        include JSON::Serializable

        # The ID of the step group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the step group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next step group.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The previous step group.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @next : Array(String)? = nil,
          @previous : Array(String)? = nil
        )
        end
      end

      # The summary of the step.

      struct TemplateStepSummary
        include JSON::Serializable

        # The ID of the step.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next step.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The owner of the step.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The previous step.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        # The action type of the step. You must run and update the status of a manual step for the workflow to
        # continue after the completion of the step.

        @[JSON::Field(key: "stepActionType")]
        getter step_action_type : String?

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String?

        # The servers on which to run the script.

        @[JSON::Field(key: "targetType")]
        getter target_type : String?

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @next : Array(String)? = nil,
          @owner : String? = nil,
          @previous : Array(String)? = nil,
          @step_action_type : String? = nil,
          @step_group_id : String? = nil,
          @target_type : String? = nil,
          @template_id : String? = nil
        )
        end
      end

      # The summary of the template.

      struct TemplateSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the template.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The description of the template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the template.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the template.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # List of AWS services utilized in a migration workflow.

      struct Tool
        include JSON::Serializable

        # The name of an AWS service.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The URL of an AWS service.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @name : String? = nil,
          @url : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource from which you want to remove tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # One or more tag keys. Specify only the tag keys, not the tag values.

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


      struct UpdateMigrationWorkflowRequest
        include JSON::Serializable

        # The ID of the migration workflow.

        @[JSON::Field(key: "id")]
        getter id : String

        # The description of the migration workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The input parameters required to update a migration workflow.

        @[JSON::Field(key: "inputParameters")]
        getter input_parameters : Hash(String, Types::StepInput)?

        # The name of the migration workflow.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The servers on which a step will be run.

        @[JSON::Field(key: "stepTargets")]
        getter step_targets : Array(String)?

        def initialize(
          @id : String,
          @description : String? = nil,
          @input_parameters : Hash(String, Types::StepInput)? = nil,
          @name : String? = nil,
          @step_targets : Array(String)? = nil
        )
        end
      end


      struct UpdateMigrationWorkflowResponse
        include JSON::Serializable

        # The ID of the application configured in Application Discovery Service.

        @[JSON::Field(key: "adsApplicationConfigurationId")]
        getter ads_application_configuration_id : String?

        # The Amazon Resource Name (ARN) of the migration workflow.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time at which the migration workflow was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the migration workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the migration workflow.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time at which the migration workflow was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the migration workflow.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the migration workflow.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The servers on which a step will be run.

        @[JSON::Field(key: "stepTargets")]
        getter step_targets : Array(String)?

        # The tags added to the migration workflow.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The ID of the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        # The inputs required to update a migration workflow.

        @[JSON::Field(key: "workflowInputs")]
        getter workflow_inputs : Hash(String, Types::StepInput)?

        def initialize(
          @ads_application_configuration_id : String? = nil,
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @step_targets : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @template_id : String? = nil,
          @workflow_inputs : Hash(String, Types::StepInput)? = nil
        )
        end
      end


      struct UpdateTemplateRequest
        include JSON::Serializable

        # The ID of the request to update a migration workflow template.

        @[JSON::Field(key: "id")]
        getter id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the migration workflow template to update.

        @[JSON::Field(key: "templateDescription")]
        getter template_description : String?

        # The name of the migration workflow template to update.

        @[JSON::Field(key: "templateName")]
        getter template_name : String?

        def initialize(
          @id : String,
          @client_token : String? = nil,
          @template_description : String? = nil,
          @template_name : String? = nil
        )
        end
      end


      struct UpdateTemplateResponse
        include JSON::Serializable

        # The tags added to the migration workflow template.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The ARN of the migration workflow template being updated. The format for an Migration Hub
        # Orchestrator template ARN is
        # arn:aws:migrationhub-orchestrator:region:account:template/template-abcd1234 . For more information
        # about ARNs, see Amazon Resource Names (ARNs) in the AWS General Reference .

        @[JSON::Field(key: "templateArn")]
        getter template_arn : String?

        # The ID of the migration workflow template being updated.

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        def initialize(
          @tags : Hash(String, String)? = nil,
          @template_arn : String? = nil,
          @template_id : String? = nil
        )
        end
      end


      struct UpdateWorkflowStepGroupRequest
        include JSON::Serializable

        # The ID of the step group.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The description of the step group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the step group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next step group.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The previous step group.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        def initialize(
          @id : String,
          @workflow_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @next : Array(String)? = nil,
          @previous : Array(String)? = nil
        )
        end
      end


      struct UpdateWorkflowStepGroupResponse
        include JSON::Serializable

        # The description of the step group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the step group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time at which the step group was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the step group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next step group.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The previous step group.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        # List of AWS services utilized in a migration workflow.

        @[JSON::Field(key: "tools")]
        getter tools : Array(Types::Tool)?

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        def initialize(
          @description : String? = nil,
          @id : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @next : Array(String)? = nil,
          @previous : Array(String)? = nil,
          @tools : Array(Types::Tool)? = nil,
          @workflow_id : String? = nil
        )
        end
      end


      struct UpdateWorkflowStepRequest
        include JSON::Serializable

        # The ID of the step.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The description of the step.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next step.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The outputs of a step.

        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::WorkflowStepOutput)?

        # The previous step.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        # The status of the step.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The action type of the step. You must run and update the status of a manual step for the workflow to
        # continue after the completion of the step.

        @[JSON::Field(key: "stepActionType")]
        getter step_action_type : String?

        # The servers on which a step will be run.

        @[JSON::Field(key: "stepTarget")]
        getter step_target : Array(String)?

        # The custom script to run tests on the source and target environments.

        @[JSON::Field(key: "workflowStepAutomationConfiguration")]
        getter workflow_step_automation_configuration : Types::WorkflowStepAutomationConfiguration?

        def initialize(
          @id : String,
          @step_group_id : String,
          @workflow_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @next : Array(String)? = nil,
          @outputs : Array(Types::WorkflowStepOutput)? = nil,
          @previous : Array(String)? = nil,
          @status : String? = nil,
          @step_action_type : String? = nil,
          @step_target : Array(String)? = nil,
          @workflow_step_automation_configuration : Types::WorkflowStepAutomationConfiguration? = nil
        )
        end
      end


      struct UpdateWorkflowStepResponse
        include JSON::Serializable

        # The ID of the step.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the step group.

        @[JSON::Field(key: "stepGroupId")]
        getter step_group_id : String?

        # The ID of the migration workflow.

        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @step_group_id : String? = nil,
          @workflow_id : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The custom script to run tests on source or target environments.

      struct WorkflowStepAutomationConfiguration
        include JSON::Serializable

        # The command required to run the script.

        @[JSON::Field(key: "command")]
        getter command : Types::PlatformCommand?

        # The source or target environment.

        @[JSON::Field(key: "runEnvironment")]
        getter run_environment : String?

        # The Amazon S3 bucket where the script is located.

        @[JSON::Field(key: "scriptLocationS3Bucket")]
        getter script_location_s3_bucket : String?

        # The Amazon S3 key for the script location.

        @[JSON::Field(key: "scriptLocationS3Key")]
        getter script_location_s3_key : Types::PlatformScriptKey?

        # The servers on which to run the script.

        @[JSON::Field(key: "targetType")]
        getter target_type : String?

        def initialize(
          @command : Types::PlatformCommand? = nil,
          @run_environment : String? = nil,
          @script_location_s3_bucket : String? = nil,
          @script_location_s3_key : Types::PlatformScriptKey? = nil,
          @target_type : String? = nil
        )
        end
      end

      # The summary of a step group in a workflow.

      struct WorkflowStepGroupSummary
        include JSON::Serializable

        # The ID of the step group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the step group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next step group.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The owner of the step group.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The previous step group.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        # The status of the step group.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @next : Array(String)? = nil,
          @owner : String? = nil,
          @previous : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      # The output of a step.

      struct WorkflowStepOutput
        include JSON::Serializable

        # The data type of the output.

        @[JSON::Field(key: "dataType")]
        getter data_type : String?

        # The name of the step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Determine if an output is required from a step.

        @[JSON::Field(key: "required")]
        getter required : Bool?

        # The value of the output.

        @[JSON::Field(key: "value")]
        getter value : Types::WorkflowStepOutputUnion?

        def initialize(
          @data_type : String? = nil,
          @name : String? = nil,
          @required : Bool? = nil,
          @value : Types::WorkflowStepOutputUnion? = nil
        )
        end
      end

      # A structure to hold multiple values of an output.

      struct WorkflowStepOutputUnion
        include JSON::Serializable

        # The integer value.

        @[JSON::Field(key: "integerValue")]
        getter integer_value : Int32?

        # The list of string value.

        @[JSON::Field(key: "listOfStringValue")]
        getter list_of_string_value : Array(String)?

        # The string value.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @integer_value : Int32? = nil,
          @list_of_string_value : Array(String)? = nil,
          @string_value : String? = nil
        )
        end
      end

      # The summary of the step in a migration workflow.

      struct WorkflowStepSummary
        include JSON::Serializable

        # The description of the step.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The next step.

        @[JSON::Field(key: "next")]
        getter next : Array(String)?

        # The number of servers that have been migrated.

        @[JSON::Field(key: "noOfSrvCompleted")]
        getter no_of_srv_completed : Int32?

        # The number of servers that have failed to migrate.

        @[JSON::Field(key: "noOfSrvFailed")]
        getter no_of_srv_failed : Int32?

        # The owner of the step.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The previous step.

        @[JSON::Field(key: "previous")]
        getter previous : Array(String)?

        # The location of the script.

        @[JSON::Field(key: "scriptLocation")]
        getter script_location : String?

        # The status of the step.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the migration workflow.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The action type of the step. You must run and update the status of a manual step for the workflow to
        # continue after the completion of the step.

        @[JSON::Field(key: "stepActionType")]
        getter step_action_type : String?

        # The ID of the step.

        @[JSON::Field(key: "stepId")]
        getter step_id : String?

        # The total number of servers that have been migrated.

        @[JSON::Field(key: "totalNoOfSrv")]
        getter total_no_of_srv : Int32?

        def initialize(
          @description : String? = nil,
          @name : String? = nil,
          @next : Array(String)? = nil,
          @no_of_srv_completed : Int32? = nil,
          @no_of_srv_failed : Int32? = nil,
          @owner : String? = nil,
          @previous : Array(String)? = nil,
          @script_location : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @step_action_type : String? = nil,
          @step_id : String? = nil,
          @total_no_of_srv : Int32? = nil
        )
        end
      end
    end
  end
end
