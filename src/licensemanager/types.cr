require "json"
require "time"

module Aws
  module LicenseManager
    module Types


      struct AcceptGrantRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the grant.

        @[JSON::Field(key: "GrantArn")]
        getter grant_arn : String

        def initialize(
          @grant_arn : String
        )
        end
      end


      struct AcceptGrantResponse
        include JSON::Serializable

        # Grant ARN.

        @[JSON::Field(key: "GrantArn")]
        getter grant_arn : String?

        # Grant status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Grant version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @grant_arn : String? = nil,
          @status : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Access to resource denied.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # AND rule statement.

      struct AndRuleStatement
        include JSON::Serializable

        # Matching rule statements.

        @[JSON::Field(key: "MatchingRuleStatements")]
        getter matching_rule_statements : Array(Types::MatchingRuleStatement)?

        # Script rule statements.

        @[JSON::Field(key: "ScriptRuleStatements")]
        getter script_rule_statements : Array(Types::ScriptRuleStatement)?

        def initialize(
          @matching_rule_statements : Array(Types::MatchingRuleStatement)? = nil,
          @script_rule_statements : Array(Types::ScriptRuleStatement)? = nil
        )
        end
      end

      # Asset.

      struct Asset
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the asset.

        @[JSON::Field(key: "AssetArn")]
        getter asset_arn : String?

        # Latest asset discovery time.

        @[JSON::Field(key: "LatestAssetDiscoveryTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter latest_asset_discovery_time : Time?

        def initialize(
          @asset_arn : String? = nil,
          @latest_asset_discovery_time : Time? = nil
        )
        end
      end

      # The Amazon Web Services user account does not have permission to perform the action. Check the IAM
      # policy associated with this account.

      struct AuthorizationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes automated discovery.

      struct AutomatedDiscoveryInformation
        include JSON::Serializable

        # Time that automated discovery last ran.

        @[JSON::Field(key: "LastRunTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_run_time : Time?

        def initialize(
          @last_run_time : Time? = nil
        )
        end
      end

      # Details about a borrow configuration.

      struct BorrowConfiguration
        include JSON::Serializable

        # Indicates whether early check-ins are allowed.

        @[JSON::Field(key: "AllowEarlyCheckIn")]
        getter allow_early_check_in : Bool

        # Maximum time for the borrow configuration, in minutes.

        @[JSON::Field(key: "MaxTimeToLiveInMinutes")]
        getter max_time_to_live_in_minutes : Int32

        def initialize(
          @allow_early_check_in : Bool,
          @max_time_to_live_in_minutes : Int32
        )
        end
      end


      struct CheckInLicenseRequest
        include JSON::Serializable

        # License consumption token.

        @[JSON::Field(key: "LicenseConsumptionToken")]
        getter license_consumption_token : String

        # License beneficiary.

        @[JSON::Field(key: "Beneficiary")]
        getter beneficiary : String?

        def initialize(
          @license_consumption_token : String,
          @beneficiary : String? = nil
        )
        end
      end


      struct CheckInLicenseResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CheckoutBorrowLicenseRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Digital signature method. The possible value is JSON Web Signature (JWS) algorithm PS384. For more
        # information, see RFC 7518 Digital Signature with RSASSA-PSS .

        @[JSON::Field(key: "DigitalSignatureMethod")]
        getter digital_signature_method : String

        # License entitlements. Partial checkouts are not supported.

        @[JSON::Field(key: "Entitlements")]
        getter entitlements : Array(Types::EntitlementData)

        # Amazon Resource Name (ARN) of the license. The license must use the borrow consumption
        # configuration.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String

        # Information about constraints.

        @[JSON::Field(key: "CheckoutMetadata")]
        getter checkout_metadata : Array(Types::Metadata)?

        # Node ID.

        @[JSON::Field(key: "NodeId")]
        getter node_id : String?

        def initialize(
          @client_token : String,
          @digital_signature_method : String,
          @entitlements : Array(Types::EntitlementData),
          @license_arn : String,
          @checkout_metadata : Array(Types::Metadata)? = nil,
          @node_id : String? = nil
        )
        end
      end


      struct CheckoutBorrowLicenseResponse
        include JSON::Serializable

        # Information about constraints.

        @[JSON::Field(key: "CheckoutMetadata")]
        getter checkout_metadata : Array(Types::Metadata)?

        # Allowed license entitlements.

        @[JSON::Field(key: "EntitlementsAllowed")]
        getter entitlements_allowed : Array(Types::EntitlementData)?

        # Date and time at which the license checkout expires.

        @[JSON::Field(key: "Expiration")]
        getter expiration : String?

        # Date and time at which the license checkout is issued.

        @[JSON::Field(key: "IssuedAt")]
        getter issued_at : String?

        # Amazon Resource Name (ARN) of the license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String?

        # License consumption token.

        @[JSON::Field(key: "LicenseConsumptionToken")]
        getter license_consumption_token : String?

        # Node ID.

        @[JSON::Field(key: "NodeId")]
        getter node_id : String?

        # Signed token.

        @[JSON::Field(key: "SignedToken")]
        getter signed_token : String?

        def initialize(
          @checkout_metadata : Array(Types::Metadata)? = nil,
          @entitlements_allowed : Array(Types::EntitlementData)? = nil,
          @expiration : String? = nil,
          @issued_at : String? = nil,
          @license_arn : String? = nil,
          @license_consumption_token : String? = nil,
          @node_id : String? = nil,
          @signed_token : String? = nil
        )
        end
      end


      struct CheckoutLicenseRequest
        include JSON::Serializable

        # Checkout type.

        @[JSON::Field(key: "CheckoutType")]
        getter checkout_type : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # License entitlements.

        @[JSON::Field(key: "Entitlements")]
        getter entitlements : Array(Types::EntitlementData)

        # Key fingerprint identifying the license.

        @[JSON::Field(key: "KeyFingerprint")]
        getter key_fingerprint : String

        # Product SKU.

        @[JSON::Field(key: "ProductSKU")]
        getter product_sku : String

        # License beneficiary.

        @[JSON::Field(key: "Beneficiary")]
        getter beneficiary : String?

        # Node ID.

        @[JSON::Field(key: "NodeId")]
        getter node_id : String?

        def initialize(
          @checkout_type : String,
          @client_token : String,
          @entitlements : Array(Types::EntitlementData),
          @key_fingerprint : String,
          @product_sku : String,
          @beneficiary : String? = nil,
          @node_id : String? = nil
        )
        end
      end


      struct CheckoutLicenseResponse
        include JSON::Serializable

        # Checkout type.

        @[JSON::Field(key: "CheckoutType")]
        getter checkout_type : String?

        # Allowed license entitlements.

        @[JSON::Field(key: "EntitlementsAllowed")]
        getter entitlements_allowed : Array(Types::EntitlementData)?

        # Date and time at which the license checkout expires.

        @[JSON::Field(key: "Expiration")]
        getter expiration : String?

        # Date and time at which the license checkout is issued.

        @[JSON::Field(key: "IssuedAt")]
        getter issued_at : String?

        # Amazon Resource Name (ARN) of the checkout license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String?

        # License consumption token.

        @[JSON::Field(key: "LicenseConsumptionToken")]
        getter license_consumption_token : String?

        # Node ID.

        @[JSON::Field(key: "NodeId")]
        getter node_id : String?

        # Signed token.

        @[JSON::Field(key: "SignedToken")]
        getter signed_token : String?

        def initialize(
          @checkout_type : String? = nil,
          @entitlements_allowed : Array(Types::EntitlementData)? = nil,
          @expiration : String? = nil,
          @issued_at : String? = nil,
          @license_arn : String? = nil,
          @license_consumption_token : String? = nil,
          @node_id : String? = nil,
          @signed_token : String? = nil
        )
        end
      end

      # There was a conflict processing the request. Try your request again.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details about license consumption.

      struct ConsumedLicenseSummary
        include JSON::Serializable

        # Number of licenses consumed by the resource.

        @[JSON::Field(key: "ConsumedLicenses")]
        getter consumed_licenses : Int64?

        # Resource type of the resource consuming a license.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @consumed_licenses : Int64? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Details about a consumption configuration.

      struct ConsumptionConfiguration
        include JSON::Serializable

        # Details about a borrow configuration.

        @[JSON::Field(key: "BorrowConfiguration")]
        getter borrow_configuration : Types::BorrowConfiguration?

        # Details about a provisional configuration.

        @[JSON::Field(key: "ProvisionalConfiguration")]
        getter provisional_configuration : Types::ProvisionalConfiguration?

        # Renewal frequency.

        @[JSON::Field(key: "RenewType")]
        getter renew_type : String?

        def initialize(
          @borrow_configuration : Types::BorrowConfiguration? = nil,
          @provisional_configuration : Types::ProvisionalConfiguration? = nil,
          @renew_type : String? = nil
        )
        end
      end


      struct CreateGrantRequest
        include JSON::Serializable

        # Allowed operations for the grant.

        @[JSON::Field(key: "AllowedOperations")]
        getter allowed_operations : Array(String)

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Grant name.

        @[JSON::Field(key: "GrantName")]
        getter grant_name : String

        # Home Region of the grant.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String

        # Amazon Resource Name (ARN) of the license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String

        # The grant principals. You can specify one of the following as an Amazon Resource Name (ARN): An
        # Amazon Web Services account, which includes only the account specified. An organizational unit (OU),
        # which includes all accounts in the OU. An organization, which will include all accounts across your
        # organization.

        @[JSON::Field(key: "Principals")]
        getter principals : Array(String)

        # Tags to add to the grant. For more information about tagging support in License Manager, see the
        # TagResource operation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @allowed_operations : Array(String),
          @client_token : String,
          @grant_name : String,
          @home_region : String,
          @license_arn : String,
          @principals : Array(String),
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateGrantResponse
        include JSON::Serializable

        # Grant ARN.

        @[JSON::Field(key: "GrantArn")]
        getter grant_arn : String?

        # Grant status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Grant version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @grant_arn : String? = nil,
          @status : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateGrantVersionRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Amazon Resource Name (ARN) of the grant.

        @[JSON::Field(key: "GrantArn")]
        getter grant_arn : String

        # Allowed operations for the grant.

        @[JSON::Field(key: "AllowedOperations")]
        getter allowed_operations : Array(String)?

        # Grant name.

        @[JSON::Field(key: "GrantName")]
        getter grant_name : String?

        # The options specified for the grant.

        @[JSON::Field(key: "Options")]
        getter options : Types::Options?

        # Current version of the grant.

        @[JSON::Field(key: "SourceVersion")]
        getter source_version : String?

        # Grant status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Grant status reason.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @client_token : String,
          @grant_arn : String,
          @allowed_operations : Array(String)? = nil,
          @grant_name : String? = nil,
          @options : Types::Options? = nil,
          @source_version : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct CreateGrantVersionResponse
        include JSON::Serializable

        # Grant ARN.

        @[JSON::Field(key: "GrantArn")]
        getter grant_arn : String?

        # Grant status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # New version of the grant.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @grant_arn : String? = nil,
          @status : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateLicenseAssetGroupRequest
        include JSON::Serializable

        # ARNs of associated license asset rulesets.

        @[JSON::Field(key: "AssociatedLicenseAssetRulesetARNs")]
        getter associated_license_asset_ruleset_ar_ns : Array(String)

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # License asset group configurations.

        @[JSON::Field(key: "LicenseAssetGroupConfigurations")]
        getter license_asset_group_configurations : Array(Types::LicenseAssetGroupConfiguration)

        # License asset group name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # License asset group description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # License asset group properties.

        @[JSON::Field(key: "Properties")]
        getter properties : Array(Types::LicenseAssetGroupProperty)?

        # Tags to add to the license asset group.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @associated_license_asset_ruleset_ar_ns : Array(String),
          @client_token : String,
          @license_asset_group_configurations : Array(Types::LicenseAssetGroupConfiguration),
          @name : String,
          @description : String? = nil,
          @properties : Array(Types::LicenseAssetGroupProperty)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateLicenseAssetGroupResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license asset group.

        @[JSON::Field(key: "LicenseAssetGroupArn")]
        getter license_asset_group_arn : String

        # License asset group status.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @license_asset_group_arn : String,
          @status : String
        )
        end
      end


      struct CreateLicenseAssetRulesetRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # License asset ruleset name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # License asset rules.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::LicenseAssetRule)

        # License asset ruleset description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Tags to add to the license asset ruleset.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String,
          @name : String,
          @rules : Array(Types::LicenseAssetRule),
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateLicenseAssetRulesetResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license asset ruleset.

        @[JSON::Field(key: "LicenseAssetRulesetArn")]
        getter license_asset_ruleset_arn : String

        def initialize(
          @license_asset_ruleset_arn : String
        )
        end
      end


      struct CreateLicenseConfigurationRequest
        include JSON::Serializable

        # Dimension used to track the license inventory.

        @[JSON::Field(key: "LicenseCountingType")]
        getter license_counting_type : String

        # Name of the license configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Description of the license configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # When true, disassociates a resource when software is uninstalled.

        @[JSON::Field(key: "DisassociateWhenNotFound")]
        getter disassociate_when_not_found : Bool?

        # Number of licenses managed by the license configuration.

        @[JSON::Field(key: "LicenseCount")]
        getter license_count : Int64?

        # Indicates whether hard or soft license enforcement is used. Exceeding a hard limit blocks the launch
        # of new instances.

        @[JSON::Field(key: "LicenseCountHardLimit")]
        getter license_count_hard_limit : Bool?

        # License configuration expiry.

        @[JSON::Field(key: "LicenseExpiry")]
        getter license_expiry : Int64?

        # License rules. The syntax is #name=value (for example, #allowedTenancy=EC2-DedicatedHost). The
        # available rules vary by dimension, as follows. Cores dimension: allowedTenancy |
        # licenseAffinityToHost | maximumCores | minimumCores Instances dimension: allowedTenancy |
        # maximumVcpus | minimumVcpus Sockets dimension: allowedTenancy | licenseAffinityToHost |
        # maximumSockets | minimumSockets vCPUs dimension: allowedTenancy | honorVcpuOptimization |
        # maximumVcpus | minimumVcpus The unit for licenseAffinityToHost is days and the range is 1 to 180.
        # The possible values for allowedTenancy are EC2-Default , EC2-DedicatedHost , and
        # EC2-DedicatedInstance . The possible values for honorVcpuOptimization are True and False .

        @[JSON::Field(key: "LicenseRules")]
        getter license_rules : Array(String)?

        # Product information.

        @[JSON::Field(key: "ProductInformationList")]
        getter product_information_list : Array(Types::ProductInformation)?

        # Tags to add to the license configuration.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @license_counting_type : String,
          @name : String,
          @description : String? = nil,
          @disassociate_when_not_found : Bool? = nil,
          @license_count : Int64? = nil,
          @license_count_hard_limit : Bool? = nil,
          @license_expiry : Int64? = nil,
          @license_rules : Array(String)? = nil,
          @product_information_list : Array(Types::ProductInformation)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateLicenseConfigurationResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license configuration.

        @[JSON::Field(key: "LicenseConfigurationArn")]
        getter license_configuration_arn : String?

        def initialize(
          @license_configuration_arn : String? = nil
        )
        end
      end


      struct CreateLicenseConversionTaskForResourceRequest
        include JSON::Serializable

        # Information that identifies the license type you are converting to. For the structure of the
        # destination license, see Convert a license type using the CLI in the License Manager User Guide .

        @[JSON::Field(key: "DestinationLicenseContext")]
        getter destination_license_context : Types::LicenseConversionContext

        # Amazon Resource Name (ARN) of the resource you are converting the license type for.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Information that identifies the license type you are converting from. For the structure of the
        # source license, see Convert a license type using the CLI in the License Manager User Guide .

        @[JSON::Field(key: "SourceLicenseContext")]
        getter source_license_context : Types::LicenseConversionContext

        def initialize(
          @destination_license_context : Types::LicenseConversionContext,
          @resource_arn : String,
          @source_license_context : Types::LicenseConversionContext
        )
        end
      end


      struct CreateLicenseConversionTaskForResourceResponse
        include JSON::Serializable

        # The ID of the created license type conversion task.

        @[JSON::Field(key: "LicenseConversionTaskId")]
        getter license_conversion_task_id : String?

        def initialize(
          @license_conversion_task_id : String? = nil
        )
        end
      end


      struct CreateLicenseManagerReportGeneratorRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Defines the type of license configuration the report generator tracks.

        @[JSON::Field(key: "ReportContext")]
        getter report_context : Types::ReportContext

        # Frequency by which reports are generated. Reports can be generated daily, monthly, or weekly.

        @[JSON::Field(key: "ReportFrequency")]
        getter report_frequency : Types::ReportFrequency

        # Name of the report generator.

        @[JSON::Field(key: "ReportGeneratorName")]
        getter report_generator_name : String

        # Type of reports to generate. The following report types an be generated: License configuration
        # report - Reports the number and details of consumed licenses for a license configuration. Resource
        # report - Reports the tracked licenses and resource consumption for a license configuration.

        @[JSON::Field(key: "Type")]
        getter type : Array(String)

        # Description of the report generator.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Tags to add to the report generator.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String,
          @report_context : Types::ReportContext,
          @report_frequency : Types::ReportFrequency,
          @report_generator_name : String,
          @type : Array(String),
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateLicenseManagerReportGeneratorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new report generator.

        @[JSON::Field(key: "LicenseManagerReportGeneratorArn")]
        getter license_manager_report_generator_arn : String?

        def initialize(
          @license_manager_report_generator_arn : String? = nil
        )
        end
      end


      struct CreateLicenseRequest
        include JSON::Serializable

        # License beneficiary.

        @[JSON::Field(key: "Beneficiary")]
        getter beneficiary : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Configuration for consumption of the license. Choose a provisional configuration for workloads
        # running with continuous connectivity. Choose a borrow configuration for workloads with offline
        # usage.

        @[JSON::Field(key: "ConsumptionConfiguration")]
        getter consumption_configuration : Types::ConsumptionConfiguration

        # License entitlements.

        @[JSON::Field(key: "Entitlements")]
        getter entitlements : Array(Types::Entitlement)

        # Home Region for the license.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String

        # License issuer.

        @[JSON::Field(key: "Issuer")]
        getter issuer : Types::Issuer

        # License name.

        @[JSON::Field(key: "LicenseName")]
        getter license_name : String

        # Product name.

        @[JSON::Field(key: "ProductName")]
        getter product_name : String

        # Product SKU.

        @[JSON::Field(key: "ProductSKU")]
        getter product_sku : String

        # Date and time range during which the license is valid, in ISO8601-UTC format.

        @[JSON::Field(key: "Validity")]
        getter validity : Types::DatetimeRange

        # Information about the license.

        @[JSON::Field(key: "LicenseMetadata")]
        getter license_metadata : Array(Types::Metadata)?

        # Tags to add to the license. For more information about tagging support in License Manager, see the
        # TagResource operation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @beneficiary : String,
          @client_token : String,
          @consumption_configuration : Types::ConsumptionConfiguration,
          @entitlements : Array(Types::Entitlement),
          @home_region : String,
          @issuer : Types::Issuer,
          @license_name : String,
          @product_name : String,
          @product_sku : String,
          @validity : Types::DatetimeRange,
          @license_metadata : Array(Types::Metadata)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateLicenseResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String?

        # License status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # License version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @license_arn : String? = nil,
          @status : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateLicenseVersionRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Configuration for consumption of the license. Choose a provisional configuration for workloads
        # running with continuous connectivity. Choose a borrow configuration for workloads with offline
        # usage.

        @[JSON::Field(key: "ConsumptionConfiguration")]
        getter consumption_configuration : Types::ConsumptionConfiguration

        # License entitlements.

        @[JSON::Field(key: "Entitlements")]
        getter entitlements : Array(Types::Entitlement)

        # Home Region of the license.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String

        # License issuer.

        @[JSON::Field(key: "Issuer")]
        getter issuer : Types::Issuer

        # Amazon Resource Name (ARN) of the license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String

        # License name.

        @[JSON::Field(key: "LicenseName")]
        getter license_name : String

        # Product name.

        @[JSON::Field(key: "ProductName")]
        getter product_name : String

        # License status.

        @[JSON::Field(key: "Status")]
        getter status : String

        # Date and time range during which the license is valid, in ISO8601-UTC format.

        @[JSON::Field(key: "Validity")]
        getter validity : Types::DatetimeRange

        # Information about the license.

        @[JSON::Field(key: "LicenseMetadata")]
        getter license_metadata : Array(Types::Metadata)?

        # Current version of the license.

        @[JSON::Field(key: "SourceVersion")]
        getter source_version : String?

        def initialize(
          @client_token : String,
          @consumption_configuration : Types::ConsumptionConfiguration,
          @entitlements : Array(Types::Entitlement),
          @home_region : String,
          @issuer : Types::Issuer,
          @license_arn : String,
          @license_name : String,
          @product_name : String,
          @status : String,
          @validity : Types::DatetimeRange,
          @license_metadata : Array(Types::Metadata)? = nil,
          @source_version : String? = nil
        )
        end
      end


      struct CreateLicenseVersionResponse
        include JSON::Serializable

        # License ARN.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String?

        # License status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # New version of the license.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @license_arn : String? = nil,
          @status : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateTokenRequest
        include JSON::Serializable

        # Idempotency token, valid for 10 minutes.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Amazon Resource Name (ARN) of the license. The ARN is mapped to the aud claim of the JWT token.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String

        # Token expiration, in days, counted from token creation. The default is 365 days.

        @[JSON::Field(key: "ExpirationInDays")]
        getter expiration_in_days : Int32?

        # Amazon Resource Name (ARN) of the IAM roles to embed in the token. License Manager does not check
        # whether the roles are in use.

        @[JSON::Field(key: "RoleArns")]
        getter role_arns : Array(String)?

        # Data specified by the caller to be included in the JWT token. The data is mapped to the amr claim of
        # the JWT token.

        @[JSON::Field(key: "TokenProperties")]
        getter token_properties : Array(String)?

        def initialize(
          @client_token : String,
          @license_arn : String,
          @expiration_in_days : Int32? = nil,
          @role_arns : Array(String)? = nil,
          @token_properties : Array(String)? = nil
        )
        end
      end


      struct CreateTokenResponse
        include JSON::Serializable

        # Refresh token, encoded as a JWT token.

        @[JSON::Field(key: "Token")]
        getter token : String?

        # Token ID.

        @[JSON::Field(key: "TokenId")]
        getter token_id : String?

        # Token type.

        @[JSON::Field(key: "TokenType")]
        getter token_type : String?

        def initialize(
          @token : String? = nil,
          @token_id : String? = nil,
          @token_type : String? = nil
        )
        end
      end

      # Status information for cross-account discovery service.

      struct CrossAccountDiscoveryServiceStatus
        include JSON::Serializable

        # Status message for cross-account discovery service.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Status information for cross-region discovery.

      struct CrossRegionDiscoveryStatus
        include JSON::Serializable

        # Map of region status messages for cross-region discovery.

        @[JSON::Field(key: "Message")]
        getter message : Hash(String, Types::RegionStatus)?

        def initialize(
          @message : Hash(String, Types::RegionStatus)? = nil
        )
        end
      end

      # Describes a time range, in ISO8601-UTC format.

      struct DatetimeRange
        include JSON::Serializable

        # Start of the time range.

        @[JSON::Field(key: "Begin")]
        getter begin : String

        # End of the time range.

        @[JSON::Field(key: "End")]
        getter end : String?

        def initialize(
          @begin : String,
          @end : String? = nil
        )
        end
      end


      struct DeleteGrantRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the grant.

        @[JSON::Field(key: "GrantArn")]
        getter grant_arn : String

        # Current version of the grant.

        @[JSON::Field(key: "Version")]
        getter version : String

        # The Status reason for the delete request.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @grant_arn : String,
          @version : String,
          @status_reason : String? = nil
        )
        end
      end


      struct DeleteGrantResponse
        include JSON::Serializable

        # Grant ARN.

        @[JSON::Field(key: "GrantArn")]
        getter grant_arn : String?

        # Grant status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Grant version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @grant_arn : String? = nil,
          @status : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct DeleteLicenseAssetGroupRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license asset group.

        @[JSON::Field(key: "LicenseAssetGroupArn")]
        getter license_asset_group_arn : String

        def initialize(
          @license_asset_group_arn : String
        )
        end
      end


      struct DeleteLicenseAssetGroupResponse
        include JSON::Serializable

        # License asset group status.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end


      struct DeleteLicenseAssetRulesetRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license asset ruleset.

        @[JSON::Field(key: "LicenseAssetRulesetArn")]
        getter license_asset_ruleset_arn : String

        def initialize(
          @license_asset_ruleset_arn : String
        )
        end
      end


      struct DeleteLicenseAssetRulesetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLicenseConfigurationRequest
        include JSON::Serializable

        # ID of the license configuration.

        @[JSON::Field(key: "LicenseConfigurationArn")]
        getter license_configuration_arn : String

        def initialize(
          @license_configuration_arn : String
        )
        end
      end


      struct DeleteLicenseConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLicenseManagerReportGeneratorRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the report generator to be deleted.

        @[JSON::Field(key: "LicenseManagerReportGeneratorArn")]
        getter license_manager_report_generator_arn : String

        def initialize(
          @license_manager_report_generator_arn : String
        )
        end
      end


      struct DeleteLicenseManagerReportGeneratorResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLicenseRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String

        # Current version of the license.

        @[JSON::Field(key: "SourceVersion")]
        getter source_version : String

        def initialize(
          @license_arn : String,
          @source_version : String
        )
        end
      end


      struct DeleteLicenseResponse
        include JSON::Serializable

        # Date when the license is deleted.

        @[JSON::Field(key: "DeletionDate")]
        getter deletion_date : String?

        # License status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @deletion_date : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeleteTokenRequest
        include JSON::Serializable

        # Token ID.

        @[JSON::Field(key: "TokenId")]
        getter token_id : String

        def initialize(
          @token_id : String
        )
        end
      end


      struct DeleteTokenResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a resource entitled for use with a license.

      struct Entitlement
        include JSON::Serializable

        # Entitlement name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Entitlement unit.

        @[JSON::Field(key: "Unit")]
        getter unit : String

        # Indicates whether check-ins are allowed.

        @[JSON::Field(key: "AllowCheckIn")]
        getter allow_check_in : Bool?

        # Maximum entitlement count. Use if the unit is not None.

        @[JSON::Field(key: "MaxCount")]
        getter max_count : Int64?

        # Indicates whether overages are allowed.

        @[JSON::Field(key: "Overage")]
        getter overage : Bool?

        # Entitlement resource. Use only if the unit is None.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String,
          @unit : String,
          @allow_check_in : Bool? = nil,
          @max_count : Int64? = nil,
          @overage : Bool? = nil,
          @value : String? = nil
        )
        end
      end

      # Data associated with an entitlement resource.

      struct EntitlementData
        include JSON::Serializable

        # Entitlement data name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Entitlement data unit.

        @[JSON::Field(key: "Unit")]
        getter unit : String

        # Entitlement data value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String,
          @unit : String,
          @value : String? = nil
        )
        end
      end

      # The entitlement is not allowed.

      struct EntitlementNotAllowedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Usage associated with an entitlement resource.

      struct EntitlementUsage
        include JSON::Serializable

        # Resource usage consumed.

        @[JSON::Field(key: "ConsumedValue")]
        getter consumed_value : String

        # Entitlement usage name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Entitlement usage unit.

        @[JSON::Field(key: "Unit")]
        getter unit : String

        # Maximum entitlement usage count.

        @[JSON::Field(key: "MaxCount")]
        getter max_count : String?

        def initialize(
          @consumed_value : String,
          @name : String,
          @unit : String,
          @max_count : String? = nil
        )
        end
      end


      struct ExtendLicenseConsumptionRequest
        include JSON::Serializable

        # License consumption token.

        @[JSON::Field(key: "LicenseConsumptionToken")]
        getter license_consumption_token : String

        # Checks whether you have the required permissions for the action, without actually making the
        # request. Provides an error response if you do not have the required permissions.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @license_consumption_token : String,
          @dry_run : Bool? = nil
        )
        end
      end


      struct ExtendLicenseConsumptionResponse
        include JSON::Serializable

        # Date and time at which the license consumption expires.

        @[JSON::Field(key: "Expiration")]
        getter expiration : String?

        # License consumption token.

        @[JSON::Field(key: "LicenseConsumptionToken")]
        getter license_consumption_token : String?

        def initialize(
          @expiration : String? = nil,
          @license_consumption_token : String? = nil
        )
        end
      end

      # A dependency required to run the API is missing.

      struct FailedDependencyException
        include JSON::Serializable


        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # A filter name and value pair that is used to return more specific results from a describe operation.
      # Filters can be used to match a set of resources by specific criteria, such as tags, attributes, or
      # IDs.

      struct Filter
        include JSON::Serializable

        # Name of the filter. Filter names are case-sensitive.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value of the filter, which is case-sensitive. You can only specify one value for the filter.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The request uses too many filters or too many filter values.

      struct FilterLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetAccessTokenRequest
        include JSON::Serializable

        # Refresh token, encoded as a JWT token.

        @[JSON::Field(key: "Token")]
        getter token : String

        # Token properties to validate against those present in the JWT token.

        @[JSON::Field(key: "TokenProperties")]
        getter token_properties : Array(String)?

        def initialize(
          @token : String,
          @token_properties : Array(String)? = nil
        )
        end
      end


      struct GetAccessTokenResponse
        include JSON::Serializable

        # Temporary access token.

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String?

        def initialize(
          @access_token : String? = nil
        )
        end
      end


      struct GetGrantRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the grant.

        @[JSON::Field(key: "GrantArn")]
        getter grant_arn : String

        # Grant version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @grant_arn : String,
          @version : String? = nil
        )
        end
      end


      struct GetGrantResponse
        include JSON::Serializable

        # Grant details.

        @[JSON::Field(key: "Grant")]
        getter grant : Types::Grant?

        def initialize(
          @grant : Types::Grant? = nil
        )
        end
      end


      struct GetLicenseAssetGroupRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license asset group.

        @[JSON::Field(key: "LicenseAssetGroupArn")]
        getter license_asset_group_arn : String

        def initialize(
          @license_asset_group_arn : String
        )
        end
      end


      struct GetLicenseAssetGroupResponse
        include JSON::Serializable

        # License asset group.

        @[JSON::Field(key: "LicenseAssetGroup")]
        getter license_asset_group : Types::LicenseAssetGroup

        def initialize(
          @license_asset_group : Types::LicenseAssetGroup
        )
        end
      end


      struct GetLicenseAssetRulesetRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license asset ruleset.

        @[JSON::Field(key: "LicenseAssetRulesetArn")]
        getter license_asset_ruleset_arn : String

        def initialize(
          @license_asset_ruleset_arn : String
        )
        end
      end


      struct GetLicenseAssetRulesetResponse
        include JSON::Serializable

        # License asset ruleset.

        @[JSON::Field(key: "LicenseAssetRuleset")]
        getter license_asset_ruleset : Types::LicenseAssetRuleset

        def initialize(
          @license_asset_ruleset : Types::LicenseAssetRuleset
        )
        end
      end


      struct GetLicenseConfigurationRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license configuration.

        @[JSON::Field(key: "LicenseConfigurationArn")]
        getter license_configuration_arn : String

        def initialize(
          @license_configuration_arn : String
        )
        end
      end


      struct GetLicenseConfigurationResponse
        include JSON::Serializable

        # Automated discovery information.

        @[JSON::Field(key: "AutomatedDiscoveryInformation")]
        getter automated_discovery_information : Types::AutomatedDiscoveryInformation?

        # Summaries of the licenses consumed by resources.

        @[JSON::Field(key: "ConsumedLicenseSummaryList")]
        getter consumed_license_summary_list : Array(Types::ConsumedLicenseSummary)?

        # Number of licenses assigned to resources.

        @[JSON::Field(key: "ConsumedLicenses")]
        getter consumed_licenses : Int64?

        # Description of the license configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # When true, disassociates a resource when software is uninstalled.

        @[JSON::Field(key: "DisassociateWhenNotFound")]
        getter disassociate_when_not_found : Bool?

        # Amazon Resource Name (ARN) of the license configuration.

        @[JSON::Field(key: "LicenseConfigurationArn")]
        getter license_configuration_arn : String?

        # Unique ID for the license configuration.

        @[JSON::Field(key: "LicenseConfigurationId")]
        getter license_configuration_id : String?

        # Number of available licenses.

        @[JSON::Field(key: "LicenseCount")]
        getter license_count : Int64?

        # Sets the number of available licenses as a hard limit.

        @[JSON::Field(key: "LicenseCountHardLimit")]
        getter license_count_hard_limit : Bool?

        # Dimension for which the licenses are counted.

        @[JSON::Field(key: "LicenseCountingType")]
        getter license_counting_type : String?

        # License Expiry.

        @[JSON::Field(key: "LicenseExpiry")]
        getter license_expiry : Int64?

        # License rules.

        @[JSON::Field(key: "LicenseRules")]
        getter license_rules : Array(String)?

        # Summaries of the managed resources.

        @[JSON::Field(key: "ManagedResourceSummaryList")]
        getter managed_resource_summary_list : Array(Types::ManagedResourceSummary)?

        # Name of the license configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Account ID of the owner of the license configuration.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # Product information.

        @[JSON::Field(key: "ProductInformationList")]
        getter product_information_list : Array(Types::ProductInformation)?

        # License configuration status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Tags for the license configuration.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @automated_discovery_information : Types::AutomatedDiscoveryInformation? = nil,
          @consumed_license_summary_list : Array(Types::ConsumedLicenseSummary)? = nil,
          @consumed_licenses : Int64? = nil,
          @description : String? = nil,
          @disassociate_when_not_found : Bool? = nil,
          @license_configuration_arn : String? = nil,
          @license_configuration_id : String? = nil,
          @license_count : Int64? = nil,
          @license_count_hard_limit : Bool? = nil,
          @license_counting_type : String? = nil,
          @license_expiry : Int64? = nil,
          @license_rules : Array(String)? = nil,
          @managed_resource_summary_list : Array(Types::ManagedResourceSummary)? = nil,
          @name : String? = nil,
          @owner_account_id : String? = nil,
          @product_information_list : Array(Types::ProductInformation)? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct GetLicenseConversionTaskRequest
        include JSON::Serializable

        # ID of the license type conversion task to retrieve information on.

        @[JSON::Field(key: "LicenseConversionTaskId")]
        getter license_conversion_task_id : String

        def initialize(
          @license_conversion_task_id : String
        )
        end
      end


      struct GetLicenseConversionTaskResponse
        include JSON::Serializable

        # Information about the license type converted to.

        @[JSON::Field(key: "DestinationLicenseContext")]
        getter destination_license_context : Types::LicenseConversionContext?

        # Time at which the license type conversion task was completed.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # ID of the license type conversion task.

        @[JSON::Field(key: "LicenseConversionTaskId")]
        getter license_conversion_task_id : String?

        # Amount of time to complete the license type conversion.

        @[JSON::Field(key: "LicenseConversionTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter license_conversion_time : Time?

        # Amazon Resource Names (ARN) of the resources the license conversion task is associated with.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # Information about the license type converted from.

        @[JSON::Field(key: "SourceLicenseContext")]
        getter source_license_context : Types::LicenseConversionContext?

        # Time at which the license type conversion task was started .

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Status of the license type conversion task.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message for the conversion task.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @destination_license_context : Types::LicenseConversionContext? = nil,
          @end_time : Time? = nil,
          @license_conversion_task_id : String? = nil,
          @license_conversion_time : Time? = nil,
          @resource_arn : String? = nil,
          @source_license_context : Types::LicenseConversionContext? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct GetLicenseManagerReportGeneratorRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the report generator.

        @[JSON::Field(key: "LicenseManagerReportGeneratorArn")]
        getter license_manager_report_generator_arn : String

        def initialize(
          @license_manager_report_generator_arn : String
        )
        end
      end


      struct GetLicenseManagerReportGeneratorResponse
        include JSON::Serializable

        # A report generator that creates periodic reports about your license configurations.

        @[JSON::Field(key: "ReportGenerator")]
        getter report_generator : Types::ReportGenerator?

        def initialize(
          @report_generator : Types::ReportGenerator? = nil
        )
        end
      end


      struct GetLicenseRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String

        # License version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @license_arn : String,
          @version : String? = nil
        )
        end
      end


      struct GetLicenseResponse
        include JSON::Serializable

        # License details.

        @[JSON::Field(key: "License")]
        getter license : Types::License?

        def initialize(
          @license : Types::License? = nil
        )
        end
      end


      struct GetLicenseUsageRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String

        def initialize(
          @license_arn : String
        )
        end
      end


      struct GetLicenseUsageResponse
        include JSON::Serializable

        # License usage details.

        @[JSON::Field(key: "LicenseUsage")]
        getter license_usage : Types::LicenseUsage?

        def initialize(
          @license_usage : Types::LicenseUsage? = nil
        )
        end
      end


      struct GetServiceSettingsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetServiceSettingsResponse
        include JSON::Serializable

        # Cross region discovery home region.

        @[JSON::Field(key: "CrossRegionDiscoveryHomeRegion")]
        getter cross_region_discovery_home_region : String?

        # Cross region discovery source regions.

        @[JSON::Field(key: "CrossRegionDiscoverySourceRegions")]
        getter cross_region_discovery_source_regions : Array(String)?

        # Indicates whether cross-account discovery is enabled.

        @[JSON::Field(key: "EnableCrossAccountsDiscovery")]
        getter enable_cross_accounts_discovery : Bool?

        # Amazon Resource Name (ARN) of the resource share. The License Manager management account provides
        # member accounts with access to this share.

        @[JSON::Field(key: "LicenseManagerResourceShareArn")]
        getter license_manager_resource_share_arn : String?

        # Indicates whether Organizations is integrated with License Manager for cross-account discovery.

        @[JSON::Field(key: "OrganizationConfiguration")]
        getter organization_configuration : Types::OrganizationConfiguration?

        # Regional S3 bucket path for storing reports, license trail event data, discovery data, and so on.

        @[JSON::Field(key: "S3BucketArn")]
        getter s3_bucket_arn : String?

        # Service status.

        @[JSON::Field(key: "ServiceStatus")]
        getter service_status : Types::ServiceStatus?

        # SNS topic configured to receive notifications from License Manager.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        def initialize(
          @cross_region_discovery_home_region : String? = nil,
          @cross_region_discovery_source_regions : Array(String)? = nil,
          @enable_cross_accounts_discovery : Bool? = nil,
          @license_manager_resource_share_arn : String? = nil,
          @organization_configuration : Types::OrganizationConfiguration? = nil,
          @s3_bucket_arn : String? = nil,
          @service_status : Types::ServiceStatus? = nil,
          @sns_topic_arn : String? = nil
        )
        end
      end

      # Describes a grant.

      struct Grant
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the grant.

        @[JSON::Field(key: "GrantArn")]
        getter grant_arn : String

        # Grant name.

        @[JSON::Field(key: "GrantName")]
        getter grant_name : String

        # Grant status.

        @[JSON::Field(key: "GrantStatus")]
        getter grant_status : String

        # Granted operations.

        @[JSON::Field(key: "GrantedOperations")]
        getter granted_operations : Array(String)

        # The grantee principal ARN.

        @[JSON::Field(key: "GranteePrincipalArn")]
        getter grantee_principal_arn : String

        # Home Region of the grant.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String

        # License ARN.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String

        # Parent ARN.

        @[JSON::Field(key: "ParentArn")]
        getter parent_arn : String

        # Grant version.

        @[JSON::Field(key: "Version")]
        getter version : String

        # The options specified for the grant.

        @[JSON::Field(key: "Options")]
        getter options : Types::Options?

        # Grant status reason.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @grant_arn : String,
          @grant_name : String,
          @grant_status : String,
          @granted_operations : Array(String),
          @grantee_principal_arn : String,
          @home_region : String,
          @license_arn : String,
          @parent_arn : String,
          @version : String,
          @options : Types::Options? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Describes a license that is granted to a grantee.

      struct GrantedLicense
        include JSON::Serializable

        # Granted license beneficiary.

        @[JSON::Field(key: "Beneficiary")]
        getter beneficiary : String?

        # Configuration for consumption of the license.

        @[JSON::Field(key: "ConsumptionConfiguration")]
        getter consumption_configuration : Types::ConsumptionConfiguration?

        # Creation time of the granted license.

        @[JSON::Field(key: "CreateTime")]
        getter create_time : String?

        # License entitlements.

        @[JSON::Field(key: "Entitlements")]
        getter entitlements : Array(Types::Entitlement)?

        # Home Region of the granted license.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String?

        # Granted license issuer.

        @[JSON::Field(key: "Issuer")]
        getter issuer : Types::IssuerDetails?

        # Amazon Resource Name (ARN) of the license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String?

        # Granted license metadata.

        @[JSON::Field(key: "LicenseMetadata")]
        getter license_metadata : Array(Types::Metadata)?

        # License name.

        @[JSON::Field(key: "LicenseName")]
        getter license_name : String?

        # Product name.

        @[JSON::Field(key: "ProductName")]
        getter product_name : String?

        # Product SKU.

        @[JSON::Field(key: "ProductSKU")]
        getter product_sku : String?

        # Granted license received metadata.

        @[JSON::Field(key: "ReceivedMetadata")]
        getter received_metadata : Types::ReceivedMetadata?

        # Granted license status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Date and time range during which the granted license is valid, in ISO8601-UTC format.

        @[JSON::Field(key: "Validity")]
        getter validity : Types::DatetimeRange?

        # Version of the granted license.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @beneficiary : String? = nil,
          @consumption_configuration : Types::ConsumptionConfiguration? = nil,
          @create_time : String? = nil,
          @entitlements : Array(Types::Entitlement)? = nil,
          @home_region : String? = nil,
          @issuer : Types::IssuerDetails? = nil,
          @license_arn : String? = nil,
          @license_metadata : Array(Types::Metadata)? = nil,
          @license_name : String? = nil,
          @product_name : String? = nil,
          @product_sku : String? = nil,
          @received_metadata : Types::ReceivedMetadata? = nil,
          @status : String? = nil,
          @validity : Types::DatetimeRange? = nil,
          @version : String? = nil
        )
        end
      end

      # Instance rule statement.

      struct InstanceRuleStatement
        include JSON::Serializable

        # AND rule statement.

        @[JSON::Field(key: "AndRuleStatement")]
        getter and_rule_statement : Types::AndRuleStatement?

        # Matching rule statement.

        @[JSON::Field(key: "MatchingRuleStatement")]
        getter matching_rule_statement : Types::MatchingRuleStatement?

        # OR rule statement.

        @[JSON::Field(key: "OrRuleStatement")]
        getter or_rule_statement : Types::OrRuleStatement?

        # Script rule statement.

        @[JSON::Field(key: "ScriptRuleStatement")]
        getter script_rule_statement : Types::ScriptRuleStatement?

        def initialize(
          @and_rule_statement : Types::AndRuleStatement? = nil,
          @matching_rule_statement : Types::MatchingRuleStatement? = nil,
          @or_rule_statement : Types::OrRuleStatement? = nil,
          @script_rule_statement : Types::ScriptRuleStatement? = nil
        )
        end
      end

      # One or more parameter values are not valid.

      struct InvalidParameterValueException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # License Manager cannot allocate a license to a resource because of its state. For example, you
      # cannot allocate a license to an instance in the process of shutting down.

      struct InvalidResourceStateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An inventory filter.

      struct InventoryFilter
        include JSON::Serializable

        # Condition of the filter.

        @[JSON::Field(key: "Condition")]
        getter condition : String

        # Name of the filter.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Value of the filter.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @condition : String,
          @name : String,
          @value : String? = nil
        )
        end
      end

      # Details about the issuer of a license.

      struct Issuer
        include JSON::Serializable

        # Issuer name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Asymmetric KMS key from Key Management Service. The KMS key must have a key usage of sign and
        # verify, and support the RSASSA-PSS SHA-256 signing algorithm.

        @[JSON::Field(key: "SignKey")]
        getter sign_key : String?

        def initialize(
          @name : String,
          @sign_key : String? = nil
        )
        end
      end

      # Details associated with the issuer of a license.

      struct IssuerDetails
        include JSON::Serializable

        # Issuer key fingerprint.

        @[JSON::Field(key: "KeyFingerprint")]
        getter key_fingerprint : String?

        # Issuer name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Asymmetric KMS key from Key Management Service. The KMS key must have a key usage of sign and
        # verify, and support the RSASSA-PSS SHA-256 signing algorithm.

        @[JSON::Field(key: "SignKey")]
        getter sign_key : String?

        def initialize(
          @key_fingerprint : String? = nil,
          @name : String? = nil,
          @sign_key : String? = nil
        )
        end
      end

      # Software license that is managed in License Manager.

      struct License
        include JSON::Serializable

        # License beneficiary.

        @[JSON::Field(key: "Beneficiary")]
        getter beneficiary : String?

        # Configuration for consumption of the license.

        @[JSON::Field(key: "ConsumptionConfiguration")]
        getter consumption_configuration : Types::ConsumptionConfiguration?

        # License creation time.

        @[JSON::Field(key: "CreateTime")]
        getter create_time : String?

        # License entitlements.

        @[JSON::Field(key: "Entitlements")]
        getter entitlements : Array(Types::Entitlement)?

        # Home Region of the license.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String?

        # License issuer.

        @[JSON::Field(key: "Issuer")]
        getter issuer : Types::IssuerDetails?

        # Amazon Resource Name (ARN) of the license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String?

        # License metadata.

        @[JSON::Field(key: "LicenseMetadata")]
        getter license_metadata : Array(Types::Metadata)?

        # License name.

        @[JSON::Field(key: "LicenseName")]
        getter license_name : String?

        # Product name.

        @[JSON::Field(key: "ProductName")]
        getter product_name : String?

        # Product SKU.

        @[JSON::Field(key: "ProductSKU")]
        getter product_sku : String?

        # License status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Date and time range during which the license is valid, in ISO8601-UTC format.

        @[JSON::Field(key: "Validity")]
        getter validity : Types::DatetimeRange?

        # License version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @beneficiary : String? = nil,
          @consumption_configuration : Types::ConsumptionConfiguration? = nil,
          @create_time : String? = nil,
          @entitlements : Array(Types::Entitlement)? = nil,
          @home_region : String? = nil,
          @issuer : Types::IssuerDetails? = nil,
          @license_arn : String? = nil,
          @license_metadata : Array(Types::Metadata)? = nil,
          @license_name : String? = nil,
          @product_name : String? = nil,
          @product_sku : String? = nil,
          @status : String? = nil,
          @validity : Types::DatetimeRange? = nil,
          @version : String? = nil
        )
        end
      end

      # License asset group.

      struct LicenseAssetGroup
        include JSON::Serializable

        # ARNs of associated license asset rulesets.

        @[JSON::Field(key: "AssociatedLicenseAssetRulesetARNs")]
        getter associated_license_asset_ruleset_ar_ns : Array(String)

        # Amazon Resource Name (ARN) of the license asset group.

        @[JSON::Field(key: "LicenseAssetGroupArn")]
        getter license_asset_group_arn : String

        # License asset group name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # License asset group status.

        @[JSON::Field(key: "Status")]
        getter status : String

        # License asset group description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Latest resource discovery time.

        @[JSON::Field(key: "LatestResourceDiscoveryTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter latest_resource_discovery_time : Time?

        # Latest usage analysis time.

        @[JSON::Field(key: "LatestUsageAnalysisTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter latest_usage_analysis_time : Time?

        # License asset group configurations.

        @[JSON::Field(key: "LicenseAssetGroupConfigurations")]
        getter license_asset_group_configurations : Array(Types::LicenseAssetGroupConfiguration)?

        # License asset group properties.

        @[JSON::Field(key: "Properties")]
        getter properties : Array(Types::LicenseAssetGroupProperty)?

        # License asset group status message.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @associated_license_asset_ruleset_ar_ns : Array(String),
          @license_asset_group_arn : String,
          @name : String,
          @status : String,
          @description : String? = nil,
          @latest_resource_discovery_time : Time? = nil,
          @latest_usage_analysis_time : Time? = nil,
          @license_asset_group_configurations : Array(Types::LicenseAssetGroupConfiguration)? = nil,
          @properties : Array(Types::LicenseAssetGroupProperty)? = nil,
          @status_message : String? = nil
        )
        end
      end

      # License asset group configuration.

      struct LicenseAssetGroupConfiguration
        include JSON::Serializable

        # License Asset Group Configuration Usage dimension.

        @[JSON::Field(key: "UsageDimension")]
        getter usage_dimension : String?

        def initialize(
          @usage_dimension : String? = nil
        )
        end
      end

      # License asset group property.

      struct LicenseAssetGroupProperty
        include JSON::Serializable

        # Property key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Property value.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # License asset rule.

      struct LicenseAssetRule
        include JSON::Serializable

        # Rule statement.

        @[JSON::Field(key: "RuleStatement")]
        getter rule_statement : Types::RuleStatement

        def initialize(
          @rule_statement : Types::RuleStatement
        )
        end
      end

      # License asset ruleset.

      struct LicenseAssetRuleset
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license asset ruleset.

        @[JSON::Field(key: "LicenseAssetRulesetArn")]
        getter license_asset_ruleset_arn : String

        # License asset ruleset name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # License asset rules.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::LicenseAssetRule)

        # License asset ruleset description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @license_asset_ruleset_arn : String,
          @name : String,
          @rules : Array(Types::LicenseAssetRule),
          @description : String? = nil
        )
        end
      end

      # A license configuration is an abstraction of a customer license agreement that can be consumed and
      # enforced by License Manager. Components include specifications for the license type (licensing by
      # instance, socket, CPU, or vCPU), allowed tenancy (shared tenancy, Dedicated Instance, Dedicated
      # Host, or all of these), host affinity (how long a VM must be associated with a host), and the number
      # of licenses purchased and used.

      struct LicenseConfiguration
        include JSON::Serializable

        # Automated discovery information.

        @[JSON::Field(key: "AutomatedDiscoveryInformation")]
        getter automated_discovery_information : Types::AutomatedDiscoveryInformation?

        # Summaries for licenses consumed by various resources.

        @[JSON::Field(key: "ConsumedLicenseSummaryList")]
        getter consumed_license_summary_list : Array(Types::ConsumedLicenseSummary)?

        # Number of licenses consumed.

        @[JSON::Field(key: "ConsumedLicenses")]
        getter consumed_licenses : Int64?

        # Description of the license configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # When true, disassociates a resource when software is uninstalled.

        @[JSON::Field(key: "DisassociateWhenNotFound")]
        getter disassociate_when_not_found : Bool?

        # Amazon Resource Name (ARN) of the license configuration.

        @[JSON::Field(key: "LicenseConfigurationArn")]
        getter license_configuration_arn : String?

        # Unique ID of the license configuration.

        @[JSON::Field(key: "LicenseConfigurationId")]
        getter license_configuration_id : String?

        # Number of licenses managed by the license configuration.

        @[JSON::Field(key: "LicenseCount")]
        getter license_count : Int64?

        # Number of available licenses as a hard limit.

        @[JSON::Field(key: "LicenseCountHardLimit")]
        getter license_count_hard_limit : Bool?

        # Dimension to use to track the license inventory.

        @[JSON::Field(key: "LicenseCountingType")]
        getter license_counting_type : String?

        # License configuration expiry time in Unix timestamp format.

        @[JSON::Field(key: "LicenseExpiry")]
        getter license_expiry : Int64?

        # License rules.

        @[JSON::Field(key: "LicenseRules")]
        getter license_rules : Array(String)?

        # Summaries for managed resources.

        @[JSON::Field(key: "ManagedResourceSummaryList")]
        getter managed_resource_summary_list : Array(Types::ManagedResourceSummary)?

        # Name of the license configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Account ID of the license configuration's owner.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # Product information.

        @[JSON::Field(key: "ProductInformationList")]
        getter product_information_list : Array(Types::ProductInformation)?

        # Status of the license configuration.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @automated_discovery_information : Types::AutomatedDiscoveryInformation? = nil,
          @consumed_license_summary_list : Array(Types::ConsumedLicenseSummary)? = nil,
          @consumed_licenses : Int64? = nil,
          @description : String? = nil,
          @disassociate_when_not_found : Bool? = nil,
          @license_configuration_arn : String? = nil,
          @license_configuration_id : String? = nil,
          @license_count : Int64? = nil,
          @license_count_hard_limit : Bool? = nil,
          @license_counting_type : String? = nil,
          @license_expiry : Int64? = nil,
          @license_rules : Array(String)? = nil,
          @managed_resource_summary_list : Array(Types::ManagedResourceSummary)? = nil,
          @name : String? = nil,
          @owner_account_id : String? = nil,
          @product_information_list : Array(Types::ProductInformation)? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes an association with a license configuration.

      struct LicenseConfigurationAssociation
        include JSON::Serializable

        # Scope of AMI associations. The possible value is cross-account .

        @[JSON::Field(key: "AmiAssociationScope")]
        getter ami_association_scope : String?

        # Time when the license configuration was associated with the resource.

        @[JSON::Field(key: "AssociationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter association_time : Time?

        # Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # ID of the Amazon Web Services account that owns the resource consuming licenses.

        @[JSON::Field(key: "ResourceOwnerId")]
        getter resource_owner_id : String?

        # Type of server resource.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @ami_association_scope : String? = nil,
          @association_time : Time? = nil,
          @resource_arn : String? = nil,
          @resource_owner_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # License configuration rule statement.

      struct LicenseConfigurationRuleStatement
        include JSON::Serializable

        # AND rule statement.

        @[JSON::Field(key: "AndRuleStatement")]
        getter and_rule_statement : Types::AndRuleStatement?

        # Matching rule statement.

        @[JSON::Field(key: "MatchingRuleStatement")]
        getter matching_rule_statement : Types::MatchingRuleStatement?

        # OR rule statement.

        @[JSON::Field(key: "OrRuleStatement")]
        getter or_rule_statement : Types::OrRuleStatement?

        def initialize(
          @and_rule_statement : Types::AndRuleStatement? = nil,
          @matching_rule_statement : Types::MatchingRuleStatement? = nil,
          @or_rule_statement : Types::OrRuleStatement? = nil
        )
        end
      end

      # Details about the usage of a resource associated with a license configuration.

      struct LicenseConfigurationUsage
        include JSON::Serializable

        # Time when the license configuration was initially associated with the resource.

        @[JSON::Field(key: "AssociationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter association_time : Time?

        # Number of licenses consumed by the resource.

        @[JSON::Field(key: "ConsumedLicenses")]
        getter consumed_licenses : Int64?

        # Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # ID of the account that owns the resource.

        @[JSON::Field(key: "ResourceOwnerId")]
        getter resource_owner_id : String?

        # Status of the resource.

        @[JSON::Field(key: "ResourceStatus")]
        getter resource_status : String?

        # Type of resource.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @association_time : Time? = nil,
          @consumed_licenses : Int64? = nil,
          @resource_arn : String? = nil,
          @resource_owner_id : String? = nil,
          @resource_status : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Information about a license type conversion task.

      struct LicenseConversionContext
        include JSON::Serializable

        # Product codes referred to in the license conversion process.

        @[JSON::Field(key: "ProductCodes")]
        getter product_codes : Array(Types::ProductCodeListItem)?

        # The Usage operation value that corresponds to the license type you are converting your resource
        # from. For more information about which platforms correspond to which usage operation values see
        # Sample data: usage operation by platform

        @[JSON::Field(key: "UsageOperation")]
        getter usage_operation : String?

        def initialize(
          @product_codes : Array(Types::ProductCodeListItem)? = nil,
          @usage_operation : String? = nil
        )
        end
      end

      # Information about a license type conversion task.

      struct LicenseConversionTask
        include JSON::Serializable

        # Information about the license type this conversion task converted to.

        @[JSON::Field(key: "DestinationLicenseContext")]
        getter destination_license_context : Types::LicenseConversionContext?

        # The time the conversion task was completed.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The ID of the license type conversion task.

        @[JSON::Field(key: "LicenseConversionTaskId")]
        getter license_conversion_task_id : String?

        # The time the usage operation value of the resource was changed.

        @[JSON::Field(key: "LicenseConversionTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter license_conversion_time : Time?

        # The Amazon Resource Name (ARN) of the resource associated with the license type conversion task.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # Information about the license type this conversion task converted from.

        @[JSON::Field(key: "SourceLicenseContext")]
        getter source_license_context : Types::LicenseConversionContext?

        # The time the conversion task was started at.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the conversion task.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message for the conversion task.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @destination_license_context : Types::LicenseConversionContext? = nil,
          @end_time : Time? = nil,
          @license_conversion_task_id : String? = nil,
          @license_conversion_time : Time? = nil,
          @resource_arn : String? = nil,
          @source_license_context : Types::LicenseConversionContext? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Describes the failure of a license operation.

      struct LicenseOperationFailure
        include JSON::Serializable

        # Error message.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # Failure time.

        @[JSON::Field(key: "FailureTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter failure_time : Time?

        # Reserved.

        @[JSON::Field(key: "MetadataList")]
        getter metadata_list : Array(Types::Metadata)?

        # Name of the operation.

        @[JSON::Field(key: "OperationName")]
        getter operation_name : String?

        # The requester is "License Manager Automated Discovery".

        @[JSON::Field(key: "OperationRequestedBy")]
        getter operation_requested_by : String?

        # Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # ID of the Amazon Web Services account that owns the resource.

        @[JSON::Field(key: "ResourceOwnerId")]
        getter resource_owner_id : String?

        # Resource type.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @error_message : String? = nil,
          @failure_time : Time? = nil,
          @metadata_list : Array(Types::Metadata)? = nil,
          @operation_name : String? = nil,
          @operation_requested_by : String? = nil,
          @resource_arn : String? = nil,
          @resource_owner_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # License rule statement.

      struct LicenseRuleStatement
        include JSON::Serializable

        # AND rule statement.

        @[JSON::Field(key: "AndRuleStatement")]
        getter and_rule_statement : Types::AndRuleStatement?

        # Matching rule statement.

        @[JSON::Field(key: "MatchingRuleStatement")]
        getter matching_rule_statement : Types::MatchingRuleStatement?

        # OR rule statement.

        @[JSON::Field(key: "OrRuleStatement")]
        getter or_rule_statement : Types::OrRuleStatement?

        def initialize(
          @and_rule_statement : Types::AndRuleStatement? = nil,
          @matching_rule_statement : Types::MatchingRuleStatement? = nil,
          @or_rule_statement : Types::OrRuleStatement? = nil
        )
        end
      end

      # Details for associating a license configuration with a resource.

      struct LicenseSpecification
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license configuration.

        @[JSON::Field(key: "LicenseConfigurationArn")]
        getter license_configuration_arn : String

        # Scope of AMI associations. The possible value is cross-account .

        @[JSON::Field(key: "AmiAssociationScope")]
        getter ami_association_scope : String?

        def initialize(
          @license_configuration_arn : String,
          @ami_association_scope : String? = nil
        )
        end
      end

      # Describes the entitlement usage associated with a license.

      struct LicenseUsage
        include JSON::Serializable

        # License entitlement usages.

        @[JSON::Field(key: "EntitlementUsages")]
        getter entitlement_usages : Array(Types::EntitlementUsage)?

        def initialize(
          @entitlement_usages : Array(Types::EntitlementUsage)? = nil
        )
        end
      end

      # You do not have enough licenses available to support a new resource launch.

      struct LicenseUsageException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListAssetsForLicenseAssetGroupRequest
        include JSON::Serializable

        # Asset type. The possible values are Instance | License | LicenseConfiguration .

        @[JSON::Field(key: "AssetType")]
        getter asset_type : String

        # Amazon Resource Name (ARN) of the license asset group.

        @[JSON::Field(key: "LicenseAssetGroupArn")]
        getter license_asset_group_arn : String

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @asset_type : String,
          @license_asset_group_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetsForLicenseAssetGroupResponse
        include JSON::Serializable

        # Assets.

        @[JSON::Field(key: "Assets")]
        getter assets : Array(Types::Asset)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @assets : Array(Types::Asset)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociationsForLicenseConfigurationRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of a license configuration.

        @[JSON::Field(key: "LicenseConfigurationArn")]
        getter license_configuration_arn : String

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_configuration_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociationsForLicenseConfigurationResponse
        include JSON::Serializable

        # Information about the associations for the license configuration.

        @[JSON::Field(key: "LicenseConfigurationAssociations")]
        getter license_configuration_associations : Array(Types::LicenseConfigurationAssociation)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_configuration_associations : Array(Types::LicenseConfigurationAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDistributedGrantsRequest
        include JSON::Serializable

        # Filters to scope the results. The following filters are supported: LicenseArn GrantStatus
        # GranteePrincipalARN ProductSKU LicenseIssuerName

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Amazon Resource Names (ARNs) of the grants.

        @[JSON::Field(key: "GrantArns")]
        getter grant_arns : Array(String)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @grant_arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDistributedGrantsResponse
        include JSON::Serializable

        # Distributed grant details.

        @[JSON::Field(key: "Grants")]
        getter grants : Array(Types::Grant)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @grants : Array(Types::Grant)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFailuresForLicenseConfigurationOperationsRequest
        include JSON::Serializable

        # Amazon Resource Name of the license configuration.

        @[JSON::Field(key: "LicenseConfigurationArn")]
        getter license_configuration_arn : String

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_configuration_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFailuresForLicenseConfigurationOperationsResponse
        include JSON::Serializable

        # License configuration operations that failed.

        @[JSON::Field(key: "LicenseOperationFailureList")]
        getter license_operation_failure_list : Array(Types::LicenseOperationFailure)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_operation_failure_list : Array(Types::LicenseOperationFailure)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseAssetGroupsRequest
        include JSON::Serializable

        # Filters to scope the results. Following filters are supported LicenseAssetRulesetArn

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseAssetGroupsResponse
        include JSON::Serializable

        # License asset groups.

        @[JSON::Field(key: "LicenseAssetGroups")]
        getter license_asset_groups : Array(Types::LicenseAssetGroup)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_asset_groups : Array(Types::LicenseAssetGroup)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseAssetRulesetsRequest
        include JSON::Serializable

        # Filters to scope the results. Following filters are supported Name

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies whether to show License Manager managed license asset rulesets.

        @[JSON::Field(key: "ShowAWSManagedLicenseAssetRulesets")]
        getter show_aws_managed_license_asset_rulesets : Bool?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @show_aws_managed_license_asset_rulesets : Bool? = nil
        )
        end
      end


      struct ListLicenseAssetRulesetsResponse
        include JSON::Serializable

        # License asset rulesets.

        @[JSON::Field(key: "LicenseAssetRulesets")]
        getter license_asset_rulesets : Array(Types::LicenseAssetRuleset)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_asset_rulesets : Array(Types::LicenseAssetRuleset)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseConfigurationsForOrganizationRequest
        include JSON::Serializable

        # Filters to scope the results.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # License configuration ARNs.

        @[JSON::Field(key: "LicenseConfigurationArns")]
        getter license_configuration_arns : Array(String)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @license_configuration_arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseConfigurationsForOrganizationResponse
        include JSON::Serializable

        # License configurations.

        @[JSON::Field(key: "LicenseConfigurations")]
        getter license_configurations : Array(Types::LicenseConfiguration)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_configurations : Array(Types::LicenseConfiguration)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseConfigurationsRequest
        include JSON::Serializable

        # Filters to scope the results. The following filters and logical operators are supported:
        # licenseCountingType - The dimension for which licenses are counted. Possible values are vCPU |
        # Instance | Core | Socket . enforceLicenseCount - A Boolean value that indicates whether hard license
        # enforcement is used. usagelimitExceeded - A Boolean value that indicates whether the available
        # licenses have been exceeded.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Amazon Resource Names (ARN) of the license configurations.

        @[JSON::Field(key: "LicenseConfigurationArns")]
        getter license_configuration_arns : Array(String)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @license_configuration_arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseConfigurationsResponse
        include JSON::Serializable

        # Information about the license configurations.

        @[JSON::Field(key: "LicenseConfigurations")]
        getter license_configurations : Array(Types::LicenseConfiguration)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_configurations : Array(Types::LicenseConfiguration)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseConversionTasksRequest
        include JSON::Serializable

        # Filters to scope the results. Valid filters are ResourceArns and Status .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseConversionTasksResponse
        include JSON::Serializable

        # Information about the license configuration tasks for your account.

        @[JSON::Field(key: "LicenseConversionTasks")]
        getter license_conversion_tasks : Array(Types::LicenseConversionTask)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_conversion_tasks : Array(Types::LicenseConversionTask)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseManagerReportGeneratorsRequest
        include JSON::Serializable

        # Filters to scope the results. The following filters are supported: LicenseConfigurationArn

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseManagerReportGeneratorsResponse
        include JSON::Serializable

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A report generator that creates periodic reports about your license configurations.

        @[JSON::Field(key: "ReportGenerators")]
        getter report_generators : Array(Types::ReportGenerator)?

        def initialize(
          @next_token : String? = nil,
          @report_generators : Array(Types::ReportGenerator)? = nil
        )
        end
      end


      struct ListLicenseSpecificationsForResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of a resource that has an associated license configuration.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseSpecificationsForResourceResponse
        include JSON::Serializable

        # License configurations associated with a resource.

        @[JSON::Field(key: "LicenseSpecifications")]
        getter license_specifications : Array(Types::LicenseSpecification)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_specifications : Array(Types::LicenseSpecification)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseVersionsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseVersionsResponse
        include JSON::Serializable

        # License details.

        @[JSON::Field(key: "Licenses")]
        getter licenses : Array(Types::License)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @licenses : Array(Types::License)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicensesRequest
        include JSON::Serializable

        # Filters to scope the results. The following filters are supported: Beneficiary ProductSKU
        # Fingerprint Status

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Amazon Resource Names (ARNs) of the licenses.

        @[JSON::Field(key: "LicenseArns")]
        getter license_arns : Array(String)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @license_arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicensesResponse
        include JSON::Serializable

        # License details.

        @[JSON::Field(key: "Licenses")]
        getter licenses : Array(Types::License)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @licenses : Array(Types::License)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReceivedGrantsForOrganizationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the received license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String

        # Filters to scope the results. The following filters are supported: ParentArn GranteePrincipalArn

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_arn : String,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReceivedGrantsForOrganizationResponse
        include JSON::Serializable

        # Lists the grants the organization has received.

        @[JSON::Field(key: "Grants")]
        getter grants : Array(Types::Grant)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @grants : Array(Types::Grant)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReceivedGrantsRequest
        include JSON::Serializable

        # Filters to scope the results. The following filters are supported: ProductSKU LicenseIssuerName
        # LicenseArn GrantStatus GranterAccountId

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Amazon Resource Names (ARNs) of the grants.

        @[JSON::Field(key: "GrantArns")]
        getter grant_arns : Array(String)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @grant_arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReceivedGrantsResponse
        include JSON::Serializable

        # Received grant details.

        @[JSON::Field(key: "Grants")]
        getter grants : Array(Types::Grant)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @grants : Array(Types::Grant)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReceivedLicensesForOrganizationRequest
        include JSON::Serializable

        # Filters to scope the results. The following filters are supported: Beneficiary ProductSKU

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReceivedLicensesForOrganizationResponse
        include JSON::Serializable

        # Lists the licenses the organization has received.

        @[JSON::Field(key: "Licenses")]
        getter licenses : Array(Types::GrantedLicense)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @licenses : Array(Types::GrantedLicense)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReceivedLicensesRequest
        include JSON::Serializable

        # Filters to scope the results. The following filters are supported: ProductSKU Status Fingerprint
        # IssuerName Beneficiary

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Amazon Resource Names (ARNs) of the licenses.

        @[JSON::Field(key: "LicenseArns")]
        getter license_arns : Array(String)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @license_arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReceivedLicensesResponse
        include JSON::Serializable

        # Received license details.

        @[JSON::Field(key: "Licenses")]
        getter licenses : Array(Types::GrantedLicense)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @licenses : Array(Types::GrantedLicense)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceInventoryRequest
        include JSON::Serializable

        # Filters to scope the results. The following filters and logical operators are supported: account_id
        # - The ID of the Amazon Web Services account that owns the resource. Logical operators are EQUALS |
        # NOT_EQUALS . application_name - The name of the application. Logical operators are EQUALS |
        # BEGINS_WITH . license_included - The type of license included. Logical operators are EQUALS |
        # NOT_EQUALS . Possible values are sql-server-enterprise | sql-server-standard | sql-server-web |
        # windows-server-datacenter . platform - The platform of the resource. Logical operators are EQUALS |
        # BEGINS_WITH . resource_id - The ID of the resource. Logical operators are EQUALS | NOT_EQUALS .
        # tag:&lt;key&gt; - The key/value combination of a tag assigned to the resource. Logical operators are
        # EQUALS (single account) or EQUALS | NOT_EQUALS (cross account).

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::InventoryFilter)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::InventoryFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceInventoryResponse
        include JSON::Serializable

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the resources.

        @[JSON::Field(key: "ResourceInventoryList")]
        getter resource_inventory_list : Array(Types::ResourceInventory)?

        def initialize(
          @next_token : String? = nil,
          @resource_inventory_list : Array(Types::ResourceInventory)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Information about the tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListTokensRequest
        include JSON::Serializable

        # Filters to scope the results. The following filter is supported: LicenseArns

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Token IDs.

        @[JSON::Field(key: "TokenIds")]
        getter token_ids : Array(String)?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @token_ids : Array(String)? = nil
        )
        end
      end


      struct ListTokensResponse
        include JSON::Serializable

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Received token details.

        @[JSON::Field(key: "Tokens")]
        getter tokens : Array(Types::TokenData)?

        def initialize(
          @next_token : String? = nil,
          @tokens : Array(Types::TokenData)? = nil
        )
        end
      end


      struct ListUsageForLicenseConfigurationRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license configuration.

        @[JSON::Field(key: "LicenseConfigurationArn")]
        getter license_configuration_arn : String

        # Filters to scope the results. The following filters and logical operators are supported: resourceArn
        # - The ARN of the license configuration resource. resourceType - The resource type ( EC2_INSTANCE |
        # EC2_HOST | EC2_AMI | SYSTEMS_MANAGER_MANAGED_INSTANCE ). resourceAccount - The ID of the account
        # that owns the resource.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_configuration_arn : String,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListUsageForLicenseConfigurationResponse
        include JSON::Serializable

        # Information about the license configurations.

        @[JSON::Field(key: "LicenseConfigurationUsageList")]
        getter license_configuration_usage_list : Array(Types::LicenseConfigurationUsage)?

        # Token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_configuration_usage_list : Array(Types::LicenseConfigurationUsage)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Summary information about a managed resource.

      struct ManagedResourceSummary
        include JSON::Serializable

        # Number of resources associated with licenses.

        @[JSON::Field(key: "AssociationCount")]
        getter association_count : Int64?

        # Type of resource associated with a license.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @association_count : Int64? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Matching rule statement.

      struct MatchingRuleStatement
        include JSON::Serializable

        # Constraint.

        @[JSON::Field(key: "Constraint")]
        getter constraint : String

        # Key to match. The following keys and are supported when the RuleStatement type is Instance :
        # Platform - The name of the platform. Logical operators are EQUALS and NOT_EQUALS . EC2BillingProduct
        # - The billing product code. Logical operators are EQUALS and NOT_EQUALS . Possible values are:
        # windows-server-enterprise | windows-byol | rhel | rhel-byol | rhel-high-availability | ubuntu-pro |
        # suse-linux | sql-server-standard | sql-server-enterprise . MarketPlaceProductCode - The Marketplace
        # product code. Logical operators are EQUALS and NOT_EQUALS . AMIId - The ID of the AMI. Logical
        # operators are EQUALS and NOT_EQUALS . InstanceType - The instance type. Logical operators are EQUALS
        # and NOT_EQUALS . InstanceId - The ID of the instance. Logical operators are EQUALS and NOT_EQUALS .
        # HostId - The ID of the host. Logical operators are EQUALS and NOT_EQUALS . AccountId - The ID of the
        # account. Logical operators are EQUALS and NOT_EQUALS . The following keys and are supported when the
        # RuleStatement type is License : LicenseArn - The ARN of a Managed Entitlement License. Logical
        # operators are EQUALS and NOT_EQUALS . ProductSKU - The productSKU of the license. Logical operators
        # are EQUALS and NOT_EQUALS . Issuer - The issuer of the license. Logical operators are EQUALS and
        # NOT_EQUALS . Beneficiary - The beneficiary of the license. Logical operators are EQUALS and
        # NOT_EQUALS . LicenseStatus - The status of the license. Logical operators are EQUALS and NOT_EQUALS
        # . HomeRegion - The home region of the license. Logical operators are EQUALS and NOT_EQUALS . The
        # following keys and are supported when the RuleStatement type is License Configuration :
        # LicenseConfigurationArn - The ARN of a self-managed license configuration. Logical operators are
        # EQUALS and NOT_EQUALS . AccountId - The account of the license configuration. Logical operators are
        # EQUALS and NOT_EQUALS .

        @[JSON::Field(key: "KeyToMatch")]
        getter key_to_match : String

        # Value to match.

        @[JSON::Field(key: "ValueToMatch")]
        getter value_to_match : Array(String)

        def initialize(
          @constraint : String,
          @key_to_match : String,
          @value_to_match : Array(String)
        )
        end
      end

      # Describes key/value pairs.

      struct Metadata
        include JSON::Serializable

        # The key name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # There are no entitlements found for this license, or the entitlement maximum count is reached.

      struct NoEntitlementsAllowedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The options you can specify when you create a new version of a grant, such as activation override
      # behavior. For more information, see Granted licenses in License Manager in the License Manager User
      # Guide .

      struct Options
        include JSON::Serializable

        # An activation option for your grant that determines the behavior of activating a grant. Activation
        # options can only be used with granted licenses sourced from the Amazon Web Services Marketplace.
        # Additionally, the operation must specify the value of ACTIVE for the Status parameter. As a license
        # administrator, you can optionally specify an ActivationOverrideBehavior when activating a grant. As
        # a grantor, you can optionally specify an ActivationOverrideBehavior when you activate a grant for a
        # grantee account in your organization. As a grantee, if the grantor creating the distributed grant
        # doesn’t specify an ActivationOverrideBehavior , you can optionally specify one when you are
        # activating the grant. DISTRIBUTED_GRANTS_ONLY Use this value to activate a grant without replacing
        # any member account’s active grants for the same product. ALL_GRANTS_PERMITTED_BY_ISSUER Use this
        # value to activate a grant and disable other active grants in any member accounts for the same
        # product. This action will also replace their previously activated grants with this activated grant.

        @[JSON::Field(key: "ActivationOverrideBehavior")]
        getter activation_override_behavior : String?

        def initialize(
          @activation_override_behavior : String? = nil
        )
        end
      end

      # OR rule statement.

      struct OrRuleStatement
        include JSON::Serializable

        # Matching rule statements.

        @[JSON::Field(key: "MatchingRuleStatements")]
        getter matching_rule_statements : Array(Types::MatchingRuleStatement)?

        # Script rule statements.

        @[JSON::Field(key: "ScriptRuleStatements")]
        getter script_rule_statements : Array(Types::ScriptRuleStatement)?

        def initialize(
          @matching_rule_statements : Array(Types::MatchingRuleStatement)? = nil,
          @script_rule_statements : Array(Types::ScriptRuleStatement)? = nil
        )
        end
      end

      # Configuration information for Organizations.

      struct OrganizationConfiguration
        include JSON::Serializable

        # Enables Organizations integration.

        @[JSON::Field(key: "EnableIntegration")]
        getter enable_integration : Bool

        def initialize(
          @enable_integration : Bool
        )
        end
      end

      # A list item that contains a product code.

      struct ProductCodeListItem
        include JSON::Serializable

        # The product code ID

        @[JSON::Field(key: "ProductCodeId")]
        getter product_code_id : String

        # The product code type

        @[JSON::Field(key: "ProductCodeType")]
        getter product_code_type : String

        def initialize(
          @product_code_id : String,
          @product_code_type : String
        )
        end
      end

      # Describes product information for a license configuration.

      struct ProductInformation
        include JSON::Serializable

        # A Product information filter consists of a ProductInformationFilterComparator which is a logical
        # operator, a ProductInformationFilterName which specifies the type of filter being declared, and a
        # ProductInformationFilterValue that specifies the value to filter on. Accepted values for
        # ProductInformationFilterName are listed here along with descriptions and valid options for
        # ProductInformationFilterComparator . The following filters and are supported when the resource type
        # is SSM_MANAGED : Application Name - The name of the application. Logical operator is EQUALS .
        # Application Publisher - The publisher of the application. Logical operator is EQUALS . Application
        # Version - The version of the application. Logical operator is EQUALS . Platform Name - The name of
        # the platform. Logical operator is EQUALS . Platform Type - The platform type. Logical operator is
        # EQUALS . Tag:key - The key of a tag attached to an Amazon Web Services resource you wish to exclude
        # from automated discovery. Logical operator is NOT_EQUALS . The key for your tag must be appended to
        # Tag: following the example: Tag:name-of-your-key . ProductInformationFilterValue is optional if you
        # are not using values for the key. AccountId - The 12-digit ID of an Amazon Web Services account you
        # wish to exclude from automated discovery. Logical operator is NOT_EQUALS . License Included - The
        # type of license included. Logical operators are EQUALS and NOT_EQUALS . Possible values are:
        # sql-server-enterprise | sql-server-standard | sql-server-web | windows-server-datacenter . The
        # following filters and logical operators are supported when the resource type is RDS : Engine Edition
        # - The edition of the database engine. Logical operator is EQUALS . Possible values are: oracle-ee |
        # oracle-se | oracle-se1 | oracle-se2 | db2-se | db2-ae . License Pack - The license pack. Logical
        # operator is EQUALS . Possible values are: data guard | diagnostic pack sqlt | tuning pack sqlt | ols
        # | olap .

        @[JSON::Field(key: "ProductInformationFilterList")]
        getter product_information_filter_list : Array(Types::ProductInformationFilter)

        # Resource type. The possible values are SSM_MANAGED | RDS .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @product_information_filter_list : Array(Types::ProductInformationFilter),
          @resource_type : String
        )
        end
      end

      # Describes product information filters.

      struct ProductInformationFilter
        include JSON::Serializable

        # Logical operator.

        @[JSON::Field(key: "ProductInformationFilterComparator")]
        getter product_information_filter_comparator : String

        # Filter name.

        @[JSON::Field(key: "ProductInformationFilterName")]
        getter product_information_filter_name : String

        # Filter value.

        @[JSON::Field(key: "ProductInformationFilterValue")]
        getter product_information_filter_value : Array(String)?

        def initialize(
          @product_information_filter_comparator : String,
          @product_information_filter_name : String,
          @product_information_filter_value : Array(String)? = nil
        )
        end
      end

      # Details about a provisional configuration.

      struct ProvisionalConfiguration
        include JSON::Serializable

        # Maximum time for the provisional configuration, in minutes.

        @[JSON::Field(key: "MaxTimeToLiveInMinutes")]
        getter max_time_to_live_in_minutes : Int32

        def initialize(
          @max_time_to_live_in_minutes : Int32
        )
        end
      end

      # Too many requests have been submitted. Try again after a brief wait.

      struct RateLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Metadata associated with received licenses and grants.

      struct ReceivedMetadata
        include JSON::Serializable

        # Allowed operations.

        @[JSON::Field(key: "AllowedOperations")]
        getter allowed_operations : Array(String)?

        # Received status.

        @[JSON::Field(key: "ReceivedStatus")]
        getter received_status : String?

        # Received status reason.

        @[JSON::Field(key: "ReceivedStatusReason")]
        getter received_status_reason : String?

        def initialize(
          @allowed_operations : Array(String)? = nil,
          @received_status : String? = nil,
          @received_status_reason : String? = nil
        )
        end
      end

      # This is not the correct Region for the resource. Try again.

      struct RedirectException
        include JSON::Serializable


        @[JSON::Field(key: "Location")]
        getter location : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @location : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Status information for a specific region.

      struct RegionStatus
        include JSON::Serializable

        # Status value for the region.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct RejectGrantRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the grant.

        @[JSON::Field(key: "GrantArn")]
        getter grant_arn : String

        def initialize(
          @grant_arn : String
        )
        end
      end


      struct RejectGrantResponse
        include JSON::Serializable

        # Grant ARN.

        @[JSON::Field(key: "GrantArn")]
        getter grant_arn : String?

        # Grant status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Grant version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @grant_arn : String? = nil,
          @status : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Details of the license configuration that this generator reports on.

      struct ReportContext
        include JSON::Serializable

        # Amazon Resource Names (ARNs) of the license asset groups to include in the report.

        @[JSON::Field(key: "licenseAssetGroupArns")]
        getter license_asset_group_arns : Array(String)?

        # Amazon Resource Name (ARN) of the license configuration that this generator reports on.

        @[JSON::Field(key: "licenseConfigurationArns")]
        getter license_configuration_arns : Array(String)?

        # End date for the report data collection period.

        @[JSON::Field(key: "reportEndDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter report_end_date : Time?

        # Start date for the report data collection period.

        @[JSON::Field(key: "reportStartDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter report_start_date : Time?

        def initialize(
          @license_asset_group_arns : Array(String)? = nil,
          @license_configuration_arns : Array(String)? = nil,
          @report_end_date : Time? = nil,
          @report_start_date : Time? = nil
        )
        end
      end

      # Details about how frequently reports are generated.

      struct ReportFrequency
        include JSON::Serializable

        # Time period between each report. The period can be daily, weekly, or monthly.

        @[JSON::Field(key: "period")]
        getter period : String?

        # Number of times within the frequency period that a report is generated. The only supported value is
        # 1 .

        @[JSON::Field(key: "value")]
        getter value : Int32?

        def initialize(
          @period : String? = nil,
          @value : Int32? = nil
        )
        end
      end

      # Describe the details of a report generator.

      struct ReportGenerator
        include JSON::Serializable

        # Time the report was created.

        @[JSON::Field(key: "CreateTime")]
        getter create_time : String?

        # Description of the report generator.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Time the last report was generated at.

        @[JSON::Field(key: "LastReportGenerationTime")]
        getter last_report_generation_time : String?

        # Failure message for the last report generation attempt.

        @[JSON::Field(key: "LastRunFailureReason")]
        getter last_run_failure_reason : String?

        # Status of the last report generation attempt.

        @[JSON::Field(key: "LastRunStatus")]
        getter last_run_status : String?

        # Amazon Resource Name (ARN) of the report generator.

        @[JSON::Field(key: "LicenseManagerReportGeneratorArn")]
        getter license_manager_report_generator_arn : String?

        # License configuration type for this generator.

        @[JSON::Field(key: "ReportContext")]
        getter report_context : Types::ReportContext?

        # The Amazon Web Services account ID used to create the report generator.

        @[JSON::Field(key: "ReportCreatorAccount")]
        getter report_creator_account : String?

        # Details about how frequently reports are generated.

        @[JSON::Field(key: "ReportFrequency")]
        getter report_frequency : Types::ReportFrequency?

        # Name of the report generator.

        @[JSON::Field(key: "ReportGeneratorName")]
        getter report_generator_name : String?

        # Type of reports that are generated.

        @[JSON::Field(key: "ReportType")]
        getter report_type : Array(String)?

        # Details of the S3 bucket that report generator reports are published to.

        @[JSON::Field(key: "S3Location")]
        getter s3_location : Types::S3Location?

        # Tags associated with the report generator.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @create_time : String? = nil,
          @description : String? = nil,
          @last_report_generation_time : String? = nil,
          @last_run_failure_reason : String? = nil,
          @last_run_status : String? = nil,
          @license_manager_report_generator_arn : String? = nil,
          @report_context : Types::ReportContext? = nil,
          @report_creator_account : String? = nil,
          @report_frequency : Types::ReportFrequency? = nil,
          @report_generator_name : String? = nil,
          @report_type : Array(String)? = nil,
          @s3_location : Types::S3Location? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Details about a resource.

      struct ResourceInventory
        include JSON::Serializable

        # Amazon Machine Image (AMI) ID associated with the resource.

        @[JSON::Field(key: "AmiId")]
        getter ami_id : String?

        # Dedicated Host ID where the resource is running.

        @[JSON::Field(key: "HostId")]
        getter host_id : String?

        # EC2 instance type of the resource.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # List of Marketplace product codes associated with the resource.

        @[JSON::Field(key: "MarketplaceProductCodes")]
        getter marketplace_product_codes : Array(String)?

        # Platform of the resource.

        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # Platform version of the resource in the inventory.

        @[JSON::Field(key: "PlatformVersion")]
        getter platform_version : String?

        # Region where the resource is located.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # ID of the resource.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # ID of the account that owns the resource.

        @[JSON::Field(key: "ResourceOwningAccountId")]
        getter resource_owning_account_id : String?

        # Type of resource.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # Usage operation value that corresponds to the license type for billing purposes.

        @[JSON::Field(key: "UsageOperation")]
        getter usage_operation : String?

        def initialize(
          @ami_id : String? = nil,
          @host_id : String? = nil,
          @instance_type : String? = nil,
          @marketplace_product_codes : Array(String)? = nil,
          @platform : String? = nil,
          @platform_version : String? = nil,
          @region : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @resource_owning_account_id : String? = nil,
          @resource_type : String? = nil,
          @usage_operation : String? = nil
        )
        end
      end

      # Your resource limits have been exceeded.

      struct ResourceLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource cannot be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Rule statement.

      struct RuleStatement
        include JSON::Serializable

        # Instance rule statement.

        @[JSON::Field(key: "InstanceRuleStatement")]
        getter instance_rule_statement : Types::InstanceRuleStatement?

        # License configuration rule statement.

        @[JSON::Field(key: "LicenseConfigurationRuleStatement")]
        getter license_configuration_rule_statement : Types::LicenseConfigurationRuleStatement?

        # License rule statement.

        @[JSON::Field(key: "LicenseRuleStatement")]
        getter license_rule_statement : Types::LicenseRuleStatement?

        def initialize(
          @instance_rule_statement : Types::InstanceRuleStatement? = nil,
          @license_configuration_rule_statement : Types::LicenseConfigurationRuleStatement? = nil,
          @license_rule_statement : Types::LicenseRuleStatement? = nil
        )
        end
      end

      # Details of the S3 bucket that report generator reports are published to.

      struct S3Location
        include JSON::Serializable

        # Name of the S3 bucket reports are published to.

        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # Prefix of the S3 bucket reports are published to.

        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket : String? = nil,
          @key_prefix : String? = nil
        )
        end
      end

      # Rule statement that uses a script to evaluate license asset conditions.

      struct ScriptRuleStatement
        include JSON::Serializable

        # Key name to match against in the script rule evaluation.

        @[JSON::Field(key: "KeyToMatch")]
        getter key_to_match : String

        # Script code used to evaluate the rule condition.

        @[JSON::Field(key: "Script")]
        getter script : String

        def initialize(
          @key_to_match : String,
          @script : String
        )
        end
      end

      # The server experienced an internal error. Try again.

      struct ServerInternalException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Overall service status information for License Manager.

      struct ServiceStatus
        include JSON::Serializable

        # Status of cross-account discovery service.

        @[JSON::Field(key: "CrossAccountDiscovery")]
        getter cross_account_discovery : Types::CrossAccountDiscoveryServiceStatus?

        # Status of cross-region discovery service.

        @[JSON::Field(key: "CrossRegionDiscovery")]
        getter cross_region_discovery : Types::CrossRegionDiscoveryStatus?

        def initialize(
          @cross_account_discovery : Types::CrossAccountDiscoveryServiceStatus? = nil,
          @cross_region_discovery : Types::CrossRegionDiscoveryStatus? = nil
        )
        end
      end

      # Details about the tags for a resource. For more information about tagging support in License
      # Manager, see the TagResource operation.

      struct Tag
        include JSON::Serializable

        # The tag key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The tag value.

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

        # Amazon Resource Name (ARN) of the resource. The following examples provide an example ARN for each
        # supported resource in License Manager: Licenses -
        # arn:aws:license-manager::111122223333:license:l-EXAMPLE2da7646d6861033667f20e895 Grants -
        # arn:aws:license-manager::111122223333:grant:g-EXAMPLE7b19f4a0ab73679b0beb52707 License
        # configurations -
        # arn:aws:license-manager:us-east-1:111122223333:license-configuration:lic-EXAMPLE6a788d4c8acd4264ff0ecf2ed2d
        # Report generators -
        # arn:aws:license-manager:us-east-1:111122223333:report-generator:r-EXAMPLE825b4a4f8fe5a3e0c88824e5fc6

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # One or more tags.

        @[JSON::Field(key: "Tags")]
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

      # Describes a token.

      struct TokenData
        include JSON::Serializable

        # Token expiration time, in ISO8601-UTC format.

        @[JSON::Field(key: "ExpirationTime")]
        getter expiration_time : String?

        # Amazon Resource Name (ARN) of the license.

        @[JSON::Field(key: "LicenseArn")]
        getter license_arn : String?

        # Amazon Resource Names (ARN) of the roles included in the token.

        @[JSON::Field(key: "RoleArns")]
        getter role_arns : Array(String)?

        # Token status. The possible values are AVAILABLE and DELETED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Token ID.

        @[JSON::Field(key: "TokenId")]
        getter token_id : String?

        # Data specified by the caller.

        @[JSON::Field(key: "TokenProperties")]
        getter token_properties : Array(String)?

        # Type of token generated. The supported value is REFRESH_TOKEN .

        @[JSON::Field(key: "TokenType")]
        getter token_type : String?

        def initialize(
          @expiration_time : String? = nil,
          @license_arn : String? = nil,
          @role_arns : Array(String)? = nil,
          @status : String? = nil,
          @token_id : String? = nil,
          @token_properties : Array(String)? = nil,
          @token_type : String? = nil
        )
        end
      end

      # The digital signature method is unsupported. Try your request again.

      struct UnsupportedDigitalSignatureMethodException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Keys identifying the tags to remove.

        @[JSON::Field(key: "TagKeys")]
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


      struct UpdateLicenseAssetGroupRequest
        include JSON::Serializable

        # ARNs of associated license asset rulesets.

        @[JSON::Field(key: "AssociatedLicenseAssetRulesetARNs")]
        getter associated_license_asset_ruleset_ar_ns : Array(String)

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Amazon Resource Name (ARN) of the license asset group.

        @[JSON::Field(key: "LicenseAssetGroupArn")]
        getter license_asset_group_arn : String

        # License asset group description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # License asset group configurations.

        @[JSON::Field(key: "LicenseAssetGroupConfigurations")]
        getter license_asset_group_configurations : Array(Types::LicenseAssetGroupConfiguration)?

        # License asset group name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # License asset group properties.

        @[JSON::Field(key: "Properties")]
        getter properties : Array(Types::LicenseAssetGroupProperty)?

        # License asset group status. The possible values are ACTIVE | DISABLED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @associated_license_asset_ruleset_ar_ns : Array(String),
          @client_token : String,
          @license_asset_group_arn : String,
          @description : String? = nil,
          @license_asset_group_configurations : Array(Types::LicenseAssetGroupConfiguration)? = nil,
          @name : String? = nil,
          @properties : Array(Types::LicenseAssetGroupProperty)? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateLicenseAssetGroupResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license asset group.

        @[JSON::Field(key: "LicenseAssetGroupArn")]
        getter license_asset_group_arn : String

        # License asset group status.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @license_asset_group_arn : String,
          @status : String
        )
        end
      end


      struct UpdateLicenseAssetRulesetRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Amazon Resource Name (ARN) of the license asset ruleset.

        @[JSON::Field(key: "LicenseAssetRulesetArn")]
        getter license_asset_ruleset_arn : String

        # License asset rules.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::LicenseAssetRule)

        # License asset ruleset description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # License asset ruleset name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @client_token : String,
          @license_asset_ruleset_arn : String,
          @rules : Array(Types::LicenseAssetRule),
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateLicenseAssetRulesetResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license asset ruleset.

        @[JSON::Field(key: "LicenseAssetRulesetArn")]
        getter license_asset_ruleset_arn : String

        def initialize(
          @license_asset_ruleset_arn : String
        )
        end
      end


      struct UpdateLicenseConfigurationRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the license configuration.

        @[JSON::Field(key: "LicenseConfigurationArn")]
        getter license_configuration_arn : String

        # New description of the license configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # When true, disassociates a resource when software is uninstalled.

        @[JSON::Field(key: "DisassociateWhenNotFound")]
        getter disassociate_when_not_found : Bool?

        # New status of the license configuration.

        @[JSON::Field(key: "LicenseConfigurationStatus")]
        getter license_configuration_status : String?

        # New number of licenses managed by the license configuration.

        @[JSON::Field(key: "LicenseCount")]
        getter license_count : Int64?

        # New hard limit of the number of available licenses.

        @[JSON::Field(key: "LicenseCountHardLimit")]
        getter license_count_hard_limit : Bool?

        # License configuration expiry time.

        @[JSON::Field(key: "LicenseExpiry")]
        getter license_expiry : Int64?

        # New license rule. The only rule that you can add after you create a license configuration is
        # licenseAffinityToHost.

        @[JSON::Field(key: "LicenseRules")]
        getter license_rules : Array(String)?

        # New name of the license configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # New product information.

        @[JSON::Field(key: "ProductInformationList")]
        getter product_information_list : Array(Types::ProductInformation)?

        def initialize(
          @license_configuration_arn : String,
          @description : String? = nil,
          @disassociate_when_not_found : Bool? = nil,
          @license_configuration_status : String? = nil,
          @license_count : Int64? = nil,
          @license_count_hard_limit : Bool? = nil,
          @license_expiry : Int64? = nil,
          @license_rules : Array(String)? = nil,
          @name : String? = nil,
          @product_information_list : Array(Types::ProductInformation)? = nil
        )
        end
      end


      struct UpdateLicenseConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateLicenseManagerReportGeneratorRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Amazon Resource Name (ARN) of the report generator to update.

        @[JSON::Field(key: "LicenseManagerReportGeneratorArn")]
        getter license_manager_report_generator_arn : String

        # The report context.

        @[JSON::Field(key: "ReportContext")]
        getter report_context : Types::ReportContext

        # Frequency by which reports are generated.

        @[JSON::Field(key: "ReportFrequency")]
        getter report_frequency : Types::ReportFrequency

        # Name of the report generator.

        @[JSON::Field(key: "ReportGeneratorName")]
        getter report_generator_name : String

        # Type of reports to generate. The following report types are supported: License configuration report
        # - Reports the number and details of consumed licenses for a license configuration. Resource report -
        # Reports the tracked licenses and resource consumption for a license configuration.

        @[JSON::Field(key: "Type")]
        getter type : Array(String)

        # Description of the report generator.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @client_token : String,
          @license_manager_report_generator_arn : String,
          @report_context : Types::ReportContext,
          @report_frequency : Types::ReportFrequency,
          @report_generator_name : String,
          @type : Array(String),
          @description : String? = nil
        )
        end
      end


      struct UpdateLicenseManagerReportGeneratorResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateLicenseSpecificationsForResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Amazon Web Services resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # ARNs of the license configurations to add.

        @[JSON::Field(key: "AddLicenseSpecifications")]
        getter add_license_specifications : Array(Types::LicenseSpecification)?

        # ARNs of the license configurations to remove.

        @[JSON::Field(key: "RemoveLicenseSpecifications")]
        getter remove_license_specifications : Array(Types::LicenseSpecification)?

        def initialize(
          @resource_arn : String,
          @add_license_specifications : Array(Types::LicenseSpecification)? = nil,
          @remove_license_specifications : Array(Types::LicenseSpecification)? = nil
        )
        end
      end


      struct UpdateLicenseSpecificationsForResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateServiceSettingsRequest
        include JSON::Serializable

        # Activates cross-account discovery.

        @[JSON::Field(key: "EnableCrossAccountsDiscovery")]
        getter enable_cross_accounts_discovery : Bool?

        # Cross region discovery enabled source regions.

        @[JSON::Field(key: "EnabledDiscoverySourceRegions")]
        getter enabled_discovery_source_regions : Array(String)?

        # Enables integration with Organizations for cross-account discovery.

        @[JSON::Field(key: "OrganizationConfiguration")]
        getter organization_configuration : Types::OrganizationConfiguration?

        # Amazon Resource Name (ARN) of the Amazon S3 bucket where the License Manager information is stored.

        @[JSON::Field(key: "S3BucketArn")]
        getter s3_bucket_arn : String?

        # Amazon Resource Name (ARN) of the Amazon SNS topic used for License Manager alerts.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        def initialize(
          @enable_cross_accounts_discovery : Bool? = nil,
          @enabled_discovery_source_regions : Array(String)? = nil,
          @organization_configuration : Types::OrganizationConfiguration? = nil,
          @s3_bucket_arn : String? = nil,
          @sns_topic_arn : String? = nil
        )
        end
      end


      struct UpdateServiceSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The provided input is not valid. Try your request again.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
