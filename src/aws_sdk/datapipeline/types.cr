require "json"
require "time"

module AwsSdk
  module DataPipeline
    module Types

      # Contains the parameters for ActivatePipeline.

      struct ActivatePipelineInput
        include JSON::Serializable

        # The ID of the pipeline.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        # A list of parameter values to pass to the pipeline at activation.

        @[JSON::Field(key: "parameterValues")]
        getter parameter_values : Array(Types::ParameterValue)?

        # The date and time to resume the pipeline. By default, the pipeline resumes from the last completed
        # execution.

        @[JSON::Field(key: "startTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_timestamp : Time?

        def initialize(
          @pipeline_id : String,
          @parameter_values : Array(Types::ParameterValue)? = nil,
          @start_timestamp : Time? = nil
        )
        end
      end

      # Contains the output of ActivatePipeline.

      struct ActivatePipelineOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for AddTags.

      struct AddTagsInput
        include JSON::Serializable

        # The ID of the pipeline.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        # The tags to add, as key/value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @pipeline_id : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # Contains the output of AddTags.

      struct AddTagsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for CreatePipeline.

      struct CreatePipelineInput
        include JSON::Serializable

        # The name for the pipeline. You can use the same name for multiple pipelines associated with your AWS
        # account, because AWS Data Pipeline assigns each pipeline a unique pipeline identifier.

        @[JSON::Field(key: "name")]
        getter name : String

        # A unique identifier. This identifier is not the same as the pipeline identifier assigned by AWS Data
        # Pipeline. You are responsible for defining the format and ensuring the uniqueness of this
        # identifier. You use this parameter to ensure idempotency during repeated calls to CreatePipeline .
        # For example, if the first call to CreatePipeline does not succeed, you can pass in the same unique
        # identifier and pipeline name combination on a subsequent call to CreatePipeline . CreatePipeline
        # ensures that if a pipeline already exists with the same name and unique identifier, a new pipeline
        # is not created. Instead, you'll receive the pipeline identifier from the previous attempt. The
        # uniqueness of the name and unique identifier combination is scoped to the AWS account or IAM user
        # credentials.

        @[JSON::Field(key: "uniqueId")]
        getter unique_id : String

        # The description for the pipeline.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of tags to associate with the pipeline at creation. Tags let you control access to pipelines.
        # For more information, see Controlling User Access to Pipelines in the AWS Data Pipeline Developer
        # Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @unique_id : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains the output of CreatePipeline.

      struct CreatePipelineOutput
        include JSON::Serializable

        # The ID that AWS Data Pipeline assigns the newly created pipeline. For example,
        # df-06372391ZG65EXAMPLE .

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        def initialize(
          @pipeline_id : String
        )
        end
      end

      # Contains the parameters for DeactivatePipeline.

      struct DeactivatePipelineInput
        include JSON::Serializable

        # The ID of the pipeline.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        # Indicates whether to cancel any running objects. The default is true, which sets the state of any
        # running objects to CANCELED . If this value is false, the pipeline is deactivated after all running
        # objects finish.

        @[JSON::Field(key: "cancelActive")]
        getter cancel_active : Bool?

        def initialize(
          @pipeline_id : String,
          @cancel_active : Bool? = nil
        )
        end
      end

      # Contains the output of DeactivatePipeline.

      struct DeactivatePipelineOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for DeletePipeline.

      struct DeletePipelineInput
        include JSON::Serializable

        # The ID of the pipeline.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        def initialize(
          @pipeline_id : String
        )
        end
      end

      # Contains the parameters for DescribeObjects.

      struct DescribeObjectsInput
        include JSON::Serializable

        # The IDs of the pipeline objects that contain the definitions to be described. You can pass as many
        # as 25 identifiers in a single call to DescribeObjects .

        @[JSON::Field(key: "objectIds")]
        getter object_ids : Array(String)

        # The ID of the pipeline that contains the object definitions.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        # Indicates whether any expressions in the object should be evaluated when the object descriptions are
        # returned.

        @[JSON::Field(key: "evaluateExpressions")]
        getter evaluate_expressions : Bool?

        # The starting point for the results to be returned. For the first call, this value should be empty.
        # As long as there are more results, continue to call DescribeObjects with the marker value from the
        # previous call to retrieve the next set of results.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @object_ids : Array(String),
          @pipeline_id : String,
          @evaluate_expressions : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      # Contains the output of DescribeObjects.

      struct DescribeObjectsOutput
        include JSON::Serializable

        # An array of object definitions.

        @[JSON::Field(key: "pipelineObjects")]
        getter pipeline_objects : Array(Types::PipelineObject)

        # Indicates whether there are more results to return.

        @[JSON::Field(key: "hasMoreResults")]
        getter has_more_results : Bool?

        # The starting point for the next page of results. To view the next page of results, call
        # DescribeObjects again with this marker value. If the value is null, there are no more results.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @pipeline_objects : Array(Types::PipelineObject),
          @has_more_results : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      # Contains the parameters for DescribePipelines.

      struct DescribePipelinesInput
        include JSON::Serializable

        # The IDs of the pipelines to describe. You can pass as many as 25 identifiers in a single call. To
        # obtain pipeline IDs, call ListPipelines .

        @[JSON::Field(key: "pipelineIds")]
        getter pipeline_ids : Array(String)

        def initialize(
          @pipeline_ids : Array(String)
        )
        end
      end

      # Contains the output of DescribePipelines.

      struct DescribePipelinesOutput
        include JSON::Serializable

        # An array of descriptions for the specified pipelines.

        @[JSON::Field(key: "pipelineDescriptionList")]
        getter pipeline_description_list : Array(Types::PipelineDescription)

        def initialize(
          @pipeline_description_list : Array(Types::PipelineDescription)
        )
        end
      end

      # Contains the parameters for EvaluateExpression.

      struct EvaluateExpressionInput
        include JSON::Serializable

        # The expression to evaluate.

        @[JSON::Field(key: "expression")]
        getter expression : String

        # The ID of the object.

        @[JSON::Field(key: "objectId")]
        getter object_id : String

        # The ID of the pipeline.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        def initialize(
          @expression : String,
          @object_id : String,
          @pipeline_id : String
        )
        end
      end

      # Contains the output of EvaluateExpression.

      struct EvaluateExpressionOutput
        include JSON::Serializable

        # The evaluated expression.

        @[JSON::Field(key: "evaluatedExpression")]
        getter evaluated_expression : String

        def initialize(
          @evaluated_expression : String
        )
        end
      end

      # A key-value pair that describes a property of a pipeline object. The value is specified as either a
      # string value ( StringValue ) or a reference to another object ( RefValue ) but not as both.

      struct Field
        include JSON::Serializable

        # The field identifier.

        @[JSON::Field(key: "key")]
        getter key : String

        # The field value, expressed as the identifier of another object.

        @[JSON::Field(key: "refValue")]
        getter ref_value : String?

        # The field value, expressed as a String.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @key : String,
          @ref_value : String? = nil,
          @string_value : String? = nil
        )
        end
      end

      # Contains the parameters for GetPipelineDefinition.

      struct GetPipelineDefinitionInput
        include JSON::Serializable

        # The ID of the pipeline.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        # The version of the pipeline definition to retrieve. Set this parameter to latest (default) to use
        # the last definition saved to the pipeline or active to use the last definition that was activated.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @pipeline_id : String,
          @version : String? = nil
        )
        end
      end

      # Contains the output of GetPipelineDefinition.

      struct GetPipelineDefinitionOutput
        include JSON::Serializable

        # The parameter objects used in the pipeline definition.

        @[JSON::Field(key: "parameterObjects")]
        getter parameter_objects : Array(Types::ParameterObject)?

        # The parameter values used in the pipeline definition.

        @[JSON::Field(key: "parameterValues")]
        getter parameter_values : Array(Types::ParameterValue)?

        # The objects defined in the pipeline.

        @[JSON::Field(key: "pipelineObjects")]
        getter pipeline_objects : Array(Types::PipelineObject)?

        def initialize(
          @parameter_objects : Array(Types::ParameterObject)? = nil,
          @parameter_values : Array(Types::ParameterValue)? = nil,
          @pipeline_objects : Array(Types::PipelineObject)? = nil
        )
        end
      end

      # Identity information for the EC2 instance that is hosting the task runner. You can get this value by
      # calling a metadata URI from the EC2 instance. For more information, see Instance Metadata in the
      # Amazon Elastic Compute Cloud User Guide. Passing in this value proves that your task runner is
      # running on an EC2 instance, and ensures the proper AWS Data Pipeline service charges are applied to
      # your pipeline.

      struct InstanceIdentity
        include JSON::Serializable

        # A description of an EC2 instance that is generated when the instance is launched and exposed to the
        # instance via the instance metadata service in the form of a JSON representation of an object.

        @[JSON::Field(key: "document")]
        getter document : String?

        # A signature which can be used to verify the accuracy and authenticity of the information provided in
        # the instance identity document.

        @[JSON::Field(key: "signature")]
        getter signature : String?

        def initialize(
          @document : String? = nil,
          @signature : String? = nil
        )
        end
      end

      # An internal service error occurred.

      struct InternalServiceError
        include JSON::Serializable

        # Description of the error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was not valid. Verify that your request was properly formatted, that the signature was
      # generated with the correct credentials, and that you haven't exceeded any of the service limits for
      # your account.

      struct InvalidRequestException
        include JSON::Serializable

        # Description of the error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the parameters for ListPipelines.

      struct ListPipelinesInput
        include JSON::Serializable

        # The starting point for the results to be returned. For the first call, this value should be empty.
        # As long as there are more results, continue to call ListPipelines with the marker value from the
        # previous call to retrieve the next set of results.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @marker : String? = nil
        )
        end
      end

      # Contains the output of ListPipelines.

      struct ListPipelinesOutput
        include JSON::Serializable

        # The pipeline identifiers. If you require additional information about the pipelines, you can use
        # these identifiers to call DescribePipelines and GetPipelineDefinition .

        @[JSON::Field(key: "pipelineIdList")]
        getter pipeline_id_list : Array(Types::PipelineIdName)

        # Indicates whether there are more results that can be obtained by a subsequent call.

        @[JSON::Field(key: "hasMoreResults")]
        getter has_more_results : Bool?

        # The starting point for the next page of results. To view the next page of results, call
        # ListPipelinesOutput again with this marker value. If the value is null, there are no more results.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @pipeline_id_list : Array(Types::PipelineIdName),
          @has_more_results : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      # Contains a logical operation for comparing the value of a field with a specified value.

      struct Operator
        include JSON::Serializable

        # The logical operation to be performed: equal ( EQ ), equal reference ( REF_EQ ), less than or equal
        # ( LE ), greater than or equal ( GE ), or between ( BETWEEN ). Equal reference ( REF_EQ ) can be used
        # only with reference fields. The other comparison types can be used only with String fields. The
        # comparison types you can use apply only to certain object fields, as detailed below. The comparison
        # operators EQ and REF_EQ act on the following fields: name @sphere parent @componentParent
        # @instanceParent @status @scheduledStartTime @scheduledEndTime @actualStartTime @actualEndTime The
        # comparison operators GE , LE , and BETWEEN act on the following fields: @scheduledStartTime
        # @scheduledEndTime @actualStartTime @actualEndTime Note that fields beginning with the at sign (@)
        # are read-only and set by the web service. When you name fields, you should choose names containing
        # only alpha-numeric values, as symbols may be reserved by AWS Data Pipeline. User-defined fields that
        # you add to a pipeline should prefix their name with the string "my".

        @[JSON::Field(key: "type")]
        getter type : String?

        # The value that the actual field value will be compared with.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @type : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The attributes allowed or specified with a parameter object.

      struct ParameterAttribute
        include JSON::Serializable

        # The field identifier.

        @[JSON::Field(key: "key")]
        getter key : String

        # The field value, expressed as a String.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String

        def initialize(
          @key : String,
          @string_value : String
        )
        end
      end

      # Contains information about a parameter object.

      struct ParameterObject
        include JSON::Serializable

        # The attributes of the parameter object.

        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::ParameterAttribute)

        # The ID of the parameter object.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @attributes : Array(Types::ParameterAttribute),
          @id : String
        )
        end
      end

      # A value or list of parameter values.

      struct ParameterValue
        include JSON::Serializable

        # The ID of the parameter value.

        @[JSON::Field(key: "id")]
        getter id : String

        # The field value, expressed as a String.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String

        def initialize(
          @id : String,
          @string_value : String
        )
        end
      end

      # The specified pipeline has been deleted.

      struct PipelineDeletedException
        include JSON::Serializable

        # Description of the error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains pipeline metadata.

      struct PipelineDescription
        include JSON::Serializable

        # A list of read-only fields that contain metadata about the pipeline: @userId, @accountId, and
        # @pipelineState.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::Field)

        # The name of the pipeline.

        @[JSON::Field(key: "name")]
        getter name : String

        # The pipeline identifier that was assigned by AWS Data Pipeline. This is a string of the form
        # df-297EG78HU43EEXAMPLE .

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        # Description of the pipeline.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of tags to associated with a pipeline. Tags let you control access to pipelines. For more
        # information, see Controlling User Access to Pipelines in the AWS Data Pipeline Developer Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @fields : Array(Types::Field),
          @name : String,
          @pipeline_id : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains the name and identifier of a pipeline.

      struct PipelineIdName
        include JSON::Serializable

        # The ID of the pipeline that was assigned by AWS Data Pipeline. This is a string of the form
        # df-297EG78HU43EEXAMPLE .

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the pipeline.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The specified pipeline was not found. Verify that you used the correct user and account identifiers.

      struct PipelineNotFoundException
        include JSON::Serializable

        # Description of the error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about a pipeline object. This can be a logical, physical, or physical attempt
      # pipeline object. The complete set of components of a pipeline defines the pipeline.

      struct PipelineObject
        include JSON::Serializable

        # Key-value pairs that define the properties of the object.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::Field)

        # The ID of the object.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the object.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @fields : Array(Types::Field),
          @id : String,
          @name : String
        )
        end
      end

      # Contains the parameters for PollForTask.

      struct PollForTaskInput
        include JSON::Serializable

        # The type of task the task runner is configured to accept and process. The worker group is set as a
        # field on objects in the pipeline when they are created. You can only specify a single value for
        # workerGroup in the call to PollForTask . There are no wildcard values permitted in workerGroup ; the
        # string must be an exact, case-sensitive, match.

        @[JSON::Field(key: "workerGroup")]
        getter worker_group : String

        # The public DNS name of the calling task runner.

        @[JSON::Field(key: "hostname")]
        getter hostname : String?

        # Identity information for the EC2 instance that is hosting the task runner. You can get this value
        # from the instance using http://169.254.169.254/latest/meta-data/instance-id . For more information,
        # see Instance Metadata in the Amazon Elastic Compute Cloud User Guide. Passing in this value proves
        # that your task runner is running on an EC2 instance, and ensures the proper AWS Data Pipeline
        # service charges are applied to your pipeline.

        @[JSON::Field(key: "instanceIdentity")]
        getter instance_identity : Types::InstanceIdentity?

        def initialize(
          @worker_group : String,
          @hostname : String? = nil,
          @instance_identity : Types::InstanceIdentity? = nil
        )
        end
      end

      # Contains the output of PollForTask.

      struct PollForTaskOutput
        include JSON::Serializable

        # The information needed to complete the task that is being assigned to the task runner. One of the
        # fields returned in this object is taskId , which contains an identifier for the task being assigned.
        # The calling task runner uses taskId in subsequent calls to ReportTaskProgress and SetTaskStatus .

        @[JSON::Field(key: "taskObject")]
        getter task_object : Types::TaskObject?

        def initialize(
          @task_object : Types::TaskObject? = nil
        )
        end
      end

      # Contains the parameters for PutPipelineDefinition.

      struct PutPipelineDefinitionInput
        include JSON::Serializable

        # The ID of the pipeline.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        # The objects that define the pipeline. These objects overwrite the existing pipeline definition.

        @[JSON::Field(key: "pipelineObjects")]
        getter pipeline_objects : Array(Types::PipelineObject)

        # The parameter objects used with the pipeline.

        @[JSON::Field(key: "parameterObjects")]
        getter parameter_objects : Array(Types::ParameterObject)?

        # The parameter values used with the pipeline.

        @[JSON::Field(key: "parameterValues")]
        getter parameter_values : Array(Types::ParameterValue)?

        def initialize(
          @pipeline_id : String,
          @pipeline_objects : Array(Types::PipelineObject),
          @parameter_objects : Array(Types::ParameterObject)? = nil,
          @parameter_values : Array(Types::ParameterValue)? = nil
        )
        end
      end

      # Contains the output of PutPipelineDefinition.

      struct PutPipelineDefinitionOutput
        include JSON::Serializable

        # Indicates whether there were validation errors, and the pipeline definition is stored but cannot be
        # activated until you correct the pipeline and call PutPipelineDefinition to commit the corrected
        # pipeline.

        @[JSON::Field(key: "errored")]
        getter errored : Bool

        # The validation errors that are associated with the objects defined in pipelineObjects .

        @[JSON::Field(key: "validationErrors")]
        getter validation_errors : Array(Types::ValidationError)?

        # The validation warnings that are associated with the objects defined in pipelineObjects .

        @[JSON::Field(key: "validationWarnings")]
        getter validation_warnings : Array(Types::ValidationWarning)?

        def initialize(
          @errored : Bool,
          @validation_errors : Array(Types::ValidationError)? = nil,
          @validation_warnings : Array(Types::ValidationWarning)? = nil
        )
        end
      end

      # Defines the query to run against an object.

      struct Query
        include JSON::Serializable

        # List of selectors that define the query. An object must satisfy all of the selectors to match the
        # query.

        @[JSON::Field(key: "selectors")]
        getter selectors : Array(Types::Selector)?

        def initialize(
          @selectors : Array(Types::Selector)? = nil
        )
        end
      end

      # Contains the parameters for QueryObjects.

      struct QueryObjectsInput
        include JSON::Serializable

        # The ID of the pipeline.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        # Indicates whether the query applies to components or instances. The possible values are: COMPONENT ,
        # INSTANCE , and ATTEMPT .

        @[JSON::Field(key: "sphere")]
        getter sphere : String

        # The maximum number of object names that QueryObjects will return in a single call. The default value
        # is 100.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The starting point for the results to be returned. For the first call, this value should be empty.
        # As long as there are more results, continue to call QueryObjects with the marker value from the
        # previous call to retrieve the next set of results.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The query that defines the objects to be returned. The Query object can contain a maximum of ten
        # selectors. The conditions in the query are limited to top-level String fields in the object. These
        # filters can be applied to components, instances, and attempts.

        @[JSON::Field(key: "query")]
        getter query : Types::Query?

        def initialize(
          @pipeline_id : String,
          @sphere : String,
          @limit : Int32? = nil,
          @marker : String? = nil,
          @query : Types::Query? = nil
        )
        end
      end

      # Contains the output of QueryObjects.

      struct QueryObjectsOutput
        include JSON::Serializable

        # Indicates whether there are more results that can be obtained by a subsequent call.

        @[JSON::Field(key: "hasMoreResults")]
        getter has_more_results : Bool?

        # The identifiers that match the query selectors.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # The starting point for the next page of results. To view the next page of results, call QueryObjects
        # again with this marker value. If the value is null, there are no more results.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @has_more_results : Bool? = nil,
          @ids : Array(String)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Contains the parameters for RemoveTags.

      struct RemoveTagsInput
        include JSON::Serializable

        # The ID of the pipeline.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        # The keys of the tags to remove.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @pipeline_id : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Contains the output of RemoveTags.

      struct RemoveTagsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for ReportTaskProgress.

      struct ReportTaskProgressInput
        include JSON::Serializable

        # The ID of the task assigned to the task runner. This value is provided in the response for
        # PollForTask .

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # Key-value pairs that define the properties of the ReportTaskProgressInput object.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::Field)?

        def initialize(
          @task_id : String,
          @fields : Array(Types::Field)? = nil
        )
        end
      end

      # Contains the output of ReportTaskProgress.

      struct ReportTaskProgressOutput
        include JSON::Serializable

        # If true, the calling task runner should cancel processing of the task. The task runner does not need
        # to call SetTaskStatus for canceled tasks.

        @[JSON::Field(key: "canceled")]
        getter canceled : Bool

        def initialize(
          @canceled : Bool
        )
        end
      end

      # Contains the parameters for ReportTaskRunnerHeartbeat.

      struct ReportTaskRunnerHeartbeatInput
        include JSON::Serializable

        # The ID of the task runner. This value should be unique across your AWS account. In the case of AWS
        # Data Pipeline Task Runner launched on a resource managed by AWS Data Pipeline, the web service
        # provides a unique identifier when it launches the application. If you have written a custom task
        # runner, you should assign a unique identifier for the task runner.

        @[JSON::Field(key: "taskrunnerId")]
        getter taskrunner_id : String

        # The public DNS name of the task runner.

        @[JSON::Field(key: "hostname")]
        getter hostname : String?

        # The type of task the task runner is configured to accept and process. The worker group is set as a
        # field on objects in the pipeline when they are created. You can only specify a single value for
        # workerGroup . There are no wildcard values permitted in workerGroup ; the string must be an exact,
        # case-sensitive, match.

        @[JSON::Field(key: "workerGroup")]
        getter worker_group : String?

        def initialize(
          @taskrunner_id : String,
          @hostname : String? = nil,
          @worker_group : String? = nil
        )
        end
      end

      # Contains the output of ReportTaskRunnerHeartbeat.

      struct ReportTaskRunnerHeartbeatOutput
        include JSON::Serializable

        # Indicates whether the calling task runner should terminate.

        @[JSON::Field(key: "terminate")]
        getter terminate : Bool

        def initialize(
          @terminate : Bool
        )
        end
      end

      # A comparision that is used to determine whether a query should return this object.

      struct Selector
        include JSON::Serializable

        # The name of the field that the operator will be applied to. The field name is the "key" portion of
        # the field definition in the pipeline definition syntax that is used by the AWS Data Pipeline API. If
        # the field is not set on the object, the condition fails.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String?


        @[JSON::Field(key: "operator")]
        getter operator : Types::Operator?

        def initialize(
          @field_name : String? = nil,
          @operator : Types::Operator? = nil
        )
        end
      end

      # Contains the parameters for SetStatus.

      struct SetStatusInput
        include JSON::Serializable

        # The IDs of the objects. The corresponding objects can be either physical or components, but not a
        # mix of both types.

        @[JSON::Field(key: "objectIds")]
        getter object_ids : Array(String)

        # The ID of the pipeline that contains the objects.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        # The status to be set on all the objects specified in objectIds . For components, use PAUSE or RESUME
        # . For instances, use TRY_CANCEL , RERUN , or MARK_FINISHED .

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @object_ids : Array(String),
          @pipeline_id : String,
          @status : String
        )
        end
      end

      # Contains the parameters for SetTaskStatus.

      struct SetTaskStatusInput
        include JSON::Serializable

        # The ID of the task assigned to the task runner. This value is provided in the response for
        # PollForTask .

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # If FINISHED , the task successfully completed. If FAILED , the task ended unsuccessfully.
        # Preconditions use false.

        @[JSON::Field(key: "taskStatus")]
        getter task_status : String

        # If an error occurred during the task, this value specifies the error code. This value is set on the
        # physical attempt object. It is used to display error information to the user. It should not start
        # with string "Service_" which is reserved by the system.

        @[JSON::Field(key: "errorId")]
        getter error_id : String?

        # If an error occurred during the task, this value specifies a text description of the error. This
        # value is set on the physical attempt object. It is used to display error information to the user.
        # The web service does not parse this value.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # If an error occurred during the task, this value specifies the stack trace associated with the
        # error. This value is set on the physical attempt object. It is used to display error information to
        # the user. The web service does not parse this value.

        @[JSON::Field(key: "errorStackTrace")]
        getter error_stack_trace : String?

        def initialize(
          @task_id : String,
          @task_status : String,
          @error_id : String? = nil,
          @error_message : String? = nil,
          @error_stack_trace : String? = nil
        )
        end
      end

      # Contains the output of SetTaskStatus.

      struct SetTaskStatusOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Tags are key/value pairs defined by a user and associated with a pipeline to control access. AWS
      # Data Pipeline allows you to associate ten tags per pipeline. For more information, see Controlling
      # User Access to Pipelines in the AWS Data Pipeline Developer Guide .

      struct Tag
        include JSON::Serializable

        # The key name of a tag defined by a user. For more information, see Controlling User Access to
        # Pipelines in the AWS Data Pipeline Developer Guide .

        @[JSON::Field(key: "key")]
        getter key : String

        # The optional value portion of a tag defined by a user. For more information, see Controlling User
        # Access to Pipelines in the AWS Data Pipeline Developer Guide .

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # The specified task was not found.

      struct TaskNotFoundException
        include JSON::Serializable

        # Description of the error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about a pipeline task that is assigned to a task runner.

      struct TaskObject
        include JSON::Serializable

        # The ID of the pipeline task attempt object. AWS Data Pipeline uses this value to track how many
        # times a task is attempted.

        @[JSON::Field(key: "attemptId")]
        getter attempt_id : String?

        # Connection information for the location where the task runner will publish the output of the task.

        @[JSON::Field(key: "objects")]
        getter objects : Hash(String, Types::PipelineObject)?

        # The ID of the pipeline that provided the task.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String?

        # An internal identifier for the task. This ID is passed to the SetTaskStatus and ReportTaskProgress
        # actions.

        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @attempt_id : String? = nil,
          @objects : Hash(String, Types::PipelineObject)? = nil,
          @pipeline_id : String? = nil,
          @task_id : String? = nil
        )
        end
      end

      # Contains the parameters for ValidatePipelineDefinition.

      struct ValidatePipelineDefinitionInput
        include JSON::Serializable

        # The ID of the pipeline.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        # The objects that define the pipeline changes to validate against the pipeline.

        @[JSON::Field(key: "pipelineObjects")]
        getter pipeline_objects : Array(Types::PipelineObject)

        # The parameter objects used with the pipeline.

        @[JSON::Field(key: "parameterObjects")]
        getter parameter_objects : Array(Types::ParameterObject)?

        # The parameter values used with the pipeline.

        @[JSON::Field(key: "parameterValues")]
        getter parameter_values : Array(Types::ParameterValue)?

        def initialize(
          @pipeline_id : String,
          @pipeline_objects : Array(Types::PipelineObject),
          @parameter_objects : Array(Types::ParameterObject)? = nil,
          @parameter_values : Array(Types::ParameterValue)? = nil
        )
        end
      end

      # Contains the output of ValidatePipelineDefinition.

      struct ValidatePipelineDefinitionOutput
        include JSON::Serializable

        # Indicates whether there were validation errors.

        @[JSON::Field(key: "errored")]
        getter errored : Bool

        # Any validation errors that were found.

        @[JSON::Field(key: "validationErrors")]
        getter validation_errors : Array(Types::ValidationError)?

        # Any validation warnings that were found.

        @[JSON::Field(key: "validationWarnings")]
        getter validation_warnings : Array(Types::ValidationWarning)?

        def initialize(
          @errored : Bool,
          @validation_errors : Array(Types::ValidationError)? = nil,
          @validation_warnings : Array(Types::ValidationWarning)? = nil
        )
        end
      end

      # Defines a validation error. Validation errors prevent pipeline activation. The set of validation
      # errors that can be returned are defined by AWS Data Pipeline.

      struct ValidationError
        include JSON::Serializable

        # A description of the validation error.

        @[JSON::Field(key: "errors")]
        getter errors : Array(String)?

        # The identifier of the object that contains the validation error.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @errors : Array(String)? = nil,
          @id : String? = nil
        )
        end
      end

      # Defines a validation warning. Validation warnings do not prevent pipeline activation. The set of
      # validation warnings that can be returned are defined by AWS Data Pipeline.

      struct ValidationWarning
        include JSON::Serializable

        # The identifier of the object that contains the validation warning.

        @[JSON::Field(key: "id")]
        getter id : String?

        # A description of the validation warning.

        @[JSON::Field(key: "warnings")]
        getter warnings : Array(String)?

        def initialize(
          @id : String? = nil,
          @warnings : Array(String)? = nil
        )
        end
      end
    end
  end
end
