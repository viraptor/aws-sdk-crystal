require "json"
require "time"

module AwsSdk
  module Account
    module Types


      struct AcceptPrimaryEmailUpdateRequest
        include JSON::Serializable

        # Specifies the 12-digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. To use this parameter, the caller must be an identity in the
        # organization's management account or a delegated administrator account. The specified account ID
        # must be a member account in the same organization. The organization must have all features enabled ,
        # and the organization must have trusted access enabled for the Account Management service, and
        # optionally a delegated admin account assigned. This operation can only be called from the management
        # account or the delegated administrator account of an organization for a member account. The
        # management account can't specify its own AccountId .

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The OTP code sent to the PrimaryEmail specified on the StartPrimaryEmailUpdate API call.

        @[JSON::Field(key: "Otp")]
        getter otp : String

        # The new primary email address for use with the specified account. This must match the PrimaryEmail
        # from the StartPrimaryEmailUpdate API call.

        @[JSON::Field(key: "PrimaryEmail")]
        getter primary_email : String

        def initialize(
          @account_id : String,
          @otp : String,
          @primary_email : String
        )
        end
      end


      struct AcceptPrimaryEmailUpdateResponse
        include JSON::Serializable

        # Retrieves the status of the accepted primary email update request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # The operation failed because the calling identity doesn't have the minimum required permissions.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The value populated to the x-amzn-ErrorType response header by API Gateway.

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter error_type : String?

        def initialize(
          @message : String,
          @error_type : String? = nil
        )
        end
      end

      # A structure that contains the details of an alternate contact associated with an Amazon Web Services
      # account

      struct AlternateContact
        include JSON::Serializable

        # The type of alternate contact.

        @[JSON::Field(key: "AlternateContactType")]
        getter alternate_contact_type : String?

        # The email address associated with this alternate contact.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # The name associated with this alternate contact.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The phone number associated with this alternate contact.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # The title associated with this alternate contact.

        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @alternate_contact_type : String? = nil,
          @email_address : String? = nil,
          @name : String? = nil,
          @phone_number : String? = nil,
          @title : String? = nil
        )
        end
      end

      # The request could not be processed because of a conflict in the current status of the resource. For
      # example, this happens if you try to enable a Region that is currently being disabled (in a status of
      # DISABLING) or if you try to change an account’s root user email to an email address which is already
      # in use.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The value populated to the x-amzn-ErrorType response header by API Gateway.

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter error_type : String?

        def initialize(
          @message : String,
          @error_type : String? = nil
        )
        end
      end

      # Contains the details of the primary contact information associated with an Amazon Web Services
      # account.

      struct ContactInformation
        include JSON::Serializable

        # The first line of the primary contact address.

        @[JSON::Field(key: "AddressLine1")]
        getter address_line1 : String

        # The city of the primary contact address.

        @[JSON::Field(key: "City")]
        getter city : String

        # The ISO-3166 two-letter country code for the primary contact address.

        @[JSON::Field(key: "CountryCode")]
        getter country_code : String

        # The full name of the primary contact address.

        @[JSON::Field(key: "FullName")]
        getter full_name : String

        # The phone number of the primary contact information. The number will be validated and, in some
        # countries, checked for activation.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String

        # The postal code of the primary contact address.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String

        # The second line of the primary contact address, if any.

        @[JSON::Field(key: "AddressLine2")]
        getter address_line2 : String?

        # The third line of the primary contact address, if any.

        @[JSON::Field(key: "AddressLine3")]
        getter address_line3 : String?

        # The name of the company associated with the primary contact information, if any.

        @[JSON::Field(key: "CompanyName")]
        getter company_name : String?

        # The district or county of the primary contact address, if any.

        @[JSON::Field(key: "DistrictOrCounty")]
        getter district_or_county : String?

        # The state or region of the primary contact address. If the mailing address is within the United
        # States (US), the value in this field can be either a two character state code (for example, NJ ) or
        # the full state name (for example, New Jersey ). This field is required in the following countries:
        # US , CA , GB , DE , JP , IN , and BR .

        @[JSON::Field(key: "StateOrRegion")]
        getter state_or_region : String?

        # The URL of the website associated with the primary contact information, if any.

        @[JSON::Field(key: "WebsiteUrl")]
        getter website_url : String?

        def initialize(
          @address_line1 : String,
          @city : String,
          @country_code : String,
          @full_name : String,
          @phone_number : String,
          @postal_code : String,
          @address_line2 : String? = nil,
          @address_line3 : String? = nil,
          @company_name : String? = nil,
          @district_or_county : String? = nil,
          @state_or_region : String? = nil,
          @website_url : String? = nil
        )
        end
      end


      struct DeleteAlternateContactRequest
        include JSON::Serializable

        # Specifies which of the alternate contacts to delete.

        @[JSON::Field(key: "AlternateContactType")]
        getter alternate_contact_type : String

        # Specifies the 12 digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. If you do not specify this parameter, it defaults to the Amazon Web
        # Services account of the identity used to call the operation. To use this parameter, the caller must
        # be an identity in the organization's management account or a delegated administrator account, and
        # the specified account ID must be a member account in the same organization. The organization must
        # have all features enabled , and the organization must have trusted access enabled for the Account
        # Management service, and optionally a delegated administrator account assigned. The management
        # account can't specify its own AccountId ; it must call the operation in standalone context by not
        # including the AccountId parameter. To call this operation on an account that is not a member of an
        # organization, then don't specify this parameter, and call the operation using an identity belonging
        # to the account whose contacts you wish to retrieve or modify.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @alternate_contact_type : String,
          @account_id : String? = nil
        )
        end
      end


      struct DisableRegionRequest
        include JSON::Serializable

        # Specifies the Region-code for a given Region name (for example, af-south-1 ). When you disable a
        # Region, Amazon Web Services performs actions to deactivate that Region in your account, such as
        # destroying IAM resources in the Region. This process takes a few minutes for most accounts, but this
        # can take several hours. You cannot enable the Region until the disabling process is fully completed.

        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        # Specifies the 12-digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. If you don't specify this parameter, it defaults to the Amazon Web
        # Services account of the identity used to call the operation. To use this parameter, the caller must
        # be an identity in the organization's management account or a delegated administrator account. The
        # specified account ID must be a member account in the same organization. The organization must have
        # all features enabled , and the organization must have trusted access enabled for the Account
        # Management service, and optionally a delegated admin account assigned. The management account can't
        # specify its own AccountId . It must call the operation in standalone context by not including the
        # AccountId parameter. To call this operation on an account that is not a member of an organization,
        # don't specify this parameter. Instead, call the operation using an identity belonging to the account
        # whose contacts you wish to retrieve or modify.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @region_name : String,
          @account_id : String? = nil
        )
        end
      end


      struct EnableRegionRequest
        include JSON::Serializable

        # Specifies the Region-code for a given Region name (for example, af-south-1 ). When you enable a
        # Region, Amazon Web Services performs actions to prepare your account in that Region, such as
        # distributing your IAM resources to the Region. This process takes a few minutes for most accounts,
        # but it can take several hours. You cannot use the Region until this process is complete.
        # Furthermore, you cannot disable the Region until the enabling process is fully completed.

        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        # Specifies the 12-digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. If you don't specify this parameter, it defaults to the Amazon Web
        # Services account of the identity used to call the operation. To use this parameter, the caller must
        # be an identity in the organization's management account or a delegated administrator account. The
        # specified account ID must be a member account in the same organization. The organization must have
        # all features enabled , and the organization must have trusted access enabled for the Account
        # Management service, and optionally a delegated admin account assigned. The management account can't
        # specify its own AccountId . It must call the operation in standalone context by not including the
        # AccountId parameter. To call this operation on an account that is not a member of an organization,
        # don't specify this parameter. Instead, call the operation using an identity belonging to the account
        # whose contacts you wish to retrieve or modify.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @region_name : String,
          @account_id : String? = nil
        )
        end
      end


      struct GetAccountInformationRequest
        include JSON::Serializable

        # Specifies the 12 digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. If you do not specify this parameter, it defaults to the Amazon Web
        # Services account of the identity used to call the operation. To use this parameter, the caller must
        # be an identity in the organization's management account or a delegated administrator account, and
        # the specified account ID must be a member account in the same organization. The organization must
        # have all features enabled , and the organization must have trusted access enabled for the Account
        # Management service, and optionally a delegated administrator account assigned. The management
        # account can't specify its own AccountId ; it must call the operation in standalone context by not
        # including the AccountId parameter. To call this operation on an account that is not a member of an
        # organization, then don't specify this parameter, and call the operation using an identity belonging
        # to the account whose contacts you wish to retrieve or modify.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @account_id : String? = nil
        )
        end
      end


      struct GetAccountInformationResponse
        include JSON::Serializable

        # The date and time the account was created.

        @[JSON::Field(key: "AccountCreatedDate")]
        getter account_created_date : Time?

        # Specifies the 12-digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. To use this parameter, the caller must be an identity in the
        # organization's management account or a delegated administrator account. The specified account ID
        # must be a member account in the same organization. The organization must have all features enabled ,
        # and the organization must have trusted access enabled for the Account Management service, and
        # optionally a delegated admin account assigned. This operation can only be called from the management
        # account or the delegated administrator account of an organization for a member account. The
        # management account can't specify its own AccountId .

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The name of the account.

        @[JSON::Field(key: "AccountName")]
        getter account_name : String?

        def initialize(
          @account_created_date : Time? = nil,
          @account_id : String? = nil,
          @account_name : String? = nil
        )
        end
      end


      struct GetAlternateContactRequest
        include JSON::Serializable

        # Specifies which alternate contact you want to retrieve.

        @[JSON::Field(key: "AlternateContactType")]
        getter alternate_contact_type : String

        # Specifies the 12 digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. If you do not specify this parameter, it defaults to the Amazon Web
        # Services account of the identity used to call the operation. To use this parameter, the caller must
        # be an identity in the organization's management account or a delegated administrator account, and
        # the specified account ID must be a member account in the same organization. The organization must
        # have all features enabled , and the organization must have trusted access enabled for the Account
        # Management service, and optionally a delegated administrator account assigned. The management
        # account can't specify its own AccountId ; it must call the operation in standalone context by not
        # including the AccountId parameter. To call this operation on an account that is not a member of an
        # organization, then don't specify this parameter, and call the operation using an identity belonging
        # to the account whose contacts you wish to retrieve or modify.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @alternate_contact_type : String,
          @account_id : String? = nil
        )
        end
      end


      struct GetAlternateContactResponse
        include JSON::Serializable

        # A structure that contains the details for the specified alternate contact.

        @[JSON::Field(key: "AlternateContact")]
        getter alternate_contact : Types::AlternateContact?

        def initialize(
          @alternate_contact : Types::AlternateContact? = nil
        )
        end
      end


      struct GetContactInformationRequest
        include JSON::Serializable

        # Specifies the 12-digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. If you don't specify this parameter, it defaults to the Amazon Web
        # Services account of the identity used to call the operation. To use this parameter, the caller must
        # be an identity in the organization's management account or a delegated administrator account. The
        # specified account ID must be a member account in the same organization. The organization must have
        # all features enabled , and the organization must have trusted access enabled for the Account
        # Management service, and optionally a delegated admin account assigned. The management account can't
        # specify its own AccountId . It must call the operation in standalone context by not including the
        # AccountId parameter. To call this operation on an account that is not a member of an organization,
        # don't specify this parameter. Instead, call the operation using an identity belonging to the account
        # whose contacts you wish to retrieve or modify.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @account_id : String? = nil
        )
        end
      end


      struct GetContactInformationResponse
        include JSON::Serializable

        # Contains the details of the primary contact information associated with an Amazon Web Services
        # account.

        @[JSON::Field(key: "ContactInformation")]
        getter contact_information : Types::ContactInformation?

        def initialize(
          @contact_information : Types::ContactInformation? = nil
        )
        end
      end


      struct GetGovCloudAccountInformationRequest
        include JSON::Serializable

        # Specifies the 12 digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. If you do not specify this parameter, it defaults to the Amazon Web
        # Services account of the identity used to call the operation. To use this parameter, the caller must
        # be an identity in the organization's management account or a delegated administrator account, and
        # the specified account ID must be a member account in the same organization. The organization must
        # have all features enabled , and the organization must have trusted access enabled for the Account
        # Management service, and optionally a delegated administrator account assigned. The management
        # account can't specify its own AccountId ; it must call the operation in standalone context by not
        # including the AccountId parameter. To call this operation on an account that is not a member of an
        # organization, then don't specify this parameter, and call the operation using an identity belonging
        # to the account whose contacts you wish to retrieve or modify.

        @[JSON::Field(key: "StandardAccountId")]
        getter standard_account_id : String?

        def initialize(
          @standard_account_id : String? = nil
        )
        end
      end


      struct GetGovCloudAccountInformationResponse
        include JSON::Serializable

        # The account state of the linked GovCloud account.

        @[JSON::Field(key: "AccountState")]
        getter account_state : String

        # The 12-digit account ID number of the linked GovCloud account.

        @[JSON::Field(key: "GovCloudAccountId")]
        getter gov_cloud_account_id : String

        def initialize(
          @account_state : String,
          @gov_cloud_account_id : String
        )
        end
      end


      struct GetPrimaryEmailRequest
        include JSON::Serializable

        # Specifies the 12-digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. To use this parameter, the caller must be an identity in the
        # organization's management account or a delegated administrator account. The specified account ID
        # must be a member account in the same organization. The organization must have all features enabled ,
        # and the organization must have trusted access enabled for the Account Management service, and
        # optionally a delegated admin account assigned. This operation can only be called from the management
        # account or the delegated administrator account of an organization for a member account. The
        # management account can't specify its own AccountId .

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct GetPrimaryEmailResponse
        include JSON::Serializable

        # Retrieves the primary email address associated with the specified account.

        @[JSON::Field(key: "PrimaryEmail")]
        getter primary_email : String?

        def initialize(
          @primary_email : String? = nil
        )
        end
      end


      struct GetRegionOptStatusRequest
        include JSON::Serializable

        # Specifies the Region-code for a given Region name (for example, af-south-1 ). This function will
        # return the status of whatever Region you pass into this parameter.

        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        # Specifies the 12-digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. If you don't specify this parameter, it defaults to the Amazon Web
        # Services account of the identity used to call the operation. To use this parameter, the caller must
        # be an identity in the organization's management account or a delegated administrator account. The
        # specified account ID must be a member account in the same organization. The organization must have
        # all features enabled , and the organization must have trusted access enabled for the Account
        # Management service, and optionally a delegated admin account assigned. The management account can't
        # specify its own AccountId . It must call the operation in standalone context by not including the
        # AccountId parameter. To call this operation on an account that is not a member of an organization,
        # don't specify this parameter. Instead, call the operation using an identity belonging to the account
        # whose contacts you wish to retrieve or modify.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @region_name : String,
          @account_id : String? = nil
        )
        end
      end


      struct GetRegionOptStatusResponse
        include JSON::Serializable

        # The Region code that was passed in.

        @[JSON::Field(key: "RegionName")]
        getter region_name : String?

        # One of the potential statuses a Region can undergo (Enabled, Enabling, Disabled, Disabling,
        # Enabled_By_Default).

        @[JSON::Field(key: "RegionOptStatus")]
        getter region_opt_status : String?

        def initialize(
          @region_name : String? = nil,
          @region_opt_status : String? = nil
        )
        end
      end

      # The operation failed because of an error internal to Amazon Web Services. Try your operation again
      # later.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The value populated to the x-amzn-ErrorType response header by API Gateway.

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter error_type : String?

        def initialize(
          @message : String,
          @error_type : String? = nil
        )
        end
      end


      struct ListRegionsRequest
        include JSON::Serializable

        # Specifies the 12-digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. If you don't specify this parameter, it defaults to the Amazon Web
        # Services account of the identity used to call the operation. To use this parameter, the caller must
        # be an identity in the organization's management account or a delegated administrator account. The
        # specified account ID must be a member account in the same organization. The organization must have
        # all features enabled , and the organization must have trusted access enabled for the Account
        # Management service, and optionally a delegated admin account assigned. The management account can't
        # specify its own AccountId . It must call the operation in standalone context by not including the
        # AccountId parameter. To call this operation on an account that is not a member of an organization,
        # don't specify this parameter. Instead, call the operation using an identity belonging to the account
        # whose contacts you wish to retrieve or modify.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The total number of items to return in the command’s output. If the total number of items available
        # is more than the value specified, a NextToken is provided in the command’s output. To resume
        # pagination, provide the NextToken value in the starting-token argument of a subsequent command. Do
        # not use the NextToken response element directly outside of the Amazon Web Services CLI. For usage
        # examples, see Pagination in the Amazon Web Services Command Line Interface User Guide .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token used to specify where to start paginating. This is the NextToken from a previously truncated
        # response. For usage examples, see Pagination in the Amazon Web Services Command Line Interface User
        # Guide .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of Region statuses (Enabling, Enabled, Disabling, Disabled, Enabled_by_default) to use to
        # filter the list of Regions for a given account. For example, passing in a value of ENABLING will
        # only return a list of Regions with a Region status of ENABLING.

        @[JSON::Field(key: "RegionOptStatusContains")]
        getter region_opt_status_contains : Array(String)?

        def initialize(
          @account_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @region_opt_status_contains : Array(String)? = nil
        )
        end
      end


      struct ListRegionsResponse
        include JSON::Serializable

        # If there is more data to be returned, this will be populated. It should be passed into the
        # next-token request parameter of list-regions .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # This is a list of Regions for a given account, or if the filtered parameter was used, a list of
        # Regions that match the filter criteria set in the filter parameter.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(Types::Region)?

        def initialize(
          @next_token : String? = nil,
          @regions : Array(Types::Region)? = nil
        )
        end
      end


      struct PutAccountNameRequest
        include JSON::Serializable

        # The name of the account.

        @[JSON::Field(key: "AccountName")]
        getter account_name : String

        # Specifies the 12 digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. If you do not specify this parameter, it defaults to the Amazon Web
        # Services account of the identity used to call the operation. To use this parameter, the caller must
        # be an identity in the organization's management account or a delegated administrator account, and
        # the specified account ID must be a member account in the same organization. The organization must
        # have all features enabled , and the organization must have trusted access enabled for the Account
        # Management service, and optionally a delegated administrator account assigned. The management
        # account can't specify its own AccountId ; it must call the operation in standalone context by not
        # including the AccountId parameter. To call this operation on an account that is not a member of an
        # organization, then don't specify this parameter, and call the operation using an identity belonging
        # to the account whose contacts you wish to retrieve or modify.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @account_name : String,
          @account_id : String? = nil
        )
        end
      end


      struct PutAlternateContactRequest
        include JSON::Serializable

        # Specifies which alternate contact you want to create or update.

        @[JSON::Field(key: "AlternateContactType")]
        getter alternate_contact_type : String

        # Specifies an email address for the alternate contact.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        # Specifies a name for the alternate contact.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies a phone number for the alternate contact.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String

        # Specifies a title for the alternate contact.

        @[JSON::Field(key: "Title")]
        getter title : String

        # Specifies the 12 digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. If you do not specify this parameter, it defaults to the Amazon Web
        # Services account of the identity used to call the operation. To use this parameter, the caller must
        # be an identity in the organization's management account or a delegated administrator account, and
        # the specified account ID must be a member account in the same organization. The organization must
        # have all features enabled , and the organization must have trusted access enabled for the Account
        # Management service, and optionally a delegated administrator account assigned. The management
        # account can't specify its own AccountId ; it must call the operation in standalone context by not
        # including the AccountId parameter. To call this operation on an account that is not a member of an
        # organization, then don't specify this parameter, and call the operation using an identity belonging
        # to the account whose contacts you wish to retrieve or modify.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @alternate_contact_type : String,
          @email_address : String,
          @name : String,
          @phone_number : String,
          @title : String,
          @account_id : String? = nil
        )
        end
      end


      struct PutContactInformationRequest
        include JSON::Serializable

        # Contains the details of the primary contact information associated with an Amazon Web Services
        # account.

        @[JSON::Field(key: "ContactInformation")]
        getter contact_information : Types::ContactInformation

        # Specifies the 12-digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. If you don't specify this parameter, it defaults to the Amazon Web
        # Services account of the identity used to call the operation. To use this parameter, the caller must
        # be an identity in the organization's management account or a delegated administrator account. The
        # specified account ID must be a member account in the same organization. The organization must have
        # all features enabled , and the organization must have trusted access enabled for the Account
        # Management service, and optionally a delegated administrator account assigned. The management
        # account can't specify its own AccountId . It must call the operation in standalone context by not
        # including the AccountId parameter. To call this operation on an account that is not a member of an
        # organization, don't specify this parameter. Instead, call the operation using an identity belonging
        # to the account whose contacts you wish to retrieve or modify.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @contact_information : Types::ContactInformation,
          @account_id : String? = nil
        )
        end
      end

      # This is a structure that expresses the Region for a given account, consisting of a name and opt-in
      # status.

      struct Region
        include JSON::Serializable

        # The Region code of a given Region (for example, us-east-1 ).

        @[JSON::Field(key: "RegionName")]
        getter region_name : String?

        # One of potential statuses a Region can undergo (Enabled, Enabling, Disabled, Disabling,
        # Enabled_By_Default).

        @[JSON::Field(key: "RegionOptStatus")]
        getter region_opt_status : String?

        def initialize(
          @region_name : String? = nil,
          @region_opt_status : String? = nil
        )
        end
      end

      # The operation failed because it specified a resource that can't be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The value populated to the x-amzn-ErrorType response header by API Gateway.

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter error_type : String?

        def initialize(
          @message : String,
          @error_type : String? = nil
        )
        end
      end

      # The operation failed because it specified a resource that is not currently available.

      struct ResourceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The value populated to the x-amzn-ErrorType response header by API Gateway.

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter error_type : String?

        def initialize(
          @message : String,
          @error_type : String? = nil
        )
        end
      end


      struct StartPrimaryEmailUpdateRequest
        include JSON::Serializable

        # Specifies the 12-digit account ID number of the Amazon Web Services account that you want to access
        # or modify with this operation. To use this parameter, the caller must be an identity in the
        # organization's management account or a delegated administrator account. The specified account ID
        # must be a member account in the same organization. The organization must have all features enabled ,
        # and the organization must have trusted access enabled for the Account Management service, and
        # optionally a delegated admin account assigned. This operation can only be called from the management
        # account or the delegated administrator account of an organization for a member account. The
        # management account can't specify its own AccountId .

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The new primary email address (also known as the root user email address) to use in the specified
        # account.

        @[JSON::Field(key: "PrimaryEmail")]
        getter primary_email : String

        def initialize(
          @account_id : String,
          @primary_email : String
        )
        end
      end


      struct StartPrimaryEmailUpdateResponse
        include JSON::Serializable

        # The status of the primary email update request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # The operation failed because it was called too frequently and exceeded a throttle limit.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The value populated to the x-amzn-ErrorType response header by API Gateway.

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter error_type : String?

        def initialize(
          @message : String,
          @error_type : String? = nil
        )
        end
      end

      # The operation failed because one of the input parameters was invalid.

      struct ValidationException
        include JSON::Serializable

        # The message that informs you about what was invalid about the request.

        @[JSON::Field(key: "message")]
        getter message : String

        # The field where the invalid entry was detected.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        # The reason that validation failed.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # The input failed to meet the constraints specified by the Amazon Web Services service in a specified
      # field.

      struct ValidationExceptionField
        include JSON::Serializable

        # A message about the validation exception.

        @[JSON::Field(key: "message")]
        getter message : String

        # The field name where the invalid entry was detected.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
