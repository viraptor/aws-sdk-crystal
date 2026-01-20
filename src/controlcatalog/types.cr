require "json"
require "time"

module Aws
  module ControlCatalog
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A summary of the domain that a common control or an objective belongs to.

      struct AssociatedDomainSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the related domain.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the related domain.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A summary of the objective that a common control supports.

      struct AssociatedObjectiveSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the related objective.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the related objective.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # An optional filter that narrows the results to a specific objective.

      struct CommonControlFilter
        include JSON::Serializable

        # The objective that's used as filter criteria. You can use this parameter to specify one objective
        # ARN at a time. Passing multiple ARNs in the CommonControlFilter isn’t supported.

        @[JSON::Field(key: "Objectives")]
        getter objectives : Array(Types::ObjectiveResourceFilter)?

        def initialize(
          @objectives : Array(Types::ObjectiveResourceFilter)? = nil
        )
        end
      end

      # A structure that contains details about a common control mapping. In particular, it returns the
      # Amazon Resource Name (ARN) of the common control.

      struct CommonControlMappingDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the common control in the mapping.

        @[JSON::Field(key: "CommonControlArn")]
        getter common_control_arn : String

        def initialize(
          @common_control_arn : String
        )
        end
      end

      # A summary of metadata for a common control.

      struct CommonControlSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the common control.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The time when the common control was created.

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The description of the common control.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The domain that the common control belongs to.

        @[JSON::Field(key: "Domain")]
        getter domain : Types::AssociatedDomainSummary

        # The time when the common control was most recently updated.

        @[JSON::Field(key: "LastUpdateTime")]
        getter last_update_time : Time

        # The name of the common control.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The objective that the common control belongs to.

        @[JSON::Field(key: "Objective")]
        getter objective : Types::AssociatedObjectiveSummary

        def initialize(
          @arn : String,
          @create_time : Time,
          @description : String,
          @domain : Types::AssociatedDomainSummary,
          @last_update_time : Time,
          @name : String,
          @objective : Types::AssociatedObjectiveSummary
        )
        end
      end

      # A structure that defines filtering criteria for the ListControls operation. You can use this filter
      # to narrow down the list of controls based on their implementation details.

      struct ControlFilter
        include JSON::Serializable

        # A filter that narrows the results to controls with specific implementation types or identifiers.
        # This field allows you to find controls that are implemented by specific Amazon Web Services services
        # or with specific service identifiers.

        @[JSON::Field(key: "Implementations")]
        getter implementations : Types::ImplementationFilter?

        def initialize(
          @implementations : Types::ImplementationFilter? = nil
        )
        end
      end

      # A structure that contains information about a control mapping, including the control ARN, mapping
      # type, and mapping details.

      struct ControlMapping
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the control in the mapping.

        @[JSON::Field(key: "ControlArn")]
        getter control_arn : String

        # The details of the mapping relationship, for example, containing framework, common control, or
        # related control information.

        @[JSON::Field(key: "Mapping")]
        getter mapping : Types::Mapping

        # The type of mapping relationship between the control and other entities.

        @[JSON::Field(key: "MappingType")]
        getter mapping_type : String

        def initialize(
          @control_arn : String,
          @mapping : Types::Mapping,
          @mapping_type : String
        )
        end
      end

      # A structure that defines filtering criteria for the ListControlMappings operation. You can use this
      # filter to narrow down the list of control mappings based on control ARNs, common control ARNs, or
      # mapping types.

      struct ControlMappingFilter
        include JSON::Serializable

        # A list of common control ARNs to filter the mappings. When specified, only mappings associated with
        # these common controls are returned.

        @[JSON::Field(key: "CommonControlArns")]
        getter common_control_arns : Array(String)?

        # A list of control ARNs to filter the mappings. When specified, only mappings associated with these
        # controls are returned.

        @[JSON::Field(key: "ControlArns")]
        getter control_arns : Array(String)?

        # A list of mapping types to filter the mappings. When specified, only mappings of these types are
        # returned.

        @[JSON::Field(key: "MappingTypes")]
        getter mapping_types : Array(String)?

        def initialize(
          @common_control_arns : Array(String)? = nil,
          @control_arns : Array(String)? = nil,
          @mapping_types : Array(String)? = nil
        )
        end
      end

      # Five types of control parameters are supported. AllowedRegions : List of Amazon Web Services Regions
      # exempted from the control. Each string is expected to be an Amazon Web Services Region code. This
      # parameter is mandatory for the OU Region deny control, CT.MULTISERVICE.PV.1 . Example:
      # ["us-east-1","us-west-2"] ExemptedActions : List of Amazon Web Services IAM actions exempted from
      # the control. Each string is expected to be an IAM action. Example:
      # ["logs:DescribeLogGroups","logs:StartQuery","logs:GetQueryResults"] ExemptedPrincipalArns : List of
      # Amazon Web Services IAM principal ARNs exempted from the control. Each string is expected to be an
      # IAM principal that follows the pattern ^arn:(aws|aws-us-gov):(iam|sts)::.+:.+$ Example:
      # ["arn:aws:iam::*:role/ReadOnly","arn:aws:sts::*:assumed-role/ReadOnly/*"] ExemptedResourceArns :
      # List of resource ARNs exempted from the control. Each string is expected to be a resource ARN.
      # Example: ["arn:aws:s3:::my-bucket-name"] ExemptAssumeRoot : A parameter that lets you choose whether
      # to exempt requests made with AssumeRoot from this control, for this OU. For member accounts, the
      # AssumeRoot property is included in requests initiated by IAM centralized root access. This parameter
      # applies only to the AWS-GR_RESTRICT_ROOT_USER control. If you add the parameter when enabling the
      # control, the AssumeRoot exemption is allowed. If you omit the parameter, the AssumeRoot exception is
      # not permitted. The parameter does not accept False as a value. Example: Enabling the control and
      # allowing AssumeRoot { "controlIdentifier":
      # "arn:aws:controlcatalog:::control/5kvme4m5d2b4d7if2fs5yg2ui", "parameters": [ { "key":
      # "ExemptAssumeRoot", "value": true } ], "targetIdentifier":
      # "arn:aws:organizations::8633900XXXXX:ou/o-6jmn81636m/ou-qsah-jtiihcla" }

      struct ControlParameter
        include JSON::Serializable

        # The parameter name. This name is the parameter key when you call EnableControl or
        # UpdateEnabledControl .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Overview of information about a control.

      struct ControlSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the control.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A description of the control, as it may appear in the console. Describes the functionality of the
        # control.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The display name of the control.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of alternative identifiers for the control. These are human-readable designators, such as
        # SH.S3.1 . Several aliases can refer to the same control across different Amazon Web Services
        # services or compliance frameworks.

        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(String)?

        # An enumerated type, with the following possible values:

        @[JSON::Field(key: "Behavior")]
        getter behavior : String?

        # A timestamp that notes the time when the control was released (start of its life) as a governance
        # capability in Amazon Web Services.

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time?

        # A list of Amazon Web Services resource types that are governed by this control. This information
        # helps you understand which controls can govern certain types of resources, and conversely, which
        # resources are affected when the control is implemented. The resources are represented as Amazon Web
        # Services CloudFormation resource types. If GovernedResources cannot be represented by available
        # CloudFormation resource types, it’s returned as an empty list.

        @[JSON::Field(key: "GovernedResources")]
        getter governed_resources : Array(String)?

        # An object of type ImplementationSummary that describes how the control is implemented.

        @[JSON::Field(key: "Implementation")]
        getter implementation : Types::ImplementationSummary?

        # An enumerated type, with the following possible values:

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        def initialize(
          @arn : String,
          @description : String,
          @name : String,
          @aliases : Array(String)? = nil,
          @behavior : String? = nil,
          @create_time : Time? = nil,
          @governed_resources : Array(String)? = nil,
          @implementation : Types::ImplementationSummary? = nil,
          @severity : String? = nil
        )
        end
      end

      # The domain resource that's being used as a filter.

      struct DomainResourceFilter
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # A summary of metadata for a domain.

      struct DomainSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the domain.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The time when the domain was created.

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The description of the domain.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The time when the domain was most recently updated.

        @[JSON::Field(key: "LastUpdateTime")]
        getter last_update_time : Time

        # The name of the domain.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @arn : String,
          @create_time : Time,
          @description : String,
          @last_update_time : Time,
          @name : String
        )
        end
      end

      # A structure that contains details about a framework mapping, including the framework name and
      # specific item within the framework that the control maps to.

      struct FrameworkMappingDetails
        include JSON::Serializable

        # The specific item or requirement within the framework that the control maps to.

        @[JSON::Field(key: "Item")]
        getter item : String

        # The name of the compliance framework that the control maps to.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @item : String,
          @name : String
        )
        end
      end


      struct GetControlRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the control. It has one of the following formats: Global format
        # arn:{PARTITION}:controlcatalog:::control/{CONTROL_CATALOG_OPAQUE_ID} Or Regional format
        # arn:{PARTITION}:controltower:{REGION}::control/{CONTROL_TOWER_OPAQUE_ID} Here is a more general
        # pattern that covers Amazon Web Services Control Tower and Control Catalog ARNs:
        # ^arn:(aws(?:[-a-z]*)?):(controlcatalog|controltower):[a-zA-Z0-9-]*::control/[0-9a-zA-Z_\\-]+$

        @[JSON::Field(key: "ControlArn")]
        getter control_arn : String

        def initialize(
          @control_arn : String
        )
        end
      end


      struct GetControlResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the control.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A term that identifies the control's functional behavior. One of Preventive , Detective , Proactive

        @[JSON::Field(key: "Behavior")]
        getter behavior : String

        # A description of what the control does.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The display name of the control.

        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "RegionConfiguration")]
        getter region_configuration : Types::RegionConfiguration

        # A list of alternative identifiers for the control. These are human-readable designators, such as
        # SH.S3.1 . Several aliases can refer to the same control across different Amazon Web Services
        # services or compliance frameworks.

        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(String)?

        # A timestamp that notes the time when the control was released (start of its life) as a governance
        # capability in Amazon Web Services.

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time?

        # A list of Amazon Web Services resource types that are governed by this control. This information
        # helps you understand which controls can govern certain types of resources, and conversely, which
        # resources are affected when the control is implemented. The resources are represented as Amazon Web
        # Services CloudFormation resource types. If GovernedResources cannot be represented by available
        # CloudFormation resource types, it’s returned as an empty list.

        @[JSON::Field(key: "GovernedResources")]
        getter governed_resources : Array(String)?

        # Returns information about the control, as an ImplementationDetails object that shows the underlying
        # implementation type for a control.

        @[JSON::Field(key: "Implementation")]
        getter implementation : Types::ImplementationDetails?

        # Returns an array of ControlParameter objects that specify the parameters a control supports. An
        # empty list is returned for controls that don’t support parameters.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::ControlParameter)?

        # An enumerated type, with the following possible values:

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        def initialize(
          @arn : String,
          @behavior : String,
          @description : String,
          @name : String,
          @region_configuration : Types::RegionConfiguration,
          @aliases : Array(String)? = nil,
          @create_time : Time? = nil,
          @governed_resources : Array(String)? = nil,
          @implementation : Types::ImplementationDetails? = nil,
          @parameters : Array(Types::ControlParameter)? = nil,
          @severity : String? = nil
        )
        end
      end

      # An object that describes the implementation type for a control. Our ImplementationDetails Type
      # format has three required segments: SERVICE-PROVIDER::SERVICE-NAME::RESOURCE-NAME For example,
      # AWS::Config::ConfigRule or AWS::SecurityHub::SecurityControl resources have the format with three
      # required segments. Our ImplementationDetails Type format has an optional fourth segment, which is
      # present for applicable implementation types. The format is as follows:
      # SERVICE-PROVIDER::SERVICE-NAME::RESOURCE-NAME::RESOURCE-TYPE-DESCRIPTION For example,
      # AWS::Organizations::Policy::SERVICE_CONTROL_POLICY or AWS::CloudFormation::Type::HOOK have the
      # format with four segments. Although the format is similar, the values for the Type field do not
      # match any Amazon Web Services CloudFormation values.

      struct ImplementationDetails
        include JSON::Serializable

        # A string that describes a control's implementation type.

        @[JSON::Field(key: "Type")]
        getter type : String

        # A service-specific identifier for the control, assigned by the service that implemented the control.
        # For example, this identifier could be an Amazon Web Services Config Rule ID or a Security Hub
        # Control ID.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        def initialize(
          @type : String,
          @identifier : String? = nil
        )
        end
      end

      # A structure that defines filtering criteria for control implementations. You can use this filter to
      # find controls that are implemented by specific Amazon Web Services services or with specific service
      # identifiers.

      struct ImplementationFilter
        include JSON::Serializable

        # A list of service-specific identifiers that can serve as filters. For example, you can filter for
        # controls with specific Amazon Web Services Config Rule IDs or Security Hub Control IDs.

        @[JSON::Field(key: "Identifiers")]
        getter identifiers : Array(String)?

        # A list of implementation types that can serve as filters. For example, you can filter for controls
        # implemented as Amazon Web Services Config Rules by specifying AWS::Config::ConfigRule as a type.

        @[JSON::Field(key: "Types")]
        getter types : Array(String)?

        def initialize(
          @identifiers : Array(String)? = nil,
          @types : Array(String)? = nil
        )
        end
      end

      # A summary of how the control is implemented, including the Amazon Web Services service that enforces
      # the control and its service-specific identifier. For example, the value of this field could indicate
      # that the control is implemented as an Amazon Web Services Config Rule or an Amazon Web Services
      # Security Hub control.

      struct ImplementationSummary
        include JSON::Serializable

        # A string that represents the Amazon Web Services service that implements this control. For example,
        # a value of AWS::Config::ConfigRule indicates that the control is implemented by Amazon Web Services
        # Config, and AWS::SecurityHub::SecurityControl indicates implementation by Amazon Web Services
        # Security Hub.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The identifier originally assigned by the Amazon Web Services service that implements the control.
        # For example, CODEPIPELINE_DEPLOYMENT_COUNT_CHECK .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        def initialize(
          @type : String,
          @identifier : String? = nil
        )
        end
      end

      # An internal service error occurred during the processing of your request. Try again later.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListCommonControlsRequest
        include JSON::Serializable

        # An optional filter that narrows the results to a specific objective. This filter allows you to
        # specify one objective ARN at a time. Passing multiple ARNs in the CommonControlFilter isn’t
        # supported.

        @[JSON::Field(key: "CommonControlFilter")]
        getter common_control_filter : Types::CommonControlFilter?

        # The maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @common_control_filter : Types::CommonControlFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCommonControlsResponse
        include JSON::Serializable

        # The list of common controls that the ListCommonControls API returns.

        @[JSON::Field(key: "CommonControls")]
        getter common_controls : Array(Types::CommonControlSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @common_controls : Array(Types::CommonControlSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListControlMappingsRequest
        include JSON::Serializable

        # An optional filter that narrows the results to specific control mappings based on control ARNs,
        # common control ARNs, or mapping types.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ControlMappingFilter?

        # The maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ControlMappingFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListControlMappingsResponse
        include JSON::Serializable

        # The list of control mappings that the ListControlMappings API returns.

        @[JSON::Field(key: "ControlMappings")]
        getter control_mappings : Array(Types::ControlMapping)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @control_mappings : Array(Types::ControlMapping),
          @next_token : String? = nil
        )
        end
      end


      struct ListControlsRequest
        include JSON::Serializable

        # An optional filter that narrows the results to controls with specific implementation types or
        # identifiers. If you don't provide a filter, the operation returns all available controls.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ControlFilter?

        # The maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ControlFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListControlsResponse
        include JSON::Serializable

        # Returns a list of controls, given as structures of type controlSummary .

        @[JSON::Field(key: "Controls")]
        getter controls : Array(Types::ControlSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @controls : Array(Types::ControlSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainsRequest
        include JSON::Serializable

        # The maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainsResponse
        include JSON::Serializable

        # The list of domains that the ListDomains API returns.

        @[JSON::Field(key: "Domains")]
        getter domains : Array(Types::DomainSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domains : Array(Types::DomainSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListObjectivesRequest
        include JSON::Serializable

        # The maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An optional filter that narrows the results to a specific domain. This filter allows you to specify
        # one domain ARN at a time. Passing multiple ARNs in the ObjectiveFilter isn’t supported.

        @[JSON::Field(key: "ObjectiveFilter")]
        getter objective_filter : Types::ObjectiveFilter?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @objective_filter : Types::ObjectiveFilter? = nil
        )
        end
      end


      struct ListObjectivesResponse
        include JSON::Serializable

        # The list of objectives that the ListObjectives API returns.

        @[JSON::Field(key: "Objectives")]
        getter objectives : Array(Types::ObjectiveSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @objectives : Array(Types::ObjectiveSummary),
          @next_token : String? = nil
        )
        end
      end

      # A structure that contains the details of a mapping relationship, which can be either to a framework
      # or to a common control.

      struct Mapping
        include JSON::Serializable

        # The common control mapping details when the mapping type relates to a common control.

        @[JSON::Field(key: "CommonControl")]
        getter common_control : Types::CommonControlMappingDetails?

        # The framework mapping details when the mapping type relates to a compliance framework.

        @[JSON::Field(key: "Framework")]
        getter framework : Types::FrameworkMappingDetails?

        # Returns information about controls that are related to the specified control.

        @[JSON::Field(key: "RelatedControl")]
        getter related_control : Types::RelatedControlMappingDetails?

        def initialize(
          @common_control : Types::CommonControlMappingDetails? = nil,
          @framework : Types::FrameworkMappingDetails? = nil,
          @related_control : Types::RelatedControlMappingDetails? = nil
        )
        end
      end

      # An optional filter that narrows the list of objectives to a specific domain.

      struct ObjectiveFilter
        include JSON::Serializable

        # The domain that's used as filter criteria. You can use this parameter to specify one domain ARN at a
        # time. Passing multiple ARNs in the ObjectiveFilter isn’t supported.

        @[JSON::Field(key: "Domains")]
        getter domains : Array(Types::DomainResourceFilter)?

        def initialize(
          @domains : Array(Types::DomainResourceFilter)? = nil
        )
        end
      end

      # The objective resource that's being used as a filter.

      struct ObjectiveResourceFilter
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the objective.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # A summary of metadata for an objective.

      struct ObjectiveSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the objective.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The time when the objective was created.

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The description of the objective.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The domain that the objective belongs to.

        @[JSON::Field(key: "Domain")]
        getter domain : Types::AssociatedDomainSummary

        # The time when the objective was most recently updated.

        @[JSON::Field(key: "LastUpdateTime")]
        getter last_update_time : Time

        # The name of the objective.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @arn : String,
          @create_time : Time,
          @description : String,
          @domain : Types::AssociatedDomainSummary,
          @last_update_time : Time,
          @name : String
        )
        end
      end

      # Returns information about the control, including the scope of the control, if enabled, and the
      # Regions in which the control is available for deployment. For more information about scope, see
      # Global services . If you are applying controls through an Amazon Web Services Control Tower landing
      # zone environment, remember that the values returned in the RegionConfiguration API operation are not
      # related to the governed Regions in your landing zone. For example, if you are governing Regions A ,
      # B ,and C while the control is available in Regions A , B , C , and D , you'd see a response with
      # DeployableRegions of A , B , C , and D for a control with REGIONAL scope, even though you may not
      # intend to deploy the control in Region D , because you do not govern it through your landing zone.

      struct RegionConfiguration
        include JSON::Serializable

        # The coverage of the control, if deployed. Scope is an enumerated type, with value Regional , or
        # Global . A control with Global scope is effective in all Amazon Web Services Regions, regardless of
        # the Region from which it is enabled, or to which it is deployed. A control implemented by an SCP is
        # usually Global in scope. A control with Regional scope has operations that are restricted
        # specifically to the Region from which it is enabled and to which it is deployed. Controls
        # implemented by Config rules and CloudFormation hooks usually are Regional in scope. Security Hub
        # controls usually are Regional in scope.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # Regions in which the control is available to be deployed.

        @[JSON::Field(key: "DeployableRegions")]
        getter deployable_regions : Array(String)?

        def initialize(
          @scope : String,
          @deployable_regions : Array(String)? = nil
        )
        end
      end

      # A structure that describes a control's relationship status with other controls.

      struct RelatedControlMappingDetails
        include JSON::Serializable

        # Returns an enumerated value that represents the relationship between two or more controls.

        @[JSON::Field(key: "RelationType")]
        getter relation_type : String

        # The unique identifier of a control.

        @[JSON::Field(key: "ControlArn")]
        getter control_arn : String?

        def initialize(
          @relation_type : String,
          @control_arn : String? = nil
        )
        end
      end

      # The requested resource does not exist.

      struct ResourceNotFoundException
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

      # The request has invalid or missing parameters.

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
