require "json"
require "time"

module AwsSdk
  module PartnerCentralSelling
    module Types

      struct AcceptEngagementInvitationRequest
        include JSON::Serializable

        # The CatalogType parameter specifies the catalog associated with the engagement invitation. Accepted
        # values are AWS and Sandbox , which determine the environment in which the engagement invitation is
        # managed.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The Identifier parameter in the AcceptEngagementInvitationRequest specifies the unique identifier of
        # the EngagementInvitation to be accepted. Providing the correct identifier ensures that the intended
        # invitation is accepted.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end

      # This error occurs when you don't have permission to perform the requested action. You don’t have
      # access to this action or resource. Review IAM policies or contact your AWS administrator for
      # assistance.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason why access was denied for the requested operation.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Specifies the Customer 's account details associated with the Opportunity .
      struct Account
        include JSON::Serializable

        # Specifies the end Customer 's company name associated with the Opportunity .
        @[JSON::Field(key: "CompanyName")]
        getter company_name : String

        # Specifies the end Customer 's address details associated with the Opportunity .
        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # Specifies the Customer Amazon Web Services account ID associated with the Opportunity .
        @[JSON::Field(key: "AwsAccountId")]
        getter aws_account_id : String?

        # Indicates the Customer DUNS number, if available.
        @[JSON::Field(key: "Duns")]
        getter duns : String?

        # Specifies the industry the end Customer belongs to that's associated with the Opportunity . It
        # refers to the category or sector where the customer's business operates. This is a required field.
        @[JSON::Field(key: "Industry")]
        getter industry : String?

        # Specifies the end Customer 's industry associated with the Opportunity , when the selected value in
        # the Industry field is Other .
        @[JSON::Field(key: "OtherIndustry")]
        getter other_industry : String?

        # Specifies the end customer's company website URL associated with the Opportunity . This value is
        # crucial to map the customer within the Amazon Web Services CRM system. This field is required in all
        # cases except when the opportunity is related to national security.
        @[JSON::Field(key: "WebsiteUrl")]
        getter website_url : String?

        def initialize(
          @company_name : String,
          @address : Types::Address? = nil,
          @aws_account_id : String? = nil,
          @duns : String? = nil,
          @industry : String? = nil,
          @other_industry : String? = nil,
          @website_url : String? = nil
        )
        end
      end

      # Contains the account details of the partner who received the Engagement Invitation, including the
      # AWS account ID and company name.
      struct AccountReceiver
        include JSON::Serializable

        # Indicates the AWS account ID of the partner who received the Engagement Invitation. This is a unique
        # identifier for managing engagements with specific AWS accounts.
        @[JSON::Field(key: "AwsAccountId")]
        getter aws_account_id : String

        # Represents the alias of the partner account receiving the Engagement Invitation, making it easier to
        # identify and track the recipient in reports or logs.
        @[JSON::Field(key: "Alias")]
        getter alias : String?

        def initialize(
          @aws_account_id : String,
          @alias : String? = nil
        )
        end
      end

      # An object that contains an Account 's subset of fields.
      struct AccountSummary
        include JSON::Serializable

        # Specifies the end Customer 's company name associated with the Opportunity .
        @[JSON::Field(key: "CompanyName")]
        getter company_name : String

        # Specifies the end Customer 's address details associated with the Opportunity .
        @[JSON::Field(key: "Address")]
        getter address : Types::AddressSummary?

        # Specifies which industry the end Customer belongs to associated with the Opportunity . It refers to
        # the category or sector that the customer's business operates in. To submit a value outside the
        # picklist, use Other . Conditionally mandatory if Other is selected for Industry Vertical in LOVs.
        @[JSON::Field(key: "Industry")]
        getter industry : String?

        # Specifies the end Customer 's industry associated with the Opportunity , when the selected value in
        # the Industry field is Other . This field is relevant when the customer's industry doesn't fall under
        # the predefined picklist values and requires a custom description.
        @[JSON::Field(key: "OtherIndustry")]
        getter other_industry : String?

        # Specifies the end customer's company website URL associated with the Opportunity . This value is
        # crucial to map the customer within the Amazon Web Services CRM system.
        @[JSON::Field(key: "WebsiteUrl")]
        getter website_url : String?

        def initialize(
          @company_name : String,
          @address : Types::AddressSummary? = nil,
          @industry : String? = nil,
          @other_industry : String? = nil,
          @website_url : String? = nil
        )
        end
      end

      # Specifies the end Customer 's address details associated with the Opportunity .
      struct Address
        include JSON::Serializable

        # Specifies the end Customer 's city associated with the Opportunity .
        @[JSON::Field(key: "City")]
        getter city : String?

        # Specifies the end Customer 's country associated with the Opportunity .
        @[JSON::Field(key: "CountryCode")]
        getter country_code : String?

        # Specifies the end Customer 's postal code associated with the Opportunity .
        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String?

        # Specifies the end Customer 's state or region associated with the Opportunity . Valid values:
        # Alabama | Alaska | American Samoa | Arizona | Arkansas | California | Colorado | Connecticut |
        # Delaware | Dist. of Columbia | Federated States of Micronesia | Florida | Georgia | Guam | Hawaii |
        # Idaho | Illinois | Indiana | Iowa | Kansas | Kentucky | Louisiana | Maine | Marshall Islands |
        # Maryland | Massachusetts | Michigan | Minnesota | Mississippi | Missouri | Montana | Nebraska |
        # Nevada | New Hampshire | New Jersey | New Mexico | New York | North Carolina | North Dakota |
        # Northern Mariana Islands | Ohio | Oklahoma | Oregon | Palau | Pennsylvania | Puerto Rico | Rhode
        # Island | South Carolina | South Dakota | Tennessee | Texas | Utah | Vermont | Virginia | Virgin
        # Islands | Washington | West Virginia | Wisconsin | Wyoming | APO/AE | AFO/FPO | FPO, AP
        @[JSON::Field(key: "StateOrRegion")]
        getter state_or_region : String?

        # Specifies the end Customer 's street address associated with the Opportunity .
        @[JSON::Field(key: "StreetAddress")]
        getter street_address : String?

        def initialize(
          @city : String? = nil,
          @country_code : String? = nil,
          @postal_code : String? = nil,
          @state_or_region : String? = nil,
          @street_address : String? = nil
        )
        end
      end

      # An object that contains an Address object's subset of fields.
      struct AddressSummary
        include JSON::Serializable

        # Specifies the end Customer 's city associated with the Opportunity .
        @[JSON::Field(key: "City")]
        getter city : String?

        # Specifies the end Customer 's country associated with the Opportunity .
        @[JSON::Field(key: "CountryCode")]
        getter country_code : String?

        # Specifies the end Customer 's postal code associated with the Opportunity .
        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String?

        # Specifies the end Customer 's state or region associated with the Opportunity . Valid values:
        # Alabama | Alaska | American Samoa | Arizona | Arkansas | California | Colorado | Connecticut |
        # Delaware | Dist. of Columbia | Federated States of Micronesia | Florida | Georgia | Guam | Hawaii |
        # Idaho | Illinois | Indiana | Iowa | Kansas | Kentucky | Louisiana | Maine | Marshall Islands |
        # Maryland | Massachusetts | Michigan | Minnesota | Mississippi | Missouri | Montana | Nebraska |
        # Nevada | New Hampshire | New Jersey | New Mexico | New York | North Carolina | North Dakota |
        # Northern Mariana Islands | Ohio | Oklahoma | Oregon | Palau | Pennsylvania | Puerto Rico | Rhode
        # Island | South Carolina | South Dakota | Tennessee | Texas | Utah | Vermont | Virginia | Virgin
        # Islands | Washington | West Virginia | Wisconsin | Wyoming | APO/AE | AFO/FPO | FPO, AP
        @[JSON::Field(key: "StateOrRegion")]
        getter state_or_region : String?

        def initialize(
          @city : String? = nil,
          @country_code : String? = nil,
          @postal_code : String? = nil,
          @state_or_region : String? = nil
        )
        end
      end

      struct AssignOpportunityRequest
        include JSON::Serializable

        # Specifies the user or team member responsible for managing the assigned opportunity. This field
        # identifies the Assignee based on the partner's internal team structure. Ensure that the email
        # address is associated with a registered user in your Partner Central account.
        @[JSON::Field(key: "Assignee")]
        getter assignee : Types::AssigneeContact

        # Specifies the catalog associated with the request. This field takes a string value from a predefined
        # list: AWS or Sandbox . The catalog determines which environment the opportunity is assigned in. Use
        # AWS to assign real opportunities in the Amazon Web Services catalog, and Sandbox for testing in
        # secure, isolated environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Requires the Opportunity 's unique identifier when you want to assign it to another user. Provide
        # the correct identifier so the intended opportunity is reassigned.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @assignee : Types::AssigneeContact,
          @catalog : String,
          @identifier : String
        )
        end
      end

      # Represents the contact details of the individual assigned to manage the opportunity within the
      # partner organization. This helps to ensure that there is a point of contact for the opportunity's
      # progress.
      struct AssigneeContact
        include JSON::Serializable

        # Specifies the business title of the assignee managing the opportunity. This helps clarify the
        # individual's role and responsibilities within the organization. Use the value PartnerAccountManager
        # to update details of the opportunity owner.
        @[JSON::Field(key: "BusinessTitle")]
        getter business_title : String

        # Provides the email address of the assignee. This email is used for communications and notifications
        # related to the opportunity.
        @[JSON::Field(key: "Email")]
        getter email : String

        # Specifies the first name of the assignee managing the opportunity. The system automatically
        # retrieves this value from the user profile by referencing the associated email address.
        @[JSON::Field(key: "FirstName")]
        getter first_name : String

        # Specifies the last name of the assignee managing the opportunity. The system automatically retrieves
        # this value from the user profile by referencing the associated email address.
        @[JSON::Field(key: "LastName")]
        getter last_name : String

        # Specifies the contact phone number of the assignee responsible for the opportunity or engagement.
        # This field enables direct communication for time-sensitive matters and facilitates coordination
        # between AWS and partner teams.
        @[JSON::Field(key: "Phone")]
        getter phone : String?

        def initialize(
          @business_title : String,
          @email : String,
          @first_name : String,
          @last_name : String,
          @phone : String? = nil
        )
        end
      end

      struct AssociateOpportunityRequest
        include JSON::Serializable

        # Specifies the catalog associated with the request. This field takes a string value from a predefined
        # list: AWS or Sandbox . The catalog determines which environment the opportunity association is made
        # in. Use AWS to associate opportunities in the Amazon Web Services catalog, and Sandbox for testing
        # in secure, isolated environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Requires the Opportunity 's unique identifier when you want to associate it with a related entity.
        # Provide the correct identifier so the intended opportunity is updated with the association.
        @[JSON::Field(key: "OpportunityIdentifier")]
        getter opportunity_identifier : String

        # Requires the related entity's unique identifier when you want to associate it with the Opportunity .
        # For Amazon Web Services Marketplace entities, provide the Amazon Resource Name (ARN). Use the Amazon
        # Web Services Marketplace API to obtain the ARN.
        @[JSON::Field(key: "RelatedEntityIdentifier")]
        getter related_entity_identifier : String

        # Specifies the entity type that you're associating with the Opportunity . This helps to categorize
        # and properly process the association.
        @[JSON::Field(key: "RelatedEntityType")]
        getter related_entity_type : String

        def initialize(
          @catalog : String,
          @opportunity_identifier : String,
          @related_entity_identifier : String,
          @related_entity_type : String
        )
        end
      end

      # Represents the customer associated with the AWS opportunity. This field captures key details about
      # the customer that are necessary for managing the opportunity.
      struct AwsOpportunityCustomer
        include JSON::Serializable

        # Provides a list of customer contacts involved in the opportunity. These contacts may include
        # decision makers, influencers, and other stakeholders within the customer's organization.
        @[JSON::Field(key: "Contacts")]
        getter contacts : Array(Types::Contact)?

        def initialize(
          @contacts : Array(Types::Contact)? = nil
        )
        end
      end

      # Contains insights provided by AWS for the opportunity, offering recommendations and analysis that
      # can help the partner optimize their engagement and strategy.
      struct AwsOpportunityInsights
        include JSON::Serializable

        @[JSON::Field(key: "AwsProductsSpendInsightsBySource")]
        getter aws_products_spend_insights_by_source : Types::AwsProductsSpendInsightsBySource?

        # Represents a score assigned by AWS to indicate the level of engagement and potential success for the
        # opportunity. This score helps partners prioritize their efforts.
        @[JSON::Field(key: "EngagementScore")]
        getter engagement_score : String?

        # Provides recommendations from AWS on the next best actions to take in order to move the opportunity
        # forward and increase the likelihood of success.
        @[JSON::Field(key: "NextBestActions")]
        getter next_best_actions : String?

        def initialize(
          @aws_products_spend_insights_by_source : Types::AwsProductsSpendInsightsBySource? = nil,
          @engagement_score : String? = nil,
          @next_best_actions : String? = nil
        )
        end
      end

      # Tracks the lifecycle of the AWS opportunity, including stages such as qualification, validation, and
      # closure. This field helps partners understand the current status and progression of the opportunity.
      struct AwsOpportunityLifeCycle
        include JSON::Serializable

        # Indicates the reason why an opportunity was marked as Closed Lost . This helps in understanding the
        # context behind the lost opportunity and aids in refining future strategies.
        @[JSON::Field(key: "ClosedLostReason")]
        getter closed_lost_reason : String?

        # Specifies the immediate next steps required to progress the opportunity. These steps are based on
        # AWS guidance and the current stage of the opportunity.
        @[JSON::Field(key: "NextSteps")]
        getter next_steps : String?

        # Provides a historical log of previous next steps that were taken to move the opportunity forward.
        # This helps in tracking the decision-making process and identifying any delays or obstacles
        # encountered.
        @[JSON::Field(key: "NextStepsHistory")]
        getter next_steps_history : Array(Types::ProfileNextStepsHistory)?

        # Represents the current stage of the opportunity in its lifecycle, such as Qualification , Validation
        # , or Closed Won . This helps in understanding the opportunity's progress.
        @[JSON::Field(key: "Stage")]
        getter stage : String?

        # Indicates the expected date by which the opportunity is projected to close. This field helps in
        # planning resources and timelines for both the partner and AWS.
        @[JSON::Field(key: "TargetCloseDate")]
        getter target_close_date : String?

        def initialize(
          @closed_lost_reason : String? = nil,
          @next_steps : String? = nil,
          @next_steps_history : Array(Types::ProfileNextStepsHistory)? = nil,
          @stage : String? = nil,
          @target_close_date : String? = nil
        )
        end
      end

      # Captures details about the project associated with the opportunity, including objectives, scope, and
      # customer requirements.
      struct AwsOpportunityProject
        include JSON::Serializable

        # AWS partition where the opportunity will be deployed. Possible values: 'aws-eusc' for AWS European
        # Sovereign Cloud, null for all other partitions
        @[JSON::Field(key: "AwsPartition")]
        getter aws_partition : String?

        # Indicates the expected spending by the customer over the course of the project. This value helps
        # partners and AWS estimate the financial impact of the opportunity. Use the AWS Pricing Calculator to
        # create an estimate of the customer’s total spend. If only annual recurring revenue (ARR) is
        # available, distribute it across 12 months to provide an average monthly value.
        @[JSON::Field(key: "ExpectedCustomerSpend")]
        getter expected_customer_spend : Array(Types::ExpectedCustomerSpend)?

        def initialize(
          @aws_partition : String? = nil,
          @expected_customer_spend : Array(Types::ExpectedCustomerSpend)? = nil
        )
        end
      end

      # Represents other entities related to the AWS opportunity, such as AWS products, partner solutions,
      # and marketplace offers. These associations help build a complete picture of the solution being sold.
      struct AwsOpportunityRelatedEntities
        include JSON::Serializable

        # Specifies the AWS products associated with the opportunity. This field helps track the specific
        # products that are part of the proposed solution.
        @[JSON::Field(key: "AwsProducts")]
        getter aws_products : Array(String)?

        # Specifies the partner solutions related to the opportunity. These solutions represent the partner's
        # offerings that are being positioned as part of the overall AWS opportunity.
        @[JSON::Field(key: "Solutions")]
        getter solutions : Array(String)?

        def initialize(
          @aws_products : Array(String)? = nil,
          @solutions : Array(String)? = nil
        )
        end
      end

      # AWS services with program eligibility indicators (MAP, modernization pathways), cost estimates, and
      # optimization recommendations.
      struct AwsProductDetails
        include JSON::Serializable

        # List of program and pathway categories this product is eligible for
        @[JSON::Field(key: "Categories")]
        getter categories : Array(String)

        # List of specific optimization recommendations for this product
        @[JSON::Field(key: "Optimizations")]
        getter optimizations : Array(Types::AwsProductOptimization)

        # AWS Partner Central product identifier used for opportunity association
        @[JSON::Field(key: "ProductCode")]
        getter product_code : String

        # Baseline service cost before optimizations (may be null for AWS-sourced predictions)
        @[JSON::Field(key: "Amount")]
        getter amount : String?

        # Service cost after applying optimizations (may be null for AWS-sourced predictions)
        @[JSON::Field(key: "OptimizedAmount")]
        getter optimized_amount : String?

        # Service-specific cost reduction through optimizations (may be null for AWS-sourced predictions)
        @[JSON::Field(key: "PotentialSavingsAmount")]
        getter potential_savings_amount : String?

        # Pricing Calculator service code (links to original calculator URL)
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @categories : Array(String),
          @optimizations : Array(Types::AwsProductOptimization),
          @product_code : String,
          @amount : String? = nil,
          @optimized_amount : String? = nil,
          @potential_savings_amount : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # Comprehensive spend analysis for a single source (AWS or Partner) including total amounts,
      # optimization savings, program category breakdowns, and detailed product-level insights.
      struct AwsProductInsights
        include JSON::Serializable

        # Product-level details including costs and optimization recommendations
        @[JSON::Field(key: "AwsProducts")]
        getter aws_products : Array(Types::AwsProductDetails)

        # ISO 4217 currency code (e.g., &quot;USD&quot;) ensuring consistent representation across
        # calculations
        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String

        # Time period for spend amounts: &quot;Monthly&quot; or &quot;Annually&quot;
        @[JSON::Field(key: "Frequency")]
        getter frequency : String

        # Spend amounts mapped to AWS programs and modernization pathways
        @[JSON::Field(key: "TotalAmountByCategory")]
        getter total_amount_by_category : Hash(String, String)

        # Total estimated spend for this source before optimizations
        @[JSON::Field(key: "TotalAmount")]
        getter total_amount : String?

        # Total estimated spend after applying recommended optimizations
        @[JSON::Field(key: "TotalOptimizedAmount")]
        getter total_optimized_amount : String?

        # Quantified savings achievable through implementing optimizations
        @[JSON::Field(key: "TotalPotentialSavingsAmount")]
        getter total_potential_savings_amount : String?

        def initialize(
          @aws_products : Array(Types::AwsProductDetails),
          @currency_code : String,
          @frequency : String,
          @total_amount_by_category : Hash(String, String),
          @total_amount : String? = nil,
          @total_optimized_amount : String? = nil,
          @total_potential_savings_amount : String? = nil
        )
        end
      end

      # Details for a specific optimization recommendation
      struct AwsProductOptimization
        include JSON::Serializable

        # Human-readable explanation of the optimization strategy
        @[JSON::Field(key: "Description")]
        getter description : String

        # Quantified cost savings achievable by implementing this optimization
        @[JSON::Field(key: "SavingsAmount")]
        getter savings_amount : String

        def initialize(
          @description : String,
          @savings_amount : String
        )
        end
      end

      # Source-separated spend insights that provide independent analysis for AWS predictions and partner
      # estimates
      struct AwsProductsSpendInsightsBySource
        include JSON::Serializable

        # AI-generated insights including recommended products from AWS
        @[JSON::Field(key: "AWS")]
        getter aws : Types::AwsProductInsights?

        # Partner-sourced insights derived from Pricing Calculator URLs including detailed service costs and
        # optimizations
        @[JSON::Field(key: "Partner")]
        getter partner : Types::AwsProductInsights?

        def initialize(
          @aws : Types::AwsProductInsights? = nil,
          @partner : Types::AwsProductInsights? = nil
        )
        end
      end

      # Indicates the level of AWS involvement in the opportunity. This field helps track AWS participation
      # throughout the engagement, such as providing technical support, deal assistance, and sales support.
      struct AwsSubmission
        include JSON::Serializable

        # Specifies the type of AWS involvement in the opportunity, such as coselling, deal support, or
        # technical consultation. This helps categorize the nature of AWS participation.
        @[JSON::Field(key: "InvolvementType")]
        getter involvement_type : String

        # Determines who can view AWS involvement in the opportunity. Typically, this field is set to Full for
        # most cases, but it may be restricted based on special program requirements or confidentiality needs.
        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @involvement_type : String,
          @visibility : String? = nil
        )
        end
      end

      # Represents an Amazon Web Services team member for the engagement. This structure includes details
      # such as name, email, and business title.
      struct AwsTeamMember
        include JSON::Serializable

        # Specifies the Amazon Web Services team member's business title and indicates their organizational
        # role.
        @[JSON::Field(key: "BusinessTitle")]
        getter business_title : String?

        # Provides the Amazon Web Services team member's email address.
        @[JSON::Field(key: "Email")]
        getter email : String?

        # Provides the Amazon Web Services team member's first name.
        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # Provides the Amazon Web Services team member's last name.
        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        def initialize(
          @business_title : String? = nil,
          @email : String? = nil,
          @first_name : String? = nil,
          @last_name : String? = nil
        )
        end
      end

      # This error occurs when the request can’t be processed due to a conflict with the target resource's
      # current state, which could result from updating or deleting the resource. Suggested action: Fetch
      # the latest state of the resource, verify the state, and retry the request.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that contains a Customer Partner 's contact details.
      struct Contact
        include JSON::Serializable

        # The partner contact's title (job title or role) associated with the Opportunity . BusinessTitle
        # supports either PartnerAccountManager or OpportunityOwner .
        @[JSON::Field(key: "BusinessTitle")]
        getter business_title : String?

        # The contact's email address associated with the Opportunity .
        @[JSON::Field(key: "Email")]
        getter email : String?

        # The contact's first name associated with the Opportunity .
        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # The contact's last name associated with the Opportunity .
        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # The contact's phone number associated with the Opportunity .
        @[JSON::Field(key: "Phone")]
        getter phone : String?

        def initialize(
          @business_title : String? = nil,
          @email : String? = nil,
          @first_name : String? = nil,
          @last_name : String? = nil,
          @phone : String? = nil
        )
        end
      end

      struct CreateEngagementContextRequest
        include JSON::Serializable

        # Specifies the catalog associated with the engagement context request. This field takes a string
        # value from a predefined list: AWS or Sandbox . The catalog determines which environment the
        # engagement context is created in. Use AWS to create contexts in the production environment, and
        # Sandbox for testing in secure, isolated environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique, case-sensitive identifier provided by the client to ensure that the request is handled
        # exactly once. This token helps prevent duplicate context creations and must not exceed sixty-four
        # alphanumeric characters. Use a UUID or other unique string to ensure idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The unique identifier of the Engagement for which the context is being created. This parameter
        # ensures the context is associated with the correct engagement and provides the necessary linkage
        # between the engagement and its contextual information.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : String

        @[JSON::Field(key: "Payload")]
        getter payload : Types::EngagementContextPayload

        # Specifies the type of context being created for the engagement. This field determines the structure
        # and content of the context payload. Valid values include CustomerProject for customer
        # project-related contexts. The type field ensures that the context is properly categorized and
        # processed according to its intended purpose.
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @catalog : String,
          @client_token : String,
          @engagement_identifier : String,
          @payload : Types::EngagementContextPayload,
          @type : String
        )
        end
      end

      struct CreateEngagementContextResponse
        include JSON::Serializable

        # The unique identifier assigned to the newly created engagement context. This ID can be used to
        # reference the specific context within the engagement for future operations.
        @[JSON::Field(key: "ContextId")]
        getter context_id : String?

        # The Amazon Resource Name (ARN) of the engagement to which the context was added. This globally
        # unique identifier can be used for cross-service references and IAM policies.
        @[JSON::Field(key: "EngagementArn")]
        getter engagement_arn : String?

        # The unique identifier of the engagement to which the context was added. This ID confirms the
        # successful association of the context with the specified engagement.
        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String?

        # The timestamp indicating when the engagement was last modified as a result of adding the context, in
        # ISO 8601 format (UTC). Example: "2023-05-01T20:37:46Z".
        @[JSON::Field(key: "EngagementLastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter engagement_last_modified_at : Time?

        def initialize(
          @context_id : String? = nil,
          @engagement_arn : String? = nil,
          @engagement_id : String? = nil,
          @engagement_last_modified_at : Time? = nil
        )
        end
      end

      struct CreateEngagementInvitationRequest
        include JSON::Serializable

        # Specifies the catalog related to the engagement. Accepted values are AWS and Sandbox , which
        # determine the environment in which the engagement is managed.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Specifies a unique, client-generated UUID to ensure that the request is handled exactly once. This
        # token helps prevent duplicate invitation creations.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The unique identifier of the Engagement associated with the invitation. This parameter ensures the
        # invitation is created within the correct Engagement context.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : String

        # The Invitation object all information necessary to initiate an engagement invitation to a partner.
        # It contains a personalized message from the sender, the invitation's receiver, and a payload. The
        # Payload can be the OpportunityInvitation , which includes detailed structures for sender contacts,
        # partner responsibilities, customer information, and project details.
        @[JSON::Field(key: "Invitation")]
        getter invitation : Types::Invitation

        def initialize(
          @catalog : String,
          @client_token : String,
          @engagement_identifier : String,
          @invitation : Types::Invitation
        )
        end
      end

      struct CreateEngagementInvitationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that uniquely identifies the engagement invitation.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Unique identifier assigned to the newly created engagement invitation.
        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @arn : String,
          @id : String
        )
        end
      end

      struct CreateEngagementRequest
        include JSON::Serializable

        # The CreateEngagementRequest$Catalog parameter specifies the catalog related to the engagement.
        # Accepted values are AWS and Sandbox , which determine the environment in which the engagement is
        # managed.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The CreateEngagementRequest$ClientToken parameter specifies a unique, case-sensitive identifier to
        # ensure that the request is handled exactly once. The value must not exceed sixty-four alphanumeric
        # characters.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Provides a description of the Engagement .
        @[JSON::Field(key: "Description")]
        getter description : String

        # Specifies the title of the Engagement .
        @[JSON::Field(key: "Title")]
        getter title : String

        # The Contexts field is a required array of objects, with a maximum of 5 contexts allowed, specifying
        # detailed information about customer projects associated with the Engagement. Each context object
        # contains a Type field indicating the context type, which must be CustomerProject in this version,
        # and a Payload field containing the CustomerProject details. The CustomerProject object is composed
        # of two main components: Customer and Project . The Customer object includes information such as
        # CompanyName , WebsiteUrl , Industry , and CountryCode , providing essential details about the
        # customer. The Project object contains Title , BusinessProblem , and TargetCompletionDate , offering
        # insights into the specific project associated with the customer. This structure allows comprehensive
        # context to be included within the Engagement, facilitating effective collaboration between parties
        # by providing relevant customer and project information.
        @[JSON::Field(key: "Contexts")]
        getter contexts : Array(Types::EngagementContextDetails)?

        def initialize(
          @catalog : String,
          @client_token : String,
          @description : String,
          @title : String,
          @contexts : Array(Types::EngagementContextDetails)? = nil
        )
        end
      end

      struct CreateEngagementResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the engagement.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Unique identifier assigned to the newly created engagement.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The timestamp indicating when the engagement was last modified, in ISO 8601 format (UTC). For newly
        # created engagements, this value matches the creation timestamp. Example: "2023-05-01T20:37:46Z".
        @[JSON::Field(key: "ModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @modified_at : Time? = nil
        )
        end
      end

      struct CreateOpportunityRequest
        include JSON::Serializable

        # Specifies the catalog associated with the request. This field takes a string value from a predefined
        # list: AWS or Sandbox . The catalog determines which environment the opportunity is created in. Use
        # AWS to create opportunities in the Amazon Web Services catalog, and Sandbox for testing in secure,
        # isolated environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Required to be unique, and should be unchanging, it can be randomly generated or a meaningful
        # string. Default: None Best practice: To help ensure uniqueness and avoid conflicts, use a
        # Universally Unique Identifier (UUID) as the ClientToken . You can use standard libraries from most
        # programming languages to generate this. If you use the same client token, the API returns the
        # following error: "Conflicting client token submitted for a new request body."
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Specifies customer details associated with the Opportunity .
        @[JSON::Field(key: "Customer")]
        getter customer : Types::Customer?

        # An object that contains lifecycle details for the Opportunity .
        @[JSON::Field(key: "LifeCycle")]
        getter life_cycle : Types::LifeCycle?

        # This object contains marketing details and is optional for an opportunity.
        @[JSON::Field(key: "Marketing")]
        getter marketing : Types::Marketing?

        # Indicates whether the Opportunity pertains to a national security project. This field must be set to
        # true only when the customer's industry is Government . Additional privacy and security measures
        # apply during the review and management process for opportunities marked as NationalSecurity .
        @[JSON::Field(key: "NationalSecurity")]
        getter national_security : String?

        # Represents the internal team handling the opportunity. Specify collaborating members of this
        # opportunity who are within the partner's organization.
        @[JSON::Field(key: "OpportunityTeam")]
        getter opportunity_team : Array(Types::Contact)?

        # Specifies the opportunity type as a renewal, new, or expansion. Opportunity types: New opportunity:
        # Represents a new business opportunity with a potential customer that's not previously engaged with
        # your solutions or services. Renewal opportunity: Represents an opportunity to renew an existing
        # contract or subscription with a current customer, ensuring continuity of service. Expansion
        # opportunity: Represents an opportunity to expand the scope of an existing contract or subscription,
        # either by adding new services or increasing the volume of existing services for a current customer.
        @[JSON::Field(key: "OpportunityType")]
        getter opportunity_type : String?

        # Specifies the origin of the opportunity, indicating if it was sourced from Amazon Web Services or
        # the partner. For all opportunities created with Catalog: AWS , this field must only be Partner
        # Referral . However, when using Catalog: Sandbox , you can set this field to AWS Referral to simulate
        # Amazon Web Services referral creation. This allows Amazon Web Services-originated flows testing in
        # the sandbox catalog.
        @[JSON::Field(key: "Origin")]
        getter origin : String?

        # Specifies the opportunity's unique identifier in the partner's CRM system. This value is essential
        # to track and reconcile because it's included in the outbound payload to the partner. This field
        # allows partners to link an opportunity to their CRM, which helps to ensure seamless integration and
        # accurate synchronization between the Partner Central API and the partner's internal systems.
        @[JSON::Field(key: "PartnerOpportunityIdentifier")]
        getter partner_opportunity_identifier : String?

        # Identifies the type of support the partner needs from Amazon Web Services. Valid values:
        # Cosell—Architectural Validation: Confirmation from Amazon Web Services that the partner's proposed
        # solution architecture is aligned with Amazon Web Services best practices and poses minimal
        # architectural risks. Cosell—Business Presentation: Request Amazon Web Services seller's
        # participation in a joint customer presentation. Cosell—Competitive Information: Access to Amazon Web
        # Services competitive resources and support for the partner's proposed solution. Cosell—Pricing
        # Assistance: Connect with an Amazon Web Services seller for support situations where a partner may be
        # receiving an upfront discount on a service (for example: EDP deals). Cosell—Technical Consultation:
        # Connect with an Amazon Web Services Solutions Architect to address the partner's questions about the
        # proposed solution. Cosell—Total Cost of Ownership Evaluation: Assistance with quoting different cost
        # savings of proposed solutions on Amazon Web Services versus on-premises or a traditional hosting
        # environment. Cosell—Deal Support: Request Amazon Web Services seller's support to progress the
        # opportunity (for example: joint customer call, strategic positioning). Cosell—Support for Public
        # Tender/RFx: Opportunity related to the public sector where the partner needs Amazon Web Services RFx
        # support.
        @[JSON::Field(key: "PrimaryNeedsFromAws")]
        getter primary_needs_from_aws : Array(String)?

        # An object that contains project details for the Opportunity .
        @[JSON::Field(key: "Project")]
        getter project : Types::Project?

        # Specifies details of a customer's procurement terms. This is required only for partners in eligible
        # programs.
        @[JSON::Field(key: "SoftwareRevenue")]
        getter software_revenue : Types::SoftwareRevenue?

        # A map of the key-value pairs of the tag or tags to assign.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @catalog : String,
          @client_token : String,
          @customer : Types::Customer? = nil,
          @life_cycle : Types::LifeCycle? = nil,
          @marketing : Types::Marketing? = nil,
          @national_security : String? = nil,
          @opportunity_team : Array(Types::Contact)? = nil,
          @opportunity_type : String? = nil,
          @origin : String? = nil,
          @partner_opportunity_identifier : String? = nil,
          @primary_needs_from_aws : Array(String)? = nil,
          @project : Types::Project? = nil,
          @software_revenue : Types::SoftwareRevenue? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateOpportunityResponse
        include JSON::Serializable

        # Read-only, system-generated Opportunity unique identifier. Amazon Web Services creates this
        # identifier, and it's used for all subsequent opportunity actions, such as updates, associations, and
        # submissions. It helps to ensure that each opportunity is accurately tracked and managed.
        @[JSON::Field(key: "Id")]
        getter id : String

        # DateTime when the opportunity was last modified. When the Opportunity is created, its value is
        # CreatedDate .
        @[JSON::Field(key: "LastModifiedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # Specifies the opportunity's unique identifier in the partner's CRM system. This value is essential
        # to track and reconcile because it's included in the outbound payload sent back to the partner.
        @[JSON::Field(key: "PartnerOpportunityIdentifier")]
        getter partner_opportunity_identifier : String?

        def initialize(
          @id : String,
          @last_modified_date : Time? = nil,
          @partner_opportunity_identifier : String? = nil
        )
        end
      end

      struct CreateResourceSnapshotJobRequest
        include JSON::Serializable

        # Specifies the catalog in which to create the snapshot job. Valid values are AWS and Sandbox .
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A client-generated UUID used for idempotency check. The token helps prevent duplicate job creations.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Specifies the identifier of the engagement associated with the resource to be snapshotted.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : String

        # Specifies the identifier of the specific resource to be snapshotted. The format depends on the
        # ResourceType .
        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # Specifies the name of the template that defines the schema for the snapshot.
        @[JSON::Field(key: "ResourceSnapshotTemplateIdentifier")]
        getter resource_snapshot_template_identifier : String

        # The type of resource for which the snapshot job is being created. Must be one of the supported
        # resource types i.e. Opportunity
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # A map of the key-value pairs of the tag or tags to assign.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @catalog : String,
          @client_token : String,
          @engagement_identifier : String,
          @resource_identifier : String,
          @resource_snapshot_template_identifier : String,
          @resource_type : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateResourceSnapshotJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created snapshot job.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier for the created snapshot job.
        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end

      struct CreateResourceSnapshotRequest
        include JSON::Serializable

        # Specifies the catalog where the snapshot is created. Valid values are AWS and Sandbox .
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Specifies a unique, client-generated UUID to ensure that the request is handled exactly once. This
        # token helps prevent duplicate snapshot creations.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The unique identifier of the engagement associated with this snapshot. This field links the snapshot
        # to a specific engagement context.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : String

        # The unique identifier of the specific resource to be snapshotted. The format and constraints of this
        # identifier depend on the ResourceType specified. For example: For Opportunity type, it will be an
        # opportunity ID.
        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # The name of the template that defines the schema for the snapshot. This template determines which
        # subset of the resource data will be included in the snapshot. Must correspond to an existing and
        # valid template for the specified ResourceType .
        @[JSON::Field(key: "ResourceSnapshotTemplateIdentifier")]
        getter resource_snapshot_template_identifier : String

        # Specifies the type of resource for which the snapshot is being created. This field determines the
        # structure and content of the snapshot. Must be one of the supported resource types, such as:
        # Opportunity .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @catalog : String,
          @client_token : String,
          @engagement_identifier : String,
          @resource_identifier : String,
          @resource_snapshot_template_identifier : String,
          @resource_type : String
        )
        end
      end

      struct CreateResourceSnapshotResponse
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) that uniquely identifies the snapshot created.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Specifies the revision number of the created snapshot. This field provides important information
        # about the snapshot's place in the sequence of snapshots for the given resource.
        @[JSON::Field(key: "Revision")]
        getter revision : Int32?

        def initialize(
          @arn : String? = nil,
          @revision : Int32? = nil
        )
        end
      end

      # An object that contains the customer's Account and Contact .
      struct Customer
        include JSON::Serializable

        # An object that contains the customer's account details.
        @[JSON::Field(key: "Account")]
        getter account : Types::Account?

        # Represents the contact details for individuals associated with the customer of the Opportunity .
        # This field captures relevant contacts, including decision-makers, influencers, and technical
        # stakeholders within the customer organization. These contacts are key to progressing the
        # opportunity.
        @[JSON::Field(key: "Contacts")]
        getter contacts : Array(Types::Contact)?

        def initialize(
          @account : Types::Account? = nil,
          @contacts : Array(Types::Contact)? = nil
        )
        end
      end

      # The CustomerProjects structure in Engagements offers a flexible framework for managing
      # customer-project relationships. It supports multiple customers per Engagement and multiple projects
      # per customer, while also allowing for customers without projects and projects without specific
      # customers. All Engagement members have full visibility of customers and their associated projects,
      # enabling the capture of relevant context even when project details are not fully defined. This
      # structure also facilitates targeted invitations, allowing partners to focus on specific customers
      # and their business problems when sending Engagement invitations.
      struct CustomerProjectsContext
        include JSON::Serializable

        @[JSON::Field(key: "Customer")]
        getter customer : Types::EngagementCustomer?

        # Information about the customer project associated with the Engagement.
        @[JSON::Field(key: "Project")]
        getter project : Types::EngagementCustomerProjectDetails?

        def initialize(
          @customer : Types::EngagementCustomer? = nil,
          @project : Types::EngagementCustomerProjectDetails? = nil
        )
        end
      end

      # An object that contains a Customer object's subset of fields.
      struct CustomerSummary
        include JSON::Serializable

        # An object that contains a customer's account details.
        @[JSON::Field(key: "Account")]
        getter account : Types::AccountSummary?

        def initialize(
          @account : Types::AccountSummary? = nil
        )
        end
      end

      struct DeleteResourceSnapshotJobRequest
        include JSON::Serializable

        # Specifies the catalog from which to delete the snapshot job. Valid values are AWS and Sandbox .
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the resource snapshot job to be deleted.
        @[JSON::Field(key: "ResourceSnapshotJobIdentifier")]
        getter resource_snapshot_job_identifier : String

        def initialize(
          @catalog : String,
          @resource_snapshot_job_identifier : String
        )
        end
      end

      struct DisassociateOpportunityRequest
        include JSON::Serializable

        # Specifies the catalog associated with the request. This field takes a string value from a predefined
        # list: AWS or Sandbox . The catalog determines which environment the opportunity disassociation is
        # made in. Use AWS to disassociate opportunities in the Amazon Web Services catalog, and Sandbox for
        # testing in secure, isolated environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The opportunity's unique identifier for when you want to disassociate it from related entities. This
        # identifier helps to ensure that the correct opportunity is updated. Validation: Ensure that the
        # provided identifier corresponds to an existing opportunity in the Amazon Web Services system because
        # incorrect identifiers result in an error and no changes are made.
        @[JSON::Field(key: "OpportunityIdentifier")]
        getter opportunity_identifier : String

        # The related entity's identifier that you want to disassociate from the opportunity. Depending on the
        # type of entity, this could be a simple identifier or an Amazon Resource Name (ARN) for entities
        # managed through Amazon Web Services Marketplace. For Amazon Web Services Marketplace entities, use
        # the Amazon Web Services Marketplace API to obtain the necessary ARNs. For guidance on retrieving
        # these ARNs, see Amazon Web Services MarketplaceUsing the Amazon Web Services Marketplace Catalog API
        # . Validation: Ensure the identifier or ARN is valid and corresponds to an existing entity. An
        # incorrect or invalid identifier results in an error.
        @[JSON::Field(key: "RelatedEntityIdentifier")]
        getter related_entity_identifier : String

        # The type of the entity that you're disassociating from the opportunity. When you specify the entity
        # type, it helps the system correctly process the disassociation request to ensure that the right
        # connections are removed. Examples of entity types include Partner Solution, Amazon Web Services
        # product, and Amazon Web Services Marketplaceoffer. Ensure that the value matches one of the expected
        # entity types. Validation: Provide a valid entity type to help ensure successful disassociation. An
        # invalid or incorrect entity type results in an error.
        @[JSON::Field(key: "RelatedEntityType")]
        getter related_entity_type : String

        def initialize(
          @catalog : String,
          @opportunity_identifier : String,
          @related_entity_identifier : String,
          @related_entity_type : String
        )
        end
      end

      # Provides detailed context information for an Engagement. This structure allows for specifying the
      # type of context and its associated payload.
      struct EngagementContextDetails
        include JSON::Serializable

        # Specifies the type of Engagement context. Valid values are "CustomerProject" or "Document",
        # indicating whether the context relates to a customer project or a document respectively.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The unique identifier of the engagement context. This ID is used to reference and manage the
        # specific context within the engagement.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # Contains the specific details of the Engagement context. The structure of this payload varies
        # depending on the Type field.
        @[JSON::Field(key: "Payload")]
        getter payload : Types::EngagementContextPayload?

        def initialize(
          @type : String,
          @id : String? = nil,
          @payload : Types::EngagementContextPayload? = nil
        )
        end
      end

      # Represents the payload of an Engagement context. The structure of this payload varies based on the
      # context type specified in the EngagementContextDetails.
      struct EngagementContextPayload
        include JSON::Serializable

        # Contains detailed information about a customer project when the context type is "CustomerProject".
        # This field is present only when the Type in EngagementContextDetails is set to "CustomerProject".
        @[JSON::Field(key: "CustomerProject")]
        getter customer_project : Types::CustomerProjectsContext?

        # Contains detailed information about a lead when the context type is "Lead". This field is present
        # only when the Type in EngagementContextDetails is set to "Lead".
        @[JSON::Field(key: "Lead")]
        getter lead : Types::LeadContext?

        def initialize(
          @customer_project : Types::CustomerProjectsContext? = nil,
          @lead : Types::LeadContext? = nil
        )
        end
      end

      # Contains details about the customer associated with the Engagement Invitation, including company
      # information and industry.
      struct EngagementCustomer
        include JSON::Serializable

        # Represents the name of the customer’s company associated with the Engagement Invitation. This field
        # is used to identify the customer.
        @[JSON::Field(key: "CompanyName")]
        getter company_name : String

        # Indicates the country in which the customer’s company operates. This field is useful for
        # understanding regional requirements or compliance needs.
        @[JSON::Field(key: "CountryCode")]
        getter country_code : String

        # Specifies the industry to which the customer’s company belongs. This field helps categorize the
        # opportunity based on the customer’s business sector.
        @[JSON::Field(key: "Industry")]
        getter industry : String

        # Provides the website URL of the customer’s company. This field helps partners verify the legitimacy
        # and size of the customer organization.
        @[JSON::Field(key: "WebsiteUrl")]
        getter website_url : String

        def initialize(
          @company_name : String,
          @country_code : String,
          @industry : String,
          @website_url : String
        )
        end
      end

      # Provides comprehensive details about a customer project associated with an Engagement. This may
      # include information such as project goals, timelines, and specific customer requirements.
      struct EngagementCustomerProjectDetails
        include JSON::Serializable

        # A description of the business problem the project aims to solve.
        @[JSON::Field(key: "BusinessProblem")]
        getter business_problem : String

        # The target completion date for the customer's project.
        @[JSON::Field(key: "TargetCompletionDate")]
        getter target_completion_date : String

        # The title of the project.
        @[JSON::Field(key: "Title")]
        getter title : String

        def initialize(
          @business_problem : String,
          @target_completion_date : String,
          @title : String
        )
        end
      end

      # Provides a summarized view of the Engagement Invitation, including details like the identifier,
      # status, and sender. This summary helps partners track and manage AWS originated opportunities.
      struct EngagementInvitationSummary
        include JSON::Serializable

        # Specifies the catalog in which the Engagement Invitation resides. This can be either the AWS or
        # Sandbox catalog, indicating whether the opportunity is live or being tested.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Represents the unique identifier of the Engagement Invitation. This identifier is used to track the
        # invitation and to manage responses like acceptance or rejection.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The Amazon Resource Name (ARN) of the Engagement Invitation. The ARN is a unique identifier that
        # allows partners to reference the invitation in their system and manage its lifecycle.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The identifier of the Engagement associated with this invitation. This links the invitation to its
        # parent Engagement.
        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String?

        # Provides a short title or description of the Engagement Invitation. This title helps partners
        # quickly identify and differentiate between multiple engagement opportunities.
        @[JSON::Field(key: "EngagementTitle")]
        getter engagement_title : String?

        # Indicates the date and time when the Engagement Invitation will expire. After this date, the
        # invitation can no longer be accepted, and the opportunity will be unavailable to the partner.
        @[JSON::Field(key: "ExpirationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_date : Time?

        # Indicates the date when the Engagement Invitation was sent to the partner. This provides context for
        # when the opportunity was shared and helps in tracking the timeline for engagement.
        @[JSON::Field(key: "InvitationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter invitation_date : Time?

        # Identifies the role of the caller in the engagement invitation.
        @[JSON::Field(key: "ParticipantType")]
        getter participant_type : String?

        # Describes the type of payload associated with the Engagement Invitation, such as Opportunity or
        # MarketplaceOffer . This helps partners understand the nature of the engagement request from AWS.
        @[JSON::Field(key: "PayloadType")]
        getter payload_type : String?

        # Specifies the partner company or individual that received the Engagement Invitation. This field is
        # important for tracking who the invitation was sent to within the partner organization.
        @[JSON::Field(key: "Receiver")]
        getter receiver : Types::Receiver?

        # Specifies the AWS account ID of the sender who initiated the Engagement Invitation. This allows the
        # partner to identify the AWS entity or representative responsible for sharing the opportunity.
        @[JSON::Field(key: "SenderAwsAccountId")]
        getter sender_aws_account_id : String?

        # Indicates the name of the company or AWS division that sent the Engagement Invitation. This
        # information is useful for partners to know which part of AWS is requesting engagement.
        @[JSON::Field(key: "SenderCompanyName")]
        getter sender_company_name : String?

        # Represents the current status of the Engagement Invitation, such as Pending , Accepted , or Rejected
        # . The status helps track the progress and response to the invitation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @catalog : String,
          @id : String,
          @arn : String? = nil,
          @engagement_id : String? = nil,
          @engagement_title : String? = nil,
          @expiration_date : Time? = nil,
          @invitation_date : Time? = nil,
          @participant_type : String? = nil,
          @payload_type : String? = nil,
          @receiver : Types::Receiver? = nil,
          @sender_aws_account_id : String? = nil,
          @sender_company_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Engagement members are the participants in an Engagement, which is likely a collaborative project or
      # business opportunity within the AWS partner network. Members can be different partner organizations
      # or AWS accounts that are working together on a specific engagement. Each member is represented by
      # their AWS Account ID, Company Name, and associated details. Members have a status within the
      # Engagement (PENDING, ACCEPTED, REJECTED, or WITHDRAWN), indicating their current state of
      # participation. Only existing members of an Engagement can view the list of other members. This
      # implies a level of privacy and access control within the Engagement structure.
      struct EngagementMember
        include JSON::Serializable

        # This is the unique identifier for the AWS account associated with the member organization. It's used
        # for AWS-related operations and identity verification.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The official name of the member's company or organization.
        @[JSON::Field(key: "CompanyName")]
        getter company_name : String?

        # The URL of the member company's website. This offers a way to find more information about the member
        # organization and serves as an additional identifier.
        @[JSON::Field(key: "WebsiteUrl")]
        getter website_url : String?

        def initialize(
          @account_id : String? = nil,
          @company_name : String? = nil,
          @website_url : String? = nil
        )
        end
      end

      # The EngagementMemberSummary provides a snapshot of essential information about participants in an
      # AWS Partner Central Engagement. This compact data structure encapsulates key details of each member,
      # facilitating efficient collaboration and management within the Engagement.
      struct EngagementMemberSummary
        include JSON::Serializable

        # The official name of the member's company or organization.
        @[JSON::Field(key: "CompanyName")]
        getter company_name : String?

        # The URL of the member company's website. This offers a way to find more information about the member
        # organization and serves as an additional identifier.
        @[JSON::Field(key: "WebsiteUrl")]
        getter website_url : String?

        def initialize(
          @company_name : String? = nil,
          @website_url : String? = nil
        )
        end
      end

      # This provide a streamlined view of the relationships between engagements and resources. These
      # summaries offer a crucial link between collaborative engagements and the specific resources
      # involved, such as opportunities.These summaries are particularly valuable for partners navigating
      # complex engagements with multiple resources. They enable quick insights into resource distribution
      # across engagements, support efficient resource management, and help maintain a clear overview of
      # collaborative activities.
      struct EngagementResourceAssociationSummary
        include JSON::Serializable

        # Indicates the environment in which the resource and engagement exist.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The AWS account ID of the entity that owns the resource. Identifies the account responsible for or
        # having primary control over the resource.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # A unique identifier for the engagement associated with the resource.
        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String?

        # A unique identifier for the specific resource. Varies depending on the resource type.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # Categorizes the type of resource associated with the engagement.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @catalog : String,
          @created_by : String? = nil,
          @engagement_id : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Specifies the sorting parameters for listing Engagements.
      struct EngagementSort
        include JSON::Serializable

        # The field by which to sort the results.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String

        # The order in which to sort the results.
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String

        def initialize(
          @sort_by : String,
          @sort_order : String
        )
        end
      end

      # An object that contains an Engagement 's subset of fields.
      struct EngagementSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created Engagement.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # An array of context types associated with the engagement, such as "CustomerProject" or "Lead". This
        # provides a quick overview of the types of contexts included in the engagement.
        @[JSON::Field(key: "ContextTypes")]
        getter context_types : Array(String)?

        # The date and time when the Engagement was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The AWS Account ID of the Engagement creator.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The unique identifier for the Engagement.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The number of members in the Engagement.
        @[JSON::Field(key: "MemberCount")]
        getter member_count : Int32?

        # The timestamp indicating when the engagement was last modified, in ISO 8601 format (UTC). Example:
        # "2023-05-01T20:37:46Z".
        @[JSON::Field(key: "ModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # The AWS account ID of the user who last modified the engagement. This field helps track who made the
        # most recent changes to the engagement.
        @[JSON::Field(key: "ModifiedBy")]
        getter modified_by : String?

        # The title of the Engagement.
        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @arn : String? = nil,
          @context_types : Array(String)? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @id : String? = nil,
          @member_count : Int32? = nil,
          @modified_at : Time? = nil,
          @modified_by : String? = nil,
          @title : String? = nil
        )
        end
      end

      # Provides an estimate of the revenue that the partner is expected to generate from the opportunity.
      # This information helps partners assess the financial value of the project.
      struct ExpectedCustomerSpend
        include JSON::Serializable

        # Indicates the currency in which the revenue estimate is provided. This helps in understanding the
        # financial impact across different markets.
        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String

        # Indicates how frequently the customer is expected to spend the projected amount. Only the value
        # Monthly is allowed for the Frequency field, representing recurring monthly spend.
        @[JSON::Field(key: "Frequency")]
        getter frequency : String

        # Specifies the name of the partner company that is expected to generate revenue from the opportunity.
        # This field helps track the partner’s involvement in the opportunity. This field only accepts the
        # value AWS . If any other value is provided, the system will automatically set it to AWS .
        @[JSON::Field(key: "TargetCompany")]
        getter target_company : String

        # Represents the estimated monthly revenue that the partner expects to earn from the opportunity. This
        # helps in forecasting financial returns.
        @[JSON::Field(key: "Amount")]
        getter amount : String?

        # A URL providing additional information or context about the spend estimation.
        @[JSON::Field(key: "EstimationUrl")]
        getter estimation_url : String?

        def initialize(
          @currency_code : String,
          @frequency : String,
          @target_company : String,
          @amount : String? = nil,
          @estimation_url : String? = nil
        )
        end
      end

      struct GetAwsOpportunitySummaryRequest
        include JSON::Serializable

        # Specifies the catalog in which the AWS Opportunity is located. Accepted values include AWS for
        # production opportunities or Sandbox for testing purposes. The catalog determines which environment
        # the opportunity data is pulled from.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier for the related partner opportunity. Use this field to correlate an AWS
        # opportunity with its corresponding partner opportunity.
        @[JSON::Field(key: "RelatedOpportunityIdentifier")]
        getter related_opportunity_identifier : String

        def initialize(
          @catalog : String,
          @related_opportunity_identifier : String
        )
        end
      end

      struct GetAwsOpportunitySummaryResponse
        include JSON::Serializable

        # Specifies the catalog in which the AWS Opportunity exists. This is the environment (e.g., AWS or
        # Sandbox ) where the opportunity is being managed.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Provides details about the customer associated with the AWS Opportunity, including account
        # information, industry, and other customer data. These details help partners understand the business
        # context of the opportunity.
        @[JSON::Field(key: "Customer")]
        getter customer : Types::AwsOpportunityCustomer?

        # Provides insights into the AWS Opportunity, including engagement score and recommended actions that
        # AWS suggests for the partner.
        @[JSON::Field(key: "Insights")]
        getter insights : Types::AwsOpportunityInsights?

        # Specifies the type of involvement AWS has in the opportunity, such as direct cosell or advisory
        # support. This field helps partners understand the role AWS plays in advancing the opportunity.
        @[JSON::Field(key: "InvolvementType")]
        getter involvement_type : String?

        # Provides a reason for any changes in the involvement type of AWS in the opportunity. This field is
        # used to track why the level of AWS engagement has changed from For Visibility Only to Co-sell
        # offering transparency into the partnership dynamics.
        @[JSON::Field(key: "InvolvementTypeChangeReason")]
        getter involvement_type_change_reason : String?

        # Contains lifecycle information for the AWS Opportunity, including review status, stage, and target
        # close date. This field is crucial for partners to monitor the progression of the opportunity.
        @[JSON::Field(key: "LifeCycle")]
        getter life_cycle : Types::AwsOpportunityLifeCycle?

        # Details the AWS opportunity team, including members involved. This information helps partners know
        # who from AWS is engaged and what their role is.
        @[JSON::Field(key: "OpportunityTeam")]
        getter opportunity_team : Array(Types::AwsTeamMember)?

        # Specifies whether the AWS Opportunity originated from AWS or the partner. This helps distinguish
        # between opportunities that were sourced by AWS and those referred by the partner.
        @[JSON::Field(key: "Origin")]
        getter origin : String?

        # Provides details about the project associated with the AWS Opportunity, including the customer’s
        # business problem, expected outcomes, and project scope. This information is crucial for
        # understanding the broader context of the opportunity.
        @[JSON::Field(key: "Project")]
        getter project : Types::AwsOpportunityProject?

        # Lists related entity identifiers, such as AWS products or partner solutions, associated with the AWS
        # Opportunity. These identifiers provide additional context and help partners understand which AWS
        # services are involved.
        @[JSON::Field(key: "RelatedEntityIds")]
        getter related_entity_ids : Types::AwsOpportunityRelatedEntities?

        # Provides the unique identifier of the related partner opportunity, allowing partners to link the AWS
        # Opportunity to their corresponding opportunity in their CRM system.
        @[JSON::Field(key: "RelatedOpportunityId")]
        getter related_opportunity_id : String?

        # Defines the visibility level for the AWS Opportunity. Use Full visibility for most cases, while
        # Limited visibility is reserved for special programs or sensitive opportunities.
        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @catalog : String,
          @customer : Types::AwsOpportunityCustomer? = nil,
          @insights : Types::AwsOpportunityInsights? = nil,
          @involvement_type : String? = nil,
          @involvement_type_change_reason : String? = nil,
          @life_cycle : Types::AwsOpportunityLifeCycle? = nil,
          @opportunity_team : Array(Types::AwsTeamMember)? = nil,
          @origin : String? = nil,
          @project : Types::AwsOpportunityProject? = nil,
          @related_entity_ids : Types::AwsOpportunityRelatedEntities? = nil,
          @related_opportunity_id : String? = nil,
          @visibility : String? = nil
        )
        end
      end

      struct GetEngagementInvitationRequest
        include JSON::Serializable

        # Specifies the catalog associated with the request. The field accepts values from the predefined set:
        # AWS for live operations or Sandbox for testing environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Specifies the unique identifier for the retrieved engagement invitation.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end

      struct GetEngagementInvitationResponse
        include JSON::Serializable

        # Indicates the catalog from which the engagement invitation details are retrieved. This field helps
        # in identifying the appropriate catalog (e.g., AWS or Sandbox ) used in the request.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Unique identifier assigned to the engagement invitation being retrieved.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The Amazon Resource Name (ARN) that identifies the engagement invitation.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The description of the engagement associated with this invitation.
        @[JSON::Field(key: "EngagementDescription")]
        getter engagement_description : String?

        # The identifier of the engagement associated with this invitation.This ID links the invitation to its
        # corresponding engagement.
        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String?

        # The title of the engagement invitation, summarizing the purpose or objectives of the opportunity
        # shared by AWS.
        @[JSON::Field(key: "EngagementTitle")]
        getter engagement_title : String?

        # A list of active members currently part of the Engagement. This array contains a maximum of 10
        # members, each represented by an object with the following properties. CompanyName: The name of the
        # member's company. WebsiteUrl: The website URL of the member's company.
        @[JSON::Field(key: "ExistingMembers")]
        getter existing_members : Array(Types::EngagementMemberSummary)?

        # Indicates the date on which the engagement invitation will expire if not accepted by the partner.
        @[JSON::Field(key: "ExpirationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_date : Time?

        # The date when the engagement invitation was sent to the partner.
        @[JSON::Field(key: "InvitationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter invitation_date : Time?

        # The message sent to the invited partner when the invitation was created.
        @[JSON::Field(key: "InvitationMessage")]
        getter invitation_message : String?

        # Details of the engagement invitation payload, including specific data relevant to the invitation's
        # contents, such as customer information and opportunity insights.
        @[JSON::Field(key: "Payload")]
        getter payload : Types::Payload?

        # The type of payload contained in the engagement invitation, indicating what data or context the
        # payload covers.
        @[JSON::Field(key: "PayloadType")]
        getter payload_type : String?

        # Information about the partner organization or team that received the engagement invitation,
        # including contact details and identifiers.
        @[JSON::Field(key: "Receiver")]
        getter receiver : Types::Receiver?

        # If the engagement invitation was rejected, this field specifies the reason provided by the partner
        # for the rejection.
        @[JSON::Field(key: "RejectionReason")]
        getter rejection_reason : String?

        # Specifies the AWS Account ID of the sender, which identifies the AWS team responsible for sharing
        # the engagement invitation.
        @[JSON::Field(key: "SenderAwsAccountId")]
        getter sender_aws_account_id : String?

        # The name of the AWS organization or team that sent the engagement invitation.
        @[JSON::Field(key: "SenderCompanyName")]
        getter sender_company_name : String?

        # The current status of the engagement invitation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @catalog : String,
          @id : String,
          @arn : String? = nil,
          @engagement_description : String? = nil,
          @engagement_id : String? = nil,
          @engagement_title : String? = nil,
          @existing_members : Array(Types::EngagementMemberSummary)? = nil,
          @expiration_date : Time? = nil,
          @invitation_date : Time? = nil,
          @invitation_message : String? = nil,
          @payload : Types::Payload? = nil,
          @payload_type : String? = nil,
          @receiver : Types::Receiver? = nil,
          @rejection_reason : String? = nil,
          @sender_aws_account_id : String? = nil,
          @sender_company_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetEngagementRequest
        include JSON::Serializable

        # Specifies the catalog related to the engagement request. Valid values are AWS and Sandbox .
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Specifies the identifier of the Engagement record to retrieve.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end

      struct GetEngagementResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the engagement retrieved.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A list of context objects associated with the engagement. Each context provides additional
        # information related to the Engagement, such as customer projects or documents.
        @[JSON::Field(key: "Contexts")]
        getter contexts : Array(Types::EngagementContextDetails)?

        # The date and time when the Engagement was created, presented in ISO 8601 format (UTC). For example:
        # "2023-05-01T20:37:46Z". This timestamp helps track the lifecycle of the Engagement.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The AWS account ID of the user who originally created the engagement. This field helps in tracking
        # the origin of the engagement.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # A more detailed description of the engagement. This provides additional context or information about
        # the engagement's purpose or scope.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique resource identifier of the engagement retrieved.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # Specifies the current count of members participating in the Engagement. This count includes all
        # active members regardless of their roles or permissions within the Engagement.
        @[JSON::Field(key: "MemberCount")]
        getter member_count : Int32?

        # The timestamp indicating when the engagement was last modified, in ISO 8601 format (UTC). Example:
        # "2023-05-01T20:37:46Z". This helps track the most recent changes to the engagement.
        @[JSON::Field(key: "ModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # The AWS account ID of the user who last modified the engagement. This field helps track who made the
        # most recent changes to the engagement.
        @[JSON::Field(key: "ModifiedBy")]
        getter modified_by : String?

        # The title of the engagement. It provides a brief, descriptive name for the engagement that is
        # meaningful and easily recognizable.
        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @arn : String? = nil,
          @contexts : Array(Types::EngagementContextDetails)? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @member_count : Int32? = nil,
          @modified_at : Time? = nil,
          @modified_by : String? = nil,
          @title : String? = nil
        )
        end
      end

      struct GetOpportunityRequest
        include JSON::Serializable

        # Specifies the catalog associated with the request. This field takes a string value from a predefined
        # list: AWS or Sandbox . The catalog determines which environment the opportunity is fetched from. Use
        # AWS to retrieve opportunities in the Amazon Web Services catalog, and Sandbox to retrieve
        # opportunities in a secure, isolated testing environment.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Read-only, system generated Opportunity unique identifier.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end

      struct GetOpportunityResponse
        include JSON::Serializable

        # Specifies the catalog associated with the request. This field takes a string value from a predefined
        # list: AWS or Sandbox . The catalog determines which environment the opportunity information is
        # retrieved from. Use AWS to retrieve opportunities in the Amazon Web Services catalog, and Sandbox to
        # retrieve opportunities in a secure and isolated testing environment.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # DateTime when the Opportunity was last created.
        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # Read-only, system generated Opportunity unique identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        # DateTime when the opportunity was last modified.
        @[JSON::Field(key: "LastModifiedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time

        # Provides information about the associations of other entities with the opportunity. These entities
        # include identifiers for AWSProducts , Partner Solutions , and AWSMarketplaceOffers .
        @[JSON::Field(key: "RelatedEntityIdentifiers")]
        getter related_entity_identifiers : Types::RelatedEntityIdentifiers

        # The Amazon Resource Name (ARN) that uniquely identifies the opportunity.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Specifies details of the customer associated with the Opportunity .
        @[JSON::Field(key: "Customer")]
        getter customer : Types::Customer?

        # An object that contains lifecycle details for the Opportunity .
        @[JSON::Field(key: "LifeCycle")]
        getter life_cycle : Types::LifeCycle?

        # An object that contains marketing details for the Opportunity .
        @[JSON::Field(key: "Marketing")]
        getter marketing : Types::Marketing?

        # Indicates whether the Opportunity pertains to a national security project. This field must be set to
        # true only when the customer's industry is Government . Additional privacy and security measures
        # apply during the review and management process for opportunities marked as NationalSecurity .
        @[JSON::Field(key: "NationalSecurity")]
        getter national_security : String?

        # Represents the internal team handling the opportunity. Specify the members involved in collaborating
        # on this opportunity within the partner's organization.
        @[JSON::Field(key: "OpportunityTeam")]
        getter opportunity_team : Array(Types::Contact)?

        # Specifies the opportunity type as renewal, new, or expansion. Opportunity types: New opportunity:
        # Represents a new business opportunity with a potential customer that's not previously engaged with
        # your solutions or services. Renewal opportunity: Represents an opportunity to renew an existing
        # contract or subscription with a current customer, which helps to ensure service continuity.
        # Expansion opportunity: Represents an opportunity to expand the scope of a customer's contract or
        # subscription, either by adding new services or increasing the volume of existing services.
        @[JSON::Field(key: "OpportunityType")]
        getter opportunity_type : String?

        # Specifies the opportunity's unique identifier in the partner's CRM system. This value is essential
        # to track and reconcile because it's included in the outbound payload sent back to the partner.
        @[JSON::Field(key: "PartnerOpportunityIdentifier")]
        getter partner_opportunity_identifier : String?

        # Identifies the type of support the partner needs from Amazon Web Services. Valid values:
        # Cosell—Architectural Validation: Confirmation from Amazon Web Services that the partner's proposed
        # solution architecture is aligned with Amazon Web Services best practices and poses minimal
        # architectural risks. Cosell—Business Presentation: Request Amazon Web Services seller's
        # participation in a joint customer presentation. Cosell—Competitive Information: Access to Amazon Web
        # Services competitive resources and support for the partner's proposed solution. Cosell—Pricing
        # Assistance: Connect with an Amazon Web Services seller for support situations where a partner may be
        # receiving an upfront discount on a service (for example: EDP deals). Cosell—Technical Consultation:
        # Connect with an Amazon Web Services Solutions Architect to address the partner's questions about the
        # proposed solution. Cosell—Total Cost of Ownership Evaluation: Assistance with quoting different cost
        # savings of proposed solutions on Amazon Web Services versus on-premises or a traditional hosting
        # environment. Cosell—Deal Support: Request Amazon Web Services seller's support to progress the
        # opportunity (for example: joint customer call, strategic positioning). Cosell—Support for Public
        # Tender/RFx: Opportunity related to the public sector where the partner needs Amazon Web Services RFx
        # support.
        @[JSON::Field(key: "PrimaryNeedsFromAws")]
        getter primary_needs_from_aws : Array(String)?

        # An object that contains project details summary for the Opportunity .
        @[JSON::Field(key: "Project")]
        getter project : Types::Project?

        # Specifies details of a customer's procurement terms. Required only for partners in eligible
        # programs.
        @[JSON::Field(key: "SoftwareRevenue")]
        getter software_revenue : Types::SoftwareRevenue?

        def initialize(
          @catalog : String,
          @created_date : Time,
          @id : String,
          @last_modified_date : Time,
          @related_entity_identifiers : Types::RelatedEntityIdentifiers,
          @arn : String? = nil,
          @customer : Types::Customer? = nil,
          @life_cycle : Types::LifeCycle? = nil,
          @marketing : Types::Marketing? = nil,
          @national_security : String? = nil,
          @opportunity_team : Array(Types::Contact)? = nil,
          @opportunity_type : String? = nil,
          @partner_opportunity_identifier : String? = nil,
          @primary_needs_from_aws : Array(String)? = nil,
          @project : Types::Project? = nil,
          @software_revenue : Types::SoftwareRevenue? = nil
        )
        end
      end

      struct GetResourceSnapshotJobRequest
        include JSON::Serializable

        # Specifies the catalog related to the request. Valid values are: AWS: Retrieves the snapshot job from
        # the production AWS environment. Sandbox: Retrieves the snapshot job from a sandbox environment used
        # for testing or development purposes.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the resource snapshot job to be retrieved. This identifier is crucial for
        # pinpointing the specific job you want to query.
        @[JSON::Field(key: "ResourceSnapshotJobIdentifier")]
        getter resource_snapshot_job_identifier : String

        def initialize(
          @catalog : String,
          @resource_snapshot_job_identifier : String
        )
        end
      end

      struct GetResourceSnapshotJobResponse
        include JSON::Serializable

        # The catalog in which the snapshot job was created. This will match the Catalog specified in the
        # request.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The Amazon Resource Name (ARN) of the snapshot job. This globally unique identifier can be used for
        # resource-specific operations across AWS services.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time when the snapshot job was created in ISO 8601 format (UTC). Example:
        # "2023-05-01T20:37:46Z"
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The identifier of the engagement associated with this snapshot job. This links the job to a specific
        # engagement context.
        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String?

        # The unique identifier of the snapshot job. This matches the ResourceSnapshotJobIdentifier provided
        # in the request.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # If the job has encountered any failures, this field contains the error message from the most recent
        # failure. This can be useful for troubleshooting issues with the job.
        @[JSON::Field(key: "LastFailure")]
        getter last_failure : String?

        # The date and time of the last successful execution of the job, in ISO 8601 format (UTC). Example:
        # "2023-05-01T20:37:46Z"
        @[JSON::Field(key: "LastSuccessfulExecutionDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_successful_execution_date : Time?

        # The Amazon Resource Name (ARN) of the resource being snapshotted. This provides a globally unique
        # identifier for the resource across AWS.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The identifier of the specific resource being snapshotted. The format might vary depending on the
        # ResourceType.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The name of the template used for creating the snapshot. This is the same as the template name. It
        # defines the structure and content of the snapshot.
        @[JSON::Field(key: "ResourceSnapshotTemplateName")]
        getter resource_snapshot_template_name : String?

        # The type of resource being snapshotted. This would have "Opportunity" as a value as it is dependent
        # on the supported resource type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The current status of the snapshot job. Valid values: STOPPED: The job is not currently running.
        # RUNNING: The job is actively executing.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @catalog : String,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @engagement_id : String? = nil,
          @id : String? = nil,
          @last_failure : String? = nil,
          @last_successful_execution_date : Time? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @resource_snapshot_template_name : String? = nil,
          @resource_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetResourceSnapshotRequest
        include JSON::Serializable

        # Specifies the catalog related to the request. Valid values are: AWS: Retrieves the snapshot from the
        # production AWS environment. Sandbox: Retrieves the snapshot from a sandbox environment used for
        # testing or development purposes.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the engagement associated with the snapshot. This field links the snapshot
        # to a specific engagement context.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : String

        # The unique identifier of the specific resource that was snapshotted. The format and constraints of
        # this identifier depend on the ResourceType specified. For Opportunity type, it will be an
        # opportunity ID
        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String

        # he name of the template that defines the schema for the snapshot. This template determines which
        # subset of the resource data is included in the snapshot and must correspond to an existing and valid
        # template for the specified ResourceType .
        @[JSON::Field(key: "ResourceSnapshotTemplateIdentifier")]
        getter resource_snapshot_template_identifier : String

        # Specifies the type of resource that was snapshotted. This field determines the structure and content
        # of the snapshot payload. Valid value includes: Opportunity : For opportunity-related data.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Specifies which revision of the snapshot to retrieve. If omitted returns the latest revision.
        @[JSON::Field(key: "Revision")]
        getter revision : Int32?

        def initialize(
          @catalog : String,
          @engagement_identifier : String,
          @resource_identifier : String,
          @resource_snapshot_template_identifier : String,
          @resource_type : String,
          @revision : Int32? = nil
        )
        end
      end

      struct GetResourceSnapshotResponse
        include JSON::Serializable

        # The catalog in which the snapshot was created. Matches the Catalog specified in the request.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The Amazon Resource Name (ARN) that uniquely identifies the resource snapshot.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp when the snapshot was created, in ISO 8601 format (e.g., "2023-06-01T14:30:00Z"). This
        # allows for precise tracking of when the snapshot was taken.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The AWS account ID of the principal (user or role) who created the snapshot. This helps in tracking
        # the origin of the snapshot.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The identifier of the engagement associated with this snapshot. Matches the EngagementIdentifier
        # specified in the request.
        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String?

        @[JSON::Field(key: "Payload")]
        getter payload : Types::ResourceSnapshotPayload?

        # The identifier of the specific resource that was snapshotted. Matches the ResourceIdentifier
        # specified in the request.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The name of the view used for this snapshot. This is the same as the template name.
        @[JSON::Field(key: "ResourceSnapshotTemplateName")]
        getter resource_snapshot_template_name : String?

        # The type of the resource that was snapshotted. Matches the ResourceType specified in the request.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The revision number of this snapshot. This is a positive integer that is sequential and unique
        # within the context of a resource view.
        @[JSON::Field(key: "Revision")]
        getter revision : Int32?

        def initialize(
          @catalog : String,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @engagement_id : String? = nil,
          @payload : Types::ResourceSnapshotPayload? = nil,
          @resource_id : String? = nil,
          @resource_snapshot_template_name : String? = nil,
          @resource_type : String? = nil,
          @revision : Int32? = nil
        )
        end
      end

      struct GetSellingSystemSettingsRequest
        include JSON::Serializable

        # Specifies the catalog in which the settings are defined. Acceptable values include AWS for
        # production and Sandbox for testing environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        def initialize(
          @catalog : String
        )
        end
      end

      struct GetSellingSystemSettingsResponse
        include JSON::Serializable

        # Specifies the catalog in which the settings are defined. Acceptable values include AWS for
        # production and Sandbox for testing environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Specifies the ARN of the IAM Role used for resource snapshot job executions.
        @[JSON::Field(key: "ResourceSnapshotJobRoleArn")]
        getter resource_snapshot_job_role_arn : String?

        def initialize(
          @catalog : String,
          @resource_snapshot_job_role_arn : String? = nil
        )
        end
      end

      # This error occurs when the specified resource can’t be found or doesn't exist. Resource ID and type
      # might be incorrect. Suggested action: This is usually a transient error. Retry after the provided
      # retry delay or a short interval. If the problem persists, contact AWS support.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Invitation structure represents an invitation exchanged between partners and AWS. It includes a
      # message, receiver information, and a payload providing context for the invitation.
      struct Invitation
        include JSON::Serializable

        # A message accompanying the invitation.
        @[JSON::Field(key: "Message")]
        getter message : String

        @[JSON::Field(key: "Payload")]
        getter payload : Types::Payload

        @[JSON::Field(key: "Receiver")]
        getter receiver : Types::Receiver

        def initialize(
          @message : String,
          @payload : Types::Payload,
          @receiver : Types::Receiver
        )
        end
      end

      # Defines a filter to retrieve opportunities based on the last modified date. This filter is useful
      # for tracking changes or updates to opportunities over time.
      struct LastModifiedDate
        include JSON::Serializable

        # Specifies the date after which the opportunities were modified. Use this filter to retrieve only
        # those opportunities that were modified after a given timestamp.
        @[JSON::Field(key: "AfterLastModifiedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter after_last_modified_date : Time?

        # Specifies the date before which the opportunities were modified. Use this filter to retrieve only
        # those opportunities that were modified before a given timestamp.
        @[JSON::Field(key: "BeforeLastModifiedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter before_last_modified_date : Time?

        def initialize(
          @after_last_modified_date : Time? = nil,
          @before_last_modified_date : Time? = nil
        )
        end
      end

      # An object that contains a lead contact's details associated with the engagement. This provides
      # contact information for individuals involved in lead-related activities.
      struct LeadContact
        include JSON::Serializable

        # The lead contact's business title or job role associated with the engagement.
        @[JSON::Field(key: "BusinessTitle")]
        getter business_title : String

        # The lead contact's email address associated with the engagement.
        @[JSON::Field(key: "Email")]
        getter email : String

        # The lead contact's first name associated with the engagement.
        @[JSON::Field(key: "FirstName")]
        getter first_name : String

        # The lead contact's last name associated with the engagement.
        @[JSON::Field(key: "LastName")]
        getter last_name : String

        # The lead contact's phone number associated with the engagement.
        @[JSON::Field(key: "Phone")]
        getter phone : String?

        def initialize(
          @business_title : String,
          @email : String,
          @first_name : String,
          @last_name : String,
          @phone : String? = nil
        )
        end
      end

      # Provides comprehensive details about a lead associated with an engagement. This structure contains
      # information about lead qualification status, customer details, and interaction history to facilitate
      # lead management and tracking within the engagement.
      struct LeadContext
        include JSON::Serializable

        # Contains detailed information about the customer associated with the lead, including company
        # information, contact details, and other relevant customer data.
        @[JSON::Field(key: "Customer")]
        getter customer : Types::LeadCustomer

        # An array of interactions that have occurred with the lead, providing a history of communications,
        # meetings, and other engagement activities related to the lead.
        @[JSON::Field(key: "Interactions")]
        getter interactions : Array(Types::LeadInteraction)

        # Indicates the current qualification status of the lead, such as whether it has been qualified,
        # disqualified, or is still under evaluation. This helps track the lead's progression through the
        # qualification process.
        @[JSON::Field(key: "QualificationStatus")]
        getter qualification_status : String?

        def initialize(
          @customer : Types::LeadCustomer,
          @interactions : Array(Types::LeadInteraction),
          @qualification_status : String? = nil
        )
        end
      end

      # Contains detailed information about the customer associated with the lead, including company
      # details, industry classification, and AWS maturity level. This information helps qualify and
      # categorize the lead for appropriate engagement strategies.
      struct LeadCustomer
        include JSON::Serializable

        @[JSON::Field(key: "Address")]
        getter address : Types::AddressSummary

        # The name of the lead customer's company. This field is essential for identifying and tracking the
        # customer organization associated with the lead.
        @[JSON::Field(key: "CompanyName")]
        getter company_name : String

        # Indicates the customer's level of experience and adoption with AWS services. This assessment helps
        # determine the appropriate engagement approach and solution complexity.
        @[JSON::Field(key: "AwsMaturity")]
        getter aws_maturity : String?

        # Specifies the industry sector to which the lead customer's company belongs. This categorization
        # helps in understanding the customer's business context and tailoring appropriate solutions.
        @[JSON::Field(key: "Industry")]
        getter industry : String?

        # Specifies the market segment classification of the lead customer, such as enterprise, mid-market, or
        # small business. This segmentation helps in targeting appropriate solutions and engagement
        # strategies.
        @[JSON::Field(key: "MarketSegment")]
        getter market_segment : String?

        # The website URL of the lead customer's company. This provides additional context about the customer
        # organization and helps verify company legitimacy and size.
        @[JSON::Field(key: "WebsiteUrl")]
        getter website_url : String?

        def initialize(
          @address : Types::AddressSummary,
          @company_name : String,
          @aws_maturity : String? = nil,
          @industry : String? = nil,
          @market_segment : String? = nil,
          @website_url : String? = nil
        )
        end
      end

      # Represents a specific interaction or touchpoint with a lead customer. This structure captures
      # details about communications, meetings, or other engagement activities that help track the lead's
      # progression and engagement history.
      struct LeadInteraction
        include JSON::Serializable

        # Contains contact information for the customer representative involved in the lead interaction,
        # including their name, title, and contact details.
        @[JSON::Field(key: "Contact")]
        getter contact : Types::LeadContact

        # Describes the action taken by the customer during or as a result of the interaction, such as
        # requesting information, scheduling a meeting, or expressing interest in a solution.
        @[JSON::Field(key: "CustomerAction")]
        getter customer_action : String

        # The unique identifier of the specific source that generated the lead interaction. This ID provides
        # traceability back to the original lead generation activity.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String

        # The descriptive name of the source that generated the lead interaction, providing a human-readable
        # identifier for the lead generation channel or activity.
        @[JSON::Field(key: "SourceName")]
        getter source_name : String

        # Specifies the type of source that generated the lead interaction, such as "Event", "Website",
        # "Referral", or "Campaign". This categorization helps track lead generation effectiveness across
        # different channels.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String

        # Describes the business problem or challenge that the customer discussed during the interaction. This
        # information helps qualify the lead and identify appropriate solutions.
        @[JSON::Field(key: "BusinessProblem")]
        getter business_problem : String?

        # The date and time when the lead interaction occurred, in ISO 8601 format (UTC). This timestamp helps
        # track the chronology of lead engagement activities.
        @[JSON::Field(key: "InteractionDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter interaction_date : Time?

        # Describes the specific use case or business scenario discussed during the lead interaction. This
        # helps categorize the customer's interests and potential solutions.
        @[JSON::Field(key: "Usecase")]
        getter usecase : String?

        def initialize(
          @contact : Types::LeadContact,
          @customer_action : String,
          @source_id : String,
          @source_name : String,
          @source_type : String,
          @business_problem : String? = nil,
          @interaction_date : Time? = nil,
          @usecase : String? = nil
        )
        end
      end

      # Contains customer information included in a lead invitation payload. This structure provides
      # essential details about the customer to help partners evaluate the lead opportunity and determine
      # their interest in engagement.
      struct LeadInvitationCustomer
        include JSON::Serializable

        # The name of the customer company associated with the lead invitation. This field identifies the
        # target organization for the lead engagement opportunity.
        @[JSON::Field(key: "CompanyName")]
        getter company_name : String

        # The country code indicating the geographic location of the customer company. This information helps
        # partners understand regional requirements and assess their ability to serve the customer
        # effectively.
        @[JSON::Field(key: "CountryCode")]
        getter country_code : String

        # Indicates the customer's level of experience and adoption with AWS services. This assessment helps
        # partners understand the customer's cloud maturity and tailor their engagement approach accordingly.
        @[JSON::Field(key: "AwsMaturity")]
        getter aws_maturity : String?

        # Specifies the industry sector of the customer company associated with the lead invitation. This
        # categorization helps partners understand the customer's business context and assess solution fit.
        @[JSON::Field(key: "Industry")]
        getter industry : String?

        # Specifies the market segment classification of the customer, such as enterprise, mid-market, or
        # small business. This segmentation helps partners determine the appropriate solution complexity and
        # engagement strategy.
        @[JSON::Field(key: "MarketSegment")]
        getter market_segment : String?

        # The website URL of the customer company. This provides additional context about the customer
        # organization and helps partners verify company details and assess business size and legitimacy.
        @[JSON::Field(key: "WebsiteUrl")]
        getter website_url : String?

        def initialize(
          @company_name : String,
          @country_code : String,
          @aws_maturity : String? = nil,
          @industry : String? = nil,
          @market_segment : String? = nil,
          @website_url : String? = nil
        )
        end
      end

      # Represents interaction details included in a lead invitation payload. This structure provides
      # context about how the lead was generated and the customer's engagement history to help partners
      # assess the opportunity quality.
      struct LeadInvitationInteraction
        include JSON::Serializable

        # The business title or job role of the customer contact involved in the lead interaction. This helps
        # partners identify the decision-making level and engagement approach for the lead.
        @[JSON::Field(key: "ContactBusinessTitle")]
        getter contact_business_title : String

        # The unique identifier of the specific source that generated the lead interaction. This provides
        # traceability to the original lead generation activity for reference and follow-up purposes.
        @[JSON::Field(key: "SourceId")]
        getter source_id : String

        # The descriptive name of the source that generated the lead interaction. This human-readable
        # identifier helps partners understand the specific lead generation channel or campaign that created
        # the opportunity.
        @[JSON::Field(key: "SourceName")]
        getter source_name : String

        # Specifies the type of source that generated the lead interaction, such as "Event", "Website", or
        # "Campaign". This helps partners understand the lead generation channel and assess lead quality based
        # on the source type.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String

        # Describes the specific use case or business scenario associated with the lead interaction. This
        # information helps partners understand the customer's interests and potential solution requirements.
        @[JSON::Field(key: "Usecase")]
        getter usecase : String?

        def initialize(
          @contact_business_title : String,
          @source_id : String,
          @source_name : String,
          @source_type : String,
          @usecase : String? = nil
        )
        end
      end

      # Represents the data payload of an engagement invitation for a lead opportunity. This contains
      # detailed information about the customer and interaction history that partners use to evaluate
      # whether to accept the lead engagement invitation.
      struct LeadInvitationPayload
        include JSON::Serializable

        # Contains information about the customer associated with the lead invitation. This data helps
        # partners understand the customer's profile, industry, and business context to assess the lead
        # opportunity.
        @[JSON::Field(key: "Customer")]
        getter customer : Types::LeadInvitationCustomer

        # Describes the interaction details associated with the lead, including the source of the lead
        # generation and customer engagement information. This context helps partners evaluate the lead
        # quality and engagement approach.
        @[JSON::Field(key: "Interaction")]
        getter interaction : Types::LeadInvitationInteraction

        def initialize(
          @customer : Types::LeadInvitationCustomer,
          @interaction : Types::LeadInvitationInteraction
        )
        end
      end

      # An object that contains the Opportunity lifecycle's details.
      struct LifeCycle
        include JSON::Serializable

        # Specifies the reason code when an opportunity is marked as Closed Lost . When you select an
        # appropriate reason code, you communicate the context for closing the Opportunity , and aid in
        # accurate reports and analysis of opportunity outcomes. The possible values are: Customer Deficiency:
        # The customer lacked necessary resources or capabilities. Delay/Cancellation of Project: The project
        # was delayed or canceled. Legal/Tax/Regulatory: Legal, tax, or regulatory issues prevented progress.
        # Lost to Competitor—Google: The opportunity was lost to Google. Lost to Competitor—Microsoft: The
        # opportunity was lost to Microsoft. Lost to Competitor—SoftLayer: The opportunity was lost to
        # SoftLayer. Lost to Competitor—VMWare: The opportunity was lost to VMWare. Lost to Competitor—Other:
        # The opportunity was lost to a competitor not listed above. No Opportunity: There was no opportunity
        # to pursue. On Premises Deployment: The customer chose an on-premises solution. Partner Gap: The
        # partner lacked necessary resources or capabilities. Price: The price was not competitive or
        # acceptable to the customer. Security/Compliance: Security or compliance issues prevented progress.
        # Technical Limitations: Technical limitations prevented progress. Customer Experience: Issues related
        # to the customer's experience impacted the decision. Other: Any reason not covered by the other
        # values. People/Relationship/Governance: Issues related to people, relationships, or governance.
        # Product/Technology: Issues related to the product or technology. Financial/Commercial: Financial or
        # commercial issues impacted the decision.
        @[JSON::Field(key: "ClosedLostReason")]
        getter closed_lost_reason : String?

        # Specifies the upcoming actions or tasks for the Opportunity . Use this field to communicate with
        # Amazon Web Services about the next actions required for the Opportunity .
        @[JSON::Field(key: "NextSteps")]
        getter next_steps : String?

        # Captures a chronological record of the next steps or actions planned or taken for the current
        # opportunity, along with the timestamp.
        @[JSON::Field(key: "NextStepsHistory")]
        getter next_steps_history : Array(Types::NextStepsHistory)?

        # Contains detailed feedback from Amazon Web Services when requesting additional information from
        # partners. Provides specific guidance on what partners need to provide or clarify for opportunity
        # validation, complementing the ReviewStatusReason field.
        @[JSON::Field(key: "ReviewComments")]
        getter review_comments : String?

        # Indicates the review status of an opportunity referred by a partner. This field is read-only and
        # only applicable for partner referrals. The possible values are: Pending Submission: Not submitted
        # for validation (editable). Submitted: Submitted for validation, and Amazon Web Services hasn't
        # reviewed it (read-only). In Review: Amazon Web Services is validating (read-only). Action Required:
        # Issues that Amazon Web Services highlights need to be addressed. Partners should use the
        # UpdateOpportunity API action to update the opportunity and helps to ensure that all required changes
        # are made. Only the following fields are editable when the Lifecycle.ReviewStatus is Action Required
        # : Customer.Account.Address.City Customer.Account.Address.CountryCode
        # Customer.Account.Address.PostalCode Customer.Account.Address.StateOrRegion
        # Customer.Account.Address.StreetAddress Customer.Account.WebsiteUrl LifeCycle.TargetCloseDate
        # Project.ExpectedMonthlyAWSRevenue.Amount Project.ExpectedMonthlyAWSRevenue.CurrencyCode
        # Project.CustomerBusinessProblem PartnerOpportunityIdentifier After updates, the opportunity
        # re-enters the validation phase. This process repeats until all issues are resolved, and the
        # opportunity's Lifecycle.ReviewStatus is set to Approved or Rejected . Approved: Validated and
        # converted into the Amazon Web Services seller's pipeline (editable). Rejected: Disqualified
        # (read-only).
        @[JSON::Field(key: "ReviewStatus")]
        getter review_status : String?

        # Code indicating the validation decision during the Amazon Web Services opportunity review. Applies
        # when status is Rejected or Action Required . Used to document validation results for AWS Partner
        # Referrals and indicate when additional information is needed from partners as part of the APN
        # Customer Engagement (ACE) program.
        @[JSON::Field(key: "ReviewStatusReason")]
        getter review_status_reason : String?

        # Specifies the current stage of the Opportunity 's lifecycle as it maps to Amazon Web Services stages
        # from the current stage in the partner CRM. This field provides a translated value of the stage, and
        # offers insight into the Opportunity 's progression in the sales cycle, according to Amazon Web
        # Services definitions. A lead and a prospect must be further matured to a Qualified opportunity
        # before submission. Opportunities that were closed/lost before submission aren't suitable for
        # submission. The descriptions of each sales stage are: Prospect: Amazon Web Services identifies the
        # opportunity. It can be active (Comes directly from the end customer through a lead) or latent (Your
        # account team believes it exists based on research, account plans, sales plays). Qualified: Your
        # account team engaged with the customer to discuss viability and requirements. The customer agreed
        # that the opportunity is real, of interest, and may solve business/technical needs. Technical
        # Validation: All parties understand the implementation plan. Business Validation: Pricing was
        # proposed, and all parties agree to the steps to close. Committed: The customer signed the contract,
        # but Amazon Web Services hasn't started billing. Launched: The workload is complete, and Amazon Web
        # Services has started billing. Closed Lost: The opportunity is lost, and there are no steps to move
        # forward.
        @[JSON::Field(key: "Stage")]
        getter stage : String?

        # Specifies the date when Amazon Web Services expects to start significant billing, when the project
        # finishes, and when it moves into production. This field informs the Amazon Web Services seller about
        # when the opportunity launches and starts to incur Amazon Web Services usage. Ensure the Target Close
        # Date isn't in the past.
        @[JSON::Field(key: "TargetCloseDate")]
        getter target_close_date : String?

        def initialize(
          @closed_lost_reason : String? = nil,
          @next_steps : String? = nil,
          @next_steps_history : Array(Types::NextStepsHistory)? = nil,
          @review_comments : String? = nil,
          @review_status : String? = nil,
          @review_status_reason : String? = nil,
          @stage : String? = nil,
          @target_close_date : String? = nil
        )
        end
      end

      # Provides the lifecycle view of an opportunity resource shared through a snapshot.
      struct LifeCycleForView
        include JSON::Serializable

        # Describes the next steps for the opportunity shared through a snapshot.
        @[JSON::Field(key: "NextSteps")]
        getter next_steps : String?

        # Defines the approval status of the opportunity shared through a snapshot.
        @[JSON::Field(key: "ReviewStatus")]
        getter review_status : String?

        # Defines the current stage of the opportunity shared through a snapshot.
        @[JSON::Field(key: "Stage")]
        getter stage : String?

        # The projected launch date of the opportunity shared through a snapshot.
        @[JSON::Field(key: "TargetCloseDate")]
        getter target_close_date : String?

        def initialize(
          @next_steps : String? = nil,
          @review_status : String? = nil,
          @stage : String? = nil,
          @target_close_date : String? = nil
        )
        end
      end

      # An object that contains a LifeCycle object's subset of fields.
      struct LifeCycleSummary
        include JSON::Serializable

        # Specifies the reason code when an opportunity is marked as Closed Lost . When you select an
        # appropriate reason code, you communicate the context for closing the Opportunity , and aid in
        # accurate reports and analysis of opportunity outcomes.
        @[JSON::Field(key: "ClosedLostReason")]
        getter closed_lost_reason : String?

        # Specifies the upcoming actions or tasks for the Opportunity . This field is utilized to communicate
        # to Amazon Web Services the next actions required for the Opportunity .
        @[JSON::Field(key: "NextSteps")]
        getter next_steps : String?

        # Indicates why an opportunity was sent back for further details. Partners must take corrective action
        # based on the ReviewComments .
        @[JSON::Field(key: "ReviewComments")]
        getter review_comments : String?

        # Indicates the review status of a partner referred opportunity. This field is read-only and only
        # applicable for partner referrals. Valid values: Pending Submission: Not submitted for validation
        # (editable). Submitted: Submitted for validation and not yet Amazon Web Services reviewed
        # (read-only). In Review: Undergoing Amazon Web Services validation (read-only). Action Required:
        # Address any issues Amazon Web Services highlights. Use the UpdateOpportunity API action to update
        # the opportunity, and ensure you make all required changes. Only these fields are editable when the
        # Lifecycle.ReviewStatus is Action Required : Customer.Account.Address.City
        # Customer.Account.Address.CountryCode Customer.Account.Address.PostalCode
        # Customer.Account.Address.StateOrRegion Customer.Account.Address.StreetAddress
        # Customer.Account.WebsiteUrl LifeCycle.TargetCloseDate Project.ExpectedCustomerSpend.Amount
        # Project.ExpectedCustomerSpend.CurrencyCode Project.CustomerBusinessProblem
        # PartnerOpportunityIdentifier After updates, the opportunity re-enters the validation phase. This
        # process repeats until all issues are resolved, and the opportunity's Lifecycle.ReviewStatus is set
        # to Approved or Rejected . Approved: Validated and converted into the Amazon Web Services seller's
        # pipeline (editable). Rejected: Disqualified (read-only).
        @[JSON::Field(key: "ReviewStatus")]
        getter review_status : String?

        # Indicates the reason a specific decision was taken during the opportunity review process. This field
        # combines the reasons for both disqualified and action required statuses, and provides clarity for
        # why an opportunity was disqualified or required further action.
        @[JSON::Field(key: "ReviewStatusReason")]
        getter review_status_reason : String?

        # Specifies the current stage of the Opportunity 's lifecycle as it maps to Amazon Web Services stages
        # from the current stage in the partner CRM. This field provides a translated value of the stage, and
        # offers insight into the Opportunity 's progression in the sales cycle, according to Amazon Web
        # Services definitions. A lead and a prospect must be further matured to a Qualified opportunity
        # before submission. Opportunities that were closed/lost before submission aren't suitable for
        # submission. The descriptions of each sales stage are: Prospect: Amazon Web Services identifies the
        # opportunity. It can be active (Comes directly from the end customer through a lead) or latent (Your
        # account team believes it exists based on research, account plans, sales plays). Qualified: Your
        # account team engaged with the customer to discuss viability and understand requirements. The
        # customer agreed that the opportunity is real, of interest, and may solve business/technical needs.
        # Technical Validation: All parties understand the implementation plan. Business Validation: Pricing
        # was proposed, and all parties agree to the steps to close. Committed: The customer signed the
        # contract, but Amazon Web Services hasn't started billing. Launched: The workload is complete, and
        # Amazon Web Services has started billing. Closed Lost: The opportunity is lost, and there are no
        # steps to move forward.
        @[JSON::Field(key: "Stage")]
        getter stage : String?

        # Specifies the date when Amazon Web Services expects to start significant billing, when the project
        # finishes, and when it moves into production. This field informs the Amazon Web Services seller about
        # when the opportunity launches and starts to incur Amazon Web Services usage. Ensure the Target Close
        # Date isn't in the past.
        @[JSON::Field(key: "TargetCloseDate")]
        getter target_close_date : String?

        def initialize(
          @closed_lost_reason : String? = nil,
          @next_steps : String? = nil,
          @review_comments : String? = nil,
          @review_status : String? = nil,
          @review_status_reason : String? = nil,
          @stage : String? = nil,
          @target_close_date : String? = nil
        )
        end
      end

      # Specifies a subset of fields associated with tasks related to accepting an engagement invitation.
      struct ListEngagementByAcceptingInvitationTaskSummary
        include JSON::Serializable

        # The unique identifier of the engagement invitation that was accepted.
        @[JSON::Field(key: "EngagementInvitationId")]
        getter engagement_invitation_id : String?

        # Detailed message describing the failure and possible recovery steps.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # Unique identifier of opportunity that was created.
        @[JSON::Field(key: "OpportunityId")]
        getter opportunity_id : String?

        # A code pointing to the specific reason for the failure.
        @[JSON::Field(key: "ReasonCode")]
        getter reason_code : String?

        # Unique identifier of the resource snapshot job that was created.
        @[JSON::Field(key: "ResourceSnapshotJobId")]
        getter resource_snapshot_job_id : String?

        # Task start timestamp.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The Amazon Resource Name (ARN) that uniquely identifies the task.
        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # Unique identifier of the task.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        # Status of the task.
        @[JSON::Field(key: "TaskStatus")]
        getter task_status : String?

        def initialize(
          @engagement_invitation_id : String? = nil,
          @message : String? = nil,
          @opportunity_id : String? = nil,
          @reason_code : String? = nil,
          @resource_snapshot_job_id : String? = nil,
          @start_time : Time? = nil,
          @task_arn : String? = nil,
          @task_id : String? = nil,
          @task_status : String? = nil
        )
        end
      end

      struct ListEngagementByAcceptingInvitationTasksRequest
        include JSON::Serializable

        # Specifies the catalog related to the request. Valid values are: AWS: Retrieves the request from the
        # production AWS environment. Sandbox: Retrieves the request from a sandbox environment used for
        # testing or development purposes.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Filters tasks by the identifiers of the engagement invitations they are processing.
        @[JSON::Field(key: "EngagementInvitationIdentifier")]
        getter engagement_invitation_identifier : Array(String)?

        # Use this parameter to control the number of items returned in each request, which can be useful for
        # performance tuning and managing large result sets.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter for pagination when the result set spans multiple pages. This value is obtained
        # from the NextToken field in the response of a previous call to this API.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters tasks by the identifiers of the opportunities they created or are associated with.
        @[JSON::Field(key: "OpportunityIdentifier")]
        getter opportunity_identifier : Array(String)?

        # Specifies the sorting criteria for the returned results. This allows you to order the tasks based on
        # specific attributes.
        @[JSON::Field(key: "Sort")]
        getter sort : Types::ListTasksSortBase?

        # Filters tasks by their unique identifiers. Use this when you want to retrieve information about
        # specific tasks.
        @[JSON::Field(key: "TaskIdentifier")]
        getter task_identifier : Array(String)?

        # Filters the tasks based on their current status. This allows you to focus on tasks in specific
        # states.
        @[JSON::Field(key: "TaskStatus")]
        getter task_status : Array(String)?

        def initialize(
          @catalog : String,
          @engagement_invitation_identifier : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @opportunity_identifier : Array(String)? = nil,
          @sort : Types::ListTasksSortBase? = nil,
          @task_identifier : Array(String)? = nil,
          @task_status : Array(String)? = nil
        )
        end
      end

      struct ListEngagementByAcceptingInvitationTasksResponse
        include JSON::Serializable

        # A token used for pagination to retrieve the next page of results.If there are more results
        # available, this field will contain a token that can be used in a subsequent API call to retrieve the
        # next page. If there are no more results, this field will be null or an empty string.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of EngagementByAcceptingInvitationTaskSummary objects, each representing a task that
        # matches the specified filters. The array may be empty if no tasks match the criteria.
        @[JSON::Field(key: "TaskSummaries")]
        getter task_summaries : Array(Types::ListEngagementByAcceptingInvitationTaskSummary)?

        def initialize(
          @next_token : String? = nil,
          @task_summaries : Array(Types::ListEngagementByAcceptingInvitationTaskSummary)? = nil
        )
        end
      end

      # Provides a summary of a task related to creating an engagement from an opportunity. This structure
      # contains key information about the task's status, associated identifiers, and any failure details.
      struct ListEngagementFromOpportunityTaskSummary
        include JSON::Serializable

        # The unique identifier of the engagement created as a result of the task. This field is populated
        # when the task is completed successfully.
        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String?

        # The unique identifier of the Engagement Invitation.
        @[JSON::Field(key: "EngagementInvitationId")]
        getter engagement_invitation_id : String?

        # A detailed message providing additional information about the task, especially useful in case of
        # failures. This field may contain error details or other relevant information about the task's
        # execution
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The unique identifier of the original Opportunity from which the Engagement is being created. This
        # field helps track the source of the Engagement creation task.
        @[JSON::Field(key: "OpportunityId")]
        getter opportunity_id : String?

        # A code indicating the specific reason for a task failure. This field is populated when the task
        # status is FAILED and provides a categorized reason for the failure.
        @[JSON::Field(key: "ReasonCode")]
        getter reason_code : String?

        # The identifier of the resource snapshot job associated with this task, if a snapshot was created as
        # part of the Engagement creation process.
        @[JSON::Field(key: "ResourceSnapshotJobId")]
        getter resource_snapshot_job_id : String?

        # The timestamp indicating when the task was initiated, in RFC 3339 5.6 date-time format.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The Amazon Resource Name (ARN) uniquely identifying this task within AWS. This ARN can be used for
        # referencing the task in other AWS services or APIs.
        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # A unique identifier for a specific task.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        # The current status of the task.
        @[JSON::Field(key: "TaskStatus")]
        getter task_status : String?

        def initialize(
          @engagement_id : String? = nil,
          @engagement_invitation_id : String? = nil,
          @message : String? = nil,
          @opportunity_id : String? = nil,
          @reason_code : String? = nil,
          @resource_snapshot_job_id : String? = nil,
          @start_time : Time? = nil,
          @task_arn : String? = nil,
          @task_id : String? = nil,
          @task_status : String? = nil
        )
        end
      end

      struct ListEngagementFromOpportunityTasksRequest
        include JSON::Serializable

        # Specifies the catalog related to the request. Valid values are: AWS: Retrieves the request from the
        # production AWS environment. Sandbox: Retrieves the request from a sandbox environment used for
        # testing or development purposes.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Filters tasks by the identifiers of the engagements they created or are associated with.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : Array(String)?

        # Specifies the maximum number of results to return in a single page of the response.Use this
        # parameter to control the number of items returned in each request, which can be useful for
        # performance tuning and managing large result sets.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for requesting the next page of results. This value is obtained from the NextToken field
        # in the response of a previous call to this API. Use this parameter for pagination when the result
        # set spans multiple pages.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifier of the original opportunity associated with this task.
        @[JSON::Field(key: "OpportunityIdentifier")]
        getter opportunity_identifier : Array(String)?

        # Specifies the sorting criteria for the returned results. This allows you to order the tasks based on
        # specific attributes.
        @[JSON::Field(key: "Sort")]
        getter sort : Types::ListTasksSortBase?

        # Filters tasks by their unique identifiers. Use this when you want to retrieve information about
        # specific tasks.
        @[JSON::Field(key: "TaskIdentifier")]
        getter task_identifier : Array(String)?

        # Filters the tasks based on their current status. This allows you to focus on tasks in specific
        # states.
        @[JSON::Field(key: "TaskStatus")]
        getter task_status : Array(String)?

        def initialize(
          @catalog : String,
          @engagement_identifier : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @opportunity_identifier : Array(String)? = nil,
          @sort : Types::ListTasksSortBase? = nil,
          @task_identifier : Array(String)? = nil,
          @task_status : Array(String)? = nil
        )
        end
      end

      struct ListEngagementFromOpportunityTasksResponse
        include JSON::Serializable

        # A token used for pagination to retrieve the next page of results. If there are more results
        # available, this field will contain a token that can be used in a subsequent API call to retrieve the
        # next page. If there are no more results, this field will be null or an empty string.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # TaskSummaries An array of TaskSummary objects containing details about each task.
        @[JSON::Field(key: "TaskSummaries")]
        getter task_summaries : Array(Types::ListEngagementFromOpportunityTaskSummary)?

        def initialize(
          @next_token : String? = nil,
          @task_summaries : Array(Types::ListEngagementFromOpportunityTaskSummary)? = nil
        )
        end
      end

      struct ListEngagementInvitationsRequest
        include JSON::Serializable

        # Specifies the catalog from which to list the engagement invitations. Use AWS for production
        # invitations or Sandbox for testing environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Specifies the type of participant for which to list engagement invitations. Identifies the role of
        # the participant.
        @[JSON::Field(key: "ParticipantType")]
        getter participant_type : String

        # Retrieves a list of engagement invitation summaries based on specified filters. The
        # ListEngagementInvitations operation allows you to view all invitations that you have sent or
        # received. You must specify the ParticipantType to filter invitations where you are either the SENDER
        # or the RECEIVER. Invitations will automatically expire if not accepted within 15 days.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : Array(String)?

        # Specifies the maximum number of engagement invitations to return in the response. If more results
        # are available, a pagination token will be provided.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A pagination token used to retrieve additional pages of results when the response to a previous
        # request was truncated. Pass this token to continue listing invitations from where the previous call
        # left off.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Defines the type of payload associated with the engagement invitations to be listed. The attributes
        # in this payload help decide on acceptance or rejection of the invitation.
        @[JSON::Field(key: "PayloadType")]
        getter payload_type : Array(String)?

        # List of sender AWS account IDs to filter the invitations.
        @[JSON::Field(key: "SenderAwsAccountId")]
        getter sender_aws_account_id : Array(String)?

        # Specifies the sorting options for listing engagement invitations. Invitations can be sorted by
        # fields such as InvitationDate or Status to help partners view results in their preferred order.
        @[JSON::Field(key: "Sort")]
        getter sort : Types::OpportunityEngagementInvitationSort?

        # Status values to filter the invitations.
        @[JSON::Field(key: "Status")]
        getter status : Array(String)?

        def initialize(
          @catalog : String,
          @participant_type : String,
          @engagement_identifier : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @payload_type : Array(String)? = nil,
          @sender_aws_account_id : Array(String)? = nil,
          @sort : Types::OpportunityEngagementInvitationSort? = nil,
          @status : Array(String)? = nil
        )
        end
      end

      struct ListEngagementInvitationsResponse
        include JSON::Serializable

        # An array containing summaries of engagement invitations. Each summary includes information such as
        # the invitation title, invitation date, and the current status of the invitation.
        @[JSON::Field(key: "EngagementInvitationSummaries")]
        getter engagement_invitation_summaries : Array(Types::EngagementInvitationSummary)?

        # A pagination token returned when there are more results available than can be returned in a single
        # call. Use this token to retrieve additional pages of engagement invitation summaries.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @engagement_invitation_summaries : Array(Types::EngagementInvitationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEngagementMembersRequest
        include JSON::Serializable

        # The catalog related to the request.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Identifier of the Engagement record to retrieve members from.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The maximum number of results to return in a single call.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @catalog : String,
          @identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEngagementMembersResponse
        include JSON::Serializable

        # Provides a list of engagement members.
        @[JSON::Field(key: "EngagementMemberList")]
        getter engagement_member_list : Array(Types::EngagementMember)

        # A pagination token used to retrieve the next set of results. If there are more results available
        # than can be returned in a single response, this token will be present. Use this token in a
        # subsequent request to retrieve the next page of results. If there are no more results, this value
        # will be null.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @engagement_member_list : Array(Types::EngagementMember),
          @next_token : String? = nil
        )
        end
      end

      struct ListEngagementResourceAssociationsRequest
        include JSON::Serializable

        # Specifies the catalog in which to search for engagement-resource associations. Valid Values: "AWS"
        # or "Sandbox" AWS for production environments. Sandbox for testing and development purposes.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Filters the response to include only snapshots of resources owned by the specified AWS account ID.
        # Use this when you want to find associations related to resources owned by a particular account.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # Filters the results to include only associations related to the specified engagement. Use this when
        # you want to find all resources associated with a specific engagement.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : String?

        # Limits the number of results returned in a single call. Use this to control the number of results
        # returned, especially useful for pagination.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token used for pagination of results. Include this token in subsequent requests to retrieve the
        # next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters the results to include only associations with the specified resource. Varies depending on
        # the resource type. Use this when you want to find all engagements associated with a specific
        # resource.
        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        # Filters the results to include only associations with resources of the specified type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @catalog : String,
          @created_by : String? = nil,
          @engagement_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_identifier : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct ListEngagementResourceAssociationsResponse
        include JSON::Serializable

        # A list of engagement-resource association summaries.
        @[JSON::Field(key: "EngagementResourceAssociationSummaries")]
        getter engagement_resource_association_summaries : Array(Types::EngagementResourceAssociationSummary)

        # A token to retrieve the next set of results. Use this token in a subsequent request to retrieve
        # additional results if the response was truncated.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @engagement_resource_association_summaries : Array(Types::EngagementResourceAssociationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListEngagementsRequest
        include JSON::Serializable

        # Specifies the catalog related to the request.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Filters engagements to include only those containing the specified context types, such as
        # "CustomerProject" or "Lead". Use this to find engagements that have specific types of contextual
        # information associated with them.
        @[JSON::Field(key: "ContextTypes")]
        getter context_types : Array(String)?

        # A list of AWS account IDs. When specified, the response includes engagements created by these
        # accounts. This filter is useful for finding engagements created by specific team members.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Array(String)?

        # An array of strings representing engagement identifiers to retrieve.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : Array(String)?

        # Filters engagements to exclude those containing the specified context types. Use this to find
        # engagements that do not have certain types of contextual information, helping to narrow results
        # based on context exclusion criteria.
        @[JSON::Field(key: "ExcludeContextTypes")]
        getter exclude_context_types : Array(String)?

        # An array of strings representing AWS Account IDs. Use this to exclude engagements created by
        # specific users.
        @[JSON::Field(key: "ExcludeCreatedBy")]
        getter exclude_created_by : Array(String)?

        # The maximum number of results to return in a single call.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. This value is returned from a previous call.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        @[JSON::Field(key: "Sort")]
        getter sort : Types::EngagementSort?

        def initialize(
          @catalog : String,
          @context_types : Array(String)? = nil,
          @created_by : Array(String)? = nil,
          @engagement_identifier : Array(String)? = nil,
          @exclude_context_types : Array(String)? = nil,
          @exclude_created_by : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort : Types::EngagementSort? = nil
        )
        end
      end

      struct ListEngagementsResponse
        include JSON::Serializable

        # An array of engagement summary objects.
        @[JSON::Field(key: "EngagementSummaryList")]
        getter engagement_summary_list : Array(Types::EngagementSummary)

        # The token to retrieve the next set of results. This field will be null if there are no more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @engagement_summary_list : Array(Types::EngagementSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListOpportunitiesRequest
        include JSON::Serializable

        # Specifies the catalog associated with the request. This field takes a string value from a predefined
        # list: AWS or Sandbox . The catalog determines which environment the opportunities are listed in. Use
        # AWS for listing real opportunities in the Amazon Web Services catalog, and Sandbox for testing in
        # secure, isolated environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Filters the opportunities based on the customer's company name. This allows partners to search for
        # opportunities associated with a specific customer by matching the provided company name string.
        @[JSON::Field(key: "CustomerCompanyName")]
        getter customer_company_name : Array(String)?

        # Filters the opportunities based on the opportunity identifier. This allows partners to retrieve
        # specific opportunities by providing their unique identifiers, ensuring precise results.
        @[JSON::Field(key: "Identifier")]
        getter identifier : Array(String)?

        # Filters the opportunities based on their last modified date. This filter helps retrieve
        # opportunities that were updated after the specified date, allowing partners to track recent changes
        # or updates.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Types::LastModifiedDate?

        # Filters the opportunities based on their current lifecycle approval status. Use this filter to
        # retrieve opportunities with statuses such as Pending Submission , In Review , Action Required , or
        # Approved .
        @[JSON::Field(key: "LifeCycleReviewStatus")]
        getter life_cycle_review_status : Array(String)?

        # Filters the opportunities based on their lifecycle stage. This filter allows partners to retrieve
        # opportunities at various stages in the sales cycle, such as Qualified , Technical Validation ,
        # Business Validation , or Closed Won .
        @[JSON::Field(key: "LifeCycleStage")]
        getter life_cycle_stage : Array(String)?

        # Specifies the maximum number of results to return in a single call. This limits the number of
        # opportunities returned in the response to avoid providing too many results at once. Default: 20
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A pagination token used to retrieve the next set of results in subsequent calls. This token is
        # included in the response only if there are additional result pages available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An object that specifies how the response is sorted. The default Sort.SortBy value is
        # LastModifiedDate .
        @[JSON::Field(key: "Sort")]
        getter sort : Types::OpportunitySort?

        def initialize(
          @catalog : String,
          @customer_company_name : Array(String)? = nil,
          @identifier : Array(String)? = nil,
          @last_modified_date : Types::LastModifiedDate? = nil,
          @life_cycle_review_status : Array(String)? = nil,
          @life_cycle_stage : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort : Types::OpportunitySort? = nil
        )
        end
      end

      struct ListOpportunitiesResponse
        include JSON::Serializable

        # An array that contains minimal details for opportunities that match the request criteria. This
        # summary view provides a quick overview of relevant opportunities.
        @[JSON::Field(key: "OpportunitySummaries")]
        getter opportunity_summaries : Array(Types::OpportunitySummary)

        # A pagination token used to retrieve the next set of results in subsequent calls. This token is
        # included in the response only if there are additional result pages available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @opportunity_summaries : Array(Types::OpportunitySummary),
          @next_token : String? = nil
        )
        end
      end

      # Provides a summary of a task related to creating an opportunity from an engagement. This structure
      # contains key information about the task's status, associated identifiers, and any failure details
      # for opportunity creation processes.
      struct ListOpportunityFromEngagementTaskSummary
        include JSON::Serializable

        # The unique identifier of the engagement context associated with the opportunity creation task. This
        # links the task to specific contextual information within the engagement.
        @[JSON::Field(key: "ContextId")]
        getter context_id : String?

        # The unique identifier of the engagement from which the opportunity is being created. This field
        # helps track the source of the opportunity creation task.
        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String?

        # A detailed message providing additional information about the task, especially useful in case of
        # failures. This field may contain error details or other relevant information about the task's
        # execution.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The unique identifier of the opportunity created as a result of the task. This field is populated
        # when the task is completed successfully.
        @[JSON::Field(key: "OpportunityId")]
        getter opportunity_id : String?

        # A code indicating the specific reason for a task failure. This field is populated when the task
        # status is FAILED and provides a categorized reason for the failure.
        @[JSON::Field(key: "ReasonCode")]
        getter reason_code : String?

        # The identifier of the resource snapshot job associated with this task, if a snapshot was created as
        # part of the opportunity creation process.
        @[JSON::Field(key: "ResourceSnapshotJobId")]
        getter resource_snapshot_job_id : String?

        # The timestamp indicating when the task was initiated, in RFC 3339 format.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The Amazon Resource Name (ARN) that uniquely identifies the task within AWS. This ARN can be used
        # for referencing the task in other AWS services or APIs.
        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The unique identifier of the task for creating an opportunity from an engagement.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        # The current status of the task. Valid values are COMPLETE, INPROGRESS, or FAILED.
        @[JSON::Field(key: "TaskStatus")]
        getter task_status : String?

        def initialize(
          @context_id : String? = nil,
          @engagement_id : String? = nil,
          @message : String? = nil,
          @opportunity_id : String? = nil,
          @reason_code : String? = nil,
          @resource_snapshot_job_id : String? = nil,
          @start_time : Time? = nil,
          @task_arn : String? = nil,
          @task_id : String? = nil,
          @task_status : String? = nil
        )
        end
      end

      struct ListOpportunityFromEngagementTasksRequest
        include JSON::Serializable

        # Specifies the catalog related to the request. Valid values are AWS for production environments and
        # Sandbox for testing or development purposes. The catalog determines which environment the task data
        # is retrieved from.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Filters tasks by the identifiers of the engagement contexts associated with the opportunity
        # creation. Use this to find tasks related to specific contextual information within engagements that
        # are being converted to opportunities.
        @[JSON::Field(key: "ContextIdentifier")]
        getter context_identifier : Array(String)?

        # Filters tasks by the identifiers of the engagements from which opportunities are being created. Use
        # this to find all opportunity creation tasks associated with a specific engagement.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : Array(String)?

        # Specifies the maximum number of results to return in a single page of the response. Use this
        # parameter to control the number of items returned in each request, which can be useful for
        # performance tuning and managing large result sets.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for requesting the next page of results. This value is obtained from the NextToken field
        # in the response of a previous call to this API. Use this parameter for pagination when the result
        # set spans multiple pages.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters tasks by the identifiers of the opportunities they created or are associated with. Use this
        # to find tasks related to specific opportunity creation processes.
        @[JSON::Field(key: "OpportunityIdentifier")]
        getter opportunity_identifier : Array(String)?

        @[JSON::Field(key: "Sort")]
        getter sort : Types::ListTasksSortBase?

        # Filters tasks by their unique identifiers. Use this when you want to retrieve information about
        # specific tasks. Provide the task ID to get details about a particular opportunity creation task.
        @[JSON::Field(key: "TaskIdentifier")]
        getter task_identifier : Array(String)?

        # Filters the tasks based on their current status. This allows you to focus on tasks in specific
        # states. Valid values are COMPLETE for tasks that have finished successfully, INPROGRESS for tasks
        # that are currently running, and FAILED for tasks that have encountered an error and failed to
        # complete.
        @[JSON::Field(key: "TaskStatus")]
        getter task_status : Array(String)?

        def initialize(
          @catalog : String,
          @context_identifier : Array(String)? = nil,
          @engagement_identifier : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @opportunity_identifier : Array(String)? = nil,
          @sort : Types::ListTasksSortBase? = nil,
          @task_identifier : Array(String)? = nil,
          @task_status : Array(String)? = nil
        )
        end
      end

      struct ListOpportunityFromEngagementTasksResponse
        include JSON::Serializable

        # A token used for pagination to retrieve the next page of results. If there are more results
        # available, this field will contain a token that can be used in a subsequent API call to retrieve the
        # next page. If there are no more results, this field will be null or an empty string.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of ListOpportunityFromEngagementTaskSummary objects, each representing a task that matches
        # the specified filters. The array may be empty if no tasks match the criteria.
        @[JSON::Field(key: "TaskSummaries")]
        getter task_summaries : Array(Types::ListOpportunityFromEngagementTaskSummary)?

        def initialize(
          @next_token : String? = nil,
          @task_summaries : Array(Types::ListOpportunityFromEngagementTaskSummary)? = nil
        )
        end
      end

      struct ListResourceSnapshotJobsRequest
        include JSON::Serializable

        # Specifies the catalog related to the request.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The identifier of the engagement to filter the response.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : String?

        # The maximum number of results to return in a single call. If omitted, defaults to 50.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Configures the sorting of the response. If omitted, results are sorted by CreatedDate in descending
        # order.
        @[JSON::Field(key: "Sort")]
        getter sort : Types::SortObject?

        # The status of the jobs to filter the response.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @catalog : String,
          @engagement_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort : Types::SortObject? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListResourceSnapshotJobsResponse
        include JSON::Serializable

        # An array of resource snapshot job summary objects.
        @[JSON::Field(key: "ResourceSnapshotJobSummaries")]
        getter resource_snapshot_job_summaries : Array(Types::ResourceSnapshotJobSummary)

        # The token to retrieve the next set of results. If there are no additional results, this value is
        # null.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_snapshot_job_summaries : Array(Types::ResourceSnapshotJobSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceSnapshotsRequest
        include JSON::Serializable

        # Specifies the catalog related to the request.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the engagement associated with the snapshots.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : String

        # Filters the response to include only snapshots of resources owned by the specified AWS account.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The maximum number of results to return in a single call.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters the response to include only snapshots of the specified resource.
        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        # Filters the response to include only snapshots created using the specified template.
        @[JSON::Field(key: "ResourceSnapshotTemplateIdentifier")]
        getter resource_snapshot_template_identifier : String?

        # Filters the response to include only snapshots of the specified resource type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @catalog : String,
          @engagement_identifier : String,
          @created_by : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_identifier : String? = nil,
          @resource_snapshot_template_identifier : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct ListResourceSnapshotsResponse
        include JSON::Serializable

        # An array of resource snapshot summary objects.
        @[JSON::Field(key: "ResourceSnapshotSummaries")]
        getter resource_snapshot_summaries : Array(Types::ResourceSnapshotSummary)

        # The token to retrieve the next set of results. If there are no additional results, this value is
        # null.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_snapshot_summaries : Array(Types::ResourceSnapshotSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListSolutionsRequest
        include JSON::Serializable

        # Specifies the catalog associated with the request. This field takes a string value from a predefined
        # list: AWS or Sandbox . The catalog determines which environment the solutions are listed in. Use AWS
        # to list solutions in the Amazon Web Services catalog, and Sandbox to list solutions in a secure and
        # isolated testing environment.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Filters the solutions based on the category to which they belong. This allows partners to search for
        # solutions within specific categories, such as Software , Consulting , or Managed Services .
        @[JSON::Field(key: "Category")]
        getter category : Array(String)?

        # Filters the solutions based on their unique identifier. Use this filter to retrieve specific
        # solutions by providing the solution's identifier for accurate results.
        @[JSON::Field(key: "Identifier")]
        getter identifier : Array(String)?

        # The maximum number of results returned by a single call. This value must be provided in the next
        # call to retrieve the next set of results. Default: 20
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A pagination token used to retrieve the next set of results in subsequent calls. This token is
        # included in the response only if there are additional result pages available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Object that configures sorting done on the response. Default Sort.SortBy is Identifier .
        @[JSON::Field(key: "Sort")]
        getter sort : Types::SolutionSort?

        # Filters solutions based on their status. This filter helps partners manage their solution portfolios
        # effectively.
        @[JSON::Field(key: "Status")]
        getter status : Array(String)?

        def initialize(
          @catalog : String,
          @category : Array(String)? = nil,
          @identifier : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort : Types::SolutionSort? = nil,
          @status : Array(String)? = nil
        )
        end
      end

      struct ListSolutionsResponse
        include JSON::Serializable

        # An array with minimal details for solutions matching the request criteria.
        @[JSON::Field(key: "SolutionSummaries")]
        getter solution_summaries : Array(Types::SolutionBase)

        # A pagination token used to retrieve the next set of results in subsequent calls. This token is
        # included in the response only if there are additional result pages available.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @solution_summaries : Array(Types::SolutionBase),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which you want to retrieve tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A map of the key-value pairs for the tag or tags assigned to the specified resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @tags : Array(Types::Tag)
        )
        end
      end

      # Defines the sorting parameters for listing tasks. This structure allows for specifying the field to
      # sort by and the order of sorting.
      struct ListTasksSortBase
        include JSON::Serializable

        # Specifies the field by which the task list should be sorted.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String

        # Determines the order in which the sorted results are presented.
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String

        def initialize(
          @sort_by : String,
          @sort_order : String
        )
        end
      end

      # An object that contains marketing details for the Opportunity .
      struct Marketing
        include JSON::Serializable

        # Indicates if the Opportunity is a marketing development fund (MDF) funded activity.
        @[JSON::Field(key: "AwsFundingUsed")]
        getter aws_funding_used : String?

        # Specifies the Opportunity marketing campaign code. The Amazon Web Services campaign code is a
        # reference to specific marketing initiatives, promotions, or activities. This field captures the
        # identifier used to track and categorize the Opportunity within marketing campaigns. If you don't
        # have a campaign code, contact your Amazon Web Services point of contact to obtain one.
        @[JSON::Field(key: "CampaignName")]
        getter campaign_name : String?

        # Specifies the Opportunity 's channel that the marketing activity is associated with or was contacted
        # through. This field provides information about the specific marketing channel that contributed to
        # the generation of the lead or contact.
        @[JSON::Field(key: "Channels")]
        getter channels : Array(String)?

        # Indicates if the Opportunity was sourced from an Amazon Web Services marketing activity. Use the
        # value Marketing Activity . Use None if it's not associated with an Amazon Web Services marketing
        # activity. This field helps Amazon Web Services track the return on marketing investments and enables
        # better distribution of marketing budgets among partners.
        @[JSON::Field(key: "Source")]
        getter source : String?

        # Specifies the marketing activity use case or purpose that led to the Opportunity 's creation or
        # contact. This field captures the context or marketing activity's execution's intention and the
        # direct correlation to the generated opportunity or contact. Must be empty when
        # Marketing.AWSFundingUsed = No . Valid values: AI/ML | Analytics | Application Integration |
        # Blockchain | Business Applications | Cloud Financial Management | Compute | Containers | Customer
        # Engagement | Databases | Developer Tools | End User Computing | Front End Web &amp; Mobile | Game
        # Tech | IoT | Management &amp; Governance | Media Services | Migration &amp; Transfer | Networking
        # &amp; Content Delivery | Quantum Technologies | Robotics | Satellite | Security | Serverless |
        # Storage | VR &amp; AR
        @[JSON::Field(key: "UseCases")]
        getter use_cases : Array(String)?

        def initialize(
          @aws_funding_used : String? = nil,
          @campaign_name : String? = nil,
          @channels : Array(String)? = nil,
          @source : String? = nil,
          @use_cases : Array(String)? = nil
        )
        end
      end

      # Specifies payments details.
      struct MonetaryValue
        include JSON::Serializable

        # Specifies the payment amount.
        @[JSON::Field(key: "Amount")]
        getter amount : String

        # Specifies the payment currency.
        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String

        def initialize(
          @amount : String,
          @currency_code : String
        )
        end
      end

      # Read-only; shows the last 50 values and change dates for the NextSteps field.
      struct NextStepsHistory
        include JSON::Serializable

        # Indicates the step execution time.
        @[JSON::Field(key: "Time", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter time : Time

        # Indicates the step's execution details.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @time : Time,
          @value : String
        )
        end
      end

      # Defines sorting options for retrieving Engagement Invitations. Sorting can be done based on various
      # criteria like the invitation date or status.
      struct OpportunityEngagementInvitationSort
        include JSON::Serializable

        # Specifies the field by which the Engagement Invitations are sorted. Common values include
        # InvitationDate and Status .
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String

        # Defines the order in which the Engagement Invitations are sorted. The values can be ASC (ascending)
        # or DESC (descending).
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String

        def initialize(
          @sort_by : String,
          @sort_order : String
        )
        end
      end

      # Represents the data payload of an Engagement Invitation for a specific opportunity. This contains
      # detailed information that partners use to evaluate the engagement.
      struct OpportunityInvitationPayload
        include JSON::Serializable

        # Contains information about the customer related to the opportunity in the Engagement Invitation.
        # This data helps partners understand the customer’s profile and requirements.
        @[JSON::Field(key: "Customer")]
        getter customer : Types::EngagementCustomer

        # Describes the project details associated with the opportunity, including the customer’s needs and
        # the scope of work expected to be performed.
        @[JSON::Field(key: "Project")]
        getter project : Types::ProjectDetails

        # Outlines the responsibilities or expectations of the receiver in the context of the invitation.
        @[JSON::Field(key: "ReceiverResponsibilities")]
        getter receiver_responsibilities : Array(String)

        # Represents the contact details of the AWS representatives involved in sending the Engagement
        # Invitation. These contacts are opportunity stakeholders.
        @[JSON::Field(key: "SenderContacts")]
        getter sender_contacts : Array(Types::SenderContact)?

        def initialize(
          @customer : Types::EngagementCustomer,
          @project : Types::ProjectDetails,
          @receiver_responsibilities : Array(String),
          @sender_contacts : Array(Types::SenderContact)? = nil
        )
        end
      end

      # Object that configures response sorting.
      struct OpportunitySort
        include JSON::Serializable

        # Field name to sort by.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String

        # Sort order. Default: Descending
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String

        def initialize(
          @sort_by : String,
          @sort_order : String
        )
        end
      end

      # An object that contains an Opportunity 's subset of fields.
      struct OpportunitySummary
        include JSON::Serializable

        # Specifies the catalog associated with the opportunity, either AWS or Sandbox . This indicates the
        # environment in which the opportunity is managed.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The Amazon Resource Name (ARN) for the opportunity. This globally unique identifier can be used for
        # IAM policies and cross-service references.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # DateTime when the Opportunity was last created.
        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # An object that contains the Opportunity 's customer details.
        @[JSON::Field(key: "Customer")]
        getter customer : Types::CustomerSummary?

        # Read-only, system-generated Opportunity unique identifier.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # DateTime when the Opportunity was last modified.
        @[JSON::Field(key: "LastModifiedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # An object that contains the Opportunity 's lifecycle details.
        @[JSON::Field(key: "LifeCycle")]
        getter life_cycle : Types::LifeCycleSummary?

        # Specifies opportunity type as a renewal, new, or expansion. Opportunity types: New Opportunity:
        # Represents a new business opportunity with a potential customer that's not previously engaged with
        # your solutions or services. Renewal Opportunity: Represents an opportunity to renew an existing
        # contract or subscription with a current customer, ensuring continuity of service. Expansion
        # Opportunity: Represents an opportunity to expand the scope of an existing contract or subscription,
        # either by adding new services or increasing the volume of existing services for a current customer.
        @[JSON::Field(key: "OpportunityType")]
        getter opportunity_type : String?

        # Specifies the Opportunity 's unique identifier in the partner's CRM system. This value is essential
        # to track and reconcile because it's included in the outbound payload sent back to the partner. It
        # allows partners to link an opportunity to their CRM.
        @[JSON::Field(key: "PartnerOpportunityIdentifier")]
        getter partner_opportunity_identifier : String?

        # An object that contains the Opportunity 's project details summary.
        @[JSON::Field(key: "Project")]
        getter project : Types::ProjectSummary?

        def initialize(
          @catalog : String,
          @arn : String? = nil,
          @created_date : Time? = nil,
          @customer : Types::CustomerSummary? = nil,
          @id : String? = nil,
          @last_modified_date : Time? = nil,
          @life_cycle : Types::LifeCycleSummary? = nil,
          @opportunity_type : String? = nil,
          @partner_opportunity_identifier : String? = nil,
          @project : Types::ProjectSummary? = nil
        )
        end
      end

      # Provides a comprehensive view of an opportunity summary, including lifecycle information, team
      # details, opportunity type, primary needs from AWS, and associated project information.
      struct OpportunitySummaryView
        include JSON::Serializable

        @[JSON::Field(key: "Customer")]
        getter customer : Types::Customer?

        # Contains information about the opportunity's lifecycle, including its current stage, status, and
        # important dates such as creation and last modification times.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : Types::LifeCycleForView?

        # Represents the internal team handling the opportunity. Specify the members involved in collaborating
        # on an opportunity within the partner's organization.
        @[JSON::Field(key: "OpportunityTeam")]
        getter opportunity_team : Array(Types::Contact)?

        # Specifies the opportunity type.
        @[JSON::Field(key: "OpportunityType")]
        getter opportunity_type : String?

        # Identifies the type of support the partner needs from AWS.
        @[JSON::Field(key: "PrimaryNeedsFromAws")]
        getter primary_needs_from_aws : Array(String)?

        # Contains summary information about the project associated with the opportunity, including project
        # name, description, timeline, and other relevant details.
        @[JSON::Field(key: "Project")]
        getter project : Types::ProjectView?

        @[JSON::Field(key: "RelatedEntityIdentifiers")]
        getter related_entity_identifiers : Types::RelatedEntityIdentifiers?

        def initialize(
          @customer : Types::Customer? = nil,
          @lifecycle : Types::LifeCycleForView? = nil,
          @opportunity_team : Array(Types::Contact)? = nil,
          @opportunity_type : String? = nil,
          @primary_needs_from_aws : Array(String)? = nil,
          @project : Types::ProjectView? = nil,
          @related_entity_identifiers : Types::RelatedEntityIdentifiers? = nil
        )
        end
      end

      # Contains the data payload associated with the Engagement Invitation. This payload includes essential
      # details related to the AWS opportunity and is used by partners to evaluate whether to accept or
      # reject the engagement.
      struct Payload
        include JSON::Serializable

        # Specifies the details of the lead invitation within the Engagement Invitation payload. This data
        # helps partners understand the lead context, customer information, and interaction history for the
        # lead opportunity from AWS.
        @[JSON::Field(key: "LeadInvitation")]
        getter lead_invitation : Types::LeadInvitationPayload?

        # Specifies the details of the opportunity invitation within the Engagement Invitation payload. This
        # data helps partners understand the context, scope, and expected involvement for the opportunity from
        # AWS.
        @[JSON::Field(key: "OpportunityInvitation")]
        getter opportunity_invitation : Types::OpportunityInvitationPayload?

        def initialize(
          @lead_invitation : Types::LeadInvitationPayload? = nil,
          @opportunity_invitation : Types::OpportunityInvitationPayload? = nil
        )
        end
      end

      # Tracks the history of next steps associated with the opportunity. This field captures the actions
      # planned for the future and their timeline.
      struct ProfileNextStepsHistory
        include JSON::Serializable

        # Indicates the date and time when a particular next step was recorded or planned. This helps in
        # managing the timeline for the opportunity.
        @[JSON::Field(key: "Time", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter time : Time

        # Represents the details of the next step recorded, such as follow-up actions or decisions made. This
        # field helps in tracking progress and ensuring alignment with project goals.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @time : Time,
          @value : String
        )
        end
      end

      # An object that contains the Opportunity 's project details.
      struct Project
        include JSON::Serializable

        # Captures additional comments or information for the Opportunity that weren't captured in other
        # fields.
        @[JSON::Field(key: "AdditionalComments")]
        getter additional_comments : String?

        # Specifies the Amazon Partner Network (APN) program that influenced the Opportunity . APN programs
        # refer to specific partner programs or initiatives that can impact the Opportunity . Valid values:
        # APN Immersion Days | APN Solution Space | ATO (Authority to Operate) | AWS Marketplace Campaign | IS
        # Immersion Day SFID Program | ISV Workload Migration | Migration Acceleration Program | P3 | Partner
        # Launch Initiative | Partner Opportunity Acceleration Funded | The Next Smart | VMware Cloud on AWS |
        # Well-Architected | Windows | Workspaces/AppStream Accelerator Program | WWPS NDPP
        @[JSON::Field(key: "ApnPrograms")]
        getter apn_programs : Array(String)?

        # AWS partition where the opportunity will be deployed. Possible values: 'aws-eusc' for AWS European
        # Sovereign Cloud, null for all other partitions
        @[JSON::Field(key: "AwsPartition")]
        getter aws_partition : String?

        # Name of the Opportunity 's competitor (if any). Use Other to submit a value not in the picklist.
        @[JSON::Field(key: "CompetitorName")]
        getter competitor_name : String?

        # Describes the problem the end customer has, and how the partner is helping. Utilize this field to
        # provide a concise narrative that outlines the customer's business challenge or issue. Elaborate on
        # how the partner's solution or offerings align to resolve the customer's business problem. Include
        # relevant information about the partner's value proposition, unique selling points, and expertise to
        # tackle the issue. Offer insights on how the proposed solution meets the customer's needs and
        # provides value. Use concise language and precise descriptions to convey the context and significance
        # of the Opportunity . The content in this field helps Amazon Web Services understand the nature of
        # the Opportunity and the strategic fit of the partner's solution.
        @[JSON::Field(key: "CustomerBusinessProblem")]
        getter customer_business_problem : String?

        # Specifies the proposed solution focus or type of workload for the Opportunity. This field captures
        # the primary use case or objective of the proposed solution, and provides context and clarity to the
        # addressed workload. Valid values: AI Machine Learning and Analytics | Archiving | Big Data: Data
        # Warehouse/Data Integration/ETL/Data Lake/BI | Blockchain | Business Applications: Mainframe
        # Modernization | Business Applications &amp; Contact Center | Business Applications &amp; SAP
        # Production | Centralized Operations Management | Cloud Management Tools | Cloud Management Tools
        # &amp; DevOps with Continuous Integration &amp; Continuous Delivery (CICD) | Configuration,
        # Compliance &amp; Auditing | Connected Services | Containers &amp; Serverless | Content Delivery
        # &amp; Edge Services | Database | Edge Computing/End User Computing | Energy | Enterprise Governance
        # &amp; Controls | Enterprise Resource Planning | Financial Services | Healthcare and Life Sciences |
        # High Performance Computing | Hybrid Application Platform | Industrial Software | IOT |
        # Manufacturing, Supply Chain and Operations | Media &amp; High performance computing (HPC) |
        # Migration/Database Migration | Monitoring, logging and performance | Monitoring &amp; Observability
        # | Networking | Outpost | SAP | Security &amp; Compliance | Storage &amp; Backup | Training | VMC |
        # VMWare | Web development &amp; DevOps
        @[JSON::Field(key: "CustomerUseCase")]
        getter customer_use_case : String?

        # Specifies the deployment or consumption model for your solution or service in the Opportunity 's
        # context. You can select multiple options. Options' descriptions from the Delivery Model field are:
        # SaaS or PaaS: Your Amazon Web Services based solution deployed as SaaS or PaaS in your Amazon Web
        # Services environment. BYOL or AMI: Your Amazon Web Services based solution deployed as BYOL or AMI
        # in the end customer's Amazon Web Services environment. Managed Services: The end customer's Amazon
        # Web Services business management (For example: Consulting, design, implementation, billing support,
        # cost optimization, technical support). Professional Services: Offerings to help enterprise end
        # customers achieve specific business outcomes for enterprise cloud adoption (For example: Advisory or
        # transformation planning). Resell: Amazon Web Services accounts and billing management for your
        # customers. Other: Delivery model not described above.
        @[JSON::Field(key: "DeliveryModels")]
        getter delivery_models : Array(String)?

        # Represents the estimated amount that the customer is expected to spend on AWS services related to
        # the opportunity. This helps in evaluating the potential financial value of the opportunity for AWS.
        @[JSON::Field(key: "ExpectedCustomerSpend")]
        getter expected_customer_spend : Array(Types::ExpectedCustomerSpend)?

        # Only allowed when CompetitorNames has Other selected.
        @[JSON::Field(key: "OtherCompetitorNames")]
        getter other_competitor_names : String?

        # Specifies the offered solution for the customer's business problem when the
        # RelatedEntityIdentifiers.Solutions field value is Other .
        @[JSON::Field(key: "OtherSolutionDescription")]
        getter other_solution_description : String?

        # Specifies the current opportunity's parent opportunity identifier.
        @[JSON::Field(key: "RelatedOpportunityIdentifier")]
        getter related_opportunity_identifier : String?

        # Specifies the Opportunity 's sales activities conducted with the end customer. These activities help
        # drive Amazon Web Services assignment priority. Valid values: Initialized discussions with customer:
        # Initial conversations with the customer to understand their needs and introduce your solution.
        # Customer has shown interest in solution: After initial discussions, the customer is interested in
        # your solution. Conducted POC/demo: You conducted a proof of concept (POC) or demonstration of the
        # solution for the customer. In evaluation/planning stage: The customer is evaluating the solution and
        # planning potential implementation. Agreed on solution to Business Problem: Both parties agree on how
        # the solution addresses the customer's business problem. Completed Action Plan: A detailed action
        # plan is complete and outlines the steps for implementation. Finalized Deployment Need: Both parties
        # agree with and finalized the deployment needs. SOW Signed: Both parties signed a statement of work
        # (SOW), and formalize the agreement and detail the project scope and deliverables.
        @[JSON::Field(key: "SalesActivities")]
        getter sales_activities : Array(String)?

        # Specifies the Opportunity 's title or name.
        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @additional_comments : String? = nil,
          @apn_programs : Array(String)? = nil,
          @aws_partition : String? = nil,
          @competitor_name : String? = nil,
          @customer_business_problem : String? = nil,
          @customer_use_case : String? = nil,
          @delivery_models : Array(String)? = nil,
          @expected_customer_spend : Array(Types::ExpectedCustomerSpend)? = nil,
          @other_competitor_names : String? = nil,
          @other_solution_description : String? = nil,
          @related_opportunity_identifier : String? = nil,
          @sales_activities : Array(String)? = nil,
          @title : String? = nil
        )
        end
      end

      # Contains details about the project associated with the Engagement Invitation, including the business
      # problem and expected outcomes.
      struct ProjectDetails
        include JSON::Serializable

        # Describes the business problem that the project aims to solve. This information is crucial for
        # understanding the project’s goals and objectives.
        @[JSON::Field(key: "BusinessProblem")]
        getter business_problem : String

        # Contains revenue estimates for the partner related to the project. This field provides an idea of
        # the financial potential of the opportunity for the partner.
        @[JSON::Field(key: "ExpectedCustomerSpend")]
        getter expected_customer_spend : Array(Types::ExpectedCustomerSpend)

        # Specifies the estimated date of project completion. This field helps track the project timeline and
        # manage expectations.
        @[JSON::Field(key: "TargetCompletionDate")]
        getter target_completion_date : String

        # Specifies the title of the project. This title helps partners quickly identify and understand the
        # focus of the project.
        @[JSON::Field(key: "Title")]
        getter title : String

        def initialize(
          @business_problem : String,
          @expected_customer_spend : Array(Types::ExpectedCustomerSpend),
          @target_completion_date : String,
          @title : String
        )
        end
      end

      # An object that contains a Project object's subset of fields.
      struct ProjectSummary
        include JSON::Serializable

        # Specifies your solution or service's deployment or consumption model in the Opportunity 's context.
        # You can select multiple options. Options' descriptions from the Delivery Model field are: SaaS or
        # PaaS: Your Amazon Web Services based solution deployed as SaaS or PaaS in your Amazon Web Services
        # environment. BYOL or AMI: Your Amazon Web Services based solution deployed as BYOL or AMI in the end
        # customer's Amazon Web Services environment. Managed Services: The end customer's Amazon Web Services
        # business management (For example: Consulting, design, implementation, billing support, cost
        # optimization, technical support). Professional Services: Offerings to help enterprise end customers
        # achieve specific business outcomes for enterprise cloud adoption (For example: Advisory or
        # transformation planning). Resell: Amazon Web Services accounts and billing management for your
        # customers. Other: Delivery model not described above.
        @[JSON::Field(key: "DeliveryModels")]
        getter delivery_models : Array(String)?

        # Provides a summary of the expected customer spend for the project, offering a high-level view of the
        # potential financial impact.
        @[JSON::Field(key: "ExpectedCustomerSpend")]
        getter expected_customer_spend : Array(Types::ExpectedCustomerSpend)?

        def initialize(
          @delivery_models : Array(String)? = nil,
          @expected_customer_spend : Array(Types::ExpectedCustomerSpend)? = nil
        )
        end
      end

      # Provides the project view of an opportunity resource shared through a snapshot.
      struct ProjectView
        include JSON::Serializable

        # Specifies the proposed solution focus or type of workload for the project.
        @[JSON::Field(key: "CustomerUseCase")]
        getter customer_use_case : String?

        # Describes the deployment or consumption model for the partner solution or offering. This field
        # indicates how the project's solution will be delivered or implemented for the customer.
        @[JSON::Field(key: "DeliveryModels")]
        getter delivery_models : Array(String)?

        # Provides information about the anticipated customer spend related to this project. This may include
        # details such as amount, frequency, and currency of expected expenditure.
        @[JSON::Field(key: "ExpectedCustomerSpend")]
        getter expected_customer_spend : Array(Types::ExpectedCustomerSpend)?

        # Offers a description of other solutions if the standard solutions do not adequately cover the
        # project's scope.
        @[JSON::Field(key: "OtherSolutionDescription")]
        getter other_solution_description : String?

        # Lists the pre-sales activities that have occurred with the end-customer related to the opportunity.
        # This field is conditionally mandatory when the project is qualified for Co-Sell and helps drive
        # assignment priority on the AWS side. It provides insight into the engagement level with the
        # customer.
        @[JSON::Field(key: "SalesActivities")]
        getter sales_activities : Array(String)?

        def initialize(
          @customer_use_case : String? = nil,
          @delivery_models : Array(String)? = nil,
          @expected_customer_spend : Array(Types::ExpectedCustomerSpend)? = nil,
          @other_solution_description : String? = nil,
          @sales_activities : Array(String)? = nil
        )
        end
      end

      struct PutSellingSystemSettingsRequest
        include JSON::Serializable

        # Specifies the catalog in which the settings will be updated. Acceptable values include AWS for
        # production and Sandbox for testing environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Specifies the ARN of the IAM Role used for resource snapshot job executions.
        @[JSON::Field(key: "ResourceSnapshotJobRoleIdentifier")]
        getter resource_snapshot_job_role_identifier : String?

        def initialize(
          @catalog : String,
          @resource_snapshot_job_role_identifier : String? = nil
        )
        end
      end

      struct PutSellingSystemSettingsResponse
        include JSON::Serializable

        # Specifies the catalog in which the settings are defined. Acceptable values include AWS for
        # production and Sandbox for testing environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Specifies the ARN of the IAM Role used for resource snapshot job executions.
        @[JSON::Field(key: "ResourceSnapshotJobRoleArn")]
        getter resource_snapshot_job_role_arn : String?

        def initialize(
          @catalog : String,
          @resource_snapshot_job_role_arn : String? = nil
        )
        end
      end

      # Represents the entity that received the Engagement Invitation, including account and company
      # details. This field is essential for tracking the partner who is being invited to collaborate.
      struct Receiver
        include JSON::Serializable

        # Specifies the AWS account of the partner who received the Engagement Invitation. This field is used
        # to track the invitation recipient within the AWS ecosystem.
        @[JSON::Field(key: "Account")]
        getter account : Types::AccountReceiver?

        def initialize(
          @account : Types::AccountReceiver? = nil
        )
        end
      end

      struct RejectEngagementInvitationRequest
        include JSON::Serializable

        # This is the catalog that's associated with the engagement invitation. Acceptable values are AWS or
        # Sandbox , and these values determine the environment in which the opportunity is managed.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # This is the unique identifier of the rejected EngagementInvitation . Providing the correct
        # identifier helps to ensure that the intended invitation is rejected.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # This describes the reason for rejecting the engagement invitation, which helps AWS track usage
        # patterns. Acceptable values include the following: Customer problem unclear: The customer's problem
        # isn't understood. Next steps unclear: The next steps required to proceed aren't understood. Unable
        # to support: The partner is unable to provide support due to resource or capability constraints.
        # Duplicate of partner referral: The opportunity is a duplicate of an existing referral. Other: Any
        # reason not covered by other values.
        @[JSON::Field(key: "RejectionReason")]
        getter rejection_reason : String?

        def initialize(
          @catalog : String,
          @identifier : String,
          @rejection_reason : String? = nil
        )
        end
      end

      # This field provides the associations' information for other entities with the opportunity. These
      # entities include identifiers for AWSProducts , Partner Solutions , and AWSMarketplaceOffers .
      struct RelatedEntityIdentifiers
        include JSON::Serializable

        # Enables the association of AWS Marketplace offer sets with the Opportunity . Offer sets allow
        # grouping multiple related marketplace offers together for comprehensive solution packaging. Each
        # value is an Amazon Resource Name (ARN) in this format:
        # arn:aws:aws-marketplace:us-east-1:999999999999:AWSMarketplace/OfferSet/offerset-sampleOfferSet32 .
        @[JSON::Field(key: "AwsMarketplaceOfferSets")]
        getter aws_marketplace_offer_sets : Array(String)?

        # Takes one value per opportunity. Each value is an Amazon Resource Name (ARN), in this format:
        # "offers":
        # ["arn:aws:aws-marketplace:us-east-1:999999999999:AWSMarketplace/Offer/offer-sampleOffer32"] . Use
        # the ListEntities action in the Marketplace Catalog APIs for a list of offers in the associated
        # Marketplace seller account.
        @[JSON::Field(key: "AwsMarketplaceOffers")]
        getter aws_marketplace_offers : Array(String)?

        # Enables the association of specific Amazon Web Services products with the Opportunity . Partners can
        # indicate the relevant Amazon Web Services products for the Opportunity 's solution and align with
        # the customer's needs. Returns multiple values separated by commas. For example, "AWSProducts" :
        # ["AmazonRedshift", "AWSAppFabric", "AWSCleanRooms"] . Use the file with the list of Amazon Web
        # Services products hosted on GitHub: Amazon Web Services products .
        @[JSON::Field(key: "AwsProducts")]
        getter aws_products : Array(String)?

        # Enables partner solutions or offerings' association with an opportunity. To associate a solution,
        # provide the solution's unique identifier, which you can obtain with the ListSolutions operation. If
        # the specific solution identifier is not available, you can use the value Other and provide details
        # about the solution in the otherSolutionOffered field. But when the opportunity reaches the Committed
        # stage or beyond, the Other value cannot be used, and a valid solution identifier must be provided.
        # By associating the relevant solutions with the opportunity, you can communicate the offerings that
        # are being considered or implemented to address the customer's business problem.
        @[JSON::Field(key: "Solutions")]
        getter solutions : Array(String)?

        def initialize(
          @aws_marketplace_offer_sets : Array(String)? = nil,
          @aws_marketplace_offers : Array(String)? = nil,
          @aws_products : Array(String)? = nil,
          @solutions : Array(String)? = nil
        )
        end
      end

      # This error occurs when the specified resource can't be found. The resource might not exist, or isn't
      # visible with the current credentials. Suggested action: Verify that the resource ID is correct and
      # the resource is in the expected AWS region. Check IAM permissions for accessing the resource.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that contains a Resource Snapshot Job 's subset of fields.
      struct ResourceSnapshotJobSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the resource snapshot job.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier of the Engagement.
        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String?

        # The unique identifier for the resource snapshot job within the AWS Partner Central system. This ID
        # is used for direct references to the job within the service.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The current status of the snapshot job. Valid values: STOPPED: The job is not currently running.
        # RUNNING: The job is actively executing.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @engagement_id : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Represents the payload of a resource snapshot. This structure is designed to accommodate different
      # types of resource snapshots, currently supporting opportunity summaries.
      struct ResourceSnapshotPayload
        include JSON::Serializable

        # An object that contains an opportunity 's subset of fields.
        @[JSON::Field(key: "OpportunitySummary")]
        getter opportunity_summary : Types::OpportunitySummaryView?

        def initialize(
          @opportunity_summary : Types::OpportunitySummaryView? = nil
        )
        end
      end

      # Provides a concise summary of a resource snapshot, including its unique identifier and version
      # information. This structure is used to quickly reference and identify specific versions of resource
      # snapshots.
      struct ResourceSnapshotSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the snapshot. This globally unique identifier can be used for
        # cross-service references and in IAM policies.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The AWS account ID of the entity that owns the resource from which the snapshot was created.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The identifier of the specific resource snapshotted. The format might vary depending on the
        # ResourceType.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The name of the template used to create the snapshot.
        @[JSON::Field(key: "ResourceSnapshotTemplateName")]
        getter resource_snapshot_template_name : String?

        # The type of resource snapshotted.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The revision number of the snapshot. This integer value is incremented each time the snapshot is
        # updated, allowing for version tracking of the resource snapshot.
        @[JSON::Field(key: "Revision")]
        getter revision : Int32?

        def initialize(
          @arn : String? = nil,
          @created_by : String? = nil,
          @resource_id : String? = nil,
          @resource_snapshot_template_name : String? = nil,
          @resource_type : String? = nil,
          @revision : Int32? = nil
        )
        end
      end

      # An object that contains the details of the sender-provided contact person for the
      # EngagementInvitation .
      struct SenderContact
        include JSON::Serializable

        # The sender-provided contact's email address associated with the EngagementInvitation .
        @[JSON::Field(key: "Email")]
        getter email : String

        # The sender-provided contact's title (job title or role) associated with the EngagementInvitation .
        @[JSON::Field(key: "BusinessTitle")]
        getter business_title : String?

        # The sender-provided contact's last name associated with the EngagementInvitation .
        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # The sender-provided contact's first name associated with the EngagementInvitation .
        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # The sender-provided contact's phone number associated with the EngagementInvitation .
        @[JSON::Field(key: "Phone")]
        getter phone : String?

        def initialize(
          @email : String,
          @business_title : String? = nil,
          @first_name : String? = nil,
          @last_name : String? = nil,
          @phone : String? = nil
        )
        end
      end

      # This error occurs when the request would cause a service quota to be exceeded. Service quotas
      # represent the maximum allowed use of a specific resource, and this error indicates that the request
      # would surpass that limit. Suggested action: Review the Quotas for the resource, and either reduce
      # usage or request a quota increase.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies a customer's procurement terms details. Required only for partners in eligible programs.
      struct SoftwareRevenue
        include JSON::Serializable

        # Specifies the customer's intended payment type agreement or procurement method to acquire the
        # solution or service outlined in the Opportunity .
        @[JSON::Field(key: "DeliveryModel")]
        getter delivery_model : String?

        # Specifies the Opportunity 's customer engagement start date for the contract's effectiveness.
        @[JSON::Field(key: "EffectiveDate")]
        getter effective_date : String?

        # Specifies the expiration date for the contract between the customer and Amazon Web Services partner.
        # It signifies the termination date of the agreed-upon engagement period between both parties.
        @[JSON::Field(key: "ExpirationDate")]
        getter expiration_date : String?

        # Specifies the payment value (amount and currency).
        @[JSON::Field(key: "Value")]
        getter value : Types::MonetaryValue?

        def initialize(
          @delivery_model : String? = nil,
          @effective_date : String? = nil,
          @expiration_date : String? = nil,
          @value : Types::MonetaryValue? = nil
        )
        end
      end

      # Specifies minimal information for the solution offered to solve the customer's business problem.
      struct SolutionBase
        include JSON::Serializable

        # Specifies the catalog in which the solution is hosted, either AWS or Sandbox . This helps partners
        # differentiate between live solutions and those in testing environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Specifies the solution category, which helps to categorize and organize the solutions partners
        # offer. Valid values: Software Product | Consulting Service | Hardware Product | Communications
        # Product | Professional Service | Managed Service | Value-Added Resale Amazon Web Services Service |
        # Distribution Service | Training Service | Merger and Acquisition Advising Service .
        @[JSON::Field(key: "Category")]
        getter category : String

        # Indicates the solution creation date. This is useful to track and audit.
        @[JSON::Field(key: "CreatedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # Enables the association of solutions (offerings) to opportunities.
        @[JSON::Field(key: "Id")]
        getter id : String

        # Specifies the solution name.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies the solution's current status, which indicates its state in the system. Valid values:
        # Active | Inactive | Draft . The status helps partners and Amazon Web Services track the solution's
        # lifecycle and availability. Filter for Active solutions for association to an opportunity.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The SolutionBase structure provides essential information about a solution.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @catalog : String,
          @category : String,
          @created_date : Time,
          @id : String,
          @name : String,
          @status : String,
          @arn : String? = nil
        )
        end
      end

      # Configures the solutions' response sorting that enables partners to order solutions based on
      # specified attributes.
      struct SolutionSort
        include JSON::Serializable

        # Specifies the attribute to sort by, such as Name , CreatedDate , or Status .
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String

        # Specifies the sorting order, either Ascending or Descending . The default is Descending .
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String

        def initialize(
          @sort_by : String,
          @sort_order : String
        )
        end
      end

      # Defines the sorting parameters for listing resource snapshot jobs. This structure allows you to
      # specify the field to sort by and the order of sorting.
      struct SortObject
        include JSON::Serializable

        # Specifies the field by which to sort the resource snapshot jobs.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # Determines the order in which the sorted results are presented.
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct StartEngagementByAcceptingInvitationTaskRequest
        include JSON::Serializable

        # Specifies the catalog related to the task. Use AWS for production engagements and Sandbox for
        # testing scenarios.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique, case-sensitive identifier provided by the client that helps to ensure the idempotency of
        # the request. This can be a random or meaningful string but must be unique for each request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # Specifies the unique identifier of the EngagementInvitation to be accepted. Providing the correct
        # identifier helps ensure that the correct engagement is processed.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A map of the key-value pairs of the tag or tags to assign.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @catalog : String,
          @client_token : String,
          @identifier : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct StartEngagementByAcceptingInvitationTaskResponse
        include JSON::Serializable

        # Returns the identifier of the engagement invitation that was accepted and used to create the
        # opportunity.
        @[JSON::Field(key: "EngagementInvitationId")]
        getter engagement_invitation_id : String?

        # If the task fails, this field contains a detailed message describing the failure and possible
        # recovery steps.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # Returns the original opportunity identifier passed in the request. This is the unique identifier for
        # the opportunity.
        @[JSON::Field(key: "OpportunityId")]
        getter opportunity_id : String?

        # Indicates the reason for task failure using an enumerated code.
        @[JSON::Field(key: "ReasonCode")]
        getter reason_code : String?

        # The identifier of the Resource Snapshot Job created as part of this task.
        @[JSON::Field(key: "ResourceSnapshotJobId")]
        getter resource_snapshot_job_id : String?

        # The timestamp indicating when the task was initiated. The format follows RFC 3339 section 5.6.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The Amazon Resource Name (ARN) of the task, used for tracking and managing the task within AWS.
        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The unique identifier of the task, used to track the task’s progress.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        # Indicates the current status of the task.
        @[JSON::Field(key: "TaskStatus")]
        getter task_status : String?

        def initialize(
          @engagement_invitation_id : String? = nil,
          @message : String? = nil,
          @opportunity_id : String? = nil,
          @reason_code : String? = nil,
          @resource_snapshot_job_id : String? = nil,
          @start_time : Time? = nil,
          @task_arn : String? = nil,
          @task_id : String? = nil,
          @task_status : String? = nil
        )
        end
      end

      struct StartEngagementFromOpportunityTaskRequest
        include JSON::Serializable

        @[JSON::Field(key: "AwsSubmission")]
        getter aws_submission : Types::AwsSubmission

        # Specifies the catalog in which the engagement is tracked. Acceptable values include AWS for
        # production and Sandbox for testing environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique token provided by the client to help ensure the idempotency of the request. It helps
        # prevent the same task from being performed multiple times.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The unique identifier of the opportunity from which the engagement task is to be initiated. This
        # helps ensure that the task is applied to the correct opportunity.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A map of the key-value pairs of the tag or tags to assign.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @aws_submission : Types::AwsSubmission,
          @catalog : String,
          @client_token : String,
          @identifier : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct StartEngagementFromOpportunityTaskResponse
        include JSON::Serializable

        # The identifier of the newly created Engagement. Only populated if TaskStatus is COMPLETE.
        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String?

        # The identifier of the new Engagement invitation. Only populated if TaskStatus is COMPLETE.
        @[JSON::Field(key: "EngagementInvitationId")]
        getter engagement_invitation_id : String?

        # If the task fails, this field contains a detailed message describing the failure and possible
        # recovery steps.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # Returns the original opportunity identifier passed in the request, which is the unique identifier
        # for the opportunity created in the partner’s system.
        @[JSON::Field(key: "OpportunityId")]
        getter opportunity_id : String?

        # Indicates the reason for task failure using an enumerated code.
        @[JSON::Field(key: "ReasonCode")]
        getter reason_code : String?

        # The identifier of the resource snapshot job created to add the opportunity resource snapshot to the
        # Engagement. Only populated if TaskStatus is COMPLETE
        @[JSON::Field(key: "ResourceSnapshotJobId")]
        getter resource_snapshot_job_id : String?

        # The timestamp indicating when the task was initiated. The format follows RFC 3339 section 5.6.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The Amazon Resource Name (ARN) of the task, used for tracking and managing the task within AWS.
        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The unique identifier of the task, used to track the task’s progress. This value follows a specific
        # pattern: ^oit-[0-9a-z]{13}$ .
        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        # Indicates the current status of the task. Valid values include IN_PROGRESS , COMPLETE , and FAILED .
        @[JSON::Field(key: "TaskStatus")]
        getter task_status : String?

        def initialize(
          @engagement_id : String? = nil,
          @engagement_invitation_id : String? = nil,
          @message : String? = nil,
          @opportunity_id : String? = nil,
          @reason_code : String? = nil,
          @resource_snapshot_job_id : String? = nil,
          @start_time : Time? = nil,
          @task_arn : String? = nil,
          @task_id : String? = nil,
          @task_status : String? = nil
        )
        end
      end

      struct StartOpportunityFromEngagementTaskRequest
        include JSON::Serializable

        # Specifies the catalog in which the opportunity creation task is executed. Acceptable values include
        # AWS for production and Sandbox for testing environments.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique token provided by the client to help ensure the idempotency of the request. It helps
        # prevent the same task from being performed multiple times.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The unique identifier of the engagement context from which to create the opportunity. This specifies
        # the specific contextual information within the engagement that will be used for opportunity
        # creation.
        @[JSON::Field(key: "ContextIdentifier")]
        getter context_identifier : String

        # The unique identifier of the engagement from which the opportunity creation task is to be initiated.
        # This helps ensure that the task is applied to the correct engagement.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A map of the key-value pairs of the tag or tags to assign.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @catalog : String,
          @client_token : String,
          @context_identifier : String,
          @identifier : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct StartOpportunityFromEngagementTaskResponse
        include JSON::Serializable

        # The unique identifier of the engagement context used to create the opportunity.
        @[JSON::Field(key: "ContextId")]
        getter context_id : String?

        # The unique identifier of the engagement from which the opportunity was created.
        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String?

        # If the task fails, this field contains a detailed message describing the failure and possible
        # recovery steps.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The unique identifier of the opportunity created as a result of the task. This field is populated
        # when the task is completed successfully.
        @[JSON::Field(key: "OpportunityId")]
        getter opportunity_id : String?

        # Indicates the reason for task failure using an enumerated code.
        @[JSON::Field(key: "ReasonCode")]
        getter reason_code : String?

        # The identifier of the resource snapshot job created as part of the opportunity creation process.
        @[JSON::Field(key: "ResourceSnapshotJobId")]
        getter resource_snapshot_job_id : String?

        # The timestamp indicating when the task was initiated. The format follows RFC 3339 section 5.6.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The Amazon Resource Name (ARN) of the task, used for tracking and managing the task within AWS.
        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        # The unique identifier of the task, used to track the task's progress.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        # Indicates the current status of the task.
        @[JSON::Field(key: "TaskStatus")]
        getter task_status : String?

        def initialize(
          @context_id : String? = nil,
          @engagement_id : String? = nil,
          @message : String? = nil,
          @opportunity_id : String? = nil,
          @reason_code : String? = nil,
          @resource_snapshot_job_id : String? = nil,
          @start_time : Time? = nil,
          @task_arn : String? = nil,
          @task_id : String? = nil,
          @task_status : String? = nil
        )
        end
      end

      struct StartResourceSnapshotJobRequest
        include JSON::Serializable

        # Specifies the catalog related to the request. Valid values are: AWS: Starts the request from the
        # production AWS environment. Sandbox: Starts the request from a sandbox environment used for testing
        # or development purposes.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The identifier of the resource snapshot job to start.
        @[JSON::Field(key: "ResourceSnapshotJobIdentifier")]
        getter resource_snapshot_job_identifier : String

        def initialize(
          @catalog : String,
          @resource_snapshot_job_identifier : String
        )
        end
      end

      struct StopResourceSnapshotJobRequest
        include JSON::Serializable

        # Specifies the catalog related to the request. Valid values are: AWS: Stops the request from the
        # production AWS environment. Sandbox: Stops the request from a sandbox environment used for testing
        # or development purposes.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The identifier of the job to stop.
        @[JSON::Field(key: "ResourceSnapshotJobIdentifier")]
        getter resource_snapshot_job_identifier : String

        def initialize(
          @catalog : String,
          @resource_snapshot_job_identifier : String
        )
        end
      end

      struct SubmitOpportunityRequest
        include JSON::Serializable

        # Specifies the catalog related to the request. Valid values are: AWS: Submits the opportunity request
        # from the production AWS environment. Sandbox: Submits the opportunity request from a sandbox
        # environment used for testing or development purposes.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The identifier of the Opportunity previously created by partner and needs to be submitted.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # Specifies the level of AWS sellers' involvement on the opportunity. Valid values: Co-sell :
        # Indicates the user wants to co-sell with AWS. Share the opportunity with AWS to receive deal
        # assistance and support. For Visibility Only : Indicates that the user does not need support from AWS
        # Sales Rep. Share this opportunity with AWS for visibility only, you will not receive deal assistance
        # and support.
        @[JSON::Field(key: "InvolvementType")]
        getter involvement_type : String

        # Determines whether to restrict visibility of the opportunity from AWS sales. Default value is Full.
        # Valid values: Full : The opportunity is fully visible to AWS sales. Limited : The opportunity has
        # restricted visibility to AWS sales.
        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @catalog : String,
          @identifier : String,
          @involvement_type : String,
          @visibility : String? = nil
        )
        end
      end

      # The key-value pair assigned to a specified resource.
      struct Tag
        include JSON::Serializable

        # The key in the tag.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value in the tag.
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

        # The Amazon Resource Name (ARN) of the resource that you want to tag.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A map of the key-value pairs of the tag or tags to assign.
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

      # This error occurs when there are too many requests sent. Review the provided quotas and adapt your
      # usage to avoid throttling. This error occurs when there are too many requests sent. Review the
      # provided Quotas and retry after the provided delay.
      struct ThrottlingException
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

        # The Amazon Resource Name (ARN) of the resource that you want to untag.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The keys of the key-value pairs for the tag or tags you want to remove from the specified resource.
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

      # Represents the updated payload of an engagement context. The structure of this payload varies based
      # on the context type being updated.
      struct UpdateEngagementContextPayload
        include JSON::Serializable

        @[JSON::Field(key: "CustomerProject")]
        getter customer_project : Types::CustomerProjectsContext?

        # Contains updated information about a lead when the context type is "Lead". This field is present
        # only when updating a lead context within the engagement.
        @[JSON::Field(key: "Lead")]
        getter lead : Types::UpdateLeadContext?

        def initialize(
          @customer_project : Types::CustomerProjectsContext? = nil,
          @lead : Types::UpdateLeadContext? = nil
        )
        end
      end

      struct UpdateEngagementContextRequest
        include JSON::Serializable

        # Specifies the catalog associated with the engagement context update request. This field takes a
        # string value from a predefined list: AWS or Sandbox . The catalog determines which environment the
        # engagement context is updated in.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the specific engagement context to be updated. This ensures that the
        # correct context within the engagement is modified.
        @[JSON::Field(key: "ContextIdentifier")]
        getter context_identifier : String

        # The unique identifier of the Engagement containing the context to be updated. This parameter ensures
        # the context update is applied to the correct engagement.
        @[JSON::Field(key: "EngagementIdentifier")]
        getter engagement_identifier : String

        # The timestamp when the engagement was last modified, used for optimistic concurrency control. This
        # helps prevent conflicts when multiple users attempt to update the same engagement simultaneously.
        @[JSON::Field(key: "EngagementLastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter engagement_last_modified_at : Time

        # Contains the updated contextual information for the engagement. The structure of this payload varies
        # based on the context type specified in the Type field.
        @[JSON::Field(key: "Payload")]
        getter payload : Types::UpdateEngagementContextPayload

        # Specifies the type of context being updated within the engagement. This field determines the
        # structure and content of the context payload being modified.
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @catalog : String,
          @context_identifier : String,
          @engagement_identifier : String,
          @engagement_last_modified_at : Time,
          @payload : Types::UpdateEngagementContextPayload,
          @type : String
        )
        end
      end

      struct UpdateEngagementContextResponse
        include JSON::Serializable

        # The unique identifier of the engagement context that was updated.
        @[JSON::Field(key: "ContextId")]
        getter context_id : String

        # The Amazon Resource Name (ARN) of the updated engagement.
        @[JSON::Field(key: "EngagementArn")]
        getter engagement_arn : String

        # The unique identifier of the engagement that was updated.
        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String

        # The timestamp when the engagement context was last modified.
        @[JSON::Field(key: "EngagementLastModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter engagement_last_modified_at : Time

        def initialize(
          @context_id : String,
          @engagement_arn : String,
          @engagement_id : String,
          @engagement_last_modified_at : Time
        )
        end
      end

      # Updates the context information for a lead with qualification status, customer details, and
      # interaction data.
      struct UpdateLeadContext
        include JSON::Serializable

        # Updated customer information associated with the lead.
        @[JSON::Field(key: "Customer")]
        getter customer : Types::LeadCustomer

        # Updated interaction details for the lead context.
        @[JSON::Field(key: "Interaction")]
        getter interaction : Types::LeadInteraction?

        # The updated qualification status of the lead.
        @[JSON::Field(key: "QualificationStatus")]
        getter qualification_status : String?

        def initialize(
          @customer : Types::LeadCustomer,
          @interaction : Types::LeadInteraction? = nil,
          @qualification_status : String? = nil
        )
        end
      end

      struct UpdateOpportunityRequest
        include JSON::Serializable

        # Specifies the catalog associated with the request. This field takes a string value from a predefined
        # list: AWS or Sandbox . The catalog determines which environment the opportunity is updated in. Use
        # AWS to update real opportunities in the production environment, and Sandbox for testing in secure,
        # isolated environments. When you use the Sandbox catalog, it allows you to simulate and validate your
        # interactions with Amazon Web Services services without affecting live data or operations.
        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Read-only, system generated Opportunity unique identifier.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # DateTime when the opportunity was last modified.
        @[JSON::Field(key: "LastModifiedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time

        # Specifies details of the customer associated with the Opportunity .
        @[JSON::Field(key: "Customer")]
        getter customer : Types::Customer?

        # An object that contains lifecycle details for the Opportunity .
        @[JSON::Field(key: "LifeCycle")]
        getter life_cycle : Types::LifeCycle?

        # An object that contains marketing details for the Opportunity .
        @[JSON::Field(key: "Marketing")]
        getter marketing : Types::Marketing?

        # Specifies if the opportunity is associated with national security concerns. This flag is only
        # applicable when the industry is Government . For national-security-related opportunities, validation
        # and compliance rules may apply, impacting the opportunity's visibility and processing.
        @[JSON::Field(key: "NationalSecurity")]
        getter national_security : String?

        # Specifies the opportunity type as a renewal, new, or expansion. Opportunity types: New opportunity:
        # Represents a new business opportunity with a potential customer that's not previously engaged with
        # your solutions or services. Renewal opportunity: Represents an opportunity to renew an existing
        # contract or subscription with a current customer, ensuring continuity of service. Expansion
        # opportunity: Represents an opportunity to expand the scope of an existing contract or subscription,
        # either by adding new services or increasing the volume of existing services for a current customer.
        @[JSON::Field(key: "OpportunityType")]
        getter opportunity_type : String?

        # Specifies the opportunity's unique identifier in the partner's CRM system. This value is essential
        # to track and reconcile because it's included in the outbound payload sent back to the partner.
        @[JSON::Field(key: "PartnerOpportunityIdentifier")]
        getter partner_opportunity_identifier : String?

        # Identifies the type of support the partner needs from Amazon Web Services. Valid values:
        # Cosell—Architectural Validation: Confirmation from Amazon Web Services that the partner's proposed
        # solution architecture is aligned with Amazon Web Services best practices and poses minimal
        # architectural risks. Cosell—Business Presentation: Request Amazon Web Services seller's
        # participation in a joint customer presentation. Cosell—Competitive Information: Access to Amazon Web
        # Services competitive resources and support for the partner's proposed solution. Cosell—Pricing
        # Assistance: Connect with an AWS seller for support situations where a partner may be receiving an
        # upfront discount on a service (for example: EDP deals). Cosell—Technical Consultation: Connection
        # with an Amazon Web Services Solutions Architect to address the partner's questions about the
        # proposed solution. Cosell—Total Cost of Ownership Evaluation: Assistance with quoting different cost
        # savings of proposed solutions on Amazon Web Services versus on-premises or a traditional hosting
        # environment. Cosell—Deal Support: Request Amazon Web Services seller's support to progress the
        # opportunity (for example: joint customer call, strategic positioning). Cosell—Support for Public
        # Tender/RFx: Opportunity related to the public sector where the partner needs RFx support from Amazon
        # Web Services.
        @[JSON::Field(key: "PrimaryNeedsFromAws")]
        getter primary_needs_from_aws : Array(String)?

        # An object that contains project details summary for the Opportunity .
        @[JSON::Field(key: "Project")]
        getter project : Types::Project?

        # Specifies details of a customer's procurement terms. Required only for partners in eligible
        # programs.
        @[JSON::Field(key: "SoftwareRevenue")]
        getter software_revenue : Types::SoftwareRevenue?

        def initialize(
          @catalog : String,
          @identifier : String,
          @last_modified_date : Time,
          @customer : Types::Customer? = nil,
          @life_cycle : Types::LifeCycle? = nil,
          @marketing : Types::Marketing? = nil,
          @national_security : String? = nil,
          @opportunity_type : String? = nil,
          @partner_opportunity_identifier : String? = nil,
          @primary_needs_from_aws : Array(String)? = nil,
          @project : Types::Project? = nil,
          @software_revenue : Types::SoftwareRevenue? = nil
        )
        end
      end

      struct UpdateOpportunityResponse
        include JSON::Serializable

        # Read-only, system generated Opportunity unique identifier.
        @[JSON::Field(key: "Id")]
        getter id : String

        # DateTime when the opportunity was last modified.
        @[JSON::Field(key: "LastModifiedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time

        def initialize(
          @id : String,
          @last_modified_date : Time
        )
        end
      end

      # The input fails to satisfy the constraints specified by the service or business validation rules.
      # Suggested action: Review the error message, including the failed fields and reasons, to correct the
      # request payload.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The primary reason for this validation exception to occur. REQUEST_VALIDATION_FAILED: The request
        # format is not valid. Fix: Verify your request payload includes all required fields, uses correct
        # data types and string formats. BUSINESS_VALIDATION_FAILED: The requested change doesn't pass the
        # business validation rules. Fix: Check that your change aligns with the business rules defined by AWS
        # Partner Central.
        @[JSON::Field(key: "Reason")]
        getter reason : String

        # A list of issues that were discovered in the submitted request or the resource state.
        @[JSON::Field(key: "ErrorList")]
        getter error_list : Array(Types::ValidationExceptionError)?

        def initialize(
          @message : String,
          @reason : String,
          @error_list : Array(Types::ValidationExceptionError)? = nil
        )
        end
      end

      # Indicates an invalid value for a field. REQUIRED_FIELD_MISSING: The request is missing a required
      # field. Fix: Verify your request payload includes all required fields. INVALID_ENUM_VALUE: The enum
      # field value isn't an accepted values. Fix: Check the documentation for the list of valid enum
      # values, and update your request with a valid value. INVALID_STRING_FORMAT: The string format is
      # invalid. Fix: Confirm that the string is in the expected format (For example: email address, date).
      # INVALID_VALUE: The value isn't valid. Fix: Confirm that the value meets the expected criteria and is
      # within the allowable range or set. TOO_MANY_VALUES: There are too many values in a field that
      # expects fewer entries. Fix: Reduce the number of values to match the expected limit.
      # NOT_ENOUGH_VALUES: There are not enough values in a field that expects more entries. Fix: Increase
      # the number of values to match the expected threshold. ACTION_NOT_PERMITTED: The action isn't
      # permitted due to current state or permissions. Fix: Verify that the action is appropriate for the
      # current state, and that you have the necessary permissions to perform it. DUPLICATE_KEY_VALUE: The
      # value in a field duplicates a value that must be unique. Fix: Verify that the value is unique and
      # doesn't duplicate an existing value in the system.
      struct ValidationExceptionError
        include JSON::Serializable

        # Specifies the error code for the invalid field value.
        @[JSON::Field(key: "Code")]
        getter code : String

        # Specifies the detailed error message for the invalid field value.
        @[JSON::Field(key: "Message")]
        getter message : String

        # Specifies the field name with the invalid value.
        @[JSON::Field(key: "FieldName")]
        getter field_name : String?

        def initialize(
          @code : String,
          @message : String,
          @field_name : String? = nil
        )
        end
      end
    end
  end
end
