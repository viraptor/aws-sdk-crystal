require "json"
require "time"

module Aws
  module CustomerProfiles
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


      struct AddProfileKeyRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A searchable identifier of a customer profile. The predefined keys you can use include: _account,
        # _profileId, _assetId, _caseId, _orderId, _fullName, _phone, _email, _ctrContactId, _marketoLeadId,
        # _salesforceAccountId, _salesforceContactId, _salesforceAssetId, _zendeskUserId, _zendeskExternalId,
        # _zendeskTicketId, _serviceNowSystemId, _serviceNowIncidentId, _segmentUserId, _shopifyCustomerId,
        # _shopifyOrderId.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # A list of key values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @domain_name : String,
          @key_name : String,
          @profile_id : String,
          @values : Array(String)
        )
        end
      end


      struct AddProfileKeyResponse
        include JSON::Serializable

        # A searchable identifier of a customer profile.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String?

        # A list of key values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key_name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # A data type pair that consists of a KeyName and Values list that is used in conjunction with the
      # KeyName and Values parameters to search for profiles using the SearchProfiles API.

      struct AdditionalSearchKey
        include JSON::Serializable

        # A searchable identifier of a customer profile.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String

        # A list of key values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key_name : String,
          @values : Array(String)
        )
        end
      end

      # A generic address associated with the customer that is not mailing, shipping, or billing.

      struct Address
        include JSON::Serializable

        # The first line of a customer address.

        @[JSON::Field(key: "Address1")]
        getter address1 : String?

        # The second line of a customer address.

        @[JSON::Field(key: "Address2")]
        getter address2 : String?

        # The third line of a customer address.

        @[JSON::Field(key: "Address3")]
        getter address3 : String?

        # The fourth line of a customer address.

        @[JSON::Field(key: "Address4")]
        getter address4 : String?

        # The city in which a customer lives.

        @[JSON::Field(key: "City")]
        getter city : String?

        # The country in which a customer lives.

        @[JSON::Field(key: "Country")]
        getter country : String?

        # The county in which a customer lives.

        @[JSON::Field(key: "County")]
        getter county : String?

        # The postal code of a customer address.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String?

        # The province in which a customer lives.

        @[JSON::Field(key: "Province")]
        getter province : String?

        # The state in which a customer lives.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @address1 : String? = nil,
          @address2 : String? = nil,
          @address3 : String? = nil,
          @address4 : String? = nil,
          @city : String? = nil,
          @country : String? = nil,
          @county : String? = nil,
          @postal_code : String? = nil,
          @province : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Object that segments on Customer Profile's address object.

      struct AddressDimension
        include JSON::Serializable

        # The city belonging to the address.

        @[JSON::Field(key: "City")]
        getter city : Types::ProfileDimension?

        # The country belonging to the address.

        @[JSON::Field(key: "Country")]
        getter country : Types::ProfileDimension?

        # The county belonging to the address.

        @[JSON::Field(key: "County")]
        getter county : Types::ProfileDimension?

        # The postal code belonging to the address.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : Types::ProfileDimension?

        # The province belonging to the address.

        @[JSON::Field(key: "Province")]
        getter province : Types::ProfileDimension?

        # The state belonging to the address.

        @[JSON::Field(key: "State")]
        getter state : Types::ProfileDimension?

        def initialize(
          @city : Types::ProfileDimension? = nil,
          @country : Types::ProfileDimension? = nil,
          @county : Types::ProfileDimension? = nil,
          @postal_code : Types::ProfileDimension? = nil,
          @province : Types::ProfileDimension? = nil,
          @state : Types::ProfileDimension? = nil
        )
        end
      end

      # Details for workflow of type APPFLOW_INTEGRATION .

      struct AppflowIntegration
        include JSON::Serializable


        @[JSON::Field(key: "FlowDefinition")]
        getter flow_definition : Types::FlowDefinition

        # Batches in workflow of type APPFLOW_INTEGRATION .

        @[JSON::Field(key: "Batches")]
        getter batches : Array(Types::Batch)?

        def initialize(
          @flow_definition : Types::FlowDefinition,
          @batches : Array(Types::Batch)? = nil
        )
        end
      end

      # Structure holding all APPFLOW_INTEGRATION specific workflow attributes.

      struct AppflowIntegrationWorkflowAttributes
        include JSON::Serializable

        # The name of the AppFlow connector profile used for ingestion.

        @[JSON::Field(key: "ConnectorProfileName")]
        getter connector_profile_name : String

        # Specifies the source connector type, such as Salesforce, ServiceNow, and Marketo. Indicates source
        # of ingestion.

        @[JSON::Field(key: "SourceConnectorType")]
        getter source_connector_type : String

        # The Amazon Resource Name (ARN) of the IAM role. Customer Profiles assumes this role to create
        # resources on your behalf as part of workflow execution.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @connector_profile_name : String,
          @source_connector_type : String,
          @role_arn : String? = nil
        )
        end
      end

      # Workflow specific execution metrics for APPFLOW_INTEGRATION workflow.

      struct AppflowIntegrationWorkflowMetrics
        include JSON::Serializable

        # Number of records processed in APPFLOW_INTEGRATION workflow.

        @[JSON::Field(key: "RecordsProcessed")]
        getter records_processed : Int64

        # Total steps completed in APPFLOW_INTEGRATION workflow.

        @[JSON::Field(key: "StepsCompleted")]
        getter steps_completed : Int64

        # Total steps in APPFLOW_INTEGRATION workflow.

        @[JSON::Field(key: "TotalSteps")]
        getter total_steps : Int64

        def initialize(
          @records_processed : Int64,
          @steps_completed : Int64,
          @total_steps : Int64
        )
        end
      end

      # Workflow step details for APPFLOW_INTEGRATION workflow.

      struct AppflowIntegrationWorkflowStep
        include JSON::Serializable

        # End datetime of records pulled in batch during execution of workflow step for APPFLOW_INTEGRATION
        # workflow.

        @[JSON::Field(key: "BatchRecordsEndTime")]
        getter batch_records_end_time : String

        # Start datetime of records pulled in batch during execution of workflow step for APPFLOW_INTEGRATION
        # workflow.

        @[JSON::Field(key: "BatchRecordsStartTime")]
        getter batch_records_start_time : String

        # Creation timestamp of workflow step for APPFLOW_INTEGRATION workflow.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # Message indicating execution of workflow step for APPFLOW_INTEGRATION workflow.

        @[JSON::Field(key: "ExecutionMessage")]
        getter execution_message : String

        # Name of the flow created during execution of workflow step. APPFLOW_INTEGRATION workflow type
        # creates an appflow flow during workflow step execution on the customers behalf.

        @[JSON::Field(key: "FlowName")]
        getter flow_name : String

        # Last updated timestamp for workflow step for APPFLOW_INTEGRATION workflow.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # Total number of records processed during execution of workflow step for APPFLOW_INTEGRATION
        # workflow.

        @[JSON::Field(key: "RecordsProcessed")]
        getter records_processed : Int64

        # Workflow step status for APPFLOW_INTEGRATION workflow.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @batch_records_end_time : String,
          @batch_records_start_time : String,
          @created_at : Time,
          @execution_message : String,
          @flow_name : String,
          @last_updated_at : Time,
          @records_processed : Int64,
          @status : String
        )
        end
      end

      # Mathematical expression and a list of attribute items specified in that expression.

      struct AttributeDetails
        include JSON::Serializable

        # A list of attribute items specified in the mathematical expression.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::AttributeItem)

        # Mathematical expression that is performed on attribute items provided in the attribute list. Each
        # element in the expression should follow the structure of \"{ObjectTypeName.AttributeName}\".

        @[JSON::Field(key: "Expression")]
        getter expression : String

        def initialize(
          @attributes : Array(Types::AttributeItem),
          @expression : String
        )
        end
      end

      # Object that segments on various Customer Profile's fields.

      struct AttributeDimension
        include JSON::Serializable

        # The action to segment with.

        @[JSON::Field(key: "DimensionType")]
        getter dimension_type : String

        # The values to apply the DimensionType on.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @dimension_type : String,
          @values : Array(String)
        )
        end
      end

      # The details of a single attribute item specified in the mathematical expression.

      struct AttributeItem
        include JSON::Serializable

        # The name of an attribute defined in a profile object type.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Configuration information about the AttributeTypesSelector where the rule-based identity resolution
      # uses to match profiles. You can choose how profiles are compared across attribute types and which
      # attribute to use for matching from each type. There are three attribute types you can configure:
      # Email type You can choose from Email , BusinessEmail , and PersonalEmail Phone number type You can
      # choose from Phone , HomePhone , and MobilePhone Address type You can choose from Address ,
      # BusinessAddress , MaillingAddress , and ShippingAddress You can either choose ONE_TO_ONE or
      # MANY_TO_MANY as the AttributeMatchingModel . When choosing MANY_TO_MANY , the system can match
      # attribute across the sub-types of an attribute type. For example, if the value of the Email field of
      # Profile A and the value of BusinessEmail field of Profile B matches, the two profiles are matched on
      # the Email type. When choosing ONE_TO_ONE the system can only match if the sub-types are exact
      # matches. For example, only when the value of the Email field of Profile A and the value of the Email
      # field of Profile B matches, the two profiles are matched on the Email type.

      struct AttributeTypesSelector
        include JSON::Serializable

        # Configures the AttributeMatchingModel , you can either choose ONE_TO_ONE or MANY_TO_MANY .

        @[JSON::Field(key: "AttributeMatchingModel")]
        getter attribute_matching_model : String

        # The Address type. You can choose from Address , BusinessAddress , MaillingAddress , and
        # ShippingAddress . You only can use the Address type in the MatchingRule . For example, if you want
        # to match profile based on BusinessAddress.City or MaillingAddress.City , you need to choose the
        # BusinessAddress and the MaillingAddress to represent the Address type and specify the Address.City
        # on the matching rule.

        @[JSON::Field(key: "Address")]
        getter address : Array(String)?

        # The Email type. You can choose from EmailAddress , BusinessEmailAddress and PersonalEmailAddress .
        # You only can use the EmailAddress type in the MatchingRule . For example, if you want to match
        # profile based on PersonalEmailAddress or BusinessEmailAddress , you need to choose the
        # PersonalEmailAddress and the BusinessEmailAddress to represent the EmailAddress type and only
        # specify the EmailAddress on the matching rule.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : Array(String)?

        # The PhoneNumber type. You can choose from PhoneNumber , HomePhoneNumber , and MobilePhoneNumber .
        # You only can use the PhoneNumber type in the MatchingRule . For example, if you want to match a
        # profile based on Phone or HomePhone , you need to choose the Phone and the HomePhone to represent
        # the PhoneNumber type and only specify the PhoneNumber on the matching rule.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : Array(String)?

        def initialize(
          @attribute_matching_model : String,
          @address : Array(String)? = nil,
          @email_address : Array(String)? = nil,
          @phone_number : Array(String)? = nil
        )
        end
      end

      # List containing the values for the given attribute.

      struct AttributeValueItem
        include JSON::Serializable

        # An individual value belonging to the given attribute.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @value : String? = nil
        )
        end
      end

      # Configuration settings for how to perform the auto-merging of profiles.

      struct AutoMerging
        include JSON::Serializable

        # The flag that enables the auto-merging of duplicate profiles.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # How the auto-merging process should resolve conflicts between different profiles. For example, if
        # Profile A and Profile B have the same FirstName and LastName (and that is the matching criteria),
        # which EmailAddress should be used?

        @[JSON::Field(key: "ConflictResolution")]
        getter conflict_resolution : Types::ConflictResolution?

        # A list of matching attributes that represent matching criteria. If two profiles meet at least one of
        # the requirements in the matching attributes list, they will be merged.

        @[JSON::Field(key: "Consolidation")]
        getter consolidation : Types::Consolidation?

        # A number between 0 and 1 that represents the minimum confidence score required for profiles within a
        # matching group to be merged during the auto-merge process. A higher score means higher similarity
        # required to merge profiles.

        @[JSON::Field(key: "MinAllowedConfidenceScoreForMerging")]
        getter min_allowed_confidence_score_for_merging : Float64?

        def initialize(
          @enabled : Bool,
          @conflict_resolution : Types::ConflictResolution? = nil,
          @consolidation : Types::Consolidation? = nil,
          @min_allowed_confidence_score_for_merging : Float64? = nil
        )
        end
      end

      # The input you provided is invalid.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Batch defines the boundaries for ingestion for each step in APPFLOW_INTEGRATION workflow.
      # APPFLOW_INTEGRATION workflow splits ingestion based on these boundaries.

      struct Batch
        include JSON::Serializable

        # End time of batch to split ingestion.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # Start time of batch to split ingestion.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @start_time : Time
        )
        end
      end

      # Error object describing why a specific profile and calculated attribute failed.

      struct BatchGetCalculatedAttributeForProfileError
        include JSON::Serializable

        # Status code for why a specific profile and calculated attribute failed.

        @[JSON::Field(key: "Code")]
        getter code : String

        # Message describing why a specific profile and calculated attribute failed.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The profile id that failed.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @code : String,
          @message : String,
          @profile_id : String
        )
        end
      end


      struct BatchGetCalculatedAttributeForProfileRequest
        include JSON::Serializable

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # List of unique identifiers for customer profiles to retrieve.

        @[JSON::Field(key: "ProfileIds")]
        getter profile_ids : Array(String)

        # Overrides the condition block within the original calculated attribute definition.

        @[JSON::Field(key: "ConditionOverrides")]
        getter condition_overrides : Types::ConditionOverrides?

        def initialize(
          @calculated_attribute_name : String,
          @domain_name : String,
          @profile_ids : Array(String),
          @condition_overrides : Types::ConditionOverrides? = nil
        )
        end
      end


      struct BatchGetCalculatedAttributeForProfileResponse
        include JSON::Serializable

        # List of calculated attribute values retrieved.

        @[JSON::Field(key: "CalculatedAttributeValues")]
        getter calculated_attribute_values : Array(Types::CalculatedAttributeValue)?

        # Overrides the condition block within the original calculated attribute definition.

        @[JSON::Field(key: "ConditionOverrides")]
        getter condition_overrides : Types::ConditionOverrides?

        # List of errors for calculated attribute values that could not be retrieved.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchGetCalculatedAttributeForProfileError)?

        def initialize(
          @calculated_attribute_values : Array(Types::CalculatedAttributeValue)? = nil,
          @condition_overrides : Types::ConditionOverrides? = nil,
          @errors : Array(Types::BatchGetCalculatedAttributeForProfileError)? = nil
        )
        end
      end

      # Error object describing why a specific profile failed.

      struct BatchGetProfileError
        include JSON::Serializable

        # Status code for why a specific profile failed.

        @[JSON::Field(key: "Code")]
        getter code : String

        # Message describing why a specific profile failed.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The profile id that failed.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @code : String,
          @message : String,
          @profile_id : String
        )
        end
      end


      struct BatchGetProfileRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # List of unique identifiers for customer profiles to retrieve.

        @[JSON::Field(key: "ProfileIds")]
        getter profile_ids : Array(String)

        def initialize(
          @domain_name : String,
          @profile_ids : Array(String)
        )
        end
      end


      struct BatchGetProfileResponse
        include JSON::Serializable

        # For information about the errors that are common to all actions, see Common Errors .

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchGetProfileError)?

        # Array of Profile Objects.

        @[JSON::Field(key: "Profiles")]
        getter profiles : Array(Types::Profile)?

        def initialize(
          @errors : Array(Types::BatchGetProfileError)? = nil,
          @profiles : Array(Types::Profile)? = nil
        )
        end
      end

      # Object that segments on Customer Profile's Calculated Attributes.

      struct CalculatedAttributeDimension
        include JSON::Serializable

        # The action to segment with.

        @[JSON::Field(key: "DimensionType")]
        getter dimension_type : String

        # The values to apply the DimensionType with.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        # Applies the given condition over the initial Calculated Attribute's definition.

        @[JSON::Field(key: "ConditionOverrides")]
        getter condition_overrides : Types::ConditionOverrides?

        def initialize(
          @dimension_type : String,
          @values : Array(String),
          @condition_overrides : Types::ConditionOverrides? = nil
        )
        end
      end

      # The object containing the values of a single calculated attribute value.

      struct CalculatedAttributeValue
        include JSON::Serializable

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String?

        # The display name of the calculated attribute.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Indicates whether the calculated attribute's value is based on partial data. If the data is partial,
        # it is set to true.

        @[JSON::Field(key: "IsDataPartial")]
        getter is_data_partial : String?

        # The timestamp of the newest object included in the calculated attribute calculation.

        @[JSON::Field(key: "LastObjectTimestamp")]
        getter last_object_timestamp : Time?

        # The profile id belonging to this calculated attribute value.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String?

        # The value of the calculated attribute.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @calculated_attribute_name : String? = nil,
          @display_name : String? = nil,
          @is_data_partial : String? = nil,
          @last_object_timestamp : Time? = nil,
          @profile_id : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Represents an item in the catalog with its complete set of attributes and metadata.

      struct CatalogItem
        include JSON::Serializable

        # Supplementary information about the catalog item beyond the basic description.

        @[JSON::Field(key: "AdditionalInformation")]
        getter additional_information : String?

        # Additional attributes or properties associated with the catalog item stored as key-value pairs.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The category to which the catalog item belongs.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The product code or SKU of the catalog item.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The timestamp when the catalog item was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A detailed description of the catalog item.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier for the catalog item.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The URL link to the item's image.

        @[JSON::Field(key: "ImageLink")]
        getter image_link : String?

        # The URL link to the item's detailed page or external resource.

        @[JSON::Field(key: "Link")]
        getter link : String?

        # The display name of the catalog item.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The price of the catalog item.

        @[JSON::Field(key: "Price")]
        getter price : String?

        # The type classification of the catalog item.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The timestamp when the catalog item was last updated.

        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @additional_information : String? = nil,
          @attributes : Hash(String, String)? = nil,
          @category : String? = nil,
          @code : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @image_link : String? = nil,
          @link : String? = nil,
          @name : String? = nil,
          @price : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # An object to override the original condition block of a calculated attribute.

      struct ConditionOverrides
        include JSON::Serializable

        # The relative time period over which data is included in the aggregation for this override.

        @[JSON::Field(key: "Range")]
        getter range : Types::RangeOverride?

        def initialize(
          @range : Types::RangeOverride? = nil
        )
        end
      end

      # The conditions including range, object count, and threshold for the calculated attribute.

      struct Conditions
        include JSON::Serializable

        # The number of profile objects used for the calculated attribute.

        @[JSON::Field(key: "ObjectCount")]
        getter object_count : Int32?

        # The relative time period over which data is included in the aggregation.

        @[JSON::Field(key: "Range")]
        getter range : Types::Range?

        # The threshold for the calculated attribute.

        @[JSON::Field(key: "Threshold")]
        getter threshold : Types::Threshold?

        def initialize(
          @object_count : Int32? = nil,
          @range : Types::Range? = nil,
          @threshold : Types::Threshold? = nil
        )
        end
      end

      # How the auto-merging process should resolve conflicts between different profiles.

      struct ConflictResolution
        include JSON::Serializable

        # How the auto-merging process should resolve conflicts between different profiles. RECENCY : Uses the
        # data that was most recently updated. SOURCE : Uses the data from a specific source. For example, if
        # a company has been aquired or two departments have merged, data from the specified source is used.
        # If two duplicate profiles are from the same source, then RECENCY is used again.

        @[JSON::Field(key: "ConflictResolvingModel")]
        getter conflict_resolving_model : String

        # The ObjectType name that is used to resolve profile merging conflicts when choosing SOURCE as the
        # ConflictResolvingModel .

        @[JSON::Field(key: "SourceName")]
        getter source_name : String?

        def initialize(
          @conflict_resolving_model : String,
          @source_name : String? = nil
        )
        end
      end

      # The operation to be performed on the provided source fields.

      struct ConnectorOperator
        include JSON::Serializable

        # The operation to be performed on the provided Marketo source fields.

        @[JSON::Field(key: "Marketo")]
        getter marketo : String?

        # The operation to be performed on the provided Amazon S3 source fields.

        @[JSON::Field(key: "S3")]
        getter s3 : String?

        # The operation to be performed on the provided Salesforce source fields.

        @[JSON::Field(key: "Salesforce")]
        getter salesforce : String?

        # The operation to be performed on the provided ServiceNow source fields.

        @[JSON::Field(key: "ServiceNow")]
        getter service_now : String?

        # The operation to be performed on the provided Zendesk source fields.

        @[JSON::Field(key: "Zendesk")]
        getter zendesk : String?

        def initialize(
          @marketo : String? = nil,
          @s3 : String? = nil,
          @salesforce : String? = nil,
          @service_now : String? = nil,
          @zendesk : String? = nil
        )
        end
      end

      # The matching criteria to be used during the auto-merging process.

      struct Consolidation
        include JSON::Serializable

        # A list of matching criteria.

        @[JSON::Field(key: "MatchingAttributesList")]
        getter matching_attributes_list : Array(Array(String))

        def initialize(
          @matching_attributes_list : Array(Array(String))
        )
        end
      end

      # Object that defines users contact preference.

      struct ContactPreference
        include JSON::Serializable

        # The contact type used for engagement. For example: HomePhoneNumber, PersonalEmailAddress.

        @[JSON::Field(key: "ContactType")]
        getter contact_type : String?

        # A searchable, unique identifier of a customer profile.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String?

        # The key value used to look up profile based off the keyName.

        @[JSON::Field(key: "KeyValue")]
        getter key_value : String?

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String?

        def initialize(
          @contact_type : String? = nil,
          @key_name : String? = nil,
          @key_value : String? = nil,
          @profile_id : String? = nil
        )
        end
      end


      struct CreateCalculatedAttributeDefinitionRequest
        include JSON::Serializable

        # Mathematical expression and a list of attribute items specified in that expression.

        @[JSON::Field(key: "AttributeDetails")]
        getter attribute_details : Types::AttributeDetails

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The aggregation operation to perform for the calculated attribute.

        @[JSON::Field(key: "Statistic")]
        getter statistic : String

        # The conditions including range, object count, and threshold for the calculated attribute.

        @[JSON::Field(key: "Conditions")]
        getter conditions : Types::Conditions?

        # The description of the calculated attribute.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the calculated attribute.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Defines how to filter incoming objects to include part of the Calculated Attribute.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Filter?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # Whether historical data ingested before the Calculated Attribute was created should be included in
        # calculations.

        @[JSON::Field(key: "UseHistoricalData")]
        getter use_historical_data : Bool?

        def initialize(
          @attribute_details : Types::AttributeDetails,
          @calculated_attribute_name : String,
          @domain_name : String,
          @statistic : String,
          @conditions : Types::Conditions? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @filter : Types::Filter? = nil,
          @tags : Hash(String, String)? = nil,
          @use_historical_data : Bool? = nil
        )
        end
      end


      struct CreateCalculatedAttributeDefinitionResponse
        include JSON::Serializable

        # Mathematical expression and a list of attribute items specified in that expression.

        @[JSON::Field(key: "AttributeDetails")]
        getter attribute_details : Types::AttributeDetails?

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String?

        # The conditions including range, object count, and threshold for the calculated attribute.

        @[JSON::Field(key: "Conditions")]
        getter conditions : Types::Conditions?

        # The timestamp of when the calculated attribute definition was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the calculated attribute.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the calculated attribute.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The filter that was used as part of the request.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Filter?

        # The timestamp of when the calculated attribute definition was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # Information indicating if the Calculated Attribute is ready for use by confirming all historical
        # data has been processed and reflected.

        @[JSON::Field(key: "Readiness")]
        getter readiness : Types::Readiness?

        # The aggregation operation to perform for the calculated attribute.

        @[JSON::Field(key: "Statistic")]
        getter statistic : String?

        # Status of the Calculated Attribute creation (whether all historical data has been indexed.)

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # Whether historical data ingested before the Calculated Attribute was created should be included in
        # calculations.

        @[JSON::Field(key: "UseHistoricalData")]
        getter use_historical_data : Bool?

        def initialize(
          @attribute_details : Types::AttributeDetails? = nil,
          @calculated_attribute_name : String? = nil,
          @conditions : Types::Conditions? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @filter : Types::Filter? = nil,
          @last_updated_at : Time? = nil,
          @readiness : Types::Readiness? = nil,
          @statistic : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @use_historical_data : Bool? = nil
        )
        end
      end


      struct CreateDomainLayoutRequest
        include JSON::Serializable

        # The description of the layout

        @[JSON::Field(key: "Description")]
        getter description : String

        # The display name of the layout

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A customizable layout that can be used to view data under a Customer Profiles domain.

        @[JSON::Field(key: "Layout")]
        getter layout : String

        # The unique name of the layout.

        @[JSON::Field(key: "LayoutDefinitionName")]
        getter layout_definition_name : String

        # The type of layout that can be used to view data under a Customer Profiles domain.

        @[JSON::Field(key: "LayoutType")]
        getter layout_type : String

        # If set to true for a layout, this layout will be used by default to view data. If set to false, then
        # the layout will not be used by default, but it can be used to view data by explicitly selecting it
        # in the console.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String,
          @display_name : String,
          @domain_name : String,
          @layout : String,
          @layout_definition_name : String,
          @layout_type : String,
          @is_default : Bool? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDomainLayoutResponse
        include JSON::Serializable

        # The timestamp of when the layout was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The description of the layout

        @[JSON::Field(key: "Description")]
        getter description : String

        # The display name of the layout

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # A customizable layout that can be used to view data under Customer Profiles domain.

        @[JSON::Field(key: "Layout")]
        getter layout : String

        # The unique name of the layout.

        @[JSON::Field(key: "LayoutDefinitionName")]
        getter layout_definition_name : String

        # The type of layout that can be used to view data under customer profiles domain.

        @[JSON::Field(key: "LayoutType")]
        getter layout_type : String

        # The version used to create layout.

        @[JSON::Field(key: "Version")]
        getter version : String

        # If set to true for a layout, this layout will be used by default to view data. If set to false, then
        # the layout will not be used by default, but it can be used to view data by explicitly selecting it
        # in the console.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        # The timestamp of when the layout was most recently updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @description : String,
          @display_name : String,
          @layout : String,
          @layout_definition_name : String,
          @layout_type : String,
          @version : String,
          @is_default : Bool? = nil,
          @last_updated_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDomainRequest
        include JSON::Serializable

        # The default number of days until the data within the domain expires.

        @[JSON::Field(key: "DefaultExpirationDays")]
        getter default_expiration_days : Int32

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Set to true to enabled data store for this domain.

        @[JSON::Field(key: "DataStore")]
        getter data_store : Types::DataStoreRequest?

        # The URL of the SQS dead letter queue, which is used for reporting errors associated with ingesting
        # data from third party applications. You must set up a policy on the DeadLetterQueue for the
        # SendMessage operation to enable Amazon Connect Customer Profiles to send messages to the
        # DeadLetterQueue.

        @[JSON::Field(key: "DeadLetterQueueUrl")]
        getter dead_letter_queue_url : String?

        # The default encryption key, which is an AWS managed key, is used when no specific type of encryption
        # key is specified. It is used to encrypt all data before it is placed in permanent or semi-permanent
        # storage.

        @[JSON::Field(key: "DefaultEncryptionKey")]
        getter default_encryption_key : String?

        # The process of matching duplicate profiles. If Matching = true , Amazon Connect Customer Profiles
        # starts a weekly batch process called Identity Resolution Job. If you do not specify a date and time
        # for Identity Resolution Job to run, by default it runs every Saturday at 12AM UTC to detect
        # duplicate profiles in your domains. After the Identity Resolution Job completes, use the GetMatches
        # API to return and review the results. Or, if you have configured ExportingConfig in the
        # MatchingRequest , you can download the results from S3.

        @[JSON::Field(key: "Matching")]
        getter matching : Types::MatchingRequest?

        # The process of matching duplicate profiles using the Rule-Based matching. If RuleBasedMatching =
        # true, Amazon Connect Customer Profiles will start to match and merge your profiles according to your
        # configuration in the RuleBasedMatchingRequest . You can use the ListRuleBasedMatches and
        # GetSimilarProfiles API to return and review the results. Also, if you have configured
        # ExportingConfig in the RuleBasedMatchingRequest , you can download the results from S3.

        @[JSON::Field(key: "RuleBasedMatching")]
        getter rule_based_matching : Types::RuleBasedMatchingRequest?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @default_expiration_days : Int32,
          @domain_name : String,
          @data_store : Types::DataStoreRequest? = nil,
          @dead_letter_queue_url : String? = nil,
          @default_encryption_key : String? = nil,
          @matching : Types::MatchingRequest? = nil,
          @rule_based_matching : Types::RuleBasedMatchingRequest? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDomainResponse
        include JSON::Serializable

        # The timestamp of when the domain was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The default number of days until the data within the domain expires.

        @[JSON::Field(key: "DefaultExpirationDays")]
        getter default_expiration_days : Int32

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The timestamp of when the domain was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # The data store.

        @[JSON::Field(key: "DataStore")]
        getter data_store : Types::DataStoreResponse?

        # The URL of the SQS dead letter queue, which is used for reporting errors associated with ingesting
        # data from third party applications.

        @[JSON::Field(key: "DeadLetterQueueUrl")]
        getter dead_letter_queue_url : String?

        # The default encryption key, which is an AWS managed key, is used when no specific type of encryption
        # key is specified. It is used to encrypt all data before it is placed in permanent or semi-permanent
        # storage.

        @[JSON::Field(key: "DefaultEncryptionKey")]
        getter default_encryption_key : String?

        # The process of matching duplicate profiles. If Matching = true , Amazon Connect Customer Profiles
        # starts a weekly batch process called Identity Resolution Job. If you do not specify a date and time
        # for Identity Resolution Job to run, by default it runs every Saturday at 12AM UTC to detect
        # duplicate profiles in your domains. After the Identity Resolution Job completes, use the GetMatches
        # API to return and review the results. Or, if you have configured ExportingConfig in the
        # MatchingRequest , you can download the results from S3.

        @[JSON::Field(key: "Matching")]
        getter matching : Types::MatchingResponse?

        # The process of matching duplicate profiles using the Rule-Based matching. If RuleBasedMatching =
        # true, Amazon Connect Customer Profiles will start to match and merge your profiles according to your
        # configuration in the RuleBasedMatchingRequest . You can use the ListRuleBasedMatches and
        # GetSimilarProfiles API to return and review the results. Also, if you have configured
        # ExportingConfig in the RuleBasedMatchingRequest , you can download the results from S3.

        @[JSON::Field(key: "RuleBasedMatching")]
        getter rule_based_matching : Types::RuleBasedMatchingResponse?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @default_expiration_days : Int32,
          @domain_name : String,
          @last_updated_at : Time,
          @data_store : Types::DataStoreResponse? = nil,
          @dead_letter_queue_url : String? = nil,
          @default_encryption_key : String? = nil,
          @matching : Types::MatchingResponse? = nil,
          @rule_based_matching : Types::RuleBasedMatchingResponse? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEventStreamRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the event stream.

        @[JSON::Field(key: "EventStreamName")]
        getter event_stream_name : String

        # The StreamARN of the destination to deliver profile events to. For example,
        # arn:aws:kinesis:region:account-id:stream/stream-name

        @[JSON::Field(key: "Uri")]
        getter uri : String

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_name : String,
          @event_stream_name : String,
          @uri : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEventStreamResponse
        include JSON::Serializable

        # A unique identifier for the event stream.

        @[JSON::Field(key: "EventStreamArn")]
        getter event_stream_arn : String

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @event_stream_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEventTriggerRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A list of conditions that determine when an event should trigger the destination.

        @[JSON::Field(key: "EventTriggerConditions")]
        getter event_trigger_conditions : Array(Types::EventTriggerCondition)

        # The unique name of the event trigger.

        @[JSON::Field(key: "EventTriggerName")]
        getter event_trigger_name : String

        # The unique name of the object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # The description of the event trigger.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Defines limits controlling whether an event triggers the destination, based on ingestion latency and
        # the number of invocations per profile over specific time periods.

        @[JSON::Field(key: "EventTriggerLimits")]
        getter event_trigger_limits : Types::EventTriggerLimits?

        # The destination is triggered only for profiles that meet the criteria of a segment definition.

        @[JSON::Field(key: "SegmentFilter")]
        getter segment_filter : String?

        # An array of key-value pairs to apply to this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_name : String,
          @event_trigger_conditions : Array(Types::EventTriggerCondition),
          @event_trigger_name : String,
          @object_type_name : String,
          @description : String? = nil,
          @event_trigger_limits : Types::EventTriggerLimits? = nil,
          @segment_filter : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEventTriggerResponse
        include JSON::Serializable

        # The timestamp of when the event trigger was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the event trigger.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of conditions that determine when an event should trigger the destination.

        @[JSON::Field(key: "EventTriggerConditions")]
        getter event_trigger_conditions : Array(Types::EventTriggerCondition)?

        # Defines limits controlling whether an event triggers the destination, based on ingestion latency and
        # the number of invocations per profile over specific time periods.

        @[JSON::Field(key: "EventTriggerLimits")]
        getter event_trigger_limits : Types::EventTriggerLimits?

        # The unique name of the event trigger.

        @[JSON::Field(key: "EventTriggerName")]
        getter event_trigger_name : String?

        # The timestamp of when the event trigger was most recently updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The unique name of the object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String?

        # The destination is triggered only for profiles that meet the criteria of a segment definition.

        @[JSON::Field(key: "SegmentFilter")]
        getter segment_filter : String?

        # An array of key-value pairs to apply to this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @event_trigger_conditions : Array(Types::EventTriggerCondition)? = nil,
          @event_trigger_limits : Types::EventTriggerLimits? = nil,
          @event_trigger_name : String? = nil,
          @last_updated_at : Time? = nil,
          @object_type_name : String? = nil,
          @segment_filter : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateIntegrationWorkflowRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Configuration data for integration workflow.

        @[JSON::Field(key: "IntegrationConfig")]
        getter integration_config : Types::IntegrationConfig

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # The Amazon Resource Name (ARN) of the IAM role. Customer Profiles assumes this role to create
        # resources on your behalf as part of workflow execution.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The type of workflow. The only supported value is APPFLOW_INTEGRATION.

        @[JSON::Field(key: "WorkflowType")]
        getter workflow_type : String

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_name : String,
          @integration_config : Types::IntegrationConfig,
          @object_type_name : String,
          @role_arn : String,
          @workflow_type : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateIntegrationWorkflowResponse
        include JSON::Serializable

        # A message indicating create request was received.

        @[JSON::Field(key: "Message")]
        getter message : String

        # Unique identifier for the workflow.

        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        def initialize(
          @message : String,
          @workflow_id : String
        )
        end
      end


      struct CreateProfileRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # An account number that you have assigned to the customer.

        @[JSON::Field(key: "AccountNumber")]
        getter account_number : String?

        # Any additional information relevant to the customer’s profile.

        @[JSON::Field(key: "AdditionalInformation")]
        getter additional_information : String?

        # A generic address associated with the customer that is not mailing, shipping, or billing.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # A key value pair of attributes of a customer profile.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The customer’s billing address.

        @[JSON::Field(key: "BillingAddress")]
        getter billing_address : Types::Address?

        # The customer’s birth date.

        @[JSON::Field(key: "BirthDate")]
        getter birth_date : String?

        # The customer’s business email address.

        @[JSON::Field(key: "BusinessEmailAddress")]
        getter business_email_address : String?

        # The name of the customer’s business.

        @[JSON::Field(key: "BusinessName")]
        getter business_name : String?

        # The customer’s business phone number.

        @[JSON::Field(key: "BusinessPhoneNumber")]
        getter business_phone_number : String?

        # The customer’s email address, which has not been specified as a personal or business address.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # Object that defines the preferred methods of engagement, per channel.

        @[JSON::Field(key: "EngagementPreferences")]
        getter engagement_preferences : Types::EngagementPreferences?

        # The customer’s first name.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # The gender with which the customer identifies.

        @[JSON::Field(key: "Gender")]
        getter gender : String?

        # An alternative to Gender which accepts any string as input.

        @[JSON::Field(key: "GenderString")]
        getter gender_string : String?

        # The customer’s home phone number.

        @[JSON::Field(key: "HomePhoneNumber")]
        getter home_phone_number : String?

        # The customer’s last name.

        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # The customer’s mailing address.

        @[JSON::Field(key: "MailingAddress")]
        getter mailing_address : Types::Address?

        # The customer’s middle name.

        @[JSON::Field(key: "MiddleName")]
        getter middle_name : String?

        # The customer’s mobile phone number.

        @[JSON::Field(key: "MobilePhoneNumber")]
        getter mobile_phone_number : String?

        # The type of profile used to describe the customer.

        @[JSON::Field(key: "PartyType")]
        getter party_type : String?

        # An alternative to PartyType which accepts any string as input.

        @[JSON::Field(key: "PartyTypeString")]
        getter party_type_string : String?

        # The customer’s personal email address.

        @[JSON::Field(key: "PersonalEmailAddress")]
        getter personal_email_address : String?

        # The customer’s phone number, which has not been specified as a mobile, home, or business number.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # The type of the profile.

        @[JSON::Field(key: "ProfileType")]
        getter profile_type : String?

        # The customer’s shipping address.

        @[JSON::Field(key: "ShippingAddress")]
        getter shipping_address : Types::Address?

        def initialize(
          @domain_name : String,
          @account_number : String? = nil,
          @additional_information : String? = nil,
          @address : Types::Address? = nil,
          @attributes : Hash(String, String)? = nil,
          @billing_address : Types::Address? = nil,
          @birth_date : String? = nil,
          @business_email_address : String? = nil,
          @business_name : String? = nil,
          @business_phone_number : String? = nil,
          @email_address : String? = nil,
          @engagement_preferences : Types::EngagementPreferences? = nil,
          @first_name : String? = nil,
          @gender : String? = nil,
          @gender_string : String? = nil,
          @home_phone_number : String? = nil,
          @last_name : String? = nil,
          @mailing_address : Types::Address? = nil,
          @middle_name : String? = nil,
          @mobile_phone_number : String? = nil,
          @party_type : String? = nil,
          @party_type_string : String? = nil,
          @personal_email_address : String? = nil,
          @phone_number : String? = nil,
          @profile_type : String? = nil,
          @shipping_address : Types::Address? = nil
        )
        end
      end


      struct CreateProfileResponse
        include JSON::Serializable

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @profile_id : String
        )
        end
      end


      struct CreateRecommenderRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the recommender.

        @[JSON::Field(key: "RecommenderName")]
        getter recommender_name : String

        # The name of the recommeder recipe.

        @[JSON::Field(key: "RecommenderRecipeName")]
        getter recommender_recipe_name : String

        # The description of the domain object type.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The recommender configuration.

        @[JSON::Field(key: "RecommenderConfig")]
        getter recommender_config : Types::RecommenderConfig?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_name : String,
          @recommender_name : String,
          @recommender_recipe_name : String,
          @description : String? = nil,
          @recommender_config : Types::RecommenderConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateRecommenderResponse
        include JSON::Serializable

        # The ARN of the recommender

        @[JSON::Field(key: "RecommenderArn")]
        getter recommender_arn : String

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @recommender_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSegmentDefinitionRequest
        include JSON::Serializable

        # The display name of the segment definition.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the segment definition.

        @[JSON::Field(key: "SegmentDefinitionName")]
        getter segment_definition_name : String

        # The description of the segment definition.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies the base segments and dimensions for a segment definition along with their respective
        # relationship.

        @[JSON::Field(key: "SegmentGroups")]
        getter segment_groups : Types::SegmentGroup?

        # The segment SQL query.

        @[JSON::Field(key: "SegmentSqlQuery")]
        getter segment_sql_query : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @display_name : String,
          @domain_name : String,
          @segment_definition_name : String,
          @description : String? = nil,
          @segment_groups : Types::SegmentGroup? = nil,
          @segment_sql_query : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSegmentDefinitionResponse
        include JSON::Serializable

        # The name of the segment definition.

        @[JSON::Field(key: "SegmentDefinitionName")]
        getter segment_definition_name : String

        # The timestamp of when the segment definition was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the segment definition.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the segment definition.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The arn of the segment definition.

        @[JSON::Field(key: "SegmentDefinitionArn")]
        getter segment_definition_arn : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @segment_definition_name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @segment_definition_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSegmentEstimateRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The segment query for calculating a segment estimate.

        @[JSON::Field(key: "SegmentQuery")]
        getter segment_query : Types::SegmentGroupStructure?

        # The segment SQL query.

        @[JSON::Field(key: "SegmentSqlQuery")]
        getter segment_sql_query : String?

        def initialize(
          @domain_name : String,
          @segment_query : Types::SegmentGroupStructure? = nil,
          @segment_sql_query : String? = nil
        )
        end
      end


      struct CreateSegmentEstimateResponse
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # A unique identifier for the resource. The value can be passed to GetSegmentEstimate to retrieve the
        # result of segment estimate status.

        @[JSON::Field(key: "EstimateId")]
        getter estimate_id : String?

        # The status code for the response.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        def initialize(
          @domain_name : String? = nil,
          @estimate_id : String? = nil,
          @status_code : Int32? = nil
        )
        end
      end


      struct CreateSegmentSnapshotRequest
        include JSON::Serializable

        # The format in which the segment will be exported.

        @[JSON::Field(key: "DataFormat")]
        getter data_format : String

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the segment definition used in this snapshot request.

        @[JSON::Field(key: "SegmentDefinitionName")]
        getter segment_definition_name : String

        # The destination to which the segment will be exported. This field must be provided if the request is
        # not submitted from the Amazon Connect Admin Website.

        @[JSON::Field(key: "DestinationUri")]
        getter destination_uri : String?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the exported segment.

        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : String?

        # The Amazon Resource Name (ARN) of the IAM role that allows Customer Profiles service principal to
        # assume the role for conducting KMS and S3 operations.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @data_format : String,
          @domain_name : String,
          @segment_definition_name : String,
          @destination_uri : String? = nil,
          @encryption_key : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct CreateSegmentSnapshotResponse
        include JSON::Serializable

        # The unique identifier of the segment snapshot.

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String

        def initialize(
          @snapshot_id : String
        )
        end
      end


      struct CreateUploadJobRequest
        include JSON::Serializable

        # The unique name of the upload job. Could be a file name to identify the upload job.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # The unique name of the domain. Domain should be exists for the upload job to be created.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The mapping between CSV Columns and Profile Object attributes. A map of the name and ObjectType
        # field.

        @[JSON::Field(key: "Fields")]
        getter fields : Hash(String, Types::ObjectTypeField)

        # The unique key columns for de-duping the profiles used to map data to the profile.

        @[JSON::Field(key: "UniqueKey")]
        getter unique_key : String

        # The expiry duration for the profiles ingested with the job. If not provided, the system default of 2
        # weeks is used.

        @[JSON::Field(key: "DataExpiry")]
        getter data_expiry : Int32?

        def initialize(
          @display_name : String,
          @domain_name : String,
          @fields : Hash(String, Types::ObjectTypeField),
          @unique_key : String,
          @data_expiry : Int32? = nil
        )
        end
      end


      struct CreateUploadJobResponse
        include JSON::Serializable

        # The unique identifier for the created upload job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      # The data store request.

      struct DataStoreRequest
        include JSON::Serializable

        # Enabled: Set to true to enabled data store for this domain.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # The data store response.

      struct DataStoreResponse
        include JSON::Serializable

        # True if data store is enabled for this domain

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?


        @[JSON::Field(key: "Readiness")]
        getter readiness : Types::Readiness?

        def initialize(
          @enabled : Bool? = nil,
          @readiness : Types::Readiness? = nil
        )
        end
      end

      # Object that segments on various Customer Profile's date fields.

      struct DateDimension
        include JSON::Serializable

        # The action to segment with.

        @[JSON::Field(key: "DimensionType")]
        getter dimension_type : String

        # The values to apply the DimensionType on.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @dimension_type : String,
          @values : Array(String)
        )
        end
      end


      struct DeleteCalculatedAttributeDefinitionRequest
        include JSON::Serializable

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @calculated_attribute_name : String,
          @domain_name : String
        )
        end
      end


      struct DeleteCalculatedAttributeDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDomainLayoutRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the layout.

        @[JSON::Field(key: "LayoutDefinitionName")]
        getter layout_definition_name : String

        def initialize(
          @domain_name : String,
          @layout_definition_name : String
        )
        end
      end


      struct DeleteDomainLayoutResponse
        include JSON::Serializable

        # A message that indicates the delete request is done.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct DeleteDomainObjectTypeRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the domain object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        def initialize(
          @domain_name : String,
          @object_type_name : String
        )
        end
      end


      struct DeleteDomainObjectTypeResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDomainRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct DeleteDomainResponse
        include JSON::Serializable

        # A message that indicates the delete request is done.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct DeleteEventStreamRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the event stream

        @[JSON::Field(key: "EventStreamName")]
        getter event_stream_name : String

        def initialize(
          @domain_name : String,
          @event_stream_name : String
        )
        end
      end


      struct DeleteEventStreamResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteEventTriggerRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the event trigger.

        @[JSON::Field(key: "EventTriggerName")]
        getter event_trigger_name : String

        def initialize(
          @domain_name : String,
          @event_trigger_name : String
        )
        end
      end


      struct DeleteEventTriggerResponse
        include JSON::Serializable

        # A message that indicates the delete request is done.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct DeleteIntegrationRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The URI of the S3 bucket or any other type of data source.

        @[JSON::Field(key: "Uri")]
        getter uri : String

        def initialize(
          @domain_name : String,
          @uri : String
        )
        end
      end


      struct DeleteIntegrationResponse
        include JSON::Serializable

        # A message that indicates the delete request is done.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct DeleteProfileKeyRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A searchable identifier of a customer profile.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # A list of key values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @domain_name : String,
          @key_name : String,
          @profile_id : String,
          @values : Array(String)
        )
        end
      end


      struct DeleteProfileKeyResponse
        include JSON::Serializable

        # A message that indicates the delete request is done.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteProfileObjectRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # The unique identifier of the profile object generated by the service.

        @[JSON::Field(key: "ProfileObjectUniqueKey")]
        getter profile_object_unique_key : String

        def initialize(
          @domain_name : String,
          @object_type_name : String,
          @profile_id : String,
          @profile_object_unique_key : String
        )
        end
      end


      struct DeleteProfileObjectResponse
        include JSON::Serializable

        # A message that indicates the delete request is done.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteProfileObjectTypeRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        def initialize(
          @domain_name : String,
          @object_type_name : String
        )
        end
      end


      struct DeleteProfileObjectTypeResponse
        include JSON::Serializable

        # A message that indicates the delete request is done.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct DeleteProfileRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @domain_name : String,
          @profile_id : String
        )
        end
      end


      struct DeleteProfileResponse
        include JSON::Serializable

        # A message that indicates the delete request is done.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteRecommenderRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The recommender name.

        @[JSON::Field(key: "RecommenderName")]
        getter recommender_name : String

        def initialize(
          @domain_name : String,
          @recommender_name : String
        )
        end
      end


      struct DeleteRecommenderResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSegmentDefinitionRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the segment definition.

        @[JSON::Field(key: "SegmentDefinitionName")]
        getter segment_definition_name : String

        def initialize(
          @domain_name : String,
          @segment_definition_name : String
        )
        end
      end


      struct DeleteSegmentDefinitionResponse
        include JSON::Serializable

        # A message that indicates the delete request is done.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteWorkflowRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Unique identifier for the workflow.

        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        def initialize(
          @domain_name : String,
          @workflow_id : String
        )
        end
      end


      struct DeleteWorkflowResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Summary information about the Kinesis data stream

      struct DestinationSummary
        include JSON::Serializable

        # The status of enabling the Kinesis stream as a destination for export.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The StreamARN of the destination to deliver profile events to. For example,
        # arn:aws:kinesis:region:account-id:stream/stream-name.

        @[JSON::Field(key: "Uri")]
        getter uri : String

        # The timestamp when the status last changed to UNHEALHY .

        @[JSON::Field(key: "UnhealthySince")]
        getter unhealthy_since : Time?

        def initialize(
          @status : String,
          @uri : String,
          @unhealthy_since : Time? = nil
        )
        end
      end


      struct DetectProfileObjectTypeRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A string that is serialized from a JSON object.

        @[JSON::Field(key: "Objects")]
        getter objects : Array(String)

        def initialize(
          @domain_name : String,
          @objects : Array(String)
        )
        end
      end


      struct DetectProfileObjectTypeResponse
        include JSON::Serializable

        # Detected ProfileObjectType mappings from given objects. A maximum of one mapping is supported.

        @[JSON::Field(key: "DetectedProfileObjectTypes")]
        getter detected_profile_object_types : Array(Types::DetectedProfileObjectType)?

        def initialize(
          @detected_profile_object_types : Array(Types::DetectedProfileObjectType)? = nil
        )
        end
      end

      # Contains ProfileObjectType mapping information from the model.

      struct DetectedProfileObjectType
        include JSON::Serializable

        # A map of the name and the ObjectType field.

        @[JSON::Field(key: "Fields")]
        getter fields : Hash(String, Types::ObjectTypeField)?

        # A list of unique keys that can be used to map data to a profile.

        @[JSON::Field(key: "Keys")]
        getter keys : Hash(String, Array(Types::ObjectTypeKey))?

        # The format of sourceLastUpdatedTimestamp that was detected in fields.

        @[JSON::Field(key: "SourceLastUpdatedTimestampFormat")]
        getter source_last_updated_timestamp_format : String?

        def initialize(
          @fields : Hash(String, Types::ObjectTypeField)? = nil,
          @keys : Hash(String, Array(Types::ObjectTypeKey))? = nil,
          @source_last_updated_timestamp_format : String? = nil
        )
        end
      end

      # Object that holds what profile and calculated attributes to segment on.

      struct Dimension
        include JSON::Serializable

        # Object that holds the calculated attributes to segment on.

        @[JSON::Field(key: "CalculatedAttributes")]
        getter calculated_attributes : Hash(String, Types::CalculatedAttributeDimension)?

        # Object that holds the profile attributes to segment on.

        @[JSON::Field(key: "ProfileAttributes")]
        getter profile_attributes : Types::ProfileAttributes?

        def initialize(
          @calculated_attributes : Hash(String, Types::CalculatedAttributeDimension)? = nil,
          @profile_attributes : Types::ProfileAttributes? = nil
        )
        end
      end

      # The standard domain object type.

      struct DomainObjectTypeField
        include JSON::Serializable

        # The expression that defines how to extract the field value from the source object.&gt;

        @[JSON::Field(key: "Source")]
        getter source : String

        # The expression that defines where the field value should be placed in the standard domain object.

        @[JSON::Field(key: "Target")]
        getter target : String

        # The content type of the field.

        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # The semantic meaning of the field.

        @[JSON::Field(key: "FeatureType")]
        getter feature_type : String?

        def initialize(
          @source : String,
          @target : String,
          @content_type : String? = nil,
          @feature_type : String? = nil
        )
        end
      end

      # Represents an item in the list of domain object types, containing basic information about a specific
      # object type within a domain.

      struct DomainObjectTypesListItem
        include JSON::Serializable

        # The name that identifies the object type within the domain.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # The timestamp of when the domain object type was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A description explaining the purpose and characteristics of this object type.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The timestamp of when the domain object type was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @object_type_name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @last_updated_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Usage-specific statistics about the domain.

      struct DomainStats
        include JSON::Serializable

        # The number of profiles that you are currently paying for in the domain. If you have more than 100
        # objects associated with a single profile, that profile counts as two profiles. If you have more than
        # 200 objects, that profile counts as three, and so on.

        @[JSON::Field(key: "MeteringProfileCount")]
        getter metering_profile_count : Int64?

        # The total number of objects in domain.

        @[JSON::Field(key: "ObjectCount")]
        getter object_count : Int64?

        # The total number of profiles currently in the domain.

        @[JSON::Field(key: "ProfileCount")]
        getter profile_count : Int64?

        # The total size, in bytes, of all objects in the domain.

        @[JSON::Field(key: "TotalSize")]
        getter total_size : Int64?

        def initialize(
          @metering_profile_count : Int64? = nil,
          @object_count : Int64? = nil,
          @profile_count : Int64? = nil,
          @total_size : Int64? = nil
        )
        end
      end

      # Object that defines users preferred methods of engagement.

      struct EngagementPreferences
        include JSON::Serializable

        # A list of email-related contact preferences

        @[JSON::Field(key: "Email")]
        getter email : Array(Types::ContactPreference)?

        # A list of phone-related contact preferences

        @[JSON::Field(key: "Phone")]
        getter phone : Array(Types::ContactPreference)?

        def initialize(
          @email : Array(Types::ContactPreference)? = nil,
          @phone : Array(Types::ContactPreference)? = nil
        )
        end
      end

      # Configuration parameters for events in the personalization system.

      struct EventParameters
        include JSON::Serializable

        # The type of event being tracked (e.g., 'click', 'purchase', 'view').

        @[JSON::Field(key: "EventType")]
        getter event_type : String

        # The minimum value threshold that an event must meet to be considered valid.

        @[JSON::Field(key: "EventValueThreshold")]
        getter event_value_threshold : Float64?

        def initialize(
          @event_type : String,
          @event_value_threshold : Float64? = nil
        )
        end
      end

      # Details of the destination being used for the EventStream.

      struct EventStreamDestinationDetails
        include JSON::Serializable

        # The status of enabling the Kinesis stream as a destination for export.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The StreamARN of the destination to deliver profile events to. For example,
        # arn:aws:kinesis:region:account-id:stream/stream-name.

        @[JSON::Field(key: "Uri")]
        getter uri : String

        # The human-readable string that corresponds to the error or success while enabling the streaming
        # destination.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The timestamp when the status last changed to UNHEALHY .

        @[JSON::Field(key: "UnhealthySince")]
        getter unhealthy_since : Time?

        def initialize(
          @status : String,
          @uri : String,
          @message : String? = nil,
          @unhealthy_since : Time? = nil
        )
        end
      end

      # An instance of EventStream in a list of EventStreams.

      struct EventStreamSummary
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A unique identifier for the event stream.

        @[JSON::Field(key: "EventStreamArn")]
        getter event_stream_arn : String

        # The name of the event stream.

        @[JSON::Field(key: "EventStreamName")]
        getter event_stream_name : String

        # The operational state of destination stream for export.

        @[JSON::Field(key: "State")]
        getter state : String

        # Summary information about the Kinesis data stream.

        @[JSON::Field(key: "DestinationSummary")]
        getter destination_summary : Types::DestinationSummary?

        # The timestamp when the State changed to STOPPED .

        @[JSON::Field(key: "StoppedSince")]
        getter stopped_since : Time?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_name : String,
          @event_stream_arn : String,
          @event_stream_name : String,
          @state : String,
          @destination_summary : Types::DestinationSummary? = nil,
          @stopped_since : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Specifies the circumstances under which the event should trigger the destination.

      struct EventTriggerCondition
        include JSON::Serializable

        # A list of dimensions to be evaluated for the event.

        @[JSON::Field(key: "EventTriggerDimensions")]
        getter event_trigger_dimensions : Array(Types::EventTriggerDimension)

        # The operator used to combine multiple dimensions.

        @[JSON::Field(key: "LogicalOperator")]
        getter logical_operator : String

        def initialize(
          @event_trigger_dimensions : Array(Types::EventTriggerDimension),
          @logical_operator : String
        )
        end
      end

      # A specific event dimension to be assessed.

      struct EventTriggerDimension
        include JSON::Serializable

        # A list of object attributes to be evaluated.

        @[JSON::Field(key: "ObjectAttributes")]
        getter object_attributes : Array(Types::ObjectAttribute)

        def initialize(
          @object_attributes : Array(Types::ObjectAttribute)
        )
        end
      end

      # Defines limits controlling whether an event triggers the destination, based on ingestion latency and
      # the number of invocations per profile over specific time periods.

      struct EventTriggerLimits
        include JSON::Serializable

        # In milliseconds. Specifies that an event will only trigger the destination if it is processed within
        # a certain latency period.

        @[JSON::Field(key: "EventExpiration")]
        getter event_expiration : Int64?

        # A list of time periods during which the limits apply.

        @[JSON::Field(key: "Periods")]
        getter periods : Array(Types::Period)?

        def initialize(
          @event_expiration : Int64? = nil,
          @periods : Array(Types::Period)? = nil
        )
        end
      end

      # The summary of the event trigger.

      struct EventTriggerSummaryItem
        include JSON::Serializable

        # The timestamp of when the event trigger was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the event trigger.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique name of the event trigger.

        @[JSON::Field(key: "EventTriggerName")]
        getter event_trigger_name : String?

        # The timestamp of when the event trigger was most recently updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The unique name of the object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String?

        # An array of key-value pairs to apply to this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @event_trigger_name : String? = nil,
          @last_updated_at : Time? = nil,
          @object_type_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Configuration settings that define how events are processed and tracked.

      struct EventsConfig
        include JSON::Serializable

        # A list of event parameters configurations that specify how different event types should be handled.

        @[JSON::Field(key: "EventParametersList")]
        getter event_parameters_list : Array(Types::EventParameters)

        def initialize(
          @event_parameters_list : Array(Types::EventParameters)
        )
        end
      end

      # Configuration information about the S3 bucket where Identity Resolution Jobs writes result files.
      # You need to give Customer Profiles service principal write permission to your S3 bucket. Otherwise,
      # you'll get an exception in the API response. For an example policy, see Amazon Connect Customer
      # Profiles cross-service confused deputy prevention .

      struct ExportingConfig
        include JSON::Serializable

        # The S3 location where Identity Resolution Jobs write result files.

        @[JSON::Field(key: "S3Exporting")]
        getter s3_exporting : Types::S3ExportingConfig?

        def initialize(
          @s3_exporting : Types::S3ExportingConfig? = nil
        )
        end
      end

      # The S3 location where Identity Resolution Jobs write result files.

      struct ExportingLocation
        include JSON::Serializable

        # Information about the S3 location where Identity Resolution Jobs write result files.

        @[JSON::Field(key: "S3Exporting")]
        getter s3_exporting : Types::S3ExportingLocation?

        def initialize(
          @s3_exporting : Types::S3ExportingLocation? = nil
        )
        end
      end

      # Object that segments on various Customer profile's fields that are larger than normal.

      struct ExtraLengthValueProfileDimension
        include JSON::Serializable

        # The action to segment with.

        @[JSON::Field(key: "DimensionType")]
        getter dimension_type : String

        # The values to apply the DimensionType on.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @dimension_type : String,
          @values : Array(String)
        )
        end
      end

      # A duplicate customer profile that is to be merged into a main profile.

      struct FieldSourceProfileIds
        include JSON::Serializable

        # A unique identifier for the account number field to be merged.

        @[JSON::Field(key: "AccountNumber")]
        getter account_number : String?

        # A unique identifier for the additional information field to be merged.

        @[JSON::Field(key: "AdditionalInformation")]
        getter additional_information : String?

        # A unique identifier for the party type field to be merged.

        @[JSON::Field(key: "Address")]
        getter address : String?

        # A unique identifier for the attributes field to be merged.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # A unique identifier for the billing type field to be merged.

        @[JSON::Field(key: "BillingAddress")]
        getter billing_address : String?

        # A unique identifier for the birthdate field to be merged.

        @[JSON::Field(key: "BirthDate")]
        getter birth_date : String?

        # A unique identifier for the party type field to be merged.

        @[JSON::Field(key: "BusinessEmailAddress")]
        getter business_email_address : String?

        # A unique identifier for the business name field to be merged.

        @[JSON::Field(key: "BusinessName")]
        getter business_name : String?

        # A unique identifier for the business phone number field to be merged.

        @[JSON::Field(key: "BusinessPhoneNumber")]
        getter business_phone_number : String?

        # A unique identifier for the email address field to be merged.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # A unique identifier for the engagement preferences field to be merged.

        @[JSON::Field(key: "EngagementPreferences")]
        getter engagement_preferences : String?

        # A unique identifier for the first name field to be merged.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # A unique identifier for the gender field to be merged.

        @[JSON::Field(key: "Gender")]
        getter gender : String?

        # A unique identifier for the home phone number field to be merged.

        @[JSON::Field(key: "HomePhoneNumber")]
        getter home_phone_number : String?

        # A unique identifier for the last name field to be merged.

        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # A unique identifier for the mailing address field to be merged.

        @[JSON::Field(key: "MailingAddress")]
        getter mailing_address : String?

        # A unique identifier for the middle name field to be merged.

        @[JSON::Field(key: "MiddleName")]
        getter middle_name : String?

        # A unique identifier for the mobile phone number field to be merged.

        @[JSON::Field(key: "MobilePhoneNumber")]
        getter mobile_phone_number : String?

        # A unique identifier for the party type field to be merged.

        @[JSON::Field(key: "PartyType")]
        getter party_type : String?

        # A unique identifier for the personal email address field to be merged.

        @[JSON::Field(key: "PersonalEmailAddress")]
        getter personal_email_address : String?

        # A unique identifier for the phone number field to be merged.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # A unique identifier for the profile type field to be merged.

        @[JSON::Field(key: "ProfileType")]
        getter profile_type : String?

        # A unique identifier for the shipping address field to be merged.

        @[JSON::Field(key: "ShippingAddress")]
        getter shipping_address : String?

        def initialize(
          @account_number : String? = nil,
          @additional_information : String? = nil,
          @address : String? = nil,
          @attributes : Hash(String, String)? = nil,
          @billing_address : String? = nil,
          @birth_date : String? = nil,
          @business_email_address : String? = nil,
          @business_name : String? = nil,
          @business_phone_number : String? = nil,
          @email_address : String? = nil,
          @engagement_preferences : String? = nil,
          @first_name : String? = nil,
          @gender : String? = nil,
          @home_phone_number : String? = nil,
          @last_name : String? = nil,
          @mailing_address : String? = nil,
          @middle_name : String? = nil,
          @mobile_phone_number : String? = nil,
          @party_type : String? = nil,
          @personal_email_address : String? = nil,
          @phone_number : String? = nil,
          @profile_type : String? = nil,
          @shipping_address : String? = nil
        )
        end
      end

      # Defines how to filter the objects coming in for calculated attributes.

      struct Filter
        include JSON::Serializable

        # Holds the list of Filter groups within the Filter definition.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::FilterGroup)

        # Define whether to include or exclude objects for Calculated Attributed calculation that fit the
        # filter groups criteria.

        @[JSON::Field(key: "Include")]
        getter include : String

        def initialize(
          @groups : Array(Types::FilterGroup),
          @include : String
        )
        end
      end

      # Object that defines how to filter the incoming objects for the calculated attribute.

      struct FilterAttributeDimension
        include JSON::Serializable

        # The action to filter with.

        @[JSON::Field(key: "DimensionType")]
        getter dimension_type : String

        # The values to apply the DimensionType on.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @dimension_type : String,
          @values : Array(String)
        )
        end
      end

      # Contains the map of attribute names to attribute dimensions.

      struct FilterDimension
        include JSON::Serializable

        # Is the attribute within the FilterDimension map

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, Types::FilterAttributeDimension)

        def initialize(
          @attributes : Hash(String, Types::FilterAttributeDimension)
        )
        end
      end

      # Object that holds the dimensions to filter on.

      struct FilterGroup
        include JSON::Serializable

        # Object that holds the attributes to filter on.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::FilterDimension)

        # The type of logical relationship between the dimensions of the Filter group.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @dimensions : Array(Types::FilterDimension),
          @type : String
        )
        end
      end

      # The configurations that control how Customer Profiles retrieves data from the source, Amazon
      # AppFlow. Customer Profiles uses this information to create an AppFlow flow on behalf of customers.

      struct FlowDefinition
        include JSON::Serializable

        # The specified name of the flow. Use underscores (_) or hyphens (-) only. Spaces are not allowed.

        @[JSON::Field(key: "FlowName")]
        getter flow_name : String

        # The Amazon Resource Name of the AWS Key Management Service (KMS) key you provide for encryption.

        @[JSON::Field(key: "KmsArn")]
        getter kms_arn : String

        # The configuration that controls how Customer Profiles retrieves data from the source.

        @[JSON::Field(key: "SourceFlowConfig")]
        getter source_flow_config : Types::SourceFlowConfig

        # A list of tasks that Customer Profiles performs while transferring the data in the flow run.

        @[JSON::Field(key: "Tasks")]
        getter tasks : Array(Types::Task)

        # The trigger settings that determine how and when the flow runs.

        @[JSON::Field(key: "TriggerConfig")]
        getter trigger_config : Types::TriggerConfig

        # A description of the flow you want to create.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @flow_name : String,
          @kms_arn : String,
          @source_flow_config : Types::SourceFlowConfig,
          @tasks : Array(Types::Task),
          @trigger_config : Types::TriggerConfig,
          @description : String? = nil
        )
        end
      end

      # A data type pair that consists of a KeyName and Values list that were used to find a profile
      # returned in response to a SearchProfiles request.

      struct FoundByKeyValue
        include JSON::Serializable

        # A searchable identifier of a customer profile.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String?

        # A list of key values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key_name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end


      struct GetAutoMergingPreviewRequest
        include JSON::Serializable

        # How the auto-merging process should resolve conflicts between different profiles.

        @[JSON::Field(key: "ConflictResolution")]
        getter conflict_resolution : Types::ConflictResolution

        # A list of matching attributes that represent matching criteria.

        @[JSON::Field(key: "Consolidation")]
        getter consolidation : Types::Consolidation

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Minimum confidence score required for profiles within a matching group to be merged during the
        # auto-merge process.

        @[JSON::Field(key: "MinAllowedConfidenceScoreForMerging")]
        getter min_allowed_confidence_score_for_merging : Float64?

        def initialize(
          @conflict_resolution : Types::ConflictResolution,
          @consolidation : Types::Consolidation,
          @domain_name : String,
          @min_allowed_confidence_score_for_merging : Float64? = nil
        )
        end
      end


      struct GetAutoMergingPreviewResponse
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The number of match groups in the domain that have been reviewed in this preview dry run.

        @[JSON::Field(key: "NumberOfMatchesInSample")]
        getter number_of_matches_in_sample : Int64?

        # The number of profiles found in this preview dry run.

        @[JSON::Field(key: "NumberOfProfilesInSample")]
        getter number_of_profiles_in_sample : Int64?

        # The number of profiles that would be merged if this wasn't a preview dry run.

        @[JSON::Field(key: "NumberOfProfilesWillBeMerged")]
        getter number_of_profiles_will_be_merged : Int64?

        def initialize(
          @domain_name : String,
          @number_of_matches_in_sample : Int64? = nil,
          @number_of_profiles_in_sample : Int64? = nil,
          @number_of_profiles_will_be_merged : Int64? = nil
        )
        end
      end


      struct GetCalculatedAttributeDefinitionRequest
        include JSON::Serializable

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @calculated_attribute_name : String,
          @domain_name : String
        )
        end
      end


      struct GetCalculatedAttributeDefinitionResponse
        include JSON::Serializable

        # Mathematical expression and a list of attribute items specified in that expression.

        @[JSON::Field(key: "AttributeDetails")]
        getter attribute_details : Types::AttributeDetails?

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String?

        # The conditions including range, object count, and threshold for the calculated attribute.

        @[JSON::Field(key: "Conditions")]
        getter conditions : Types::Conditions?

        # The timestamp of when the calculated attribute definition was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the calculated attribute.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the calculated attribute.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The filter assigned to this calculated attribute definition.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Filter?

        # The timestamp of when the calculated attribute definition was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # Information indicating if the Calculated Attribute is ready for use by confirming all historical
        # data has been processed and reflected.

        @[JSON::Field(key: "Readiness")]
        getter readiness : Types::Readiness?

        # The aggregation operation to perform for the calculated attribute.

        @[JSON::Field(key: "Statistic")]
        getter statistic : String?

        # Status of the Calculated Attribute creation (whether all historical data has been indexed).

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # Whether historical data ingested before the Calculated Attribute was created should be included in
        # calculations.

        @[JSON::Field(key: "UseHistoricalData")]
        getter use_historical_data : Bool?

        def initialize(
          @attribute_details : Types::AttributeDetails? = nil,
          @calculated_attribute_name : String? = nil,
          @conditions : Types::Conditions? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @filter : Types::Filter? = nil,
          @last_updated_at : Time? = nil,
          @readiness : Types::Readiness? = nil,
          @statistic : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @use_historical_data : Bool? = nil
        )
        end
      end


      struct GetCalculatedAttributeForProfileRequest
        include JSON::Serializable

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @calculated_attribute_name : String,
          @domain_name : String,
          @profile_id : String
        )
        end
      end


      struct GetCalculatedAttributeForProfileResponse
        include JSON::Serializable

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String?

        # The display name of the calculated attribute.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Indicates whether the calculated attribute’s value is based on partial data. If data is partial, it
        # is set to true.

        @[JSON::Field(key: "IsDataPartial")]
        getter is_data_partial : String?

        # The timestamp of the newest object included in the calculated attribute calculation.

        @[JSON::Field(key: "LastObjectTimestamp")]
        getter last_object_timestamp : Time?

        # The value of the calculated attribute.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @calculated_attribute_name : String? = nil,
          @display_name : String? = nil,
          @is_data_partial : String? = nil,
          @last_object_timestamp : Time? = nil,
          @value : String? = nil
        )
        end
      end


      struct GetDomainLayoutRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the layout.

        @[JSON::Field(key: "LayoutDefinitionName")]
        getter layout_definition_name : String

        def initialize(
          @domain_name : String,
          @layout_definition_name : String
        )
        end
      end


      struct GetDomainLayoutResponse
        include JSON::Serializable

        # The timestamp of when the layout was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The description of the layout

        @[JSON::Field(key: "Description")]
        getter description : String

        # The display name of the layout

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # The timestamp of when the layout was most recently updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # A customizable layout that can be used to view data under a Customer Profiles domain.

        @[JSON::Field(key: "Layout")]
        getter layout : String

        # The unique name of the layout.

        @[JSON::Field(key: "LayoutDefinitionName")]
        getter layout_definition_name : String

        # The type of layout that can be used to view data under a Customer Profiles domain.

        @[JSON::Field(key: "LayoutType")]
        getter layout_type : String

        # The version used to create layout.

        @[JSON::Field(key: "Version")]
        getter version : String

        # If set to true for a layout, this layout will be used by default to view data. If set to false, then
        # the layout will not be used by default, but it can be used to view data by explicitly selecting it
        # in the console.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @description : String,
          @display_name : String,
          @last_updated_at : Time,
          @layout : String,
          @layout_definition_name : String,
          @layout_type : String,
          @version : String,
          @is_default : Bool? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetDomainObjectTypeRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the domain object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        def initialize(
          @domain_name : String,
          @object_type_name : String
        )
        end
      end


      struct GetDomainObjectTypeResponse
        include JSON::Serializable

        # The unique name of the domain object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # The timestamp of when the domain object type was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the domain object type.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The customer provided KMS key used to encrypt this type of domain object.

        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : String?

        # A map of field names to their corresponding domain object type field definitions.

        @[JSON::Field(key: "Fields")]
        getter fields : Hash(String, Types::DomainObjectTypeField)?

        # The timestamp of when the domain object type was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @object_type_name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @encryption_key : String? = nil,
          @fields : Hash(String, Types::DomainObjectTypeField)? = nil,
          @last_updated_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetDomainRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct GetDomainResponse
        include JSON::Serializable

        # The timestamp of when the domain was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The timestamp of when the domain was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # True if data store is enabled for this domain.

        @[JSON::Field(key: "DataStore")]
        getter data_store : Types::DataStoreResponse?

        # The URL of the SQS dead letter queue, which is used for reporting errors associated with ingesting
        # data from third party applications.

        @[JSON::Field(key: "DeadLetterQueueUrl")]
        getter dead_letter_queue_url : String?

        # The default encryption key, which is an AWS managed key, is used when no specific type of encryption
        # key is specified. It is used to encrypt all data before it is placed in permanent or semi-permanent
        # storage.

        @[JSON::Field(key: "DefaultEncryptionKey")]
        getter default_encryption_key : String?

        # The default number of days until the data within the domain expires.

        @[JSON::Field(key: "DefaultExpirationDays")]
        getter default_expiration_days : Int32?

        # The process of matching duplicate profiles. If Matching = true , Amazon Connect Customer Profiles
        # starts a weekly batch process called Identity Resolution Job. If you do not specify a date and time
        # for Identity Resolution Job to run, by default it runs every Saturday at 12AM UTC to detect
        # duplicate profiles in your domains. After the Identity Resolution Job completes, use the GetMatches
        # API to return and review the results. Or, if you have configured ExportingConfig in the
        # MatchingRequest , you can download the results from S3.

        @[JSON::Field(key: "Matching")]
        getter matching : Types::MatchingResponse?

        # The process of matching duplicate profiles using the Rule-Based matching. If RuleBasedMatching =
        # true, Amazon Connect Customer Profiles will start to match and merge your profiles according to your
        # configuration in the RuleBasedMatchingRequest . You can use the ListRuleBasedMatches and
        # GetSimilarProfiles API to return and review the results. Also, if you have configured
        # ExportingConfig in the RuleBasedMatchingRequest , you can download the results from S3.

        @[JSON::Field(key: "RuleBasedMatching")]
        getter rule_based_matching : Types::RuleBasedMatchingResponse?

        # Usage-specific statistics about the domain.

        @[JSON::Field(key: "Stats")]
        getter stats : Types::DomainStats?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @domain_name : String,
          @last_updated_at : Time,
          @data_store : Types::DataStoreResponse? = nil,
          @dead_letter_queue_url : String? = nil,
          @default_encryption_key : String? = nil,
          @default_expiration_days : Int32? = nil,
          @matching : Types::MatchingResponse? = nil,
          @rule_based_matching : Types::RuleBasedMatchingResponse? = nil,
          @stats : Types::DomainStats? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetEventStreamRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the event stream provided during create operations.

        @[JSON::Field(key: "EventStreamName")]
        getter event_stream_name : String

        def initialize(
          @domain_name : String,
          @event_stream_name : String
        )
        end
      end


      struct GetEventStreamResponse
        include JSON::Serializable

        # The timestamp of when the export was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # Details regarding the Kinesis stream.

        @[JSON::Field(key: "DestinationDetails")]
        getter destination_details : Types::EventStreamDestinationDetails

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A unique identifier for the event stream.

        @[JSON::Field(key: "EventStreamArn")]
        getter event_stream_arn : String

        # The operational state of destination stream for export.

        @[JSON::Field(key: "State")]
        getter state : String

        # The timestamp when the State changed to STOPPED .

        @[JSON::Field(key: "StoppedSince")]
        getter stopped_since : Time?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @destination_details : Types::EventStreamDestinationDetails,
          @domain_name : String,
          @event_stream_arn : String,
          @state : String,
          @stopped_since : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetEventTriggerRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the event trigger.

        @[JSON::Field(key: "EventTriggerName")]
        getter event_trigger_name : String

        def initialize(
          @domain_name : String,
          @event_trigger_name : String
        )
        end
      end


      struct GetEventTriggerResponse
        include JSON::Serializable

        # The timestamp of when the event trigger was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the event trigger.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of conditions that determine when an event should trigger the destination.

        @[JSON::Field(key: "EventTriggerConditions")]
        getter event_trigger_conditions : Array(Types::EventTriggerCondition)?

        # Defines limits controlling whether an event triggers the destination, based on ingestion latency and
        # the number of invocations per profile over specific time periods.

        @[JSON::Field(key: "EventTriggerLimits")]
        getter event_trigger_limits : Types::EventTriggerLimits?

        # The unique name of the event trigger.

        @[JSON::Field(key: "EventTriggerName")]
        getter event_trigger_name : String?

        # The timestamp of when the event trigger was most recently updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The unique name of the object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String?

        # The destination is triggered only for profiles that meet the criteria of a segment definition.

        @[JSON::Field(key: "SegmentFilter")]
        getter segment_filter : String?

        # An array of key-value pairs to apply to this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @event_trigger_conditions : Array(Types::EventTriggerCondition)? = nil,
          @event_trigger_limits : Types::EventTriggerLimits? = nil,
          @event_trigger_name : String? = nil,
          @last_updated_at : Time? = nil,
          @object_type_name : String? = nil,
          @segment_filter : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetIdentityResolutionJobRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of the Identity Resolution Job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @domain_name : String,
          @job_id : String
        )
        end
      end


      struct GetIdentityResolutionJobResponse
        include JSON::Serializable

        # Configuration settings for how to perform the auto-merging of profiles.

        @[JSON::Field(key: "AutoMerging")]
        getter auto_merging : Types::AutoMerging?

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The S3 location where the Identity Resolution Job writes result files.

        @[JSON::Field(key: "ExportingLocation")]
        getter exporting_location : Types::ExportingLocation?

        # The timestamp of when the Identity Resolution Job was completed.

        @[JSON::Field(key: "JobEndTime")]
        getter job_end_time : Time?

        # The timestamp of when the Identity Resolution Job will expire.

        @[JSON::Field(key: "JobExpirationTime")]
        getter job_expiration_time : Time?

        # The unique identifier of the Identity Resolution Job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The timestamp of when the Identity Resolution Job was started or will be started.

        @[JSON::Field(key: "JobStartTime")]
        getter job_start_time : Time?

        # Statistics about the Identity Resolution Job.

        @[JSON::Field(key: "JobStats")]
        getter job_stats : Types::JobStats?

        # The timestamp of when the Identity Resolution Job was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The error messages that are generated when the Identity Resolution Job runs.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the Identity Resolution Job. PENDING : The Identity Resolution Job is scheduled but
        # has not started yet. If you turn off the Identity Resolution feature in your domain, jobs in the
        # PENDING state are deleted. PREPROCESSING : The Identity Resolution Job is loading your data.
        # FIND_MATCHING : The Identity Resolution Job is using the machine learning model to identify profiles
        # that belong to the same matching group. MERGING : The Identity Resolution Job is merging duplicate
        # profiles. COMPLETED : The Identity Resolution Job completed successfully. PARTIAL_SUCCESS : There's
        # a system error and not all of the data is merged. The Identity Resolution Job writes a message
        # indicating the source of the problem. FAILED : The Identity Resolution Job did not merge any data.
        # It writes a message indicating the source of the problem.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @auto_merging : Types::AutoMerging? = nil,
          @domain_name : String? = nil,
          @exporting_location : Types::ExportingLocation? = nil,
          @job_end_time : Time? = nil,
          @job_expiration_time : Time? = nil,
          @job_id : String? = nil,
          @job_start_time : Time? = nil,
          @job_stats : Types::JobStats? = nil,
          @last_updated_at : Time? = nil,
          @message : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetIntegrationRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The URI of the S3 bucket or any other type of data source.

        @[JSON::Field(key: "Uri")]
        getter uri : String

        def initialize(
          @domain_name : String,
          @uri : String
        )
        end
      end


      struct GetIntegrationResponse
        include JSON::Serializable

        # The timestamp of when the domain was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The timestamp of when the domain was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # The URI of the S3 bucket or any other type of data source.

        @[JSON::Field(key: "Uri")]
        getter uri : String

        # A list of unique names for active event triggers associated with the integration. This list would be
        # empty if no Event Trigger is associated with the integration.

        @[JSON::Field(key: "EventTriggerNames")]
        getter event_trigger_names : Array(String)?

        # Boolean that shows if the Flow that's associated with the Integration is created in Amazon Appflow,
        # or with ObjectTypeName equals _unstructured via API/CLI in flowDefinition.

        @[JSON::Field(key: "IsUnstructured")]
        getter is_unstructured : Bool?

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String?

        # A map in which each key is an event type from an external application such as Segment or Shopify,
        # and each value is an ObjectTypeName (template) used to ingest the event. It supports the following
        # event types: SegmentIdentify , ShopifyCreateCustomers , ShopifyUpdateCustomers ,
        # ShopifyCreateDraftOrders , ShopifyUpdateDraftOrders , ShopifyCreateOrders , and ShopifyUpdatedOrders
        # .

        @[JSON::Field(key: "ObjectTypeNames")]
        getter object_type_names : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the IAM role. The Integration uses this role to make Customer
        # Profiles requests on your behalf.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Specifies whether the integration applies to profile level data (associated with profiles) or domain
        # level data (not associated with any specific profile). The default value is PROFILE.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # Unique identifier for the workflow.

        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String?

        def initialize(
          @created_at : Time,
          @domain_name : String,
          @last_updated_at : Time,
          @uri : String,
          @event_trigger_names : Array(String)? = nil,
          @is_unstructured : Bool? = nil,
          @object_type_name : String? = nil,
          @object_type_names : Hash(String, String)? = nil,
          @role_arn : String? = nil,
          @scope : String? = nil,
          @tags : Hash(String, String)? = nil,
          @workflow_id : String? = nil
        )
        end
      end


      struct GetMatchesRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetMatchesResponse
        include JSON::Serializable

        # The timestamp this version of Match Result generated.

        @[JSON::Field(key: "MatchGenerationDate")]
        getter match_generation_date : Time?

        # The list of matched profiles for this instance.

        @[JSON::Field(key: "Matches")]
        getter matches : Array(Types::MatchItem)?

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of potential matches found.

        @[JSON::Field(key: "PotentialMatches")]
        getter potential_matches : Int32?

        def initialize(
          @match_generation_date : Time? = nil,
          @matches : Array(Types::MatchItem)? = nil,
          @next_token : String? = nil,
          @potential_matches : Int32? = nil
        )
        end
      end

      # Contains percentile statistics for object type attributes.

      struct GetObjectTypeAttributeStatisticsPercentiles
        include JSON::Serializable

        # The 25th percentile value of the attribute.

        @[JSON::Field(key: "P25")]
        getter p25 : Float64

        # The 5th percentile value of the attribute.

        @[JSON::Field(key: "P5")]
        getter p5 : Float64

        # The 50th percentile (median) value of the attribute.

        @[JSON::Field(key: "P50")]
        getter p50 : Float64

        # The 75th percentile value of the attribute.

        @[JSON::Field(key: "P75")]
        getter p75 : Float64

        # The 95th percentile value of the attribute.

        @[JSON::Field(key: "P95")]
        getter p95 : Float64

        def initialize(
          @p25 : Float64,
          @p5 : Float64,
          @p50 : Float64,
          @p75 : Float64,
          @p95 : Float64
        )
        end
      end


      struct GetObjectTypeAttributeStatisticsRequest
        include JSON::Serializable

        # The attribute name.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the domain object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        def initialize(
          @attribute_name : String,
          @domain_name : String,
          @object_type_name : String
        )
        end
      end


      struct GetObjectTypeAttributeStatisticsResponse
        include JSON::Serializable

        # Time when this statistics was calculated.

        @[JSON::Field(key: "CalculatedAt")]
        getter calculated_at : Time

        # The statistics.

        @[JSON::Field(key: "Statistics")]
        getter statistics : Types::GetObjectTypeAttributeStatisticsStats

        def initialize(
          @calculated_at : Time,
          @statistics : Types::GetObjectTypeAttributeStatisticsStats
        )
        end
      end

      # Statistical measurements for object type attributes including basic statistics and percentiles.

      struct GetObjectTypeAttributeStatisticsStats
        include JSON::Serializable

        # The arithmetic mean of the attribute values.

        @[JSON::Field(key: "Average")]
        getter average : Float64

        # The maximum value found in the attribute dataset.

        @[JSON::Field(key: "Maximum")]
        getter maximum : Float64

        # The minimum value found in the attribute dataset.

        @[JSON::Field(key: "Minimum")]
        getter minimum : Float64

        # Percentile distribution statistics for the attribute values.

        @[JSON::Field(key: "Percentiles")]
        getter percentiles : Types::GetObjectTypeAttributeStatisticsPercentiles

        # The standard deviation of the attribute values, measuring their spread around the mean.

        @[JSON::Field(key: "StandardDeviation")]
        getter standard_deviation : Float64

        def initialize(
          @average : Float64,
          @maximum : Float64,
          @minimum : Float64,
          @percentiles : Types::GetObjectTypeAttributeStatisticsPercentiles,
          @standard_deviation : Float64
        )
        end
      end


      struct GetProfileHistoryRecordRequest
        include JSON::Serializable

        # The unique name of the domain for which to return a profile history record.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of the profile history record to return.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The unique identifier of the profile for which to return a history record.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @domain_name : String,
          @id : String,
          @profile_id : String
        )
        end
      end


      struct GetProfileHistoryRecordResponse
        include JSON::Serializable

        # The action type of the profile history record.

        @[JSON::Field(key: "ActionType")]
        getter action_type : String

        # The timestamp of when the profile history record was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The unique identifier of the profile history record.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # A string containing the customer profile, profile object, or profile key content.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The timestamp of when the profile history record was last updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The Amazon Resource Name (ARN) of the person or service principal who performed the action.

        @[JSON::Field(key: "PerformedBy")]
        getter performed_by : String?

        # The unique identifier of the profile object generated by the service.

        @[JSON::Field(key: "ProfileObjectUniqueKey")]
        getter profile_object_unique_key : String?

        def initialize(
          @action_type : String,
          @created_at : Time,
          @id : String,
          @object_type_name : String,
          @content : String? = nil,
          @last_updated_at : Time? = nil,
          @performed_by : String? = nil,
          @profile_object_unique_key : String? = nil
        )
        end
      end


      struct GetProfileObjectTypeRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        def initialize(
          @domain_name : String,
          @object_type_name : String
        )
        end
      end


      struct GetProfileObjectTypeResponse
        include JSON::Serializable

        # The description of the profile object type.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # Indicates whether a profile should be created when data is received if one doesn’t exist for an
        # object of this type. The default is FALSE . If the AllowProfileCreation flag is set to FALSE , then
        # the service tries to fetch a standard profile and associate this object with the profile. If it is
        # set to TRUE , and if no match is found, then the service creates a new standard profile.

        @[JSON::Field(key: "AllowProfileCreation")]
        getter allow_profile_creation : Bool?

        # The timestamp of when the domain was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The customer-provided key to encrypt the profile object that will be created in this profile object
        # type.

        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : String?

        # The number of days until the data in the object expires.

        @[JSON::Field(key: "ExpirationDays")]
        getter expiration_days : Int32?

        # A map of the name and ObjectType field.

        @[JSON::Field(key: "Fields")]
        getter fields : Hash(String, Types::ObjectTypeField)?

        # A list of unique keys that can be used to map data to the profile.

        @[JSON::Field(key: "Keys")]
        getter keys : Hash(String, Array(Types::ObjectTypeKey))?

        # The timestamp of when the domain was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The amount of provisioned profile object max count available.

        @[JSON::Field(key: "MaxAvailableProfileObjectCount")]
        getter max_available_profile_object_count : Int32?

        # The amount of profile object max count assigned to the object type.

        @[JSON::Field(key: "MaxProfileObjectCount")]
        getter max_profile_object_count : Int32?

        # The format of your sourceLastUpdatedTimestamp that was previously set up.

        @[JSON::Field(key: "SourceLastUpdatedTimestampFormat")]
        getter source_last_updated_timestamp_format : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # A unique identifier for the object template.

        @[JSON::Field(key: "TemplateId")]
        getter template_id : String?

        def initialize(
          @description : String,
          @object_type_name : String,
          @allow_profile_creation : Bool? = nil,
          @created_at : Time? = nil,
          @encryption_key : String? = nil,
          @expiration_days : Int32? = nil,
          @fields : Hash(String, Types::ObjectTypeField)? = nil,
          @keys : Hash(String, Array(Types::ObjectTypeKey))? = nil,
          @last_updated_at : Time? = nil,
          @max_available_profile_object_count : Int32? = nil,
          @max_profile_object_count : Int32? = nil,
          @source_last_updated_timestamp_format : String? = nil,
          @tags : Hash(String, String)? = nil,
          @template_id : String? = nil
        )
        end
      end


      struct GetProfileObjectTypeTemplateRequest
        include JSON::Serializable

        # A unique identifier for the object template.

        @[JSON::Field(key: "TemplateId")]
        getter template_id : String

        def initialize(
          @template_id : String
        )
        end
      end


      struct GetProfileObjectTypeTemplateResponse
        include JSON::Serializable

        # Indicates whether a profile should be created when data is received if one doesn’t exist for an
        # object of this type. The default is FALSE . If the AllowProfileCreation flag is set to FALSE , then
        # the service tries to fetch a standard profile and associate this object with the profile. If it is
        # set to TRUE , and if no match is found, then the service creates a new standard profile.

        @[JSON::Field(key: "AllowProfileCreation")]
        getter allow_profile_creation : Bool?

        # A map of the name and ObjectType field.

        @[JSON::Field(key: "Fields")]
        getter fields : Hash(String, Types::ObjectTypeField)?

        # A list of unique keys that can be used to map data to the profile.

        @[JSON::Field(key: "Keys")]
        getter keys : Hash(String, Array(Types::ObjectTypeKey))?

        # The format of your sourceLastUpdatedTimestamp that was previously set up.

        @[JSON::Field(key: "SourceLastUpdatedTimestampFormat")]
        getter source_last_updated_timestamp_format : String?

        # The name of the source of the object template.

        @[JSON::Field(key: "SourceName")]
        getter source_name : String?

        # The source of the object template.

        @[JSON::Field(key: "SourceObject")]
        getter source_object : String?

        # A unique identifier for the object template.

        @[JSON::Field(key: "TemplateId")]
        getter template_id : String?

        def initialize(
          @allow_profile_creation : Bool? = nil,
          @fields : Hash(String, Types::ObjectTypeField)? = nil,
          @keys : Hash(String, Array(Types::ObjectTypeKey))? = nil,
          @source_last_updated_timestamp_format : String? = nil,
          @source_name : String? = nil,
          @source_object : String? = nil,
          @template_id : String? = nil
        )
        end
      end


      struct GetProfileRecommendationsRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of the profile for which to retrieve recommendations.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # The unique name of the recommender.

        @[JSON::Field(key: "RecommenderName")]
        getter recommender_name : String

        # The contextual metadata used to provide dynamic runtime information to tailor recommendations.

        @[JSON::Field(key: "Context")]
        getter context : Hash(String, String)?

        # The maximum number of recommendations to return. The default value is 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        def initialize(
          @domain_name : String,
          @profile_id : String,
          @recommender_name : String,
          @context : Hash(String, String)? = nil,
          @max_results : Int32? = nil
        )
        end
      end


      struct GetProfileRecommendationsResponse
        include JSON::Serializable

        # List of recommendations generated by the recommender.

        @[JSON::Field(key: "Recommendations")]
        getter recommendations : Array(Types::Recommendation)?

        def initialize(
          @recommendations : Array(Types::Recommendation)? = nil
        )
        end
      end


      struct GetRecommenderRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the recommender.

        @[JSON::Field(key: "RecommenderName")]
        getter recommender_name : String

        # The number of training metrics to retrieve for the recommender.

        @[JSON::Field(key: "training-metrics-count")]
        getter training_metrics_count : Int32?

        def initialize(
          @domain_name : String,
          @recommender_name : String,
          @training_metrics_count : Int32? = nil
        )
        end
      end


      struct GetRecommenderResponse
        include JSON::Serializable

        # The name of the recommender.

        @[JSON::Field(key: "RecommenderName")]
        getter recommender_name : String

        # The name of the recipe used by the recommender to generate recommendations.

        @[JSON::Field(key: "RecommenderRecipeName")]
        getter recommender_recipe_name : String

        # The timestamp of when the recommender was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A detailed description of the recommender providing information about its purpose and functionality.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If the recommender fails, provides the reason for the failure.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The timestamp of when the recommender was edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # Information about the most recent update performed on the recommender, including status and
        # timestamp.

        @[JSON::Field(key: "LatestRecommenderUpdate")]
        getter latest_recommender_update : Types::RecommenderUpdate?

        # The configuration settings for the recommender, including parameters and settings that define its
        # behavior.

        @[JSON::Field(key: "RecommenderConfig")]
        getter recommender_config : Types::RecommenderConfig?

        # The current status of the recommender, indicating whether it is active, creating, updating, or in
        # another state.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # A set of metrics that provide information about the recommender's training performance and accuracy.

        @[JSON::Field(key: "TrainingMetrics")]
        getter training_metrics : Array(Types::TrainingMetrics)?

        def initialize(
          @recommender_name : String,
          @recommender_recipe_name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @failure_reason : String? = nil,
          @last_updated_at : Time? = nil,
          @latest_recommender_update : Types::RecommenderUpdate? = nil,
          @recommender_config : Types::RecommenderConfig? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @training_metrics : Array(Types::TrainingMetrics)? = nil
        )
        end
      end


      struct GetSegmentDefinitionRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the segment definition.

        @[JSON::Field(key: "SegmentDefinitionName")]
        getter segment_definition_name : String

        def initialize(
          @domain_name : String,
          @segment_definition_name : String
        )
        end
      end


      struct GetSegmentDefinitionResponse
        include JSON::Serializable

        # The arn of the segment definition.

        @[JSON::Field(key: "SegmentDefinitionArn")]
        getter segment_definition_arn : String

        # The timestamp of when the segment definition was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the segment definition.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the segment definition.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The name of the segment definition.

        @[JSON::Field(key: "SegmentDefinitionName")]
        getter segment_definition_name : String?

        # The segment criteria associated with this definition.

        @[JSON::Field(key: "SegmentGroups")]
        getter segment_groups : Types::SegmentGroup?

        # The segment SQL query.

        @[JSON::Field(key: "SegmentSqlQuery")]
        getter segment_sql_query : String?

        # The segment type. Classic : Segments created using traditional SegmentGroup structure Enhanced :
        # Segments created using SQL queries

        @[JSON::Field(key: "SegmentType")]
        getter segment_type : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @segment_definition_arn : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @segment_definition_name : String? = nil,
          @segment_groups : Types::SegmentGroup? = nil,
          @segment_sql_query : String? = nil,
          @segment_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetSegmentEstimateRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The query Id passed by a previous CreateSegmentEstimate operation.

        @[JSON::Field(key: "EstimateId")]
        getter estimate_id : String

        def initialize(
          @domain_name : String,
          @estimate_id : String
        )
        end
      end


      struct GetSegmentEstimateResponse
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The estimated number of profiles contained in the segment.

        @[JSON::Field(key: "Estimate")]
        getter estimate : String?

        # The QueryId which is the same as the value passed in QueryId .

        @[JSON::Field(key: "EstimateId")]
        getter estimate_id : String?

        # The error message if there is any error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The current status of the query.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status code of the segment estimate.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        def initialize(
          @domain_name : String? = nil,
          @estimate : String? = nil,
          @estimate_id : String? = nil,
          @message : String? = nil,
          @status : String? = nil,
          @status_code : Int32? = nil
        )
        end
      end


      struct GetSegmentMembershipRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The list of profile IDs to query for.

        @[JSON::Field(key: "ProfileIds")]
        getter profile_ids : Array(String)

        # The Id of the wanted segment. Needs to be a valid, and existing segment Id.

        @[JSON::Field(key: "SegmentDefinitionName")]
        getter segment_definition_name : String

        def initialize(
          @domain_name : String,
          @profile_ids : Array(String),
          @segment_definition_name : String
        )
        end
      end


      struct GetSegmentMembershipResponse
        include JSON::Serializable

        # An array of maps where each contains a response per profile failed for the request.

        @[JSON::Field(key: "Failures")]
        getter failures : Array(Types::ProfileQueryFailures)?

        # The timestamp indicating when the segment membership was last computed or updated.

        @[JSON::Field(key: "LastComputedAt")]
        getter last_computed_at : Time?

        # An array of maps where each contains a response per profile requested.

        @[JSON::Field(key: "Profiles")]
        getter profiles : Array(Types::ProfileQueryResult)?

        # The unique name of the segment definition.

        @[JSON::Field(key: "SegmentDefinitionName")]
        getter segment_definition_name : String?

        def initialize(
          @failures : Array(Types::ProfileQueryFailures)? = nil,
          @last_computed_at : Time? = nil,
          @profiles : Array(Types::ProfileQueryResult)? = nil,
          @segment_definition_name : String? = nil
        )
        end
      end


      struct GetSegmentSnapshotRequest
        include JSON::Serializable

        # The unique identifier of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the segment definition.

        @[JSON::Field(key: "SegmentDefinitionName")]
        getter segment_definition_name : String

        # The unique identifier of the segment snapshot.

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String

        def initialize(
          @domain_name : String,
          @segment_definition_name : String,
          @snapshot_id : String
        )
        end
      end


      struct GetSegmentSnapshotResponse
        include JSON::Serializable

        # The format in which the segment will be exported.

        @[JSON::Field(key: "DataFormat")]
        getter data_format : String

        # The unique identifier of the segment snapshot.

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String

        # The status of the asynchronous job for exporting the segment snapshot.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The destination to which the segment will be exported. This field must be provided if the request is
        # not submitted from the Amazon Connect Admin Website.

        @[JSON::Field(key: "DestinationUri")]
        getter destination_uri : String?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the exported segment.

        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : String?

        # The Amazon Resource Name (ARN) of the IAM role that allows Customer Profiles service principal to
        # assume the role for conducting KMS and S3 operations.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The status message of the asynchronous job for exporting the segment snapshot.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @data_format : String,
          @snapshot_id : String,
          @status : String,
          @destination_uri : String? = nil,
          @encryption_key : String? = nil,
          @role_arn : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct GetSimilarProfilesRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Specify the type of matching to get similar profiles for.

        @[JSON::Field(key: "MatchType")]
        getter match_type : String

        # The string indicating the search key to be used.

        @[JSON::Field(key: "SearchKey")]
        getter search_key : String

        # The string based on SearchKey to be searched for similar profiles.

        @[JSON::Field(key: "SearchValue")]
        getter search_value : String

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous GetSimilarProfiles API call.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @match_type : String,
          @search_key : String,
          @search_value : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetSimilarProfilesResponse
        include JSON::Serializable

        # It only has value when the MatchType is ML_BASED_MATCHING .A number between 0 and 1, where a higher
        # score means higher similarity. Examining match confidence scores lets you distinguish between groups
        # of similar records in which the system is highly confident (which you may decide to merge), groups
        # of similar records about which the system is uncertain (which you may decide to have reviewed by a
        # human), and groups of similar records that the system deems to be unlikely (which you may decide to
        # reject). Given confidence scores vary as per the data input, it should not be used as an absolute
        # measure of matching quality.

        @[JSON::Field(key: "ConfidenceScore")]
        getter confidence_score : Float64?

        # The string matchId that the similar profiles belong to.

        @[JSON::Field(key: "MatchId")]
        getter match_id : String?

        # Specify the type of matching to get similar profiles for.

        @[JSON::Field(key: "MatchType")]
        getter match_type : String?

        # The pagination token from the previous GetSimilarProfiles API call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Set of profileId s that belong to the same matching group.

        @[JSON::Field(key: "ProfileIds")]
        getter profile_ids : Array(String)?

        # The integer rule level that the profiles matched on.

        @[JSON::Field(key: "RuleLevel")]
        getter rule_level : Int32?

        def initialize(
          @confidence_score : Float64? = nil,
          @match_id : String? = nil,
          @match_type : String? = nil,
          @next_token : String? = nil,
          @profile_ids : Array(String)? = nil,
          @rule_level : Int32? = nil
        )
        end
      end


      struct GetUploadJobPathRequest
        include JSON::Serializable

        # The unique name of the domain containing the upload job.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of the upload job to retrieve the upload path for. This is generated from the
        # CreateUploadJob API.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @domain_name : String,
          @job_id : String
        )
        end
      end


      struct GetUploadJobPathResponse
        include JSON::Serializable

        # The pre-signed S3 URL for uploading the CSV file associated with the upload job.

        @[JSON::Field(key: "Url")]
        getter url : String

        # The plaintext data key used to encrypt the upload file. To persist to the pre-signed url, use the
        # client token and MD5 client token as header. The required headers are as follows:
        # x-amz-server-side-encryption-customer-key: Client Token
        # x-amz-server-side-encryption-customer-key-MD5: MD5 Client Token
        # x-amz-server-side-encryption-customer-algorithm: AES256

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The expiry timestamp for the pre-signed URL, after which the URL will no longer be valid.

        @[JSON::Field(key: "ValidUntil")]
        getter valid_until : Time?

        def initialize(
          @url : String,
          @client_token : String? = nil,
          @valid_until : Time? = nil
        )
        end
      end


      struct GetUploadJobRequest
        include JSON::Serializable

        # The unique name of the domain containing the upload job.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of the upload job to retrieve.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @domain_name : String,
          @job_id : String
        )
        end
      end


      struct GetUploadJobResponse
        include JSON::Serializable

        # The timestamp when the upload job was completed.

        @[JSON::Field(key: "CompletedAt")]
        getter completed_at : Time?

        # The timestamp when the upload job was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The expiry duration for the profiles ingested with the upload job.

        @[JSON::Field(key: "DataExpiry")]
        getter data_expiry : Int32?

        # The unique name of the upload job. Could be a file name to identify the upload job.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The mapping between CSV Columns and Profile Object attributes for the upload job.

        @[JSON::Field(key: "Fields")]
        getter fields : Hash(String, Types::ObjectTypeField)?

        # The unique identifier of the upload job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The summary of results for the upload job, including the number of updated, created, and failed
        # records.

        @[JSON::Field(key: "ResultsSummary")]
        getter results_summary : Types::ResultsSummary?

        # The status describing the status for the upload job. The following are Valid Values: CREATED : The
        # upload job has been created, but has not started processing yet. IN_PROGRESS : The upload job is
        # currently in progress, ingesting and processing the profile data. PARTIALLY_SUCCEEDED : The upload
        # job has successfully completed the ingestion and processing of all profile data. SUCCEEDED : The
        # upload job has successfully completed the ingestion and processing of all profile data. FAILED : The
        # upload job has failed to complete. STOPPED : The upload job has been manually stopped or terminated
        # before completion.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason for the current status of the upload job. Possible reasons: VALIDATION_FAILURE : The
        # upload job has encountered an error or issue and was unable to complete the profile data ingestion.
        # INTERNAL_FAILURE : Failure caused from service side

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The unique key columns used for de-duping the keys in the upload job.

        @[JSON::Field(key: "UniqueKey")]
        getter unique_key : String?

        def initialize(
          @completed_at : Time? = nil,
          @created_at : Time? = nil,
          @data_expiry : Int32? = nil,
          @display_name : String? = nil,
          @fields : Hash(String, Types::ObjectTypeField)? = nil,
          @job_id : String? = nil,
          @results_summary : Types::ResultsSummary? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @unique_key : String? = nil
        )
        end
      end


      struct GetWorkflowRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Unique identifier for the workflow.

        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        def initialize(
          @domain_name : String,
          @workflow_id : String
        )
        end
      end


      struct GetWorkflowResponse
        include JSON::Serializable

        # Attributes provided for workflow execution.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Types::WorkflowAttributes?

        # Workflow error messages during execution (if any).

        @[JSON::Field(key: "ErrorDescription")]
        getter error_description : String?

        # The timestamp that represents when workflow execution last updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # Workflow specific execution metrics.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Types::WorkflowMetrics?

        # The timestamp that represents when workflow execution started.

        @[JSON::Field(key: "StartDate")]
        getter start_date : Time?

        # Status of workflow execution.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Unique identifier for the workflow.

        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String?

        # The type of workflow. The only supported value is APPFLOW_INTEGRATION.

        @[JSON::Field(key: "WorkflowType")]
        getter workflow_type : String?

        def initialize(
          @attributes : Types::WorkflowAttributes? = nil,
          @error_description : String? = nil,
          @last_updated_at : Time? = nil,
          @metrics : Types::WorkflowMetrics? = nil,
          @start_date : Time? = nil,
          @status : String? = nil,
          @workflow_id : String? = nil,
          @workflow_type : String? = nil
        )
        end
      end


      struct GetWorkflowStepsRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Unique identifier for the workflow.

        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @workflow_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetWorkflowStepsResponse
        include JSON::Serializable

        # List containing workflow step details.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::WorkflowStepItem)?

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Unique identifier for the workflow.

        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String?

        # The type of workflow. The only supported value is APPFLOW_INTEGRATION.

        @[JSON::Field(key: "WorkflowType")]
        getter workflow_type : String?

        def initialize(
          @items : Array(Types::WorkflowStepItem)? = nil,
          @next_token : String? = nil,
          @workflow_id : String? = nil,
          @workflow_type : String? = nil
        )
        end
      end

      # Contains dimensions that determine what to segment on.

      struct Group
        include JSON::Serializable

        # Defines the attributes to segment on.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::Dimension)?

        # Defines the starting source of data.

        @[JSON::Field(key: "SourceSegments")]
        getter source_segments : Array(Types::SourceSegment)?

        # Defines how to interact with the source data.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # Defines how to interact with the profiles found in the current filtering.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @dimensions : Array(Types::Dimension)? = nil,
          @source_segments : Array(Types::SourceSegment)? = nil,
          @source_type : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about the Identity Resolution Job.

      struct IdentityResolutionJob
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The S3 location where the Identity Resolution Job writes result files.

        @[JSON::Field(key: "ExportingLocation")]
        getter exporting_location : Types::ExportingLocation?

        # The timestamp of when the job was completed.

        @[JSON::Field(key: "JobEndTime")]
        getter job_end_time : Time?

        # The unique identifier of the Identity Resolution Job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The timestamp of when the job was started or will be started.

        @[JSON::Field(key: "JobStartTime")]
        getter job_start_time : Time?

        # Statistics about an Identity Resolution Job.

        @[JSON::Field(key: "JobStats")]
        getter job_stats : Types::JobStats?

        # The error messages that are generated when the Identity Resolution Job runs.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the Identity Resolution Job. PENDING : The Identity Resolution Job is scheduled but
        # has not started yet. If you turn off the Identity Resolution feature in your domain, jobs in the
        # PENDING state are deleted. PREPROCESSING : The Identity Resolution Job is loading your data.
        # FIND_MATCHING : The Identity Resolution Job is using the machine learning model to identify profiles
        # that belong to the same matching group. MERGING : The Identity Resolution Job is merging duplicate
        # profiles. COMPLETED : The Identity Resolution Job completed successfully. PARTIAL_SUCCESS : There's
        # a system error and not all of the data is merged. The Identity Resolution Job writes a message
        # indicating the source of the problem. FAILED : The Identity Resolution Job did not merge any data.
        # It writes a message indicating the source of the problem.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @domain_name : String? = nil,
          @exporting_location : Types::ExportingLocation? = nil,
          @job_end_time : Time? = nil,
          @job_id : String? = nil,
          @job_start_time : Time? = nil,
          @job_stats : Types::JobStats? = nil,
          @message : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies the configuration used when importing incremental records from the source.

      struct IncrementalPullConfig
        include JSON::Serializable

        # A field that specifies the date time or timestamp field as the criteria to use when importing
        # incremental records from the source.

        @[JSON::Field(key: "DatetimeTypeFieldName")]
        getter datetime_type_field_name : String?

        def initialize(
          @datetime_type_field_name : String? = nil
        )
        end
      end

      # Configuration data for integration workflow.

      struct IntegrationConfig
        include JSON::Serializable

        # Configuration data for APPFLOW_INTEGRATION workflow type.

        @[JSON::Field(key: "AppflowIntegration")]
        getter appflow_integration : Types::AppflowIntegration?

        def initialize(
          @appflow_integration : Types::AppflowIntegration? = nil
        )
        end
      end

      # An internal service error occurred.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The day and time when do you want to start the Identity Resolution Job every week.

      struct JobSchedule
        include JSON::Serializable

        # The day when the Identity Resolution Job should run every week.

        @[JSON::Field(key: "DayOfTheWeek")]
        getter day_of_the_week : String

        # The time when the Identity Resolution Job should run every week.

        @[JSON::Field(key: "Time")]
        getter time : String

        def initialize(
          @day_of_the_week : String,
          @time : String
        )
        end
      end

      # Statistics about the Identity Resolution Job.

      struct JobStats
        include JSON::Serializable

        # The number of matches found.

        @[JSON::Field(key: "NumberOfMatchesFound")]
        getter number_of_matches_found : Int64?

        # The number of merges completed.

        @[JSON::Field(key: "NumberOfMergesDone")]
        getter number_of_merges_done : Int64?

        # The number of profiles reviewed.

        @[JSON::Field(key: "NumberOfProfilesReviewed")]
        getter number_of_profiles_reviewed : Int64?

        def initialize(
          @number_of_matches_found : Int64? = nil,
          @number_of_merges_done : Int64? = nil,
          @number_of_profiles_reviewed : Int64? = nil
        )
        end
      end

      # The layout object that contains LayoutDefinitionName, Description, DisplayName, IsDefault,
      # LayoutType, Tags, CreatedAt, LastUpdatedAt

      struct LayoutItem
        include JSON::Serializable

        # The timestamp of when the layout was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The description of the layout

        @[JSON::Field(key: "Description")]
        getter description : String

        # The display name of the layout

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # The timestamp of when the layout was most recently updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # The unique name of the layout.

        @[JSON::Field(key: "LayoutDefinitionName")]
        getter layout_definition_name : String

        # The type of layout that can be used to view data under customer profiles domain.

        @[JSON::Field(key: "LayoutType")]
        getter layout_type : String

        # If set to true for a layout, this layout will be used by default to view data. If set to false, then
        # layout will not be used by default but it can be used to view data by explicit selection on UI.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @description : String,
          @display_name : String,
          @last_updated_at : Time,
          @layout_definition_name : String,
          @layout_type : String,
          @is_default : Bool? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListAccountIntegrationsRequest
        include JSON::Serializable

        # The URI of the S3 bucket or any other type of data source.

        @[JSON::Field(key: "Uri")]
        getter uri : String

        # Boolean to indicate if hidden integration should be returned. Defaults to False .

        @[JSON::Field(key: "include-hidden")]
        getter include_hidden : Bool?

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous ListAccountIntegrations API call.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @uri : String,
          @include_hidden : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountIntegrationsResponse
        include JSON::Serializable

        # The list of ListAccountIntegration instances.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListIntegrationItem)?

        # The pagination token from the previous ListAccountIntegrations API call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListIntegrationItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The details of a single calculated attribute definition.

      struct ListCalculatedAttributeDefinitionItem
        include JSON::Serializable

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String?

        # The threshold for the calculated attribute.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The threshold for the calculated attribute.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the calculated attribute.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The timestamp of when the calculated attribute definition was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # Status of the Calculated Attribute creation (whether all historical data has been indexed.)

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # Whether historical data ingested before the Calculated Attribute was created should be included in
        # calculations.

        @[JSON::Field(key: "UseHistoricalData")]
        getter use_historical_data : Bool?

        def initialize(
          @calculated_attribute_name : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @last_updated_at : Time? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @use_historical_data : Bool? = nil
        )
        end
      end


      struct ListCalculatedAttributeDefinitionsRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of calculated attribute definitions returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous call to ListCalculatedAttributeDefinitions.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCalculatedAttributeDefinitionsResponse
        include JSON::Serializable

        # The list of calculated attribute definitions.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListCalculatedAttributeDefinitionItem)?

        # The pagination token from the previous call to ListCalculatedAttributeDefinitions.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListCalculatedAttributeDefinitionItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The details of a single calculated attribute for a profile.

      struct ListCalculatedAttributeForProfileItem
        include JSON::Serializable

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String?

        # The display name of the calculated attribute.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Indicates whether the calculated attribute’s value is based on partial data. If data is partial, it
        # is set to true.

        @[JSON::Field(key: "IsDataPartial")]
        getter is_data_partial : String?

        # The timestamp of the newest object included in the calculated attribute calculation.

        @[JSON::Field(key: "LastObjectTimestamp")]
        getter last_object_timestamp : Time?

        # The value of the calculated attribute.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @calculated_attribute_name : String? = nil,
          @display_name : String? = nil,
          @is_data_partial : String? = nil,
          @last_object_timestamp : Time? = nil,
          @value : String? = nil
        )
        end
      end


      struct ListCalculatedAttributesForProfileRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # The maximum number of calculated attributes returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous call to ListCalculatedAttributesForProfile.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @profile_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCalculatedAttributesForProfileResponse
        include JSON::Serializable

        # The list of calculated attributes.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListCalculatedAttributeForProfileItem)?

        # The pagination token from the previous call to ListCalculatedAttributesForProfile.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListCalculatedAttributeForProfileItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # An object in a list that represents a domain.

      struct ListDomainItem
        include JSON::Serializable

        # The timestamp of when the domain was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The timestamp of when the domain was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @domain_name : String,
          @last_updated_at : Time,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListDomainLayoutsRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainLayoutsResponse
        include JSON::Serializable

        # Contains summary information about an EventStream.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::LayoutItem)?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::LayoutItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainObjectTypesRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of domain object types returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous call to ListDomainObjectTypes.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainObjectTypesResponse
        include JSON::Serializable

        # The list of domain object types.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::DomainObjectTypesListItem)?

        # The pagination token from the previous call to ListDomainObjectTypes.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DomainObjectTypesListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainsRequest
        include JSON::Serializable

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous ListDomain API call.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainsResponse
        include JSON::Serializable

        # The list of ListDomains instances.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListDomainItem)?

        # The pagination token from the previous ListDomains API call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListDomainItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventStreamsRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventStreamsResponse
        include JSON::Serializable

        # Contains summary information about an EventStream.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::EventStreamSummary)?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::EventStreamSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventTriggersRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token to use with ListEventTriggers.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventTriggersResponse
        include JSON::Serializable

        # The list of Event Triggers.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::EventTriggerSummaryItem)?

        # The pagination token from the previous call to ListEventTriggers.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::EventTriggerSummaryItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdentityResolutionJobsRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdentityResolutionJobsResponse
        include JSON::Serializable

        # A list of Identity Resolution Jobs.

        @[JSON::Field(key: "IdentityResolutionJobsList")]
        getter identity_resolution_jobs_list : Array(Types::IdentityResolutionJob)?

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identity_resolution_jobs_list : Array(Types::IdentityResolutionJob)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # An integration in list of integrations.

      struct ListIntegrationItem
        include JSON::Serializable

        # The timestamp of when the domain was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The timestamp of when the integration was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # The URI of the S3 bucket or any other type of data source.

        @[JSON::Field(key: "Uri")]
        getter uri : String

        # A list of unique names for active event triggers associated with the integration.

        @[JSON::Field(key: "EventTriggerNames")]
        getter event_trigger_names : Array(String)?

        # Boolean that shows if the Flow that's associated with the Integration is created in Amazon Appflow,
        # or with ObjectTypeName equals _unstructured via API/CLI in flowDefinition.

        @[JSON::Field(key: "IsUnstructured")]
        getter is_unstructured : Bool?

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String?

        # A map in which each key is an event type from an external application such as Segment or Shopify,
        # and each value is an ObjectTypeName (template) used to ingest the event. It supports the following
        # event types: SegmentIdentify , ShopifyCreateCustomers , ShopifyUpdateCustomers ,
        # ShopifyCreateDraftOrders , ShopifyUpdateDraftOrders , ShopifyCreateOrders , and ShopifyUpdatedOrders
        # .

        @[JSON::Field(key: "ObjectTypeNames")]
        getter object_type_names : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the IAM role. The Integration uses this role to make Customer
        # Profiles requests on your behalf.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The scope or boundary of the integration item's applicability.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # Unique identifier for the workflow.

        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String?

        def initialize(
          @created_at : Time,
          @domain_name : String,
          @last_updated_at : Time,
          @uri : String,
          @event_trigger_names : Array(String)? = nil,
          @is_unstructured : Bool? = nil,
          @object_type_name : String? = nil,
          @object_type_names : Hash(String, String)? = nil,
          @role_arn : String? = nil,
          @scope : String? = nil,
          @tags : Hash(String, String)? = nil,
          @workflow_id : String? = nil
        )
        end
      end


      struct ListIntegrationsRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Boolean to indicate if hidden integration should be returned. Defaults to False .

        @[JSON::Field(key: "include-hidden")]
        getter include_hidden : Bool?

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous ListIntegrations API call.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @include_hidden : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIntegrationsResponse
        include JSON::Serializable

        # The list of ListIntegrations instances.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListIntegrationItem)?

        # The pagination token from the previous ListIntegrations API call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListIntegrationItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Item that contains the attribute and when it was last updated.

      struct ListObjectTypeAttributeItem
        include JSON::Serializable

        # Name of the attribute.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # When the attribute was last updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        def initialize(
          @attribute_name : String,
          @last_updated_at : Time
        )
        end
      end

      # Represents an item in the list of object type attribute values with its associated metadata.

      struct ListObjectTypeAttributeValuesItem
        include JSON::Serializable

        # The timestamp of when the object type attribute value was most recently updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # The actual value of the object type attribute.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @last_updated_at : Time,
          @value : String
        )
        end
      end


      struct ListObjectTypeAttributeValuesRequest
        include JSON::Serializable

        # The attribute name.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the domain object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # The maximum number of objects returned per page. Valid Range: Minimum value of 1. Maximum value of
        # 100. If not provided default as 100.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous call.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @attribute_name : String,
          @domain_name : String,
          @object_type_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListObjectTypeAttributeValuesResponse
        include JSON::Serializable

        # A list of unique attribute values sorted on the basis of LastUpdatedAt.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListObjectTypeAttributeValuesItem)?

        # The pagination token from the previous call to call ListObjectTypeAttributeValues.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListObjectTypeAttributeValuesItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListObjectTypeAttributesRequest
        include JSON::Serializable

        # The unique identifier of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous call.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @object_type_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListObjectTypeAttributesResponse
        include JSON::Serializable

        # The items returned as part of the response.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListObjectTypeAttributeItem)?

        # The pagination token from the previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListObjectTypeAttributeItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProfileHistoryRecordsRequest
        include JSON::Serializable

        # The unique name of the domain for which to return profile history records.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The identifier of the profile to be taken.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # Applies a filter to include profile history records only with the specified ActionType value in the
        # response.

        @[JSON::Field(key: "ActionType")]
        getter action_type : String?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # Applies a filter to include profile history records only with the specified ObjectTypeName value in
        # the response.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String?

        # Applies a filter to include profile history records only with the specified PerformedBy value in the
        # response. The PerformedBy value can be the Amazon Resource Name (ARN) of the person or service
        # principal who performed the action.

        @[JSON::Field(key: "PerformedBy")]
        getter performed_by : String?

        def initialize(
          @domain_name : String,
          @profile_id : String,
          @action_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @object_type_name : String? = nil,
          @performed_by : String? = nil
        )
        end
      end


      struct ListProfileHistoryRecordsResponse
        include JSON::Serializable

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of profile history records.

        @[JSON::Field(key: "ProfileHistoryRecords")]
        getter profile_history_records : Array(Types::ProfileHistoryRecord)?

        def initialize(
          @next_token : String? = nil,
          @profile_history_records : Array(Types::ProfileHistoryRecord)? = nil
        )
        end
      end

      # A ProfileObjectType instance.

      struct ListProfileObjectTypeItem
        include JSON::Serializable

        # Description of the profile object type.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # The timestamp of when the domain was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The timestamp of when the profile object type was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The amount of provisioned profile object max count available.

        @[JSON::Field(key: "MaxAvailableProfileObjectCount")]
        getter max_available_profile_object_count : Int32?

        # The amount of profile object max count assigned to the object type.

        @[JSON::Field(key: "MaxProfileObjectCount")]
        getter max_profile_object_count : Int32?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String,
          @object_type_name : String,
          @created_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @max_available_profile_object_count : Int32? = nil,
          @max_profile_object_count : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A ProfileObjectTypeTemplate in a list of ProfileObjectTypeTemplates.

      struct ListProfileObjectTypeTemplateItem
        include JSON::Serializable

        # The name of the source of the object template.

        @[JSON::Field(key: "SourceName")]
        getter source_name : String?

        # The source of the object template.

        @[JSON::Field(key: "SourceObject")]
        getter source_object : String?

        # A unique identifier for the object template.

        @[JSON::Field(key: "TemplateId")]
        getter template_id : String?

        def initialize(
          @source_name : String? = nil,
          @source_object : String? = nil,
          @template_id : String? = nil
        )
        end
      end


      struct ListProfileObjectTypeTemplatesRequest
        include JSON::Serializable

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous ListObjectTypeTemplates API call.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProfileObjectTypeTemplatesResponse
        include JSON::Serializable

        # The list of ListProfileObjectType template instances.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListProfileObjectTypeTemplateItem)?

        # The pagination token from the previous ListObjectTypeTemplates API call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListProfileObjectTypeTemplateItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProfileObjectTypesRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProfileObjectTypesResponse
        include JSON::Serializable

        # The list of ListProfileObjectTypes instances.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListProfileObjectTypeItem)?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListProfileObjectTypeItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A ProfileObject in a list of ProfileObjects.

      struct ListProfileObjectsItem
        include JSON::Serializable

        # A JSON representation of a ProfileObject that belongs to a profile.

        @[JSON::Field(key: "Object")]
        getter object : String?

        # Specifies the kind of object being added to a profile, such as "Salesforce-Account."

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String?

        # The unique identifier of the ProfileObject generated by the service.

        @[JSON::Field(key: "ProfileObjectUniqueKey")]
        getter profile_object_unique_key : String?

        def initialize(
          @object : String? = nil,
          @object_type_name : String? = nil,
          @profile_object_unique_key : String? = nil
        )
        end
      end


      struct ListProfileObjectsRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous call to ListProfileObjects.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # Applies a filter to the response to include profile objects with the specified index values.

        @[JSON::Field(key: "ObjectFilter")]
        getter object_filter : Types::ObjectFilter?

        def initialize(
          @domain_name : String,
          @object_type_name : String,
          @profile_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @object_filter : Types::ObjectFilter? = nil
        )
        end
      end


      struct ListProfileObjectsResponse
        include JSON::Serializable

        # The list of ListProfileObject instances.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListProfileObjectsItem)?

        # The pagination token from the previous call to ListProfileObjects.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListProfileObjectsItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommenderRecipesRequest
        include JSON::Serializable

        # The maximum number of recommender recipes to return in the response. The default value is 100.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # A token received from a previous ListRecommenderRecipes call to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommenderRecipesResponse
        include JSON::Serializable

        # A token to retrieve the next page of results. Null if there are no more results to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of available recommender recipes and their properties.

        @[JSON::Field(key: "RecommenderRecipes")]
        getter recommender_recipes : Array(Types::RecommenderRecipe)?

        def initialize(
          @next_token : String? = nil,
          @recommender_recipes : Array(Types::RecommenderRecipe)? = nil
        )
        end
      end


      struct ListRecommendersRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of recommenders to return in the response. The default value is 100.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # A token received from a previous ListRecommenders call to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendersResponse
        include JSON::Serializable

        # A token to retrieve the next page of results. Null if there are no more results to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of recommenders and their properties in the specified domain.

        @[JSON::Field(key: "Recommenders")]
        getter recommenders : Array(Types::RecommenderSummary)?

        def initialize(
          @next_token : String? = nil,
          @recommenders : Array(Types::RecommenderSummary)? = nil
        )
        end
      end


      struct ListRuleBasedMatchesRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of MatchIds returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous ListRuleBasedMatches API call.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRuleBasedMatchesResponse
        include JSON::Serializable

        # The list of MatchIds for the given domain.

        @[JSON::Field(key: "MatchIds")]
        getter match_ids : Array(String)?

        # The pagination token from the previous ListRuleBasedMatches API call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @match_ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSegmentDefinitionsRequest
        include JSON::Serializable

        # The unique identifier of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of objects returned per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous call.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSegmentDefinitionsResponse
        include JSON::Serializable

        # List of segment definitions.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::SegmentDefinitionItem)?

        # The pagination token from the previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::SegmentDefinitionItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource for which you want to view tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListUploadJobsRequest
        include JSON::Serializable

        # The unique name of the domain to list upload jobs for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of upload jobs to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous call to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListUploadJobsResponse
        include JSON::Serializable

        # The list of upload jobs for the specified domain.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::UploadJobItem)?

        # The pagination token to use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::UploadJobItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A workflow in list of workflows.

      struct ListWorkflowsItem
        include JSON::Serializable

        # Creation timestamp for workflow.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # Last updated timestamp for workflow.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # Status of workflow execution.

        @[JSON::Field(key: "Status")]
        getter status : String

        # Description for workflow execution status.

        @[JSON::Field(key: "StatusDescription")]
        getter status_description : String

        # Unique identifier for the workflow.

        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        # The type of workflow. The only supported value is APPFLOW_INTEGRATION.

        @[JSON::Field(key: "WorkflowType")]
        getter workflow_type : String

        def initialize(
          @created_at : Time,
          @last_updated_at : Time,
          @status : String,
          @status_description : String,
          @workflow_id : String,
          @workflow_type : String
        )
        end
      end


      struct ListWorkflowsRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # Retrieve workflows ended after timestamp.

        @[JSON::Field(key: "QueryEndDate")]
        getter query_end_date : Time?

        # Retrieve workflows started after timestamp.

        @[JSON::Field(key: "QueryStartDate")]
        getter query_start_date : Time?

        # Status of workflow execution.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The type of workflow. The only supported value is APPFLOW_INTEGRATION.

        @[JSON::Field(key: "WorkflowType")]
        getter workflow_type : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @query_end_date : Time? = nil,
          @query_start_date : Time? = nil,
          @status : String? = nil,
          @workflow_type : String? = nil
        )
        end
      end


      struct ListWorkflowsResponse
        include JSON::Serializable

        # List containing workflow details.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListWorkflowsItem)?

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListWorkflowsItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The properties that are applied when Marketo is being used as a source.

      struct MarketoSourceProperties
        include JSON::Serializable

        # The object specified in the Marketo flow source.

        @[JSON::Field(key: "Object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end

      # The Match group object.

      struct MatchItem
        include JSON::Serializable

        # A number between 0 and 1, where a higher score means higher similarity. Examining match confidence
        # scores lets you distinguish between groups of similar records in which the system is highly
        # confident (which you may decide to merge), groups of similar records about which the system is
        # uncertain (which you may decide to have reviewed by a human), and groups of similar records that the
        # system deems to be unlikely (which you may decide to reject). Given confidence scores vary as per
        # the data input, it should not be used an absolute measure of matching quality.

        @[JSON::Field(key: "ConfidenceScore")]
        getter confidence_score : Float64?

        # The unique identifiers for this group of profiles that match.

        @[JSON::Field(key: "MatchId")]
        getter match_id : String?

        # A list of identifiers for profiles that match.

        @[JSON::Field(key: "ProfileIds")]
        getter profile_ids : Array(String)?

        def initialize(
          @confidence_score : Float64? = nil,
          @match_id : String? = nil,
          @profile_ids : Array(String)? = nil
        )
        end
      end

      # The flag that enables the matching process of duplicate profiles.

      struct MatchingRequest
        include JSON::Serializable

        # The flag that enables the matching process of duplicate profiles.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # Configuration information about the auto-merging process.

        @[JSON::Field(key: "AutoMerging")]
        getter auto_merging : Types::AutoMerging?

        # Configuration information for exporting Identity Resolution results, for example, to an S3 bucket.

        @[JSON::Field(key: "ExportingConfig")]
        getter exporting_config : Types::ExportingConfig?

        # The day and time when do you want to start the Identity Resolution Job every week.

        @[JSON::Field(key: "JobSchedule")]
        getter job_schedule : Types::JobSchedule?

        def initialize(
          @enabled : Bool,
          @auto_merging : Types::AutoMerging? = nil,
          @exporting_config : Types::ExportingConfig? = nil,
          @job_schedule : Types::JobSchedule? = nil
        )
        end
      end

      # The flag that enables the matching process of duplicate profiles.

      struct MatchingResponse
        include JSON::Serializable

        # Configuration information about the auto-merging process.

        @[JSON::Field(key: "AutoMerging")]
        getter auto_merging : Types::AutoMerging?

        # The flag that enables the matching process of duplicate profiles.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Configuration information for exporting Identity Resolution results, for example, to an S3 bucket.

        @[JSON::Field(key: "ExportingConfig")]
        getter exporting_config : Types::ExportingConfig?

        # The day and time when do you want to start the Identity Resolution Job every week.

        @[JSON::Field(key: "JobSchedule")]
        getter job_schedule : Types::JobSchedule?

        def initialize(
          @auto_merging : Types::AutoMerging? = nil,
          @enabled : Bool? = nil,
          @exporting_config : Types::ExportingConfig? = nil,
          @job_schedule : Types::JobSchedule? = nil
        )
        end
      end

      # Specifies how does the rule-based matching process should match profiles. You can choose from the
      # following attributes to build the matching Rule: AccountNumber Address.Address Address.City
      # Address.Country Address.County Address.PostalCode Address.State Address.Province BirthDate
      # BusinessName EmailAddress FirstName Gender LastName MiddleName PhoneNumber Any customized profile
      # attributes that start with the Attributes

      struct MatchingRule
        include JSON::Serializable

        # A single rule level of the MatchRules . Configures how the rule-based matching process should match
        # profiles.

        @[JSON::Field(key: "Rule")]
        getter rule : Array(String)

        def initialize(
          @rule : Array(String)
        )
        end
      end


      struct MergeProfilesRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The identifier of the profile to be taken.

        @[JSON::Field(key: "MainProfileId")]
        getter main_profile_id : String

        # The identifier of the profile to be merged into MainProfileId.

        @[JSON::Field(key: "ProfileIdsToBeMerged")]
        getter profile_ids_to_be_merged : Array(String)

        # The identifiers of the fields in the profile that has the information you want to apply to the
        # merge. For example, say you want to merge EmailAddress from Profile1 into MainProfile. This would be
        # the identifier of the EmailAddress field in Profile1.

        @[JSON::Field(key: "FieldSourceProfileIds")]
        getter field_source_profile_ids : Types::FieldSourceProfileIds?

        def initialize(
          @domain_name : String,
          @main_profile_id : String,
          @profile_ids_to_be_merged : Array(String),
          @field_source_profile_ids : Types::FieldSourceProfileIds? = nil
        )
        end
      end


      struct MergeProfilesResponse
        include JSON::Serializable

        # A message that indicates the merge request is complete.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The criteria that a specific object attribute must meet to trigger the destination.

      struct ObjectAttribute
        include JSON::Serializable

        # The operator used to compare an attribute against a list of values.

        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String

        # A list of attribute values used for comparison.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        # A field defined within an object type.

        @[JSON::Field(key: "FieldName")]
        getter field_name : String?

        # An attribute contained within a source object.

        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @comparison_operator : String,
          @values : Array(String),
          @field_name : String? = nil,
          @source : String? = nil
        )
        end
      end

      # The filter applied to ListProfileObjects response to include profile objects with the specified
      # index values.

      struct ObjectFilter
        include JSON::Serializable

        # A searchable identifier of a profile object. The predefined keys you can use to search for _asset
        # include: _assetId , _assetName , and _serialNumber . The predefined keys you can use to search for
        # _case include: _caseId . The predefined keys you can use to search for _order include: _orderId .

        @[JSON::Field(key: "KeyName")]
        getter key_name : String

        # A list of key values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key_name : String,
          @values : Array(String)
        )
        end
      end

      # Represents a field in a ProfileObjectType.

      struct ObjectTypeField
        include JSON::Serializable

        # The content type of the field. Used for determining equality when searching.

        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # A field of a ProfileObject. For example: _source.FirstName, where “_source” is a ProfileObjectType
        # of a Zendesk user and “FirstName” is a field in that ObjectType.

        @[JSON::Field(key: "Source")]
        getter source : String?

        # The location of the data in the standard ProfileObject model. For example:
        # _profile.Address.PostalCode.

        @[JSON::Field(key: "Target")]
        getter target : String?

        def initialize(
          @content_type : String? = nil,
          @source : String? = nil,
          @target : String? = nil
        )
        end
      end

      # An object that defines the Key element of a ProfileObject. A Key is a special element that can be
      # used to search for a customer profile.

      struct ObjectTypeKey
        include JSON::Serializable

        # The reference for the key name of the fields map.

        @[JSON::Field(key: "FieldNames")]
        getter field_names : Array(String)?

        # The types of keys that a ProfileObject can have. Each ProfileObject can have only 1 UNIQUE key but
        # multiple PROFILE keys. PROFILE, ASSET, CASE, or ORDER means that this key can be used to tie an
        # object to a PROFILE, ASSET, CASE, or ORDER respectively. UNIQUE means that it can be used to
        # uniquely identify an object. If a key a is marked as SECONDARY, it will be used to search for
        # profiles after all other PROFILE keys have been searched. A LOOKUP_ONLY key is only used to match a
        # profile but is not persisted to be used for searching of the profile. A NEW_ONLY key is only used if
        # the profile does not already exist before the object is ingested, otherwise it is only used for
        # matching objects to profiles.

        @[JSON::Field(key: "StandardIdentifiers")]
        getter standard_identifiers : Array(String)?

        def initialize(
          @field_names : Array(String)? = nil,
          @standard_identifiers : Array(String)? = nil
        )
        end
      end

      # Defines a limit and the time period during which it is enforced.

      struct Period
        include JSON::Serializable

        # The unit of time.

        @[JSON::Field(key: "Unit")]
        getter unit : String

        # The amount of time of the specified unit.

        @[JSON::Field(key: "Value")]
        getter value : Int32

        # The maximum allowed number of destination invocations per profile.

        @[JSON::Field(key: "MaxInvocationsPerProfile")]
        getter max_invocations_per_profile : Int32?

        # If set to true, there is no limit on the number of destination invocations per profile. The default
        # is false.

        @[JSON::Field(key: "Unlimited")]
        getter unlimited : Bool?

        def initialize(
          @unit : String,
          @value : Int32,
          @max_invocations_per_profile : Int32? = nil,
          @unlimited : Bool? = nil
        )
        end
      end

      # The standard profile of a customer.

      struct Profile
        include JSON::Serializable

        # An account number that you have assigned to the customer.

        @[JSON::Field(key: "AccountNumber")]
        getter account_number : String?

        # Any additional information relevant to the customer’s profile.

        @[JSON::Field(key: "AdditionalInformation")]
        getter additional_information : String?

        # A generic address associated with the customer that is not mailing, shipping, or billing.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # A key value pair of attributes of a customer profile.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The customer’s billing address.

        @[JSON::Field(key: "BillingAddress")]
        getter billing_address : Types::Address?

        # The customer’s birth date.

        @[JSON::Field(key: "BirthDate")]
        getter birth_date : String?

        # The customer’s business email address.

        @[JSON::Field(key: "BusinessEmailAddress")]
        getter business_email_address : String?

        # The name of the customer’s business.

        @[JSON::Field(key: "BusinessName")]
        getter business_name : String?

        # The customer’s home phone number.

        @[JSON::Field(key: "BusinessPhoneNumber")]
        getter business_phone_number : String?

        # The customer’s email address, which has not been specified as a personal or business address.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # The customer or account’s engagement preferences.

        @[JSON::Field(key: "EngagementPreferences")]
        getter engagement_preferences : Types::EngagementPreferences?

        # The customer’s first name.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # A list of items used to find a profile returned in a SearchProfiles response. An item is a
        # key-value(s) pair that matches an attribute in the profile. If the optional AdditionalSearchKeys
        # parameter was included in the SearchProfiles request, the FoundByItems list should be interpreted
        # based on the LogicalOperator used in the request: AND - The profile included in the response matched
        # all of the search keys specified in the request. The FoundByItems will include all of the
        # key-value(s) pairs that were specified in the request (as this is a requirement of AND search
        # logic). OR - The profile included in the response matched at least one of the search keys specified
        # in the request. The FoundByItems will include each of the key-value(s) pairs that the profile was
        # found by. The OR relationship is the default behavior if the LogicalOperator parameter is not
        # included in the SearchProfiles request.

        @[JSON::Field(key: "FoundByItems")]
        getter found_by_items : Array(Types::FoundByKeyValue)?

        # The gender with which the customer identifies.

        @[JSON::Field(key: "Gender")]
        getter gender : String?

        # An alternative to Gender which accepts any string as input.

        @[JSON::Field(key: "GenderString")]
        getter gender_string : String?

        # The customer’s home phone number.

        @[JSON::Field(key: "HomePhoneNumber")]
        getter home_phone_number : String?

        # The customer’s last name.

        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # The customer’s mailing address.

        @[JSON::Field(key: "MailingAddress")]
        getter mailing_address : Types::Address?

        # The customer’s middle name.

        @[JSON::Field(key: "MiddleName")]
        getter middle_name : String?

        # The customer’s mobile phone number.

        @[JSON::Field(key: "MobilePhoneNumber")]
        getter mobile_phone_number : String?

        # The type of profile used to describe the customer.

        @[JSON::Field(key: "PartyType")]
        getter party_type : String?

        # An alternative to PartyType which accepts any string as input.

        @[JSON::Field(key: "PartyTypeString")]
        getter party_type_string : String?

        # The customer’s personal email address.

        @[JSON::Field(key: "PersonalEmailAddress")]
        getter personal_email_address : String?

        # The customer's phone number, which has not been specified as a mobile, home, or business number.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String?

        # The type of the profile.

        @[JSON::Field(key: "ProfileType")]
        getter profile_type : String?

        # The customer’s shipping address.

        @[JSON::Field(key: "ShippingAddress")]
        getter shipping_address : Types::Address?

        def initialize(
          @account_number : String? = nil,
          @additional_information : String? = nil,
          @address : Types::Address? = nil,
          @attributes : Hash(String, String)? = nil,
          @billing_address : Types::Address? = nil,
          @birth_date : String? = nil,
          @business_email_address : String? = nil,
          @business_name : String? = nil,
          @business_phone_number : String? = nil,
          @email_address : String? = nil,
          @engagement_preferences : Types::EngagementPreferences? = nil,
          @first_name : String? = nil,
          @found_by_items : Array(Types::FoundByKeyValue)? = nil,
          @gender : String? = nil,
          @gender_string : String? = nil,
          @home_phone_number : String? = nil,
          @last_name : String? = nil,
          @mailing_address : Types::Address? = nil,
          @middle_name : String? = nil,
          @mobile_phone_number : String? = nil,
          @party_type : String? = nil,
          @party_type_string : String? = nil,
          @personal_email_address : String? = nil,
          @phone_number : String? = nil,
          @profile_id : String? = nil,
          @profile_type : String? = nil,
          @shipping_address : Types::Address? = nil
        )
        end
      end


      struct ProfileAttributeValuesRequest
        include JSON::Serializable

        # The attribute name.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The unique identifier of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @attribute_name : String,
          @domain_name : String
        )
        end
      end


      struct ProfileAttributeValuesResponse
        include JSON::Serializable

        # The attribute name.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The items returned as part of the response.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::AttributeValueItem)?

        # The status code for the response.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        def initialize(
          @attribute_name : String? = nil,
          @domain_name : String? = nil,
          @items : Array(Types::AttributeValueItem)? = nil,
          @status_code : Int32? = nil
        )
        end
      end

      # The object used to segment on attributes within the customer profile.

      struct ProfileAttributes
        include JSON::Serializable

        # A field to describe values to segment on within account number.

        @[JSON::Field(key: "AccountNumber")]
        getter account_number : Types::ProfileDimension?

        # A field to describe values to segment on within additional information.

        @[JSON::Field(key: "AdditionalInformation")]
        getter additional_information : Types::ExtraLengthValueProfileDimension?

        # A field to describe values to segment on within address.

        @[JSON::Field(key: "Address")]
        getter address : Types::AddressDimension?

        # A field to describe values to segment on within attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, Types::AttributeDimension)?

        # A field to describe values to segment on within billing address.

        @[JSON::Field(key: "BillingAddress")]
        getter billing_address : Types::AddressDimension?

        # A field to describe values to segment on within birthDate.

        @[JSON::Field(key: "BirthDate")]
        getter birth_date : Types::DateDimension?

        # A field to describe values to segment on within business email address.

        @[JSON::Field(key: "BusinessEmailAddress")]
        getter business_email_address : Types::ProfileDimension?

        # A field to describe values to segment on within business name.

        @[JSON::Field(key: "BusinessName")]
        getter business_name : Types::ProfileDimension?

        # A field to describe values to segment on within business phone number.

        @[JSON::Field(key: "BusinessPhoneNumber")]
        getter business_phone_number : Types::ProfileDimension?

        # A field to describe values to segment on within email address.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : Types::ProfileDimension?

        # A field to describe values to segment on within first name.

        @[JSON::Field(key: "FirstName")]
        getter first_name : Types::ProfileDimension?

        # A field to describe values to segment on within genderString.

        @[JSON::Field(key: "GenderString")]
        getter gender_string : Types::ProfileDimension?

        # A field to describe values to segment on within home phone number.

        @[JSON::Field(key: "HomePhoneNumber")]
        getter home_phone_number : Types::ProfileDimension?

        # A field to describe values to segment on within last name.

        @[JSON::Field(key: "LastName")]
        getter last_name : Types::ProfileDimension?

        # A field to describe values to segment on within mailing address.

        @[JSON::Field(key: "MailingAddress")]
        getter mailing_address : Types::AddressDimension?

        # A field to describe values to segment on within middle name.

        @[JSON::Field(key: "MiddleName")]
        getter middle_name : Types::ProfileDimension?

        # A field to describe values to segment on within mobile phone number.

        @[JSON::Field(key: "MobilePhoneNumber")]
        getter mobile_phone_number : Types::ProfileDimension?

        # A field to describe values to segment on within partyTypeString.

        @[JSON::Field(key: "PartyTypeString")]
        getter party_type_string : Types::ProfileDimension?

        # A field to describe values to segment on within personal email address.

        @[JSON::Field(key: "PersonalEmailAddress")]
        getter personal_email_address : Types::ProfileDimension?

        # A field to describe values to segment on within phone number.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : Types::ProfileDimension?

        # A field to describe values to segment on within profile type.

        @[JSON::Field(key: "ProfileType")]
        getter profile_type : Types::ProfileTypeDimension?

        # A field to describe values to segment on within shipping address.

        @[JSON::Field(key: "ShippingAddress")]
        getter shipping_address : Types::AddressDimension?

        def initialize(
          @account_number : Types::ProfileDimension? = nil,
          @additional_information : Types::ExtraLengthValueProfileDimension? = nil,
          @address : Types::AddressDimension? = nil,
          @attributes : Hash(String, Types::AttributeDimension)? = nil,
          @billing_address : Types::AddressDimension? = nil,
          @birth_date : Types::DateDimension? = nil,
          @business_email_address : Types::ProfileDimension? = nil,
          @business_name : Types::ProfileDimension? = nil,
          @business_phone_number : Types::ProfileDimension? = nil,
          @email_address : Types::ProfileDimension? = nil,
          @first_name : Types::ProfileDimension? = nil,
          @gender_string : Types::ProfileDimension? = nil,
          @home_phone_number : Types::ProfileDimension? = nil,
          @last_name : Types::ProfileDimension? = nil,
          @mailing_address : Types::AddressDimension? = nil,
          @middle_name : Types::ProfileDimension? = nil,
          @mobile_phone_number : Types::ProfileDimension? = nil,
          @party_type_string : Types::ProfileDimension? = nil,
          @personal_email_address : Types::ProfileDimension? = nil,
          @phone_number : Types::ProfileDimension? = nil,
          @profile_type : Types::ProfileTypeDimension? = nil,
          @shipping_address : Types::AddressDimension? = nil
        )
        end
      end

      # Object to hold the dimensions of a profile's fields to segment on.

      struct ProfileDimension
        include JSON::Serializable

        # The action to segment on.

        @[JSON::Field(key: "DimensionType")]
        getter dimension_type : String

        # The values to apply the DimensionType on.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @dimension_type : String,
          @values : Array(String)
        )
        end
      end

      # Contains profile history record metadata.

      struct ProfileHistoryRecord
        include JSON::Serializable

        # The action type of the profile history record.

        @[JSON::Field(key: "ActionType")]
        getter action_type : String

        # The timestamp of when the profile history record was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The unique identifier of the profile history record.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # The timestamp of when the profile history record was last updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The Amazon Resource Name (ARN) of the person or service principal who performed the action.

        @[JSON::Field(key: "PerformedBy")]
        getter performed_by : String?

        # The unique identifier of the profile object generated by the service.

        @[JSON::Field(key: "ProfileObjectUniqueKey")]
        getter profile_object_unique_key : String?

        def initialize(
          @action_type : String,
          @created_at : Time,
          @id : String,
          @object_type_name : String,
          @last_updated_at : Time? = nil,
          @performed_by : String? = nil,
          @profile_object_unique_key : String? = nil
        )
        end
      end

      # Object that holds failures for membership.

      struct ProfileQueryFailures
        include JSON::Serializable

        # A message describing the failure.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The profile id the failure belongs to.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # The status describing the failure.

        @[JSON::Field(key: "Status")]
        getter status : Int32?

        def initialize(
          @message : String,
          @profile_id : String,
          @status : Int32? = nil
        )
        end
      end

      # Object that holds the results for membership.

      struct ProfileQueryResult
        include JSON::Serializable

        # The profile id the result belongs to.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # Describes whether the profile was absent or present in the segment.

        @[JSON::Field(key: "QueryResult")]
        getter query_result : String


        @[JSON::Field(key: "Profile")]
        getter profile : Types::Profile?

        def initialize(
          @profile_id : String,
          @query_result : String,
          @profile : Types::Profile? = nil
        )
        end
      end

      # Object to hold the dimension of a profile type field to segment on.

      struct ProfileTypeDimension
        include JSON::Serializable

        # The action to segment on.

        @[JSON::Field(key: "DimensionType")]
        getter dimension_type : String

        # The values to apply the DimensionType on.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @dimension_type : String,
          @values : Array(String)
        )
        end
      end


      struct PutDomainObjectTypeRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A map of field names to their corresponding domain object type field definitions.

        @[JSON::Field(key: "Fields")]
        getter fields : Hash(String, Types::DomainObjectTypeField)

        # The unique name of the domain object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # The description of the domain object type.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The customer provided KMS key used to encrypt this type of domain object.

        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_name : String,
          @fields : Hash(String, Types::DomainObjectTypeField),
          @object_type_name : String,
          @description : String? = nil,
          @encryption_key : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct PutDomainObjectTypeResponse
        include JSON::Serializable

        # The timestamp of when the domain object type was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the domain object type.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The customer provided KMS key used to encrypt this type of domain object.

        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : String?

        # A map of field names to their corresponding domain object type field definitions.

        @[JSON::Field(key: "Fields")]
        getter fields : Hash(String, Types::DomainObjectTypeField)?

        # The timestamp of when the domain object type was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The unique name of the domain object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @encryption_key : String? = nil,
          @fields : Hash(String, Types::DomainObjectTypeField)? = nil,
          @last_updated_at : Time? = nil,
          @object_type_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct PutIntegrationRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A list of unique names for active event triggers associated with the integration.

        @[JSON::Field(key: "EventTriggerNames")]
        getter event_trigger_names : Array(String)?

        # The configuration that controls how Customer Profiles retrieves data from the source.

        @[JSON::Field(key: "FlowDefinition")]
        getter flow_definition : Types::FlowDefinition?

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String?

        # A map in which each key is an event type from an external application such as Segment or Shopify,
        # and each value is an ObjectTypeName (template) used to ingest the event. It supports the following
        # event types: SegmentIdentify , ShopifyCreateCustomers , ShopifyUpdateCustomers ,
        # ShopifyCreateDraftOrders , ShopifyUpdateDraftOrders , ShopifyCreateOrders , and ShopifyUpdatedOrders
        # .

        @[JSON::Field(key: "ObjectTypeNames")]
        getter object_type_names : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the IAM role. The Integration uses this role to make Customer
        # Profiles requests on your behalf.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Specifies whether the integration applies to profile level data (associated with profiles) or domain
        # level data (not associated with any specific profile). The default value is PROFILE.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The URI of the S3 bucket or any other type of data source.

        @[JSON::Field(key: "Uri")]
        getter uri : String?

        def initialize(
          @domain_name : String,
          @event_trigger_names : Array(String)? = nil,
          @flow_definition : Types::FlowDefinition? = nil,
          @object_type_name : String? = nil,
          @object_type_names : Hash(String, String)? = nil,
          @role_arn : String? = nil,
          @scope : String? = nil,
          @tags : Hash(String, String)? = nil,
          @uri : String? = nil
        )
        end
      end


      struct PutIntegrationResponse
        include JSON::Serializable

        # The timestamp of when the domain was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The timestamp of when the domain was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # The URI of the S3 bucket or any other type of data source.

        @[JSON::Field(key: "Uri")]
        getter uri : String

        # A list of unique names for active event triggers associated with the integration. This list would be
        # empty if no Event Trigger is associated with the integration.

        @[JSON::Field(key: "EventTriggerNames")]
        getter event_trigger_names : Array(String)?

        # Boolean that shows if the Flow that's associated with the Integration is created in Amazon Appflow,
        # or with ObjectTypeName equals _unstructured via API/CLI in flowDefinition.

        @[JSON::Field(key: "IsUnstructured")]
        getter is_unstructured : Bool?

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String?

        # A map in which each key is an event type from an external application such as Segment or Shopify,
        # and each value is an ObjectTypeName (template) used to ingest the event. It supports the following
        # event types: SegmentIdentify , ShopifyCreateCustomers , ShopifyUpdateCustomers ,
        # ShopifyCreateDraftOrders , ShopifyUpdateDraftOrders , ShopifyCreateOrders , and ShopifyUpdatedOrders
        # .

        @[JSON::Field(key: "ObjectTypeNames")]
        getter object_type_names : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the IAM role. The Integration uses this role to make Customer
        # Profiles requests on your behalf.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Specifies whether the integration applies to profile level data (associated with profiles) or domain
        # level data (not associated with any specific profile). The default value is PROFILE.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # Unique identifier for the workflow.

        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String?

        def initialize(
          @created_at : Time,
          @domain_name : String,
          @last_updated_at : Time,
          @uri : String,
          @event_trigger_names : Array(String)? = nil,
          @is_unstructured : Bool? = nil,
          @object_type_name : String? = nil,
          @object_type_names : Hash(String, String)? = nil,
          @role_arn : String? = nil,
          @scope : String? = nil,
          @tags : Hash(String, String)? = nil,
          @workflow_id : String? = nil
        )
        end
      end


      struct PutProfileObjectRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A string that is serialized from a JSON object.

        @[JSON::Field(key: "Object")]
        getter object : String

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        def initialize(
          @domain_name : String,
          @object : String,
          @object_type_name : String
        )
        end
      end


      struct PutProfileObjectResponse
        include JSON::Serializable

        # The unique identifier of the profile object generated by the service.

        @[JSON::Field(key: "ProfileObjectUniqueKey")]
        getter profile_object_unique_key : String?

        def initialize(
          @profile_object_unique_key : String? = nil
        )
        end
      end


      struct PutProfileObjectTypeRequest
        include JSON::Serializable

        # Description of the profile object type.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # Indicates whether a profile should be created when data is received if one doesn’t exist for an
        # object of this type. The default is FALSE . If the AllowProfileCreation flag is set to FALSE , then
        # the service tries to fetch a standard profile and associate this object with the profile. If it is
        # set to TRUE , and if no match is found, then the service creates a new standard profile.

        @[JSON::Field(key: "AllowProfileCreation")]
        getter allow_profile_creation : Bool?

        # The customer-provided key to encrypt the profile object that will be created in this profile object
        # type.

        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : String?

        # The number of days until the data in the object expires.

        @[JSON::Field(key: "ExpirationDays")]
        getter expiration_days : Int32?

        # A map of the name and ObjectType field.

        @[JSON::Field(key: "Fields")]
        getter fields : Hash(String, Types::ObjectTypeField)?

        # A list of unique keys that can be used to map data to the profile.

        @[JSON::Field(key: "Keys")]
        getter keys : Hash(String, Array(Types::ObjectTypeKey))?

        # The amount of profile object max count assigned to the object type

        @[JSON::Field(key: "MaxProfileObjectCount")]
        getter max_profile_object_count : Int32?

        # The format of your sourceLastUpdatedTimestamp that was previously set up.

        @[JSON::Field(key: "SourceLastUpdatedTimestampFormat")]
        getter source_last_updated_timestamp_format : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # A unique identifier for the object template. For some attributes in the request, the service will
        # use the default value from the object template when TemplateId is present. If these attributes are
        # present in the request, the service may return a BadRequestException . These attributes include:
        # AllowProfileCreation, SourceLastUpdatedTimestampFormat, Fields, and Keys. For example, if
        # AllowProfileCreation is set to true when TemplateId is set, the service may return a
        # BadRequestException .

        @[JSON::Field(key: "TemplateId")]
        getter template_id : String?

        def initialize(
          @description : String,
          @domain_name : String,
          @object_type_name : String,
          @allow_profile_creation : Bool? = nil,
          @encryption_key : String? = nil,
          @expiration_days : Int32? = nil,
          @fields : Hash(String, Types::ObjectTypeField)? = nil,
          @keys : Hash(String, Array(Types::ObjectTypeKey))? = nil,
          @max_profile_object_count : Int32? = nil,
          @source_last_updated_timestamp_format : String? = nil,
          @tags : Hash(String, String)? = nil,
          @template_id : String? = nil
        )
        end
      end


      struct PutProfileObjectTypeResponse
        include JSON::Serializable

        # Description of the profile object type.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The name of the profile object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String

        # Indicates whether a profile should be created when data is received if one doesn’t exist for an
        # object of this type. The default is FALSE . If the AllowProfileCreation flag is set to FALSE , then
        # the service tries to fetch a standard profile and associate this object with the profile. If it is
        # set to TRUE , and if no match is found, then the service creates a new standard profile.

        @[JSON::Field(key: "AllowProfileCreation")]
        getter allow_profile_creation : Bool?

        # The timestamp of when the domain was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The customer-provided key to encrypt the profile object that will be created in this profile object
        # type.

        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : String?

        # The number of days until the data in the object expires.

        @[JSON::Field(key: "ExpirationDays")]
        getter expiration_days : Int32?

        # A map of the name and ObjectType field.

        @[JSON::Field(key: "Fields")]
        getter fields : Hash(String, Types::ObjectTypeField)?

        # A list of unique keys that can be used to map data to the profile.

        @[JSON::Field(key: "Keys")]
        getter keys : Hash(String, Array(Types::ObjectTypeKey))?

        # The timestamp of when the domain was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The amount of provisioned profile object max count available.

        @[JSON::Field(key: "MaxAvailableProfileObjectCount")]
        getter max_available_profile_object_count : Int32?

        # The amount of profile object max count assigned to the object type.

        @[JSON::Field(key: "MaxProfileObjectCount")]
        getter max_profile_object_count : Int32?

        # The format of your sourceLastUpdatedTimestamp that was previously set up in fields that were parsed
        # using SimpleDateFormat . If you have sourceLastUpdatedTimestamp in your field, you must set up
        # sourceLastUpdatedTimestampFormat .

        @[JSON::Field(key: "SourceLastUpdatedTimestampFormat")]
        getter source_last_updated_timestamp_format : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # A unique identifier for the object template.

        @[JSON::Field(key: "TemplateId")]
        getter template_id : String?

        def initialize(
          @description : String,
          @object_type_name : String,
          @allow_profile_creation : Bool? = nil,
          @created_at : Time? = nil,
          @encryption_key : String? = nil,
          @expiration_days : Int32? = nil,
          @fields : Hash(String, Types::ObjectTypeField)? = nil,
          @keys : Hash(String, Array(Types::ObjectTypeKey))? = nil,
          @last_updated_at : Time? = nil,
          @max_available_profile_object_count : Int32? = nil,
          @max_profile_object_count : Int32? = nil,
          @source_last_updated_timestamp_format : String? = nil,
          @tags : Hash(String, String)? = nil,
          @template_id : String? = nil
        )
        end
      end

      # The relative time period over which data is included in the aggregation.

      struct Range
        include JSON::Serializable

        # The format the timestamp field in your JSON object is specified. This value should be one of
        # EPOCHMILLI (for Unix epoch timestamps with second/millisecond level precision) or ISO_8601
        # (following ISO_8601 format with second/millisecond level precision, with an optional offset of Z or
        # in the format HH:MM or HHMM.). E.g. if your object type is MyType and source JSON is {"generatedAt":
        # {"timestamp": "2001-07-04T12:08:56.235-0700"}}, then TimestampFormat should be "ISO_8601".

        @[JSON::Field(key: "TimestampFormat")]
        getter timestamp_format : String?

        # An expression specifying the field in your JSON object from which the date should be parsed. The
        # expression should follow the structure of \"{ObjectTypeName.&lt;Location of timestamp field in JSON
        # pointer format&gt;}\". E.g. if your object type is MyType and source JSON is {"generatedAt":
        # {"timestamp": "1737587945945"}}, then TimestampSource should be "{MyType.generatedAt.timestamp}".

        @[JSON::Field(key: "TimestampSource")]
        getter timestamp_source : String?

        # The unit of time.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        # The amount of time of the specified unit.

        @[JSON::Field(key: "Value")]
        getter value : Int32?

        # A structure letting customers specify a relative time window over which over which data is included
        # in the Calculated Attribute. Use positive numbers to indicate that the endpoint is in the past, and
        # negative numbers to indicate it is in the future. ValueRange overrides Value.

        @[JSON::Field(key: "ValueRange")]
        getter value_range : Types::ValueRange?

        def initialize(
          @timestamp_format : String? = nil,
          @timestamp_source : String? = nil,
          @unit : String? = nil,
          @value : Int32? = nil,
          @value_range : Types::ValueRange? = nil
        )
        end
      end

      # Overrides the original range on a calculated attribute definition.

      struct RangeOverride
        include JSON::Serializable

        # The start time of when to include objects.

        @[JSON::Field(key: "Start")]
        getter start : Int32

        # The unit for start and end.

        @[JSON::Field(key: "Unit")]
        getter unit : String

        # The end time of when to include objects.

        @[JSON::Field(key: "End")]
        getter end : Int32?

        def initialize(
          @start : Int32,
          @unit : String,
          @end : Int32? = nil
        )
        end
      end

      # Information indicating if the Calculated Attribute is ready for use by confirming all historical
      # data has been processed and reflected.

      struct Readiness
        include JSON::Serializable

        # Any customer messaging.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # Approximately how far the Calculated Attribute creation is from completion.

        @[JSON::Field(key: "ProgressPercentage")]
        getter progress_percentage : Int32?

        def initialize(
          @message : String? = nil,
          @progress_percentage : Int32? = nil
        )
        end
      end

      # Represents a single recommendation generated by the recommender system.

      struct Recommendation
        include JSON::Serializable

        # The catalog item being recommended, including its complete details and attributes.

        @[JSON::Field(key: "CatalogItem")]
        getter catalog_item : Types::CatalogItem?

        # Recommendation Score between 0 and 1.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @catalog_item : Types::CatalogItem? = nil,
          @score : Float64? = nil
        )
        end
      end

      # Configuration settings that define the behavior and parameters of a recommender.

      struct RecommenderConfig
        include JSON::Serializable

        # Configuration settings for how the recommender processes and uses events.

        @[JSON::Field(key: "EventsConfig")]
        getter events_config : Types::EventsConfig

        # How often the recommender should retrain its model with new data.

        @[JSON::Field(key: "TrainingFrequency")]
        getter training_frequency : Int32?

        def initialize(
          @events_config : Types::EventsConfig,
          @training_frequency : Int32? = nil
        )
        end
      end

      # Defines the algorithm and approach used to generate recommendations.

      struct RecommenderRecipe
        include JSON::Serializable

        # A description of the recommender recipe's purpose and functionality.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the recommender recipe.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Provides a summary of a recommender's configuration and current state.

      struct RecommenderSummary
        include JSON::Serializable

        # The timestamp when the recommender was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A description of the recommender's purpose and characteristics.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If the recommender is in a failed state, provides the reason for the failure.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The timestamp of when the recommender was edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # Information about the most recent update performed on the recommender, including its status and
        # timing.

        @[JSON::Field(key: "LatestRecommenderUpdate")]
        getter latest_recommender_update : Types::RecommenderUpdate?

        # The name of the recipe used by this recommender.

        @[JSON::Field(key: "RecipeName")]
        getter recipe_name : String?

        # The configuration settings applied to this recommender.

        @[JSON::Field(key: "RecommenderConfig")]
        getter recommender_config : Types::RecommenderConfig?

        # The name of the recommender.

        @[JSON::Field(key: "RecommenderName")]
        getter recommender_name : String?

        # The current operational status of the recommender.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @failure_reason : String? = nil,
          @last_updated_at : Time? = nil,
          @latest_recommender_update : Types::RecommenderUpdate? = nil,
          @recipe_name : String? = nil,
          @recommender_config : Types::RecommenderConfig? = nil,
          @recommender_name : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains information about an update operation performed on a recommender.

      struct RecommenderUpdate
        include JSON::Serializable

        # The timestamp when this recommender update was initiated.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # If the update operation failed, provides the reason for the failure.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The timestamp of when the recommender was edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The updated configuration settings applied to the recommender during this update.

        @[JSON::Field(key: "RecommenderConfig")]
        getter recommender_config : Types::RecommenderConfig?

        # The current status of the recommender update operation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_at : Time? = nil,
          @failure_reason : String? = nil,
          @last_updated_at : Time? = nil,
          @recommender_config : Types::RecommenderConfig? = nil,
          @status : String? = nil
        )
        end
      end

      # The requested resource does not exist, or access was denied.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The summary of results for an upload job, including the number of updated, created, and failed
      # records.

      struct ResultsSummary
        include JSON::Serializable

        # The number of records that were newly created during the upload job.

        @[JSON::Field(key: "CreatedRecords")]
        getter created_records : Int64?

        # The number of records that failed to be processed during the upload job.

        @[JSON::Field(key: "FailedRecords")]
        getter failed_records : Int64?

        # The number of records that were updated during the upload job.

        @[JSON::Field(key: "UpdatedRecords")]
        getter updated_records : Int64?

        def initialize(
          @created_records : Int64? = nil,
          @failed_records : Int64? = nil,
          @updated_records : Int64? = nil
        )
        end
      end

      # The request to enable the rule-based matching.

      struct RuleBasedMatchingRequest
        include JSON::Serializable

        # The flag that enables the rule-based matching process of duplicate profiles.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # Configures information about the AttributeTypesSelector where the rule-based identity resolution
        # uses to match profiles.

        @[JSON::Field(key: "AttributeTypesSelector")]
        getter attribute_types_selector : Types::AttributeTypesSelector?


        @[JSON::Field(key: "ConflictResolution")]
        getter conflict_resolution : Types::ConflictResolution?


        @[JSON::Field(key: "ExportingConfig")]
        getter exporting_config : Types::ExportingConfig?

        # Configures how the rule-based matching process should match profiles. You can have up to 15
        # MatchingRule in the MatchingRules .

        @[JSON::Field(key: "MatchingRules")]
        getter matching_rules : Array(Types::MatchingRule)?

        # Indicates the maximum allowed rule level.

        @[JSON::Field(key: "MaxAllowedRuleLevelForMatching")]
        getter max_allowed_rule_level_for_matching : Int32?

        # MatchingRule

        @[JSON::Field(key: "MaxAllowedRuleLevelForMerging")]
        getter max_allowed_rule_level_for_merging : Int32?

        def initialize(
          @enabled : Bool,
          @attribute_types_selector : Types::AttributeTypesSelector? = nil,
          @conflict_resolution : Types::ConflictResolution? = nil,
          @exporting_config : Types::ExportingConfig? = nil,
          @matching_rules : Array(Types::MatchingRule)? = nil,
          @max_allowed_rule_level_for_matching : Int32? = nil,
          @max_allowed_rule_level_for_merging : Int32? = nil
        )
        end
      end

      # The response of the Rule-based matching request.

      struct RuleBasedMatchingResponse
        include JSON::Serializable

        # Configures information about the AttributeTypesSelector where the rule-based identity resolution
        # uses to match profiles.

        @[JSON::Field(key: "AttributeTypesSelector")]
        getter attribute_types_selector : Types::AttributeTypesSelector?


        @[JSON::Field(key: "ConflictResolution")]
        getter conflict_resolution : Types::ConflictResolution?

        # The flag that enables the rule-based matching process of duplicate profiles.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?


        @[JSON::Field(key: "ExportingConfig")]
        getter exporting_config : Types::ExportingConfig?

        # Configures how the rule-based matching process should match profiles. You can have up to 15
        # MatchingRule in the MatchingRules .

        @[JSON::Field(key: "MatchingRules")]
        getter matching_rules : Array(Types::MatchingRule)?

        # Indicates the maximum allowed rule level.

        @[JSON::Field(key: "MaxAllowedRuleLevelForMatching")]
        getter max_allowed_rule_level_for_matching : Int32?

        # MatchingRule

        @[JSON::Field(key: "MaxAllowedRuleLevelForMerging")]
        getter max_allowed_rule_level_for_merging : Int32?

        # PENDING The first status after configuration a rule-based matching rule. If it is an existing
        # domain, the rule-based Identity Resolution waits one hour before creating the matching rule. If it
        # is a new domain, the system will skip the PENDING stage. IN_PROGRESS The system is creating the
        # rule-based matching rule. Under this status, the system is evaluating the existing data and you can
        # no longer change the Rule-based matching configuration. ACTIVE The rule is ready to use. You can
        # change the rule a day after the status is in ACTIVE .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @attribute_types_selector : Types::AttributeTypesSelector? = nil,
          @conflict_resolution : Types::ConflictResolution? = nil,
          @enabled : Bool? = nil,
          @exporting_config : Types::ExportingConfig? = nil,
          @matching_rules : Array(Types::MatchingRule)? = nil,
          @max_allowed_rule_level_for_matching : Int32? = nil,
          @max_allowed_rule_level_for_merging : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      # Configuration information about the S3 bucket where Identity Resolution Jobs write result files.

      struct S3ExportingConfig
        include JSON::Serializable

        # The name of the S3 bucket where Identity Resolution Jobs write result files.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String

        # The S3 key name of the location where Identity Resolution Jobs write result files.

        @[JSON::Field(key: "S3KeyName")]
        getter s3_key_name : String?

        def initialize(
          @s3_bucket_name : String,
          @s3_key_name : String? = nil
        )
        end
      end

      # The S3 location where Identity Resolution Jobs write result files.

      struct S3ExportingLocation
        include JSON::Serializable

        # The name of the S3 bucket name where Identity Resolution Jobs write result files.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # The S3 key name of the location where Identity Resolution Jobs write result files.

        @[JSON::Field(key: "S3KeyName")]
        getter s3_key_name : String?

        def initialize(
          @s3_bucket_name : String? = nil,
          @s3_key_name : String? = nil
        )
        end
      end

      # The properties that are applied when Amazon S3 is being used as the flow source.

      struct S3SourceProperties
        include JSON::Serializable

        # The Amazon S3 bucket name where the source files are stored.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # The object key for the Amazon S3 bucket in which the source files are stored.

        @[JSON::Field(key: "BucketPrefix")]
        getter bucket_prefix : String?

        def initialize(
          @bucket_name : String,
          @bucket_prefix : String? = nil
        )
        end
      end

      # The properties that are applied when Salesforce is being used as a source.

      struct SalesforceSourceProperties
        include JSON::Serializable

        # The object specified in the Salesforce flow source.

        @[JSON::Field(key: "Object")]
        getter object : String

        # The flag that enables dynamic fetching of new (recently added) fields in the Salesforce objects
        # while running a flow.

        @[JSON::Field(key: "EnableDynamicFieldUpdate")]
        getter enable_dynamic_field_update : Bool?

        # Indicates whether Amazon AppFlow includes deleted files in the flow run.

        @[JSON::Field(key: "IncludeDeletedRecords")]
        getter include_deleted_records : Bool?

        def initialize(
          @object : String,
          @enable_dynamic_field_update : Bool? = nil,
          @include_deleted_records : Bool? = nil
        )
        end
      end

      # Specifies the configuration details of a scheduled-trigger flow that you define. Currently, these
      # settings only apply to the scheduled-trigger type.

      struct ScheduledTriggerProperties
        include JSON::Serializable

        # The scheduling expression that determines the rate at which the schedule will run, for example rate
        # (5 minutes).

        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String

        # Specifies whether a scheduled flow has an incremental data transfer or a complete data transfer for
        # each flow run.

        @[JSON::Field(key: "DataPullMode")]
        getter data_pull_mode : String?

        # Specifies the date range for the records to import from the connector in the first flow run.

        @[JSON::Field(key: "FirstExecutionFrom")]
        getter first_execution_from : Time?

        # Specifies the scheduled end time for a scheduled-trigger flow.

        @[JSON::Field(key: "ScheduleEndTime")]
        getter schedule_end_time : Time?

        # Specifies the optional offset that is added to the time interval for a schedule-triggered flow.

        @[JSON::Field(key: "ScheduleOffset")]
        getter schedule_offset : Int64?

        # Specifies the scheduled start time for a scheduled-trigger flow.

        @[JSON::Field(key: "ScheduleStartTime")]
        getter schedule_start_time : Time?

        # Specifies the time zone used when referring to the date and time of a scheduled-triggered flow, such
        # as America/New_York.

        @[JSON::Field(key: "Timezone")]
        getter timezone : String?

        def initialize(
          @schedule_expression : String,
          @data_pull_mode : String? = nil,
          @first_execution_from : Time? = nil,
          @schedule_end_time : Time? = nil,
          @schedule_offset : Int64? = nil,
          @schedule_start_time : Time? = nil,
          @timezone : String? = nil
        )
        end
      end


      struct SearchProfilesRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A searchable identifier of a customer profile. The predefined keys you can use to search include:
        # _account, _profileId, _assetId, _caseId, _orderId, _fullName, _phone, _email, _ctrContactId,
        # _marketoLeadId, _salesforceAccountId, _salesforceContactId, _salesforceAssetId, _zendeskUserId,
        # _zendeskExternalId, _zendeskTicketId, _serviceNowSystemId, _serviceNowIncidentId, _segmentUserId,
        # _shopifyCustomerId, _shopifyOrderId.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String

        # A list of key values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        # A list of AdditionalSearchKey objects that are each searchable identifiers of a profile. Each
        # AdditionalSearchKey object contains a KeyName and a list of Values associated with that specific key
        # (i.e., a key-value(s) pair). These additional search keys will be used in conjunction with the
        # LogicalOperator and the required KeyName and Values parameters to search for profiles that satisfy
        # the search criteria.

        @[JSON::Field(key: "AdditionalSearchKeys")]
        getter additional_search_keys : Array(Types::AdditionalSearchKey)?

        # Relationship between all specified search keys that will be used to search for profiles. This
        # includes the required KeyName and Values parameters as well as any key-value(s) pairs specified in
        # the AdditionalSearchKeys list. This parameter influences which profiles will be returned in the
        # response in the following manner: AND - The response only includes profiles that match all of the
        # search keys. OR - The response includes profiles that match at least one of the search keys. The OR
        # relationship is the default behavior if this parameter is not included in the request.

        @[JSON::Field(key: "LogicalOperator")]
        getter logical_operator : String?

        # The maximum number of objects returned per page. The default is 20 if this parameter is not included
        # in the request.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The pagination token from the previous SearchProfiles API call.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @key_name : String,
          @values : Array(String),
          @additional_search_keys : Array(Types::AdditionalSearchKey)? = nil,
          @logical_operator : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchProfilesResponse
        include JSON::Serializable

        # The list of Profiles matching the search criteria.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::Profile)?

        # The pagination token from the previous SearchProfiles API call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Profile)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Object holding the segment definition fields.

      struct SegmentDefinitionItem
        include JSON::Serializable

        # When the segment definition was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the segment definition.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Display name of the segment definition.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The arn of the segment definition.

        @[JSON::Field(key: "SegmentDefinitionArn")]
        getter segment_definition_arn : String?

        # Name of the segment definition.

        @[JSON::Field(key: "SegmentDefinitionName")]
        getter segment_definition_name : String?

        # The segment type. Classic : Segments created using traditional SegmentGroup structure Enhanced :
        # Segments created using SQL queries

        @[JSON::Field(key: "SegmentType")]
        getter segment_type : String?

        # The tags belonging to the segment definition.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @segment_definition_arn : String? = nil,
          @segment_definition_name : String? = nil,
          @segment_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains all groups of the segment definition.

      struct SegmentGroup
        include JSON::Serializable

        # Holds the list of groups within the segment definition.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::Group)?

        # Defines whether to include or exclude the profiles that fit the segment criteria.

        @[JSON::Field(key: "Include")]
        getter include : String?

        def initialize(
          @groups : Array(Types::Group)? = nil,
          @include : String? = nil
        )
        end
      end

      # Contains all groups of the segment definition.

      struct SegmentGroupStructure
        include JSON::Serializable

        # Holds the list of groups within the segment definition.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::Group)?

        # Define whether to include or exclude the profiles that fit the segment criteria.

        @[JSON::Field(key: "Include")]
        getter include : String?

        def initialize(
          @groups : Array(Types::Group)? = nil,
          @include : String? = nil
        )
        end
      end

      # The properties that are applied when ServiceNow is being used as a source.

      struct ServiceNowSourceProperties
        include JSON::Serializable

        # The object specified in the ServiceNow flow source.

        @[JSON::Field(key: "Object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end

      # Specifies the information that is required to query a particular Amazon AppFlow connector. Customer
      # Profiles supports Salesforce, Zendesk, Marketo, ServiceNow and Amazon S3.

      struct SourceConnectorProperties
        include JSON::Serializable

        # The properties that are applied when Marketo is being used as a source.

        @[JSON::Field(key: "Marketo")]
        getter marketo : Types::MarketoSourceProperties?

        # The properties that are applied when Amazon S3 is being used as the flow source.

        @[JSON::Field(key: "S3")]
        getter s3 : Types::S3SourceProperties?

        # The properties that are applied when Salesforce is being used as a source.

        @[JSON::Field(key: "Salesforce")]
        getter salesforce : Types::SalesforceSourceProperties?

        # The properties that are applied when ServiceNow is being used as a source.

        @[JSON::Field(key: "ServiceNow")]
        getter service_now : Types::ServiceNowSourceProperties?

        # The properties that are applied when using Zendesk as a flow source.

        @[JSON::Field(key: "Zendesk")]
        getter zendesk : Types::ZendeskSourceProperties?

        def initialize(
          @marketo : Types::MarketoSourceProperties? = nil,
          @s3 : Types::S3SourceProperties? = nil,
          @salesforce : Types::SalesforceSourceProperties? = nil,
          @service_now : Types::ServiceNowSourceProperties? = nil,
          @zendesk : Types::ZendeskSourceProperties? = nil
        )
        end
      end

      # Contains information about the configuration of the source connector used in the flow.

      struct SourceFlowConfig
        include JSON::Serializable

        # The type of connector, such as Salesforce, Marketo, and so on.

        @[JSON::Field(key: "ConnectorType")]
        getter connector_type : String

        # Specifies the information that is required to query a particular source connector.

        @[JSON::Field(key: "SourceConnectorProperties")]
        getter source_connector_properties : Types::SourceConnectorProperties

        # The name of the AppFlow connector profile. This name must be unique for each connector profile in
        # the AWS account.

        @[JSON::Field(key: "ConnectorProfileName")]
        getter connector_profile_name : String?

        # Defines the configuration for a scheduled incremental data pull. If a valid configuration is
        # provided, the fields specified in the configuration are used when querying for the incremental data
        # pull.

        @[JSON::Field(key: "IncrementalPullConfig")]
        getter incremental_pull_config : Types::IncrementalPullConfig?

        def initialize(
          @connector_type : String,
          @source_connector_properties : Types::SourceConnectorProperties,
          @connector_profile_name : String? = nil,
          @incremental_pull_config : Types::IncrementalPullConfig? = nil
        )
        end
      end

      # The source segments to build off of.

      struct SourceSegment
        include JSON::Serializable

        # The unique name of the segment definition.

        @[JSON::Field(key: "SegmentDefinitionName")]
        getter segment_definition_name : String?

        def initialize(
          @segment_definition_name : String? = nil
        )
        end
      end


      struct StartRecommenderRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the recommender to start.

        @[JSON::Field(key: "RecommenderName")]
        getter recommender_name : String

        def initialize(
          @domain_name : String,
          @recommender_name : String
        )
        end
      end


      struct StartRecommenderResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StartUploadJobRequest
        include JSON::Serializable

        # The unique name of the domain containing the upload job to start.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of the upload job to start.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @domain_name : String,
          @job_id : String
        )
        end
      end


      struct StartUploadJobResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StopRecommenderRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the recommender to stop.

        @[JSON::Field(key: "RecommenderName")]
        getter recommender_name : String

        def initialize(
          @domain_name : String,
          @recommender_name : String
        )
        end
      end


      struct StopRecommenderResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StopUploadJobRequest
        include JSON::Serializable

        # The unique name of the domain containing the upload job to stop.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of the upload job to stop.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @domain_name : String,
          @job_id : String
        )
        end
      end


      struct StopUploadJobResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource that you're adding tags to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags used to organize, track, or control access for this resource.

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

      # A class for modeling different type of tasks. Task implementation varies based on the TaskType.

      struct Task
        include JSON::Serializable

        # The source fields to which a particular task is applied.

        @[JSON::Field(key: "SourceFields")]
        getter source_fields : Array(String)

        # Specifies the particular task implementation that Amazon AppFlow performs.

        @[JSON::Field(key: "TaskType")]
        getter task_type : String

        # The operation to be performed on the provided source fields.

        @[JSON::Field(key: "ConnectorOperator")]
        getter connector_operator : Types::ConnectorOperator?

        # A field in a destination connector, or a field value against which Amazon AppFlow validates a source
        # field.

        @[JSON::Field(key: "DestinationField")]
        getter destination_field : String?

        # A map used to store task-related information. The service looks for particular information based on
        # the TaskType.

        @[JSON::Field(key: "TaskProperties")]
        getter task_properties : Hash(String, String)?

        def initialize(
          @source_fields : Array(String),
          @task_type : String,
          @connector_operator : Types::ConnectorOperator? = nil,
          @destination_field : String? = nil,
          @task_properties : Hash(String, String)? = nil
        )
        end
      end

      # The threshold for the calculated attribute.

      struct Threshold
        include JSON::Serializable

        # The operator of the threshold.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The value of the threshold.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @operator : String,
          @value : String
        )
        end
      end

      # You exceeded the maximum number of requests.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains metrics and performance indicators from the training of a recommender model.

      struct TrainingMetrics
        include JSON::Serializable

        # A collection of performance metrics and statistics from the training process.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, Float64)?

        # The timestamp when these training metrics were recorded.

        @[JSON::Field(key: "Time")]
        getter time : Time?

        def initialize(
          @metrics : Hash(String, Float64)? = nil,
          @time : Time? = nil
        )
        end
      end

      # The trigger settings that determine how and when Amazon AppFlow runs the specified flow.

      struct TriggerConfig
        include JSON::Serializable

        # Specifies the type of flow trigger. It can be OnDemand, Scheduled, or Event.

        @[JSON::Field(key: "TriggerType")]
        getter trigger_type : String

        # Specifies the configuration details of a schedule-triggered flow that you define. Currently, these
        # settings only apply to the Scheduled trigger type.

        @[JSON::Field(key: "TriggerProperties")]
        getter trigger_properties : Types::TriggerProperties?

        def initialize(
          @trigger_type : String,
          @trigger_properties : Types::TriggerProperties? = nil
        )
        end
      end

      # Specifies the configuration details that control the trigger for a flow. Currently, these settings
      # only apply to the Scheduled trigger type.

      struct TriggerProperties
        include JSON::Serializable

        # Specifies the configuration details of a schedule-triggered flow that you define.

        @[JSON::Field(key: "Scheduled")]
        getter scheduled : Types::ScheduledTriggerProperties?

        def initialize(
          @scheduled : Types::ScheduledTriggerProperties? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource from which you are removing tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the resource.

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

      # Updates associated with the address properties of a customer profile.

      struct UpdateAddress
        include JSON::Serializable

        # The first line of a customer address.

        @[JSON::Field(key: "Address1")]
        getter address1 : String?

        # The second line of a customer address.

        @[JSON::Field(key: "Address2")]
        getter address2 : String?

        # The third line of a customer address.

        @[JSON::Field(key: "Address3")]
        getter address3 : String?

        # The fourth line of a customer address.

        @[JSON::Field(key: "Address4")]
        getter address4 : String?

        # The city in which a customer lives.

        @[JSON::Field(key: "City")]
        getter city : String?

        # The country in which a customer lives.

        @[JSON::Field(key: "Country")]
        getter country : String?

        # The county in which a customer lives.

        @[JSON::Field(key: "County")]
        getter county : String?

        # The postal code of a customer address.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String?

        # The province in which a customer lives.

        @[JSON::Field(key: "Province")]
        getter province : String?

        # The state in which a customer lives.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @address1 : String? = nil,
          @address2 : String? = nil,
          @address3 : String? = nil,
          @address4 : String? = nil,
          @city : String? = nil,
          @country : String? = nil,
          @county : String? = nil,
          @postal_code : String? = nil,
          @province : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct UpdateCalculatedAttributeDefinitionRequest
        include JSON::Serializable

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The conditions including range, object count, and threshold for the calculated attribute.

        @[JSON::Field(key: "Conditions")]
        getter conditions : Types::Conditions?

        # The description of the calculated attribute.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the calculated attribute.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        def initialize(
          @calculated_attribute_name : String,
          @domain_name : String,
          @conditions : Types::Conditions? = nil,
          @description : String? = nil,
          @display_name : String? = nil
        )
        end
      end


      struct UpdateCalculatedAttributeDefinitionResponse
        include JSON::Serializable

        # The mathematical expression and a list of attribute items specified in that expression.

        @[JSON::Field(key: "AttributeDetails")]
        getter attribute_details : Types::AttributeDetails?

        # The unique name of the calculated attribute.

        @[JSON::Field(key: "CalculatedAttributeName")]
        getter calculated_attribute_name : String?

        # The conditions including range, object count, and threshold for the calculated attribute.

        @[JSON::Field(key: "Conditions")]
        getter conditions : Types::Conditions?

        # The timestamp of when the calculated attribute definition was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the calculated attribute.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the calculated attribute.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The timestamp of when the calculated attribute definition was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # Information indicating if the Calculated Attribute is ready for use by confirming all historical
        # data has been processed and reflected.

        @[JSON::Field(key: "Readiness")]
        getter readiness : Types::Readiness?

        # The aggregation operation to perform for the calculated attribute.

        @[JSON::Field(key: "Statistic")]
        getter statistic : String?

        # Status of the Calculated Attribute creation (whether all historical data has been indexed.)

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # Whether historical data ingested before the Calculated Attribute was created should be included in
        # calculations.

        @[JSON::Field(key: "UseHistoricalData")]
        getter use_historical_data : Bool?

        def initialize(
          @attribute_details : Types::AttributeDetails? = nil,
          @calculated_attribute_name : String? = nil,
          @conditions : Types::Conditions? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @last_updated_at : Time? = nil,
          @readiness : Types::Readiness? = nil,
          @statistic : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @use_historical_data : Bool? = nil
        )
        end
      end


      struct UpdateDomainLayoutRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the layout.

        @[JSON::Field(key: "LayoutDefinitionName")]
        getter layout_definition_name : String

        # The description of the layout

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the layout

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # If set to true for a layout, this layout will be used by default to view data. If set to false, then
        # the layout will not be used by default, but it can be used to view data by explicitly selecting it
        # in the console.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        # A customizable layout that can be used to view data under a Customer Profiles domain.

        @[JSON::Field(key: "Layout")]
        getter layout : String?

        # The type of layout that can be used to view data under a Customer Profiles domain.

        @[JSON::Field(key: "LayoutType")]
        getter layout_type : String?

        def initialize(
          @domain_name : String,
          @layout_definition_name : String,
          @description : String? = nil,
          @display_name : String? = nil,
          @is_default : Bool? = nil,
          @layout : String? = nil,
          @layout_type : String? = nil
        )
        end
      end


      struct UpdateDomainLayoutResponse
        include JSON::Serializable

        # The timestamp of when the layout was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the layout

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The display name of the layout

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # If set to true for a layout, this layout will be used by default to view data. If set to false, then
        # the layout will not be used by default, but it can be used to view data by explicitly selecting it
        # in the console.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        # The timestamp of when the layout was most recently updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # A customizable layout that can be used to view data under a Customer Profiles domain.

        @[JSON::Field(key: "Layout")]
        getter layout : String?

        # The unique name of the layout.

        @[JSON::Field(key: "LayoutDefinitionName")]
        getter layout_definition_name : String?

        # The type of layout that can be used to view data under a Customer Profiles domain.

        @[JSON::Field(key: "LayoutType")]
        getter layout_type : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The version used to create layout.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @is_default : Bool? = nil,
          @last_updated_at : Time? = nil,
          @layout : String? = nil,
          @layout_definition_name : String? = nil,
          @layout_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @version : String? = nil
        )
        end
      end


      struct UpdateDomainRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Set to true to enabled data store for this domain.

        @[JSON::Field(key: "DataStore")]
        getter data_store : Types::DataStoreRequest?

        # The URL of the SQS dead letter queue, which is used for reporting errors associated with ingesting
        # data from third party applications. If specified as an empty string, it will clear any existing
        # value. You must set up a policy on the DeadLetterQueue for the SendMessage operation to enable
        # Amazon Connect Customer Profiles to send messages to the DeadLetterQueue.

        @[JSON::Field(key: "DeadLetterQueueUrl")]
        getter dead_letter_queue_url : String?

        # The default encryption key, which is an AWS managed key, is used when no specific type of encryption
        # key is specified. It is used to encrypt all data before it is placed in permanent or semi-permanent
        # storage. If specified as an empty string, it will clear any existing value.

        @[JSON::Field(key: "DefaultEncryptionKey")]
        getter default_encryption_key : String?

        # The default number of days until the data within the domain expires.

        @[JSON::Field(key: "DefaultExpirationDays")]
        getter default_expiration_days : Int32?

        # The process of matching duplicate profiles. If Matching = true , Amazon Connect Customer Profiles
        # starts a weekly batch process called Identity Resolution Job. If you do not specify a date and time
        # for Identity Resolution Job to run, by default it runs every Saturday at 12AM UTC to detect
        # duplicate profiles in your domains. After the Identity Resolution Job completes, use the GetMatches
        # API to return and review the results. Or, if you have configured ExportingConfig in the
        # MatchingRequest , you can download the results from S3.

        @[JSON::Field(key: "Matching")]
        getter matching : Types::MatchingRequest?

        # The process of matching duplicate profiles using the rule-Based matching. If RuleBasedMatching =
        # true, Amazon Connect Customer Profiles will start to match and merge your profiles according to your
        # configuration in the RuleBasedMatchingRequest . You can use the ListRuleBasedMatches and
        # GetSimilarProfiles API to return and review the results. Also, if you have configured
        # ExportingConfig in the RuleBasedMatchingRequest , you can download the results from S3.

        @[JSON::Field(key: "RuleBasedMatching")]
        getter rule_based_matching : Types::RuleBasedMatchingRequest?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_name : String,
          @data_store : Types::DataStoreRequest? = nil,
          @dead_letter_queue_url : String? = nil,
          @default_encryption_key : String? = nil,
          @default_expiration_days : Int32? = nil,
          @matching : Types::MatchingRequest? = nil,
          @rule_based_matching : Types::RuleBasedMatchingRequest? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateDomainResponse
        include JSON::Serializable

        # The timestamp of when the domain was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The timestamp of when the domain was most recently edited.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # The data store.

        @[JSON::Field(key: "DataStore")]
        getter data_store : Types::DataStoreResponse?

        # The URL of the SQS dead letter queue, which is used for reporting errors associated with ingesting
        # data from third party applications.

        @[JSON::Field(key: "DeadLetterQueueUrl")]
        getter dead_letter_queue_url : String?

        # The default encryption key, which is an AWS managed key, is used when no specific type of encryption
        # key is specified. It is used to encrypt all data before it is placed in permanent or semi-permanent
        # storage.

        @[JSON::Field(key: "DefaultEncryptionKey")]
        getter default_encryption_key : String?

        # The default number of days until the data within the domain expires.

        @[JSON::Field(key: "DefaultExpirationDays")]
        getter default_expiration_days : Int32?

        # The process of matching duplicate profiles. If Matching = true , Amazon Connect Customer Profiles
        # starts a weekly batch process called Identity Resolution Job. If you do not specify a date and time
        # for Identity Resolution Job to run, by default it runs every Saturday at 12AM UTC to detect
        # duplicate profiles in your domains. After the Identity Resolution Job completes, use the GetMatches
        # API to return and review the results. Or, if you have configured ExportingConfig in the
        # MatchingRequest , you can download the results from S3.

        @[JSON::Field(key: "Matching")]
        getter matching : Types::MatchingResponse?

        # The process of matching duplicate profiles using the rule-Based matching. If RuleBasedMatching =
        # true, Amazon Connect Customer Profiles will start to match and merge your profiles according to your
        # configuration in the RuleBasedMatchingRequest . You can use the ListRuleBasedMatches and
        # GetSimilarProfiles API to return and review the results. Also, if you have configured
        # ExportingConfig in the RuleBasedMatchingRequest , you can download the results from S3.

        @[JSON::Field(key: "RuleBasedMatching")]
        getter rule_based_matching : Types::RuleBasedMatchingResponse?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @domain_name : String,
          @last_updated_at : Time,
          @data_store : Types::DataStoreResponse? = nil,
          @dead_letter_queue_url : String? = nil,
          @default_encryption_key : String? = nil,
          @default_expiration_days : Int32? = nil,
          @matching : Types::MatchingResponse? = nil,
          @rule_based_matching : Types::RuleBasedMatchingResponse? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateEventTriggerRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique name of the event trigger.

        @[JSON::Field(key: "EventTriggerName")]
        getter event_trigger_name : String

        # The description of the event trigger.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of conditions that determine when an event should trigger the destination.

        @[JSON::Field(key: "EventTriggerConditions")]
        getter event_trigger_conditions : Array(Types::EventTriggerCondition)?

        # Defines limits controlling whether an event triggers the destination, based on ingestion latency and
        # the number of invocations per profile over specific time periods.

        @[JSON::Field(key: "EventTriggerLimits")]
        getter event_trigger_limits : Types::EventTriggerLimits?

        # The unique name of the object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String?

        # The destination is triggered only for profiles that meet the criteria of a segment definition.

        @[JSON::Field(key: "SegmentFilter")]
        getter segment_filter : String?

        def initialize(
          @domain_name : String,
          @event_trigger_name : String,
          @description : String? = nil,
          @event_trigger_conditions : Array(Types::EventTriggerCondition)? = nil,
          @event_trigger_limits : Types::EventTriggerLimits? = nil,
          @object_type_name : String? = nil,
          @segment_filter : String? = nil
        )
        end
      end


      struct UpdateEventTriggerResponse
        include JSON::Serializable

        # The timestamp of when the event trigger was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the event trigger.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of conditions that determine when an event should trigger the destination.

        @[JSON::Field(key: "EventTriggerConditions")]
        getter event_trigger_conditions : Array(Types::EventTriggerCondition)?

        # Defines limits controlling whether an event triggers the destination, based on ingestion latency and
        # the number of invocations per profile over specific time periods.

        @[JSON::Field(key: "EventTriggerLimits")]
        getter event_trigger_limits : Types::EventTriggerLimits?

        # The unique name of the event trigger.

        @[JSON::Field(key: "EventTriggerName")]
        getter event_trigger_name : String?

        # The timestamp of when the event trigger was most recently updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The unique name of the object type.

        @[JSON::Field(key: "ObjectTypeName")]
        getter object_type_name : String?

        # The destination is triggered only for profiles that meet the criteria of a segment definition.

        @[JSON::Field(key: "SegmentFilter")]
        getter segment_filter : String?

        # An array of key-value pairs to apply to this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @event_trigger_conditions : Array(Types::EventTriggerCondition)? = nil,
          @event_trigger_limits : Types::EventTriggerLimits? = nil,
          @event_trigger_name : String? = nil,
          @last_updated_at : Time? = nil,
          @object_type_name : String? = nil,
          @segment_filter : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateProfileRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # An account number that you have assigned to the customer.

        @[JSON::Field(key: "AccountNumber")]
        getter account_number : String?

        # Any additional information relevant to the customer’s profile.

        @[JSON::Field(key: "AdditionalInformation")]
        getter additional_information : String?

        # A generic address associated with the customer that is not mailing, shipping, or billing.

        @[JSON::Field(key: "Address")]
        getter address : Types::UpdateAddress?

        # A key value pair of attributes of a customer profile.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The customer’s billing address.

        @[JSON::Field(key: "BillingAddress")]
        getter billing_address : Types::UpdateAddress?

        # The customer’s birth date.

        @[JSON::Field(key: "BirthDate")]
        getter birth_date : String?

        # The customer’s business email address.

        @[JSON::Field(key: "BusinessEmailAddress")]
        getter business_email_address : String?

        # The name of the customer’s business.

        @[JSON::Field(key: "BusinessName")]
        getter business_name : String?

        # The customer’s business phone number.

        @[JSON::Field(key: "BusinessPhoneNumber")]
        getter business_phone_number : String?

        # The customer’s email address, which has not been specified as a personal or business address.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # Object that defines users preferred methods of engagement.

        @[JSON::Field(key: "EngagementPreferences")]
        getter engagement_preferences : Types::EngagementPreferences?

        # The customer’s first name.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # The gender with which the customer identifies.

        @[JSON::Field(key: "Gender")]
        getter gender : String?

        # An alternative to Gender which accepts any string as input.

        @[JSON::Field(key: "GenderString")]
        getter gender_string : String?

        # The customer’s home phone number.

        @[JSON::Field(key: "HomePhoneNumber")]
        getter home_phone_number : String?

        # The customer’s last name.

        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # The customer’s mailing address.

        @[JSON::Field(key: "MailingAddress")]
        getter mailing_address : Types::UpdateAddress?

        # The customer’s middle name.

        @[JSON::Field(key: "MiddleName")]
        getter middle_name : String?

        # The customer’s mobile phone number.

        @[JSON::Field(key: "MobilePhoneNumber")]
        getter mobile_phone_number : String?

        # The type of profile used to describe the customer.

        @[JSON::Field(key: "PartyType")]
        getter party_type : String?

        # An alternative to PartyType which accepts any string as input.

        @[JSON::Field(key: "PartyTypeString")]
        getter party_type_string : String?

        # The customer’s personal email address.

        @[JSON::Field(key: "PersonalEmailAddress")]
        getter personal_email_address : String?

        # The customer’s phone number, which has not been specified as a mobile, home, or business number.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # Determines the type of the profile.

        @[JSON::Field(key: "ProfileType")]
        getter profile_type : String?

        # The customer’s shipping address.

        @[JSON::Field(key: "ShippingAddress")]
        getter shipping_address : Types::UpdateAddress?

        def initialize(
          @domain_name : String,
          @profile_id : String,
          @account_number : String? = nil,
          @additional_information : String? = nil,
          @address : Types::UpdateAddress? = nil,
          @attributes : Hash(String, String)? = nil,
          @billing_address : Types::UpdateAddress? = nil,
          @birth_date : String? = nil,
          @business_email_address : String? = nil,
          @business_name : String? = nil,
          @business_phone_number : String? = nil,
          @email_address : String? = nil,
          @engagement_preferences : Types::EngagementPreferences? = nil,
          @first_name : String? = nil,
          @gender : String? = nil,
          @gender_string : String? = nil,
          @home_phone_number : String? = nil,
          @last_name : String? = nil,
          @mailing_address : Types::UpdateAddress? = nil,
          @middle_name : String? = nil,
          @mobile_phone_number : String? = nil,
          @party_type : String? = nil,
          @party_type_string : String? = nil,
          @personal_email_address : String? = nil,
          @phone_number : String? = nil,
          @profile_type : String? = nil,
          @shipping_address : Types::UpdateAddress? = nil
        )
        end
      end


      struct UpdateProfileResponse
        include JSON::Serializable

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @profile_id : String
        )
        end
      end


      struct UpdateRecommenderRequest
        include JSON::Serializable

        # The unique name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the recommender to update.

        @[JSON::Field(key: "RecommenderName")]
        getter recommender_name : String

        # The new description to assign to the recommender.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The new configuration settings to apply to the recommender, including updated parameters and
        # settings that define its behavior.

        @[JSON::Field(key: "RecommenderConfig")]
        getter recommender_config : Types::RecommenderConfig?

        def initialize(
          @domain_name : String,
          @recommender_name : String,
          @description : String? = nil,
          @recommender_config : Types::RecommenderConfig? = nil
        )
        end
      end


      struct UpdateRecommenderResponse
        include JSON::Serializable

        # The name of the recommender that was updated.

        @[JSON::Field(key: "RecommenderName")]
        getter recommender_name : String

        def initialize(
          @recommender_name : String
        )
        end
      end

      # The summary information for an individual upload job.

      struct UploadJobItem
        include JSON::Serializable

        # The timestamp when the upload job was completed.

        @[JSON::Field(key: "CompletedAt")]
        getter completed_at : Time?

        # The timestamp when the upload job was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The expiry duration for the profiles ingested with the upload job.

        @[JSON::Field(key: "DataExpiry")]
        getter data_expiry : Int32?

        # The name of the upload job.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The unique identifier of the upload job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The current status of the upload job.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason for the current status of the upload job.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @completed_at : Time? = nil,
          @created_at : Time? = nil,
          @data_expiry : Int32? = nil,
          @display_name : String? = nil,
          @job_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # A structure letting customers specify a relative time window over which over which data is included
      # in the Calculated Attribute. Use positive numbers to indicate that the endpoint is in the past, and
      # negative numbers to indicate it is in the future. ValueRange overrides Value.

      struct ValueRange
        include JSON::Serializable

        # The end time of when to include objects. Use positive numbers to indicate that the starting point is
        # in the past, and negative numbers to indicate it is in the future.

        @[JSON::Field(key: "End")]
        getter end : Int32

        # The start time of when to include objects. Use positive numbers to indicate that the starting point
        # is in the past, and negative numbers to indicate it is in the future.

        @[JSON::Field(key: "Start")]
        getter start : Int32

        def initialize(
          @end : Int32,
          @start : Int32
        )
        end
      end

      # Structure to hold workflow attributes.

      struct WorkflowAttributes
        include JSON::Serializable

        # Workflow attributes specific to APPFLOW_INTEGRATION workflow.

        @[JSON::Field(key: "AppflowIntegration")]
        getter appflow_integration : Types::AppflowIntegrationWorkflowAttributes?

        def initialize(
          @appflow_integration : Types::AppflowIntegrationWorkflowAttributes? = nil
        )
        end
      end

      # Generic object containing workflow execution metrics.

      struct WorkflowMetrics
        include JSON::Serializable

        # Workflow execution metrics for APPFLOW_INTEGRATION workflow.

        @[JSON::Field(key: "AppflowIntegration")]
        getter appflow_integration : Types::AppflowIntegrationWorkflowMetrics?

        def initialize(
          @appflow_integration : Types::AppflowIntegrationWorkflowMetrics? = nil
        )
        end
      end

      # List containing steps in workflow.

      struct WorkflowStepItem
        include JSON::Serializable

        # Workflow step information specific to APPFLOW_INTEGRATION workflow.

        @[JSON::Field(key: "AppflowIntegration")]
        getter appflow_integration : Types::AppflowIntegrationWorkflowStep?

        def initialize(
          @appflow_integration : Types::AppflowIntegrationWorkflowStep? = nil
        )
        end
      end

      # The properties that are applied when using Zendesk as a flow source.

      struct ZendeskSourceProperties
        include JSON::Serializable

        # The object specified in the Zendesk flow source.

        @[JSON::Field(key: "Object")]
        getter object : String

        def initialize(
          @object : String
        )
        end
      end
    end
  end
end
