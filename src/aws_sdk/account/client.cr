module AwsSdk
  module Account
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Accepts the request that originated from StartPrimaryEmailUpdate to update the primary email address
      # (also known as the root user email address) for the specified account.
      def accept_primary_email_update(
        account_id : String,
        otp : String,
        primary_email : String
      ) : Protocol::Request
        input = Types::AcceptPrimaryEmailUpdateRequest.new(account_id: account_id, otp: otp, primary_email: primary_email)
        accept_primary_email_update(input)
      end
      def accept_primary_email_update(input : Types::AcceptPrimaryEmailUpdateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_PRIMARY_EMAIL_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified alternate contact from an Amazon Web Services account. For complete details
      # about how to use the alternate contact operations, see Update the alternate contacts for your Amazon
      # Web Services account . Before you can update the alternate contact information for an Amazon Web
      # Services account that is managed by Organizations, you must first enable integration between Amazon
      # Web Services Account Management and Organizations. For more information, see Enable trusted access
      # for Amazon Web Services Account Management .
      def delete_alternate_contact(
        alternate_contact_type : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAlternateContactRequest.new(alternate_contact_type: alternate_contact_type, account_id: account_id)
        delete_alternate_contact(input)
      end
      def delete_alternate_contact(input : Types::DeleteAlternateContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ALTERNATE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables (opts-out) a particular Region for an account. The act of disabling a Region will remove
      # all IAM access to any resources that reside in that Region.
      def disable_region(
        region_name : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::DisableRegionRequest.new(region_name: region_name, account_id: account_id)
        disable_region(input)
      end
      def disable_region(input : Types::DisableRegionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_REGION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables (opts-in) a particular Region for an account.
      def enable_region(
        region_name : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::EnableRegionRequest.new(region_name: region_name, account_id: account_id)
        enable_region(input)
      end
      def enable_region(input : Types::EnableRegionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_REGION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified account including its account name, account ID, and
      # account creation date and time. To use this API, an IAM user or role must have the
      # account:GetAccountInformation IAM permission.
      def get_account_information(
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetAccountInformationRequest.new(account_id: account_id)
        get_account_information(input)
      end
      def get_account_information(input : Types::GetAccountInformationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT_INFORMATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified alternate contact attached to an Amazon Web Services account. For complete
      # details about how to use the alternate contact operations, see Update the alternate contacts for
      # your Amazon Web Services account . Before you can update the alternate contact information for an
      # Amazon Web Services account that is managed by Organizations, you must first enable integration
      # between Amazon Web Services Account Management and Organizations. For more information, see Enable
      # trusted access for Amazon Web Services Account Management .
      def get_alternate_contact(
        alternate_contact_type : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetAlternateContactRequest.new(alternate_contact_type: alternate_contact_type, account_id: account_id)
        get_alternate_contact(input)
      end
      def get_alternate_contact(input : Types::GetAlternateContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ALTERNATE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the primary contact information of an Amazon Web Services account. For complete details
      # about how to use the primary contact operations, see Update the primary contact for your Amazon Web
      # Services account .
      def get_contact_information(
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetContactInformationRequest.new(account_id: account_id)
        get_contact_information(input)
      end
      def get_contact_information(input : Types::GetContactInformationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTACT_INFORMATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the GovCloud account linked to the specified standard account (if it
      # exists) including the GovCloud account ID and state. To use this API, an IAM user or role must have
      # the account:GetGovCloudAccountInformation IAM permission.
      def get_gov_cloud_account_information(
        standard_account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetGovCloudAccountInformationRequest.new(standard_account_id: standard_account_id)
        get_gov_cloud_account_information(input)
      end
      def get_gov_cloud_account_information(input : Types::GetGovCloudAccountInformationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GOV_CLOUD_ACCOUNT_INFORMATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the primary email address for the specified account.
      def get_primary_email(
        account_id : String
      ) : Protocol::Request
        input = Types::GetPrimaryEmailRequest.new(account_id: account_id)
        get_primary_email(input)
      end
      def get_primary_email(input : Types::GetPrimaryEmailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PRIMARY_EMAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the opt-in status of a particular Region.
      def get_region_opt_status(
        region_name : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetRegionOptStatusRequest.new(region_name: region_name, account_id: account_id)
        get_region_opt_status(input)
      end
      def get_region_opt_status(input : Types::GetRegionOptStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REGION_OPT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the Regions for a given account and their respective opt-in statuses. Optionally, this
      # list can be filtered by the region-opt-status-contains parameter.
      def list_regions(
        account_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        region_opt_status_contains : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListRegionsRequest.new(account_id: account_id, max_results: max_results, next_token: next_token, region_opt_status_contains: region_opt_status_contains)
        list_regions(input)
      end
      def list_regions(input : Types::ListRegionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REGIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the account name of the specified account. To use this API, IAM principals must have the
      # account:PutAccountName IAM permission.
      def put_account_name(
        account_name : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::PutAccountNameRequest.new(account_name: account_name, account_id: account_id)
        put_account_name(input)
      end
      def put_account_name(input : Types::PutAccountNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACCOUNT_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the specified alternate contact attached to an Amazon Web Services account. For complete
      # details about how to use the alternate contact operations, see Update the alternate contacts for
      # your Amazon Web Services account . Before you can update the alternate contact information for an
      # Amazon Web Services account that is managed by Organizations, you must first enable integration
      # between Amazon Web Services Account Management and Organizations. For more information, see Enable
      # trusted access for Amazon Web Services Account Management .
      def put_alternate_contact(
        alternate_contact_type : String,
        email_address : String,
        name : String,
        phone_number : String,
        title : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::PutAlternateContactRequest.new(alternate_contact_type: alternate_contact_type, email_address: email_address, name: name, phone_number: phone_number, title: title, account_id: account_id)
        put_alternate_contact(input)
      end
      def put_alternate_contact(input : Types::PutAlternateContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ALTERNATE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the primary contact information of an Amazon Web Services account. For complete details
      # about how to use the primary contact operations, see Update the primary contact for your Amazon Web
      # Services account .
      def put_contact_information(
        contact_information : Types::ContactInformation,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::PutContactInformationRequest.new(contact_information: contact_information, account_id: account_id)
        put_contact_information(input)
      end
      def put_contact_information(input : Types::PutContactInformationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONTACT_INFORMATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the process to update the primary email address for the specified account.
      def start_primary_email_update(
        account_id : String,
        primary_email : String
      ) : Protocol::Request
        input = Types::StartPrimaryEmailUpdateRequest.new(account_id: account_id, primary_email: primary_email)
        start_primary_email_update(input)
      end
      def start_primary_email_update(input : Types::StartPrimaryEmailUpdateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_PRIMARY_EMAIL_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
