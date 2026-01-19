require "json"
require "time"

module AwsSdk
  module SagemakerEdge
    module Types

      # Information about the checksum of a model deployed on a device.
      struct Checksum
        include JSON::Serializable

        # The checksum of the model.
        @[JSON::Field(key: "Sum")]
        getter sum : String?

        # The type of the checksum.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @sum : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct Definition
        include JSON::Serializable

        # The checksum information of the model.
        @[JSON::Field(key: "Checksum")]
        getter checksum : Types::Checksum?

        # The unique model handle.
        @[JSON::Field(key: "ModelHandle")]
        getter model_handle : String?

        # The absolute S3 location of the model.
        @[JSON::Field(key: "S3Url")]
        getter s3_url : String?

        # The desired state of the model.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @checksum : Types::Checksum? = nil,
          @model_handle : String? = nil,
          @s3_url : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct DeploymentModel
        include JSON::Serializable

        # The desired state of the model.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # The unique handle of the model.
        @[JSON::Field(key: "ModelHandle")]
        getter model_handle : String?

        # The name of the model.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The version of the model.
        @[JSON::Field(key: "ModelVersion")]
        getter model_version : String?

        # Returns the error message if there is a rollback.
        @[JSON::Field(key: "RollbackFailureReason")]
        getter rollback_failure_reason : String?

        # Returns the current state of the model.
        @[JSON::Field(key: "State")]
        getter state : String?

        # Returns the deployment status of the model.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Returns the error message for the deployment status result.
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @desired_state : String? = nil,
          @model_handle : String? = nil,
          @model_name : String? = nil,
          @model_version : String? = nil,
          @rollback_failure_reason : String? = nil,
          @state : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Information about the result of a deployment on an edge device that is registered with SageMaker
      # Edge Manager.
      struct DeploymentResult
        include JSON::Serializable

        # The timestamp of when the deployment was ended, and the agent got the deployment results.
        @[JSON::Field(key: "DeploymentEndTime")]
        getter deployment_end_time : Time?

        # Returns a list of models deployed on the agent.
        @[JSON::Field(key: "DeploymentModels")]
        getter deployment_models : Array(Types::DeploymentModel)?

        # The name and unique ID of the deployment.
        @[JSON::Field(key: "DeploymentName")]
        getter deployment_name : String?

        # The timestamp of when the deployment was started on the agent.
        @[JSON::Field(key: "DeploymentStartTime")]
        getter deployment_start_time : Time?

        # Returns the bucket error code.
        @[JSON::Field(key: "DeploymentStatus")]
        getter deployment_status : String?

        # Returns the detailed error message.
        @[JSON::Field(key: "DeploymentStatusMessage")]
        getter deployment_status_message : String?

        def initialize(
          @deployment_end_time : Time? = nil,
          @deployment_models : Array(Types::DeploymentModel)? = nil,
          @deployment_name : String? = nil,
          @deployment_start_time : Time? = nil,
          @deployment_status : String? = nil,
          @deployment_status_message : String? = nil
        )
        end
      end

      # Information about a deployment on an edge device that is registered with SageMaker Edge Manager.
      struct EdgeDeployment
        include JSON::Serializable

        # Returns a list of Definition objects.
        @[JSON::Field(key: "Definitions")]
        getter definitions : Array(Types::Definition)?

        # The name and unique ID of the deployment.
        @[JSON::Field(key: "DeploymentName")]
        getter deployment_name : String?

        # Determines whether to rollback to previous configuration if deployment fails.
        @[JSON::Field(key: "FailureHandlingPolicy")]
        getter failure_handling_policy : String?

        # The type of the deployment.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @definitions : Array(Types::Definition)? = nil,
          @deployment_name : String? = nil,
          @failure_handling_policy : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information required for edge device metrics.
      struct EdgeMetric
        include JSON::Serializable

        # The dimension of metrics published.
        @[JSON::Field(key: "Dimension")]
        getter dimension : String?

        # Returns the name of the metric.
        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # Timestamp of when the metric was requested.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        # Returns the value of the metric.
        @[JSON::Field(key: "Value")]
        getter value : Float64?

        def initialize(
          @dimension : String? = nil,
          @metric_name : String? = nil,
          @timestamp : Time? = nil,
          @value : Float64? = nil
        )
        end
      end

      struct GetDeploymentsRequest
        include JSON::Serializable

        # The name of the fleet that the device belongs to.
        @[JSON::Field(key: "DeviceFleetName")]
        getter device_fleet_name : String

        # The unique name of the device you want to get the configuration of active deployments from.
        @[JSON::Field(key: "DeviceName")]
        getter device_name : String

        def initialize(
          @device_fleet_name : String,
          @device_name : String
        )
        end
      end

      struct GetDeploymentsResult
        include JSON::Serializable

        # Returns a list of the configurations of the active deployments on the device.
        @[JSON::Field(key: "Deployments")]
        getter deployments : Array(Types::EdgeDeployment)?

        def initialize(
          @deployments : Array(Types::EdgeDeployment)? = nil
        )
        end
      end

      struct GetDeviceRegistrationRequest
        include JSON::Serializable

        # The name of the fleet that the device belongs to.
        @[JSON::Field(key: "DeviceFleetName")]
        getter device_fleet_name : String

        # The unique name of the device you want to get the registration status from.
        @[JSON::Field(key: "DeviceName")]
        getter device_name : String

        def initialize(
          @device_fleet_name : String,
          @device_name : String
        )
        end
      end

      struct GetDeviceRegistrationResult
        include JSON::Serializable

        # The amount of time, in seconds, that the registration status is stored on the device’s cache before
        # it is refreshed.
        @[JSON::Field(key: "CacheTTL")]
        getter cache_ttl : String?

        # Describes if the device is currently registered with SageMaker Edge Manager.
        @[JSON::Field(key: "DeviceRegistration")]
        getter device_registration : String?

        def initialize(
          @cache_ttl : String? = nil,
          @device_registration : String? = nil
        )
        end
      end

      # An internal failure occurred. Try your request again. If the problem persists, contact Amazon Web
      # Services customer support.
      struct InternalServiceException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a model deployed on an edge device that is registered with SageMaker Edge Manager.
      struct Model
        include JSON::Serializable

        # The timestamp of the last inference that was made.
        @[JSON::Field(key: "LatestInference")]
        getter latest_inference : Time?

        # The timestamp of the last data sample taken.
        @[JSON::Field(key: "LatestSampleTime")]
        getter latest_sample_time : Time?

        # Information required for model metrics.
        @[JSON::Field(key: "ModelMetrics")]
        getter model_metrics : Array(Types::EdgeMetric)?

        # The name of the model.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The version of the model.
        @[JSON::Field(key: "ModelVersion")]
        getter model_version : String?

        def initialize(
          @latest_inference : Time? = nil,
          @latest_sample_time : Time? = nil,
          @model_metrics : Array(Types::EdgeMetric)? = nil,
          @model_name : String? = nil,
          @model_version : String? = nil
        )
        end
      end

      struct SendHeartbeatRequest
        include JSON::Serializable

        # Returns the version of the agent.
        @[JSON::Field(key: "AgentVersion")]
        getter agent_version : String

        # The name of the fleet that the device belongs to.
        @[JSON::Field(key: "DeviceFleetName")]
        getter device_fleet_name : String

        # The unique name of the device.
        @[JSON::Field(key: "DeviceName")]
        getter device_name : String

        # For internal use. Returns a list of SageMaker Edge Manager agent operating metrics.
        @[JSON::Field(key: "AgentMetrics")]
        getter agent_metrics : Array(Types::EdgeMetric)?

        # Returns the result of a deployment on the device.
        @[JSON::Field(key: "DeploymentResult")]
        getter deployment_result : Types::DeploymentResult?

        # Returns a list of models deployed on the the device.
        @[JSON::Field(key: "Models")]
        getter models : Array(Types::Model)?

        def initialize(
          @agent_version : String,
          @device_fleet_name : String,
          @device_name : String,
          @agent_metrics : Array(Types::EdgeMetric)? = nil,
          @deployment_result : Types::DeploymentResult? = nil,
          @models : Array(Types::Model)? = nil
        )
        end
      end
    end
  end
end
