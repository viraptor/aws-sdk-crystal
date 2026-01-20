require "json"
require "time"

module Aws
  module IoTThingsGraph
    module Types


      struct AssociateEntityToThingRequest
        include JSON::Serializable

        # The ID of the device to be associated with the thing. The ID should be in the following format.
        # urn:tdm:REGION/ACCOUNT ID/default:device:DEVICENAME

        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The name of the thing to which the entity is to be associated.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The version of the user's namespace. Defaults to the latest version of the user's namespace.

        @[JSON::Field(key: "namespaceVersion")]
        getter namespace_version : Int64?

        def initialize(
          @entity_id : String,
          @thing_name : String,
          @namespace_version : Int64? = nil
        )
        end
      end


      struct AssociateEntityToThingResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateFlowTemplateRequest
        include JSON::Serializable

        # The workflow DefinitionDocument .

        @[JSON::Field(key: "definition")]
        getter definition : Types::DefinitionDocument

        # The namespace version in which the workflow is to be created. If no value is specified, the latest
        # version is used by default.

        @[JSON::Field(key: "compatibleNamespaceVersion")]
        getter compatible_namespace_version : Int64?

        def initialize(
          @definition : Types::DefinitionDocument,
          @compatible_namespace_version : Int64? = nil
        )
        end
      end


      struct CreateFlowTemplateResponse
        include JSON::Serializable

        # The summary object that describes the created workflow.

        @[JSON::Field(key: "summary")]
        getter summary : Types::FlowTemplateSummary?

        def initialize(
          @summary : Types::FlowTemplateSummary? = nil
        )
        end
      end


      struct CreateSystemInstanceRequest
        include JSON::Serializable


        @[JSON::Field(key: "definition")]
        getter definition : Types::DefinitionDocument

        # The target type of the deployment. Valid values are GREENGRASS and CLOUD .

        @[JSON::Field(key: "target")]
        getter target : String

        # The ARN of the IAM role that AWS IoT Things Graph will assume when it executes the flow. This role
        # must have read and write access to AWS Lambda and AWS IoT and any other AWS services that the flow
        # uses when it executes. This value is required if the value of the target parameter is CLOUD .

        @[JSON::Field(key: "flowActionsRoleArn")]
        getter flow_actions_role_arn : String?

        # The name of the Greengrass group where the system instance will be deployed. This value is required
        # if the value of the target parameter is GREENGRASS .

        @[JSON::Field(key: "greengrassGroupName")]
        getter greengrass_group_name : String?


        @[JSON::Field(key: "metricsConfiguration")]
        getter metrics_configuration : Types::MetricsConfiguration?

        # The name of the Amazon Simple Storage Service bucket that will be used to store and deploy the
        # system instance's resource file. This value is required if the value of the target parameter is
        # GREENGRASS .

        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String?

        # Metadata, consisting of key-value pairs, that can be used to categorize your system instances.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @definition : Types::DefinitionDocument,
          @target : String,
          @flow_actions_role_arn : String? = nil,
          @greengrass_group_name : String? = nil,
          @metrics_configuration : Types::MetricsConfiguration? = nil,
          @s3_bucket_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateSystemInstanceResponse
        include JSON::Serializable

        # The summary object that describes the new system instance.

        @[JSON::Field(key: "summary")]
        getter summary : Types::SystemInstanceSummary?

        def initialize(
          @summary : Types::SystemInstanceSummary? = nil
        )
        end
      end


      struct CreateSystemTemplateRequest
        include JSON::Serializable

        # The DefinitionDocument used to create the system.

        @[JSON::Field(key: "definition")]
        getter definition : Types::DefinitionDocument

        # The namespace version in which the system is to be created. If no value is specified, the latest
        # version is used by default.

        @[JSON::Field(key: "compatibleNamespaceVersion")]
        getter compatible_namespace_version : Int64?

        def initialize(
          @definition : Types::DefinitionDocument,
          @compatible_namespace_version : Int64? = nil
        )
        end
      end


      struct CreateSystemTemplateResponse
        include JSON::Serializable

        # The summary object that describes the created system.

        @[JSON::Field(key: "summary")]
        getter summary : Types::SystemTemplateSummary?

        def initialize(
          @summary : Types::SystemTemplateSummary? = nil
        )
        end
      end

      # A document that defines an entity.

      struct DefinitionDocument
        include JSON::Serializable

        # The language used to define the entity. GRAPHQL is the only valid value.

        @[JSON::Field(key: "language")]
        getter language : String

        # The GraphQL text that defines the entity.

        @[JSON::Field(key: "text")]
        getter text : String

        def initialize(
          @language : String,
          @text : String
        )
        end
      end


      struct DeleteFlowTemplateRequest
        include JSON::Serializable

        # The ID of the workflow to be deleted. The ID should be in the following format.
        # urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteFlowTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteNamespaceRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteNamespaceResponse
        include JSON::Serializable

        # The ARN of the namespace to be deleted.

        @[JSON::Field(key: "namespaceArn")]
        getter namespace_arn : String?

        # The name of the namespace to be deleted.

        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        def initialize(
          @namespace_arn : String? = nil,
          @namespace_name : String? = nil
        )
        end
      end


      struct DeleteSystemInstanceRequest
        include JSON::Serializable

        # The ID of the system instance to be deleted.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct DeleteSystemInstanceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSystemTemplateRequest
        include JSON::Serializable

        # The ID of the system to be deleted. The ID should be in the following format. urn:tdm:REGION/ACCOUNT
        # ID/default:system:SYSTEMNAME

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteSystemTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An object that contains the ID and revision number of a workflow or system that is part of a
      # deployment.

      struct DependencyRevision
        include JSON::Serializable

        # The ID of the workflow or system.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The revision number of the workflow or system.

        @[JSON::Field(key: "revisionNumber")]
        getter revision_number : Int64?

        def initialize(
          @id : String? = nil,
          @revision_number : Int64? = nil
        )
        end
      end


      struct DeploySystemInstanceRequest
        include JSON::Serializable

        # The ID of the system instance. This value is returned by the CreateSystemInstance action. The ID
        # should be in the following format. urn:tdm:REGION/ACCOUNT ID/default:deployment:DEPLOYMENTNAME

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct DeploySystemInstanceResponse
        include JSON::Serializable

        # An object that contains summary information about a system instance that was deployed.

        @[JSON::Field(key: "summary")]
        getter summary : Types::SystemInstanceSummary

        # The ID of the Greengrass deployment used to deploy the system instance.

        @[JSON::Field(key: "greengrassDeploymentId")]
        getter greengrass_deployment_id : String?

        def initialize(
          @summary : Types::SystemInstanceSummary,
          @greengrass_deployment_id : String? = nil
        )
        end
      end


      struct DeprecateFlowTemplateRequest
        include JSON::Serializable

        # The ID of the workflow to be deleted. The ID should be in the following format.
        # urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeprecateFlowTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeprecateSystemTemplateRequest
        include JSON::Serializable

        # The ID of the system to delete. The ID should be in the following format. urn:tdm:REGION/ACCOUNT
        # ID/default:system:SYSTEMNAME

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeprecateSystemTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeNamespaceRequest
        include JSON::Serializable

        # The name of the user's namespace. Set this to aws to get the public namespace.

        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        def initialize(
          @namespace_name : String? = nil
        )
        end
      end


      struct DescribeNamespaceResponse
        include JSON::Serializable

        # The ARN of the namespace.

        @[JSON::Field(key: "namespaceArn")]
        getter namespace_arn : String?

        # The name of the namespace.

        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # The version of the user's namespace to describe.

        @[JSON::Field(key: "namespaceVersion")]
        getter namespace_version : Int64?

        # The name of the public namespace that the latest namespace version is tracking.

        @[JSON::Field(key: "trackingNamespaceName")]
        getter tracking_namespace_name : String?

        # The version of the public namespace that the latest version is tracking.

        @[JSON::Field(key: "trackingNamespaceVersion")]
        getter tracking_namespace_version : Int64?

        def initialize(
          @namespace_arn : String? = nil,
          @namespace_name : String? = nil,
          @namespace_version : Int64? = nil,
          @tracking_namespace_name : String? = nil,
          @tracking_namespace_version : Int64? = nil
        )
        end
      end


      struct DissociateEntityFromThingRequest
        include JSON::Serializable

        # The entity type from which to disassociate the thing.

        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The name of the thing to disassociate.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        def initialize(
          @entity_type : String,
          @thing_name : String
        )
        end
      end


      struct DissociateEntityFromThingResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the properties of an entity.

      struct EntityDescription
        include JSON::Serializable

        # The entity ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time at which the entity was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The definition document of the entity.

        @[JSON::Field(key: "definition")]
        getter definition : Types::DefinitionDocument?

        # The entity ID.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The entity type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @definition : Types::DefinitionDocument? = nil,
          @id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # An object that filters an entity search. Multiple filters function as OR criteria in the search. For
      # example a search that includes a NAMESPACE and a REFERENCED_ENTITY_ID filter searches for entities
      # in the specified namespace that use the entity specified by the value of REFERENCED_ENTITY_ID .

      struct EntityFilter
        include JSON::Serializable

        # The name of the entity search filter field. REFERENCED_ENTITY_ID filters on entities that are used
        # by the entity in the result set. For example, you can filter on the ID of a property that is used in
        # a state.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of string values for the search filter field. Multiple values function as AND criteria in
        # the search.

        @[JSON::Field(key: "value")]
        getter value : Array(String)?

        def initialize(
          @name : String? = nil,
          @value : Array(String)? = nil
        )
        end
      end

      # An object that contains information about a flow event.

      struct FlowExecutionMessage
        include JSON::Serializable

        # The type of flow event .

        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        # The unique identifier of the message.

        @[JSON::Field(key: "messageId")]
        getter message_id : String?

        # A string containing information about the flow event.

        @[JSON::Field(key: "payload")]
        getter payload : String?

        # The date and time when the message was last updated.

        @[JSON::Field(key: "timestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        def initialize(
          @event_type : String? = nil,
          @message_id : String? = nil,
          @payload : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # An object that contains summary information about a flow execution.

      struct FlowExecutionSummary
        include JSON::Serializable

        # The date and time when the flow execution summary was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The ID of the flow execution.

        @[JSON::Field(key: "flowExecutionId")]
        getter flow_execution_id : String?

        # The ID of the flow.

        @[JSON::Field(key: "flowTemplateId")]
        getter flow_template_id : String?

        # The current status of the flow execution.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the system instance that contains the flow.

        @[JSON::Field(key: "systemInstanceId")]
        getter system_instance_id : String?

        # The date and time when the flow execution summary was last updated.

        @[JSON::Field(key: "updatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @flow_execution_id : String? = nil,
          @flow_template_id : String? = nil,
          @status : String? = nil,
          @system_instance_id : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # An object that contains a workflow's definition and summary information.

      struct FlowTemplateDescription
        include JSON::Serializable

        # A workflow's definition document.

        @[JSON::Field(key: "definition")]
        getter definition : Types::DefinitionDocument?

        # An object that contains summary information about a workflow.

        @[JSON::Field(key: "summary")]
        getter summary : Types::FlowTemplateSummary?

        # The version of the user's namespace against which the workflow was validated. Use this value in your
        # system instance.

        @[JSON::Field(key: "validatedNamespaceVersion")]
        getter validated_namespace_version : Int64?

        def initialize(
          @definition : Types::DefinitionDocument? = nil,
          @summary : Types::FlowTemplateSummary? = nil,
          @validated_namespace_version : Int64? = nil
        )
        end
      end

      # An object that filters a workflow search.

      struct FlowTemplateFilter
        include JSON::Serializable

        # The name of the search filter field.

        @[JSON::Field(key: "name")]
        getter name : String

        # An array of string values for the search filter field. Multiple values function as AND criteria in
        # the search.

        @[JSON::Field(key: "value")]
        getter value : Array(String)

        def initialize(
          @name : String,
          @value : Array(String)
        )
        end
      end

      # An object that contains summary information about a workflow.

      struct FlowTemplateSummary
        include JSON::Serializable

        # The ARN of the workflow.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date when the workflow was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The ID of the workflow.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The revision number of the workflow.

        @[JSON::Field(key: "revisionNumber")]
        getter revision_number : Int64?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @revision_number : Int64? = nil
        )
        end
      end


      struct GetEntitiesRequest
        include JSON::Serializable

        # An array of entity IDs. The IDs should be in the following format. urn:tdm:REGION/ACCOUNT
        # ID/default:device:DEVICENAME

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)

        # The version of the user's namespace. Defaults to the latest version of the user's namespace.

        @[JSON::Field(key: "namespaceVersion")]
        getter namespace_version : Int64?

        def initialize(
          @ids : Array(String),
          @namespace_version : Int64? = nil
        )
        end
      end


      struct GetEntitiesResponse
        include JSON::Serializable

        # An array of descriptions for the specified entities.

        @[JSON::Field(key: "descriptions")]
        getter descriptions : Array(Types::EntityDescription)?

        def initialize(
          @descriptions : Array(Types::EntityDescription)? = nil
        )
        end
      end


      struct GetFlowTemplateRequest
        include JSON::Serializable

        # The ID of the workflow. The ID should be in the following format. urn:tdm:REGION/ACCOUNT
        # ID/default:workflow:WORKFLOWNAME

        @[JSON::Field(key: "id")]
        getter id : String

        # The number of the workflow revision to retrieve.

        @[JSON::Field(key: "revisionNumber")]
        getter revision_number : Int64?

        def initialize(
          @id : String,
          @revision_number : Int64? = nil
        )
        end
      end


      struct GetFlowTemplateResponse
        include JSON::Serializable

        # The object that describes the specified workflow.

        @[JSON::Field(key: "description")]
        getter description : Types::FlowTemplateDescription?

        def initialize(
          @description : Types::FlowTemplateDescription? = nil
        )
        end
      end


      struct GetFlowTemplateRevisionsRequest
        include JSON::Serializable

        # The ID of the workflow. The ID should be in the following format. urn:tdm:REGION/ACCOUNT
        # ID/default:workflow:WORKFLOWNAME

        @[JSON::Field(key: "id")]
        getter id : String

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results. Use this when you're paginating results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetFlowTemplateRevisionsResponse
        include JSON::Serializable

        # The string to specify as nextToken when you request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that provide summary data about each revision.

        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::FlowTemplateSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::FlowTemplateSummary)? = nil
        )
        end
      end


      struct GetNamespaceDeletionStatusRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetNamespaceDeletionStatusResponse
        include JSON::Serializable

        # An error code returned by the namespace deletion task.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # An error code returned by the namespace deletion task.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The ARN of the namespace that is being deleted.

        @[JSON::Field(key: "namespaceArn")]
        getter namespace_arn : String?

        # The name of the namespace that is being deleted.

        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # The status of the deletion request.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @namespace_arn : String? = nil,
          @namespace_name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetSystemInstanceRequest
        include JSON::Serializable

        # The ID of the system deployment instance. This value is returned by CreateSystemInstance . The ID
        # should be in the following format. urn:tdm:REGION/ACCOUNT ID/default:deployment:DEPLOYMENTNAME

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetSystemInstanceResponse
        include JSON::Serializable

        # An object that describes the system instance.

        @[JSON::Field(key: "description")]
        getter description : Types::SystemInstanceDescription?

        def initialize(
          @description : Types::SystemInstanceDescription? = nil
        )
        end
      end


      struct GetSystemTemplateRequest
        include JSON::Serializable

        # The ID of the system to get. This ID must be in the user's namespace. The ID should be in the
        # following format. urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME

        @[JSON::Field(key: "id")]
        getter id : String

        # The number that specifies the revision of the system to get.

        @[JSON::Field(key: "revisionNumber")]
        getter revision_number : Int64?

        def initialize(
          @id : String,
          @revision_number : Int64? = nil
        )
        end
      end


      struct GetSystemTemplateResponse
        include JSON::Serializable

        # An object that contains summary data about the system.

        @[JSON::Field(key: "description")]
        getter description : Types::SystemTemplateDescription?

        def initialize(
          @description : Types::SystemTemplateDescription? = nil
        )
        end
      end


      struct GetSystemTemplateRevisionsRequest
        include JSON::Serializable

        # The ID of the system template. The ID should be in the following format. urn:tdm:REGION/ACCOUNT
        # ID/default:system:SYSTEMNAME

        @[JSON::Field(key: "id")]
        getter id : String

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results. Use this when you're paginating results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetSystemTemplateRevisionsResponse
        include JSON::Serializable

        # The string to specify as nextToken when you request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain summary data about the system template revisions.

        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::SystemTemplateSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::SystemTemplateSummary)? = nil
        )
        end
      end


      struct GetUploadStatusRequest
        include JSON::Serializable

        # The ID of the upload. This value is returned by the UploadEntityDefinitions action.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        def initialize(
          @upload_id : String
        )
        end
      end


      struct GetUploadStatusResponse
        include JSON::Serializable

        # The date at which the upload was created.

        @[JSON::Field(key: "createdDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The ID of the upload.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The status of the upload. The initial status is IN_PROGRESS . The response show all validation
        # failures if the upload fails.

        @[JSON::Field(key: "uploadStatus")]
        getter upload_status : String

        # The reason for an upload failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : Array(String)?

        # The ARN of the upload.

        @[JSON::Field(key: "namespaceArn")]
        getter namespace_arn : String?

        # The name of the upload's namespace.

        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String?

        # The version of the user's namespace. Defaults to the latest version of the user's namespace.

        @[JSON::Field(key: "namespaceVersion")]
        getter namespace_version : Int64?

        def initialize(
          @created_date : Time,
          @upload_id : String,
          @upload_status : String,
          @failure_reason : Array(String)? = nil,
          @namespace_arn : String? = nil,
          @namespace_name : String? = nil,
          @namespace_version : Int64? = nil
        )
        end
      end


      struct InternalFailureException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListFlowExecutionMessagesRequest
        include JSON::Serializable

        # The ID of the flow execution.

        @[JSON::Field(key: "flowExecutionId")]
        getter flow_execution_id : String

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results. Use this when you're paginating results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flow_execution_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFlowExecutionMessagesResponse
        include JSON::Serializable

        # A list of objects that contain information about events in the specified flow execution.

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::FlowExecutionMessage)?

        # The string to specify as nextToken when you request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @messages : Array(Types::FlowExecutionMessage)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource whose tags are to be returned.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The maximum number of tags to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that specifies the next page of results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The token that specifies the next page of results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List of tags returned by the ListTagsForResource operation.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # An object that specifies whether cloud metrics are collected in a deployment and, if so, what role
      # is used to collect metrics.

      struct MetricsConfiguration
        include JSON::Serializable

        # A Boolean that specifies whether cloud metrics are collected.

        @[JSON::Field(key: "cloudMetricEnabled")]
        getter cloud_metric_enabled : Bool?

        # The ARN of the role that is used to collect cloud metrics.

        @[JSON::Field(key: "metricRuleRoleArn")]
        getter metric_rule_role_arn : String?

        def initialize(
          @cloud_metric_enabled : Bool? = nil,
          @metric_rule_role_arn : String? = nil
        )
        end
      end


      struct ResourceAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct SearchEntitiesRequest
        include JSON::Serializable

        # The entity types for which to search.

        @[JSON::Field(key: "entityTypes")]
        getter entity_types : Array(String)

        # Optional filter to apply to the search. Valid filters are NAME NAMESPACE , SEMANTIC_TYPE_PATH and
        # REFERENCED_ENTITY_ID . REFERENCED_ENTITY_ID filters on entities that are used by the entity in the
        # result set. For example, you can filter on the ID of a property that is used in a state. Multiple
        # filters function as OR criteria in the query. Multiple values passed inside the filter function as
        # AND criteria.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::EntityFilter)?

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The version of the user's namespace. Defaults to the latest version of the user's namespace.

        @[JSON::Field(key: "namespaceVersion")]
        getter namespace_version : Int64?

        # The string that specifies the next page of results. Use this when you're paginating results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entity_types : Array(String),
          @filters : Array(Types::EntityFilter)? = nil,
          @max_results : Int32? = nil,
          @namespace_version : Int64? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchEntitiesResponse
        include JSON::Serializable

        # An array of descriptions for each entity returned in the search result.

        @[JSON::Field(key: "descriptions")]
        getter descriptions : Array(Types::EntityDescription)?

        # The string to specify as nextToken when you request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @descriptions : Array(Types::EntityDescription)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchFlowExecutionsRequest
        include JSON::Serializable

        # The ID of the system instance that contains the flow.

        @[JSON::Field(key: "systemInstanceId")]
        getter system_instance_id : String

        # The date and time of the latest flow execution to return.

        @[JSON::Field(key: "endTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The ID of a flow execution.

        @[JSON::Field(key: "flowExecutionId")]
        getter flow_execution_id : String?

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results. Use this when you're paginating results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The date and time of the earliest flow execution to return.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @system_instance_id : String,
          @end_time : Time? = nil,
          @flow_execution_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct SearchFlowExecutionsResponse
        include JSON::Serializable

        # The string to specify as nextToken when you request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain summary information about each workflow execution in the result
        # set.

        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::FlowExecutionSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::FlowExecutionSummary)? = nil
        )
        end
      end


      struct SearchFlowTemplatesRequest
        include JSON::Serializable

        # An array of objects that limit the result set. The only valid filter is DEVICE_MODEL_ID .

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::FlowTemplateFilter)?

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results. Use this when you're paginating results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::FlowTemplateFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchFlowTemplatesResponse
        include JSON::Serializable

        # The string to specify as nextToken when you request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain summary information about each workflow in the result set.

        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::FlowTemplateSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::FlowTemplateSummary)? = nil
        )
        end
      end


      struct SearchSystemInstancesRequest
        include JSON::Serializable

        # Optional filter to apply to the search. Valid filters are SYSTEM_TEMPLATE_ID , STATUS , and
        # GREENGRASS_GROUP_NAME . Multiple filters function as OR criteria in the query. Multiple values
        # passed inside the filter function as AND criteria.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SystemInstanceFilter)?

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results. Use this when you're paginating results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::SystemInstanceFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchSystemInstancesResponse
        include JSON::Serializable

        # The string to specify as nextToken when you request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain summary data abour the system instances in the result set.

        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::SystemInstanceSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::SystemInstanceSummary)? = nil
        )
        end
      end


      struct SearchSystemTemplatesRequest
        include JSON::Serializable

        # An array of filters that limit the result set. The only valid filter is FLOW_TEMPLATE_ID .

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SystemTemplateFilter)?

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The string that specifies the next page of results. Use this when you're paginating results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::SystemTemplateFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchSystemTemplatesResponse
        include JSON::Serializable

        # The string to specify as nextToken when you request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that contain summary information about each system deployment in the result set.

        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::SystemTemplateSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::SystemTemplateSummary)? = nil
        )
        end
      end


      struct SearchThingsRequest
        include JSON::Serializable

        # The ID of the entity to which the things are associated. The IDs should be in the following format.
        # urn:tdm:REGION/ACCOUNT ID/default:device:DEVICENAME

        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The version of the user's namespace. Defaults to the latest version of the user's namespace.

        @[JSON::Field(key: "namespaceVersion")]
        getter namespace_version : Int64?

        # The string that specifies the next page of results. Use this when you're paginating results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entity_id : String,
          @max_results : Int32? = nil,
          @namespace_version : Int64? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchThingsResponse
        include JSON::Serializable

        # The string to specify as nextToken when you request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of things in the result set.

        @[JSON::Field(key: "things")]
        getter things : Array(Types::Thing)?

        def initialize(
          @next_token : String? = nil,
          @things : Array(Types::Thing)? = nil
        )
        end
      end

      # An object that contains a system instance definition and summary information.

      struct SystemInstanceDescription
        include JSON::Serializable


        @[JSON::Field(key: "definition")]
        getter definition : Types::DefinitionDocument?

        # The AWS Identity and Access Management (IAM) role that AWS IoT Things Graph assumes during flow
        # execution in a cloud deployment. This role must have read and write permissionss to AWS Lambda and
        # AWS IoT and to any other AWS services that the flow uses.

        @[JSON::Field(key: "flowActionsRoleArn")]
        getter flow_actions_role_arn : String?


        @[JSON::Field(key: "metricsConfiguration")]
        getter metrics_configuration : Types::MetricsConfiguration?

        # The Amazon Simple Storage Service bucket where information about a system instance is stored.

        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String?

        # An object that contains summary information about a system instance.

        @[JSON::Field(key: "summary")]
        getter summary : Types::SystemInstanceSummary?

        # A list of objects that contain all of the IDs and revision numbers of workflows and systems that are
        # used in a system instance.

        @[JSON::Field(key: "validatedDependencyRevisions")]
        getter validated_dependency_revisions : Array(Types::DependencyRevision)?

        # The version of the user's namespace against which the system instance was validated.

        @[JSON::Field(key: "validatedNamespaceVersion")]
        getter validated_namespace_version : Int64?

        def initialize(
          @definition : Types::DefinitionDocument? = nil,
          @flow_actions_role_arn : String? = nil,
          @metrics_configuration : Types::MetricsConfiguration? = nil,
          @s3_bucket_name : String? = nil,
          @summary : Types::SystemInstanceSummary? = nil,
          @validated_dependency_revisions : Array(Types::DependencyRevision)? = nil,
          @validated_namespace_version : Int64? = nil
        )
        end
      end

      # An object that filters a system instance search. Multiple filters function as OR criteria in the
      # search. For example a search that includes a GREENGRASS_GROUP_NAME and a STATUS filter searches for
      # system instances in the specified Greengrass group that have the specified status.

      struct SystemInstanceFilter
        include JSON::Serializable

        # The name of the search filter field.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of string values for the search filter field. Multiple values function as AND criteria in
        # the search.

        @[JSON::Field(key: "value")]
        getter value : Array(String)?

        def initialize(
          @name : String? = nil,
          @value : Array(String)? = nil
        )
        end
      end

      # An object that contains summary information about a system instance.

      struct SystemInstanceSummary
        include JSON::Serializable

        # The ARN of the system instance.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date when the system instance was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The ID of the Greengrass group where the system instance is deployed.

        @[JSON::Field(key: "greengrassGroupId")]
        getter greengrass_group_id : String?

        # The ID of the Greengrass group where the system instance is deployed.

        @[JSON::Field(key: "greengrassGroupName")]
        getter greengrass_group_name : String?

        # The version of the Greengrass group where the system instance is deployed.

        @[JSON::Field(key: "greengrassGroupVersionId")]
        getter greengrass_group_version_id : String?

        # The ID of the system instance.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the system instance.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The target of the system instance.

        @[JSON::Field(key: "target")]
        getter target : String?

        # The date and time when the system instance was last updated.

        @[JSON::Field(key: "updatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @greengrass_group_id : String? = nil,
          @greengrass_group_name : String? = nil,
          @greengrass_group_version_id : String? = nil,
          @id : String? = nil,
          @status : String? = nil,
          @target : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # An object that contains a system's definition document and summary information.

      struct SystemTemplateDescription
        include JSON::Serializable

        # The definition document of a system.

        @[JSON::Field(key: "definition")]
        getter definition : Types::DefinitionDocument?

        # An object that contains summary information about a system.

        @[JSON::Field(key: "summary")]
        getter summary : Types::SystemTemplateSummary?

        # The namespace version against which the system was validated. Use this value in your system
        # instance.

        @[JSON::Field(key: "validatedNamespaceVersion")]
        getter validated_namespace_version : Int64?

        def initialize(
          @definition : Types::DefinitionDocument? = nil,
          @summary : Types::SystemTemplateSummary? = nil,
          @validated_namespace_version : Int64? = nil
        )
        end
      end

      # An object that filters a system search.

      struct SystemTemplateFilter
        include JSON::Serializable

        # The name of the system search filter field.

        @[JSON::Field(key: "name")]
        getter name : String

        # An array of string values for the search filter field. Multiple values function as AND criteria in
        # the search.

        @[JSON::Field(key: "value")]
        getter value : Array(String)

        def initialize(
          @name : String,
          @value : Array(String)
        )
        end
      end

      # An object that contains information about a system.

      struct SystemTemplateSummary
        include JSON::Serializable

        # The ARN of the system.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date when the system was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The ID of the system.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The revision number of the system.

        @[JSON::Field(key: "revisionNumber")]
        getter revision_number : Int64?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @revision_number : Int64? = nil
        )
        end
      end

      # Metadata assigned to an AWS IoT Things Graph resource consisting of a key-value pair.

      struct Tag
        include JSON::Serializable

        # The required name of the tag. The string value can be from 1 to 128 Unicode characters in length.

        @[JSON::Field(key: "key")]
        getter key : String

        # The optional value of the tag. The string value can be from 1 to 256 Unicode characters in length.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource whose tags are returned.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tags to add to the resource.&gt;

        @[JSON::Field(key: "tags")]
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

      # An AWS IoT thing.

      struct Thing
        include JSON::Serializable

        # The ARN of the thing.

        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        # The name of the thing.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @thing_arn : String? = nil,
          @thing_name : String? = nil
        )
        end
      end


      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UndeploySystemInstanceRequest
        include JSON::Serializable

        # The ID of the system instance to remove from its target.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct UndeploySystemInstanceResponse
        include JSON::Serializable

        # An object that contains summary information about the system instance that was removed from its
        # target.

        @[JSON::Field(key: "summary")]
        getter summary : Types::SystemInstanceSummary?

        def initialize(
          @summary : Types::SystemInstanceSummary? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource whose tags are to be removed.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tag key names to remove from the resource. You don't specify the value. Both the key and
        # its associated value are removed. This parameter to the API requires a JSON text string argument.
        # For information on how to format a JSON parameter for the various command line tool environments,
        # see Using JSON for Parameters in the AWS CLI User Guide .

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


      struct UpdateFlowTemplateRequest
        include JSON::Serializable

        # The DefinitionDocument that contains the updated workflow definition.

        @[JSON::Field(key: "definition")]
        getter definition : Types::DefinitionDocument

        # The ID of the workflow to be updated. The ID should be in the following format.
        # urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME

        @[JSON::Field(key: "id")]
        getter id : String

        # The version of the user's namespace. If no value is specified, the latest version is used by
        # default. Use the GetFlowTemplateRevisions if you want to find earlier revisions of the flow to
        # update.

        @[JSON::Field(key: "compatibleNamespaceVersion")]
        getter compatible_namespace_version : Int64?

        def initialize(
          @definition : Types::DefinitionDocument,
          @id : String,
          @compatible_namespace_version : Int64? = nil
        )
        end
      end


      struct UpdateFlowTemplateResponse
        include JSON::Serializable

        # An object containing summary information about the updated workflow.

        @[JSON::Field(key: "summary")]
        getter summary : Types::FlowTemplateSummary?

        def initialize(
          @summary : Types::FlowTemplateSummary? = nil
        )
        end
      end


      struct UpdateSystemTemplateRequest
        include JSON::Serializable

        # The DefinitionDocument that contains the updated system definition.

        @[JSON::Field(key: "definition")]
        getter definition : Types::DefinitionDocument

        # The ID of the system to be updated. The ID should be in the following format. urn:tdm:REGION/ACCOUNT
        # ID/default:system:SYSTEMNAME

        @[JSON::Field(key: "id")]
        getter id : String

        # The version of the user's namespace. Defaults to the latest version of the user's namespace. If no
        # value is specified, the latest version is used by default.

        @[JSON::Field(key: "compatibleNamespaceVersion")]
        getter compatible_namespace_version : Int64?

        def initialize(
          @definition : Types::DefinitionDocument,
          @id : String,
          @compatible_namespace_version : Int64? = nil
        )
        end
      end


      struct UpdateSystemTemplateResponse
        include JSON::Serializable

        # An object containing summary information about the updated system.

        @[JSON::Field(key: "summary")]
        getter summary : Types::SystemTemplateSummary?

        def initialize(
          @summary : Types::SystemTemplateSummary? = nil
        )
        end
      end


      struct UploadEntityDefinitionsRequest
        include JSON::Serializable

        # A Boolean that specifies whether to deprecate all entities in the latest version before uploading
        # the new DefinitionDocument . If set to true , the upload will create a new namespace version.

        @[JSON::Field(key: "deprecateExistingEntities")]
        getter deprecate_existing_entities : Bool?

        # The DefinitionDocument that defines the updated entities.

        @[JSON::Field(key: "document")]
        getter document : Types::DefinitionDocument?

        # A Boolean that specifies whether to synchronize with the latest version of the public namespace. If
        # set to true , the upload will create a new namespace version.

        @[JSON::Field(key: "syncWithPublicNamespace")]
        getter sync_with_public_namespace : Bool?

        def initialize(
          @deprecate_existing_entities : Bool? = nil,
          @document : Types::DefinitionDocument? = nil,
          @sync_with_public_namespace : Bool? = nil
        )
        end
      end


      struct UploadEntityDefinitionsResponse
        include JSON::Serializable

        # The ID that specifies the upload action. You can use this to track the status of the upload.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        def initialize(
          @upload_id : String
        )
        end
      end
    end
  end
end
