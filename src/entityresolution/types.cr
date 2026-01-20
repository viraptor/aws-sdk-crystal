require "json"
require "time"

module Aws
  module EntityResolution
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AddPolicyStatementInput
        include JSON::Serializable

        # The action that the principal can use on the resource. For example, entityresolution:GetIdMappingJob
        # , entityresolution:GetMatchingJob .

        @[JSON::Field(key: "action")]
        getter action : Array(String)

        # The Amazon Resource Name (ARN) of the resource that will be accessed by the principal.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # Determines whether the permissions specified in the policy are to be allowed ( Allow ) or denied (
        # Deny ). If you set the value of the effect parameter to Deny for the AddPolicyStatement operation,
        # you must also set the value of the effect parameter in the policy to Deny for the PutPolicy
        # operation.

        @[JSON::Field(key: "effect")]
        getter effect : String

        # The Amazon Web Services service or Amazon Web Services account that can access the resource defined
        # as ARN.

        @[JSON::Field(key: "principal")]
        getter principal : Array(String)

        # A statement identifier that differentiates the statement from others in the same policy.

        @[JSON::Field(key: "statementId")]
        getter statement_id : String

        # A set of condition keys that you can use in key policies.

        @[JSON::Field(key: "condition")]
        getter condition : String?

        def initialize(
          @action : Array(String),
          @arn : String,
          @effect : String,
          @principal : Array(String),
          @statement_id : String,
          @condition : String? = nil
        )
        end
      end


      struct AddPolicyStatementOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that will be accessed by the principal.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # A unique identifier for the current revision of the policy.

        @[JSON::Field(key: "token")]
        getter token : String

        # The resource-based policy.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @arn : String,
          @token : String,
          @policy : String? = nil
        )
        end
      end


      struct BatchDeleteUniqueIdInput
        include JSON::Serializable

        # The unique IDs to delete.

        @[JSON::Field(key: "uniqueIds")]
        getter unique_ids : Array(String)

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # The input source for the batch delete unique ID operation.

        @[JSON::Field(key: "inputSource")]
        getter input_source : String?

        def initialize(
          @unique_ids : Array(String),
          @workflow_name : String,
          @input_source : String? = nil
        )
        end
      end


      struct BatchDeleteUniqueIdOutput
        include JSON::Serializable

        # The unique IDs that were deleted.

        @[JSON::Field(key: "deleted")]
        getter deleted : Array(Types::DeletedUniqueId)

        # The unique IDs that were disconnected.

        @[JSON::Field(key: "disconnectedUniqueIds")]
        getter disconnected_unique_ids : Array(String)

        # The errors from deleting multiple unique IDs.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::DeleteUniqueIdError)

        # The status of the batch delete unique ID operation.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @deleted : Array(Types::DeletedUniqueId),
          @disconnected_unique_ids : Array(String),
          @errors : Array(Types::DeleteUniqueIdError),
          @status : String
        )
        end
      end

      # The request couldn't be processed because of conflict in the current state of the resource. Example:
      # Workflow already exists, Schema already exists, Workflow is currently running, etc.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateIdMappingWorkflowInput
        include JSON::Serializable

        # An object which defines the ID mapping technique and any additional configurations.

        @[JSON::Field(key: "idMappingTechniques")]
        getter id_mapping_techniques : Types::IdMappingTechniques

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::IdMappingWorkflowInputSource)

        # The name of the workflow. There can't be multiple IdMappingWorkflows with the same name.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # A description of the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The incremental run configuration for the ID mapping workflow.

        @[JSON::Field(key: "incrementalRunConfig")]
        getter incremental_run_config : Types::IdMappingIncrementalRunConfig?

        # A list of IdMappingWorkflowOutputSource objects, each of which contains fields outputS3Path and
        # KMSArn .

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::IdMappingWorkflowOutputSource)?

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to create
        # resources on your behalf as part of workflow execution.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @id_mapping_techniques : Types::IdMappingTechniques,
          @input_source_config : Array(Types::IdMappingWorkflowInputSource),
          @workflow_name : String,
          @description : String? = nil,
          @incremental_run_config : Types::IdMappingIncrementalRunConfig? = nil,
          @output_source_config : Array(Types::IdMappingWorkflowOutputSource)? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateIdMappingWorkflowOutput
        include JSON::Serializable

        # An object which defines the ID mapping technique and any additional configurations.

        @[JSON::Field(key: "idMappingTechniques")]
        getter id_mapping_techniques : Types::IdMappingTechniques

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::IdMappingWorkflowInputSource)

        # The ARN (Amazon Resource Name) that Entity Resolution generated for the IDMappingWorkflow .

        @[JSON::Field(key: "workflowArn")]
        getter workflow_arn : String

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # A description of the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The incremental run configuration for the ID mapping workflow.

        @[JSON::Field(key: "incrementalRunConfig")]
        getter incremental_run_config : Types::IdMappingIncrementalRunConfig?

        # A list of IdMappingWorkflowOutputSource objects, each of which contains fields outputS3Path and
        # KMSArn .

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::IdMappingWorkflowOutputSource)?

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to create
        # resources on your behalf as part of workflow execution.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @id_mapping_techniques : Types::IdMappingTechniques,
          @input_source_config : Array(Types::IdMappingWorkflowInputSource),
          @workflow_arn : String,
          @workflow_name : String,
          @description : String? = nil,
          @incremental_run_config : Types::IdMappingIncrementalRunConfig? = nil,
          @output_source_config : Array(Types::IdMappingWorkflowOutputSource)? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct CreateIdNamespaceInput
        include JSON::Serializable

        # The name of the ID namespace.

        @[JSON::Field(key: "idNamespaceName")]
        getter id_namespace_name : String

        # The type of ID namespace. There are two types: SOURCE and TARGET . The SOURCE contains
        # configurations for sourceId data that will be processed in an ID mapping workflow. The TARGET
        # contains a configuration of targetId to which all sourceIds will resolve to.

        @[JSON::Field(key: "type")]
        getter type : String

        # The description of the ID namespace.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Determines the properties of IdMappingWorflow where this IdNamespace can be used as a Source or a
        # Target .

        @[JSON::Field(key: "idMappingWorkflowProperties")]
        getter id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowProperties)?

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::IdNamespaceInputSource)?

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to access the
        # resources defined in this IdNamespace on your behalf as part of the workflow run.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @id_namespace_name : String,
          @type : String,
          @description : String? = nil,
          @id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowProperties)? = nil,
          @input_source_config : Array(Types::IdNamespaceInputSource)? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateIdNamespaceOutput
        include JSON::Serializable

        # The timestamp of when the ID namespace was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the ID namespace.

        @[JSON::Field(key: "idNamespaceArn")]
        getter id_namespace_arn : String

        # The name of the ID namespace.

        @[JSON::Field(key: "idNamespaceName")]
        getter id_namespace_name : String

        # The type of ID namespace. There are two types: SOURCE and TARGET . The SOURCE contains
        # configurations for sourceId data that will be processed in an ID mapping workflow. The TARGET
        # contains a configuration of targetId to which all sourceIds will resolve to.

        @[JSON::Field(key: "type")]
        getter type : String

        # The timestamp of when the ID namespace was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the ID namespace.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Determines the properties of IdMappingWorkflow where this IdNamespace can be used as a Source or a
        # Target .

        @[JSON::Field(key: "idMappingWorkflowProperties")]
        getter id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowProperties)?

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::IdNamespaceInputSource)?

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to access the
        # resources defined in inputSourceConfig on your behalf as part of the workflow run.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @id_namespace_arn : String,
          @id_namespace_name : String,
          @type : String,
          @updated_at : Time,
          @description : String? = nil,
          @id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowProperties)? = nil,
          @input_source_config : Array(Types::IdNamespaceInputSource)? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateMatchingWorkflowInput
        include JSON::Serializable

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::InputSource)

        # A list of OutputSource objects, each of which contains fields outputS3Path , applyNormalization ,
        # KMSArn , and output .

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::OutputSource)

        # An object which defines the resolutionType and the ruleBasedProperties .

        @[JSON::Field(key: "resolutionTechniques")]
        getter resolution_techniques : Types::ResolutionTechniques

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to create
        # resources on your behalf as part of workflow execution.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of the workflow. There can't be multiple MatchingWorkflows with the same name.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # A description of the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Optional. An object that defines the incremental run type. This object contains only the
        # incrementalRunType field, which appears as "Automatic" in the console. For workflows where
        # resolutionType is ML_MATCHING or PROVIDER , incremental processing is not supported.

        @[JSON::Field(key: "incrementalRunConfig")]
        getter incremental_run_config : Types::IncrementalRunConfig?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @input_source_config : Array(Types::InputSource),
          @output_source_config : Array(Types::OutputSource),
          @resolution_techniques : Types::ResolutionTechniques,
          @role_arn : String,
          @workflow_name : String,
          @description : String? = nil,
          @incremental_run_config : Types::IncrementalRunConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateMatchingWorkflowOutput
        include JSON::Serializable

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::InputSource)

        # A list of OutputSource objects, each of which contains fields outputS3Path , applyNormalization ,
        # KMSArn , and output .

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::OutputSource)

        # An object which defines the resolutionType and the ruleBasedProperties .

        @[JSON::Field(key: "resolutionTechniques")]
        getter resolution_techniques : Types::ResolutionTechniques

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to create
        # resources on your behalf as part of workflow execution.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The ARN (Amazon Resource Name) that Entity Resolution generated for the MatchingWorkflow .

        @[JSON::Field(key: "workflowArn")]
        getter workflow_arn : String

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # A description of the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An object which defines an incremental run type and has only incrementalRunType as a field.

        @[JSON::Field(key: "incrementalRunConfig")]
        getter incremental_run_config : Types::IncrementalRunConfig?

        def initialize(
          @input_source_config : Array(Types::InputSource),
          @output_source_config : Array(Types::OutputSource),
          @resolution_techniques : Types::ResolutionTechniques,
          @role_arn : String,
          @workflow_arn : String,
          @workflow_name : String,
          @description : String? = nil,
          @incremental_run_config : Types::IncrementalRunConfig? = nil
        )
        end
      end


      struct CreateSchemaMappingInput
        include JSON::Serializable

        # A list of MappedInputFields . Each MappedInputField corresponds to a column the source data table,
        # and contains column name plus additional information that Entity Resolution uses for matching.

        @[JSON::Field(key: "mappedInputFields")]
        getter mapped_input_fields : Array(Types::SchemaInputAttribute)

        # The name of the schema. There can't be multiple SchemaMappings with the same name.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String

        # A description of the schema.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @mapped_input_fields : Array(Types::SchemaInputAttribute),
          @schema_name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSchemaMappingOutput
        include JSON::Serializable

        # A description of the schema.

        @[JSON::Field(key: "description")]
        getter description : String

        # A list of MappedInputFields . Each MappedInputField corresponds to a column the source data table,
        # and contains column name plus additional information that Entity Resolution uses for matching.

        @[JSON::Field(key: "mappedInputFields")]
        getter mapped_input_fields : Array(Types::SchemaInputAttribute)

        # The ARN (Amazon Resource Name) that Entity Resolution generated for the SchemaMapping .

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String

        # The name of the schema.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String

        def initialize(
          @description : String,
          @mapped_input_fields : Array(Types::SchemaInputAttribute),
          @schema_arn : String,
          @schema_name : String
        )
        end
      end

      # Specifies the configuration for integrating with Customer Profiles. This configuration enables
      # Entity Resolution to send matched output directly to Customer Profiles instead of Amazon S3,
      # creating a unified customer view by automatically updating customer profiles based on match
      # clusters.

      struct CustomerProfilesIntegrationConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Customer Profiles domain where the matched output will be
        # sent.

        @[JSON::Field(key: "domainArn")]
        getter domain_arn : String

        # The Amazon Resource Name (ARN) of the Customer Profiles object type that defines the structure for
        # the matched customer data.

        @[JSON::Field(key: "objectTypeArn")]
        getter object_type_arn : String

        def initialize(
          @domain_arn : String,
          @object_type_arn : String
        )
        end
      end


      struct DeleteIdMappingWorkflowInput
        include JSON::Serializable

        # The name of the workflow to be deleted.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        def initialize(
          @workflow_name : String
        )
        end
      end


      struct DeleteIdMappingWorkflowOutput
        include JSON::Serializable

        # A successful operation message.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct DeleteIdNamespaceInput
        include JSON::Serializable

        # The name of the ID namespace.

        @[JSON::Field(key: "idNamespaceName")]
        getter id_namespace_name : String

        def initialize(
          @id_namespace_name : String
        )
        end
      end


      struct DeleteIdNamespaceOutput
        include JSON::Serializable

        # A successful operation message.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct DeleteMatchingWorkflowInput
        include JSON::Serializable

        # The name of the workflow to be retrieved.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        def initialize(
          @workflow_name : String
        )
        end
      end


      struct DeleteMatchingWorkflowOutput
        include JSON::Serializable

        # A successful operation message.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct DeletePolicyStatementInput
        include JSON::Serializable

        # The ARN of the resource for which the policy need to be deleted.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # A statement identifier that differentiates the statement from others in the same policy.

        @[JSON::Field(key: "statementId")]
        getter statement_id : String

        def initialize(
          @arn : String,
          @statement_id : String
        )
        end
      end


      struct DeletePolicyStatementOutput
        include JSON::Serializable

        # The ARN of the resource for which the policy need to be deleted.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # A unique identifier for the deleted policy.

        @[JSON::Field(key: "token")]
        getter token : String

        # The resource-based policy.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @arn : String,
          @token : String,
          @policy : String? = nil
        )
        end
      end


      struct DeleteSchemaMappingInput
        include JSON::Serializable

        # The name of the schema to delete.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String

        def initialize(
          @schema_name : String
        )
        end
      end


      struct DeleteSchemaMappingOutput
        include JSON::Serializable

        # A successful operation message.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The error information provided when the delete unique ID operation doesn't complete.

      struct DeleteUniqueIdError
        include JSON::Serializable

        # The error type for the delete unique ID operation. The SERVICE_ERROR value indicates that an
        # internal service-side problem occurred during the deletion operation. The VALIDATION_ERROR value
        # indicates that the deletion operation couldn't complete because of invalid input parameters or data.

        @[JSON::Field(key: "errorType")]
        getter error_type : String

        # The unique ID that couldn't be deleted.

        @[JSON::Field(key: "uniqueId")]
        getter unique_id : String

        def initialize(
          @error_type : String,
          @unique_id : String
        )
        end
      end

      # The deleted unique ID.

      struct DeletedUniqueId
        include JSON::Serializable

        # The unique ID of the deleted item.

        @[JSON::Field(key: "uniqueId")]
        getter unique_id : String

        def initialize(
          @unique_id : String
        )
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # An object containing an error message, if there was an error.

      struct ErrorDetails
        include JSON::Serializable

        # The error message from the job, if there is one.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @error_message : String? = nil
        )
        end
      end

      # The request was rejected because it attempted to create resources beyond the current Entity
      # Resolution account limits. The error message describes the limit exceeded.

      struct ExceedsLimitException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the quota that has been breached.

        @[JSON::Field(key: "quotaName")]
        getter quota_name : String?

        # The current quota value for the customers.

        @[JSON::Field(key: "quotaValue")]
        getter quota_value : Int32?

        def initialize(
          @message : String? = nil,
          @quota_name : String? = nil,
          @quota_value : Int32? = nil
        )
        end
      end

      # The record that didn't generate a Match ID.

      struct FailedRecord
        include JSON::Serializable

        # The error message for the record that didn't generate a Match ID.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # The input source ARN of the record that didn't generate a Match ID.

        @[JSON::Field(key: "inputSourceARN")]
        getter input_source_arn : String

        # The unique ID of the record that didn't generate a Match ID.

        @[JSON::Field(key: "uniqueId")]
        getter unique_id : String

        def initialize(
          @error_message : String,
          @input_source_arn : String,
          @unique_id : String
        )
        end
      end


      struct GenerateMatchIdInput
        include JSON::Serializable

        # The records to match.

        @[JSON::Field(key: "records")]
        getter records : Array(Types::Record)

        # The name of the rule-based matching workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # The processing mode that determines how Match IDs are generated and results are saved. Each mode
        # provides different levels of accuracy, response time, and completeness of results. If not specified,
        # defaults to CONSISTENT . CONSISTENT : Performs immediate lookup and matching against all existing
        # records, with results saved synchronously. Provides highest accuracy but slower response time.
        # EVENTUAL (shown as Background in the console): Performs initial match ID lookup or generation
        # immediately, with record updates processed asynchronously in the background. Offers faster initial
        # response time, with complete matching results available later in S3. EVENTUAL_NO_LOOKUP (shown as
        # Quick ID generation in the console): Generates new match IDs without checking existing matches, with
        # updates processed asynchronously. Provides fastest response time but should only be used for records
        # known to be unique.

        @[JSON::Field(key: "processingType")]
        getter processing_type : String?

        def initialize(
          @records : Array(Types::Record),
          @workflow_name : String,
          @processing_type : String? = nil
        )
        end
      end


      struct GenerateMatchIdOutput
        include JSON::Serializable

        # The records that didn't receive a generated Match ID.

        @[JSON::Field(key: "failedRecords")]
        getter failed_records : Array(Types::FailedRecord)

        # The match groups from the generated match ID.

        @[JSON::Field(key: "matchGroups")]
        getter match_groups : Array(Types::MatchGroup)

        def initialize(
          @failed_records : Array(Types::FailedRecord),
          @match_groups : Array(Types::MatchGroup)
        )
        end
      end


      struct GetIdMappingJobInput
        include JSON::Serializable

        # The ID of the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        def initialize(
          @job_id : String,
          @workflow_name : String
        )
        end
      end


      struct GetIdMappingJobOutput
        include JSON::Serializable

        # The ID of the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The time at which the job was started.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The current status of the job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time at which the job has finished.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?


        @[JSON::Field(key: "errorDetails")]
        getter error_details : Types::ErrorDetails?

        # The job type of the ID mapping job. A value of INCREMENTAL indicates that only new or changed data
        # was processed since the last job run. This is the default job type if the workflow was created with
        # an incrementalRunConfig . A value of BATCH indicates that all data was processed from the input
        # source, regardless of previous job runs. This is the default job type if the workflow wasn't created
        # with an incrementalRunConfig . A value of DELETE_ONLY indicates that only deletion requests from
        # BatchDeleteUniqueIds were processed.

        @[JSON::Field(key: "jobType")]
        getter job_type : String?

        # Metrics associated with the execution, specifically total records processed, unique IDs generated,
        # and records the execution skipped.

        @[JSON::Field(key: "metrics")]
        getter metrics : Types::IdMappingJobMetrics?

        # A list of OutputSource objects.

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::IdMappingJobOutputSource)?

        def initialize(
          @job_id : String,
          @start_time : Time,
          @status : String,
          @end_time : Time? = nil,
          @error_details : Types::ErrorDetails? = nil,
          @job_type : String? = nil,
          @metrics : Types::IdMappingJobMetrics? = nil,
          @output_source_config : Array(Types::IdMappingJobOutputSource)? = nil
        )
        end
      end


      struct GetIdMappingWorkflowInput
        include JSON::Serializable

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        def initialize(
          @workflow_name : String
        )
        end
      end


      struct GetIdMappingWorkflowOutput
        include JSON::Serializable

        # The timestamp of when the workflow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # An object which defines the ID mapping technique and any additional configurations.

        @[JSON::Field(key: "idMappingTechniques")]
        getter id_mapping_techniques : Types::IdMappingTechniques

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::IdMappingWorkflowInputSource)

        # The timestamp of when the workflow was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The ARN (Amazon Resource Name) that Entity Resolution generated for the IdMappingWorkflow .

        @[JSON::Field(key: "workflowArn")]
        getter workflow_arn : String

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # A description of the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The incremental run configuration for the ID mapping workflow.

        @[JSON::Field(key: "incrementalRunConfig")]
        getter incremental_run_config : Types::IdMappingIncrementalRunConfig?

        # A list of OutputSource objects, each of which contains fields outputS3Path and KMSArn .

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::IdMappingWorkflowOutputSource)?

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to access Amazon
        # Web Services resources on your behalf.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @id_mapping_techniques : Types::IdMappingTechniques,
          @input_source_config : Array(Types::IdMappingWorkflowInputSource),
          @updated_at : Time,
          @workflow_arn : String,
          @workflow_name : String,
          @description : String? = nil,
          @incremental_run_config : Types::IdMappingIncrementalRunConfig? = nil,
          @output_source_config : Array(Types::IdMappingWorkflowOutputSource)? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetIdNamespaceInput
        include JSON::Serializable

        # The name of the ID namespace.

        @[JSON::Field(key: "idNamespaceName")]
        getter id_namespace_name : String

        def initialize(
          @id_namespace_name : String
        )
        end
      end


      struct GetIdNamespaceOutput
        include JSON::Serializable

        # The timestamp of when the ID namespace was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the ID namespace.

        @[JSON::Field(key: "idNamespaceArn")]
        getter id_namespace_arn : String

        # The name of the ID namespace.

        @[JSON::Field(key: "idNamespaceName")]
        getter id_namespace_name : String

        # The type of ID namespace. There are two types: SOURCE and TARGET . The SOURCE contains
        # configurations for sourceId data that will be processed in an ID mapping workflow. The TARGET
        # contains a configuration of targetId to which all sourceIds will resolve to.

        @[JSON::Field(key: "type")]
        getter type : String

        # The timestamp of when the ID namespace was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the ID namespace.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Determines the properties of IdMappingWorkflow where this IdNamespace can be used as a Source or a
        # Target .

        @[JSON::Field(key: "idMappingWorkflowProperties")]
        getter id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowProperties)?

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::IdNamespaceInputSource)?

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to access the
        # resources defined in this IdNamespace on your behalf as part of a workflow run.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @id_namespace_arn : String,
          @id_namespace_name : String,
          @type : String,
          @updated_at : Time,
          @description : String? = nil,
          @id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowProperties)? = nil,
          @input_source_config : Array(Types::IdNamespaceInputSource)? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetMatchIdInput
        include JSON::Serializable

        # The record to fetch the Match ID for.

        @[JSON::Field(key: "record")]
        getter record : Hash(String, String)

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # Normalizes the attributes defined in the schema in the input data. For example, if an attribute has
        # an AttributeType of PHONE_NUMBER , and the data in the input table is in a format of 1234567890,
        # Entity Resolution will normalize this field in the output to (123)-456-7890.

        @[JSON::Field(key: "applyNormalization")]
        getter apply_normalization : Bool?

        def initialize(
          @record : Hash(String, String),
          @workflow_name : String,
          @apply_normalization : Bool? = nil
        )
        end
      end


      struct GetMatchIdOutput
        include JSON::Serializable

        # The unique identifiers for this group of match records.

        @[JSON::Field(key: "matchId")]
        getter match_id : String?

        # The rule the record matched on.

        @[JSON::Field(key: "matchRule")]
        getter match_rule : String?

        def initialize(
          @match_id : String? = nil,
          @match_rule : String? = nil
        )
        end
      end


      struct GetMatchingJobInput
        include JSON::Serializable

        # The ID of the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        def initialize(
          @job_id : String,
          @workflow_name : String
        )
        end
      end


      struct GetMatchingJobOutput
        include JSON::Serializable

        # The unique identifier of the matching job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The time at which the job was started.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The current status of the job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time at which the job has finished.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # An object containing an error message, if there was an error.

        @[JSON::Field(key: "errorDetails")]
        getter error_details : Types::ErrorDetails?

        # Metrics associated with the execution, specifically total records processed, unique IDs generated,
        # and records the execution skipped.

        @[JSON::Field(key: "metrics")]
        getter metrics : Types::JobMetrics?

        # A list of OutputSource objects.

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::JobOutputSource)?

        def initialize(
          @job_id : String,
          @start_time : Time,
          @status : String,
          @end_time : Time? = nil,
          @error_details : Types::ErrorDetails? = nil,
          @metrics : Types::JobMetrics? = nil,
          @output_source_config : Array(Types::JobOutputSource)? = nil
        )
        end
      end


      struct GetMatchingWorkflowInput
        include JSON::Serializable

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        def initialize(
          @workflow_name : String
        )
        end
      end


      struct GetMatchingWorkflowOutput
        include JSON::Serializable

        # The timestamp of when the workflow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::InputSource)

        # A list of OutputSource objects, each of which contains fields outputS3Path , applyNormalization ,
        # KMSArn , and output .

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::OutputSource)

        # An object which defines the resolutionType and the ruleBasedProperties .

        @[JSON::Field(key: "resolutionTechniques")]
        getter resolution_techniques : Types::ResolutionTechniques

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to access Amazon
        # Web Services resources on your behalf.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The timestamp of when the workflow was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The ARN (Amazon Resource Name) that Entity Resolution generated for the MatchingWorkflow .

        @[JSON::Field(key: "workflowArn")]
        getter workflow_arn : String

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # A description of the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An object which defines an incremental run type and has only incrementalRunType as a field.

        @[JSON::Field(key: "incrementalRunConfig")]
        getter incremental_run_config : Types::IncrementalRunConfig?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @input_source_config : Array(Types::InputSource),
          @output_source_config : Array(Types::OutputSource),
          @resolution_techniques : Types::ResolutionTechniques,
          @role_arn : String,
          @updated_at : Time,
          @workflow_arn : String,
          @workflow_name : String,
          @description : String? = nil,
          @incremental_run_config : Types::IncrementalRunConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetPolicyInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which the policy need to be returned.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct GetPolicyOutput
        include JSON::Serializable

        # The Entity Resolution resource ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # A unique identifier for the current revision of the policy.

        @[JSON::Field(key: "token")]
        getter token : String

        # The resource-based policy.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @arn : String,
          @token : String,
          @policy : String? = nil
        )
        end
      end


      struct GetProviderServiceInput
        include JSON::Serializable

        # The name of the provider. This name is typically the company name.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String

        # The ARN (Amazon Resource Name) of the product that the provider service provides.

        @[JSON::Field(key: "providerServiceName")]
        getter provider_service_name : String

        def initialize(
          @provider_name : String,
          @provider_service_name : String
        )
        end
      end


      struct GetProviderServiceOutput
        include JSON::Serializable

        # Specifies whether output data from the provider is anonymized. A value of TRUE means the output will
        # be anonymized and you can't relate the data that comes back from the provider to the identifying
        # input. A value of FALSE means the output won't be anonymized and you can relate the data that comes
        # back from the provider to your source data.

        @[JSON::Field(key: "anonymizedOutput")]
        getter anonymized_output : Bool

        # The required configuration fields to use with the provider service.

        @[JSON::Field(key: "providerEndpointConfiguration")]
        getter provider_endpoint_configuration : Types::ProviderEndpointConfiguration

        # The definition of the provider entity output.

        @[JSON::Field(key: "providerEntityOutputDefinition")]
        getter provider_entity_output_definition : Types::Document

        # The name of the provider. This name is typically the company name.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String

        # The ARN (Amazon Resource Name) that Entity Resolution generated for the provider service.

        @[JSON::Field(key: "providerServiceArn")]
        getter provider_service_arn : String

        # The display name of the provider service.

        @[JSON::Field(key: "providerServiceDisplayName")]
        getter provider_service_display_name : String

        # The name of the product that the provider service provides.

        @[JSON::Field(key: "providerServiceName")]
        getter provider_service_name : String

        # The type of provider service.

        @[JSON::Field(key: "providerServiceType")]
        getter provider_service_type : String

        # Input schema for the provider service.

        @[JSON::Field(key: "providerComponentSchema")]
        getter provider_component_schema : Types::ProviderComponentSchema?

        # The definition of the provider configuration.

        @[JSON::Field(key: "providerConfigurationDefinition")]
        getter provider_configuration_definition : Types::Document?

        # The provider configuration required for different ID namespace types.

        @[JSON::Field(key: "providerIdNameSpaceConfiguration")]
        getter provider_id_name_space_configuration : Types::ProviderIdNameSpaceConfiguration?

        # The Amazon Web Services accounts and the S3 permissions that are required by some providers to
        # create an S3 bucket for intermediate data storage.

        @[JSON::Field(key: "providerIntermediateDataAccessConfiguration")]
        getter provider_intermediate_data_access_configuration : Types::ProviderIntermediateDataAccessConfiguration?

        # Provider service job configurations.

        @[JSON::Field(key: "providerJobConfiguration")]
        getter provider_job_configuration : Types::Document?

        def initialize(
          @anonymized_output : Bool,
          @provider_endpoint_configuration : Types::ProviderEndpointConfiguration,
          @provider_entity_output_definition : Types::Document,
          @provider_name : String,
          @provider_service_arn : String,
          @provider_service_display_name : String,
          @provider_service_name : String,
          @provider_service_type : String,
          @provider_component_schema : Types::ProviderComponentSchema? = nil,
          @provider_configuration_definition : Types::Document? = nil,
          @provider_id_name_space_configuration : Types::ProviderIdNameSpaceConfiguration? = nil,
          @provider_intermediate_data_access_configuration : Types::ProviderIntermediateDataAccessConfiguration? = nil,
          @provider_job_configuration : Types::Document? = nil
        )
        end
      end


      struct GetSchemaMappingInput
        include JSON::Serializable

        # The name of the schema to be retrieved.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String

        def initialize(
          @schema_name : String
        )
        end
      end


      struct GetSchemaMappingOutput
        include JSON::Serializable

        # The timestamp of when the SchemaMapping was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Specifies whether the schema mapping has been applied to a workflow.

        @[JSON::Field(key: "hasWorkflows")]
        getter has_workflows : Bool

        # A list of MappedInputFields . Each MappedInputField corresponds to a column the source data table,
        # and contains column name plus additional information Entity Resolution uses for matching.

        @[JSON::Field(key: "mappedInputFields")]
        getter mapped_input_fields : Array(Types::SchemaInputAttribute)

        # The ARN (Amazon Resource Name) that Entity Resolution generated for the SchemaMapping.

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String

        # The name of the schema.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String

        # The timestamp of when the SchemaMapping was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # A description of the schema.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @has_workflows : Bool,
          @mapped_input_fields : Array(Types::SchemaInputAttribute),
          @schema_arn : String,
          @schema_name : String,
          @updated_at : Time,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Incremental run configuration for an ID mapping workflow.

      struct IdMappingIncrementalRunConfig
        include JSON::Serializable

        # The incremental run type for an ID mapping workflow. It takes only one value: ON_DEMAND . This
        # setting runs the ID mapping workflow when it's manually triggered through the StartIdMappingJob API.

        @[JSON::Field(key: "incrementalRunType")]
        getter incremental_run_type : String?

        def initialize(
          @incremental_run_type : String? = nil
        )
        end
      end

      # An object that contains metrics about an ID mapping job, including counts of input records,
      # processed records, and mapped records between source and target identifiers.

      struct IdMappingJobMetrics
        include JSON::Serializable

        # The number of records processed that were marked for deletion in the input file using the DELETE
        # schema mapping field. These are the records to be removed from the ID mapping table.

        @[JSON::Field(key: "deleteRecordsProcessed")]
        getter delete_records_processed : Int32?

        # The total number of records that were input for processing.

        @[JSON::Field(key: "inputRecords")]
        getter input_records : Int32?

        # The number of mapped records removed.

        @[JSON::Field(key: "mappedRecordsRemoved")]
        getter mapped_records_removed : Int32?

        # The number of source records removed due to ID mapping.

        @[JSON::Field(key: "mappedSourceRecordsRemoved")]
        getter mapped_source_records_removed : Int32?

        # The number of mapped target records removed.

        @[JSON::Field(key: "mappedTargetRecordsRemoved")]
        getter mapped_target_records_removed : Int32?

        # The number of new mapped records.

        @[JSON::Field(key: "newMappedRecords")]
        getter new_mapped_records : Int32?

        # The number of new source records mapped.

        @[JSON::Field(key: "newMappedSourceRecords")]
        getter new_mapped_source_records : Int32?

        # The number of new mapped target records.

        @[JSON::Field(key: "newMappedTargetRecords")]
        getter new_mapped_target_records : Int32?

        # The number of new unique records processed in the current job run, after removing duplicates. This
        # metric excludes deletion-related records. Duplicates are determined by the field marked as UNIQUE_ID
        # in your schema mapping. Records sharing the same value in this field are considered duplicates. For
        # example, if your current run processes five new records with the same UNIQUE_ID value, they would
        # count as one new unique record in this metric.

        @[JSON::Field(key: "newUniqueRecordsLoaded")]
        getter new_unique_records_loaded : Int32?

        # The total number of records that did not get processed.

        @[JSON::Field(key: "recordsNotProcessed")]
        getter records_not_processed : Int32?

        # The total number of records that were mapped.

        @[JSON::Field(key: "totalMappedRecords")]
        getter total_mapped_records : Int32?

        # The total number of mapped source records.

        @[JSON::Field(key: "totalMappedSourceRecords")]
        getter total_mapped_source_records : Int32?

        # The total number of distinct mapped target records.

        @[JSON::Field(key: "totalMappedTargetRecords")]
        getter total_mapped_target_records : Int32?

        # The total number of records that were processed.

        @[JSON::Field(key: "totalRecordsProcessed")]
        getter total_records_processed : Int32?

        # The number of de-duplicated processed records across all runs, excluding deletion-related records.
        # Duplicates are determined by the field marked as UNIQUE_ID in your schema mapping. Records sharing
        # the same value in this field are considered duplicates. For example, if you specified "customer_id"
        # as a UNIQUE_ID field and had three records with the same customer_id value, they would count as one
        # unique record in this metric.

        @[JSON::Field(key: "uniqueRecordsLoaded")]
        getter unique_records_loaded : Int32?

        def initialize(
          @delete_records_processed : Int32? = nil,
          @input_records : Int32? = nil,
          @mapped_records_removed : Int32? = nil,
          @mapped_source_records_removed : Int32? = nil,
          @mapped_target_records_removed : Int32? = nil,
          @new_mapped_records : Int32? = nil,
          @new_mapped_source_records : Int32? = nil,
          @new_mapped_target_records : Int32? = nil,
          @new_unique_records_loaded : Int32? = nil,
          @records_not_processed : Int32? = nil,
          @total_mapped_records : Int32? = nil,
          @total_mapped_source_records : Int32? = nil,
          @total_mapped_target_records : Int32? = nil,
          @total_records_processed : Int32? = nil,
          @unique_records_loaded : Int32? = nil
        )
        end
      end

      # An object containing KMSArn , outputS3Path , and roleARN .

      struct IdMappingJobOutputSource
        include JSON::Serializable

        # The S3 path to which Entity Resolution will write the output table.

        @[JSON::Field(key: "outputS3Path")]
        getter output_s3_path : String

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to access Amazon
        # Web Services resources on your behalf as part of workflow execution.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Customer KMS ARN for encryption at rest. If not provided, system will use an Entity Resolution
        # managed KMS key.

        @[JSON::Field(key: "KMSArn")]
        getter kms_arn : String?

        def initialize(
          @output_s3_path : String,
          @role_arn : String,
          @kms_arn : String? = nil
        )
        end
      end

      # An object that defines the list of matching rules to run in an ID mapping workflow.

      struct IdMappingRuleBasedProperties
        include JSON::Serializable

        # The comparison type. You can either choose ONE_TO_ONE or MANY_TO_MANY as the attributeMatchingModel
        # . If you choose ONE_TO_ONE , the system can only match attributes if the sub-types are an exact
        # match. For example, for the Email attribute type, the system will only consider it a match if the
        # value of the Email field of Profile A matches the value of the Email field of Profile B. If you
        # choose MANY_TO_MANY , the system can match attributes across the sub-types of an attribute type. For
        # example, if the value of the Email field of Profile A matches the value of the BusinessEmail field
        # of Profile B, the two profiles are matched on the Email attribute type.

        @[JSON::Field(key: "attributeMatchingModel")]
        getter attribute_matching_model : String

        # The type of matching record that is allowed to be used in an ID mapping workflow. If the value is
        # set to ONE_SOURCE_TO_ONE_TARGET , only one record in the source can be matched to the same record in
        # the target. If the value is set to MANY_SOURCE_TO_ONE_TARGET , multiple records in the source can be
        # matched to one record in the target.

        @[JSON::Field(key: "recordMatchingModel")]
        getter record_matching_model : String

        # The set of rules you can use in an ID mapping workflow. The limitations specified for the source or
        # target to define the match rules must be compatible.

        @[JSON::Field(key: "ruleDefinitionType")]
        getter rule_definition_type : String

        # The rules that can be used for ID mapping.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::Rule)?

        def initialize(
          @attribute_matching_model : String,
          @record_matching_model : String,
          @rule_definition_type : String,
          @rules : Array(Types::Rule)? = nil
        )
        end
      end

      # An object which defines the ID mapping technique and any additional configurations.

      struct IdMappingTechniques
        include JSON::Serializable

        # The type of ID mapping.

        @[JSON::Field(key: "idMappingType")]
        getter id_mapping_type : String

        # An object which defines any additional configurations required by the provider service.

        @[JSON::Field(key: "providerProperties")]
        getter provider_properties : Types::ProviderProperties?

        # An object which defines any additional configurations required by rule-based matching.

        @[JSON::Field(key: "ruleBasedProperties")]
        getter rule_based_properties : Types::IdMappingRuleBasedProperties?

        def initialize(
          @id_mapping_type : String,
          @provider_properties : Types::ProviderProperties? = nil,
          @rule_based_properties : Types::IdMappingRuleBasedProperties? = nil
        )
        end
      end

      # An object containing inputSourceARN , schemaName , and type .

      struct IdMappingWorkflowInputSource
        include JSON::Serializable

        # An Glue table Amazon Resource Name (ARN) or a matching workflow ARN for the input source table.

        @[JSON::Field(key: "inputSourceARN")]
        getter input_source_arn : String

        # The name of the schema to be retrieved.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String?

        # The type of ID namespace. There are two types: SOURCE and TARGET . The SOURCE contains
        # configurations for sourceId data that will be processed in an ID mapping workflow. The TARGET
        # contains a configuration of targetId which all sourceIds will resolve to.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @input_source_arn : String,
          @schema_name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The output source for the ID mapping workflow.

      struct IdMappingWorkflowOutputSource
        include JSON::Serializable

        # The S3 path to which Entity Resolution will write the output table.

        @[JSON::Field(key: "outputS3Path")]
        getter output_s3_path : String

        # Customer KMS ARN for encryption at rest. If not provided, system will use an Entity Resolution
        # managed KMS key.

        @[JSON::Field(key: "KMSArn")]
        getter kms_arn : String?

        def initialize(
          @output_s3_path : String,
          @kms_arn : String? = nil
        )
        end
      end

      # A list of IdMappingWorkflowSummary objects, each of which contain the fields WorkflowName ,
      # WorkflowArn , CreatedAt , and UpdatedAt .

      struct IdMappingWorkflowSummary
        include JSON::Serializable

        # The timestamp of when the workflow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp of when the workflow was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The ARN (Amazon Resource Name) that Entity Resolution generated for the IdMappingWorkflow .

        @[JSON::Field(key: "workflowArn")]
        getter workflow_arn : String

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        def initialize(
          @created_at : Time,
          @updated_at : Time,
          @workflow_arn : String,
          @workflow_name : String
        )
        end
      end

      # The settings for the ID namespace for the ID mapping workflow job.

      struct IdNamespaceIdMappingWorkflowMetadata
        include JSON::Serializable

        # The type of ID mapping.

        @[JSON::Field(key: "idMappingType")]
        getter id_mapping_type : String

        def initialize(
          @id_mapping_type : String
        )
        end
      end

      # An object containing idMappingType , providerProperties , and ruleBasedProperties .

      struct IdNamespaceIdMappingWorkflowProperties
        include JSON::Serializable

        # The type of ID mapping.

        @[JSON::Field(key: "idMappingType")]
        getter id_mapping_type : String

        # An object which defines any additional configurations required by the provider service.

        @[JSON::Field(key: "providerProperties")]
        getter provider_properties : Types::NamespaceProviderProperties?

        # An object which defines any additional configurations required by rule-based matching.

        @[JSON::Field(key: "ruleBasedProperties")]
        getter rule_based_properties : Types::NamespaceRuleBasedProperties?

        def initialize(
          @id_mapping_type : String,
          @provider_properties : Types::NamespaceProviderProperties? = nil,
          @rule_based_properties : Types::NamespaceRuleBasedProperties? = nil
        )
        end
      end

      # An object containing inputSourceARN and schemaName .

      struct IdNamespaceInputSource
        include JSON::Serializable

        # An Glue table Amazon Resource Name (ARN) or a matching workflow ARN for the input source table.

        @[JSON::Field(key: "inputSourceARN")]
        getter input_source_arn : String

        # The name of the schema.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String?

        def initialize(
          @input_source_arn : String,
          @schema_name : String? = nil
        )
        end
      end

      # A summary of ID namespaces.

      struct IdNamespaceSummary
        include JSON::Serializable

        # The timestamp of when the ID namespace was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the ID namespace.

        @[JSON::Field(key: "idNamespaceArn")]
        getter id_namespace_arn : String

        # The name of the ID namespace.

        @[JSON::Field(key: "idNamespaceName")]
        getter id_namespace_name : String

        # The type of ID namespace. There are two types: SOURCE and TARGET . The SOURCE contains
        # configurations for sourceId data that will be processed in an ID mapping workflow. The TARGET
        # contains a configuration of targetId which all sourceIds will resolve to.

        @[JSON::Field(key: "type")]
        getter type : String

        # The timestamp of when the ID namespace was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the ID namespace.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An object which defines any additional configurations required by the ID mapping workflow.

        @[JSON::Field(key: "idMappingWorkflowProperties")]
        getter id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowMetadata)?

        def initialize(
          @created_at : Time,
          @id_namespace_arn : String,
          @id_namespace_name : String,
          @type : String,
          @updated_at : Time,
          @description : String? = nil,
          @id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowMetadata)? = nil
        )
        end
      end

      # Optional. An object that defines the incremental run type. This object contains only the
      # incrementalRunType field, which appears as "Automatic" in the console. For workflows where
      # resolutionType is ML_MATCHING or PROVIDER , incremental processing is not supported.

      struct IncrementalRunConfig
        include JSON::Serializable

        # The type of incremental run. The only valid value is IMMEDIATE . This appears as "Automatic" in the
        # console. For workflows where resolutionType is ML_MATCHING or PROVIDER , incremental processing is
        # not supported.

        @[JSON::Field(key: "incrementalRunType")]
        getter incremental_run_type : String?

        def initialize(
          @incremental_run_type : String? = nil
        )
        end
      end

      # An object containing inputSourceARN , schemaName , and applyNormalization .

      struct InputSource
        include JSON::Serializable

        # An Glue table Amazon Resource Name (ARN) for the input source table.

        @[JSON::Field(key: "inputSourceARN")]
        getter input_source_arn : String

        # The name of the schema to be retrieved.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String

        # Normalizes the attributes defined in the schema in the input data. For example, if an attribute has
        # an AttributeType of PHONE_NUMBER , and the data in the input table is in a format of 1234567890,
        # Entity Resolution will normalize this field in the output to (123)-456-7890.

        @[JSON::Field(key: "applyNormalization")]
        getter apply_normalization : Bool?

        def initialize(
          @input_source_arn : String,
          @schema_name : String,
          @apply_normalization : Bool? = nil
        )
        end
      end

      # The Amazon S3 location that temporarily stores your data while it processes. Your information won't
      # be saved permanently.

      struct IntermediateSourceConfiguration
        include JSON::Serializable

        # The Amazon S3 location (bucket and prefix). For example: s3://provider_bucket/DOC-EXAMPLE-BUCKET

        @[JSON::Field(key: "intermediateS3Path")]
        getter intermediate_s3_path : String

        def initialize(
          @intermediate_s3_path : String
        )
        end
      end

      # This exception occurs when there is an internal failure in the Entity Resolution service.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object containing inputRecords , totalRecordsProcessed , matchIDs , and recordsNotProcessed .

      struct JobMetrics
        include JSON::Serializable

        # The number of records processed that were marked for deletion ( DELETE = True) in the input file.
        # This metric tracks records flagged for removal during the job execution.

        @[JSON::Field(key: "deleteRecordsProcessed")]
        getter delete_records_processed : Int32?

        # The total number of input records.

        @[JSON::Field(key: "inputRecords")]
        getter input_records : Int32?

        # The total number of matchID s generated.

        @[JSON::Field(key: "matchIDs")]
        getter match_i_ds : Int32?

        # The total number of records that did not get processed.

        @[JSON::Field(key: "recordsNotProcessed")]
        getter records_not_processed : Int32?

        # The total number of records processed.

        @[JSON::Field(key: "totalRecordsProcessed")]
        getter total_records_processed : Int32?

        def initialize(
          @delete_records_processed : Int32? = nil,
          @input_records : Int32? = nil,
          @match_i_ds : Int32? = nil,
          @records_not_processed : Int32? = nil,
          @total_records_processed : Int32? = nil
        )
        end
      end

      # An object containing KMSArn , outputS3Path , and roleArn .

      struct JobOutputSource
        include JSON::Serializable

        # The S3 path to which Entity Resolution will write the output table.

        @[JSON::Field(key: "outputS3Path")]
        getter output_s3_path : String

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to access Amazon
        # Web Services resources on your behalf as part of workflow execution.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Customer KMS ARN for encryption at rest. If not provided, system will use an Entity Resolution
        # managed KMS key.

        @[JSON::Field(key: "KMSArn")]
        getter kms_arn : String?

        def initialize(
          @output_s3_path : String,
          @role_arn : String,
          @kms_arn : String? = nil
        )
        end
      end

      # An object containing the jobId , status , startTime , and endTime of a job.

      struct JobSummary
        include JSON::Serializable

        # The ID of the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The time at which the job was started.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The current status of the job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time at which the job has finished.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        def initialize(
          @job_id : String,
          @start_time : Time,
          @status : String,
          @end_time : Time? = nil
        )
        end
      end


      struct ListIdMappingJobsInput
        include JSON::Serializable

        # The name of the workflow to be retrieved.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workflow_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdMappingJobsOutput
        include JSON::Serializable

        # A list of JobSummary objects.

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::JobSummary)?

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::JobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdMappingWorkflowsInput
        include JSON::Serializable

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdMappingWorkflowsOutput
        include JSON::Serializable

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of IdMappingWorkflowSummary objects.

        @[JSON::Field(key: "workflowSummaries")]
        getter workflow_summaries : Array(Types::IdMappingWorkflowSummary)?

        def initialize(
          @next_token : String? = nil,
          @workflow_summaries : Array(Types::IdMappingWorkflowSummary)? = nil
        )
        end
      end


      struct ListIdNamespacesInput
        include JSON::Serializable

        # The maximum number of IdNamespace objects returned per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdNamespacesOutput
        include JSON::Serializable

        # A list of IdNamespaceSummaries objects.

        @[JSON::Field(key: "idNamespaceSummaries")]
        getter id_namespace_summaries : Array(Types::IdNamespaceSummary)?

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @id_namespace_summaries : Array(Types::IdNamespaceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMatchingJobsInput
        include JSON::Serializable

        # The name of the workflow to be retrieved.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workflow_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMatchingJobsOutput
        include JSON::Serializable

        # A list of JobSummary objects, each of which contain the ID, status, start time, and end time of a
        # job.

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::JobSummary)?

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::JobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMatchingWorkflowsInput
        include JSON::Serializable

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMatchingWorkflowsOutput
        include JSON::Serializable

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of MatchingWorkflowSummary objects, each of which contain the fields workflowName ,
        # workflowArn , resolutionType , createdAt , and updatedAt .

        @[JSON::Field(key: "workflowSummaries")]
        getter workflow_summaries : Array(Types::MatchingWorkflowSummary)?

        def initialize(
          @next_token : String? = nil,
          @workflow_summaries : Array(Types::MatchingWorkflowSummary)? = nil
        )
        end
      end


      struct ListProviderServicesInput
        include JSON::Serializable

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the provider. This name is typically the company name.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @provider_name : String? = nil
        )
        end
      end


      struct ListProviderServicesOutput
        include JSON::Serializable

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of ProviderServices objects.

        @[JSON::Field(key: "providerServiceSummaries")]
        getter provider_service_summaries : Array(Types::ProviderServiceSummary)?

        def initialize(
          @next_token : String? = nil,
          @provider_service_summaries : Array(Types::ProviderServiceSummary)? = nil
        )
        end
      end


      struct ListSchemaMappingsInput
        include JSON::Serializable

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSchemaMappingsOutput
        include JSON::Serializable

        # The pagination token from the previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of SchemaMappingSummary objects, each of which contain the fields SchemaName , SchemaArn ,
        # CreatedAt , UpdatedAt .

        @[JSON::Field(key: "schemaList")]
        getter schema_list : Array(Types::SchemaMappingSummary)?

        def initialize(
          @next_token : String? = nil,
          @schema_list : Array(Types::SchemaMappingSummary)? = nil
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

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      # The match group.

      struct MatchGroup
        include JSON::Serializable

        # The match ID.

        @[JSON::Field(key: "matchId")]
        getter match_id : String

        # The match rule of the match group.

        @[JSON::Field(key: "matchRule")]
        getter match_rule : String

        # The matched records.

        @[JSON::Field(key: "records")]
        getter records : Array(Types::MatchedRecord)

        def initialize(
          @match_id : String,
          @match_rule : String,
          @records : Array(Types::MatchedRecord)
        )
        end
      end

      # The matched record.

      struct MatchedRecord
        include JSON::Serializable

        # The input source ARN of the matched record.

        @[JSON::Field(key: "inputSourceARN")]
        getter input_source_arn : String

        # The record ID of the matched record.

        @[JSON::Field(key: "recordId")]
        getter record_id : String

        def initialize(
          @input_source_arn : String,
          @record_id : String
        )
        end
      end

      # A list of MatchingWorkflowSummary objects, each of which contain the fields workflowName ,
      # workflowArn , resolutionType , createdAt , updatedAt .

      struct MatchingWorkflowSummary
        include JSON::Serializable

        # The timestamp of when the workflow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The method that has been specified for data matching, either using matching provided by Entity
        # Resolution or through a provider service.

        @[JSON::Field(key: "resolutionType")]
        getter resolution_type : String

        # The timestamp of when the workflow was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The ARN (Amazon Resource Name) that Entity Resolution generated for the MatchingWorkflow .

        @[JSON::Field(key: "workflowArn")]
        getter workflow_arn : String

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        def initialize(
          @created_at : Time,
          @resolution_type : String,
          @updated_at : Time,
          @workflow_arn : String,
          @workflow_name : String
        )
        end
      end

      # An object containing providerConfiguration and providerServiceArn .

      struct NamespaceProviderProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the provider service.

        @[JSON::Field(key: "providerServiceArn")]
        getter provider_service_arn : String

        # An object which defines any additional configurations required by the provider service.

        @[JSON::Field(key: "providerConfiguration")]
        getter provider_configuration : Types::Document?

        def initialize(
          @provider_service_arn : String,
          @provider_configuration : Types::Document? = nil
        )
        end
      end

      # The rule-based properties of an ID namespace. These properties define how the ID namespace can be
      # used in an ID mapping workflow.

      struct NamespaceRuleBasedProperties
        include JSON::Serializable

        # The comparison type. You can either choose ONE_TO_ONE or MANY_TO_MANY as the attributeMatchingModel
        # . If you choose ONE_TO_ONE , the system can only match attributes if the sub-types are an exact
        # match. For example, for the Email attribute type, the system will only consider it a match if the
        # value of the Email field of Profile A matches the value of the Email field of Profile B. If you
        # choose MANY_TO_MANY , the system can match attributes across the sub-types of an attribute type. For
        # example, if the value of the Email field of Profile A matches the value of BusinessEmail field of
        # Profile B, the two profiles are matched on the Email attribute type.

        @[JSON::Field(key: "attributeMatchingModel")]
        getter attribute_matching_model : String?

        # The type of matching record that is allowed to be used in an ID mapping workflow. If the value is
        # set to ONE_SOURCE_TO_ONE_TARGET , only one record in the source is matched to one record in the
        # target. If the value is set to MANY_SOURCE_TO_ONE_TARGET , all matching records in the source are
        # matched to one record in the target.

        @[JSON::Field(key: "recordMatchingModels")]
        getter record_matching_models : Array(String)?

        # The sets of rules you can use in an ID mapping workflow. The limitations specified for the source
        # and target must be compatible.

        @[JSON::Field(key: "ruleDefinitionTypes")]
        getter rule_definition_types : Array(String)?

        # The rules for the ID namespace.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::Rule)?

        def initialize(
          @attribute_matching_model : String? = nil,
          @record_matching_models : Array(String)? = nil,
          @rule_definition_types : Array(String)? = nil,
          @rules : Array(Types::Rule)? = nil
        )
        end
      end

      # A list of OutputAttribute objects, each of which have the fields Name and Hashed . Each of these
      # objects selects a column to be included in the output table, and whether the values of the column
      # should be hashed.

      struct OutputAttribute
        include JSON::Serializable

        # A name of a column to be written to the output. This must be an InputField name in the schema
        # mapping.

        @[JSON::Field(key: "name")]
        getter name : String

        # Enables the ability to hash the column values in the output.

        @[JSON::Field(key: "hashed")]
        getter hashed : Bool?

        def initialize(
          @name : String,
          @hashed : Bool? = nil
        )
        end
      end

      # A list of OutputAttribute objects, each of which have the fields Name and Hashed . Each of these
      # objects selects a column to be included in the output table, and whether the values of the column
      # should be hashed.

      struct OutputSource
        include JSON::Serializable

        # A list of OutputAttribute objects, each of which have the fields Name and Hashed . Each of these
        # objects selects a column to be included in the output table, and whether the values of the column
        # should be hashed.

        @[JSON::Field(key: "output")]
        getter output : Array(Types::OutputAttribute)

        # Customer KMS ARN for encryption at rest. If not provided, system will use an Entity Resolution
        # managed KMS key.

        @[JSON::Field(key: "KMSArn")]
        getter kms_arn : String?

        # Normalizes the attributes defined in the schema in the input data. For example, if an attribute has
        # an AttributeType of PHONE_NUMBER , and the data in the input table is in a format of 1234567890,
        # Entity Resolution will normalize this field in the output to (123)-456-7890.

        @[JSON::Field(key: "applyNormalization")]
        getter apply_normalization : Bool?

        # Specifies the Customer Profiles integration configuration for sending matched output directly to
        # Customer Profiles. When configured, Entity Resolution automatically creates and updates customer
        # profiles based on match clusters, eliminating the need for manual Amazon S3 integration setup.

        @[JSON::Field(key: "customerProfilesIntegrationConfig")]
        getter customer_profiles_integration_config : Types::CustomerProfilesIntegrationConfig?

        # The S3 path to which Entity Resolution will write the output table.

        @[JSON::Field(key: "outputS3Path")]
        getter output_s3_path : String?

        def initialize(
          @output : Array(Types::OutputAttribute),
          @kms_arn : String? = nil,
          @apply_normalization : Bool? = nil,
          @customer_profiles_integration_config : Types::CustomerProfilesIntegrationConfig? = nil,
          @output_s3_path : String? = nil
        )
        end
      end

      # The input schema supported by provider service.

      struct ProviderComponentSchema
        include JSON::Serializable

        # The provider schema attributes.

        @[JSON::Field(key: "providerSchemaAttributes")]
        getter provider_schema_attributes : Array(Types::ProviderSchemaAttribute)?

        # Input schema for the provider service.

        @[JSON::Field(key: "schemas")]
        getter schemas : Array(Array(String))?

        def initialize(
          @provider_schema_attributes : Array(Types::ProviderSchemaAttribute)? = nil,
          @schemas : Array(Array(String))? = nil
        )
        end
      end

      # The required configuration fields to use with the provider service.

      struct ProviderEndpointConfiguration
        include JSON::Serializable

        # The identifiers of the provider service, from Data Exchange.

        @[JSON::Field(key: "marketplaceConfiguration")]
        getter marketplace_configuration : Types::ProviderMarketplaceConfiguration?

        def initialize(
          @marketplace_configuration : Types::ProviderMarketplaceConfiguration? = nil
        )
        end
      end

      # The provider configuration required for different ID namespace types.

      struct ProviderIdNameSpaceConfiguration
        include JSON::Serializable

        # The description of the ID namespace.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Configurations required for the source ID namespace.

        @[JSON::Field(key: "providerSourceConfigurationDefinition")]
        getter provider_source_configuration_definition : Types::Document?

        # Configurations required for the target ID namespace.

        @[JSON::Field(key: "providerTargetConfigurationDefinition")]
        getter provider_target_configuration_definition : Types::Document?

        def initialize(
          @description : String? = nil,
          @provider_source_configuration_definition : Types::Document? = nil,
          @provider_target_configuration_definition : Types::Document? = nil
        )
        end
      end

      # The required configuration fields to give intermediate access to a provider service.

      struct ProviderIntermediateDataAccessConfiguration
        include JSON::Serializable

        # The Amazon Web Services account that provider can use to read or write data into the customer's
        # intermediate S3 bucket.

        @[JSON::Field(key: "awsAccountIds")]
        getter aws_account_ids : Array(String)?

        # The S3 bucket actions that the provider requires permission for.

        @[JSON::Field(key: "requiredBucketActions")]
        getter required_bucket_actions : Array(String)?

        def initialize(
          @aws_account_ids : Array(String)? = nil,
          @required_bucket_actions : Array(String)? = nil
        )
        end
      end

      # The identifiers of the provider service, from Data Exchange.

      struct ProviderMarketplaceConfiguration
        include JSON::Serializable

        # The asset ID on Data Exchange.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The dataset ID on Data Exchange.

        @[JSON::Field(key: "dataSetId")]
        getter data_set_id : String

        # The listing ID on Data Exchange.

        @[JSON::Field(key: "listingId")]
        getter listing_id : String

        # The revision ID on Data Exchange.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @asset_id : String,
          @data_set_id : String,
          @listing_id : String,
          @revision_id : String
        )
        end
      end

      # An object containing the providerServiceARN , intermediateSourceConfiguration , and
      # providerConfiguration .

      struct ProviderProperties
        include JSON::Serializable

        # The ARN of the provider service.

        @[JSON::Field(key: "providerServiceArn")]
        getter provider_service_arn : String

        # The Amazon S3 location that temporarily stores your data while it processes. Your information won't
        # be saved permanently.

        @[JSON::Field(key: "intermediateSourceConfiguration")]
        getter intermediate_source_configuration : Types::IntermediateSourceConfiguration?

        # The required configuration fields to use with the provider service.

        @[JSON::Field(key: "providerConfiguration")]
        getter provider_configuration : Types::Document?

        def initialize(
          @provider_service_arn : String,
          @intermediate_source_configuration : Types::IntermediateSourceConfiguration? = nil,
          @provider_configuration : Types::Document? = nil
        )
        end
      end

      # The provider schema attribute.

      struct ProviderSchemaAttribute
        include JSON::Serializable

        # The field name.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String

        # The type of the provider schema attribute. LiveRamp supports: NAME | NAME_FIRST | NAME_MIDDLE |
        # NAME_LAST | ADDRESS | ADDRESS_STREET1 | ADDRESS_STREET2 | ADDRESS_STREET3 | ADDRESS_CITY |
        # ADDRESS_STATE | ADDRESS_COUNTRY | ADDRESS_POSTALCODE | PHONE | PHONE_NUMBER | EMAIL_ADDRESS |
        # UNIQUE_ID | PROVIDER_ID TransUnion supports: NAME | NAME_FIRST | NAME_LAST | ADDRESS | ADDRESS_CITY
        # | ADDRESS_STATE | ADDRESS_COUNTRY | ADDRESS_POSTALCODE | PHONE_NUMBER | EMAIL_ADDRESS | UNIQUE_ID |
        # DATE | IPV4 | IPV6 | MAID Unified ID 2.0 supports: PHONE_NUMBER | EMAIL_ADDRESS | UNIQUE_ID

        @[JSON::Field(key: "type")]
        getter type : String

        # The hashing attribute of the provider schema.

        @[JSON::Field(key: "hashing")]
        getter hashing : Bool?

        # The sub type of the provider schema attribute.

        @[JSON::Field(key: "subType")]
        getter sub_type : String?

        def initialize(
          @field_name : String,
          @type : String,
          @hashing : Bool? = nil,
          @sub_type : String? = nil
        )
        end
      end

      # A list of ProviderService objects, each of which contain the fields providerName ,
      # providerServiceArn , providerServiceName , and providerServiceType .

      struct ProviderServiceSummary
        include JSON::Serializable

        # The name of the provider. This name is typically the company name.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String

        # The ARN (Amazon Resource Name) that Entity Resolution generated for the providerService .

        @[JSON::Field(key: "providerServiceArn")]
        getter provider_service_arn : String

        # The display name of the provider service.

        @[JSON::Field(key: "providerServiceDisplayName")]
        getter provider_service_display_name : String

        # The name of the product that the provider service provides.

        @[JSON::Field(key: "providerServiceName")]
        getter provider_service_name : String

        # The type of provider service.

        @[JSON::Field(key: "providerServiceType")]
        getter provider_service_type : String

        def initialize(
          @provider_name : String,
          @provider_service_arn : String,
          @provider_service_display_name : String,
          @provider_service_name : String,
          @provider_service_type : String
        )
        end
      end


      struct PutPolicyInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which the policy needs to be updated.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The resource-based policy. If you set the value of the effect parameter in the policy to Deny for
        # the PutPolicy operation, you must also set the value of the effect parameter to Deny for the
        # AddPolicyStatement operation.

        @[JSON::Field(key: "policy")]
        getter policy : String

        # A unique identifier for the current revision of the policy.

        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @arn : String,
          @policy : String,
          @token : String? = nil
        )
        end
      end


      struct PutPolicyOutput
        include JSON::Serializable

        # The Entity Resolution resource ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # A unique identifier for the current revision of the policy.

        @[JSON::Field(key: "token")]
        getter token : String

        # The resource-based policy.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @arn : String,
          @token : String,
          @policy : String? = nil
        )
        end
      end

      # The record.

      struct Record
        include JSON::Serializable

        # The input source ARN of the record.

        @[JSON::Field(key: "inputSourceARN")]
        getter input_source_arn : String

        # The record's attribute map.

        @[JSON::Field(key: "recordAttributeMap")]
        getter record_attribute_map : Hash(String, String)

        # The unique ID of the record.

        @[JSON::Field(key: "uniqueId")]
        getter unique_id : String

        def initialize(
          @input_source_arn : String,
          @record_attribute_map : Hash(String, String),
          @unique_id : String
        )
        end
      end

      # An object which defines the resolutionType and the ruleBasedProperties .

      struct ResolutionTechniques
        include JSON::Serializable

        # The type of matching workflow to create. Specify one of the following types: RULE_MATCHING : Match
        # records using configurable rule-based criteria ML_MATCHING : Match records using machine learning
        # models PROVIDER : Match records using a third-party matching provider

        @[JSON::Field(key: "resolutionType")]
        getter resolution_type : String

        # The properties of the provider service.

        @[JSON::Field(key: "providerProperties")]
        getter provider_properties : Types::ProviderProperties?

        # An object which defines the list of matching rules to run and has a field rules , which is a list of
        # rule objects.

        @[JSON::Field(key: "ruleBasedProperties")]
        getter rule_based_properties : Types::RuleBasedProperties?

        # An object containing the rules for a matching workflow.

        @[JSON::Field(key: "ruleConditionProperties")]
        getter rule_condition_properties : Types::RuleConditionProperties?

        def initialize(
          @resolution_type : String,
          @provider_properties : Types::ProviderProperties? = nil,
          @rule_based_properties : Types::RuleBasedProperties? = nil,
          @rule_condition_properties : Types::RuleConditionProperties? = nil
        )
        end
      end

      # The resource couldn't be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object containing the ruleName and matchingKeys .

      struct Rule
        include JSON::Serializable

        # A list of MatchingKeys . The MatchingKeys must have been defined in the SchemaMapping . Two records
        # are considered to match according to this rule if all of the MatchingKeys match.

        @[JSON::Field(key: "matchingKeys")]
        getter matching_keys : Array(String)

        # A name for the matching rule.

        @[JSON::Field(key: "ruleName")]
        getter rule_name : String

        def initialize(
          @matching_keys : Array(String),
          @rule_name : String
        )
        end
      end

      # An object which defines the list of matching rules to run in a matching workflow.

      struct RuleBasedProperties
        include JSON::Serializable

        # The comparison type. You can choose ONE_TO_ONE or MANY_TO_MANY as the attributeMatchingModel . If
        # you choose ONE_TO_ONE , the system can only match attributes if the sub-types are an exact match.
        # For example, for the Email attribute type, the system will only consider it a match if the value of
        # the Email field of Profile A matches the value of the Email field of Profile B. If you choose
        # MANY_TO_MANY , the system can match attributes across the sub-types of an attribute type. For
        # example, if the value of the Email field of Profile A and the value of BusinessEmail field of
        # Profile B matches, the two profiles are matched on the Email attribute type.

        @[JSON::Field(key: "attributeMatchingModel")]
        getter attribute_matching_model : String

        # A list of Rule objects, each of which have fields RuleName and MatchingKeys .

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::Rule)

        # An indicator of whether to generate IDs and index the data or not. If you choose
        # IDENTIFIER_GENERATION , the process generates IDs and indexes the data. If you choose INDEXING , the
        # process indexes the data without generating IDs.

        @[JSON::Field(key: "matchPurpose")]
        getter match_purpose : String?

        def initialize(
          @attribute_matching_model : String,
          @rules : Array(Types::Rule),
          @match_purpose : String? = nil
        )
        end
      end

      # An object that defines the ruleCondition and the ruleName to use in a matching workflow.

      struct RuleCondition
        include JSON::Serializable

        # A statement that specifies the conditions for a matching rule. If your data is accurate, use an
        # Exact matching function: Exact or ExactManyToMany . If your data has variations in spelling or
        # pronunciation, use a Fuzzy matching function: Cosine , Levenshtein , or Soundex . Use operators if
        # you want to combine ( AND ), separate ( OR ), or group matching functions (...) . For example:
        # (Cosine(a, 10) AND Exact(b, true)) OR ExactManyToMany(c, d)

        @[JSON::Field(key: "condition")]
        getter condition : String

        # A name for the matching rule. For example: Rule1

        @[JSON::Field(key: "ruleName")]
        getter rule_name : String

        def initialize(
          @condition : String,
          @rule_name : String
        )
        end
      end

      # The properties of a rule condition that provides the ability to use more complex syntax.

      struct RuleConditionProperties
        include JSON::Serializable

        # A list of rule objects, each of which have fields ruleName and condition .

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::RuleCondition)

        def initialize(
          @rules : Array(Types::RuleCondition)
        )
        end
      end

      # A configuration object for defining input data fields in Entity Resolution. The SchemaInputAttribute
      # specifies how individual fields in your input data should be processed and matched.

      struct SchemaInputAttribute
        include JSON::Serializable

        # A string containing the field name.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String

        # The type of the attribute, selected from a list of values. LiveRamp supports: NAME | NAME_FIRST |
        # NAME_MIDDLE | NAME_LAST | ADDRESS | ADDRESS_STREET1 | ADDRESS_STREET2 | ADDRESS_STREET3 |
        # ADDRESS_CITY | ADDRESS_STATE | ADDRESS_COUNTRY | ADDRESS_POSTALCODE | PHONE | PHONE_NUMBER |
        # EMAIL_ADDRESS | UNIQUE_ID | PROVIDER_ID TransUnion supports: NAME | NAME_FIRST | NAME_LAST | ADDRESS
        # | ADDRESS_CITY | ADDRESS_STATE | ADDRESS_COUNTRY | ADDRESS_POSTALCODE | PHONE_NUMBER | EMAIL_ADDRESS
        # | UNIQUE_ID | IPV4 | IPV6 | MAID Unified ID 2.0 supports: PHONE_NUMBER | EMAIL_ADDRESS | UNIQUE_ID
        # Normalization is only supported for NAME , ADDRESS , PHONE , and EMAIL_ADDRESS . If you want to
        # normalize NAME_FIRST , NAME_MIDDLE , and NAME_LAST , you must group them by assigning them to the
        # NAME groupName . If you want to normalize ADDRESS_STREET1 , ADDRESS_STREET2 , ADDRESS_STREET3 ,
        # ADDRESS_CITY , ADDRESS_STATE , ADDRESS_COUNTRY , and ADDRESS_POSTALCODE , you must group them by
        # assigning them to the ADDRESS groupName . If you want to normalize PHONE_NUMBER and
        # PHONE_COUNTRYCODE , you must group them by assigning them to the PHONE groupName .

        @[JSON::Field(key: "type")]
        getter type : String

        # A string that instructs Entity Resolution to combine several columns into a unified column with the
        # identical attribute type. For example, when working with columns such as NAME_FIRST , NAME_MIDDLE ,
        # and NAME_LAST , assigning them a common groupName will prompt Entity Resolution to concatenate them
        # into a single value.

        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        # Indicates if the column values are hashed in the schema input. If the value is set to TRUE , the
        # column values are hashed. If the value is set to FALSE , the column values are cleartext.

        @[JSON::Field(key: "hashed")]
        getter hashed : Bool?

        # A key that allows grouping of multiple input attributes into a unified matching group. For example,
        # consider a scenario where the source table contains various addresses, such as business_address and
        # shipping_address . By assigning a matchKey called address to both attributes, Entity Resolution will
        # match records across these fields to create a consolidated matching group. If no matchKey is
        # specified for a column, it won't be utilized for matching purposes but will still be included in the
        # output table.

        @[JSON::Field(key: "matchKey")]
        getter match_key : String?

        # The subtype of the attribute, selected from a list of values.

        @[JSON::Field(key: "subType")]
        getter sub_type : String?

        def initialize(
          @field_name : String,
          @type : String,
          @group_name : String? = nil,
          @hashed : Bool? = nil,
          @match_key : String? = nil,
          @sub_type : String? = nil
        )
        end
      end

      # An object containing schemaName , schemaArn , createdAt , updatedAt , and hasWorkflows .

      struct SchemaMappingSummary
        include JSON::Serializable

        # The timestamp of when the SchemaMapping was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Specifies whether the schema mapping has been applied to a workflow.

        @[JSON::Field(key: "hasWorkflows")]
        getter has_workflows : Bool

        # The ARN (Amazon Resource Name) that Entity Resolution generated for the SchemaMapping .

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String

        # The name of the schema.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String

        # The timestamp of when the SchemaMapping was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @created_at : Time,
          @has_workflows : Bool,
          @schema_arn : String,
          @schema_name : String,
          @updated_at : Time
        )
        end
      end


      struct StartIdMappingJobInput
        include JSON::Serializable

        # The name of the ID mapping job to be retrieved.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # The job type for the ID mapping job. If the jobType value is set to INCREMENTAL , only new or
        # changed data is processed since the last job run. This is the default value if the
        # CreateIdMappingWorkflow API is configured with an incrementalRunConfig . If the jobType value is set
        # to BATCH , all data is processed from the input source, regardless of previous job runs. This is the
        # default value if the CreateIdMappingWorkflow API isn't configured with an incrementalRunConfig . If
        # the jobType value is set to DELETE_ONLY , only deletion requests from BatchDeleteUniqueIds are
        # processed.

        @[JSON::Field(key: "jobType")]
        getter job_type : String?

        # A list of OutputSource objects.

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::IdMappingJobOutputSource)?

        def initialize(
          @workflow_name : String,
          @job_type : String? = nil,
          @output_source_config : Array(Types::IdMappingJobOutputSource)? = nil
        )
        end
      end


      struct StartIdMappingJobOutput
        include JSON::Serializable

        # The ID of the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The job type for the started ID mapping job. A value of INCREMENTAL indicates that only new or
        # changed data was processed since the last job run. This is the default job type if the workflow was
        # created with an incrementalRunConfig . A value of BATCH indicates that all data was processed from
        # the input source, regardless of previous job runs. This is the default job type if the workflow
        # wasn't created with an incrementalRunConfig . A value of DELETE_ONLY indicates that only deletion
        # requests from BatchDeleteUniqueIds were processed.

        @[JSON::Field(key: "jobType")]
        getter job_type : String?

        # A list of OutputSource objects.

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::IdMappingJobOutputSource)?

        def initialize(
          @job_id : String,
          @job_type : String? = nil,
          @output_source_config : Array(Types::IdMappingJobOutputSource)? = nil
        )
        end
      end


      struct StartMatchingJobInput
        include JSON::Serializable

        # The name of the matching job to be retrieved.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        def initialize(
          @workflow_name : String
        )
        end
      end


      struct StartMatchingJobOutput
        include JSON::Serializable

        # The ID of the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The ARN of the resource for which you want to view tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags used to organize, track, or control access for this resource.

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
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The ARN of the resource for which you want to untag.

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


      struct UpdateIdMappingWorkflowInput
        include JSON::Serializable

        # An object which defines the ID mapping technique and any additional configurations.

        @[JSON::Field(key: "idMappingTechniques")]
        getter id_mapping_techniques : Types::IdMappingTechniques

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::IdMappingWorkflowInputSource)

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # A description of the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The incremental run configuration for the update ID mapping workflow.

        @[JSON::Field(key: "incrementalRunConfig")]
        getter incremental_run_config : Types::IdMappingIncrementalRunConfig?

        # A list of OutputSource objects, each of which contains fields outputS3Path and KMSArn .

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::IdMappingWorkflowOutputSource)?

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to access Amazon
        # Web Services resources on your behalf.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @id_mapping_techniques : Types::IdMappingTechniques,
          @input_source_config : Array(Types::IdMappingWorkflowInputSource),
          @workflow_name : String,
          @description : String? = nil,
          @incremental_run_config : Types::IdMappingIncrementalRunConfig? = nil,
          @output_source_config : Array(Types::IdMappingWorkflowOutputSource)? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateIdMappingWorkflowOutput
        include JSON::Serializable

        # An object which defines the ID mapping technique and any additional configurations.

        @[JSON::Field(key: "idMappingTechniques")]
        getter id_mapping_techniques : Types::IdMappingTechniques

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::IdMappingWorkflowInputSource)

        # The Amazon Resource Name (ARN) of the workflow role. Entity Resolution assumes this role to access
        # Amazon Web Services resources on your behalf.

        @[JSON::Field(key: "workflowArn")]
        getter workflow_arn : String

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # A description of the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The incremental run configuration for the update ID mapping workflow output.

        @[JSON::Field(key: "incrementalRunConfig")]
        getter incremental_run_config : Types::IdMappingIncrementalRunConfig?

        # A list of OutputSource objects, each of which contains fields outputS3Path and KMSArn .

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::IdMappingWorkflowOutputSource)?

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to access Amazon
        # Web Services resources on your behalf.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @id_mapping_techniques : Types::IdMappingTechniques,
          @input_source_config : Array(Types::IdMappingWorkflowInputSource),
          @workflow_arn : String,
          @workflow_name : String,
          @description : String? = nil,
          @incremental_run_config : Types::IdMappingIncrementalRunConfig? = nil,
          @output_source_config : Array(Types::IdMappingWorkflowOutputSource)? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateIdNamespaceInput
        include JSON::Serializable

        # The name of the ID namespace.

        @[JSON::Field(key: "idNamespaceName")]
        getter id_namespace_name : String

        # The description of the ID namespace.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Determines the properties of IdMappingWorkflow where this IdNamespace can be used as a Source or a
        # Target .

        @[JSON::Field(key: "idMappingWorkflowProperties")]
        getter id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowProperties)?

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::IdNamespaceInputSource)?

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to access the
        # resources defined in this IdNamespace on your behalf as part of a workflow run.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @id_namespace_name : String,
          @description : String? = nil,
          @id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowProperties)? = nil,
          @input_source_config : Array(Types::IdNamespaceInputSource)? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateIdNamespaceOutput
        include JSON::Serializable

        # The timestamp of when the ID namespace was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the ID namespace.

        @[JSON::Field(key: "idNamespaceArn")]
        getter id_namespace_arn : String

        # The name of the ID namespace.

        @[JSON::Field(key: "idNamespaceName")]
        getter id_namespace_name : String

        # The type of ID namespace. There are two types: SOURCE and TARGET . The SOURCE contains
        # configurations for sourceId data that will be processed in an ID mapping workflow. The TARGET
        # contains a configuration of targetId to which all sourceIds will resolve to.

        @[JSON::Field(key: "type")]
        getter type : String

        # The timestamp of when the ID namespace was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the ID namespace.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Determines the properties of IdMappingWorkflow where this IdNamespace can be used as a Source or a
        # Target .

        @[JSON::Field(key: "idMappingWorkflowProperties")]
        getter id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowProperties)?

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::IdNamespaceInputSource)?

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to access the
        # resources defined in this IdNamespace on your behalf as part of a workflow run.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @created_at : Time,
          @id_namespace_arn : String,
          @id_namespace_name : String,
          @type : String,
          @updated_at : Time,
          @description : String? = nil,
          @id_mapping_workflow_properties : Array(Types::IdNamespaceIdMappingWorkflowProperties)? = nil,
          @input_source_config : Array(Types::IdNamespaceInputSource)? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateMatchingWorkflowInput
        include JSON::Serializable

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::InputSource)

        # A list of OutputSource objects, each of which contains fields outputS3Path , applyNormalization ,
        # KMSArn , and output .

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::OutputSource)

        # An object which defines the resolutionType and the ruleBasedProperties .

        @[JSON::Field(key: "resolutionTechniques")]
        getter resolution_techniques : Types::ResolutionTechniques

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to create
        # resources on your behalf as part of workflow execution.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of the workflow to be retrieved.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # A description of the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Optional. An object that defines the incremental run type. This object contains only the
        # incrementalRunType field, which appears as "Automatic" in the console. For workflows where
        # resolutionType is ML_MATCHING or PROVIDER , incremental processing is not supported.

        @[JSON::Field(key: "incrementalRunConfig")]
        getter incremental_run_config : Types::IncrementalRunConfig?

        def initialize(
          @input_source_config : Array(Types::InputSource),
          @output_source_config : Array(Types::OutputSource),
          @resolution_techniques : Types::ResolutionTechniques,
          @role_arn : String,
          @workflow_name : String,
          @description : String? = nil,
          @incremental_run_config : Types::IncrementalRunConfig? = nil
        )
        end
      end


      struct UpdateMatchingWorkflowOutput
        include JSON::Serializable

        # A list of InputSource objects, which have the fields InputSourceARN and SchemaName .

        @[JSON::Field(key: "inputSourceConfig")]
        getter input_source_config : Array(Types::InputSource)

        # A list of OutputSource objects, each of which contains fields outputS3Path , applyNormalization ,
        # KMSArn , and output .

        @[JSON::Field(key: "outputSourceConfig")]
        getter output_source_config : Array(Types::OutputSource)

        # An object which defines the resolutionType and the ruleBasedProperties .

        @[JSON::Field(key: "resolutionTechniques")]
        getter resolution_techniques : Types::ResolutionTechniques

        # The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes this role to create
        # resources on your behalf as part of workflow execution.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of the workflow.

        @[JSON::Field(key: "workflowName")]
        getter workflow_name : String

        # A description of the workflow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An object which defines an incremental run type and has only incrementalRunType as a field.

        @[JSON::Field(key: "incrementalRunConfig")]
        getter incremental_run_config : Types::IncrementalRunConfig?

        def initialize(
          @input_source_config : Array(Types::InputSource),
          @output_source_config : Array(Types::OutputSource),
          @resolution_techniques : Types::ResolutionTechniques,
          @role_arn : String,
          @workflow_name : String,
          @description : String? = nil,
          @incremental_run_config : Types::IncrementalRunConfig? = nil
        )
        end
      end


      struct UpdateSchemaMappingInput
        include JSON::Serializable

        # A list of MappedInputFields . Each MappedInputField corresponds to a column the source data table,
        # and contains column name plus additional information that Entity Resolution uses for matching.

        @[JSON::Field(key: "mappedInputFields")]
        getter mapped_input_fields : Array(Types::SchemaInputAttribute)

        # The name of the schema. There can't be multiple SchemaMappings with the same name.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String

        # A description of the schema.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @mapped_input_fields : Array(Types::SchemaInputAttribute),
          @schema_name : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateSchemaMappingOutput
        include JSON::Serializable

        # A list of MappedInputFields . Each MappedInputField corresponds to a column the source data table,
        # and contains column name plus additional information that Entity Resolution uses for matching.

        @[JSON::Field(key: "mappedInputFields")]
        getter mapped_input_fields : Array(Types::SchemaInputAttribute)

        # The ARN (Amazon Resource Name) that Entity Resolution generated for the SchemaMapping .

        @[JSON::Field(key: "schemaArn")]
        getter schema_arn : String

        # The name of the schema.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String

        # A description of the schema.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @mapped_input_fields : Array(Types::SchemaInputAttribute),
          @schema_arn : String,
          @schema_name : String,
          @description : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by Entity Resolution.

      struct ValidationException
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
