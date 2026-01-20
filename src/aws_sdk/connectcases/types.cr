require "json"
require "time"

module AwsSdk
  module ConnectCases
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Represents the content of a particular audit event.

      struct AuditEvent
        include JSON::Serializable

        # Unique identifier of a case audit history event.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # A list of Case Audit History event fields.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::AuditEventField)

        # Time at which an Audit History event took place.

        @[JSON::Field(key: "performedTime")]
        getter performed_time : Time

        # The Type of an audit history event.

        @[JSON::Field(key: "type")]
        getter type : String

        # Information of the user which performed the audit.

        @[JSON::Field(key: "performedBy")]
        getter performed_by : Types::AuditEventPerformedBy?

        # The Type of the related item.

        @[JSON::Field(key: "relatedItemType")]
        getter related_item_type : String?

        def initialize(
          @event_id : String,
          @fields : Array(Types::AuditEventField),
          @performed_time : Time,
          @type : String,
          @performed_by : Types::AuditEventPerformedBy? = nil,
          @related_item_type : String? = nil
        )
        end
      end

      # Fields for audit event.

      struct AuditEventField
        include JSON::Serializable

        # Unique identifier of field in an Audit History entry.

        @[JSON::Field(key: "eventFieldId")]
        getter event_field_id : String

        # Union of potential field value types.

        @[JSON::Field(key: "newValue")]
        getter new_value : Types::AuditEventFieldValueUnion

        # Union of potential field value types.

        @[JSON::Field(key: "oldValue")]
        getter old_value : Types::AuditEventFieldValueUnion?

        def initialize(
          @event_field_id : String,
          @new_value : Types::AuditEventFieldValueUnion,
          @old_value : Types::AuditEventFieldValueUnion? = nil
        )
        end
      end

      # Object to store union of Field values.

      struct AuditEventFieldValueUnion
        include JSON::Serializable

        # Can be either null, or have a Boolean value type. Only one value can be provided.

        @[JSON::Field(key: "booleanValue")]
        getter boolean_value : Bool?

        # Can be either null, or have a Double value type. Only one value can be provided.

        @[JSON::Field(key: "doubleValue")]
        getter double_value : Float64?


        @[JSON::Field(key: "emptyValue")]
        getter empty_value : Types::EmptyFieldValue?

        # Can be either null, or have a String value type. Only one value can be provided.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        # Can be either null, or have a String value type formatted as an ARN. Only one value can be provided.

        @[JSON::Field(key: "userArnValue")]
        getter user_arn_value : String?

        def initialize(
          @boolean_value : Bool? = nil,
          @double_value : Float64? = nil,
          @empty_value : Types::EmptyFieldValue? = nil,
          @string_value : String? = nil,
          @user_arn_value : String? = nil
        )
        end
      end

      # Information of the user which performed the audit.

      struct AuditEventPerformedBy
        include JSON::Serializable

        # Unique identifier of an IAM role.

        @[JSON::Field(key: "iamPrincipalArn")]
        getter iam_principal_arn : String


        @[JSON::Field(key: "user")]
        getter user : Types::UserUnion?

        def initialize(
          @iam_principal_arn : String,
          @user : Types::UserUnion? = nil
        )
        end
      end

      # Content specific to BasicLayout type. It configures fields in the top panel and More Info tab of
      # agent application.

      struct BasicLayout
        include JSON::Serializable

        # This represents sections in a tab of the page layout.

        @[JSON::Field(key: "moreInfo")]
        getter more_info : Types::LayoutSections?

        # This represents sections in a panel of the page layout.

        @[JSON::Field(key: "topPanel")]
        getter top_panel : Types::LayoutSections?

        def initialize(
          @more_info : Types::LayoutSections? = nil,
          @top_panel : Types::LayoutSections? = nil
        )
        end
      end


      struct BatchGetCaseRuleRequest
        include JSON::Serializable

        # A list of case rule identifiers.

        @[JSON::Field(key: "caseRules")]
        getter case_rules : Array(Types::CaseRuleIdentifier)

        # Unique identifier of a Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        def initialize(
          @case_rules : Array(Types::CaseRuleIdentifier),
          @domain_id : String
        )
        end
      end


      struct BatchGetCaseRuleResponse
        include JSON::Serializable

        # A list of detailed case rule information.

        @[JSON::Field(key: "caseRules")]
        getter case_rules : Array(Types::GetCaseRuleResponse)

        # A list of case rule errors.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::CaseRuleError)

        # A list of unprocessed case rule identifiers.

        @[JSON::Field(key: "unprocessedCaseRules")]
        getter unprocessed_case_rules : Array(String)?

        def initialize(
          @case_rules : Array(Types::GetCaseRuleResponse),
          @errors : Array(Types::CaseRuleError),
          @unprocessed_case_rules : Array(String)? = nil
        )
        end
      end


      struct BatchGetFieldRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # A list of unique field identifiers.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FieldIdentifier)

        def initialize(
          @domain_id : String,
          @fields : Array(Types::FieldIdentifier)
        )
        end
      end


      struct BatchGetFieldResponse
        include JSON::Serializable

        # A list of field errors.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::FieldError)

        # A list of detailed field information.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::GetFieldResponse)

        def initialize(
          @errors : Array(Types::FieldError),
          @fields : Array(Types::GetFieldResponse)
        )
        end
      end


      struct BatchPutFieldOptionsRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The unique identifier of a field.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String

        # A list of FieldOption objects.

        @[JSON::Field(key: "options")]
        getter options : Array(Types::FieldOption)

        def initialize(
          @domain_id : String,
          @field_id : String,
          @options : Array(Types::FieldOption)
        )
        end
      end


      struct BatchPutFieldOptionsResponse
        include JSON::Serializable

        # A list of field errors.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::FieldOptionError)?

        def initialize(
          @errors : Array(Types::FieldOptionError)? = nil
        )
        end
      end

      # Boolean condition for a rule. In the Amazon Connect admin website, case rules are known as case
      # field conditions . For more information about case field conditions, see Add case field conditions
      # to a case template .

      struct BooleanCondition
        include JSON::Serializable

        # Tests that operandOne is equal to operandTwo.

        @[JSON::Field(key: "equalTo")]
        getter equal_to : Types::BooleanOperands?

        # Tests that operandOne is not equal to operandTwo.

        @[JSON::Field(key: "notEqualTo")]
        getter not_equal_to : Types::BooleanOperands?

        def initialize(
          @equal_to : Types::BooleanOperands? = nil,
          @not_equal_to : Types::BooleanOperands? = nil
        )
        end
      end

      # Boolean operands for a condition. In the Amazon Connect admin website, case rules are known as case
      # field conditions . For more information about case field conditions, see Add case field conditions
      # to a case template .

      struct BooleanOperands
        include JSON::Serializable

        # Represents the left hand operand in the condition.

        @[JSON::Field(key: "operandOne")]
        getter operand_one : Types::OperandOne

        # Represents the right hand operand in the condition.

        @[JSON::Field(key: "operandTwo")]
        getter operand_two : Types::OperandTwo

        # The value of the outer rule if the condition evaluates to true.

        @[JSON::Field(key: "result")]
        getter result : Bool

        def initialize(
          @operand_one : Types::OperandOne,
          @operand_two : Types::OperandTwo,
          @result : Bool
        )
        end
      end

      # Details of what case data is published through the case event stream.

      struct CaseEventIncludedData
        include JSON::Serializable

        # List of field identifiers.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FieldIdentifier)

        def initialize(
          @fields : Array(Types::FieldIdentifier)
        )
        end
      end

      # A filter for cases. Only one value can be provided.

      struct CaseFilter
        include JSON::Serializable

        # Provides "and all" filtering.

        @[JSON::Field(key: "andAll")]
        getter and_all : Array(Types::CaseFilter)?

        # A list of fields to filter on.

        @[JSON::Field(key: "field")]
        getter field : Types::FieldFilter?


        @[JSON::Field(key: "not")]
        getter not : Types::CaseFilter?

        # Provides "or all" filtering.

        @[JSON::Field(key: "orAll")]
        getter or_all : Array(Types::CaseFilter)?

        def initialize(
          @and_all : Array(Types::CaseFilter)? = nil,
          @field : Types::FieldFilter? = nil,
          @not : Types::CaseFilter? = nil,
          @or_all : Array(Types::CaseFilter)? = nil
        )
        end
      end

      # Represents what rule type should take place, under what conditions. In the Amazon Connect admin
      # website, case rules are known as case field conditions . For more information about case field
      # conditions, see Add case field conditions to a case template .

      struct CaseRuleDetails
        include JSON::Serializable

        # Which options are available in a child field based on the selected value in a parent field.

        @[JSON::Field(key: "fieldOptions")]
        getter field_options : Types::FieldOptionsCaseRule?

        # Whether a field is visible, based on values in other fields.

        @[JSON::Field(key: "hidden")]
        getter hidden : Types::HiddenCaseRule?

        # Required rule type, used to indicate whether a field is required.

        @[JSON::Field(key: "required")]
        getter required : Types::RequiredCaseRule?

        def initialize(
          @field_options : Types::FieldOptionsCaseRule? = nil,
          @hidden : Types::HiddenCaseRule? = nil,
          @required : Types::RequiredCaseRule? = nil
        )
        end
      end

      # Error for batch describe case rules API failure. In the Amazon Connect admin website, case rules are
      # known as case field conditions . For more information about case field conditions, see Add case
      # field conditions to a case template .

      struct CaseRuleError
        include JSON::Serializable

        # Error code from getting a case rule.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The case rule identifier that caused the error.

        @[JSON::Field(key: "id")]
        getter id : String

        # Error message from getting a case rule.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @id : String,
          @message : String? = nil
        )
        end
      end

      # Object containing case rule identifier information.

      struct CaseRuleIdentifier
        include JSON::Serializable

        # Unique identifier of a case rule.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Summary information of this case rule. In the Amazon Connect admin website, case rules are known as
      # case field conditions . For more information about case field conditions, see Add case field
      # conditions to a case template .

      struct CaseRuleSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the case rule.

        @[JSON::Field(key: "caseRuleArn")]
        getter case_rule_arn : String

        # Unique identifier of a case rule.

        @[JSON::Field(key: "caseRuleId")]
        getter case_rule_id : String

        # Name of the case rule.

        @[JSON::Field(key: "name")]
        getter name : String

        # Possible types for a rule.

        @[JSON::Field(key: "ruleType")]
        getter rule_type : String

        # Description of a case rule.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @case_rule_arn : String,
          @case_rule_id : String,
          @name : String,
          @rule_type : String,
          @description : String? = nil
        )
        end
      end

      # Case summary information.

      struct CaseSummary
        include JSON::Serializable

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # A unique identifier of a template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        def initialize(
          @case_id : String,
          @template_id : String
        )
        end
      end

      # Represents the content of a Comment to be returned to agents.

      struct CommentContent
        include JSON::Serializable

        # Text in the body of a Comment on a case.

        @[JSON::Field(key: "body")]
        getter body : String

        # Type of the text in the box of a Comment on a case.

        @[JSON::Field(key: "contentType")]
        getter content_type : String

        def initialize(
          @body : String,
          @content_type : String
        )
        end
      end

      # A filter for related items of type Comment .

      struct CommentFilter
        include JSON::Serializable

        def initialize
        end
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request. See the accompanying
      # error message for details.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Represents the content of a ConnectCase type related item.

      struct ConnectCaseContent
        include JSON::Serializable

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        def initialize(
          @case_id : String
        )
        end
      end

      # A filter for related items of type ConnectCase .

      struct ConnectCaseFilter
        include JSON::Serializable

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String?

        def initialize(
          @case_id : String? = nil
        )
        end
      end

      # Represents the content of a ConnectCase related item.

      struct ConnectCaseInputContent
        include JSON::Serializable

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        def initialize(
          @case_id : String
        )
        end
      end

      # An object that represents an Amazon Connect contact object.

      struct Contact
        include JSON::Serializable

        # A unique identifier of a contact in Amazon Connect.

        @[JSON::Field(key: "contactArn")]
        getter contact_arn : String

        def initialize(
          @contact_arn : String
        )
        end
      end

      # An object that represents a content of an Amazon Connect contact object.

      struct ContactContent
        include JSON::Serializable

        # A list of channels to filter on for related items of type Contact .

        @[JSON::Field(key: "channel")]
        getter channel : String

        # The difference between the InitiationTimestamp and the DisconnectTimestamp of the contact.

        @[JSON::Field(key: "connectedToSystemTime")]
        getter connected_to_system_time : Time

        # A unique identifier of a contact in Amazon Connect.

        @[JSON::Field(key: "contactArn")]
        getter contact_arn : String

        def initialize(
          @channel : String,
          @connected_to_system_time : Time,
          @contact_arn : String
        )
        end
      end

      # A filter for related items of type Contact .

      struct ContactFilter
        include JSON::Serializable

        # A list of channels to filter on for related items of type Contact .

        @[JSON::Field(key: "channel")]
        getter channel : Array(String)?

        # A unique identifier of a contact in Amazon Connect.

        @[JSON::Field(key: "contactArn")]
        getter contact_arn : String?

        def initialize(
          @channel : Array(String)? = nil,
          @contact_arn : String? = nil
        )
        end
      end


      struct CreateCaseRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # An array of objects with field ID (matching ListFields/DescribeField) and value union data.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FieldValue)

        # A unique identifier of a template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "performedBy")]
        getter performed_by : Types::UserUnion?

        def initialize(
          @domain_id : String,
          @fields : Array(Types::FieldValue),
          @template_id : String,
          @client_token : String? = nil,
          @performed_by : Types::UserUnion? = nil
        )
        end
      end


      struct CreateCaseResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the case.

        @[JSON::Field(key: "caseArn")]
        getter case_arn : String

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        def initialize(
          @case_arn : String,
          @case_id : String
        )
        end
      end


      struct CreateCaseRuleRequest
        include JSON::Serializable

        # Unique identifier of a Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # Name of the case rule.

        @[JSON::Field(key: "name")]
        getter name : String

        # Represents what rule type should take place, under what conditions.

        @[JSON::Field(key: "rule")]
        getter rule : Types::CaseRuleDetails

        # The description of a case rule.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @domain_id : String,
          @name : String,
          @rule : Types::CaseRuleDetails,
          @description : String? = nil
        )
        end
      end


      struct CreateCaseRuleResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a case rule.

        @[JSON::Field(key: "caseRuleArn")]
        getter case_rule_arn : String

        # Unique identifier of a case rule.

        @[JSON::Field(key: "caseRuleId")]
        getter case_rule_id : String

        def initialize(
          @case_rule_arn : String,
          @case_rule_id : String
        )
        end
      end


      struct CreateDomainRequest
        include JSON::Serializable

        # The name for your Cases domain. It must be unique for your Amazon Web Services account.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct CreateDomainResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Cases domain.

        @[JSON::Field(key: "domainArn")]
        getter domain_arn : String

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The status of the domain.

        @[JSON::Field(key: "domainStatus")]
        getter domain_status : String

        def initialize(
          @domain_arn : String,
          @domain_id : String,
          @domain_status : String
        )
        end
      end


      struct CreateFieldRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The name of the field.

        @[JSON::Field(key: "name")]
        getter name : String

        # Defines the data type, some system constraints, and default display of the field.

        @[JSON::Field(key: "type")]
        getter type : String

        # The description of the field.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @domain_id : String,
          @name : String,
          @type : String,
          @description : String? = nil
        )
        end
      end


      struct CreateFieldResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the field.

        @[JSON::Field(key: "fieldArn")]
        getter field_arn : String

        # The unique identifier of a field.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String

        def initialize(
          @field_arn : String,
          @field_id : String
        )
        end
      end


      struct CreateLayoutRequest
        include JSON::Serializable

        # Information about which fields will be present in the layout, and information about the order of the
        # fields.

        @[JSON::Field(key: "content")]
        getter content : Types::LayoutContent

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The name of the layout. It must be unique for the Cases domain.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @content : Types::LayoutContent,
          @domain_id : String,
          @name : String
        )
        end
      end


      struct CreateLayoutResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the newly created layout.

        @[JSON::Field(key: "layoutArn")]
        getter layout_arn : String

        # The unique identifier of the layout.

        @[JSON::Field(key: "layoutId")]
        getter layout_id : String

        def initialize(
          @layout_arn : String,
          @layout_id : String
        )
        end
      end


      struct CreateRelatedItemRequest
        include JSON::Serializable

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # The content of a related item to be created.

        @[JSON::Field(key: "content")]
        getter content : Types::RelatedItemInputContent

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The type of a related item.

        @[JSON::Field(key: "type")]
        getter type : String

        # Represents the creator of the related item.

        @[JSON::Field(key: "performedBy")]
        getter performed_by : Types::UserUnion?

        def initialize(
          @case_id : String,
          @content : Types::RelatedItemInputContent,
          @domain_id : String,
          @type : String,
          @performed_by : Types::UserUnion? = nil
        )
        end
      end


      struct CreateRelatedItemResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the related item.

        @[JSON::Field(key: "relatedItemArn")]
        getter related_item_arn : String

        # The unique identifier of the related item.

        @[JSON::Field(key: "relatedItemId")]
        getter related_item_id : String

        def initialize(
          @related_item_arn : String,
          @related_item_id : String
        )
        end
      end


      struct CreateTemplateRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # A name for the template. It must be unique per domain.

        @[JSON::Field(key: "name")]
        getter name : String

        # A brief description of the template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Configuration of layouts associated to the template.

        @[JSON::Field(key: "layoutConfiguration")]
        getter layout_configuration : Types::LayoutConfiguration?

        # A list of fields that must contain a value for a case to be successfully created with this template.

        @[JSON::Field(key: "requiredFields")]
        getter required_fields : Array(Types::RequiredField)?

        # A list of case rules (also known as case field conditions ) on a template.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::TemplateRule)?

        # The status of the template.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_id : String,
          @name : String,
          @description : String? = nil,
          @layout_configuration : Types::LayoutConfiguration? = nil,
          @required_fields : Array(Types::RequiredField)? = nil,
          @rules : Array(Types::TemplateRule)? = nil,
          @status : String? = nil
        )
        end
      end


      struct CreateTemplateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the newly created template.

        @[JSON::Field(key: "templateArn")]
        getter template_arn : String

        # A unique identifier of a template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        def initialize(
          @template_arn : String,
          @template_id : String
        )
        end
      end

      # Represents the content of a Custom type related item.

      struct CustomContent
        include JSON::Serializable

        # List of field values for the Custom related item.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FieldValue)

        def initialize(
          @fields : Array(Types::FieldValue)
        )
        end
      end

      # A filter for fields in Custom type related items. Only one value can be provided.

      struct CustomFieldsFilter
        include JSON::Serializable

        # Provides "and all" filtering.

        @[JSON::Field(key: "andAll")]
        getter and_all : Array(Types::CustomFieldsFilter)?


        @[JSON::Field(key: "field")]
        getter field : Types::FieldFilter?

        # Excludes items matching the filter.

        @[JSON::Field(key: "not")]
        getter not : Types::CustomFieldsFilter?

        # Provides "or all" filtering.

        @[JSON::Field(key: "orAll")]
        getter or_all : Array(Types::CustomFieldsFilter)?

        def initialize(
          @and_all : Array(Types::CustomFieldsFilter)? = nil,
          @field : Types::FieldFilter? = nil,
          @not : Types::CustomFieldsFilter? = nil,
          @or_all : Array(Types::CustomFieldsFilter)? = nil
        )
        end
      end

      # A filter for related items of type Custom .

      struct CustomFilter
        include JSON::Serializable

        # Filter conditions for custom fields.

        @[JSON::Field(key: "fields")]
        getter fields : Types::CustomFieldsFilter?

        def initialize(
          @fields : Types::CustomFieldsFilter? = nil
        )
        end
      end

      # Represents the content of a Custom related item.

      struct CustomInputContent
        include JSON::Serializable

        # List of field values for the Custom related item.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FieldValue)

        def initialize(
          @fields : Array(Types::FieldValue)
        )
        end
      end


      struct DeleteCaseRequest
        include JSON::Serializable

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # A unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        def initialize(
          @case_id : String,
          @domain_id : String
        )
        end
      end


      struct DeleteCaseResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteCaseRuleRequest
        include JSON::Serializable

        # Unique identifier of a case rule.

        @[JSON::Field(key: "caseRuleId")]
        getter case_rule_id : String

        # Unique identifier of a Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        def initialize(
          @case_rule_id : String,
          @domain_id : String
        )
        end
      end


      struct DeleteCaseRuleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDomainRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        def initialize(
          @domain_id : String
        )
        end
      end


      struct DeleteDomainResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteFieldRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # Unique identifier of the field.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String

        def initialize(
          @domain_id : String,
          @field_id : String
        )
        end
      end


      struct DeleteFieldResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLayoutRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The unique identifier of the layout.

        @[JSON::Field(key: "layoutId")]
        getter layout_id : String

        def initialize(
          @domain_id : String,
          @layout_id : String
        )
        end
      end


      struct DeleteLayoutResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRelatedItemRequest
        include JSON::Serializable

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # A unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # A unique identifier of a related item.

        @[JSON::Field(key: "relatedItemId")]
        getter related_item_id : String

        def initialize(
          @case_id : String,
          @domain_id : String,
          @related_item_id : String
        )
        end
      end


      struct DeleteRelatedItemResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteTemplateRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # A unique identifier of a template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        def initialize(
          @domain_id : String,
          @template_id : String
        )
        end
      end


      struct DeleteTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Object for the summarized details of the domain.

      struct DomainSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain.

        @[JSON::Field(key: "domainArn")]
        getter domain_arn : String

        # The unique identifier of the domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The name of the domain.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @domain_arn : String,
          @domain_id : String,
          @name : String
        )
        end
      end

      # An empty value. You cannot set EmptyFieldValue on a field that is required on a case template. This
      # structure will never have any data members. It signifies an empty value on a case field.

      struct EmptyFieldValue
        include JSON::Serializable

        def initialize
        end
      end

      # Represents an empty operand value. In the Amazon Connect admin website, case rules are known as case
      # field conditions . For more information about case field conditions, see Add case field conditions
      # to a case template .

      struct EmptyOperandValue
        include JSON::Serializable

        def initialize
        end
      end

      # Configuration to enable EventBridge case event delivery and determine what data is delivered.

      struct EventBridgeConfiguration
        include JSON::Serializable

        # Indicates whether the to broadcast case event data to the customer.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # Details of what case and related item data is published through the case event stream.

        @[JSON::Field(key: "includedData")]
        getter included_data : Types::EventIncludedData?

        def initialize(
          @enabled : Bool,
          @included_data : Types::EventIncludedData? = nil
        )
        end
      end

      # Details of what case and related item data is published through the case event stream.

      struct EventIncludedData
        include JSON::Serializable

        # Details of what case data is published through the case event stream.

        @[JSON::Field(key: "caseData")]
        getter case_data : Types::CaseEventIncludedData?

        # Details of what related item data is published through the case event stream.

        @[JSON::Field(key: "relatedItemData")]
        getter related_item_data : Types::RelatedItemEventIncludedData?

        def initialize(
          @case_data : Types::CaseEventIncludedData? = nil,
          @related_item_data : Types::RelatedItemEventIncludedData? = nil
        )
        end
      end

      # Object for errors on fields.

      struct FieldError
        include JSON::Serializable

        # The error code from getting a field.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The field identifier that caused the error.

        @[JSON::Field(key: "id")]
        getter id : String

        # The error message from getting a field.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @id : String,
          @message : String? = nil
        )
        end
      end

      # A filter for fields. Only one value can be provided.

      struct FieldFilter
        include JSON::Serializable

        # Object containing field identifier and value information.

        @[JSON::Field(key: "contains")]
        getter contains : Types::FieldValue?

        # Object containing field identifier and value information.

        @[JSON::Field(key: "equalTo")]
        getter equal_to : Types::FieldValue?

        # Object containing field identifier and value information.

        @[JSON::Field(key: "greaterThan")]
        getter greater_than : Types::FieldValue?

        # Object containing field identifier and value information.

        @[JSON::Field(key: "greaterThanOrEqualTo")]
        getter greater_than_or_equal_to : Types::FieldValue?

        # Object containing field identifier and value information.

        @[JSON::Field(key: "lessThan")]
        getter less_than : Types::FieldValue?

        # Object containing field identifier and value information.

        @[JSON::Field(key: "lessThanOrEqualTo")]
        getter less_than_or_equal_to : Types::FieldValue?

        def initialize(
          @contains : Types::FieldValue? = nil,
          @equal_to : Types::FieldValue? = nil,
          @greater_than : Types::FieldValue? = nil,
          @greater_than_or_equal_to : Types::FieldValue? = nil,
          @less_than : Types::FieldValue? = nil,
          @less_than_or_equal_to : Types::FieldValue? = nil
        )
        end
      end

      # Object for a group of fields and associated properties.

      struct FieldGroup
        include JSON::Serializable

        # Represents an ordered list containing field related information.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FieldItem)

        # Name of the field group.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @fields : Array(Types::FieldItem),
          @name : String? = nil
        )
        end
      end

      # Object for unique identifier of a field.

      struct FieldIdentifier
        include JSON::Serializable

        # Unique identifier of a field.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Object for field related information.

      struct FieldItem
        include JSON::Serializable

        # Unique identifier of a field.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Object for field Options information.

      struct FieldOption
        include JSON::Serializable

        # Describes whether the FieldOption is active (displayed) or inactive.

        @[JSON::Field(key: "active")]
        getter active : Bool

        # FieldOptionName has max length 100 and disallows trailing spaces.

        @[JSON::Field(key: "name")]
        getter name : String

        # FieldOptionValue has max length 100 and must be alphanumeric with hyphens and underscores.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @active : Bool,
          @name : String,
          @value : String
        )
        end
      end

      # Object for field Options errors.

      struct FieldOptionError
        include JSON::Serializable

        # Error code from creating or updating field option.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # Error message from creating or updating field option.

        @[JSON::Field(key: "message")]
        getter message : String

        # The field option value that caused the error.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @error_code : String,
          @message : String,
          @value : String
        )
        end
      end

      # Rules that control which options are available in a child field based on the selected value in a
      # parent field.

      struct FieldOptionsCaseRule
        include JSON::Serializable

        # A mapping between a parent field option value and child field option values.

        @[JSON::Field(key: "parentChildFieldOptionsMappings")]
        getter parent_child_field_options_mappings : Array(Types::ParentChildFieldOptionsMapping)

        # The identifier of the child field whose options are controlled.

        @[JSON::Field(key: "childFieldId")]
        getter child_field_id : String?

        # The identifier of the parent field that controls options.

        @[JSON::Field(key: "parentFieldId")]
        getter parent_field_id : String?

        def initialize(
          @parent_child_field_options_mappings : Array(Types::ParentChildFieldOptionsMapping),
          @child_field_id : String? = nil,
          @parent_field_id : String? = nil
        )
        end
      end

      # Object for the summarized details of the field.

      struct FieldSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the field.

        @[JSON::Field(key: "fieldArn")]
        getter field_arn : String

        # The unique identifier of a field.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String

        # Name of the field.

        @[JSON::Field(key: "name")]
        getter name : String

        # The namespace of a field.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The type of a field.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @field_arn : String,
          @field_id : String,
          @name : String,
          @namespace : String,
          @type : String
        )
        end
      end

      # Object for case field values.

      struct FieldValue
        include JSON::Serializable

        # Unique identifier of a field.

        @[JSON::Field(key: "id")]
        getter id : String

        # Union of potential field value types.

        @[JSON::Field(key: "value")]
        getter value : Types::FieldValueUnion

        def initialize(
          @id : String,
          @value : Types::FieldValueUnion
        )
        end
      end

      # Object to store union of Field values. The Summary system field accepts 3000 characters while all
      # other fields accept 500 characters.

      struct FieldValueUnion
        include JSON::Serializable

        # Can be either null, or have a Boolean value type. Only one value can be provided.

        @[JSON::Field(key: "booleanValue")]
        getter boolean_value : Bool?

        # Can be either null, or have a Double number value type. Only one value can be provided.

        @[JSON::Field(key: "doubleValue")]
        getter double_value : Float64?

        # An empty value.

        @[JSON::Field(key: "emptyValue")]
        getter empty_value : Types::EmptyFieldValue?

        # String value type.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        # Represents the user that performed the audit.

        @[JSON::Field(key: "userArnValue")]
        getter user_arn_value : String?

        def initialize(
          @boolean_value : Bool? = nil,
          @double_value : Float64? = nil,
          @empty_value : Types::EmptyFieldValue? = nil,
          @string_value : String? = nil,
          @user_arn_value : String? = nil
        )
        end
      end

      # An object that represents a content of an Amazon Connect file object.

      struct FileContent
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a File in Amazon Connect.

        @[JSON::Field(key: "fileArn")]
        getter file_arn : String

        def initialize(
          @file_arn : String
        )
        end
      end

      # A filter for related items of type File .

      struct FileFilter
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the file.

        @[JSON::Field(key: "fileArn")]
        getter file_arn : String?

        def initialize(
          @file_arn : String? = nil
        )
        end
      end


      struct GetCaseAuditEventsRequest
        include JSON::Serializable

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The maximum number of audit events to return. When no value is provided, 25 is the default.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @case_id : String,
          @domain_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetCaseAuditEventsResponse
        include JSON::Serializable

        # A list of case audits where each represents a particular edit of the case.

        @[JSON::Field(key: "auditEvents")]
        getter audit_events : Array(Types::AuditEvent)

        # The token for the next set of results. This is null if there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @audit_events : Array(Types::AuditEvent),
          @next_token : String? = nil
        )
        end
      end


      struct GetCaseEventConfigurationRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        def initialize(
          @domain_id : String
        )
        end
      end


      struct GetCaseEventConfigurationResponse
        include JSON::Serializable

        # Configuration to enable EventBridge case event delivery and determine what data is delivered.

        @[JSON::Field(key: "eventBridge")]
        getter event_bridge : Types::EventBridgeConfiguration

        def initialize(
          @event_bridge : Types::EventBridgeConfiguration
        )
        end
      end


      struct GetCaseRequest
        include JSON::Serializable

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # A list of unique field identifiers.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FieldIdentifier)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @case_id : String,
          @domain_id : String,
          @fields : Array(Types::FieldIdentifier),
          @next_token : String? = nil
        )
        end
      end


      struct GetCaseResponse
        include JSON::Serializable

        # A list of detailed field information.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FieldValue)

        # A unique identifier of a template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        # The token for the next set of results. This is null if there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A map of of key-value pairs that represent tags on a resource. Tags are used to organize, track, or
        # control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @fields : Array(Types::FieldValue),
          @template_id : String,
          @next_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Detailed case rule information. In the Amazon Connect admin website, case rules are known as case
      # field conditions . For more information about case field conditions, see Add case field conditions
      # to a case template .

      struct GetCaseRuleResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the case rule.

        @[JSON::Field(key: "caseRuleArn")]
        getter case_rule_arn : String

        # Unique identifier of a case rule.

        @[JSON::Field(key: "caseRuleId")]
        getter case_rule_id : String

        # Name of the case rule.

        @[JSON::Field(key: "name")]
        getter name : String

        # Represents what rule type should take place, under what conditions.

        @[JSON::Field(key: "rule")]
        getter rule : Types::CaseRuleDetails

        # Timestamp when the resource was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time?

        # Indicates whether the resource has been deleted.

        @[JSON::Field(key: "deleted")]
        getter deleted : Bool?

        # Description of a case rule.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Timestamp when the resource was created or last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # A map of of key-value pairs that represent tags on a resource. Tags are used to organize, track, or
        # control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @case_rule_arn : String,
          @case_rule_id : String,
          @name : String,
          @rule : Types::CaseRuleDetails,
          @created_time : Time? = nil,
          @deleted : Bool? = nil,
          @description : String? = nil,
          @last_modified_time : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetDomainRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        def initialize(
          @domain_id : String
        )
        end
      end


      struct GetDomainResponse
        include JSON::Serializable

        # The timestamp when the Cases domain was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) for the Cases domain.

        @[JSON::Field(key: "domainArn")]
        getter domain_arn : String

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The status of the Cases domain.

        @[JSON::Field(key: "domainStatus")]
        getter domain_status : String

        # The name of the Cases domain.

        @[JSON::Field(key: "name")]
        getter name : String

        # A map of of key-value pairs that represent tags on a resource. Tags are used to organize, track, or
        # control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_time : Time,
          @domain_arn : String,
          @domain_id : String,
          @domain_status : String,
          @name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Object to store detailed field information.

      struct GetFieldResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the field.

        @[JSON::Field(key: "fieldArn")]
        getter field_arn : String

        # Unique identifier of the field.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String

        # Name of the field.

        @[JSON::Field(key: "name")]
        getter name : String

        # Namespace of the field.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # Type of the field.

        @[JSON::Field(key: "type")]
        getter type : String

        # Timestamp at which the resource was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time?

        # Denotes whether or not the resource has been deleted.

        @[JSON::Field(key: "deleted")]
        getter deleted : Bool?

        # Description of the field.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Timestamp at which the resource was created or last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # A map of of key-value pairs that represent tags on a resource. Tags are used to organize, track, or
        # control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @field_arn : String,
          @field_id : String,
          @name : String,
          @namespace : String,
          @type : String,
          @created_time : Time? = nil,
          @deleted : Bool? = nil,
          @description : String? = nil,
          @last_modified_time : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetLayoutRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The unique identifier of the layout.

        @[JSON::Field(key: "layoutId")]
        getter layout_id : String

        def initialize(
          @domain_id : String,
          @layout_id : String
        )
        end
      end


      struct GetLayoutResponse
        include JSON::Serializable

        # Information about which fields will be present in the layout, the order of the fields, and read-only
        # attribute of the field.

        @[JSON::Field(key: "content")]
        getter content : Types::LayoutContent

        # The Amazon Resource Name (ARN) of the newly created layout.

        @[JSON::Field(key: "layoutArn")]
        getter layout_arn : String

        # The unique identifier of the layout.

        @[JSON::Field(key: "layoutId")]
        getter layout_id : String

        # The name of the layout. It must be unique.

        @[JSON::Field(key: "name")]
        getter name : String

        # Timestamp at which the resource was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time?

        # Denotes whether or not the resource has been deleted.

        @[JSON::Field(key: "deleted")]
        getter deleted : Bool?

        # Timestamp at which the resource was created or last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # A map of of key-value pairs that represent tags on a resource. Tags are used to organize, track, or
        # control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content : Types::LayoutContent,
          @layout_arn : String,
          @layout_id : String,
          @name : String,
          @created_time : Time? = nil,
          @deleted : Bool? = nil,
          @last_modified_time : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetTemplateRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # A unique identifier of a template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        def initialize(
          @domain_id : String,
          @template_id : String
        )
        end
      end


      struct GetTemplateResponse
        include JSON::Serializable

        # The name of the template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the template.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the template.

        @[JSON::Field(key: "templateArn")]
        getter template_arn : String

        # A unique identifier of a template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        # Timestamp at which the resource was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time?

        # Denotes whether or not the resource has been deleted.

        @[JSON::Field(key: "deleted")]
        getter deleted : Bool?

        # A brief description of the template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Timestamp at which the resource was created or last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # Configuration of layouts associated to the template.

        @[JSON::Field(key: "layoutConfiguration")]
        getter layout_configuration : Types::LayoutConfiguration?

        # A list of fields that must contain a value for a case to be successfully created with this template.

        @[JSON::Field(key: "requiredFields")]
        getter required_fields : Array(Types::RequiredField)?

        # A list of case rules (also known as case field conditions ) on a template.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::TemplateRule)?

        # A map of of key-value pairs that represent tags on a resource. Tags are used to organize, track, or
        # control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @status : String,
          @template_arn : String,
          @template_id : String,
          @created_time : Time? = nil,
          @deleted : Bool? = nil,
          @description : String? = nil,
          @last_modified_time : Time? = nil,
          @layout_configuration : Types::LayoutConfiguration? = nil,
          @required_fields : Array(Types::RequiredField)? = nil,
          @rules : Array(Types::TemplateRule)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A rule that controls field visibility based on conditions. Fields can be shown or hidden dynamically
      # based on values in other fields.

      struct HiddenCaseRule
        include JSON::Serializable

        # A list of conditions that determine field visibility.

        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::BooleanCondition)

        # Whether the field is hidden when no conditions match.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : Bool

        def initialize(
          @conditions : Array(Types::BooleanCondition),
          @default_value : Bool
        )
        end
      end

      # We couldn't process your request because of an issue with the server. Try again later.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Advice to clients on when the call can be safely retried.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # Object to store configuration of layouts associated to the template.

      struct LayoutConfiguration
        include JSON::Serializable

        # Unique identifier of a layout.

        @[JSON::Field(key: "defaultLayout")]
        getter default_layout : String?

        def initialize(
          @default_layout : String? = nil
        )
        end
      end

      # Object to store union of different versions of layout content.

      struct LayoutContent
        include JSON::Serializable

        # Content specific to BasicLayout type. It configures fields in the top panel and More Info tab of
        # Cases user interface.

        @[JSON::Field(key: "basic")]
        getter basic : Types::BasicLayout?

        def initialize(
          @basic : Types::BasicLayout? = nil
        )
        end
      end

      # Ordered list containing different kinds of sections that can be added. A LayoutSections object can
      # only contain one section.

      struct LayoutSections
        include JSON::Serializable


        @[JSON::Field(key: "sections")]
        getter sections : Array(Types::Section)?

        def initialize(
          @sections : Array(Types::Section)? = nil
        )
        end
      end

      # Object for the summarized details of the layout.

      struct LayoutSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the layout.

        @[JSON::Field(key: "layoutArn")]
        getter layout_arn : String

        # The unique identifier for of the layout.

        @[JSON::Field(key: "layoutId")]
        getter layout_id : String

        # The name of the layout.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @layout_arn : String,
          @layout_id : String,
          @name : String
        )
        end
      end


      struct ListCaseRulesRequest
        include JSON::Serializable

        # Unique identifier of a Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCaseRulesResponse
        include JSON::Serializable

        # A list of field summary objects.

        @[JSON::Field(key: "caseRules")]
        getter case_rules : Array(Types::CaseRuleSummary)

        # The token for the next set of results. This is null if there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @case_rules : Array(Types::CaseRuleSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCasesForContactRequest
        include JSON::Serializable

        # A unique identifier of a contact in Amazon Connect.

        @[JSON::Field(key: "contactArn")]
        getter contact_arn : String

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @contact_arn : String,
          @domain_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCasesForContactResponse
        include JSON::Serializable

        # A list of Case summary information.

        @[JSON::Field(key: "cases")]
        getter cases : Array(Types::CaseSummary)

        # The token for the next set of results. This is null if there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cases : Array(Types::CaseSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainsRequest
        include JSON::Serializable

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

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

        # The Cases domain.

        @[JSON::Field(key: "domains")]
        getter domains : Array(Types::DomainSummary)

        # The token for the next set of results. This is null if there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domains : Array(Types::DomainSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListFieldOptionsRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The unique identifier of a field.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of FieldOption values to filter on for ListFieldOptions .

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @domain_id : String,
          @field_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end


      struct ListFieldOptionsResponse
        include JSON::Serializable

        # A list of FieldOption objects.

        @[JSON::Field(key: "options")]
        getter options : Array(Types::FieldOption)

        # The token for the next set of results. This is null if there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @options : Array(Types::FieldOption),
          @next_token : String? = nil
        )
        end
      end


      struct ListFieldsRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFieldsResponse
        include JSON::Serializable

        # List of detailed field information.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FieldSummary)

        # The token for the next set of results. This is null if there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @fields : Array(Types::FieldSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListLayoutsRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLayoutsResponse
        include JSON::Serializable

        # The layouts for the domain.

        @[JSON::Field(key: "layouts")]
        getter layouts : Array(Types::LayoutSummary)

        # The token for the next set of results. This is null if there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @layouts : Array(Types::LayoutSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN)

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A map of of key-value pairs that represent tags on a resource. Tags are used to organize, track, or
        # control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListTemplatesRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of status values to filter on.

        @[JSON::Field(key: "status")]
        getter status : Array(String)?

        def initialize(
          @domain_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : Array(String)? = nil
        )
        end
      end


      struct ListTemplatesResponse
        include JSON::Serializable

        # List of template summary objects.

        @[JSON::Field(key: "templates")]
        getter templates : Array(Types::TemplateSummary)

        # The token for the next set of results. This is null if there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @templates : Array(Types::TemplateSummary),
          @next_token : String? = nil
        )
        end
      end

      # Represents the left hand operand in the condition. In the Amazon Connect admin website, case rules
      # are known as case field conditions . For more information about case field conditions, see Add case
      # field conditions to a case template .

      struct OperandOne
        include JSON::Serializable

        # The field ID that this operand should take the value of.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String?

        def initialize(
          @field_id : String? = nil
        )
        end
      end

      # Represents the right hand operand in the condition. In the Amazon Connect admin website, case rules
      # are known as case field conditions . For more information about case field conditions, see Add case
      # field conditions to a case template .

      struct OperandTwo
        include JSON::Serializable

        # Boolean value type.

        @[JSON::Field(key: "booleanValue")]
        getter boolean_value : Bool?

        # Double value type.

        @[JSON::Field(key: "doubleValue")]
        getter double_value : Float64?

        # Empty value type.

        @[JSON::Field(key: "emptyValue")]
        getter empty_value : Types::EmptyOperandValue?

        # String value type.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @boolean_value : Bool? = nil,
          @double_value : Float64? = nil,
          @empty_value : Types::EmptyOperandValue? = nil,
          @string_value : String? = nil
        )
        end
      end

      # A mapping between a parent field option value and child field option values.

      struct ParentChildFieldOptionsMapping
        include JSON::Serializable

        # A list of allowed values in the child field.

        @[JSON::Field(key: "childFieldOptionValues")]
        getter child_field_option_values : Array(String)

        # The value in the parent field.

        @[JSON::Field(key: "parentFieldOptionValue")]
        getter parent_field_option_value : String

        def initialize(
          @child_field_option_values : Array(String),
          @parent_field_option_value : String
        )
        end
      end


      struct PutCaseEventConfigurationRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # Configuration to enable EventBridge case event delivery and determine what data is delivered.

        @[JSON::Field(key: "eventBridge")]
        getter event_bridge : Types::EventBridgeConfiguration

        def initialize(
          @domain_id : String,
          @event_bridge : Types::EventBridgeConfiguration
        )
        end
      end


      struct PutCaseEventConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the content of a particular type of related item.

      struct RelatedItemContent
        include JSON::Serializable

        # Represents the content of a comment to be returned to agents.

        @[JSON::Field(key: "comment")]
        getter comment : Types::CommentContent?

        # Represents the Amazon Connect case to be created as a related item.

        @[JSON::Field(key: "connectCase")]
        getter connect_case : Types::ConnectCaseContent?

        # Represents the content of a contact to be returned to agents.

        @[JSON::Field(key: "contact")]
        getter contact : Types::ContactContent?

        # Represents the content of a Custom type related item.

        @[JSON::Field(key: "custom")]
        getter custom : Types::CustomContent?

        # Represents the content of a File to be returned to agents.

        @[JSON::Field(key: "file")]
        getter file : Types::FileContent?

        # Represents the content of an SLA to be returned to agents.

        @[JSON::Field(key: "sla")]
        getter sla : Types::SlaContent?

        def initialize(
          @comment : Types::CommentContent? = nil,
          @connect_case : Types::ConnectCaseContent? = nil,
          @contact : Types::ContactContent? = nil,
          @custom : Types::CustomContent? = nil,
          @file : Types::FileContent? = nil,
          @sla : Types::SlaContent? = nil
        )
        end
      end

      # Details of what related item data is published through the case event stream.

      struct RelatedItemEventIncludedData
        include JSON::Serializable

        # Details of what related item data is published through the case event stream.

        @[JSON::Field(key: "includeContent")]
        getter include_content : Bool

        def initialize(
          @include_content : Bool
        )
        end
      end

      # Represents the content of a related item to be created.

      struct RelatedItemInputContent
        include JSON::Serializable

        # Represents the content of a comment to be returned to agents.

        @[JSON::Field(key: "comment")]
        getter comment : Types::CommentContent?

        # Represents the Amazon Connect case to be created as a related item.

        @[JSON::Field(key: "connectCase")]
        getter connect_case : Types::ConnectCaseInputContent?

        # Object representing a contact in Amazon Connect as an API request field.

        @[JSON::Field(key: "contact")]
        getter contact : Types::Contact?

        # Represents the content of a Custom type related item.

        @[JSON::Field(key: "custom")]
        getter custom : Types::CustomInputContent?

        # A file of related items.

        @[JSON::Field(key: "file")]
        getter file : Types::FileContent?

        # Represents the content of an SLA to be created.

        @[JSON::Field(key: "sla")]
        getter sla : Types::SlaInputContent?

        def initialize(
          @comment : Types::CommentContent? = nil,
          @connect_case : Types::ConnectCaseInputContent? = nil,
          @contact : Types::Contact? = nil,
          @custom : Types::CustomInputContent? = nil,
          @file : Types::FileContent? = nil,
          @sla : Types::SlaInputContent? = nil
        )
        end
      end

      # The list of types of related items and their parameters to use for filtering.

      struct RelatedItemTypeFilter
        include JSON::Serializable

        # A filter for related items of type Comment .

        @[JSON::Field(key: "comment")]
        getter comment : Types::CommentFilter?

        # Represents the Amazon Connect case to be created as a related item.

        @[JSON::Field(key: "connectCase")]
        getter connect_case : Types::ConnectCaseFilter?

        # A filter for related items of type Contact .

        @[JSON::Field(key: "contact")]
        getter contact : Types::ContactFilter?

        # Represents the content of a Custom type related item.

        @[JSON::Field(key: "custom")]
        getter custom : Types::CustomFilter?

        # A filter for related items of this type of File .

        @[JSON::Field(key: "file")]
        getter file : Types::FileFilter?

        # Filter for related items of type SLA .

        @[JSON::Field(key: "sla")]
        getter sla : Types::SlaFilter?

        def initialize(
          @comment : Types::CommentFilter? = nil,
          @connect_case : Types::ConnectCaseFilter? = nil,
          @contact : Types::ContactFilter? = nil,
          @custom : Types::CustomFilter? = nil,
          @file : Types::FileFilter? = nil,
          @sla : Types::SlaFilter? = nil
        )
        end
      end

      # Required rule type, used to indicate whether a field is required. In the Amazon Connect admin
      # website, case rules are known as case field conditions . For more information about case field
      # conditions, see Add case field conditions to a case template .

      struct RequiredCaseRule
        include JSON::Serializable

        # List of conditions for the required rule; the first condition to evaluate to true dictates the value
        # of the rule.

        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::BooleanCondition)

        # The value of the rule (that is, whether the field is required) should none of the conditions
        # evaluate to true.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : Bool

        def initialize(
          @conditions : Array(Types::BooleanCondition),
          @default_value : Bool
        )
        end
      end

      # List of fields that must have a value provided to create a case.

      struct RequiredField
        include JSON::Serializable

        # Unique identifier of a field.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String

        def initialize(
          @field_id : String
        )
        end
      end

      # We couldn't find the requested resource. Check that your resources exists and were created in the
      # same Amazon Web Services Region as your request, and try your request again.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Unique identifier of the resource affected.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Type of the resource affected.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct SearchAllRelatedItemsRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The list of types of related items and their parameters to use for filtering. The filters work as an
        # OR condition: caller gets back related items that match any of the specified filter types.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::RelatedItemTypeFilter)?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A structured set of sort terms to specify the order in which related items should be returned.
        # Supports sorting by association time or case ID. The sorts work in the order specified: first sort
        # term takes precedence over subsequent terms.

        @[JSON::Field(key: "sorts")]
        getter sorts : Array(Types::SearchAllRelatedItemsSort)?

        def initialize(
          @domain_id : String,
          @filters : Array(Types::RelatedItemTypeFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sorts : Array(Types::SearchAllRelatedItemsSort)? = nil
        )
        end
      end


      struct SearchAllRelatedItemsResponse
        include JSON::Serializable

        # A list of items related to a case.

        @[JSON::Field(key: "relatedItems")]
        getter related_items : Array(Types::SearchAllRelatedItemsResponseItem)

        # The token for the next set of results. This is null if there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @related_items : Array(Types::SearchAllRelatedItemsResponseItem),
          @next_token : String? = nil
        )
        end
      end

      # A list of items that represent RelatedItems. This data type is similar to
      # SearchRelatedItemsResponseItem except Search All RelatedItemsResponseItem has a caseId field.

      struct SearchAllRelatedItemsResponseItem
        include JSON::Serializable

        # Time at which a related item was associated with a case.

        @[JSON::Field(key: "associationTime")]
        getter association_time : Time

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String


        @[JSON::Field(key: "content")]
        getter content : Types::RelatedItemContent

        # Unique identifier of a related item.

        @[JSON::Field(key: "relatedItemId")]
        getter related_item_id : String

        # Type of a related item.

        @[JSON::Field(key: "type")]
        getter type : String


        @[JSON::Field(key: "performedBy")]
        getter performed_by : Types::UserUnion?

        # A map of of key-value pairs that represent tags on a resource. Tags are used to organize, track, or
        # control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @association_time : Time,
          @case_id : String,
          @content : Types::RelatedItemContent,
          @related_item_id : String,
          @type : String,
          @performed_by : Types::UserUnion? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The order in which all returned related items should be sorted.

      struct SearchAllRelatedItemsSort
        include JSON::Serializable

        # Whether related items should be sorted by association time or case ID.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String

        # Whether related items should be sorted in ascending or descending order.

        @[JSON::Field(key: "sortProperty")]
        getter sort_property : String

        def initialize(
          @sort_order : String,
          @sort_property : String
        )
        end
      end


      struct SearchCasesRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The list of field identifiers to be returned as part of the response.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FieldIdentifier)?

        # A list of filter objects.

        @[JSON::Field(key: "filter")]
        getter filter : Types::CaseFilter?

        # The maximum number of cases to return. When no value is provided, 25 is the default.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A word or phrase used to perform a quick search.

        @[JSON::Field(key: "searchTerm")]
        getter search_term : String?

        # A list of sorts where each sort specifies a field and their sort order to be applied to the results.

        @[JSON::Field(key: "sorts")]
        getter sorts : Array(Types::Sort)?

        def initialize(
          @domain_id : String,
          @fields : Array(Types::FieldIdentifier)? = nil,
          @filter : Types::CaseFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @search_term : String? = nil,
          @sorts : Array(Types::Sort)? = nil
        )
        end
      end


      struct SearchCasesResponse
        include JSON::Serializable

        # A list of case documents where each case contains the properties CaseId and Fields where each field
        # is a complex union structure.

        @[JSON::Field(key: "cases")]
        getter cases : Array(Types::SearchCasesResponseItem)

        # The token for the next set of results. This is null if there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cases : Array(Types::SearchCasesResponseItem),
          @next_token : String? = nil
        )
        end
      end

      # A list of items that represent cases.

      struct SearchCasesResponseItem
        include JSON::Serializable

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # List of case field values.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FieldValue)

        # A unique identifier of a template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        # A map of of key-value pairs that represent tags on a resource. Tags are used to organize, track, or
        # control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @case_id : String,
          @fields : Array(Types::FieldValue),
          @template_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct SearchRelatedItemsRequest
        include JSON::Serializable

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The list of types of related items and their parameters to use for filtering.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::RelatedItemTypeFilter)?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @case_id : String,
          @domain_id : String,
          @filters : Array(Types::RelatedItemTypeFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchRelatedItemsResponse
        include JSON::Serializable

        # A list of items related to a case.

        @[JSON::Field(key: "relatedItems")]
        getter related_items : Array(Types::SearchRelatedItemsResponseItem)

        # The token for the next set of results. This is null if there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @related_items : Array(Types::SearchRelatedItemsResponseItem),
          @next_token : String? = nil
        )
        end
      end

      # A list of items that represent RelatedItems.

      struct SearchRelatedItemsResponseItem
        include JSON::Serializable

        # Time at which a related item was associated with a case.

        @[JSON::Field(key: "associationTime")]
        getter association_time : Time

        # Represents the content of a particular type of related item.

        @[JSON::Field(key: "content")]
        getter content : Types::RelatedItemContent

        # Unique identifier of a related item.

        @[JSON::Field(key: "relatedItemId")]
        getter related_item_id : String

        # Type of a related item.

        @[JSON::Field(key: "type")]
        getter type : String

        # Represents the creator of the related item.

        @[JSON::Field(key: "performedBy")]
        getter performed_by : Types::UserUnion?

        # A map of of key-value pairs that represent tags on a resource. Tags are used to organize, track, or
        # control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @association_time : Time,
          @content : Types::RelatedItemContent,
          @related_item_id : String,
          @type : String,
          @performed_by : Types::UserUnion? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # This represents a sections within a panel or tab of the page layout.

      struct Section
        include JSON::Serializable

        # Consists of a group of fields and associated properties.

        @[JSON::Field(key: "fieldGroup")]
        getter field_group : Types::FieldGroup?

        def initialize(
          @field_group : Types::FieldGroup? = nil
        )
        end
      end

      # The service quota has been exceeded. For a list of service quotas, see Amazon Connect Service Quotas
      # in the Amazon Connect Administrator Guide .

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Represents an SLA configuration.

      struct SlaConfiguration
        include JSON::Serializable

        # Name of an SLA.

        @[JSON::Field(key: "name")]
        getter name : String

        # Status of an SLA.

        @[JSON::Field(key: "status")]
        getter status : String

        # Target time by which an SLA should be completed.

        @[JSON::Field(key: "targetTime")]
        getter target_time : Time

        # Type of SLA.

        @[JSON::Field(key: "type")]
        getter type : String

        # Time at which an SLA was completed.

        @[JSON::Field(key: "completionTime")]
        getter completion_time : Time?

        # Unique identifier of a field.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String?

        # Represents a list of target field values for the fieldId specified in SlaConfiguration.

        @[JSON::Field(key: "targetFieldValues")]
        getter target_field_values : Array(Types::FieldValueUnion)?

        def initialize(
          @name : String,
          @status : String,
          @target_time : Time,
          @type : String,
          @completion_time : Time? = nil,
          @field_id : String? = nil,
          @target_field_values : Array(Types::FieldValueUnion)? = nil
        )
        end
      end

      # Represents the content of an SLA to be returned to agents.

      struct SlaContent
        include JSON::Serializable

        # Represents an SLA configuration.

        @[JSON::Field(key: "slaConfiguration")]
        getter sla_configuration : Types::SlaConfiguration

        def initialize(
          @sla_configuration : Types::SlaConfiguration
        )
        end
      end

      # A filter for related items of type SLA .

      struct SlaFilter
        include JSON::Serializable

        # Name of an SLA.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Status of an SLA.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Represents the input configuration of an SLA being created.

      struct SlaInputConfiguration
        include JSON::Serializable

        # Name of an SLA.

        @[JSON::Field(key: "name")]
        getter name : String

        # Target duration in minutes within which an SLA should be completed.

        @[JSON::Field(key: "targetSlaMinutes")]
        getter target_sla_minutes : Int64

        # Type of SLA.

        @[JSON::Field(key: "type")]
        getter type : String

        # Unique identifier of a field.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String?

        # Represents a list of target field values for the fieldId specified in SlaInputConfiguration. The SLA
        # is considered met if any one of these target field values matches the actual field value.

        @[JSON::Field(key: "targetFieldValues")]
        getter target_field_values : Array(Types::FieldValueUnion)?

        def initialize(
          @name : String,
          @target_sla_minutes : Int64,
          @type : String,
          @field_id : String? = nil,
          @target_field_values : Array(Types::FieldValueUnion)? = nil
        )
        end
      end

      # Represents the content of an SLA.

      struct SlaInputContent
        include JSON::Serializable

        # Represents an input SLA configuration.

        @[JSON::Field(key: "slaInputConfiguration")]
        getter sla_input_configuration : Types::SlaInputConfiguration?

        def initialize(
          @sla_input_configuration : Types::SlaInputConfiguration? = nil
        )
        end
      end

      # A structured set of sort terms.

      struct Sort
        include JSON::Serializable

        # Unique identifier of a field.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String

        # A structured set of sort terms

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String

        def initialize(
          @field_id : String,
          @sort_order : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN)

        @[JSON::Field(key: "arn")]
        getter arn : String

        # A map of of key-value pairs that represent tags on a resource. Tags are used to organize, track, or
        # control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # An association representing a case rule acting upon a field. In the Amazon Connect admin website,
      # case rules are known as case field conditions . For more information about case field conditions,
      # see Add case field conditions to a case template .

      struct TemplateRule
        include JSON::Serializable

        # Unique identifier of a case rule.

        @[JSON::Field(key: "caseRuleId")]
        getter case_rule_id : String

        # Unique identifier of a field.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String?

        def initialize(
          @case_rule_id : String,
          @field_id : String? = nil
        )
        end
      end

      # Template summary information.

      struct TemplateSummary
        include JSON::Serializable

        # The template name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the template.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the template.

        @[JSON::Field(key: "templateArn")]
        getter template_arn : String

        # The unique identifier for the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        def initialize(
          @name : String,
          @status : String,
          @template_arn : String,
          @template_id : String
        )
        end
      end

      # The rate has been exceeded for this API. Please try again after a few minutes.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN)

        @[JSON::Field(key: "arn")]
        getter arn : String

        # List of tag keys.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateCaseRequest
        include JSON::Serializable

        # A unique identifier of the case.

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # An array of objects with fieldId (matching ListFields/DescribeField) and value union data,
        # structured identical to CreateCase .

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FieldValue)


        @[JSON::Field(key: "performedBy")]
        getter performed_by : Types::UserUnion?

        def initialize(
          @case_id : String,
          @domain_id : String,
          @fields : Array(Types::FieldValue),
          @performed_by : Types::UserUnion? = nil
        )
        end
      end


      struct UpdateCaseResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateCaseRuleRequest
        include JSON::Serializable

        # Unique identifier of a case rule.

        @[JSON::Field(key: "caseRuleId")]
        getter case_rule_id : String

        # Unique identifier of a Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # Description of a case rule.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Name of the case rule.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Represents what rule type should take place, under what conditions.

        @[JSON::Field(key: "rule")]
        getter rule : Types::CaseRuleDetails?

        def initialize(
          @case_rule_id : String,
          @domain_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @rule : Types::CaseRuleDetails? = nil
        )
        end
      end


      struct UpdateCaseRuleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateFieldRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The unique identifier of a field.

        @[JSON::Field(key: "fieldId")]
        getter field_id : String

        # The description of a field.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the field.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @domain_id : String,
          @field_id : String,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateFieldResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateLayoutRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The unique identifier of the layout.

        @[JSON::Field(key: "layoutId")]
        getter layout_id : String

        # Information about which fields will be present in the layout, the order of the fields.

        @[JSON::Field(key: "content")]
        getter content : Types::LayoutContent?

        # The name of the layout. It must be unique per domain.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @domain_id : String,
          @layout_id : String,
          @content : Types::LayoutContent? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateLayoutResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateTemplateRequest
        include JSON::Serializable

        # The unique identifier of the Cases domain.

        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # A unique identifier for the template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        # A brief description of the template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Configuration of layouts associated to the template.

        @[JSON::Field(key: "layoutConfiguration")]
        getter layout_configuration : Types::LayoutConfiguration?

        # The name of the template. It must be unique per domain.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A list of fields that must contain a value for a case to be successfully created with this template.

        @[JSON::Field(key: "requiredFields")]
        getter required_fields : Array(Types::RequiredField)?

        # A list of case rules (also known as case field conditions ) on a template.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::TemplateRule)?

        # The status of the template.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_id : String,
          @template_id : String,
          @description : String? = nil,
          @layout_configuration : Types::LayoutConfiguration? = nil,
          @name : String? = nil,
          @required_fields : Array(Types::RequiredField)? = nil,
          @rules : Array(Types::TemplateRule)? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the entity that performed the action.

      struct UserUnion
        include JSON::Serializable

        # Any provided entity.

        @[JSON::Field(key: "customEntity")]
        getter custom_entity : String?

        # Represents the Amazon Connect ARN of the user.

        @[JSON::Field(key: "userArn")]
        getter user_arn : String?

        def initialize(
          @custom_entity : String? = nil,
          @user_arn : String? = nil
        )
        end
      end

      # The request isn't valid. Check the syntax and try again.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
