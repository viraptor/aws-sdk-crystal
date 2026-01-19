require "json"
require "time"

module AwsSdk
  module Resiliencehub
    module Types

      # Indicates the grouping recommendation you have accepted to include in your application.
      struct AcceptGroupingRecommendationEntry
        include JSON::Serializable

        # Indicates the identifier of the grouping recommendation.
        @[JSON::Field(key: "groupingRecommendationId")]
        getter grouping_recommendation_id : String

        def initialize(
          @grouping_recommendation_id : String
        )
        end
      end

      struct AcceptResourceGroupingRecommendationsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # List of resource grouping recommendations you want to include in your application.
        @[JSON::Field(key: "entries")]
        getter entries : Array(Types::AcceptGroupingRecommendationEntry)

        def initialize(
          @app_arn : String,
          @entries : Array(Types::AcceptGroupingRecommendationEntry)
        )
        end
      end

      struct AcceptResourceGroupingRecommendationsResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # List of resource grouping recommendations that could not be included in your application.
        @[JSON::Field(key: "failedEntries")]
        getter failed_entries : Array(Types::FailedGroupingRecommendationEntry)

        def initialize(
          @app_arn : String,
          @failed_entries : Array(Types::FailedGroupingRecommendationEntry)
        )
        end
      end

      # You don't have permissions to perform the requested operation. The user or role that is making the
      # request must have at least one IAM permissions policy attached that grants the required permissions.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct AddDraftAppVersionResourceMappingsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Mappings used to map logical resources from the template to physical resources. You can use the
        # mapping type CFN_STACK if the application template uses a logical stack name. Or you can map
        # individual resources by using the mapping type RESOURCE . We recommend using the mapping type
        # CFN_STACK if the application is backed by a CloudFormation stack.
        @[JSON::Field(key: "resourceMappings")]
        getter resource_mappings : Array(Types::ResourceMapping)

        def initialize(
          @app_arn : String,
          @resource_mappings : Array(Types::ResourceMapping)
        )
        end
      end

      struct AddDraftAppVersionResourceMappingsResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # List of sources that are used to map a logical resource from the template to a physical resource.
        # You can use sources such as CloudFormation, Terraform state files, AppRegistry applications, or
        # Amazon EKS.
        @[JSON::Field(key: "resourceMappings")]
        getter resource_mappings : Array(Types::ResourceMapping)

        def initialize(
          @app_arn : String,
          @app_version : String,
          @resource_mappings : Array(Types::ResourceMapping)
        )
        end
      end

      # Indicates the Amazon CloudWatch alarm detected while running an assessment.
      struct Alarm
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Amazon CloudWatch alarm.
        @[JSON::Field(key: "alarmArn")]
        getter alarm_arn : String?

        # Indicates the source of the Amazon CloudWatch alarm. That is, it indicates if the alarm was created
        # using Resilience Hub recommendation ( AwsResilienceHub ), or if you had created the alarm in Amazon
        # CloudWatch ( Customer ).
        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @alarm_arn : String? = nil,
          @source : String? = nil
        )
        end
      end

      # Defines a recommendation for a CloudWatch alarm.
      struct AlarmRecommendation
        include JSON::Serializable

        # Name of the alarm recommendation.
        @[JSON::Field(key: "name")]
        getter name : String

        # Identifier of the alarm recommendation.
        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String

        # Reference identifier of the alarm recommendation.
        @[JSON::Field(key: "referenceId")]
        getter reference_id : String

        # Type of alarm recommendation.
        @[JSON::Field(key: "type")]
        getter type : String

        # Application Component name for the CloudWatch alarm recommendation. This name is saved as the first
        # item in the appComponentNames list.
        @[JSON::Field(key: "appComponentName")]
        getter app_component_name : String?

        # List of Application Component names for the CloudWatch alarm recommendation.
        @[JSON::Field(key: "appComponentNames")]
        getter app_component_names : Array(String)?

        # Description of the alarm recommendation.
        @[JSON::Field(key: "description")]
        getter description : String?

        # List of CloudWatch alarm recommendations.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::RecommendationItem)?

        # The prerequisite for the alarm recommendation.
        @[JSON::Field(key: "prerequisite")]
        getter prerequisite : String?

        # Status of the recommended Amazon CloudWatch alarm.
        @[JSON::Field(key: "recommendationStatus")]
        getter recommendation_status : String?

        def initialize(
          @name : String,
          @recommendation_id : String,
          @reference_id : String,
          @type : String,
          @app_component_name : String? = nil,
          @app_component_names : Array(String)? = nil,
          @description : String? = nil,
          @items : Array(Types::RecommendationItem)? = nil,
          @prerequisite : String? = nil,
          @recommendation_status : String? = nil
        )
        end
      end

      # Defines an Resilience Hub application.
      struct App
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Date and time when the application was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # Name for the application.
        @[JSON::Field(key: "name")]
        getter name : String

        # Assessment execution schedule with 'Daily' or 'Disabled' values.
        @[JSON::Field(key: "assessmentSchedule")]
        getter assessment_schedule : String?

        # Amazon Resource Name (ARN) of Resource Groups group that is integrated with an AppRegistry
        # application. For more information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web
        # Services General Reference guide.
        @[JSON::Field(key: "awsApplicationArn")]
        getter aws_application_arn : String?

        # Current status of compliance for the resiliency policy.
        @[JSON::Field(key: "complianceStatus")]
        getter compliance_status : String?

        # Optional description for an application.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates if compliance drifts (deviations) were detected while running an assessment for your
        # application.
        @[JSON::Field(key: "driftStatus")]
        getter drift_status : String?

        # The list of events you would like to subscribe and get notification for. Currently, Resilience Hub
        # supports notifications only for Drift detected and Scheduled assessment failure events.
        @[JSON::Field(key: "eventSubscriptions")]
        getter event_subscriptions : Array(Types::EventSubscription)?

        # Date and time the most recent compliance evaluation.
        @[JSON::Field(key: "lastAppComplianceEvaluationTime")]
        getter last_app_compliance_evaluation_time : Time?

        # Indicates the last time that a drift was evaluated.
        @[JSON::Field(key: "lastDriftEvaluationTime")]
        getter last_drift_evaluation_time : Time?

        # Date and time the most recent resiliency score evaluation.
        @[JSON::Field(key: "lastResiliencyScoreEvaluationTime")]
        getter last_resiliency_score_evaluation_time : Time?

        # Defines the roles and credentials that Resilience Hub would use while creating the application,
        # importing its resources, and running an assessment.
        @[JSON::Field(key: "permissionModel")]
        getter permission_model : Types::PermissionModel?

        # Amazon Resource Name (ARN) of the resiliency policy. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :resiliency-policy/ policy-id . For more information about ARNs,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String?

        # Current resiliency score for the application.
        @[JSON::Field(key: "resiliencyScore")]
        getter resiliency_score : Float64?

        # Recovery Point Objective (RPO) in seconds.
        @[JSON::Field(key: "rpoInSecs")]
        getter rpo_in_secs : Int32?

        # Recovery Time Objective (RTO) in seconds.
        @[JSON::Field(key: "rtoInSecs")]
        getter rto_in_secs : Int32?

        # Status of the application.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Tags assigned to the resource. A tag is a label that you assign to an Amazon Web Services resource.
        # Each tag consists of a key/value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @app_arn : String,
          @creation_time : Time,
          @name : String,
          @assessment_schedule : String? = nil,
          @aws_application_arn : String? = nil,
          @compliance_status : String? = nil,
          @description : String? = nil,
          @drift_status : String? = nil,
          @event_subscriptions : Array(Types::EventSubscription)? = nil,
          @last_app_compliance_evaluation_time : Time? = nil,
          @last_drift_evaluation_time : Time? = nil,
          @last_resiliency_score_evaluation_time : Time? = nil,
          @permission_model : Types::PermissionModel? = nil,
          @policy_arn : String? = nil,
          @resiliency_score : Float64? = nil,
          @rpo_in_secs : Int32? = nil,
          @rto_in_secs : Int32? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Defines an application assessment.
      struct AppAssessment
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # Current status of the assessment for the resiliency policy.
        @[JSON::Field(key: "assessmentStatus")]
        getter assessment_status : String

        # The entity that invoked the assessment.
        @[JSON::Field(key: "invoker")]
        getter invoker : String

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String?

        # Version of an application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String?

        # Name of the assessment.
        @[JSON::Field(key: "assessmentName")]
        getter assessment_name : String?

        # Application compliance against the resiliency policy.
        @[JSON::Field(key: "compliance")]
        getter compliance : Hash(String, Types::DisruptionCompliance)?

        # Current status of the compliance for the resiliency policy.
        @[JSON::Field(key: "complianceStatus")]
        getter compliance_status : String?

        # Cost for the application.
        @[JSON::Field(key: "cost")]
        getter cost : Types::Cost?

        # Indicates if compliance drifts (deviations) were detected while running an assessment for your
        # application.
        @[JSON::Field(key: "driftStatus")]
        getter drift_status : String?

        # End time for the action.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Error or warning message from the assessment execution
        @[JSON::Field(key: "message")]
        getter message : String?

        # Resiliency policy of an application.
        @[JSON::Field(key: "policy")]
        getter policy : Types::ResiliencyPolicy?

        # Current resiliency score for an application.
        @[JSON::Field(key: "resiliencyScore")]
        getter resiliency_score : Types::ResiliencyScore?

        # A resource error object containing a list of errors retrieving an application's resources.
        @[JSON::Field(key: "resourceErrorsDetails")]
        getter resource_errors_details : Types::ResourceErrorsDetails?

        # Starting time for the action.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Indicates the AI-generated summary for the Resilience Hub assessment, providing a concise overview
        # that highlights the top risks and recommendations. This property is available only in the US East
        # (N. Virginia) Region.
        @[JSON::Field(key: "summary")]
        getter summary : Types::AssessmentSummary?

        # Tags assigned to the resource. A tag is a label that you assign to an Amazon Web Services resource.
        # Each tag consists of a key/value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Version name of the published application.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        def initialize(
          @assessment_arn : String,
          @assessment_status : String,
          @invoker : String,
          @app_arn : String? = nil,
          @app_version : String? = nil,
          @assessment_name : String? = nil,
          @compliance : Hash(String, Types::DisruptionCompliance)? = nil,
          @compliance_status : String? = nil,
          @cost : Types::Cost? = nil,
          @drift_status : String? = nil,
          @end_time : Time? = nil,
          @message : String? = nil,
          @policy : Types::ResiliencyPolicy? = nil,
          @resiliency_score : Types::ResiliencyScore? = nil,
          @resource_errors_details : Types::ResourceErrorsDetails? = nil,
          @start_time : Time? = nil,
          @summary : Types::AssessmentSummary? = nil,
          @tags : Hash(String, String)? = nil,
          @version_name : String? = nil
        )
        end
      end

      # Defines an application assessment summary.
      struct AppAssessmentSummary
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # Current status of the assessment for the resiliency policy.
        @[JSON::Field(key: "assessmentStatus")]
        getter assessment_status : String

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String?

        # Version of an application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String?

        # Name of the assessment.
        @[JSON::Field(key: "assessmentName")]
        getter assessment_name : String?

        # Current status of compliance for the resiliency policy.
        @[JSON::Field(key: "complianceStatus")]
        getter compliance_status : String?

        # Cost for an application.
        @[JSON::Field(key: "cost")]
        getter cost : Types::Cost?

        # Indicates if compliance drifts (deviations) were detected while running an assessment for your
        # application.
        @[JSON::Field(key: "driftStatus")]
        getter drift_status : String?

        # End time for the action.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Entity that invoked the assessment.
        @[JSON::Field(key: "invoker")]
        getter invoker : String?

        # Message from the assessment run.
        @[JSON::Field(key: "message")]
        getter message : String?

        # Current resiliency score for the application.
        @[JSON::Field(key: "resiliencyScore")]
        getter resiliency_score : Float64?

        # Starting time for the action.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Name of an application version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        def initialize(
          @assessment_arn : String,
          @assessment_status : String,
          @app_arn : String? = nil,
          @app_version : String? = nil,
          @assessment_name : String? = nil,
          @compliance_status : String? = nil,
          @cost : Types::Cost? = nil,
          @drift_status : String? = nil,
          @end_time : Time? = nil,
          @invoker : String? = nil,
          @message : String? = nil,
          @resiliency_score : Float64? = nil,
          @start_time : Time? = nil,
          @version_name : String? = nil
        )
        end
      end

      # Defines an Application Component.
      struct AppComponent
        include JSON::Serializable

        # Name of the Application Component.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of Application Component.
        @[JSON::Field(key: "type")]
        getter type : String

        # Additional configuration parameters for an Resilience Hub application. If you want to implement
        # additionalInfo through the Resilience Hub console rather than using an API call, see Configure the
        # application configuration parameters . Currently, this parameter accepts a key-value mapping (in a
        # string format) of only one failover region and one associated account. Key: "failover-regions"
        # Value: "[{"region":"&lt;REGION&gt;", "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Hash(String, Array(String))?

        # Identifier of the Application Component.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @name : String,
          @type : String,
          @additional_info : Hash(String, Array(String))? = nil,
          @id : String? = nil
        )
        end
      end

      # Defines the compliance of an Application Component against the resiliency policy.
      struct AppComponentCompliance
        include JSON::Serializable

        # Name of the Application Component.
        @[JSON::Field(key: "appComponentName")]
        getter app_component_name : String?

        # The compliance of the Application Component against the resiliency policy.
        @[JSON::Field(key: "compliance")]
        getter compliance : Hash(String, Types::DisruptionCompliance)?

        # The cost for the application.
        @[JSON::Field(key: "cost")]
        getter cost : Types::Cost?

        # The compliance message.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The current resiliency score for the application.
        @[JSON::Field(key: "resiliencyScore")]
        getter resiliency_score : Types::ResiliencyScore?

        # Status of the action.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_component_name : String? = nil,
          @compliance : Hash(String, Types::DisruptionCompliance)? = nil,
          @cost : Types::Cost? = nil,
          @message : String? = nil,
          @resiliency_score : Types::ResiliencyScore? = nil,
          @status : String? = nil
        )
        end
      end

      # The list of Resilience Hub application input sources.
      struct AppInputSource
        include JSON::Serializable

        # The resource type of the input source.
        @[JSON::Field(key: "importType")]
        getter import_type : String

        # The namespace on your Amazon Elastic Kubernetes Service cluster.
        @[JSON::Field(key: "eksSourceClusterNamespace")]
        getter eks_source_cluster_namespace : Types::EksSourceClusterNamespace?

        # The number of resources.
        @[JSON::Field(key: "resourceCount")]
        getter resource_count : Int32?

        # The Amazon Resource Name (ARN) of the input source. For more information about ARNs, see Amazon
        # Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String?

        # The name of the input source.
        @[JSON::Field(key: "sourceName")]
        getter source_name : String?

        # The name of the Terraform s3 state ﬁle.
        @[JSON::Field(key: "terraformSource")]
        getter terraform_source : Types::TerraformSource?

        def initialize(
          @import_type : String,
          @eks_source_cluster_namespace : Types::EksSourceClusterNamespace? = nil,
          @resource_count : Int32? = nil,
          @source_arn : String? = nil,
          @source_name : String? = nil,
          @terraform_source : Types::TerraformSource? = nil
        )
        end
      end

      # Defines an application summary.
      struct AppSummary
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Date and time when the app was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The name of the application.
        @[JSON::Field(key: "name")]
        getter name : String

        # Assessment execution schedule with 'Daily' or 'Disabled' values.
        @[JSON::Field(key: "assessmentSchedule")]
        getter assessment_schedule : String?

        # Amazon Resource Name (ARN) of Resource Groups group that is integrated with an AppRegistry
        # application. For more information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web
        # Services General Reference guide.
        @[JSON::Field(key: "awsApplicationArn")]
        getter aws_application_arn : String?

        # The current status of compliance for the resiliency policy.
        @[JSON::Field(key: "complianceStatus")]
        getter compliance_status : String?

        # The optional description for an app.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates if compliance drifts (deviations) were detected while running an assessment for your
        # application.
        @[JSON::Field(key: "driftStatus")]
        getter drift_status : String?

        # Date and time of the most recent compliance evaluation.
        @[JSON::Field(key: "lastAppComplianceEvaluationTime")]
        getter last_app_compliance_evaluation_time : Time?

        # The current resiliency score for the application.
        @[JSON::Field(key: "resiliencyScore")]
        getter resiliency_score : Float64?

        # Recovery Point Objective (RPO) in seconds.
        @[JSON::Field(key: "rpoInSecs")]
        getter rpo_in_secs : Int32?

        # Recovery Time Objective (RTO) in seconds.
        @[JSON::Field(key: "rtoInSecs")]
        getter rto_in_secs : Int32?

        # Status of the application.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_arn : String,
          @creation_time : Time,
          @name : String,
          @assessment_schedule : String? = nil,
          @aws_application_arn : String? = nil,
          @compliance_status : String? = nil,
          @description : String? = nil,
          @drift_status : String? = nil,
          @last_app_compliance_evaluation_time : Time? = nil,
          @resiliency_score : Float64? = nil,
          @rpo_in_secs : Int32? = nil,
          @rto_in_secs : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      # Version of an application.
      struct AppVersionSummary
        include JSON::Serializable

        # Version of an application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Creation time of the application version.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Identifier of the application version.
        @[JSON::Field(key: "identifier")]
        getter identifier : Int64?

        # Name of the application version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        def initialize(
          @app_version : String,
          @creation_time : Time? = nil,
          @identifier : Int64? = nil,
          @version_name : String? = nil
        )
        end
      end

      # Indicates a specific risk identified in the Resilience Hub assessment and the corresponding
      # recommendation provided to address that risk. The assessment summary generated by large language
      # models (LLMs) on Amazon Bedrock are only suggestions. The current level of generative AI technology
      # is not perfect and LLMs are not infallible. Bias and incorrect answers, although rare, should be
      # expected. Review each recommendation in the assessment summary before you use the output from an
      # LLM. This property is available only in the US East (N. Virginia) Region.
      struct AssessmentRiskRecommendation
        include JSON::Serializable

        # Indicates the Application Components (AppComponents) that were assessed as part of the assessment
        # and are associated with the identified risk and recommendation. This property is available only in
        # the US East (N. Virginia) Region.
        @[JSON::Field(key: "appComponents")]
        getter app_components : Array(String)?

        # Indicates the recommendation provided by the Resilience Hub to address the identified risks in the
        # application. This property is available only in the US East (N. Virginia) Region.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : String?

        # Indicates the description of the potential risk identified in the application as part of the
        # Resilience Hub assessment. This property is available only in the US East (N. Virginia) Region.
        @[JSON::Field(key: "risk")]
        getter risk : String?

        def initialize(
          @app_components : Array(String)? = nil,
          @recommendation : String? = nil,
          @risk : String? = nil
        )
        end
      end

      # Indicates the AI-generated summary for the Resilience Hub assessment, providing a concise overview
      # that highlights the top risks and recommendations. This property is available only in the US East
      # (N. Virginia) Region.
      struct AssessmentSummary
        include JSON::Serializable

        # Indicates the top risks and recommendations identified by the Resilience Hub assessment, each
        # representing a specific risk and the corresponding recommendation to address it. This property is
        # available only in the US East (N. Virginia) Region.
        @[JSON::Field(key: "riskRecommendations")]
        getter risk_recommendations : Array(Types::AssessmentRiskRecommendation)?

        # Indicates a concise summary that provides an overview of the Resilience Hub assessment. This
        # property is available only in the US East (N. Virginia) Region.
        @[JSON::Field(key: "summary")]
        getter summary : String?

        def initialize(
          @risk_recommendations : Array(Types::AssessmentRiskRecommendation)? = nil,
          @summary : String? = nil
        )
        end
      end

      # List of operational recommendations that did not get included or excluded.
      struct BatchUpdateRecommendationStatusFailedEntry
        include JSON::Serializable

        # An identifier of an entry in this batch that is used to communicate the result. The entryId s of a
        # batch request need to be unique within a request.
        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # Indicates the error that occurred while excluding an operational recommendation.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        def initialize(
          @entry_id : String,
          @error_message : String
        )
        end
      end

      struct BatchUpdateRecommendationStatusRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Defines the list of operational recommendations that need to be included or excluded.
        @[JSON::Field(key: "requestEntries")]
        getter request_entries : Array(Types::UpdateRecommendationStatusRequestEntry)

        def initialize(
          @app_arn : String,
          @request_entries : Array(Types::UpdateRecommendationStatusRequestEntry)
        )
        end
      end

      struct BatchUpdateRecommendationStatusResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # A list of items with error details about each item, which could not be included or excluded.
        @[JSON::Field(key: "failedEntries")]
        getter failed_entries : Array(Types::BatchUpdateRecommendationStatusFailedEntry)

        # A list of items that were included or excluded.
        @[JSON::Field(key: "successfulEntries")]
        getter successful_entries : Array(Types::BatchUpdateRecommendationStatusSuccessfulEntry)

        def initialize(
          @app_arn : String,
          @failed_entries : Array(Types::BatchUpdateRecommendationStatusFailedEntry),
          @successful_entries : Array(Types::BatchUpdateRecommendationStatusSuccessfulEntry)
        )
        end
      end

      # List of operational recommendations that were successfully included or excluded.
      struct BatchUpdateRecommendationStatusSuccessfulEntry
        include JSON::Serializable

        # An identifier for an entry in this batch that is used to communicate the result. The entryId s of a
        # batch request need to be unique within a request.
        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # Indicates if the operational recommendation was successfully excluded.
        @[JSON::Field(key: "excluded")]
        getter excluded : Bool

        # Reference identifier of the operational recommendation.
        @[JSON::Field(key: "referenceId")]
        getter reference_id : String

        # Indicates the identifier of an AppComponent.
        @[JSON::Field(key: "appComponentId")]
        getter app_component_id : String?

        # Indicates the reason for excluding an operational recommendation.
        @[JSON::Field(key: "excludeReason")]
        getter exclude_reason : String?

        # The operational recommendation item.
        @[JSON::Field(key: "item")]
        getter item : Types::UpdateRecommendationStatusItem?

        def initialize(
          @entry_id : String,
          @excluded : Bool,
          @reference_id : String,
          @app_component_id : String? = nil,
          @exclude_reason : String? = nil,
          @item : Types::UpdateRecommendationStatusItem? = nil
        )
        end
      end

      # Indicates the compliance drifts (recovery time objective (RTO) and recovery point objective (RPO))
      # that were detected for an assessed entity.
      struct ComplianceDrift
        include JSON::Serializable

        # Assessment identifier that is associated with this drift item.
        @[JSON::Field(key: "actualReferenceId")]
        getter actual_reference_id : String?

        # Actual compliance value of the entity.
        @[JSON::Field(key: "actualValue")]
        getter actual_value : Hash(String, Types::DisruptionCompliance)?

        # Identifier of your application.
        @[JSON::Field(key: "appId")]
        getter app_id : String?

        # Published version of your application on which drift was detected.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String?

        # Difference type between actual and expected recovery point objective (RPO) and recovery time
        # objective (RTO) values. Currently, Resilience Hub supports only NotEqual difference type.
        @[JSON::Field(key: "diffType")]
        getter diff_type : String?

        # The type of drift detected. Currently, Resilience Hub supports only ApplicationCompliance drift
        # type.
        @[JSON::Field(key: "driftType")]
        getter drift_type : String?

        # Identifier of an entity in which drift was detected. For compliance drift, the entity ID can be
        # either application ID or the AppComponent ID.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # The type of entity in which drift was detected. For compliance drifts, Resilience Hub supports
        # AWS::ResilienceHub::AppComponent and AWS::ResilienceHub::Application .
        @[JSON::Field(key: "entityType")]
        getter entity_type : String?

        # Assessment identifier of a previous assessment of the same application version. Resilience Hub uses
        # the previous assessment (associated with the reference identifier) to compare the compliance with
        # the current assessment to identify drifts.
        @[JSON::Field(key: "expectedReferenceId")]
        getter expected_reference_id : String?

        # The expected compliance value of an entity.
        @[JSON::Field(key: "expectedValue")]
        getter expected_value : Hash(String, Types::DisruptionCompliance)?

        def initialize(
          @actual_reference_id : String? = nil,
          @actual_value : Hash(String, Types::DisruptionCompliance)? = nil,
          @app_id : String? = nil,
          @app_version : String? = nil,
          @diff_type : String? = nil,
          @drift_type : String? = nil,
          @entity_id : String? = nil,
          @entity_type : String? = nil,
          @expected_reference_id : String? = nil,
          @expected_value : Hash(String, Types::DisruptionCompliance)? = nil
        )
        end
      end

      # Defines recommendations for an Resilience Hub Application Component, returned as an object. This
      # object contains component names, configuration recommendations, and recommendation statuses.
      struct ComponentRecommendation
        include JSON::Serializable

        # Name of the Application Component.
        @[JSON::Field(key: "appComponentName")]
        getter app_component_name : String

        # List of recommendations.
        @[JSON::Field(key: "configRecommendations")]
        getter config_recommendations : Array(Types::ConfigRecommendation)

        # Status of the recommendation.
        @[JSON::Field(key: "recommendationStatus")]
        getter recommendation_status : String

        def initialize(
          @app_component_name : String,
          @config_recommendations : Array(Types::ConfigRecommendation),
          @recommendation_status : String
        )
        end
      end

      # Indicates the condition based on which you want to filter the metrics.
      struct Condition
        include JSON::Serializable

        # Indicates the field in the metric.
        @[JSON::Field(key: "field")]
        getter field : String

        # Indicates the type of operator or comparison to be used when evaluating a condition against the
        # specified field.
        @[JSON::Field(key: "operator")]
        getter operator : String

        # Indicates the value or data against which a condition is evaluated.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @field : String,
          @operator : String,
          @value : String? = nil
        )
        end
      end

      # Defines a recommendation configuration.
      struct ConfigRecommendation
        include JSON::Serializable

        # The name of the recommendation configuration.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of optimization.
        @[JSON::Field(key: "optimizationType")]
        getter optimization_type : String

        # Reference identifier for the recommendation configuration.
        @[JSON::Field(key: "referenceId")]
        getter reference_id : String

        # Name of the Application Component.
        @[JSON::Field(key: "appComponentName")]
        getter app_component_name : String?

        # The current compliance against the resiliency policy before applying the configuration change.
        @[JSON::Field(key: "compliance")]
        getter compliance : Hash(String, Types::DisruptionCompliance)?

        # The cost for the application.
        @[JSON::Field(key: "cost")]
        getter cost : Types::Cost?

        # The optional description for an app.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The architecture type.
        @[JSON::Field(key: "haArchitecture")]
        getter ha_architecture : String?

        # The expected compliance against the resiliency policy after applying the configuration change.
        @[JSON::Field(key: "recommendationCompliance")]
        getter recommendation_compliance : Hash(String, Types::RecommendationDisruptionCompliance)?

        # List of the suggested configuration changes.
        @[JSON::Field(key: "suggestedChanges")]
        getter suggested_changes : Array(String)?

        def initialize(
          @name : String,
          @optimization_type : String,
          @reference_id : String,
          @app_component_name : String? = nil,
          @compliance : Hash(String, Types::DisruptionCompliance)? = nil,
          @cost : Types::Cost? = nil,
          @description : String? = nil,
          @ha_architecture : String? = nil,
          @recommendation_compliance : Hash(String, Types::RecommendationDisruptionCompliance)? = nil,
          @suggested_changes : Array(String)? = nil
        )
        end
      end

      # This exception occurs when a conflict with a previous successful write is detected. This generally
      # occurs when the previous write did not have time to propagate to the host serving the current
      # request. A retry (with appropriate backoff logic) is the recommended response to this exception.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The identifier of the resource that the exception applies to.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource that the exception applies to.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Defines a cost object.
      struct Cost
        include JSON::Serializable

        # The cost amount.
        @[JSON::Field(key: "amount")]
        getter amount : Float64

        # The cost currency, for example USD .
        @[JSON::Field(key: "currency")]
        getter currency : String

        # The cost frequency.
        @[JSON::Field(key: "frequency")]
        getter frequency : String

        def initialize(
          @amount : Float64,
          @currency : String,
          @frequency : String
        )
        end
      end

      struct CreateAppRequest
        include JSON::Serializable

        # Name of the application.
        @[JSON::Field(key: "name")]
        getter name : String

        # Assessment execution schedule with 'Daily' or 'Disabled' values.
        @[JSON::Field(key: "assessmentSchedule")]
        getter assessment_schedule : String?

        # Amazon Resource Name (ARN) of Resource Groups group that is integrated with an AppRegistry
        # application. For more information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web
        # Services General Reference guide.
        @[JSON::Field(key: "awsApplicationArn")]
        getter aws_application_arn : String?

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The optional description for an app.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The list of events you would like to subscribe and get notification for. Currently, Resilience Hub
        # supports only Drift detected and Scheduled assessment failure events notification.
        @[JSON::Field(key: "eventSubscriptions")]
        getter event_subscriptions : Array(Types::EventSubscription)?

        # Defines the roles and credentials that Resilience Hub would use while creating the application,
        # importing its resources, and running an assessment.
        @[JSON::Field(key: "permissionModel")]
        getter permission_model : Types::PermissionModel?

        # Amazon Resource Name (ARN) of the resiliency policy. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :resiliency-policy/ policy-id . For more information about ARNs,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String?

        # Tags assigned to the resource. A tag is a label that you assign to an Amazon Web Services resource.
        # Each tag consists of a key/value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @assessment_schedule : String? = nil,
          @aws_application_arn : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @event_subscriptions : Array(Types::EventSubscription)? = nil,
          @permission_model : Types::PermissionModel? = nil,
          @policy_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAppResponse
        include JSON::Serializable

        # The created application returned as an object with details including compliance status, creation
        # time, description, resiliency score, and more.
        @[JSON::Field(key: "app")]
        getter app : Types::App

        def initialize(
          @app : Types::App
        )
        end
      end

      struct CreateAppVersionAppComponentRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Name of the Application Component.
        @[JSON::Field(key: "name")]
        getter name : String

        # Type of Application Component. For more information about the types of Application Component, see
        # Grouping resources in an AppComponent .
        @[JSON::Field(key: "type")]
        getter type : String

        # Currently, there is no supported additional information for Application Components.
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Hash(String, Array(String))?

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Identifier of the Application Component.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @app_arn : String,
          @name : String,
          @type : String,
          @additional_info : Hash(String, Array(String))? = nil,
          @client_token : String? = nil,
          @id : String? = nil
        )
        end
      end

      struct CreateAppVersionAppComponentResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # List of Application Components that belong to this resource.
        @[JSON::Field(key: "appComponent")]
        getter app_component : Types::AppComponent?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @app_component : Types::AppComponent? = nil
        )
        end
      end

      struct CreateAppVersionResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # List of Application Components that this resource belongs to. If an Application Component is not
        # part of the Resilience Hub application, it will be added.
        @[JSON::Field(key: "appComponents")]
        getter app_components : Array(String)

        # Logical identifier of the resource.
        @[JSON::Field(key: "logicalResourceId")]
        getter logical_resource_id : Types::LogicalResourceId

        # Physical identifier of the resource.
        @[JSON::Field(key: "physicalResourceId")]
        getter physical_resource_id : String

        # Type of resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Currently, there is no supported additional information for resources.
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Hash(String, Array(String))?

        # Amazon Web Services account that owns the physical resource.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # Amazon Web Services region that owns the physical resource.
        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Name of the resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @app_arn : String,
          @app_components : Array(String),
          @logical_resource_id : Types::LogicalResourceId,
          @physical_resource_id : String,
          @resource_type : String,
          @additional_info : Hash(String, Array(String))? = nil,
          @aws_account_id : String? = nil,
          @aws_region : String? = nil,
          @client_token : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct CreateAppVersionResourceResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Defines a physical resource. A physical resource is a resource that exists in your account. It can
        # be identified using an Amazon Resource Name (ARN) or a Resilience Hub-native identifier.
        @[JSON::Field(key: "physicalResource")]
        getter physical_resource : Types::PhysicalResource?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @physical_resource : Types::PhysicalResource? = nil
        )
        end
      end

      struct CreateRecommendationTemplateRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # The name for the recommendation template.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the Amazon S3 bucket that will contain the recommendation template.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The format for the recommendation template. CfnJson The template is CloudFormation JSON. CfnYaml The
        # template is CloudFormation YAML.
        @[JSON::Field(key: "format")]
        getter format : String?

        # Identifiers for the recommendations used to create a recommendation template.
        @[JSON::Field(key: "recommendationIds")]
        getter recommendation_ids : Array(String)?

        # An array of strings that specify the recommendation template type or types. Alarm The template is an
        # AlarmRecommendation template. Sop The template is a SopRecommendation template. Test The template is
        # a TestRecommendation template.
        @[JSON::Field(key: "recommendationTypes")]
        getter recommendation_types : Array(String)?

        # Tags assigned to the resource. A tag is a label that you assign to an Amazon Web Services resource.
        # Each tag consists of a key/value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assessment_arn : String,
          @name : String,
          @bucket_name : String? = nil,
          @client_token : String? = nil,
          @format : String? = nil,
          @recommendation_ids : Array(String)? = nil,
          @recommendation_types : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateRecommendationTemplateResponse
        include JSON::Serializable

        # The newly created recommendation template, returned as an object. This object includes the
        # template's name, format, status, tags, Amazon S3 bucket location, and more.
        @[JSON::Field(key: "recommendationTemplate")]
        getter recommendation_template : Types::RecommendationTemplate?

        def initialize(
          @recommendation_template : Types::RecommendationTemplate? = nil
        )
        end
      end

      struct CreateResiliencyPolicyRequest
        include JSON::Serializable

        # The type of resiliency policy to be created, including the recovery time objective (RTO) and
        # recovery point objective (RPO) in seconds.
        @[JSON::Field(key: "policy")]
        getter policy : Hash(String, Types::FailurePolicy)

        # Name of the resiliency policy.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        # The tier for this resiliency policy, ranging from the highest severity ( MissionCritical ) to lowest
        # ( NonCritical ).
        @[JSON::Field(key: "tier")]
        getter tier : String

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies a high-level geographical location constraint for where your resilience policy data can be
        # stored.
        @[JSON::Field(key: "dataLocationConstraint")]
        getter data_location_constraint : String?

        # Description of the resiliency policy.
        @[JSON::Field(key: "policyDescription")]
        getter policy_description : String?

        # Tags assigned to the resource. A tag is a label that you assign to an Amazon Web Services resource.
        # Each tag consists of a key/value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @policy : Hash(String, Types::FailurePolicy),
          @policy_name : String,
          @tier : String,
          @client_token : String? = nil,
          @data_location_constraint : String? = nil,
          @policy_description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateResiliencyPolicyResponse
        include JSON::Serializable

        # The type of resiliency policy that was created, including the recovery time objective (RTO) and
        # recovery point objective (RPO) in seconds.
        @[JSON::Field(key: "policy")]
        getter policy : Types::ResiliencyPolicy

        def initialize(
          @policy : Types::ResiliencyPolicy
        )
        end
      end

      struct DeleteAppAssessmentRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @assessment_arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteAppAssessmentResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # The current status of the assessment for the resiliency policy.
        @[JSON::Field(key: "assessmentStatus")]
        getter assessment_status : String

        def initialize(
          @assessment_arn : String,
          @assessment_status : String
        )
        end
      end

      struct DeleteAppInputSourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The namespace on your Amazon Elastic Kubernetes Service cluster that you want to delete from the
        # Resilience Hub application.
        @[JSON::Field(key: "eksSourceClusterNamespace")]
        getter eks_source_cluster_namespace : Types::EksSourceClusterNamespace?

        # The Amazon Resource Name (ARN) of the imported resource you want to remove from the Resilience Hub
        # application. For more information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web
        # Services General Reference guide.
        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String?

        # The imported Terraform s3 state ﬁle you want to remove from the Resilience Hub application.
        @[JSON::Field(key: "terraformSource")]
        getter terraform_source : Types::TerraformSource?

        def initialize(
          @app_arn : String,
          @client_token : String? = nil,
          @eks_source_cluster_namespace : Types::EksSourceClusterNamespace? = nil,
          @source_arn : String? = nil,
          @terraform_source : Types::TerraformSource? = nil
        )
        end
      end

      struct DeleteAppInputSourceResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String?

        # Name of the input source from where the application resource is imported from.
        @[JSON::Field(key: "appInputSource")]
        getter app_input_source : Types::AppInputSource?

        def initialize(
          @app_arn : String? = nil,
          @app_input_source : Types::AppInputSource? = nil
        )
        end
      end

      struct DeleteAppRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A boolean option to force the deletion of an Resilience Hub application.
        @[JSON::Field(key: "forceDelete")]
        getter force_delete : Bool?

        def initialize(
          @app_arn : String,
          @client_token : String? = nil,
          @force_delete : Bool? = nil
        )
        end
      end

      struct DeleteAppResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        def initialize(
          @app_arn : String
        )
        end
      end

      struct DeleteAppVersionAppComponentRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Identifier of the Application Component.
        @[JSON::Field(key: "id")]
        getter id : String

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @app_arn : String,
          @id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteAppVersionAppComponentResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # List of Application Components that belong to this resource.
        @[JSON::Field(key: "appComponent")]
        getter app_component : Types::AppComponent?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @app_component : Types::AppComponent? = nil
        )
        end
      end

      struct DeleteAppVersionResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Amazon Web Services account that owns the physical resource.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # Amazon Web Services region that owns the physical resource.
        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Logical identifier of the resource.
        @[JSON::Field(key: "logicalResourceId")]
        getter logical_resource_id : Types::LogicalResourceId?

        # Physical identifier of the resource.
        @[JSON::Field(key: "physicalResourceId")]
        getter physical_resource_id : String?

        # Name of the resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @app_arn : String,
          @aws_account_id : String? = nil,
          @aws_region : String? = nil,
          @client_token : String? = nil,
          @logical_resource_id : Types::LogicalResourceId? = nil,
          @physical_resource_id : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct DeleteAppVersionResourceResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Defines a physical resource. A physical resource is a resource that exists in your account. It can
        # be identified using an Amazon Resource Name (ARN) or a Resilience Hub-native identifier.
        @[JSON::Field(key: "physicalResource")]
        getter physical_resource : Types::PhysicalResource?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @physical_resource : Types::PhysicalResource? = nil
        )
        end
      end

      struct DeleteRecommendationTemplateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for a recommendation template.
        @[JSON::Field(key: "recommendationTemplateArn")]
        getter recommendation_template_arn : String

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @recommendation_template_arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteRecommendationTemplateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for a recommendation template.
        @[JSON::Field(key: "recommendationTemplateArn")]
        getter recommendation_template_arn : String

        # Status of the action.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @recommendation_template_arn : String,
          @status : String
        )
        end
      end

      struct DeleteResiliencyPolicyRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resiliency policy. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :resiliency-policy/ policy-id . For more information about ARNs,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @policy_arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteResiliencyPolicyResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resiliency policy. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :resiliency-policy/ policy-id . For more information about ARNs,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @policy_arn : String
        )
        end
      end

      struct DescribeAppAssessmentRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        def initialize(
          @assessment_arn : String
        )
        end
      end

      struct DescribeAppAssessmentResponse
        include JSON::Serializable

        # The assessment for an Resilience Hub application, returned as an object. This object includes Amazon
        # Resource Names (ARNs), compliance information, compliance status, cost, messages, resiliency scores,
        # and more.
        @[JSON::Field(key: "assessment")]
        getter assessment : Types::AppAssessment

        def initialize(
          @assessment : Types::AppAssessment
        )
        end
      end

      struct DescribeAppRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        def initialize(
          @app_arn : String
        )
        end
      end

      struct DescribeAppResponse
        include JSON::Serializable

        # The specified application, returned as an object with details including compliance status, creation
        # time, description, resiliency score, and more.
        @[JSON::Field(key: "app")]
        getter app : Types::App

        def initialize(
          @app : Types::App
        )
        end
      end

      struct DescribeAppVersionAppComponentRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Identifier of the Application Component.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @app_arn : String,
          @app_version : String,
          @id : String
        )
        end
      end

      struct DescribeAppVersionAppComponentResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # List of Application Components that belong to this resource.
        @[JSON::Field(key: "appComponent")]
        getter app_component : Types::AppComponent?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @app_component : Types::AppComponent? = nil
        )
        end
      end

      struct DescribeAppVersionRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        def initialize(
          @app_arn : String,
          @app_version : String
        )
        end
      end

      struct DescribeAppVersionResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Amazon Web Services account that owns the physical resource.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # Amazon Web Services region that owns the physical resource.
        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        # Logical identifier of the resource.
        @[JSON::Field(key: "logicalResourceId")]
        getter logical_resource_id : Types::LogicalResourceId?

        # Physical identifier of the resource.
        @[JSON::Field(key: "physicalResourceId")]
        getter physical_resource_id : String?

        # Name of the resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @aws_account_id : String? = nil,
          @aws_region : String? = nil,
          @logical_resource_id : Types::LogicalResourceId? = nil,
          @physical_resource_id : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct DescribeAppVersionResourceResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Defines a physical resource. A physical resource is a resource that exists in your account. It can
        # be identified using an Amazon Resource Name (ARN) or a Resilience Hub-native identifier.
        @[JSON::Field(key: "physicalResource")]
        getter physical_resource : Types::PhysicalResource?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @physical_resource : Types::PhysicalResource? = nil
        )
        end
      end

      struct DescribeAppVersionResourcesResolutionStatusRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # The identifier for a specific resolution.
        @[JSON::Field(key: "resolutionId")]
        getter resolution_id : String?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @resolution_id : String? = nil
        )
        end
      end

      struct DescribeAppVersionResourcesResolutionStatusResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # The identifier for a specific resolution.
        @[JSON::Field(key: "resolutionId")]
        getter resolution_id : String

        # Status of the action.
        @[JSON::Field(key: "status")]
        getter status : String

        # The returned error message for the request.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @resolution_id : String,
          @status : String,
          @error_message : String? = nil
        )
        end
      end

      struct DescribeAppVersionResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Additional configuration parameters for an Resilience Hub application. If you want to implement
        # additionalInfo through the Resilience Hub console rather than using an API call, see Configure the
        # application configuration parameters . Currently, this parameter supports only failover region and
        # account.
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Hash(String, Array(String))?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @additional_info : Hash(String, Array(String))? = nil
        )
        end
      end

      struct DescribeAppVersionTemplateRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        def initialize(
          @app_arn : String,
          @app_version : String
        )
        end
      end

      struct DescribeAppVersionTemplateResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # A JSON string that provides information about your application structure. To learn more about the
        # appTemplateBody template, see the sample template provided in the Examples section. The
        # appTemplateBody JSON string has the following structure: resources The list of logical resources
        # that must be included in the Resilience Hub application. Type: Array Don't add the resources that
        # you want to exclude. Each resources array item includes the following fields: logicalResourceId
        # Logical identifier of the resource. Type: Object Each logicalResourceId object includes the
        # following fields: identifier Identifier of the resource. Type: String logicalStackName The name of
        # the CloudFormation stack this resource belongs to. Type: String resourceGroupName The name of the
        # resource group this resource belongs to. Type: String terraformSourceName The name of the Terraform
        # S3 state file this resource belongs to. Type: String eksSourceName Name of the Amazon Elastic
        # Kubernetes Service cluster and namespace this resource belongs to. This parameter accepts values in
        # "eks-cluster/namespace" format. Type: String type The type of resource. Type: string name The name
        # of the resource. Type: String additionalInfo Additional configuration parameters for an Resilience
        # Hub application. If you want to implement additionalInfo through the Resilience Hub console rather
        # than using an API call, see Configure the application configuration parameters . Currently, this
        # parameter accepts a key-value mapping (in a string format) of only one failover region and one
        # associated account. Key: "failover-regions" Value: "[{"region":"&lt;REGION&gt;",
        # "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]" appComponents List of Application Components that this
        # resource belongs to. If an Application Component is not part of the Resilience Hub application, it
        # will be added. Type: Array Each appComponents array item includes the following fields: name Name of
        # the Application Component. Type: String type Type of Application Component. For more information
        # about the types of Application Component, see Grouping resources in an AppComponent . Type: String
        # resourceNames The list of included resources that are assigned to the Application Component. Type:
        # Array of strings additionalInfo Additional configuration parameters for an Resilience Hub
        # application. If you want to implement additionalInfo through the Resilience Hub console rather than
        # using an API call, see Configure the application configuration parameters . Currently, this
        # parameter accepts a key-value mapping (in a string format) of only one failover region and one
        # associated account. Key: "failover-regions" Value: "[{"region":"&lt;REGION&gt;",
        # "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]" excludedResources The list of logical resource
        # identifiers to be excluded from the application. Type: Array Don't add the resources that you want
        # to include. Each excludedResources array item includes the following fields: logicalResourceIds
        # Logical identifier of the resource. Type: Object You can configure only one of the following fields:
        # logicalStackName resourceGroupName terraformSourceName eksSourceName Each logicalResourceIds object
        # includes the following fields: identifier Identifier of the resource. Type: String logicalStackName
        # The name of the CloudFormation stack this resource belongs to. Type: String resourceGroupName The
        # name of the resource group this resource belongs to. Type: String terraformSourceName The name of
        # the Terraform S3 state file this resource belongs to. Type: String eksSourceName Name of the Amazon
        # Elastic Kubernetes Service cluster and namespace this resource belongs to. This parameter accepts
        # values in "eks-cluster/namespace" format. Type: String version Resilience Hub application version.
        # additionalInfo Additional configuration parameters for an Resilience Hub application. If you want to
        # implement additionalInfo through the Resilience Hub console rather than using an API call, see
        # Configure the application configuration parameters . Currently, this parameter accepts a key-value
        # mapping (in a string format) of only one failover region and one associated account. Key:
        # "failover-regions" Value: "[{"region":"&lt;REGION&gt;", "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"
        @[JSON::Field(key: "appTemplateBody")]
        getter app_template_body : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        def initialize(
          @app_arn : String,
          @app_template_body : String,
          @app_version : String
        )
        end
      end

      struct DescribeDraftAppVersionResourcesImportStatusRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        def initialize(
          @app_arn : String
        )
        end
      end

      struct DescribeDraftAppVersionResourcesImportStatusResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Status of the action.
        @[JSON::Field(key: "status")]
        getter status : String

        # The time when the status last changed.
        @[JSON::Field(key: "statusChangeTime")]
        getter status_change_time : Time

        # List of errors that were encountered while importing resources.
        @[JSON::Field(key: "errorDetails")]
        getter error_details : Array(Types::ErrorDetail)?

        # The error message returned for the resource request.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @status : String,
          @status_change_time : Time,
          @error_details : Array(Types::ErrorDetail)? = nil,
          @error_message : String? = nil
        )
        end
      end

      struct DescribeMetricsExportRequest
        include JSON::Serializable

        # Identifier of the metrics export task.
        @[JSON::Field(key: "metricsExportId")]
        getter metrics_export_id : String

        def initialize(
          @metrics_export_id : String
        )
        end
      end

      struct DescribeMetricsExportResponse
        include JSON::Serializable

        # Identifier for the metrics export task.
        @[JSON::Field(key: "metricsExportId")]
        getter metrics_export_id : String

        # Indicates the status of the metrics export task.
        @[JSON::Field(key: "status")]
        getter status : String

        # Explains the error that occurred while exporting the metrics.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # Specifies the name of the Amazon S3 bucket where the exported metrics is stored.
        @[JSON::Field(key: "exportLocation")]
        getter export_location : Types::S3Location?

        def initialize(
          @metrics_export_id : String,
          @status : String,
          @error_message : String? = nil,
          @export_location : Types::S3Location? = nil
        )
        end
      end

      struct DescribeResiliencyPolicyRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resiliency policy. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :resiliency-policy/ policy-id . For more information about ARNs,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @policy_arn : String
        )
        end
      end

      struct DescribeResiliencyPolicyResponse
        include JSON::Serializable

        # Information about the specific resiliency policy, returned as an object. This object includes
        # creation time, data location constraints, its name, description, tags, the recovery time objective
        # (RTO) and recovery point objective (RPO) in seconds, and more.
        @[JSON::Field(key: "policy")]
        getter policy : Types::ResiliencyPolicy

        def initialize(
          @policy : Types::ResiliencyPolicy
        )
        end
      end

      struct DescribeResourceGroupingRecommendationTaskRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Identifier of the grouping recommendation task.
        @[JSON::Field(key: "groupingId")]
        getter grouping_id : String?

        def initialize(
          @app_arn : String,
          @grouping_id : String? = nil
        )
        end
      end

      struct DescribeResourceGroupingRecommendationTaskResponse
        include JSON::Serializable

        # Identifier of the grouping recommendation task.
        @[JSON::Field(key: "groupingId")]
        getter grouping_id : String

        # Status of the action.
        @[JSON::Field(key: "status")]
        getter status : String

        # Error that occurred while generating a grouping recommendation.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @grouping_id : String,
          @status : String,
          @error_message : String? = nil
        )
        end
      end

      # Defines the compliance against the resiliency policy for a disruption.
      struct DisruptionCompliance
        include JSON::Serializable

        # The current status of compliance for the resiliency policy.
        @[JSON::Field(key: "complianceStatus")]
        getter compliance_status : String

        # The Recovery Point Objective (RPO) that is achievable, in seconds.
        @[JSON::Field(key: "achievableRpoInSecs")]
        getter achievable_rpo_in_secs : Int32?

        # The Recovery Time Objective (RTO) that is achievable, in seconds
        @[JSON::Field(key: "achievableRtoInSecs")]
        getter achievable_rto_in_secs : Int32?

        # The current RPO, in seconds.
        @[JSON::Field(key: "currentRpoInSecs")]
        getter current_rpo_in_secs : Int32?

        # The current RTO, in seconds.
        @[JSON::Field(key: "currentRtoInSecs")]
        getter current_rto_in_secs : Int32?

        # The disruption compliance message.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The RPO description.
        @[JSON::Field(key: "rpoDescription")]
        getter rpo_description : String?

        # Reference identifier of the RPO .
        @[JSON::Field(key: "rpoReferenceId")]
        getter rpo_reference_id : String?

        # The RTO description.
        @[JSON::Field(key: "rtoDescription")]
        getter rto_description : String?

        # Reference identifier of the RTO.
        @[JSON::Field(key: "rtoReferenceId")]
        getter rto_reference_id : String?

        def initialize(
          @compliance_status : String,
          @achievable_rpo_in_secs : Int32? = nil,
          @achievable_rto_in_secs : Int32? = nil,
          @current_rpo_in_secs : Int32? = nil,
          @current_rto_in_secs : Int32? = nil,
          @message : String? = nil,
          @rpo_description : String? = nil,
          @rpo_reference_id : String? = nil,
          @rto_description : String? = nil,
          @rto_reference_id : String? = nil
        )
        end
      end

      # The input source of the Amazon Elastic Kubernetes Service cluster.
      struct EksSource
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Amazon Elastic Kubernetes Service cluster. The format for this ARN
        # is: arn: aws :eks: region : account-id :cluster/ cluster-name . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "eksClusterArn")]
        getter eks_cluster_arn : String

        # The list of namespaces located on your Amazon Elastic Kubernetes Service cluster.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)

        def initialize(
          @eks_cluster_arn : String,
          @namespaces : Array(String)
        )
        end
      end

      # The input source of the namespace that is located on your Amazon Elastic Kubernetes Service cluster.
      struct EksSourceClusterNamespace
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Amazon Elastic Kubernetes Service cluster. The format for this ARN
        # is: arn: aws :eks: region : account-id :cluster/ cluster-name . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "eksClusterArn")]
        getter eks_cluster_arn : String

        # Name of the namespace that is located on your Amazon Elastic Kubernetes Service cluster.
        @[JSON::Field(key: "namespace")]
        getter namespace : String

        def initialize(
          @eks_cluster_arn : String,
          @namespace : String
        )
        end
      end

      # Indicates the error that was encountered while importing a resource.
      struct ErrorDetail
        include JSON::Serializable

        # Provides additional information about the error.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @error_message : String? = nil
        )
        end
      end

      # Indicates an event you would like to subscribe and get notification for. Currently, Resilience Hub
      # supports notifications only for Drift detected and Scheduled assessment failure events.
      struct EventSubscription
        include JSON::Serializable

        # The type of event you would like to subscribe and get notification for. Currently, Resilience Hub
        # supports notifications only for Drift detected ( DriftDetected ) and Scheduled assessment failure (
        # ScheduledAssessmentFailure ) events.
        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # Unique name to identify an event subscription.
        @[JSON::Field(key: "name")]
        getter name : String

        # Amazon Resource Name (ARN) of the Amazon Simple Notification Service topic. The format for this ARN
        # is: arn:partition:sns:region:account:topic-name . For more information about ARNs, see Amazon
        # Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "snsTopicArn")]
        getter sns_topic_arn : String?

        def initialize(
          @event_type : String,
          @name : String,
          @sns_topic_arn : String? = nil
        )
        end
      end

      # Indicates the FIS experiment detected while running an assessment.
      struct Experiment
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the FIS experiment.
        @[JSON::Field(key: "experimentArn")]
        getter experiment_arn : String?

        # Identifier of the FIS experiment template.
        @[JSON::Field(key: "experimentTemplateId")]
        getter experiment_template_id : String?

        def initialize(
          @experiment_arn : String? = nil,
          @experiment_template_id : String? = nil
        )
        end
      end

      # Indicates the accepted grouping recommendation whose implementation failed.
      struct FailedGroupingRecommendationEntry
        include JSON::Serializable

        # Indicates the error that occurred while implementing a grouping recommendation.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # Indicates the identifier of the grouping recommendation.
        @[JSON::Field(key: "groupingRecommendationId")]
        getter grouping_recommendation_id : String

        def initialize(
          @error_message : String,
          @grouping_recommendation_id : String
        )
        end
      end

      # Defines a failure policy.
      struct FailurePolicy
        include JSON::Serializable

        # Recovery Point Objective (RPO) in seconds.
        @[JSON::Field(key: "rpoInSecs")]
        getter rpo_in_secs : Int32

        # Recovery Time Objective (RTO) in seconds.
        @[JSON::Field(key: "rtoInSecs")]
        getter rto_in_secs : Int32

        def initialize(
          @rpo_in_secs : Int32,
          @rto_in_secs : Int32
        )
        end
      end

      # Indicates the field or attribute of a resource or data structure on which a condition is being
      # applied or evaluated.
      struct Field
        include JSON::Serializable

        # Name of the field.
        @[JSON::Field(key: "name")]
        getter name : String

        # (Optional) Indicates the type of aggregation or summary operation (such as Sum, Average, and so on)
        # to be performed on a particular field or set of data.
        @[JSON::Field(key: "aggregation")]
        getter aggregation : String?

        def initialize(
          @name : String,
          @aggregation : String? = nil
        )
        end
      end

      # Creates a new recommended Application Component (AppComponent).
      struct GroupingAppComponent
        include JSON::Serializable

        # Indicates the identifier of an AppComponent.
        @[JSON::Field(key: "appComponentId")]
        getter app_component_id : String

        # Indicates the name of an AppComponent.
        @[JSON::Field(key: "appComponentName")]
        getter app_component_name : String

        # Indicates the type of an AppComponent.
        @[JSON::Field(key: "appComponentType")]
        getter app_component_type : String

        def initialize(
          @app_component_id : String,
          @app_component_name : String,
          @app_component_type : String
        )
        end
      end

      # Creates a new grouping recommendation.
      struct GroupingRecommendation
        include JSON::Serializable

        # Indicates the confidence level of Resilience Hub on the grouping recommendation.
        @[JSON::Field(key: "confidenceLevel")]
        getter confidence_level : String

        # Indicates the creation time of the grouping recommendation.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # Indicates the name of the recommended Application Component (AppComponent).
        @[JSON::Field(key: "groupingAppComponent")]
        getter grouping_app_component : Types::GroupingAppComponent

        # Indicates all the reasons available for rejecting a grouping recommendation.
        @[JSON::Field(key: "groupingRecommendationId")]
        getter grouping_recommendation_id : String

        # Indicates all the reasons available for rejecting a grouping recommendation.
        @[JSON::Field(key: "recommendationReasons")]
        getter recommendation_reasons : Array(String)

        # Indicates the resources that are grouped in a recommended AppComponent.
        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::GroupingResource)

        # Indicates the confidence level of the grouping recommendation.
        @[JSON::Field(key: "score")]
        getter score : Float64

        # Indicates the status of grouping resources into AppComponents.
        @[JSON::Field(key: "status")]
        getter status : String

        # Indicates the reason you had selected while rejecting a grouping recommendation.
        @[JSON::Field(key: "rejectionReason")]
        getter rejection_reason : String?

        def initialize(
          @confidence_level : String,
          @creation_time : Time,
          @grouping_app_component : Types::GroupingAppComponent,
          @grouping_recommendation_id : String,
          @recommendation_reasons : Array(String),
          @resources : Array(Types::GroupingResource),
          @score : Float64,
          @status : String,
          @rejection_reason : String? = nil
        )
        end
      end

      # Indicates the resource that will be grouped in the recommended Application Component (AppComponent).
      struct GroupingResource
        include JSON::Serializable

        # Indicates the logical identifier of the resource.
        @[JSON::Field(key: "logicalResourceId")]
        getter logical_resource_id : Types::LogicalResourceId

        # Indicates the physical identifier of the resource.
        @[JSON::Field(key: "physicalResourceId")]
        getter physical_resource_id : Types::PhysicalResourceId

        # Indicates the resource name.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        # Indicates the resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Indicates the identifier of the source AppComponents in which the resources were previously grouped
        # into.
        @[JSON::Field(key: "sourceAppComponentIds")]
        getter source_app_component_ids : Array(String)

        def initialize(
          @logical_resource_id : Types::LogicalResourceId,
          @physical_resource_id : Types::PhysicalResourceId,
          @resource_name : String,
          @resource_type : String,
          @source_app_component_ids : Array(String)
        )
        end
      end

      struct ImportResourcesToDraftAppVersionRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The input sources of the Amazon Elastic Kubernetes Service resources you need to import.
        @[JSON::Field(key: "eksSources")]
        getter eks_sources : Array(Types::EksSource)?

        # The import strategy you would like to set to import resources into Resilience Hub application.
        @[JSON::Field(key: "importStrategy")]
        getter import_strategy : String?

        # The Amazon Resource Names (ARNs) for the resources.
        @[JSON::Field(key: "sourceArns")]
        getter source_arns : Array(String)?

        # A list of terraform file s3 URLs you need to import.
        @[JSON::Field(key: "terraformSources")]
        getter terraform_sources : Array(Types::TerraformSource)?

        def initialize(
          @app_arn : String,
          @eks_sources : Array(Types::EksSource)? = nil,
          @import_strategy : String? = nil,
          @source_arns : Array(String)? = nil,
          @terraform_sources : Array(Types::TerraformSource)? = nil
        )
        end
      end

      struct ImportResourcesToDraftAppVersionResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Status of the action.
        @[JSON::Field(key: "status")]
        getter status : String

        # The input sources of the Amazon Elastic Kubernetes Service resources you have imported.
        @[JSON::Field(key: "eksSources")]
        getter eks_sources : Array(Types::EksSource)?

        # The Amazon Resource Names (ARNs) for the resources you have imported.
        @[JSON::Field(key: "sourceArns")]
        getter source_arns : Array(String)?

        # A list of terraform file s3 URLs you have imported.
        @[JSON::Field(key: "terraformSources")]
        getter terraform_sources : Array(Types::TerraformSource)?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @status : String,
          @eks_sources : Array(Types::EksSource)? = nil,
          @source_arns : Array(String)? = nil,
          @terraform_sources : Array(Types::TerraformSource)? = nil
        )
        end
      end

      # This exception occurs when there is an internal failure in the Resilience Hub service.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListAlarmRecommendationsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAlarmRecommendationsResponse
        include JSON::Serializable

        # The alarm recommendations for an Resilience Hub application, returned as an object. This object
        # includes Application Component names, descriptions, information about whether a recommendation has
        # already been implemented or not, prerequisites, and more.
        @[JSON::Field(key: "alarmRecommendations")]
        getter alarm_recommendations : Array(Types::AlarmRecommendation)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @alarm_recommendations : Array(Types::AlarmRecommendation),
          @next_token : String? = nil
        )
        end
      end

      struct ListAppAssessmentComplianceDriftsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # Maximum number of compliance drifts requested.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppAssessmentComplianceDriftsResponse
        include JSON::Serializable

        # Indicates compliance drifts (recovery time objective (RTO) and recovery point objective (RPO))
        # detected for an assessed entity.
        @[JSON::Field(key: "complianceDrifts")]
        getter compliance_drifts : Array(Types::ComplianceDrift)

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @compliance_drifts : Array(Types::ComplianceDrift),
          @next_token : String? = nil
        )
        end
      end

      struct ListAppAssessmentResourceDriftsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # Maximum number of drift results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppAssessmentResourceDriftsResponse
        include JSON::Serializable

        # Indicates all the resource drifts detected for an assessed entity.
        @[JSON::Field(key: "resourceDrifts")]
        getter resource_drifts : Array(Types::ResourceDrift)

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_drifts : Array(Types::ResourceDrift),
          @next_token : String? = nil
        )
        end
      end

      struct ListAppAssessmentsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String?

        # The name for the assessment.
        @[JSON::Field(key: "assessmentName")]
        getter assessment_name : String?

        # The current status of the assessment for the resiliency policy.
        @[JSON::Field(key: "assessmentStatus")]
        getter assessment_status : Array(String)?

        # The current status of compliance for the resiliency policy.
        @[JSON::Field(key: "complianceStatus")]
        getter compliance_status : String?

        # Specifies the entity that invoked a specific assessment, either a User or the System .
        @[JSON::Field(key: "invoker")]
        getter invoker : String?

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The default is to sort by ascending startTime . To sort by descending startTime , set reverseOrder
        # to true .
        @[JSON::Field(key: "reverseOrder")]
        getter reverse_order : Bool?

        def initialize(
          @app_arn : String? = nil,
          @assessment_name : String? = nil,
          @assessment_status : Array(String)? = nil,
          @compliance_status : String? = nil,
          @invoker : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @reverse_order : Bool? = nil
        )
        end
      end

      struct ListAppAssessmentsResponse
        include JSON::Serializable

        # The summaries for the specified assessments, returned as an object. This object includes application
        # versions, associated Amazon Resource Numbers (ARNs), cost, messages, resiliency scores, and more.
        @[JSON::Field(key: "assessmentSummaries")]
        getter assessment_summaries : Array(Types::AppAssessmentSummary)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_summaries : Array(Types::AppAssessmentSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListAppComponentCompliancesRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppComponentCompliancesResponse
        include JSON::Serializable

        # The compliances for an Resilience Hub Application Component, returned as an object. This object
        # contains the names of the Application Components, compliances, costs, resiliency scores, outage
        # scores, and more.
        @[JSON::Field(key: "componentCompliances")]
        getter component_compliances : Array(Types::AppComponentCompliance)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @component_compliances : Array(Types::AppComponentCompliance),
          @next_token : String? = nil
        )
        end
      end

      struct ListAppComponentRecommendationsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppComponentRecommendationsResponse
        include JSON::Serializable

        # The recommendations for an Resilience Hub Application Component, returned as an object. This object
        # contains the names of the Application Components, configuration recommendations, and recommendation
        # statuses.
        @[JSON::Field(key: "componentRecommendations")]
        getter component_recommendations : Array(Types::ComponentRecommendation)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @component_recommendations : Array(Types::ComponentRecommendation),
          @next_token : String? = nil
        )
        end
      end

      struct ListAppInputSourcesRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Maximum number of input sources to be displayed per Resilience Hub application.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppInputSourcesResponse
        include JSON::Serializable

        # The list of Resilience Hub application input sources.
        @[JSON::Field(key: "appInputSources")]
        getter app_input_sources : Array(Types::AppInputSource)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_input_sources : Array(Types::AppInputSource),
          @next_token : String? = nil
        )
        end
      end

      struct ListAppVersionAppComponentsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Version of the Application Component.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Maximum number of Application Components to be displayed per Resilience Hub application version.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppVersionAppComponentsResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Defines an Application Component.
        @[JSON::Field(key: "appComponents")]
        getter app_components : Array(Types::AppComponent)?

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @app_components : Array(Types::AppComponent)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppVersionResourceMappingsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppVersionResourceMappingsResponse
        include JSON::Serializable

        # Mappings used to map logical resources from the template to physical resources. You can use the
        # mapping type CFN_STACK if the application template uses a logical stack name. Or you can map
        # individual resources by using the mapping type RESOURCE . We recommend using the mapping type
        # CFN_STACK if the application is backed by a CloudFormation stack.
        @[JSON::Field(key: "resourceMappings")]
        getter resource_mappings : Array(Types::ResourceMapping)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_mappings : Array(Types::ResourceMapping),
          @next_token : String? = nil
        )
        end
      end

      struct ListAppVersionResourcesRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The identifier for a specific resolution.
        @[JSON::Field(key: "resolutionId")]
        getter resolution_id : String?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resolution_id : String? = nil
        )
        end
      end

      struct ListAppVersionResourcesResponse
        include JSON::Serializable

        # The physical resources in the application version.
        @[JSON::Field(key: "physicalResources")]
        getter physical_resources : Array(Types::PhysicalResource)

        # The ID for a specific resolution.
        @[JSON::Field(key: "resolutionId")]
        getter resolution_id : String

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @physical_resources : Array(Types::PhysicalResource),
          @resolution_id : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppVersionsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Upper limit of the time range to filter the application versions.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Lower limit of the time range to filter the application versions.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @app_arn : String,
          @end_time : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct ListAppVersionsResponse
        include JSON::Serializable

        # The version of the application.
        @[JSON::Field(key: "appVersions")]
        getter app_versions : Array(Types::AppVersionSummary)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_versions : Array(Types::AppVersionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListAppsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String?

        # Amazon Resource Name (ARN) of Resource Groups group that is integrated with an AppRegistry
        # application. For more information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web
        # Services General Reference guide.
        @[JSON::Field(key: "awsApplicationArn")]
        getter aws_application_arn : String?

        # Lower limit of the range that is used to filter applications based on their last assessment times.
        @[JSON::Field(key: "fromLastAssessmentTime")]
        getter from_last_assessment_time : Time?

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name for the one of the listed applications.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The application list is sorted based on the values of lastAppComplianceEvaluationTime field. By
        # default, application list is sorted in ascending order. To sort the application list in descending
        # order, set this field to True .
        @[JSON::Field(key: "reverseOrder")]
        getter reverse_order : Bool?

        # Upper limit of the range that is used to filter the applications based on their last assessment
        # times.
        @[JSON::Field(key: "toLastAssessmentTime")]
        getter to_last_assessment_time : Time?

        def initialize(
          @app_arn : String? = nil,
          @aws_application_arn : String? = nil,
          @from_last_assessment_time : Time? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @reverse_order : Bool? = nil,
          @to_last_assessment_time : Time? = nil
        )
        end
      end

      struct ListAppsResponse
        include JSON::Serializable

        # Summaries for the Resilience Hub application.
        @[JSON::Field(key: "appSummaries")]
        getter app_summaries : Array(Types::AppSummary)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_summaries : Array(Types::AppSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListMetricsRequest
        include JSON::Serializable

        # Indicates the list of all the conditions that were applied on the metrics.
        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::Condition)?

        # Indicates the data source of the metrics.
        @[JSON::Field(key: "dataSource")]
        getter data_source : String?

        # Indicates the list of fields in the data source.
        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::Field)?

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # (Optional) Indicates the order in which you want to sort the fields in the metrics. By default, the
        # fields are sorted in the ascending order.
        @[JSON::Field(key: "sorts")]
        getter sorts : Array(Types::Sort)?

        def initialize(
          @conditions : Array(Types::Condition)? = nil,
          @data_source : String? = nil,
          @fields : Array(Types::Field)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sorts : Array(Types::Sort)? = nil
        )
        end
      end

      struct ListMetricsResponse
        include JSON::Serializable

        # Specifies all the list of metric values for each row of metrics.
        @[JSON::Field(key: "rows")]
        getter rows : Array(Array(String))

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @rows : Array(Array(String)),
          @next_token : String? = nil
        )
        end
      end

      struct ListRecommendationTemplatesRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String?

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name for one of the listed recommendation templates.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) for a recommendation template.
        @[JSON::Field(key: "recommendationTemplateArn")]
        getter recommendation_template_arn : String?

        # The default is to sort by ascending startTime . To sort by descending startTime , set reverseOrder
        # to true .
        @[JSON::Field(key: "reverseOrder")]
        getter reverse_order : Bool?

        # Status of the action.
        @[JSON::Field(key: "status")]
        getter status : Array(String)?

        def initialize(
          @assessment_arn : String? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @recommendation_template_arn : String? = nil,
          @reverse_order : Bool? = nil,
          @status : Array(String)? = nil
        )
        end
      end

      struct ListRecommendationTemplatesResponse
        include JSON::Serializable

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The recommendation templates for the Resilience Hub applications.
        @[JSON::Field(key: "recommendationTemplates")]
        getter recommendation_templates : Array(Types::RecommendationTemplate)?

        def initialize(
          @next_token : String? = nil,
          @recommendation_templates : Array(Types::RecommendationTemplate)? = nil
        )
        end
      end

      struct ListResiliencyPoliciesRequest
        include JSON::Serializable

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Name of the resiliency policy.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @policy_name : String? = nil
        )
        end
      end

      struct ListResiliencyPoliciesResponse
        include JSON::Serializable

        # The resiliency policies for the Resilience Hub applications.
        @[JSON::Field(key: "resiliencyPolicies")]
        getter resiliency_policies : Array(Types::ResiliencyPolicy)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resiliency_policies : Array(Types::ResiliencyPolicy),
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceGroupingRecommendationsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String?

        # Maximum number of grouping recommendations to be displayed per Resilience Hub application.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceGroupingRecommendationsResponse
        include JSON::Serializable

        # List of resource grouping recommendations generated by Resilience Hub.
        @[JSON::Field(key: "groupingRecommendations")]
        getter grouping_recommendations : Array(Types::GroupingRecommendation)

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @grouping_recommendations : Array(Types::GroupingRecommendation),
          @next_token : String? = nil
        )
        end
      end

      struct ListSopRecommendationsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSopRecommendationsResponse
        include JSON::Serializable

        # The standard operating procedure (SOP) recommendations for the Resilience Hub applications.
        @[JSON::Field(key: "sopRecommendations")]
        getter sop_recommendations : Array(Types::SopRecommendation)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @sop_recommendations : Array(Types::SopRecommendation),
          @next_token : String? = nil
        )
        end
      end

      struct ListSuggestedResiliencyPoliciesRequest
        include JSON::Serializable

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSuggestedResiliencyPoliciesResponse
        include JSON::Serializable

        # The suggested resiliency policies for the Resilience Hub applications.
        @[JSON::Field(key: "resiliencyPolicies")]
        getter resiliency_policies : Array(Types::ResiliencyPolicy)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resiliency_policies : Array(Types::ResiliencyPolicy),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for a specific resource in your Resilience Hub application.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Tags assigned to the resource. A tag is a label that you assign to an Amazon Web Services resource.
        # Each tag consists of a key/value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListTestRecommendationsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTestRecommendationsResponse
        include JSON::Serializable

        # The test recommendations for the Resilience Hub application.
        @[JSON::Field(key: "testRecommendations")]
        getter test_recommendations : Array(Types::TestRecommendation)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @test_recommendations : Array(Types::TestRecommendation),
          @next_token : String? = nil
        )
        end
      end

      struct ListUnsupportedAppVersionResourcesRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Null, or the token from a previous call to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The identifier for a specific resolution.
        @[JSON::Field(key: "resolutionId")]
        getter resolution_id : String?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resolution_id : String? = nil
        )
        end
      end

      struct ListUnsupportedAppVersionResourcesResponse
        include JSON::Serializable

        # The identifier for a specific resolution.
        @[JSON::Field(key: "resolutionId")]
        getter resolution_id : String

        # The unsupported resources for the application.
        @[JSON::Field(key: "unsupportedResources")]
        getter unsupported_resources : Array(Types::UnsupportedResource)

        # Token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resolution_id : String,
          @unsupported_resources : Array(Types::UnsupportedResource),
          @next_token : String? = nil
        )
        end
      end

      # Defines a logical resource identifier.
      struct LogicalResourceId
        include JSON::Serializable

        # Identifier of the resource.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # Name of the Amazon Elastic Kubernetes Service cluster and namespace this resource belongs to. This
        # parameter accepts values in "eks-cluster/namespace" format.
        @[JSON::Field(key: "eksSourceName")]
        getter eks_source_name : String?

        # The name of the CloudFormation stack this resource belongs to.
        @[JSON::Field(key: "logicalStackName")]
        getter logical_stack_name : String?

        # The name of the resource group that this resource belongs to.
        @[JSON::Field(key: "resourceGroupName")]
        getter resource_group_name : String?

        # The name of the Terraform S3 state file this resource belongs to.
        @[JSON::Field(key: "terraformSourceName")]
        getter terraform_source_name : String?

        def initialize(
          @identifier : String,
          @eks_source_name : String? = nil,
          @logical_stack_name : String? = nil,
          @resource_group_name : String? = nil,
          @terraform_source_name : String? = nil
        )
        end
      end

      # Defines the roles and credentials that Resilience Hub would use while creating the application,
      # importing its resources, and running an assessment.
      struct PermissionModel
        include JSON::Serializable

        # Defines how Resilience Hub scans your resources. It can scan for the resources by using a
        # pre-existing role in your Amazon Web Services account, or by using the credentials of the current
        # IAM user.
        @[JSON::Field(key: "type")]
        getter type : String

        # Defines a list of role Amazon Resource Names (ARNs) to be used in other accounts. These ARNs are
        # used for querying purposes while importing resources and assessing your application. These ARNs are
        # required only when your resources are in other accounts and you have different role name in these
        # accounts. Else, the invoker role name will be used in the other accounts. These roles must have a
        # trust policy with iam:AssumeRole permission to the invoker role in the primary account.
        @[JSON::Field(key: "crossAccountRoleArns")]
        getter cross_account_role_arns : Array(String)?

        # Existing Amazon Web Services IAM role name in the primary Amazon Web Services account that will be
        # assumed by Resilience Hub Service Principle to obtain a read-only access to your application
        # resources while running an assessment. If your IAM role includes a path, you must include the path
        # in the invokerRoleName parameter. For example, if your IAM role's ARN is
        # arn:aws:iam:123456789012:role/my-path/role-name , you should pass my-path/role-name . You must have
        # iam:passRole permission for this role while creating or updating the application. Currently,
        # invokerRoleName accepts only [A-Za-z0-9_+=,.@-] characters.
        @[JSON::Field(key: "invokerRoleName")]
        getter invoker_role_name : String?

        def initialize(
          @type : String,
          @cross_account_role_arns : Array(String)? = nil,
          @invoker_role_name : String? = nil
        )
        end
      end

      # Defines a physical resource. A physical resource is a resource that exists in your account. It can
      # be identified using an Amazon Resource Name (ARN) or an Resilience Hub-native identifier.
      struct PhysicalResource
        include JSON::Serializable

        # Logical identifier of the resource.
        @[JSON::Field(key: "logicalResourceId")]
        getter logical_resource_id : Types::LogicalResourceId

        # Identifier of the physical resource.
        @[JSON::Field(key: "physicalResourceId")]
        getter physical_resource_id : Types::PhysicalResourceId

        # Type of resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Additional configuration parameters for an Resilience Hub application. If you want to implement
        # additionalInfo through the Resilience Hub console rather than using an API call, see Configure the
        # application configuration parameters . Currently, this parameter accepts a key-value mapping (in a
        # string format) of only one failover region and one associated account. Key: "failover-regions"
        # Value: "[{"region":"&lt;REGION&gt;", "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Hash(String, Array(String))?

        # The application components that belong to this resource.
        @[JSON::Field(key: "appComponents")]
        getter app_components : Array(Types::AppComponent)?

        # Indicates if a resource is included or excluded from the assessment.
        @[JSON::Field(key: "excluded")]
        getter excluded : Bool?

        # Name of the parent resource.
        @[JSON::Field(key: "parentResourceName")]
        getter parent_resource_name : String?

        # The name of the resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # Type of input source.
        @[JSON::Field(key: "sourceType")]
        getter source_type : String?

        def initialize(
          @logical_resource_id : Types::LogicalResourceId,
          @physical_resource_id : Types::PhysicalResourceId,
          @resource_type : String,
          @additional_info : Hash(String, Array(String))? = nil,
          @app_components : Array(Types::AppComponent)? = nil,
          @excluded : Bool? = nil,
          @parent_resource_name : String? = nil,
          @resource_name : String? = nil,
          @source_type : String? = nil
        )
        end
      end

      # Defines a physical resource identifier.
      struct PhysicalResourceId
        include JSON::Serializable

        # Identifier of the physical resource.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # Specifies the type of physical resource identifier. Arn The resource identifier is an Amazon
        # Resource Name (ARN) and it can identify the following list of resources: AWS::ECS::Service
        # AWS::EFS::FileSystem AWS::ElasticLoadBalancingV2::LoadBalancer AWS::Lambda::Function AWS::SNS::Topic
        # Native The resource identifier is an Resilience Hub-native identifier and it can identify the
        # following list of resources: AWS::ApiGateway::RestApi AWS::ApiGatewayV2::Api
        # AWS::AutoScaling::AutoScalingGroup AWS::DocDB::DBCluster AWS::DocDB::DBGlobalCluster
        # AWS::DocDB::DBInstance AWS::DynamoDB::GlobalTable AWS::DynamoDB::Table AWS::EC2::EC2Fleet
        # AWS::EC2::Instance AWS::EC2::NatGateway AWS::EC2::Volume AWS::ElasticLoadBalancing::LoadBalancer
        # AWS::RDS::DBCluster AWS::RDS::DBInstance AWS::RDS::GlobalCluster AWS::Route53::RecordSet
        # AWS::S3::Bucket AWS::SQS::Queue
        @[JSON::Field(key: "type")]
        getter type : String

        # The Amazon Web Services account that owns the physical resource.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services Region that the physical resource is located in.
        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        def initialize(
          @identifier : String,
          @type : String,
          @aws_account_id : String? = nil,
          @aws_region : String? = nil
        )
        end
      end

      struct PublishAppVersionRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Name of the application version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        def initialize(
          @app_arn : String,
          @version_name : String? = nil
        )
        end
      end

      struct PublishAppVersionResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String?

        # Identifier of the application version.
        @[JSON::Field(key: "identifier")]
        getter identifier : Int64?

        # Name of the application version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        def initialize(
          @app_arn : String,
          @app_version : String? = nil,
          @identifier : Int64? = nil,
          @version_name : String? = nil
        )
        end
      end

      struct PutDraftAppVersionTemplateRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # A JSON string that provides information about your application structure. To learn more about the
        # appTemplateBody template, see the sample template provided in the Examples section. The
        # appTemplateBody JSON string has the following structure: resources The list of logical resources
        # that must be included in the Resilience Hub application. Type: Array Don't add the resources that
        # you want to exclude. Each resources array item includes the following fields: logicalResourceId
        # Logical identifier of the resource. Type: Object Each logicalResourceId object includes the
        # following fields: identifier Identifier of the resource. Type: String logicalStackName The name of
        # the CloudFormation stack this resource belongs to. Type: String resourceGroupName The name of the
        # resource group this resource belongs to. Type: String terraformSourceName The name of the Terraform
        # S3 state file this resource belongs to. Type: String eksSourceName Name of the Amazon Elastic
        # Kubernetes Service cluster and namespace this resource belongs to. This parameter accepts values in
        # "eks-cluster/namespace" format. Type: String type The type of resource. Type: string name The name
        # of the resource. Type: String additionalInfo Additional configuration parameters for an Resilience
        # Hub application. If you want to implement additionalInfo through the Resilience Hub console rather
        # than using an API call, see Configure the application configuration parameters . Currently, this
        # parameter accepts a key-value mapping (in a string format) of only one failover region and one
        # associated account. Key: "failover-regions" Value: "[{"region":"&lt;REGION&gt;",
        # "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]" appComponents List of Application Components that this
        # resource belongs to. If an Application Component is not part of the Resilience Hub application, it
        # will be added. Type: Array Each appComponents array item includes the following fields: name Name of
        # the Application Component. Type: String type Type of Application Component. For more information
        # about the types of Application Component, see Grouping resources in an AppComponent . Type: String
        # resourceNames The list of included resources that are assigned to the Application Component. Type:
        # Array of strings additionalInfo Additional configuration parameters for an Resilience Hub
        # application. If you want to implement additionalInfo through the Resilience Hub console rather than
        # using an API call, see Configure the application configuration parameters . Currently, this
        # parameter accepts a key-value mapping (in a string format) of only one failover region and one
        # associated account. Key: "failover-regions" Value: "[{"region":"&lt;REGION&gt;",
        # "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]" excludedResources The list of logical resource
        # identifiers to be excluded from the application. Type: Array Don't add the resources that you want
        # to include. Each excludedResources array item includes the following fields: logicalResourceIds
        # Logical identifier of the resource. Type: Object You can configure only one of the following fields:
        # logicalStackName resourceGroupName terraformSourceName eksSourceName Each logicalResourceIds object
        # includes the following fields: identifier Identifier of the resource. Type: String logicalStackName
        # The name of the CloudFormation stack this resource belongs to. Type: String resourceGroupName The
        # name of the resource group this resource belongs to. Type: String terraformSourceName The name of
        # the Terraform S3 state file this resource belongs to. Type: String eksSourceName Name of the Amazon
        # Elastic Kubernetes Service cluster and namespace this resource belongs to. This parameter accepts
        # values in "eks-cluster/namespace" format. Type: String version Resilience Hub application version.
        # additionalInfo Additional configuration parameters for an Resilience Hub application. If you want to
        # implement additionalInfo through the Resilience Hub console rather than using an API call, see
        # Configure the application configuration parameters . Currently, this parameter accepts a key-value
        # mapping (in a string format) of only one failover region and one associated account. Key:
        # "failover-regions" Value: "[{"region":"&lt;REGION&gt;", "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"
        @[JSON::Field(key: "appTemplateBody")]
        getter app_template_body : String

        def initialize(
          @app_arn : String,
          @app_template_body : String
        )
        end
      end

      struct PutDraftAppVersionTemplateResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String?

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String?

        def initialize(
          @app_arn : String? = nil,
          @app_version : String? = nil
        )
        end
      end

      # Defines a disruption compliance recommendation.
      struct RecommendationDisruptionCompliance
        include JSON::Serializable

        # The expected compliance status after applying the recommended configuration change.
        @[JSON::Field(key: "expectedComplianceStatus")]
        getter expected_compliance_status : String

        # The expected Recovery Point Objective (RPO) description after applying the recommended configuration
        # change.
        @[JSON::Field(key: "expectedRpoDescription")]
        getter expected_rpo_description : String?

        # The expected RPO after applying the recommended configuration change.
        @[JSON::Field(key: "expectedRpoInSecs")]
        getter expected_rpo_in_secs : Int32?

        # The expected Recovery Time Objective (RTO) description after applying the recommended configuration
        # change.
        @[JSON::Field(key: "expectedRtoDescription")]
        getter expected_rto_description : String?

        # The expected RTO after applying the recommended configuration change.
        @[JSON::Field(key: "expectedRtoInSecs")]
        getter expected_rto_in_secs : Int32?

        def initialize(
          @expected_compliance_status : String,
          @expected_rpo_description : String? = nil,
          @expected_rpo_in_secs : Int32? = nil,
          @expected_rto_description : String? = nil,
          @expected_rto_in_secs : Int32? = nil
        )
        end
      end

      # Defines a recommendation.
      struct RecommendationItem
        include JSON::Serializable

        # Specifies if the recommendation has already been implemented.
        @[JSON::Field(key: "alreadyImplemented")]
        getter already_implemented : Bool?

        # Indicates the previously implemented Amazon CloudWatch alarm discovered by Resilience Hub.
        @[JSON::Field(key: "discoveredAlarm")]
        getter discovered_alarm : Types::Alarm?

        # Indicates the reason for excluding an operational recommendation.
        @[JSON::Field(key: "excludeReason")]
        getter exclude_reason : String?

        # Indicates if an operational recommendation item is excluded.
        @[JSON::Field(key: "excluded")]
        getter excluded : Bool?

        # Indicates the experiment created in FIS that was discovered by Resilience Hub, which matches the
        # recommendation.
        @[JSON::Field(key: "latestDiscoveredExperiment")]
        getter latest_discovered_experiment : Types::Experiment?

        # Identifier of the resource.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Identifier of the target account.
        @[JSON::Field(key: "targetAccountId")]
        getter target_account_id : String?

        # The target region.
        @[JSON::Field(key: "targetRegion")]
        getter target_region : String?

        def initialize(
          @already_implemented : Bool? = nil,
          @discovered_alarm : Types::Alarm? = nil,
          @exclude_reason : String? = nil,
          @excluded : Bool? = nil,
          @latest_discovered_experiment : Types::Experiment? = nil,
          @resource_id : String? = nil,
          @target_account_id : String? = nil,
          @target_region : String? = nil
        )
        end
      end

      # Defines a recommendation template created with the CreateRecommendationTemplate action.
      struct RecommendationTemplate
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the assessment. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :app-assessment/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "assessmentArn")]
        getter assessment_arn : String

        # Format of the recommendation template. CfnJson The template is CloudFormation JSON. CfnYaml The
        # template is CloudFormation YAML.
        @[JSON::Field(key: "format")]
        getter format : String

        # Name for the recommendation template.
        @[JSON::Field(key: "name")]
        getter name : String

        # Amazon Resource Name (ARN) for the recommendation template.
        @[JSON::Field(key: "recommendationTemplateArn")]
        getter recommendation_template_arn : String

        # An array of strings that specify the recommendation template type or types. Alarm The template is an
        # AlarmRecommendation template. Sop The template is a SopRecommendation template. Test The template is
        # a TestRecommendation template.
        @[JSON::Field(key: "recommendationTypes")]
        getter recommendation_types : Array(String)

        # Status of the action.
        @[JSON::Field(key: "status")]
        getter status : String

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String?

        # The end time for the action.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Message for the recommendation template.
        @[JSON::Field(key: "message")]
        getter message : String?

        # Indicates if replacements are needed.
        @[JSON::Field(key: "needsReplacements")]
        getter needs_replacements : Bool?

        # Identifiers for the recommendations used in the recommendation template.
        @[JSON::Field(key: "recommendationIds")]
        getter recommendation_ids : Array(String)?

        # The start time for the action.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Tags assigned to the resource. A tag is a label that you assign to an Amazon Web Services resource.
        # Each tag consists of a key/value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The file location of the template.
        @[JSON::Field(key: "templatesLocation")]
        getter templates_location : Types::S3Location?

        def initialize(
          @assessment_arn : String,
          @format : String,
          @name : String,
          @recommendation_template_arn : String,
          @recommendation_types : Array(String),
          @status : String,
          @app_arn : String? = nil,
          @end_time : Time? = nil,
          @message : String? = nil,
          @needs_replacements : Bool? = nil,
          @recommendation_ids : Array(String)? = nil,
          @start_time : Time? = nil,
          @tags : Hash(String, String)? = nil,
          @templates_location : Types::S3Location? = nil
        )
        end
      end

      # Indicates the rejected grouping recommendation.
      struct RejectGroupingRecommendationEntry
        include JSON::Serializable

        # Indicates the identifier of the grouping recommendation.
        @[JSON::Field(key: "groupingRecommendationId")]
        getter grouping_recommendation_id : String

        # Indicates the reason you had selected while rejecting a grouping recommendation.
        @[JSON::Field(key: "rejectionReason")]
        getter rejection_reason : String?

        def initialize(
          @grouping_recommendation_id : String,
          @rejection_reason : String? = nil
        )
        end
      end

      struct RejectResourceGroupingRecommendationsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # List of resource grouping recommendations you have selected to exclude from your application.
        @[JSON::Field(key: "entries")]
        getter entries : Array(Types::RejectGroupingRecommendationEntry)

        def initialize(
          @app_arn : String,
          @entries : Array(Types::RejectGroupingRecommendationEntry)
        )
        end
      end

      struct RejectResourceGroupingRecommendationsResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # List of resource grouping recommendations that failed to get excluded in your application.
        @[JSON::Field(key: "failedEntries")]
        getter failed_entries : Array(Types::FailedGroupingRecommendationEntry)

        def initialize(
          @app_arn : String,
          @failed_entries : Array(Types::FailedGroupingRecommendationEntry)
        )
        end
      end

      struct RemoveDraftAppVersionResourceMappingsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The names of the registered applications you want to remove from the resource mappings.
        @[JSON::Field(key: "appRegistryAppNames")]
        getter app_registry_app_names : Array(String)?

        # The names of the Amazon Elastic Kubernetes Service clusters and namespaces you want to remove from
        # the resource mappings. This parameter accepts values in "eks-cluster/namespace" format.
        @[JSON::Field(key: "eksSourceNames")]
        getter eks_source_names : Array(String)?

        # The names of the CloudFormation stacks you want to remove from the resource mappings.
        @[JSON::Field(key: "logicalStackNames")]
        getter logical_stack_names : Array(String)?

        # The names of the resource groups you want to remove from the resource mappings.
        @[JSON::Field(key: "resourceGroupNames")]
        getter resource_group_names : Array(String)?

        # The names of the resources you want to remove from the resource mappings.
        @[JSON::Field(key: "resourceNames")]
        getter resource_names : Array(String)?

        # The names of the Terraform sources you want to remove from the resource mappings.
        @[JSON::Field(key: "terraformSourceNames")]
        getter terraform_source_names : Array(String)?

        def initialize(
          @app_arn : String,
          @app_registry_app_names : Array(String)? = nil,
          @eks_source_names : Array(String)? = nil,
          @logical_stack_names : Array(String)? = nil,
          @resource_group_names : Array(String)? = nil,
          @resource_names : Array(String)? = nil,
          @terraform_source_names : Array(String)? = nil
        )
        end
      end

      struct RemoveDraftAppVersionResourceMappingsResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String?

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String?

        def initialize(
          @app_arn : String? = nil,
          @app_version : String? = nil
        )
        end
      end

      # Defines a resiliency policy. Resilience Hub allows you to provide a value of zero for rtoInSecs and
      # rpoInSecs of your resiliency policy. But, while assessing your application, the lowest possible
      # assessment result is near zero. Hence, if you provide value zero for rtoInSecs and rpoInSecs , the
      # estimated workload RTO and estimated workload RPO result will be near zero and the Compliance status
      # for your application will be set to Policy breached .
      struct ResiliencyPolicy
        include JSON::Serializable

        # Date and time when the resiliency policy was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Specifies a high-level geographical location constraint for where your resilience policy data can be
        # stored.
        @[JSON::Field(key: "dataLocationConstraint")]
        getter data_location_constraint : String?

        # Specifies the estimated cost tier of the resiliency policy.
        @[JSON::Field(key: "estimatedCostTier")]
        getter estimated_cost_tier : String?

        # The resiliency policy.
        @[JSON::Field(key: "policy")]
        getter policy : Hash(String, Types::FailurePolicy)?

        # Amazon Resource Name (ARN) of the resiliency policy. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :resiliency-policy/ policy-id . For more information about ARNs,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String?

        # Description of the resiliency policy.
        @[JSON::Field(key: "policyDescription")]
        getter policy_description : String?

        # The name of the policy
        @[JSON::Field(key: "policyName")]
        getter policy_name : String?

        # Tags assigned to the resource. A tag is a label that you assign to an Amazon Web Services resource.
        # Each tag consists of a key/value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The tier for this resiliency policy, ranging from the highest severity ( MissionCritical ) to lowest
        # ( NonCritical ).
        @[JSON::Field(key: "tier")]
        getter tier : String?

        def initialize(
          @creation_time : Time? = nil,
          @data_location_constraint : String? = nil,
          @estimated_cost_tier : String? = nil,
          @policy : Hash(String, Types::FailurePolicy)? = nil,
          @policy_arn : String? = nil,
          @policy_description : String? = nil,
          @policy_name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @tier : String? = nil
        )
        end
      end

      # The overall resiliency score, returned as an object that includes the disruption score and outage
      # score.
      struct ResiliencyScore
        include JSON::Serializable

        # The disruption score for a valid key.
        @[JSON::Field(key: "disruptionScore")]
        getter disruption_score : Hash(String, Float64)

        # The outage score for a valid key.
        @[JSON::Field(key: "score")]
        getter score : Float64

        # The score generated by Resilience Hub for the scoring component after running an assessment. For
        # example, if the score is 25 points, it indicates the overall score of your application generated by
        # Resilience Hub after running an assessment.
        @[JSON::Field(key: "componentScore")]
        getter component_score : Hash(String, Types::ScoringComponentResiliencyScore)?

        def initialize(
          @disruption_score : Hash(String, Float64),
          @score : Float64,
          @component_score : Hash(String, Types::ScoringComponentResiliencyScore)? = nil
        )
        end
      end

      struct ResolveAppVersionResourcesRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        def initialize(
          @app_arn : String,
          @app_version : String
        )
        end
      end

      struct ResolveAppVersionResourcesResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # The identifier for a specific resolution.
        @[JSON::Field(key: "resolutionId")]
        getter resolution_id : String

        # Status of the action.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @app_arn : String,
          @app_version : String,
          @resolution_id : String,
          @status : String
        )
        end
      end

      # Indicates the resources that have drifted in the current application version.
      struct ResourceDrift
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the application whose resources have drifted. The format for this ARN
        # is: arn: partition :resiliencehub: region : account :app-assessment/ app-id . For more information
        # about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String?

        # Version of the application whose resources have drifted.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String?

        # Indicates if the resource was added or removed.
        @[JSON::Field(key: "diffType")]
        getter diff_type : String?

        # Reference identifier of the resource drift.
        @[JSON::Field(key: "referenceId")]
        getter reference_id : String?

        # Identifier of the drifted resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : Types::ResourceIdentifier?

        def initialize(
          @app_arn : String? = nil,
          @app_version : String? = nil,
          @diff_type : String? = nil,
          @reference_id : String? = nil,
          @resource_identifier : Types::ResourceIdentifier? = nil
        )
        end
      end

      # Defines application resource errors.
      struct ResourceError
        include JSON::Serializable

        # Identifier of the logical resource.
        @[JSON::Field(key: "logicalResourceId")]
        getter logical_resource_id : String?

        # Identifier of the physical resource.
        @[JSON::Field(key: "physicalResourceId")]
        getter physical_resource_id : String?

        # This is the error message.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @logical_resource_id : String? = nil,
          @physical_resource_id : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # A list of errors retrieving an application's resources.
      struct ResourceErrorsDetails
        include JSON::Serializable

        # This indicates if there are more errors not listed in the resourceErrors list.
        @[JSON::Field(key: "hasMoreErrors")]
        getter has_more_errors : Bool?

        # A list of errors retrieving an application's resources.
        @[JSON::Field(key: "resourceErrors")]
        getter resource_errors : Array(Types::ResourceError)?

        def initialize(
          @has_more_errors : Bool? = nil,
          @resource_errors : Array(Types::ResourceError)? = nil
        )
        end
      end

      # Defines a resource identifier for the drifted resource.
      struct ResourceIdentifier
        include JSON::Serializable

        # Logical identifier of the drifted resource.
        @[JSON::Field(key: "logicalResourceId")]
        getter logical_resource_id : Types::LogicalResourceId?

        # Type of the drifted resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @logical_resource_id : Types::LogicalResourceId? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Defines a resource mapping.
      struct ResourceMapping
        include JSON::Serializable

        # Specifies the type of resource mapping.
        @[JSON::Field(key: "mappingType")]
        getter mapping_type : String

        # Identifier of the physical resource.
        @[JSON::Field(key: "physicalResourceId")]
        getter physical_resource_id : Types::PhysicalResourceId

        # Name of the application this resource is mapped to when the mappingType is AppRegistryApp .
        @[JSON::Field(key: "appRegistryAppName")]
        getter app_registry_app_name : String?

        # Name of the Amazon Elastic Kubernetes Service cluster and namespace that this resource is mapped to
        # when the mappingType is EKS . This parameter accepts values in "eks-cluster/namespace" format.
        @[JSON::Field(key: "eksSourceName")]
        getter eks_source_name : String?

        # Name of the CloudFormation stack this resource is mapped to when the mappingType is CfnStack .
        @[JSON::Field(key: "logicalStackName")]
        getter logical_stack_name : String?

        # Name of the Resource Groups that this resource is mapped to when the mappingType is ResourceGroup .
        @[JSON::Field(key: "resourceGroupName")]
        getter resource_group_name : String?

        # Name of the resource that this resource is mapped to when the mappingType is Resource .
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # Name of the Terraform source that this resource is mapped to when the mappingType is Terraform .
        @[JSON::Field(key: "terraformSourceName")]
        getter terraform_source_name : String?

        def initialize(
          @mapping_type : String,
          @physical_resource_id : Types::PhysicalResourceId,
          @app_registry_app_name : String? = nil,
          @eks_source_name : String? = nil,
          @logical_stack_name : String? = nil,
          @resource_group_name : String? = nil,
          @resource_name : String? = nil,
          @terraform_source_name : String? = nil
        )
        end
      end

      # This exception occurs when the specified resource could not be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The identifier of the resource that the exception applies to.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource that the exception applies to.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The location of the Amazon S3 bucket.
      struct S3Location
        include JSON::Serializable

        # The name of the Amazon S3 bucket.
        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The prefix for the Amazon S3 bucket.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Resiliency score of each scoring component. For more information about scoring component, see
      # Calculating resiliency score .
      struct ScoringComponentResiliencyScore
        include JSON::Serializable

        # Number of recommendations that were excluded from the assessment. For example, if the excludedCount
        # for Alarms coverage scoring component is 7, it indicates that 7 Amazon CloudWatch alarms are
        # excluded from the assessment.
        @[JSON::Field(key: "excludedCount")]
        getter excluded_count : Int64?

        # Number of recommendations that must be implemented to obtain the maximum possible score for the
        # scoring component. For SOPs, alarms, and tests, these are the number of recommendations that must be
        # implemented. For compliance, these are the number of Application Components that have breached the
        # resiliency policy. For example, if the outstandingCount for Alarms coverage scoring component is 5,
        # it indicates that 5 Amazon CloudWatch alarms need to be implemented to achieve the maximum possible
        # score.
        @[JSON::Field(key: "outstandingCount")]
        getter outstanding_count : Int64?

        # Maximum possible score that can be obtained for the scoring component. For example, if the
        # possibleScore is 20 points, it indicates the maximum possible score you can achieve for the scoring
        # component when you run a new assessment after implementing all the Resilience Hub recommendations.
        @[JSON::Field(key: "possibleScore")]
        getter possible_score : Float64?

        # Resiliency score points given for the scoring component. The score is always less than or equal to
        # the possibleScore .
        @[JSON::Field(key: "score")]
        getter score : Float64?

        def initialize(
          @excluded_count : Int64? = nil,
          @outstanding_count : Int64? = nil,
          @possible_score : Float64? = nil,
          @score : Float64? = nil
        )
        end
      end

      # This exception occurs when you have exceeded your service quota. To perform the requested action,
      # remove some of the relevant resources, or use Service Quotas to request a service quota increase.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Defines a standard operating procedure (SOP) recommendation.
      struct SopRecommendation
        include JSON::Serializable

        # Identifier for the SOP recommendation.
        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String

        # Reference identifier for the SOP recommendation.
        @[JSON::Field(key: "referenceId")]
        getter reference_id : String

        # The service type.
        @[JSON::Field(key: "serviceType")]
        getter service_type : String

        # Name of the Application Component.
        @[JSON::Field(key: "appComponentName")]
        getter app_component_name : String?

        # Description of the SOP recommendation.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The recommendation items.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::RecommendationItem)?

        # Name of the SOP recommendation.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Prerequisite for the SOP recommendation.
        @[JSON::Field(key: "prerequisite")]
        getter prerequisite : String?

        # Status of the recommended standard operating procedure.
        @[JSON::Field(key: "recommendationStatus")]
        getter recommendation_status : String?

        def initialize(
          @recommendation_id : String,
          @reference_id : String,
          @service_type : String,
          @app_component_name : String? = nil,
          @description : String? = nil,
          @items : Array(Types::RecommendationItem)? = nil,
          @name : String? = nil,
          @prerequisite : String? = nil,
          @recommendation_status : String? = nil
        )
        end
      end

      # Indicates the sorting order of the fields in the metrics.
      struct Sort
        include JSON::Serializable

        # Indicates the order in which you want to sort the metrics. By default, the list is sorted in
        # ascending order. To sort the list in descending order, set this field to False.
        @[JSON::Field(key: "field")]
        getter field : String

        # Indicates the name or identifier of the field or attribute that should be used as the basis for
        # sorting the metrics.
        @[JSON::Field(key: "ascending")]
        getter ascending : Bool?

        def initialize(
          @field : String,
          @ascending : Bool? = nil
        )
        end
      end

      struct StartAppAssessmentRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The version of the application.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # The name for the assessment.
        @[JSON::Field(key: "assessmentName")]
        getter assessment_name : String

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Tags assigned to the resource. A tag is a label that you assign to an Amazon Web Services resource.
        # Each tag consists of a key/value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @assessment_name : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartAppAssessmentResponse
        include JSON::Serializable

        # The assessment created.
        @[JSON::Field(key: "assessment")]
        getter assessment : Types::AppAssessment

        def initialize(
          @assessment : Types::AppAssessment
        )
        end
      end

      struct StartMetricsExportRequest
        include JSON::Serializable

        # (Optional) Specifies the name of the Amazon Simple Storage Service bucket where the exported metrics
        # will be stored.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # Used for an idempotency token. A client token is a unique, case-sensitive string of up to 64 ASCII
        # characters. You should not reuse the same client token for other API requests.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @bucket_name : String? = nil,
          @client_token : String? = nil
        )
        end
      end

      struct StartMetricsExportResponse
        include JSON::Serializable

        # Identifier of the metrics export task.
        @[JSON::Field(key: "metricsExportId")]
        getter metrics_export_id : String

        # Indicates the status of the metrics export task.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @metrics_export_id : String,
          @status : String
        )
        end
      end

      struct StartResourceGroupingRecommendationTaskRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        def initialize(
          @app_arn : String
        )
        end
      end

      struct StartResourceGroupingRecommendationTaskResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Identifier of the grouping recommendation task.
        @[JSON::Field(key: "groupingId")]
        getter grouping_id : String

        # Status of the action.
        @[JSON::Field(key: "status")]
        getter status : String

        # Error that occurred while executing a grouping recommendation task.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @app_arn : String,
          @grouping_id : String,
          @status : String,
          @error_message : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to assign to the resource. Each tag consists of a key/value pair.
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

      # The Terraform s3 state file you need to import.
      struct TerraformSource
        include JSON::Serializable

        # The URL of the Terraform s3 state file you need to import.
        @[JSON::Field(key: "s3StateFileUrl")]
        getter s3_state_file_url : String

        def initialize(
          @s3_state_file_url : String
        )
        end
      end

      # Defines a test recommendation.
      struct TestRecommendation
        include JSON::Serializable

        # Reference identifier for the test recommendation.
        @[JSON::Field(key: "referenceId")]
        getter reference_id : String

        # Indicates the identifier of the AppComponent.
        @[JSON::Field(key: "appComponentId")]
        getter app_component_id : String?

        # Name of the Application Component.
        @[JSON::Field(key: "appComponentName")]
        getter app_component_name : String?

        # A list of recommended alarms that are used in the test and must be exported before or with the test.
        @[JSON::Field(key: "dependsOnAlarms")]
        getter depends_on_alarms : Array(String)?

        # Description for the test recommendation.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Intent of the test recommendation.
        @[JSON::Field(key: "intent")]
        getter intent : String?

        # The test recommendation items.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::RecommendationItem)?

        # Name of the test recommendation.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Prerequisite of the test recommendation.
        @[JSON::Field(key: "prerequisite")]
        getter prerequisite : String?

        # Identifier for the test recommendation.
        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String?

        # Status of the recommended test.
        @[JSON::Field(key: "recommendationStatus")]
        getter recommendation_status : String?

        # Level of risk for this test recommendation.
        @[JSON::Field(key: "risk")]
        getter risk : String?

        # Type of test recommendation.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @reference_id : String,
          @app_component_id : String? = nil,
          @app_component_name : String? = nil,
          @depends_on_alarms : Array(String)? = nil,
          @description : String? = nil,
          @intent : String? = nil,
          @items : Array(Types::RecommendationItem)? = nil,
          @name : String? = nil,
          @prerequisite : String? = nil,
          @recommendation_id : String? = nil,
          @recommendation_status : String? = nil,
          @risk : String? = nil,
          @type : String? = nil
        )
        end
      end

      # This exception occurs when you have exceeded the limit on the number of requests per second.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The number of seconds to wait before retrying the operation.
        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String? = nil,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # Defines a resource that is not supported by Resilience Hub.
      struct UnsupportedResource
        include JSON::Serializable

        # Logical resource identifier for the unsupported resource.
        @[JSON::Field(key: "logicalResourceId")]
        getter logical_resource_id : Types::LogicalResourceId

        # Physical resource identifier for the unsupported resource.
        @[JSON::Field(key: "physicalResourceId")]
        getter physical_resource_id : Types::PhysicalResourceId

        # The type of resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The status of the unsupported resource.
        @[JSON::Field(key: "unsupportedResourceStatus")]
        getter unsupported_resource_status : String?

        def initialize(
          @logical_resource_id : Types::LogicalResourceId,
          @physical_resource_id : Types::PhysicalResourceId,
          @resource_type : String,
          @unsupported_resource_status : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags you want to remove.
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

      struct UpdateAppRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Assessment execution schedule with 'Daily' or 'Disabled' values.
        @[JSON::Field(key: "assessmentSchedule")]
        getter assessment_schedule : String?

        # Specifies if the resiliency policy ARN should be cleared.
        @[JSON::Field(key: "clearResiliencyPolicyArn")]
        getter clear_resiliency_policy_arn : Bool?

        # The optional description for an app.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The list of events you would like to subscribe and get notification for. Currently, Resilience Hub
        # supports notifications only for Drift detected and Scheduled assessment failure events.
        @[JSON::Field(key: "eventSubscriptions")]
        getter event_subscriptions : Array(Types::EventSubscription)?

        # Defines the roles and credentials that Resilience Hub would use while creating an application,
        # importing its resources, and running an assessment.
        @[JSON::Field(key: "permissionModel")]
        getter permission_model : Types::PermissionModel?

        # Amazon Resource Name (ARN) of the resiliency policy. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :resiliency-policy/ policy-id . For more information about ARNs,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String?

        def initialize(
          @app_arn : String,
          @assessment_schedule : String? = nil,
          @clear_resiliency_policy_arn : Bool? = nil,
          @description : String? = nil,
          @event_subscriptions : Array(Types::EventSubscription)? = nil,
          @permission_model : Types::PermissionModel? = nil,
          @policy_arn : String? = nil
        )
        end
      end

      struct UpdateAppResponse
        include JSON::Serializable

        # The specified application, returned as an object with details including compliance status, creation
        # time, description, resiliency score, and more.
        @[JSON::Field(key: "app")]
        getter app : Types::App

        def initialize(
          @app : Types::App
        )
        end
      end

      struct UpdateAppVersionAppComponentRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Identifier of the Application Component.
        @[JSON::Field(key: "id")]
        getter id : String

        # Currently, there is no supported additional information for Application Components.
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Hash(String, Array(String))?

        # Name of the Application Component.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Type of Application Component. For more information about the types of Application Component, see
        # Grouping resources in an AppComponent .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @app_arn : String,
          @id : String,
          @additional_info : Hash(String, Array(String))? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct UpdateAppVersionAppComponentResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # List of Application Components that belong to this resource.
        @[JSON::Field(key: "appComponent")]
        getter app_component : Types::AppComponent?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @app_component : Types::AppComponent? = nil
        )
        end
      end

      struct UpdateAppVersionRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Additional configuration parameters for an Resilience Hub application. If you want to implement
        # additionalInfo through the Resilience Hub console rather than using an API call, see Configure the
        # application configuration parameters . Currently, this parameter accepts a key-value mapping (in a
        # string format) of only one failover region and one associated account. Key: "failover-regions"
        # Value: "[{"region":"&lt;REGION&gt;", "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Hash(String, Array(String))?

        def initialize(
          @app_arn : String,
          @additional_info : Hash(String, Array(String))? = nil
        )
        end
      end

      struct UpdateAppVersionResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Currently, there is no supported additional information for resources.
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Hash(String, Array(String))?

        # List of Application Components that this resource belongs to. If an Application Component is not
        # part of the Resilience Hub application, it will be added.
        @[JSON::Field(key: "appComponents")]
        getter app_components : Array(String)?

        # Amazon Web Services account that owns the physical resource.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # Amazon Web Services region that owns the physical resource.
        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        # Indicates if a resource is excluded from an Resilience Hub application. You can exclude only
        # imported resources from an Resilience Hub application.
        @[JSON::Field(key: "excluded")]
        getter excluded : Bool?

        # Logical identifier of the resource.
        @[JSON::Field(key: "logicalResourceId")]
        getter logical_resource_id : Types::LogicalResourceId?

        # Physical identifier of the resource.
        @[JSON::Field(key: "physicalResourceId")]
        getter physical_resource_id : String?

        # Name of the resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # Type of resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @app_arn : String,
          @additional_info : Hash(String, Array(String))? = nil,
          @app_components : Array(String)? = nil,
          @aws_account_id : String? = nil,
          @aws_region : String? = nil,
          @excluded : Bool? = nil,
          @logical_resource_id : Types::LogicalResourceId? = nil,
          @physical_resource_id : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct UpdateAppVersionResourceResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Defines a physical resource. A physical resource is a resource that exists in your account. It can
        # be identified using an Amazon Resource Name (ARN) or a Resilience Hub-native identifier.
        @[JSON::Field(key: "physicalResource")]
        getter physical_resource : Types::PhysicalResource?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @physical_resource : Types::PhysicalResource? = nil
        )
        end
      end

      struct UpdateAppVersionResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Resilience Hub application. The format for this ARN is: arn:
        # partition :resiliencehub: region : account :app/ app-id . For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # Resilience Hub application version.
        @[JSON::Field(key: "appVersion")]
        getter app_version : String

        # Additional configuration parameters for an Resilience Hub application. If you want to implement
        # additionalInfo through the Resilience Hub console rather than using an API call, see Configure the
        # application configuration parameters . Currently, this parameter supports only failover region and
        # account.
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Hash(String, Array(String))?

        def initialize(
          @app_arn : String,
          @app_version : String,
          @additional_info : Hash(String, Array(String))? = nil
        )
        end
      end

      # Defines the operational recommendation item that needs a status update.
      struct UpdateRecommendationStatusItem
        include JSON::Serializable

        # Resource identifier of the operational recommendation item.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Identifier of the target Amazon Web Services account.
        @[JSON::Field(key: "targetAccountId")]
        getter target_account_id : String?

        # Identifier of the target Amazon Web Services Region.
        @[JSON::Field(key: "targetRegion")]
        getter target_region : String?

        def initialize(
          @resource_id : String? = nil,
          @target_account_id : String? = nil,
          @target_region : String? = nil
        )
        end
      end

      # Defines the operational recommendation item that is to be included or excluded.
      struct UpdateRecommendationStatusRequestEntry
        include JSON::Serializable

        # An identifier for an entry in this batch that is used to communicate the result. The entryId s of a
        # batch request need to be unique within a request.
        @[JSON::Field(key: "entryId")]
        getter entry_id : String

        # Indicates if the operational recommendation needs to be excluded. If set to True, the operational
        # recommendation will be excluded.
        @[JSON::Field(key: "excluded")]
        getter excluded : Bool

        # Reference identifier of the operational recommendation item.
        @[JSON::Field(key: "referenceId")]
        getter reference_id : String

        # Indicates the identifier of the AppComponent.
        @[JSON::Field(key: "appComponentId")]
        getter app_component_id : String?

        # Indicates the reason for excluding an operational recommendation.
        @[JSON::Field(key: "excludeReason")]
        getter exclude_reason : String?

        # The operational recommendation item.
        @[JSON::Field(key: "item")]
        getter item : Types::UpdateRecommendationStatusItem?

        def initialize(
          @entry_id : String,
          @excluded : Bool,
          @reference_id : String,
          @app_component_id : String? = nil,
          @exclude_reason : String? = nil,
          @item : Types::UpdateRecommendationStatusItem? = nil
        )
        end
      end

      struct UpdateResiliencyPolicyRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resiliency policy. The format for this ARN is: arn: partition
        # :resiliencehub: region : account :resiliency-policy/ policy-id . For more information about ARNs,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference guide.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # Specifies a high-level geographical location constraint for where your resilience policy data can be
        # stored.
        @[JSON::Field(key: "dataLocationConstraint")]
        getter data_location_constraint : String?

        # Resiliency policy to be created, including the recovery time objective (RTO) and recovery point
        # objective (RPO) in seconds.
        @[JSON::Field(key: "policy")]
        getter policy : Hash(String, Types::FailurePolicy)?

        # Description of the resiliency policy.
        @[JSON::Field(key: "policyDescription")]
        getter policy_description : String?

        # Name of the resiliency policy.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String?

        # The tier for this resiliency policy, ranging from the highest severity ( MissionCritical ) to lowest
        # ( NonCritical ).
        @[JSON::Field(key: "tier")]
        getter tier : String?

        def initialize(
          @policy_arn : String,
          @data_location_constraint : String? = nil,
          @policy : Hash(String, Types::FailurePolicy)? = nil,
          @policy_description : String? = nil,
          @policy_name : String? = nil,
          @tier : String? = nil
        )
        end
      end

      struct UpdateResiliencyPolicyResponse
        include JSON::Serializable

        # The resiliency policy that was updated, including the recovery time objective (RTO) and recovery
        # point objective (RPO) in seconds.
        @[JSON::Field(key: "policy")]
        getter policy : Types::ResiliencyPolicy

        def initialize(
          @policy : Types::ResiliencyPolicy
        )
        end
      end

      # This exception occurs when a request is not valid.
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
