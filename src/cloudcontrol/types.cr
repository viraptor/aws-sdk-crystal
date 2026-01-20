require "json"
require "time"

module Aws
  module CloudControl
    module Types

      # The resource with the name requested already exists.

      struct AlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CancelResourceRequestInput
        include JSON::Serializable

        # The RequestToken of the ProgressEvent object returned by the resource operation request.

        @[JSON::Field(key: "RequestToken")]
        getter request_token : String

        def initialize(
          @request_token : String
        )
        end
      end


      struct CancelResourceRequestOutput
        include JSON::Serializable


        @[JSON::Field(key: "ProgressEvent")]
        getter progress_event : Types::ProgressEvent?

        def initialize(
          @progress_event : Types::ProgressEvent? = nil
        )
        end
      end

      # The specified client token has already been used in another resource request. It's best practice for
      # client tokens to be unique for each resource operation request. However, client token expire after
      # 36 hours.

      struct ClientTokenConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource is currently being modified by another operation.

      struct ConcurrentModificationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Another resource operation is currently being performed on this resource.

      struct ConcurrentOperationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateResourceInput
        include JSON::Serializable

        # Structured data format representing the desired state of the resource, consisting of that resource's
        # properties and their desired values. Cloud Control API currently supports JSON as a structured data
        # format. Specify the desired state as one of the following: A JSON blob A local path containing the
        # desired state in JSON data format For more information, see Composing the desired state of the
        # resource in the Amazon Web Services Cloud Control API User Guide . For more information about the
        # properties of a specific resource, refer to the related topic for the resource in the Resource and
        # property types reference in the CloudFormation Users Guide .

        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String

        # The name of the resource type.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        # A unique identifier to ensure the idempotency of the resource request. As a best practice, specify
        # this token to ensure idempotency, so that Amazon Web Services Cloud Control API can accurately
        # distinguish between request retries and new resource requests. You might retry a resource request to
        # ensure that it was successfully received. A client token is valid for 36 hours once used. After
        # that, a resource request with the same client token is treated as a new request. If you do not
        # specify a client token, one is generated for inclusion in the request. For more information, see
        # Ensuring resource operation requests are unique in the Amazon Web Services Cloud Control API User
        # Guide .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role for Cloud Control
        # API to use when performing this resource operation. The role specified must have the permissions
        # required for this operation. The necessary permissions for each event handler are defined in the
        # handlers section of the resource type definition schema . If you do not specify a role, Cloud
        # Control API uses a temporary session created using your Amazon Web Services user credentials. For
        # more information, see Specifying credentials in the Amazon Web Services Cloud Control API User Guide
        # .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # For private resource types, the type version to use in this resource operation. If you do not
        # specify a resource version, CloudFormation uses the default version.

        @[JSON::Field(key: "TypeVersionId")]
        getter type_version_id : String?

        def initialize(
          @desired_state : String,
          @type_name : String,
          @client_token : String? = nil,
          @role_arn : String? = nil,
          @type_version_id : String? = nil
        )
        end
      end


      struct CreateResourceOutput
        include JSON::Serializable

        # Represents the current status of the resource creation request. After you have initiated a resource
        # creation request, you can monitor the progress of your request by calling GetResourceRequestStatus
        # using the RequestToken of the ProgressEvent returned by CreateResource .

        @[JSON::Field(key: "ProgressEvent")]
        getter progress_event : Types::ProgressEvent?

        def initialize(
          @progress_event : Types::ProgressEvent? = nil
        )
        end
      end


      struct DeleteResourceInput
        include JSON::Serializable

        # The identifier for the resource. You can specify the primary identifier, or any secondary identifier
        # defined for the resource type in its resource schema. You can only specify one identifier. Primary
        # identifiers can be specified as a string or JSON; secondary identifiers must be specified as JSON.
        # For compound primary identifiers (that is, one that consists of multiple resource properties strung
        # together), to specify the primary identifier as a string, list the property values in the order they
        # are specified in the primary identifier definition, separated by | . For more information, see
        # Identifying resources in the Amazon Web Services Cloud Control API User Guide .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The name of the resource type.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        # A unique identifier to ensure the idempotency of the resource request. As a best practice, specify
        # this token to ensure idempotency, so that Amazon Web Services Cloud Control API can accurately
        # distinguish between request retries and new resource requests. You might retry a resource request to
        # ensure that it was successfully received. A client token is valid for 36 hours once used. After
        # that, a resource request with the same client token is treated as a new request. If you do not
        # specify a client token, one is generated for inclusion in the request. For more information, see
        # Ensuring resource operation requests are unique in the Amazon Web Services Cloud Control API User
        # Guide .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role for Cloud Control
        # API to use when performing this resource operation. The role specified must have the permissions
        # required for this operation. The necessary permissions for each event handler are defined in the
        # handlers section of the resource type definition schema . If you do not specify a role, Cloud
        # Control API uses a temporary session created using your Amazon Web Services user credentials. For
        # more information, see Specifying credentials in the Amazon Web Services Cloud Control API User Guide
        # .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # For private resource types, the type version to use in this resource operation. If you do not
        # specify a resource version, CloudFormation uses the default version.

        @[JSON::Field(key: "TypeVersionId")]
        getter type_version_id : String?

        def initialize(
          @identifier : String,
          @type_name : String,
          @client_token : String? = nil,
          @role_arn : String? = nil,
          @type_version_id : String? = nil
        )
        end
      end


      struct DeleteResourceOutput
        include JSON::Serializable

        # Represents the current status of the resource deletion request. After you have initiated a resource
        # deletion request, you can monitor the progress of your request by calling GetResourceRequestStatus
        # using the RequestToken of the ProgressEvent returned by DeleteResource .

        @[JSON::Field(key: "ProgressEvent")]
        getter progress_event : Types::ProgressEvent?

        def initialize(
          @progress_event : Types::ProgressEvent? = nil
        )
        end
      end

      # The resource handler has returned that the downstream service generated an error that doesn't map to
      # any other handler error code.

      struct GeneralServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetResourceInput
        include JSON::Serializable

        # The identifier for the resource. You can specify the primary identifier, or any secondary identifier
        # defined for the resource type in its resource schema. You can only specify one identifier. Primary
        # identifiers can be specified as a string or JSON; secondary identifiers must be specified as JSON.
        # For compound primary identifiers (that is, one that consists of multiple resource properties strung
        # together), to specify the primary identifier as a string, list the property values in the order they
        # are specified in the primary identifier definition, separated by | . For more information, see
        # Identifying resources in the Amazon Web Services Cloud Control API User Guide .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The name of the resource type.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role for Cloud Control
        # API to use when performing this resource operation. The role specified must have the permissions
        # required for this operation. The necessary permissions for each event handler are defined in the
        # handlers section of the resource type definition schema . If you do not specify a role, Cloud
        # Control API uses a temporary session created using your Amazon Web Services user credentials. For
        # more information, see Specifying credentials in the Amazon Web Services Cloud Control API User Guide
        # .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # For private resource types, the type version to use in this resource operation. If you do not
        # specify a resource version, CloudFormation uses the default version.

        @[JSON::Field(key: "TypeVersionId")]
        getter type_version_id : String?

        def initialize(
          @identifier : String,
          @type_name : String,
          @role_arn : String? = nil,
          @type_version_id : String? = nil
        )
        end
      end


      struct GetResourceOutput
        include JSON::Serializable


        @[JSON::Field(key: "ResourceDescription")]
        getter resource_description : Types::ResourceDescription?

        # The name of the resource type.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @resource_description : Types::ResourceDescription? = nil,
          @type_name : String? = nil
        )
        end
      end


      struct GetResourceRequestStatusInput
        include JSON::Serializable

        # A unique token used to track the progress of the resource operation request. Request tokens are
        # included in the ProgressEvent type returned by a resource operation request.

        @[JSON::Field(key: "RequestToken")]
        getter request_token : String

        def initialize(
          @request_token : String
        )
        end
      end


      struct GetResourceRequestStatusOutput
        include JSON::Serializable

        # Lists Hook invocations for the specified target in the request. This is a list since the same target
        # can invoke multiple Hooks.

        @[JSON::Field(key: "HooksProgressEvent")]
        getter hooks_progress_event : Array(Types::HookProgressEvent)?

        # Represents the current status of the resource operation request.

        @[JSON::Field(key: "ProgressEvent")]
        getter progress_event : Types::ProgressEvent?

        def initialize(
          @hooks_progress_event : Array(Types::HookProgressEvent)? = nil,
          @progress_event : Types::ProgressEvent? = nil
        )
        end
      end

      # The resource handler has failed without a returning a more specific error code. This can include
      # timeouts.

      struct HandlerFailureException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource handler has returned that an unexpected error occurred within the resource handler.

      struct HandlerInternalFailureException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the current status of applicable Hooks for a resource operation request. It contains list
      # of Hook invocation information for the resource specified in the request since the same target can
      # invoke multiple Hooks. For more information, see Managing resource operation requests with Amazon
      # Web Services Cloud Control API .

      struct HookProgressEvent
        include JSON::Serializable

        # The failure mode of the invocation. The following are the potential statuses: FAIL : This will fail
        # the Hook invocation and the request associated with it. WARN : This will fail the Hook invocation,
        # but not the request associated with it.

        @[JSON::Field(key: "FailureMode")]
        getter failure_mode : String?

        # The time that the Hook invocation request initiated.

        @[JSON::Field(key: "HookEventTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter hook_event_time : Time?

        # The status of the Hook invocation. The following are potential statuses: HOOK_PENDING : The Hook was
        # added to the invocation plan, but not yet invoked. HOOK_IN_PROGRESS : The Hook was invoked, but
        # hasn't completed. HOOK_COMPLETE_SUCCEEDED : The Hook invocation is complete with a successful
        # result. HOOK_COMPLETE_FAILED : The Hook invocation is complete with a failed result. HOOK_FAILED :
        # The Hook invocation didn't complete successfully.

        @[JSON::Field(key: "HookStatus")]
        getter hook_status : String?

        # The message explaining the current Hook status.

        @[JSON::Field(key: "HookStatusMessage")]
        getter hook_status_message : String?

        # The ARN of the Hook being invoked.

        @[JSON::Field(key: "HookTypeArn")]
        getter hook_type_arn : String?

        # The type name of the Hook being invoked.

        @[JSON::Field(key: "HookTypeName")]
        getter hook_type_name : String?

        # The type version of the Hook being invoked.

        @[JSON::Field(key: "HookTypeVersionId")]
        getter hook_type_version_id : String?

        # States whether the Hook is invoked before or after resource provisioning.

        @[JSON::Field(key: "InvocationPoint")]
        getter invocation_point : String?

        def initialize(
          @failure_mode : String? = nil,
          @hook_event_time : Time? = nil,
          @hook_status : String? = nil,
          @hook_status_message : String? = nil,
          @hook_type_arn : String? = nil,
          @hook_type_name : String? = nil,
          @hook_type_version_id : String? = nil,
          @invocation_point : String? = nil
        )
        end
      end

      # The resource handler has returned that the credentials provided by the user are invalid.

      struct InvalidCredentialsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource handler has returned that invalid input from the user has generated a generic
      # exception.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListResourceRequestsInput
        include JSON::Serializable

        # The maximum number of results to be returned with a single call. If the number of available results
        # exceeds this maximum, the response includes a NextToken value that you can assign to the NextToken
        # request parameter to get the next set of results. The default is 20 .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous paginated request didn't return all of the remaining results, the response object's
        # NextToken parameter value is set to a token. To retrieve the next set of results, call this action
        # again and assign that token to the request object's NextToken parameter. If there are no remaining
        # results, the previous response object's NextToken parameter is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The filter criteria to apply to the requests returned.

        @[JSON::Field(key: "ResourceRequestStatusFilter")]
        getter resource_request_status_filter : Types::ResourceRequestStatusFilter?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_request_status_filter : Types::ResourceRequestStatusFilter? = nil
        )
        end
      end


      struct ListResourceRequestsOutput
        include JSON::Serializable

        # If the request doesn't return all of the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call ListResources again and assign that token to the request object's
        # NextToken parameter. If the request returns all results, NextToken is set to null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The requests that match the specified filter criteria.

        @[JSON::Field(key: "ResourceRequestStatusSummaries")]
        getter resource_request_status_summaries : Array(Types::ProgressEvent)?

        def initialize(
          @next_token : String? = nil,
          @resource_request_status_summaries : Array(Types::ProgressEvent)? = nil
        )
        end
      end


      struct ListResourcesInput
        include JSON::Serializable

        # The name of the resource type.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        # Reserved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous paginated request didn't return all of the remaining results, the response object's
        # NextToken parameter value is set to a token. To retrieve the next set of results, call this action
        # again and assign that token to the request object's NextToken parameter. If there are no remaining
        # results, the previous response object's NextToken parameter is set to null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The resource model to use to select the resources to return.

        @[JSON::Field(key: "ResourceModel")]
        getter resource_model : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role for Cloud Control
        # API to use when performing this resource operation. The role specified must have the permissions
        # required for this operation. The necessary permissions for each event handler are defined in the
        # handlers section of the resource type definition schema . If you do not specify a role, Cloud
        # Control API uses a temporary session created using your Amazon Web Services user credentials. For
        # more information, see Specifying credentials in the Amazon Web Services Cloud Control API User Guide
        # .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # For private resource types, the type version to use in this resource operation. If you do not
        # specify a resource version, CloudFormation uses the default version.

        @[JSON::Field(key: "TypeVersionId")]
        getter type_version_id : String?

        def initialize(
          @type_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_model : String? = nil,
          @role_arn : String? = nil,
          @type_version_id : String? = nil
        )
        end
      end


      struct ListResourcesOutput
        include JSON::Serializable

        # If the request doesn't return all of the remaining results, NextToken is set to a token. To retrieve
        # the next set of results, call ListResources again and assign that token to the request object's
        # NextToken parameter. If the request returns all results, NextToken is set to null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the specified resources, including primary identifier and resource model.

        @[JSON::Field(key: "ResourceDescriptions")]
        getter resource_descriptions : Array(Types::ResourceDescription)?

        # The name of the resource type.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @next_token : String? = nil,
          @resource_descriptions : Array(Types::ResourceDescription)? = nil,
          @type_name : String? = nil
        )
        end
      end

      # The resource handler has returned that the request couldn't be completed due to networking issues,
      # such as a failure to receive a response from the server.

      struct NetworkFailureException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource handler has returned that the downstream resource failed to complete all of its
      # ready-state checks.

      struct NotStabilizedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more properties included in this resource operation are defined as create-only, and therefore
      # can't be updated.

      struct NotUpdatableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Cloud Control API hasn't received a valid response from the resource handler, due to a configuration
      # error. This includes issues such as the resource handler returning an invalid response, or timing
      # out.

      struct PrivateTypeException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the current status of a resource operation request. For more information, see Managing
      # resource operation requests in the Amazon Web Services Cloud Control API User Guide .

      struct ProgressEvent
        include JSON::Serializable

        # For requests with a status of FAILED , the associated error code. For error code definitions, see
        # Handler error codes in the CloudFormation Command Line Interface User Guide for Extension
        # Development .

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # When the resource operation request was initiated.

        @[JSON::Field(key: "EventTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter event_time : Time?

        # The unique token representing the Hooks operation for the request.

        @[JSON::Field(key: "HooksRequestToken")]
        getter hooks_request_token : String?

        # The primary identifier for the resource. In some cases, the resource identifier may be available
        # before the resource operation has reached a status of SUCCESS .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # The resource operation type.

        @[JSON::Field(key: "Operation")]
        getter operation : String?

        # The current status of the resource operation request. PENDING : The resource operation hasn't yet
        # started. IN_PROGRESS : The resource operation is currently in progress. SUCCESS : The resource
        # operation has successfully completed. FAILED : The resource operation has failed. Refer to the error
        # code and status message for more information. CANCEL_IN_PROGRESS : The resource operation is in the
        # process of being canceled. CANCEL_COMPLETE : The resource operation has been canceled.

        @[JSON::Field(key: "OperationStatus")]
        getter operation_status : String?

        # The unique token representing this resource operation request. Use the RequestToken with
        # GetResourceRequestStatus to return the current status of a resource operation request.

        @[JSON::Field(key: "RequestToken")]
        getter request_token : String?

        # A JSON string containing the resource model, consisting of each resource property and its current
        # value.

        @[JSON::Field(key: "ResourceModel")]
        getter resource_model : String?

        # When to next request the status of this resource operation request.

        @[JSON::Field(key: "RetryAfter", converter: Aws::Runtime::UnixTimestampConverter)]
        getter retry_after : Time?

        # Any message explaining the current status.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The name of the resource type used in the operation.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @error_code : String? = nil,
          @event_time : Time? = nil,
          @hooks_request_token : String? = nil,
          @identifier : String? = nil,
          @operation : String? = nil,
          @operation_status : String? = nil,
          @request_token : String? = nil,
          @resource_model : String? = nil,
          @retry_after : Time? = nil,
          @status_message : String? = nil,
          @type_name : String? = nil
        )
        end
      end

      # A resource operation with the specified request token can't be found.

      struct RequestTokenNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource is temporarily unavailable to be acted upon. For example, if the resource is currently
      # undergoing an operation and can't be acted upon until that operation is finished.

      struct ResourceConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents information about a provisioned resource.

      struct ResourceDescription
        include JSON::Serializable

        # The primary identifier for the resource. For more information, see Identifying resources in the
        # Amazon Web Services Cloud Control API User Guide .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # A list of the resource properties and their current values.

        @[JSON::Field(key: "Properties")]
        getter properties : String?

        def initialize(
          @identifier : String? = nil,
          @properties : String? = nil
        )
        end
      end

      # A resource with the specified identifier can't be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The filter criteria to use in determining the requests returned.

      struct ResourceRequestStatusFilter
        include JSON::Serializable

        # The operation statuses to include in the filter. PENDING : The operation has been requested, but not
        # yet initiated. IN_PROGRESS : The operation is in progress. SUCCESS : The operation completed. FAILED
        # : The operation failed. CANCEL_IN_PROGRESS : The operation is in the process of being canceled.
        # CANCEL_COMPLETE : The operation has been canceled.

        @[JSON::Field(key: "OperationStatuses")]
        getter operation_statuses : Array(String)?

        # The operation types to include in the filter.

        @[JSON::Field(key: "Operations")]
        getter operations : Array(String)?

        def initialize(
          @operation_statuses : Array(String)? = nil,
          @operations : Array(String)? = nil
        )
        end
      end

      # The resource handler has returned that the downstream service returned an internal error, typically
      # with a 5XX HTTP status code.

      struct ServiceInternalErrorException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource handler has returned that a non-transient resource limit was reached on the service
      # side.

      struct ServiceLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified extension doesn't exist in the CloudFormation registry.

      struct TypeNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource doesn't support this resource operation.

      struct UnsupportedActionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateResourceInput
        include JSON::Serializable

        # The identifier for the resource. You can specify the primary identifier, or any secondary identifier
        # defined for the resource type in its resource schema. You can only specify one identifier. Primary
        # identifiers can be specified as a string or JSON; secondary identifiers must be specified as JSON.
        # For compound primary identifiers (that is, one that consists of multiple resource properties strung
        # together), to specify the primary identifier as a string, list the property values in the order they
        # are specified in the primary identifier definition, separated by | . For more information, see
        # Identifying resources in the Amazon Web Services Cloud Control API User Guide .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A JavaScript Object Notation (JSON) document listing the patch operations that represent the updates
        # to apply to the current resource properties. For details, see Composing the patch document in the
        # Amazon Web Services Cloud Control API User Guide .

        @[JSON::Field(key: "PatchDocument")]
        getter patch_document : String

        # The name of the resource type.

        @[JSON::Field(key: "TypeName")]
        getter type_name : String

        # A unique identifier to ensure the idempotency of the resource request. As a best practice, specify
        # this token to ensure idempotency, so that Amazon Web Services Cloud Control API can accurately
        # distinguish between request retries and new resource requests. You might retry a resource request to
        # ensure that it was successfully received. A client token is valid for 36 hours once used. After
        # that, a resource request with the same client token is treated as a new request. If you do not
        # specify a client token, one is generated for inclusion in the request. For more information, see
        # Ensuring resource operation requests are unique in the Amazon Web Services Cloud Control API User
        # Guide .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role for Cloud Control
        # API to use when performing this resource operation. The role specified must have the permissions
        # required for this operation. The necessary permissions for each event handler are defined in the
        # handlers section of the resource type definition schema . If you do not specify a role, Cloud
        # Control API uses a temporary session created using your Amazon Web Services user credentials. For
        # more information, see Specifying credentials in the Amazon Web Services Cloud Control API User Guide
        # .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # For private resource types, the type version to use in this resource operation. If you do not
        # specify a resource version, CloudFormation uses the default version.

        @[JSON::Field(key: "TypeVersionId")]
        getter type_version_id : String?

        def initialize(
          @identifier : String,
          @patch_document : String,
          @type_name : String,
          @client_token : String? = nil,
          @role_arn : String? = nil,
          @type_version_id : String? = nil
        )
        end
      end


      struct UpdateResourceOutput
        include JSON::Serializable

        # Represents the current status of the resource update request. Use the RequestToken of the
        # ProgressEvent with GetResourceRequestStatus to return the current status of a resource operation
        # request.

        @[JSON::Field(key: "ProgressEvent")]
        getter progress_event : Types::ProgressEvent?

        def initialize(
          @progress_event : Types::ProgressEvent? = nil
        )
        end
      end
    end
  end
end
