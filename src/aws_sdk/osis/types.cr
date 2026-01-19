require "json"
require "time"

module AwsSdk
  module OSIS
    module Types

      # You don't have permissions to access the resource.
      struct AccessDeniedException
        include JSON::Serializable

        def initialize
        end
      end

      # Options that specify the configuration of a persistent buffer. To configure how OpenSearch Ingestion
      # encrypts this data, set the EncryptionAtRestOptions . For more information, see Persistent buffering
      # .
      struct BufferOptions
        include JSON::Serializable

        # Whether persistent buffering should be enabled.
        @[JSON::Field(key: "PersistentBufferEnabled")]
        getter persistent_buffer_enabled : Bool

        def initialize(
          @persistent_buffer_enabled : Bool
        )
        end
      end

      # Progress details for a specific stage of a pipeline configuration change.
      struct ChangeProgressStage
        include JSON::Serializable

        # A description of the stage.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The most recent updated timestamp of the stage.
        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the stage.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current status of the stage that the change is in.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @description : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The progress details of a pipeline configuration change.
      struct ChangeProgressStatus
        include JSON::Serializable

        # Information about the stages that the pipeline is going through to perform the configuration change.
        @[JSON::Field(key: "ChangeProgressStages")]
        getter change_progress_stages : Array(Types::ChangeProgressStage)?

        # The time at which the configuration change is made on the pipeline.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The overall status of the pipeline configuration change.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The total number of stages required for the pipeline configuration change.
        @[JSON::Field(key: "TotalNumberOfStages")]
        getter total_number_of_stages : Int32?

        def initialize(
          @change_progress_stages : Array(Types::ChangeProgressStage)? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @total_number_of_stages : Int32? = nil
        )
        end
      end

      # The destination for OpenSearch Ingestion logs sent to Amazon CloudWatch.
      struct CloudWatchLogDestination
        include JSON::Serializable

        # The name of the CloudWatch Logs group to send pipeline logs to. You can specify an existing log
        # group or create a new one. For example, /aws/vendedlogs/OpenSearchService/pipelines .
        @[JSON::Field(key: "LogGroup")]
        getter log_group : String

        def initialize(
          @log_group : String
        )
        end
      end

      # The client attempted to remove a resource that is currently in use.
      struct ConflictException
        include JSON::Serializable

        def initialize
        end
      end

      struct CreatePipelineEndpointRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the pipeline to create the endpoint for.
        @[JSON::Field(key: "PipelineArn")]
        getter pipeline_arn : String

        # Container for the VPC configuration for the pipeline endpoint, including subnet IDs and security
        # group IDs.
        @[JSON::Field(key: "VpcOptions")]
        getter vpc_options : Types::PipelineEndpointVpcOptions

        def initialize(
          @pipeline_arn : String,
          @vpc_options : Types::PipelineEndpointVpcOptions
        )
        end
      end

      struct CreatePipelineEndpointResponse
        include JSON::Serializable

        # The unique identifier of the pipeline endpoint.
        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The Amazon Resource Name (ARN) of the pipeline associated with the endpoint.
        @[JSON::Field(key: "PipelineArn")]
        getter pipeline_arn : String?

        # The current status of the pipeline endpoint.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The ID of the VPC where the pipeline endpoint was created.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @endpoint_id : String? = nil,
          @pipeline_arn : String? = nil,
          @status : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      struct CreatePipelineRequest
        include JSON::Serializable

        # The maximum pipeline capacity, in Ingestion Compute Units (ICUs).
        @[JSON::Field(key: "MaxUnits")]
        getter max_units : Int32

        # The minimum pipeline capacity, in Ingestion Compute Units (ICUs).
        @[JSON::Field(key: "MinUnits")]
        getter min_units : Int32

        # The pipeline configuration in YAML format. The command accepts the pipeline configuration as a
        # string or within a .yaml file. If you provide the configuration as a string, each new line must be
        # escaped with \n .
        @[JSON::Field(key: "PipelineConfigurationBody")]
        getter pipeline_configuration_body : String

        # The name of the OpenSearch Ingestion pipeline to create. Pipeline names are unique across the
        # pipelines owned by an account within an Amazon Web Services Region.
        @[JSON::Field(key: "PipelineName")]
        getter pipeline_name : String

        # Key-value pairs to configure persistent buffering for the pipeline.
        @[JSON::Field(key: "BufferOptions")]
        getter buffer_options : Types::BufferOptions?

        # Key-value pairs to configure encryption for data that is written to a persistent buffer.
        @[JSON::Field(key: "EncryptionAtRestOptions")]
        getter encryption_at_rest_options : Types::EncryptionAtRestOptions?

        # Key-value pairs to configure log publishing.
        @[JSON::Field(key: "LogPublishingOptions")]
        getter log_publishing_options : Types::LogPublishingOptions?

        # The Amazon Resource Name (ARN) of the IAM role that grants the pipeline permission to access Amazon
        # Web Services resources.
        @[JSON::Field(key: "PipelineRoleArn")]
        getter pipeline_role_arn : String?

        # List of tags to add to the pipeline upon creation.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Container for the values required to configure VPC access for the pipeline. If you don't specify
        # these values, OpenSearch Ingestion creates the pipeline with a public endpoint.
        @[JSON::Field(key: "VpcOptions")]
        getter vpc_options : Types::VpcOptions?

        def initialize(
          @max_units : Int32,
          @min_units : Int32,
          @pipeline_configuration_body : String,
          @pipeline_name : String,
          @buffer_options : Types::BufferOptions? = nil,
          @encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
          @log_publishing_options : Types::LogPublishingOptions? = nil,
          @pipeline_role_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_options : Types::VpcOptions? = nil
        )
        end
      end

      struct CreatePipelineResponse
        include JSON::Serializable

        # Container for information about the created pipeline.
        @[JSON::Field(key: "Pipeline")]
        getter pipeline : Types::Pipeline?

        def initialize(
          @pipeline : Types::Pipeline? = nil
        )
        end
      end

      struct DeletePipelineEndpointRequest
        include JSON::Serializable

        # The unique identifier of the pipeline endpoint to delete.
        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String

        def initialize(
          @endpoint_id : String
        )
        end
      end

      struct DeletePipelineEndpointResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeletePipelineRequest
        include JSON::Serializable

        # The name of the pipeline to delete.
        @[JSON::Field(key: "PipelineName")]
        getter pipeline_name : String

        def initialize(
          @pipeline_name : String
        )
        end
      end

      struct DeletePipelineResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource from which to delete the policy.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Exception is thrown when an operation has been disabled.
      struct DisabledOperationException
        include JSON::Serializable

        def initialize
        end
      end

      # Options to control how OpenSearch encrypts buffer data.
      struct EncryptionAtRestOptions
        include JSON::Serializable

        # The ARN of the KMS key used to encrypt buffer data. By default, data is encrypted using an Amazon
        # Web Services owned key.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String

        def initialize(
          @kms_key_arn : String
        )
        end
      end

      struct GetPipelineBlueprintRequest
        include JSON::Serializable

        # The name of the blueprint to retrieve.
        @[JSON::Field(key: "BlueprintName")]
        getter blueprint_name : String

        # The format format of the blueprint to retrieve.
        @[JSON::Field(key: "format")]
        getter format : String?

        def initialize(
          @blueprint_name : String,
          @format : String? = nil
        )
        end
      end

      struct GetPipelineBlueprintResponse
        include JSON::Serializable

        # The requested blueprint in YAML format.
        @[JSON::Field(key: "Blueprint")]
        getter blueprint : Types::PipelineBlueprint?

        # The format of the blueprint.
        @[JSON::Field(key: "Format")]
        getter format : String?

        def initialize(
          @blueprint : Types::PipelineBlueprint? = nil,
          @format : String? = nil
        )
        end
      end

      struct GetPipelineChangeProgressRequest
        include JSON::Serializable

        # The name of the pipeline.
        @[JSON::Field(key: "PipelineName")]
        getter pipeline_name : String

        def initialize(
          @pipeline_name : String
        )
        end
      end

      struct GetPipelineChangeProgressResponse
        include JSON::Serializable

        # The current status of the change happening on the pipeline.
        @[JSON::Field(key: "ChangeProgressStatuses")]
        getter change_progress_statuses : Array(Types::ChangeProgressStatus)?

        def initialize(
          @change_progress_statuses : Array(Types::ChangeProgressStatus)? = nil
        )
        end
      end

      struct GetPipelineRequest
        include JSON::Serializable

        # The name of the pipeline.
        @[JSON::Field(key: "PipelineName")]
        getter pipeline_name : String

        def initialize(
          @pipeline_name : String
        )
        end
      end

      struct GetPipelineResponse
        include JSON::Serializable

        # Detailed information about the requested pipeline.
        @[JSON::Field(key: "Pipeline")]
        getter pipeline : Types::Pipeline?

        def initialize(
          @pipeline : Types::Pipeline? = nil
        )
        end
      end

      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which to retrieve the policy.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct GetResourcePolicyResponse
        include JSON::Serializable

        # The resource-based policy document in JSON format.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @policy : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # The request failed because of an unknown error, exception, or failure (the failure is internal to
      # the service).
      struct InternalException
        include JSON::Serializable

        def initialize
        end
      end

      # An invalid pagination token provided in the request.
      struct InvalidPaginationTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # You attempted to create more than the allowed number of tags.
      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      struct ListPipelineBlueprintsRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct ListPipelineBlueprintsResponse
        include JSON::Serializable

        # A list of available blueprints for Data Prepper.
        @[JSON::Field(key: "Blueprints")]
        getter blueprints : Array(Types::PipelineBlueprintSummary)?

        def initialize(
          @blueprints : Array(Types::PipelineBlueprintSummary)? = nil
        )
        end
      end

      struct ListPipelineEndpointConnectionsRequest
        include JSON::Serializable

        # The maximum number of pipeline endpoint connections to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListPipelineEndpointConnections operation returns a nextToken , you can include the
        # returned nextToken in subsequent ListPipelineEndpointConnections operations, which returns results
        # in the next page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPipelineEndpointConnectionsResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of pipeline endpoint connections.
        @[JSON::Field(key: "PipelineEndpointConnections")]
        getter pipeline_endpoint_connections : Array(Types::PipelineEndpointConnection)?

        def initialize(
          @next_token : String? = nil,
          @pipeline_endpoint_connections : Array(Types::PipelineEndpointConnection)? = nil
        )
        end
      end

      struct ListPipelineEndpointsRequest
        include JSON::Serializable

        # The maximum number of pipeline endpoints to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListPipelineEndpoints operation returns a NextToken , you can include the returned
        # NextToken in subsequent ListPipelineEndpoints operations, which returns results in the next page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPipelineEndpointsResponse
        include JSON::Serializable

        # When NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of pipeline endpoints.
        @[JSON::Field(key: "PipelineEndpoints")]
        getter pipeline_endpoints : Array(Types::PipelineEndpoint)?

        def initialize(
          @next_token : String? = nil,
          @pipeline_endpoints : Array(Types::PipelineEndpoint)? = nil
        )
        end
      end

      struct ListPipelinesRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListPipelines operation returns a nextToken , you can include the returned nextToken
        # in subsequent ListPipelines operations, which returns results in the next page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPipelinesResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of all existing Data Prepper pipelines.
        @[JSON::Field(key: "Pipelines")]
        getter pipelines : Array(Types::PipelineSummary)?

        def initialize(
          @next_token : String? = nil,
          @pipelines : Array(Types::PipelineSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the pipeline to retrieve tags for.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags associated with the given pipeline.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Container for the values required to configure logging for the pipeline. If you don't specify these
      # values, OpenSearch Ingestion will not publish logs from your application to CloudWatch Logs.
      struct LogPublishingOptions
        include JSON::Serializable

        # The destination for OpenSearch Ingestion logs sent to Amazon CloudWatch Logs. This parameter is
        # required if IsLoggingEnabled is set to true .
        @[JSON::Field(key: "CloudWatchLogDestination")]
        getter cloud_watch_log_destination : Types::CloudWatchLogDestination?

        # Whether logs should be published.
        @[JSON::Field(key: "IsLoggingEnabled")]
        getter is_logging_enabled : Bool?

        def initialize(
          @cloud_watch_log_destination : Types::CloudWatchLogDestination? = nil,
          @is_logging_enabled : Bool? = nil
        )
        end
      end

      # Information about an existing OpenSearch Ingestion pipeline.
      struct Pipeline
        include JSON::Serializable

        @[JSON::Field(key: "BufferOptions")]
        getter buffer_options : Types::BufferOptions?

        # The date and time when the pipeline was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Destinations to which the pipeline writes data.
        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::PipelineDestination)?

        @[JSON::Field(key: "EncryptionAtRestOptions")]
        getter encryption_at_rest_options : Types::EncryptionAtRestOptions?

        # The ingestion endpoints for the pipeline, which you can send data to.
        @[JSON::Field(key: "IngestEndpointUrls")]
        getter ingest_endpoint_urls : Array(String)?

        # The date and time when the pipeline was last updated.
        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # Key-value pairs that represent log publishing settings.
        @[JSON::Field(key: "LogPublishingOptions")]
        getter log_publishing_options : Types::LogPublishingOptions?

        # The maximum pipeline capacity, in Ingestion Compute Units (ICUs).
        @[JSON::Field(key: "MaxUnits")]
        getter max_units : Int32?

        # The minimum pipeline capacity, in Ingestion Compute Units (ICUs).
        @[JSON::Field(key: "MinUnits")]
        getter min_units : Int32?

        # The Amazon Resource Name (ARN) of the pipeline.
        @[JSON::Field(key: "PipelineArn")]
        getter pipeline_arn : String?

        # The Data Prepper pipeline configuration in YAML format.
        @[JSON::Field(key: "PipelineConfigurationBody")]
        getter pipeline_configuration_body : String?

        # The name of the pipeline.
        @[JSON::Field(key: "PipelineName")]
        getter pipeline_name : String?

        # The Amazon Resource Name (ARN) of the IAM role that the pipeline uses to access AWS resources.
        @[JSON::Field(key: "PipelineRoleArn")]
        getter pipeline_role_arn : String?

        # A list of VPC endpoints that OpenSearch Ingestion has created to other Amazon Web Services services.
        @[JSON::Field(key: "ServiceVpcEndpoints")]
        getter service_vpc_endpoints : Array(Types::ServiceVpcEndpoint)?

        # The current status of the pipeline.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason for the current status of the pipeline.
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : Types::PipelineStatusReason?

        # A list of tags associated with the given pipeline.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The VPC endpoint service name for the pipeline.
        @[JSON::Field(key: "VpcEndpointService")]
        getter vpc_endpoint_service : String?

        # The VPC interface endpoints that have access to the pipeline.
        @[JSON::Field(key: "VpcEndpoints")]
        getter vpc_endpoints : Array(Types::VpcEndpoint)?

        def initialize(
          @buffer_options : Types::BufferOptions? = nil,
          @created_at : Time? = nil,
          @destinations : Array(Types::PipelineDestination)? = nil,
          @encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
          @ingest_endpoint_urls : Array(String)? = nil,
          @last_updated_at : Time? = nil,
          @log_publishing_options : Types::LogPublishingOptions? = nil,
          @max_units : Int32? = nil,
          @min_units : Int32? = nil,
          @pipeline_arn : String? = nil,
          @pipeline_configuration_body : String? = nil,
          @pipeline_name : String? = nil,
          @pipeline_role_arn : String? = nil,
          @service_vpc_endpoints : Array(Types::ServiceVpcEndpoint)? = nil,
          @status : String? = nil,
          @status_reason : Types::PipelineStatusReason? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_endpoint_service : String? = nil,
          @vpc_endpoints : Array(Types::VpcEndpoint)? = nil
        )
        end
      end

      # Container for information about an OpenSearch Ingestion blueprint.
      struct PipelineBlueprint
        include JSON::Serializable

        # The name of the blueprint.
        @[JSON::Field(key: "BlueprintName")]
        getter blueprint_name : String?

        # A description of the blueprint.
        @[JSON::Field(key: "DisplayDescription")]
        getter display_description : String?

        # The display name of the blueprint.
        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The YAML configuration of the blueprint.
        @[JSON::Field(key: "PipelineConfigurationBody")]
        getter pipeline_configuration_body : String?

        # The name of the service that the blueprint is associated with.
        @[JSON::Field(key: "Service")]
        getter service : String?

        # The use case that the blueprint relates to.
        @[JSON::Field(key: "UseCase")]
        getter use_case : String?

        def initialize(
          @blueprint_name : String? = nil,
          @display_description : String? = nil,
          @display_name : String? = nil,
          @pipeline_configuration_body : String? = nil,
          @service : String? = nil,
          @use_case : String? = nil
        )
        end
      end

      # A summary of an OpenSearch Ingestion blueprint.
      struct PipelineBlueprintSummary
        include JSON::Serializable

        # The name of the blueprint.
        @[JSON::Field(key: "BlueprintName")]
        getter blueprint_name : String?

        # A description of the blueprint.
        @[JSON::Field(key: "DisplayDescription")]
        getter display_description : String?

        # The display name of the blueprint.
        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The name of the service that the blueprint is associated with.
        @[JSON::Field(key: "Service")]
        getter service : String?

        # The use case that the blueprint relates to.
        @[JSON::Field(key: "UseCase")]
        getter use_case : String?

        def initialize(
          @blueprint_name : String? = nil,
          @display_description : String? = nil,
          @display_name : String? = nil,
          @service : String? = nil,
          @use_case : String? = nil
        )
        end
      end

      # An object representing the destination of a pipeline.
      struct PipelineDestination
        include JSON::Serializable

        # The endpoint receiving data from the pipeline.
        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # The name of the service receiving data from the pipeline.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        def initialize(
          @endpoint : String? = nil,
          @service_name : String? = nil
        )
        end
      end

      # Represents a VPC endpoint for an OpenSearch Ingestion pipeline, enabling private connectivity
      # between your VPC and the pipeline.
      struct PipelineEndpoint
        include JSON::Serializable

        # The unique identifier for the pipeline endpoint.
        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The URL used to ingest data to the pipeline through the VPC endpoint.
        @[JSON::Field(key: "IngestEndpointUrl")]
        getter ingest_endpoint_url : String?

        # The Amazon Resource Name (ARN) of the pipeline associated with this endpoint.
        @[JSON::Field(key: "PipelineArn")]
        getter pipeline_arn : String?

        # The current status of the pipeline endpoint.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The ID of the VPC where the pipeline endpoint is created.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        # Configuration options for the VPC endpoint, including subnet and security group settings.
        @[JSON::Field(key: "VpcOptions")]
        getter vpc_options : Types::PipelineEndpointVpcOptions?

        def initialize(
          @endpoint_id : String? = nil,
          @ingest_endpoint_url : String? = nil,
          @pipeline_arn : String? = nil,
          @status : String? = nil,
          @vpc_id : String? = nil,
          @vpc_options : Types::PipelineEndpointVpcOptions? = nil
        )
        end
      end

      # Represents a connection to a pipeline endpoint, containing details about the endpoint association.
      struct PipelineEndpointConnection
        include JSON::Serializable

        # The unique identifier of the endpoint in the connection.
        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The Amazon Resource Name (ARN) of the pipeline in the endpoint connection.
        @[JSON::Field(key: "PipelineArn")]
        getter pipeline_arn : String?

        # The current status of the pipeline endpoint connection.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Web Services account ID that owns the VPC endpoint used in this connection.
        @[JSON::Field(key: "VpcEndpointOwner")]
        getter vpc_endpoint_owner : String?

        def initialize(
          @endpoint_id : String? = nil,
          @pipeline_arn : String? = nil,
          @status : String? = nil,
          @vpc_endpoint_owner : String? = nil
        )
        end
      end

      # Configuration settings for the VPC endpoint, specifying network access controls.
      struct PipelineEndpointVpcOptions
        include JSON::Serializable

        # A list of security group IDs that control network access to the pipeline endpoint.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of subnet IDs where the pipeline endpoint network interfaces are created.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # Information about a pipeline's current status.
      struct PipelineStatusReason
        include JSON::Serializable

        # A description of why a pipeline has a certain status.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @description : String? = nil
        )
        end
      end

      # Summary information for an OpenSearch Ingestion pipeline.
      struct PipelineSummary
        include JSON::Serializable

        # The date and time when the pipeline was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A list of destinations to which the pipeline writes data.
        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::PipelineDestination)?

        # The date and time when the pipeline was last updated.
        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The maximum pipeline capacity, in Ingestion Compute Units (ICUs).
        @[JSON::Field(key: "MaxUnits")]
        getter max_units : Int32?

        # The minimum pipeline capacity, in Ingestion Compute Units (ICUs).
        @[JSON::Field(key: "MinUnits")]
        getter min_units : Int32?

        # The Amazon Resource Name (ARN) of the pipeline.
        @[JSON::Field(key: "PipelineArn")]
        getter pipeline_arn : String?

        # The name of the pipeline.
        @[JSON::Field(key: "PipelineName")]
        getter pipeline_name : String?

        # The current status of the pipeline.
        @[JSON::Field(key: "Status")]
        getter status : String?

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : Types::PipelineStatusReason?

        # A list of tags associated with the given pipeline.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @created_at : Time? = nil,
          @destinations : Array(Types::PipelineDestination)? = nil,
          @last_updated_at : Time? = nil,
          @max_units : Int32? = nil,
          @min_units : Int32? = nil,
          @pipeline_arn : String? = nil,
          @pipeline_name : String? = nil,
          @status : String? = nil,
          @status_reason : Types::PipelineStatusReason? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The resource-based policy document in JSON format.
        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the resource to attach the policy to.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end

      struct PutResourcePolicyResponse
        include JSON::Serializable

        # The resource-based policy document that was attached to the resource.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @policy : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # You attempted to create a resource that already exists.
      struct ResourceAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # You attempted to access or delete a resource that does not exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      struct RevokePipelineEndpointConnectionsRequest
        include JSON::Serializable

        # A list of endpoint IDs for which to revoke access to the pipeline.
        @[JSON::Field(key: "EndpointIds")]
        getter endpoint_ids : Array(String)

        # The Amazon Resource Name (ARN) of the pipeline from which to revoke endpoint connections.
        @[JSON::Field(key: "PipelineArn")]
        getter pipeline_arn : String

        def initialize(
          @endpoint_ids : Array(String),
          @pipeline_arn : String
        )
        end
      end

      struct RevokePipelineEndpointConnectionsResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the pipeline from which endpoint connections were revoked.
        @[JSON::Field(key: "PipelineArn")]
        getter pipeline_arn : String?

        def initialize(
          @pipeline_arn : String? = nil
        )
        end
      end

      # A container for information about VPC endpoints that were created to other services
      struct ServiceVpcEndpoint
        include JSON::Serializable

        # The name of the service for which a VPC endpoint was created.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        # The unique identifier of the VPC endpoint that was created.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @service_name : String? = nil,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      struct StartPipelineRequest
        include JSON::Serializable

        # The name of the pipeline to start.
        @[JSON::Field(key: "PipelineName")]
        getter pipeline_name : String

        def initialize(
          @pipeline_name : String
        )
        end
      end

      struct StartPipelineResponse
        include JSON::Serializable

        @[JSON::Field(key: "Pipeline")]
        getter pipeline : Types::Pipeline?

        def initialize(
          @pipeline : Types::Pipeline? = nil
        )
        end
      end

      struct StopPipelineRequest
        include JSON::Serializable

        # The name of the pipeline to stop.
        @[JSON::Field(key: "PipelineName")]
        getter pipeline_name : String

        def initialize(
          @pipeline_name : String
        )
        end
      end

      struct StopPipelineResponse
        include JSON::Serializable

        @[JSON::Field(key: "Pipeline")]
        getter pipeline : Types::Pipeline?

        def initialize(
          @pipeline : Types::Pipeline? = nil
        )
        end
      end

      # A tag (key-value pair) for an OpenSearch Ingestion pipeline.
      struct Tag
        include JSON::Serializable

        # The tag key. Tag keys must be unique for the pipeline to which they are attached.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value assigned to the corresponding tag key. Tag values can be null and don't have to be unique
        # in a tag set. For example, you can have a key value pair in a tag set of project : Trinity and
        # cost-center : Trinity
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

        # The Amazon Resource Name (ARN) of the pipeline to tag.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The list of key-value tags to add to the pipeline.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the pipeline to remove tags from.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The tag keys to remove.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdatePipelineRequest
        include JSON::Serializable

        # The name of the pipeline to update.
        @[JSON::Field(key: "PipelineName")]
        getter pipeline_name : String

        # Key-value pairs to configure persistent buffering for the pipeline.
        @[JSON::Field(key: "BufferOptions")]
        getter buffer_options : Types::BufferOptions?

        # Key-value pairs to configure encryption for data that is written to a persistent buffer.
        @[JSON::Field(key: "EncryptionAtRestOptions")]
        getter encryption_at_rest_options : Types::EncryptionAtRestOptions?

        # Key-value pairs to configure log publishing.
        @[JSON::Field(key: "LogPublishingOptions")]
        getter log_publishing_options : Types::LogPublishingOptions?

        # The maximum pipeline capacity, in Ingestion Compute Units (ICUs)
        @[JSON::Field(key: "MaxUnits")]
        getter max_units : Int32?

        # The minimum pipeline capacity, in Ingestion Compute Units (ICUs).
        @[JSON::Field(key: "MinUnits")]
        getter min_units : Int32?

        # The pipeline configuration in YAML format. The command accepts the pipeline configuration as a
        # string or within a .yaml file. If you provide the configuration as a string, each new line must be
        # escaped with \n .
        @[JSON::Field(key: "PipelineConfigurationBody")]
        getter pipeline_configuration_body : String?

        # The Amazon Resource Name (ARN) of the IAM role that grants the pipeline permission to access Amazon
        # Web Services resources.
        @[JSON::Field(key: "PipelineRoleArn")]
        getter pipeline_role_arn : String?

        def initialize(
          @pipeline_name : String,
          @buffer_options : Types::BufferOptions? = nil,
          @encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
          @log_publishing_options : Types::LogPublishingOptions? = nil,
          @max_units : Int32? = nil,
          @min_units : Int32? = nil,
          @pipeline_configuration_body : String? = nil,
          @pipeline_role_arn : String? = nil
        )
        end
      end

      struct UpdatePipelineResponse
        include JSON::Serializable

        # Container for information about the updated pipeline.
        @[JSON::Field(key: "Pipeline")]
        getter pipeline : Types::Pipeline?

        def initialize(
          @pipeline : Types::Pipeline? = nil
        )
        end
      end

      struct ValidatePipelineRequest
        include JSON::Serializable

        # The pipeline configuration in YAML format. The command accepts the pipeline configuration as a
        # string or within a .yaml file. If you provide the configuration as a string, each new line must be
        # escaped with \n .
        @[JSON::Field(key: "PipelineConfigurationBody")]
        getter pipeline_configuration_body : String

        def initialize(
          @pipeline_configuration_body : String
        )
        end
      end

      struct ValidatePipelineResponse
        include JSON::Serializable

        # A list of errors if the configuration is invalid.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::ValidationMessage)?

        # A boolean indicating whether or not the pipeline configuration is valid.
        @[JSON::Field(key: "isValid")]
        getter is_valid : Bool?

        def initialize(
          @errors : Array(Types::ValidationMessage)? = nil,
          @is_valid : Bool? = nil
        )
        end
      end

      # An exception for missing or invalid input fields.
      struct ValidationException
        include JSON::Serializable

        def initialize
        end
      end

      # A validation message associated with a ValidatePipeline request in OpenSearch Ingestion.
      struct ValidationMessage
        include JSON::Serializable

        # The validation message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Options for attaching a VPC to pipeline.
      struct VpcAttachmentOptions
        include JSON::Serializable

        # Whether a VPC is attached to the pipeline.
        @[JSON::Field(key: "AttachToVpc")]
        getter attach_to_vpc : Bool

        # The CIDR block to be reserved for OpenSearch Ingestion to create elastic network interfaces (ENIs).
        @[JSON::Field(key: "CidrBlock")]
        getter cidr_block : String?

        def initialize(
          @attach_to_vpc : Bool,
          @cidr_block : String? = nil
        )
        end
      end

      # An OpenSearch Ingestion-managed VPC endpoint that will access one or more pipelines.
      struct VpcEndpoint
        include JSON::Serializable

        # The unique identifier of the endpoint.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        # The ID for your VPC. Amazon Web Services PrivateLink generates this value when you create a VPC.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        # Information about the VPC, including associated subnets and security groups.
        @[JSON::Field(key: "VpcOptions")]
        getter vpc_options : Types::VpcOptions?

        def initialize(
          @vpc_endpoint_id : String? = nil,
          @vpc_id : String? = nil,
          @vpc_options : Types::VpcOptions? = nil
        )
        end
      end

      # Options that specify the subnets and security groups for an OpenSearch Ingestion VPC endpoint.
      struct VpcOptions
        include JSON::Serializable

        # A list of subnet IDs associated with the VPC endpoint.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # A list of security groups associated with the VPC endpoint.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # Options for attaching a VPC to a pipeline.
        @[JSON::Field(key: "VpcAttachmentOptions")]
        getter vpc_attachment_options : Types::VpcAttachmentOptions?

        # Defines whether you or Amazon OpenSearch Ingestion service create and manage the VPC endpoint
        # configured for the pipeline.
        @[JSON::Field(key: "VpcEndpointManagement")]
        getter vpc_endpoint_management : String?

        def initialize(
          @subnet_ids : Array(String),
          @security_group_ids : Array(String)? = nil,
          @vpc_attachment_options : Types::VpcAttachmentOptions? = nil,
          @vpc_endpoint_management : String? = nil
        )
        end
      end
    end
  end
end
