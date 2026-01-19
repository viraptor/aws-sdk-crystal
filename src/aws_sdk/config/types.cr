require "json"
require "time"

module AwsSdk
  module ConfigService
    module Types

      # A collection of accounts and regions.
      struct AccountAggregationSource
        include JSON::Serializable

        # The 12-digit account ID of the account being aggregated.
        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)

        # If true, aggregate existing Config regions and future regions.
        @[JSON::Field(key: "AllAwsRegions")]
        getter all_aws_regions : Bool?

        # The source regions being aggregated.
        @[JSON::Field(key: "AwsRegions")]
        getter aws_regions : Array(String)?

        def initialize(
          @account_ids : Array(String),
          @all_aws_regions : Bool? = nil,
          @aws_regions : Array(String)? = nil
        )
        end
      end

      # Indicates whether an Config rule is compliant based on account ID, region, compliance, and rule
      # name. A rule is compliant if all of the resources that the rule evaluated comply with it. It is
      # noncompliant if any of these resources do not comply.
      struct AggregateComplianceByConfigRule
        include JSON::Serializable

        # The 12-digit account ID of the source account.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The source region from where the data is aggregated.
        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # Indicates whether an Amazon Web Services resource or Config rule is compliant and provides the
        # number of contributors that affect the compliance.
        @[JSON::Field(key: "Compliance")]
        getter compliance : Types::Compliance?

        # The name of the Config rule.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String?

        def initialize(
          @account_id : String? = nil,
          @aws_region : String? = nil,
          @compliance : Types::Compliance? = nil,
          @config_rule_name : String? = nil
        )
        end
      end

      # Provides aggregate compliance of the conformance pack. Indicates whether a conformance pack is
      # compliant based on the name of the conformance pack, account ID, and region. A conformance pack is
      # compliant if all of the rules in a conformance packs are compliant. It is noncompliant if any of the
      # rules are not compliant. The compliance status of a conformance pack is INSUFFICIENT_DATA only if
      # all rules within a conformance pack cannot be evaluated due to insufficient data. If some of the
      # rules in a conformance pack are compliant but the compliance status of other rules in that same
      # conformance pack is INSUFFICIENT_DATA, the conformance pack shows compliant.
      struct AggregateComplianceByConformancePack
        include JSON::Serializable

        # The 12-digit Amazon Web Services account ID of the source account.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The source Amazon Web Services Region from where the data is aggregated.
        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # The compliance status of the conformance pack.
        @[JSON::Field(key: "Compliance")]
        getter compliance : Types::AggregateConformancePackCompliance?

        # The name of the conformance pack.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String?

        def initialize(
          @account_id : String? = nil,
          @aws_region : String? = nil,
          @compliance : Types::AggregateConformancePackCompliance? = nil,
          @conformance_pack_name : String? = nil
        )
        end
      end

      # Returns the number of compliant and noncompliant rules for one or more accounts and regions in an
      # aggregator.
      struct AggregateComplianceCount
        include JSON::Serializable

        # The number of compliant and noncompliant Config rules.
        @[JSON::Field(key: "ComplianceSummary")]
        getter compliance_summary : Types::ComplianceSummary?

        # The 12-digit account ID or region based on the GroupByKey value.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        def initialize(
          @compliance_summary : Types::ComplianceSummary? = nil,
          @group_name : String? = nil
        )
        end
      end

      # Provides the number of compliant and noncompliant rules within a conformance pack. Also provides the
      # compliance status of the conformance pack and the total rule count which includes compliant rules,
      # noncompliant rules, and rules that cannot be evaluated due to insufficient data. A conformance pack
      # is compliant if all of the rules in a conformance packs are compliant. It is noncompliant if any of
      # the rules are not compliant. The compliance status of a conformance pack is INSUFFICIENT_DATA only
      # if all rules within a conformance pack cannot be evaluated due to insufficient data. If some of the
      # rules in a conformance pack are compliant but the compliance status of other rules in that same
      # conformance pack is INSUFFICIENT_DATA, the conformance pack shows compliant.
      struct AggregateConformancePackCompliance
        include JSON::Serializable

        # The compliance status of the conformance pack.
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        # The number of compliant Config Rules.
        @[JSON::Field(key: "CompliantRuleCount")]
        getter compliant_rule_count : Int32?

        # The number of noncompliant Config Rules.
        @[JSON::Field(key: "NonCompliantRuleCount")]
        getter non_compliant_rule_count : Int32?

        # Total number of compliant rules, noncompliant rules, and the rules that do not have any applicable
        # resources to evaluate upon resulting in insufficient data.
        @[JSON::Field(key: "TotalRuleCount")]
        getter total_rule_count : Int32?

        def initialize(
          @compliance_type : String? = nil,
          @compliant_rule_count : Int32? = nil,
          @non_compliant_rule_count : Int32? = nil,
          @total_rule_count : Int32? = nil
        )
        end
      end

      # The number of conformance packs that are compliant and noncompliant.
      struct AggregateConformancePackComplianceCount
        include JSON::Serializable

        # Number of compliant conformance packs.
        @[JSON::Field(key: "CompliantConformancePackCount")]
        getter compliant_conformance_pack_count : Int32?

        # Number of noncompliant conformance packs.
        @[JSON::Field(key: "NonCompliantConformancePackCount")]
        getter non_compliant_conformance_pack_count : Int32?

        def initialize(
          @compliant_conformance_pack_count : Int32? = nil,
          @non_compliant_conformance_pack_count : Int32? = nil
        )
        end
      end

      # Filters the conformance packs based on an account ID, region, compliance type, and the name of the
      # conformance pack.
      struct AggregateConformancePackComplianceFilters
        include JSON::Serializable

        # The 12-digit Amazon Web Services account ID of the source account.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The source Amazon Web Services Region from where the data is aggregated.
        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # The compliance status of the conformance pack.
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        # The name of the conformance pack.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String?

        def initialize(
          @account_id : String? = nil,
          @aws_region : String? = nil,
          @compliance_type : String? = nil,
          @conformance_pack_name : String? = nil
        )
        end
      end

      # Provides a summary of compliance based on either account ID or region.
      struct AggregateConformancePackComplianceSummary
        include JSON::Serializable

        # Returns an AggregateConformancePackComplianceCount object.
        @[JSON::Field(key: "ComplianceSummary")]
        getter compliance_summary : Types::AggregateConformancePackComplianceCount?

        # Groups the result based on Amazon Web Services account ID or Amazon Web Services Region.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        def initialize(
          @compliance_summary : Types::AggregateConformancePackComplianceCount? = nil,
          @group_name : String? = nil
        )
        end
      end

      # Filters the results based on account ID and region.
      struct AggregateConformancePackComplianceSummaryFilters
        include JSON::Serializable

        # The 12-digit Amazon Web Services account ID of the source account.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The source Amazon Web Services Region from where the data is aggregated.
        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        def initialize(
          @account_id : String? = nil,
          @aws_region : String? = nil
        )
        end
      end

      # The details of an Config evaluation for an account ID and region in an aggregator. Provides the
      # Amazon Web Services resource that was evaluated, the compliance of the resource, related time
      # stamps, and supplementary information.
      struct AggregateEvaluationResult
        include JSON::Serializable

        # The 12-digit account ID of the source account.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Supplementary information about how the agrregate evaluation determined the compliance.
        @[JSON::Field(key: "Annotation")]
        getter annotation : String?

        # The source region from where the data is aggregated.
        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # The resource compliance status. For the AggregationEvaluationResult data type, Config supports only
        # the COMPLIANT and NON_COMPLIANT . Config does not support the NOT_APPLICABLE and INSUFFICIENT_DATA
        # value.
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        # The time when the Config rule evaluated the Amazon Web Services resource.
        @[JSON::Field(key: "ConfigRuleInvokedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter config_rule_invoked_time : Time?

        # Uniquely identifies the evaluation result.
        @[JSON::Field(key: "EvaluationResultIdentifier")]
        getter evaluation_result_identifier : Types::EvaluationResultIdentifier?

        # The time when Config recorded the aggregate evaluation result.
        @[JSON::Field(key: "ResultRecordedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter result_recorded_time : Time?

        def initialize(
          @account_id : String? = nil,
          @annotation : String? = nil,
          @aws_region : String? = nil,
          @compliance_type : String? = nil,
          @config_rule_invoked_time : Time? = nil,
          @evaluation_result_identifier : Types::EvaluationResultIdentifier? = nil,
          @result_recorded_time : Time? = nil
        )
        end
      end

      # The details that identify a resource that is collected by Config aggregator, including the resource
      # type, ID, (if available) the custom resource name, the source account, and source region.
      struct AggregateResourceIdentifier
        include JSON::Serializable

        # The ID of the Amazon Web Services resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the Amazon Web Services resource.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The 12-digit account ID of the source account.
        @[JSON::Field(key: "SourceAccountId")]
        getter source_account_id : String

        # The source region where data is aggregated.
        @[JSON::Field(key: "SourceRegion")]
        getter source_region : String

        # The name of the Amazon Web Services resource.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @resource_id : String,
          @resource_type : String,
          @source_account_id : String,
          @source_region : String,
          @resource_name : String? = nil
        )
        end
      end

      # The current sync status between the source and the aggregator account.
      struct AggregatedSourceStatus
        include JSON::Serializable

        # The region authorized to collect aggregated data.
        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # The error code that Config returned when the source account aggregation last failed.
        @[JSON::Field(key: "LastErrorCode")]
        getter last_error_code : String?

        # The message indicating that the source account aggregation failed due to an error.
        @[JSON::Field(key: "LastErrorMessage")]
        getter last_error_message : String?

        # Filters the last updated status type. Valid value FAILED indicates errors while moving data. Valid
        # value SUCCEEDED indicates the data was successfully moved. Valid value OUTDATED indicates the data
        # is not the most recent.
        @[JSON::Field(key: "LastUpdateStatus")]
        getter last_update_status : String?

        # The time of the last update.
        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        # The source account ID or an organization.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String?

        # The source account or an organization.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @aws_region : String? = nil,
          @last_error_code : String? = nil,
          @last_error_message : String? = nil,
          @last_update_status : String? = nil,
          @last_update_time : Time? = nil,
          @source_id : String? = nil,
          @source_type : String? = nil
        )
        end
      end

      # An object that represents the authorizations granted to aggregator accounts and regions.
      struct AggregationAuthorization
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the aggregation object.
        @[JSON::Field(key: "AggregationAuthorizationArn")]
        getter aggregation_authorization_arn : String?

        # The 12-digit account ID of the account authorized to aggregate data.
        @[JSON::Field(key: "AuthorizedAccountId")]
        getter authorized_account_id : String?

        # The region authorized to collect aggregated data.
        @[JSON::Field(key: "AuthorizedAwsRegion")]
        getter authorized_aws_region : String?

        # The time stamp when the aggregation authorization was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        def initialize(
          @aggregation_authorization_arn : String? = nil,
          @authorized_account_id : String? = nil,
          @authorized_aws_region : String? = nil,
          @creation_time : Time? = nil
        )
        end
      end

      # An object to filter the configuration recorders based on the resource types in scope for recording.
      struct AggregatorFilterResourceType
        include JSON::Serializable

        # The type of resource type filter to apply. INCLUDE specifies that the list of resource types in the
        # Value field will be aggregated and no other resource types will be filtered.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # Comma-separate list of resource types to filter your aggregated configuration recorders.
        @[JSON::Field(key: "Value")]
        getter value : Array(String)?

        def initialize(
          @type : String? = nil,
          @value : Array(String)? = nil
        )
        end
      end

      # An object to filter service-linked configuration recorders in an aggregator based on the linked
      # Amazon Web Services service.
      struct AggregatorFilterServicePrincipal
        include JSON::Serializable

        # The type of service principal filter to apply. INCLUDE specifies that the list of service principals
        # in the Value field will be aggregated and no other service principals will be filtered.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # Comma-separated list of service principals for the linked Amazon Web Services services to filter
        # your aggregated service-linked configuration recorders.
        @[JSON::Field(key: "Value")]
        getter value : Array(String)?

        def initialize(
          @type : String? = nil,
          @value : Array(String)? = nil
        )
        end
      end

      # An object to filter the data you specify for an aggregator.
      struct AggregatorFilters
        include JSON::Serializable

        # An object to filter the configuration recorders based on the resource types in scope for recording.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : Types::AggregatorFilterResourceType?

        # An object to filter service-linked configuration recorders in an aggregator based on the linked
        # Amazon Web Services service.
        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : Types::AggregatorFilterServicePrincipal?

        def initialize(
          @resource_type : Types::AggregatorFilterResourceType? = nil,
          @service_principal : Types::AggregatorFilterServicePrincipal? = nil
        )
        end
      end

      struct AssociateResourceTypesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the specified configuration recorder.
        @[JSON::Field(key: "ConfigurationRecorderArn")]
        getter configuration_recorder_arn : String

        # The list of resource types you want to add to the recording group of the specified configuration
        # recorder.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)

        def initialize(
          @configuration_recorder_arn : String,
          @resource_types : Array(String)
        )
        end
      end

      struct AssociateResourceTypesResponse
        include JSON::Serializable

        @[JSON::Field(key: "ConfigurationRecorder")]
        getter configuration_recorder : Types::ConfigurationRecorder

        def initialize(
          @configuration_recorder : Types::ConfigurationRecorder
        )
        end
      end

      # The detailed configurations of a specified resource.
      struct BaseConfigurationItem
        include JSON::Serializable

        # The 12-digit Amazon Web Services account ID associated with the resource.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The Availability Zone associated with the resource.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The region where the resource resides.
        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        # A JSON-encoded string that contains the contents for the resource configuration. This string needs
        # to be deserialized using json.loads() before you can access the contents.
        @[JSON::Field(key: "configuration")]
        getter configuration : String?

        # The time when the recording of configuration changes was initiated for the resource.
        @[JSON::Field(key: "configurationItemCaptureTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter configuration_item_capture_time : Time?

        # The time when configuration changes for the resource were delivered. This field is optional and is
        # not guaranteed to be present in a configuration item (CI). If you are using daily recording, this
        # field will be populated. However, if you are using continuous recording, this field will be omitted
        # since the delivery time is instantaneous as the CI is available right away. For more information on
        # daily recording and continuous recording, see Recording Frequency in the Config Developer Guide .
        @[JSON::Field(key: "configurationItemDeliveryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter configuration_item_delivery_time : Time?

        # The configuration item status. Valid values include: OK – The resource configuration has been
        # updated. ResourceDiscovered – The resource was newly discovered. ResourceNotRecorded – The resource
        # was discovered, but its configuration was not recorded since the recorder doesn't record resources
        # of this type. ResourceDeleted – The resource was deleted ResourceDeletedNotRecorded – The resource
        # was deleted, but its configuration was not recorded since the recorder doesn't record resources of
        # this type.
        @[JSON::Field(key: "configurationItemStatus")]
        getter configuration_item_status : String?

        # An identifier that indicates the ordering of the configuration items of a resource.
        @[JSON::Field(key: "configurationStateId")]
        getter configuration_state_id : String?

        # The recording frequency that Config uses to record configuration changes for the resource. This
        # field only appears in the API response when DAILY recording is enabled for a resource type. If this
        # field is not present, CONTINUOUS recording is enabled for that resource type. For more information
        # on daily recording and continuous recording, see Recording Frequency in the Config Developer Guide .
        @[JSON::Field(key: "recordingFrequency")]
        getter recording_frequency : String?

        # The time stamp when the resource was created.
        @[JSON::Field(key: "resourceCreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter resource_creation_time : Time?

        # The ID of the resource (for example., sg-xxxxxx).
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The custom name of the resource, if available.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # The type of Amazon Web Services resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # A string to string map that contains additional contents for the resource configuration.Config
        # returns this field for certain resource types to supplement the information returned for the
        # configuration field. This string needs to be deserialized using json.loads() before you can access
        # the contents.
        @[JSON::Field(key: "supplementaryConfiguration")]
        getter supplementary_configuration : Hash(String, String)?

        # The version number of the resource configuration.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @account_id : String? = nil,
          @arn : String? = nil,
          @availability_zone : String? = nil,
          @aws_region : String? = nil,
          @configuration : String? = nil,
          @configuration_item_capture_time : Time? = nil,
          @configuration_item_delivery_time : Time? = nil,
          @configuration_item_status : String? = nil,
          @configuration_state_id : String? = nil,
          @recording_frequency : String? = nil,
          @resource_creation_time : Time? = nil,
          @resource_id : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil,
          @supplementary_configuration : Hash(String, String)? = nil,
          @version : String? = nil
        )
        end
      end

      struct BatchGetAggregateResourceConfigRequest
        include JSON::Serializable

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        # A list of aggregate ResourceIdentifiers objects.
        @[JSON::Field(key: "ResourceIdentifiers")]
        getter resource_identifiers : Array(Types::AggregateResourceIdentifier)

        def initialize(
          @configuration_aggregator_name : String,
          @resource_identifiers : Array(Types::AggregateResourceIdentifier)
        )
        end
      end

      struct BatchGetAggregateResourceConfigResponse
        include JSON::Serializable

        # A list that contains the current configuration of one or more resources.
        @[JSON::Field(key: "BaseConfigurationItems")]
        getter base_configuration_items : Array(Types::BaseConfigurationItem)?

        # A list of resource identifiers that were not processed with current scope. The list is empty if all
        # the resources are processed.
        @[JSON::Field(key: "UnprocessedResourceIdentifiers")]
        getter unprocessed_resource_identifiers : Array(Types::AggregateResourceIdentifier)?

        def initialize(
          @base_configuration_items : Array(Types::BaseConfigurationItem)? = nil,
          @unprocessed_resource_identifiers : Array(Types::AggregateResourceIdentifier)? = nil
        )
        end
      end

      struct BatchGetResourceConfigRequest
        include JSON::Serializable

        # A list of resource keys to be processed with the current request. Each element in the list consists
        # of the resource type and resource ID.
        @[JSON::Field(key: "resourceKeys")]
        getter resource_keys : Array(Types::ResourceKey)

        def initialize(
          @resource_keys : Array(Types::ResourceKey)
        )
        end
      end

      struct BatchGetResourceConfigResponse
        include JSON::Serializable

        # A list that contains the current configuration of one or more resources.
        @[JSON::Field(key: "baseConfigurationItems")]
        getter base_configuration_items : Array(Types::BaseConfigurationItem)?

        # A list of resource keys that were not processed with the current response. The
        # unprocessesResourceKeys value is in the same form as ResourceKeys, so the value can be directly
        # provided to a subsequent BatchGetResourceConfig operation. If there are no unprocessed resource
        # keys, the response contains an empty unprocessedResourceKeys list.
        @[JSON::Field(key: "unprocessedResourceKeys")]
        getter unprocessed_resource_keys : Array(Types::ResourceKey)?

        def initialize(
          @base_configuration_items : Array(Types::BaseConfigurationItem)? = nil,
          @unprocessed_resource_keys : Array(Types::ResourceKey)? = nil
        )
        end
      end

      # Indicates whether an Amazon Web Services resource or Config rule is compliant and provides the
      # number of contributors that affect the compliance.
      struct Compliance
        include JSON::Serializable

        # The number of Amazon Web Services resources or Config rules that cause a result of NON_COMPLIANT ,
        # up to a maximum number.
        @[JSON::Field(key: "ComplianceContributorCount")]
        getter compliance_contributor_count : Types::ComplianceContributorCount?

        # Indicates whether an Amazon Web Services resource or Config rule is compliant. A resource is
        # compliant if it complies with all of the Config rules that evaluate it. A resource is noncompliant
        # if it does not comply with one or more of these rules. A rule is compliant if all of the resources
        # that the rule evaluates comply with it. A rule is noncompliant if any of these resources do not
        # comply. Config returns the INSUFFICIENT_DATA value when no evaluation results are available for the
        # Amazon Web Services resource or Config rule. For the Compliance data type, Config supports only
        # COMPLIANT , NON_COMPLIANT , and INSUFFICIENT_DATA values. Config does not support the NOT_APPLICABLE
        # value for the Compliance data type.
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        def initialize(
          @compliance_contributor_count : Types::ComplianceContributorCount? = nil,
          @compliance_type : String? = nil
        )
        end
      end

      # Indicates whether an Config rule is compliant. A rule is compliant if all of the resources that the
      # rule evaluated comply with it. A rule is noncompliant if any of these resources do not comply.
      struct ComplianceByConfigRule
        include JSON::Serializable

        # Indicates whether the Config rule is compliant.
        @[JSON::Field(key: "Compliance")]
        getter compliance : Types::Compliance?

        # The name of the Config rule.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String?

        def initialize(
          @compliance : Types::Compliance? = nil,
          @config_rule_name : String? = nil
        )
        end
      end

      # Indicates whether an Amazon Web Services resource that is evaluated according to one or more Config
      # rules is compliant. A resource is compliant if it complies with all of the rules that evaluate it. A
      # resource is noncompliant if it does not comply with one or more of these rules.
      struct ComplianceByResource
        include JSON::Serializable

        # Indicates whether the Amazon Web Services resource complies with all of the Config rules that
        # evaluated it.
        @[JSON::Field(key: "Compliance")]
        getter compliance : Types::Compliance?

        # The ID of the Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of the Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @compliance : Types::Compliance? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The number of Amazon Web Services resources or Config rules responsible for the current compliance
      # of the item, up to a maximum number.
      struct ComplianceContributorCount
        include JSON::Serializable

        # Indicates whether the maximum count is reached.
        @[JSON::Field(key: "CapExceeded")]
        getter cap_exceeded : Bool?

        # The number of Amazon Web Services resources or Config rules responsible for the current compliance
        # of the item.
        @[JSON::Field(key: "CappedCount")]
        getter capped_count : Int32?

        def initialize(
          @cap_exceeded : Bool? = nil,
          @capped_count : Int32? = nil
        )
        end
      end

      # The number of Config rules or Amazon Web Services resources that are compliant and noncompliant.
      struct ComplianceSummary
        include JSON::Serializable

        # The time that Config created the compliance summary.
        @[JSON::Field(key: "ComplianceSummaryTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter compliance_summary_timestamp : Time?

        # The number of Config rules or Amazon Web Services resources that are compliant, up to a maximum of
        # 25 for rules and 100 for resources.
        @[JSON::Field(key: "CompliantResourceCount")]
        getter compliant_resource_count : Types::ComplianceContributorCount?

        # The number of Config rules or Amazon Web Services resources that are noncompliant, up to a maximum
        # of 25 for rules and 100 for resources.
        @[JSON::Field(key: "NonCompliantResourceCount")]
        getter non_compliant_resource_count : Types::ComplianceContributorCount?

        def initialize(
          @compliance_summary_timestamp : Time? = nil,
          @compliant_resource_count : Types::ComplianceContributorCount? = nil,
          @non_compliant_resource_count : Types::ComplianceContributorCount? = nil
        )
        end
      end

      # The number of Amazon Web Services resources of a specific type that are compliant or noncompliant,
      # up to a maximum of 100 for each.
      struct ComplianceSummaryByResourceType
        include JSON::Serializable

        # The number of Amazon Web Services resources that are compliant or noncompliant, up to a maximum of
        # 100 for each.
        @[JSON::Field(key: "ComplianceSummary")]
        getter compliance_summary : Types::ComplianceSummary?

        # The type of Amazon Web Services resource.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @compliance_summary : Types::ComplianceSummary? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Provides status of the delivery of the snapshot or the configuration history to the specified Amazon
      # S3 bucket. Also provides the status of notifications about the Amazon S3 delivery to the specified
      # Amazon SNS topic.
      struct ConfigExportDeliveryInfo
        include JSON::Serializable

        # The time of the last attempted delivery.
        @[JSON::Field(key: "lastAttemptTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_attempt_time : Time?

        # The error code from the last attempted delivery.
        @[JSON::Field(key: "lastErrorCode")]
        getter last_error_code : String?

        # The error message from the last attempted delivery.
        @[JSON::Field(key: "lastErrorMessage")]
        getter last_error_message : String?

        # Status of the last attempted delivery.
        @[JSON::Field(key: "lastStatus")]
        getter last_status : String?

        # The time of the last successful delivery.
        @[JSON::Field(key: "lastSuccessfulTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_successful_time : Time?

        # The time that the next delivery occurs.
        @[JSON::Field(key: "nextDeliveryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter next_delivery_time : Time?

        def initialize(
          @last_attempt_time : Time? = nil,
          @last_error_code : String? = nil,
          @last_error_message : String? = nil,
          @last_status : String? = nil,
          @last_successful_time : Time? = nil,
          @next_delivery_time : Time? = nil
        )
        end
      end

      # Config rules evaluate the configuration settings of your Amazon Web Services resources. A rule can
      # run when Config detects a configuration change to an Amazon Web Services resource or at a periodic
      # frequency that you choose (for example, every 24 hours). There are two types of rules: Config
      # Managed Rules and Config Custom Rules . Config Managed Rules are predefined, customizable rules
      # created by Config. For a list of managed rules, see List of Config Managed Rules . Config Custom
      # Rules are rules that you create from scratch. There are two ways to create Config custom rules: with
      # Lambda functions ( Lambda Developer Guide ) and with Guard ( Guard GitHub Repository ), a
      # policy-as-code language. Config custom rules created with Lambda are called Config Custom Lambda
      # Rules and Config custom rules created with Guard are called Config Custom Policy Rules . For more
      # information about developing and using Config rules, see Evaluating Resource with Config Rules in
      # the Config Developer Guide . You can use the Amazon Web Services CLI and Amazon Web Services SDKs if
      # you want to create a rule that triggers evaluations for your resources when Config delivers the
      # configuration snapshot. For more information, see ConfigSnapshotDeliveryProperties .
      struct ConfigRule
        include JSON::Serializable

        # Provides the rule owner ( Amazon Web Services for managed rules, CUSTOM_POLICY for Custom Policy
        # rules, and CUSTOM_LAMBDA for Custom Lambda rules), the rule identifier, and the notifications that
        # cause the function to evaluate your Amazon Web Services resources.
        @[JSON::Field(key: "Source")]
        getter source : Types::Source

        # The Amazon Resource Name (ARN) of the Config rule.
        @[JSON::Field(key: "ConfigRuleArn")]
        getter config_rule_arn : String?

        # The ID of the Config rule.
        @[JSON::Field(key: "ConfigRuleId")]
        getter config_rule_id : String?

        # The name that you assign to the Config rule. The name is required if you are adding a new rule.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String?

        # Indicates whether the Config rule is active or is currently being deleted by Config. It can also
        # indicate the evaluation status for the Config rule. Config sets the state of the rule to EVALUATING
        # temporarily after you use the StartConfigRulesEvaluation request to evaluate your resources against
        # the Config rule. Config sets the state of the rule to DELETING_RESULTS temporarily after you use the
        # DeleteEvaluationResults request to delete the current evaluation results for the Config rule. Config
        # temporarily sets the state of a rule to DELETING after you use the DeleteConfigRule request to
        # delete the rule. After Config deletes the rule, the rule and all of its evaluations are erased and
        # are no longer available.
        @[JSON::Field(key: "ConfigRuleState")]
        getter config_rule_state : String?

        # Service principal name of the service that created the rule. The field is populated only if the
        # service-linked rule is created by a service. The field is empty if you create your own rule.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The description that you provide for the Config rule.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The modes the Config rule can be evaluated in. The valid values are distinct objects. By default,
        # the value is Detective evaluation mode only.
        @[JSON::Field(key: "EvaluationModes")]
        getter evaluation_modes : Array(Types::EvaluationModeConfiguration)?

        # A string, in JSON format, that is passed to the Config rule Lambda function.
        @[JSON::Field(key: "InputParameters")]
        getter input_parameters : String?

        # The maximum frequency with which Config runs evaluations for a rule. You can specify a value for
        # MaximumExecutionFrequency when: This is for an Config managed rule that is triggered at a periodic
        # frequency. Your custom rule is triggered when Config delivers the configuration snapshot. For more
        # information, see ConfigSnapshotDeliveryProperties . By default, rules with a periodic trigger are
        # evaluated every 24 hours. To change the frequency, specify a valid value for the
        # MaximumExecutionFrequency parameter.
        @[JSON::Field(key: "MaximumExecutionFrequency")]
        getter maximum_execution_frequency : String?

        # Defines which resources can trigger an evaluation for the rule. The scope can include one or more
        # resource types, a combination of one resource type and one resource ID, or a combination of a tag
        # key and value. Specify a scope to constrain the resources that can trigger an evaluation for the
        # rule. If you do not specify a scope, evaluations are triggered when any resource in the recording
        # group changes.
        @[JSON::Field(key: "Scope")]
        getter scope : Types::Scope?

        def initialize(
          @source : Types::Source,
          @config_rule_arn : String? = nil,
          @config_rule_id : String? = nil,
          @config_rule_name : String? = nil,
          @config_rule_state : String? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @evaluation_modes : Array(Types::EvaluationModeConfiguration)? = nil,
          @input_parameters : String? = nil,
          @maximum_execution_frequency : String? = nil,
          @scope : Types::Scope? = nil
        )
        end
      end

      # Filters the compliance results based on account ID, region, compliance type, and rule name.
      struct ConfigRuleComplianceFilters
        include JSON::Serializable

        # The 12-digit account ID of the source account.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The source region where the data is aggregated.
        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # The rule compliance status. For the ConfigRuleComplianceFilters data type, Config supports only
        # COMPLIANT and NON_COMPLIANT . Config does not support the NOT_APPLICABLE and the INSUFFICIENT_DATA
        # values.
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        # The name of the Config rule.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String?

        def initialize(
          @account_id : String? = nil,
          @aws_region : String? = nil,
          @compliance_type : String? = nil,
          @config_rule_name : String? = nil
        )
        end
      end

      # Filters the results based on the account IDs and regions.
      struct ConfigRuleComplianceSummaryFilters
        include JSON::Serializable

        # The 12-digit account ID of the source account.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The source region where the data is aggregated.
        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        def initialize(
          @account_id : String? = nil,
          @aws_region : String? = nil
        )
        end
      end

      # Status information for your Config Managed rules and Config Custom Policy rules. The status includes
      # information such as the last time the rule ran, the last time it failed, and the related error for
      # the last failure. This operation does not return status information about Config Custom Lambda
      # rules.
      struct ConfigRuleEvaluationStatus
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Config rule.
        @[JSON::Field(key: "ConfigRuleArn")]
        getter config_rule_arn : String?

        # The ID of the Config rule.
        @[JSON::Field(key: "ConfigRuleId")]
        getter config_rule_id : String?

        # The name of the Config rule.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String?

        # The time that you first activated the Config rule.
        @[JSON::Field(key: "FirstActivatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter first_activated_time : Time?

        # Indicates whether Config has evaluated your resources against the rule at least once. true - Config
        # has evaluated your Amazon Web Services resources against the rule at least once. false - Config has
        # not finished evaluating your Amazon Web Services resources against the rule at least once.
        @[JSON::Field(key: "FirstEvaluationStarted")]
        getter first_evaluation_started : Bool?

        # The time that you last turned off the Config rule.
        @[JSON::Field(key: "LastDeactivatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_deactivated_time : Time?

        # The status of the last attempted delivery of a debug log for your Config Custom Policy rules. Either
        # Successful or Failed .
        @[JSON::Field(key: "LastDebugLogDeliveryStatus")]
        getter last_debug_log_delivery_status : String?

        # The reason Config was not able to deliver a debug log. This is for the last failed attempt to
        # retrieve a debug log for your Config Custom Policy rules.
        @[JSON::Field(key: "LastDebugLogDeliveryStatusReason")]
        getter last_debug_log_delivery_status_reason : String?

        # The time Config last attempted to deliver a debug log for your Config Custom Policy rules.
        @[JSON::Field(key: "LastDebugLogDeliveryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_debug_log_delivery_time : Time?

        # The error code that Config returned when the rule last failed.
        @[JSON::Field(key: "LastErrorCode")]
        getter last_error_code : String?

        # The error message that Config returned when the rule last failed.
        @[JSON::Field(key: "LastErrorMessage")]
        getter last_error_message : String?

        # The time that Config last failed to evaluate your Amazon Web Services resources against the rule.
        @[JSON::Field(key: "LastFailedEvaluationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_failed_evaluation_time : Time?

        # The time that Config last failed to invoke the Config rule to evaluate your Amazon Web Services
        # resources.
        @[JSON::Field(key: "LastFailedInvocationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_failed_invocation_time : Time?

        # The time that Config last successfully evaluated your Amazon Web Services resources against the
        # rule.
        @[JSON::Field(key: "LastSuccessfulEvaluationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_successful_evaluation_time : Time?

        # The time that Config last successfully invoked the Config rule to evaluate your Amazon Web Services
        # resources.
        @[JSON::Field(key: "LastSuccessfulInvocationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_successful_invocation_time : Time?

        def initialize(
          @config_rule_arn : String? = nil,
          @config_rule_id : String? = nil,
          @config_rule_name : String? = nil,
          @first_activated_time : Time? = nil,
          @first_evaluation_started : Bool? = nil,
          @last_deactivated_time : Time? = nil,
          @last_debug_log_delivery_status : String? = nil,
          @last_debug_log_delivery_status_reason : String? = nil,
          @last_debug_log_delivery_time : Time? = nil,
          @last_error_code : String? = nil,
          @last_error_message : String? = nil,
          @last_failed_evaluation_time : Time? = nil,
          @last_failed_invocation_time : Time? = nil,
          @last_successful_evaluation_time : Time? = nil,
          @last_successful_invocation_time : Time? = nil
        )
        end
      end

      # Provides options for how often Config delivers configuration snapshots to the Amazon S3 bucket in
      # your delivery channel. The frequency for a rule that triggers evaluations for your resources when
      # Config delivers the configuration snapshot is set by one of two values, depending on which is less
      # frequent: The value for the deliveryFrequency parameter within the delivery channel configuration,
      # which sets how often Config delivers configuration snapshots. This value also sets how often Config
      # invokes evaluations for Config rules. The value for the MaximumExecutionFrequency parameter, which
      # sets the maximum frequency with which Config invokes evaluations for the rule. For more information,
      # see ConfigRule . If the deliveryFrequency value is less frequent than the MaximumExecutionFrequency
      # value for a rule, Config invokes the rule only as often as the deliveryFrequency value. For example,
      # you want your rule to run evaluations when Config delivers the configuration snapshot. You specify
      # the MaximumExecutionFrequency value for Six_Hours . You then specify the delivery channel
      # deliveryFrequency value for TwentyFour_Hours . Because the value for deliveryFrequency is less
      # frequent than MaximumExecutionFrequency , Config invokes evaluations for the rule every 24 hours.
      # You should set the MaximumExecutionFrequency value to be at least as frequent as the
      # deliveryFrequency value. You can view the deliveryFrequency value by using the
      # DescribeDeliveryChannnels action. To update the deliveryFrequency with which Config delivers your
      # configuration snapshots, use the PutDeliveryChannel action.
      struct ConfigSnapshotDeliveryProperties
        include JSON::Serializable

        # The frequency with which Config delivers configuration snapshots.
        @[JSON::Field(key: "deliveryFrequency")]
        getter delivery_frequency : String?

        def initialize(
          @delivery_frequency : String? = nil
        )
        end
      end

      # A list that contains the status of the delivery of the configuration stream notification to the
      # Amazon SNS topic.
      struct ConfigStreamDeliveryInfo
        include JSON::Serializable

        # The error code from the last attempted delivery.
        @[JSON::Field(key: "lastErrorCode")]
        getter last_error_code : String?

        # The error message from the last attempted delivery.
        @[JSON::Field(key: "lastErrorMessage")]
        getter last_error_message : String?

        # Status of the last attempted delivery. Note Providing an SNS topic on a DeliveryChannel for Config
        # is optional. If the SNS delivery is turned off, the last status will be Not_Applicable .
        @[JSON::Field(key: "lastStatus")]
        getter last_status : String?

        # The time from the last status change.
        @[JSON::Field(key: "lastStatusChangeTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_status_change_time : Time?

        def initialize(
          @last_error_code : String? = nil,
          @last_error_message : String? = nil,
          @last_status : String? = nil,
          @last_status_change_time : Time? = nil
        )
        end
      end

      # The details about the configuration aggregator, including information about source accounts,
      # regions, and metadata of the aggregator.
      struct ConfigurationAggregator
        include JSON::Serializable

        # Provides a list of source accounts and regions to be aggregated.
        @[JSON::Field(key: "AccountAggregationSources")]
        getter account_aggregation_sources : Array(Types::AccountAggregationSource)?

        # An object to filter the data you specify for an aggregator.
        @[JSON::Field(key: "AggregatorFilters")]
        getter aggregator_filters : Types::AggregatorFilters?

        # The Amazon Resource Name (ARN) of the aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorArn")]
        getter configuration_aggregator_arn : String?

        # The name of the aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String?

        # Amazon Web Services service that created the configuration aggregator.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The time stamp when the configuration aggregator was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The time of the last update.
        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # Provides an organization and list of regions to be aggregated.
        @[JSON::Field(key: "OrganizationAggregationSource")]
        getter organization_aggregation_source : Types::OrganizationAggregationSource?

        def initialize(
          @account_aggregation_sources : Array(Types::AccountAggregationSource)? = nil,
          @aggregator_filters : Types::AggregatorFilters? = nil,
          @configuration_aggregator_arn : String? = nil,
          @configuration_aggregator_name : String? = nil,
          @created_by : String? = nil,
          @creation_time : Time? = nil,
          @last_updated_time : Time? = nil,
          @organization_aggregation_source : Types::OrganizationAggregationSource? = nil
        )
        end
      end

      # A list that contains detailed configurations of a specified resource.
      struct ConfigurationItem
        include JSON::Serializable

        # The 12-digit Amazon Web Services account ID associated with the resource.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Amazon Resource Name (ARN) associated with the resource.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The Availability Zone associated with the resource.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The region where the resource resides.
        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        # A JSON-encoded string that contains the contents for the resource configuration. This string needs
        # to be deserialized using json.loads() before you can access the contents.
        @[JSON::Field(key: "configuration")]
        getter configuration : String?

        # The time when the recording of configuration changes was initiated for the resource.
        @[JSON::Field(key: "configurationItemCaptureTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter configuration_item_capture_time : Time?

        # The time when configuration changes for the resource were delivered. This field is optional and is
        # not guaranteed to be present in a configuration item (CI). If you are using daily recording, this
        # field will be populated. However, if you are using continuous recording, this field will be omitted
        # since the delivery time is instantaneous as the CI is available right away. For more information on
        # daily recording and continuous recording, see Recording Frequency in the Config Developer Guide .
        @[JSON::Field(key: "configurationItemDeliveryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter configuration_item_delivery_time : Time?

        # Unique MD5 hash that represents the configuration item's state. You can use MD5 hash to compare the
        # states of two or more configuration items that are associated with the same resource.
        @[JSON::Field(key: "configurationItemMD5Hash")]
        getter configuration_item_md5_hash : String?

        # The configuration item status. Valid values include: OK – The resource configuration has been
        # updated ResourceDiscovered – The resource was newly discovered ResourceNotRecorded – The resource
        # was discovered but its configuration was not recorded since the recorder doesn't record resources of
        # this type ResourceDeleted – The resource was deleted ResourceDeletedNotRecorded – The resource was
        # deleted but its configuration was not recorded since the recorder doesn't record resources of this
        # type
        @[JSON::Field(key: "configurationItemStatus")]
        getter configuration_item_status : String?

        # An identifier that indicates the ordering of the configuration items of a resource.
        @[JSON::Field(key: "configurationStateId")]
        getter configuration_state_id : String?

        # The recording frequency that Config uses to record configuration changes for the resource. This
        # field only appears in the API response when DAILY recording is enabled for a resource type. If this
        # field is not present, CONTINUOUS recording is enabled for that resource type. For more information
        # on daily recording and continuous recording, see Recording Frequency in the Config Developer Guide .
        @[JSON::Field(key: "recordingFrequency")]
        getter recording_frequency : String?

        # A list of CloudTrail event IDs. A populated field indicates that the current configuration was
        # initiated by the events recorded in the CloudTrail log. For more information about CloudTrail, see
        # What Is CloudTrail . An empty field indicates that the current configuration was not initiated by
        # any event. As of Version 1.3, the relatedEvents field is empty. You can access the LookupEvents API
        # in the CloudTrail API Reference to retrieve the events for the resource.
        @[JSON::Field(key: "relatedEvents")]
        getter related_events : Array(String)?

        # A list of related Amazon Web Services resources.
        @[JSON::Field(key: "relationships")]
        getter relationships : Array(Types::Relationship)?

        # The time stamp when the resource was created.
        @[JSON::Field(key: "resourceCreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter resource_creation_time : Time?

        # The ID of the resource (for example, sg-xxxxxx ).
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The custom name of the resource, if available.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # The type of Amazon Web Services resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # A string to string map that contains additional contents for the resource configuration.Config
        # returns this field for certain resource types to supplement the information returned for the
        # configuration field. This string to string map needs to be deserialized using json.loads() before
        # you can accessing the contents.
        @[JSON::Field(key: "supplementaryConfiguration")]
        getter supplementary_configuration : Hash(String, String)?

        # A mapping of key value tags associated with the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The version number of the resource configuration.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @account_id : String? = nil,
          @arn : String? = nil,
          @availability_zone : String? = nil,
          @aws_region : String? = nil,
          @configuration : String? = nil,
          @configuration_item_capture_time : Time? = nil,
          @configuration_item_delivery_time : Time? = nil,
          @configuration_item_md5_hash : String? = nil,
          @configuration_item_status : String? = nil,
          @configuration_state_id : String? = nil,
          @recording_frequency : String? = nil,
          @related_events : Array(String)? = nil,
          @relationships : Array(Types::Relationship)? = nil,
          @resource_creation_time : Time? = nil,
          @resource_id : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil,
          @supplementary_configuration : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil,
          @version : String? = nil
        )
        end
      end

      # Records configuration changes to the resource types in scope. For more information about the
      # configuration recorder, see Working with the Configuration Recorder in the Config Developer Guide .
      struct ConfigurationRecorder
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the specified configuration recorder.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the configuration recorder. For customer managed configuration recorders, Config
        # automatically assigns the name of "default" when creating a configuration recorder if you do not
        # specify a name at creation time. For service-linked configuration recorders, Config automatically
        # assigns a name that has the prefix " AWSConfigurationRecorderFor " to a new service-linked
        # configuration recorder. Changing the name of a configuration recorder To change the name of the
        # customer managed configuration recorder, you must delete it and create a new customer managed
        # configuration recorder with a new name. You cannot change the name of a service-linked configuration
        # recorder.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Specifies which resource types are in scope for the configuration recorder to record. High Number of
        # Config Evaluations You might notice increased activity in your account during your initial month
        # recording with Config when compared to subsequent months. During the initial bootstrapping process,
        # Config runs evaluations on all the resources in your account that you have selected for Config to
        # record. If you are running ephemeral workloads, you may see increased activity from Config as it
        # records configuration changes associated with creating and deleting these temporary resources. An
        # ephemeral workload is a temporary use of computing resources that are loaded and run when needed.
        # Examples include Amazon Elastic Compute Cloud (Amazon EC2) Spot Instances, Amazon EMR jobs, and Auto
        # Scaling. If you want to avoid the increased activity from running ephemeral workloads, you can set
        # up the configuration recorder to exclude these resource types from being recorded, or run these
        # types of workloads in a separate account with Config turned off to avoid increased configuration
        # recording and rule evaluations.
        @[JSON::Field(key: "recordingGroup")]
        getter recording_group : Types::RecordingGroup?

        # Specifies the default recording frequency for the configuration recorder. Config supports Continuous
        # recording and Daily recording . Continuous recording allows you to record configuration changes
        # continuously whenever a change occurs. Daily recording allows you to receive a configuration item
        # (CI) representing the most recent state of your resources over the last 24-hour period, only if it’s
        # different from the previous CI recorded. Some resource types require continuous recording Firewall
        # Manager depends on continuous recording to monitor your resources. If you are using Firewall
        # Manager, it is recommended that you set the recording frequency to Continuous. You can also override
        # the recording frequency for specific resource types.
        @[JSON::Field(key: "recordingMode")]
        getter recording_mode : Types::RecordingMode?

        # Specifies whether the ConfigurationItems in scope for the specified configuration recorder are
        # recorded for free ( INTERNAL ) or if it impacts the costs to your bill ( PAID ).
        @[JSON::Field(key: "recordingScope")]
        getter recording_scope : String?

        # The Amazon Resource Name (ARN) of the IAM role assumed by Config and used by the specified
        # configuration recorder. The server will reject a request without a defined roleARN for the
        # configuration recorder While the API model does not require this field, the server will reject a
        # request without a defined roleARN for the configuration recorder. Policies and compliance results
        # IAM policies and other policies managed in Organizations can impact whether Config has permissions
        # to record configuration changes for your resources. Additionally, rules directly evaluate the
        # configuration of a resource and rules don't take into account these policies when running
        # evaluations. Make sure that the policies in effect align with how you intend to use Config. Keep
        # Minimum Permisions When Reusing an IAM role If you use an Amazon Web Services service that uses
        # Config, such as Security Hub CSPM or Control Tower, and an IAM role has already been created, make
        # sure that the IAM role that you use when setting up Config keeps the same minimum permissions as the
        # pre-existing IAM role. You must do this to ensure that the other Amazon Web Services service
        # continues to run as expected. For example, if Control Tower has an IAM role that allows Config to
        # read S3 objects, make sure that the same permissions are granted to the IAM role you use when
        # setting up Config. Otherwise, it may interfere with how Control Tower operates. The service-linked
        # IAM role for Config must be used for service-linked configuration recorders For service-linked
        # configuration recorders, you must use the service-linked IAM role for Config:
        # AWSServiceRoleForConfig .
        @[JSON::Field(key: "roleARN")]
        getter role_arn : String?

        # For service-linked configuration recorders, specifies the linked Amazon Web Services service for the
        # configuration recorder.
        @[JSON::Field(key: "servicePrincipal")]
        getter service_principal : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @recording_group : Types::RecordingGroup? = nil,
          @recording_mode : Types::RecordingMode? = nil,
          @recording_scope : String? = nil,
          @role_arn : String? = nil,
          @service_principal : String? = nil
        )
        end
      end

      # Filters configuration recorders by recording scope.
      struct ConfigurationRecorderFilter
        include JSON::Serializable

        # The name of the type of filter. Currently, only recordingScope is supported.
        @[JSON::Field(key: "filterName")]
        getter filter_name : String?

        # The value of the filter. For recordingScope , valid values include: INTERNAL and PAID . INTERNAL
        # indicates that the ConfigurationItems in scope for the configuration recorder are recorded for free.
        # PAID indicates that the ConfigurationItems in scope for the configuration recorder impact the costs
        # to your bill.
        @[JSON::Field(key: "filterValue")]
        getter filter_value : Array(String)?

        def initialize(
          @filter_name : String? = nil,
          @filter_value : Array(String)? = nil
        )
        end
      end

      # The current status of the configuration recorder. For a detailed status of recording events over
      # time, add your Config events to CloudWatch metrics and use CloudWatch metrics.
      struct ConfigurationRecorderStatus
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration recorder.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The latest error code from when the recorder last failed.
        @[JSON::Field(key: "lastErrorCode")]
        getter last_error_code : String?

        # The latest error message from when the recorder last failed.
        @[JSON::Field(key: "lastErrorMessage")]
        getter last_error_message : String?

        # The time the recorder was last started.
        @[JSON::Field(key: "lastStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_start_time : Time?

        # The status of the latest recording event processed by the recorder.
        @[JSON::Field(key: "lastStatus")]
        getter last_status : String?

        # The time of the latest change in status of an recording event processed by the recorder.
        @[JSON::Field(key: "lastStatusChangeTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_status_change_time : Time?

        # The time the recorder was last stopped.
        @[JSON::Field(key: "lastStopTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_stop_time : Time?

        # The name of the configuration recorder.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Specifies whether or not the recorder is currently recording.
        @[JSON::Field(key: "recording")]
        getter recording : Bool?

        # For service-linked configuration recorders, the service principal of the linked Amazon Web Services
        # service.
        @[JSON::Field(key: "servicePrincipal")]
        getter service_principal : String?

        def initialize(
          @arn : String? = nil,
          @last_error_code : String? = nil,
          @last_error_message : String? = nil,
          @last_start_time : Time? = nil,
          @last_status : String? = nil,
          @last_status_change_time : Time? = nil,
          @last_stop_time : Time? = nil,
          @name : String? = nil,
          @recording : Bool? = nil,
          @service_principal : String? = nil
        )
        end
      end

      # A summary of a configuration recorder, including the arn , name , servicePrincipal , and
      # recordingScope .
      struct ConfigurationRecorderSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration recorder.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the configuration recorder.
        @[JSON::Field(key: "name")]
        getter name : String

        # Indicates whether the ConfigurationItems in scope for the configuration recorder are recorded for
        # free ( INTERNAL ) or if you are charged a service fee for recording ( PAID ).
        @[JSON::Field(key: "recordingScope")]
        getter recording_scope : String

        # For service-linked configuration recorders, indicates which Amazon Web Services service the
        # configuration recorder is linked to.
        @[JSON::Field(key: "servicePrincipal")]
        getter service_principal : String?

        def initialize(
          @arn : String,
          @name : String,
          @recording_scope : String,
          @service_principal : String? = nil
        )
        end
      end

      # For PutServiceLinkedConfigurationRecorder , you cannot create a service-linked recorder because a
      # service-linked recorder already exists for the specified service. For
      # DeleteServiceLinkedConfigurationRecorder , you cannot delete the service-linked recorder because it
      # is currently in use by the linked Amazon Web Services service. For DeleteDeliveryChannel , you
      # cannot delete the specified delivery channel because the customer managed configuration recorder is
      # running. Use the StopConfigurationRecorder operation to stop the customer managed configuration
      # recorder. For AssociateResourceTypes and DisassociateResourceTypes , one of the following errors:
      # For service-linked configuration recorders, the configuration recorder is not in use by the service.
      # No association or dissociation of resource types is permitted. For service-linked configuration
      # recorders, your requested change to the configuration recorder has been denied by its linked Amazon
      # Web Services service.
      struct ConflictException
        include JSON::Serializable

        def initialize
        end
      end

      # Filters the conformance pack by compliance types and Config rule names.
      struct ConformancePackComplianceFilters
        include JSON::Serializable

        # Filters the results by compliance. The allowed values are COMPLIANT and NON_COMPLIANT .
        # INSUFFICIENT_DATA is not supported.
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        # Filters the results by Config rule names.
        @[JSON::Field(key: "ConfigRuleNames")]
        getter config_rule_names : Array(String)?

        def initialize(
          @compliance_type : String? = nil,
          @config_rule_names : Array(String)? = nil
        )
        end
      end

      # A compliance score is the percentage of the number of compliant rule-resource combinations in a
      # conformance pack compared to the number of total possible rule-resource combinations in the
      # conformance pack. This metric provides you with a high-level view of the compliance state of your
      # conformance packs. You can use it to identify, investigate, and understand the level of compliance
      # in your conformance packs.
      struct ConformancePackComplianceScore
        include JSON::Serializable

        # The name of the conformance pack.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String?

        # The time that the conformance pack compliance score was last updated.
        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # Compliance score for the conformance pack. Conformance packs with no evaluation results will have a
        # compliance score of INSUFFICIENT_DATA .
        @[JSON::Field(key: "Score")]
        getter score : String?

        def initialize(
          @conformance_pack_name : String? = nil,
          @last_updated_time : Time? = nil,
          @score : String? = nil
        )
        end
      end

      # A list of filters to apply to the conformance pack compliance score result set.
      struct ConformancePackComplianceScoresFilters
        include JSON::Serializable

        # The names of the conformance packs whose compliance scores you want to include in the conformance
        # pack compliance score result set. You can include up to 25 conformance packs in the
        # ConformancePackNames array of strings, each with a character limit of 256 characters for the
        # conformance pack name.
        @[JSON::Field(key: "ConformancePackNames")]
        getter conformance_pack_names : Array(String)

        def initialize(
          @conformance_pack_names : Array(String)
        )
        end
      end

      # Summary includes the name and status of the conformance pack.
      struct ConformancePackComplianceSummary
        include JSON::Serializable

        # The status of the conformance pack.
        @[JSON::Field(key: "ConformancePackComplianceStatus")]
        getter conformance_pack_compliance_status : String

        # The name of the conformance pack name.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String

        def initialize(
          @conformance_pack_compliance_status : String,
          @conformance_pack_name : String
        )
        end
      end

      # Returns details of a conformance pack. A conformance pack is a collection of Config rules and
      # remediation actions that can be easily deployed in an account and a region.
      struct ConformancePackDetail
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the conformance pack.
        @[JSON::Field(key: "ConformancePackArn")]
        getter conformance_pack_arn : String

        # ID of the conformance pack.
        @[JSON::Field(key: "ConformancePackId")]
        getter conformance_pack_id : String

        # Name of the conformance pack.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String

        # A list of ConformancePackInputParameter objects.
        @[JSON::Field(key: "ConformancePackInputParameters")]
        getter conformance_pack_input_parameters : Array(Types::ConformancePackInputParameter)?

        # The Amazon Web Services service that created the conformance pack.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The name of the Amazon S3 bucket where Config stores conformance pack templates. This field is
        # optional.
        @[JSON::Field(key: "DeliveryS3Bucket")]
        getter delivery_s3_bucket : String?

        # The prefix for the Amazon S3 bucket. This field is optional.
        @[JSON::Field(key: "DeliveryS3KeyPrefix")]
        getter delivery_s3_key_prefix : String?

        # The last time a conformation pack update was requested.
        @[JSON::Field(key: "LastUpdateRequestedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_requested_time : Time?

        # An object that contains the name or Amazon Resource Name (ARN) of the Amazon Web Services Systems
        # Manager document (SSM document) and the version of the SSM document that is used to create a
        # conformance pack.
        @[JSON::Field(key: "TemplateSSMDocumentDetails")]
        getter template_ssm_document_details : Types::TemplateSSMDocumentDetails?

        def initialize(
          @conformance_pack_arn : String,
          @conformance_pack_id : String,
          @conformance_pack_name : String,
          @conformance_pack_input_parameters : Array(Types::ConformancePackInputParameter)? = nil,
          @created_by : String? = nil,
          @delivery_s3_bucket : String? = nil,
          @delivery_s3_key_prefix : String? = nil,
          @last_update_requested_time : Time? = nil,
          @template_ssm_document_details : Types::TemplateSSMDocumentDetails? = nil
        )
        end
      end

      # Filters a conformance pack by Config rule names, compliance types, Amazon Web Services resource
      # types, and resource IDs.
      struct ConformancePackEvaluationFilters
        include JSON::Serializable

        # Filters the results by compliance. The allowed values are COMPLIANT and NON_COMPLIANT .
        # INSUFFICIENT_DATA is not supported.
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        # Filters the results by Config rule names.
        @[JSON::Field(key: "ConfigRuleNames")]
        getter config_rule_names : Array(String)?

        # Filters the results by resource IDs. This is valid only when you provide resource type. If there is
        # no resource type, you will see an error.
        @[JSON::Field(key: "ResourceIds")]
        getter resource_ids : Array(String)?

        # Filters the results by the resource type (for example, "AWS::EC2::Instance" ).
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @compliance_type : String? = nil,
          @config_rule_names : Array(String)? = nil,
          @resource_ids : Array(String)? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The details of a conformance pack evaluation. Provides Config rule and Amazon Web Services resource
      # type that was evaluated, the compliance of the conformance pack, related time stamps, and
      # supplementary information.
      struct ConformancePackEvaluationResult
        include JSON::Serializable

        # The compliance type. The allowed values are COMPLIANT and NON_COMPLIANT . INSUFFICIENT_DATA is not
        # supported.
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String

        # The time when Config rule evaluated Amazon Web Services resource.
        @[JSON::Field(key: "ConfigRuleInvokedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter config_rule_invoked_time : Time

        @[JSON::Field(key: "EvaluationResultIdentifier")]
        getter evaluation_result_identifier : Types::EvaluationResultIdentifier

        # The time when Config recorded the evaluation result.
        @[JSON::Field(key: "ResultRecordedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter result_recorded_time : Time

        # Supplementary information about how the evaluation determined the compliance.
        @[JSON::Field(key: "Annotation")]
        getter annotation : String?

        def initialize(
          @compliance_type : String,
          @config_rule_invoked_time : Time,
          @evaluation_result_identifier : Types::EvaluationResultIdentifier,
          @result_recorded_time : Time,
          @annotation : String? = nil
        )
        end
      end

      # Input parameters in the form of key-value pairs for the conformance pack, both of which you define.
      # Keys can have a maximum character length of 255 characters, and values can have a maximum length of
      # 4096 characters.
      struct ConformancePackInputParameter
        include JSON::Serializable

        # One part of a key-value pair.
        @[JSON::Field(key: "ParameterName")]
        getter parameter_name : String

        # Another part of the key-value pair.
        @[JSON::Field(key: "ParameterValue")]
        getter parameter_value : String

        def initialize(
          @parameter_name : String,
          @parameter_value : String
        )
        end
      end

      # Compliance information of one or more Config rules within a conformance pack. You can filter using
      # Config rule names and compliance types.
      struct ConformancePackRuleCompliance
        include JSON::Serializable

        # Compliance of the Config rule.
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        # Name of the Config rule.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String?

        # Controls for the conformance pack. A control is a process to prevent or detect problems while
        # meeting objectives. A control can align with a specific compliance regime or map to internal
        # controls defined by an organization.
        @[JSON::Field(key: "Controls")]
        getter controls : Array(String)?

        def initialize(
          @compliance_type : String? = nil,
          @config_rule_name : String? = nil,
          @controls : Array(String)? = nil
        )
        end
      end

      # Status details of a conformance pack.
      struct ConformancePackStatusDetail
        include JSON::Serializable

        # Amazon Resource Name (ARN) of comformance pack.
        @[JSON::Field(key: "ConformancePackArn")]
        getter conformance_pack_arn : String

        # ID of the conformance pack.
        @[JSON::Field(key: "ConformancePackId")]
        getter conformance_pack_id : String

        # Name of the conformance pack.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String

        # Indicates deployment status of conformance pack. Config sets the state of the conformance pack to:
        # CREATE_IN_PROGRESS when a conformance pack creation is in progress for an account. CREATE_COMPLETE
        # when a conformance pack has been successfully created in your account. CREATE_FAILED when a
        # conformance pack creation failed in your account. DELETE_IN_PROGRESS when a conformance pack
        # deletion is in progress. DELETE_FAILED when a conformance pack deletion failed in your account.
        @[JSON::Field(key: "ConformancePackState")]
        getter conformance_pack_state : String

        # Last time when conformation pack creation and update was requested.
        @[JSON::Field(key: "LastUpdateRequestedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_requested_time : Time

        # Amazon Resource Name (ARN) of CloudFormation stack.
        @[JSON::Field(key: "StackArn")]
        getter stack_arn : String

        # The reason of conformance pack creation failure.
        @[JSON::Field(key: "ConformancePackStatusReason")]
        getter conformance_pack_status_reason : String?

        # Last time when conformation pack creation and update was successful.
        @[JSON::Field(key: "LastUpdateCompletedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_completed_time : Time?

        def initialize(
          @conformance_pack_arn : String,
          @conformance_pack_id : String,
          @conformance_pack_name : String,
          @conformance_pack_state : String,
          @last_update_requested_time : Time,
          @stack_arn : String,
          @conformance_pack_status_reason : String? = nil,
          @last_update_completed_time : Time? = nil
        )
        end
      end

      # You have specified a template that is not valid or supported.
      struct ConformancePackTemplateValidationException
        include JSON::Serializable

        def initialize
        end
      end

      # Provides the runtime system, policy definition, and whether debug logging enabled. You can specify
      # the following CustomPolicyDetails parameter values only for Config Custom Policy rules.
      struct CustomPolicyDetails
        include JSON::Serializable

        # The runtime system for your Config Custom Policy rule. Guard is a policy-as-code language that
        # allows you to write policies that are enforced by Config Custom Policy rules. For more information
        # about Guard, see the Guard GitHub Repository .
        @[JSON::Field(key: "PolicyRuntime")]
        getter policy_runtime : String

        # The policy definition containing the logic for your Config Custom Policy rule.
        @[JSON::Field(key: "PolicyText")]
        getter policy_text : String

        # The boolean expression for enabling debug logging for your Config Custom Policy rule. The default
        # value is false .
        @[JSON::Field(key: "EnableDebugLogDelivery")]
        getter enable_debug_log_delivery : Bool?

        def initialize(
          @policy_runtime : String,
          @policy_text : String,
          @enable_debug_log_delivery : Bool? = nil
        )
        end
      end

      struct DeleteAggregationAuthorizationRequest
        include JSON::Serializable

        # The 12-digit account ID of the account authorized to aggregate data.
        @[JSON::Field(key: "AuthorizedAccountId")]
        getter authorized_account_id : String

        # The region authorized to collect aggregated data.
        @[JSON::Field(key: "AuthorizedAwsRegion")]
        getter authorized_aws_region : String

        def initialize(
          @authorized_account_id : String,
          @authorized_aws_region : String
        )
        end
      end

      struct DeleteConfigRuleRequest
        include JSON::Serializable

        # The name of the Config rule that you want to delete.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        def initialize(
          @config_rule_name : String
        )
        end
      end

      struct DeleteConfigurationAggregatorRequest
        include JSON::Serializable

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        def initialize(
          @configuration_aggregator_name : String
        )
        end
      end

      # The request object for the DeleteConfigurationRecorder operation.
      struct DeleteConfigurationRecorderRequest
        include JSON::Serializable

        # The name of the customer managed configuration recorder that you want to delete. You can retrieve
        # the name of your configuration recorders by using the DescribeConfigurationRecorders operation.
        @[JSON::Field(key: "ConfigurationRecorderName")]
        getter configuration_recorder_name : String

        def initialize(
          @configuration_recorder_name : String
        )
        end
      end

      struct DeleteConformancePackRequest
        include JSON::Serializable

        # Name of the conformance pack you want to delete.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String

        def initialize(
          @conformance_pack_name : String
        )
        end
      end

      # The input for the DeleteDeliveryChannel action. The action accepts the following data, in JSON
      # format.
      struct DeleteDeliveryChannelRequest
        include JSON::Serializable

        # The name of the delivery channel that you want to delete.
        @[JSON::Field(key: "DeliveryChannelName")]
        getter delivery_channel_name : String

        def initialize(
          @delivery_channel_name : String
        )
        end
      end

      struct DeleteEvaluationResultsRequest
        include JSON::Serializable

        # The name of the Config rule for which you want to delete the evaluation results.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        def initialize(
          @config_rule_name : String
        )
        end
      end

      # The output when you delete the evaluation results for the specified Config rule.
      struct DeleteEvaluationResultsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteOrganizationConfigRuleRequest
        include JSON::Serializable

        # The name of organization Config rule that you want to delete.
        @[JSON::Field(key: "OrganizationConfigRuleName")]
        getter organization_config_rule_name : String

        def initialize(
          @organization_config_rule_name : String
        )
        end
      end

      struct DeleteOrganizationConformancePackRequest
        include JSON::Serializable

        # The name of organization conformance pack that you want to delete.
        @[JSON::Field(key: "OrganizationConformancePackName")]
        getter organization_conformance_pack_name : String

        def initialize(
          @organization_conformance_pack_name : String
        )
        end
      end

      struct DeletePendingAggregationRequestRequest
        include JSON::Serializable

        # The 12-digit account ID of the account requesting to aggregate data.
        @[JSON::Field(key: "RequesterAccountId")]
        getter requester_account_id : String

        # The region requesting to aggregate data.
        @[JSON::Field(key: "RequesterAwsRegion")]
        getter requester_aws_region : String

        def initialize(
          @requester_account_id : String,
          @requester_aws_region : String
        )
        end
      end

      struct DeleteRemediationConfigurationRequest
        include JSON::Serializable

        # The name of the Config rule for which you want to delete remediation configuration.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        # The type of a resource.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @config_rule_name : String,
          @resource_type : String? = nil
        )
        end
      end

      struct DeleteRemediationConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteRemediationExceptionsRequest
        include JSON::Serializable

        # The name of the Config rule for which you want to delete remediation exception configuration.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        # An exception list of resource exception keys to be processed with the current request. Config adds
        # exception for each resource key. For example, Config adds 3 exceptions for 3 resource keys.
        @[JSON::Field(key: "ResourceKeys")]
        getter resource_keys : Array(Types::RemediationExceptionResourceKey)

        def initialize(
          @config_rule_name : String,
          @resource_keys : Array(Types::RemediationExceptionResourceKey)
        )
        end
      end

      struct DeleteRemediationExceptionsResponse
        include JSON::Serializable

        # Returns a list of failed delete remediation exceptions batch objects. Each object in the batch
        # consists of a list of failed items and failure messages.
        @[JSON::Field(key: "FailedBatches")]
        getter failed_batches : Array(Types::FailedDeleteRemediationExceptionsBatch)?

        def initialize(
          @failed_batches : Array(Types::FailedDeleteRemediationExceptionsBatch)? = nil
        )
        end
      end

      struct DeleteResourceConfigRequest
        include JSON::Serializable

        # Unique identifier of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the resource.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      struct DeleteRetentionConfigurationRequest
        include JSON::Serializable

        # The name of the retention configuration to delete.
        @[JSON::Field(key: "RetentionConfigurationName")]
        getter retention_configuration_name : String

        def initialize(
          @retention_configuration_name : String
        )
        end
      end

      struct DeleteServiceLinkedConfigurationRecorderRequest
        include JSON::Serializable

        # The service principal of the Amazon Web Services service for the service-linked configuration
        # recorder that you want to delete.
        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String

        def initialize(
          @service_principal : String
        )
        end
      end

      struct DeleteServiceLinkedConfigurationRecorderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the specified configuration recorder.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name of the specified configuration recorder.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end

      struct DeleteStoredQueryRequest
        include JSON::Serializable

        # The name of the query that you want to delete.
        @[JSON::Field(key: "QueryName")]
        getter query_name : String

        def initialize(
          @query_name : String
        )
        end
      end

      struct DeleteStoredQueryResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the DeliverConfigSnapshot action.
      struct DeliverConfigSnapshotRequest
        include JSON::Serializable

        # The name of the delivery channel through which the snapshot is delivered.
        @[JSON::Field(key: "deliveryChannelName")]
        getter delivery_channel_name : String

        def initialize(
          @delivery_channel_name : String
        )
        end
      end

      # The output for the DeliverConfigSnapshot action, in JSON format.
      struct DeliverConfigSnapshotResponse
        include JSON::Serializable

        # The ID of the snapshot that is being created.
        @[JSON::Field(key: "configSnapshotId")]
        getter config_snapshot_id : String?

        def initialize(
          @config_snapshot_id : String? = nil
        )
        end
      end

      # The channel through which Config delivers notifications and updated configuration states.
      struct DeliveryChannel
        include JSON::Serializable

        # The options for how often Config delivers configuration snapshots to the Amazon S3 bucket.
        @[JSON::Field(key: "configSnapshotDeliveryProperties")]
        getter config_snapshot_delivery_properties : Types::ConfigSnapshotDeliveryProperties?

        # The name of the delivery channel. By default, Config assigns the name "default" when creating the
        # delivery channel. To change the delivery channel name, you must use the DeleteDeliveryChannel action
        # to delete your current delivery channel, and then you must use the PutDeliveryChannel command to
        # create a delivery channel that has the desired name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The name of the Amazon S3 bucket to which Config delivers configuration snapshots and configuration
        # history files. If you specify a bucket that belongs to another Amazon Web Services account, that
        # bucket must have policies that grant access permissions to Config. For more information, see
        # Permissions for the Amazon S3 Bucket in the Config Developer Guide .
        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String?

        # The prefix for the specified Amazon S3 bucket.
        @[JSON::Field(key: "s3KeyPrefix")]
        getter s3_key_prefix : String?

        # The Amazon Resource Name (ARN) of the Key Management Service (KMS ) KMS key (KMS key) used to
        # encrypt objects delivered by Config. Must belong to the same Region as the destination S3 bucket.
        @[JSON::Field(key: "s3KmsKeyArn")]
        getter s3_kms_key_arn : String?

        # The Amazon Resource Name (ARN) of the Amazon SNS topic to which Config sends notifications about
        # configuration changes. If you choose a topic from another account, the topic must have policies that
        # grant access permissions to Config. For more information, see Permissions for the Amazon SNS Topic
        # in the Config Developer Guide .
        @[JSON::Field(key: "snsTopicARN")]
        getter sns_topic_arn : String?

        def initialize(
          @config_snapshot_delivery_properties : Types::ConfigSnapshotDeliveryProperties? = nil,
          @name : String? = nil,
          @s3_bucket_name : String? = nil,
          @s3_key_prefix : String? = nil,
          @s3_kms_key_arn : String? = nil,
          @sns_topic_arn : String? = nil
        )
        end
      end

      # The status of a specified delivery channel. Valid values: Success | Failure
      struct DeliveryChannelStatus
        include JSON::Serializable

        # A list that contains the status of the delivery of the configuration history to the specified Amazon
        # S3 bucket.
        @[JSON::Field(key: "configHistoryDeliveryInfo")]
        getter config_history_delivery_info : Types::ConfigExportDeliveryInfo?

        # A list containing the status of the delivery of the snapshot to the specified Amazon S3 bucket.
        @[JSON::Field(key: "configSnapshotDeliveryInfo")]
        getter config_snapshot_delivery_info : Types::ConfigExportDeliveryInfo?

        # A list containing the status of the delivery of the configuration stream notification to the
        # specified Amazon SNS topic.
        @[JSON::Field(key: "configStreamDeliveryInfo")]
        getter config_stream_delivery_info : Types::ConfigStreamDeliveryInfo?

        # The name of the delivery channel.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @config_history_delivery_info : Types::ConfigExportDeliveryInfo? = nil,
          @config_snapshot_delivery_info : Types::ConfigExportDeliveryInfo? = nil,
          @config_stream_delivery_info : Types::ConfigStreamDeliveryInfo? = nil,
          @name : String? = nil
        )
        end
      end

      struct DescribeAggregateComplianceByConfigRulesRequest
        include JSON::Serializable

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        # Filters the results by ConfigRuleComplianceFilters object.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::ConfigRuleComplianceFilters?

        # The maximum number of evaluation results returned on each page. The default is maximum. If you
        # specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_aggregator_name : String,
          @filters : Types::ConfigRuleComplianceFilters? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeAggregateComplianceByConfigRulesResponse
        include JSON::Serializable

        # Returns a list of AggregateComplianceByConfigRule object.
        @[JSON::Field(key: "AggregateComplianceByConfigRules")]
        getter aggregate_compliance_by_config_rules : Array(Types::AggregateComplianceByConfigRule)?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aggregate_compliance_by_config_rules : Array(Types::AggregateComplianceByConfigRule)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeAggregateComplianceByConformancePacksRequest
        include JSON::Serializable

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        # Filters the result by AggregateConformancePackComplianceFilters object.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::AggregateConformancePackComplianceFilters?

        # The maximum number of conformance packs compliance details returned on each page. The default is
        # maximum. If you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_aggregator_name : String,
          @filters : Types::AggregateConformancePackComplianceFilters? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeAggregateComplianceByConformancePacksResponse
        include JSON::Serializable

        # Returns the AggregateComplianceByConformancePack object.
        @[JSON::Field(key: "AggregateComplianceByConformancePacks")]
        getter aggregate_compliance_by_conformance_packs : Array(Types::AggregateComplianceByConformancePack)?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aggregate_compliance_by_conformance_packs : Array(Types::AggregateComplianceByConformancePack)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeAggregationAuthorizationsRequest
        include JSON::Serializable

        # The maximum number of AggregationAuthorizations returned on each page. The default is maximum. If
        # you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeAggregationAuthorizationsResponse
        include JSON::Serializable

        # Returns a list of authorizations granted to various aggregator accounts and regions.
        @[JSON::Field(key: "AggregationAuthorizations")]
        getter aggregation_authorizations : Array(Types::AggregationAuthorization)?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aggregation_authorizations : Array(Types::AggregationAuthorization)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeComplianceByConfigRuleRequest
        include JSON::Serializable

        # Filters the results by compliance.
        @[JSON::Field(key: "ComplianceTypes")]
        getter compliance_types : Array(String)?

        # Specify one or more Config rule names to filter the results by rule.
        @[JSON::Field(key: "ConfigRuleNames")]
        getter config_rule_names : Array(String)?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @compliance_types : Array(String)? = nil,
          @config_rule_names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeComplianceByConfigRuleResponse
        include JSON::Serializable

        # Indicates whether each of the specified Config rules is compliant.
        @[JSON::Field(key: "ComplianceByConfigRules")]
        getter compliance_by_config_rules : Array(Types::ComplianceByConfigRule)?

        # The string that you use in a subsequent request to get the next page of results in a paginated
        # response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @compliance_by_config_rules : Array(Types::ComplianceByConfigRule)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeComplianceByResourceRequest
        include JSON::Serializable

        # Filters the results by compliance.
        @[JSON::Field(key: "ComplianceTypes")]
        getter compliance_types : Array(String)?

        # The maximum number of evaluation results returned on each page. The default is 10. You cannot
        # specify a number greater than 100. If you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID of the Amazon Web Services resource for which you want compliance information. You can
        # specify only one resource ID. If you specify a resource ID, you must also specify a type for
        # ResourceType .
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The types of Amazon Web Services resources for which you want compliance information (for example,
        # AWS::EC2::Instance ). For this operation, you can specify that the resource type is an Amazon Web
        # Services account by specifying AWS::::Account .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @compliance_types : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct DescribeComplianceByResourceResponse
        include JSON::Serializable

        # Indicates whether the specified Amazon Web Services resource complies with all of the Config rules
        # that evaluate it.
        @[JSON::Field(key: "ComplianceByResources")]
        getter compliance_by_resources : Array(Types::ComplianceByResource)?

        # The string that you use in a subsequent request to get the next page of results in a paginated
        # response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @compliance_by_resources : Array(Types::ComplianceByResource)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConfigRuleEvaluationStatusRequest
        include JSON::Serializable

        # The name of the Config managed rules for which you want status information. If you do not specify
        # any names, Config returns status information for all Config managed rules that you use.
        @[JSON::Field(key: "ConfigRuleNames")]
        getter config_rule_names : Array(String)?

        # The number of rule evaluation results that you want returned. This parameter is required if the rule
        # limit for your account is more than the default of 1000 rules. For information about requesting a
        # rule limit increase, see Config Limits in the Amazon Web Services General Reference Guide .
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @config_rule_names : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConfigRuleEvaluationStatusResponse
        include JSON::Serializable

        # Status information about your Config managed rules.
        @[JSON::Field(key: "ConfigRulesEvaluationStatus")]
        getter config_rules_evaluation_status : Array(Types::ConfigRuleEvaluationStatus)?

        # The string that you use in a subsequent request to get the next page of results in a paginated
        # response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @config_rules_evaluation_status : Array(Types::ConfigRuleEvaluationStatus)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returns a filtered list of Detective or Proactive Config rules. By default, if the filter is not
      # defined, this API returns an unfiltered list. For more information on Detective or Proactive Config
      # rules, see Evaluation Mode in the Config Developer Guide .
      struct DescribeConfigRulesFilters
        include JSON::Serializable

        # The mode of an evaluation. The valid values are Detective or Proactive.
        @[JSON::Field(key: "EvaluationMode")]
        getter evaluation_mode : String?

        def initialize(
          @evaluation_mode : String? = nil
        )
        end
      end

      struct DescribeConfigRulesRequest
        include JSON::Serializable

        # The names of the Config rules for which you want details. If you do not specify any names, Config
        # returns details for all your rules.
        @[JSON::Field(key: "ConfigRuleNames")]
        getter config_rule_names : Array(String)?

        # Returns a list of Detective or Proactive Config rules. By default, this API returns an unfiltered
        # list. For more information on Detective or Proactive Config rules, see Evaluation Mode in the Config
        # Developer Guide .
        @[JSON::Field(key: "Filters")]
        getter filters : Types::DescribeConfigRulesFilters?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @config_rule_names : Array(String)? = nil,
          @filters : Types::DescribeConfigRulesFilters? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConfigRulesResponse
        include JSON::Serializable

        # The details about your Config rules.
        @[JSON::Field(key: "ConfigRules")]
        getter config_rules : Array(Types::ConfigRule)?

        # The string that you use in a subsequent request to get the next page of results in a paginated
        # response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @config_rules : Array(Types::ConfigRule)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConfigurationAggregatorSourcesStatusRequest
        include JSON::Serializable

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        # The maximum number of AggregatorSourceStatus returned on each page. The default is maximum. If you
        # specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters the status type. Valid value FAILED indicates errors while moving data. Valid value
        # SUCCEEDED indicates the data was successfully moved. Valid value OUTDATED indicates the data is not
        # the most recent.
        @[JSON::Field(key: "UpdateStatus")]
        getter update_status : Array(String)?

        def initialize(
          @configuration_aggregator_name : String,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @update_status : Array(String)? = nil
        )
        end
      end

      struct DescribeConfigurationAggregatorSourcesStatusResponse
        include JSON::Serializable

        # Returns an AggregatedSourceStatus object.
        @[JSON::Field(key: "AggregatedSourceStatusList")]
        getter aggregated_source_status_list : Array(Types::AggregatedSourceStatus)?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aggregated_source_status_list : Array(Types::AggregatedSourceStatus)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConfigurationAggregatorsRequest
        include JSON::Serializable

        # The name of the configuration aggregators.
        @[JSON::Field(key: "ConfigurationAggregatorNames")]
        getter configuration_aggregator_names : Array(String)?

        # The maximum number of configuration aggregators returned on each page. The default is maximum. If
        # you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_aggregator_names : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConfigurationAggregatorsResponse
        include JSON::Serializable

        # Returns a ConfigurationAggregators object.
        @[JSON::Field(key: "ConfigurationAggregators")]
        getter configuration_aggregators : Array(Types::ConfigurationAggregator)?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_aggregators : Array(Types::ConfigurationAggregator)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The input for the DescribeConfigurationRecorderStatus action.
      struct DescribeConfigurationRecorderStatusRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration recorder that you want to specify.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the configuration recorder. If the name is not specified, the operation returns the
        # status for the customer managed configuration recorder configured for the account, if applicable.
        # When making a request to this operation, you can only specify one configuration recorder.
        @[JSON::Field(key: "ConfigurationRecorderNames")]
        getter configuration_recorder_names : Array(String)?

        # For service-linked configuration recorders, you can use the service principal of the linked Amazon
        # Web Services service to specify the configuration recorder.
        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String?

        def initialize(
          @arn : String? = nil,
          @configuration_recorder_names : Array(String)? = nil,
          @service_principal : String? = nil
        )
        end
      end

      # The output for the DescribeConfigurationRecorderStatus action, in JSON format.
      struct DescribeConfigurationRecorderStatusResponse
        include JSON::Serializable

        # A list that contains status of the specified recorders.
        @[JSON::Field(key: "ConfigurationRecordersStatus")]
        getter configuration_recorders_status : Array(Types::ConfigurationRecorderStatus)?

        def initialize(
          @configuration_recorders_status : Array(Types::ConfigurationRecorderStatus)? = nil
        )
        end
      end

      # The input for the DescribeConfigurationRecorders action.
      struct DescribeConfigurationRecordersRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration recorder that you want to specify.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A list of names of the configuration recorders that you want to specify. When making a request to
        # this operation, you can only specify one configuration recorder.
        @[JSON::Field(key: "ConfigurationRecorderNames")]
        getter configuration_recorder_names : Array(String)?

        # For service-linked configuration recorders, you can use the service principal of the linked Amazon
        # Web Services service to specify the configuration recorder.
        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String?

        def initialize(
          @arn : String? = nil,
          @configuration_recorder_names : Array(String)? = nil,
          @service_principal : String? = nil
        )
        end
      end

      # The output for the DescribeConfigurationRecorders action.
      struct DescribeConfigurationRecordersResponse
        include JSON::Serializable

        # A list that contains the descriptions of the specified configuration recorders.
        @[JSON::Field(key: "ConfigurationRecorders")]
        getter configuration_recorders : Array(Types::ConfigurationRecorder)?

        def initialize(
          @configuration_recorders : Array(Types::ConfigurationRecorder)? = nil
        )
        end
      end

      struct DescribeConformancePackComplianceRequest
        include JSON::Serializable

        # Name of the conformance pack.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String

        # A ConformancePackComplianceFilters object.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::ConformancePackComplianceFilters?

        # The maximum number of Config rules within a conformance pack are returned on each page.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @conformance_pack_name : String,
          @filters : Types::ConformancePackComplianceFilters? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConformancePackComplianceResponse
        include JSON::Serializable

        # Name of the conformance pack.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String

        # Returns a list of ConformancePackRuleCompliance objects.
        @[JSON::Field(key: "ConformancePackRuleComplianceList")]
        getter conformance_pack_rule_compliance_list : Array(Types::ConformancePackRuleCompliance)

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @conformance_pack_name : String,
          @conformance_pack_rule_compliance_list : Array(Types::ConformancePackRuleCompliance),
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConformancePackStatusRequest
        include JSON::Serializable

        # Comma-separated list of conformance pack names.
        @[JSON::Field(key: "ConformancePackNames")]
        getter conformance_pack_names : Array(String)?

        # The maximum number of conformance packs status returned on each page.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @conformance_pack_names : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConformancePackStatusResponse
        include JSON::Serializable

        # A list of ConformancePackStatusDetail objects.
        @[JSON::Field(key: "ConformancePackStatusDetails")]
        getter conformance_pack_status_details : Array(Types::ConformancePackStatusDetail)?

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @conformance_pack_status_details : Array(Types::ConformancePackStatusDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConformancePacksRequest
        include JSON::Serializable

        # Comma-separated list of conformance pack names for which you want details. If you do not specify any
        # names, Config returns details for all your conformance packs.
        @[JSON::Field(key: "ConformancePackNames")]
        getter conformance_pack_names : Array(String)?

        # The maximum number of conformance packs returned on each page.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @conformance_pack_names : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeConformancePacksResponse
        include JSON::Serializable

        # Returns a list of ConformancePackDetail objects.
        @[JSON::Field(key: "ConformancePackDetails")]
        getter conformance_pack_details : Array(Types::ConformancePackDetail)?

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @conformance_pack_details : Array(Types::ConformancePackDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The input for the DeliveryChannelStatus action.
      struct DescribeDeliveryChannelStatusRequest
        include JSON::Serializable

        # A list of delivery channel names.
        @[JSON::Field(key: "DeliveryChannelNames")]
        getter delivery_channel_names : Array(String)?

        def initialize(
          @delivery_channel_names : Array(String)? = nil
        )
        end
      end

      # The output for the DescribeDeliveryChannelStatus action.
      struct DescribeDeliveryChannelStatusResponse
        include JSON::Serializable

        # A list that contains the status of a specified delivery channel.
        @[JSON::Field(key: "DeliveryChannelsStatus")]
        getter delivery_channels_status : Array(Types::DeliveryChannelStatus)?

        def initialize(
          @delivery_channels_status : Array(Types::DeliveryChannelStatus)? = nil
        )
        end
      end

      # The input for the DescribeDeliveryChannels action.
      struct DescribeDeliveryChannelsRequest
        include JSON::Serializable

        # A list of delivery channel names.
        @[JSON::Field(key: "DeliveryChannelNames")]
        getter delivery_channel_names : Array(String)?

        def initialize(
          @delivery_channel_names : Array(String)? = nil
        )
        end
      end

      # The output for the DescribeDeliveryChannels action.
      struct DescribeDeliveryChannelsResponse
        include JSON::Serializable

        # A list that contains the descriptions of the specified delivery channel.
        @[JSON::Field(key: "DeliveryChannels")]
        getter delivery_channels : Array(Types::DeliveryChannel)?

        def initialize(
          @delivery_channels : Array(Types::DeliveryChannel)? = nil
        )
        end
      end

      struct DescribeOrganizationConfigRuleStatusesRequest
        include JSON::Serializable

        # The maximum number of OrganizationConfigRuleStatuses returned on each page. If you do no specify a
        # number, Config uses the default. The default is 100.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The names of organization Config rules for which you want status details. If you do not specify any
        # names, Config returns details for all your organization Config rules.
        @[JSON::Field(key: "OrganizationConfigRuleNames")]
        getter organization_config_rule_names : Array(String)?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @organization_config_rule_names : Array(String)? = nil
        )
        end
      end

      struct DescribeOrganizationConfigRuleStatusesResponse
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of OrganizationConfigRuleStatus objects.
        @[JSON::Field(key: "OrganizationConfigRuleStatuses")]
        getter organization_config_rule_statuses : Array(Types::OrganizationConfigRuleStatus)?

        def initialize(
          @next_token : String? = nil,
          @organization_config_rule_statuses : Array(Types::OrganizationConfigRuleStatus)? = nil
        )
        end
      end

      struct DescribeOrganizationConfigRulesRequest
        include JSON::Serializable

        # The maximum number of organization Config rules returned on each page. If you do no specify a
        # number, Config uses the default. The default is 100.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The names of organization Config rules for which you want details. If you do not specify any names,
        # Config returns details for all your organization Config rules.
        @[JSON::Field(key: "OrganizationConfigRuleNames")]
        getter organization_config_rule_names : Array(String)?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @organization_config_rule_names : Array(String)? = nil
        )
        end
      end

      struct DescribeOrganizationConfigRulesResponse
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a list of OrganizationConfigRule objects.
        @[JSON::Field(key: "OrganizationConfigRules")]
        getter organization_config_rules : Array(Types::OrganizationConfigRule)?

        def initialize(
          @next_token : String? = nil,
          @organization_config_rules : Array(Types::OrganizationConfigRule)? = nil
        )
        end
      end

      struct DescribeOrganizationConformancePackStatusesRequest
        include JSON::Serializable

        # The maximum number of OrganizationConformancePackStatuses returned on each page. If you do no
        # specify a number, Config uses the default. The default is 100.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The names of organization conformance packs for which you want status details. If you do not specify
        # any names, Config returns details for all your organization conformance packs.
        @[JSON::Field(key: "OrganizationConformancePackNames")]
        getter organization_conformance_pack_names : Array(String)?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @organization_conformance_pack_names : Array(String)? = nil
        )
        end
      end

      struct DescribeOrganizationConformancePackStatusesResponse
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of OrganizationConformancePackStatus objects.
        @[JSON::Field(key: "OrganizationConformancePackStatuses")]
        getter organization_conformance_pack_statuses : Array(Types::OrganizationConformancePackStatus)?

        def initialize(
          @next_token : String? = nil,
          @organization_conformance_pack_statuses : Array(Types::OrganizationConformancePackStatus)? = nil
        )
        end
      end

      struct DescribeOrganizationConformancePacksRequest
        include JSON::Serializable

        # The maximum number of organization config packs returned on each page. If you do no specify a
        # number, Config uses the default. The default is 100.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name that you assign to an organization conformance pack.
        @[JSON::Field(key: "OrganizationConformancePackNames")]
        getter organization_conformance_pack_names : Array(String)?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @organization_conformance_pack_names : Array(String)? = nil
        )
        end
      end

      struct DescribeOrganizationConformancePacksResponse
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a list of OrganizationConformancePacks objects.
        @[JSON::Field(key: "OrganizationConformancePacks")]
        getter organization_conformance_packs : Array(Types::OrganizationConformancePack)?

        def initialize(
          @next_token : String? = nil,
          @organization_conformance_packs : Array(Types::OrganizationConformancePack)? = nil
        )
        end
      end

      struct DescribePendingAggregationRequestsRequest
        include JSON::Serializable

        # The maximum number of evaluation results returned on each page. The default is maximum. If you
        # specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribePendingAggregationRequestsResponse
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a PendingAggregationRequests object.
        @[JSON::Field(key: "PendingAggregationRequests")]
        getter pending_aggregation_requests : Array(Types::PendingAggregationRequest)?

        def initialize(
          @next_token : String? = nil,
          @pending_aggregation_requests : Array(Types::PendingAggregationRequest)? = nil
        )
        end
      end

      struct DescribeRemediationConfigurationsRequest
        include JSON::Serializable

        # A list of Config rule names of remediation configurations for which you want details.
        @[JSON::Field(key: "ConfigRuleNames")]
        getter config_rule_names : Array(String)

        def initialize(
          @config_rule_names : Array(String)
        )
        end
      end

      struct DescribeRemediationConfigurationsResponse
        include JSON::Serializable

        # Returns a remediation configuration object.
        @[JSON::Field(key: "RemediationConfigurations")]
        getter remediation_configurations : Array(Types::RemediationConfiguration)?

        def initialize(
          @remediation_configurations : Array(Types::RemediationConfiguration)? = nil
        )
        end
      end

      struct DescribeRemediationExceptionsRequest
        include JSON::Serializable

        # The name of the Config rule.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        # The maximum number of RemediationExceptionResourceKey returned on each page. The default is 25. If
        # you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An exception list of resource exception keys to be processed with the current request. Config adds
        # exception for each resource key. For example, Config adds 3 exceptions for 3 resource keys.
        @[JSON::Field(key: "ResourceKeys")]
        getter resource_keys : Array(Types::RemediationExceptionResourceKey)?

        def initialize(
          @config_rule_name : String,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @resource_keys : Array(Types::RemediationExceptionResourceKey)? = nil
        )
        end
      end

      struct DescribeRemediationExceptionsResponse
        include JSON::Serializable

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a list of remediation exception objects.
        @[JSON::Field(key: "RemediationExceptions")]
        getter remediation_exceptions : Array(Types::RemediationException)?

        def initialize(
          @next_token : String? = nil,
          @remediation_exceptions : Array(Types::RemediationException)? = nil
        )
        end
      end

      struct DescribeRemediationExecutionStatusRequest
        include JSON::Serializable

        # The name of the Config rule.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        # The maximum number of RemediationExecutionStatuses returned on each page. The default is maximum. If
        # you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of resource keys to be processed with the current request. Each element in the list consists
        # of the resource type and resource ID.
        @[JSON::Field(key: "ResourceKeys")]
        getter resource_keys : Array(Types::ResourceKey)?

        def initialize(
          @config_rule_name : String,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @resource_keys : Array(Types::ResourceKey)? = nil
        )
        end
      end

      struct DescribeRemediationExecutionStatusResponse
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a list of remediation execution statuses objects.
        @[JSON::Field(key: "RemediationExecutionStatuses")]
        getter remediation_execution_statuses : Array(Types::RemediationExecutionStatus)?

        def initialize(
          @next_token : String? = nil,
          @remediation_execution_statuses : Array(Types::RemediationExecutionStatus)? = nil
        )
        end
      end

      struct DescribeRetentionConfigurationsRequest
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of names of retention configurations for which you want details. If you do not specify a
        # name, Config returns details for all the retention configurations for that account. Currently,
        # Config supports only one retention configuration per region in your account.
        @[JSON::Field(key: "RetentionConfigurationNames")]
        getter retention_configuration_names : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @retention_configuration_names : Array(String)? = nil
        )
        end
      end

      struct DescribeRetentionConfigurationsResponse
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a retention configuration object.
        @[JSON::Field(key: "RetentionConfigurations")]
        getter retention_configurations : Array(Types::RetentionConfiguration)?

        def initialize(
          @next_token : String? = nil,
          @retention_configurations : Array(Types::RetentionConfiguration)? = nil
        )
        end
      end

      struct DisassociateResourceTypesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the specified configuration recorder.
        @[JSON::Field(key: "ConfigurationRecorderArn")]
        getter configuration_recorder_arn : String

        # The list of resource types you want to remove from the recording group of the specified
        # configuration recorder.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)

        def initialize(
          @configuration_recorder_arn : String,
          @resource_types : Array(String)
        )
        end
      end

      struct DisassociateResourceTypesResponse
        include JSON::Serializable

        @[JSON::Field(key: "ConfigurationRecorder")]
        getter configuration_recorder : Types::ConfigurationRecorder

        def initialize(
          @configuration_recorder : Types::ConfigurationRecorder
        )
        end
      end

      # Identifies an Amazon Web Services resource and indicates whether it complies with the Config rule
      # that it was evaluated against.
      struct Evaluation
        include JSON::Serializable

        # The ID of the Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ComplianceResourceId")]
        getter compliance_resource_id : String

        # The type of Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ComplianceResourceType")]
        getter compliance_resource_type : String

        # Indicates whether the Amazon Web Services resource complies with the Config rule that it was
        # evaluated against. For the Evaluation data type, Config supports only the COMPLIANT , NON_COMPLIANT
        # , and NOT_APPLICABLE values. Config does not support the INSUFFICIENT_DATA value for this data type.
        # Similarly, Config does not accept INSUFFICIENT_DATA as the value for ComplianceType from a
        # PutEvaluations request. For example, an Lambda function for a custom Config rule cannot pass an
        # INSUFFICIENT_DATA value to Config.
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String

        # The time of the event in Config that triggered the evaluation. For event-based evaluations, the time
        # indicates when Config created the configuration item that triggered the evaluation. For periodic
        # evaluations, the time indicates when Config triggered the evaluation at the frequency that you
        # specified (for example, every 24 hours).
        @[JSON::Field(key: "OrderingTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ordering_timestamp : Time

        # Supplementary information about how the evaluation determined the compliance.
        @[JSON::Field(key: "Annotation")]
        getter annotation : String?

        def initialize(
          @compliance_resource_id : String,
          @compliance_resource_type : String,
          @compliance_type : String,
          @ordering_timestamp : Time,
          @annotation : String? = nil
        )
        end
      end

      # Use EvaluationContext to group independently initiated proactive resource evaluations. For example,
      # CFN Stack. If you want to check just a resource definition, you do not need to provide evaluation
      # context.
      struct EvaluationContext
        include JSON::Serializable

        # A unique EvaluationContextIdentifier ID for an EvaluationContext.
        @[JSON::Field(key: "EvaluationContextIdentifier")]
        getter evaluation_context_identifier : String?

        def initialize(
          @evaluation_context_identifier : String? = nil
        )
        end
      end

      # The configuration object for Config rule evaluation mode. The supported valid values are Detective
      # or Proactive.
      struct EvaluationModeConfiguration
        include JSON::Serializable

        # The mode of an evaluation. The valid values are Detective or Proactive.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        def initialize(
          @mode : String? = nil
        )
        end
      end

      # The details of an Config evaluation. Provides the Amazon Web Services resource that was evaluated,
      # the compliance of the resource, related time stamps, and supplementary information.
      struct EvaluationResult
        include JSON::Serializable

        # Supplementary information about how the evaluation determined the compliance.
        @[JSON::Field(key: "Annotation")]
        getter annotation : String?

        # Indicates whether the Amazon Web Services resource complies with the Config rule that evaluated it.
        # For the EvaluationResult data type, Config supports only the COMPLIANT , NON_COMPLIANT , and
        # NOT_APPLICABLE values. Config does not support the INSUFFICIENT_DATA value for the EvaluationResult
        # data type.
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        # The time when the Config rule evaluated the Amazon Web Services resource.
        @[JSON::Field(key: "ConfigRuleInvokedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter config_rule_invoked_time : Time?

        # Uniquely identifies the evaluation result.
        @[JSON::Field(key: "EvaluationResultIdentifier")]
        getter evaluation_result_identifier : Types::EvaluationResultIdentifier?

        # The time when Config recorded the evaluation result.
        @[JSON::Field(key: "ResultRecordedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter result_recorded_time : Time?

        # An encrypted token that associates an evaluation with an Config rule. The token identifies the rule,
        # the Amazon Web Services resource being evaluated, and the event that triggered the evaluation.
        @[JSON::Field(key: "ResultToken")]
        getter result_token : String?

        def initialize(
          @annotation : String? = nil,
          @compliance_type : String? = nil,
          @config_rule_invoked_time : Time? = nil,
          @evaluation_result_identifier : Types::EvaluationResultIdentifier? = nil,
          @result_recorded_time : Time? = nil,
          @result_token : String? = nil
        )
        end
      end

      # Uniquely identifies an evaluation result.
      struct EvaluationResultIdentifier
        include JSON::Serializable

        # Identifies an Config rule used to evaluate an Amazon Web Services resource, and provides the type
        # and ID of the evaluated resource.
        @[JSON::Field(key: "EvaluationResultQualifier")]
        getter evaluation_result_qualifier : Types::EvaluationResultQualifier?

        # The time of the event that triggered the evaluation of your Amazon Web Services resources. The time
        # can indicate when Config delivered a configuration item change notification, or it can indicate when
        # Config delivered the configuration snapshot, depending on which event triggered the evaluation.
        @[JSON::Field(key: "OrderingTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ordering_timestamp : Time?

        # A Unique ID for an evaluation result.
        @[JSON::Field(key: "ResourceEvaluationId")]
        getter resource_evaluation_id : String?

        def initialize(
          @evaluation_result_qualifier : Types::EvaluationResultQualifier? = nil,
          @ordering_timestamp : Time? = nil,
          @resource_evaluation_id : String? = nil
        )
        end
      end

      # Identifies an Config rule that evaluated an Amazon Web Services resource, and provides the type and
      # ID of the resource that the rule evaluated.
      struct EvaluationResultQualifier
        include JSON::Serializable

        # The name of the Config rule that was used in the evaluation.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String?

        # The mode of an evaluation. The valid values are Detective or Proactive.
        @[JSON::Field(key: "EvaluationMode")]
        getter evaluation_mode : String?

        # The ID of the evaluated Amazon Web Services resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @config_rule_name : String? = nil,
          @evaluation_mode : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Returns status details of an evaluation.
      struct EvaluationStatus
        include JSON::Serializable

        # The status of an execution. The valid values are In_Progress, Succeeded or Failed.
        @[JSON::Field(key: "Status")]
        getter status : String

        # An explanation for failed execution status.
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        def initialize(
          @status : String,
          @failure_reason : String? = nil
        )
        end
      end

      # Specifies whether the configuration recorder excludes certain resource types from being recorded.
      # Use the resourceTypes field to enter a comma-separated list of resource types you want to exclude
      # from recording. By default, when Config adds support for a new resource type in the Region where you
      # set up the configuration recorder, including global resource types, Config starts recording
      # resources of that type automatically. How to use the exclusion recording strategy To use this
      # option, you must set the useOnly field of RecordingStrategy to EXCLUSION_BY_RESOURCE_TYPES . Config
      # will then record configuration changes for all supported resource types, except the resource types
      # that you specify to exclude from being recorded. Global resource types and the exclusion recording
      # strategy Unless specifically listed as exclusions, AWS::RDS::GlobalCluster will be recorded
      # automatically in all supported Config Regions were the configuration recorder is enabled. IAM users,
      # groups, roles, and customer managed policies will be recorded in the Region where you set up the
      # configuration recorder if that is a Region where Config was available before February 2022. You
      # cannot be record the global IAM resouce types in Regions supported by Config after February 2022.
      # For a list of those Regions, see Recording Amazon Web Services Resources | Global Resources .
      struct ExclusionByResourceTypes
        include JSON::Serializable

        # A comma-separated list of resource types to exclude from recording by the configuration recorder.
        @[JSON::Field(key: "resourceTypes")]
        getter resource_types : Array(String)?

        def initialize(
          @resource_types : Array(String)? = nil
        )
        end
      end

      # The controls that Config uses for executing remediations.
      struct ExecutionControls
        include JSON::Serializable

        # A SsmControls object.
        @[JSON::Field(key: "SsmControls")]
        getter ssm_controls : Types::SsmControls?

        def initialize(
          @ssm_controls : Types::SsmControls? = nil
        )
        end
      end

      # Identifies an Amazon Web Services resource and indicates whether it complies with the Config rule
      # that it was evaluated against.
      struct ExternalEvaluation
        include JSON::Serializable

        # The evaluated compliance resource ID. Config accepts only Amazon Web Services account ID.
        @[JSON::Field(key: "ComplianceResourceId")]
        getter compliance_resource_id : String

        # The evaluated compliance resource type. Config accepts AWS::::Account resource type.
        @[JSON::Field(key: "ComplianceResourceType")]
        getter compliance_resource_type : String

        # The compliance of the Amazon Web Services resource. The valid values are COMPLIANT, NON_COMPLIANT,
        # and NOT_APPLICABLE .
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String

        # The time when the compliance was recorded.
        @[JSON::Field(key: "OrderingTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ordering_timestamp : Time

        # Supplementary information about the reason of compliance. For example, this task was completed on a
        # specific date.
        @[JSON::Field(key: "Annotation")]
        getter annotation : String?

        def initialize(
          @compliance_resource_id : String,
          @compliance_resource_type : String,
          @compliance_type : String,
          @ordering_timestamp : Time,
          @annotation : String? = nil
        )
        end
      end

      # List of each of the failed delete remediation exceptions with specific reasons.
      struct FailedDeleteRemediationExceptionsBatch
        include JSON::Serializable

        # Returns remediation exception resource key object of the failed items.
        @[JSON::Field(key: "FailedItems")]
        getter failed_items : Array(Types::RemediationExceptionResourceKey)?

        # Returns a failure message for delete remediation exception. For example, Config creates an exception
        # due to an internal error.
        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        def initialize(
          @failed_items : Array(Types::RemediationExceptionResourceKey)? = nil,
          @failure_message : String? = nil
        )
        end
      end

      # List of each of the failed remediations with specific reasons.
      struct FailedRemediationBatch
        include JSON::Serializable

        # Returns remediation configurations of the failed items.
        @[JSON::Field(key: "FailedItems")]
        getter failed_items : Array(Types::RemediationConfiguration)?

        # Returns a failure message. For example, the resource is already compliant.
        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        def initialize(
          @failed_items : Array(Types::RemediationConfiguration)? = nil,
          @failure_message : String? = nil
        )
        end
      end

      # List of each of the failed remediation exceptions with specific reasons.
      struct FailedRemediationExceptionBatch
        include JSON::Serializable

        # Returns remediation exception resource key object of the failed items.
        @[JSON::Field(key: "FailedItems")]
        getter failed_items : Array(Types::RemediationException)?

        # Returns a failure message. For example, the auto-remediation has failed.
        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        def initialize(
          @failed_items : Array(Types::RemediationException)? = nil,
          @failure_message : String? = nil
        )
        end
      end

      # Details about the fields such as name of the field.
      struct FieldInfo
        include JSON::Serializable

        # Name of the field.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      struct GetAggregateComplianceDetailsByConfigRuleRequest
        include JSON::Serializable

        # The 12-digit account ID of the source account.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The source region from where the data is aggregated.
        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String

        # The name of the Config rule for which you want compliance information.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        # The resource compliance status. For the GetAggregateComplianceDetailsByConfigRuleRequest data type,
        # Config supports only the COMPLIANT and NON_COMPLIANT . Config does not support the NOT_APPLICABLE
        # and INSUFFICIENT_DATA values.
        @[JSON::Field(key: "ComplianceType")]
        getter compliance_type : String?

        # The maximum number of evaluation results returned on each page. The default is 50. You cannot
        # specify a number greater than 100. If you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @aws_region : String,
          @config_rule_name : String,
          @configuration_aggregator_name : String,
          @compliance_type : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetAggregateComplianceDetailsByConfigRuleResponse
        include JSON::Serializable

        # Returns an AggregateEvaluationResults object.
        @[JSON::Field(key: "AggregateEvaluationResults")]
        getter aggregate_evaluation_results : Array(Types::AggregateEvaluationResult)?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aggregate_evaluation_results : Array(Types::AggregateEvaluationResult)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetAggregateConfigRuleComplianceSummaryRequest
        include JSON::Serializable

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        # Filters the results based on the ConfigRuleComplianceSummaryFilters object.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::ConfigRuleComplianceSummaryFilters?

        # Groups the result based on ACCOUNT_ID or AWS_REGION.
        @[JSON::Field(key: "GroupByKey")]
        getter group_by_key : String?

        # The maximum number of evaluation results returned on each page. The default is 1000. You cannot
        # specify a number greater than 1000. If you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_aggregator_name : String,
          @filters : Types::ConfigRuleComplianceSummaryFilters? = nil,
          @group_by_key : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetAggregateConfigRuleComplianceSummaryResponse
        include JSON::Serializable

        # Returns a list of AggregateComplianceCounts object.
        @[JSON::Field(key: "AggregateComplianceCounts")]
        getter aggregate_compliance_counts : Array(Types::AggregateComplianceCount)?

        # Groups the result based on ACCOUNT_ID or AWS_REGION.
        @[JSON::Field(key: "GroupByKey")]
        getter group_by_key : String?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aggregate_compliance_counts : Array(Types::AggregateComplianceCount)? = nil,
          @group_by_key : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetAggregateConformancePackComplianceSummaryRequest
        include JSON::Serializable

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        # Filters the results based on the AggregateConformancePackComplianceSummaryFilters object.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::AggregateConformancePackComplianceSummaryFilters?

        # Groups the result based on Amazon Web Services account ID or Amazon Web Services Region.
        @[JSON::Field(key: "GroupByKey")]
        getter group_by_key : String?

        # The maximum number of results returned on each page. The default is maximum. If you specify 0,
        # Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_aggregator_name : String,
          @filters : Types::AggregateConformancePackComplianceSummaryFilters? = nil,
          @group_by_key : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetAggregateConformancePackComplianceSummaryResponse
        include JSON::Serializable

        # Returns a list of AggregateConformancePackComplianceSummary object.
        @[JSON::Field(key: "AggregateConformancePackComplianceSummaries")]
        getter aggregate_conformance_pack_compliance_summaries : Array(Types::AggregateConformancePackComplianceSummary)?

        # Groups the result based on Amazon Web Services account ID or Amazon Web Services Region.
        @[JSON::Field(key: "GroupByKey")]
        getter group_by_key : String?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aggregate_conformance_pack_compliance_summaries : Array(Types::AggregateConformancePackComplianceSummary)? = nil,
          @group_by_key : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetAggregateDiscoveredResourceCountsRequest
        include JSON::Serializable

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        # Filters the results based on the ResourceCountFilters object.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::ResourceCountFilters?

        # The key to group the resource counts.
        @[JSON::Field(key: "GroupByKey")]
        getter group_by_key : String?

        # The maximum number of GroupedResourceCount objects returned on each page. The default is 1000. You
        # cannot specify a number greater than 1000. If you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_aggregator_name : String,
          @filters : Types::ResourceCountFilters? = nil,
          @group_by_key : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetAggregateDiscoveredResourceCountsResponse
        include JSON::Serializable

        # The total number of resources that are present in an aggregator with the filters that you provide.
        @[JSON::Field(key: "TotalDiscoveredResources")]
        getter total_discovered_resources : Int64

        # The key passed into the request object. If GroupByKey is not provided, the result will be empty.
        @[JSON::Field(key: "GroupByKey")]
        getter group_by_key : String?

        # Returns a list of GroupedResourceCount objects.
        @[JSON::Field(key: "GroupedResourceCounts")]
        getter grouped_resource_counts : Array(Types::GroupedResourceCount)?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @total_discovered_resources : Int64,
          @group_by_key : String? = nil,
          @grouped_resource_counts : Array(Types::GroupedResourceCount)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetAggregateResourceConfigRequest
        include JSON::Serializable

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        # An object that identifies aggregate resource.
        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : Types::AggregateResourceIdentifier

        def initialize(
          @configuration_aggregator_name : String,
          @resource_identifier : Types::AggregateResourceIdentifier
        )
        end
      end

      struct GetAggregateResourceConfigResponse
        include JSON::Serializable

        # Returns a ConfigurationItem object.
        @[JSON::Field(key: "ConfigurationItem")]
        getter configuration_item : Types::ConfigurationItem?

        def initialize(
          @configuration_item : Types::ConfigurationItem? = nil
        )
        end
      end

      struct GetComplianceDetailsByConfigRuleRequest
        include JSON::Serializable

        # The name of the Config rule for which you want compliance information.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        # Filters the results by compliance. INSUFFICIENT_DATA is a valid ComplianceType that is returned when
        # an Config rule cannot be evaluated. However, INSUFFICIENT_DATA cannot be used as a ComplianceType
        # for filtering results.
        @[JSON::Field(key: "ComplianceTypes")]
        getter compliance_types : Array(String)?

        # The maximum number of evaluation results returned on each page. The default is 10. You cannot
        # specify a number greater than 100. If you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @config_rule_name : String,
          @compliance_types : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetComplianceDetailsByConfigRuleResponse
        include JSON::Serializable

        # Indicates whether the Amazon Web Services resource complies with the specified Config rule.
        @[JSON::Field(key: "EvaluationResults")]
        getter evaluation_results : Array(Types::EvaluationResult)?

        # The string that you use in a subsequent request to get the next page of results in a paginated
        # response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @evaluation_results : Array(Types::EvaluationResult)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetComplianceDetailsByResourceRequest
        include JSON::Serializable

        # Filters the results by compliance. INSUFFICIENT_DATA is a valid ComplianceType that is returned when
        # an Config rule cannot be evaluated. However, INSUFFICIENT_DATA cannot be used as a ComplianceType
        # for filtering results.
        @[JSON::Field(key: "ComplianceTypes")]
        getter compliance_types : Array(String)?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The unique ID of Amazon Web Services resource execution for which you want to retrieve evaluation
        # results. You need to only provide either a ResourceEvaluationID or a ResourceID and ResourceType .
        @[JSON::Field(key: "ResourceEvaluationId")]
        getter resource_evaluation_id : String?

        # The ID of the Amazon Web Services resource for which you want compliance information.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of the Amazon Web Services resource for which you want compliance information.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @compliance_types : Array(String)? = nil,
          @next_token : String? = nil,
          @resource_evaluation_id : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct GetComplianceDetailsByResourceResponse
        include JSON::Serializable

        # Indicates whether the specified Amazon Web Services resource complies each Config rule.
        @[JSON::Field(key: "EvaluationResults")]
        getter evaluation_results : Array(Types::EvaluationResult)?

        # The string that you use in a subsequent request to get the next page of results in a paginated
        # response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @evaluation_results : Array(Types::EvaluationResult)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetComplianceSummaryByConfigRuleResponse
        include JSON::Serializable

        # The number of Config rules that are compliant and the number that are noncompliant, up to a maximum
        # of 25 for each.
        @[JSON::Field(key: "ComplianceSummary")]
        getter compliance_summary : Types::ComplianceSummary?

        def initialize(
          @compliance_summary : Types::ComplianceSummary? = nil
        )
        end
      end

      struct GetComplianceSummaryByResourceTypeRequest
        include JSON::Serializable

        # Specify one or more resource types to get the number of resources that are compliant and the number
        # that are noncompliant for each resource type. For this request, you can specify an Amazon Web
        # Services resource type such as AWS::EC2::Instance . You can specify that the resource type is an
        # Amazon Web Services account by specifying AWS::::Account .
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        def initialize(
          @resource_types : Array(String)? = nil
        )
        end
      end

      struct GetComplianceSummaryByResourceTypeResponse
        include JSON::Serializable

        # The number of resources that are compliant and the number that are noncompliant. If one or more
        # resource types were provided with the request, the numbers are returned for each resource type. The
        # maximum number returned is 100.
        @[JSON::Field(key: "ComplianceSummariesByResourceType")]
        getter compliance_summaries_by_resource_type : Array(Types::ComplianceSummaryByResourceType)?

        def initialize(
          @compliance_summaries_by_resource_type : Array(Types::ComplianceSummaryByResourceType)? = nil
        )
        end
      end

      struct GetConformancePackComplianceDetailsRequest
        include JSON::Serializable

        # Name of the conformance pack.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String

        # A ConformancePackEvaluationFilters object.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::ConformancePackEvaluationFilters?

        # The maximum number of evaluation results returned on each page. If you do no specify a number,
        # Config uses the default. The default is 100.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @conformance_pack_name : String,
          @filters : Types::ConformancePackEvaluationFilters? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetConformancePackComplianceDetailsResponse
        include JSON::Serializable

        # Name of the conformance pack.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String

        # Returns a list of ConformancePackEvaluationResult objects.
        @[JSON::Field(key: "ConformancePackRuleEvaluationResults")]
        getter conformance_pack_rule_evaluation_results : Array(Types::ConformancePackEvaluationResult)?

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @conformance_pack_name : String,
          @conformance_pack_rule_evaluation_results : Array(Types::ConformancePackEvaluationResult)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetConformancePackComplianceSummaryRequest
        include JSON::Serializable

        # Names of conformance packs.
        @[JSON::Field(key: "ConformancePackNames")]
        getter conformance_pack_names : Array(String)

        # The maximum number of conformance packs returned on each page.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @conformance_pack_names : Array(String),
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetConformancePackComplianceSummaryResponse
        include JSON::Serializable

        # A list of ConformancePackComplianceSummary objects.
        @[JSON::Field(key: "ConformancePackComplianceSummaryList")]
        getter conformance_pack_compliance_summary_list : Array(Types::ConformancePackComplianceSummary)?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @conformance_pack_compliance_summary_list : Array(Types::ConformancePackComplianceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetCustomRulePolicyRequest
        include JSON::Serializable

        # The name of your Config Custom Policy rule.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String?

        def initialize(
          @config_rule_name : String? = nil
        )
        end
      end

      struct GetCustomRulePolicyResponse
        include JSON::Serializable

        # The policy definition containing the logic for your Config Custom Policy rule.
        @[JSON::Field(key: "PolicyText")]
        getter policy_text : String?

        def initialize(
          @policy_text : String? = nil
        )
        end
      end

      struct GetDiscoveredResourceCountsRequest
        include JSON::Serializable

        # The maximum number of ResourceCount objects returned on each page. The default is 100. You cannot
        # specify a number greater than 100. If you specify 0, Config uses the default.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The comma-separated list that specifies the resource types that you want Config to return (for
        # example, "AWS::EC2::Instance" , "AWS::IAM::User" ). If a value for resourceTypes is not specified,
        # Config returns all resource types that Config is recording in the region for your account. If the
        # configuration recorder is turned off, Config returns an empty list of ResourceCount objects. If the
        # configuration recorder is not recording a specific resource type (for example, S3 buckets), that
        # resource type is not returned in the list of ResourceCount objects.
        @[JSON::Field(key: "resourceTypes")]
        getter resource_types : Array(String)?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @resource_types : Array(String)? = nil
        )
        end
      end

      struct GetDiscoveredResourceCountsResponse
        include JSON::Serializable

        # The string that you use in a subsequent request to get the next page of results in a paginated
        # response.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of ResourceCount objects. Each object is listed in descending order by the number of
        # resources.
        @[JSON::Field(key: "resourceCounts")]
        getter resource_counts : Array(Types::ResourceCount)?

        # The total number of resources that Config is recording in the region for your account. If you
        # specify resource types in the request, Config returns only the total number of resources for those
        # resource types. Example Config is recording three resource types in the US East (Ohio) Region for
        # your account: 25 EC2 instances, 20 IAM users, and 15 S3 buckets, for a total of 60 resources. You
        # make a call to the GetDiscoveredResourceCounts action and specify the resource type,
        # "AWS::EC2::Instances" , in the request. Config returns 25 for totalDiscoveredResources .
        @[JSON::Field(key: "totalDiscoveredResources")]
        getter total_discovered_resources : Int64?

        def initialize(
          @next_token : String? = nil,
          @resource_counts : Array(Types::ResourceCount)? = nil,
          @total_discovered_resources : Int64? = nil
        )
        end
      end

      struct GetOrganizationConfigRuleDetailedStatusRequest
        include JSON::Serializable

        # The name of your organization Config rule for which you want status details for member accounts.
        @[JSON::Field(key: "OrganizationConfigRuleName")]
        getter organization_config_rule_name : String

        # A StatusDetailFilters object.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::StatusDetailFilters?

        # The maximum number of OrganizationConfigRuleDetailedStatus returned on each page. If you do not
        # specify a number, Config uses the default. The default is 100.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @organization_config_rule_name : String,
          @filters : Types::StatusDetailFilters? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetOrganizationConfigRuleDetailedStatusResponse
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of MemberAccountStatus objects.
        @[JSON::Field(key: "OrganizationConfigRuleDetailedStatus")]
        getter organization_config_rule_detailed_status : Array(Types::MemberAccountStatus)?

        def initialize(
          @next_token : String? = nil,
          @organization_config_rule_detailed_status : Array(Types::MemberAccountStatus)? = nil
        )
        end
      end

      struct GetOrganizationConformancePackDetailedStatusRequest
        include JSON::Serializable

        # The name of organization conformance pack for which you want status details for member accounts.
        @[JSON::Field(key: "OrganizationConformancePackName")]
        getter organization_conformance_pack_name : String

        # An OrganizationResourceDetailedStatusFilters object.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::OrganizationResourceDetailedStatusFilters?

        # The maximum number of OrganizationConformancePackDetailedStatuses returned on each page. If you do
        # not specify a number, Config uses the default. The default is 100.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @organization_conformance_pack_name : String,
          @filters : Types::OrganizationResourceDetailedStatusFilters? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetOrganizationConformancePackDetailedStatusResponse
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of OrganizationConformancePackDetailedStatus objects.
        @[JSON::Field(key: "OrganizationConformancePackDetailedStatuses")]
        getter organization_conformance_pack_detailed_statuses : Array(Types::OrganizationConformancePackDetailedStatus)?

        def initialize(
          @next_token : String? = nil,
          @organization_conformance_pack_detailed_statuses : Array(Types::OrganizationConformancePackDetailedStatus)? = nil
        )
        end
      end

      struct GetOrganizationCustomRulePolicyRequest
        include JSON::Serializable

        # The name of your organization Config Custom Policy rule.
        @[JSON::Field(key: "OrganizationConfigRuleName")]
        getter organization_config_rule_name : String

        def initialize(
          @organization_config_rule_name : String
        )
        end
      end

      struct GetOrganizationCustomRulePolicyResponse
        include JSON::Serializable

        # The policy definition containing the logic for your organization Config Custom Policy rule.
        @[JSON::Field(key: "PolicyText")]
        getter policy_text : String?

        def initialize(
          @policy_text : String? = nil
        )
        end
      end

      # The input for the GetResourceConfigHistory action.
      struct GetResourceConfigHistoryRequest
        include JSON::Serializable

        # The ID of the resource (for example., sg-xxxxxx ).
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The chronological order for configuration items listed. By default, the results are listed in
        # reverse chronological order.
        @[JSON::Field(key: "chronologicalOrder")]
        getter chronological_order : String?

        # The chronologically earliest time in the time range for which the history requested. If not
        # specified, the action returns paginated results that contain configuration items that start when the
        # first configuration item was recorded.
        @[JSON::Field(key: "earlierTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter earlier_time : Time?

        # The chronologically latest time in the time range for which the history requested. If not specified,
        # current time is taken.
        @[JSON::Field(key: "laterTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter later_time : Time?

        # The maximum number of configuration items returned on each page. The default is 10. You cannot
        # specify a number greater than 100. If you specify 0, Config uses the default.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_id : String,
          @resource_type : String,
          @chronological_order : String? = nil,
          @earlier_time : Time? = nil,
          @later_time : Time? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The output for the GetResourceConfigHistory action.
      struct GetResourceConfigHistoryResponse
        include JSON::Serializable

        # An array of ConfigurationItems Objects. Contatins the configuration history for one or more
        # resources.
        @[JSON::Field(key: "configurationItems")]
        getter configuration_items : Array(Types::ConfigurationItem)?

        # The string that you use in a subsequent request to get the next page of results in a paginated
        # response.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configuration_items : Array(Types::ConfigurationItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetResourceEvaluationSummaryRequest
        include JSON::Serializable

        # The unique ResourceEvaluationId of Amazon Web Services resource execution for which you want to
        # retrieve the evaluation summary.
        @[JSON::Field(key: "ResourceEvaluationId")]
        getter resource_evaluation_id : String

        def initialize(
          @resource_evaluation_id : String
        )
        end
      end

      struct GetResourceEvaluationSummaryResponse
        include JSON::Serializable

        # The compliance status of the resource evaluation summary.
        @[JSON::Field(key: "Compliance")]
        getter compliance : String?

        # Returns an EvaluationContext object.
        @[JSON::Field(key: "EvaluationContext")]
        getter evaluation_context : Types::EvaluationContext?

        # Lists results of the mode that you requested to retrieve the resource evaluation summary. The valid
        # values are Detective or Proactive.
        @[JSON::Field(key: "EvaluationMode")]
        getter evaluation_mode : String?

        # The start timestamp when Config rule starts evaluating compliance for the provided resource details.
        @[JSON::Field(key: "EvaluationStartTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter evaluation_start_timestamp : Time?

        # Returns an EvaluationStatus object.
        @[JSON::Field(key: "EvaluationStatus")]
        getter evaluation_status : Types::EvaluationStatus?

        # Returns a ResourceDetails object.
        @[JSON::Field(key: "ResourceDetails")]
        getter resource_details : Types::ResourceDetails?

        # The unique ResourceEvaluationId of Amazon Web Services resource execution for which you want to
        # retrieve the evaluation summary.
        @[JSON::Field(key: "ResourceEvaluationId")]
        getter resource_evaluation_id : String?

        def initialize(
          @compliance : String? = nil,
          @evaluation_context : Types::EvaluationContext? = nil,
          @evaluation_mode : String? = nil,
          @evaluation_start_timestamp : Time? = nil,
          @evaluation_status : Types::EvaluationStatus? = nil,
          @resource_details : Types::ResourceDetails? = nil,
          @resource_evaluation_id : String? = nil
        )
        end
      end

      struct GetStoredQueryRequest
        include JSON::Serializable

        # The name of the query.
        @[JSON::Field(key: "QueryName")]
        getter query_name : String

        def initialize(
          @query_name : String
        )
        end
      end

      struct GetStoredQueryResponse
        include JSON::Serializable

        # Returns a StoredQuery object.
        @[JSON::Field(key: "StoredQuery")]
        getter stored_query : Types::StoredQuery?

        def initialize(
          @stored_query : Types::StoredQuery? = nil
        )
        end
      end

      # The count of resources that are grouped by the group name.
      struct GroupedResourceCount
        include JSON::Serializable

        # The name of the group that can be region, account ID, or resource type. For example, region1,
        # region2 if the region was chosen as GroupByKey .
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The number of resources in the group.
        @[JSON::Field(key: "ResourceCount")]
        getter resource_count : Int64

        def initialize(
          @group_name : String,
          @resource_count : Int64
        )
        end
      end

      # Using the same client token with one or more different parameters. Specify a new client token with
      # the parameter changes and try again.
      struct IdempotentParameterMismatch
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your Amazon S3 bucket policy does not allow Config to write to it.
      struct InsufficientDeliveryPolicyException
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates one of the following errors: For PutConfigRule , the rule cannot be created because the
      # IAM role assigned to Config lacks permissions to perform the config:Put* action. For PutConfigRule ,
      # the Lambda function cannot be invoked. Check the function ARN, and check the function's permissions.
      # For PutOrganizationConfigRule , organization Config rule cannot be created because you do not have
      # permissions to call IAM GetRole action or create a service-linked role. For PutConformancePack and
      # PutOrganizationConformancePack , a conformance pack cannot be created because you do not have the
      # following permissions: You do not have permission to call IAM GetRole action or create a
      # service-linked role. You do not have permission to read Amazon S3 bucket or call SSM:GetDocument.
      # For PutServiceLinkedConfigurationRecorder , a service-linked configuration recorder cannot be
      # created because you do not have the following permissions: IAM CreateServiceLinkedRole .
      struct InsufficientPermissionsException
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration recorder name is not valid. The prefix " AWSConfigurationRecorderFor " is reserved
      # for service-linked configuration recorders.
      struct InvalidConfigurationRecorderNameException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified delivery channel name is not valid.
      struct InvalidDeliveryChannelNameException
        include JSON::Serializable

        def initialize
        end
      end

      # The syntax of the query is incorrect.
      struct InvalidExpressionException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified limit is outside the allowable range.
      struct InvalidLimitException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified next token is not valid. Specify the nextToken string that was returned in the
      # previous response to get the next page of results.
      struct InvalidNextTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # One or more of the specified parameters are not valid. Verify that your parameters are valid and try
      # again.
      struct InvalidParameterValueException
        include JSON::Serializable

        def initialize
        end
      end

      # One of the following errors: You have provided a combination of parameter values that is not valid.
      # For example: Setting the allSupported field of RecordingGroup to true , but providing a non-empty
      # list for the resourceTypes field of RecordingGroup . Setting the allSupported field of
      # RecordingGroup to true , but also setting the useOnly field of RecordingStrategy to
      # EXCLUSION_BY_RESOURCE_TYPES . Every parameter is either null, false, or empty. You have reached the
      # limit of the number of resource types you can provide for the recording group. You have provided
      # resource types or a recording strategy that are not valid.
      struct InvalidRecordingGroupException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified ResultToken is not valid.
      struct InvalidResultTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # You have provided a null or empty Amazon Resource Name (ARN) for the IAM role assumed by Config and
      # used by the customer managed configuration recorder.
      struct InvalidRoleException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified Amazon S3 key prefix is not valid.
      struct InvalidS3KeyPrefixException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified Amazon KMS Key ARN is not valid.
      struct InvalidS3KmsKeyArnException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified Amazon SNS topic does not exist.
      struct InvalidSNSTopicARNException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified time range is not valid. The earlier time is not chronologically before the later
      # time.
      struct InvalidTimeRangeException
        include JSON::Serializable

        def initialize
        end
      end

      # You cannot delete the delivery channel you specified because the customer managed configuration
      # recorder is running.
      struct LastDeliveryChannelDeleteFailedException
        include JSON::Serializable

        def initialize
        end
      end

      # For PutServiceLinkedConfigurationRecorder API, this exception is thrown if the number of
      # service-linked roles in the account exceeds the limit. For StartConfigRulesEvaluation API, this
      # exception is thrown if an evaluation is in progress or if you call the StartConfigRulesEvaluation
      # API more than once per minute. For PutConfigurationAggregator API, this exception is thrown if the
      # number of accounts and aggregators exceeds the limit.
      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      struct ListAggregateDiscoveredResourcesRequest
        include JSON::Serializable

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        # The type of resources that you want Config to list in the response.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Filters the results based on the ResourceFilters object.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::ResourceFilters?

        # The maximum number of resource identifiers returned on each page. You cannot specify a number
        # greater than 100. If you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_aggregator_name : String,
          @resource_type : String,
          @filters : Types::ResourceFilters? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAggregateDiscoveredResourcesResponse
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a list of ResourceIdentifiers objects.
        @[JSON::Field(key: "ResourceIdentifiers")]
        getter resource_identifiers : Array(Types::AggregateResourceIdentifier)?

        def initialize(
          @next_token : String? = nil,
          @resource_identifiers : Array(Types::AggregateResourceIdentifier)? = nil
        )
        end
      end

      struct ListConfigurationRecordersRequest
        include JSON::Serializable

        # Filters the results based on a list of ConfigurationRecorderFilter objects that you specify.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ConfigurationRecorderFilter)?

        # The maximum number of results to include in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The NextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::ConfigurationRecorderFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListConfigurationRecordersResponse
        include JSON::Serializable

        # A list of ConfigurationRecorderSummary objects that includes.
        @[JSON::Field(key: "ConfigurationRecorderSummaries")]
        getter configuration_recorder_summaries : Array(Types::ConfigurationRecorderSummary)

        # The NextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_recorder_summaries : Array(Types::ConfigurationRecorderSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListConformancePackComplianceScoresRequest
        include JSON::Serializable

        # Filters the results based on the ConformancePackComplianceScoresFilters .
        @[JSON::Field(key: "Filters")]
        getter filters : Types::ConformancePackComplianceScoresFilters?

        # The maximum number of conformance pack compliance scores returned on each page.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string in a prior request that you can use to get the paginated response for the next
        # set of conformance pack compliance scores.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Sorts your conformance pack compliance scores in either ascending or descending order, depending on
        # SortOrder . By default, conformance pack compliance scores are sorted in alphabetical order by name
        # of the conformance pack. Enter SCORE , to sort conformance pack compliance scores by the numerical
        # value of the compliance score.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # Determines the order in which conformance pack compliance scores are sorted. Either in ascending or
        # descending order. By default, conformance pack compliance scores are sorted in alphabetical order by
        # name of the conformance pack. Conformance pack compliance scores are sorted in reverse alphabetical
        # order if you enter DESCENDING . You can sort conformance pack compliance scores by the numerical
        # value of the compliance score by entering SCORE in the SortBy action. When compliance scores are
        # sorted by SCORE , conformance packs with a compliance score of INSUFFICIENT_DATA will be last when
        # sorting by ascending order and first when sorting by descending order.
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @filters : Types::ConformancePackComplianceScoresFilters? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListConformancePackComplianceScoresResponse
        include JSON::Serializable

        # A list of ConformancePackComplianceScore objects.
        @[JSON::Field(key: "ConformancePackComplianceScores")]
        getter conformance_pack_compliance_scores : Array(Types::ConformancePackComplianceScore)

        # The nextToken string that you can use to get the next page of results in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @conformance_pack_compliance_scores : Array(Types::ConformancePackComplianceScore),
          @next_token : String? = nil
        )
        end
      end

      struct ListDiscoveredResourcesRequest
        include JSON::Serializable

        # The type of resources that you want Config to list in the response.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Specifies whether Config includes deleted resources in the results. By default, deleted resources
        # are not included.
        @[JSON::Field(key: "includeDeletedResources")]
        getter include_deleted_resources : Bool?

        # The maximum number of resource identifiers returned on each page. The default is 100. You cannot
        # specify a number greater than 100. If you specify 0, Config uses the default.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The IDs of only those resources that you want Config to list in the response. If you do not specify
        # this parameter, Config lists all resources of the specified type that it has discovered. You can
        # list a minimum of 1 resourceID and a maximum of 20 resourceIds.
        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(String)?

        # The custom name of only those resources that you want Config to list in the response. If you do not
        # specify this parameter, Config lists all resources of the specified type that it has discovered.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @resource_type : String,
          @include_deleted_resources : Bool? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @resource_ids : Array(String)? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct ListDiscoveredResourcesResponse
        include JSON::Serializable

        # The string that you use in a subsequent request to get the next page of results in a paginated
        # response.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The details that identify a resource that is discovered by Config, including the resource type, ID,
        # and (if available) the custom resource name.
        @[JSON::Field(key: "resourceIdentifiers")]
        getter resource_identifiers : Array(Types::ResourceIdentifier)?

        def initialize(
          @next_token : String? = nil,
          @resource_identifiers : Array(Types::ResourceIdentifier)? = nil
        )
        end
      end

      struct ListResourceEvaluationsRequest
        include JSON::Serializable

        # Returns a ResourceEvaluationFilters object.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::ResourceEvaluationFilters?

        # The maximum number of evaluations returned on each page. The default is 10. You cannot specify a
        # number greater than 100. If you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Types::ResourceEvaluationFilters? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceEvaluationsResponse
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a ResourceEvaluations object.
        @[JSON::Field(key: "ResourceEvaluations")]
        getter resource_evaluations : Array(Types::ResourceEvaluation)?

        def initialize(
          @next_token : String? = nil,
          @resource_evaluations : Array(Types::ResourceEvaluation)? = nil
        )
        end
      end

      struct ListStoredQueriesRequest
        include JSON::Serializable

        # The maximum number of results to be returned with a single call.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStoredQueriesResponse
        include JSON::Serializable

        # If the previous paginated request didn't return all of the remaining results, the response object's
        # NextToken parameter value is set to a token. To retrieve the next set of results, call this
        # operation again and assign that token to the request object's NextToken parameter. If there are no
        # remaining results, the previous response object's NextToken parameter is set to null .
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of StoredQueryMetadata objects.
        @[JSON::Field(key: "StoredQueryMetadata")]
        getter stored_query_metadata : Array(Types::StoredQueryMetadata)?

        def initialize(
          @next_token : String? = nil,
          @stored_query_metadata : Array(Types::StoredQueryMetadata)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. The
        # following resources are supported: ConfigurationRecorder ConfigRule OrganizationConfigRule
        # ConformancePack OrganizationConformancePack ConfigurationAggregator AggregationAuthorization
        # StoredQuery
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The maximum number of tags returned on each page. The limit maximum is 50. You cannot specify a
        # number greater than 50. If you specify 0, Config uses the default.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The nextToken string returned on a previous page that you use to get the next page of results in a
        # paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The tags for the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # You have reached the limit of active custom resource types in your account. There is a limit of
      # 100,000. Delete unused resources using DeleteResourceConfig .
      struct MaxActiveResourcesExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Failed to add the Config rule because the account already contains the maximum number of 1000 rules.
      # Consider deleting any deactivated rules before you add new rules.
      struct MaxNumberOfConfigRulesExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # You have reached the limit of the number of configuration recorders you can create.
      struct MaxNumberOfConfigurationRecordersExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # You have reached the limit of the number of conformance packs you can create in an account. For more
      # information, see Service Limits in the Config Developer Guide .
      struct MaxNumberOfConformancePacksExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # You have reached the limit of the number of delivery channels you can create.
      struct MaxNumberOfDeliveryChannelsExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # You have reached the limit of the number of organization Config rules you can create. For more
      # information, see see Service Limits in the Config Developer Guide .
      struct MaxNumberOfOrganizationConfigRulesExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # You have reached the limit of the number of organization conformance packs you can create in an
      # account. For more information, see Service Limits in the Config Developer Guide .
      struct MaxNumberOfOrganizationConformancePacksExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Failed to add the retention configuration because a retention configuration with that name already
      # exists.
      struct MaxNumberOfRetentionConfigurationsExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Organization Config rule creation or deletion status in each member account. This includes the name
      # of the rule, the status, error code and error message when the rule creation or deletion failed.
      struct MemberAccountStatus
        include JSON::Serializable

        # The 12-digit account ID of a member account.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The name of Config rule deployed in the member account.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        # Indicates deployment status for Config rule in the member account. When management account calls
        # PutOrganizationConfigRule action for the first time, Config rule status is created in the member
        # account. When management account calls PutOrganizationConfigRule action for the second time, Config
        # rule status is updated in the member account. Config rule status is deleted when the management
        # account deletes OrganizationConfigRule and disables service access for
        # config-multiaccountsetup.amazonaws.com . Config sets the state of the rule to: CREATE_SUCCESSFUL
        # when Config rule has been created in the member account. CREATE_IN_PROGRESS when Config rule is
        # being created in the member account. CREATE_FAILED when Config rule creation has failed in the
        # member account. DELETE_FAILED when Config rule deletion has failed in the member account.
        # DELETE_IN_PROGRESS when Config rule is being deleted in the member account. DELETE_SUCCESSFUL when
        # Config rule has been deleted in the member account. UPDATE_SUCCESSFUL when Config rule has been
        # updated in the member account. UPDATE_IN_PROGRESS when Config rule is being updated in the member
        # account. UPDATE_FAILED when Config rule deletion has failed in the member account.
        @[JSON::Field(key: "MemberAccountRuleStatus")]
        getter member_account_rule_status : String

        # An error code that is returned when Config rule creation or deletion failed in the member account.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # An error message indicating that Config rule account creation or deletion has failed due to an error
        # in the member account.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The timestamp of the last status update.
        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        def initialize(
          @account_id : String,
          @config_rule_name : String,
          @member_account_rule_status : String,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @last_update_time : Time? = nil
        )
        end
      end

      # There are no customer managed configuration recorders available to record your resources. Use the
      # PutConfigurationRecorder operation to create the customer managed configuration recorder.
      struct NoAvailableConfigurationRecorderException
        include JSON::Serializable

        def initialize
        end
      end

      # There is no delivery channel available to record configurations.
      struct NoAvailableDeliveryChannelException
        include JSON::Serializable

        def initialize
        end
      end

      # Organization is no longer available.
      struct NoAvailableOrganizationException
        include JSON::Serializable

        def initialize
        end
      end

      # There is no configuration recorder running.
      struct NoRunningConfigurationRecorderException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified Amazon S3 bucket does not exist.
      struct NoSuchBucketException
        include JSON::Serializable

        def initialize
        end
      end

      # The Config rule in the request is not valid. Verify that the rule is an Config Process Check rule,
      # that the rule name is correct, and that valid Amazon Resouce Names (ARNs) are used before trying
      # again.
      struct NoSuchConfigRuleException
        include JSON::Serializable

        def initialize
        end
      end

      # Config rule that you passed in the filter does not exist.
      struct NoSuchConfigRuleInConformancePackException
        include JSON::Serializable

        def initialize
        end
      end

      # You have specified a configuration aggregator that does not exist.
      struct NoSuchConfigurationAggregatorException
        include JSON::Serializable

        def initialize
        end
      end

      # You have specified a configuration recorder that does not exist.
      struct NoSuchConfigurationRecorderException
        include JSON::Serializable

        def initialize
        end
      end

      # You specified one or more conformance packs that do not exist.
      struct NoSuchConformancePackException
        include JSON::Serializable

        def initialize
        end
      end

      # You have specified a delivery channel that does not exist.
      struct NoSuchDeliveryChannelException
        include JSON::Serializable

        def initialize
        end
      end

      # The Config rule in the request is not valid. Verify that the rule is an organization Config Process
      # Check rule, that the rule name is correct, and that valid Amazon Resouce Names (ARNs) are used
      # before trying again.
      struct NoSuchOrganizationConfigRuleException
        include JSON::Serializable

        def initialize
        end
      end

      # Config organization conformance pack that you passed in the filter does not exist. For
      # DeleteOrganizationConformancePack, you tried to delete an organization conformance pack that does
      # not exist.
      struct NoSuchOrganizationConformancePackException
        include JSON::Serializable

        def initialize
        end
      end

      # You specified an Config rule without a remediation configuration.
      struct NoSuchRemediationConfigurationException
        include JSON::Serializable

        def initialize
        end
      end

      # You tried to delete a remediation exception that does not exist.
      struct NoSuchRemediationExceptionException
        include JSON::Serializable

        def initialize
        end
      end

      # You have specified a retention configuration that does not exist.
      struct NoSuchRetentionConfigurationException
        include JSON::Serializable

        def initialize
        end
      end

      # For PutConfigurationAggregator API, you can see this exception for the following reasons: No
      # permission to call EnableAWSServiceAccess API The configuration aggregator cannot be updated because
      # your Amazon Web Services Organization management account or the delegated administrator role
      # changed. Delete this aggregator and create a new one with the current Amazon Web Services
      # Organization. The configuration aggregator is associated with a previous Amazon Web Services
      # Organization and Config cannot aggregate data with current Amazon Web Services Organization. Delete
      # this aggregator and create a new one with the current Amazon Web Services Organization. You are not
      # a registered delegated administrator for Config with permissions to call ListDelegatedAdministrators
      # API. Ensure that the management account registers delagated administrator for Config service
      # principal name before the delegated administrator creates an aggregator. For all
      # OrganizationConfigRule and OrganizationConformancePack APIs, Config throws an exception if APIs are
      # called from member accounts. All APIs must be called from organization management account.
      struct OrganizationAccessDeniedException
        include JSON::Serializable

        def initialize
        end
      end

      # This object contains regions to set up the aggregator and an IAM role to retrieve organization
      # details.
      struct OrganizationAggregationSource
        include JSON::Serializable

        # ARN of the IAM role used to retrieve Amazon Web Services Organization details associated with the
        # aggregator account.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # If true, aggregate existing Config regions and future regions.
        @[JSON::Field(key: "AllAwsRegions")]
        getter all_aws_regions : Bool?

        # The source regions being aggregated.
        @[JSON::Field(key: "AwsRegions")]
        getter aws_regions : Array(String)?

        def initialize(
          @role_arn : String,
          @all_aws_regions : Bool? = nil,
          @aws_regions : Array(String)? = nil
        )
        end
      end

      # Config resource cannot be created because your organization does not have all features enabled.
      struct OrganizationAllFeaturesNotEnabledException
        include JSON::Serializable

        def initialize
        end
      end

      # An organization Config rule that has information about Config rules that Config creates in member
      # accounts.
      struct OrganizationConfigRule
        include JSON::Serializable

        # Amazon Resource Name (ARN) of organization Config rule.
        @[JSON::Field(key: "OrganizationConfigRuleArn")]
        getter organization_config_rule_arn : String

        # The name that you assign to organization Config rule.
        @[JSON::Field(key: "OrganizationConfigRuleName")]
        getter organization_config_rule_name : String

        # A comma-separated list of accounts excluded from organization Config rule.
        @[JSON::Field(key: "ExcludedAccounts")]
        getter excluded_accounts : Array(String)?

        # The timestamp of the last update.
        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        # An object that specifies metadata for your organization's Config Custom Policy rule. The metadata
        # includes the runtime system in use, which accounts have debug logging enabled, and other custom rule
        # metadata, such as resource type, resource ID of Amazon Web Services resource, and organization
        # trigger types that initiate Config to evaluate Amazon Web Services resources against a rule.
        @[JSON::Field(key: "OrganizationCustomPolicyRuleMetadata")]
        getter organization_custom_policy_rule_metadata : Types::OrganizationCustomPolicyRuleMetadataNoPolicy?

        # An OrganizationCustomRuleMetadata object.
        @[JSON::Field(key: "OrganizationCustomRuleMetadata")]
        getter organization_custom_rule_metadata : Types::OrganizationCustomRuleMetadata?

        # An OrganizationManagedRuleMetadata object.
        @[JSON::Field(key: "OrganizationManagedRuleMetadata")]
        getter organization_managed_rule_metadata : Types::OrganizationManagedRuleMetadata?

        def initialize(
          @organization_config_rule_arn : String,
          @organization_config_rule_name : String,
          @excluded_accounts : Array(String)? = nil,
          @last_update_time : Time? = nil,
          @organization_custom_policy_rule_metadata : Types::OrganizationCustomPolicyRuleMetadataNoPolicy? = nil,
          @organization_custom_rule_metadata : Types::OrganizationCustomRuleMetadata? = nil,
          @organization_managed_rule_metadata : Types::OrganizationManagedRuleMetadata? = nil
        )
        end
      end

      # Returns the status for an organization Config rule in an organization.
      struct OrganizationConfigRuleStatus
        include JSON::Serializable

        # The name that you assign to organization Config rule.
        @[JSON::Field(key: "OrganizationConfigRuleName")]
        getter organization_config_rule_name : String

        # Indicates deployment status of an organization Config rule. When management account calls
        # PutOrganizationConfigRule action for the first time, Config rule status is created in all the member
        # accounts. When management account calls PutOrganizationConfigRule action for the second time, Config
        # rule status is updated in all the member accounts. Additionally, Config rule status is updated when
        # one or more member accounts join or leave an organization. Config rule status is deleted when the
        # management account deletes OrganizationConfigRule in all the member accounts and disables service
        # access for config-multiaccountsetup.amazonaws.com . Config sets the state of the rule to:
        # CREATE_SUCCESSFUL when an organization Config rule has been successfully created in all the member
        # accounts. CREATE_IN_PROGRESS when an organization Config rule creation is in progress. CREATE_FAILED
        # when an organization Config rule creation failed in one or more member accounts within that
        # organization. DELETE_FAILED when an organization Config rule deletion failed in one or more member
        # accounts within that organization. DELETE_IN_PROGRESS when an organization Config rule deletion is
        # in progress. DELETE_SUCCESSFUL when an organization Config rule has been successfully deleted from
        # all the member accounts. UPDATE_SUCCESSFUL when an organization Config rule has been successfully
        # updated in all the member accounts. UPDATE_IN_PROGRESS when an organization Config rule update is in
        # progress. UPDATE_FAILED when an organization Config rule update failed in one or more member
        # accounts within that organization.
        @[JSON::Field(key: "OrganizationRuleStatus")]
        getter organization_rule_status : String

        # An error code that is returned when organization Config rule creation or deletion has failed.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # An error message indicating that organization Config rule creation or deletion failed due to an
        # error.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The timestamp of the last update.
        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        def initialize(
          @organization_config_rule_name : String,
          @organization_rule_status : String,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @last_update_time : Time? = nil
        )
        end
      end

      # An organization conformance pack that has information about conformance packs that Config creates in
      # member accounts.
      struct OrganizationConformancePack
        include JSON::Serializable

        # Last time when organization conformation pack was updated.
        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time

        # Amazon Resource Name (ARN) of organization conformance pack.
        @[JSON::Field(key: "OrganizationConformancePackArn")]
        getter organization_conformance_pack_arn : String

        # The name you assign to an organization conformance pack.
        @[JSON::Field(key: "OrganizationConformancePackName")]
        getter organization_conformance_pack_name : String

        # A list of ConformancePackInputParameter objects.
        @[JSON::Field(key: "ConformancePackInputParameters")]
        getter conformance_pack_input_parameters : Array(Types::ConformancePackInputParameter)?

        # The name of the Amazon S3 bucket where Config stores conformance pack templates. This field is
        # optional.
        @[JSON::Field(key: "DeliveryS3Bucket")]
        getter delivery_s3_bucket : String?

        # Any folder structure you want to add to an Amazon S3 bucket. This field is optional.
        @[JSON::Field(key: "DeliveryS3KeyPrefix")]
        getter delivery_s3_key_prefix : String?

        # A comma-separated list of accounts excluded from organization conformance pack.
        @[JSON::Field(key: "ExcludedAccounts")]
        getter excluded_accounts : Array(String)?

        def initialize(
          @last_update_time : Time,
          @organization_conformance_pack_arn : String,
          @organization_conformance_pack_name : String,
          @conformance_pack_input_parameters : Array(Types::ConformancePackInputParameter)? = nil,
          @delivery_s3_bucket : String? = nil,
          @delivery_s3_key_prefix : String? = nil,
          @excluded_accounts : Array(String)? = nil
        )
        end
      end

      # Organization conformance pack creation or deletion status in each member account. This includes the
      # name of the conformance pack, the status, error code and error message when the conformance pack
      # creation or deletion failed.
      struct OrganizationConformancePackDetailedStatus
        include JSON::Serializable

        # The 12-digit account ID of a member account.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The name of conformance pack deployed in the member account.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String

        # Indicates deployment status for conformance pack in a member account. When management account calls
        # PutOrganizationConformancePack action for the first time, conformance pack status is created in the
        # member account. When management account calls PutOrganizationConformancePack action for the second
        # time, conformance pack status is updated in the member account. Conformance pack status is deleted
        # when the management account deletes OrganizationConformancePack and disables service access for
        # config-multiaccountsetup.amazonaws.com . Config sets the state of the conformance pack to:
        # CREATE_SUCCESSFUL when conformance pack has been created in the member account. CREATE_IN_PROGRESS
        # when conformance pack is being created in the member account. CREATE_FAILED when conformance pack
        # creation has failed in the member account. DELETE_FAILED when conformance pack deletion has failed
        # in the member account. DELETE_IN_PROGRESS when conformance pack is being deleted in the member
        # account. DELETE_SUCCESSFUL when conformance pack has been deleted in the member account.
        # UPDATE_SUCCESSFUL when conformance pack has been updated in the member account. UPDATE_IN_PROGRESS
        # when conformance pack is being updated in the member account. UPDATE_FAILED when conformance pack
        # deletion has failed in the member account.
        @[JSON::Field(key: "Status")]
        getter status : String

        # An error code that is returned when conformance pack creation or deletion failed in the member
        # account.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # An error message indicating that conformance pack account creation or deletion has failed due to an
        # error in the member account.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The timestamp of the last status update.
        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        def initialize(
          @account_id : String,
          @conformance_pack_name : String,
          @status : String,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @last_update_time : Time? = nil
        )
        end
      end

      # Returns the status for an organization conformance pack in an organization.
      struct OrganizationConformancePackStatus
        include JSON::Serializable

        # The name that you assign to organization conformance pack.
        @[JSON::Field(key: "OrganizationConformancePackName")]
        getter organization_conformance_pack_name : String

        # Indicates deployment status of an organization conformance pack. When management account calls
        # PutOrganizationConformancePack for the first time, conformance pack status is created in all the
        # member accounts. When management account calls PutOrganizationConformancePack for the second time,
        # conformance pack status is updated in all the member accounts. Additionally, conformance pack status
        # is updated when one or more member accounts join or leave an organization. Conformance pack status
        # is deleted when the management account deletes OrganizationConformancePack in all the member
        # accounts and disables service access for config-multiaccountsetup.amazonaws.com . Config sets the
        # state of the conformance pack to: CREATE_SUCCESSFUL when an organization conformance pack has been
        # successfully created in all the member accounts. CREATE_IN_PROGRESS when an organization conformance
        # pack creation is in progress. CREATE_FAILED when an organization conformance pack creation failed in
        # one or more member accounts within that organization. DELETE_FAILED when an organization conformance
        # pack deletion failed in one or more member accounts within that organization. DELETE_IN_PROGRESS
        # when an organization conformance pack deletion is in progress. DELETE_SUCCESSFUL when an
        # organization conformance pack has been successfully deleted from all the member accounts.
        # UPDATE_SUCCESSFUL when an organization conformance pack has been successfully updated in all the
        # member accounts. UPDATE_IN_PROGRESS when an organization conformance pack update is in progress.
        # UPDATE_FAILED when an organization conformance pack update failed in one or more member accounts
        # within that organization.
        @[JSON::Field(key: "Status")]
        getter status : String

        # An error code that is returned when organization conformance pack creation or deletion has failed in
        # a member account.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # An error message indicating that organization conformance pack creation or deletion failed due to an
        # error.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The timestamp of the last update.
        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        def initialize(
          @organization_conformance_pack_name : String,
          @status : String,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @last_update_time : Time? = nil
        )
        end
      end

      # You have specified a template that is not valid or supported.
      struct OrganizationConformancePackTemplateValidationException
        include JSON::Serializable

        def initialize
        end
      end

      # An object that specifies metadata for your organization's Config Custom Policy rule. The metadata
      # includes the runtime system in use, which accounts have debug logging enabled, and other custom rule
      # metadata, such as resource type, resource ID of Amazon Web Services resource, and organization
      # trigger types that initiate Config to evaluate Amazon Web Services resources against a rule.
      struct OrganizationCustomPolicyRuleMetadata
        include JSON::Serializable

        # The runtime system for your organization Config Custom Policy rules. Guard is a policy-as-code
        # language that allows you to write policies that are enforced by Config Custom Policy rules. For more
        # information about Guard, see the Guard GitHub Repository .
        @[JSON::Field(key: "PolicyRuntime")]
        getter policy_runtime : String

        # The policy definition containing the logic for your organization Config Custom Policy rule.
        @[JSON::Field(key: "PolicyText")]
        getter policy_text : String

        # A list of accounts that you can enable debug logging for your organization Config Custom Policy
        # rule. List is null when debug logging is enabled for all accounts.
        @[JSON::Field(key: "DebugLogDeliveryAccounts")]
        getter debug_log_delivery_accounts : Array(String)?

        # The description that you provide for your organization Config Custom Policy rule.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A string, in JSON format, that is passed to your organization Config Custom Policy rule.
        @[JSON::Field(key: "InputParameters")]
        getter input_parameters : String?

        # The maximum frequency with which Config runs evaluations for a rule. Your Config Custom Policy rule
        # is triggered when Config delivers the configuration snapshot. For more information, see
        # ConfigSnapshotDeliveryProperties .
        @[JSON::Field(key: "MaximumExecutionFrequency")]
        getter maximum_execution_frequency : String?

        # The type of notification that initiates Config to run an evaluation for a rule. For Config Custom
        # Policy rules, Config supports change-initiated notification types:
        # ConfigurationItemChangeNotification - Initiates an evaluation when Config delivers a configuration
        # item as a result of a resource change. OversizedConfigurationItemChangeNotification - Initiates an
        # evaluation when Config delivers an oversized configuration item. Config may generate this
        # notification type when a resource changes and the notification exceeds the maximum size allowed by
        # Amazon SNS.
        @[JSON::Field(key: "OrganizationConfigRuleTriggerTypes")]
        getter organization_config_rule_trigger_types : Array(String)?

        # The ID of the Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ResourceIdScope")]
        getter resource_id_scope : String?

        # The type of the Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ResourceTypesScope")]
        getter resource_types_scope : Array(String)?

        # One part of a key-value pair that make up a tag. A key is a general label that acts like a category
        # for more specific tag values.
        @[JSON::Field(key: "TagKeyScope")]
        getter tag_key_scope : String?

        # The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag
        # category (key).
        @[JSON::Field(key: "TagValueScope")]
        getter tag_value_scope : String?

        def initialize(
          @policy_runtime : String,
          @policy_text : String,
          @debug_log_delivery_accounts : Array(String)? = nil,
          @description : String? = nil,
          @input_parameters : String? = nil,
          @maximum_execution_frequency : String? = nil,
          @organization_config_rule_trigger_types : Array(String)? = nil,
          @resource_id_scope : String? = nil,
          @resource_types_scope : Array(String)? = nil,
          @tag_key_scope : String? = nil,
          @tag_value_scope : String? = nil
        )
        end
      end

      # metadata for your organization Config Custom Policy rule including the runtime system in use, which
      # accounts have debug logging enabled, and other custom rule metadata such as resource type, resource
      # ID of Amazon Web Services resource, and organization trigger types that trigger Config to evaluate
      # Amazon Web Services resources against a rule.
      struct OrganizationCustomPolicyRuleMetadataNoPolicy
        include JSON::Serializable

        # A list of accounts that you can enable debug logging for your organization Config Custom Policy
        # rule. List is null when debug logging is enabled for all accounts.
        @[JSON::Field(key: "DebugLogDeliveryAccounts")]
        getter debug_log_delivery_accounts : Array(String)?

        # The description that you provide for your organization Config Custom Policy rule.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A string, in JSON format, that is passed to your organization Config Custom Policy rule.
        @[JSON::Field(key: "InputParameters")]
        getter input_parameters : String?

        # The maximum frequency with which Config runs evaluations for a rule. Your Config Custom Policy rule
        # is triggered when Config delivers the configuration snapshot. For more information, see
        # ConfigSnapshotDeliveryProperties .
        @[JSON::Field(key: "MaximumExecutionFrequency")]
        getter maximum_execution_frequency : String?

        # The type of notification that triggers Config to run an evaluation for a rule. For Config Custom
        # Policy rules, Config supports change triggered notification types:
        # ConfigurationItemChangeNotification - Triggers an evaluation when Config delivers a configuration
        # item as a result of a resource change. OversizedConfigurationItemChangeNotification - Triggers an
        # evaluation when Config delivers an oversized configuration item. Config may generate this
        # notification type when a resource changes and the notification exceeds the maximum size allowed by
        # Amazon SNS.
        @[JSON::Field(key: "OrganizationConfigRuleTriggerTypes")]
        getter organization_config_rule_trigger_types : Array(String)?

        # The runtime system for your organization Config Custom Policy rules. Guard is a policy-as-code
        # language that allows you to write policies that are enforced by Config Custom Policy rules. For more
        # information about Guard, see the Guard GitHub Repository .
        @[JSON::Field(key: "PolicyRuntime")]
        getter policy_runtime : String?

        # The ID of the Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ResourceIdScope")]
        getter resource_id_scope : String?

        # The type of the Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ResourceTypesScope")]
        getter resource_types_scope : Array(String)?

        # One part of a key-value pair that make up a tag. A key is a general label that acts like a category
        # for more specific tag values.
        @[JSON::Field(key: "TagKeyScope")]
        getter tag_key_scope : String?

        # The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag
        # category (key).
        @[JSON::Field(key: "TagValueScope")]
        getter tag_value_scope : String?

        def initialize(
          @debug_log_delivery_accounts : Array(String)? = nil,
          @description : String? = nil,
          @input_parameters : String? = nil,
          @maximum_execution_frequency : String? = nil,
          @organization_config_rule_trigger_types : Array(String)? = nil,
          @policy_runtime : String? = nil,
          @resource_id_scope : String? = nil,
          @resource_types_scope : Array(String)? = nil,
          @tag_key_scope : String? = nil,
          @tag_value_scope : String? = nil
        )
        end
      end

      # An object that specifies organization custom rule metadata such as resource type, resource ID of
      # Amazon Web Services resource, Lambda function ARN, and organization trigger types that trigger
      # Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency
      # with which you want Config to run evaluations for the rule if the trigger type is periodic.
      struct OrganizationCustomRuleMetadata
        include JSON::Serializable

        # The lambda function ARN.
        @[JSON::Field(key: "LambdaFunctionArn")]
        getter lambda_function_arn : String

        # The type of notification that triggers Config to run an evaluation for a rule. You can specify the
        # following notification types: ConfigurationItemChangeNotification - Triggers an evaluation when
        # Config delivers a configuration item as a result of a resource change.
        # OversizedConfigurationItemChangeNotification - Triggers an evaluation when Config delivers an
        # oversized configuration item. Config may generate this notification type when a resource changes and
        # the notification exceeds the maximum size allowed by Amazon SNS. ScheduledNotification - Triggers a
        # periodic evaluation at the frequency specified for MaximumExecutionFrequency .
        @[JSON::Field(key: "OrganizationConfigRuleTriggerTypes")]
        getter organization_config_rule_trigger_types : Array(String)

        # The description that you provide for your organization Config rule.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A string, in JSON format, that is passed to your organization Config rule Lambda function.
        @[JSON::Field(key: "InputParameters")]
        getter input_parameters : String?

        # The maximum frequency with which Config runs evaluations for a rule. Your custom rule is triggered
        # when Config delivers the configuration snapshot. For more information, see
        # ConfigSnapshotDeliveryProperties . By default, rules with a periodic trigger are evaluated every 24
        # hours. To change the frequency, specify a valid value for the MaximumExecutionFrequency parameter.
        @[JSON::Field(key: "MaximumExecutionFrequency")]
        getter maximum_execution_frequency : String?

        # The ID of the Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ResourceIdScope")]
        getter resource_id_scope : String?

        # The type of the Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ResourceTypesScope")]
        getter resource_types_scope : Array(String)?

        # One part of a key-value pair that make up a tag. A key is a general label that acts like a category
        # for more specific tag values.
        @[JSON::Field(key: "TagKeyScope")]
        getter tag_key_scope : String?

        # The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag
        # category (key).
        @[JSON::Field(key: "TagValueScope")]
        getter tag_value_scope : String?

        def initialize(
          @lambda_function_arn : String,
          @organization_config_rule_trigger_types : Array(String),
          @description : String? = nil,
          @input_parameters : String? = nil,
          @maximum_execution_frequency : String? = nil,
          @resource_id_scope : String? = nil,
          @resource_types_scope : Array(String)? = nil,
          @tag_key_scope : String? = nil,
          @tag_value_scope : String? = nil
        )
        end
      end

      # An object that specifies organization managed rule metadata such as resource type and ID of Amazon
      # Web Services resource along with the rule identifier. It also provides the frequency with which you
      # want Config to run evaluations for the rule if the trigger type is periodic.
      struct OrganizationManagedRuleMetadata
        include JSON::Serializable

        # For organization config managed rules, a predefined identifier from a list. For example,
        # IAM_PASSWORD_POLICY is a managed rule. To reference a managed rule, see Using Config managed rules .
        @[JSON::Field(key: "RuleIdentifier")]
        getter rule_identifier : String

        # The description that you provide for your organization Config rule.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A string, in JSON format, that is passed to your organization Config rule Lambda function.
        @[JSON::Field(key: "InputParameters")]
        getter input_parameters : String?

        # The maximum frequency with which Config runs evaluations for a rule. This is for an Config managed
        # rule that is triggered at a periodic frequency. By default, rules with a periodic trigger are
        # evaluated every 24 hours. To change the frequency, specify a valid value for the
        # MaximumExecutionFrequency parameter.
        @[JSON::Field(key: "MaximumExecutionFrequency")]
        getter maximum_execution_frequency : String?

        # The ID of the Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ResourceIdScope")]
        getter resource_id_scope : String?

        # The type of the Amazon Web Services resource that was evaluated.
        @[JSON::Field(key: "ResourceTypesScope")]
        getter resource_types_scope : Array(String)?

        # One part of a key-value pair that make up a tag. A key is a general label that acts like a category
        # for more specific tag values.
        @[JSON::Field(key: "TagKeyScope")]
        getter tag_key_scope : String?

        # The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag
        # category (key).
        @[JSON::Field(key: "TagValueScope")]
        getter tag_value_scope : String?

        def initialize(
          @rule_identifier : String,
          @description : String? = nil,
          @input_parameters : String? = nil,
          @maximum_execution_frequency : String? = nil,
          @resource_id_scope : String? = nil,
          @resource_types_scope : Array(String)? = nil,
          @tag_key_scope : String? = nil,
          @tag_value_scope : String? = nil
        )
        end
      end

      # Status filter object to filter results based on specific member account ID or status type for an
      # organization conformance pack.
      struct OrganizationResourceDetailedStatusFilters
        include JSON::Serializable

        # The 12-digit account ID of the member account within an organization.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Indicates deployment status for conformance pack in a member account. When management account calls
        # PutOrganizationConformancePack action for the first time, conformance pack status is created in the
        # member account. When management account calls PutOrganizationConformancePack action for the second
        # time, conformance pack status is updated in the member account. Conformance pack status is deleted
        # when the management account deletes OrganizationConformancePack and disables service access for
        # config-multiaccountsetup.amazonaws.com . Config sets the state of the conformance pack to:
        # CREATE_SUCCESSFUL when conformance pack has been created in the member account. CREATE_IN_PROGRESS
        # when conformance pack is being created in the member account. CREATE_FAILED when conformance pack
        # creation has failed in the member account. DELETE_FAILED when conformance pack deletion has failed
        # in the member account. DELETE_IN_PROGRESS when conformance pack is being deleted in the member
        # account. DELETE_SUCCESSFUL when conformance pack has been deleted in the member account.
        # UPDATE_SUCCESSFUL when conformance pack has been updated in the member account. UPDATE_IN_PROGRESS
        # when conformance pack is being updated in the member account. UPDATE_FAILED when conformance pack
        # deletion has failed in the member account.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @account_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The configuration item size is outside the allowable range.
      struct OversizedConfigurationItemException
        include JSON::Serializable

        def initialize
        end
      end

      # An object that represents the account ID and region of an aggregator account that is requesting
      # authorization but is not yet authorized.
      struct PendingAggregationRequest
        include JSON::Serializable

        # The 12-digit account ID of the account requesting to aggregate data.
        @[JSON::Field(key: "RequesterAccountId")]
        getter requester_account_id : String?

        # The region requesting to aggregate data.
        @[JSON::Field(key: "RequesterAwsRegion")]
        getter requester_aws_region : String?

        def initialize(
          @requester_account_id : String? = nil,
          @requester_aws_region : String? = nil
        )
        end
      end

      struct PutAggregationAuthorizationRequest
        include JSON::Serializable

        # The 12-digit account ID of the account authorized to aggregate data.
        @[JSON::Field(key: "AuthorizedAccountId")]
        getter authorized_account_id : String

        # The region authorized to collect aggregated data.
        @[JSON::Field(key: "AuthorizedAwsRegion")]
        getter authorized_aws_region : String

        # An array of tag object.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @authorized_account_id : String,
          @authorized_aws_region : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutAggregationAuthorizationResponse
        include JSON::Serializable

        # Returns an AggregationAuthorization object.
        @[JSON::Field(key: "AggregationAuthorization")]
        getter aggregation_authorization : Types::AggregationAuthorization?

        def initialize(
          @aggregation_authorization : Types::AggregationAuthorization? = nil
        )
        end
      end

      struct PutConfigRuleRequest
        include JSON::Serializable

        # The rule that you want to add to your account.
        @[JSON::Field(key: "ConfigRule")]
        getter config_rule : Types::ConfigRule

        # An array of tag object.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @config_rule : Types::ConfigRule,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutConfigurationAggregatorRequest
        include JSON::Serializable

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        # A list of AccountAggregationSource object.
        @[JSON::Field(key: "AccountAggregationSources")]
        getter account_aggregation_sources : Array(Types::AccountAggregationSource)?

        # An object to filter configuration recorders in an aggregator. Either ResourceType or
        # ServicePrincipal is required.
        @[JSON::Field(key: "AggregatorFilters")]
        getter aggregator_filters : Types::AggregatorFilters?

        # An OrganizationAggregationSource object.
        @[JSON::Field(key: "OrganizationAggregationSource")]
        getter organization_aggregation_source : Types::OrganizationAggregationSource?

        # An array of tag object.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @configuration_aggregator_name : String,
          @account_aggregation_sources : Array(Types::AccountAggregationSource)? = nil,
          @aggregator_filters : Types::AggregatorFilters? = nil,
          @organization_aggregation_source : Types::OrganizationAggregationSource? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutConfigurationAggregatorResponse
        include JSON::Serializable

        # Returns a ConfigurationAggregator object.
        @[JSON::Field(key: "ConfigurationAggregator")]
        getter configuration_aggregator : Types::ConfigurationAggregator?

        def initialize(
          @configuration_aggregator : Types::ConfigurationAggregator? = nil
        )
        end
      end

      # The input for the PutConfigurationRecorder action.
      struct PutConfigurationRecorderRequest
        include JSON::Serializable

        # An object for the configuration recorder. A configuration recorder records configuration changes for
        # the resource types in scope.
        @[JSON::Field(key: "ConfigurationRecorder")]
        getter configuration_recorder : Types::ConfigurationRecorder

        # The tags for the customer managed configuration recorder. Each tag consists of a key and an optional
        # value, both of which you define.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @configuration_recorder : Types::ConfigurationRecorder,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutConformancePackRequest
        include JSON::Serializable

        # The unique name of the conformance pack you want to deploy.
        @[JSON::Field(key: "ConformancePackName")]
        getter conformance_pack_name : String

        # A list of ConformancePackInputParameter objects.
        @[JSON::Field(key: "ConformancePackInputParameters")]
        getter conformance_pack_input_parameters : Array(Types::ConformancePackInputParameter)?

        # The name of the Amazon S3 bucket where Config stores conformance pack templates. This field is
        # optional.
        @[JSON::Field(key: "DeliveryS3Bucket")]
        getter delivery_s3_bucket : String?

        # The prefix for the Amazon S3 bucket. This field is optional.
        @[JSON::Field(key: "DeliveryS3KeyPrefix")]
        getter delivery_s3_key_prefix : String?

        # A string that contains the full conformance pack template body. The structure containing the
        # template body has a minimum length of 1 byte and a maximum length of 51,200 bytes. You can use a
        # YAML template with two resource types: Config rule ( AWS::Config::ConfigRule ) and remediation
        # action ( AWS::Config::RemediationConfiguration ).
        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        # The location of the file containing the template body ( s3://bucketname/prefix ). The uri must point
        # to a conformance pack template (max size: 300 KB) that is located in an Amazon S3 bucket in the same
        # Region as the conformance pack. You must have access to read Amazon S3 bucket. In addition, in order
        # to ensure a successful deployment, the template object must not be in an archived storage class if
        # this parameter is passed.
        @[JSON::Field(key: "TemplateS3Uri")]
        getter template_s3_uri : String?

        # An object of type TemplateSSMDocumentDetails , which contains the name or the Amazon Resource Name
        # (ARN) of the Amazon Web Services Systems Manager document (SSM document) and the version of the SSM
        # document that is used to create a conformance pack.
        @[JSON::Field(key: "TemplateSSMDocumentDetails")]
        getter template_ssm_document_details : Types::TemplateSSMDocumentDetails?

        def initialize(
          @conformance_pack_name : String,
          @conformance_pack_input_parameters : Array(Types::ConformancePackInputParameter)? = nil,
          @delivery_s3_bucket : String? = nil,
          @delivery_s3_key_prefix : String? = nil,
          @template_body : String? = nil,
          @template_s3_uri : String? = nil,
          @template_ssm_document_details : Types::TemplateSSMDocumentDetails? = nil
        )
        end
      end

      struct PutConformancePackResponse
        include JSON::Serializable

        # ARN of the conformance pack.
        @[JSON::Field(key: "ConformancePackArn")]
        getter conformance_pack_arn : String?

        def initialize(
          @conformance_pack_arn : String? = nil
        )
        end
      end

      # The input for the PutDeliveryChannel action.
      struct PutDeliveryChannelRequest
        include JSON::Serializable

        # An object for the delivery channel. A delivery channel sends notifications and updated configuration
        # states.
        @[JSON::Field(key: "DeliveryChannel")]
        getter delivery_channel : Types::DeliveryChannel

        def initialize(
          @delivery_channel : Types::DeliveryChannel
        )
        end
      end

      struct PutEvaluationsRequest
        include JSON::Serializable

        # An encrypted token that associates an evaluation with an Config rule. Identifies the rule and the
        # event that triggered the evaluation.
        @[JSON::Field(key: "ResultToken")]
        getter result_token : String

        # The assessments that the Lambda function performs. Each evaluation identifies an Amazon Web Services
        # resource and indicates whether it complies with the Config rule that invokes the Lambda function.
        @[JSON::Field(key: "Evaluations")]
        getter evaluations : Array(Types::Evaluation)?

        # Use this parameter to specify a test run for PutEvaluations . You can verify whether your Lambda
        # function will deliver evaluation results to Config. No updates occur to your existing evaluations,
        # and evaluation results are not sent to Config. When TestMode is true , PutEvaluations doesn't
        # require a valid value for the ResultToken parameter, but the value cannot be null.
        @[JSON::Field(key: "TestMode")]
        getter test_mode : Bool?

        def initialize(
          @result_token : String,
          @evaluations : Array(Types::Evaluation)? = nil,
          @test_mode : Bool? = nil
        )
        end
      end

      struct PutEvaluationsResponse
        include JSON::Serializable

        # Requests that failed because of a client or server error.
        @[JSON::Field(key: "FailedEvaluations")]
        getter failed_evaluations : Array(Types::Evaluation)?

        def initialize(
          @failed_evaluations : Array(Types::Evaluation)? = nil
        )
        end
      end

      struct PutExternalEvaluationRequest
        include JSON::Serializable

        # The name of the Config rule.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        # An ExternalEvaluation object that provides details about compliance.
        @[JSON::Field(key: "ExternalEvaluation")]
        getter external_evaluation : Types::ExternalEvaluation

        def initialize(
          @config_rule_name : String,
          @external_evaluation : Types::ExternalEvaluation
        )
        end
      end

      struct PutExternalEvaluationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct PutOrganizationConfigRuleRequest
        include JSON::Serializable

        # The name that you assign to an organization Config rule.
        @[JSON::Field(key: "OrganizationConfigRuleName")]
        getter organization_config_rule_name : String

        # A comma-separated list of accounts that you want to exclude from an organization Config rule.
        @[JSON::Field(key: "ExcludedAccounts")]
        getter excluded_accounts : Array(String)?

        # An OrganizationCustomPolicyRuleMetadata object. This object specifies metadata for your
        # organization's Config Custom Policy rule. The metadata includes the runtime system in use, which
        # accounts have debug logging enabled, and other custom rule metadata, such as resource type, resource
        # ID of Amazon Web Services resource, and organization trigger types that initiate Config to evaluate
        # Amazon Web Services resources against a rule.
        @[JSON::Field(key: "OrganizationCustomPolicyRuleMetadata")]
        getter organization_custom_policy_rule_metadata : Types::OrganizationCustomPolicyRuleMetadata?

        # An OrganizationCustomRuleMetadata object. This object specifies organization custom rule metadata
        # such as resource type, resource ID of Amazon Web Services resource, Lambda function ARN, and
        # organization trigger types that trigger Config to evaluate your Amazon Web Services resources
        # against a rule. It also provides the frequency with which you want Config to run evaluations for the
        # rule if the trigger type is periodic.
        @[JSON::Field(key: "OrganizationCustomRuleMetadata")]
        getter organization_custom_rule_metadata : Types::OrganizationCustomRuleMetadata?

        # An OrganizationManagedRuleMetadata object. This object specifies organization managed rule metadata
        # such as resource type and ID of Amazon Web Services resource along with the rule identifier. It also
        # provides the frequency with which you want Config to run evaluations for the rule if the trigger
        # type is periodic.
        @[JSON::Field(key: "OrganizationManagedRuleMetadata")]
        getter organization_managed_rule_metadata : Types::OrganizationManagedRuleMetadata?

        def initialize(
          @organization_config_rule_name : String,
          @excluded_accounts : Array(String)? = nil,
          @organization_custom_policy_rule_metadata : Types::OrganizationCustomPolicyRuleMetadata? = nil,
          @organization_custom_rule_metadata : Types::OrganizationCustomRuleMetadata? = nil,
          @organization_managed_rule_metadata : Types::OrganizationManagedRuleMetadata? = nil
        )
        end
      end

      struct PutOrganizationConfigRuleResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an organization Config rule.
        @[JSON::Field(key: "OrganizationConfigRuleArn")]
        getter organization_config_rule_arn : String?

        def initialize(
          @organization_config_rule_arn : String? = nil
        )
        end
      end

      struct PutOrganizationConformancePackRequest
        include JSON::Serializable

        # Name of the organization conformance pack you want to create.
        @[JSON::Field(key: "OrganizationConformancePackName")]
        getter organization_conformance_pack_name : String

        # A list of ConformancePackInputParameter objects.
        @[JSON::Field(key: "ConformancePackInputParameters")]
        getter conformance_pack_input_parameters : Array(Types::ConformancePackInputParameter)?

        # The name of the Amazon S3 bucket where Config stores conformance pack templates. This field is
        # optional. If used, it must be prefixed with awsconfigconforms .
        @[JSON::Field(key: "DeliveryS3Bucket")]
        getter delivery_s3_bucket : String?

        # The prefix for the Amazon S3 bucket. This field is optional.
        @[JSON::Field(key: "DeliveryS3KeyPrefix")]
        getter delivery_s3_key_prefix : String?

        # A list of Amazon Web Services accounts to be excluded from an organization conformance pack while
        # deploying a conformance pack.
        @[JSON::Field(key: "ExcludedAccounts")]
        getter excluded_accounts : Array(String)?

        # A string that contains the full conformance pack template body. Structure containing the template
        # body with a minimum length of 1 byte and a maximum length of 51,200 bytes.
        @[JSON::Field(key: "TemplateBody")]
        getter template_body : String?

        # Location of file containing the template body. The uri must point to the conformance pack template
        # (max size: 300 KB). You must have access to read Amazon S3 bucket. In addition, in order to ensure a
        # successful deployment, the template object must not be in an archived storage class if this
        # parameter is passed.
        @[JSON::Field(key: "TemplateS3Uri")]
        getter template_s3_uri : String?

        def initialize(
          @organization_conformance_pack_name : String,
          @conformance_pack_input_parameters : Array(Types::ConformancePackInputParameter)? = nil,
          @delivery_s3_bucket : String? = nil,
          @delivery_s3_key_prefix : String? = nil,
          @excluded_accounts : Array(String)? = nil,
          @template_body : String? = nil,
          @template_s3_uri : String? = nil
        )
        end
      end

      struct PutOrganizationConformancePackResponse
        include JSON::Serializable

        # ARN of the organization conformance pack.
        @[JSON::Field(key: "OrganizationConformancePackArn")]
        getter organization_conformance_pack_arn : String?

        def initialize(
          @organization_conformance_pack_arn : String? = nil
        )
        end
      end

      struct PutRemediationConfigurationsRequest
        include JSON::Serializable

        # A list of remediation configuration objects.
        @[JSON::Field(key: "RemediationConfigurations")]
        getter remediation_configurations : Array(Types::RemediationConfiguration)

        def initialize(
          @remediation_configurations : Array(Types::RemediationConfiguration)
        )
        end
      end

      struct PutRemediationConfigurationsResponse
        include JSON::Serializable

        # Returns a list of failed remediation batch objects.
        @[JSON::Field(key: "FailedBatches")]
        getter failed_batches : Array(Types::FailedRemediationBatch)?

        def initialize(
          @failed_batches : Array(Types::FailedRemediationBatch)? = nil
        )
        end
      end

      struct PutRemediationExceptionsRequest
        include JSON::Serializable

        # The name of the Config rule for which you want to create remediation exception.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        # An exception list of resource exception keys to be processed with the current request. Config adds
        # exception for each resource key. For example, Config adds 3 exceptions for 3 resource keys.
        @[JSON::Field(key: "ResourceKeys")]
        getter resource_keys : Array(Types::RemediationExceptionResourceKey)

        # The exception is automatically deleted after the expiration date.
        @[JSON::Field(key: "ExpirationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_time : Time?

        # The message contains an explanation of the exception.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @config_rule_name : String,
          @resource_keys : Array(Types::RemediationExceptionResourceKey),
          @expiration_time : Time? = nil,
          @message : String? = nil
        )
        end
      end

      struct PutRemediationExceptionsResponse
        include JSON::Serializable

        # Returns a list of failed remediation exceptions batch objects. Each object in the batch consists of
        # a list of failed items and failure messages.
        @[JSON::Field(key: "FailedBatches")]
        getter failed_batches : Array(Types::FailedRemediationExceptionBatch)?

        def initialize(
          @failed_batches : Array(Types::FailedRemediationExceptionBatch)? = nil
        )
        end
      end

      struct PutResourceConfigRequest
        include JSON::Serializable

        # The configuration object of the resource in valid JSON format. It must match the schema registered
        # with CloudFormation. The configuration JSON must not exceed 64 KB.
        @[JSON::Field(key: "Configuration")]
        getter configuration : String

        # Unique identifier of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the resource. The custom resource type must be registered with CloudFormation. You
        # cannot use the organization names “amzn”, “amazon”, “alexa”, “custom” with custom resource types. It
        # is the first part of the ResourceType up to the first ::.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Version of the schema registered for the ResourceType in CloudFormation.
        @[JSON::Field(key: "SchemaVersionId")]
        getter schema_version_id : String

        # Name of the resource.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # Tags associated with the resource. This field is not to be confused with the Amazon Web
        # Services-wide tag feature for Amazon Web Services resources. Tags for PutResourceConfig are tags
        # that you supply for the configuration items of your custom resources.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configuration : String,
          @resource_id : String,
          @resource_type : String,
          @schema_version_id : String,
          @resource_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct PutRetentionConfigurationRequest
        include JSON::Serializable

        # Number of days Config stores your historical information. Currently, only applicable to the
        # configuration item history.
        @[JSON::Field(key: "RetentionPeriodInDays")]
        getter retention_period_in_days : Int32

        def initialize(
          @retention_period_in_days : Int32
        )
        end
      end

      struct PutRetentionConfigurationResponse
        include JSON::Serializable

        # Returns a retention configuration object.
        @[JSON::Field(key: "RetentionConfiguration")]
        getter retention_configuration : Types::RetentionConfiguration?

        def initialize(
          @retention_configuration : Types::RetentionConfiguration? = nil
        )
        end
      end

      struct PutServiceLinkedConfigurationRecorderRequest
        include JSON::Serializable

        # The service principal of the Amazon Web Services service for the service-linked configuration
        # recorder that you want to create.
        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String

        # The tags for a service-linked configuration recorder. Each tag consists of a key and an optional
        # value, both of which you define.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @service_principal : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutServiceLinkedConfigurationRecorderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the specified configuration recorder.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the specified configuration recorder. For service-linked configuration recorders, Config
        # automatically assigns a name that has the prefix " AWSConfigurationRecorderFor " to the new
        # service-linked configuration recorder.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct PutStoredQueryRequest
        include JSON::Serializable

        # A list of StoredQuery objects. The mandatory fields are QueryName and Expression . When you are
        # creating a query, you must provide a query name and an expression. When you are updating a query,
        # you must provide a query name but updating the description is optional.
        @[JSON::Field(key: "StoredQuery")]
        getter stored_query : Types::StoredQuery

        # A list of Tags object.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @stored_query : Types::StoredQuery,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutStoredQueryResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the query. For example,
        # arn:partition:service:region:account-id:resource-type/resource-name/resource-id.
        @[JSON::Field(key: "QueryArn")]
        getter query_arn : String?

        def initialize(
          @query_arn : String? = nil
        )
        end
      end

      # Details about the query.
      struct QueryInfo
        include JSON::Serializable

        # Returns a FieldInfo object.
        @[JSON::Field(key: "SelectFields")]
        getter select_fields : Array(Types::FieldInfo)?

        def initialize(
          @select_fields : Array(Types::FieldInfo)? = nil
        )
        end
      end

      # Specifies which resource types Config records for configuration changes. By default, Config records
      # configuration changes for all current and future supported resource types in the Amazon Web Services
      # Region where you have enabled Config, excluding the global IAM resource types: IAM users, groups,
      # roles, and customer managed policies. In the recording group, you specify whether you want to record
      # all supported current and future supported resource types or to include or exclude specific
      # resources types. For a list of supported resource types, see Supported Resource Types in the Config
      # developer guide . If you don't want Config to record all current and future supported resource types
      # (excluding the global IAM resource types), use one of the following recording strategies: Record all
      # current and future resource types with exclusions ( EXCLUSION_BY_RESOURCE_TYPES ), or Record
      # specific resource types ( INCLUSION_BY_RESOURCE_TYPES ). If you use the recording strategy to Record
      # all current and future resource types ( ALL_SUPPORTED_RESOURCE_TYPES ), you can use the flag
      # includeGlobalResourceTypes to include the global IAM resource types in your recording. Aurora global
      # clusters are recorded in all enabled Regions The AWS::RDS::GlobalCluster resource type will be
      # recorded in all supported Config Regions where the configuration recorder is enabled. If you do not
      # want to record AWS::RDS::GlobalCluster in all enabled Regions, use the EXCLUSION_BY_RESOURCE_TYPES
      # or INCLUSION_BY_RESOURCE_TYPES recording strategy.
      struct RecordingGroup
        include JSON::Serializable

        # Specifies whether Config records configuration changes for all supported resource types, excluding
        # the global IAM resource types. If you set this field to true , when Config adds support for a new
        # resource type, Config starts recording resources of that type automatically. If you set this field
        # to true , you cannot enumerate specific resource types to record in the resourceTypes field of
        # RecordingGroup , or to exclude in the resourceTypes field of ExclusionByResourceTypes . Region
        # availability Check Resource Coverage by Region Availability to see if a resource type is supported
        # in the Amazon Web Services Region where you set up Config.
        @[JSON::Field(key: "allSupported")]
        getter all_supported : Bool?

        # An object that specifies how Config excludes resource types from being recorded by the configuration
        # recorder. Required fields To use this option, you must set the useOnly field of RecordingStrategy to
        # EXCLUSION_BY_RESOURCE_TYPES .
        @[JSON::Field(key: "exclusionByResourceTypes")]
        getter exclusion_by_resource_types : Types::ExclusionByResourceTypes?

        # This option is a bundle which only applies to the global IAM resource types: IAM users, groups,
        # roles, and customer managed policies. These global IAM resource types can only be recorded by Config
        # in Regions where Config was available before February 2022. You cannot be record the global IAM
        # resouce types in Regions supported by Config after February 2022. For a list of those Regions, see
        # Recording Amazon Web Services Resources | Global Resources . Aurora global clusters are recorded in
        # all enabled Regions The AWS::RDS::GlobalCluster resource type will be recorded in all supported
        # Config Regions where the configuration recorder is enabled, even if includeGlobalResourceTypes is
        # set false . The includeGlobalResourceTypes option is a bundle which only applies to IAM users,
        # groups, roles, and customer managed policies. If you do not want to record AWS::RDS::GlobalCluster
        # in all enabled Regions, use one of the following recording strategies: Record all current and future
        # resource types with exclusions ( EXCLUSION_BY_RESOURCE_TYPES ), or Record specific resource types (
        # INCLUSION_BY_RESOURCE_TYPES ). For more information, see Selecting Which Resources are Recorded in
        # the Config developer guide . includeGlobalResourceTypes and the exclusion recording strategy The
        # includeGlobalResourceTypes field has no impact on the EXCLUSION_BY_RESOURCE_TYPES recording
        # strategy. This means that the global IAM resource types (IAM users, groups, roles, and customer
        # managed policies) will not be automatically added as exclusions for exclusionByResourceTypes when
        # includeGlobalResourceTypes is set to false . The includeGlobalResourceTypes field should only be
        # used to modify the AllSupported field, as the default for the AllSupported field is to record
        # configuration changes for all supported resource types excluding the global IAM resource types. To
        # include the global IAM resource types when AllSupported is set to true , make sure to set
        # includeGlobalResourceTypes to true . To exclude the global IAM resource types for the
        # EXCLUSION_BY_RESOURCE_TYPES recording strategy, you need to manually add them to the resourceTypes
        # field of exclusionByResourceTypes . Required and optional fields Before you set this field to true ,
        # set the allSupported field of RecordingGroup to true . Optionally, you can set the useOnly field of
        # RecordingStrategy to ALL_SUPPORTED_RESOURCE_TYPES . Overriding fields If you set this field to false
        # but list global IAM resource types in the resourceTypes field of RecordingGroup , Config will still
        # record configuration changes for those specified resource types regardless of if you set the
        # includeGlobalResourceTypes field to false. If you do not want to record configuration changes to the
        # global IAM resource types (IAM users, groups, roles, and customer managed policies), make sure to
        # not list them in the resourceTypes field in addition to setting the includeGlobalResourceTypes field
        # to false.
        @[JSON::Field(key: "includeGlobalResourceTypes")]
        getter include_global_resource_types : Bool?

        # An object that specifies the recording strategy for the configuration recorder. If you set the
        # useOnly field of RecordingStrategy to ALL_SUPPORTED_RESOURCE_TYPES , Config records configuration
        # changes for all supported resource types, excluding the global IAM resource types. You also must set
        # the allSupported field of RecordingGroup to true . When Config adds support for a new resource type,
        # Config automatically starts recording resources of that type. If you set the useOnly field of
        # RecordingStrategy to INCLUSION_BY_RESOURCE_TYPES , Config records configuration changes for only the
        # resource types you specify in the resourceTypes field of RecordingGroup . If you set the useOnly
        # field of RecordingStrategy to EXCLUSION_BY_RESOURCE_TYPES , Config records configuration changes for
        # all supported resource types except the resource types that you specify to exclude from being
        # recorded in the resourceTypes field of ExclusionByResourceTypes . Required and optional fields The
        # recordingStrategy field is optional when you set the allSupported field of RecordingGroup to true .
        # The recordingStrategy field is optional when you list resource types in the resourceTypes field of
        # RecordingGroup . The recordingStrategy field is required if you list resource types to exclude from
        # recording in the resourceTypes field of ExclusionByResourceTypes . Overriding fields If you choose
        # EXCLUSION_BY_RESOURCE_TYPES for the recording strategy, the exclusionByResourceTypes field will
        # override other properties in the request. For example, even if you set includeGlobalResourceTypes to
        # false, global IAM resource types will still be automatically recorded in this option unless those
        # resource types are specifically listed as exclusions in the resourceTypes field of
        # exclusionByResourceTypes . Global resources types and the resource exclusion recording strategy By
        # default, if you choose the EXCLUSION_BY_RESOURCE_TYPES recording strategy, when Config adds support
        # for a new resource type in the Region where you set up the configuration recorder, including global
        # resource types, Config starts recording resources of that type automatically. Unless specifically
        # listed as exclusions, AWS::RDS::GlobalCluster will be recorded automatically in all supported Config
        # Regions were the configuration recorder is enabled. IAM users, groups, roles, and customer managed
        # policies will be recorded in the Region where you set up the configuration recorder if that is a
        # Region where Config was available before February 2022. You cannot be record the global IAM resouce
        # types in Regions supported by Config after February 2022. For a list of those Regions, see Recording
        # Amazon Web Services Resources | Global Resources .
        @[JSON::Field(key: "recordingStrategy")]
        getter recording_strategy : Types::RecordingStrategy?

        # A comma-separated list that specifies which resource types Config records. For a list of valid
        # resourceTypes values, see the Resource Type Value column in Supported Amazon Web Services resource
        # Types in the Config developer guide . Required and optional fields Optionally, you can set the
        # useOnly field of RecordingStrategy to INCLUSION_BY_RESOURCE_TYPES . To record all configuration
        # changes, set the allSupported field of RecordingGroup to true , and either omit this field or don't
        # specify any resource types in this field. If you set the allSupported field to false and specify
        # values for resourceTypes , when Config adds support for a new type of resource, it will not record
        # resources of that type unless you manually add that type to your recording group. Region
        # availability Before specifying a resource type for Config to track, check Resource Coverage by
        # Region Availability to see if the resource type is supported in the Amazon Web Services Region where
        # you set up Config. If a resource type is supported by Config in at least one Region, you can enable
        # the recording of that resource type in all Regions supported by Config, even if the specified
        # resource type is not supported in the Amazon Web Services Region where you set up Config.
        @[JSON::Field(key: "resourceTypes")]
        getter resource_types : Array(String)?

        def initialize(
          @all_supported : Bool? = nil,
          @exclusion_by_resource_types : Types::ExclusionByResourceTypes? = nil,
          @include_global_resource_types : Bool? = nil,
          @recording_strategy : Types::RecordingStrategy? = nil,
          @resource_types : Array(String)? = nil
        )
        end
      end

      # Specifies the default recording frequency that Config uses to record configuration changes. Config
      # supports Continuous recording and Daily recording . Continuous recording allows you to record
      # configuration changes continuously whenever a change occurs. Daily recording allows you to receive a
      # configuration item (CI) representing the most recent state of your resources over the last 24-hour
      # period, only if it’s different from the previous CI recorded. Firewall Manager depends on continuous
      # recording to monitor your resources. If you are using Firewall Manager, it is recommended that you
      # set the recording frequency to Continuous. You can also override the recording frequency for
      # specific resource types.
      struct RecordingMode
        include JSON::Serializable

        # The default recording frequency that Config uses to record configuration changes. Daily recording
        # cannot be specified for the following resource types: AWS::Config::ResourceCompliance
        # AWS::Config::ConformancePackCompliance AWS::Config::ConfigurationRecorder For the allSupported (
        # ALL_SUPPORTED_RESOURCE_TYPES ) recording strategy, these resource types will be set to Continuous
        # recording.
        @[JSON::Field(key: "recordingFrequency")]
        getter recording_frequency : String

        # An array of recordingModeOverride objects for you to specify your overrides for the recording mode.
        # The recordingModeOverride object in the recordingModeOverrides array consists of three fields: a
        # description , the new recordingFrequency , and an array of resourceTypes to override.
        @[JSON::Field(key: "recordingModeOverrides")]
        getter recording_mode_overrides : Array(Types::RecordingModeOverride)?

        def initialize(
          @recording_frequency : String,
          @recording_mode_overrides : Array(Types::RecordingModeOverride)? = nil
        )
        end
      end

      # An object for you to specify your overrides for the recording mode.
      struct RecordingModeOverride
        include JSON::Serializable

        # The recording frequency that will be applied to all the resource types specified in the override.
        # Continuous recording allows you to record configuration changes continuously whenever a change
        # occurs. Daily recording allows you to receive a configuration item (CI) representing the most recent
        # state of your resources over the last 24-hour period, only if it’s different from the previous CI
        # recorded. Firewall Manager depends on continuous recording to monitor your resources. If you are
        # using Firewall Manager, it is recommended that you set the recording frequency to Continuous.
        @[JSON::Field(key: "recordingFrequency")]
        getter recording_frequency : String

        # A comma-separated list that specifies which resource types Config includes in the override. Daily
        # recording cannot be specified for the following resource types: AWS::Config::ResourceCompliance
        # AWS::Config::ConformancePackCompliance AWS::Config::ConfigurationRecorder
        @[JSON::Field(key: "resourceTypes")]
        getter resource_types : Array(String)

        # A description that you provide for the override.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @recording_frequency : String,
          @resource_types : Array(String),
          @description : String? = nil
        )
        end
      end

      # Specifies the recording strategy of the configuration recorder.
      struct RecordingStrategy
        include JSON::Serializable

        # The recording strategy for the configuration recorder. If you set this option to
        # ALL_SUPPORTED_RESOURCE_TYPES , Config records configuration changes for all supported resource
        # types, excluding the global IAM resource types. You also must set the allSupported field of
        # RecordingGroup to true . When Config adds support for a new resource type, Config automatically
        # starts recording resources of that type. For a list of supported resource types, see Supported
        # Resource Types in the Config developer guide . If you set this option to INCLUSION_BY_RESOURCE_TYPES
        # , Config records configuration changes for only the resource types that you specify in the
        # resourceTypes field of RecordingGroup . If you set this option to EXCLUSION_BY_RESOURCE_TYPES ,
        # Config records configuration changes for all supported resource types, except the resource types
        # that you specify to exclude from being recorded in the resourceTypes field of
        # ExclusionByResourceTypes . Required and optional fields The recordingStrategy field is optional when
        # you set the allSupported field of RecordingGroup to true . The recordingStrategy field is optional
        # when you list resource types in the resourceTypes field of RecordingGroup . The recordingStrategy
        # field is required if you list resource types to exclude from recording in the resourceTypes field of
        # ExclusionByResourceTypes . Overriding fields If you choose EXCLUSION_BY_RESOURCE_TYPES for the
        # recording strategy, the exclusionByResourceTypes field will override other properties in the
        # request. For example, even if you set includeGlobalResourceTypes to false, global IAM resource types
        # will still be automatically recorded in this option unless those resource types are specifically
        # listed as exclusions in the resourceTypes field of exclusionByResourceTypes . Global resource types
        # and the exclusion recording strategy By default, if you choose the EXCLUSION_BY_RESOURCE_TYPES
        # recording strategy, when Config adds support for a new resource type in the Region where you set up
        # the configuration recorder, including global resource types, Config starts recording resources of
        # that type automatically. Unless specifically listed as exclusions, AWS::RDS::GlobalCluster will be
        # recorded automatically in all supported Config Regions were the configuration recorder is enabled.
        # IAM users, groups, roles, and customer managed policies will be recorded in the Region where you set
        # up the configuration recorder if that is a Region where Config was available before February 2022.
        # You cannot be record the global IAM resouce types in Regions supported by Config after February
        # 2022. This list where you cannot record the global IAM resource types includes the following
        # Regions: Asia Pacific (Hyderabad) Asia Pacific (Melbourne) Canada West (Calgary) Europe (Spain)
        # Europe (Zurich) Israel (Tel Aviv) Middle East (UAE)
        @[JSON::Field(key: "useOnly")]
        getter use_only : String?

        def initialize(
          @use_only : String? = nil
        )
        end
      end

      # The relationship of the related resource to the main resource.
      struct Relationship
        include JSON::Serializable

        # The type of relationship with the related resource.
        @[JSON::Field(key: "relationshipName")]
        getter relationship_name : String?

        # The ID of the related resource (for example, sg-xxxxxx ).
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The custom name of the related resource, if available.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # The resource type of the related resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @relationship_name : String? = nil,
          @resource_id : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # An object that represents the details about the remediation configuration that includes the
      # remediation action, parameters, and data to execute the action.
      struct RemediationConfiguration
        include JSON::Serializable

        # The name of the Config rule.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        # Target ID is the name of the SSM document.
        @[JSON::Field(key: "TargetId")]
        getter target_id : String

        # The type of the target. Target executes remediation. For example, SSM document.
        @[JSON::Field(key: "TargetType")]
        getter target_type : String

        # Amazon Resource Name (ARN) of remediation configuration.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The remediation is triggered automatically.
        @[JSON::Field(key: "Automatic")]
        getter automatic : Bool?

        # Name of the service that owns the service-linked rule, if applicable.
        @[JSON::Field(key: "CreatedByService")]
        getter created_by_service : String?

        # An ExecutionControls object.
        @[JSON::Field(key: "ExecutionControls")]
        getter execution_controls : Types::ExecutionControls?

        # The maximum number of failed attempts for auto-remediation. If you do not select a number, the
        # default is 5. For example, if you specify MaximumAutomaticAttempts as 5 with RetryAttemptSeconds as
        # 50 seconds, Config will put a RemediationException on your behalf for the failing resource after the
        # 5th failed attempt within 50 seconds.
        @[JSON::Field(key: "MaximumAutomaticAttempts")]
        getter maximum_automatic_attempts : Int32?

        # An object of the RemediationParameterValue.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Types::RemediationParameterValue)?

        # The type of a resource.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # Time window to determine whether or not to add a remediation exception to prevent infinite
        # remediation attempts. If MaximumAutomaticAttempts remediation attempts have been made under
        # RetryAttemptSeconds , a remediation exception will be added to the resource. If you do not select a
        # number, the default is 60 seconds. For example, if you specify RetryAttemptSeconds as 50 seconds and
        # MaximumAutomaticAttempts as 5, Config will run auto-remediations 5 times within 50 seconds before
        # adding a remediation exception to the resource.
        @[JSON::Field(key: "RetryAttemptSeconds")]
        getter retry_attempt_seconds : Int64?

        # Version of the target. For example, version of the SSM document. If you make backward incompatible
        # changes to the SSM document, you must call PutRemediationConfiguration API again to ensure the
        # remediations can run.
        @[JSON::Field(key: "TargetVersion")]
        getter target_version : String?

        def initialize(
          @config_rule_name : String,
          @target_id : String,
          @target_type : String,
          @arn : String? = nil,
          @automatic : Bool? = nil,
          @created_by_service : String? = nil,
          @execution_controls : Types::ExecutionControls? = nil,
          @maximum_automatic_attempts : Int32? = nil,
          @parameters : Hash(String, Types::RemediationParameterValue)? = nil,
          @resource_type : String? = nil,
          @retry_attempt_seconds : Int64? = nil,
          @target_version : String? = nil
        )
        end
      end

      # An object that represents the details about the remediation exception. The details include the rule
      # name, an explanation of an exception, the time when the exception will be deleted, the resource ID,
      # and resource type.
      struct RemediationException
        include JSON::Serializable

        # The name of the Config rule.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        # The ID of the resource (for example., sg-xxxxxx).
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of a resource.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The time when the remediation exception will be deleted.
        @[JSON::Field(key: "ExpirationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_time : Time?

        # An explanation of an remediation exception.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @config_rule_name : String,
          @resource_id : String,
          @resource_type : String,
          @expiration_time : Time? = nil,
          @message : String? = nil
        )
        end
      end

      # The details that identify a resource within Config, including the resource type and resource ID.
      struct RemediationExceptionResourceKey
        include JSON::Serializable

        # The ID of the resource (for example., sg-xxxxxx).
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of a resource.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Provides details of the current status of the invoked remediation action for that resource.
      struct RemediationExecutionStatus
        include JSON::Serializable

        # Start time when the remediation was executed.
        @[JSON::Field(key: "InvocationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter invocation_time : Time?

        # The time when the remediation execution was last updated.
        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        @[JSON::Field(key: "ResourceKey")]
        getter resource_key : Types::ResourceKey?

        # ENUM of the values.
        @[JSON::Field(key: "State")]
        getter state : String?

        # Details of every step.
        @[JSON::Field(key: "StepDetails")]
        getter step_details : Array(Types::RemediationExecutionStep)?

        def initialize(
          @invocation_time : Time? = nil,
          @last_updated_time : Time? = nil,
          @resource_key : Types::ResourceKey? = nil,
          @state : String? = nil,
          @step_details : Array(Types::RemediationExecutionStep)? = nil
        )
        end
      end

      # Name of the step from the SSM document.
      struct RemediationExecutionStep
        include JSON::Serializable

        # An error message if the step was interrupted during execution.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The details of the step.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The time when the step started.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The valid status of the step.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The time when the step stopped.
        @[JSON::Field(key: "StopTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stop_time : Time?

        def initialize(
          @error_message : String? = nil,
          @name : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil,
          @stop_time : Time? = nil
        )
        end
      end

      # Remediation action is in progress. You can either cancel execution in Amazon Web Services Systems
      # Manager or wait and try again later.
      struct RemediationInProgressException
        include JSON::Serializable

        def initialize
        end
      end

      # The value is either a dynamic (resource) value or a static value. You must select either a dynamic
      # value or a static value.
      struct RemediationParameterValue
        include JSON::Serializable

        # The value is dynamic and changes at run-time.
        @[JSON::Field(key: "ResourceValue")]
        getter resource_value : Types::ResourceValue?

        # The value is static and does not change at run-time.
        @[JSON::Field(key: "StaticValue")]
        getter static_value : Types::StaticValue?

        def initialize(
          @resource_value : Types::ResourceValue? = nil,
          @static_value : Types::StaticValue? = nil
        )
        end
      end

      # Two users are trying to modify the same query at the same time. Wait for a moment and try again.
      struct ResourceConcurrentModificationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that contains the resource type and the number of resources.
      struct ResourceCount
        include JSON::Serializable

        # The number of resources.
        @[JSON::Field(key: "count")]
        getter count : Int64?

        # The resource type (for example, "AWS::EC2::Instance" ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @count : Int64? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Filters the resource count based on account ID, region, and resource type.
      struct ResourceCountFilters
        include JSON::Serializable

        # The 12-digit ID of the account.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The region where the account is located.
        @[JSON::Field(key: "Region")]
        getter region : String?

        # The type of the Amazon Web Services resource.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @account_id : String? = nil,
          @region : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Returns information about the resource being evaluated.
      struct ResourceDetails
        include JSON::Serializable

        # The resource definition to be evaluated as per the resource configuration schema type.
        @[JSON::Field(key: "ResourceConfiguration")]
        getter resource_configuration : String

        # A unique resource ID for an evaluation.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of resource being evaluated.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The schema type of the resource configuration. You can find the Resource type schema , or
        # CFN_RESOURCE_SCHEMA , in " Amazon Web Services public extensions " within the CloudFormation
        # registry or with the following CLI commmand: aws cloudformation describe-type --type-name
        # "AWS::S3::Bucket" --type RESOURCE . For more information, see Managing extensions through the
        # CloudFormation registry and Amazon Web Services resource and property types reference in the
        # CloudFormation User Guide.
        @[JSON::Field(key: "ResourceConfigurationSchemaType")]
        getter resource_configuration_schema_type : String?

        def initialize(
          @resource_configuration : String,
          @resource_id : String,
          @resource_type : String,
          @resource_configuration_schema_type : String? = nil
        )
        end
      end

      # Returns details of a resource evaluation.
      struct ResourceEvaluation
        include JSON::Serializable

        # The mode of an evaluation. The valid values are Detective or Proactive.
        @[JSON::Field(key: "EvaluationMode")]
        getter evaluation_mode : String?

        # The starting time of an execution.
        @[JSON::Field(key: "EvaluationStartTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter evaluation_start_timestamp : Time?

        # The ResourceEvaluationId of a evaluation.
        @[JSON::Field(key: "ResourceEvaluationId")]
        getter resource_evaluation_id : String?

        def initialize(
          @evaluation_mode : String? = nil,
          @evaluation_start_timestamp : Time? = nil,
          @resource_evaluation_id : String? = nil
        )
        end
      end

      # Returns details of a resource evaluation based on the selected filter.
      struct ResourceEvaluationFilters
        include JSON::Serializable

        # Filters evaluations for a given infrastructure deployment. For example: CFN Stack.
        @[JSON::Field(key: "EvaluationContextIdentifier")]
        getter evaluation_context_identifier : String?

        # Filters all resource evaluations results based on an evaluation mode. Currently, DECTECTIVE is not
        # supported as a valid value. Ignore other documentation stating otherwise.
        @[JSON::Field(key: "EvaluationMode")]
        getter evaluation_mode : String?

        # Returns a TimeWindow object.
        @[JSON::Field(key: "TimeWindow")]
        getter time_window : Types::TimeWindow?

        def initialize(
          @evaluation_context_identifier : String? = nil,
          @evaluation_mode : String? = nil,
          @time_window : Types::TimeWindow? = nil
        )
        end
      end

      # Filters the results by resource account ID, region, resource ID, and resource name.
      struct ResourceFilters
        include JSON::Serializable

        # The 12-digit source account ID.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The source region.
        @[JSON::Field(key: "Region")]
        getter region : String?

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The name of the resource.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @account_id : String? = nil,
          @region : String? = nil,
          @resource_id : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # The details that identify a resource that is discovered by Config, including the resource type, ID,
      # and (if available) the custom resource name.
      struct ResourceIdentifier
        include JSON::Serializable

        # The time that the resource was deleted.
        @[JSON::Field(key: "resourceDeletionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter resource_deletion_time : Time?

        # The ID of the resource (for example, sg-xxxxxx ).
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The custom name of the resource (if available).
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # The type of resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @resource_deletion_time : Time? = nil,
          @resource_id : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # You see this exception in the following cases: For DeleteConfigRule, Config is deleting this rule.
      # Try your request again later. For DeleteConfigRule, the rule is deleting your evaluation results.
      # Try your request again later. For DeleteConfigRule, a remediation action is associated with the rule
      # and Config cannot delete this rule. Delete the remediation action associated with the rule before
      # deleting the rule and try your request again later. For PutConfigOrganizationRule, organization
      # Config rule deletion is in progress. Try your request again later. For DeleteOrganizationConfigRule,
      # organization Config rule creation is in progress. Try your request again later. For
      # PutConformancePack and PutOrganizationConformancePack, a conformance pack creation, update, and
      # deletion is in progress. Try your request again later. For DeleteConformancePack, a conformance pack
      # creation, update, and deletion is in progress. Try your request again later.
      struct ResourceInUseException
        include JSON::Serializable

        def initialize
        end
      end

      # The details that identify a resource within Config, including the resource type and resource ID.
      struct ResourceKey
        include JSON::Serializable

        # The ID of the resource (for example., sg-xxxxxx).
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # You have specified a resource that is either unknown or has not been discovered.
      struct ResourceNotDiscoveredException
        include JSON::Serializable

        def initialize
        end
      end

      # You have specified a resource that does not exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The dynamic value of the resource.
      struct ResourceValue
        include JSON::Serializable

        # The value is a resource ID.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @value : String
        )
        end
      end

      # An object with the name of the retention configuration and the retention period in days. The object
      # stores the configuration for data retention in Config.
      struct RetentionConfiguration
        include JSON::Serializable

        # The name of the retention configuration object.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Number of days Config stores your historical information. Currently, only applicable to the
        # configuration item history.
        @[JSON::Field(key: "RetentionPeriodInDays")]
        getter retention_period_in_days : Int32

        def initialize(
          @name : String,
          @retention_period_in_days : Int32
        )
        end
      end

      # Defines which resources trigger an evaluation for an Config rule. The scope can include one or more
      # resource types, a combination of a tag key and value, or a combination of one resource type and one
      # resource ID. Specify a scope to constrain which resources trigger an evaluation for a rule.
      # Otherwise, evaluations for the rule are triggered when any resource in your recording group changes
      # in configuration.
      struct Scope
        include JSON::Serializable

        # The ID of the only Amazon Web Services resource that you want to trigger an evaluation for the rule.
        # If you specify a resource ID, you must specify one resource type for ComplianceResourceTypes .
        @[JSON::Field(key: "ComplianceResourceId")]
        getter compliance_resource_id : String?

        # The resource types of only those Amazon Web Services resources that you want to trigger an
        # evaluation for the rule. You can only specify one type if you also specify a resource ID for
        # ComplianceResourceId .
        @[JSON::Field(key: "ComplianceResourceTypes")]
        getter compliance_resource_types : Array(String)?

        # The tag key that is applied to only those Amazon Web Services resources that you want to trigger an
        # evaluation for the rule.
        @[JSON::Field(key: "TagKey")]
        getter tag_key : String?

        # The tag value applied to only those Amazon Web Services resources that you want to trigger an
        # evaluation for the rule. If you specify a value for TagValue , you must also specify a value for
        # TagKey .
        @[JSON::Field(key: "TagValue")]
        getter tag_value : String?

        def initialize(
          @compliance_resource_id : String? = nil,
          @compliance_resource_types : Array(String)? = nil,
          @tag_key : String? = nil,
          @tag_value : String? = nil
        )
        end
      end

      struct SelectAggregateResourceConfigRequest
        include JSON::Serializable

        # The name of the configuration aggregator.
        @[JSON::Field(key: "ConfigurationAggregatorName")]
        getter configuration_aggregator_name : String

        # The SQL query SELECT command.
        @[JSON::Field(key: "Expression")]
        getter expression : String

        # The maximum number of query results returned on each page.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The maximum number of query results returned on each page. Config also allows the Limit request
        # parameter.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_aggregator_name : String,
          @expression : String,
          @limit : Int32? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct SelectAggregateResourceConfigResponse
        include JSON::Serializable

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        @[JSON::Field(key: "QueryInfo")]
        getter query_info : Types::QueryInfo?

        # Returns the results for the SQL query.
        @[JSON::Field(key: "Results")]
        getter results : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @query_info : Types::QueryInfo? = nil,
          @results : Array(String)? = nil
        )
        end
      end

      struct SelectResourceConfigRequest
        include JSON::Serializable

        # The SQL query SELECT command.
        @[JSON::Field(key: "Expression")]
        getter expression : String

        # The maximum number of query results returned on each page.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @expression : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct SelectResourceConfigResponse
        include JSON::Serializable

        # The nextToken string returned in a previous request that you use to request the next page of results
        # in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns the QueryInfo object.
        @[JSON::Field(key: "QueryInfo")]
        getter query_info : Types::QueryInfo?

        # Returns the results for the SQL query.
        @[JSON::Field(key: "Results")]
        getter results : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @query_info : Types::QueryInfo? = nil,
          @results : Array(String)? = nil
        )
        end
      end

      # Provides the CustomPolicyDetails, the rule owner ( Amazon Web Services for managed rules,
      # CUSTOM_POLICY for Custom Policy rules, and CUSTOM_LAMBDA for Custom Lambda rules), the rule
      # identifier, and the events that cause the evaluation of your Amazon Web Services resources.
      struct Source
        include JSON::Serializable

        # Indicates whether Amazon Web Services or the customer owns and manages the Config rule. Config
        # Managed Rules are predefined rules owned by Amazon Web Services. For more information, see Config
        # Managed Rules in the Config developer guide . Config Custom Rules are rules that you can develop
        # either with Guard ( CUSTOM_POLICY ) or Lambda ( CUSTOM_LAMBDA ). For more information, see Config
        # Custom Rules in the Config developer guide .
        @[JSON::Field(key: "Owner")]
        getter owner : String

        # Provides the runtime system, policy definition, and whether debug logging is enabled. Required when
        # owner is set to CUSTOM_POLICY .
        @[JSON::Field(key: "CustomPolicyDetails")]
        getter custom_policy_details : Types::CustomPolicyDetails?

        # Provides the source and the message types that cause Config to evaluate your Amazon Web Services
        # resources against a rule. It also provides the frequency with which you want Config to run
        # evaluations for the rule if the trigger type is periodic. If the owner is set to CUSTOM_POLICY , the
        # only acceptable values for the Config rule trigger message type are
        # ConfigurationItemChangeNotification and OversizedConfigurationItemChangeNotification .
        @[JSON::Field(key: "SourceDetails")]
        getter source_details : Array(Types::SourceDetail)?

        # For Config Managed rules, a predefined identifier from a list. For example, IAM_PASSWORD_POLICY is a
        # managed rule. To reference a managed rule, see List of Config Managed Rules . For Config Custom
        # Lambda rules, the identifier is the Amazon Resource Name (ARN) of the rule's Lambda function, such
        # as arn:aws:lambda:us-east-2:123456789012:function:custom_rule_name . For Config Custom Policy rules,
        # this field will be ignored.
        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String?

        def initialize(
          @owner : String,
          @custom_policy_details : Types::CustomPolicyDetails? = nil,
          @source_details : Array(Types::SourceDetail)? = nil,
          @source_identifier : String? = nil
        )
        end
      end

      # Provides the source and the message types that trigger Config to evaluate your Amazon Web Services
      # resources against a rule. It also provides the frequency with which you want Config to run
      # evaluations for the rule if the trigger type is periodic. You can specify the parameter values for
      # SourceDetail only for custom rules.
      struct SourceDetail
        include JSON::Serializable

        # The source of the event, such as an Amazon Web Services service, that triggers Config to evaluate
        # your Amazon Web Services resources.
        @[JSON::Field(key: "EventSource")]
        getter event_source : String?

        # The frequency at which you want Config to run evaluations for a custom rule with a periodic trigger.
        # If you specify a value for MaximumExecutionFrequency , then MessageType must use the
        # ScheduledNotification value. By default, rules with a periodic trigger are evaluated every 24 hours.
        # To change the frequency, specify a valid value for the MaximumExecutionFrequency parameter. Based on
        # the valid value you choose, Config runs evaluations once for each valid value. For example, if you
        # choose Three_Hours , Config runs evaluations once every three hours. In this case, Three_Hours is
        # the frequency of this rule.
        @[JSON::Field(key: "MaximumExecutionFrequency")]
        getter maximum_execution_frequency : String?

        # The type of notification that triggers Config to run an evaluation for a rule. You can specify the
        # following notification types: ConfigurationItemChangeNotification - Triggers an evaluation when
        # Config delivers a configuration item as a result of a resource change.
        # OversizedConfigurationItemChangeNotification - Triggers an evaluation when Config delivers an
        # oversized configuration item. Config may generate this notification type when a resource changes and
        # the notification exceeds the maximum size allowed by Amazon SNS. ScheduledNotification - Triggers a
        # periodic evaluation at the frequency specified for MaximumExecutionFrequency .
        # ConfigurationSnapshotDeliveryCompleted - Triggers a periodic evaluation when Config delivers a
        # configuration snapshot. If you want your custom rule to be triggered by configuration changes,
        # specify two SourceDetail objects, one for ConfigurationItemChangeNotification and one for
        # OversizedConfigurationItemChangeNotification .
        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        def initialize(
          @event_source : String? = nil,
          @maximum_execution_frequency : String? = nil,
          @message_type : String? = nil
        )
        end
      end

      # Amazon Web Services Systems Manager (SSM) specific remediation controls.
      struct SsmControls
        include JSON::Serializable

        # The maximum percentage of remediation actions allowed to run in parallel on the non-compliant
        # resources for that specific rule. You can specify a percentage, such as 10%. The default value is
        # 10.
        @[JSON::Field(key: "ConcurrentExecutionRatePercentage")]
        getter concurrent_execution_rate_percentage : Int32?

        # The percentage of errors that are allowed before SSM stops running automations on non-compliant
        # resources for that specific rule. You can specify a percentage of errors, for example 10%. If you do
        # not specifiy a percentage, the default is 50%. For example, if you set the ErrorPercentage to 40%
        # for 10 non-compliant resources, then SSM stops running the automations when the fifth error is
        # received.
        @[JSON::Field(key: "ErrorPercentage")]
        getter error_percentage : Int32?

        def initialize(
          @concurrent_execution_rate_percentage : Int32? = nil,
          @error_percentage : Int32? = nil
        )
        end
      end

      struct StartConfigRulesEvaluationRequest
        include JSON::Serializable

        # The list of names of Config rules that you want to run evaluations for.
        @[JSON::Field(key: "ConfigRuleNames")]
        getter config_rule_names : Array(String)?

        def initialize(
          @config_rule_names : Array(String)? = nil
        )
        end
      end

      # The output when you start the evaluation for the specified Config rule.
      struct StartConfigRulesEvaluationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input for the StartConfigurationRecorder operation.
      struct StartConfigurationRecorderRequest
        include JSON::Serializable

        # The name of the customer managed configuration recorder that you want to start.
        @[JSON::Field(key: "ConfigurationRecorderName")]
        getter configuration_recorder_name : String

        def initialize(
          @configuration_recorder_name : String
        )
        end
      end

      struct StartRemediationExecutionRequest
        include JSON::Serializable

        # The list of names of Config rules that you want to run remediation execution for.
        @[JSON::Field(key: "ConfigRuleName")]
        getter config_rule_name : String

        # A list of resource keys to be processed with the current request. Each element in the list consists
        # of the resource type and resource ID.
        @[JSON::Field(key: "ResourceKeys")]
        getter resource_keys : Array(Types::ResourceKey)

        def initialize(
          @config_rule_name : String,
          @resource_keys : Array(Types::ResourceKey)
        )
        end
      end

      struct StartRemediationExecutionResponse
        include JSON::Serializable

        # For resources that have failed to start execution, the API returns a resource key object.
        @[JSON::Field(key: "FailedItems")]
        getter failed_items : Array(Types::ResourceKey)?

        # Returns a failure message. For example, the resource is already compliant.
        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        def initialize(
          @failed_items : Array(Types::ResourceKey)? = nil,
          @failure_message : String? = nil
        )
        end
      end

      struct StartResourceEvaluationRequest
        include JSON::Serializable

        # The mode of an evaluation. The only valid value for this API is PROACTIVE .
        @[JSON::Field(key: "EvaluationMode")]
        getter evaluation_mode : String

        # Returns a ResourceDetails object.
        @[JSON::Field(key: "ResourceDetails")]
        getter resource_details : Types::ResourceDetails

        # A client token is a unique, case-sensitive string of up to 64 ASCII characters. To make an
        # idempotent API request using one of these actions, specify a client token in the request. Avoid
        # reusing the same client token for other API requests. If you retry a request that completed
        # successfully using the same client token and the same parameters, the retry succeeds without
        # performing any further actions. If you retry a successful request using the same client token, but
        # one or more of the parameters are different, other than the Region or Availability Zone, the retry
        # fails with an IdempotentParameterMismatch error.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Returns an EvaluationContext object.
        @[JSON::Field(key: "EvaluationContext")]
        getter evaluation_context : Types::EvaluationContext?

        # The timeout for an evaluation. The default is 900 seconds. You cannot specify a number greater than
        # 3600. If you specify 0, Config uses the default.
        @[JSON::Field(key: "EvaluationTimeout")]
        getter evaluation_timeout : Int32?

        def initialize(
          @evaluation_mode : String,
          @resource_details : Types::ResourceDetails,
          @client_token : String? = nil,
          @evaluation_context : Types::EvaluationContext? = nil,
          @evaluation_timeout : Int32? = nil
        )
        end
      end

      struct StartResourceEvaluationResponse
        include JSON::Serializable

        # A unique ResourceEvaluationId that is associated with a single execution.
        @[JSON::Field(key: "ResourceEvaluationId")]
        getter resource_evaluation_id : String?

        def initialize(
          @resource_evaluation_id : String? = nil
        )
        end
      end

      # The static value of the resource.
      struct StaticValue
        include JSON::Serializable

        # A list of values. For example, the ARN of the assumed role.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @values : Array(String)
        )
        end
      end

      # Status filter object to filter results based on specific member account ID or status type for an
      # organization Config rule.
      struct StatusDetailFilters
        include JSON::Serializable

        # The 12-digit account ID of the member account within an organization.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Indicates deployment status for Config rule in the member account. When management account calls
        # PutOrganizationConfigRule action for the first time, Config rule status is created in the member
        # account. When management account calls PutOrganizationConfigRule action for the second time, Config
        # rule status is updated in the member account. Config rule status is deleted when the management
        # account deletes OrganizationConfigRule and disables service access for
        # config-multiaccountsetup.amazonaws.com . Config sets the state of the rule to: CREATE_SUCCESSFUL
        # when Config rule has been created in the member account. CREATE_IN_PROGRESS when Config rule is
        # being created in the member account. CREATE_FAILED when Config rule creation has failed in the
        # member account. DELETE_FAILED when Config rule deletion has failed in the member account.
        # DELETE_IN_PROGRESS when Config rule is being deleted in the member account. DELETE_SUCCESSFUL when
        # Config rule has been deleted in the member account. UPDATE_SUCCESSFUL when Config rule has been
        # updated in the member account. UPDATE_IN_PROGRESS when Config rule is being updated in the member
        # account. UPDATE_FAILED when Config rule deletion has failed in the member account.
        @[JSON::Field(key: "MemberAccountRuleStatus")]
        getter member_account_rule_status : String?

        def initialize(
          @account_id : String? = nil,
          @member_account_rule_status : String? = nil
        )
        end
      end

      # The input for the StopConfigurationRecorder operation.
      struct StopConfigurationRecorderRequest
        include JSON::Serializable

        # The name of the customer managed configuration recorder that you want to stop.
        @[JSON::Field(key: "ConfigurationRecorderName")]
        getter configuration_recorder_name : String

        def initialize(
          @configuration_recorder_name : String
        )
        end
      end

      # Provides the details of a stored query.
      struct StoredQuery
        include JSON::Serializable

        # The name of the query.
        @[JSON::Field(key: "QueryName")]
        getter query_name : String

        # A unique description for the query.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The expression of the query. For example, SELECT resourceId, resourceType,
        # supplementaryConfiguration.BucketVersioningConfiguration.status WHERE resourceType =
        # 'AWS::S3::Bucket' AND supplementaryConfiguration.BucketVersioningConfiguration.status = 'Off'.
        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # Amazon Resource Name (ARN) of the query. For example,
        # arn:partition:service:region:account-id:resource-type/resource-name/resource-id.
        @[JSON::Field(key: "QueryArn")]
        getter query_arn : String?

        # The ID of the query.
        @[JSON::Field(key: "QueryId")]
        getter query_id : String?

        def initialize(
          @query_name : String,
          @description : String? = nil,
          @expression : String? = nil,
          @query_arn : String? = nil,
          @query_id : String? = nil
        )
        end
      end

      # Returns details of a specific query.
      struct StoredQueryMetadata
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the query. For example,
        # arn:partition:service:region:account-id:resource-type/resource-name/resource-id.
        @[JSON::Field(key: "QueryArn")]
        getter query_arn : String

        # The ID of the query.
        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        # The name of the query.
        @[JSON::Field(key: "QueryName")]
        getter query_name : String

        # A unique description for the query.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @query_arn : String,
          @query_id : String,
          @query_name : String,
          @description : String? = nil
        )
        end
      end

      # The tags for the resource. The metadata that you apply to a resource to help you categorize and
      # organize them. Each tag consists of a key and an optional value, both of which you define. Tag keys
      # can have a maximum character length of 128 characters, and tag values can have a maximum length of
      # 256 characters.
      struct Tag
        include JSON::Serializable

        # One part of a key-value pair that make up a tag. A key is a general label that acts like a category
        # for more specific tag values.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag
        # category (key).
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. The
        # following resources are supported: ConfigurationRecorder ConfigRule OrganizationConfigRule
        # ConformancePack OrganizationConformancePack ConfigurationAggregator AggregationAuthorization
        # StoredQuery
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # An array of tag object.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # This API allows you to create a conformance pack template with an Amazon Web Services Systems
      # Manager document (SSM document). To deploy a conformance pack using an SSM document, first create an
      # SSM document with conformance pack content, and then provide the DocumentName in the
      # PutConformancePack API . You can also provide the DocumentVersion . The TemplateSSMDocumentDetails
      # object contains the name of the SSM document and the version of the SSM document.
      struct TemplateSSMDocumentDetails
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the SSM document to use to create a conformance pack. If
        # you use the document name, Config checks only your account and Amazon Web Services Region for the
        # SSM document.
        @[JSON::Field(key: "DocumentName")]
        getter document_name : String

        # The version of the SSM document to use to create a conformance pack. By default, Config uses the
        # latest version. This field is optional.
        @[JSON::Field(key: "DocumentVersion")]
        getter document_version : String?

        def initialize(
          @document_name : String,
          @document_version : String? = nil
        )
        end
      end

      # Filters evaluation results based on start and end times.
      struct TimeWindow
        include JSON::Serializable

        # The end time of an execution. The end time must be after the start date.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The start time of an execution.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # You have reached the limit of the number of tags you can use. For more information, see Service
      # Limits in the Config Developer Guide .
      struct TooManyTagsException
        include JSON::Serializable

        def initialize
        end
      end

      # The requested operation is not valid. For PutConfigurationRecorder , you will see this exception
      # because you cannot use this operation to create a service-linked configuration recorder. Use the
      # PutServiceLinkedConfigurationRecorder operation to create a service-linked configuration recorder.
      # For DeleteConfigurationRecorder , you will see this exception because you cannot use this operation
      # to delete a service-linked configuration recorder. Use the DeleteServiceLinkedConfigurationRecorder
      # operation to delete a service-linked configuration recorder. For StartConfigurationRecorder and
      # StopConfigurationRecorder , you will see this exception because these operations do not affect
      # service-linked configuration recorders. Service-linked configuration recorders are always recording.
      # To stop recording, you must delete the service-linked configuration recorder. Use the
      # DeleteServiceLinkedConfigurationRecorder operation to delete a service-linked configuration
      # recorder.
      struct UnmodifiableEntityException
        include JSON::Serializable

        def initialize
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. The
        # following resources are supported: ConfigurationRecorder ConfigRule OrganizationConfigRule
        # ConformancePack OrganizationConformancePack ConfigurationAggregator AggregationAuthorization
        # StoredQuery
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The keys of the tags to be removed.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # The requested operation is not valid. You will see this exception if there are missing required
      # fields or if the input value fails the validation. For PutStoredQuery , one of the following errors:
      # There are missing required fields. The input value fails the validation. You are trying to create
      # more than 300 queries. For DescribeConfigurationRecorders and DescribeConfigurationRecorderStatus ,
      # one of the following errors: You have specified more than one configuration recorder. You have
      # provided a service principal for service-linked configuration recorder that is not valid. For
      # AssociateResourceTypes and DisassociateResourceTypes , one of the following errors: Your
      # configuraiton recorder has a recording strategy that does not allow the association or
      # disassociation of resource types. One or more of the specified resource types are already associated
      # or disassociated with the configuration recorder. For service-linked configuration recorders, the
      # configuration recorder does not record one or more of the specified resource types.
      struct ValidationException
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
