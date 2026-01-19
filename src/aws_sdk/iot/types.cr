require "json"
require "time"

module AwsSdk
  module IoT
    module Types

      # The criteria that determine when and how a job abort takes place.
      struct AbortConfig
        include JSON::Serializable

        # The list of criteria that determine when and how to abort the job.
        @[JSON::Field(key: "criteriaList")]
        getter criteria_list : Array(Types::AbortCriteria)

        def initialize(
          @criteria_list : Array(Types::AbortCriteria)
        )
        end
      end

      # The criteria that determine when and how a job abort takes place.
      struct AbortCriteria
        include JSON::Serializable

        # The type of job action to take to initiate the job abort.
        @[JSON::Field(key: "action")]
        getter action : String

        # The type of job execution failures that can initiate a job abort.
        @[JSON::Field(key: "failureType")]
        getter failure_type : String

        # The minimum number of things which must receive job execution notifications before the job can be
        # aborted.
        @[JSON::Field(key: "minNumberOfExecutedThings")]
        getter min_number_of_executed_things : Int32

        # The minimum percentage of job execution failures that must occur to initiate the job abort. Amazon
        # Web Services IoT Core supports up to two digits after the decimal (for example, 10.9 and 10.99, but
        # not 10.999).
        @[JSON::Field(key: "thresholdPercentage")]
        getter threshold_percentage : Float64

        def initialize(
          @action : String,
          @failure_type : String,
          @min_number_of_executed_things : Int32,
          @threshold_percentage : Float64
        )
        end
      end

      # The input for the AcceptCertificateTransfer operation.
      struct AcceptCertificateTransferRequest
        include JSON::Serializable

        # The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String

        # Specifies whether the certificate is active.
        @[JSON::Field(key: "setAsActive")]
        getter set_as_active : Bool?

        def initialize(
          @certificate_id : String,
          @set_as_active : Bool? = nil
        )
        end
      end

      # Describes the actions associated with a rule.
      struct Action
        include JSON::Serializable

        # Change the state of a CloudWatch alarm.
        @[JSON::Field(key: "cloudwatchAlarm")]
        getter cloudwatch_alarm : Types::CloudwatchAlarmAction?

        # Send data to CloudWatch Logs.
        @[JSON::Field(key: "cloudwatchLogs")]
        getter cloudwatch_logs : Types::CloudwatchLogsAction?

        # Capture a CloudWatch metric.
        @[JSON::Field(key: "cloudwatchMetric")]
        getter cloudwatch_metric : Types::CloudwatchMetricAction?

        # Write to a DynamoDB table.
        @[JSON::Field(key: "dynamoDB")]
        getter dynamo_db : Types::DynamoDBAction?

        # Write to a DynamoDB table. This is a new version of the DynamoDB action. It allows you to write each
        # attribute in an MQTT message payload into a separate DynamoDB column.
        @[JSON::Field(key: "dynamoDBv2")]
        getter dynamo_d_bv2 : Types::DynamoDBv2Action?

        # Write data to an Amazon OpenSearch Service domain. The Elasticsearch action can only be used by
        # existing rule actions. To create a new rule action or to update an existing rule action, use the
        # OpenSearch rule action instead. For more information, see OpenSearchAction .
        @[JSON::Field(key: "elasticsearch")]
        getter elasticsearch : Types::ElasticsearchAction?

        # Write to an Amazon Kinesis Firehose stream.
        @[JSON::Field(key: "firehose")]
        getter firehose : Types::FirehoseAction?

        # Send data to an HTTPS endpoint.
        @[JSON::Field(key: "http")]
        getter http : Types::HttpAction?

        # Sends message data to an IoT Analytics channel.
        @[JSON::Field(key: "iotAnalytics")]
        getter iot_analytics : Types::IotAnalyticsAction?

        # Sends an input to an IoT Events detector.
        @[JSON::Field(key: "iotEvents")]
        getter iot_events : Types::IotEventsAction?

        # Sends data from the MQTT message that triggered the rule to IoT SiteWise asset properties.
        @[JSON::Field(key: "iotSiteWise")]
        getter iot_site_wise : Types::IotSiteWiseAction?

        # Send messages to an Amazon Managed Streaming for Apache Kafka (Amazon MSK) or self-managed Apache
        # Kafka cluster.
        @[JSON::Field(key: "kafka")]
        getter kafka : Types::KafkaAction?

        # Write data to an Amazon Kinesis stream.
        @[JSON::Field(key: "kinesis")]
        getter kinesis : Types::KinesisAction?

        # Invoke a Lambda function.
        @[JSON::Field(key: "lambda")]
        getter lambda : Types::LambdaAction?

        # The Amazon Location Service rule action sends device location updates from an MQTT message to an
        # Amazon Location tracker resource.
        @[JSON::Field(key: "location")]
        getter location : Types::LocationAction?

        # Write data to an Amazon OpenSearch Service domain.
        @[JSON::Field(key: "openSearch")]
        getter open_search : Types::OpenSearchAction?

        # Publish to another MQTT topic.
        @[JSON::Field(key: "republish")]
        getter republish : Types::RepublishAction?

        # Write to an Amazon S3 bucket.
        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3Action?

        # Send a message to a Salesforce IoT Cloud Input Stream.
        @[JSON::Field(key: "salesforce")]
        getter salesforce : Types::SalesforceAction?

        # Publish to an Amazon SNS topic.
        @[JSON::Field(key: "sns")]
        getter sns : Types::SnsAction?

        # Publish to an Amazon SQS queue.
        @[JSON::Field(key: "sqs")]
        getter sqs : Types::SqsAction?

        # Starts execution of a Step Functions state machine.
        @[JSON::Field(key: "stepFunctions")]
        getter step_functions : Types::StepFunctionsAction?

        # The Timestream rule action writes attributes (measures) from an MQTT message into an Amazon
        # Timestream table. For more information, see the Timestream topic rule action documentation.
        @[JSON::Field(key: "timestream")]
        getter timestream : Types::TimestreamAction?

        def initialize(
          @cloudwatch_alarm : Types::CloudwatchAlarmAction? = nil,
          @cloudwatch_logs : Types::CloudwatchLogsAction? = nil,
          @cloudwatch_metric : Types::CloudwatchMetricAction? = nil,
          @dynamo_db : Types::DynamoDBAction? = nil,
          @dynamo_d_bv2 : Types::DynamoDBv2Action? = nil,
          @elasticsearch : Types::ElasticsearchAction? = nil,
          @firehose : Types::FirehoseAction? = nil,
          @http : Types::HttpAction? = nil,
          @iot_analytics : Types::IotAnalyticsAction? = nil,
          @iot_events : Types::IotEventsAction? = nil,
          @iot_site_wise : Types::IotSiteWiseAction? = nil,
          @kafka : Types::KafkaAction? = nil,
          @kinesis : Types::KinesisAction? = nil,
          @lambda : Types::LambdaAction? = nil,
          @location : Types::LocationAction? = nil,
          @open_search : Types::OpenSearchAction? = nil,
          @republish : Types::RepublishAction? = nil,
          @s3 : Types::S3Action? = nil,
          @salesforce : Types::SalesforceAction? = nil,
          @sns : Types::SnsAction? = nil,
          @sqs : Types::SqsAction? = nil,
          @step_functions : Types::StepFunctionsAction? = nil,
          @timestream : Types::TimestreamAction? = nil
        )
        end
      end

      # Information about an active Device Defender security profile behavior violation.
      struct ActiveViolation
        include JSON::Serializable

        # The behavior that is being violated.
        @[JSON::Field(key: "behavior")]
        getter behavior : Types::Behavior?

        # The time the most recent violation occurred.
        @[JSON::Field(key: "lastViolationTime")]
        getter last_violation_time : Time?

        # The value of the metric (the measurement) that caused the most recent violation.
        @[JSON::Field(key: "lastViolationValue")]
        getter last_violation_value : Types::MetricValue?

        # The security profile with the behavior is in violation.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String?

        # The name of the thing responsible for the active violation.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        # The verification state of the violation (detect alarm).
        @[JSON::Field(key: "verificationState")]
        getter verification_state : String?

        # The description of the verification state of the violation.
        @[JSON::Field(key: "verificationStateDescription")]
        getter verification_state_description : String?

        # The details of a violation event.
        @[JSON::Field(key: "violationEventAdditionalInfo")]
        getter violation_event_additional_info : Types::ViolationEventAdditionalInfo?

        # The ID of the active violation.
        @[JSON::Field(key: "violationId")]
        getter violation_id : String?

        # The time the violation started.
        @[JSON::Field(key: "violationStartTime")]
        getter violation_start_time : Time?

        def initialize(
          @behavior : Types::Behavior? = nil,
          @last_violation_time : Time? = nil,
          @last_violation_value : Types::MetricValue? = nil,
          @security_profile_name : String? = nil,
          @thing_name : String? = nil,
          @verification_state : String? = nil,
          @verification_state_description : String? = nil,
          @violation_event_additional_info : Types::ViolationEventAdditionalInfo? = nil,
          @violation_id : String? = nil,
          @violation_start_time : Time? = nil
        )
        end
      end

      struct AddThingToBillingGroupRequest
        include JSON::Serializable

        # The ARN of the billing group.
        @[JSON::Field(key: "billingGroupArn")]
        getter billing_group_arn : String?

        # The name of the billing group. This call is asynchronous. It might take several seconds for the
        # detachment to propagate.
        @[JSON::Field(key: "billingGroupName")]
        getter billing_group_name : String?

        # The ARN of the thing to be added to the billing group.
        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        # The name of the thing to be added to the billing group.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @billing_group_arn : String? = nil,
          @billing_group_name : String? = nil,
          @thing_arn : String? = nil,
          @thing_name : String? = nil
        )
        end
      end

      struct AddThingToBillingGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct AddThingToThingGroupRequest
        include JSON::Serializable

        # Override dynamic thing groups with static thing groups when 10-group limit is reached. If a thing
        # belongs to 10 thing groups, and one or more of those groups are dynamic thing groups, adding a thing
        # to a static group removes the thing from the last dynamic group.
        @[JSON::Field(key: "overrideDynamicGroups")]
        getter override_dynamic_groups : Bool?

        # The ARN of the thing to add to a group.
        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        # The ARN of the group to which you are adding a thing.
        @[JSON::Field(key: "thingGroupArn")]
        getter thing_group_arn : String?

        # The name of the group to which you are adding a thing.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String?

        # The name of the thing to add to a group.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @override_dynamic_groups : Bool? = nil,
          @thing_arn : String? = nil,
          @thing_group_arn : String? = nil,
          @thing_group_name : String? = nil,
          @thing_name : String? = nil
        )
        end
      end

      struct AddThingToThingGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Parameters used when defining a mitigation action that move a set of things to a thing group.
      struct AddThingsToThingGroupParams
        include JSON::Serializable

        # The list of groups to which you want to add the things that triggered the mitigation action. You can
        # add a thing to a maximum of 10 groups, but you can't add a thing to more than one group in the same
        # hierarchy.
        @[JSON::Field(key: "thingGroupNames")]
        getter thing_group_names : Array(String)

        # Specifies if this mitigation action can move the things that triggered the mitigation action even if
        # they are part of one or more dynamic thing groups.
        @[JSON::Field(key: "overrideDynamicGroups")]
        getter override_dynamic_groups : Bool?

        def initialize(
          @thing_group_names : Array(String),
          @override_dynamic_groups : Bool? = nil
        )
        end
      end

      # The type of aggregation queries.
      struct AggregationType
        include JSON::Serializable

        # The name of the aggregation type.
        @[JSON::Field(key: "name")]
        getter name : String

        # A list of the values of aggregation types.
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String,
          @values : Array(String)? = nil
        )
        end
      end

      # A structure containing the alert target ARN and the role ARN.
      struct AlertTarget
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the notification target to which alerts are sent.
        @[JSON::Field(key: "alertTargetArn")]
        getter alert_target_arn : String

        # The ARN of the role that grants permission to send alerts to the notification target.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @alert_target_arn : String,
          @role_arn : String
        )
        end
      end

      # Contains information that allowed the authorization.
      struct Allowed
        include JSON::Serializable

        # A list of policies that allowed the authentication.
        @[JSON::Field(key: "policies")]
        getter policies : Array(Types::Policy)?

        def initialize(
          @policies : Array(Types::Policy)? = nil
        )
        end
      end

      # An asset property timestamp entry containing the following information.
      struct AssetPropertyTimestamp
        include JSON::Serializable

        # A string that contains the time in seconds since epoch. Accepts substitution templates.
        @[JSON::Field(key: "timeInSeconds")]
        getter time_in_seconds : String

        # Optional. A string that contains the nanosecond time offset. Accepts substitution templates.
        @[JSON::Field(key: "offsetInNanos")]
        getter offset_in_nanos : String?

        def initialize(
          @time_in_seconds : String,
          @offset_in_nanos : String? = nil
        )
        end
      end

      # An asset property value entry containing the following information.
      struct AssetPropertyValue
        include JSON::Serializable

        # The asset property value timestamp.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Types::AssetPropertyTimestamp

        # The value of the asset property.
        @[JSON::Field(key: "value")]
        getter value : Types::AssetPropertyVariant

        # Optional. A string that describes the quality of the value. Accepts substitution templates. Must be
        # GOOD , BAD , or UNCERTAIN .
        @[JSON::Field(key: "quality")]
        getter quality : String?

        def initialize(
          @timestamp : Types::AssetPropertyTimestamp,
          @value : Types::AssetPropertyVariant,
          @quality : String? = nil
        )
        end
      end

      # Contains an asset property value (of a single type).
      struct AssetPropertyVariant
        include JSON::Serializable

        # Optional. A string that contains the boolean value ( true or false ) of the value entry. Accepts
        # substitution templates.
        @[JSON::Field(key: "booleanValue")]
        getter boolean_value : String?

        # Optional. A string that contains the double value of the value entry. Accepts substitution
        # templates.
        @[JSON::Field(key: "doubleValue")]
        getter double_value : String?

        # Optional. A string that contains the integer value of the value entry. Accepts substitution
        # templates.
        @[JSON::Field(key: "integerValue")]
        getter integer_value : String?

        # Optional. The string value of the value entry. Accepts substitution templates.
        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @boolean_value : String? = nil,
          @double_value : String? = nil,
          @integer_value : String? = nil,
          @string_value : String? = nil
        )
        end
      end

      struct AssociateSbomWithPackageVersionRequest
        include JSON::Serializable

        # The name of the new software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String

        @[JSON::Field(key: "sbom")]
        getter sbom : Types::Sbom

        # The name of the new package version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @package_name : String,
          @sbom : Types::Sbom,
          @version_name : String,
          @client_token : String? = nil
        )
        end
      end

      struct AssociateSbomWithPackageVersionResponse
        include JSON::Serializable

        # The name of the new software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String?

        @[JSON::Field(key: "sbom")]
        getter sbom : Types::Sbom?

        # The status of the initial validation for the software bill of materials against the Software Package
        # Data Exchange (SPDX) and CycloneDX industry standard formats.
        @[JSON::Field(key: "sbomValidationStatus")]
        getter sbom_validation_status : String?

        # The name of the new package version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        def initialize(
          @package_name : String? = nil,
          @sbom : Types::Sbom? = nil,
          @sbom_validation_status : String? = nil,
          @version_name : String? = nil
        )
        end
      end

      struct AssociateTargetsWithJobRequest
        include JSON::Serializable

        # The unique identifier you assigned to this job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # A list of thing group ARNs that define the targets of the job.
        @[JSON::Field(key: "targets")]
        getter targets : Array(String)

        # An optional comment string describing why the job was associated with the targets.
        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The namespace used to indicate that a job is a customer-managed job. When you specify a value for
        # this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain
        # the value in the following format. $aws/things/ THING_NAME /jobs/ JOB_ID /notify-namespace-
        # NAMESPACE_ID / The namespaceId feature is only supported by IoT Greengrass at this time. For more
        # information, see Setting up IoT Greengrass core devices.
        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        def initialize(
          @job_id : String,
          @targets : Array(String),
          @comment : String? = nil,
          @namespace_id : String? = nil
        )
        end
      end

      struct AssociateTargetsWithJobResponse
        include JSON::Serializable

        # A short text description of the job.
        @[JSON::Field(key: "description")]
        getter description : String?

        # An ARN identifying the job.
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # The unique identifier you assigned to this job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        def initialize(
          @description : String? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil
        )
        end
      end

      struct AttachPolicyRequest
        include JSON::Serializable

        # The name of the policy to attach.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        # The identity to which the policy is attached. For example, a thing group or a certificate.
        @[JSON::Field(key: "target")]
        getter target : String

        def initialize(
          @policy_name : String,
          @target : String
        )
        end
      end

      # The input for the AttachPrincipalPolicy operation.
      struct AttachPrincipalPolicyRequest
        include JSON::Serializable

        # The policy name.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        # The principal, which can be a certificate ARN (as returned from the CreateCertificate operation) or
        # an Amazon Cognito ID.
        @[JSON::Field(key: "x-amzn-iot-principal")]
        getter principal : String

        def initialize(
          @policy_name : String,
          @principal : String
        )
        end
      end

      struct AttachSecurityProfileRequest
        include JSON::Serializable

        # The security profile that is attached.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String

        # The ARN of the target (thing group) to which the security profile is attached.
        @[JSON::Field(key: "securityProfileTargetArn")]
        getter security_profile_target_arn : String

        def initialize(
          @security_profile_name : String,
          @security_profile_target_arn : String
        )
        end
      end

      struct AttachSecurityProfileResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the AttachThingPrincipal operation.
      struct AttachThingPrincipalRequest
        include JSON::Serializable

        # The principal, which can be a certificate ARN (as returned from the CreateCertificate operation) or
        # an Amazon Cognito ID.
        @[JSON::Field(key: "x-amzn-principal")]
        getter principal : String

        # The name of the thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The type of the relation you want to specify when you attach a principal to a thing. EXCLUSIVE_THING
        # - Attaches the specified principal to the specified thing, exclusively. The thing will be the only
        # thing that’s attached to the principal. NON_EXCLUSIVE_THING - Attaches the specified principal to
        # the specified thing. Multiple things can be attached to the principal.
        @[JSON::Field(key: "thingPrincipalType")]
        getter thing_principal_type : String?

        def initialize(
          @principal : String,
          @thing_name : String,
          @thing_principal_type : String? = nil
        )
        end
      end

      # The output from the AttachThingPrincipal operation.
      struct AttachThingPrincipalResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The attribute payload.
      struct AttributePayload
        include JSON::Serializable

        # A JSON string containing up to three key-value pair in JSON format. For example:
        # {\"attributes\":{\"string1\":\"string2\"}}
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # Specifies whether the list of attributes provided in the AttributePayload is merged with the
        # attributes stored in the registry, instead of overwriting them. To remove an attribute, call
        # UpdateThing with an empty attribute value. The merge attribute is only valid when calling
        # UpdateThing or UpdateThingGroup .
        @[JSON::Field(key: "merge")]
        getter merge : Bool?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @merge : Bool? = nil
        )
        end
      end

      # Which audit checks are enabled and disabled for this account.
      struct AuditCheckConfiguration
        include JSON::Serializable

        # A structure containing the configName and corresponding configValue for configuring audit checks.
        @[JSON::Field(key: "configuration")]
        getter configuration : Hash(String, String)?

        # True if this audit check is enabled for this account.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @configuration : Hash(String, String)? = nil,
          @enabled : Bool? = nil
        )
        end
      end

      # Information about the audit check.
      struct AuditCheckDetails
        include JSON::Serializable

        # True if the check is complete and found all resources compliant.
        @[JSON::Field(key: "checkCompliant")]
        getter check_compliant : Bool?

        # The completion status of this check. One of "IN_PROGRESS", "WAITING_FOR_DATA_COLLECTION",
        # "CANCELED", "COMPLETED_COMPLIANT", "COMPLETED_NON_COMPLIANT", or "FAILED".
        @[JSON::Field(key: "checkRunStatus")]
        getter check_run_status : String?

        # The code of any error encountered when this check is performed during this audit. One of
        # "INSUFFICIENT_PERMISSIONS" or "AUDIT_CHECK_DISABLED".
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The message associated with any error encountered when this check is performed during this audit.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The number of resources that were found noncompliant during the check.
        @[JSON::Field(key: "nonCompliantResourcesCount")]
        getter non_compliant_resources_count : Int64?

        # Describes how many of the non-compliant resources created during the evaluation of an audit check
        # were marked as suppressed.
        @[JSON::Field(key: "suppressedNonCompliantResourcesCount")]
        getter suppressed_non_compliant_resources_count : Int64?

        # The number of resources on which the check was performed.
        @[JSON::Field(key: "totalResourcesCount")]
        getter total_resources_count : Int64?

        def initialize(
          @check_compliant : Bool? = nil,
          @check_run_status : String? = nil,
          @error_code : String? = nil,
          @message : String? = nil,
          @non_compliant_resources_count : Int64? = nil,
          @suppressed_non_compliant_resources_count : Int64? = nil,
          @total_resources_count : Int64? = nil
        )
        end
      end

      # The findings (results) of the audit.
      struct AuditFinding
        include JSON::Serializable

        # The audit check that generated this result.
        @[JSON::Field(key: "checkName")]
        getter check_name : String?

        # A unique identifier for this set of audit findings. This identifier is used to apply mitigation
        # tasks to one or more sets of findings.
        @[JSON::Field(key: "findingId")]
        getter finding_id : String?

        # The time the result (finding) was discovered.
        @[JSON::Field(key: "findingTime")]
        getter finding_time : Time?

        # Indicates whether the audit finding was suppressed or not during reporting.
        @[JSON::Field(key: "isSuppressed")]
        getter is_suppressed : Bool?

        # The resource that was found to be noncompliant with the audit check.
        @[JSON::Field(key: "nonCompliantResource")]
        getter non_compliant_resource : Types::NonCompliantResource?

        # The reason the resource was noncompliant.
        @[JSON::Field(key: "reasonForNonCompliance")]
        getter reason_for_non_compliance : String?

        # A code that indicates the reason that the resource was noncompliant.
        @[JSON::Field(key: "reasonForNonComplianceCode")]
        getter reason_for_non_compliance_code : String?

        # The list of related resources.
        @[JSON::Field(key: "relatedResources")]
        getter related_resources : Array(Types::RelatedResource)?

        # The severity of the result (finding).
        @[JSON::Field(key: "severity")]
        getter severity : String?

        # The ID of the audit that generated this result (finding).
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        # The time the audit started.
        @[JSON::Field(key: "taskStartTime")]
        getter task_start_time : Time?

        def initialize(
          @check_name : String? = nil,
          @finding_id : String? = nil,
          @finding_time : Time? = nil,
          @is_suppressed : Bool? = nil,
          @non_compliant_resource : Types::NonCompliantResource? = nil,
          @reason_for_non_compliance : String? = nil,
          @reason_for_non_compliance_code : String? = nil,
          @related_resources : Array(Types::RelatedResource)? = nil,
          @severity : String? = nil,
          @task_id : String? = nil,
          @task_start_time : Time? = nil
        )
        end
      end

      # Returned by ListAuditMitigationActionsTask, this object contains information that describes a
      # mitigation action that has been started.
      struct AuditMitigationActionExecutionMetadata
        include JSON::Serializable

        # The unique identifier for the mitigation action being applied by the task.
        @[JSON::Field(key: "actionId")]
        getter action_id : String?

        # The friendly name of the mitigation action being applied by the task.
        @[JSON::Field(key: "actionName")]
        getter action_name : String?

        # The date and time when the task was completed or canceled. Blank if the task is still running.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # If an error occurred, the code that indicates which type of error occurred.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The unique identifier for the findings to which the task and associated mitigation action are
        # applied.
        @[JSON::Field(key: "findingId")]
        getter finding_id : String?

        # If an error occurred, a message that describes the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The date and time when the task was started.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The current status of the task being executed.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The unique identifier for the task that applies the mitigation action.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @action_id : String? = nil,
          @action_name : String? = nil,
          @end_time : Time? = nil,
          @error_code : String? = nil,
          @finding_id : String? = nil,
          @message : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @task_id : String? = nil
        )
        end
      end

      # Information about an audit mitigation actions task that is returned by
      # ListAuditMitigationActionsTasks .
      struct AuditMitigationActionsTaskMetadata
        include JSON::Serializable

        # The time at which the audit mitigation actions task was started.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The unique identifier for the task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        # The current state of the audit mitigation actions task.
        @[JSON::Field(key: "taskStatus")]
        getter task_status : String?

        def initialize(
          @start_time : Time? = nil,
          @task_id : String? = nil,
          @task_status : String? = nil
        )
        end
      end

      # Used in MitigationActionParams, this information identifies the target findings to which the
      # mitigation actions are applied. Only one entry appears.
      struct AuditMitigationActionsTaskTarget
        include JSON::Serializable

        # Specifies a filter in the form of an audit check and set of reason codes that identify the findings
        # from the audit to which the audit mitigation actions task apply.
        @[JSON::Field(key: "auditCheckToReasonCodeFilter")]
        getter audit_check_to_reason_code_filter : Hash(String, Array(String))?

        # If the task will apply a mitigation action to findings from a specific audit, this value uniquely
        # identifies the audit.
        @[JSON::Field(key: "auditTaskId")]
        getter audit_task_id : String?

        # If the task will apply a mitigation action to one or more listed findings, this value uniquely
        # identifies those findings.
        @[JSON::Field(key: "findingIds")]
        getter finding_ids : Array(String)?

        def initialize(
          @audit_check_to_reason_code_filter : Hash(String, Array(String))? = nil,
          @audit_task_id : String? = nil,
          @finding_ids : Array(String)? = nil
        )
        end
      end

      # Information about the targets to which audit notifications are sent.
      struct AuditNotificationTarget
        include JSON::Serializable

        # True if notifications to the target are enabled.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The ARN of the role that grants permission to send notifications to the target.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The ARN of the target (SNS topic) to which audit notifications are sent.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        def initialize(
          @enabled : Bool? = nil,
          @role_arn : String? = nil,
          @target_arn : String? = nil
        )
        end
      end

      # Filters out specific findings of a Device Defender audit.
      struct AuditSuppression
        include JSON::Serializable

        @[JSON::Field(key: "checkName")]
        getter check_name : String

        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : Types::ResourceIdentifier

        # The description of the audit suppression.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The expiration date (epoch timestamp in seconds) that you want the suppression to adhere to.
        @[JSON::Field(key: "expirationDate")]
        getter expiration_date : Time?

        # Indicates whether a suppression should exist indefinitely or not.
        @[JSON::Field(key: "suppressIndefinitely")]
        getter suppress_indefinitely : Bool?

        def initialize(
          @check_name : String,
          @resource_identifier : Types::ResourceIdentifier,
          @description : String? = nil,
          @expiration_date : Time? = nil,
          @suppress_indefinitely : Bool? = nil
        )
        end
      end

      # The audits that were performed.
      struct AuditTaskMetadata
        include JSON::Serializable

        # The ID of this audit.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        # The status of this audit. One of "IN_PROGRESS", "COMPLETED", "FAILED", or "CANCELED".
        @[JSON::Field(key: "taskStatus")]
        getter task_status : String?

        # The type of this audit. One of "ON_DEMAND_AUDIT_TASK" or "SCHEDULED_AUDIT_TASK".
        @[JSON::Field(key: "taskType")]
        getter task_type : String?

        def initialize(
          @task_id : String? = nil,
          @task_status : String? = nil,
          @task_type : String? = nil
        )
        end
      end

      # A collection of authorization information.
      struct AuthInfo
        include JSON::Serializable

        # The resources for which the principal is being authorized to perform the specified action.
        @[JSON::Field(key: "resources")]
        getter resources : Array(String)

        # The type of action for which the principal is being authorized.
        @[JSON::Field(key: "actionType")]
        getter action_type : String?

        def initialize(
          @resources : Array(String),
          @action_type : String? = nil
        )
        end
      end

      # The authorizer result.
      struct AuthResult
        include JSON::Serializable

        # The policies and statements that allowed the specified action.
        @[JSON::Field(key: "allowed")]
        getter allowed : Types::Allowed?

        # The final authorization decision of this scenario. Multiple statements are taken into account when
        # determining the authorization decision. An explicit deny statement can override multiple allow
        # statements.
        @[JSON::Field(key: "authDecision")]
        getter auth_decision : String?

        # Authorization information.
        @[JSON::Field(key: "authInfo")]
        getter auth_info : Types::AuthInfo?

        # The policies and statements that denied the specified action.
        @[JSON::Field(key: "denied")]
        getter denied : Types::Denied?

        # Contains any missing context values found while evaluating policy.
        @[JSON::Field(key: "missingContextValues")]
        getter missing_context_values : Array(String)?

        def initialize(
          @allowed : Types::Allowed? = nil,
          @auth_decision : String? = nil,
          @auth_info : Types::AuthInfo? = nil,
          @denied : Types::Denied? = nil,
          @missing_context_values : Array(String)? = nil
        )
        end
      end

      # An object that specifies the authorization service for a domain.
      struct AuthorizerConfig
        include JSON::Serializable

        # A Boolean that specifies whether the domain configuration's authorization service can be overridden.
        @[JSON::Field(key: "allowAuthorizerOverride")]
        getter allow_authorizer_override : Bool?

        # The name of the authorization service for a domain configuration.
        @[JSON::Field(key: "defaultAuthorizerName")]
        getter default_authorizer_name : String?

        def initialize(
          @allow_authorizer_override : Bool? = nil,
          @default_authorizer_name : String? = nil
        )
        end
      end

      # The authorizer description.
      struct AuthorizerDescription
        include JSON::Serializable

        # The authorizer ARN.
        @[JSON::Field(key: "authorizerArn")]
        getter authorizer_arn : String?

        # The authorizer's Lambda function ARN.
        @[JSON::Field(key: "authorizerFunctionArn")]
        getter authorizer_function_arn : String?

        # The authorizer name.
        @[JSON::Field(key: "authorizerName")]
        getter authorizer_name : String?

        # The UNIX timestamp of when the authorizer was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # When true , the result from the authorizer’s Lambda function is cached for the time specified in
        # refreshAfterInSeconds . The cached result is used while the device reuses the same HTTP connection.
        @[JSON::Field(key: "enableCachingForHttp")]
        getter enable_caching_for_http : Bool?

        # The UNIX timestamp of when the authorizer was last updated.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # Specifies whether IoT validates the token signature in an authorization request.
        @[JSON::Field(key: "signingDisabled")]
        getter signing_disabled : Bool?

        # The status of the authorizer.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The key used to extract the token from the HTTP headers.
        @[JSON::Field(key: "tokenKeyName")]
        getter token_key_name : String?

        # The public keys used to validate the token signature returned by your custom authentication service.
        @[JSON::Field(key: "tokenSigningPublicKeys")]
        getter token_signing_public_keys : Hash(String, String)?

        def initialize(
          @authorizer_arn : String? = nil,
          @authorizer_function_arn : String? = nil,
          @authorizer_name : String? = nil,
          @creation_date : Time? = nil,
          @enable_caching_for_http : Bool? = nil,
          @last_modified_date : Time? = nil,
          @signing_disabled : Bool? = nil,
          @status : String? = nil,
          @token_key_name : String? = nil,
          @token_signing_public_keys : Hash(String, String)? = nil
        )
        end
      end

      # The authorizer summary.
      struct AuthorizerSummary
        include JSON::Serializable

        # The authorizer ARN.
        @[JSON::Field(key: "authorizerArn")]
        getter authorizer_arn : String?

        # The authorizer name.
        @[JSON::Field(key: "authorizerName")]
        getter authorizer_name : String?

        def initialize(
          @authorizer_arn : String? = nil,
          @authorizer_name : String? = nil
        )
        end
      end

      # The criteria that determine when and how a job abort takes place.
      struct AwsJobAbortConfig
        include JSON::Serializable

        # The list of criteria that determine when and how to abort the job.
        @[JSON::Field(key: "abortCriteriaList")]
        getter abort_criteria_list : Array(Types::AwsJobAbortCriteria)

        def initialize(
          @abort_criteria_list : Array(Types::AwsJobAbortCriteria)
        )
        end
      end

      # The criteria that determine when and how a job abort takes place.
      struct AwsJobAbortCriteria
        include JSON::Serializable

        # The type of job action to take to initiate the job abort.
        @[JSON::Field(key: "action")]
        getter action : String

        # The type of job execution failures that can initiate a job abort.
        @[JSON::Field(key: "failureType")]
        getter failure_type : String

        # The minimum number of things which must receive job execution notifications before the job can be
        # aborted.
        @[JSON::Field(key: "minNumberOfExecutedThings")]
        getter min_number_of_executed_things : Int32

        # The minimum percentage of job execution failures that must occur to initiate the job abort. Amazon
        # Web Services IoT Core supports up to two digits after the decimal (for example, 10.9 and 10.99, but
        # not 10.999).
        @[JSON::Field(key: "thresholdPercentage")]
        getter threshold_percentage : Float64

        def initialize(
          @action : String,
          @failure_type : String,
          @min_number_of_executed_things : Int32,
          @threshold_percentage : Float64
        )
        end
      end

      # Configuration for the rollout of OTA updates.
      struct AwsJobExecutionsRolloutConfig
        include JSON::Serializable

        # The rate of increase for a job rollout. This parameter allows you to define an exponential rate
        # increase for a job rollout.
        @[JSON::Field(key: "exponentialRate")]
        getter exponential_rate : Types::AwsJobExponentialRolloutRate?

        # The maximum number of OTA update job executions started per minute.
        @[JSON::Field(key: "maximumPerMinute")]
        getter maximum_per_minute : Int32?

        def initialize(
          @exponential_rate : Types::AwsJobExponentialRolloutRate? = nil,
          @maximum_per_minute : Int32? = nil
        )
        end
      end

      # The rate of increase for a job rollout. This parameter allows you to define an exponential rate
      # increase for a job rollout.
      struct AwsJobExponentialRolloutRate
        include JSON::Serializable

        # The minimum number of things that will be notified of a pending job, per minute, at the start of the
        # job rollout. This is the initial rate of the rollout.
        @[JSON::Field(key: "baseRatePerMinute")]
        getter base_rate_per_minute : Int32

        # The rate of increase for a job rollout. The number of things notified is multiplied by this factor.
        @[JSON::Field(key: "incrementFactor")]
        getter increment_factor : Float64

        # The criteria to initiate the increase in rate of rollout for a job. Amazon Web Services IoT Core
        # supports up to one digit after the decimal (for example, 1.5, but not 1.55).
        @[JSON::Field(key: "rateIncreaseCriteria")]
        getter rate_increase_criteria : Types::AwsJobRateIncreaseCriteria

        def initialize(
          @base_rate_per_minute : Int32,
          @increment_factor : Float64,
          @rate_increase_criteria : Types::AwsJobRateIncreaseCriteria
        )
        end
      end

      # Configuration information for pre-signed URLs. Valid when protocols contains HTTP.
      struct AwsJobPresignedUrlConfig
        include JSON::Serializable

        # How long (in seconds) pre-signed URLs are valid. Valid values are 60 - 3600, the default value is
        # 1800 seconds. Pre-signed URLs are generated when a request for the job document is received.
        @[JSON::Field(key: "expiresInSec")]
        getter expires_in_sec : Int64?

        def initialize(
          @expires_in_sec : Int64? = nil
        )
        end
      end

      # The criteria to initiate the increase in rate of rollout for a job.
      struct AwsJobRateIncreaseCriteria
        include JSON::Serializable

        # When this number of things have been notified, it will initiate an increase in the rollout rate.
        @[JSON::Field(key: "numberOfNotifiedThings")]
        getter number_of_notified_things : Int32?

        # When this number of things have succeeded in their job execution, it will initiate an increase in
        # the rollout rate.
        @[JSON::Field(key: "numberOfSucceededThings")]
        getter number_of_succeeded_things : Int32?

        def initialize(
          @number_of_notified_things : Int32? = nil,
          @number_of_succeeded_things : Int32? = nil
        )
        end
      end

      # Specifies the amount of time each device has to finish its execution of the job. A timer is started
      # when the job execution status is set to IN_PROGRESS . If the job execution status is not set to
      # another terminal state before the timer expires, it will be automatically set to TIMED_OUT .
      struct AwsJobTimeoutConfig
        include JSON::Serializable

        # Specifies the amount of time, in minutes, this device has to finish execution of this job. The
        # timeout interval can be anywhere between 1 minute and 7 days (1 to 10080 minutes). The in progress
        # timer can't be updated and will apply to all job executions for the job. Whenever a job execution
        # remains in the IN_PROGRESS status for longer than this interval, the job execution will fail and
        # switch to the terminal TIMED_OUT status.
        @[JSON::Field(key: "inProgressTimeoutInMinutes")]
        getter in_progress_timeout_in_minutes : Int64?

        def initialize(
          @in_progress_timeout_in_minutes : Int64? = nil
        )
        end
      end

      # Configures the command to treat the payloadTemplate as a JSON document for preprocessing. This
      # preprocessor substitutes placeholders with parameter values to generate the command execution
      # request payload.
      struct AwsJsonSubstitutionCommandPreprocessorConfig
        include JSON::Serializable

        # Converts the command preprocessor result to the format defined by this parameter, before sending it
        # to the device.
        @[JSON::Field(key: "outputFormat")]
        getter output_format : String

        def initialize(
          @output_format : String
        )
        end
      end

      # Configuration settings for batching.
      struct BatchConfig
        include JSON::Serializable

        # The maximum amount of time (in milliseconds) that an outgoing call waits for other calls with which
        # it batches messages of the same type. The higher the setting, the longer the latency of the batched
        # HTTP Action will be.
        @[JSON::Field(key: "maxBatchOpenMs")]
        getter max_batch_open_ms : Int32?

        # The maximum number of messages that are batched together in a single action execution.
        @[JSON::Field(key: "maxBatchSize")]
        getter max_batch_size : Int32?

        # Maximum size of a message batch, in bytes.
        @[JSON::Field(key: "maxBatchSizeBytes")]
        getter max_batch_size_bytes : Int32?

        def initialize(
          @max_batch_open_ms : Int32? = nil,
          @max_batch_size : Int32? = nil,
          @max_batch_size_bytes : Int32? = nil
        )
        end
      end

      # A Device Defender security profile behavior.
      struct Behavior
        include JSON::Serializable

        # The name you've given to the behavior.
        @[JSON::Field(key: "name")]
        getter name : String

        # The criteria that determine if a device is behaving normally in regard to the metric . In the IoT
        # console, you can choose to be sent an alert through Amazon SNS when IoT Device Defender detects that
        # a device is behaving anomalously.
        @[JSON::Field(key: "criteria")]
        getter criteria : Types::BehaviorCriteria?

        # Value indicates exporting metrics related to the behavior when it is true.
        @[JSON::Field(key: "exportMetric")]
        getter export_metric : Bool?

        # What is measured by the behavior.
        @[JSON::Field(key: "metric")]
        getter metric : String?

        # The dimension for a metric in your behavior. For example, using a TOPIC_FILTER dimension, you can
        # narrow down the scope of the metric to only MQTT topics where the name matches the pattern specified
        # in the dimension. This can't be used with custom metrics.
        @[JSON::Field(key: "metricDimension")]
        getter metric_dimension : Types::MetricDimension?

        # Suppresses alerts.
        @[JSON::Field(key: "suppressAlerts")]
        getter suppress_alerts : Bool?

        def initialize(
          @name : String,
          @criteria : Types::BehaviorCriteria? = nil,
          @export_metric : Bool? = nil,
          @metric : String? = nil,
          @metric_dimension : Types::MetricDimension? = nil,
          @suppress_alerts : Bool? = nil
        )
        end
      end

      # The criteria by which the behavior is determined to be normal.
      struct BehaviorCriteria
        include JSON::Serializable

        # The operator that relates the thing measured ( metric ) to the criteria (containing a value or
        # statisticalThreshold ). Valid operators include: string-list : in-set and not-in-set number-list :
        # in-set and not-in-set ip-address-list : in-cidr-set and not-in-cidr-set number : less-than ,
        # less-than-equals , greater-than , and greater-than-equals
        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String?

        # If a device is in violation of the behavior for the specified number of consecutive datapoints, an
        # alarm occurs. If not specified, the default is 1.
        @[JSON::Field(key: "consecutiveDatapointsToAlarm")]
        getter consecutive_datapoints_to_alarm : Int32?

        # If an alarm has occurred and the offending device is no longer in violation of the behavior for the
        # specified number of consecutive datapoints, the alarm is cleared. If not specified, the default is
        # 1.
        @[JSON::Field(key: "consecutiveDatapointsToClear")]
        getter consecutive_datapoints_to_clear : Int32?

        # Use this to specify the time duration over which the behavior is evaluated, for those criteria that
        # have a time dimension (for example, NUM_MESSAGES_SENT ). For a statisticalThreshhold metric
        # comparison, measurements from all devices are accumulated over this time duration before being used
        # to calculate percentiles, and later, measurements from an individual device are also accumulated
        # over this time duration before being given a percentile rank. Cannot be used with list-based metric
        # datatypes.
        @[JSON::Field(key: "durationSeconds")]
        getter duration_seconds : Int32?

        # The configuration of an ML Detect
        @[JSON::Field(key: "mlDetectionConfig")]
        getter ml_detection_config : Types::MachineLearningDetectionConfig?

        # A statistical ranking (percentile)that indicates a threshold value by which a behavior is determined
        # to be in compliance or in violation of the behavior.
        @[JSON::Field(key: "statisticalThreshold")]
        getter statistical_threshold : Types::StatisticalThreshold?

        # The value to be compared with the metric .
        @[JSON::Field(key: "value")]
        getter value : Types::MetricValue?

        def initialize(
          @comparison_operator : String? = nil,
          @consecutive_datapoints_to_alarm : Int32? = nil,
          @consecutive_datapoints_to_clear : Int32? = nil,
          @duration_seconds : Int32? = nil,
          @ml_detection_config : Types::MachineLearningDetectionConfig? = nil,
          @statistical_threshold : Types::StatisticalThreshold? = nil,
          @value : Types::MetricValue? = nil
        )
        end
      end

      # The summary of an ML Detect behavior model.
      struct BehaviorModelTrainingSummary
        include JSON::Serializable

        # The name of the behavior.
        @[JSON::Field(key: "behaviorName")]
        getter behavior_name : String?

        # The percentage of datapoints collected.
        @[JSON::Field(key: "datapointsCollectionPercentage")]
        getter datapoints_collection_percentage : Float64?

        # The date the model was last refreshed.
        @[JSON::Field(key: "lastModelRefreshDate")]
        getter last_model_refresh_date : Time?

        # The status of the behavior model.
        @[JSON::Field(key: "modelStatus")]
        getter model_status : String?

        # The name of the security profile.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String?

        # The date a training model started collecting data.
        @[JSON::Field(key: "trainingDataCollectionStartDate")]
        getter training_data_collection_start_date : Time?

        def initialize(
          @behavior_name : String? = nil,
          @datapoints_collection_percentage : Float64? = nil,
          @last_model_refresh_date : Time? = nil,
          @model_status : String? = nil,
          @security_profile_name : String? = nil,
          @training_data_collection_start_date : Time? = nil
        )
        end
      end

      # Additional information about the billing group.
      struct BillingGroupMetadata
        include JSON::Serializable

        # The date the billing group was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        def initialize(
          @creation_date : Time? = nil
        )
        end
      end

      # The properties of a billing group.
      struct BillingGroupProperties
        include JSON::Serializable

        # The description of the billing group.
        @[JSON::Field(key: "billingGroupDescription")]
        getter billing_group_description : String?

        def initialize(
          @billing_group_description : String? = nil
        )
        end
      end

      # A count of documents that meets a specific aggregation criteria.
      struct Bucket
        include JSON::Serializable

        # The number of documents that have the value counted for the particular bucket.
        @[JSON::Field(key: "count")]
        getter count : Int32?

        # The value counted for the particular bucket.
        @[JSON::Field(key: "keyValue")]
        getter key_value : String?

        def initialize(
          @count : Int32? = nil,
          @key_value : String? = nil
        )
        end
      end

      # The type of bucketed aggregation performed.
      struct BucketsAggregationType
        include JSON::Serializable

        # Performs an aggregation that will return a list of buckets. The list of buckets is a ranked list of
        # the number of occurrences of an aggregation field value.
        @[JSON::Field(key: "termsAggregation")]
        getter terms_aggregation : Types::TermsAggregation?

        def initialize(
          @terms_aggregation : Types::TermsAggregation? = nil
        )
        end
      end

      # A CA certificate.
      struct CACertificate
        include JSON::Serializable

        # The ARN of the CA certificate.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The ID of the CA certificate.
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String?

        # The date the CA certificate was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The status of the CA certificate. The status value REGISTER_INACTIVE is deprecated and should not be
        # used.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_id : String? = nil,
          @creation_date : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes a CA certificate.
      struct CACertificateDescription
        include JSON::Serializable

        # Whether the CA certificate configured for auto registration of device certificates. Valid values are
        # "ENABLE" and "DISABLE"
        @[JSON::Field(key: "autoRegistrationStatus")]
        getter auto_registration_status : String?

        # The CA certificate ARN.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The CA certificate ID.
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String?

        # The mode of the CA. All the device certificates that are registered using this CA will be registered
        # in the same mode as the CA. For more information about certificate mode for device certificates, see
        # certificate mode .
        @[JSON::Field(key: "certificateMode")]
        getter certificate_mode : String?

        # The CA certificate data, in PEM format.
        @[JSON::Field(key: "certificatePem")]
        getter certificate_pem : String?

        # The date the CA certificate was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The customer version of the CA certificate.
        @[JSON::Field(key: "customerVersion")]
        getter customer_version : Int32?

        # The generation ID of the CA certificate.
        @[JSON::Field(key: "generationId")]
        getter generation_id : String?

        # The date the CA certificate was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The owner of the CA certificate.
        @[JSON::Field(key: "ownedBy")]
        getter owned_by : String?

        # The status of a CA certificate.
        @[JSON::Field(key: "status")]
        getter status : String?

        # When the CA certificate is valid.
        @[JSON::Field(key: "validity")]
        getter validity : Types::CertificateValidity?

        def initialize(
          @auto_registration_status : String? = nil,
          @certificate_arn : String? = nil,
          @certificate_id : String? = nil,
          @certificate_mode : String? = nil,
          @certificate_pem : String? = nil,
          @creation_date : Time? = nil,
          @customer_version : Int32? = nil,
          @generation_id : String? = nil,
          @last_modified_date : Time? = nil,
          @owned_by : String? = nil,
          @status : String? = nil,
          @validity : Types::CertificateValidity? = nil
        )
        end
      end

      struct CancelAuditMitigationActionsTaskRequest
        include JSON::Serializable

        # The unique identifier for the task that you want to cancel.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end

      struct CancelAuditMitigationActionsTaskResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct CancelAuditTaskRequest
        include JSON::Serializable

        # The ID of the audit you want to cancel. You can only cancel an audit that is "IN_PROGRESS".
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end

      struct CancelAuditTaskResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the CancelCertificateTransfer operation.
      struct CancelCertificateTransferRequest
        include JSON::Serializable

        # The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String

        def initialize(
          @certificate_id : String
        )
        end
      end

      struct CancelDetectMitigationActionsTaskRequest
        include JSON::Serializable

        # The unique identifier of the task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end

      struct CancelDetectMitigationActionsTaskResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct CancelJobExecutionRequest
        include JSON::Serializable

        # The ID of the job to be canceled.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The name of the thing whose execution of the job will be canceled.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # (Optional) The expected current version of the job execution. Each time you update the job
        # execution, its version is incremented. If the version of the job execution stored in Jobs does not
        # match, the update is rejected with a VersionMismatch error, and an ErrorResponse that contains the
        # current job execution status data is returned. (This makes it unnecessary to perform a separate
        # DescribeJobExecution request in order to obtain the job execution status data.)
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        # (Optional) If true the job execution will be canceled if it has status IN_PROGRESS or QUEUED,
        # otherwise the job execution will be canceled only if it has status QUEUED. If you attempt to cancel
        # a job execution that is IN_PROGRESS, and you do not set force to true , then an
        # InvalidStateTransitionException will be thrown. The default is false . Canceling a job execution
        # which is "IN_PROGRESS", will cause the device to be unable to update the job execution status. Use
        # caution and ensure that the device is able to recover to a valid state.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        # A collection of name/value pairs that describe the status of the job execution. If not specified,
        # the statusDetails are unchanged. You can specify at most 10 name/value pairs.
        @[JSON::Field(key: "statusDetails")]
        getter status_details : Hash(String, String)?

        def initialize(
          @job_id : String,
          @thing_name : String,
          @expected_version : Int64? = nil,
          @force : Bool? = nil,
          @status_details : Hash(String, String)? = nil
        )
        end
      end

      struct CancelJobRequest
        include JSON::Serializable

        # The unique identifier you assigned to this job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # An optional comment string describing why the job was canceled.
        @[JSON::Field(key: "comment")]
        getter comment : String?

        # (Optional) If true job executions with status "IN_PROGRESS" and "QUEUED" are canceled, otherwise
        # only job executions with status "QUEUED" are canceled. The default is false . Canceling a job which
        # is "IN_PROGRESS", will cause a device which is executing the job to be unable to update the job
        # execution status. Use caution and ensure that each device executing a job which is canceled is able
        # to recover to a valid state.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        # (Optional)A reason code string that explains why the job was canceled.
        @[JSON::Field(key: "reasonCode")]
        getter reason_code : String?

        def initialize(
          @job_id : String,
          @comment : String? = nil,
          @force : Bool? = nil,
          @reason_code : String? = nil
        )
        end
      end

      struct CancelJobResponse
        include JSON::Serializable

        # A short text description of the job.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The job ARN.
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # The unique identifier you assigned to this job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        def initialize(
          @description : String? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil
        )
        end
      end

      # Information about a certificate.
      struct Certificate
        include JSON::Serializable

        # The ARN of the certificate.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String?

        # The mode of the certificate. DEFAULT : A certificate in DEFAULT mode is either generated by Amazon
        # Web Services IoT Core or registered with an issuer certificate authority (CA) in DEFAULT mode.
        # Devices with certificates in DEFAULT mode aren't required to send the Server Name Indication (SNI)
        # extension when connecting to Amazon Web Services IoT Core. However, to use features such as custom
        # domains and VPC endpoints, we recommend that you use the SNI extension when connecting to Amazon Web
        # Services IoT Core. SNI_ONLY : A certificate in SNI_ONLY mode is registered without an issuer CA.
        # Devices with certificates in SNI_ONLY mode must send the SNI extension when connecting to Amazon Web
        # Services IoT Core.
        @[JSON::Field(key: "certificateMode")]
        getter certificate_mode : String?

        # The date and time the certificate was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The status of the certificate. The status value REGISTER_INACTIVE is deprecated and should not be
        # used.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_id : String? = nil,
          @certificate_mode : String? = nil,
          @creation_date : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Unable to verify the CA certificate used to sign the device certificate you are attempting to
      # register. This is happens when you have registered more than one CA certificate that has the same
      # subject field and public key.
      struct CertificateConflictException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a certificate.
      struct CertificateDescription
        include JSON::Serializable

        # The certificate ID of the CA certificate used to sign this certificate.
        @[JSON::Field(key: "caCertificateId")]
        getter ca_certificate_id : String?

        # The ARN of the certificate.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The ID of the certificate.
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String?

        # The mode of the certificate. DEFAULT : A certificate in DEFAULT mode is either generated by Amazon
        # Web Services IoT Core or registered with an issuer certificate authority (CA) in DEFAULT mode.
        # Devices with certificates in DEFAULT mode aren't required to send the Server Name Indication (SNI)
        # extension when connecting to Amazon Web Services IoT Core. However, to use features such as custom
        # domains and VPC endpoints, we recommend that you use the SNI extension when connecting to Amazon Web
        # Services IoT Core. SNI_ONLY : A certificate in SNI_ONLY mode is registered without an issuer CA.
        # Devices with certificates in SNI_ONLY mode must send the SNI extension when connecting to Amazon Web
        # Services IoT Core. For more information about the value for SNI extension, see Transport security in
        # IoT .
        @[JSON::Field(key: "certificateMode")]
        getter certificate_mode : String?

        # The certificate data, in PEM format.
        @[JSON::Field(key: "certificatePem")]
        getter certificate_pem : String?

        # The date and time the certificate was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The customer version of the certificate.
        @[JSON::Field(key: "customerVersion")]
        getter customer_version : Int32?

        # The generation ID of the certificate.
        @[JSON::Field(key: "generationId")]
        getter generation_id : String?

        # The date and time the certificate was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The ID of the Amazon Web Services account that owns the certificate.
        @[JSON::Field(key: "ownedBy")]
        getter owned_by : String?

        # The ID of the Amazon Web Services account of the previous owner of the certificate.
        @[JSON::Field(key: "previousOwnedBy")]
        getter previous_owned_by : String?

        # The status of the certificate.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The transfer data.
        @[JSON::Field(key: "transferData")]
        getter transfer_data : Types::TransferData?

        # When the certificate is valid.
        @[JSON::Field(key: "validity")]
        getter validity : Types::CertificateValidity?

        def initialize(
          @ca_certificate_id : String? = nil,
          @certificate_arn : String? = nil,
          @certificate_id : String? = nil,
          @certificate_mode : String? = nil,
          @certificate_pem : String? = nil,
          @creation_date : Time? = nil,
          @customer_version : Int32? = nil,
          @generation_id : String? = nil,
          @last_modified_date : Time? = nil,
          @owned_by : String? = nil,
          @previous_owned_by : String? = nil,
          @status : String? = nil,
          @transfer_data : Types::TransferData? = nil,
          @validity : Types::CertificateValidity? = nil
        )
        end
      end

      # The certificate provider summary.
      struct CertificateProviderSummary
        include JSON::Serializable

        # The ARN of the certificate provider.
        @[JSON::Field(key: "certificateProviderArn")]
        getter certificate_provider_arn : String?

        # The name of the certificate provider.
        @[JSON::Field(key: "certificateProviderName")]
        getter certificate_provider_name : String?

        def initialize(
          @certificate_provider_arn : String? = nil,
          @certificate_provider_name : String? = nil
        )
        end
      end

      # The certificate operation is not allowed.
      struct CertificateStateException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The certificate is invalid.
      struct CertificateValidationException
        include JSON::Serializable

        # Additional information about the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # When the certificate is valid.
      struct CertificateValidity
        include JSON::Serializable

        # The certificate is not valid after this date.
        @[JSON::Field(key: "notAfter")]
        getter not_after : Time?

        # The certificate is not valid before this date.
        @[JSON::Field(key: "notBefore")]
        getter not_before : Time?

        def initialize(
          @not_after : Time? = nil,
          @not_before : Time? = nil
        )
        end
      end

      struct ClearDefaultAuthorizerRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct ClearDefaultAuthorizerResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An object that speciﬁes the client certificate conﬁguration for a domain.
      struct ClientCertificateConfig
        include JSON::Serializable

        # The ARN of the Lambda function that IoT invokes after mutual TLS authentication during the
        # connection.
        @[JSON::Field(key: "clientCertificateCallbackArn")]
        getter client_certificate_callback_arn : String?

        def initialize(
          @client_certificate_callback_arn : String? = nil
        )
        end
      end

      # Describes an action that updates a CloudWatch alarm.
      struct CloudwatchAlarmAction
        include JSON::Serializable

        # The CloudWatch alarm name.
        @[JSON::Field(key: "alarmName")]
        getter alarm_name : String

        # The IAM role that allows access to the CloudWatch alarm.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The reason for the alarm change.
        @[JSON::Field(key: "stateReason")]
        getter state_reason : String

        # The value of the alarm state. Acceptable values are: OK, ALARM, INSUFFICIENT_DATA.
        @[JSON::Field(key: "stateValue")]
        getter state_value : String

        def initialize(
          @alarm_name : String,
          @role_arn : String,
          @state_reason : String,
          @state_value : String
        )
        end
      end

      # Describes an action that sends data to CloudWatch Logs.
      struct CloudwatchLogsAction
        include JSON::Serializable

        # The CloudWatch log group to which the action sends data.
        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String

        # The IAM role that allows access to the CloudWatch log.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Indicates whether batches of log records will be extracted and uploaded into CloudWatch. Values
        # include true or false (default) .
        @[JSON::Field(key: "batchMode")]
        getter batch_mode : Bool?

        def initialize(
          @log_group_name : String,
          @role_arn : String,
          @batch_mode : Bool? = nil
        )
        end
      end

      # Describes an action that captures a CloudWatch metric.
      struct CloudwatchMetricAction
        include JSON::Serializable

        # The CloudWatch metric name.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The CloudWatch metric namespace name.
        @[JSON::Field(key: "metricNamespace")]
        getter metric_namespace : String

        # The metric unit supported by CloudWatch.
        @[JSON::Field(key: "metricUnit")]
        getter metric_unit : String

        # The CloudWatch metric value.
        @[JSON::Field(key: "metricValue")]
        getter metric_value : String

        # The IAM role that allows access to the CloudWatch metric.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # An optional Unix timestamp .
        @[JSON::Field(key: "metricTimestamp")]
        getter metric_timestamp : String?

        def initialize(
          @metric_name : String,
          @metric_namespace : String,
          @metric_unit : String,
          @metric_value : String,
          @role_arn : String,
          @metric_timestamp : String? = nil
        )
        end
      end

      # Describes the method to use when code signing a file.
      struct CodeSigning
        include JSON::Serializable

        # The ID of the AWSSignerJob which was created to sign the file.
        @[JSON::Field(key: "awsSignerJobId")]
        getter aws_signer_job_id : String?

        # A custom method for code signing a file.
        @[JSON::Field(key: "customCodeSigning")]
        getter custom_code_signing : Types::CustomCodeSigning?

        # Describes the code-signing job.
        @[JSON::Field(key: "startSigningJobParameter")]
        getter start_signing_job_parameter : Types::StartSigningJobParameter?

        def initialize(
          @aws_signer_job_id : String? = nil,
          @custom_code_signing : Types::CustomCodeSigning? = nil,
          @start_signing_job_parameter : Types::StartSigningJobParameter? = nil
        )
        end
      end

      # Describes the certificate chain being used when code signing a file.
      struct CodeSigningCertificateChain
        include JSON::Serializable

        # The name of the certificate.
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String?

        # A base64 encoded binary representation of the code signing certificate chain.
        @[JSON::Field(key: "inlineDocument")]
        getter inline_document : String?

        def initialize(
          @certificate_name : String? = nil,
          @inline_document : String? = nil
        )
        end
      end

      # Describes the signature for a file.
      struct CodeSigningSignature
        include JSON::Serializable

        # A base64 encoded binary representation of the code signing signature.
        @[JSON::Field(key: "inlineDocument")]
        getter inline_document : Bytes?

        def initialize(
          @inline_document : Bytes? = nil
        )
        end
      end

      # The result value of the command execution. The device can use the result field to share additional
      # details about the execution such as a return value of a remote function call. This field is not
      # applicable if you use the AWS-IoT-FleetWise namespace.
      struct CommandExecutionResult
        include JSON::Serializable

        # An attribute of type Boolean. For example: "BOOL": true
        @[JSON::Field(key: "B")]
        getter b : Bool?

        # An attribute of type Binary.
        @[JSON::Field(key: "BIN")]
        getter bin : Bytes?

        # An attribute of type String. For example: "S": "Hello"
        @[JSON::Field(key: "S")]
        getter s : String?

        def initialize(
          @b : Bool? = nil,
          @bin : Bytes? = nil,
          @s : String? = nil
        )
        end
      end

      # Summary information about a particular command execution.
      struct CommandExecutionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the command execution.
        @[JSON::Field(key: "commandArn")]
        getter command_arn : String?

        # The date and time at which the command completed executing on the target device.
        @[JSON::Field(key: "completedAt")]
        getter completed_at : Time?

        # The date and time at which the command execution was created for the target device.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The unique identifier of the command execution.
        @[JSON::Field(key: "executionId")]
        getter execution_id : String?

        # The date and time at which the command started executing on the target device.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The status of the command executions.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the target device for which the command is being executed.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        def initialize(
          @command_arn : String? = nil,
          @completed_at : Time? = nil,
          @created_at : Time? = nil,
          @execution_id : String? = nil,
          @started_at : Time? = nil,
          @status : String? = nil,
          @target_arn : String? = nil
        )
        end
      end

      # A map of key-value pairs that describe the command.
      struct CommandParameter
        include JSON::Serializable

        # The name of a specific parameter used in a command and command execution.
        @[JSON::Field(key: "name")]
        getter name : String

        # The default value used to describe the command. This is the value assumed by the parameter if no
        # other value is assigned to it.
        @[JSON::Field(key: "defaultValue")]
        getter default_value : Types::CommandParameterValue?

        # The description of the command parameter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The type of the command parameter.
        @[JSON::Field(key: "type")]
        getter type : String?

        # Parameter value that overrides the default value, if set.
        @[JSON::Field(key: "value")]
        getter value : Types::CommandParameterValue?

        # The list of conditions that a command parameter value must satisfy to create a command execution.
        @[JSON::Field(key: "valueConditions")]
        getter value_conditions : Array(Types::CommandParameterValueCondition)?

        def initialize(
          @name : String,
          @default_value : Types::CommandParameterValue? = nil,
          @description : String? = nil,
          @type : String? = nil,
          @value : Types::CommandParameterValue? = nil,
          @value_conditions : Array(Types::CommandParameterValueCondition)? = nil
        )
        end
      end

      # The value of a command parameter used to create a command execution. The commandParameterValue can
      # only have one of the below fields listed.
      struct CommandParameterValue
        include JSON::Serializable

        # An attribute of type Boolean. For example: "BOOL": true
        @[JSON::Field(key: "B")]
        getter b : Bool?

        # An attribute of type Binary. For example: "B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"
        @[JSON::Field(key: "BIN")]
        getter bin : Bytes?

        # An attribute of type Double (Sixty-Four Bits).
        @[JSON::Field(key: "D")]
        getter d : Float64?

        # An attribute of type Integer (Thirty-Two Bits).
        @[JSON::Field(key: "I")]
        getter i : Int32?

        # An attribute of type Long.
        @[JSON::Field(key: "L")]
        getter l : Int64?

        # An attribute of type String. For example: "S": "Hello"
        @[JSON::Field(key: "S")]
        getter s : String?

        # An attribute of type unsigned long.
        @[JSON::Field(key: "UL")]
        getter ul : String?

        def initialize(
          @b : Bool? = nil,
          @bin : Bytes? = nil,
          @d : Float64? = nil,
          @i : Int32? = nil,
          @l : Int64? = nil,
          @s : String? = nil,
          @ul : String? = nil
        )
        end
      end

      # The comparison operand used to compare the defined value against the value supplied in request.
      struct CommandParameterValueComparisonOperand
        include JSON::Serializable

        # An operand of number value type, defined as a string.
        @[JSON::Field(key: "number")]
        getter number : String?

        # An operand of numerical range value type.
        @[JSON::Field(key: "numberRange")]
        getter number_range : Types::CommandParameterValueNumberRange?

        # A List of operands of numerical value type, defined as strings.
        @[JSON::Field(key: "numbers")]
        getter numbers : Array(String)?

        # An operand of string value type.
        @[JSON::Field(key: "string")]
        getter string : String?

        # A List of operands of string value type.
        @[JSON::Field(key: "strings")]
        getter strings : Array(String)?

        def initialize(
          @number : String? = nil,
          @number_range : Types::CommandParameterValueNumberRange? = nil,
          @numbers : Array(String)? = nil,
          @string : String? = nil,
          @strings : Array(String)? = nil
        )
        end
      end

      # A condition for the command parameter that must be evaluated to true for successful creation of a
      # command execution.
      struct CommandParameterValueCondition
        include JSON::Serializable

        # The comparison operator for the command parameter. IN_RANGE, and NOT_IN_RANGE operators include
        # boundary values.
        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String

        # The comparison operand for the command parameter.
        @[JSON::Field(key: "operand")]
        getter operand : Types::CommandParameterValueComparisonOperand

        def initialize(
          @comparison_operator : String,
          @operand : Types::CommandParameterValueComparisonOperand
        )
        end
      end

      # The numerical range value type to compare a command parameter value against.
      struct CommandParameterValueNumberRange
        include JSON::Serializable

        # The maximum value of a numerical range of a command parameter value.
        @[JSON::Field(key: "max")]
        getter max : String

        # The minimum value of a numerical range of a command parameter value.
        @[JSON::Field(key: "min")]
        getter min : String

        def initialize(
          @max : String,
          @min : String
        )
        end
      end

      # The command payload object that contains the instructions for the device to process.
      struct CommandPayload
        include JSON::Serializable

        # The static payload file for the command.
        @[JSON::Field(key: "content")]
        getter content : Bytes?

        # The content type that specifies the format type of the payload file. This field must use a
        # type/subtype format, such as application/json . For information about various content types, see
        # Common MIME types .
        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        def initialize(
          @content : Bytes? = nil,
          @content_type : String? = nil
        )
        end
      end

      # Configuration that determines how the payloadTemplate is processed by the service to generate the
      # final payload sent to devices at StartCommandExecution API invocation.
      struct CommandPreprocessor
        include JSON::Serializable

        # Configuration for the JSON substitution preprocessor.
        @[JSON::Field(key: "awsJsonSubstitution")]
        getter aws_json_substitution : Types::AwsJsonSubstitutionCommandPreprocessorConfig?

        def initialize(
          @aws_json_substitution : Types::AwsJsonSubstitutionCommandPreprocessorConfig? = nil
        )
        end
      end

      # Summary information about a particular command resource.
      struct CommandSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the command.
        @[JSON::Field(key: "commandArn")]
        getter command_arn : String?

        # The unique identifier of the command.
        @[JSON::Field(key: "commandId")]
        getter command_id : String?

        # The timestamp, when the command was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Indicates whether the command has been deprecated.
        @[JSON::Field(key: "deprecated")]
        getter deprecated : Bool?

        # The display name of the command.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The timestamp, when the command was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # Indicates whether the command is pending deletion.
        @[JSON::Field(key: "pendingDeletion")]
        getter pending_deletion : Bool?

        def initialize(
          @command_arn : String? = nil,
          @command_id : String? = nil,
          @created_at : Time? = nil,
          @deprecated : Bool? = nil,
          @display_name : String? = nil,
          @last_updated_at : Time? = nil,
          @pending_deletion : Bool? = nil
        )
        end
      end

      # Configuration.
      struct Configuration
        include JSON::Serializable

        # True to enable the configuration.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # The encryption configuration details that include the status information of the Key Management
      # Service (KMS) key and the KMS access role.
      struct ConfigurationDetails
        include JSON::Serializable

        # The health status of KMS key and KMS access role. If either KMS key or KMS access role is UNHEALTHY
        # , the return value will be UNHEALTHY . To use a customer managed KMS key, the value of
        # configurationStatus must be HEALTHY .
        @[JSON::Field(key: "configurationStatus")]
        getter configuration_status : String?

        # The error code that indicates either the KMS key or the KMS access role is UNHEALTHY . Valid values:
        # KMS_KEY_VALIDATION_ERROR and ROLE_VALIDATION_ERROR .
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The detailed error message that corresponds to the errorCode .
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @configuration_status : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      struct ConfirmTopicRuleDestinationRequest
        include JSON::Serializable

        # The token used to confirm ownership or access to the topic rule confirmation URL.
        @[JSON::Field(key: "confirmationToken")]
        getter confirmation_token : String

        def initialize(
          @confirmation_token : String
        )
        end
      end

      struct ConfirmTopicRuleDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request conflicts with the current state of the resource.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # A resource with the same name already exists.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil
        )
        end
      end

      # A conflicting resource update exception. This exception is thrown when two pending updates cause a
      # conflict.
      struct ConflictingResourceUpdateException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CreateAuditSuppressionRequest
        include JSON::Serializable

        @[JSON::Field(key: "checkName")]
        getter check_name : String

        # Each audit supression must have a unique client request token. If you try to create a new audit
        # suppression with the same token as one that already exists, an exception occurs. If you omit this
        # value, Amazon Web Services SDKs will automatically generate a unique client request.
        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String

        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : Types::ResourceIdentifier

        # The description of the audit suppression.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The epoch timestamp in seconds at which this suppression expires.
        @[JSON::Field(key: "expirationDate")]
        getter expiration_date : Time?

        # Indicates whether a suppression should exist indefinitely or not.
        @[JSON::Field(key: "suppressIndefinitely")]
        getter suppress_indefinitely : Bool?

        def initialize(
          @check_name : String,
          @client_request_token : String,
          @resource_identifier : Types::ResourceIdentifier,
          @description : String? = nil,
          @expiration_date : Time? = nil,
          @suppress_indefinitely : Bool? = nil
        )
        end
      end

      struct CreateAuditSuppressionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateAuthorizerRequest
        include JSON::Serializable

        # The ARN of the authorizer's Lambda function.
        @[JSON::Field(key: "authorizerFunctionArn")]
        getter authorizer_function_arn : String

        # The authorizer name.
        @[JSON::Field(key: "authorizerName")]
        getter authorizer_name : String

        # When true , the result from the authorizer’s Lambda function is cached for clients that use
        # persistent HTTP connections. The results are cached for the time specified by the Lambda function in
        # refreshAfterInSeconds . This value does not affect authorization of clients that use MQTT
        # connections. The default value is false .
        @[JSON::Field(key: "enableCachingForHttp")]
        getter enable_caching_for_http : Bool?

        # Specifies whether IoT validates the token signature in an authorization request.
        @[JSON::Field(key: "signingDisabled")]
        getter signing_disabled : Bool?

        # The status of the create authorizer request.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Metadata which can be used to manage the custom authorizer. For URI Request parameters use format:
        # ...key1=value1&amp;key2=value2... For the CLI command-line parameter use format: &amp;&amp;tags
        # "key1=value1&amp;key2=value2..." For the cli-input-json file use format: "tags":
        # "key1=value1&amp;key2=value2..."
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The name of the token key used to extract the token from the HTTP headers.
        @[JSON::Field(key: "tokenKeyName")]
        getter token_key_name : String?

        # The public keys used to verify the digital signature returned by your custom authentication service.
        @[JSON::Field(key: "tokenSigningPublicKeys")]
        getter token_signing_public_keys : Hash(String, String)?

        def initialize(
          @authorizer_function_arn : String,
          @authorizer_name : String,
          @enable_caching_for_http : Bool? = nil,
          @signing_disabled : Bool? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @token_key_name : String? = nil,
          @token_signing_public_keys : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAuthorizerResponse
        include JSON::Serializable

        # The authorizer ARN.
        @[JSON::Field(key: "authorizerArn")]
        getter authorizer_arn : String?

        # The authorizer's name.
        @[JSON::Field(key: "authorizerName")]
        getter authorizer_name : String?

        def initialize(
          @authorizer_arn : String? = nil,
          @authorizer_name : String? = nil
        )
        end
      end

      struct CreateBillingGroupRequest
        include JSON::Serializable

        # The name you wish to give to the billing group.
        @[JSON::Field(key: "billingGroupName")]
        getter billing_group_name : String

        # The properties of the billing group.
        @[JSON::Field(key: "billingGroupProperties")]
        getter billing_group_properties : Types::BillingGroupProperties?

        # Metadata which can be used to manage the billing group.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @billing_group_name : String,
          @billing_group_properties : Types::BillingGroupProperties? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateBillingGroupResponse
        include JSON::Serializable

        # The ARN of the billing group.
        @[JSON::Field(key: "billingGroupArn")]
        getter billing_group_arn : String?

        # The ID of the billing group.
        @[JSON::Field(key: "billingGroupId")]
        getter billing_group_id : String?

        # The name you gave to the billing group.
        @[JSON::Field(key: "billingGroupName")]
        getter billing_group_name : String?

        def initialize(
          @billing_group_arn : String? = nil,
          @billing_group_id : String? = nil,
          @billing_group_name : String? = nil
        )
        end
      end

      # The input for the CreateCertificateFromCsr operation.
      struct CreateCertificateFromCsrRequest
        include JSON::Serializable

        # The certificate signing request (CSR).
        @[JSON::Field(key: "certificateSigningRequest")]
        getter certificate_signing_request : String

        # Specifies whether the certificate is active.
        @[JSON::Field(key: "setAsActive")]
        getter set_as_active : Bool?

        def initialize(
          @certificate_signing_request : String,
          @set_as_active : Bool? = nil
        )
        end
      end

      # The output from the CreateCertificateFromCsr operation.
      struct CreateCertificateFromCsrResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate. You can use the ARN as a principal for policy
        # operations.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The ID of the certificate. Certificate management operations only take a certificateId.
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String?

        # The certificate data, in PEM format.
        @[JSON::Field(key: "certificatePem")]
        getter certificate_pem : String?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_id : String? = nil,
          @certificate_pem : String? = nil
        )
        end
      end

      struct CreateCertificateProviderRequest
        include JSON::Serializable

        # A list of the operations that the certificate provider will use to generate certificates. Valid
        # value: CreateCertificateFromCsr .
        @[JSON::Field(key: "accountDefaultForOperations")]
        getter account_default_for_operations : Array(String)

        # The name of the certificate provider.
        @[JSON::Field(key: "certificateProviderName")]
        getter certificate_provider_name : String

        # The ARN of the Lambda function that defines the authentication logic.
        @[JSON::Field(key: "lambdaFunctionArn")]
        getter lambda_function_arn : String

        # A string that you can optionally pass in the CreateCertificateProvider request to make sure the
        # request is idempotent.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Metadata which can be used to manage the certificate provider.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_default_for_operations : Array(String),
          @certificate_provider_name : String,
          @lambda_function_arn : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateCertificateProviderResponse
        include JSON::Serializable

        # The ARN of the certificate provider.
        @[JSON::Field(key: "certificateProviderArn")]
        getter certificate_provider_arn : String?

        # The name of the certificate provider.
        @[JSON::Field(key: "certificateProviderName")]
        getter certificate_provider_name : String?

        def initialize(
          @certificate_provider_arn : String? = nil,
          @certificate_provider_name : String? = nil
        )
        end
      end

      struct CreateCommandRequest
        include JSON::Serializable

        # A unique identifier for the command. We recommend using UUID. Alpha-numeric characters, hyphens, and
        # underscores are valid for use here.
        @[JSON::Field(key: "commandId")]
        getter command_id : String

        # A short text decription of the command.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The user-friendly name in the console for the command. This name doesn't have to be unique. You can
        # update the user-friendly name after you define it.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # A list of parameters that are used by StartCommandExecution API for execution payload generation.
        @[JSON::Field(key: "mandatoryParameters")]
        getter mandatory_parameters : Array(Types::CommandParameter)?

        # The namespace of the command. The MQTT reserved topics and validations will be used for command
        # executions according to the namespace setting.
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The payload object for the static command. You can upload a static payload file from your local
        # storage that contains the instructions for the device to process. The payload file can use any
        # format. To make sure that the device correctly interprets the payload, we recommend you to specify
        # the payload content type.
        @[JSON::Field(key: "payload")]
        getter payload : Types::CommandPayload?

        # The payload template for the dynamic command. This parameter is required for dynamic commands where
        # the command execution placeholders are supplied either from mandatoryParameters or when
        # StartCommandExecution is invoked.
        @[JSON::Field(key: "payloadTemplate")]
        getter payload_template : String?

        # Configuration that determines how payloadTemplate is processed to generate command execution
        # payload. This parameter is required for dynamic commands, along with payloadTemplate , and
        # mandatoryParameters .
        @[JSON::Field(key: "preprocessor")]
        getter preprocessor : Types::CommandPreprocessor?

        # The IAM role that you must provide when using the AWS-IoT-FleetWise namespace. The role grants IoT
        # Device Management the permission to access IoT FleetWise resources for generating the payload for
        # the command. This field is not supported when you use the AWS-IoT namespace.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Name-value pairs that are used as metadata to manage a command.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @command_id : String,
          @description : String? = nil,
          @display_name : String? = nil,
          @mandatory_parameters : Array(Types::CommandParameter)? = nil,
          @namespace : String? = nil,
          @payload : Types::CommandPayload? = nil,
          @payload_template : String? = nil,
          @preprocessor : Types::CommandPreprocessor? = nil,
          @role_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateCommandResponse
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the command. For example,
        # arn:aws:iot:&lt;region&gt;:&lt;accountid&gt;:command/&lt;commandId&gt;
        @[JSON::Field(key: "commandArn")]
        getter command_arn : String?

        # The unique identifier for the command.
        @[JSON::Field(key: "commandId")]
        getter command_id : String?

        def initialize(
          @command_arn : String? = nil,
          @command_id : String? = nil
        )
        end
      end

      struct CreateCustomMetricRequest
        include JSON::Serializable

        # Each custom metric must have a unique client request token. If you try to create a new custom metric
        # that already exists with a different token, an exception occurs. If you omit this value, Amazon Web
        # Services SDKs will automatically generate a unique client request.
        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String

        # The name of the custom metric. This will be used in the metric report submitted from the
        # device/thing. The name can't begin with aws: . You can't change the name after you define it.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The type of the custom metric. The type number only takes a single metric value as an input, but
        # when you submit the metrics value in the DeviceMetrics report, you must pass it as an array with a
        # single value.
        @[JSON::Field(key: "metricType")]
        getter metric_type : String

        # The friendly name in the console for the custom metric. This name doesn't have to be unique. Don't
        # use this name as the metric identifier in the device metric report. You can update the friendly name
        # after you define it.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # Metadata that can be used to manage the custom metric.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_request_token : String,
          @metric_name : String,
          @metric_type : String,
          @display_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateCustomMetricResponse
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the custom metric. For example, arn: aws-partition :iot: region
        # : accountId :custommetric/ metricName
        @[JSON::Field(key: "metricArn")]
        getter metric_arn : String?

        # The name of the custom metric to be used in the metric report.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        def initialize(
          @metric_arn : String? = nil,
          @metric_name : String? = nil
        )
        end
      end

      struct CreateDimensionRequest
        include JSON::Serializable

        # Each dimension must have a unique client request token. If you try to create a new dimension with
        # the same token as a dimension that already exists, an exception occurs. If you omit this value,
        # Amazon Web Services SDKs will automatically generate a unique client request.
        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String

        # A unique identifier for the dimension. Choose something that describes the type and value to make it
        # easy to remember what it does.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies the value or list of values for the dimension. For TOPIC_FILTER dimensions, this is a
        # pattern used to match the MQTT topic (for example, "admin/#").
        @[JSON::Field(key: "stringValues")]
        getter string_values : Array(String)

        # Specifies the type of dimension. Supported types: TOPIC_FILTER.
        @[JSON::Field(key: "type")]
        getter type : String

        # Metadata that can be used to manage the dimension.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_request_token : String,
          @name : String,
          @string_values : Array(String),
          @type : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDimensionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created dimension.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A unique identifier for the dimension.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct CreateDomainConfigurationRequest
        include JSON::Serializable

        # The name of the domain configuration. This value must be unique to a region.
        @[JSON::Field(key: "domainConfigurationName")]
        getter domain_configuration_name : String

        # An enumerated string that speciﬁes the application-layer protocol. SECURE_MQTT - MQTT over TLS.
        # MQTT_WSS - MQTT over WebSocket. HTTPS - HTTP over TLS. DEFAULT - Use a combination of port and
        # Application Layer Protocol Negotiation (ALPN) to specify application_layer protocol. For more
        # information, see Device communication protocols .
        @[JSON::Field(key: "applicationProtocol")]
        getter application_protocol : String?

        # An enumerated string that speciﬁes the authentication type. CUSTOM_AUTH_X509 - Use custom
        # authentication and authorization with additional details from the X.509 client certificate.
        # CUSTOM_AUTH - Use custom authentication and authorization. For more information, see Custom
        # authentication and authorization . AWS_X509 - Use X.509 client certificates without custom
        # authentication and authorization. For more information, see X.509 client certificates . AWS_SIGV4 -
        # Use Amazon Web Services Signature Version 4. For more information, see IAM users, groups, and roles
        # . DEFAULT - Use a combination of port and Application Layer Protocol Negotiation (ALPN) to specify
        # authentication type. For more information, see Device communication protocols .
        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String?

        # An object that specifies the authorization service for a domain.
        @[JSON::Field(key: "authorizerConfig")]
        getter authorizer_config : Types::AuthorizerConfig?

        # An object that speciﬁes the client certificate conﬁguration for a domain.
        @[JSON::Field(key: "clientCertificateConfig")]
        getter client_certificate_config : Types::ClientCertificateConfig?

        # The name of the domain.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The ARNs of the certificates that IoT passes to the device during the TLS handshake. Currently you
        # can specify only one certificate ARN. This value is not required for Amazon Web Services-managed
        # domains.
        @[JSON::Field(key: "serverCertificateArns")]
        getter server_certificate_arns : Array(String)?

        # The server certificate configuration.
        @[JSON::Field(key: "serverCertificateConfig")]
        getter server_certificate_config : Types::ServerCertificateConfig?

        # The type of service delivered by the endpoint. Amazon Web Services IoT Core currently supports only
        # the DATA service type.
        @[JSON::Field(key: "serviceType")]
        getter service_type : String?

        # Metadata which can be used to manage the domain configuration. For URI Request parameters use
        # format: ...key1=value1&amp;key2=value2... For the CLI command-line parameter use format:
        # &amp;&amp;tags "key1=value1&amp;key2=value2..." For the cli-input-json file use format: "tags":
        # "key1=value1&amp;key2=value2..."
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # An object that specifies the TLS configuration for a domain.
        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfig?

        # The certificate used to validate the server certificate and prove domain name ownership. This
        # certificate must be signed by a public certificate authority. This value is not required for Amazon
        # Web Services-managed domains.
        @[JSON::Field(key: "validationCertificateArn")]
        getter validation_certificate_arn : String?

        def initialize(
          @domain_configuration_name : String,
          @application_protocol : String? = nil,
          @authentication_type : String? = nil,
          @authorizer_config : Types::AuthorizerConfig? = nil,
          @client_certificate_config : Types::ClientCertificateConfig? = nil,
          @domain_name : String? = nil,
          @server_certificate_arns : Array(String)? = nil,
          @server_certificate_config : Types::ServerCertificateConfig? = nil,
          @service_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tls_config : Types::TlsConfig? = nil,
          @validation_certificate_arn : String? = nil
        )
        end
      end

      struct CreateDomainConfigurationResponse
        include JSON::Serializable

        # The ARN of the domain configuration.
        @[JSON::Field(key: "domainConfigurationArn")]
        getter domain_configuration_arn : String?

        # The name of the domain configuration.
        @[JSON::Field(key: "domainConfigurationName")]
        getter domain_configuration_name : String?

        def initialize(
          @domain_configuration_arn : String? = nil,
          @domain_configuration_name : String? = nil
        )
        end
      end

      struct CreateDynamicThingGroupRequest
        include JSON::Serializable

        # The dynamic thing group search query string. See Query Syntax for information about query string
        # syntax.
        @[JSON::Field(key: "queryString")]
        getter query_string : String

        # The dynamic thing group name to create.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String

        # The dynamic thing group index name. Currently one index is supported: AWS_Things .
        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The dynamic thing group query version. Currently one query version is supported: "2017-09-30". If
        # not specified, the query version defaults to this value.
        @[JSON::Field(key: "queryVersion")]
        getter query_version : String?

        # Metadata which can be used to manage the dynamic thing group.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The dynamic thing group properties.
        @[JSON::Field(key: "thingGroupProperties")]
        getter thing_group_properties : Types::ThingGroupProperties?

        def initialize(
          @query_string : String,
          @thing_group_name : String,
          @index_name : String? = nil,
          @query_version : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @thing_group_properties : Types::ThingGroupProperties? = nil
        )
        end
      end

      struct CreateDynamicThingGroupResponse
        include JSON::Serializable

        # The dynamic thing group index name.
        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The dynamic thing group search query string.
        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        # The dynamic thing group query version.
        @[JSON::Field(key: "queryVersion")]
        getter query_version : String?

        # The dynamic thing group ARN.
        @[JSON::Field(key: "thingGroupArn")]
        getter thing_group_arn : String?

        # The dynamic thing group ID.
        @[JSON::Field(key: "thingGroupId")]
        getter thing_group_id : String?

        # The dynamic thing group name.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String?

        def initialize(
          @index_name : String? = nil,
          @query_string : String? = nil,
          @query_version : String? = nil,
          @thing_group_arn : String? = nil,
          @thing_group_id : String? = nil,
          @thing_group_name : String? = nil
        )
        end
      end

      struct CreateFleetMetricRequest
        include JSON::Serializable

        # The field to aggregate.
        @[JSON::Field(key: "aggregationField")]
        getter aggregation_field : String

        # The type of the aggregation query.
        @[JSON::Field(key: "aggregationType")]
        getter aggregation_type : Types::AggregationType

        # The name of the fleet metric to create.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The time in seconds between fleet metric emissions. Range [60(1 min), 86400(1 day)] and must be
        # multiple of 60.
        @[JSON::Field(key: "period")]
        getter period : Int32

        # The search query string.
        @[JSON::Field(key: "queryString")]
        getter query_string : String

        # The fleet metric description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the index to search.
        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The query version.
        @[JSON::Field(key: "queryVersion")]
        getter query_version : String?

        # Metadata, which can be used to manage the fleet metric.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # Used to support unit transformation such as milliseconds to seconds. The unit must be supported by
        # CW metric . Default to null.
        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @aggregation_field : String,
          @aggregation_type : Types::AggregationType,
          @metric_name : String,
          @period : Int32,
          @query_string : String,
          @description : String? = nil,
          @index_name : String? = nil,
          @query_version : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @unit : String? = nil
        )
        end
      end

      struct CreateFleetMetricResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new fleet metric.
        @[JSON::Field(key: "metricArn")]
        getter metric_arn : String?

        # The name of the fleet metric to create.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        def initialize(
          @metric_arn : String? = nil,
          @metric_name : String? = nil
        )
        end
      end

      struct CreateJobRequest
        include JSON::Serializable

        # A job identifier which must be unique for your account. We recommend using a UUID. Alpha-numeric
        # characters, "-" and "_" are valid for use here.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # A list of things and thing groups to which the job should be sent.
        @[JSON::Field(key: "targets")]
        getter targets : Array(String)

        # Allows you to create the criteria to abort a job.
        @[JSON::Field(key: "abortConfig")]
        getter abort_config : Types::AbortConfig?

        # A short text description of the job.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The package version Amazon Resource Names (ARNs) that are installed on the device when the job
        # successfully completes. The package version must be in either the Published or Deprecated state when
        # the job deploys. For more information, see Package version lifecycle . Note: The following Length
        # Constraints relates to a single ARN. Up to 25 package version ARNs are allowed.
        @[JSON::Field(key: "destinationPackageVersions")]
        getter destination_package_versions : Array(String)?

        # The job document. Required if you don't specify a value for documentSource .
        @[JSON::Field(key: "document")]
        getter document : String?

        # Parameters of an Amazon Web Services managed template that you can specify to create the job
        # document. documentParameters can only be used when creating jobs from Amazon Web Services managed
        # templates. This parameter can't be used with custom job templates or to create jobs from them.
        @[JSON::Field(key: "documentParameters")]
        getter document_parameters : Hash(String, String)?

        # An S3 link, or S3 object URL, to the job document. The link is an Amazon S3 object URL and is
        # required if you don't specify a value for document . For example, --document-source https://s3.
        # region-code .amazonaws.com/example-firmware/device-firmware.1.0 For more information, see Methods
        # for accessing a bucket .
        @[JSON::Field(key: "documentSource")]
        getter document_source : String?

        # Allows you to create the criteria to retry a job.
        @[JSON::Field(key: "jobExecutionsRetryConfig")]
        getter job_executions_retry_config : Types::JobExecutionsRetryConfig?

        # Allows you to create a staged rollout of the job.
        @[JSON::Field(key: "jobExecutionsRolloutConfig")]
        getter job_executions_rollout_config : Types::JobExecutionsRolloutConfig?

        # The ARN of the job template used to create the job.
        @[JSON::Field(key: "jobTemplateArn")]
        getter job_template_arn : String?

        # The namespace used to indicate that a job is a customer-managed job. When you specify a value for
        # this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain
        # the value in the following format. $aws/things/ THING_NAME /jobs/ JOB_ID /notify-namespace-
        # NAMESPACE_ID / The namespaceId feature is only supported by IoT Greengrass at this time. For more
        # information, see Setting up IoT Greengrass core devices.
        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        # Configuration information for pre-signed S3 URLs.
        @[JSON::Field(key: "presignedUrlConfig")]
        getter presigned_url_config : Types::PresignedUrlConfig?

        # The configuration that allows you to schedule a job for a future date and time in addition to
        # specifying the end behavior for each job execution.
        @[JSON::Field(key: "schedulingConfig")]
        getter scheduling_config : Types::SchedulingConfig?

        # Metadata which can be used to manage the job.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those
        # things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be
        # run on a thing when a change is detected in a target. For example, a job will run on a thing when
        # the thing is added to a target group, even after the job was completed by all things originally in
        # the group. We recommend that you use continuous jobs instead of snapshot jobs for dynamic thing
        # group targets. By using continuous jobs, devices that join the group receive the job execution even
        # after the job has been created.
        @[JSON::Field(key: "targetSelection")]
        getter target_selection : String?

        # Specifies the amount of time each device has to finish its execution of the job. The timer is
        # started when the job execution status is set to IN_PROGRESS . If the job execution status is not set
        # to another terminal state before the time expires, it will be automatically set to TIMED_OUT .
        @[JSON::Field(key: "timeoutConfig")]
        getter timeout_config : Types::TimeoutConfig?

        def initialize(
          @job_id : String,
          @targets : Array(String),
          @abort_config : Types::AbortConfig? = nil,
          @description : String? = nil,
          @destination_package_versions : Array(String)? = nil,
          @document : String? = nil,
          @document_parameters : Hash(String, String)? = nil,
          @document_source : String? = nil,
          @job_executions_retry_config : Types::JobExecutionsRetryConfig? = nil,
          @job_executions_rollout_config : Types::JobExecutionsRolloutConfig? = nil,
          @job_template_arn : String? = nil,
          @namespace_id : String? = nil,
          @presigned_url_config : Types::PresignedUrlConfig? = nil,
          @scheduling_config : Types::SchedulingConfig? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_selection : String? = nil,
          @timeout_config : Types::TimeoutConfig? = nil
        )
        end
      end

      struct CreateJobResponse
        include JSON::Serializable

        # The job description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The job ARN.
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # The unique identifier you assigned to this job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        def initialize(
          @description : String? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil
        )
        end
      end

      struct CreateJobTemplateRequest
        include JSON::Serializable

        # A description of the job document.
        @[JSON::Field(key: "description")]
        getter description : String

        # A unique identifier for the job template. We recommend using a UUID. Alpha-numeric characters, "-",
        # and "_" are valid for use here.
        @[JSON::Field(key: "jobTemplateId")]
        getter job_template_id : String

        @[JSON::Field(key: "abortConfig")]
        getter abort_config : Types::AbortConfig?

        # The package version Amazon Resource Names (ARNs) that are installed on the device when the job
        # successfully completes. The package version must be in either the Published or Deprecated state when
        # the job deploys. For more information, see Package version lifecycle . Note: The following Length
        # Constraints relates to a single ARN. Up to 25 package version ARNs are allowed.
        @[JSON::Field(key: "destinationPackageVersions")]
        getter destination_package_versions : Array(String)?

        # The job document. Required if you don't specify a value for documentSource .
        @[JSON::Field(key: "document")]
        getter document : String?

        # An S3 link, or S3 object URL, to the job document. The link is an Amazon S3 object URL and is
        # required if you don't specify a value for document . For example, --document-source https://s3.
        # region-code .amazonaws.com/example-firmware/device-firmware.1.0 For more information, see Methods
        # for accessing a bucket .
        @[JSON::Field(key: "documentSource")]
        getter document_source : String?

        # The ARN of the job to use as the basis for the job template.
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # Allows you to create the criteria to retry a job.
        @[JSON::Field(key: "jobExecutionsRetryConfig")]
        getter job_executions_retry_config : Types::JobExecutionsRetryConfig?

        @[JSON::Field(key: "jobExecutionsRolloutConfig")]
        getter job_executions_rollout_config : Types::JobExecutionsRolloutConfig?

        # Allows you to configure an optional maintenance window for the rollout of a job document to all
        # devices in the target group for a job.
        @[JSON::Field(key: "maintenanceWindows")]
        getter maintenance_windows : Array(Types::MaintenanceWindow)?

        @[JSON::Field(key: "presignedUrlConfig")]
        getter presigned_url_config : Types::PresignedUrlConfig?

        # Metadata that can be used to manage the job template.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        @[JSON::Field(key: "timeoutConfig")]
        getter timeout_config : Types::TimeoutConfig?

        def initialize(
          @description : String,
          @job_template_id : String,
          @abort_config : Types::AbortConfig? = nil,
          @destination_package_versions : Array(String)? = nil,
          @document : String? = nil,
          @document_source : String? = nil,
          @job_arn : String? = nil,
          @job_executions_retry_config : Types::JobExecutionsRetryConfig? = nil,
          @job_executions_rollout_config : Types::JobExecutionsRolloutConfig? = nil,
          @maintenance_windows : Array(Types::MaintenanceWindow)? = nil,
          @presigned_url_config : Types::PresignedUrlConfig? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timeout_config : Types::TimeoutConfig? = nil
        )
        end
      end

      struct CreateJobTemplateResponse
        include JSON::Serializable

        # The ARN of the job template.
        @[JSON::Field(key: "jobTemplateArn")]
        getter job_template_arn : String?

        # The unique identifier of the job template.
        @[JSON::Field(key: "jobTemplateId")]
        getter job_template_id : String?

        def initialize(
          @job_template_arn : String? = nil,
          @job_template_id : String? = nil
        )
        end
      end

      # The input for the CreateKeysAndCertificate operation. Requires permission to access the
      # CreateKeysAndCertificateRequest action.
      struct CreateKeysAndCertificateRequest
        include JSON::Serializable

        # Specifies whether the certificate is active.
        @[JSON::Field(key: "setAsActive")]
        getter set_as_active : Bool?

        def initialize(
          @set_as_active : Bool? = nil
        )
        end
      end

      # The output of the CreateKeysAndCertificate operation.
      struct CreateKeysAndCertificateResponse
        include JSON::Serializable

        # The ARN of the certificate.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The ID of the certificate. IoT issues a default subject name for the certificate (for example, IoT
        # Certificate).
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String?

        # The certificate data, in PEM format.
        @[JSON::Field(key: "certificatePem")]
        getter certificate_pem : String?

        # The generated key pair.
        @[JSON::Field(key: "keyPair")]
        getter key_pair : Types::KeyPair?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_id : String? = nil,
          @certificate_pem : String? = nil,
          @key_pair : Types::KeyPair? = nil
        )
        end
      end

      struct CreateMitigationActionRequest
        include JSON::Serializable

        # A friendly name for the action. Choose a friendly name that accurately describes the action (for
        # example, EnableLoggingAction ).
        @[JSON::Field(key: "actionName")]
        getter action_name : String

        # Defines the type of action and the parameters for that action.
        @[JSON::Field(key: "actionParams")]
        getter action_params : Types::MitigationActionParams

        # The ARN of the IAM role that is used to apply the mitigation action.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Metadata that can be used to manage the mitigation action.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @action_name : String,
          @action_params : Types::MitigationActionParams,
          @role_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateMitigationActionResponse
        include JSON::Serializable

        # The ARN for the new mitigation action.
        @[JSON::Field(key: "actionArn")]
        getter action_arn : String?

        # A unique identifier for the new mitigation action.
        @[JSON::Field(key: "actionId")]
        getter action_id : String?

        def initialize(
          @action_arn : String? = nil,
          @action_id : String? = nil
        )
        end
      end

      struct CreateOTAUpdateRequest
        include JSON::Serializable

        # The files to be streamed by the OTA update.
        @[JSON::Field(key: "files")]
        getter files : Array(Types::OTAUpdateFile)

        # The ID of the OTA update to be created.
        @[JSON::Field(key: "otaUpdateId")]
        getter ota_update_id : String

        # The IAM role that grants Amazon Web Services IoT Core access to the Amazon S3, IoT jobs and Amazon
        # Web Services Code Signing resources to create an OTA update job.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The devices targeted to receive OTA updates.
        @[JSON::Field(key: "targets")]
        getter targets : Array(String)

        # A list of additional OTA update parameters, which are name-value pairs. They won't be sent to
        # devices as a part of the Job document.
        @[JSON::Field(key: "additionalParameters")]
        getter additional_parameters : Hash(String, String)?

        # The criteria that determine when and how a job abort takes place.
        @[JSON::Field(key: "awsJobAbortConfig")]
        getter aws_job_abort_config : Types::AwsJobAbortConfig?

        # Configuration for the rollout of OTA updates.
        @[JSON::Field(key: "awsJobExecutionsRolloutConfig")]
        getter aws_job_executions_rollout_config : Types::AwsJobExecutionsRolloutConfig?

        # Configuration information for pre-signed URLs.
        @[JSON::Field(key: "awsJobPresignedUrlConfig")]
        getter aws_job_presigned_url_config : Types::AwsJobPresignedUrlConfig?

        # Specifies the amount of time each device has to finish its execution of the job. A timer is started
        # when the job execution status is set to IN_PROGRESS . If the job execution status is not set to
        # another terminal state before the timer expires, it will be automatically set to TIMED_OUT .
        @[JSON::Field(key: "awsJobTimeoutConfig")]
        getter aws_job_timeout_config : Types::AwsJobTimeoutConfig?

        # The description of the OTA update.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The protocol used to transfer the OTA update image. Valid values are [HTTP], [MQTT], [HTTP, MQTT].
        # When both HTTP and MQTT are specified, the target device can choose the protocol.
        @[JSON::Field(key: "protocols")]
        getter protocols : Array(String)?

        # Metadata which can be used to manage updates.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # Specifies whether the update will continue to run (CONTINUOUS), or will be complete after all the
        # things specified as targets have completed the update (SNAPSHOT). If continuous, the update may also
        # be run on a thing when a change is detected in a target. For example, an update will run on a thing
        # when the thing is added to a target group, even after the update was completed by all things
        # originally in the group. Valid values: CONTINUOUS | SNAPSHOT.
        @[JSON::Field(key: "targetSelection")]
        getter target_selection : String?

        def initialize(
          @files : Array(Types::OTAUpdateFile),
          @ota_update_id : String,
          @role_arn : String,
          @targets : Array(String),
          @additional_parameters : Hash(String, String)? = nil,
          @aws_job_abort_config : Types::AwsJobAbortConfig? = nil,
          @aws_job_executions_rollout_config : Types::AwsJobExecutionsRolloutConfig? = nil,
          @aws_job_presigned_url_config : Types::AwsJobPresignedUrlConfig? = nil,
          @aws_job_timeout_config : Types::AwsJobTimeoutConfig? = nil,
          @description : String? = nil,
          @protocols : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_selection : String? = nil
        )
        end
      end

      struct CreateOTAUpdateResponse
        include JSON::Serializable

        # The IoT job ARN associated with the OTA update.
        @[JSON::Field(key: "awsIotJobArn")]
        getter aws_iot_job_arn : String?

        # The IoT job ID associated with the OTA update.
        @[JSON::Field(key: "awsIotJobId")]
        getter aws_iot_job_id : String?

        # The OTA update ARN.
        @[JSON::Field(key: "otaUpdateArn")]
        getter ota_update_arn : String?

        # The OTA update ID.
        @[JSON::Field(key: "otaUpdateId")]
        getter ota_update_id : String?

        # The OTA update status.
        @[JSON::Field(key: "otaUpdateStatus")]
        getter ota_update_status : String?

        def initialize(
          @aws_iot_job_arn : String? = nil,
          @aws_iot_job_id : String? = nil,
          @ota_update_arn : String? = nil,
          @ota_update_id : String? = nil,
          @ota_update_status : String? = nil
        )
        end
      end

      struct CreatePackageRequest
        include JSON::Serializable

        # The name of the new software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A summary of the package being created. This can be used to outline the package's contents or
        # purpose.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Metadata that can be used to manage the package.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @package_name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreatePackageResponse
        include JSON::Serializable

        # The package description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) for the package.
        @[JSON::Field(key: "packageArn")]
        getter package_arn : String?

        # The name of the software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String?

        def initialize(
          @description : String? = nil,
          @package_arn : String? = nil,
          @package_name : String? = nil
        )
        end
      end

      struct CreatePackageVersionRequest
        include JSON::Serializable

        # The name of the associated software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String

        # The name of the new package version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The various build components created during the build process such as libraries and configuration
        # files that make up a software package version.
        @[JSON::Field(key: "artifact")]
        getter artifact : Types::PackageVersionArtifact?

        # Metadata that can be used to define a package version’s configuration. For example, the S3 file
        # location, configuration options that are being sent to the device or fleet. The combined size of all
        # the attributes on a package version is limited to 3KB.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A summary of the package version being created. This can be used to outline the package's contents
        # or purpose.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The inline job document associated with a software package version used for a quick job deployment.
        @[JSON::Field(key: "recipe")]
        getter recipe : String?

        # Metadata that can be used to manage the package version.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @package_name : String,
          @version_name : String,
          @artifact : Types::PackageVersionArtifact? = nil,
          @attributes : Hash(String, String)? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @recipe : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreatePackageVersionResponse
        include JSON::Serializable

        # Metadata that were added to the package version that can be used to define a package version’s
        # configuration.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The package version description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Error reason for a package version failure during creation or update.
        @[JSON::Field(key: "errorReason")]
        getter error_reason : String?

        # The name of the associated software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String?

        # The Amazon Resource Name (ARN) for the package.
        @[JSON::Field(key: "packageVersionArn")]
        getter package_version_arn : String?

        # The status of the package version. For more information, see Package version lifecycle .
        @[JSON::Field(key: "status")]
        getter status : String?

        # The name of the new package version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @description : String? = nil,
          @error_reason : String? = nil,
          @package_name : String? = nil,
          @package_version_arn : String? = nil,
          @status : String? = nil,
          @version_name : String? = nil
        )
        end
      end

      # The input for the CreatePolicy operation.
      struct CreatePolicyRequest
        include JSON::Serializable

        # The JSON document that describes the policy. policyDocument must have a minimum length of 1, with a
        # maximum length of 2048, excluding whitespace.
        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String

        # The policy name.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        # Metadata which can be used to manage the policy. For URI Request parameters use format:
        # ...key1=value1&amp;key2=value2... For the CLI command-line parameter use format: &amp;&amp;tags
        # "key1=value1&amp;key2=value2..." For the cli-input-json file use format: "tags":
        # "key1=value1&amp;key2=value2..."
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @policy_document : String,
          @policy_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The output from the CreatePolicy operation.
      struct CreatePolicyResponse
        include JSON::Serializable

        # The policy ARN.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String?

        # The JSON document that describes the policy.
        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String?

        # The policy name.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String?

        # The policy version ID.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : String?

        def initialize(
          @policy_arn : String? = nil,
          @policy_document : String? = nil,
          @policy_name : String? = nil,
          @policy_version_id : String? = nil
        )
        end
      end

      # The input for the CreatePolicyVersion operation.
      struct CreatePolicyVersionRequest
        include JSON::Serializable

        # The JSON document that describes the policy. Minimum length of 1. Maximum length of 2048, excluding
        # whitespace.
        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String

        # The policy name.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        # Specifies whether the policy version is set as the default. When this parameter is true, the new
        # policy version becomes the operative version (that is, the version that is in effect for the
        # certificates to which the policy is attached).
        @[JSON::Field(key: "setAsDefault")]
        getter set_as_default : Bool?

        def initialize(
          @policy_document : String,
          @policy_name : String,
          @set_as_default : Bool? = nil
        )
        end
      end

      # The output of the CreatePolicyVersion operation.
      struct CreatePolicyVersionResponse
        include JSON::Serializable

        # Specifies whether the policy version is the default.
        @[JSON::Field(key: "isDefaultVersion")]
        getter is_default_version : Bool?

        # The policy ARN.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String?

        # The JSON document that describes the policy.
        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String?

        # The policy version ID.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : String?

        def initialize(
          @is_default_version : Bool? = nil,
          @policy_arn : String? = nil,
          @policy_document : String? = nil,
          @policy_version_id : String? = nil
        )
        end
      end

      struct CreateProvisioningClaimRequest
        include JSON::Serializable

        # The name of the provisioning template to use.
        @[JSON::Field(key: "templateName")]
        getter template_name : String

        def initialize(
          @template_name : String
        )
        end
      end

      struct CreateProvisioningClaimResponse
        include JSON::Serializable

        # The ID of the certificate.
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String?

        # The provisioning claim certificate.
        @[JSON::Field(key: "certificatePem")]
        getter certificate_pem : String?

        # The provisioning claim expiration time.
        @[JSON::Field(key: "expiration")]
        getter expiration : Time?

        # The provisioning claim key pair.
        @[JSON::Field(key: "keyPair")]
        getter key_pair : Types::KeyPair?

        def initialize(
          @certificate_id : String? = nil,
          @certificate_pem : String? = nil,
          @expiration : Time? = nil,
          @key_pair : Types::KeyPair? = nil
        )
        end
      end

      struct CreateProvisioningTemplateRequest
        include JSON::Serializable

        # The role ARN for the role associated with the provisioning template. This IoT role grants permission
        # to provision a device.
        @[JSON::Field(key: "provisioningRoleArn")]
        getter provisioning_role_arn : String

        # The JSON formatted contents of the provisioning template.
        @[JSON::Field(key: "templateBody")]
        getter template_body : String

        # The name of the provisioning template.
        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The description of the provisioning template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # True to enable the provisioning template, otherwise false.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # Creates a pre-provisioning hook template. Only supports template of type FLEET_PROVISIONING . For
        # more information about provisioning template types, see type .
        @[JSON::Field(key: "preProvisioningHook")]
        getter pre_provisioning_hook : Types::ProvisioningHook?

        # Metadata which can be used to manage the provisioning template. For URI Request parameters use
        # format: ...key1=value1&amp;key2=value2... For the CLI command-line parameter use format:
        # &amp;&amp;tags "key1=value1&amp;key2=value2..." For the cli-input-json file use format: "tags":
        # "key1=value1&amp;key2=value2..."
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The type you define in a provisioning template. You can create a template with only one type. You
        # can't change the template type after its creation. The default value is FLEET_PROVISIONING . For
        # more information about provisioning template, see: Provisioning template .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @provisioning_role_arn : String,
          @template_body : String,
          @template_name : String,
          @description : String? = nil,
          @enabled : Bool? = nil,
          @pre_provisioning_hook : Types::ProvisioningHook? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil
        )
        end
      end

      struct CreateProvisioningTemplateResponse
        include JSON::Serializable

        # The default version of the provisioning template.
        @[JSON::Field(key: "defaultVersionId")]
        getter default_version_id : Int32?

        # The ARN that identifies the provisioning template.
        @[JSON::Field(key: "templateArn")]
        getter template_arn : String?

        # The name of the provisioning template.
        @[JSON::Field(key: "templateName")]
        getter template_name : String?

        def initialize(
          @default_version_id : Int32? = nil,
          @template_arn : String? = nil,
          @template_name : String? = nil
        )
        end
      end

      struct CreateProvisioningTemplateVersionRequest
        include JSON::Serializable

        # The JSON formatted contents of the provisioning template.
        @[JSON::Field(key: "templateBody")]
        getter template_body : String

        # The name of the provisioning template.
        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # Sets a fleet provision template version as the default version.
        @[JSON::Field(key: "setAsDefault")]
        getter set_as_default : Bool?

        def initialize(
          @template_body : String,
          @template_name : String,
          @set_as_default : Bool? = nil
        )
        end
      end

      struct CreateProvisioningTemplateVersionResponse
        include JSON::Serializable

        # True if the provisioning template version is the default version, otherwise false.
        @[JSON::Field(key: "isDefaultVersion")]
        getter is_default_version : Bool?

        # The ARN that identifies the provisioning template.
        @[JSON::Field(key: "templateArn")]
        getter template_arn : String?

        # The name of the provisioning template.
        @[JSON::Field(key: "templateName")]
        getter template_name : String?

        # The version of the provisioning template.
        @[JSON::Field(key: "versionId")]
        getter version_id : Int32?

        def initialize(
          @is_default_version : Bool? = nil,
          @template_arn : String? = nil,
          @template_name : String? = nil,
          @version_id : Int32? = nil
        )
        end
      end

      struct CreateRoleAliasRequest
        include JSON::Serializable

        # The role alias that points to a role ARN. This allows you to change the role without having to
        # update the device.
        @[JSON::Field(key: "roleAlias")]
        getter role_alias : String

        # The role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # How long (in seconds) the credentials will be valid. The default value is 3,600 seconds. This value
        # must be less than or equal to the maximum session duration of the IAM role that the role alias
        # references.
        @[JSON::Field(key: "credentialDurationSeconds")]
        getter credential_duration_seconds : Int32?

        # Metadata which can be used to manage the role alias. For URI Request parameters use format:
        # ...key1=value1&amp;key2=value2... For the CLI command-line parameter use format: &amp;&amp;tags
        # "key1=value1&amp;key2=value2..." For the cli-input-json file use format: "tags":
        # "key1=value1&amp;key2=value2..."
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @role_alias : String,
          @role_arn : String,
          @credential_duration_seconds : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRoleAliasResponse
        include JSON::Serializable

        # The role alias.
        @[JSON::Field(key: "roleAlias")]
        getter role_alias : String?

        # The role alias ARN.
        @[JSON::Field(key: "roleAliasArn")]
        getter role_alias_arn : String?

        def initialize(
          @role_alias : String? = nil,
          @role_alias_arn : String? = nil
        )
        end
      end

      struct CreateScheduledAuditRequest
        include JSON::Serializable

        # How often the scheduled audit takes place, either DAILY , WEEKLY , BIWEEKLY or MONTHLY . The start
        # time of each audit is determined by the system.
        @[JSON::Field(key: "frequency")]
        getter frequency : String

        # The name you want to give to the scheduled audit. (Max. 128 chars)
        @[JSON::Field(key: "scheduledAuditName")]
        getter scheduled_audit_name : String

        # Which checks are performed during the scheduled audit. Checks must be enabled for your account. (Use
        # DescribeAccountAuditConfiguration to see the list of all checks, including those that are enabled or
        # use UpdateAccountAuditConfiguration to select which checks are enabled.)
        @[JSON::Field(key: "targetCheckNames")]
        getter target_check_names : Array(String)

        # The day of the month on which the scheduled audit takes place. This can be "1" through "31" or
        # "LAST". This field is required if the "frequency" parameter is set to MONTHLY . If days 29 to 31 are
        # specified, and the month doesn't have that many days, the audit takes place on the LAST day of the
        # month.
        @[JSON::Field(key: "dayOfMonth")]
        getter day_of_month : String?

        # The day of the week on which the scheduled audit takes place, either SUN , MON , TUE , WED , THU ,
        # FRI , or SAT . This field is required if the frequency parameter is set to WEEKLY or BIWEEKLY .
        @[JSON::Field(key: "dayOfWeek")]
        getter day_of_week : String?

        # Metadata that can be used to manage the scheduled audit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @frequency : String,
          @scheduled_audit_name : String,
          @target_check_names : Array(String),
          @day_of_month : String? = nil,
          @day_of_week : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateScheduledAuditResponse
        include JSON::Serializable

        # The ARN of the scheduled audit.
        @[JSON::Field(key: "scheduledAuditArn")]
        getter scheduled_audit_arn : String?

        def initialize(
          @scheduled_audit_arn : String? = nil
        )
        end
      end

      struct CreateSecurityProfileRequest
        include JSON::Serializable

        # The name you are giving to the security profile.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String

        # Please use CreateSecurityProfileRequest$additionalMetricsToRetainV2 instead. A list of metrics whose
        # data is retained (stored). By default, data is retained for any metric used in the profile's
        # behaviors , but it is also retained for any metric specified here. Can be used with custom metrics;
        # cannot be used with dimensions.
        @[JSON::Field(key: "additionalMetricsToRetain")]
        getter additional_metrics_to_retain : Array(String)?

        # A list of metrics whose data is retained (stored). By default, data is retained for any metric used
        # in the profile's behaviors , but it is also retained for any metric specified here. Can be used with
        # custom metrics; cannot be used with dimensions.
        @[JSON::Field(key: "additionalMetricsToRetainV2")]
        getter additional_metrics_to_retain_v2 : Array(Types::MetricToRetain)?

        # Specifies the destinations to which alerts are sent. (Alerts are always sent to the console.) Alerts
        # are generated when a device (thing) violates a behavior.
        @[JSON::Field(key: "alertTargets")]
        getter alert_targets : Hash(String, Types::AlertTarget)?

        # Specifies the behaviors that, when violated by a device (thing), cause an alert.
        @[JSON::Field(key: "behaviors")]
        getter behaviors : Array(Types::Behavior)?

        # Specifies the MQTT topic and role ARN required for metric export.
        @[JSON::Field(key: "metricsExportConfig")]
        getter metrics_export_config : Types::MetricsExportConfig?

        # A description of the security profile.
        @[JSON::Field(key: "securityProfileDescription")]
        getter security_profile_description : String?

        # Metadata that can be used to manage the security profile.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @security_profile_name : String,
          @additional_metrics_to_retain : Array(String)? = nil,
          @additional_metrics_to_retain_v2 : Array(Types::MetricToRetain)? = nil,
          @alert_targets : Hash(String, Types::AlertTarget)? = nil,
          @behaviors : Array(Types::Behavior)? = nil,
          @metrics_export_config : Types::MetricsExportConfig? = nil,
          @security_profile_description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateSecurityProfileResponse
        include JSON::Serializable

        # The ARN of the security profile.
        @[JSON::Field(key: "securityProfileArn")]
        getter security_profile_arn : String?

        # The name you gave to the security profile.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String?

        def initialize(
          @security_profile_arn : String? = nil,
          @security_profile_name : String? = nil
        )
        end
      end

      struct CreateStreamRequest
        include JSON::Serializable

        # The files to stream.
        @[JSON::Field(key: "files")]
        getter files : Array(Types::StreamFile)

        # An IAM role that allows the IoT service principal to access your S3 files.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The stream ID.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String

        # A description of the stream.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Metadata which can be used to manage streams.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @files : Array(Types::StreamFile),
          @role_arn : String,
          @stream_id : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateStreamResponse
        include JSON::Serializable

        # A description of the stream.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The stream ARN.
        @[JSON::Field(key: "streamArn")]
        getter stream_arn : String?

        # The stream ID.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        # The version of the stream.
        @[JSON::Field(key: "streamVersion")]
        getter stream_version : Int32?

        def initialize(
          @description : String? = nil,
          @stream_arn : String? = nil,
          @stream_id : String? = nil,
          @stream_version : Int32? = nil
        )
        end
      end

      struct CreateThingGroupRequest
        include JSON::Serializable

        # The thing group name to create.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String

        # The name of the parent thing group.
        @[JSON::Field(key: "parentGroupName")]
        getter parent_group_name : String?

        # Metadata which can be used to manage the thing group.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The thing group properties.
        @[JSON::Field(key: "thingGroupProperties")]
        getter thing_group_properties : Types::ThingGroupProperties?

        def initialize(
          @thing_group_name : String,
          @parent_group_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @thing_group_properties : Types::ThingGroupProperties? = nil
        )
        end
      end

      struct CreateThingGroupResponse
        include JSON::Serializable

        # The thing group ARN.
        @[JSON::Field(key: "thingGroupArn")]
        getter thing_group_arn : String?

        # The thing group ID.
        @[JSON::Field(key: "thingGroupId")]
        getter thing_group_id : String?

        # The thing group name.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String?

        def initialize(
          @thing_group_arn : String? = nil,
          @thing_group_id : String? = nil,
          @thing_group_name : String? = nil
        )
        end
      end

      # The input for the CreateThing operation.
      struct CreateThingRequest
        include JSON::Serializable

        # The name of the thing to create. You can't change a thing's name after you create it. To change a
        # thing's name, you must create a new thing, give it the new name, and then delete the old thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The attribute payload, which consists of up to three name/value pairs in a JSON document. For
        # example: {\"attributes\":{\"string1\":\"string2\"}}
        @[JSON::Field(key: "attributePayload")]
        getter attribute_payload : Types::AttributePayload?

        # The name of the billing group the thing will be added to.
        @[JSON::Field(key: "billingGroupName")]
        getter billing_group_name : String?

        # The name of the thing type associated with the new thing.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String?

        def initialize(
          @thing_name : String,
          @attribute_payload : Types::AttributePayload? = nil,
          @billing_group_name : String? = nil,
          @thing_type_name : String? = nil
        )
        end
      end

      # The output of the CreateThing operation.
      struct CreateThingResponse
        include JSON::Serializable

        # The ARN of the new thing.
        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        # The thing ID.
        @[JSON::Field(key: "thingId")]
        getter thing_id : String?

        # The name of the new thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @thing_arn : String? = nil,
          @thing_id : String? = nil,
          @thing_name : String? = nil
        )
        end
      end

      # The input for the CreateThingType operation.
      struct CreateThingTypeRequest
        include JSON::Serializable

        # The name of the thing type.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String

        # Metadata which can be used to manage the thing type.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The ThingTypeProperties for the thing type to create. It contains information about the new thing
        # type including a description, and a list of searchable thing attribute names.
        @[JSON::Field(key: "thingTypeProperties")]
        getter thing_type_properties : Types::ThingTypeProperties?

        def initialize(
          @thing_type_name : String,
          @tags : Array(Types::Tag)? = nil,
          @thing_type_properties : Types::ThingTypeProperties? = nil
        )
        end
      end

      # The output of the CreateThingType operation.
      struct CreateThingTypeResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the thing type.
        @[JSON::Field(key: "thingTypeArn")]
        getter thing_type_arn : String?

        # The thing type ID.
        @[JSON::Field(key: "thingTypeId")]
        getter thing_type_id : String?

        # The name of the thing type.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String?

        def initialize(
          @thing_type_arn : String? = nil,
          @thing_type_id : String? = nil,
          @thing_type_name : String? = nil
        )
        end
      end

      struct CreateTopicRuleDestinationRequest
        include JSON::Serializable

        # The topic rule destination configuration.
        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::TopicRuleDestinationConfiguration

        def initialize(
          @destination_configuration : Types::TopicRuleDestinationConfiguration
        )
        end
      end

      struct CreateTopicRuleDestinationResponse
        include JSON::Serializable

        # The topic rule destination.
        @[JSON::Field(key: "topicRuleDestination")]
        getter topic_rule_destination : Types::TopicRuleDestination?

        def initialize(
          @topic_rule_destination : Types::TopicRuleDestination? = nil
        )
        end
      end

      # The input for the CreateTopicRule operation.
      struct CreateTopicRuleRequest
        include JSON::Serializable

        # The name of the rule.
        @[JSON::Field(key: "ruleName")]
        getter rule_name : String

        # The rule payload.
        @[JSON::Field(key: "topicRulePayload")]
        getter topic_rule_payload : Types::TopicRulePayload

        # Metadata which can be used to manage the topic rule. For URI Request parameters use format:
        # ...key1=value1&amp;key2=value2... For the CLI command-line parameter use format: --tags
        # "key1=value1&amp;key2=value2..." For the cli-input-json file use format: "tags":
        # "key1=value1&amp;key2=value2..."
        @[JSON::Field(key: "x-amz-tagging")]
        getter tags : String?

        def initialize(
          @rule_name : String,
          @topic_rule_payload : Types::TopicRulePayload,
          @tags : String? = nil
        )
        end
      end

      # Describes a custom method used to code sign a file.
      struct CustomCodeSigning
        include JSON::Serializable

        # The certificate chain.
        @[JSON::Field(key: "certificateChain")]
        getter certificate_chain : Types::CodeSigningCertificateChain?

        # The hash algorithm used to code sign the file. You can use a string as the algorithm name if the
        # target over-the-air (OTA) update devices are able to verify the signature that was generated using
        # the same signature algorithm. For example, FreeRTOS uses SHA256 or SHA1 , so you can pass either of
        # them based on which was used for generating the signature.
        @[JSON::Field(key: "hashAlgorithm")]
        getter hash_algorithm : String?

        # The signature for the file.
        @[JSON::Field(key: "signature")]
        getter signature : Types::CodeSigningSignature?

        # The signature algorithm used to code sign the file. You can use a string as the algorithm name if
        # the target over-the-air (OTA) update devices are able to verify the signature that was generated
        # using the same signature algorithm. For example, FreeRTOS uses ECDSA or RSA , so you can pass either
        # of them based on which was used for generating the signature.
        @[JSON::Field(key: "signatureAlgorithm")]
        getter signature_algorithm : String?

        def initialize(
          @certificate_chain : Types::CodeSigningCertificateChain? = nil,
          @hash_algorithm : String? = nil,
          @signature : Types::CodeSigningSignature? = nil,
          @signature_algorithm : String? = nil
        )
        end
      end

      struct DeleteAccountAuditConfigurationRequest
        include JSON::Serializable

        # If true, all scheduled audits are deleted.
        @[JSON::Field(key: "deleteScheduledAudits")]
        getter delete_scheduled_audits : Bool?

        def initialize(
          @delete_scheduled_audits : Bool? = nil
        )
        end
      end

      struct DeleteAccountAuditConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteAuditSuppressionRequest
        include JSON::Serializable

        @[JSON::Field(key: "checkName")]
        getter check_name : String

        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : Types::ResourceIdentifier

        def initialize(
          @check_name : String,
          @resource_identifier : Types::ResourceIdentifier
        )
        end
      end

      struct DeleteAuditSuppressionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteAuthorizerRequest
        include JSON::Serializable

        # The name of the authorizer to delete.
        @[JSON::Field(key: "authorizerName")]
        getter authorizer_name : String

        def initialize(
          @authorizer_name : String
        )
        end
      end

      struct DeleteAuthorizerResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteBillingGroupRequest
        include JSON::Serializable

        # The name of the billing group.
        @[JSON::Field(key: "billingGroupName")]
        getter billing_group_name : String

        # The expected version of the billing group. If the version of the billing group does not match the
        # expected version specified in the request, the DeleteBillingGroup request is rejected with a
        # VersionConflictException .
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        def initialize(
          @billing_group_name : String,
          @expected_version : Int64? = nil
        )
        end
      end

      struct DeleteBillingGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Input for the DeleteCACertificate operation.
      struct DeleteCACertificateRequest
        include JSON::Serializable

        # The ID of the certificate to delete. (The last part of the certificate ARN contains the certificate
        # ID.)
        @[JSON::Field(key: "caCertificateId")]
        getter certificate_id : String

        def initialize(
          @certificate_id : String
        )
        end
      end

      # The output for the DeleteCACertificate operation.
      struct DeleteCACertificateResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteCertificateProviderRequest
        include JSON::Serializable

        # The name of the certificate provider.
        @[JSON::Field(key: "certificateProviderName")]
        getter certificate_provider_name : String

        def initialize(
          @certificate_provider_name : String
        )
        end
      end

      struct DeleteCertificateProviderResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the DeleteCertificate operation.
      struct DeleteCertificateRequest
        include JSON::Serializable

        # The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String

        # Forces the deletion of a certificate if it is inactive and is not attached to an IoT thing.
        @[JSON::Field(key: "forceDelete")]
        getter force_delete : Bool?

        def initialize(
          @certificate_id : String,
          @force_delete : Bool? = nil
        )
        end
      end

      struct DeleteCommandExecutionRequest
        include JSON::Serializable

        # The unique identifier of the command execution that you want to delete from your account.
        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        # The Amazon Resource Number (ARN) of the target device for which you want to delete command
        # executions.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String

        def initialize(
          @execution_id : String,
          @target_arn : String
        )
        end
      end

      struct DeleteCommandExecutionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteCommandRequest
        include JSON::Serializable

        # The unique identifier of the command to be deleted.
        @[JSON::Field(key: "commandId")]
        getter command_id : String

        def initialize(
          @command_id : String
        )
        end
      end

      struct DeleteCommandResponse
        include JSON::Serializable

        # The status code for the command deletion request. The status code is in the 200 range for a
        # successful request. If the command hasn't been deprecated, or has been deprecated for a duration
        # that is shorter than the maximum time out duration of 12 hours, when calling the DeleteCommand
        # request, the deletion will be scheduled and a 202 status code will be returned. While the command is
        # being deleted, it will be in a pendingDeletion state. Once the time out duration has been reached,
        # the command will be permanently removed from your account. If the command has been deprecated for a
        # duration that is longer than the maximum time out duration of 12 hours, when calling the
        # DeleteCommand request, the command will be deleted immediately and a 204 status code will be
        # returned.
        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        def initialize(
          @status_code : Int32? = nil
        )
        end
      end

      # You can't delete the resource because it is attached to one or more resources.
      struct DeleteConflictException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct DeleteCustomMetricRequest
        include JSON::Serializable

        # The name of the custom metric.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        def initialize(
          @metric_name : String
        )
        end
      end

      struct DeleteCustomMetricResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteDimensionRequest
        include JSON::Serializable

        # The unique identifier for the dimension that you want to delete.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteDimensionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteDomainConfigurationRequest
        include JSON::Serializable

        # The name of the domain configuration to be deleted.
        @[JSON::Field(key: "domainConfigurationName")]
        getter domain_configuration_name : String

        def initialize(
          @domain_configuration_name : String
        )
        end
      end

      struct DeleteDomainConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteDynamicThingGroupRequest
        include JSON::Serializable

        # The name of the dynamic thing group to delete.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String

        # The expected version of the dynamic thing group to delete.
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        def initialize(
          @thing_group_name : String,
          @expected_version : Int64? = nil
        )
        end
      end

      struct DeleteDynamicThingGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteFleetMetricRequest
        include JSON::Serializable

        # The name of the fleet metric to delete.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The expected version of the fleet metric to delete.
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        def initialize(
          @metric_name : String,
          @expected_version : Int64? = nil
        )
        end
      end

      struct DeleteJobExecutionRequest
        include JSON::Serializable

        # The ID of the job execution to be deleted. The executionNumber refers to the execution of a
        # particular job on a particular device. Note that once a job execution is deleted, the
        # executionNumber may be reused by IoT, so be sure you get and use the correct value here.
        @[JSON::Field(key: "executionNumber")]
        getter execution_number : Int64

        # The ID of the job whose execution on a particular device will be deleted.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The name of the thing whose job execution will be deleted.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # (Optional) When true, you can delete a job execution which is "IN_PROGRESS". Otherwise, you can only
        # delete a job execution which is in a terminal state ("SUCCEEDED", "FAILED", "REJECTED", "REMOVED" or
        # "CANCELED") or an exception will occur. The default is false. Deleting a job execution which is
        # "IN_PROGRESS", will cause the device to be unable to access job information or update the job
        # execution status. Use caution and ensure that the device is able to recover to a valid state.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        # The namespace used to indicate that a job is a customer-managed job. When you specify a value for
        # this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain
        # the value in the following format. $aws/things/ THING_NAME /jobs/ JOB_ID /notify-namespace-
        # NAMESPACE_ID / The namespaceId feature is only supported by IoT Greengrass at this time. For more
        # information, see Setting up IoT Greengrass core devices.
        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        def initialize(
          @execution_number : Int64,
          @job_id : String,
          @thing_name : String,
          @force : Bool? = nil,
          @namespace_id : String? = nil
        )
        end
      end

      struct DeleteJobRequest
        include JSON::Serializable

        # The ID of the job to be deleted. After a job deletion is completed, you may reuse this jobId when
        # you create a new job. However, this is not recommended, and you must ensure that your devices are
        # not using the jobId to refer to the deleted job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # (Optional) When true, you can delete a job which is "IN_PROGRESS". Otherwise, you can only delete a
        # job which is in a terminal state ("COMPLETED" or "CANCELED") or an exception will occur. The default
        # is false. Deleting a job which is "IN_PROGRESS", will cause a device which is executing the job to
        # be unable to access job information or update the job execution status. Use caution and ensure that
        # each device executing a job which is deleted is able to recover to a valid state.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        # The namespace used to indicate that a job is a customer-managed job. When you specify a value for
        # this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain
        # the value in the following format. $aws/things/ THING_NAME /jobs/ JOB_ID /notify-namespace-
        # NAMESPACE_ID / The namespaceId feature is only supported by IoT Greengrass at this time. For more
        # information, see Setting up IoT Greengrass core devices.
        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        def initialize(
          @job_id : String,
          @force : Bool? = nil,
          @namespace_id : String? = nil
        )
        end
      end

      struct DeleteJobTemplateRequest
        include JSON::Serializable

        # The unique identifier of the job template to delete.
        @[JSON::Field(key: "jobTemplateId")]
        getter job_template_id : String

        def initialize(
          @job_template_id : String
        )
        end
      end

      struct DeleteMitigationActionRequest
        include JSON::Serializable

        # The name of the mitigation action that you want to delete.
        @[JSON::Field(key: "actionName")]
        getter action_name : String

        def initialize(
          @action_name : String
        )
        end
      end

      struct DeleteMitigationActionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteOTAUpdateRequest
        include JSON::Serializable

        # The ID of the OTA update to delete.
        @[JSON::Field(key: "otaUpdateId")]
        getter ota_update_id : String

        # When true, the stream created by the OTAUpdate process is deleted when the OTA update is deleted.
        # Ignored if the stream specified in the OTAUpdate is supplied by the user.
        @[JSON::Field(key: "deleteStream")]
        getter delete_stream : Bool?

        # When true, deletes the IoT job created by the OTAUpdate process even if it is "IN_PROGRESS".
        # Otherwise, if the job is not in a terminal state ("COMPLETED" or "CANCELED") an exception will
        # occur. The default is false.
        @[JSON::Field(key: "forceDeleteAWSJob")]
        getter force_delete_aws_job : Bool?

        def initialize(
          @ota_update_id : String,
          @delete_stream : Bool? = nil,
          @force_delete_aws_job : Bool? = nil
        )
        end
      end

      struct DeleteOTAUpdateResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeletePackageRequest
        include JSON::Serializable

        # The name of the target software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @package_name : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeletePackageResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeletePackageVersionRequest
        include JSON::Serializable

        # The name of the associated software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String

        # The name of the target package version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @package_name : String,
          @version_name : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeletePackageVersionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the DeletePolicy operation.
      struct DeletePolicyRequest
        include JSON::Serializable

        # The name of the policy to delete.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        def initialize(
          @policy_name : String
        )
        end
      end

      # The input for the DeletePolicyVersion operation.
      struct DeletePolicyVersionRequest
        include JSON::Serializable

        # The name of the policy.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        # The policy version ID.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : String

        def initialize(
          @policy_name : String,
          @policy_version_id : String
        )
        end
      end

      struct DeleteProvisioningTemplateRequest
        include JSON::Serializable

        # The name of the fleet provision template to delete.
        @[JSON::Field(key: "templateName")]
        getter template_name : String

        def initialize(
          @template_name : String
        )
        end
      end

      struct DeleteProvisioningTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteProvisioningTemplateVersionRequest
        include JSON::Serializable

        # The name of the provisioning template version to delete.
        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The provisioning template version ID to delete.
        @[JSON::Field(key: "versionId")]
        getter version_id : Int32

        def initialize(
          @template_name : String,
          @version_id : Int32
        )
        end
      end

      struct DeleteProvisioningTemplateVersionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the DeleteRegistrationCode operation.
      struct DeleteRegistrationCodeRequest
        include JSON::Serializable

        def initialize
        end
      end

      # The output for the DeleteRegistrationCode operation.
      struct DeleteRegistrationCodeResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteRoleAliasRequest
        include JSON::Serializable

        # The role alias to delete.
        @[JSON::Field(key: "roleAlias")]
        getter role_alias : String

        def initialize(
          @role_alias : String
        )
        end
      end

      struct DeleteRoleAliasResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteScheduledAuditRequest
        include JSON::Serializable

        # The name of the scheduled audit you want to delete.
        @[JSON::Field(key: "scheduledAuditName")]
        getter scheduled_audit_name : String

        def initialize(
          @scheduled_audit_name : String
        )
        end
      end

      struct DeleteScheduledAuditResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSecurityProfileRequest
        include JSON::Serializable

        # The name of the security profile to be deleted.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String

        # The expected version of the security profile. A new version is generated whenever the security
        # profile is updated. If you specify a value that is different from the actual version, a
        # VersionConflictException is thrown.
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        def initialize(
          @security_profile_name : String,
          @expected_version : Int64? = nil
        )
        end
      end

      struct DeleteSecurityProfileResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteStreamRequest
        include JSON::Serializable

        # The stream ID.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String

        def initialize(
          @stream_id : String
        )
        end
      end

      struct DeleteStreamResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteThingGroupRequest
        include JSON::Serializable

        # The name of the thing group to delete.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String

        # The expected version of the thing group to delete.
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        def initialize(
          @thing_group_name : String,
          @expected_version : Int64? = nil
        )
        end
      end

      struct DeleteThingGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the DeleteThing operation.
      struct DeleteThingRequest
        include JSON::Serializable

        # The name of the thing to delete.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The expected version of the thing record in the registry. If the version of the record in the
        # registry does not match the expected version specified in the request, the DeleteThing request is
        # rejected with a VersionConflictException .
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        def initialize(
          @thing_name : String,
          @expected_version : Int64? = nil
        )
        end
      end

      # The output of the DeleteThing operation.
      struct DeleteThingResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the DeleteThingType operation.
      struct DeleteThingTypeRequest
        include JSON::Serializable

        # The name of the thing type.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String

        def initialize(
          @thing_type_name : String
        )
        end
      end

      # The output for the DeleteThingType operation.
      struct DeleteThingTypeResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteTopicRuleDestinationRequest
        include JSON::Serializable

        # The ARN of the topic rule destination to delete.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteTopicRuleDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the DeleteTopicRule operation.
      struct DeleteTopicRuleRequest
        include JSON::Serializable

        # The name of the rule.
        @[JSON::Field(key: "ruleName")]
        getter rule_name : String

        def initialize(
          @rule_name : String
        )
        end
      end

      struct DeleteV2LoggingLevelRequest
        include JSON::Serializable

        # The name of the resource for which you are configuring logging.
        @[JSON::Field(key: "targetName")]
        getter target_name : String

        # The type of resource for which you are configuring logging. Must be THING_Group .
        @[JSON::Field(key: "targetType")]
        getter target_type : String

        def initialize(
          @target_name : String,
          @target_type : String
        )
        end
      end

      # Contains information that denied the authorization.
      struct Denied
        include JSON::Serializable

        # Information that explicitly denies the authorization.
        @[JSON::Field(key: "explicitDeny")]
        getter explicit_deny : Types::ExplicitDeny?

        # Information that implicitly denies the authorization. When a policy doesn't explicitly deny or allow
        # an action on a resource it is considered an implicit deny.
        @[JSON::Field(key: "implicitDeny")]
        getter implicit_deny : Types::ImplicitDeny?

        def initialize(
          @explicit_deny : Types::ExplicitDeny? = nil,
          @implicit_deny : Types::ImplicitDeny? = nil
        )
        end
      end

      # The input for the DeprecateThingType operation.
      struct DeprecateThingTypeRequest
        include JSON::Serializable

        # The name of the thing type to deprecate.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String

        # Whether to undeprecate a deprecated thing type. If true , the thing type will not be deprecated
        # anymore and you can associate it with things.
        @[JSON::Field(key: "undoDeprecate")]
        getter undo_deprecate : Bool?

        def initialize(
          @thing_type_name : String,
          @undo_deprecate : Bool? = nil
        )
        end
      end

      # The output for the DeprecateThingType operation.
      struct DeprecateThingTypeResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeAccountAuditConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeAccountAuditConfigurationResponse
        include JSON::Serializable

        # Which audit checks are enabled and disabled for this account.
        @[JSON::Field(key: "auditCheckConfigurations")]
        getter audit_check_configurations : Hash(String, Types::AuditCheckConfiguration)?

        # Information about the targets to which audit notifications are sent for this account.
        @[JSON::Field(key: "auditNotificationTargetConfigurations")]
        getter audit_notification_target_configurations : Hash(String, Types::AuditNotificationTarget)?

        # The ARN of the role that grants permission to IoT to access information about your devices,
        # policies, certificates, and other items as required when performing an audit. On the first call to
        # UpdateAccountAuditConfiguration , this parameter is required.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @audit_check_configurations : Hash(String, Types::AuditCheckConfiguration)? = nil,
          @audit_notification_target_configurations : Hash(String, Types::AuditNotificationTarget)? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct DescribeAuditFindingRequest
        include JSON::Serializable

        # A unique identifier for a single audit finding. You can use this identifier to apply mitigation
        # actions to the finding.
        @[JSON::Field(key: "findingId")]
        getter finding_id : String

        def initialize(
          @finding_id : String
        )
        end
      end

      struct DescribeAuditFindingResponse
        include JSON::Serializable

        @[JSON::Field(key: "finding")]
        getter finding : Types::AuditFinding?

        def initialize(
          @finding : Types::AuditFinding? = nil
        )
        end
      end

      struct DescribeAuditMitigationActionsTaskRequest
        include JSON::Serializable

        # The unique identifier for the audit mitigation task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end

      struct DescribeAuditMitigationActionsTaskResponse
        include JSON::Serializable

        # Specifies the mitigation actions and their parameters that are applied as part of this task.
        @[JSON::Field(key: "actionsDefinition")]
        getter actions_definition : Array(Types::MitigationAction)?

        # Specifies the mitigation actions that should be applied to specific audit checks.
        @[JSON::Field(key: "auditCheckToActionsMapping")]
        getter audit_check_to_actions_mapping : Hash(String, Array(String))?

        # The date and time when the task was completed or canceled.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The date and time when the task was started.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Identifies the findings to which the mitigation actions are applied. This can be by audit checks, by
        # audit task, or a set of findings.
        @[JSON::Field(key: "target")]
        getter target : Types::AuditMitigationActionsTaskTarget?

        # Aggregate counts of the results when the mitigation tasks were applied to the findings for this
        # audit mitigation actions task.
        @[JSON::Field(key: "taskStatistics")]
        getter task_statistics : Hash(String, Types::TaskStatisticsForAuditCheck)?

        # The current status of the task.
        @[JSON::Field(key: "taskStatus")]
        getter task_status : String?

        def initialize(
          @actions_definition : Array(Types::MitigationAction)? = nil,
          @audit_check_to_actions_mapping : Hash(String, Array(String))? = nil,
          @end_time : Time? = nil,
          @start_time : Time? = nil,
          @target : Types::AuditMitigationActionsTaskTarget? = nil,
          @task_statistics : Hash(String, Types::TaskStatisticsForAuditCheck)? = nil,
          @task_status : String? = nil
        )
        end
      end

      struct DescribeAuditSuppressionRequest
        include JSON::Serializable

        @[JSON::Field(key: "checkName")]
        getter check_name : String

        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : Types::ResourceIdentifier

        def initialize(
          @check_name : String,
          @resource_identifier : Types::ResourceIdentifier
        )
        end
      end

      struct DescribeAuditSuppressionResponse
        include JSON::Serializable

        @[JSON::Field(key: "checkName")]
        getter check_name : String?

        # The description of the audit suppression.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The epoch timestamp in seconds at which this suppression expires.
        @[JSON::Field(key: "expirationDate")]
        getter expiration_date : Time?

        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : Types::ResourceIdentifier?

        # Indicates whether a suppression should exist indefinitely or not.
        @[JSON::Field(key: "suppressIndefinitely")]
        getter suppress_indefinitely : Bool?

        def initialize(
          @check_name : String? = nil,
          @description : String? = nil,
          @expiration_date : Time? = nil,
          @resource_identifier : Types::ResourceIdentifier? = nil,
          @suppress_indefinitely : Bool? = nil
        )
        end
      end

      struct DescribeAuditTaskRequest
        include JSON::Serializable

        # The ID of the audit whose information you want to get.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end

      struct DescribeAuditTaskResponse
        include JSON::Serializable

        # Detailed information about each check performed during this audit.
        @[JSON::Field(key: "auditDetails")]
        getter audit_details : Hash(String, Types::AuditCheckDetails)?

        # The name of the scheduled audit (only if the audit was a scheduled audit).
        @[JSON::Field(key: "scheduledAuditName")]
        getter scheduled_audit_name : String?

        # The time the audit started.
        @[JSON::Field(key: "taskStartTime")]
        getter task_start_time : Time?

        # Statistical information about the audit.
        @[JSON::Field(key: "taskStatistics")]
        getter task_statistics : Types::TaskStatistics?

        # The status of the audit: one of "IN_PROGRESS", "COMPLETED", "FAILED", or "CANCELED".
        @[JSON::Field(key: "taskStatus")]
        getter task_status : String?

        # The type of audit: "ON_DEMAND_AUDIT_TASK" or "SCHEDULED_AUDIT_TASK".
        @[JSON::Field(key: "taskType")]
        getter task_type : String?

        def initialize(
          @audit_details : Hash(String, Types::AuditCheckDetails)? = nil,
          @scheduled_audit_name : String? = nil,
          @task_start_time : Time? = nil,
          @task_statistics : Types::TaskStatistics? = nil,
          @task_status : String? = nil,
          @task_type : String? = nil
        )
        end
      end

      struct DescribeAuthorizerRequest
        include JSON::Serializable

        # The name of the authorizer to describe.
        @[JSON::Field(key: "authorizerName")]
        getter authorizer_name : String

        def initialize(
          @authorizer_name : String
        )
        end
      end

      struct DescribeAuthorizerResponse
        include JSON::Serializable

        # The authorizer description.
        @[JSON::Field(key: "authorizerDescription")]
        getter authorizer_description : Types::AuthorizerDescription?

        def initialize(
          @authorizer_description : Types::AuthorizerDescription? = nil
        )
        end
      end

      struct DescribeBillingGroupRequest
        include JSON::Serializable

        # The name of the billing group.
        @[JSON::Field(key: "billingGroupName")]
        getter billing_group_name : String

        def initialize(
          @billing_group_name : String
        )
        end
      end

      struct DescribeBillingGroupResponse
        include JSON::Serializable

        # The ARN of the billing group.
        @[JSON::Field(key: "billingGroupArn")]
        getter billing_group_arn : String?

        # The ID of the billing group.
        @[JSON::Field(key: "billingGroupId")]
        getter billing_group_id : String?

        # Additional information about the billing group.
        @[JSON::Field(key: "billingGroupMetadata")]
        getter billing_group_metadata : Types::BillingGroupMetadata?

        # The name of the billing group.
        @[JSON::Field(key: "billingGroupName")]
        getter billing_group_name : String?

        # The properties of the billing group.
        @[JSON::Field(key: "billingGroupProperties")]
        getter billing_group_properties : Types::BillingGroupProperties?

        # The version of the billing group.
        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @billing_group_arn : String? = nil,
          @billing_group_id : String? = nil,
          @billing_group_metadata : Types::BillingGroupMetadata? = nil,
          @billing_group_name : String? = nil,
          @billing_group_properties : Types::BillingGroupProperties? = nil,
          @version : Int64? = nil
        )
        end
      end

      # The input for the DescribeCACertificate operation.
      struct DescribeCACertificateRequest
        include JSON::Serializable

        # The CA certificate identifier.
        @[JSON::Field(key: "caCertificateId")]
        getter certificate_id : String

        def initialize(
          @certificate_id : String
        )
        end
      end

      # The output from the DescribeCACertificate operation.
      struct DescribeCACertificateResponse
        include JSON::Serializable

        # The CA certificate description.
        @[JSON::Field(key: "certificateDescription")]
        getter certificate_description : Types::CACertificateDescription?

        # Information about the registration configuration.
        @[JSON::Field(key: "registrationConfig")]
        getter registration_config : Types::RegistrationConfig?

        def initialize(
          @certificate_description : Types::CACertificateDescription? = nil,
          @registration_config : Types::RegistrationConfig? = nil
        )
        end
      end

      struct DescribeCertificateProviderRequest
        include JSON::Serializable

        # The name of the certificate provider.
        @[JSON::Field(key: "certificateProviderName")]
        getter certificate_provider_name : String

        def initialize(
          @certificate_provider_name : String
        )
        end
      end

      struct DescribeCertificateProviderResponse
        include JSON::Serializable

        # A list of the operations that the certificate provider will use to generate certificates. Valid
        # value: CreateCertificateFromCsr .
        @[JSON::Field(key: "accountDefaultForOperations")]
        getter account_default_for_operations : Array(String)?

        # The ARN of the certificate provider.
        @[JSON::Field(key: "certificateProviderArn")]
        getter certificate_provider_arn : String?

        # The name of the certificate provider.
        @[JSON::Field(key: "certificateProviderName")]
        getter certificate_provider_name : String?

        # The date-time string that indicates when the certificate provider was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The Lambda function ARN that's associated with the certificate provider.
        @[JSON::Field(key: "lambdaFunctionArn")]
        getter lambda_function_arn : String?

        # The date-time string that indicates when the certificate provider was last updated.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        def initialize(
          @account_default_for_operations : Array(String)? = nil,
          @certificate_provider_arn : String? = nil,
          @certificate_provider_name : String? = nil,
          @creation_date : Time? = nil,
          @lambda_function_arn : String? = nil,
          @last_modified_date : Time? = nil
        )
        end
      end

      # The input for the DescribeCertificate operation.
      struct DescribeCertificateRequest
        include JSON::Serializable

        # The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String

        def initialize(
          @certificate_id : String
        )
        end
      end

      # The output of the DescribeCertificate operation.
      struct DescribeCertificateResponse
        include JSON::Serializable

        # The description of the certificate.
        @[JSON::Field(key: "certificateDescription")]
        getter certificate_description : Types::CertificateDescription?

        def initialize(
          @certificate_description : Types::CertificateDescription? = nil
        )
        end
      end

      struct DescribeCustomMetricRequest
        include JSON::Serializable

        # The name of the custom metric.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        def initialize(
          @metric_name : String
        )
        end
      end

      struct DescribeCustomMetricResponse
        include JSON::Serializable

        # The creation date of the custom metric in milliseconds since epoch.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # Field represents a friendly name in the console for the custom metric; doesn't have to be unique.
        # Don't use this name as the metric identifier in the device metric report. Can be updated.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The time the custom metric was last modified in milliseconds since epoch.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The Amazon Resource Number (ARN) of the custom metric.
        @[JSON::Field(key: "metricArn")]
        getter metric_arn : String?

        # The name of the custom metric.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        # The type of the custom metric. The type number only takes a single metric value as an input, but
        # while submitting the metrics value in the DeviceMetrics report, it must be passed as an array with a
        # single value.
        @[JSON::Field(key: "metricType")]
        getter metric_type : String?

        def initialize(
          @creation_date : Time? = nil,
          @display_name : String? = nil,
          @last_modified_date : Time? = nil,
          @metric_arn : String? = nil,
          @metric_name : String? = nil,
          @metric_type : String? = nil
        )
        end
      end

      struct DescribeDefaultAuthorizerRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeDefaultAuthorizerResponse
        include JSON::Serializable

        # The default authorizer's description.
        @[JSON::Field(key: "authorizerDescription")]
        getter authorizer_description : Types::AuthorizerDescription?

        def initialize(
          @authorizer_description : Types::AuthorizerDescription? = nil
        )
        end
      end

      struct DescribeDetectMitigationActionsTaskRequest
        include JSON::Serializable

        # The unique identifier of the task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end

      struct DescribeDetectMitigationActionsTaskResponse
        include JSON::Serializable

        # The description of a task.
        @[JSON::Field(key: "taskSummary")]
        getter task_summary : Types::DetectMitigationActionsTaskSummary?

        def initialize(
          @task_summary : Types::DetectMitigationActionsTaskSummary? = nil
        )
        end
      end

      struct DescribeDimensionRequest
        include JSON::Serializable

        # The unique identifier for the dimension.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DescribeDimensionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the dimension.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date the dimension was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The date the dimension was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The unique identifier for the dimension.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value or list of values used to scope the dimension. For example, for topic filters, this is the
        # pattern used to match the MQTT topic name.
        @[JSON::Field(key: "stringValues")]
        getter string_values : Array(String)?

        # The type of the dimension.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @last_modified_date : Time? = nil,
          @name : String? = nil,
          @string_values : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      struct DescribeDomainConfigurationRequest
        include JSON::Serializable

        # The name of the domain configuration.
        @[JSON::Field(key: "domainConfigurationName")]
        getter domain_configuration_name : String

        def initialize(
          @domain_configuration_name : String
        )
        end
      end

      struct DescribeDomainConfigurationResponse
        include JSON::Serializable

        # An enumerated string that speciﬁes the application-layer protocol. SECURE_MQTT - MQTT over TLS.
        # MQTT_WSS - MQTT over WebSocket. HTTPS - HTTP over TLS. DEFAULT - Use a combination of port and
        # Application Layer Protocol Negotiation (ALPN) to specify application_layer protocol. For more
        # information, see Device communication protocols .
        @[JSON::Field(key: "applicationProtocol")]
        getter application_protocol : String?

        # An enumerated string that speciﬁes the authentication type. CUSTOM_AUTH_X509 - Use custom
        # authentication and authorization with additional details from the X.509 client certificate.
        # CUSTOM_AUTH - Use custom authentication and authorization. For more information, see Custom
        # authentication and authorization . AWS_X509 - Use X.509 client certificates without custom
        # authentication and authorization. For more information, see X.509 client certificates . AWS_SIGV4 -
        # Use Amazon Web Services Signature Version 4. For more information, see IAM users, groups, and roles
        # . DEFAULT - Use a combination of port and Application Layer Protocol Negotiation (ALPN) to specify
        # authentication type. For more information, see Device communication protocols .
        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String?

        # An object that specifies the authorization service for a domain.
        @[JSON::Field(key: "authorizerConfig")]
        getter authorizer_config : Types::AuthorizerConfig?

        # An object that speciﬁes the client certificate conﬁguration for a domain.
        @[JSON::Field(key: "clientCertificateConfig")]
        getter client_certificate_config : Types::ClientCertificateConfig?

        # The ARN of the domain configuration.
        @[JSON::Field(key: "domainConfigurationArn")]
        getter domain_configuration_arn : String?

        # The name of the domain configuration.
        @[JSON::Field(key: "domainConfigurationName")]
        getter domain_configuration_name : String?

        # A Boolean value that specifies the current state of the domain configuration.
        @[JSON::Field(key: "domainConfigurationStatus")]
        getter domain_configuration_status : String?

        # The name of the domain.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The type of the domain.
        @[JSON::Field(key: "domainType")]
        getter domain_type : String?

        # The date and time the domain configuration's status was last changed.
        @[JSON::Field(key: "lastStatusChangeDate")]
        getter last_status_change_date : Time?

        # The server certificate configuration.
        @[JSON::Field(key: "serverCertificateConfig")]
        getter server_certificate_config : Types::ServerCertificateConfig?

        # A list containing summary information about the server certificate included in the domain
        # configuration.
        @[JSON::Field(key: "serverCertificates")]
        getter server_certificates : Array(Types::ServerCertificateSummary)?

        # The type of service delivered by the endpoint.
        @[JSON::Field(key: "serviceType")]
        getter service_type : String?

        # An object that specifies the TLS configuration for a domain.
        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfig?

        def initialize(
          @application_protocol : String? = nil,
          @authentication_type : String? = nil,
          @authorizer_config : Types::AuthorizerConfig? = nil,
          @client_certificate_config : Types::ClientCertificateConfig? = nil,
          @domain_configuration_arn : String? = nil,
          @domain_configuration_name : String? = nil,
          @domain_configuration_status : String? = nil,
          @domain_name : String? = nil,
          @domain_type : String? = nil,
          @last_status_change_date : Time? = nil,
          @server_certificate_config : Types::ServerCertificateConfig? = nil,
          @server_certificates : Array(Types::ServerCertificateSummary)? = nil,
          @service_type : String? = nil,
          @tls_config : Types::TlsConfig? = nil
        )
        end
      end

      struct DescribeEncryptionConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeEncryptionConfigurationResponse
        include JSON::Serializable

        # The encryption configuration details that include the status information of the KMS key and the KMS
        # access role.
        @[JSON::Field(key: "configurationDetails")]
        getter configuration_details : Types::ConfigurationDetails?

        # The type of the KMS key.
        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String?

        # The Amazon Resource Name (ARN) of the IAM role assumed by Amazon Web Services IoT Core to call KMS
        # on behalf of the customer.
        @[JSON::Field(key: "kmsAccessRoleArn")]
        getter kms_access_role_arn : String?

        # The ARN of the customer managed KMS key.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The date when encryption configuration is last updated.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        def initialize(
          @configuration_details : Types::ConfigurationDetails? = nil,
          @encryption_type : String? = nil,
          @kms_access_role_arn : String? = nil,
          @kms_key_arn : String? = nil,
          @last_modified_date : Time? = nil
        )
        end
      end

      # The input for the DescribeEndpoint operation.
      struct DescribeEndpointRequest
        include JSON::Serializable

        # The endpoint type. Valid endpoint types include: iot:Data - Returns a VeriSign signed data endpoint.
        # iot:Data-ATS - Returns an ATS signed data endpoint. iot:CredentialProvider - Returns an IoT
        # credentials provider API endpoint. iot:Jobs - Returns an IoT device management Jobs API endpoint. We
        # strongly recommend that customers use the newer iot:Data-ATS endpoint type to avoid issues related
        # to the widespread distrust of Symantec certificate authorities. ATS Signed Certificates are more
        # secure and are trusted by most popular browsers.
        @[JSON::Field(key: "endpointType")]
        getter endpoint_type : String?

        def initialize(
          @endpoint_type : String? = nil
        )
        end
      end

      # The output from the DescribeEndpoint operation.
      struct DescribeEndpointResponse
        include JSON::Serializable

        # The endpoint. The format of the endpoint is as follows: identifier .iot. region .amazonaws.com.
        @[JSON::Field(key: "endpointAddress")]
        getter endpoint_address : String?

        def initialize(
          @endpoint_address : String? = nil
        )
        end
      end

      struct DescribeEventConfigurationsRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeEventConfigurationsResponse
        include JSON::Serializable

        # The creation date of the event configuration.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The event configurations.
        @[JSON::Field(key: "eventConfigurations")]
        getter event_configurations : Hash(String, Types::Configuration)?

        # The date the event configurations were last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        def initialize(
          @creation_date : Time? = nil,
          @event_configurations : Hash(String, Types::Configuration)? = nil,
          @last_modified_date : Time? = nil
        )
        end
      end

      struct DescribeFleetMetricRequest
        include JSON::Serializable

        # The name of the fleet metric to describe.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        def initialize(
          @metric_name : String
        )
        end
      end

      struct DescribeFleetMetricResponse
        include JSON::Serializable

        # The field to aggregate.
        @[JSON::Field(key: "aggregationField")]
        getter aggregation_field : String?

        # The type of the aggregation query.
        @[JSON::Field(key: "aggregationType")]
        getter aggregation_type : Types::AggregationType?

        # The date when the fleet metric is created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The fleet metric description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the index to search.
        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The date when the fleet metric is last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The ARN of the fleet metric to describe.
        @[JSON::Field(key: "metricArn")]
        getter metric_arn : String?

        # The name of the fleet metric to describe.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        # The time in seconds between fleet metric emissions. Range [60(1 min), 86400(1 day)] and must be
        # multiple of 60.
        @[JSON::Field(key: "period")]
        getter period : Int32?

        # The search query string.
        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        # The query version.
        @[JSON::Field(key: "queryVersion")]
        getter query_version : String?

        # Used to support unit transformation such as milliseconds to seconds. The unit must be supported by
        # CW metric .
        @[JSON::Field(key: "unit")]
        getter unit : String?

        # The version of the fleet metric.
        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @aggregation_field : String? = nil,
          @aggregation_type : Types::AggregationType? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @index_name : String? = nil,
          @last_modified_date : Time? = nil,
          @metric_arn : String? = nil,
          @metric_name : String? = nil,
          @period : Int32? = nil,
          @query_string : String? = nil,
          @query_version : String? = nil,
          @unit : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      struct DescribeIndexRequest
        include JSON::Serializable

        # The index name.
        @[JSON::Field(key: "indexName")]
        getter index_name : String

        def initialize(
          @index_name : String
        )
        end
      end

      struct DescribeIndexResponse
        include JSON::Serializable

        # The index name.
        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The index status.
        @[JSON::Field(key: "indexStatus")]
        getter index_status : String?

        # Contains a value that specifies the type of indexing performed. Valid values are: REGISTRY – Your
        # thing index contains only registry data. REGISTRY_AND_SHADOW - Your thing index contains registry
        # data and shadow data. REGISTRY_AND_CONNECTIVITY_STATUS - Your thing index contains registry data and
        # thing connectivity status data. REGISTRY_AND_SHADOW_AND_CONNECTIVITY_STATUS - Your thing index
        # contains registry data, shadow data, and thing connectivity status data. MULTI_INDEXING_MODE - Your
        # thing index contains multiple data sources. For more information, see GetIndexingConfiguration .
        @[JSON::Field(key: "schema")]
        getter schema : String?

        def initialize(
          @index_name : String? = nil,
          @index_status : String? = nil,
          @schema : String? = nil
        )
        end
      end

      struct DescribeJobExecutionRequest
        include JSON::Serializable

        # The unique identifier you assigned to this job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The name of the thing on which the job execution is running.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # A string (consisting of the digits "0" through "9" which is used to specify a particular job
        # execution on a particular device.
        @[JSON::Field(key: "executionNumber")]
        getter execution_number : Int64?

        def initialize(
          @job_id : String,
          @thing_name : String,
          @execution_number : Int64? = nil
        )
        end
      end

      struct DescribeJobExecutionResponse
        include JSON::Serializable

        # Information about the job execution.
        @[JSON::Field(key: "execution")]
        getter execution : Types::JobExecution?

        def initialize(
          @execution : Types::JobExecution? = nil
        )
        end
      end

      struct DescribeJobRequest
        include JSON::Serializable

        # The unique identifier you assigned to this job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # Provides a view of the job document before and after the substitution parameters have been resolved
        # with their exact values.
        @[JSON::Field(key: "beforeSubstitution")]
        getter before_substitution : Bool?

        def initialize(
          @job_id : String,
          @before_substitution : Bool? = nil
        )
        end
      end

      struct DescribeJobResponse
        include JSON::Serializable

        # An S3 link to the job document.
        @[JSON::Field(key: "documentSource")]
        getter document_source : String?

        # Information about the job.
        @[JSON::Field(key: "job")]
        getter job : Types::Job?

        def initialize(
          @document_source : String? = nil,
          @job : Types::Job? = nil
        )
        end
      end

      struct DescribeJobTemplateRequest
        include JSON::Serializable

        # The unique identifier of the job template.
        @[JSON::Field(key: "jobTemplateId")]
        getter job_template_id : String

        def initialize(
          @job_template_id : String
        )
        end
      end

      struct DescribeJobTemplateResponse
        include JSON::Serializable

        @[JSON::Field(key: "abortConfig")]
        getter abort_config : Types::AbortConfig?

        # The time, in seconds since the epoch, when the job template was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # A description of the job template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The package version Amazon Resource Names (ARNs) that are installed on the device when the job
        # successfully completes. The package version must be in either the Published or Deprecated state when
        # the job deploys. For more information, see Package version lifecycle . Note: The following Length
        # Constraints relates to a single ARN. Up to 25 package version ARNs are allowed.
        @[JSON::Field(key: "destinationPackageVersions")]
        getter destination_package_versions : Array(String)?

        # The job document.
        @[JSON::Field(key: "document")]
        getter document : String?

        # An S3 link to the job document.
        @[JSON::Field(key: "documentSource")]
        getter document_source : String?

        # The configuration that determines how many retries are allowed for each failure type for a job.
        @[JSON::Field(key: "jobExecutionsRetryConfig")]
        getter job_executions_retry_config : Types::JobExecutionsRetryConfig?

        @[JSON::Field(key: "jobExecutionsRolloutConfig")]
        getter job_executions_rollout_config : Types::JobExecutionsRolloutConfig?

        # The ARN of the job template.
        @[JSON::Field(key: "jobTemplateArn")]
        getter job_template_arn : String?

        # The unique identifier of the job template.
        @[JSON::Field(key: "jobTemplateId")]
        getter job_template_id : String?

        # Allows you to configure an optional maintenance window for the rollout of a job document to all
        # devices in the target group for a job.
        @[JSON::Field(key: "maintenanceWindows")]
        getter maintenance_windows : Array(Types::MaintenanceWindow)?

        @[JSON::Field(key: "presignedUrlConfig")]
        getter presigned_url_config : Types::PresignedUrlConfig?

        @[JSON::Field(key: "timeoutConfig")]
        getter timeout_config : Types::TimeoutConfig?

        def initialize(
          @abort_config : Types::AbortConfig? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @destination_package_versions : Array(String)? = nil,
          @document : String? = nil,
          @document_source : String? = nil,
          @job_executions_retry_config : Types::JobExecutionsRetryConfig? = nil,
          @job_executions_rollout_config : Types::JobExecutionsRolloutConfig? = nil,
          @job_template_arn : String? = nil,
          @job_template_id : String? = nil,
          @maintenance_windows : Array(Types::MaintenanceWindow)? = nil,
          @presigned_url_config : Types::PresignedUrlConfig? = nil,
          @timeout_config : Types::TimeoutConfig? = nil
        )
        end
      end

      struct DescribeManagedJobTemplateRequest
        include JSON::Serializable

        # The unique name of a managed job template, which is required.
        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # An optional parameter to specify version of a managed template. If not specified, the pre-defined
        # default version is returned.
        @[JSON::Field(key: "templateVersion")]
        getter template_version : String?

        def initialize(
          @template_name : String,
          @template_version : String? = nil
        )
        end
      end

      struct DescribeManagedJobTemplateResponse
        include JSON::Serializable

        # The unique description of a managed template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The document schema for a managed job template.
        @[JSON::Field(key: "document")]
        getter document : String?

        # A map of key-value pairs that you can use as guidance to specify the inputs for creating a job from
        # a managed template. documentParameters can only be used when creating jobs from Amazon Web Services
        # managed templates. This parameter can't be used with custom job templates or to create jobs from
        # them.
        @[JSON::Field(key: "documentParameters")]
        getter document_parameters : Array(Types::DocumentParameter)?

        # A list of environments that are supported with the managed job template.
        @[JSON::Field(key: "environments")]
        getter environments : Array(String)?

        # The unique Amazon Resource Name (ARN) of the managed template.
        @[JSON::Field(key: "templateArn")]
        getter template_arn : String?

        # The unique name of a managed template, such as AWS-Reboot .
        @[JSON::Field(key: "templateName")]
        getter template_name : String?

        # The version for a managed template.
        @[JSON::Field(key: "templateVersion")]
        getter template_version : String?

        def initialize(
          @description : String? = nil,
          @document : String? = nil,
          @document_parameters : Array(Types::DocumentParameter)? = nil,
          @environments : Array(String)? = nil,
          @template_arn : String? = nil,
          @template_name : String? = nil,
          @template_version : String? = nil
        )
        end
      end

      struct DescribeMitigationActionRequest
        include JSON::Serializable

        # The friendly name that uniquely identifies the mitigation action.
        @[JSON::Field(key: "actionName")]
        getter action_name : String

        def initialize(
          @action_name : String
        )
        end
      end

      struct DescribeMitigationActionResponse
        include JSON::Serializable

        # The ARN that identifies this migration action.
        @[JSON::Field(key: "actionArn")]
        getter action_arn : String?

        # A unique identifier for this action.
        @[JSON::Field(key: "actionId")]
        getter action_id : String?

        # The friendly name that uniquely identifies the mitigation action.
        @[JSON::Field(key: "actionName")]
        getter action_name : String?

        # Parameters that control how the mitigation action is applied, specific to the type of mitigation
        # action.
        @[JSON::Field(key: "actionParams")]
        getter action_params : Types::MitigationActionParams?

        # The type of mitigation action.
        @[JSON::Field(key: "actionType")]
        getter action_type : String?

        # The date and time when the mitigation action was added to your Amazon Web Services accounts.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The date and time when the mitigation action was last changed.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The ARN of the IAM role used to apply this action.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @action_arn : String? = nil,
          @action_id : String? = nil,
          @action_name : String? = nil,
          @action_params : Types::MitigationActionParams? = nil,
          @action_type : String? = nil,
          @creation_date : Time? = nil,
          @last_modified_date : Time? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct DescribeProvisioningTemplateRequest
        include JSON::Serializable

        # The name of the provisioning template.
        @[JSON::Field(key: "templateName")]
        getter template_name : String

        def initialize(
          @template_name : String
        )
        end
      end

      struct DescribeProvisioningTemplateResponse
        include JSON::Serializable

        # The date when the provisioning template was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The default fleet template version ID.
        @[JSON::Field(key: "defaultVersionId")]
        getter default_version_id : Int32?

        # The description of the provisioning template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # True if the provisioning template is enabled, otherwise false.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The date when the provisioning template was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # Gets information about a pre-provisioned hook.
        @[JSON::Field(key: "preProvisioningHook")]
        getter pre_provisioning_hook : Types::ProvisioningHook?

        # The ARN of the role associated with the provisioning template. This IoT role grants permission to
        # provision a device.
        @[JSON::Field(key: "provisioningRoleArn")]
        getter provisioning_role_arn : String?

        # The ARN of the provisioning template.
        @[JSON::Field(key: "templateArn")]
        getter template_arn : String?

        # The JSON formatted contents of the provisioning template.
        @[JSON::Field(key: "templateBody")]
        getter template_body : String?

        # The name of the provisioning template.
        @[JSON::Field(key: "templateName")]
        getter template_name : String?

        # The type you define in a provisioning template. You can create a template with only one type. You
        # can't change the template type after its creation. The default value is FLEET_PROVISIONING . For
        # more information about provisioning template, see: Provisioning template .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @creation_date : Time? = nil,
          @default_version_id : Int32? = nil,
          @description : String? = nil,
          @enabled : Bool? = nil,
          @last_modified_date : Time? = nil,
          @pre_provisioning_hook : Types::ProvisioningHook? = nil,
          @provisioning_role_arn : String? = nil,
          @template_arn : String? = nil,
          @template_body : String? = nil,
          @template_name : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct DescribeProvisioningTemplateVersionRequest
        include JSON::Serializable

        # The template name.
        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The provisioning template version ID.
        @[JSON::Field(key: "versionId")]
        getter version_id : Int32

        def initialize(
          @template_name : String,
          @version_id : Int32
        )
        end
      end

      struct DescribeProvisioningTemplateVersionResponse
        include JSON::Serializable

        # The date when the provisioning template version was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # True if the provisioning template version is the default version.
        @[JSON::Field(key: "isDefaultVersion")]
        getter is_default_version : Bool?

        # The JSON formatted contents of the provisioning template version.
        @[JSON::Field(key: "templateBody")]
        getter template_body : String?

        # The provisioning template version ID.
        @[JSON::Field(key: "versionId")]
        getter version_id : Int32?

        def initialize(
          @creation_date : Time? = nil,
          @is_default_version : Bool? = nil,
          @template_body : String? = nil,
          @version_id : Int32? = nil
        )
        end
      end

      struct DescribeRoleAliasRequest
        include JSON::Serializable

        # The role alias to describe.
        @[JSON::Field(key: "roleAlias")]
        getter role_alias : String

        def initialize(
          @role_alias : String
        )
        end
      end

      struct DescribeRoleAliasResponse
        include JSON::Serializable

        # The role alias description.
        @[JSON::Field(key: "roleAliasDescription")]
        getter role_alias_description : Types::RoleAliasDescription?

        def initialize(
          @role_alias_description : Types::RoleAliasDescription? = nil
        )
        end
      end

      struct DescribeScheduledAuditRequest
        include JSON::Serializable

        # The name of the scheduled audit whose information you want to get.
        @[JSON::Field(key: "scheduledAuditName")]
        getter scheduled_audit_name : String

        def initialize(
          @scheduled_audit_name : String
        )
        end
      end

      struct DescribeScheduledAuditResponse
        include JSON::Serializable

        # The day of the month on which the scheduled audit takes place. This is will be 1 through 31 or LAST
        # . If days 29 - 31 are specified, and the month does not have that many days, the audit takes place
        # on the LAST day of the month.
        @[JSON::Field(key: "dayOfMonth")]
        getter day_of_month : String?

        # The day of the week on which the scheduled audit takes place, either one of SUN , MON , TUE , WED ,
        # THU , FRI , or SAT .
        @[JSON::Field(key: "dayOfWeek")]
        getter day_of_week : String?

        # How often the scheduled audit takes place, either one of DAILY , WEEKLY , BIWEEKLY , or MONTHLY .
        # The start time of each audit is determined by the system.
        @[JSON::Field(key: "frequency")]
        getter frequency : String?

        # The ARN of the scheduled audit.
        @[JSON::Field(key: "scheduledAuditArn")]
        getter scheduled_audit_arn : String?

        # The name of the scheduled audit.
        @[JSON::Field(key: "scheduledAuditName")]
        getter scheduled_audit_name : String?

        # Which checks are performed during the scheduled audit. Checks must be enabled for your account. (Use
        # DescribeAccountAuditConfiguration to see the list of all checks, including those that are enabled or
        # use UpdateAccountAuditConfiguration to select which checks are enabled.)
        @[JSON::Field(key: "targetCheckNames")]
        getter target_check_names : Array(String)?

        def initialize(
          @day_of_month : String? = nil,
          @day_of_week : String? = nil,
          @frequency : String? = nil,
          @scheduled_audit_arn : String? = nil,
          @scheduled_audit_name : String? = nil,
          @target_check_names : Array(String)? = nil
        )
        end
      end

      struct DescribeSecurityProfileRequest
        include JSON::Serializable

        # The name of the security profile whose information you want to get.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String

        def initialize(
          @security_profile_name : String
        )
        end
      end

      struct DescribeSecurityProfileResponse
        include JSON::Serializable

        # Please use DescribeSecurityProfileResponse$additionalMetricsToRetainV2 instead. A list of metrics
        # whose data is retained (stored). By default, data is retained for any metric used in the profile's
        # behaviors , but it is also retained for any metric specified here.
        @[JSON::Field(key: "additionalMetricsToRetain")]
        getter additional_metrics_to_retain : Array(String)?

        # A list of metrics whose data is retained (stored). By default, data is retained for any metric used
        # in the profile's behaviors, but it is also retained for any metric specified here.
        @[JSON::Field(key: "additionalMetricsToRetainV2")]
        getter additional_metrics_to_retain_v2 : Array(Types::MetricToRetain)?

        # Where the alerts are sent. (Alerts are always sent to the console.)
        @[JSON::Field(key: "alertTargets")]
        getter alert_targets : Hash(String, Types::AlertTarget)?

        # Specifies the behaviors that, when violated by a device (thing), cause an alert.
        @[JSON::Field(key: "behaviors")]
        getter behaviors : Array(Types::Behavior)?

        # The time the security profile was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The time the security profile was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # Specifies the MQTT topic and role ARN required for metric export.
        @[JSON::Field(key: "metricsExportConfig")]
        getter metrics_export_config : Types::MetricsExportConfig?

        # The ARN of the security profile.
        @[JSON::Field(key: "securityProfileArn")]
        getter security_profile_arn : String?

        # A description of the security profile (associated with the security profile when it was created or
        # updated).
        @[JSON::Field(key: "securityProfileDescription")]
        getter security_profile_description : String?

        # The name of the security profile.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String?

        # The version of the security profile. A new version is generated whenever the security profile is
        # updated.
        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @additional_metrics_to_retain : Array(String)? = nil,
          @additional_metrics_to_retain_v2 : Array(Types::MetricToRetain)? = nil,
          @alert_targets : Hash(String, Types::AlertTarget)? = nil,
          @behaviors : Array(Types::Behavior)? = nil,
          @creation_date : Time? = nil,
          @last_modified_date : Time? = nil,
          @metrics_export_config : Types::MetricsExportConfig? = nil,
          @security_profile_arn : String? = nil,
          @security_profile_description : String? = nil,
          @security_profile_name : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      struct DescribeStreamRequest
        include JSON::Serializable

        # The stream ID.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String

        def initialize(
          @stream_id : String
        )
        end
      end

      struct DescribeStreamResponse
        include JSON::Serializable

        # Information about the stream.
        @[JSON::Field(key: "streamInfo")]
        getter stream_info : Types::StreamInfo?

        def initialize(
          @stream_info : Types::StreamInfo? = nil
        )
        end
      end

      struct DescribeThingGroupRequest
        include JSON::Serializable

        # The name of the thing group.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String

        def initialize(
          @thing_group_name : String
        )
        end
      end

      struct DescribeThingGroupResponse
        include JSON::Serializable

        # The dynamic thing group index name.
        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The dynamic thing group search query string.
        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        # The dynamic thing group query version.
        @[JSON::Field(key: "queryVersion")]
        getter query_version : String?

        # The dynamic thing group status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The thing group ARN.
        @[JSON::Field(key: "thingGroupArn")]
        getter thing_group_arn : String?

        # The thing group ID.
        @[JSON::Field(key: "thingGroupId")]
        getter thing_group_id : String?

        # Thing group metadata.
        @[JSON::Field(key: "thingGroupMetadata")]
        getter thing_group_metadata : Types::ThingGroupMetadata?

        # The name of the thing group.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String?

        # The thing group properties.
        @[JSON::Field(key: "thingGroupProperties")]
        getter thing_group_properties : Types::ThingGroupProperties?

        # The version of the thing group.
        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @index_name : String? = nil,
          @query_string : String? = nil,
          @query_version : String? = nil,
          @status : String? = nil,
          @thing_group_arn : String? = nil,
          @thing_group_id : String? = nil,
          @thing_group_metadata : Types::ThingGroupMetadata? = nil,
          @thing_group_name : String? = nil,
          @thing_group_properties : Types::ThingGroupProperties? = nil,
          @version : Int64? = nil
        )
        end
      end

      struct DescribeThingRegistrationTaskRequest
        include JSON::Serializable

        # The task ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end

      struct DescribeThingRegistrationTaskResponse
        include JSON::Serializable

        # The task creation date.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The number of things that failed to be provisioned.
        @[JSON::Field(key: "failureCount")]
        getter failure_count : Int32?

        # The S3 bucket that contains the input file.
        @[JSON::Field(key: "inputFileBucket")]
        getter input_file_bucket : String?

        # The input file key.
        @[JSON::Field(key: "inputFileKey")]
        getter input_file_key : String?

        # The date when the task was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The message.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The progress of the bulk provisioning task expressed as a percentage.
        @[JSON::Field(key: "percentageProgress")]
        getter percentage_progress : Int32?

        # The role ARN that grants access to the input file bucket.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status of the bulk thing provisioning task.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The number of things successfully provisioned.
        @[JSON::Field(key: "successCount")]
        getter success_count : Int32?

        # The task ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        # The task's template.
        @[JSON::Field(key: "templateBody")]
        getter template_body : String?

        def initialize(
          @creation_date : Time? = nil,
          @failure_count : Int32? = nil,
          @input_file_bucket : String? = nil,
          @input_file_key : String? = nil,
          @last_modified_date : Time? = nil,
          @message : String? = nil,
          @percentage_progress : Int32? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @success_count : Int32? = nil,
          @task_id : String? = nil,
          @template_body : String? = nil
        )
        end
      end

      # The input for the DescribeThing operation.
      struct DescribeThingRequest
        include JSON::Serializable

        # The name of the thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        def initialize(
          @thing_name : String
        )
        end
      end

      # The output from the DescribeThing operation.
      struct DescribeThingResponse
        include JSON::Serializable

        # The thing attributes.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The name of the billing group the thing belongs to.
        @[JSON::Field(key: "billingGroupName")]
        getter billing_group_name : String?

        # The default MQTT client ID. For a typical device, the thing name is also used as the default MQTT
        # client ID. Although we don’t require a mapping between a thing's registry name and its use of MQTT
        # client IDs, certificates, or shadow state, we recommend that you choose a thing name and use it as
        # the MQTT client ID for the registry and the Device Shadow service. This lets you better organize
        # your IoT fleet without removing the flexibility of the underlying device certificate model or
        # shadows.
        @[JSON::Field(key: "defaultClientId")]
        getter default_client_id : String?

        # The ARN of the thing to describe.
        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        # The ID of the thing to describe.
        @[JSON::Field(key: "thingId")]
        getter thing_id : String?

        # The name of the thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        # The thing type name.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String?

        # The current version of the thing record in the registry. To avoid unintentional changes to the
        # information in the registry, you can pass the version information in the expectedVersion parameter
        # of the UpdateThing and DeleteThing calls.
        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @billing_group_name : String? = nil,
          @default_client_id : String? = nil,
          @thing_arn : String? = nil,
          @thing_id : String? = nil,
          @thing_name : String? = nil,
          @thing_type_name : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      # The input for the DescribeThingType operation.
      struct DescribeThingTypeRequest
        include JSON::Serializable

        # The name of the thing type.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String

        def initialize(
          @thing_type_name : String
        )
        end
      end

      # The output for the DescribeThingType operation.
      struct DescribeThingTypeResponse
        include JSON::Serializable

        # The thing type ARN.
        @[JSON::Field(key: "thingTypeArn")]
        getter thing_type_arn : String?

        # The thing type ID.
        @[JSON::Field(key: "thingTypeId")]
        getter thing_type_id : String?

        # The ThingTypeMetadata contains additional information about the thing type including: creation date
        # and time, a value indicating whether the thing type is deprecated, and a date and time when it was
        # deprecated.
        @[JSON::Field(key: "thingTypeMetadata")]
        getter thing_type_metadata : Types::ThingTypeMetadata?

        # The name of the thing type.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String?

        # The ThingTypeProperties contains information about the thing type including description, a list of
        # searchable thing attribute names, and MQTT5 configuration.
        @[JSON::Field(key: "thingTypeProperties")]
        getter thing_type_properties : Types::ThingTypeProperties?

        def initialize(
          @thing_type_arn : String? = nil,
          @thing_type_id : String? = nil,
          @thing_type_metadata : Types::ThingTypeMetadata? = nil,
          @thing_type_name : String? = nil,
          @thing_type_properties : Types::ThingTypeProperties? = nil
        )
        end
      end

      # Describes the location of the updated firmware.
      struct Destination
        include JSON::Serializable

        # Describes the location in S3 of the updated firmware.
        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?

        def initialize(
          @s3_destination : Types::S3Destination? = nil
        )
        end
      end

      struct DetachPolicyRequest
        include JSON::Serializable

        # The policy to detach.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        # The target from which the policy will be detached.
        @[JSON::Field(key: "target")]
        getter target : String

        def initialize(
          @policy_name : String,
          @target : String
        )
        end
      end

      # The input for the DetachPrincipalPolicy operation.
      struct DetachPrincipalPolicyRequest
        include JSON::Serializable

        # The name of the policy to detach.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        # The principal. Valid principals are CertificateArn (arn:aws:iot: region : accountId :cert/
        # certificateId ), thingGroupArn (arn:aws:iot: region : accountId :thinggroup/ groupName ) and
        # CognitoId ( region : id ).
        @[JSON::Field(key: "x-amzn-iot-principal")]
        getter principal : String

        def initialize(
          @policy_name : String,
          @principal : String
        )
        end
      end

      struct DetachSecurityProfileRequest
        include JSON::Serializable

        # The security profile that is detached.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String

        # The ARN of the thing group from which the security profile is detached.
        @[JSON::Field(key: "securityProfileTargetArn")]
        getter security_profile_target_arn : String

        def initialize(
          @security_profile_name : String,
          @security_profile_target_arn : String
        )
        end
      end

      struct DetachSecurityProfileResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the DetachThingPrincipal operation.
      struct DetachThingPrincipalRequest
        include JSON::Serializable

        # If the principal is a certificate, this value must be ARN of the certificate. If the principal is an
        # Amazon Cognito identity, this value must be the ID of the Amazon Cognito identity.
        @[JSON::Field(key: "x-amzn-principal")]
        getter principal : String

        # The name of the thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        def initialize(
          @principal : String,
          @thing_name : String
        )
        end
      end

      # The output from the DetachThingPrincipal operation.
      struct DetachThingPrincipalResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes which mitigation actions should be executed.
      struct DetectMitigationActionExecution
        include JSON::Serializable

        # The friendly name that uniquely identifies the mitigation action.
        @[JSON::Field(key: "actionName")]
        getter action_name : String?

        # The error code of a mitigation action.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The date a mitigation action ended.
        @[JSON::Field(key: "executionEndDate")]
        getter execution_end_date : Time?

        # The date a mitigation action was started.
        @[JSON::Field(key: "executionStartDate")]
        getter execution_start_date : Time?

        # The message of a mitigation action.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The status of a mitigation action.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The unique identifier of the task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        # The name of the thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        # The unique identifier of the violation.
        @[JSON::Field(key: "violationId")]
        getter violation_id : String?

        def initialize(
          @action_name : String? = nil,
          @error_code : String? = nil,
          @execution_end_date : Time? = nil,
          @execution_start_date : Time? = nil,
          @message : String? = nil,
          @status : String? = nil,
          @task_id : String? = nil,
          @thing_name : String? = nil,
          @violation_id : String? = nil
        )
        end
      end

      # The statistics of a mitigation action task.
      struct DetectMitigationActionsTaskStatistics
        include JSON::Serializable

        # The actions that were performed.
        @[JSON::Field(key: "actionsExecuted")]
        getter actions_executed : Int64?

        # The actions that failed.
        @[JSON::Field(key: "actionsFailed")]
        getter actions_failed : Int64?

        # The actions that were skipped.
        @[JSON::Field(key: "actionsSkipped")]
        getter actions_skipped : Int64?

        def initialize(
          @actions_executed : Int64? = nil,
          @actions_failed : Int64? = nil,
          @actions_skipped : Int64? = nil
        )
        end
      end

      # The summary of the mitigation action tasks.
      struct DetectMitigationActionsTaskSummary
        include JSON::Serializable

        # The definition of the actions.
        @[JSON::Field(key: "actionsDefinition")]
        getter actions_definition : Array(Types::MitigationAction)?

        # Includes only active violations.
        @[JSON::Field(key: "onlyActiveViolationsIncluded")]
        getter only_active_violations_included : Bool?

        # Includes suppressed alerts.
        @[JSON::Field(key: "suppressedAlertsIncluded")]
        getter suppressed_alerts_included : Bool?

        # Specifies the ML Detect findings to which the mitigation actions are applied.
        @[JSON::Field(key: "target")]
        getter target : Types::DetectMitigationActionsTaskTarget?

        # The date the task ended.
        @[JSON::Field(key: "taskEndTime")]
        getter task_end_time : Time?

        # The unique identifier of the task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        # The date the task started.
        @[JSON::Field(key: "taskStartTime")]
        getter task_start_time : Time?

        # The statistics of a mitigation action task.
        @[JSON::Field(key: "taskStatistics")]
        getter task_statistics : Types::DetectMitigationActionsTaskStatistics?

        # The status of the task.
        @[JSON::Field(key: "taskStatus")]
        getter task_status : String?

        # Specifies the time period of which violation events occurred between.
        @[JSON::Field(key: "violationEventOccurrenceRange")]
        getter violation_event_occurrence_range : Types::ViolationEventOccurrenceRange?

        def initialize(
          @actions_definition : Array(Types::MitigationAction)? = nil,
          @only_active_violations_included : Bool? = nil,
          @suppressed_alerts_included : Bool? = nil,
          @target : Types::DetectMitigationActionsTaskTarget? = nil,
          @task_end_time : Time? = nil,
          @task_id : String? = nil,
          @task_start_time : Time? = nil,
          @task_statistics : Types::DetectMitigationActionsTaskStatistics? = nil,
          @task_status : String? = nil,
          @violation_event_occurrence_range : Types::ViolationEventOccurrenceRange? = nil
        )
        end
      end

      # The target of a mitigation action task.
      struct DetectMitigationActionsTaskTarget
        include JSON::Serializable

        # The name of the behavior.
        @[JSON::Field(key: "behaviorName")]
        getter behavior_name : String?

        # The name of the security profile.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String?

        # The unique identifiers of the violations.
        @[JSON::Field(key: "violationIds")]
        getter violation_ids : Array(String)?

        def initialize(
          @behavior_name : String? = nil,
          @security_profile_name : String? = nil,
          @violation_ids : Array(String)? = nil
        )
        end
      end

      # The input for the DisableTopicRuleRequest operation.
      struct DisableTopicRuleRequest
        include JSON::Serializable

        # The name of the rule to disable.
        @[JSON::Field(key: "ruleName")]
        getter rule_name : String

        def initialize(
          @rule_name : String
        )
        end
      end

      struct DisassociateSbomFromPackageVersionRequest
        include JSON::Serializable

        # The name of the new software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String

        # The name of the new package version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @package_name : String,
          @version_name : String,
          @client_token : String? = nil
        )
        end
      end

      struct DisassociateSbomFromPackageVersionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A map of key-value pairs containing the patterns that need to be replaced in a managed template job
      # document schema. You can use the description of each key as a guidance to specify the inputs during
      # runtime when creating a job. documentParameters can only be used when creating jobs from Amazon Web
      # Services managed templates. This parameter can't be used with custom job templates or to create jobs
      # from them.
      struct DocumentParameter
        include JSON::Serializable

        # Description of the map field containing the patterns that need to be replaced in a managed template
        # job document schema.
        @[JSON::Field(key: "description")]
        getter description : String?

        # An example illustrating a pattern that need to be replaced in a managed template job document
        # schema.
        @[JSON::Field(key: "example")]
        getter example : String?

        # Key of the map field containing the patterns that need to be replaced in a managed template job
        # document schema.
        @[JSON::Field(key: "key")]
        getter key : String?

        # Specifies whether a pattern that needs to be replaced in a managed template job document schema is
        # optional or required.
        @[JSON::Field(key: "optional")]
        getter optional : Bool?

        # A regular expression of the patterns that need to be replaced in a managed template job document
        # schema.
        @[JSON::Field(key: "regex")]
        getter regex : String?

        def initialize(
          @description : String? = nil,
          @example : String? = nil,
          @key : String? = nil,
          @optional : Bool? = nil,
          @regex : String? = nil
        )
        end
      end

      # The summary of a domain configuration. A domain configuration specifies custom IoT-specific
      # information about a domain. A domain configuration can be associated with an Amazon Web
      # Services-managed domain (for example, dbc123defghijk.iot.us-west-2.amazonaws.com), a customer
      # managed domain, or a default endpoint. Data Jobs CredentialProvider
      struct DomainConfigurationSummary
        include JSON::Serializable

        # The ARN of the domain configuration.
        @[JSON::Field(key: "domainConfigurationArn")]
        getter domain_configuration_arn : String?

        # The name of the domain configuration. This value must be unique to a region.
        @[JSON::Field(key: "domainConfigurationName")]
        getter domain_configuration_name : String?

        # The type of service delivered by the endpoint.
        @[JSON::Field(key: "serviceType")]
        getter service_type : String?

        def initialize(
          @domain_configuration_arn : String? = nil,
          @domain_configuration_name : String? = nil,
          @service_type : String? = nil
        )
        end
      end

      # Describes an action to write to a DynamoDB table. The tableName , hashKeyField , and rangeKeyField
      # values must match the values used when you created the table. The hashKeyValue and rangeKeyvalue
      # fields use a substitution template syntax. These templates provide data at runtime. The syntax is as
      # follows: ${ sql-expression }. You can specify any valid expression in a WHERE or SELECT clause,
      # including JSON properties, comparisons, calculations, and functions. For example, the following
      # field uses the third level of the topic: "hashKeyValue": "${topic(3)}" The following field uses the
      # timestamp: "rangeKeyValue": "${timestamp()}"
      struct DynamoDBAction
        include JSON::Serializable

        # The hash key name.
        @[JSON::Field(key: "hashKeyField")]
        getter hash_key_field : String

        # The hash key value.
        @[JSON::Field(key: "hashKeyValue")]
        getter hash_key_value : String

        # The ARN of the IAM role that grants access to the DynamoDB table.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of the DynamoDB table.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # The hash key type. Valid values are "STRING" or "NUMBER"
        @[JSON::Field(key: "hashKeyType")]
        getter hash_key_type : String?

        # The type of operation to be performed. This follows the substitution template, so it can be
        # ${operation} , but the substitution must result in one of the following: INSERT , UPDATE , or DELETE
        # .
        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The action payload. This name can be customized.
        @[JSON::Field(key: "payloadField")]
        getter payload_field : String?

        # The range key name.
        @[JSON::Field(key: "rangeKeyField")]
        getter range_key_field : String?

        # The range key type. Valid values are "STRING" or "NUMBER"
        @[JSON::Field(key: "rangeKeyType")]
        getter range_key_type : String?

        # The range key value.
        @[JSON::Field(key: "rangeKeyValue")]
        getter range_key_value : String?

        def initialize(
          @hash_key_field : String,
          @hash_key_value : String,
          @role_arn : String,
          @table_name : String,
          @hash_key_type : String? = nil,
          @operation : String? = nil,
          @payload_field : String? = nil,
          @range_key_field : String? = nil,
          @range_key_type : String? = nil,
          @range_key_value : String? = nil
        )
        end
      end

      # Describes an action to write to a DynamoDB table. This DynamoDB action writes each attribute in the
      # message payload into it's own column in the DynamoDB table.
      struct DynamoDBv2Action
        include JSON::Serializable

        # Specifies the DynamoDB table to which the message data will be written. For example: { "dynamoDBv2":
        # { "roleArn": "aws:iam:12341251:my-role" "putItem": { "tableName": "my-table" } } } Each attribute in
        # the message payload will be written to a separate column in the DynamoDB database.
        @[JSON::Field(key: "putItem")]
        getter put_item : Types::PutItemInput

        # The ARN of the IAM role that grants access to the DynamoDB table.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @put_item : Types::PutItemInput,
          @role_arn : String
        )
        end
      end

      # The policy that has the effect on the authorization results.
      struct EffectivePolicy
        include JSON::Serializable

        # The policy ARN.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String?

        # The IAM policy document.
        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String?

        # The policy name.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String?

        def initialize(
          @policy_arn : String? = nil,
          @policy_document : String? = nil,
          @policy_name : String? = nil
        )
        end
      end

      # Describes an action that writes data to an Amazon OpenSearch Service domain. The Elasticsearch
      # action can only be used by existing rule actions. To create a new rule action or to update an
      # existing rule action, use the OpenSearch rule action instead. For more information, see
      # OpenSearchAction .
      struct ElasticsearchAction
        include JSON::Serializable

        # The endpoint of your OpenSearch domain.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        # The unique identifier for the document you are storing.
        @[JSON::Field(key: "id")]
        getter id : String

        # The index where you want to store your data.
        @[JSON::Field(key: "index")]
        getter index : String

        # The IAM role ARN that has access to OpenSearch.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The type of document you are storing.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @endpoint : String,
          @id : String,
          @index : String,
          @role_arn : String,
          @type : String
        )
        end
      end

      # Parameters used when defining a mitigation action that enable Amazon Web Services IoT Core logging.
      struct EnableIoTLoggingParams
        include JSON::Serializable

        # Specifies the type of information to be logged.
        @[JSON::Field(key: "logLevel")]
        getter log_level : String

        # The Amazon Resource Name (ARN) of the IAM role used for logging.
        @[JSON::Field(key: "roleArnForLogging")]
        getter role_arn_for_logging : String

        def initialize(
          @log_level : String,
          @role_arn_for_logging : String
        )
        end
      end

      # The input for the EnableTopicRuleRequest operation.
      struct EnableTopicRuleRequest
        include JSON::Serializable

        # The name of the topic rule to enable.
        @[JSON::Field(key: "ruleName")]
        getter rule_name : String

        def initialize(
          @rule_name : String
        )
        end
      end

      # Error information.
      struct ErrorInfo
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "code")]
        getter code : String?

        # The error message.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Information that explicitly denies authorization.
      struct ExplicitDeny
        include JSON::Serializable

        # The policies that denied the authorization.
        @[JSON::Field(key: "policies")]
        getter policies : Array(Types::Policy)?

        def initialize(
          @policies : Array(Types::Policy)? = nil
        )
        end
      end

      # Allows you to create an exponential rate of rollout for a job.
      struct ExponentialRolloutRate
        include JSON::Serializable

        # The minimum number of things that will be notified of a pending job, per minute at the start of job
        # rollout. This parameter allows you to define the initial rate of rollout.
        @[JSON::Field(key: "baseRatePerMinute")]
        getter base_rate_per_minute : Int32

        # The exponential factor to increase the rate of rollout for a job. Amazon Web Services IoT Core
        # supports up to one digit after the decimal (for example, 1.5, but not 1.55).
        @[JSON::Field(key: "incrementFactor")]
        getter increment_factor : Float64

        # The criteria to initiate the increase in rate of rollout for a job.
        @[JSON::Field(key: "rateIncreaseCriteria")]
        getter rate_increase_criteria : Types::RateIncreaseCriteria

        def initialize(
          @base_rate_per_minute : Int32,
          @increment_factor : Float64,
          @rate_increase_criteria : Types::RateIncreaseCriteria
        )
        end
      end

      # Describes the name and data type at a field.
      struct Field
        include JSON::Serializable

        # The name of the field.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The data type of the field.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The location of the OTA update.
      struct FileLocation
        include JSON::Serializable

        # The location of the updated firmware in S3.
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        # The stream that contains the OTA update.
        @[JSON::Field(key: "stream")]
        getter stream : Types::Stream?

        def initialize(
          @s3_location : Types::S3Location? = nil,
          @stream : Types::Stream? = nil
        )
        end
      end

      # Describes an action that writes data to an Amazon Kinesis Firehose stream.
      struct FirehoseAction
        include JSON::Serializable

        # The delivery stream name.
        @[JSON::Field(key: "deliveryStreamName")]
        getter delivery_stream_name : String

        # The IAM role that grants access to the Amazon Kinesis Firehose stream.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Whether to deliver the Kinesis Data Firehose stream as a batch by using PutRecordBatch . The default
        # value is false . When batchMode is true and the rule's SQL statement evaluates to an Array, each
        # Array element forms one record in the PutRecordBatch request. The resulting array can't have more
        # than 500 records.
        @[JSON::Field(key: "batchMode")]
        getter batch_mode : Bool?

        # A character separator that will be used to separate records written to the Firehose stream. Valid
        # values are: '\n' (newline), '\t' (tab), '\r\n' (Windows newline), ',' (comma).
        @[JSON::Field(key: "separator")]
        getter separator : String?

        def initialize(
          @delivery_stream_name : String,
          @role_arn : String,
          @batch_mode : Bool? = nil,
          @separator : String? = nil
        )
        end
      end

      # The name and ARN of a fleet metric.
      struct FleetMetricNameAndArn
        include JSON::Serializable

        # The fleet metric ARN.
        @[JSON::Field(key: "metricArn")]
        getter metric_arn : String?

        # The fleet metric name.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        def initialize(
          @metric_arn : String? = nil,
          @metric_name : String? = nil
        )
        end
      end

      # A geolocation target that you select to index. Each geolocation target contains a name and order
      # key-value pair that specifies the geolocation target fields.
      struct GeoLocationTarget
        include JSON::Serializable

        # The name of the geolocation target field. If the target field is part of a named shadow, you must
        # select the named shadow using the namedShadow filter.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The order of the geolocation target field. This field is optional. The default value is LatLon .
        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @name : String? = nil,
          @order : String? = nil
        )
        end
      end

      struct GetBehaviorModelTrainingSummariesRequest
        include JSON::Serializable

        # The maximum number of results to return at one time. The default is 10.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the security profile.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @security_profile_name : String? = nil
        )
        end
      end

      struct GetBehaviorModelTrainingSummariesResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of all ML Detect behaviors and their model status for a given Security Profile.
        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::BehaviorModelTrainingSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::BehaviorModelTrainingSummary)? = nil
        )
        end
      end

      struct GetBucketsAggregationRequest
        include JSON::Serializable

        # The aggregation field.
        @[JSON::Field(key: "aggregationField")]
        getter aggregation_field : String

        # The basic control of the response shape and the bucket aggregation type to perform.
        @[JSON::Field(key: "bucketsAggregationType")]
        getter buckets_aggregation_type : Types::BucketsAggregationType

        # The search query string.
        @[JSON::Field(key: "queryString")]
        getter query_string : String

        # The name of the index to search.
        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The version of the query.
        @[JSON::Field(key: "queryVersion")]
        getter query_version : String?

        def initialize(
          @aggregation_field : String,
          @buckets_aggregation_type : Types::BucketsAggregationType,
          @query_string : String,
          @index_name : String? = nil,
          @query_version : String? = nil
        )
        end
      end

      struct GetBucketsAggregationResponse
        include JSON::Serializable

        # The main part of the response with a list of buckets. Each bucket contains a keyValue and a count .
        # keyValue : The aggregation field value counted for the particular bucket. count : The number of
        # documents that have that value.
        @[JSON::Field(key: "buckets")]
        getter buckets : Array(Types::Bucket)?

        # The total number of things that fit the query string criteria.
        @[JSON::Field(key: "totalCount")]
        getter total_count : Int32?

        def initialize(
          @buckets : Array(Types::Bucket)? = nil,
          @total_count : Int32? = nil
        )
        end
      end

      struct GetCardinalityRequest
        include JSON::Serializable

        # The search query string.
        @[JSON::Field(key: "queryString")]
        getter query_string : String

        # The field to aggregate.
        @[JSON::Field(key: "aggregationField")]
        getter aggregation_field : String?

        # The name of the index to search.
        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The query version.
        @[JSON::Field(key: "queryVersion")]
        getter query_version : String?

        def initialize(
          @query_string : String,
          @aggregation_field : String? = nil,
          @index_name : String? = nil,
          @query_version : String? = nil
        )
        end
      end

      struct GetCardinalityResponse
        include JSON::Serializable

        # The approximate count of unique values that match the query.
        @[JSON::Field(key: "cardinality")]
        getter cardinality : Int32?

        def initialize(
          @cardinality : Int32? = nil
        )
        end
      end

      struct GetCommandExecutionRequest
        include JSON::Serializable

        # The unique identifier for the command execution. This information is returned as a response of the
        # StartCommandExecution API request.
        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        # The Amazon Resource Number (ARN) of the device on which the command execution is being performed.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String

        # Can be used to specify whether to include the result of the command execution in the
        # GetCommandExecution API response. Your device can use this field to provide additional information
        # about the command execution. You only need to specify this field when using the AWS-IoT namespace.
        @[JSON::Field(key: "includeResult")]
        getter include_result : Bool?

        def initialize(
          @execution_id : String,
          @target_arn : String,
          @include_result : Bool? = nil
        )
        end
      end

      struct GetCommandExecutionResponse
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the command. For example,
        # arn:aws:iot:&lt;region&gt;:&lt;accountid&gt;:command/&lt;commandId&gt;
        @[JSON::Field(key: "commandArn")]
        getter command_arn : String?

        # The timestamp, when the command execution was completed.
        @[JSON::Field(key: "completedAt")]
        getter completed_at : Time?

        # The timestamp, when the command execution was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The unique identifier of the command execution.
        @[JSON::Field(key: "executionId")]
        getter execution_id : String?

        # Specifies the amount of time in seconds that the device can take to finish a command execution. A
        # timer starts when the command execution is created. If the command execution status is not set to
        # another terminal state before the timer expires, it will automatically update to TIMED_OUT .
        @[JSON::Field(key: "executionTimeoutSeconds")]
        getter execution_timeout_seconds : Int64?

        # The timestamp, when the command execution was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The list of parameters that the StartCommandExecution API used when performing the command on the
        # device.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::CommandParameterValue)?

        # The result value for the current state of the command execution. The status provides information
        # about the progress of the command execution. The device can use the result field to share additional
        # details about the execution such as a return value of a remote function call. If you use the
        # AWS-IoT-FleetWise namespace, then this field is not applicable in the API response.
        @[JSON::Field(key: "result")]
        getter result : Hash(String, Types::CommandExecutionResult)?

        # The timestamp, when the command execution was started.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The status of the command execution. After your devices receive the command and start performing the
        # operations specified in the command, it can use the UpdateCommandExecution MQTT API to update the
        # status information.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Your devices can use this parameter to provide additional context about the status of a command
        # execution using a reason code and description.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : Types::StatusReason?

        # The Amazon Resource Number (ARN) of the device on which the command execution is being performed.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        # The time to live (TTL) parameter that indicates the duration for which executions will be retained
        # in your account. The default value is six months.
        @[JSON::Field(key: "timeToLive")]
        getter time_to_live : Time?

        def initialize(
          @command_arn : String? = nil,
          @completed_at : Time? = nil,
          @created_at : Time? = nil,
          @execution_id : String? = nil,
          @execution_timeout_seconds : Int64? = nil,
          @last_updated_at : Time? = nil,
          @parameters : Hash(String, Types::CommandParameterValue)? = nil,
          @result : Hash(String, Types::CommandExecutionResult)? = nil,
          @started_at : Time? = nil,
          @status : String? = nil,
          @status_reason : Types::StatusReason? = nil,
          @target_arn : String? = nil,
          @time_to_live : Time? = nil
        )
        end
      end

      struct GetCommandRequest
        include JSON::Serializable

        # The unique identifier of the command for which you want to retrieve information.
        @[JSON::Field(key: "commandId")]
        getter command_id : String

        def initialize(
          @command_id : String
        )
        end
      end

      struct GetCommandResponse
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the command. For example,
        # arn:aws:iot:&lt;region&gt;:&lt;accountid&gt;:command/&lt;commandId&gt;
        @[JSON::Field(key: "commandArn")]
        getter command_arn : String?

        # The unique identifier of the command.
        @[JSON::Field(key: "commandId")]
        getter command_id : String?

        # The timestamp, when the command was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Indicates whether the command has been deprecated.
        @[JSON::Field(key: "deprecated")]
        getter deprecated : Bool?

        # A short text description of the command.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The user-friendly name in the console for the command.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The timestamp, when the command was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # A list of parameters for the command created.
        @[JSON::Field(key: "mandatoryParameters")]
        getter mandatory_parameters : Array(Types::CommandParameter)?

        # The namespace of the command.
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The payload object that you provided for the command.
        @[JSON::Field(key: "payload")]
        getter payload : Types::CommandPayload?

        # The payload template for the dynamic command.
        @[JSON::Field(key: "payloadTemplate")]
        getter payload_template : String?

        # Indicates whether the command is being deleted.
        @[JSON::Field(key: "pendingDeletion")]
        getter pending_deletion : Bool?

        # Configuration that determines how payloadTemplate is processed to generate command execution
        # payload.
        @[JSON::Field(key: "preprocessor")]
        getter preprocessor : Types::CommandPreprocessor?

        # The IAM role that you provided when creating the command with AWS-IoT-FleetWise as the namespace.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @command_arn : String? = nil,
          @command_id : String? = nil,
          @created_at : Time? = nil,
          @deprecated : Bool? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @last_updated_at : Time? = nil,
          @mandatory_parameters : Array(Types::CommandParameter)? = nil,
          @namespace : String? = nil,
          @payload : Types::CommandPayload? = nil,
          @payload_template : String? = nil,
          @pending_deletion : Bool? = nil,
          @preprocessor : Types::CommandPreprocessor? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct GetEffectivePoliciesRequest
        include JSON::Serializable

        # The Cognito identity pool ID.
        @[JSON::Field(key: "cognitoIdentityPoolId")]
        getter cognito_identity_pool_id : String?

        # The principal. Valid principals are CertificateArn (arn:aws:iot: region : accountId :cert/
        # certificateId ), thingGroupArn (arn:aws:iot: region : accountId :thinggroup/ groupName ) and
        # CognitoId ( region : id ).
        @[JSON::Field(key: "principal")]
        getter principal : String?

        # The thing name.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @cognito_identity_pool_id : String? = nil,
          @principal : String? = nil,
          @thing_name : String? = nil
        )
        end
      end

      struct GetEffectivePoliciesResponse
        include JSON::Serializable

        # The effective policies.
        @[JSON::Field(key: "effectivePolicies")]
        getter effective_policies : Array(Types::EffectivePolicy)?

        def initialize(
          @effective_policies : Array(Types::EffectivePolicy)? = nil
        )
        end
      end

      struct GetIndexingConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetIndexingConfigurationResponse
        include JSON::Serializable

        # The index configuration.
        @[JSON::Field(key: "thingGroupIndexingConfiguration")]
        getter thing_group_indexing_configuration : Types::ThingGroupIndexingConfiguration?

        # Thing indexing configuration.
        @[JSON::Field(key: "thingIndexingConfiguration")]
        getter thing_indexing_configuration : Types::ThingIndexingConfiguration?

        def initialize(
          @thing_group_indexing_configuration : Types::ThingGroupIndexingConfiguration? = nil,
          @thing_indexing_configuration : Types::ThingIndexingConfiguration? = nil
        )
        end
      end

      struct GetJobDocumentRequest
        include JSON::Serializable

        # The unique identifier you assigned to this job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # Provides a view of the job document before and after the substitution parameters have been resolved
        # with their exact values.
        @[JSON::Field(key: "beforeSubstitution")]
        getter before_substitution : Bool?

        def initialize(
          @job_id : String,
          @before_substitution : Bool? = nil
        )
        end
      end

      struct GetJobDocumentResponse
        include JSON::Serializable

        # The job document content.
        @[JSON::Field(key: "document")]
        getter document : String?

        def initialize(
          @document : String? = nil
        )
        end
      end

      # The input for the GetLoggingOptions operation.
      struct GetLoggingOptionsRequest
        include JSON::Serializable

        def initialize
        end
      end

      # The output from the GetLoggingOptions operation.
      struct GetLoggingOptionsResponse
        include JSON::Serializable

        # The logging level.
        @[JSON::Field(key: "logLevel")]
        getter log_level : String?

        # The ARN of the IAM role that grants access.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @log_level : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct GetOTAUpdateRequest
        include JSON::Serializable

        # The OTA update ID.
        @[JSON::Field(key: "otaUpdateId")]
        getter ota_update_id : String

        def initialize(
          @ota_update_id : String
        )
        end
      end

      struct GetOTAUpdateResponse
        include JSON::Serializable

        # The OTA update info.
        @[JSON::Field(key: "otaUpdateInfo")]
        getter ota_update_info : Types::OTAUpdateInfo?

        def initialize(
          @ota_update_info : Types::OTAUpdateInfo? = nil
        )
        end
      end

      struct GetPackageConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetPackageConfigurationResponse
        include JSON::Serializable

        # The version that is associated to a specific job.
        @[JSON::Field(key: "versionUpdateByJobsConfig")]
        getter version_update_by_jobs_config : Types::VersionUpdateByJobsConfig?

        def initialize(
          @version_update_by_jobs_config : Types::VersionUpdateByJobsConfig? = nil
        )
        end
      end

      struct GetPackageRequest
        include JSON::Serializable

        # The name of the target software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String

        def initialize(
          @package_name : String
        )
        end
      end

      struct GetPackageResponse
        include JSON::Serializable

        # The date the package was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The name of the default package version.
        @[JSON::Field(key: "defaultVersionName")]
        getter default_version_name : String?

        # The package description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The date when the package was last updated.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The ARN for the package.
        @[JSON::Field(key: "packageArn")]
        getter package_arn : String?

        # The name of the software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String?

        def initialize(
          @creation_date : Time? = nil,
          @default_version_name : String? = nil,
          @description : String? = nil,
          @last_modified_date : Time? = nil,
          @package_arn : String? = nil,
          @package_name : String? = nil
        )
        end
      end

      struct GetPackageVersionRequest
        include JSON::Serializable

        # The name of the associated package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String

        # The name of the target package version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        def initialize(
          @package_name : String,
          @version_name : String
        )
        end
      end

      struct GetPackageVersionResponse
        include JSON::Serializable

        # The various components that make up a software package version.
        @[JSON::Field(key: "artifact")]
        getter artifact : Types::PackageVersionArtifact?

        # Metadata that were added to the package version that can be used to define a package version’s
        # configuration.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The date when the package version was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The package version description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Error reason for a package version failure during creation or update.
        @[JSON::Field(key: "errorReason")]
        getter error_reason : String?

        # The date when the package version was last updated.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The name of the software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String?

        # The ARN for the package version.
        @[JSON::Field(key: "packageVersionArn")]
        getter package_version_arn : String?

        # The inline job document associated with a software package version used for a quick job deployment.
        @[JSON::Field(key: "recipe")]
        getter recipe : String?

        # The software bill of materials for a software package version.
        @[JSON::Field(key: "sbom")]
        getter sbom : Types::Sbom?

        # The status of the validation for a new software bill of materials added to a software package
        # version.
        @[JSON::Field(key: "sbomValidationStatus")]
        getter sbom_validation_status : String?

        # The status associated to the package version. For more information, see Package version lifecycle .
        @[JSON::Field(key: "status")]
        getter status : String?

        # The name of the package version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        def initialize(
          @artifact : Types::PackageVersionArtifact? = nil,
          @attributes : Hash(String, String)? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @error_reason : String? = nil,
          @last_modified_date : Time? = nil,
          @package_name : String? = nil,
          @package_version_arn : String? = nil,
          @recipe : String? = nil,
          @sbom : Types::Sbom? = nil,
          @sbom_validation_status : String? = nil,
          @status : String? = nil,
          @version_name : String? = nil
        )
        end
      end

      struct GetPercentilesRequest
        include JSON::Serializable

        # The search query string.
        @[JSON::Field(key: "queryString")]
        getter query_string : String

        # The field to aggregate.
        @[JSON::Field(key: "aggregationField")]
        getter aggregation_field : String?

        # The name of the index to search.
        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The percentile groups returned.
        @[JSON::Field(key: "percents")]
        getter percents : Array(Float64)?

        # The query version.
        @[JSON::Field(key: "queryVersion")]
        getter query_version : String?

        def initialize(
          @query_string : String,
          @aggregation_field : String? = nil,
          @index_name : String? = nil,
          @percents : Array(Float64)? = nil,
          @query_version : String? = nil
        )
        end
      end

      struct GetPercentilesResponse
        include JSON::Serializable

        # The percentile values of the aggregated fields.
        @[JSON::Field(key: "percentiles")]
        getter percentiles : Array(Types::PercentPair)?

        def initialize(
          @percentiles : Array(Types::PercentPair)? = nil
        )
        end
      end

      # The input for the GetPolicy operation.
      struct GetPolicyRequest
        include JSON::Serializable

        # The name of the policy.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        def initialize(
          @policy_name : String
        )
        end
      end

      # The output from the GetPolicy operation.
      struct GetPolicyResponse
        include JSON::Serializable

        # The date the policy was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The default policy version ID.
        @[JSON::Field(key: "defaultVersionId")]
        getter default_version_id : String?

        # The generation ID of the policy.
        @[JSON::Field(key: "generationId")]
        getter generation_id : String?

        # The date the policy was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The policy ARN.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String?

        # The JSON document that describes the policy.
        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String?

        # The policy name.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String?

        def initialize(
          @creation_date : Time? = nil,
          @default_version_id : String? = nil,
          @generation_id : String? = nil,
          @last_modified_date : Time? = nil,
          @policy_arn : String? = nil,
          @policy_document : String? = nil,
          @policy_name : String? = nil
        )
        end
      end

      # The input for the GetPolicyVersion operation.
      struct GetPolicyVersionRequest
        include JSON::Serializable

        # The name of the policy.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        # The policy version ID.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : String

        def initialize(
          @policy_name : String,
          @policy_version_id : String
        )
        end
      end

      # The output from the GetPolicyVersion operation.
      struct GetPolicyVersionResponse
        include JSON::Serializable

        # The date the policy was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The generation ID of the policy version.
        @[JSON::Field(key: "generationId")]
        getter generation_id : String?

        # Specifies whether the policy version is the default.
        @[JSON::Field(key: "isDefaultVersion")]
        getter is_default_version : Bool?

        # The date the policy was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The policy ARN.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String?

        # The JSON document that describes the policy.
        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String?

        # The policy name.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String?

        # The policy version ID.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : String?

        def initialize(
          @creation_date : Time? = nil,
          @generation_id : String? = nil,
          @is_default_version : Bool? = nil,
          @last_modified_date : Time? = nil,
          @policy_arn : String? = nil,
          @policy_document : String? = nil,
          @policy_name : String? = nil,
          @policy_version_id : String? = nil
        )
        end
      end

      # The input to the GetRegistrationCode operation.
      struct GetRegistrationCodeRequest
        include JSON::Serializable

        def initialize
        end
      end

      # The output from the GetRegistrationCode operation.
      struct GetRegistrationCodeResponse
        include JSON::Serializable

        # The CA certificate registration code.
        @[JSON::Field(key: "registrationCode")]
        getter registration_code : String?

        def initialize(
          @registration_code : String? = nil
        )
        end
      end

      struct GetStatisticsRequest
        include JSON::Serializable

        # The query used to search. You can specify "*" for the query string to get the count of all indexed
        # things in your Amazon Web Services account.
        @[JSON::Field(key: "queryString")]
        getter query_string : String

        # The aggregation field name.
        @[JSON::Field(key: "aggregationField")]
        getter aggregation_field : String?

        # The name of the index to search. The default value is AWS_Things .
        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The version of the query used to search.
        @[JSON::Field(key: "queryVersion")]
        getter query_version : String?

        def initialize(
          @query_string : String,
          @aggregation_field : String? = nil,
          @index_name : String? = nil,
          @query_version : String? = nil
        )
        end
      end

      struct GetStatisticsResponse
        include JSON::Serializable

        # The statistics returned by the Fleet Indexing service based on the query and aggregation field.
        @[JSON::Field(key: "statistics")]
        getter statistics : Types::Statistics?

        def initialize(
          @statistics : Types::Statistics? = nil
        )
        end
      end

      struct GetThingConnectivityDataRequest
        include JSON::Serializable

        # The name of your IoT thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        def initialize(
          @thing_name : String
        )
        end
      end

      struct GetThingConnectivityDataResponse
        include JSON::Serializable

        # A Boolean that indicates the connectivity status.
        @[JSON::Field(key: "connected")]
        getter connected : Bool?

        # The reason why the client is disconnecting.
        @[JSON::Field(key: "disconnectReason")]
        getter disconnect_reason : String?

        # The name of your IoT thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        # The timestamp of when the event occurred.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        def initialize(
          @connected : Bool? = nil,
          @disconnect_reason : String? = nil,
          @thing_name : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      struct GetTopicRuleDestinationRequest
        include JSON::Serializable

        # The ARN of the topic rule destination.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetTopicRuleDestinationResponse
        include JSON::Serializable

        # The topic rule destination.
        @[JSON::Field(key: "topicRuleDestination")]
        getter topic_rule_destination : Types::TopicRuleDestination?

        def initialize(
          @topic_rule_destination : Types::TopicRuleDestination? = nil
        )
        end
      end

      # The input for the GetTopicRule operation.
      struct GetTopicRuleRequest
        include JSON::Serializable

        # The name of the rule.
        @[JSON::Field(key: "ruleName")]
        getter rule_name : String

        def initialize(
          @rule_name : String
        )
        end
      end

      # The output from the GetTopicRule operation.
      struct GetTopicRuleResponse
        include JSON::Serializable

        # The rule.
        @[JSON::Field(key: "rule")]
        getter rule : Types::TopicRule?

        # The rule ARN.
        @[JSON::Field(key: "ruleArn")]
        getter rule_arn : String?

        def initialize(
          @rule : Types::TopicRule? = nil,
          @rule_arn : String? = nil
        )
        end
      end

      struct GetV2LoggingOptionsRequest
        include JSON::Serializable

        # The flag is used to get all the event types and their respective configuration that event-based
        # logging supports.
        @[JSON::Field(key: "verbose")]
        getter verbose : Bool?

        def initialize(
          @verbose : Bool? = nil
        )
        end
      end

      struct GetV2LoggingOptionsResponse
        include JSON::Serializable

        # The default log level.
        @[JSON::Field(key: "defaultLogLevel")]
        getter default_log_level : String?

        # Disables all logs.
        @[JSON::Field(key: "disableAllLogs")]
        getter disable_all_logs : Bool?

        # The list of event configurations that override account-level logging.
        @[JSON::Field(key: "eventConfigurations")]
        getter event_configurations : Array(Types::LogEventConfiguration)?

        # The IAM role ARN IoT uses to write to your CloudWatch logs.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @default_log_level : String? = nil,
          @disable_all_logs : Bool? = nil,
          @event_configurations : Array(Types::LogEventConfiguration)? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # The name and ARN of a group.
      struct GroupNameAndArn
        include JSON::Serializable

        # The group ARN.
        @[JSON::Field(key: "groupArn")]
        getter group_arn : String?

        # The group name.
        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        def initialize(
          @group_arn : String? = nil,
          @group_name : String? = nil
        )
        end
      end

      # Send data to an HTTPS endpoint.
      struct HttpAction
        include JSON::Serializable

        # The endpoint URL. If substitution templates are used in the URL, you must also specify a
        # confirmationUrl . If this is a new destination, a new TopicRuleDestination is created if possible.
        @[JSON::Field(key: "url")]
        getter url : String

        # The authentication method to use when sending data to an HTTPS endpoint.
        @[JSON::Field(key: "auth")]
        getter auth : Types::HttpAuthorization?

        # The configuration settings for batching. For more information, see Batching HTTP action messages .
        @[JSON::Field(key: "batchConfig")]
        getter batch_config : Types::BatchConfig?

        # The URL to which IoT sends a confirmation message. The value of the confirmation URL must be a
        # prefix of the endpoint URL. If you do not specify a confirmation URL IoT uses the endpoint URL as
        # the confirmation URL. If you use substitution templates in the confirmationUrl, you must create and
        # enable topic rule destinations that match each possible value of the substitution template before
        # traffic is allowed to your endpoint URL.
        @[JSON::Field(key: "confirmationUrl")]
        getter confirmation_url : String?

        # Whether to process the HTTP action messages into a single request. Value can be true or false.
        @[JSON::Field(key: "enableBatching")]
        getter enable_batching : Bool?

        # The HTTP headers to send with the message data.
        @[JSON::Field(key: "headers")]
        getter headers : Array(Types::HttpActionHeader)?

        def initialize(
          @url : String,
          @auth : Types::HttpAuthorization? = nil,
          @batch_config : Types::BatchConfig? = nil,
          @confirmation_url : String? = nil,
          @enable_batching : Bool? = nil,
          @headers : Array(Types::HttpActionHeader)? = nil
        )
        end
      end

      # The HTTP action header.
      struct HttpActionHeader
        include JSON::Serializable

        # The HTTP header key.
        @[JSON::Field(key: "key")]
        getter key : String

        # The HTTP header value. Substitution templates are supported.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # The authorization method used to send messages.
      struct HttpAuthorization
        include JSON::Serializable

        # Use Sig V4 authorization. For more information, see Signature Version 4 Signing Process .
        @[JSON::Field(key: "sigv4")]
        getter sigv4 : Types::SigV4Authorization?

        def initialize(
          @sigv4 : Types::SigV4Authorization? = nil
        )
        end
      end

      # Specifies the HTTP context to use for the test authorizer request.
      struct HttpContext
        include JSON::Serializable

        # The header keys and values in an HTTP authorization request.
        @[JSON::Field(key: "headers")]
        getter headers : Hash(String, String)?

        # The query string keys and values in an HTTP authorization request.
        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        def initialize(
          @headers : Hash(String, String)? = nil,
          @query_string : String? = nil
        )
        end
      end

      # HTTP URL destination configuration used by the topic rule's HTTP action.
      struct HttpUrlDestinationConfiguration
        include JSON::Serializable

        # The URL IoT uses to confirm ownership of or access to the topic rule destination URL.
        @[JSON::Field(key: "confirmationUrl")]
        getter confirmation_url : String

        def initialize(
          @confirmation_url : String
        )
        end
      end

      # HTTP URL destination properties.
      struct HttpUrlDestinationProperties
        include JSON::Serializable

        # The URL used to confirm the HTTP topic rule destination URL.
        @[JSON::Field(key: "confirmationUrl")]
        getter confirmation_url : String?

        def initialize(
          @confirmation_url : String? = nil
        )
        end
      end

      # Information about an HTTP URL destination.
      struct HttpUrlDestinationSummary
        include JSON::Serializable

        # The URL used to confirm ownership of or access to the HTTP topic rule destination URL.
        @[JSON::Field(key: "confirmationUrl")]
        getter confirmation_url : String?

        def initialize(
          @confirmation_url : String? = nil
        )
        end
      end

      # Information that implicitly denies authorization. When policy doesn't explicitly deny or allow an
      # action on a resource it is considered an implicit deny.
      struct ImplicitDeny
        include JSON::Serializable

        # Policies that don't contain a matching allow or deny statement for the specified action on the
        # specified resource.
        @[JSON::Field(key: "policies")]
        getter policies : Array(Types::Policy)?

        def initialize(
          @policies : Array(Types::Policy)? = nil
        )
        end
      end

      # The index is not ready.
      struct IndexNotReadyException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides additional selections for named shadows and geolocation data. To add named shadows to your
      # fleet indexing configuration, set namedShadowIndexingMode to be ON and specify your shadow names in
      # namedShadowNames filter. To add geolocation data to your fleet indexing configuration: If you store
      # geolocation data in a class/unnamed shadow, set thingIndexingMode to be REGISTRY_AND_SHADOW and
      # specify your geolocation data in geoLocations filter. If you store geolocation data in a named
      # shadow, set namedShadowIndexingMode to be ON , add the shadow name in namedShadowNames filter, and
      # specify your geolocation data in geoLocations filter. For more information, see Managing fleet
      # indexing .
      struct IndexingFilter
        include JSON::Serializable

        # The list of geolocation targets that you select to index. The default maximum number of geolocation
        # targets for indexing is 1 . To increase the limit, see Amazon Web Services IoT Device Management
        # Quotas in the Amazon Web Services General Reference .
        @[JSON::Field(key: "geoLocations")]
        getter geo_locations : Array(Types::GeoLocationTarget)?

        # The shadow names that you select to index. The default maximum number of shadow names for indexing
        # is 10. To increase the limit, see Amazon Web Services IoT Device Management Quotas in the Amazon Web
        # Services General Reference .
        @[JSON::Field(key: "namedShadowNames")]
        getter named_shadow_names : Array(String)?

        def initialize(
          @geo_locations : Array(Types::GeoLocationTarget)? = nil,
          @named_shadow_names : Array(String)? = nil
        )
        end
      end

      # An unexpected error has occurred.
      struct InternalException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An unexpected error has occurred.
      struct InternalFailureException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Internal error from the service that indicates an unexpected error or that the service is
      # unavailable.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The aggregation is invalid.
      struct InvalidAggregationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The query is invalid.
      struct InvalidQueryException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request is not valid.
      struct InvalidRequestException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The response is invalid.
      struct InvalidResponseException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An attempt was made to change to an invalid state, for example by deleting a job or a job execution
      # which is "IN_PROGRESS" without setting the force parameter.
      struct InvalidStateTransitionException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Sends message data to an IoT Analytics channel.
      struct IotAnalyticsAction
        include JSON::Serializable

        # Whether to process the action as a batch. The default value is false . When batchMode is true and
        # the rule SQL statement evaluates to an Array, each Array element is delivered as a separate message
        # when passed by BatchPutMessage to the IoT Analytics channel. The resulting array can't have more
        # than 100 messages.
        @[JSON::Field(key: "batchMode")]
        getter batch_mode : Bool?

        # (deprecated) The ARN of the IoT Analytics channel to which message data will be sent.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String?

        # The name of the IoT Analytics channel to which message data will be sent.
        @[JSON::Field(key: "channelName")]
        getter channel_name : String?

        # The ARN of the role which has a policy that grants IoT Analytics permission to send message data via
        # IoT Analytics (iotanalytics:BatchPutMessage).
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @batch_mode : Bool? = nil,
          @channel_arn : String? = nil,
          @channel_name : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Sends an input to an IoT Events detector.
      struct IotEventsAction
        include JSON::Serializable

        # The name of the IoT Events input.
        @[JSON::Field(key: "inputName")]
        getter input_name : String

        # The ARN of the role that grants IoT permission to send an input to an IoT Events detector.
        # ("Action":"iotevents:BatchPutMessage").
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Whether to process the event actions as a batch. The default value is false . When batchMode is true
        # , you can't specify a messageId . When batchMode is true and the rule SQL statement evaluates to an
        # Array, each Array element is treated as a separate message when it's sent to IoT Events by calling
        # BatchPutMessage . The resulting array can't have more than 10 messages.
        @[JSON::Field(key: "batchMode")]
        getter batch_mode : Bool?

        # The ID of the message. The default messageId is a new UUID value. When batchMode is true , you can't
        # specify a messageId --a new UUID value will be assigned. Assign a value to this property to ensure
        # that only one input (message) with a given messageId will be processed by an IoT Events detector.
        @[JSON::Field(key: "messageId")]
        getter message_id : String?

        def initialize(
          @input_name : String,
          @role_arn : String,
          @batch_mode : Bool? = nil,
          @message_id : String? = nil
        )
        end
      end

      # Describes an action to send data from an MQTT message that triggered the rule to IoT SiteWise asset
      # properties.
      struct IotSiteWiseAction
        include JSON::Serializable

        # A list of asset property value entries.
        @[JSON::Field(key: "putAssetPropertyValueEntries")]
        getter put_asset_property_value_entries : Array(Types::PutAssetPropertyValueEntry)

        # The ARN of the role that grants IoT permission to send an asset property value to IoT SiteWise. (
        # "Action": "iotsitewise:BatchPutAssetPropertyValue" ). The trust policy can restrict access to
        # specific asset hierarchy paths.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @put_asset_property_value_entries : Array(Types::PutAssetPropertyValueEntry),
          @role_arn : String
        )
        end
      end

      # The certificate issuer indentifier.
      struct IssuerCertificateIdentifier
        include JSON::Serializable

        # The issuer certificate serial number.
        @[JSON::Field(key: "issuerCertificateSerialNumber")]
        getter issuer_certificate_serial_number : String?

        # The subject of the issuer certificate.
        @[JSON::Field(key: "issuerCertificateSubject")]
        getter issuer_certificate_subject : String?

        # The issuer ID.
        @[JSON::Field(key: "issuerId")]
        getter issuer_id : String?

        def initialize(
          @issuer_certificate_serial_number : String? = nil,
          @issuer_certificate_subject : String? = nil,
          @issuer_id : String? = nil
        )
        end
      end

      # The Job object contains details about a job.
      struct Job
        include JSON::Serializable

        # Configuration for criteria to abort the job.
        @[JSON::Field(key: "abortConfig")]
        getter abort_config : Types::AbortConfig?

        # If the job was updated, describes the reason for the update.
        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The time, in seconds since the epoch, when the job was completed.
        @[JSON::Field(key: "completedAt")]
        getter completed_at : Time?

        # The time, in seconds since the epoch, when the job was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # A short text description of the job.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The package version Amazon Resource Names (ARNs) that are installed on the device when the job
        # successfully completes. The package version must be in either the Published or Deprecated state when
        # the job deploys. For more information, see Package version lifecycle .The package version must be in
        # either the Published or Deprecated state when the job deploys. For more information, see Package
        # version lifecycle . Note: The following Length Constraints relates to a single ARN. Up to 25 package
        # version ARNs are allowed.
        @[JSON::Field(key: "destinationPackageVersions")]
        getter destination_package_versions : Array(String)?

        # A key-value map that pairs the patterns that need to be replaced in a managed template job document
        # schema. You can use the description of each key as a guidance to specify the inputs during runtime
        # when creating a job. documentParameters can only be used when creating jobs from Amazon Web Services
        # managed templates. This parameter can't be used with custom job templates or to create jobs from
        # them.
        @[JSON::Field(key: "documentParameters")]
        getter document_parameters : Hash(String, String)?

        # Will be true if the job was canceled with the optional force parameter set to true .
        @[JSON::Field(key: "forceCanceled")]
        getter force_canceled : Bool?

        # Indicates whether a job is concurrent. Will be true when a job is rolling out new job executions or
        # canceling previously created executions, otherwise false.
        @[JSON::Field(key: "isConcurrent")]
        getter is_concurrent : Bool?

        # An ARN identifying the job with format "arn:aws:iot:region:account:job/jobId".
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # The configuration for the criteria to retry the job.
        @[JSON::Field(key: "jobExecutionsRetryConfig")]
        getter job_executions_retry_config : Types::JobExecutionsRetryConfig?

        # Allows you to create a staged rollout of a job.
        @[JSON::Field(key: "jobExecutionsRolloutConfig")]
        getter job_executions_rollout_config : Types::JobExecutionsRolloutConfig?

        # The unique identifier you assigned to this job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # Details about the job process.
        @[JSON::Field(key: "jobProcessDetails")]
        getter job_process_details : Types::JobProcessDetails?

        # The ARN of the job template used to create the job.
        @[JSON::Field(key: "jobTemplateArn")]
        getter job_template_arn : String?

        # The time, in seconds since the epoch, when the job was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The namespace used to indicate that a job is a customer-managed job. When you specify a value for
        # this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain
        # the value in the following format. $aws/things/ THING_NAME /jobs/ JOB_ID /notify-namespace-
        # NAMESPACE_ID / The namespaceId feature is only supported by IoT Greengrass at this time. For more
        # information, see Setting up IoT Greengrass core devices.
        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        # Configuration for pre-signed S3 URLs.
        @[JSON::Field(key: "presignedUrlConfig")]
        getter presigned_url_config : Types::PresignedUrlConfig?

        # If the job was updated, provides the reason code for the update.
        @[JSON::Field(key: "reasonCode")]
        getter reason_code : String?

        # Displays the next seven maintenance window occurrences and their start times.
        @[JSON::Field(key: "scheduledJobRollouts")]
        getter scheduled_job_rollouts : Array(Types::ScheduledJobRollout)?

        # The configuration that allows you to schedule a job for a future date and time in addition to
        # specifying the end behavior for each job execution.
        @[JSON::Field(key: "schedulingConfig")]
        getter scheduling_config : Types::SchedulingConfig?

        # The status of the job, one of IN_PROGRESS , CANCELED , DELETION_IN_PROGRESS or COMPLETED .
        @[JSON::Field(key: "status")]
        getter status : String?

        # Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those
        # things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be
        # run on a thing when a change is detected in a target. For example, a job will run on a device when
        # the thing representing the device is added to a target group, even after the job was completed by
        # all things originally in the group. We recommend that you use continuous jobs instead of snapshot
        # jobs for dynamic thing group targets. By using continuous jobs, devices that join the group receive
        # the job execution even after the job has been created.
        @[JSON::Field(key: "targetSelection")]
        getter target_selection : String?

        # A list of IoT things and thing groups to which the job should be sent.
        @[JSON::Field(key: "targets")]
        getter targets : Array(String)?

        # Specifies the amount of time each device has to finish its execution of the job. A timer is started
        # when the job execution status is set to IN_PROGRESS . If the job execution status is not set to
        # another terminal state before the timer expires, it will be automatically set to TIMED_OUT .
        @[JSON::Field(key: "timeoutConfig")]
        getter timeout_config : Types::TimeoutConfig?

        def initialize(
          @abort_config : Types::AbortConfig? = nil,
          @comment : String? = nil,
          @completed_at : Time? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @destination_package_versions : Array(String)? = nil,
          @document_parameters : Hash(String, String)? = nil,
          @force_canceled : Bool? = nil,
          @is_concurrent : Bool? = nil,
          @job_arn : String? = nil,
          @job_executions_retry_config : Types::JobExecutionsRetryConfig? = nil,
          @job_executions_rollout_config : Types::JobExecutionsRolloutConfig? = nil,
          @job_id : String? = nil,
          @job_process_details : Types::JobProcessDetails? = nil,
          @job_template_arn : String? = nil,
          @last_updated_at : Time? = nil,
          @namespace_id : String? = nil,
          @presigned_url_config : Types::PresignedUrlConfig? = nil,
          @reason_code : String? = nil,
          @scheduled_job_rollouts : Array(Types::ScheduledJobRollout)? = nil,
          @scheduling_config : Types::SchedulingConfig? = nil,
          @status : String? = nil,
          @target_selection : String? = nil,
          @targets : Array(String)? = nil,
          @timeout_config : Types::TimeoutConfig? = nil
        )
        end
      end

      # The job execution object represents the execution of a job on a particular device.
      struct JobExecution
        include JSON::Serializable

        # The estimated number of seconds that remain before the job execution status will be changed to
        # TIMED_OUT . The timeout interval can be anywhere between 1 minute and 7 days (1 to 10080 minutes).
        # The actual job execution timeout can occur up to 60 seconds later than the estimated duration. This
        # value will not be included if the job execution has reached a terminal status.
        @[JSON::Field(key: "approximateSecondsBeforeTimedOut")]
        getter approximate_seconds_before_timed_out : Int64?

        # A string (consisting of the digits "0" through "9") which identifies this particular job execution
        # on this particular device. It can be used in commands which return or update job execution
        # information.
        @[JSON::Field(key: "executionNumber")]
        getter execution_number : Int64?

        # Will be true if the job execution was canceled with the optional force parameter set to true .
        @[JSON::Field(key: "forceCanceled")]
        getter force_canceled : Bool?

        # The unique identifier you assigned to the job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The time, in seconds since the epoch, when the job execution was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The time, in seconds since the epoch, when the job execution was queued.
        @[JSON::Field(key: "queuedAt")]
        getter queued_at : Time?

        # The time, in seconds since the epoch, when the job execution started.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The status of the job execution (IN_PROGRESS, QUEUED, FAILED, SUCCEEDED, TIMED_OUT, CANCELED, or
        # REJECTED).
        @[JSON::Field(key: "status")]
        getter status : String?

        # A collection of name/value pairs that describe the status of the job execution.
        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::JobExecutionStatusDetails?

        # The ARN of the thing on which the job execution is running.
        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        # The version of the job execution. Job execution versions are incremented each time they are updated
        # by a device.
        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @approximate_seconds_before_timed_out : Int64? = nil,
          @execution_number : Int64? = nil,
          @force_canceled : Bool? = nil,
          @job_id : String? = nil,
          @last_updated_at : Time? = nil,
          @queued_at : Time? = nil,
          @started_at : Time? = nil,
          @status : String? = nil,
          @status_details : Types::JobExecutionStatusDetails? = nil,
          @thing_arn : String? = nil,
          @version_number : Int64? = nil
        )
        end
      end

      # Details of the job execution status.
      struct JobExecutionStatusDetails
        include JSON::Serializable

        # The job execution status.
        @[JSON::Field(key: "detailsMap")]
        getter details_map : Hash(String, String)?

        def initialize(
          @details_map : Hash(String, String)? = nil
        )
        end
      end

      # The job execution summary.
      struct JobExecutionSummary
        include JSON::Serializable

        # A string (consisting of the digits "0" through "9") which identifies this particular job execution
        # on this particular device. It can be used later in commands which return or update job execution
        # information.
        @[JSON::Field(key: "executionNumber")]
        getter execution_number : Int64?

        # The time, in seconds since the epoch, when the job execution was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The time, in seconds since the epoch, when the job execution was queued.
        @[JSON::Field(key: "queuedAt")]
        getter queued_at : Time?

        # The number that indicates how many retry attempts have been completed for this job on this device.
        @[JSON::Field(key: "retryAttempt")]
        getter retry_attempt : Int32?

        # The time, in seconds since the epoch, when the job execution started.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The status of the job execution.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @execution_number : Int64? = nil,
          @last_updated_at : Time? = nil,
          @queued_at : Time? = nil,
          @retry_attempt : Int32? = nil,
          @started_at : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains a summary of information about job executions for a specific job.
      struct JobExecutionSummaryForJob
        include JSON::Serializable

        # Contains a subset of information about a job execution.
        @[JSON::Field(key: "jobExecutionSummary")]
        getter job_execution_summary : Types::JobExecutionSummary?

        # The ARN of the thing on which the job execution is running.
        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        def initialize(
          @job_execution_summary : Types::JobExecutionSummary? = nil,
          @thing_arn : String? = nil
        )
        end
      end

      # The job execution summary for a thing.
      struct JobExecutionSummaryForThing
        include JSON::Serializable

        # Contains a subset of information about a job execution.
        @[JSON::Field(key: "jobExecutionSummary")]
        getter job_execution_summary : Types::JobExecutionSummary?

        # The unique identifier you assigned to this job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        def initialize(
          @job_execution_summary : Types::JobExecutionSummary? = nil,
          @job_id : String? = nil
        )
        end
      end

      # The configuration that determines how many retries are allowed for each failure type for a job.
      struct JobExecutionsRetryConfig
        include JSON::Serializable

        # The list of criteria that determines how many retries are allowed for each failure type for a job.
        @[JSON::Field(key: "criteriaList")]
        getter criteria_list : Array(Types::RetryCriteria)

        def initialize(
          @criteria_list : Array(Types::RetryCriteria)
        )
        end
      end

      # Allows you to create a staged rollout of a job.
      struct JobExecutionsRolloutConfig
        include JSON::Serializable

        # The rate of increase for a job rollout. This parameter allows you to define an exponential rate for
        # a job rollout.
        @[JSON::Field(key: "exponentialRate")]
        getter exponential_rate : Types::ExponentialRolloutRate?

        # The maximum number of things that will be notified of a pending job, per minute. This parameter
        # allows you to create a staged rollout.
        @[JSON::Field(key: "maximumPerMinute")]
        getter maximum_per_minute : Int32?

        def initialize(
          @exponential_rate : Types::ExponentialRolloutRate? = nil,
          @maximum_per_minute : Int32? = nil
        )
        end
      end

      # The job process details.
      struct JobProcessDetails
        include JSON::Serializable

        # The number of things that cancelled the job.
        @[JSON::Field(key: "numberOfCanceledThings")]
        getter number_of_canceled_things : Int32?

        # The number of things that failed executing the job.
        @[JSON::Field(key: "numberOfFailedThings")]
        getter number_of_failed_things : Int32?

        # The number of things currently executing the job.
        @[JSON::Field(key: "numberOfInProgressThings")]
        getter number_of_in_progress_things : Int32?

        # The number of things that are awaiting execution of the job.
        @[JSON::Field(key: "numberOfQueuedThings")]
        getter number_of_queued_things : Int32?

        # The number of things that rejected the job.
        @[JSON::Field(key: "numberOfRejectedThings")]
        getter number_of_rejected_things : Int32?

        # The number of things that are no longer scheduled to execute the job because they have been deleted
        # or have been removed from the group that was a target of the job.
        @[JSON::Field(key: "numberOfRemovedThings")]
        getter number_of_removed_things : Int32?

        # The number of things which successfully completed the job.
        @[JSON::Field(key: "numberOfSucceededThings")]
        getter number_of_succeeded_things : Int32?

        # The number of things whose job execution status is TIMED_OUT .
        @[JSON::Field(key: "numberOfTimedOutThings")]
        getter number_of_timed_out_things : Int32?

        # The target devices to which the job execution is being rolled out. This value will be null after the
        # job execution has finished rolling out to all the target devices.
        @[JSON::Field(key: "processingTargets")]
        getter processing_targets : Array(String)?

        def initialize(
          @number_of_canceled_things : Int32? = nil,
          @number_of_failed_things : Int32? = nil,
          @number_of_in_progress_things : Int32? = nil,
          @number_of_queued_things : Int32? = nil,
          @number_of_rejected_things : Int32? = nil,
          @number_of_removed_things : Int32? = nil,
          @number_of_succeeded_things : Int32? = nil,
          @number_of_timed_out_things : Int32? = nil,
          @processing_targets : Array(String)? = nil
        )
        end
      end

      # The job summary.
      struct JobSummary
        include JSON::Serializable

        # The time, in seconds since the epoch, when the job completed.
        @[JSON::Field(key: "completedAt")]
        getter completed_at : Time?

        # The time, in seconds since the epoch, when the job was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Indicates whether a job is concurrent. Will be true when a job is rolling out new job executions or
        # canceling previously created executions, otherwise false.
        @[JSON::Field(key: "isConcurrent")]
        getter is_concurrent : Bool?

        # The job ARN.
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # The unique identifier you assigned to this job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The time, in seconds since the epoch, when the job was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The job summary status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those
        # things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be
        # run on a thing when a change is detected in a target. For example, a job will run on a thing when
        # the thing is added to a target group, even after the job was completed by all things originally in
        # the group. We recommend that you use continuous jobs instead of snapshot jobs for dynamic thing
        # group targets. By using continuous jobs, devices that join the group receive the job execution even
        # after the job has been created.
        @[JSON::Field(key: "targetSelection")]
        getter target_selection : String?

        # The ID of the thing group.
        @[JSON::Field(key: "thingGroupId")]
        getter thing_group_id : String?

        def initialize(
          @completed_at : Time? = nil,
          @created_at : Time? = nil,
          @is_concurrent : Bool? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @last_updated_at : Time? = nil,
          @status : String? = nil,
          @target_selection : String? = nil,
          @thing_group_id : String? = nil
        )
        end
      end

      # An object that contains information about the job template.
      struct JobTemplateSummary
        include JSON::Serializable

        # The time, in seconds since the epoch, when the job template was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # A description of the job template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the job template.
        @[JSON::Field(key: "jobTemplateArn")]
        getter job_template_arn : String?

        # The unique identifier of the job template.
        @[JSON::Field(key: "jobTemplateId")]
        getter job_template_id : String?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @job_template_arn : String? = nil,
          @job_template_id : String? = nil
        )
        end
      end

      # Send messages to an Amazon Managed Streaming for Apache Kafka (Amazon MSK) or self-managed Apache
      # Kafka cluster.
      struct KafkaAction
        include JSON::Serializable

        # Properties of the Apache Kafka producer client.
        @[JSON::Field(key: "clientProperties")]
        getter client_properties : Hash(String, String)

        # The ARN of Kafka action's VPC TopicRuleDestination .
        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String

        # The Kafka topic for messages to be sent to the Kafka broker.
        @[JSON::Field(key: "topic")]
        getter topic : String

        # The list of Kafka headers that you specify.
        @[JSON::Field(key: "headers")]
        getter headers : Array(Types::KafkaActionHeader)?

        # The Kafka message key.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The Kafka message partition.
        @[JSON::Field(key: "partition")]
        getter partition : String?

        def initialize(
          @client_properties : Hash(String, String),
          @destination_arn : String,
          @topic : String,
          @headers : Array(Types::KafkaActionHeader)? = nil,
          @key : String? = nil,
          @partition : String? = nil
        )
        end
      end

      # Specifies a Kafka header using key-value pairs when you create a Rule’s Kafka Action. You can use
      # these headers to route data from IoT clients to downstream Kafka clusters without modifying your
      # message payload. For more information about Rule's Kafka action, see Apache Kafka .
      struct KafkaActionHeader
        include JSON::Serializable

        # The key of the Kafka header.
        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the Kafka header.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Describes a key pair.
      struct KeyPair
        include JSON::Serializable

        # The private key.
        @[JSON::Field(key: "PrivateKey")]
        getter private_key : String?

        # The public key.
        @[JSON::Field(key: "PublicKey")]
        getter public_key : String?

        def initialize(
          @private_key : String? = nil,
          @public_key : String? = nil
        )
        end
      end

      # Describes an action to write data to an Amazon Kinesis stream.
      struct KinesisAction
        include JSON::Serializable

        # The ARN of the IAM role that grants access to the Amazon Kinesis stream.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of the Amazon Kinesis stream.
        @[JSON::Field(key: "streamName")]
        getter stream_name : String

        # The partition key.
        @[JSON::Field(key: "partitionKey")]
        getter partition_key : String?

        def initialize(
          @role_arn : String,
          @stream_name : String,
          @partition_key : String? = nil
        )
        end
      end

      # Describes an action to invoke a Lambda function.
      struct LambdaAction
        include JSON::Serializable

        # The ARN of the Lambda function.
        @[JSON::Field(key: "functionArn")]
        getter function_arn : String

        def initialize(
          @function_arn : String
        )
        end
      end

      # A limit has been exceeded.
      struct LimitExceededException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListActiveViolationsRequest
        include JSON::Serializable

        # The criteria for a behavior.
        @[JSON::Field(key: "behaviorCriteriaType")]
        getter behavior_criteria_type : String?

        # A list of all suppressed alerts.
        @[JSON::Field(key: "listSuppressedAlerts")]
        getter list_suppressed_alerts : Bool?

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the Device Defender security profile for which violations are listed.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String?

        # The name of the thing whose active violations are listed.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        # The verification state of the violation (detect alarm).
        @[JSON::Field(key: "verificationState")]
        getter verification_state : String?

        def initialize(
          @behavior_criteria_type : String? = nil,
          @list_suppressed_alerts : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @security_profile_name : String? = nil,
          @thing_name : String? = nil,
          @verification_state : String? = nil
        )
        end
      end

      struct ListActiveViolationsResponse
        include JSON::Serializable

        # The list of active violations.
        @[JSON::Field(key: "activeViolations")]
        getter active_violations : Array(Types::ActiveViolation)?

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @active_violations : Array(Types::ActiveViolation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAttachedPoliciesRequest
        include JSON::Serializable

        # The group or principal for which the policies will be listed. Valid principals are CertificateArn
        # (arn:aws:iot: region : accountId :cert/ certificateId ), thingGroupArn (arn:aws:iot: region :
        # accountId :thinggroup/ groupName ) and CognitoId ( region : id ).
        @[JSON::Field(key: "target")]
        getter target : String

        # The token to retrieve the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The maximum number of results to be returned per request.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        # When true, recursively list attached policies.
        @[JSON::Field(key: "recursive")]
        getter recursive : Bool?

        def initialize(
          @target : String,
          @marker : String? = nil,
          @page_size : Int32? = nil,
          @recursive : Bool? = nil
        )
        end
      end

      struct ListAttachedPoliciesResponse
        include JSON::Serializable

        # The token to retrieve the next set of results, or ``null`` if there are no more results.
        @[JSON::Field(key: "nextMarker")]
        getter next_marker : String?

        # The policies.
        @[JSON::Field(key: "policies")]
        getter policies : Array(Types::Policy)?

        def initialize(
          @next_marker : String? = nil,
          @policies : Array(Types::Policy)? = nil
        )
        end
      end

      struct ListAuditFindingsRequest
        include JSON::Serializable

        # A filter to limit results to the findings for the specified audit check.
        @[JSON::Field(key: "checkName")]
        getter check_name : String?

        # A filter to limit results to those found before the specified time. You must specify either the
        # startTime and endTime or the taskId, but not both.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Boolean flag indicating whether only the suppressed findings or the unsuppressed findings should be
        # listed. If this parameter isn't provided, the response will list both suppressed and unsuppressed
        # findings.
        @[JSON::Field(key: "listSuppressedFindings")]
        getter list_suppressed_findings : Bool?

        # The maximum number of results to return at one time. The default is 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Information identifying the noncompliant resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : Types::ResourceIdentifier?

        # A filter to limit results to those found after the specified time. You must specify either the
        # startTime and endTime or the taskId, but not both.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # A filter to limit results to the audit with the specified ID. You must specify either the taskId or
        # the startTime and endTime, but not both.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @check_name : String? = nil,
          @end_time : Time? = nil,
          @list_suppressed_findings : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_identifier : Types::ResourceIdentifier? = nil,
          @start_time : Time? = nil,
          @task_id : String? = nil
        )
        end
      end

      struct ListAuditFindingsResponse
        include JSON::Serializable

        # The findings (results) of the audit.
        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::AuditFinding)?

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @findings : Array(Types::AuditFinding)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAuditMitigationActionsExecutionsRequest
        include JSON::Serializable

        # Specify this filter to limit results to those that were applied to a specific audit finding.
        @[JSON::Field(key: "findingId")]
        getter finding_id : String

        # Specify this filter to limit results to actions for a specific audit mitigation actions task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # Specify this filter to limit results to those with a specific status.
        @[JSON::Field(key: "actionStatus")]
        getter action_status : String?

        # The maximum number of results to return at one time. The default is 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @finding_id : String,
          @task_id : String,
          @action_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAuditMitigationActionsExecutionsResponse
        include JSON::Serializable

        # A set of task execution results based on the input parameters. Details include the mitigation action
        # applied, start time, and task status.
        @[JSON::Field(key: "actionsExecutions")]
        getter actions_executions : Array(Types::AuditMitigationActionExecutionMetadata)?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @actions_executions : Array(Types::AuditMitigationActionExecutionMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAuditMitigationActionsTasksRequest
        include JSON::Serializable

        # Specify this filter to limit results to tasks that were completed or canceled on or before a
        # specific date and time.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # Specify this filter to limit results to tasks that began on or after a specific date and time.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # Specify this filter to limit results to tasks that were applied to results for a specific audit.
        @[JSON::Field(key: "auditTaskId")]
        getter audit_task_id : String?

        # Specify this filter to limit results to tasks that were applied to a specific audit finding.
        @[JSON::Field(key: "findingId")]
        getter finding_id : String?

        # The maximum number of results to return at one time. The default is 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specify this filter to limit results to tasks that are in a specific state.
        @[JSON::Field(key: "taskStatus")]
        getter task_status : String?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @audit_task_id : String? = nil,
          @finding_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @task_status : String? = nil
        )
        end
      end

      struct ListAuditMitigationActionsTasksResponse
        include JSON::Serializable

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The collection of audit mitigation tasks that matched the filter criteria.
        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::AuditMitigationActionsTaskMetadata)?

        def initialize(
          @next_token : String? = nil,
          @tasks : Array(Types::AuditMitigationActionsTaskMetadata)? = nil
        )
        end
      end

      struct ListAuditSuppressionsRequest
        include JSON::Serializable

        # Determines whether suppressions are listed in ascending order by expiration date or not. If
        # parameter isn't provided, ascendingOrder=true .
        @[JSON::Field(key: "ascendingOrder")]
        getter ascending_order : Bool?

        @[JSON::Field(key: "checkName")]
        getter check_name : String?

        # The maximum number of results to return at one time. The default is 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : Types::ResourceIdentifier?

        def initialize(
          @ascending_order : Bool? = nil,
          @check_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_identifier : Types::ResourceIdentifier? = nil
        )
        end
      end

      struct ListAuditSuppressionsResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List of audit suppressions.
        @[JSON::Field(key: "suppressions")]
        getter suppressions : Array(Types::AuditSuppression)?

        def initialize(
          @next_token : String? = nil,
          @suppressions : Array(Types::AuditSuppression)? = nil
        )
        end
      end

      struct ListAuditTasksRequest
        include JSON::Serializable

        # The end of the time period.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The beginning of the time period. Audit information is retained for a limited time (90 days).
        # Requesting a start time prior to what is retained results in an "InvalidRequestException".
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The maximum number of results to return at one time. The default is 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A filter to limit the output to audits with the specified completion status: can be one of
        # "IN_PROGRESS", "COMPLETED", "FAILED", or "CANCELED".
        @[JSON::Field(key: "taskStatus")]
        getter task_status : String?

        # A filter to limit the output to the specified type of audit: can be one of "ON_DEMAND_AUDIT_TASK" or
        # "SCHEDULED__AUDIT_TASK".
        @[JSON::Field(key: "taskType")]
        getter task_type : String?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @task_status : String? = nil,
          @task_type : String? = nil
        )
        end
      end

      struct ListAuditTasksResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The audits that were performed during the specified time period.
        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::AuditTaskMetadata)?

        def initialize(
          @next_token : String? = nil,
          @tasks : Array(Types::AuditTaskMetadata)? = nil
        )
        end
      end

      struct ListAuthorizersRequest
        include JSON::Serializable

        # Return the list of authorizers in ascending alphabetical order.
        @[JSON::Field(key: "isAscendingOrder")]
        getter ascending_order : Bool?

        # A marker used to get the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        # The status of the list authorizers request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @ascending_order : Bool? = nil,
          @marker : String? = nil,
          @page_size : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListAuthorizersResponse
        include JSON::Serializable

        # The authorizers.
        @[JSON::Field(key: "authorizers")]
        getter authorizers : Array(Types::AuthorizerSummary)?

        # A marker used to get the next set of results.
        @[JSON::Field(key: "nextMarker")]
        getter next_marker : String?

        def initialize(
          @authorizers : Array(Types::AuthorizerSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListBillingGroupsRequest
        include JSON::Serializable

        # The maximum number of results to return per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Limit the results to billing groups whose names have the given prefix.
        @[JSON::Field(key: "namePrefixFilter")]
        getter name_prefix_filter : String?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name_prefix_filter : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillingGroupsResponse
        include JSON::Serializable

        # The list of billing groups.
        @[JSON::Field(key: "billingGroups")]
        getter billing_groups : Array(Types::GroupNameAndArn)?

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @billing_groups : Array(Types::GroupNameAndArn)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Input for the ListCACertificates operation.
      struct ListCACertificatesRequest
        include JSON::Serializable

        # Determines the order of the results.
        @[JSON::Field(key: "isAscendingOrder")]
        getter ascending_order : Bool?

        # The marker for the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The result page size.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        # The name of the provisioning template.
        @[JSON::Field(key: "templateName")]
        getter template_name : String?

        def initialize(
          @ascending_order : Bool? = nil,
          @marker : String? = nil,
          @page_size : Int32? = nil,
          @template_name : String? = nil
        )
        end
      end

      # The output from the ListCACertificates operation.
      struct ListCACertificatesResponse
        include JSON::Serializable

        # The CA certificates registered in your Amazon Web Services account.
        @[JSON::Field(key: "certificates")]
        getter certificates : Array(Types::CACertificate)?

        # The current position within the list of CA certificates.
        @[JSON::Field(key: "nextMarker")]
        getter next_marker : String?

        def initialize(
          @certificates : Array(Types::CACertificate)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListCertificateProvidersRequest
        include JSON::Serializable

        # Returns the list of certificate providers in ascending alphabetical order.
        @[JSON::Field(key: "isAscendingOrder")]
        getter ascending_order : Bool?

        # The token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ascending_order : Bool? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCertificateProvidersResponse
        include JSON::Serializable

        # The list of certificate providers in your Amazon Web Services account.
        @[JSON::Field(key: "certificateProviders")]
        getter certificate_providers : Array(Types::CertificateProviderSummary)?

        # The token for the next set of results, or null if there are no more results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @certificate_providers : Array(Types::CertificateProviderSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The input to the ListCertificatesByCA operation.
      struct ListCertificatesByCARequest
        include JSON::Serializable

        # The ID of the CA certificate. This operation will list all registered device certificate that were
        # signed by this CA certificate.
        @[JSON::Field(key: "caCertificateId")]
        getter ca_certificate_id : String

        # Specifies the order for results. If True, the results are returned in ascending order, based on the
        # creation date.
        @[JSON::Field(key: "isAscendingOrder")]
        getter ascending_order : Bool?

        # The marker for the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The result page size.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        def initialize(
          @ca_certificate_id : String,
          @ascending_order : Bool? = nil,
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # The output of the ListCertificatesByCA operation.
      struct ListCertificatesByCAResponse
        include JSON::Serializable

        # The device certificates signed by the specified CA certificate.
        @[JSON::Field(key: "certificates")]
        getter certificates : Array(Types::Certificate)?

        # The marker for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextMarker")]
        getter next_marker : String?

        def initialize(
          @certificates : Array(Types::Certificate)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # The input for the ListCertificates operation.
      struct ListCertificatesRequest
        include JSON::Serializable

        # Specifies the order for results. If True, the results are returned in ascending order, based on the
        # creation date.
        @[JSON::Field(key: "isAscendingOrder")]
        getter ascending_order : Bool?

        # The marker for the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The result page size.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        def initialize(
          @ascending_order : Bool? = nil,
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # The output of the ListCertificates operation.
      struct ListCertificatesResponse
        include JSON::Serializable

        # The descriptions of the certificates.
        @[JSON::Field(key: "certificates")]
        getter certificates : Array(Types::Certificate)?

        # The marker for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextMarker")]
        getter next_marker : String?

        def initialize(
          @certificates : Array(Types::Certificate)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListCommandExecutionsRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the command. You can use this information to list all command
        # executions for a particular command.
        @[JSON::Field(key: "commandArn")]
        getter command_arn : String?

        # List all command executions that completed any time before or after the date and time that you
        # specify. The date and time uses the format yyyy-MM-dd'T'HH:mm .
        @[JSON::Field(key: "completedTimeFilter")]
        getter completed_time_filter : Types::TimeFilter?

        # The maximum number of results to return in this operation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The namespace of the command.
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specify whether to list the command executions that were created in the ascending or descending
        # order. By default, the API returns all commands in the descending order based on the start time or
        # completion time of the executions, that are determined by the startTimeFilter and completeTimeFilter
        # parameters.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # List all command executions that started any time before or after the date and time that you
        # specify. The date and time uses the format yyyy-MM-dd'T'HH:mm .
        @[JSON::Field(key: "startedTimeFilter")]
        getter started_time_filter : Types::TimeFilter?

        # List all command executions for the device that have a particular status. For example, you can
        # filter the list to display only command executions that have failed or timed out.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The Amazon Resource Number (ARN) of the target device. You can use this information to list all
        # command executions for a particular device.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        def initialize(
          @command_arn : String? = nil,
          @completed_time_filter : Types::TimeFilter? = nil,
          @max_results : Int32? = nil,
          @namespace : String? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil,
          @started_time_filter : Types::TimeFilter? = nil,
          @status : String? = nil,
          @target_arn : String? = nil
        )
        end
      end

      struct ListCommandExecutionsResponse
        include JSON::Serializable

        # The list of command executions.
        @[JSON::Field(key: "commandExecutions")]
        getter command_executions : Array(Types::CommandExecutionSummary)?

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @command_executions : Array(Types::CommandExecutionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCommandsRequest
        include JSON::Serializable

        # A filter that can be used to display the list of commands that have a specific command parameter
        # name.
        @[JSON::Field(key: "commandParameterName")]
        getter command_parameter_name : String?

        # The maximum number of results to return in this operation. By default, the API returns up to a
        # maximum of 25 results. You can override this default value to return up to a maximum of 100 results
        # for this operation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The namespace of the command. By default, the API returns all commands that have been created for
        # both AWS-IoT and AWS-IoT-FleetWise namespaces. You can override this default value if you want to
        # return all commands that have been created only for a specific namespace.
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specify whether to list the commands that you have created in the ascending or descending order. By
        # default, the API returns all commands in the descending order based on the time that they were
        # created.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @command_parameter_name : String? = nil,
          @max_results : Int32? = nil,
          @namespace : String? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListCommandsResponse
        include JSON::Serializable

        # The list of commands.
        @[JSON::Field(key: "commands")]
        getter commands : Array(Types::CommandSummary)?

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @commands : Array(Types::CommandSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCustomMetricsRequest
        include JSON::Serializable

        # The maximum number of results to return at one time. The default is 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCustomMetricsResponse
        include JSON::Serializable

        # The name of the custom metric.
        @[JSON::Field(key: "metricNames")]
        getter metric_names : Array(String)?

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @metric_names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDetectMitigationActionsExecutionsRequest
        include JSON::Serializable

        # The end of the time period for which ML Detect mitigation actions executions are returned.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The maximum number of results to return at one time. The default is 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A filter to limit results to those found after the specified time. You must specify either the
        # startTime and endTime or the taskId, but not both.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The unique identifier of the task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        # The name of the thing whose mitigation actions are listed.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        # The unique identifier of the violation.
        @[JSON::Field(key: "violationId")]
        getter violation_id : String?

        def initialize(
          @end_time : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil,
          @task_id : String? = nil,
          @thing_name : String? = nil,
          @violation_id : String? = nil
        )
        end
      end

      struct ListDetectMitigationActionsExecutionsResponse
        include JSON::Serializable

        # List of actions executions.
        @[JSON::Field(key: "actionsExecutions")]
        getter actions_executions : Array(Types::DetectMitigationActionExecution)?

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @actions_executions : Array(Types::DetectMitigationActionExecution)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDetectMitigationActionsTasksRequest
        include JSON::Serializable

        # The end of the time period for which ML Detect mitigation actions tasks are returned.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # A filter to limit results to those found after the specified time. You must specify either the
        # startTime and endTime or the taskId, but not both.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The maximum number of results to return at one time. The default is 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDetectMitigationActionsTasksResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The collection of ML Detect mitigation tasks that matched the filter criteria.
        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::DetectMitigationActionsTaskSummary)?

        def initialize(
          @next_token : String? = nil,
          @tasks : Array(Types::DetectMitigationActionsTaskSummary)? = nil
        )
        end
      end

      struct ListDimensionsRequest
        include JSON::Serializable

        # The maximum number of results to retrieve at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDimensionsResponse
        include JSON::Serializable

        # A list of the names of the defined dimensions. Use DescribeDimension to get details for a dimension.
        @[JSON::Field(key: "dimensionNames")]
        getter dimension_names : Array(String)?

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dimension_names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDomainConfigurationsRequest
        include JSON::Serializable

        # The marker for the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The result page size.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        # The type of service delivered by the endpoint.
        @[JSON::Field(key: "serviceType")]
        getter service_type : String?

        def initialize(
          @marker : String? = nil,
          @page_size : Int32? = nil,
          @service_type : String? = nil
        )
        end
      end

      struct ListDomainConfigurationsResponse
        include JSON::Serializable

        # A list of objects that contain summary information about the user's domain configurations.
        @[JSON::Field(key: "domainConfigurations")]
        getter domain_configurations : Array(Types::DomainConfigurationSummary)?

        # The marker for the next set of results.
        @[JSON::Field(key: "nextMarker")]
        getter next_marker : String?

        def initialize(
          @domain_configurations : Array(Types::DomainConfigurationSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListFleetMetricsRequest
        include JSON::Serializable

        # The maximum number of results to return in this operation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFleetMetricsResponse
        include JSON::Serializable

        # The list of fleet metrics objects.
        @[JSON::Field(key: "fleetMetrics")]
        getter fleet_metrics : Array(Types::FleetMetricNameAndArn)?

        # The token for the next set of results. Will not be returned if the operation has returned all
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @fleet_metrics : Array(Types::FleetMetricNameAndArn)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIndicesRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token used to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIndicesResponse
        include JSON::Serializable

        # The index names.
        @[JSON::Field(key: "indexNames")]
        getter index_names : Array(String)?

        # The token used to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @index_names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListJobExecutionsForJobRequest
        include JSON::Serializable

        # The unique identifier you assigned to this job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The maximum number of results to be returned per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the job.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListJobExecutionsForJobResponse
        include JSON::Serializable

        # A list of job execution summaries.
        @[JSON::Field(key: "executionSummaries")]
        getter execution_summaries : Array(Types::JobExecutionSummaryForJob)?

        # The token for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @execution_summaries : Array(Types::JobExecutionSummaryForJob)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListJobExecutionsForThingRequest
        include JSON::Serializable

        # The thing name.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The unique identifier you assigned to this job when it was created.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The maximum number of results to be returned per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The namespace used to indicate that a job is a customer-managed job. When you specify a value for
        # this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain
        # the value in the following format. $aws/things/ THING_NAME /jobs/ JOB_ID /notify-namespace-
        # NAMESPACE_ID / The namespaceId feature is only supported by IoT Greengrass at this time. For more
        # information, see Setting up IoT Greengrass core devices.
        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        # The token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An optional filter that lets you search for jobs that have the specified status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @thing_name : String,
          @job_id : String? = nil,
          @max_results : Int32? = nil,
          @namespace_id : String? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListJobExecutionsForThingResponse
        include JSON::Serializable

        # A list of job execution summaries.
        @[JSON::Field(key: "executionSummaries")]
        getter execution_summaries : Array(Types::JobExecutionSummaryForThing)?

        # The token for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @execution_summaries : Array(Types::JobExecutionSummaryForThing)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListJobTemplatesRequest
        include JSON::Serializable

        # The maximum number of results to return in the list.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use to return the next set of results in the list.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListJobTemplatesResponse
        include JSON::Serializable

        # A list of objects that contain information about the job templates.
        @[JSON::Field(key: "jobTemplates")]
        getter job_templates : Array(Types::JobTemplateSummary)?

        # The token for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_templates : Array(Types::JobTemplateSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListJobsRequest
        include JSON::Serializable

        # The maximum number of results to return per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The namespace used to indicate that a job is a customer-managed job. When you specify a value for
        # this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain
        # the value in the following format. $aws/things/ THING_NAME /jobs/ JOB_ID /notify-namespace-
        # NAMESPACE_ID / The namespaceId feature is only supported by IoT Greengrass at this time. For more
        # information, see Setting up IoT Greengrass core devices.
        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        # The token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An optional filter that lets you search for jobs that have the specified status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those
        # things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be
        # run on a thing when a change is detected in a target. For example, a job will run on a thing when
        # the thing is added to a target group, even after the job was completed by all things originally in
        # the group. We recommend that you use continuous jobs instead of snapshot jobs for dynamic thing
        # group targets. By using continuous jobs, devices that join the group receive the job execution even
        # after the job has been created.
        @[JSON::Field(key: "targetSelection")]
        getter target_selection : String?

        # A filter that limits the returned jobs to those for the specified group.
        @[JSON::Field(key: "thingGroupId")]
        getter thing_group_id : String?

        # A filter that limits the returned jobs to those for the specified group.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @namespace_id : String? = nil,
          @next_token : String? = nil,
          @status : String? = nil,
          @target_selection : String? = nil,
          @thing_group_id : String? = nil,
          @thing_group_name : String? = nil
        )
        end
      end

      struct ListJobsResponse
        include JSON::Serializable

        # A list of jobs.
        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::JobSummary)?

        # The token for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::JobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListManagedJobTemplatesRequest
        include JSON::Serializable

        # Maximum number of entries that can be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An optional parameter for template name. If specified, only the versions of the managed job
        # templates that have the specified template name will be returned.
        @[JSON::Field(key: "templateName")]
        getter template_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @template_name : String? = nil
        )
        end
      end

      struct ListManagedJobTemplatesResponse
        include JSON::Serializable

        # A list of managed job templates that are returned.
        @[JSON::Field(key: "managedJobTemplates")]
        getter managed_job_templates : Array(Types::ManagedJobTemplateSummary)?

        # The token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @managed_job_templates : Array(Types::ManagedJobTemplateSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMetricValuesRequest
        include JSON::Serializable

        # The end of the time period for which metric values are returned.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The name of the security profile metric for which values are returned.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The start of the time period for which metric values are returned.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The name of the thing for which security profile metric values are returned.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The dimension name.
        @[JSON::Field(key: "dimensionName")]
        getter dimension_name : String?

        # The dimension value operator.
        @[JSON::Field(key: "dimensionValueOperator")]
        getter dimension_value_operator : String?

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @metric_name : String,
          @start_time : Time,
          @thing_name : String,
          @dimension_name : String? = nil,
          @dimension_value_operator : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMetricValuesResponse
        include JSON::Serializable

        # The data the thing reports for the metric during the specified time period.
        @[JSON::Field(key: "metricDatumList")]
        getter metric_datum_list : Array(Types::MetricDatum)?

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @metric_datum_list : Array(Types::MetricDatum)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMitigationActionsRequest
        include JSON::Serializable

        # Specify a value to limit the result to mitigation actions with a specific action type.
        @[JSON::Field(key: "actionType")]
        getter action_type : String?

        # The maximum number of results to return at one time. The default is 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @action_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMitigationActionsResponse
        include JSON::Serializable

        # A set of actions that matched the specified filter criteria.
        @[JSON::Field(key: "actionIdentifiers")]
        getter action_identifiers : Array(Types::MitigationActionIdentifier)?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @action_identifiers : Array(Types::MitigationActionIdentifier)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListOTAUpdatesRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The OTA update job status.
        @[JSON::Field(key: "otaUpdateStatus")]
        getter ota_update_status : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @ota_update_status : String? = nil
        )
        end
      end

      struct ListOTAUpdatesResponse
        include JSON::Serializable

        # A token to use to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of OTA update jobs.
        @[JSON::Field(key: "otaUpdates")]
        getter ota_updates : Array(Types::OTAUpdateSummary)?

        def initialize(
          @next_token : String? = nil,
          @ota_updates : Array(Types::OTAUpdateSummary)? = nil
        )
        end
      end

      # The input to the ListOutgoingCertificates operation.
      struct ListOutgoingCertificatesRequest
        include JSON::Serializable

        # Specifies the order for results. If True, the results are returned in ascending order, based on the
        # creation date.
        @[JSON::Field(key: "isAscendingOrder")]
        getter ascending_order : Bool?

        # The marker for the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The result page size.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        def initialize(
          @ascending_order : Bool? = nil,
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # The output from the ListOutgoingCertificates operation.
      struct ListOutgoingCertificatesResponse
        include JSON::Serializable

        # The marker for the next set of results.
        @[JSON::Field(key: "nextMarker")]
        getter next_marker : String?

        # The certificates that are being transferred but not yet accepted.
        @[JSON::Field(key: "outgoingCertificates")]
        getter outgoing_certificates : Array(Types::OutgoingCertificate)?

        def initialize(
          @next_marker : String? = nil,
          @outgoing_certificates : Array(Types::OutgoingCertificate)? = nil
        )
        end
      end

      struct ListPackageVersionsRequest
        include JSON::Serializable

        # The name of the target software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the package version. For more information, see Package version lifecycle .
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @package_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListPackageVersionsResponse
        include JSON::Serializable

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Lists the package versions associated to the package.
        @[JSON::Field(key: "packageVersionSummaries")]
        getter package_version_summaries : Array(Types::PackageVersionSummary)?

        def initialize(
          @next_token : String? = nil,
          @package_version_summaries : Array(Types::PackageVersionSummary)? = nil
        )
        end
      end

      struct ListPackagesRequest
        include JSON::Serializable

        # The maximum number of results returned at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPackagesResponse
        include JSON::Serializable

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The software package summary.
        @[JSON::Field(key: "packageSummaries")]
        getter package_summaries : Array(Types::PackageSummary)?

        def initialize(
          @next_token : String? = nil,
          @package_summaries : Array(Types::PackageSummary)? = nil
        )
        end
      end

      # The input for the ListPolicies operation.
      struct ListPoliciesRequest
        include JSON::Serializable

        # Specifies the order for results. If true, the results are returned in ascending creation order.
        @[JSON::Field(key: "isAscendingOrder")]
        getter ascending_order : Bool?

        # The marker for the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The result page size.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        def initialize(
          @ascending_order : Bool? = nil,
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # The output from the ListPolicies operation.
      struct ListPoliciesResponse
        include JSON::Serializable

        # The marker for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextMarker")]
        getter next_marker : String?

        # The descriptions of the policies.
        @[JSON::Field(key: "policies")]
        getter policies : Array(Types::Policy)?

        def initialize(
          @next_marker : String? = nil,
          @policies : Array(Types::Policy)? = nil
        )
        end
      end

      # The input for the ListPolicyPrincipals operation.
      struct ListPolicyPrincipalsRequest
        include JSON::Serializable

        # The policy name.
        @[JSON::Field(key: "x-amzn-iot-policy")]
        getter policy_name : String

        # Specifies the order for results. If true, the results are returned in ascending creation order.
        @[JSON::Field(key: "isAscendingOrder")]
        getter ascending_order : Bool?

        # The marker for the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The result page size.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        def initialize(
          @policy_name : String,
          @ascending_order : Bool? = nil,
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # The output from the ListPolicyPrincipals operation.
      struct ListPolicyPrincipalsResponse
        include JSON::Serializable

        # The marker for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextMarker")]
        getter next_marker : String?

        # The descriptions of the principals.
        @[JSON::Field(key: "principals")]
        getter principals : Array(String)?

        def initialize(
          @next_marker : String? = nil,
          @principals : Array(String)? = nil
        )
        end
      end

      # The input for the ListPolicyVersions operation.
      struct ListPolicyVersionsRequest
        include JSON::Serializable

        # The policy name.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        def initialize(
          @policy_name : String
        )
        end
      end

      # The output from the ListPolicyVersions operation.
      struct ListPolicyVersionsResponse
        include JSON::Serializable

        # The policy versions.
        @[JSON::Field(key: "policyVersions")]
        getter policy_versions : Array(Types::PolicyVersion)?

        def initialize(
          @policy_versions : Array(Types::PolicyVersion)? = nil
        )
        end
      end

      # The input for the ListPrincipalPolicies operation.
      struct ListPrincipalPoliciesRequest
        include JSON::Serializable

        # The principal. Valid principals are CertificateArn (arn:aws:iot: region : accountId :cert/
        # certificateId ), thingGroupArn (arn:aws:iot: region : accountId :thinggroup/ groupName ) and
        # CognitoId ( region : id ).
        @[JSON::Field(key: "x-amzn-iot-principal")]
        getter principal : String

        # Specifies the order for results. If true, results are returned in ascending creation order.
        @[JSON::Field(key: "isAscendingOrder")]
        getter ascending_order : Bool?

        # The marker for the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The result page size.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        def initialize(
          @principal : String,
          @ascending_order : Bool? = nil,
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # The output from the ListPrincipalPolicies operation.
      struct ListPrincipalPoliciesResponse
        include JSON::Serializable

        # The marker for the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextMarker")]
        getter next_marker : String?

        # The policies.
        @[JSON::Field(key: "policies")]
        getter policies : Array(Types::Policy)?

        def initialize(
          @next_marker : String? = nil,
          @policies : Array(Types::Policy)? = nil
        )
        end
      end

      # The input for the ListPrincipalThings operation.
      struct ListPrincipalThingsRequest
        include JSON::Serializable

        # The principal.
        @[JSON::Field(key: "x-amzn-principal")]
        getter principal : String

        # The maximum number of results to return in this operation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @principal : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The output from the ListPrincipalThings operation.
      struct ListPrincipalThingsResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The things.
        @[JSON::Field(key: "things")]
        getter things : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @things : Array(String)? = nil
        )
        end
      end

      struct ListPrincipalThingsV2Request
        include JSON::Serializable

        # The principal. A principal can be an X.509 certificate or an Amazon Cognito ID.
        @[JSON::Field(key: "x-amzn-principal")]
        getter principal : String

        # The maximum number of results to return in this operation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of the relation you want to filter in the response. If no value is provided in this field,
        # the response will list all things, including both the EXCLUSIVE_THING and NON_EXCLUSIVE_THING
        # attachment types. EXCLUSIVE_THING - Attaches the specified principal to the specified thing,
        # exclusively. The thing will be the only thing that’s attached to the principal. NON_EXCLUSIVE_THING
        # - Attaches the specified principal to the specified thing. Multiple things can be attached to the
        # principal.
        @[JSON::Field(key: "thingPrincipalType")]
        getter thing_principal_type : String?

        def initialize(
          @principal : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @thing_principal_type : String? = nil
        )
        end
      end

      struct ListPrincipalThingsV2Response
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of thingPrincipalObject that represents the principal and the type of relation it has with
        # the thing.
        @[JSON::Field(key: "principalThingObjects")]
        getter principal_thing_objects : Array(Types::PrincipalThingObject)?

        def initialize(
          @next_token : String? = nil,
          @principal_thing_objects : Array(Types::PrincipalThingObject)? = nil
        )
        end
      end

      struct ListProvisioningTemplateVersionsRequest
        include JSON::Serializable

        # The name of the provisioning template.
        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @template_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProvisioningTemplateVersionsResponse
        include JSON::Serializable

        # A token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of provisioning template versions.
        @[JSON::Field(key: "versions")]
        getter versions : Array(Types::ProvisioningTemplateVersionSummary)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(Types::ProvisioningTemplateVersionSummary)? = nil
        )
        end
      end

      struct ListProvisioningTemplatesRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProvisioningTemplatesResponse
        include JSON::Serializable

        # A token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of provisioning templates
        @[JSON::Field(key: "templates")]
        getter templates : Array(Types::ProvisioningTemplateSummary)?

        def initialize(
          @next_token : String? = nil,
          @templates : Array(Types::ProvisioningTemplateSummary)? = nil
        )
        end
      end

      struct ListRelatedResourcesForAuditFindingRequest
        include JSON::Serializable

        # The finding Id.
        @[JSON::Field(key: "findingId")]
        getter finding_id : String

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @finding_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRelatedResourcesForAuditFindingResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results, or null for the first API call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The related resources.
        @[JSON::Field(key: "relatedResources")]
        getter related_resources : Array(Types::RelatedResource)?

        def initialize(
          @next_token : String? = nil,
          @related_resources : Array(Types::RelatedResource)? = nil
        )
        end
      end

      struct ListRoleAliasesRequest
        include JSON::Serializable

        # Return the list of role aliases in ascending alphabetical order.
        @[JSON::Field(key: "isAscendingOrder")]
        getter ascending_order : Bool?

        # A marker used to get the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        def initialize(
          @ascending_order : Bool? = nil,
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      struct ListRoleAliasesResponse
        include JSON::Serializable

        # A marker used to get the next set of results.
        @[JSON::Field(key: "nextMarker")]
        getter next_marker : String?

        # The role aliases.
        @[JSON::Field(key: "roleAliases")]
        getter role_aliases : Array(String)?

        def initialize(
          @next_marker : String? = nil,
          @role_aliases : Array(String)? = nil
        )
        end
      end

      struct ListSbomValidationResultsRequest
        include JSON::Serializable

        # The name of the new software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String

        # The name of the new package version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The end result of the
        @[JSON::Field(key: "validationResult")]
        getter validation_result : String?

        def initialize(
          @package_name : String,
          @version_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @validation_result : String? = nil
        )
        end
      end

      struct ListSbomValidationResultsResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A summary of the validation results for each software bill of materials attached to a software
        # package version.
        @[JSON::Field(key: "validationResultSummaries")]
        getter validation_result_summaries : Array(Types::SbomValidationResultSummary)?

        def initialize(
          @next_token : String? = nil,
          @validation_result_summaries : Array(Types::SbomValidationResultSummary)? = nil
        )
        end
      end

      struct ListScheduledAuditsRequest
        include JSON::Serializable

        # The maximum number of results to return at one time. The default is 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListScheduledAuditsResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of scheduled audits.
        @[JSON::Field(key: "scheduledAudits")]
        getter scheduled_audits : Array(Types::ScheduledAuditMetadata)?

        def initialize(
          @next_token : String? = nil,
          @scheduled_audits : Array(Types::ScheduledAuditMetadata)? = nil
        )
        end
      end

      struct ListSecurityProfilesForTargetRequest
        include JSON::Serializable

        # The ARN of the target (thing group) whose attached security profiles you want to get.
        @[JSON::Field(key: "securityProfileTargetArn")]
        getter security_profile_target_arn : String

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # If true, return child groups too.
        @[JSON::Field(key: "recursive")]
        getter recursive : Bool?

        def initialize(
          @security_profile_target_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @recursive : Bool? = nil
        )
        end
      end

      struct ListSecurityProfilesForTargetResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of security profiles and their associated targets.
        @[JSON::Field(key: "securityProfileTargetMappings")]
        getter security_profile_target_mappings : Array(Types::SecurityProfileTargetMapping)?

        def initialize(
          @next_token : String? = nil,
          @security_profile_target_mappings : Array(Types::SecurityProfileTargetMapping)? = nil
        )
        end
      end

      struct ListSecurityProfilesRequest
        include JSON::Serializable

        # A filter to limit results to the security profiles that use the defined dimension. Cannot be used
        # with metricName
        @[JSON::Field(key: "dimensionName")]
        getter dimension_name : String?

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the custom metric. Cannot be used with dimensionName .
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dimension_name : String? = nil,
          @max_results : Int32? = nil,
          @metric_name : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSecurityProfilesResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of security profile identifiers (names and ARNs).
        @[JSON::Field(key: "securityProfileIdentifiers")]
        getter security_profile_identifiers : Array(Types::SecurityProfileIdentifier)?

        def initialize(
          @next_token : String? = nil,
          @security_profile_identifiers : Array(Types::SecurityProfileIdentifier)? = nil
        )
        end
      end

      struct ListStreamsRequest
        include JSON::Serializable

        # Set to true to return the list of streams in ascending order.
        @[JSON::Field(key: "isAscendingOrder")]
        getter ascending_order : Bool?

        # The maximum number of results to return at a time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ascending_order : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStreamsResponse
        include JSON::Serializable

        # A token used to get the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of streams.
        @[JSON::Field(key: "streams")]
        getter streams : Array(Types::StreamSummary)?

        def initialize(
          @next_token : String? = nil,
          @streams : Array(Types::StreamSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of tags assigned to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListTargetsForPolicyRequest
        include JSON::Serializable

        # The policy name.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        # A marker used to get the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        def initialize(
          @policy_name : String,
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      struct ListTargetsForPolicyResponse
        include JSON::Serializable

        # A marker used to get the next set of results.
        @[JSON::Field(key: "nextMarker")]
        getter next_marker : String?

        # The policy targets.
        @[JSON::Field(key: "targets")]
        getter targets : Array(String)?

        def initialize(
          @next_marker : String? = nil,
          @targets : Array(String)? = nil
        )
        end
      end

      struct ListTargetsForSecurityProfileRequest
        include JSON::Serializable

        # The security profile.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @security_profile_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTargetsForSecurityProfileResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The thing groups to which the security profile is attached.
        @[JSON::Field(key: "securityProfileTargets")]
        getter security_profile_targets : Array(Types::SecurityProfileTarget)?

        def initialize(
          @next_token : String? = nil,
          @security_profile_targets : Array(Types::SecurityProfileTarget)? = nil
        )
        end
      end

      struct ListThingGroupsForThingRequest
        include JSON::Serializable

        # The thing name.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @thing_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListThingGroupsForThingResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The thing groups.
        @[JSON::Field(key: "thingGroups")]
        getter thing_groups : Array(Types::GroupNameAndArn)?

        def initialize(
          @next_token : String? = nil,
          @thing_groups : Array(Types::GroupNameAndArn)? = nil
        )
        end
      end

      struct ListThingGroupsRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A filter that limits the results to those with the specified name prefix.
        @[JSON::Field(key: "namePrefixFilter")]
        getter name_prefix_filter : String?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A filter that limits the results to those with the specified parent group.
        @[JSON::Field(key: "parentGroup")]
        getter parent_group : String?

        # If true, return child groups as well.
        @[JSON::Field(key: "recursive")]
        getter recursive : Bool?

        def initialize(
          @max_results : Int32? = nil,
          @name_prefix_filter : String? = nil,
          @next_token : String? = nil,
          @parent_group : String? = nil,
          @recursive : Bool? = nil
        )
        end
      end

      struct ListThingGroupsResponse
        include JSON::Serializable

        # The token to use to get the next set of results. Will not be returned if operation has returned all
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The thing groups.
        @[JSON::Field(key: "thingGroups")]
        getter thing_groups : Array(Types::GroupNameAndArn)?

        def initialize(
          @next_token : String? = nil,
          @thing_groups : Array(Types::GroupNameAndArn)? = nil
        )
        end
      end

      # The input for the ListThingPrincipal operation.
      struct ListThingPrincipalsRequest
        include JSON::Serializable

        # The name of the thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The maximum number of results to return in this operation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @thing_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The output from the ListThingPrincipals operation.
      struct ListThingPrincipalsResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The principals associated with the thing.
        @[JSON::Field(key: "principals")]
        getter principals : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @principals : Array(String)? = nil
        )
        end
      end

      struct ListThingPrincipalsV2Request
        include JSON::Serializable

        # The name of the thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The maximum number of results to return in this operation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of the relation you want to filter in the response. If no value is provided in this field,
        # the response will list all principals, including both the EXCLUSIVE_THING and NON_EXCLUSIVE_THING
        # attachment types. EXCLUSIVE_THING - Attaches the specified principal to the specified thing,
        # exclusively. The thing will be the only thing that’s attached to the principal. NON_EXCLUSIVE_THING
        # - Attaches the specified principal to the specified thing. Multiple things can be attached to the
        # principal.
        @[JSON::Field(key: "thingPrincipalType")]
        getter thing_principal_type : String?

        def initialize(
          @thing_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @thing_principal_type : String? = nil
        )
        end
      end

      struct ListThingPrincipalsV2Response
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of thingPrincipalObject that represents the principal and the type of relation it has with
        # the thing.
        @[JSON::Field(key: "thingPrincipalObjects")]
        getter thing_principal_objects : Array(Types::ThingPrincipalObject)?

        def initialize(
          @next_token : String? = nil,
          @thing_principal_objects : Array(Types::ThingPrincipalObject)? = nil
        )
        end
      end

      struct ListThingRegistrationTaskReportsRequest
        include JSON::Serializable

        # The type of task report.
        @[JSON::Field(key: "reportType")]
        getter report_type : String

        # The id of the task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # The maximum number of results to return per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @report_type : String,
          @task_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListThingRegistrationTaskReportsResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of task report.
        @[JSON::Field(key: "reportType")]
        getter report_type : String?

        # Links to the task resources.
        @[JSON::Field(key: "resourceLinks")]
        getter resource_links : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @report_type : String? = nil,
          @resource_links : Array(String)? = nil
        )
        end
      end

      struct ListThingRegistrationTasksRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the bulk thing provisioning task.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListThingRegistrationTasksResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of bulk thing provisioning task IDs.
        @[JSON::Field(key: "taskIds")]
        getter task_ids : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @task_ids : Array(String)? = nil
        )
        end
      end

      # The input for the ListThingTypes operation.
      struct ListThingTypesRequest
        include JSON::Serializable

        # The maximum number of results to return in this operation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the thing type.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @thing_type_name : String? = nil
        )
        end
      end

      # The output for the ListThingTypes operation.
      struct ListThingTypesResponse
        include JSON::Serializable

        # The token for the next set of results. Will not be returned if operation has returned all results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The thing types.
        @[JSON::Field(key: "thingTypes")]
        getter thing_types : Array(Types::ThingTypeDefinition)?

        def initialize(
          @next_token : String? = nil,
          @thing_types : Array(Types::ThingTypeDefinition)? = nil
        )
        end
      end

      struct ListThingsInBillingGroupRequest
        include JSON::Serializable

        # The name of the billing group.
        @[JSON::Field(key: "billingGroupName")]
        getter billing_group_name : String

        # The maximum number of results to return per request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @billing_group_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListThingsInBillingGroupResponse
        include JSON::Serializable

        # The token to use to get the next set of results. Will not be returned if operation has returned all
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of things in the billing group.
        @[JSON::Field(key: "things")]
        getter things : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @things : Array(String)? = nil
        )
        end
      end

      struct ListThingsInThingGroupRequest
        include JSON::Serializable

        # The thing group name.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # When true, list things in this thing group and in all child groups as well.
        @[JSON::Field(key: "recursive")]
        getter recursive : Bool?

        def initialize(
          @thing_group_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @recursive : Bool? = nil
        )
        end
      end

      struct ListThingsInThingGroupResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The things in the specified thing group.
        @[JSON::Field(key: "things")]
        getter things : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @things : Array(String)? = nil
        )
        end
      end

      # The input for the ListThings operation.
      struct ListThingsRequest
        include JSON::Serializable

        # The attribute name used to search for things.
        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String?

        # The attribute value used to search for things.
        @[JSON::Field(key: "attributeValue")]
        getter attribute_value : String?

        # The maximum number of results to return in this operation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the thing type used to search for things.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String?

        # When true , the action returns the thing resources with attribute values that start with the
        # attributeValue provided. When false , or not present, the action returns only the thing resources
        # with attribute values that match the entire attributeValue provided.
        @[JSON::Field(key: "usePrefixAttributeValue")]
        getter use_prefix_attribute_value : Bool?

        def initialize(
          @attribute_name : String? = nil,
          @attribute_value : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @thing_type_name : String? = nil,
          @use_prefix_attribute_value : Bool? = nil
        )
        end
      end

      # The output from the ListThings operation.
      struct ListThingsResponse
        include JSON::Serializable

        # The token to use to get the next set of results. Will not be returned if operation has returned all
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The things.
        @[JSON::Field(key: "things")]
        getter things : Array(Types::ThingAttribute)?

        def initialize(
          @next_token : String? = nil,
          @things : Array(Types::ThingAttribute)? = nil
        )
        end
      end

      struct ListTopicRuleDestinationsRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTopicRuleDestinationsResponse
        include JSON::Serializable

        # Information about a topic rule destination.
        @[JSON::Field(key: "destinationSummaries")]
        getter destination_summaries : Array(Types::TopicRuleDestinationSummary)?

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @destination_summaries : Array(Types::TopicRuleDestinationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The input for the ListTopicRules operation.
      struct ListTopicRulesRequest
        include JSON::Serializable

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies whether the rule is disabled.
        @[JSON::Field(key: "ruleDisabled")]
        getter rule_disabled : Bool?

        # The topic.
        @[JSON::Field(key: "topic")]
        getter topic : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @rule_disabled : Bool? = nil,
          @topic : String? = nil
        )
        end
      end

      # The output from the ListTopicRules operation.
      struct ListTopicRulesResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The rules.
        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::TopicRuleListItem)?

        def initialize(
          @next_token : String? = nil,
          @rules : Array(Types::TopicRuleListItem)? = nil
        )
        end
      end

      struct ListV2LoggingLevelsRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of resource for which you are configuring logging. Must be THING_Group .
        @[JSON::Field(key: "targetType")]
        getter target_type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @target_type : String? = nil
        )
        end
      end

      struct ListV2LoggingLevelsResponse
        include JSON::Serializable

        # The logging configuration for a target.
        @[JSON::Field(key: "logTargetConfigurations")]
        getter log_target_configurations : Array(Types::LogTargetConfiguration)?

        # The token to use to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @log_target_configurations : Array(Types::LogTargetConfiguration)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListViolationEventsRequest
        include JSON::Serializable

        # The end time for the alerts to be listed.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The start time for the alerts to be listed.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The criteria for a behavior.
        @[JSON::Field(key: "behaviorCriteriaType")]
        getter behavior_criteria_type : String?

        # A list of all suppressed alerts.
        @[JSON::Field(key: "listSuppressedAlerts")]
        getter list_suppressed_alerts : Bool?

        # The maximum number of results to return at one time.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A filter to limit results to those alerts generated by the specified security profile.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String?

        # A filter to limit results to those alerts caused by the specified thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        # The verification state of the violation (detect alarm).
        @[JSON::Field(key: "verificationState")]
        getter verification_state : String?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @behavior_criteria_type : String? = nil,
          @list_suppressed_alerts : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @security_profile_name : String? = nil,
          @thing_name : String? = nil,
          @verification_state : String? = nil
        )
        end
      end

      struct ListViolationEventsResponse
        include JSON::Serializable

        # A token that can be used to retrieve the next set of results, or null if there are no additional
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The security profile violation alerts issued for this account during the given time period,
        # potentially filtered by security profile, behavior violated, or thing (device) violating.
        @[JSON::Field(key: "violationEvents")]
        getter violation_events : Array(Types::ViolationEvent)?

        def initialize(
          @next_token : String? = nil,
          @violation_events : Array(Types::ViolationEvent)? = nil
        )
        end
      end

      # The Amazon Location rule action sends device location updates from an MQTT message to an Amazon
      # Location tracker resource.
      struct LocationAction
        include JSON::Serializable

        # The unique ID of the device providing the location data.
        @[JSON::Field(key: "deviceId")]
        getter device_id : String

        # A string that evaluates to a double value that represents the latitude of the device's location.
        @[JSON::Field(key: "latitude")]
        getter latitude : String

        # A string that evaluates to a double value that represents the longitude of the device's location.
        @[JSON::Field(key: "longitude")]
        getter longitude : String

        # The IAM role that grants permission to write to the Amazon Location resource.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of the tracker resource in Amazon Location in which the location is updated.
        @[JSON::Field(key: "trackerName")]
        getter tracker_name : String

        # The time that the location data was sampled. The default value is the time the MQTT message was
        # processed.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Types::LocationTimestamp?

        def initialize(
          @device_id : String,
          @latitude : String,
          @longitude : String,
          @role_arn : String,
          @tracker_name : String,
          @timestamp : Types::LocationTimestamp? = nil
        )
        end
      end

      # Describes how to interpret an application-defined timestamp value from an MQTT message payload and
      # the precision of that value.
      struct LocationTimestamp
        include JSON::Serializable

        # An expression that returns a long epoch time value.
        @[JSON::Field(key: "value")]
        getter value : String

        # The precision of the timestamp value that results from the expression described in value . Valid
        # values: SECONDS | MILLISECONDS | MICROSECONDS | NANOSECONDS . The default is MILLISECONDS .
        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @value : String,
          @unit : String? = nil
        )
        end
      end

      # Configuration for event-based logging that specifies which event types to log and their logging
      # settings. Used for account-level logging overrides.
      struct LogEventConfiguration
        include JSON::Serializable

        # The type of event to log. These include event types like Connect, Publish, and Disconnect.
        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # CloudWatch Log Group for event-based logging. Specifies where log events should be sent. The log
        # destination for event-based logging overrides default Log Group for the specified event type and
        # applies to all resources associated with that event.
        @[JSON::Field(key: "logDestination")]
        getter log_destination : String?

        # The logging level for the specified event type. Determines the verbosity of log messages generated
        # for this event type.
        @[JSON::Field(key: "logLevel")]
        getter log_level : String?

        def initialize(
          @event_type : String,
          @log_destination : String? = nil,
          @log_level : String? = nil
        )
        end
      end

      # A log target.
      struct LogTarget
        include JSON::Serializable

        # The target type.
        @[JSON::Field(key: "targetType")]
        getter target_type : String

        # The target name.
        @[JSON::Field(key: "targetName")]
        getter target_name : String?

        def initialize(
          @target_type : String,
          @target_name : String? = nil
        )
        end
      end

      # The target configuration.
      struct LogTargetConfiguration
        include JSON::Serializable

        # The logging level.
        @[JSON::Field(key: "logLevel")]
        getter log_level : String?

        # A log target
        @[JSON::Field(key: "logTarget")]
        getter log_target : Types::LogTarget?

        def initialize(
          @log_level : String? = nil,
          @log_target : Types::LogTarget? = nil
        )
        end
      end

      # Describes the logging options payload.
      struct LoggingOptionsPayload
        include JSON::Serializable

        # The ARN of the IAM role that grants access.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The log level.
        @[JSON::Field(key: "logLevel")]
        getter log_level : String?

        def initialize(
          @role_arn : String,
          @log_level : String? = nil
        )
        end
      end

      # The configuration of an ML Detect Security Profile.
      struct MachineLearningDetectionConfig
        include JSON::Serializable

        # The sensitivity of anomalous behavior evaluation. Can be Low , Medium , or High .
        @[JSON::Field(key: "confidenceLevel")]
        getter confidence_level : String

        def initialize(
          @confidence_level : String
        )
        end
      end

      # An optional configuration within the SchedulingConfig to setup a recurring maintenance window with a
      # predetermined start time and duration for the rollout of a job document to all devices in a target
      # group for a job.
      struct MaintenanceWindow
        include JSON::Serializable

        # Displays the duration of the next maintenance window.
        @[JSON::Field(key: "durationInMinutes")]
        getter duration_in_minutes : Int32

        # Displays the start time of the next maintenance window.
        @[JSON::Field(key: "startTime")]
        getter start_time : String

        def initialize(
          @duration_in_minutes : Int32,
          @start_time : String
        )
        end
      end

      # The policy documentation is not valid.
      struct MalformedPolicyException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that contains information about the managed template.
      struct ManagedJobTemplateSummary
        include JSON::Serializable

        # The description for a managed template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of environments that are supported with the managed job template.
        @[JSON::Field(key: "environments")]
        getter environments : Array(String)?

        # The Amazon Resource Name (ARN) for a managed template.
        @[JSON::Field(key: "templateArn")]
        getter template_arn : String?

        # The unique Name for a managed template.
        @[JSON::Field(key: "templateName")]
        getter template_name : String?

        # The version for a managed template.
        @[JSON::Field(key: "templateVersion")]
        getter template_version : String?

        def initialize(
          @description : String? = nil,
          @environments : Array(String)? = nil,
          @template_arn : String? = nil,
          @template_name : String? = nil,
          @template_version : String? = nil
        )
        end
      end

      # A metric.
      struct MetricDatum
        include JSON::Serializable

        # The time the metric value was reported.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        # The value reported for the metric.
        @[JSON::Field(key: "value")]
        getter value : Types::MetricValue?

        def initialize(
          @timestamp : Time? = nil,
          @value : Types::MetricValue? = nil
        )
        end
      end

      # The dimension of a metric.
      struct MetricDimension
        include JSON::Serializable

        # A unique identifier for the dimension.
        @[JSON::Field(key: "dimensionName")]
        getter dimension_name : String

        # Defines how the dimensionValues of a dimension are interpreted. For example, for dimension type
        # TOPIC_FILTER, the IN operator, a message will be counted only if its topic matches one of the topic
        # filters. With NOT_IN operator, a message will be counted only if it doesn't match any of the topic
        # filters. The operator is optional: if it's not provided (is null ), it will be interpreted as IN .
        @[JSON::Field(key: "operator")]
        getter operator : String?

        def initialize(
          @dimension_name : String,
          @operator : String? = nil
        )
        end
      end

      # The metric you want to retain. Dimensions are optional.
      struct MetricToRetain
        include JSON::Serializable

        # What is measured by the behavior.
        @[JSON::Field(key: "metric")]
        getter metric : String

        # The value indicates exporting metrics related to the MetricToRetain when it's true.
        @[JSON::Field(key: "exportMetric")]
        getter export_metric : Bool?

        # The dimension of a metric. This can't be used with custom metrics.
        @[JSON::Field(key: "metricDimension")]
        getter metric_dimension : Types::MetricDimension?

        def initialize(
          @metric : String,
          @export_metric : Bool? = nil,
          @metric_dimension : Types::MetricDimension? = nil
        )
        end
      end

      # The value to be compared with the metric .
      struct MetricValue
        include JSON::Serializable

        # If the comparisonOperator calls for a set of CIDRs, use this to specify that set to be compared with
        # the metric .
        @[JSON::Field(key: "cidrs")]
        getter cidrs : Array(String)?

        # If the comparisonOperator calls for a numeric value, use this to specify that numeric value to be
        # compared with the metric .
        @[JSON::Field(key: "count")]
        getter count : Int64?

        # The numeral value of a metric.
        @[JSON::Field(key: "number")]
        getter number : Float64?

        # The numeral values of a metric.
        @[JSON::Field(key: "numbers")]
        getter numbers : Array(Float64)?

        # If the comparisonOperator calls for a set of ports, use this to specify that set to be compared with
        # the metric .
        @[JSON::Field(key: "ports")]
        getter ports : Array(Int32)?

        # The string values of a metric.
        @[JSON::Field(key: "strings")]
        getter strings : Array(String)?

        def initialize(
          @cidrs : Array(String)? = nil,
          @count : Int64? = nil,
          @number : Float64? = nil,
          @numbers : Array(Float64)? = nil,
          @ports : Array(Int32)? = nil,
          @strings : Array(String)? = nil
        )
        end
      end

      # Set configurations for metrics export.
      struct MetricsExportConfig
        include JSON::Serializable

        # The MQTT topic that Device Defender Detect should publish messages to for metrics export.
        @[JSON::Field(key: "mqttTopic")]
        getter mqtt_topic : String

        # This role ARN has permission to publish MQTT messages, after which Device Defender Detect can assume
        # the role and publish messages on your behalf.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @mqtt_topic : String,
          @role_arn : String
        )
        end
      end

      # Describes which changes should be applied as part of a mitigation action.
      struct MitigationAction
        include JSON::Serializable

        # The set of parameters for this mitigation action. The parameters vary, depending on the kind of
        # action you apply.
        @[JSON::Field(key: "actionParams")]
        getter action_params : Types::MitigationActionParams?

        # A unique identifier for the mitigation action.
        @[JSON::Field(key: "id")]
        getter id : String?

        # A user-friendly name for the mitigation action.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The IAM role ARN used to apply this mitigation action.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @action_params : Types::MitigationActionParams? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Information that identifies a mitigation action. This information is returned by
      # ListMitigationActions.
      struct MitigationActionIdentifier
        include JSON::Serializable

        # The IAM role ARN used to apply this mitigation action.
        @[JSON::Field(key: "actionArn")]
        getter action_arn : String?

        # The friendly name of the mitigation action.
        @[JSON::Field(key: "actionName")]
        getter action_name : String?

        # The date when this mitigation action was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        def initialize(
          @action_arn : String? = nil,
          @action_name : String? = nil,
          @creation_date : Time? = nil
        )
        end
      end

      # The set of parameters for this mitigation action. You can specify only one type of parameter (in
      # other words, you can apply only one action for each defined mitigation action).
      struct MitigationActionParams
        include JSON::Serializable

        # Parameters to define a mitigation action that moves devices associated with a certificate to one or
        # more specified thing groups, typically for quarantine.
        @[JSON::Field(key: "addThingsToThingGroupParams")]
        getter add_things_to_thing_group_params : Types::AddThingsToThingGroupParams?

        # Parameters to define a mitigation action that enables Amazon Web Services IoT Core logging at a
        # specified level of detail.
        @[JSON::Field(key: "enableIoTLoggingParams")]
        getter enable_io_t_logging_params : Types::EnableIoTLoggingParams?

        # Parameters to define a mitigation action that publishes findings to Amazon Simple Notification
        # Service (Amazon SNS. You can implement your own custom actions in response to the Amazon SNS
        # messages.
        @[JSON::Field(key: "publishFindingToSnsParams")]
        getter publish_finding_to_sns_params : Types::PublishFindingToSnsParams?

        # Parameters to define a mitigation action that adds a blank policy to restrict permissions.
        @[JSON::Field(key: "replaceDefaultPolicyVersionParams")]
        getter replace_default_policy_version_params : Types::ReplaceDefaultPolicyVersionParams?

        # Parameters to define a mitigation action that changes the state of the CA certificate to inactive.
        @[JSON::Field(key: "updateCACertificateParams")]
        getter update_ca_certificate_params : Types::UpdateCACertificateParams?

        # Parameters to define a mitigation action that changes the state of the device certificate to
        # inactive.
        @[JSON::Field(key: "updateDeviceCertificateParams")]
        getter update_device_certificate_params : Types::UpdateDeviceCertificateParams?

        def initialize(
          @add_things_to_thing_group_params : Types::AddThingsToThingGroupParams? = nil,
          @enable_io_t_logging_params : Types::EnableIoTLoggingParams? = nil,
          @publish_finding_to_sns_params : Types::PublishFindingToSnsParams? = nil,
          @replace_default_policy_version_params : Types::ReplaceDefaultPolicyVersionParams? = nil,
          @update_ca_certificate_params : Types::UpdateCACertificateParams? = nil,
          @update_device_certificate_params : Types::UpdateDeviceCertificateParams? = nil
        )
        end
      end

      # The configuration to add user-defined properties to enrich MQTT 5 messages.
      struct Mqtt5Configuration
        include JSON::Serializable

        # An object that represents the propagating thing attributes and the connection attributes.
        @[JSON::Field(key: "propagatingAttributes")]
        getter propagating_attributes : Array(Types::PropagatingAttribute)?

        def initialize(
          @propagating_attributes : Array(Types::PropagatingAttribute)? = nil
        )
        end
      end

      # Specifies the MQTT context to use for the test authorizer request
      struct MqttContext
        include JSON::Serializable

        # The value of the clientId key in an MQTT authorization request.
        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        # The value of the password key in an MQTT authorization request.
        @[JSON::Field(key: "password")]
        getter password : Bytes?

        # The value of the username key in an MQTT authorization request.
        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @client_id : String? = nil,
          @password : Bytes? = nil,
          @username : String? = nil
        )
        end
      end

      # Specifies MQTT Version 5.0 headers information. For more information, see MQTT from Amazon Web
      # Services IoT Core Developer Guide.
      struct MqttHeaders
        include JSON::Serializable

        # A UTF-8 encoded string that describes the content of the publishing message. For more information,
        # see Content Type from the MQTT Version 5.0 specification. Supports substitution templates .
        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The base64-encoded binary data used by the sender of the request message to identify which request
        # the response message is for when it's received. For more information, see Correlation Data from the
        # MQTT Version 5.0 specification. This binary data must be based64-encoded. Supports substitution
        # templates .
        @[JSON::Field(key: "correlationData")]
        getter correlation_data : String?

        # A user-defined integer value that will persist a message at the message broker for a specified
        # amount of time to ensure that the message will expire if it's no longer relevant to the subscriber.
        # The value of messageExpiry represents the number of seconds before it expires. For more information
        # about the limits of messageExpiry , see Amazon Web Services IoT Core message broker and protocol
        # limits and quotas from the Amazon Web Services Reference Guide. Supports substitution templates .
        @[JSON::Field(key: "messageExpiry")]
        getter message_expiry : String?

        # An Enum string value that indicates whether the payload is formatted as UTF-8. Valid values are
        # UNSPECIFIED_BYTES and UTF8_DATA . For more information, see Payload Format Indicator from the MQTT
        # Version 5.0 specification. Supports substitution templates .
        @[JSON::Field(key: "payloadFormatIndicator")]
        getter payload_format_indicator : String?

        # A UTF-8 encoded string that's used as the topic name for a response message. The response topic is
        # used to describe the topic which the receiver should publish to as part of the request-response
        # flow. The topic must not contain wildcard characters. For more information, see Response Topic from
        # the MQTT Version 5.0 specification. Supports substitution templates .
        @[JSON::Field(key: "responseTopic")]
        getter response_topic : String?

        # An array of key-value pairs that you define in the MQTT5 header.
        @[JSON::Field(key: "userProperties")]
        getter user_properties : Array(Types::UserProperty)?

        def initialize(
          @content_type : String? = nil,
          @correlation_data : String? = nil,
          @message_expiry : String? = nil,
          @payload_format_indicator : String? = nil,
          @response_topic : String? = nil,
          @user_properties : Array(Types::UserProperty)? = nil
        )
        end
      end

      # Information about the resource that was noncompliant with the audit check.
      struct NonCompliantResource
        include JSON::Serializable

        # Other information about the noncompliant resource.
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Hash(String, String)?

        # Information that identifies the noncompliant resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : Types::ResourceIdentifier?

        # The type of the noncompliant resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @additional_info : Hash(String, String)? = nil,
          @resource_identifier : Types::ResourceIdentifier? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The resource is not configured.
      struct NotConfiguredException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a file to be associated with an OTA update.
      struct OTAUpdateFile
        include JSON::Serializable

        # A list of name-attribute pairs. They won't be sent to devices as a part of the Job document.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The code signing method of the file.
        @[JSON::Field(key: "codeSigning")]
        getter code_signing : Types::CodeSigning?

        # The location of the updated firmware.
        @[JSON::Field(key: "fileLocation")]
        getter file_location : Types::FileLocation?

        # The name of the file.
        @[JSON::Field(key: "fileName")]
        getter file_name : String?

        # An integer value you can include in the job document to allow your devices to identify the type of
        # file received from the cloud.
        @[JSON::Field(key: "fileType")]
        getter file_type : Int32?

        # The file version.
        @[JSON::Field(key: "fileVersion")]
        getter file_version : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @code_signing : Types::CodeSigning? = nil,
          @file_location : Types::FileLocation? = nil,
          @file_name : String? = nil,
          @file_type : Int32? = nil,
          @file_version : String? = nil
        )
        end
      end

      # Information about an OTA update.
      struct OTAUpdateInfo
        include JSON::Serializable

        # A collection of name/value pairs
        @[JSON::Field(key: "additionalParameters")]
        getter additional_parameters : Hash(String, String)?

        # The IoT job ARN associated with the OTA update.
        @[JSON::Field(key: "awsIotJobArn")]
        getter aws_iot_job_arn : String?

        # The IoT job ID associated with the OTA update.
        @[JSON::Field(key: "awsIotJobId")]
        getter aws_iot_job_id : String?

        # Configuration for the rollout of OTA updates.
        @[JSON::Field(key: "awsJobExecutionsRolloutConfig")]
        getter aws_job_executions_rollout_config : Types::AwsJobExecutionsRolloutConfig?

        # Configuration information for pre-signed URLs. Valid when protocols contains HTTP.
        @[JSON::Field(key: "awsJobPresignedUrlConfig")]
        getter aws_job_presigned_url_config : Types::AwsJobPresignedUrlConfig?

        # The date when the OTA update was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # A description of the OTA update.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Error information associated with the OTA update.
        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::ErrorInfo?

        # The date when the OTA update was last updated.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The OTA update ARN.
        @[JSON::Field(key: "otaUpdateArn")]
        getter ota_update_arn : String?

        # A list of files associated with the OTA update.
        @[JSON::Field(key: "otaUpdateFiles")]
        getter ota_update_files : Array(Types::OTAUpdateFile)?

        # The OTA update ID.
        @[JSON::Field(key: "otaUpdateId")]
        getter ota_update_id : String?

        # The status of the OTA update.
        @[JSON::Field(key: "otaUpdateStatus")]
        getter ota_update_status : String?

        # The protocol used to transfer the OTA update image. Valid values are [HTTP], [MQTT], [HTTP, MQTT].
        # When both HTTP and MQTT are specified, the target device can choose the protocol.
        @[JSON::Field(key: "protocols")]
        getter protocols : Array(String)?

        # Specifies whether the OTA update will continue to run (CONTINUOUS), or will be complete after all
        # those things specified as targets have completed the OTA update (SNAPSHOT). If continuous, the OTA
        # update may also be run on a thing when a change is detected in a target. For example, an OTA update
        # will run on a thing when the thing is added to a target group, even after the OTA update was
        # completed by all things originally in the group.
        @[JSON::Field(key: "targetSelection")]
        getter target_selection : String?

        # The targets of the OTA update.
        @[JSON::Field(key: "targets")]
        getter targets : Array(String)?

        def initialize(
          @additional_parameters : Hash(String, String)? = nil,
          @aws_iot_job_arn : String? = nil,
          @aws_iot_job_id : String? = nil,
          @aws_job_executions_rollout_config : Types::AwsJobExecutionsRolloutConfig? = nil,
          @aws_job_presigned_url_config : Types::AwsJobPresignedUrlConfig? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @error_info : Types::ErrorInfo? = nil,
          @last_modified_date : Time? = nil,
          @ota_update_arn : String? = nil,
          @ota_update_files : Array(Types::OTAUpdateFile)? = nil,
          @ota_update_id : String? = nil,
          @ota_update_status : String? = nil,
          @protocols : Array(String)? = nil,
          @target_selection : String? = nil,
          @targets : Array(String)? = nil
        )
        end
      end

      # An OTA update summary.
      struct OTAUpdateSummary
        include JSON::Serializable

        # The date when the OTA update was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The OTA update ARN.
        @[JSON::Field(key: "otaUpdateArn")]
        getter ota_update_arn : String?

        # The OTA update ID.
        @[JSON::Field(key: "otaUpdateId")]
        getter ota_update_id : String?

        def initialize(
          @creation_date : Time? = nil,
          @ota_update_arn : String? = nil,
          @ota_update_id : String? = nil
        )
        end
      end

      # Describes an action that writes data to an Amazon OpenSearch Service domain.
      struct OpenSearchAction
        include JSON::Serializable

        # The endpoint of your OpenSearch domain.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        # The unique identifier for the document you are storing.
        @[JSON::Field(key: "id")]
        getter id : String

        # The OpenSearch index where you want to store your data.
        @[JSON::Field(key: "index")]
        getter index : String

        # The IAM role ARN that has access to OpenSearch.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The type of document you are storing.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @endpoint : String,
          @id : String,
          @index : String,
          @role_arn : String,
          @type : String
        )
        end
      end

      # A certificate that has been transferred but not yet accepted.
      struct OutgoingCertificate
        include JSON::Serializable

        # The certificate ARN.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The certificate ID.
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String?

        # The certificate creation date.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The date the transfer was initiated.
        @[JSON::Field(key: "transferDate")]
        getter transfer_date : Time?

        # The transfer message.
        @[JSON::Field(key: "transferMessage")]
        getter transfer_message : String?

        # The Amazon Web Services account to which the transfer was made.
        @[JSON::Field(key: "transferredTo")]
        getter transferred_to : String?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_id : String? = nil,
          @creation_date : Time? = nil,
          @transfer_date : Time? = nil,
          @transfer_message : String? = nil,
          @transferred_to : String? = nil
        )
        end
      end

      # A summary of information about a software package.
      struct PackageSummary
        include JSON::Serializable

        # The date that the package was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The name of the default package version.
        @[JSON::Field(key: "defaultVersionName")]
        getter default_version_name : String?

        # The date that the package was last updated.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The name for the target software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String?

        def initialize(
          @creation_date : Time? = nil,
          @default_version_name : String? = nil,
          @last_modified_date : Time? = nil,
          @package_name : String? = nil
        )
        end
      end

      # A specific package version artifact associated with a software package version.
      struct PackageVersionArtifact
        include JSON::Serializable

        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        def initialize(
          @s3_location : Types::S3Location? = nil
        )
        end
      end

      # A summary of information about a package version.
      struct PackageVersionSummary
        include JSON::Serializable

        # The date that the package version was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The date that the package version was last updated.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The name of the associated software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String?

        # The status of the package version. For more information, see Package version lifecycle .
        @[JSON::Field(key: "status")]
        getter status : String?

        # The name of the target package version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String?

        def initialize(
          @creation_date : Time? = nil,
          @last_modified_date : Time? = nil,
          @package_name : String? = nil,
          @status : String? = nil,
          @version_name : String? = nil
        )
        end
      end

      # Describes the percentile and percentile value.
      struct PercentPair
        include JSON::Serializable

        # The percentile.
        @[JSON::Field(key: "percent")]
        getter percent : Float64?

        # The value of the percentile.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @percent : Float64? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes an IoT policy.
      struct Policy
        include JSON::Serializable

        # The policy ARN.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String?

        # The policy name.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String?

        def initialize(
          @policy_arn : String? = nil,
          @policy_name : String? = nil
        )
        end
      end

      # Describes a policy version.
      struct PolicyVersion
        include JSON::Serializable

        # The date and time the policy was created.
        @[JSON::Field(key: "createDate")]
        getter create_date : Time?

        # Specifies whether the policy version is the default.
        @[JSON::Field(key: "isDefaultVersion")]
        getter is_default_version : Bool?

        # The policy version ID.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @create_date : Time? = nil,
          @is_default_version : Bool? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Information about the version of the policy associated with the resource.
      struct PolicyVersionIdentifier
        include JSON::Serializable

        # The name of the policy.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String?

        # The ID of the version of the policy associated with the resource.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : String?

        def initialize(
          @policy_name : String? = nil,
          @policy_version_id : String? = nil
        )
        end
      end

      # Configuration for pre-signed S3 URLs.
      struct PresignedUrlConfig
        include JSON::Serializable

        # How long (in seconds) pre-signed URLs are valid. Valid values are 60 - 3600, the default value is
        # 3600 seconds. Pre-signed URLs are generated when Jobs receives an MQTT request for the job document.
        @[JSON::Field(key: "expiresInSec")]
        getter expires_in_sec : Int64?

        # The ARN of an IAM role that grants permission to download files from the S3 bucket where the job
        # data/updates are stored. The role must also grant permission for IoT to download the files. For
        # information about addressing the confused deputy problem, see cross-service confused deputy
        # prevention in the Amazon Web Services IoT Core developer guide .
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @expires_in_sec : Int64? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # An object that represents the thing and the type of relation it has with the principal.
      struct PrincipalThingObject
        include JSON::Serializable

        # The name of the thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The type of the relation you want to specify when you attach a principal to a thing. The value
        # defaults to NON_EXCLUSIVE_THING . EXCLUSIVE_THING - Attaches the specified principal to the
        # specified thing, exclusively. The thing will be the only thing that’s attached to the principal.
        # NON_EXCLUSIVE_THING - Attaches the specified principal to the specified thing. Multiple things can
        # be attached to the principal.
        @[JSON::Field(key: "thingPrincipalType")]
        getter thing_principal_type : String?

        def initialize(
          @thing_name : String,
          @thing_principal_type : String? = nil
        )
        end
      end

      # An object that represents the connection attribute, thing attribute, and the user property key.
      struct PropagatingAttribute
        include JSON::Serializable

        # The attribute associated with the connection between a device and Amazon Web Services IoT Core.
        @[JSON::Field(key: "connectionAttribute")]
        getter connection_attribute : String?

        # The user-defined thing attribute that is propagating for MQTT 5 message enrichment.
        @[JSON::Field(key: "thingAttribute")]
        getter thing_attribute : String?

        # The key of the user property key-value pair.
        @[JSON::Field(key: "userPropertyKey")]
        getter user_property_key : String?

        def initialize(
          @connection_attribute : String? = nil,
          @thing_attribute : String? = nil,
          @user_property_key : String? = nil
        )
        end
      end

      # Structure that contains payloadVersion and targetArn .
      struct ProvisioningHook
        include JSON::Serializable

        # The ARN of the target function. Note: Only Lambda functions are currently supported.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String

        # The payload that was sent to the target function. Note: Only Lambda functions are currently
        # supported.
        @[JSON::Field(key: "payloadVersion")]
        getter payload_version : String?

        def initialize(
          @target_arn : String,
          @payload_version : String? = nil
        )
        end
      end

      # A summary of information about a provisioning template.
      struct ProvisioningTemplateSummary
        include JSON::Serializable

        # The date when the provisioning template summary was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The description of the provisioning template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # True if the fleet provision template is enabled, otherwise false.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The date when the provisioning template summary was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The ARN of the provisioning template.
        @[JSON::Field(key: "templateArn")]
        getter template_arn : String?

        # The name of the provisioning template.
        @[JSON::Field(key: "templateName")]
        getter template_name : String?

        # The type you define in a provisioning template. You can create a template with only one type. You
        # can't change the template type after its creation. The default value is FLEET_PROVISIONING . For
        # more information about provisioning template, see: Provisioning template .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @creation_date : Time? = nil,
          @description : String? = nil,
          @enabled : Bool? = nil,
          @last_modified_date : Time? = nil,
          @template_arn : String? = nil,
          @template_name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A summary of information about a fleet provision template version.
      struct ProvisioningTemplateVersionSummary
        include JSON::Serializable

        # The date when the provisioning template version was created
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # True if the provisioning template version is the default version, otherwise false.
        @[JSON::Field(key: "isDefaultVersion")]
        getter is_default_version : Bool?

        # The ID of the fleet provisioning template version.
        @[JSON::Field(key: "versionId")]
        getter version_id : Int32?

        def initialize(
          @creation_date : Time? = nil,
          @is_default_version : Bool? = nil,
          @version_id : Int32? = nil
        )
        end
      end

      # Parameters to define a mitigation action that publishes findings to Amazon SNS. You can implement
      # your own custom actions in response to the Amazon SNS messages.
      struct PublishFindingToSnsParams
        include JSON::Serializable

        # The ARN of the topic to which you want to publish the findings.
        @[JSON::Field(key: "topicArn")]
        getter topic_arn : String

        def initialize(
          @topic_arn : String
        )
        end
      end

      # An asset property value entry containing the following information.
      struct PutAssetPropertyValueEntry
        include JSON::Serializable

        # A list of property values to insert that each contain timestamp, quality, and value (TQV)
        # information.
        @[JSON::Field(key: "propertyValues")]
        getter property_values : Array(Types::AssetPropertyValue)

        # The ID of the IoT SiteWise asset. You must specify either a propertyAlias or both an aliasId and a
        # propertyId . Accepts substitution templates.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # Optional. A unique identifier for this entry that you can define to better track which message
        # caused an error in case of failure. Accepts substitution templates. Defaults to a new UUID.
        @[JSON::Field(key: "entryId")]
        getter entry_id : String?

        # The name of the property alias associated with your asset property. You must specify either a
        # propertyAlias or both an aliasId and a propertyId . Accepts substitution templates.
        @[JSON::Field(key: "propertyAlias")]
        getter property_alias : String?

        # The ID of the asset's property. You must specify either a propertyAlias or both an aliasId and a
        # propertyId . Accepts substitution templates.
        @[JSON::Field(key: "propertyId")]
        getter property_id : String?

        def initialize(
          @property_values : Array(Types::AssetPropertyValue),
          @asset_id : String? = nil,
          @entry_id : String? = nil,
          @property_alias : String? = nil,
          @property_id : String? = nil
        )
        end
      end

      # The input for the DynamoActionVS action that specifies the DynamoDB table to which the message data
      # will be written.
      struct PutItemInput
        include JSON::Serializable

        # The table where the message data will be written.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        def initialize(
          @table_name : String
        )
        end
      end

      struct PutVerificationStateOnViolationRequest
        include JSON::Serializable

        # The verification state of the violation.
        @[JSON::Field(key: "verificationState")]
        getter verification_state : String

        # The violation ID.
        @[JSON::Field(key: "violationId")]
        getter violation_id : String

        # The description of the verification state of the violation (detect alarm).
        @[JSON::Field(key: "verificationStateDescription")]
        getter verification_state_description : String?

        def initialize(
          @verification_state : String,
          @violation_id : String,
          @verification_state_description : String? = nil
        )
        end
      end

      struct PutVerificationStateOnViolationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Allows you to define a criteria to initiate the increase in rate of rollout for a job.
      struct RateIncreaseCriteria
        include JSON::Serializable

        # The threshold for number of notified things that will initiate the increase in rate of rollout.
        @[JSON::Field(key: "numberOfNotifiedThings")]
        getter number_of_notified_things : Int32?

        # The threshold for number of succeeded things that will initiate the increase in rate of rollout.
        @[JSON::Field(key: "numberOfSucceededThings")]
        getter number_of_succeeded_things : Int32?

        def initialize(
          @number_of_notified_things : Int32? = nil,
          @number_of_succeeded_things : Int32? = nil
        )
        end
      end

      # The input to the RegisterCACertificate operation.
      struct RegisterCACertificateRequest
        include JSON::Serializable

        # The CA certificate.
        @[JSON::Field(key: "caCertificate")]
        getter ca_certificate : String

        # Allows this CA certificate to be used for auto registration of device certificates.
        @[JSON::Field(key: "allowAutoRegistration")]
        getter allow_auto_registration : Bool?

        # Describes the certificate mode in which the Certificate Authority (CA) will be registered. If the
        # verificationCertificate field is not provided, set certificateMode to be SNI_ONLY . If the
        # verificationCertificate field is provided, set certificateMode to be DEFAULT . When certificateMode
        # is not provided, it defaults to DEFAULT . All the device certificates that are registered using this
        # CA will be registered in the same certificate mode as the CA. For more information about certificate
        # mode for device certificates, see certificate mode .
        @[JSON::Field(key: "certificateMode")]
        getter certificate_mode : String?

        # Information about the registration configuration.
        @[JSON::Field(key: "registrationConfig")]
        getter registration_config : Types::RegistrationConfig?

        # A boolean value that specifies if the CA certificate is set to active. Valid values: ACTIVE |
        # INACTIVE
        @[JSON::Field(key: "setAsActive")]
        getter set_as_active : Bool?

        # Metadata which can be used to manage the CA certificate. For URI Request parameters use format:
        # ...key1=value1&amp;key2=value2... For the CLI command-line parameter use format: &amp;&amp;tags
        # "key1=value1&amp;key2=value2..." For the cli-input-json file use format: "tags":
        # "key1=value1&amp;key2=value2..."
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The private key verification certificate. If certificateMode is SNI_ONLY , the
        # verificationCertificate field must be empty. If certificateMode is DEFAULT or not provided, the
        # verificationCertificate field must not be empty.
        @[JSON::Field(key: "verificationCertificate")]
        getter verification_certificate : String?

        def initialize(
          @ca_certificate : String,
          @allow_auto_registration : Bool? = nil,
          @certificate_mode : String? = nil,
          @registration_config : Types::RegistrationConfig? = nil,
          @set_as_active : Bool? = nil,
          @tags : Array(Types::Tag)? = nil,
          @verification_certificate : String? = nil
        )
        end
      end

      # The output from the RegisterCACertificateResponse operation.
      struct RegisterCACertificateResponse
        include JSON::Serializable

        # The CA certificate ARN.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The CA certificate identifier.
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_id : String? = nil
        )
        end
      end

      # The input to the RegisterCertificate operation.
      struct RegisterCertificateRequest
        include JSON::Serializable

        # The certificate data, in PEM format.
        @[JSON::Field(key: "certificatePem")]
        getter certificate_pem : String

        # The CA certificate used to sign the device certificate being registered.
        @[JSON::Field(key: "caCertificatePem")]
        getter ca_certificate_pem : String?

        # A boolean value that specifies if the certificate is set to active. Valid values: ACTIVE | INACTIVE
        @[JSON::Field(key: "setAsActive")]
        getter set_as_active : Bool?

        # The status of the register certificate request. Valid values that you can use include ACTIVE ,
        # INACTIVE , and REVOKED .
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @certificate_pem : String,
          @ca_certificate_pem : String? = nil,
          @set_as_active : Bool? = nil,
          @status : String? = nil
        )
        end
      end

      # The output from the RegisterCertificate operation.
      struct RegisterCertificateResponse
        include JSON::Serializable

        # The certificate ARN.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The certificate identifier.
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_id : String? = nil
        )
        end
      end

      struct RegisterCertificateWithoutCARequest
        include JSON::Serializable

        # The certificate data, in PEM format.
        @[JSON::Field(key: "certificatePem")]
        getter certificate_pem : String

        # The status of the register certificate request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @certificate_pem : String,
          @status : String? = nil
        )
        end
      end

      struct RegisterCertificateWithoutCAResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the registered certificate.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The ID of the registered certificate. (The last part of the certificate ARN contains the certificate
        # ID.
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_id : String? = nil
        )
        end
      end

      struct RegisterThingRequest
        include JSON::Serializable

        # The provisioning template. See Provisioning Devices That Have Device Certificates for more
        # information.
        @[JSON::Field(key: "templateBody")]
        getter template_body : String

        # The parameters for provisioning a thing. See Provisioning Templates for more information.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        def initialize(
          @template_body : String,
          @parameters : Hash(String, String)? = nil
        )
        end
      end

      struct RegisterThingResponse
        include JSON::Serializable

        # The certificate data, in PEM format.
        @[JSON::Field(key: "certificatePem")]
        getter certificate_pem : String?

        # ARNs for the generated resources.
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Hash(String, String)?

        def initialize(
          @certificate_pem : String? = nil,
          @resource_arns : Hash(String, String)? = nil
        )
        end
      end

      # The registration code is invalid.
      struct RegistrationCodeValidationException
        include JSON::Serializable

        # Additional information about the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The registration configuration.
      struct RegistrationConfig
        include JSON::Serializable

        # The ARN of the role.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The template body.
        @[JSON::Field(key: "templateBody")]
        getter template_body : String?

        # The name of the provisioning template.
        @[JSON::Field(key: "templateName")]
        getter template_name : String?

        def initialize(
          @role_arn : String? = nil,
          @template_body : String? = nil,
          @template_name : String? = nil
        )
        end
      end

      # The input for the RejectCertificateTransfer operation.
      struct RejectCertificateTransferRequest
        include JSON::Serializable

        # The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String

        # The reason the certificate transfer was rejected.
        @[JSON::Field(key: "rejectReason")]
        getter reject_reason : String?

        def initialize(
          @certificate_id : String,
          @reject_reason : String? = nil
        )
        end
      end

      # Information about a related resource.
      struct RelatedResource
        include JSON::Serializable

        # Other information about the resource.
        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Hash(String, String)?

        # Information that identifies the resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : Types::ResourceIdentifier?

        # The type of resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @additional_info : Hash(String, String)? = nil,
          @resource_identifier : Types::ResourceIdentifier? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct RemoveThingFromBillingGroupRequest
        include JSON::Serializable

        # The ARN of the billing group.
        @[JSON::Field(key: "billingGroupArn")]
        getter billing_group_arn : String?

        # The name of the billing group.
        @[JSON::Field(key: "billingGroupName")]
        getter billing_group_name : String?

        # The ARN of the thing to be removed from the billing group.
        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        # The name of the thing to be removed from the billing group.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @billing_group_arn : String? = nil,
          @billing_group_name : String? = nil,
          @thing_arn : String? = nil,
          @thing_name : String? = nil
        )
        end
      end

      struct RemoveThingFromBillingGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct RemoveThingFromThingGroupRequest
        include JSON::Serializable

        # The ARN of the thing to remove from the group.
        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        # The group ARN.
        @[JSON::Field(key: "thingGroupArn")]
        getter thing_group_arn : String?

        # The group name.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String?

        # The name of the thing to remove from the group.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @thing_arn : String? = nil,
          @thing_group_arn : String? = nil,
          @thing_group_name : String? = nil,
          @thing_name : String? = nil
        )
        end
      end

      struct RemoveThingFromThingGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Parameters to define a mitigation action that adds a blank policy to restrict permissions.
      struct ReplaceDefaultPolicyVersionParams
        include JSON::Serializable

        # The name of the template to be applied. The only supported value is BLANK_POLICY .
        @[JSON::Field(key: "templateName")]
        getter template_name : String

        def initialize(
          @template_name : String
        )
        end
      end

      # The input for the ReplaceTopicRule operation.
      struct ReplaceTopicRuleRequest
        include JSON::Serializable

        # The name of the rule.
        @[JSON::Field(key: "ruleName")]
        getter rule_name : String

        # The rule payload.
        @[JSON::Field(key: "topicRulePayload")]
        getter topic_rule_payload : Types::TopicRulePayload

        def initialize(
          @rule_name : String,
          @topic_rule_payload : Types::TopicRulePayload
        )
        end
      end

      # Describes an action to republish to another topic.
      struct RepublishAction
        include JSON::Serializable

        # The ARN of the IAM role that grants access.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of the MQTT topic.
        @[JSON::Field(key: "topic")]
        getter topic : String

        # MQTT Version 5.0 headers information. For more information, see MQTT from the Amazon Web Services
        # IoT Core Developer Guide.
        @[JSON::Field(key: "headers")]
        getter headers : Types::MqttHeaders?

        # The Quality of Service (QoS) level to use when republishing messages. The default value is 0.
        @[JSON::Field(key: "qos")]
        getter qos : Int32?

        def initialize(
          @role_arn : String,
          @topic : String,
          @headers : Types::MqttHeaders? = nil,
          @qos : Int32? = nil
        )
        end
      end

      # The resource already exists.
      struct ResourceAlreadyExistsException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The ARN of the resource that caused the exception.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The ID of the resource that caused the exception.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        def initialize(
          @message : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil
        )
        end
      end

      # Information that identifies the noncompliant resource.
      struct ResourceIdentifier
        include JSON::Serializable

        # The account with which the resource is associated.
        @[JSON::Field(key: "account")]
        getter account : String?

        # The ID of the CA certificate used to authorize the certificate.
        @[JSON::Field(key: "caCertificateId")]
        getter ca_certificate_id : String?

        # The client ID.
        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        # The ID of the Amazon Cognito identity pool.
        @[JSON::Field(key: "cognitoIdentityPoolId")]
        getter cognito_identity_pool_id : String?

        # The ARN of the identified device certificate.
        @[JSON::Field(key: "deviceCertificateArn")]
        getter device_certificate_arn : String?

        # The ID of the certificate attached to the resource.
        @[JSON::Field(key: "deviceCertificateId")]
        getter device_certificate_id : String?

        # The ARN of the IAM role that has overly permissive actions.
        @[JSON::Field(key: "iamRoleArn")]
        getter iam_role_arn : String?

        # The issuer certificate identifier.
        @[JSON::Field(key: "issuerCertificateIdentifier")]
        getter issuer_certificate_identifier : Types::IssuerCertificateIdentifier?

        # The version of the policy associated with the resource.
        @[JSON::Field(key: "policyVersionIdentifier")]
        getter policy_version_identifier : Types::PolicyVersionIdentifier?

        # The ARN of the role alias that has overly permissive actions.
        @[JSON::Field(key: "roleAliasArn")]
        getter role_alias_arn : String?

        def initialize(
          @account : String? = nil,
          @ca_certificate_id : String? = nil,
          @client_id : String? = nil,
          @cognito_identity_pool_id : String? = nil,
          @device_certificate_arn : String? = nil,
          @device_certificate_id : String? = nil,
          @iam_role_arn : String? = nil,
          @issuer_certificate_identifier : Types::IssuerCertificateIdentifier? = nil,
          @policy_version_identifier : Types::PolicyVersionIdentifier? = nil,
          @role_alias_arn : String? = nil
        )
        end
      end

      # The specified resource does not exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource registration failed.
      struct ResourceRegistrationFailureException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The criteria that determines how many retries are allowed for each failure type for a job.
      struct RetryCriteria
        include JSON::Serializable

        # The type of job execution failures that can initiate a job retry.
        @[JSON::Field(key: "failureType")]
        getter failure_type : String

        # The number of retries allowed for a failure type for the job.
        @[JSON::Field(key: "numberOfRetries")]
        getter number_of_retries : Int32

        def initialize(
          @failure_type : String,
          @number_of_retries : Int32
        )
        end
      end

      # Role alias description.
      struct RoleAliasDescription
        include JSON::Serializable

        # The UNIX timestamp of when the role alias was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The number of seconds for which the credential is valid.
        @[JSON::Field(key: "credentialDurationSeconds")]
        getter credential_duration_seconds : Int32?

        # The UNIX timestamp of when the role alias was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The role alias owner.
        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The role alias.
        @[JSON::Field(key: "roleAlias")]
        getter role_alias : String?

        # The ARN of the role alias.
        @[JSON::Field(key: "roleAliasArn")]
        getter role_alias_arn : String?

        # The role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @creation_date : Time? = nil,
          @credential_duration_seconds : Int32? = nil,
          @last_modified_date : Time? = nil,
          @owner : String? = nil,
          @role_alias : String? = nil,
          @role_alias_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Describes an action to write data to an Amazon S3 bucket.
      struct S3Action
        include JSON::Serializable

        # The Amazon S3 bucket.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The object key. For more information, see Actions, resources, and condition keys for Amazon S3 .
        @[JSON::Field(key: "key")]
        getter key : String

        # The ARN of the IAM role that grants access.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The Amazon S3 canned ACL that controls access to the object identified by the object key. For more
        # information, see S3 canned ACLs .
        @[JSON::Field(key: "cannedAcl")]
        getter canned_acl : String?

        def initialize(
          @bucket_name : String,
          @key : String,
          @role_arn : String,
          @canned_acl : String? = nil
        )
        end
      end

      # Describes the location of updated firmware in S3.
      struct S3Destination
        include JSON::Serializable

        # The S3 bucket that contains the updated firmware.
        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The S3 prefix.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # The S3 location.
      struct S3Location
        include JSON::Serializable

        # The S3 bucket.
        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The S3 key.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The S3 bucket version.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @bucket : String? = nil,
          @key : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Describes an action to write a message to a Salesforce IoT Cloud Input Stream.
      struct SalesforceAction
        include JSON::Serializable

        # The token used to authenticate access to the Salesforce IoT Cloud Input Stream. The token is
        # available from the Salesforce IoT Cloud platform after creation of the Input Stream.
        @[JSON::Field(key: "token")]
        getter token : String

        # The URL exposed by the Salesforce IoT Cloud Input Stream. The URL is available from the Salesforce
        # IoT Cloud platform after creation of the Input Stream.
        @[JSON::Field(key: "url")]
        getter url : String

        def initialize(
          @token : String,
          @url : String
        )
        end
      end

      # A specific software bill of matrerials associated with a software package version.
      struct Sbom
        include JSON::Serializable

        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        def initialize(
          @s3_location : Types::S3Location? = nil
        )
        end
      end

      # A summary of the validation results for a specific software bill of materials (SBOM) attached to a
      # software package version.
      struct SbomValidationResultSummary
        include JSON::Serializable

        # The errorCode representing the validation failure error if the SBOM validation failed.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The errorMessage representing the validation failure error if the SBOM validation failed.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The name of the SBOM file.
        @[JSON::Field(key: "fileName")]
        getter file_name : String?

        # The end result of the SBOM validation.
        @[JSON::Field(key: "validationResult")]
        getter validation_result : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @file_name : String? = nil,
          @validation_result : String? = nil
        )
        end
      end

      # Information about the scheduled audit.
      struct ScheduledAuditMetadata
        include JSON::Serializable

        # The day of the month on which the scheduled audit is run (if the frequency is "MONTHLY"). If days
        # 29-31 are specified, and the month does not have that many days, the audit takes place on the "LAST"
        # day of the month.
        @[JSON::Field(key: "dayOfMonth")]
        getter day_of_month : String?

        # The day of the week on which the scheduled audit is run (if the frequency is "WEEKLY" or
        # "BIWEEKLY").
        @[JSON::Field(key: "dayOfWeek")]
        getter day_of_week : String?

        # How often the scheduled audit occurs.
        @[JSON::Field(key: "frequency")]
        getter frequency : String?

        # The ARN of the scheduled audit.
        @[JSON::Field(key: "scheduledAuditArn")]
        getter scheduled_audit_arn : String?

        # The name of the scheduled audit.
        @[JSON::Field(key: "scheduledAuditName")]
        getter scheduled_audit_name : String?

        def initialize(
          @day_of_month : String? = nil,
          @day_of_week : String? = nil,
          @frequency : String? = nil,
          @scheduled_audit_arn : String? = nil,
          @scheduled_audit_name : String? = nil
        )
        end
      end

      # Displays the next seven maintenance window occurrences and their start times.
      struct ScheduledJobRollout
        include JSON::Serializable

        # Displays the start times of the next seven maintenance window occurrences.
        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        def initialize(
          @start_time : String? = nil
        )
        end
      end

      # Specifies the date and time that a job will begin the rollout of the job document to all devices in
      # the target group. Additionally, you can specify the end behavior for each job execution when it
      # reaches the scheduled end time.
      struct SchedulingConfig
        include JSON::Serializable

        # Specifies the end behavior for all job executions after a job reaches the selected endTime . If
        # endTime is not selected when creating the job, then endBehavior does not apply.
        @[JSON::Field(key: "endBehavior")]
        getter end_behavior : String?

        # The time a job will stop rollout of the job document to all devices in the target group for a job.
        # The endTime must take place no later than two years from the current time and be scheduled a minimum
        # of thirty minutes from the current time. The minimum duration between startTime and endTime is
        # thirty minutes. The maximum duration between startTime and endTime is two years. The date and time
        # format for the endTime is YYYY-MM-DD for the date and HH:MM for the time. For more information on
        # the syntax for endTime when using an API command or the Command Line Interface, see Timestamp .
        @[JSON::Field(key: "endTime")]
        getter end_time : String?

        # An optional configuration within the SchedulingConfig to setup a recurring maintenance window with a
        # predetermined start time and duration for the rollout of a job document to all devices in a target
        # group for a job.
        @[JSON::Field(key: "maintenanceWindows")]
        getter maintenance_windows : Array(Types::MaintenanceWindow)?

        # The time a job will begin rollout of the job document to all devices in the target group for a job.
        # The startTime can be scheduled up to a year in advance and must be scheduled a minimum of thirty
        # minutes from the current time. The date and time format for the startTime is YYYY-MM-DD for the date
        # and HH:MM for the time. For more information on the syntax for startTime when using an API command
        # or the Command Line Interface, see Timestamp .
        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        def initialize(
          @end_behavior : String? = nil,
          @end_time : String? = nil,
          @maintenance_windows : Array(Types::MaintenanceWindow)? = nil,
          @start_time : String? = nil
        )
        end
      end

      struct SearchIndexRequest
        include JSON::Serializable

        # The search query string. For more information about the search query syntax, see Query syntax .
        @[JSON::Field(key: "queryString")]
        getter query_string : String

        # The search index name.
        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The maximum number of results to return per page at one time. This maximum number cannot exceed 100.
        # The response might contain fewer results but will never contain more. You can use nextToken to
        # retrieve the next set of results until nextToken returns NULL .
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token used to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The query version.
        @[JSON::Field(key: "queryVersion")]
        getter query_version : String?

        def initialize(
          @query_string : String,
          @index_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @query_version : String? = nil
        )
        end
      end

      struct SearchIndexResponse
        include JSON::Serializable

        # The token used to get the next set of results, or null if there are no additional results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The thing groups that match the search query.
        @[JSON::Field(key: "thingGroups")]
        getter thing_groups : Array(Types::ThingGroupDocument)?

        # The things that match the search query.
        @[JSON::Field(key: "things")]
        getter things : Array(Types::ThingDocument)?

        def initialize(
          @next_token : String? = nil,
          @thing_groups : Array(Types::ThingGroupDocument)? = nil,
          @things : Array(Types::ThingDocument)? = nil
        )
        end
      end

      # Identifying information for a Device Defender security profile.
      struct SecurityProfileIdentifier
        include JSON::Serializable

        # The ARN of the security profile.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name you've given to the security profile.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end

      # A target to which an alert is sent when a security profile behavior is violated.
      struct SecurityProfileTarget
        include JSON::Serializable

        # The ARN of the security profile.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Information about a security profile and the target associated with it.
      struct SecurityProfileTargetMapping
        include JSON::Serializable

        # Information that identifies the security profile.
        @[JSON::Field(key: "securityProfileIdentifier")]
        getter security_profile_identifier : Types::SecurityProfileIdentifier?

        # Information about the target (thing group) associated with the security profile.
        @[JSON::Field(key: "target")]
        getter target : Types::SecurityProfileTarget?

        def initialize(
          @security_profile_identifier : Types::SecurityProfileIdentifier? = nil,
          @target : Types::SecurityProfileTarget? = nil
        )
        end
      end

      # The server certificate configuration.
      struct ServerCertificateConfig
        include JSON::Serializable

        # A Boolean value that indicates whether Online Certificate Status Protocol (OCSP) server certificate
        # check is enabled or not. For more information, see Server certificate configuration for OCSP
        # stapling from Amazon Web Services IoT Core Developer Guide.
        @[JSON::Field(key: "enableOCSPCheck")]
        getter enable_ocsp_check : Bool?

        # The Amazon Resource Name (ARN) for an X.509 certificate stored in Amazon Web Services Certificate
        # Manager (ACM). If provided, Amazon Web Services IoT Core will use this certificate to validate the
        # signature of the received OCSP response. The OCSP responder must sign responses using either this
        # authorized responder certificate or the issuing certificate, depending on whether the ARN is
        # provided or not. The certificate must be in the same Amazon Web Services account and region as the
        # domain configuration.
        @[JSON::Field(key: "ocspAuthorizedResponderArn")]
        getter ocsp_authorized_responder_arn : String?

        # The Amazon Resource Name (ARN) for a Lambda function that acts as a Request for Comments (RFC)
        # 6960-compliant Online Certificate Status Protocol (OCSP) responder, supporting basic OCSP responses.
        # The Lambda function accepts a base64-encoding of the OCSP request in the Distinguished Encoding
        # Rules (DER) format. The Lambda function's response is also a base64-encoded OCSP response in the DER
        # format. The response size must not exceed 4 kilobytes (KiB). The Lambda function must be in the same
        # Amazon Web Services account and region as the domain configuration. For more information, see
        # Configuring server certificate OCSP for private endpoints in Amazon Web Services IoT Core from the
        # Amazon Web Services IoT Core developer guide.
        @[JSON::Field(key: "ocspLambdaArn")]
        getter ocsp_lambda_arn : String?

        def initialize(
          @enable_ocsp_check : Bool? = nil,
          @ocsp_authorized_responder_arn : String? = nil,
          @ocsp_lambda_arn : String? = nil
        )
        end
      end

      # An object that contains information about a server certificate.
      struct ServerCertificateSummary
        include JSON::Serializable

        # The ARN of the server certificate.
        @[JSON::Field(key: "serverCertificateArn")]
        getter server_certificate_arn : String?

        # The status of the server certificate.
        @[JSON::Field(key: "serverCertificateStatus")]
        getter server_certificate_status : String?

        # Details that explain the status of the server certificate.
        @[JSON::Field(key: "serverCertificateStatusDetail")]
        getter server_certificate_status_detail : String?

        def initialize(
          @server_certificate_arn : String? = nil,
          @server_certificate_status : String? = nil,
          @server_certificate_status_detail : String? = nil
        )
        end
      end

      # Service quota has been exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The service is temporarily unavailable.
      struct ServiceUnavailableException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct SetDefaultAuthorizerRequest
        include JSON::Serializable

        # The authorizer name.
        @[JSON::Field(key: "authorizerName")]
        getter authorizer_name : String

        def initialize(
          @authorizer_name : String
        )
        end
      end

      struct SetDefaultAuthorizerResponse
        include JSON::Serializable

        # The authorizer ARN.
        @[JSON::Field(key: "authorizerArn")]
        getter authorizer_arn : String?

        # The authorizer name.
        @[JSON::Field(key: "authorizerName")]
        getter authorizer_name : String?

        def initialize(
          @authorizer_arn : String? = nil,
          @authorizer_name : String? = nil
        )
        end
      end

      # The input for the SetDefaultPolicyVersion operation.
      struct SetDefaultPolicyVersionRequest
        include JSON::Serializable

        # The policy name.
        @[JSON::Field(key: "policyName")]
        getter policy_name : String

        # The policy version ID.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : String

        def initialize(
          @policy_name : String,
          @policy_version_id : String
        )
        end
      end

      # The input for the SetLoggingOptions operation.
      struct SetLoggingOptionsRequest
        include JSON::Serializable

        # The logging options payload.
        @[JSON::Field(key: "loggingOptionsPayload")]
        getter logging_options_payload : Types::LoggingOptionsPayload

        def initialize(
          @logging_options_payload : Types::LoggingOptionsPayload
        )
        end
      end

      struct SetV2LoggingLevelRequest
        include JSON::Serializable

        # The log level.
        @[JSON::Field(key: "logLevel")]
        getter log_level : String

        # The log target.
        @[JSON::Field(key: "logTarget")]
        getter log_target : Types::LogTarget

        def initialize(
          @log_level : String,
          @log_target : Types::LogTarget
        )
        end
      end

      struct SetV2LoggingOptionsRequest
        include JSON::Serializable

        # The default logging level.
        @[JSON::Field(key: "defaultLogLevel")]
        getter default_log_level : String?

        # If true all logs are disabled. The default is false.
        @[JSON::Field(key: "disableAllLogs")]
        getter disable_all_logs : Bool?

        # The list of event configurations that override account-level logging.
        @[JSON::Field(key: "eventConfigurations")]
        getter event_configurations : Array(Types::LogEventConfiguration)?

        # The ARN of the role that allows IoT to write to Cloudwatch logs.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @default_log_level : String? = nil,
          @disable_all_logs : Bool? = nil,
          @event_configurations : Array(Types::LogEventConfiguration)? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # For more information, see Signature Version 4 signing process .
      struct SigV4Authorization
        include JSON::Serializable

        # The ARN of the signing role.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The service name to use while signing with Sig V4.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The signing region.
        @[JSON::Field(key: "signingRegion")]
        getter signing_region : String

        def initialize(
          @role_arn : String,
          @service_name : String,
          @signing_region : String
        )
        end
      end

      # Describes the code-signing profile.
      struct SigningProfileParameter
        include JSON::Serializable

        # Certificate ARN.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The location of the code-signing certificate on your device.
        @[JSON::Field(key: "certificatePathOnDevice")]
        getter certificate_path_on_device : String?

        # The hardware platform of your device.
        @[JSON::Field(key: "platform")]
        getter platform : String?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_path_on_device : String? = nil,
          @platform : String? = nil
        )
        end
      end

      # Describes an action to publish to an Amazon SNS topic.
      struct SnsAction
        include JSON::Serializable

        # The ARN of the IAM role that grants access.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The ARN of the SNS topic.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String

        # (Optional) The message format of the message to publish. Accepted values are "JSON" and "RAW". The
        # default value of the attribute is "RAW". SNS uses this setting to determine if the payload should be
        # parsed and relevant platform-specific bits of the payload should be extracted. To read more about
        # SNS message formats, see https://docs.aws.amazon.com/sns/latest/dg/json-formats.html refer to their
        # official documentation.
        @[JSON::Field(key: "messageFormat")]
        getter message_format : String?

        def initialize(
          @role_arn : String,
          @target_arn : String,
          @message_format : String? = nil
        )
        end
      end

      # The Rule-SQL expression can't be parsed correctly.
      struct SqlParseException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes an action to publish data to an Amazon SQS queue.
      struct SqsAction
        include JSON::Serializable

        # The URL of the Amazon SQS queue.
        @[JSON::Field(key: "queueUrl")]
        getter queue_url : String

        # The ARN of the IAM role that grants access.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Specifies whether to use Base64 encoding.
        @[JSON::Field(key: "useBase64")]
        getter use_base64 : Bool?

        def initialize(
          @queue_url : String,
          @role_arn : String,
          @use_base64 : Bool? = nil
        )
        end
      end

      struct StartAuditMitigationActionsTaskRequest
        include JSON::Serializable

        # For an audit check, specifies which mitigation actions to apply. Those actions must be defined in
        # your Amazon Web Services accounts.
        @[JSON::Field(key: "auditCheckToActionsMapping")]
        getter audit_check_to_actions_mapping : Hash(String, Array(String))

        # Each audit mitigation task must have a unique client request token. If you try to start a new task
        # with the same token as a task that already exists, an exception occurs. If you omit this value, a
        # unique client request token is generated automatically.
        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String

        # Specifies the audit findings to which the mitigation actions are applied. You can apply them to a
        # type of audit check, to all findings from an audit, or to a specific set of findings.
        @[JSON::Field(key: "target")]
        getter target : Types::AuditMitigationActionsTaskTarget

        # A unique identifier for the task. You can use this identifier to check the status of the task or to
        # cancel it.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @audit_check_to_actions_mapping : Hash(String, Array(String)),
          @client_request_token : String,
          @target : Types::AuditMitigationActionsTaskTarget,
          @task_id : String
        )
        end
      end

      struct StartAuditMitigationActionsTaskResponse
        include JSON::Serializable

        # The unique identifier for the audit mitigation task. This matches the taskId that you specified in
        # the request.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @task_id : String? = nil
        )
        end
      end

      struct StartDetectMitigationActionsTaskRequest
        include JSON::Serializable

        # The actions to be performed when a device has unexpected behavior.
        @[JSON::Field(key: "actions")]
        getter actions : Array(String)

        # Each mitigation action task must have a unique client request token. If you try to create a new task
        # with the same token as a task that already exists, an exception occurs. If you omit this value,
        # Amazon Web Services SDKs will automatically generate a unique client request.
        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String

        # Specifies the ML Detect findings to which the mitigation actions are applied.
        @[JSON::Field(key: "target")]
        getter target : Types::DetectMitigationActionsTaskTarget

        # The unique identifier of the task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # Specifies to list only active violations.
        @[JSON::Field(key: "includeOnlyActiveViolations")]
        getter include_only_active_violations : Bool?

        # Specifies to include suppressed alerts.
        @[JSON::Field(key: "includeSuppressedAlerts")]
        getter include_suppressed_alerts : Bool?

        # Specifies the time period of which violation events occurred between.
        @[JSON::Field(key: "violationEventOccurrenceRange")]
        getter violation_event_occurrence_range : Types::ViolationEventOccurrenceRange?

        def initialize(
          @actions : Array(String),
          @client_request_token : String,
          @target : Types::DetectMitigationActionsTaskTarget,
          @task_id : String,
          @include_only_active_violations : Bool? = nil,
          @include_suppressed_alerts : Bool? = nil,
          @violation_event_occurrence_range : Types::ViolationEventOccurrenceRange? = nil
        )
        end
      end

      struct StartDetectMitigationActionsTaskResponse
        include JSON::Serializable

        # The unique identifier of the task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @task_id : String? = nil
        )
        end
      end

      struct StartOnDemandAuditTaskRequest
        include JSON::Serializable

        # Which checks are performed during the audit. The checks you specify must be enabled for your account
        # or an exception occurs. Use DescribeAccountAuditConfiguration to see the list of all checks,
        # including those that are enabled or UpdateAccountAuditConfiguration to select which checks are
        # enabled.
        @[JSON::Field(key: "targetCheckNames")]
        getter target_check_names : Array(String)

        def initialize(
          @target_check_names : Array(String)
        )
        end
      end

      struct StartOnDemandAuditTaskResponse
        include JSON::Serializable

        # The ID of the on-demand audit you started.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @task_id : String? = nil
        )
        end
      end

      # Information required to start a signing job.
      struct StartSigningJobParameter
        include JSON::Serializable

        # The location to write the code-signed file.
        @[JSON::Field(key: "destination")]
        getter destination : Types::Destination?

        # The code-signing profile name.
        @[JSON::Field(key: "signingProfileName")]
        getter signing_profile_name : String?

        # Describes the code-signing profile.
        @[JSON::Field(key: "signingProfileParameter")]
        getter signing_profile_parameter : Types::SigningProfileParameter?

        def initialize(
          @destination : Types::Destination? = nil,
          @signing_profile_name : String? = nil,
          @signing_profile_parameter : Types::SigningProfileParameter? = nil
        )
        end
      end

      struct StartThingRegistrationTaskRequest
        include JSON::Serializable

        # The S3 bucket that contains the input file.
        @[JSON::Field(key: "inputFileBucket")]
        getter input_file_bucket : String

        # The name of input file within the S3 bucket. This file contains a newline delimited JSON file. Each
        # line contains the parameter values to provision one device (thing).
        @[JSON::Field(key: "inputFileKey")]
        getter input_file_key : String

        # The IAM role ARN that grants permission the input file.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The provisioning template.
        @[JSON::Field(key: "templateBody")]
        getter template_body : String

        def initialize(
          @input_file_bucket : String,
          @input_file_key : String,
          @role_arn : String,
          @template_body : String
        )
        end
      end

      struct StartThingRegistrationTaskResponse
        include JSON::Serializable

        # The bulk thing provisioning task ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @task_id : String? = nil
        )
        end
      end

      # A statistical ranking (percentile) that indicates a threshold value by which a behavior is
      # determined to be in compliance or in violation of the behavior.
      struct StatisticalThreshold
        include JSON::Serializable

        # The percentile that resolves to a threshold value by which compliance with a behavior is determined.
        # Metrics are collected over the specified period ( durationSeconds ) from all reporting devices in
        # your account and statistical ranks are calculated. Then, the measurements from a device are
        # collected over the same period. If the accumulated measurements from the device fall above or below
        # ( comparisonOperator ) the value associated with the percentile specified, then the device is
        # considered to be in compliance with the behavior, otherwise a violation occurs.
        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        def initialize(
          @statistic : String? = nil
        )
        end
      end

      # A map of key-value pairs for all supported statistics. For issues with missing or unexpected values
      # for this API, consult Fleet indexing troubleshooting guide .
      struct Statistics
        include JSON::Serializable

        # The average of the aggregated field values.
        @[JSON::Field(key: "average")]
        getter average : Float64?

        # The count of things that match the query string criteria and contain a valid aggregation field
        # value.
        @[JSON::Field(key: "count")]
        getter count : Int32?

        # The maximum aggregated field value.
        @[JSON::Field(key: "maximum")]
        getter maximum : Float64?

        # The minimum aggregated field value.
        @[JSON::Field(key: "minimum")]
        getter minimum : Float64?

        # The standard deviation of the aggregated field values.
        @[JSON::Field(key: "stdDeviation")]
        getter std_deviation : Float64?

        # The sum of the aggregated field values.
        @[JSON::Field(key: "sum")]
        getter sum : Float64?

        # The sum of the squares of the aggregated field values.
        @[JSON::Field(key: "sumOfSquares")]
        getter sum_of_squares : Float64?

        # The variance of the aggregated field values.
        @[JSON::Field(key: "variance")]
        getter variance : Float64?

        def initialize(
          @average : Float64? = nil,
          @count : Int32? = nil,
          @maximum : Float64? = nil,
          @minimum : Float64? = nil,
          @std_deviation : Float64? = nil,
          @sum : Float64? = nil,
          @sum_of_squares : Float64? = nil,
          @variance : Float64? = nil
        )
        end
      end

      # Provide additional context about the status of a command execution using a reason code and
      # description.
      struct StatusReason
        include JSON::Serializable

        # A code that provides additional context for the command execution status.
        @[JSON::Field(key: "reasonCode")]
        getter reason_code : String

        # A literal string for devices to optionally provide additional information about the reason code for
        # a command execution status.
        @[JSON::Field(key: "reasonDescription")]
        getter reason_description : String?

        def initialize(
          @reason_code : String,
          @reason_description : String? = nil
        )
        end
      end

      # Starts execution of a Step Functions state machine.
      struct StepFunctionsAction
        include JSON::Serializable

        # The ARN of the role that grants IoT permission to start execution of a state machine
        # ("Action":"states:StartExecution").
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of the Step Functions state machine whose execution will be started.
        @[JSON::Field(key: "stateMachineName")]
        getter state_machine_name : String

        # (Optional) A name will be given to the state machine execution consisting of this prefix followed by
        # a UUID. Step Functions automatically creates a unique name for each state machine execution if one
        # is not provided.
        @[JSON::Field(key: "executionNamePrefix")]
        getter execution_name_prefix : String?

        def initialize(
          @role_arn : String,
          @state_machine_name : String,
          @execution_name_prefix : String? = nil
        )
        end
      end

      struct StopThingRegistrationTaskRequest
        include JSON::Serializable

        # The bulk thing provisioning task ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end

      struct StopThingRegistrationTaskResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a group of files that can be streamed.
      struct Stream
        include JSON::Serializable

        # The ID of a file associated with a stream.
        @[JSON::Field(key: "fileId")]
        getter file_id : Int32?

        # The stream ID.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        def initialize(
          @file_id : Int32? = nil,
          @stream_id : String? = nil
        )
        end
      end

      # Represents a file to stream.
      struct StreamFile
        include JSON::Serializable

        # The file ID.
        @[JSON::Field(key: "fileId")]
        getter file_id : Int32?

        # The location of the file in S3.
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        def initialize(
          @file_id : Int32? = nil,
          @s3_location : Types::S3Location? = nil
        )
        end
      end

      # Information about a stream.
      struct StreamInfo
        include JSON::Serializable

        # The date when the stream was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the stream.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The files to stream.
        @[JSON::Field(key: "files")]
        getter files : Array(Types::StreamFile)?

        # The date when the stream was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # An IAM role IoT assumes to access your S3 files.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The stream ARN.
        @[JSON::Field(key: "streamArn")]
        getter stream_arn : String?

        # The stream ID.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        # The stream version.
        @[JSON::Field(key: "streamVersion")]
        getter stream_version : Int32?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @files : Array(Types::StreamFile)? = nil,
          @last_updated_at : Time? = nil,
          @role_arn : String? = nil,
          @stream_arn : String? = nil,
          @stream_id : String? = nil,
          @stream_version : Int32? = nil
        )
        end
      end

      # A summary of a stream.
      struct StreamSummary
        include JSON::Serializable

        # A description of the stream.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The stream ARN.
        @[JSON::Field(key: "streamArn")]
        getter stream_arn : String?

        # The stream ID.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        # The stream version.
        @[JSON::Field(key: "streamVersion")]
        getter stream_version : Int32?

        def initialize(
          @description : String? = nil,
          @stream_arn : String? = nil,
          @stream_id : String? = nil,
          @stream_version : Int32? = nil
        )
        end
      end

      # A set of key/value pairs that are used to manage the resource.
      struct Tag
        include JSON::Serializable

        # The tag's key.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The tag's value.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The new or modified tags for the resource.
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

      # This exception occurs if you attempt to start a task with the same task-id as an existing task but
      # with a different clientRequestToken.
      struct TaskAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Statistics for the checks performed during the audit.
      struct TaskStatistics
        include JSON::Serializable

        # The number of checks that did not run because the audit was canceled.
        @[JSON::Field(key: "canceledChecks")]
        getter canceled_checks : Int32?

        # The number of checks that found compliant resources.
        @[JSON::Field(key: "compliantChecks")]
        getter compliant_checks : Int32?

        # The number of checks.
        @[JSON::Field(key: "failedChecks")]
        getter failed_checks : Int32?

        # The number of checks in progress.
        @[JSON::Field(key: "inProgressChecks")]
        getter in_progress_checks : Int32?

        # The number of checks that found noncompliant resources.
        @[JSON::Field(key: "nonCompliantChecks")]
        getter non_compliant_checks : Int32?

        # The number of checks in this audit.
        @[JSON::Field(key: "totalChecks")]
        getter total_checks : Int32?

        # The number of checks waiting for data collection.
        @[JSON::Field(key: "waitingForDataCollectionChecks")]
        getter waiting_for_data_collection_checks : Int32?

        def initialize(
          @canceled_checks : Int32? = nil,
          @compliant_checks : Int32? = nil,
          @failed_checks : Int32? = nil,
          @in_progress_checks : Int32? = nil,
          @non_compliant_checks : Int32? = nil,
          @total_checks : Int32? = nil,
          @waiting_for_data_collection_checks : Int32? = nil
        )
        end
      end

      # Provides summary counts of how many tasks for findings are in a particular state. This information
      # is included in the response from DescribeAuditMitigationActionsTask.
      struct TaskStatisticsForAuditCheck
        include JSON::Serializable

        # The number of findings to which the mitigation action task was canceled when applied.
        @[JSON::Field(key: "canceledFindingsCount")]
        getter canceled_findings_count : Int64?

        # The number of findings for which at least one of the actions failed when applied.
        @[JSON::Field(key: "failedFindingsCount")]
        getter failed_findings_count : Int64?

        # The number of findings skipped because of filter conditions provided in the parameters to the
        # command.
        @[JSON::Field(key: "skippedFindingsCount")]
        getter skipped_findings_count : Int64?

        # The number of findings for which all mitigation actions succeeded when applied.
        @[JSON::Field(key: "succeededFindingsCount")]
        getter succeeded_findings_count : Int64?

        # The total number of findings to which a task is being applied.
        @[JSON::Field(key: "totalFindingsCount")]
        getter total_findings_count : Int64?

        def initialize(
          @canceled_findings_count : Int64? = nil,
          @failed_findings_count : Int64? = nil,
          @skipped_findings_count : Int64? = nil,
          @succeeded_findings_count : Int64? = nil,
          @total_findings_count : Int64? = nil
        )
        end
      end

      # Performs an aggregation that will return a list of buckets. The list of buckets is a ranked list of
      # the number of occurrences of an aggregation field value.
      struct TermsAggregation
        include JSON::Serializable

        # The number of buckets to return in the response. Default to 10.
        @[JSON::Field(key: "maxBuckets")]
        getter max_buckets : Int32?

        def initialize(
          @max_buckets : Int32? = nil
        )
        end
      end

      struct TestAuthorizationRequest
        include JSON::Serializable

        # A list of authorization info objects. Simulating authorization will create a response for each
        # authInfo object in the list.
        @[JSON::Field(key: "authInfos")]
        getter auth_infos : Array(Types::AuthInfo)

        # The MQTT client ID.
        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        # The Cognito identity pool ID.
        @[JSON::Field(key: "cognitoIdentityPoolId")]
        getter cognito_identity_pool_id : String?

        # When testing custom authorization, the policies specified here are treated as if they are attached
        # to the principal being authorized.
        @[JSON::Field(key: "policyNamesToAdd")]
        getter policy_names_to_add : Array(String)?

        # When testing custom authorization, the policies specified here are treated as if they are not
        # attached to the principal being authorized.
        @[JSON::Field(key: "policyNamesToSkip")]
        getter policy_names_to_skip : Array(String)?

        # The principal. Valid principals are CertificateArn (arn:aws:iot: region : accountId :cert/
        # certificateId ) and CognitoId ( region : id ).
        @[JSON::Field(key: "principal")]
        getter principal : String?

        def initialize(
          @auth_infos : Array(Types::AuthInfo),
          @client_id : String? = nil,
          @cognito_identity_pool_id : String? = nil,
          @policy_names_to_add : Array(String)? = nil,
          @policy_names_to_skip : Array(String)? = nil,
          @principal : String? = nil
        )
        end
      end

      struct TestAuthorizationResponse
        include JSON::Serializable

        # The authentication results.
        @[JSON::Field(key: "authResults")]
        getter auth_results : Array(Types::AuthResult)?

        def initialize(
          @auth_results : Array(Types::AuthResult)? = nil
        )
        end
      end

      struct TestInvokeAuthorizerRequest
        include JSON::Serializable

        # The custom authorizer name.
        @[JSON::Field(key: "authorizerName")]
        getter authorizer_name : String

        # Specifies a test HTTP authorization request.
        @[JSON::Field(key: "httpContext")]
        getter http_context : Types::HttpContext?

        # Specifies a test MQTT authorization request.
        @[JSON::Field(key: "mqttContext")]
        getter mqtt_context : Types::MqttContext?

        # Specifies a test TLS authorization request.
        @[JSON::Field(key: "tlsContext")]
        getter tls_context : Types::TlsContext?

        # The token returned by your custom authentication service.
        @[JSON::Field(key: "token")]
        getter token : String?

        # The signature made with the token and your custom authentication service's private key. This value
        # must be Base-64-encoded.
        @[JSON::Field(key: "tokenSignature")]
        getter token_signature : String?

        def initialize(
          @authorizer_name : String,
          @http_context : Types::HttpContext? = nil,
          @mqtt_context : Types::MqttContext? = nil,
          @tls_context : Types::TlsContext? = nil,
          @token : String? = nil,
          @token_signature : String? = nil
        )
        end
      end

      struct TestInvokeAuthorizerResponse
        include JSON::Serializable

        # The number of seconds after which the connection is terminated.
        @[JSON::Field(key: "disconnectAfterInSeconds")]
        getter disconnect_after_in_seconds : Int32?

        # True if the token is authenticated, otherwise false.
        @[JSON::Field(key: "isAuthenticated")]
        getter is_authenticated : Bool?

        # IAM policy documents.
        @[JSON::Field(key: "policyDocuments")]
        getter policy_documents : Array(String)?

        # The principal ID.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        # The number of seconds after which the temporary credentials are refreshed.
        @[JSON::Field(key: "refreshAfterInSeconds")]
        getter refresh_after_in_seconds : Int32?

        def initialize(
          @disconnect_after_in_seconds : Int32? = nil,
          @is_authenticated : Bool? = nil,
          @policy_documents : Array(String)? = nil,
          @principal_id : String? = nil,
          @refresh_after_in_seconds : Int32? = nil
        )
        end
      end

      # The properties of the thing, including thing name, thing type name, and a list of thing attributes.
      struct ThingAttribute
        include JSON::Serializable

        # A list of thing attributes which are name-value pairs.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The thing ARN.
        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        # The name of the thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        # The name of the thing type, if the thing has been associated with a type.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String?

        # The version of the thing record in the registry.
        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @thing_arn : String? = nil,
          @thing_name : String? = nil,
          @thing_type_name : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      # The connectivity status of the thing.
      struct ThingConnectivity
        include JSON::Serializable

        # True if the thing is connected to the Amazon Web Services IoT Core service; false if it is not
        # connected.
        @[JSON::Field(key: "connected")]
        getter connected : Bool?

        # The reason why the client is disconnected. If the thing has been disconnected for approximately an
        # hour, the disconnectReason value might be missing.
        @[JSON::Field(key: "disconnectReason")]
        getter disconnect_reason : String?

        # The epoch time (in milliseconds) when the thing last connected or disconnected. If the thing has
        # been disconnected for approximately an hour, the time value might be missing.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Int64?

        def initialize(
          @connected : Bool? = nil,
          @disconnect_reason : String? = nil,
          @timestamp : Int64? = nil
        )
        end
      end

      # The thing search index document.
      struct ThingDocument
        include JSON::Serializable

        # The attributes.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # Indicates whether the thing is connected to the Amazon Web Services IoT Core service.
        @[JSON::Field(key: "connectivity")]
        getter connectivity : Types::ThingConnectivity?

        # Contains Device Defender data. For more information about Device Defender, see Device Defender .
        @[JSON::Field(key: "deviceDefender")]
        getter device_defender : String?

        # The unnamed shadow and named shadow. For more information about shadows, see IoT Device Shadow
        # service.
        @[JSON::Field(key: "shadow")]
        getter shadow : String?

        # Thing group and billing group names.
        @[JSON::Field(key: "thingGroupNames")]
        getter thing_group_names : Array(String)?

        # The thing ID.
        @[JSON::Field(key: "thingId")]
        getter thing_id : String?

        # The thing name.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        # The thing type name.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @connectivity : Types::ThingConnectivity? = nil,
          @device_defender : String? = nil,
          @shadow : String? = nil,
          @thing_group_names : Array(String)? = nil,
          @thing_id : String? = nil,
          @thing_name : String? = nil,
          @thing_type_name : String? = nil
        )
        end
      end

      # The thing group search index document.
      struct ThingGroupDocument
        include JSON::Serializable

        # The thing group attributes.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # Parent group names.
        @[JSON::Field(key: "parentGroupNames")]
        getter parent_group_names : Array(String)?

        # The thing group description.
        @[JSON::Field(key: "thingGroupDescription")]
        getter thing_group_description : String?

        # The thing group ID.
        @[JSON::Field(key: "thingGroupId")]
        getter thing_group_id : String?

        # The thing group name.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @parent_group_names : Array(String)? = nil,
          @thing_group_description : String? = nil,
          @thing_group_id : String? = nil,
          @thing_group_name : String? = nil
        )
        end
      end

      # Thing group indexing configuration.
      struct ThingGroupIndexingConfiguration
        include JSON::Serializable

        # Thing group indexing mode.
        @[JSON::Field(key: "thingGroupIndexingMode")]
        getter thing_group_indexing_mode : String

        # A list of thing group fields to index. This list cannot contain any managed fields. Use the
        # GetIndexingConfiguration API to get a list of managed fields. Contains custom field names and their
        # data type.
        @[JSON::Field(key: "customFields")]
        getter custom_fields : Array(Types::Field)?

        # Contains fields that are indexed and whose types are already known by the Fleet Indexing service.
        # This is an optional field. For more information, see Managed fields in the Amazon Web Services IoT
        # Core Developer Guide . You can't modify managed fields by updating fleet indexing configuration.
        @[JSON::Field(key: "managedFields")]
        getter managed_fields : Array(Types::Field)?

        def initialize(
          @thing_group_indexing_mode : String,
          @custom_fields : Array(Types::Field)? = nil,
          @managed_fields : Array(Types::Field)? = nil
        )
        end
      end

      # Thing group metadata.
      struct ThingGroupMetadata
        include JSON::Serializable

        # The UNIX timestamp of when the thing group was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The parent thing group name.
        @[JSON::Field(key: "parentGroupName")]
        getter parent_group_name : String?

        # The root parent thing group.
        @[JSON::Field(key: "rootToParentThingGroups")]
        getter root_to_parent_thing_groups : Array(Types::GroupNameAndArn)?

        def initialize(
          @creation_date : Time? = nil,
          @parent_group_name : String? = nil,
          @root_to_parent_thing_groups : Array(Types::GroupNameAndArn)? = nil
        )
        end
      end

      # Thing group properties.
      struct ThingGroupProperties
        include JSON::Serializable

        # The thing group attributes in JSON format.
        @[JSON::Field(key: "attributePayload")]
        getter attribute_payload : Types::AttributePayload?

        # The thing group description.
        @[JSON::Field(key: "thingGroupDescription")]
        getter thing_group_description : String?

        def initialize(
          @attribute_payload : Types::AttributePayload? = nil,
          @thing_group_description : String? = nil
        )
        end
      end

      # The thing indexing configuration. For more information, see Managing Thing Indexing .
      struct ThingIndexingConfiguration
        include JSON::Serializable

        # Thing indexing mode. Valid values are: REGISTRY – Your thing index contains registry data only.
        # REGISTRY_AND_SHADOW - Your thing index contains registry and shadow data. OFF - Thing indexing is
        # disabled.
        @[JSON::Field(key: "thingIndexingMode")]
        getter thing_indexing_mode : String

        # Contains custom field names and their data type.
        @[JSON::Field(key: "customFields")]
        getter custom_fields : Array(Types::Field)?

        # Device Defender indexing mode. Valid values are: VIOLATIONS – Your thing index contains Device
        # Defender violations. To enable Device Defender indexing, deviceDefenderIndexingMode must not be set
        # to OFF. OFF - Device Defender indexing is disabled. For more information about Device Defender
        # violations, see Device Defender Detect.
        @[JSON::Field(key: "deviceDefenderIndexingMode")]
        getter device_defender_indexing_mode : String?

        # Provides additional selections for named shadows and geolocation data. To add named shadows to your
        # fleet indexing configuration, set namedShadowIndexingMode to be ON and specify your shadow names in
        # namedShadowNames filter. To add geolocation data to your fleet indexing configuration: If you store
        # geolocation data in a class/unnamed shadow, set thingIndexingMode to be REGISTRY_AND_SHADOW and
        # specify your geolocation data in geoLocations filter. If you store geolocation data in a named
        # shadow, set namedShadowIndexingMode to be ON , add the shadow name in namedShadowNames filter, and
        # specify your geolocation data in geoLocations filter. For more information, see Managing fleet
        # indexing .
        @[JSON::Field(key: "filter")]
        getter filter : Types::IndexingFilter?

        # Contains fields that are indexed and whose types are already known by the Fleet Indexing service.
        # This is an optional field. For more information, see Managed fields in the Amazon Web Services IoT
        # Core Developer Guide . You can't modify managed fields by updating fleet indexing configuration.
        @[JSON::Field(key: "managedFields")]
        getter managed_fields : Array(Types::Field)?

        # Named shadow indexing mode. Valid values are: ON – Your thing index contains named shadow. To enable
        # thing named shadow indexing, namedShadowIndexingMode must not be set to OFF. OFF - Named shadow
        # indexing is disabled. For more information about Shadows, see IoT Device Shadow service.
        @[JSON::Field(key: "namedShadowIndexingMode")]
        getter named_shadow_indexing_mode : String?

        # Thing connectivity indexing mode. Valid values are: STATUS – Your thing index contains connectivity
        # status. To enable thing connectivity indexing, thingIndexMode must not be set to OFF. OFF - Thing
        # connectivity status indexing is disabled.
        @[JSON::Field(key: "thingConnectivityIndexingMode")]
        getter thing_connectivity_indexing_mode : String?

        def initialize(
          @thing_indexing_mode : String,
          @custom_fields : Array(Types::Field)? = nil,
          @device_defender_indexing_mode : String? = nil,
          @filter : Types::IndexingFilter? = nil,
          @managed_fields : Array(Types::Field)? = nil,
          @named_shadow_indexing_mode : String? = nil,
          @thing_connectivity_indexing_mode : String? = nil
        )
        end
      end

      # An object that represents the principal and the type of relation it has with the thing.
      struct ThingPrincipalObject
        include JSON::Serializable

        # The principal of the thing principal object.
        @[JSON::Field(key: "principal")]
        getter principal : String

        # The type of the relation you want to specify when you attach a principal to a thing. The value
        # defaults to NON_EXCLUSIVE_THING . EXCLUSIVE_THING - Attaches the specified principal to the
        # specified thing, exclusively. The thing will be the only thing that’s attached to the principal.
        # NON_EXCLUSIVE_THING - Attaches the specified principal to the specified thing. Multiple things can
        # be attached to the principal.
        @[JSON::Field(key: "thingPrincipalType")]
        getter thing_principal_type : String?

        def initialize(
          @principal : String,
          @thing_principal_type : String? = nil
        )
        end
      end

      # The definition of the thing type, including thing type name and description.
      struct ThingTypeDefinition
        include JSON::Serializable

        # The thing type ARN.
        @[JSON::Field(key: "thingTypeArn")]
        getter thing_type_arn : String?

        # The ThingTypeMetadata contains additional information about the thing type including: creation date
        # and time, a value indicating whether the thing type is deprecated, and a date and time when it was
        # deprecated.
        @[JSON::Field(key: "thingTypeMetadata")]
        getter thing_type_metadata : Types::ThingTypeMetadata?

        # The name of the thing type.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String?

        # The ThingTypeProperties for the thing type.
        @[JSON::Field(key: "thingTypeProperties")]
        getter thing_type_properties : Types::ThingTypeProperties?

        def initialize(
          @thing_type_arn : String? = nil,
          @thing_type_metadata : Types::ThingTypeMetadata? = nil,
          @thing_type_name : String? = nil,
          @thing_type_properties : Types::ThingTypeProperties? = nil
        )
        end
      end

      # The ThingTypeMetadata contains additional information about the thing type including: creation date
      # and time, a value indicating whether the thing type is deprecated, and a date and time when time was
      # deprecated.
      struct ThingTypeMetadata
        include JSON::Serializable

        # The date and time when the thing type was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # Whether the thing type is deprecated. If true , no new things could be associated with this type.
        @[JSON::Field(key: "deprecated")]
        getter deprecated : Bool?

        # The date and time when the thing type was deprecated.
        @[JSON::Field(key: "deprecationDate")]
        getter deprecation_date : Time?

        def initialize(
          @creation_date : Time? = nil,
          @deprecated : Bool? = nil,
          @deprecation_date : Time? = nil
        )
        end
      end

      # The ThingTypeProperties contains information about the thing type including: a thing type
      # description, and a list of searchable thing attribute names.
      struct ThingTypeProperties
        include JSON::Serializable

        # The configuration to add user-defined properties to enrich MQTT 5 messages.
        @[JSON::Field(key: "mqtt5Configuration")]
        getter mqtt5_configuration : Types::Mqtt5Configuration?

        # A list of searchable thing attribute names.
        @[JSON::Field(key: "searchableAttributes")]
        getter searchable_attributes : Array(String)?

        # The description of the thing type.
        @[JSON::Field(key: "thingTypeDescription")]
        getter thing_type_description : String?

        def initialize(
          @mqtt5_configuration : Types::Mqtt5Configuration? = nil,
          @searchable_attributes : Array(String)? = nil,
          @thing_type_description : String? = nil
        )
        end
      end

      # The rate exceeds the limit.
      struct ThrottlingException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A filter that can be used to list command executions for a device that started or completed before
      # or after a particular date and time.
      struct TimeFilter
        include JSON::Serializable

        # Filter to display command executions that started or completed only after a particular date and
        # time.
        @[JSON::Field(key: "after")]
        getter after : String?

        # Filter to display command executions that started or completed only before a particular date and
        # time.
        @[JSON::Field(key: "before")]
        getter before : String?

        def initialize(
          @after : String? = nil,
          @before : String? = nil
        )
        end
      end

      # Specifies the amount of time each device has to finish its execution of the job. A timer is started
      # when the job execution status is set to IN_PROGRESS . If the job execution status is not set to
      # another terminal state before the timer expires, it will be automatically set to TIMED_OUT .
      struct TimeoutConfig
        include JSON::Serializable

        # Specifies the amount of time, in minutes, this device has to finish execution of this job. The
        # timeout interval can be anywhere between 1 minute and 7 days (1 to 10080 minutes). The in progress
        # timer can't be updated and will apply to all job executions for the job. Whenever a job execution
        # remains in the IN_PROGRESS status for longer than this interval, the job execution will fail and
        # switch to the terminal TIMED_OUT status.
        @[JSON::Field(key: "inProgressTimeoutInMinutes")]
        getter in_progress_timeout_in_minutes : Int64?

        def initialize(
          @in_progress_timeout_in_minutes : Int64? = nil
        )
        end
      end

      # The Timestream rule action writes attributes (measures) from an MQTT message into an Amazon
      # Timestream table. For more information, see the Timestream topic rule action documentation.
      struct TimestreamAction
        include JSON::Serializable

        # The name of an Amazon Timestream database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # Metadata attributes of the time series that are written in each measure record.
        @[JSON::Field(key: "dimensions")]
        getter dimensions : Array(Types::TimestreamDimension)

        # The ARN of the role that grants permission to write to the Amazon Timestream database table.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of the database table into which to write the measure records.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # Specifies an application-defined value to replace the default value assigned to the Timestream
        # record's timestamp in the time column. You can use this property to specify the value and the
        # precision of the Timestream record's timestamp. You can specify a value from the message payload or
        # a value computed by a substitution template. If omitted, the topic rule action assigns the
        # timestamp, in milliseconds, at the time it processed the rule.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Types::TimestreamTimestamp?

        def initialize(
          @database_name : String,
          @dimensions : Array(Types::TimestreamDimension),
          @role_arn : String,
          @table_name : String,
          @timestamp : Types::TimestreamTimestamp? = nil
        )
        end
      end

      # Metadata attributes of the time series that are written in each measure record.
      struct TimestreamDimension
        include JSON::Serializable

        # The metadata dimension name. This is the name of the column in the Amazon Timestream database table
        # record. Dimensions cannot be named: measure_name , measure_value , or time . These names are
        # reserved. Dimension names cannot start with ts_ or measure_value and they cannot contain the colon (
        # : ) character.
        @[JSON::Field(key: "name")]
        getter name : String

        # The value to write in this column of the database record.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # Describes how to interpret an application-defined timestamp value from an MQTT message payload and
      # the precision of that value.
      struct TimestreamTimestamp
        include JSON::Serializable

        # The precision of the timestamp value that results from the expression described in value . Valid
        # values: SECONDS | MILLISECONDS | MICROSECONDS | NANOSECONDS . The default is MILLISECONDS .
        @[JSON::Field(key: "unit")]
        getter unit : String

        # An expression that returns a long epoch time value.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @unit : String,
          @value : String
        )
        end
      end

      # An object that specifies the TLS configuration for a domain.
      struct TlsConfig
        include JSON::Serializable

        # The security policy for a domain configuration. For more information, see Security policies in the
        # Amazon Web Services IoT Core developer guide .
        @[JSON::Field(key: "securityPolicy")]
        getter security_policy : String?

        def initialize(
          @security_policy : String? = nil
        )
        end
      end

      # Specifies the TLS context to use for the test authorizer request.
      struct TlsContext
        include JSON::Serializable

        # The value of the serverName key in a TLS authorization request.
        @[JSON::Field(key: "serverName")]
        getter server_name : String?

        def initialize(
          @server_name : String? = nil
        )
        end
      end

      # Describes a rule.
      struct TopicRule
        include JSON::Serializable

        # The actions associated with the rule.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::Action)?

        # The version of the SQL rules engine to use when evaluating the rule.
        @[JSON::Field(key: "awsIotSqlVersion")]
        getter aws_iot_sql_version : String?

        # The date and time the rule was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The action to perform when an error occurs.
        @[JSON::Field(key: "errorAction")]
        getter error_action : Types::Action?

        # Specifies whether the rule is disabled.
        @[JSON::Field(key: "ruleDisabled")]
        getter rule_disabled : Bool?

        # The name of the rule.
        @[JSON::Field(key: "ruleName")]
        getter rule_name : String?

        # The SQL statement used to query the topic. When using a SQL query with multiple lines, be sure to
        # escape the newline characters.
        @[JSON::Field(key: "sql")]
        getter sql : String?

        def initialize(
          @actions : Array(Types::Action)? = nil,
          @aws_iot_sql_version : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @error_action : Types::Action? = nil,
          @rule_disabled : Bool? = nil,
          @rule_name : String? = nil,
          @sql : String? = nil
        )
        end
      end

      # A topic rule destination.
      struct TopicRuleDestination
        include JSON::Serializable

        # The topic rule destination URL.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time when the topic rule destination was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Properties of the HTTP URL.
        @[JSON::Field(key: "httpUrlProperties")]
        getter http_url_properties : Types::HttpUrlDestinationProperties?

        # The date and time when the topic rule destination was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The status of the topic rule destination. Valid values are: IN_PROGRESS A topic rule destination was
        # created but has not been confirmed. You can set status to IN_PROGRESS by calling
        # UpdateTopicRuleDestination . Calling UpdateTopicRuleDestination causes a new confirmation challenge
        # to be sent to your confirmation endpoint. ENABLED Confirmation was completed, and traffic to this
        # destination is allowed. You can set status to DISABLED by calling UpdateTopicRuleDestination .
        # DISABLED Confirmation was completed, and traffic to this destination is not allowed. You can set
        # status to ENABLED by calling UpdateTopicRuleDestination . ERROR Confirmation could not be completed,
        # for example if the confirmation timed out. You can call GetTopicRuleDestination for details about
        # the error. You can set status to IN_PROGRESS by calling UpdateTopicRuleDestination . Calling
        # UpdateTopicRuleDestination causes a new confirmation challenge to be sent to your confirmation
        # endpoint.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Additional details or reason why the topic rule destination is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # Properties of the virtual private cloud (VPC) connection.
        @[JSON::Field(key: "vpcProperties")]
        getter vpc_properties : Types::VpcDestinationProperties?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @http_url_properties : Types::HttpUrlDestinationProperties? = nil,
          @last_updated_at : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @vpc_properties : Types::VpcDestinationProperties? = nil
        )
        end
      end

      # Configuration of the topic rule destination.
      struct TopicRuleDestinationConfiguration
        include JSON::Serializable

        # Configuration of the HTTP URL.
        @[JSON::Field(key: "httpUrlConfiguration")]
        getter http_url_configuration : Types::HttpUrlDestinationConfiguration?

        # Configuration of the virtual private cloud (VPC) connection.
        @[JSON::Field(key: "vpcConfiguration")]
        getter vpc_configuration : Types::VpcDestinationConfiguration?

        def initialize(
          @http_url_configuration : Types::HttpUrlDestinationConfiguration? = nil,
          @vpc_configuration : Types::VpcDestinationConfiguration? = nil
        )
        end
      end

      # Information about the topic rule destination.
      struct TopicRuleDestinationSummary
        include JSON::Serializable

        # The topic rule destination ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time when the topic rule destination was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Information about the HTTP URL.
        @[JSON::Field(key: "httpUrlSummary")]
        getter http_url_summary : Types::HttpUrlDestinationSummary?

        # The date and time when the topic rule destination was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The status of the topic rule destination. Valid values are: IN_PROGRESS A topic rule destination was
        # created but has not been confirmed. You can set status to IN_PROGRESS by calling
        # UpdateTopicRuleDestination . Calling UpdateTopicRuleDestination causes a new confirmation challenge
        # to be sent to your confirmation endpoint. ENABLED Confirmation was completed, and traffic to this
        # destination is allowed. You can set status to DISABLED by calling UpdateTopicRuleDestination .
        # DISABLED Confirmation was completed, and traffic to this destination is not allowed. You can set
        # status to ENABLED by calling UpdateTopicRuleDestination . ERROR Confirmation could not be completed,
        # for example if the confirmation timed out. You can call GetTopicRuleDestination for details about
        # the error. You can set status to IN_PROGRESS by calling UpdateTopicRuleDestination . Calling
        # UpdateTopicRuleDestination causes a new confirmation challenge to be sent to your confirmation
        # endpoint.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason the topic rule destination is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # Information about the virtual private cloud (VPC) connection.
        @[JSON::Field(key: "vpcDestinationSummary")]
        getter vpc_destination_summary : Types::VpcDestinationSummary?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @http_url_summary : Types::HttpUrlDestinationSummary? = nil,
          @last_updated_at : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @vpc_destination_summary : Types::VpcDestinationSummary? = nil
        )
        end
      end

      # Describes a rule.
      struct TopicRuleListItem
        include JSON::Serializable

        # The date and time the rule was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The rule ARN.
        @[JSON::Field(key: "ruleArn")]
        getter rule_arn : String?

        # Specifies whether the rule is disabled.
        @[JSON::Field(key: "ruleDisabled")]
        getter rule_disabled : Bool?

        # The name of the rule.
        @[JSON::Field(key: "ruleName")]
        getter rule_name : String?

        # The pattern for the topic names that apply.
        @[JSON::Field(key: "topicPattern")]
        getter topic_pattern : String?

        def initialize(
          @created_at : Time? = nil,
          @rule_arn : String? = nil,
          @rule_disabled : Bool? = nil,
          @rule_name : String? = nil,
          @topic_pattern : String? = nil
        )
        end
      end

      # Describes a rule.
      struct TopicRulePayload
        include JSON::Serializable

        # The actions associated with the rule.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::Action)

        # The SQL statement used to query the topic. For more information, see IoT SQL Reference in the IoT
        # Developer Guide .
        @[JSON::Field(key: "sql")]
        getter sql : String

        # The version of the SQL rules engine to use when evaluating the rule.
        @[JSON::Field(key: "awsIotSqlVersion")]
        getter aws_iot_sql_version : String?

        # The description of the rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The action to take when an error occurs.
        @[JSON::Field(key: "errorAction")]
        getter error_action : Types::Action?

        # Specifies whether the rule is disabled.
        @[JSON::Field(key: "ruleDisabled")]
        getter rule_disabled : Bool?

        def initialize(
          @actions : Array(Types::Action),
          @sql : String,
          @aws_iot_sql_version : String? = nil,
          @description : String? = nil,
          @error_action : Types::Action? = nil,
          @rule_disabled : Bool? = nil
        )
        end
      end

      # You can't revert the certificate transfer because the transfer is already complete.
      struct TransferAlreadyCompletedException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input for the TransferCertificate operation.
      struct TransferCertificateRequest
        include JSON::Serializable

        # The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String

        # The Amazon Web Services account.
        @[JSON::Field(key: "targetAwsAccount")]
        getter target_aws_account : String

        # The transfer message.
        @[JSON::Field(key: "transferMessage")]
        getter transfer_message : String?

        def initialize(
          @certificate_id : String,
          @target_aws_account : String,
          @transfer_message : String? = nil
        )
        end
      end

      # The output from the TransferCertificate operation.
      struct TransferCertificateResponse
        include JSON::Serializable

        # The ARN of the certificate.
        @[JSON::Field(key: "transferredCertificateArn")]
        getter transferred_certificate_arn : String?

        def initialize(
          @transferred_certificate_arn : String? = nil
        )
        end
      end

      # You can't transfer the certificate because authorization policies are still attached.
      struct TransferConflictException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Data used to transfer a certificate to an Amazon Web Services account.
      struct TransferData
        include JSON::Serializable

        # The date the transfer was accepted.
        @[JSON::Field(key: "acceptDate")]
        getter accept_date : Time?

        # The date the transfer was rejected.
        @[JSON::Field(key: "rejectDate")]
        getter reject_date : Time?

        # The reason why the transfer was rejected.
        @[JSON::Field(key: "rejectReason")]
        getter reject_reason : String?

        # The date the transfer took place.
        @[JSON::Field(key: "transferDate")]
        getter transfer_date : Time?

        # The transfer message.
        @[JSON::Field(key: "transferMessage")]
        getter transfer_message : String?

        def initialize(
          @accept_date : Time? = nil,
          @reject_date : Time? = nil,
          @reject_reason : String? = nil,
          @transfer_date : Time? = nil,
          @transfer_message : String? = nil
        )
        end
      end

      # You are not authorized to perform this operation.
      struct UnauthorizedException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of the keys of the tags to be removed from the resource.
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

      struct UpdateAccountAuditConfigurationRequest
        include JSON::Serializable

        # Specifies which audit checks are enabled and disabled for this account. Use
        # DescribeAccountAuditConfiguration to see the list of all checks, including those that are currently
        # enabled. Some data collection might start immediately when certain checks are enabled. When a check
        # is disabled, any data collected so far in relation to the check is deleted. You cannot disable a
        # check if it's used by any scheduled audit. You must first delete the check from the scheduled audit
        # or delete the scheduled audit itself. On the first call to UpdateAccountAuditConfiguration , this
        # parameter is required and must specify at least one enabled check.
        @[JSON::Field(key: "auditCheckConfigurations")]
        getter audit_check_configurations : Hash(String, Types::AuditCheckConfiguration)?

        # Information about the targets to which audit notifications are sent.
        @[JSON::Field(key: "auditNotificationTargetConfigurations")]
        getter audit_notification_target_configurations : Hash(String, Types::AuditNotificationTarget)?

        # The Amazon Resource Name (ARN) of the role that grants permission to IoT to access information about
        # your devices, policies, certificates, and other items as required when performing an audit.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @audit_check_configurations : Hash(String, Types::AuditCheckConfiguration)? = nil,
          @audit_notification_target_configurations : Hash(String, Types::AuditNotificationTarget)? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct UpdateAccountAuditConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateAuditSuppressionRequest
        include JSON::Serializable

        @[JSON::Field(key: "checkName")]
        getter check_name : String

        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : Types::ResourceIdentifier

        # The description of the audit suppression.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The expiration date (epoch timestamp in seconds) that you want the suppression to adhere to.
        @[JSON::Field(key: "expirationDate")]
        getter expiration_date : Time?

        # Indicates whether a suppression should exist indefinitely or not.
        @[JSON::Field(key: "suppressIndefinitely")]
        getter suppress_indefinitely : Bool?

        def initialize(
          @check_name : String,
          @resource_identifier : Types::ResourceIdentifier,
          @description : String? = nil,
          @expiration_date : Time? = nil,
          @suppress_indefinitely : Bool? = nil
        )
        end
      end

      struct UpdateAuditSuppressionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateAuthorizerRequest
        include JSON::Serializable

        # The authorizer name.
        @[JSON::Field(key: "authorizerName")]
        getter authorizer_name : String

        # The ARN of the authorizer's Lambda function.
        @[JSON::Field(key: "authorizerFunctionArn")]
        getter authorizer_function_arn : String?

        # When true , the result from the authorizer’s Lambda function is cached for the time specified in
        # refreshAfterInSeconds . The cached result is used while the device reuses the same HTTP connection.
        @[JSON::Field(key: "enableCachingForHttp")]
        getter enable_caching_for_http : Bool?

        # The status of the update authorizer request.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The key used to extract the token from the HTTP headers.
        @[JSON::Field(key: "tokenKeyName")]
        getter token_key_name : String?

        # The public keys used to verify the token signature.
        @[JSON::Field(key: "tokenSigningPublicKeys")]
        getter token_signing_public_keys : Hash(String, String)?

        def initialize(
          @authorizer_name : String,
          @authorizer_function_arn : String? = nil,
          @enable_caching_for_http : Bool? = nil,
          @status : String? = nil,
          @token_key_name : String? = nil,
          @token_signing_public_keys : Hash(String, String)? = nil
        )
        end
      end

      struct UpdateAuthorizerResponse
        include JSON::Serializable

        # The authorizer ARN.
        @[JSON::Field(key: "authorizerArn")]
        getter authorizer_arn : String?

        # The authorizer name.
        @[JSON::Field(key: "authorizerName")]
        getter authorizer_name : String?

        def initialize(
          @authorizer_arn : String? = nil,
          @authorizer_name : String? = nil
        )
        end
      end

      struct UpdateBillingGroupRequest
        include JSON::Serializable

        # The name of the billing group.
        @[JSON::Field(key: "billingGroupName")]
        getter billing_group_name : String

        # The properties of the billing group.
        @[JSON::Field(key: "billingGroupProperties")]
        getter billing_group_properties : Types::BillingGroupProperties

        # The expected version of the billing group. If the version of the billing group does not match the
        # expected version specified in the request, the UpdateBillingGroup request is rejected with a
        # VersionConflictException .
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        def initialize(
          @billing_group_name : String,
          @billing_group_properties : Types::BillingGroupProperties,
          @expected_version : Int64? = nil
        )
        end
      end

      struct UpdateBillingGroupResponse
        include JSON::Serializable

        # The latest version of the billing group.
        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @version : Int64? = nil
        )
        end
      end

      # Parameters to define a mitigation action that changes the state of the CA certificate to inactive.
      struct UpdateCACertificateParams
        include JSON::Serializable

        # The action that you want to apply to the CA certificate. The only supported value is DEACTIVATE .
        @[JSON::Field(key: "action")]
        getter action : String

        def initialize(
          @action : String
        )
        end
      end

      # The input to the UpdateCACertificate operation.
      struct UpdateCACertificateRequest
        include JSON::Serializable

        # The CA certificate identifier.
        @[JSON::Field(key: "caCertificateId")]
        getter certificate_id : String

        # The new value for the auto registration status. Valid values are: "ENABLE" or "DISABLE".
        @[JSON::Field(key: "newAutoRegistrationStatus")]
        getter new_auto_registration_status : String?

        # The updated status of the CA certificate. Note: The status value REGISTER_INACTIVE is deprecated and
        # should not be used.
        @[JSON::Field(key: "newStatus")]
        getter new_status : String?

        # Information about the registration configuration.
        @[JSON::Field(key: "registrationConfig")]
        getter registration_config : Types::RegistrationConfig?

        # If true, removes auto registration.
        @[JSON::Field(key: "removeAutoRegistration")]
        getter remove_auto_registration : Bool?

        def initialize(
          @certificate_id : String,
          @new_auto_registration_status : String? = nil,
          @new_status : String? = nil,
          @registration_config : Types::RegistrationConfig? = nil,
          @remove_auto_registration : Bool? = nil
        )
        end
      end

      struct UpdateCertificateProviderRequest
        include JSON::Serializable

        # The name of the certificate provider.
        @[JSON::Field(key: "certificateProviderName")]
        getter certificate_provider_name : String

        # A list of the operations that the certificate provider will use to generate certificates. Valid
        # value: CreateCertificateFromCsr .
        @[JSON::Field(key: "accountDefaultForOperations")]
        getter account_default_for_operations : Array(String)?

        # The Lambda function ARN that's associated with the certificate provider.
        @[JSON::Field(key: "lambdaFunctionArn")]
        getter lambda_function_arn : String?

        def initialize(
          @certificate_provider_name : String,
          @account_default_for_operations : Array(String)? = nil,
          @lambda_function_arn : String? = nil
        )
        end
      end

      struct UpdateCertificateProviderResponse
        include JSON::Serializable

        # The ARN of the certificate provider.
        @[JSON::Field(key: "certificateProviderArn")]
        getter certificate_provider_arn : String?

        # The name of the certificate provider.
        @[JSON::Field(key: "certificateProviderName")]
        getter certificate_provider_name : String?

        def initialize(
          @certificate_provider_arn : String? = nil,
          @certificate_provider_name : String? = nil
        )
        end
      end

      # The input for the UpdateCertificate operation.
      struct UpdateCertificateRequest
        include JSON::Serializable

        # The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)
        @[JSON::Field(key: "certificateId")]
        getter certificate_id : String

        # The new status. Note: Setting the status to PENDING_TRANSFER or PENDING_ACTIVATION will result in an
        # exception being thrown. PENDING_TRANSFER and PENDING_ACTIVATION are statuses used internally by IoT.
        # They are not intended for developer use. Note: The status value REGISTER_INACTIVE is deprecated and
        # should not be used.
        @[JSON::Field(key: "newStatus")]
        getter new_status : String

        def initialize(
          @certificate_id : String,
          @new_status : String
        )
        end
      end

      struct UpdateCommandRequest
        include JSON::Serializable

        # The unique identifier of the command to be updated.
        @[JSON::Field(key: "commandId")]
        getter command_id : String

        # A boolean that you can use to specify whether to deprecate a command.
        @[JSON::Field(key: "deprecated")]
        getter deprecated : Bool?

        # A short text description of the command.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The new user-friendly name to use in the console for the command.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @command_id : String,
          @deprecated : Bool? = nil,
          @description : String? = nil,
          @display_name : String? = nil
        )
        end
      end

      struct UpdateCommandResponse
        include JSON::Serializable

        # The unique identifier of the command.
        @[JSON::Field(key: "commandId")]
        getter command_id : String?

        # The boolean that indicates whether the command was deprecated.
        @[JSON::Field(key: "deprecated")]
        getter deprecated : Bool?

        # The updated text description of the command.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The updated user-friendly display name in the console for the command.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The date and time (epoch timestamp in seconds) when the command was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        def initialize(
          @command_id : String? = nil,
          @deprecated : Bool? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @last_updated_at : Time? = nil
        )
        end
      end

      struct UpdateCustomMetricRequest
        include JSON::Serializable

        # Field represents a friendly name in the console for the custom metric, it doesn't have to be unique.
        # Don't use this name as the metric identifier in the device metric report. Can be updated.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The name of the custom metric. Cannot be updated.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        def initialize(
          @display_name : String,
          @metric_name : String
        )
        end
      end

      struct UpdateCustomMetricResponse
        include JSON::Serializable

        # The creation date of the custom metric in milliseconds since epoch.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # A friendly name in the console for the custom metric
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The time the custom metric was last modified in milliseconds since epoch.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # The Amazon Resource Number (ARN) of the custom metric.
        @[JSON::Field(key: "metricArn")]
        getter metric_arn : String?

        # The name of the custom metric.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        # The type of the custom metric. The type number only takes a single metric value as an input, but
        # while submitting the metrics value in the DeviceMetrics report, it must be passed as an array with a
        # single value.
        @[JSON::Field(key: "metricType")]
        getter metric_type : String?

        def initialize(
          @creation_date : Time? = nil,
          @display_name : String? = nil,
          @last_modified_date : Time? = nil,
          @metric_arn : String? = nil,
          @metric_name : String? = nil,
          @metric_type : String? = nil
        )
        end
      end

      # Parameters to define a mitigation action that changes the state of the device certificate to
      # inactive.
      struct UpdateDeviceCertificateParams
        include JSON::Serializable

        # The action that you want to apply to the device certificate. The only supported value is DEACTIVATE
        # .
        @[JSON::Field(key: "action")]
        getter action : String

        def initialize(
          @action : String
        )
        end
      end

      struct UpdateDimensionRequest
        include JSON::Serializable

        # A unique identifier for the dimension. Choose something that describes the type and value to make it
        # easy to remember what it does.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies the value or list of values for the dimension. For TOPIC_FILTER dimensions, this is a
        # pattern used to match the MQTT topic (for example, "admin/#").
        @[JSON::Field(key: "stringValues")]
        getter string_values : Array(String)

        def initialize(
          @name : String,
          @string_values : Array(String)
        )
        end
      end

      struct UpdateDimensionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN)of the created dimension.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time, in milliseconds since epoch, when the dimension was initially created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The date and time, in milliseconds since epoch, when the dimension was most recently updated.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # A unique identifier for the dimension.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value or list of values used to scope the dimension. For example, for topic filters, this is the
        # pattern used to match the MQTT topic name.
        @[JSON::Field(key: "stringValues")]
        getter string_values : Array(String)?

        # The type of the dimension.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @last_modified_date : Time? = nil,
          @name : String? = nil,
          @string_values : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      struct UpdateDomainConfigurationRequest
        include JSON::Serializable

        # The name of the domain configuration to be updated.
        @[JSON::Field(key: "domainConfigurationName")]
        getter domain_configuration_name : String

        # An enumerated string that speciﬁes the application-layer protocol. SECURE_MQTT - MQTT over TLS.
        # MQTT_WSS - MQTT over WebSocket. HTTPS - HTTP over TLS. DEFAULT - Use a combination of port and
        # Application Layer Protocol Negotiation (ALPN) to specify application_layer protocol. For more
        # information, see Device communication protocols .
        @[JSON::Field(key: "applicationProtocol")]
        getter application_protocol : String?

        # An enumerated string that speciﬁes the authentication type. CUSTOM_AUTH_X509 - Use custom
        # authentication and authorization with additional details from the X.509 client certificate.
        # CUSTOM_AUTH - Use custom authentication and authorization. For more information, see Custom
        # authentication and authorization . AWS_X509 - Use X.509 client certificates without custom
        # authentication and authorization. For more information, see X.509 client certificates . AWS_SIGV4 -
        # Use Amazon Web Services Signature Version 4. For more information, see IAM users, groups, and roles
        # . DEFAULT - Use a combination of port and Application Layer Protocol Negotiation (ALPN) to specify
        # authentication type. For more information, see Device communication protocols .
        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String?

        # An object that specifies the authorization service for a domain.
        @[JSON::Field(key: "authorizerConfig")]
        getter authorizer_config : Types::AuthorizerConfig?

        # An object that speciﬁes the client certificate conﬁguration for a domain.
        @[JSON::Field(key: "clientCertificateConfig")]
        getter client_certificate_config : Types::ClientCertificateConfig?

        # The status to which the domain configuration should be updated.
        @[JSON::Field(key: "domainConfigurationStatus")]
        getter domain_configuration_status : String?

        # Removes the authorization configuration from a domain.
        @[JSON::Field(key: "removeAuthorizerConfig")]
        getter remove_authorizer_config : Bool?

        # The server certificate configuration.
        @[JSON::Field(key: "serverCertificateConfig")]
        getter server_certificate_config : Types::ServerCertificateConfig?

        # An object that specifies the TLS configuration for a domain.
        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfig?

        def initialize(
          @domain_configuration_name : String,
          @application_protocol : String? = nil,
          @authentication_type : String? = nil,
          @authorizer_config : Types::AuthorizerConfig? = nil,
          @client_certificate_config : Types::ClientCertificateConfig? = nil,
          @domain_configuration_status : String? = nil,
          @remove_authorizer_config : Bool? = nil,
          @server_certificate_config : Types::ServerCertificateConfig? = nil,
          @tls_config : Types::TlsConfig? = nil
        )
        end
      end

      struct UpdateDomainConfigurationResponse
        include JSON::Serializable

        # The ARN of the domain configuration that was updated.
        @[JSON::Field(key: "domainConfigurationArn")]
        getter domain_configuration_arn : String?

        # The name of the domain configuration that was updated.
        @[JSON::Field(key: "domainConfigurationName")]
        getter domain_configuration_name : String?

        def initialize(
          @domain_configuration_arn : String? = nil,
          @domain_configuration_name : String? = nil
        )
        end
      end

      struct UpdateDynamicThingGroupRequest
        include JSON::Serializable

        # The name of the dynamic thing group to update.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String

        # The dynamic thing group properties to update.
        @[JSON::Field(key: "thingGroupProperties")]
        getter thing_group_properties : Types::ThingGroupProperties

        # The expected version of the dynamic thing group to update.
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        # The dynamic thing group index to update. Currently one index is supported: AWS_Things .
        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The dynamic thing group search query string to update.
        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        # The dynamic thing group query version to update. Currently one query version is supported:
        # "2017-09-30". If not specified, the query version defaults to this value.
        @[JSON::Field(key: "queryVersion")]
        getter query_version : String?

        def initialize(
          @thing_group_name : String,
          @thing_group_properties : Types::ThingGroupProperties,
          @expected_version : Int64? = nil,
          @index_name : String? = nil,
          @query_string : String? = nil,
          @query_version : String? = nil
        )
        end
      end

      struct UpdateDynamicThingGroupResponse
        include JSON::Serializable

        # The dynamic thing group version.
        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @version : Int64? = nil
        )
        end
      end

      struct UpdateEncryptionConfigurationRequest
        include JSON::Serializable

        # The type of the KMS key.
        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # The Amazon Resource Name (ARN) of the IAM role assumed by Amazon Web Services IoT Core to call KMS
        # on behalf of the customer.
        @[JSON::Field(key: "kmsAccessRoleArn")]
        getter kms_access_role_arn : String?

        # The ARN of the customer managedKMS key.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @encryption_type : String,
          @kms_access_role_arn : String? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end

      struct UpdateEncryptionConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateEventConfigurationsRequest
        include JSON::Serializable

        # The new event configuration values.
        @[JSON::Field(key: "eventConfigurations")]
        getter event_configurations : Hash(String, Types::Configuration)?

        def initialize(
          @event_configurations : Hash(String, Types::Configuration)? = nil
        )
        end
      end

      struct UpdateEventConfigurationsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateFleetMetricRequest
        include JSON::Serializable

        # The name of the index to search.
        @[JSON::Field(key: "indexName")]
        getter index_name : String

        # The name of the fleet metric to update.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The field to aggregate.
        @[JSON::Field(key: "aggregationField")]
        getter aggregation_field : String?

        # The type of the aggregation query.
        @[JSON::Field(key: "aggregationType")]
        getter aggregation_type : Types::AggregationType?

        # The description of the fleet metric.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The expected version of the fleet metric record in the registry.
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        # The time in seconds between fleet metric emissions. Range [60(1 min), 86400(1 day)] and must be
        # multiple of 60.
        @[JSON::Field(key: "period")]
        getter period : Int32?

        # The search query string.
        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        # The version of the query.
        @[JSON::Field(key: "queryVersion")]
        getter query_version : String?

        # Used to support unit transformation such as milliseconds to seconds. The unit must be supported by
        # CW metric .
        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @index_name : String,
          @metric_name : String,
          @aggregation_field : String? = nil,
          @aggregation_type : Types::AggregationType? = nil,
          @description : String? = nil,
          @expected_version : Int64? = nil,
          @period : Int32? = nil,
          @query_string : String? = nil,
          @query_version : String? = nil,
          @unit : String? = nil
        )
        end
      end

      struct UpdateIndexingConfigurationRequest
        include JSON::Serializable

        # Thing group indexing configuration.
        @[JSON::Field(key: "thingGroupIndexingConfiguration")]
        getter thing_group_indexing_configuration : Types::ThingGroupIndexingConfiguration?

        # Thing indexing configuration.
        @[JSON::Field(key: "thingIndexingConfiguration")]
        getter thing_indexing_configuration : Types::ThingIndexingConfiguration?

        def initialize(
          @thing_group_indexing_configuration : Types::ThingGroupIndexingConfiguration? = nil,
          @thing_indexing_configuration : Types::ThingIndexingConfiguration? = nil
        )
        end
      end

      struct UpdateIndexingConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateJobRequest
        include JSON::Serializable

        # The ID of the job to be updated.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # Allows you to create criteria to abort a job.
        @[JSON::Field(key: "abortConfig")]
        getter abort_config : Types::AbortConfig?

        # A short text description of the job.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Allows you to create the criteria to retry a job.
        @[JSON::Field(key: "jobExecutionsRetryConfig")]
        getter job_executions_retry_config : Types::JobExecutionsRetryConfig?

        # Allows you to create a staged rollout of the job.
        @[JSON::Field(key: "jobExecutionsRolloutConfig")]
        getter job_executions_rollout_config : Types::JobExecutionsRolloutConfig?

        # The namespace used to indicate that a job is a customer-managed job. When you specify a value for
        # this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain
        # the value in the following format. $aws/things/ THING_NAME /jobs/ JOB_ID /notify-namespace-
        # NAMESPACE_ID / The namespaceId feature is only supported by IoT Greengrass at this time. For more
        # information, see Setting up IoT Greengrass core devices.
        @[JSON::Field(key: "namespaceId")]
        getter namespace_id : String?

        # Configuration information for pre-signed S3 URLs.
        @[JSON::Field(key: "presignedUrlConfig")]
        getter presigned_url_config : Types::PresignedUrlConfig?

        # Specifies the amount of time each device has to finish its execution of the job. The timer is
        # started when the job execution status is set to IN_PROGRESS . If the job execution status is not set
        # to another terminal state before the time expires, it will be automatically set to TIMED_OUT .
        @[JSON::Field(key: "timeoutConfig")]
        getter timeout_config : Types::TimeoutConfig?

        def initialize(
          @job_id : String,
          @abort_config : Types::AbortConfig? = nil,
          @description : String? = nil,
          @job_executions_retry_config : Types::JobExecutionsRetryConfig? = nil,
          @job_executions_rollout_config : Types::JobExecutionsRolloutConfig? = nil,
          @namespace_id : String? = nil,
          @presigned_url_config : Types::PresignedUrlConfig? = nil,
          @timeout_config : Types::TimeoutConfig? = nil
        )
        end
      end

      struct UpdateMitigationActionRequest
        include JSON::Serializable

        # The friendly name for the mitigation action. You cannot change the name by using
        # UpdateMitigationAction . Instead, you must delete and recreate the mitigation action with the new
        # name.
        @[JSON::Field(key: "actionName")]
        getter action_name : String

        # Defines the type of action and the parameters for that action.
        @[JSON::Field(key: "actionParams")]
        getter action_params : Types::MitigationActionParams?

        # The ARN of the IAM role that is used to apply the mitigation action.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @action_name : String,
          @action_params : Types::MitigationActionParams? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct UpdateMitigationActionResponse
        include JSON::Serializable

        # The ARN for the new mitigation action.
        @[JSON::Field(key: "actionArn")]
        getter action_arn : String?

        # A unique identifier for the mitigation action.
        @[JSON::Field(key: "actionId")]
        getter action_id : String?

        def initialize(
          @action_arn : String? = nil,
          @action_id : String? = nil
        )
        end
      end

      struct UpdatePackageConfigurationRequest
        include JSON::Serializable

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Configuration to manage job's package version reporting. This updates the thing's reserved named
        # shadow that the job targets.
        @[JSON::Field(key: "versionUpdateByJobsConfig")]
        getter version_update_by_jobs_config : Types::VersionUpdateByJobsConfig?

        def initialize(
          @client_token : String? = nil,
          @version_update_by_jobs_config : Types::VersionUpdateByJobsConfig? = nil
        )
        end
      end

      struct UpdatePackageConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdatePackageRequest
        include JSON::Serializable

        # The name of the target software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The name of the default package version. Note: You cannot name a defaultVersion and set
        # unsetDefaultVersion equal to true at the same time.
        @[JSON::Field(key: "defaultVersionName")]
        getter default_version_name : String?

        # The package description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether you want to remove the named default package version from the software package.
        # Set as true to remove the default package version. Note: You cannot name a defaultVersion and set
        # unsetDefaultVersion equal to true at the same time.
        @[JSON::Field(key: "unsetDefaultVersion")]
        getter unset_default_version : Bool?

        def initialize(
          @package_name : String,
          @client_token : String? = nil,
          @default_version_name : String? = nil,
          @description : String? = nil,
          @unset_default_version : Bool? = nil
        )
        end
      end

      struct UpdatePackageResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdatePackageVersionRequest
        include JSON::Serializable

        # The name of the associated software package.
        @[JSON::Field(key: "packageName")]
        getter package_name : String

        # The name of the target package version.
        @[JSON::Field(key: "versionName")]
        getter version_name : String

        # The status that the package version should be assigned. For more information, see Package version
        # lifecycle .
        @[JSON::Field(key: "action")]
        getter action : String?

        # The various components that make up a software package version.
        @[JSON::Field(key: "artifact")]
        getter artifact : Types::PackageVersionArtifact?

        # Metadata that can be used to define a package version’s configuration. For example, the Amazon S3
        # file location, configuration options that are being sent to the device or fleet. Note: Attributes
        # can be updated only when the package version is in a draft state. The combined size of all the
        # attributes on a package version is limited to 3KB.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # A unique case-sensitive identifier that you can provide to ensure the idempotency of the request.
        # Don't reuse this client token if a new idempotent request is required.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The package version description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The inline job document associated with a software package version used for a quick job deployment.
        @[JSON::Field(key: "recipe")]
        getter recipe : String?

        def initialize(
          @package_name : String,
          @version_name : String,
          @action : String? = nil,
          @artifact : Types::PackageVersionArtifact? = nil,
          @attributes : Hash(String, String)? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @recipe : String? = nil
        )
        end
      end

      struct UpdatePackageVersionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateProvisioningTemplateRequest
        include JSON::Serializable

        # The name of the provisioning template.
        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # The ID of the default provisioning template version.
        @[JSON::Field(key: "defaultVersionId")]
        getter default_version_id : Int32?

        # The description of the provisioning template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # True to enable the provisioning template, otherwise false.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # Updates the pre-provisioning hook template. Only supports template of type FLEET_PROVISIONING . For
        # more information about provisioning template types, see type .
        @[JSON::Field(key: "preProvisioningHook")]
        getter pre_provisioning_hook : Types::ProvisioningHook?

        # The ARN of the role associated with the provisioning template. This IoT role grants permission to
        # provision a device.
        @[JSON::Field(key: "provisioningRoleArn")]
        getter provisioning_role_arn : String?

        # Removes pre-provisioning hook template.
        @[JSON::Field(key: "removePreProvisioningHook")]
        getter remove_pre_provisioning_hook : Bool?

        def initialize(
          @template_name : String,
          @default_version_id : Int32? = nil,
          @description : String? = nil,
          @enabled : Bool? = nil,
          @pre_provisioning_hook : Types::ProvisioningHook? = nil,
          @provisioning_role_arn : String? = nil,
          @remove_pre_provisioning_hook : Bool? = nil
        )
        end
      end

      struct UpdateProvisioningTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateRoleAliasRequest
        include JSON::Serializable

        # The role alias to update.
        @[JSON::Field(key: "roleAlias")]
        getter role_alias : String

        # The number of seconds the credential will be valid. This value must be less than or equal to the
        # maximum session duration of the IAM role that the role alias references.
        @[JSON::Field(key: "credentialDurationSeconds")]
        getter credential_duration_seconds : Int32?

        # The role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @role_alias : String,
          @credential_duration_seconds : Int32? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct UpdateRoleAliasResponse
        include JSON::Serializable

        # The role alias.
        @[JSON::Field(key: "roleAlias")]
        getter role_alias : String?

        # The role alias ARN.
        @[JSON::Field(key: "roleAliasArn")]
        getter role_alias_arn : String?

        def initialize(
          @role_alias : String? = nil,
          @role_alias_arn : String? = nil
        )
        end
      end

      struct UpdateScheduledAuditRequest
        include JSON::Serializable

        # The name of the scheduled audit. (Max. 128 chars)
        @[JSON::Field(key: "scheduledAuditName")]
        getter scheduled_audit_name : String

        # The day of the month on which the scheduled audit takes place. This can be 1 through 31 or LAST .
        # This field is required if the frequency parameter is set to MONTHLY . If days 29-31 are specified,
        # and the month does not have that many days, the audit takes place on the "LAST" day of the month.
        @[JSON::Field(key: "dayOfMonth")]
        getter day_of_month : String?

        # The day of the week on which the scheduled audit takes place. This can be one of SUN , MON , TUE ,
        # WED , THU , FRI , or SAT . This field is required if the "frequency" parameter is set to WEEKLY or
        # BIWEEKLY .
        @[JSON::Field(key: "dayOfWeek")]
        getter day_of_week : String?

        # How often the scheduled audit takes place, either DAILY , WEEKLY , BIWEEKLY , or MONTHLY . The start
        # time of each audit is determined by the system.
        @[JSON::Field(key: "frequency")]
        getter frequency : String?

        # Which checks are performed during the scheduled audit. Checks must be enabled for your account. (Use
        # DescribeAccountAuditConfiguration to see the list of all checks, including those that are enabled or
        # use UpdateAccountAuditConfiguration to select which checks are enabled.)
        @[JSON::Field(key: "targetCheckNames")]
        getter target_check_names : Array(String)?

        def initialize(
          @scheduled_audit_name : String,
          @day_of_month : String? = nil,
          @day_of_week : String? = nil,
          @frequency : String? = nil,
          @target_check_names : Array(String)? = nil
        )
        end
      end

      struct UpdateScheduledAuditResponse
        include JSON::Serializable

        # The ARN of the scheduled audit.
        @[JSON::Field(key: "scheduledAuditArn")]
        getter scheduled_audit_arn : String?

        def initialize(
          @scheduled_audit_arn : String? = nil
        )
        end
      end

      struct UpdateSecurityProfileRequest
        include JSON::Serializable

        # The name of the security profile you want to update.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String

        # Please use UpdateSecurityProfileRequest$additionalMetricsToRetainV2 instead. A list of metrics whose
        # data is retained (stored). By default, data is retained for any metric used in the profile's
        # behaviors , but it is also retained for any metric specified here. Can be used with custom metrics;
        # cannot be used with dimensions.
        @[JSON::Field(key: "additionalMetricsToRetain")]
        getter additional_metrics_to_retain : Array(String)?

        # A list of metrics whose data is retained (stored). By default, data is retained for any metric used
        # in the profile's behaviors, but it is also retained for any metric specified here. Can be used with
        # custom metrics; cannot be used with dimensions.
        @[JSON::Field(key: "additionalMetricsToRetainV2")]
        getter additional_metrics_to_retain_v2 : Array(Types::MetricToRetain)?

        # Where the alerts are sent. (Alerts are always sent to the console.)
        @[JSON::Field(key: "alertTargets")]
        getter alert_targets : Hash(String, Types::AlertTarget)?

        # Specifies the behaviors that, when violated by a device (thing), cause an alert.
        @[JSON::Field(key: "behaviors")]
        getter behaviors : Array(Types::Behavior)?

        # If true, delete all additionalMetricsToRetain defined for this security profile. If any
        # additionalMetricsToRetain are defined in the current invocation, an exception occurs.
        @[JSON::Field(key: "deleteAdditionalMetricsToRetain")]
        getter delete_additional_metrics_to_retain : Bool?

        # If true, delete all alertTargets defined for this security profile. If any alertTargets are defined
        # in the current invocation, an exception occurs.
        @[JSON::Field(key: "deleteAlertTargets")]
        getter delete_alert_targets : Bool?

        # If true, delete all behaviors defined for this security profile. If any behaviors are defined in the
        # current invocation, an exception occurs.
        @[JSON::Field(key: "deleteBehaviors")]
        getter delete_behaviors : Bool?

        # Set the value as true to delete metrics export related configurations.
        @[JSON::Field(key: "deleteMetricsExportConfig")]
        getter delete_metrics_export_config : Bool?

        # The expected version of the security profile. A new version is generated whenever the security
        # profile is updated. If you specify a value that is different from the actual version, a
        # VersionConflictException is thrown.
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        # Specifies the MQTT topic and role ARN required for metric export.
        @[JSON::Field(key: "metricsExportConfig")]
        getter metrics_export_config : Types::MetricsExportConfig?

        # A description of the security profile.
        @[JSON::Field(key: "securityProfileDescription")]
        getter security_profile_description : String?

        def initialize(
          @security_profile_name : String,
          @additional_metrics_to_retain : Array(String)? = nil,
          @additional_metrics_to_retain_v2 : Array(Types::MetricToRetain)? = nil,
          @alert_targets : Hash(String, Types::AlertTarget)? = nil,
          @behaviors : Array(Types::Behavior)? = nil,
          @delete_additional_metrics_to_retain : Bool? = nil,
          @delete_alert_targets : Bool? = nil,
          @delete_behaviors : Bool? = nil,
          @delete_metrics_export_config : Bool? = nil,
          @expected_version : Int64? = nil,
          @metrics_export_config : Types::MetricsExportConfig? = nil,
          @security_profile_description : String? = nil
        )
        end
      end

      struct UpdateSecurityProfileResponse
        include JSON::Serializable

        # Please use UpdateSecurityProfileResponse$additionalMetricsToRetainV2 instead. A list of metrics
        # whose data is retained (stored). By default, data is retained for any metric used in the security
        # profile's behaviors , but it is also retained for any metric specified here.
        @[JSON::Field(key: "additionalMetricsToRetain")]
        getter additional_metrics_to_retain : Array(String)?

        # A list of metrics whose data is retained (stored). By default, data is retained for any metric used
        # in the profile's behaviors, but it is also retained for any metric specified here. Can be used with
        # custom metrics; cannot be used with dimensions.
        @[JSON::Field(key: "additionalMetricsToRetainV2")]
        getter additional_metrics_to_retain_v2 : Array(Types::MetricToRetain)?

        # Where the alerts are sent. (Alerts are always sent to the console.)
        @[JSON::Field(key: "alertTargets")]
        getter alert_targets : Hash(String, Types::AlertTarget)?

        # Specifies the behaviors that, when violated by a device (thing), cause an alert.
        @[JSON::Field(key: "behaviors")]
        getter behaviors : Array(Types::Behavior)?

        # The time the security profile was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The time the security profile was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time?

        # Specifies the MQTT topic and role ARN required for metric export.
        @[JSON::Field(key: "metricsExportConfig")]
        getter metrics_export_config : Types::MetricsExportConfig?

        # The ARN of the security profile that was updated.
        @[JSON::Field(key: "securityProfileArn")]
        getter security_profile_arn : String?

        # The description of the security profile.
        @[JSON::Field(key: "securityProfileDescription")]
        getter security_profile_description : String?

        # The name of the security profile that was updated.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String?

        # The updated version of the security profile.
        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @additional_metrics_to_retain : Array(String)? = nil,
          @additional_metrics_to_retain_v2 : Array(Types::MetricToRetain)? = nil,
          @alert_targets : Hash(String, Types::AlertTarget)? = nil,
          @behaviors : Array(Types::Behavior)? = nil,
          @creation_date : Time? = nil,
          @last_modified_date : Time? = nil,
          @metrics_export_config : Types::MetricsExportConfig? = nil,
          @security_profile_arn : String? = nil,
          @security_profile_description : String? = nil,
          @security_profile_name : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      struct UpdateStreamRequest
        include JSON::Serializable

        # The stream ID.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String

        # The description of the stream.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The files associated with the stream.
        @[JSON::Field(key: "files")]
        getter files : Array(Types::StreamFile)?

        # An IAM role that allows the IoT service principal assumes to access your S3 files.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @stream_id : String,
          @description : String? = nil,
          @files : Array(Types::StreamFile)? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct UpdateStreamResponse
        include JSON::Serializable

        # A description of the stream.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The stream ARN.
        @[JSON::Field(key: "streamArn")]
        getter stream_arn : String?

        # The stream ID.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        # The stream version.
        @[JSON::Field(key: "streamVersion")]
        getter stream_version : Int32?

        def initialize(
          @description : String? = nil,
          @stream_arn : String? = nil,
          @stream_id : String? = nil,
          @stream_version : Int32? = nil
        )
        end
      end

      struct UpdateThingGroupRequest
        include JSON::Serializable

        # The thing group to update.
        @[JSON::Field(key: "thingGroupName")]
        getter thing_group_name : String

        # The thing group properties.
        @[JSON::Field(key: "thingGroupProperties")]
        getter thing_group_properties : Types::ThingGroupProperties

        # The expected version of the thing group. If this does not match the version of the thing group being
        # updated, the update will fail.
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        def initialize(
          @thing_group_name : String,
          @thing_group_properties : Types::ThingGroupProperties,
          @expected_version : Int64? = nil
        )
        end
      end

      struct UpdateThingGroupResponse
        include JSON::Serializable

        # The version of the updated thing group.
        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @version : Int64? = nil
        )
        end
      end

      struct UpdateThingGroupsForThingRequest
        include JSON::Serializable

        # Override dynamic thing groups with static thing groups when 10-group limit is reached. If a thing
        # belongs to 10 thing groups, and one or more of those groups are dynamic thing groups, adding a thing
        # to a static group removes the thing from the last dynamic group.
        @[JSON::Field(key: "overrideDynamicGroups")]
        getter override_dynamic_groups : Bool?

        # The groups to which the thing will be added.
        @[JSON::Field(key: "thingGroupsToAdd")]
        getter thing_groups_to_add : Array(String)?

        # The groups from which the thing will be removed.
        @[JSON::Field(key: "thingGroupsToRemove")]
        getter thing_groups_to_remove : Array(String)?

        # The thing whose group memberships will be updated.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @override_dynamic_groups : Bool? = nil,
          @thing_groups_to_add : Array(String)? = nil,
          @thing_groups_to_remove : Array(String)? = nil,
          @thing_name : String? = nil
        )
        end
      end

      struct UpdateThingGroupsForThingResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the UpdateThing operation.
      struct UpdateThingRequest
        include JSON::Serializable

        # The name of the thing to update. You can't change a thing's name. To change a thing's name, you must
        # create a new thing, give it the new name, and then delete the old thing.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # A list of thing attributes, a JSON string containing name-value pairs. For example:
        # {\"attributes\":{\"name1\":\"value2\"}} This data is used to add new attributes or update existing
        # attributes.
        @[JSON::Field(key: "attributePayload")]
        getter attribute_payload : Types::AttributePayload?

        # The expected version of the thing record in the registry. If the version of the record in the
        # registry does not match the expected version specified in the request, the UpdateThing request is
        # rejected with a VersionConflictException .
        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        # Remove a thing type association. If true , the association is removed.
        @[JSON::Field(key: "removeThingType")]
        getter remove_thing_type : Bool?

        # The name of the thing type.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String?

        def initialize(
          @thing_name : String,
          @attribute_payload : Types::AttributePayload? = nil,
          @expected_version : Int64? = nil,
          @remove_thing_type : Bool? = nil,
          @thing_type_name : String? = nil
        )
        end
      end

      # The output from the UpdateThing operation.
      struct UpdateThingResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateThingTypeRequest
        include JSON::Serializable

        # The name of a thing type.
        @[JSON::Field(key: "thingTypeName")]
        getter thing_type_name : String

        @[JSON::Field(key: "thingTypeProperties")]
        getter thing_type_properties : Types::ThingTypeProperties?

        def initialize(
          @thing_type_name : String,
          @thing_type_properties : Types::ThingTypeProperties? = nil
        )
        end
      end

      struct UpdateThingTypeResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateTopicRuleDestinationRequest
        include JSON::Serializable

        # The ARN of the topic rule destination.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The status of the topic rule destination. Valid values are: IN_PROGRESS A topic rule destination was
        # created but has not been confirmed. You can set status to IN_PROGRESS by calling
        # UpdateTopicRuleDestination . Calling UpdateTopicRuleDestination causes a new confirmation challenge
        # to be sent to your confirmation endpoint. ENABLED Confirmation was completed, and traffic to this
        # destination is allowed. You can set status to DISABLED by calling UpdateTopicRuleDestination .
        # DISABLED Confirmation was completed, and traffic to this destination is not allowed. You can set
        # status to ENABLED by calling UpdateTopicRuleDestination . ERROR Confirmation could not be completed,
        # for example if the confirmation timed out. You can call GetTopicRuleDestination for details about
        # the error. You can set status to IN_PROGRESS by calling UpdateTopicRuleDestination . Calling
        # UpdateTopicRuleDestination causes a new confirmation challenge to be sent to your confirmation
        # endpoint.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @arn : String,
          @status : String
        )
        end
      end

      struct UpdateTopicRuleDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A key-value pair that you define in the header. Both the key and the value are either literal
      # strings or valid substitution templates .
      struct UserProperty
        include JSON::Serializable

        # A key to be specified in UserProperty .
        @[JSON::Field(key: "key")]
        getter key : String

        # A value to be specified in UserProperty .
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct ValidateSecurityProfileBehaviorsRequest
        include JSON::Serializable

        # Specifies the behaviors that, when violated by a device (thing), cause an alert.
        @[JSON::Field(key: "behaviors")]
        getter behaviors : Array(Types::Behavior)

        def initialize(
          @behaviors : Array(Types::Behavior)
        )
        end
      end

      struct ValidateSecurityProfileBehaviorsResponse
        include JSON::Serializable

        # True if the behaviors were valid.
        @[JSON::Field(key: "valid")]
        getter valid : Bool?

        # The list of any errors found in the behaviors.
        @[JSON::Field(key: "validationErrors")]
        getter validation_errors : Array(Types::ValidationError)?

        def initialize(
          @valid : Bool? = nil,
          @validation_errors : Array(Types::ValidationError)? = nil
        )
        end
      end

      # Information about an error found in a behavior specification.
      struct ValidationError
        include JSON::Serializable

        # The description of an error found in the behaviors.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @error_message : String? = nil
        )
        end
      end

      # The request is not valid.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An exception thrown when the version of an entity specified with the expectedVersion parameter does
      # not match the latest version in the system.
      struct VersionConflictException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration to manage IoT Job's package version reporting. If configured, Jobs updates the thing's
      # reserved named shadow with the package version information up on successful job completion. Note:
      # For each job, the destinationPackageVersions attribute has to be set with the correct data for Jobs
      # to report to the thing shadow.
      struct VersionUpdateByJobsConfig
        include JSON::Serializable

        # Indicates whether the Job is enabled or not.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The Amazon Resource Name (ARN) of the role that grants permission to the IoT jobs service to update
        # the reserved named shadow when the job successfully completes.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @enabled : Bool? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # The number of policy versions exceeds the limit.
      struct VersionsLimitExceededException
        include JSON::Serializable

        # The message for the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a Device Defender security profile behavior violation.
      struct ViolationEvent
        include JSON::Serializable

        # The behavior that was violated.
        @[JSON::Field(key: "behavior")]
        getter behavior : Types::Behavior?

        # The value of the metric (the measurement).
        @[JSON::Field(key: "metricValue")]
        getter metric_value : Types::MetricValue?

        # The name of the security profile whose behavior was violated.
        @[JSON::Field(key: "securityProfileName")]
        getter security_profile_name : String?

        # The name of the thing responsible for the violation event.
        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        # The verification state of the violation (detect alarm).
        @[JSON::Field(key: "verificationState")]
        getter verification_state : String?

        # The description of the verification state of the violation.
        @[JSON::Field(key: "verificationStateDescription")]
        getter verification_state_description : String?

        # The details of a violation event.
        @[JSON::Field(key: "violationEventAdditionalInfo")]
        getter violation_event_additional_info : Types::ViolationEventAdditionalInfo?

        # The time the violation event occurred.
        @[JSON::Field(key: "violationEventTime")]
        getter violation_event_time : Time?

        # The type of violation event.
        @[JSON::Field(key: "violationEventType")]
        getter violation_event_type : String?

        # The ID of the violation event.
        @[JSON::Field(key: "violationId")]
        getter violation_id : String?

        def initialize(
          @behavior : Types::Behavior? = nil,
          @metric_value : Types::MetricValue? = nil,
          @security_profile_name : String? = nil,
          @thing_name : String? = nil,
          @verification_state : String? = nil,
          @verification_state_description : String? = nil,
          @violation_event_additional_info : Types::ViolationEventAdditionalInfo? = nil,
          @violation_event_time : Time? = nil,
          @violation_event_type : String? = nil,
          @violation_id : String? = nil
        )
        end
      end

      # The details of a violation event.
      struct ViolationEventAdditionalInfo
        include JSON::Serializable

        # The sensitivity of anomalous behavior evaluation. Can be Low , Medium , or High .
        @[JSON::Field(key: "confidenceLevel")]
        getter confidence_level : String?

        def initialize(
          @confidence_level : String? = nil
        )
        end
      end

      # Specifies the time period of which violation events occurred between.
      struct ViolationEventOccurrenceRange
        include JSON::Serializable

        # The end date and time of a time period in which violation events occurred.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The start date and time of a time period in which violation events occurred.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @start_time : Time
        )
        end
      end

      # The configuration information for a virtual private cloud (VPC) destination.
      struct VpcDestinationConfiguration
        include JSON::Serializable

        # The ARN of a role that has permission to create and attach to elastic network interfaces (ENIs).
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The subnet IDs of the VPC destination.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The ID of the VPC.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # The security groups of the VPC destination.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @role_arn : String,
          @subnet_ids : Array(String),
          @vpc_id : String,
          @security_groups : Array(String)? = nil
        )
        end
      end

      # The properties of a virtual private cloud (VPC) destination.
      struct VpcDestinationProperties
        include JSON::Serializable

        # The ARN of a role that has permission to create and attach to elastic network interfaces (ENIs).
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The security groups of the VPC destination.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        # The subnet IDs of the VPC destination.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The ID of the VPC.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @role_arn : String? = nil,
          @security_groups : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The summary of a virtual private cloud (VPC) destination.
      struct VpcDestinationSummary
        include JSON::Serializable

        # The ARN of a role that has permission to create and attach to elastic network interfaces (ENIs).
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The security groups of the VPC destination.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        # The subnet IDs of the VPC destination.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The ID of the VPC.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @role_arn : String? = nil,
          @security_groups : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end
    end
  end
end
