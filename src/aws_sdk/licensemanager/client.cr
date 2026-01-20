module AwsSdk
  module LicenseManager
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Accepts the specified grant.

      def accept_grant(
        grant_arn : String
      ) : Types::AcceptGrantResponse

        input = Types::AcceptGrantRequest.new(grant_arn: grant_arn)
        accept_grant(input)
      end

      def accept_grant(input : Types::AcceptGrantRequest) : Types::AcceptGrantResponse
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptGrantResponse, "AcceptGrant")
      end

      # Checks in the specified license. Check in a license when it is no longer in use.

      def check_in_license(
        license_consumption_token : String,
        beneficiary : String? = nil
      ) : Types::CheckInLicenseResponse

        input = Types::CheckInLicenseRequest.new(license_consumption_token: license_consumption_token, beneficiary: beneficiary)
        check_in_license(input)
      end

      def check_in_license(input : Types::CheckInLicenseRequest) : Types::CheckInLicenseResponse
        request = Protocol::JsonRpc.build_request(Model::CHECK_IN_LICENSE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CheckInLicenseResponse, "CheckInLicense")
      end

      # Checks out the specified license for offline use.

      def checkout_borrow_license(
        client_token : String,
        digital_signature_method : String,
        entitlements : Array(Types::EntitlementData),
        license_arn : String,
        checkout_metadata : Array(Types::Metadata)? = nil,
        node_id : String? = nil
      ) : Types::CheckoutBorrowLicenseResponse

        input = Types::CheckoutBorrowLicenseRequest.new(client_token: client_token, digital_signature_method: digital_signature_method, entitlements: entitlements, license_arn: license_arn, checkout_metadata: checkout_metadata, node_id: node_id)
        checkout_borrow_license(input)
      end

      def checkout_borrow_license(input : Types::CheckoutBorrowLicenseRequest) : Types::CheckoutBorrowLicenseResponse
        request = Protocol::JsonRpc.build_request(Model::CHECKOUT_BORROW_LICENSE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CheckoutBorrowLicenseResponse, "CheckoutBorrowLicense")
      end

      # Checks out the specified license. If the account that created the license is the same that is
      # performing the check out, you must specify the account as the beneficiary.

      def checkout_license(
        checkout_type : String,
        client_token : String,
        entitlements : Array(Types::EntitlementData),
        key_fingerprint : String,
        product_sku : String,
        beneficiary : String? = nil,
        node_id : String? = nil
      ) : Types::CheckoutLicenseResponse

        input = Types::CheckoutLicenseRequest.new(checkout_type: checkout_type, client_token: client_token, entitlements: entitlements, key_fingerprint: key_fingerprint, product_sku: product_sku, beneficiary: beneficiary, node_id: node_id)
        checkout_license(input)
      end

      def checkout_license(input : Types::CheckoutLicenseRequest) : Types::CheckoutLicenseResponse
        request = Protocol::JsonRpc.build_request(Model::CHECKOUT_LICENSE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CheckoutLicenseResponse, "CheckoutLicense")
      end

      # Creates a grant for the specified license. A grant shares the use of license entitlements with a
      # specific Amazon Web Services account, an organization, or an organizational unit (OU). For more
      # information, see Granted licenses in License Manager in the License Manager User Guide .

      def create_grant(
        allowed_operations : Array(String),
        client_token : String,
        grant_name : String,
        home_region : String,
        license_arn : String,
        principals : Array(String),
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateGrantResponse

        input = Types::CreateGrantRequest.new(allowed_operations: allowed_operations, client_token: client_token, grant_name: grant_name, home_region: home_region, license_arn: license_arn, principals: principals, tags: tags)
        create_grant(input)
      end

      def create_grant(input : Types::CreateGrantRequest) : Types::CreateGrantResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGrantResponse, "CreateGrant")
      end

      # Creates a new version of the specified grant. For more information, see Granted licenses in License
      # Manager in the License Manager User Guide .

      def create_grant_version(
        client_token : String,
        grant_arn : String,
        allowed_operations : Array(String)? = nil,
        grant_name : String? = nil,
        options : Types::Options? = nil,
        source_version : String? = nil,
        status : String? = nil,
        status_reason : String? = nil
      ) : Types::CreateGrantVersionResponse

        input = Types::CreateGrantVersionRequest.new(client_token: client_token, grant_arn: grant_arn, allowed_operations: allowed_operations, grant_name: grant_name, options: options, source_version: source_version, status: status, status_reason: status_reason)
        create_grant_version(input)
      end

      def create_grant_version(input : Types::CreateGrantVersionRequest) : Types::CreateGrantVersionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_GRANT_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGrantVersionResponse, "CreateGrantVersion")
      end

      # Creates a license.

      def create_license(
        beneficiary : String,
        client_token : String,
        consumption_configuration : Types::ConsumptionConfiguration,
        entitlements : Array(Types::Entitlement),
        home_region : String,
        issuer : Types::Issuer,
        license_name : String,
        product_name : String,
        product_sku : String,
        validity : Types::DatetimeRange,
        license_metadata : Array(Types::Metadata)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateLicenseResponse

        input = Types::CreateLicenseRequest.new(beneficiary: beneficiary, client_token: client_token, consumption_configuration: consumption_configuration, entitlements: entitlements, home_region: home_region, issuer: issuer, license_name: license_name, product_name: product_name, product_sku: product_sku, validity: validity, license_metadata: license_metadata, tags: tags)
        create_license(input)
      end

      def create_license(input : Types::CreateLicenseRequest) : Types::CreateLicenseResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LICENSE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLicenseResponse, "CreateLicense")
      end

      # Creates a license asset group.

      def create_license_asset_group(
        associated_license_asset_ruleset_ar_ns : Array(String),
        client_token : String,
        license_asset_group_configurations : Array(Types::LicenseAssetGroupConfiguration),
        name : String,
        description : String? = nil,
        properties : Array(Types::LicenseAssetGroupProperty)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateLicenseAssetGroupResponse

        input = Types::CreateLicenseAssetGroupRequest.new(associated_license_asset_ruleset_ar_ns: associated_license_asset_ruleset_ar_ns, client_token: client_token, license_asset_group_configurations: license_asset_group_configurations, name: name, description: description, properties: properties, tags: tags)
        create_license_asset_group(input)
      end

      def create_license_asset_group(input : Types::CreateLicenseAssetGroupRequest) : Types::CreateLicenseAssetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LICENSE_ASSET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLicenseAssetGroupResponse, "CreateLicenseAssetGroup")
      end

      # Creates a license asset ruleset.

      def create_license_asset_ruleset(
        client_token : String,
        name : String,
        rules : Array(Types::LicenseAssetRule),
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateLicenseAssetRulesetResponse

        input = Types::CreateLicenseAssetRulesetRequest.new(client_token: client_token, name: name, rules: rules, description: description, tags: tags)
        create_license_asset_ruleset(input)
      end

      def create_license_asset_ruleset(input : Types::CreateLicenseAssetRulesetRequest) : Types::CreateLicenseAssetRulesetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LICENSE_ASSET_RULESET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLicenseAssetRulesetResponse, "CreateLicenseAssetRuleset")
      end

      # Creates a license configuration. A license configuration is an abstraction of a customer license
      # agreement that can be consumed and enforced by License Manager. Components include specifications
      # for the license type (licensing by instance, socket, CPU, or vCPU), allowed tenancy (shared tenancy,
      # Dedicated Instance, Dedicated Host, or all of these), license affinity to host (how long a license
      # must be associated with a host), and the number of licenses purchased and used.

      def create_license_configuration(
        license_counting_type : String,
        name : String,
        description : String? = nil,
        disassociate_when_not_found : Bool? = nil,
        license_count : Int64? = nil,
        license_count_hard_limit : Bool? = nil,
        license_expiry : Int64? = nil,
        license_rules : Array(String)? = nil,
        product_information_list : Array(Types::ProductInformation)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateLicenseConfigurationResponse

        input = Types::CreateLicenseConfigurationRequest.new(license_counting_type: license_counting_type, name: name, description: description, disassociate_when_not_found: disassociate_when_not_found, license_count: license_count, license_count_hard_limit: license_count_hard_limit, license_expiry: license_expiry, license_rules: license_rules, product_information_list: product_information_list, tags: tags)
        create_license_configuration(input)
      end

      def create_license_configuration(input : Types::CreateLicenseConfigurationRequest) : Types::CreateLicenseConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LICENSE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLicenseConfigurationResponse, "CreateLicenseConfiguration")
      end

      # Creates a new license conversion task.

      def create_license_conversion_task_for_resource(
        destination_license_context : Types::LicenseConversionContext,
        resource_arn : String,
        source_license_context : Types::LicenseConversionContext
      ) : Types::CreateLicenseConversionTaskForResourceResponse

        input = Types::CreateLicenseConversionTaskForResourceRequest.new(destination_license_context: destination_license_context, resource_arn: resource_arn, source_license_context: source_license_context)
        create_license_conversion_task_for_resource(input)
      end

      def create_license_conversion_task_for_resource(input : Types::CreateLicenseConversionTaskForResourceRequest) : Types::CreateLicenseConversionTaskForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LICENSE_CONVERSION_TASK_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLicenseConversionTaskForResourceResponse, "CreateLicenseConversionTaskForResource")
      end

      # Creates a report generator.

      def create_license_manager_report_generator(
        client_token : String,
        report_context : Types::ReportContext,
        report_frequency : Types::ReportFrequency,
        report_generator_name : String,
        type : Array(String),
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateLicenseManagerReportGeneratorResponse

        input = Types::CreateLicenseManagerReportGeneratorRequest.new(client_token: client_token, report_context: report_context, report_frequency: report_frequency, report_generator_name: report_generator_name, type: type, description: description, tags: tags)
        create_license_manager_report_generator(input)
      end

      def create_license_manager_report_generator(input : Types::CreateLicenseManagerReportGeneratorRequest) : Types::CreateLicenseManagerReportGeneratorResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LICENSE_MANAGER_REPORT_GENERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLicenseManagerReportGeneratorResponse, "CreateLicenseManagerReportGenerator")
      end

      # Creates a new version of the specified license.

      def create_license_version(
        client_token : String,
        consumption_configuration : Types::ConsumptionConfiguration,
        entitlements : Array(Types::Entitlement),
        home_region : String,
        issuer : Types::Issuer,
        license_arn : String,
        license_name : String,
        product_name : String,
        status : String,
        validity : Types::DatetimeRange,
        license_metadata : Array(Types::Metadata)? = nil,
        source_version : String? = nil
      ) : Types::CreateLicenseVersionResponse

        input = Types::CreateLicenseVersionRequest.new(client_token: client_token, consumption_configuration: consumption_configuration, entitlements: entitlements, home_region: home_region, issuer: issuer, license_arn: license_arn, license_name: license_name, product_name: product_name, status: status, validity: validity, license_metadata: license_metadata, source_version: source_version)
        create_license_version(input)
      end

      def create_license_version(input : Types::CreateLicenseVersionRequest) : Types::CreateLicenseVersionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LICENSE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLicenseVersionResponse, "CreateLicenseVersion")
      end

      # Creates a long-lived token. A refresh token is a JWT token used to get an access token. With an
      # access token, you can call AssumeRoleWithWebIdentity to get role credentials that you can use to
      # call License Manager to manage the specified license.

      def create_token(
        client_token : String,
        license_arn : String,
        expiration_in_days : Int32? = nil,
        role_arns : Array(String)? = nil,
        token_properties : Array(String)? = nil
      ) : Types::CreateTokenResponse

        input = Types::CreateTokenRequest.new(client_token: client_token, license_arn: license_arn, expiration_in_days: expiration_in_days, role_arns: role_arns, token_properties: token_properties)
        create_token(input)
      end

      def create_token(input : Types::CreateTokenRequest) : Types::CreateTokenResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTokenResponse, "CreateToken")
      end

      # Deletes the specified grant.

      def delete_grant(
        grant_arn : String,
        version : String,
        status_reason : String? = nil
      ) : Types::DeleteGrantResponse

        input = Types::DeleteGrantRequest.new(grant_arn: grant_arn, version: version, status_reason: status_reason)
        delete_grant(input)
      end

      def delete_grant(input : Types::DeleteGrantRequest) : Types::DeleteGrantResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteGrantResponse, "DeleteGrant")
      end

      # Deletes the specified license.

      def delete_license(
        license_arn : String,
        source_version : String
      ) : Types::DeleteLicenseResponse

        input = Types::DeleteLicenseRequest.new(license_arn: license_arn, source_version: source_version)
        delete_license(input)
      end

      def delete_license(input : Types::DeleteLicenseRequest) : Types::DeleteLicenseResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_LICENSE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLicenseResponse, "DeleteLicense")
      end

      # Deletes a license asset group.

      def delete_license_asset_group(
        license_asset_group_arn : String
      ) : Types::DeleteLicenseAssetGroupResponse

        input = Types::DeleteLicenseAssetGroupRequest.new(license_asset_group_arn: license_asset_group_arn)
        delete_license_asset_group(input)
      end

      def delete_license_asset_group(input : Types::DeleteLicenseAssetGroupRequest) : Types::DeleteLicenseAssetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_LICENSE_ASSET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLicenseAssetGroupResponse, "DeleteLicenseAssetGroup")
      end

      # Deletes a license asset ruleset.

      def delete_license_asset_ruleset(
        license_asset_ruleset_arn : String
      ) : Types::DeleteLicenseAssetRulesetResponse

        input = Types::DeleteLicenseAssetRulesetRequest.new(license_asset_ruleset_arn: license_asset_ruleset_arn)
        delete_license_asset_ruleset(input)
      end

      def delete_license_asset_ruleset(input : Types::DeleteLicenseAssetRulesetRequest) : Types::DeleteLicenseAssetRulesetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_LICENSE_ASSET_RULESET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLicenseAssetRulesetResponse, "DeleteLicenseAssetRuleset")
      end

      # Deletes the specified license configuration. You cannot delete a license configuration that is in
      # use.

      def delete_license_configuration(
        license_configuration_arn : String
      ) : Types::DeleteLicenseConfigurationResponse

        input = Types::DeleteLicenseConfigurationRequest.new(license_configuration_arn: license_configuration_arn)
        delete_license_configuration(input)
      end

      def delete_license_configuration(input : Types::DeleteLicenseConfigurationRequest) : Types::DeleteLicenseConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_LICENSE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLicenseConfigurationResponse, "DeleteLicenseConfiguration")
      end

      # Deletes the specified report generator. This action deletes the report generator, which stops it
      # from generating future reports. The action cannot be reversed. It has no effect on the previous
      # reports from this generator.

      def delete_license_manager_report_generator(
        license_manager_report_generator_arn : String
      ) : Types::DeleteLicenseManagerReportGeneratorResponse

        input = Types::DeleteLicenseManagerReportGeneratorRequest.new(license_manager_report_generator_arn: license_manager_report_generator_arn)
        delete_license_manager_report_generator(input)
      end

      def delete_license_manager_report_generator(input : Types::DeleteLicenseManagerReportGeneratorRequest) : Types::DeleteLicenseManagerReportGeneratorResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_LICENSE_MANAGER_REPORT_GENERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLicenseManagerReportGeneratorResponse, "DeleteLicenseManagerReportGenerator")
      end

      # Deletes the specified token. Must be called in the license home Region.

      def delete_token(
        token_id : String
      ) : Types::DeleteTokenResponse

        input = Types::DeleteTokenRequest.new(token_id: token_id)
        delete_token(input)
      end

      def delete_token(input : Types::DeleteTokenRequest) : Types::DeleteTokenResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTokenResponse, "DeleteToken")
      end

      # Extends the expiration date for license consumption.

      def extend_license_consumption(
        license_consumption_token : String,
        dry_run : Bool? = nil
      ) : Types::ExtendLicenseConsumptionResponse

        input = Types::ExtendLicenseConsumptionRequest.new(license_consumption_token: license_consumption_token, dry_run: dry_run)
        extend_license_consumption(input)
      end

      def extend_license_consumption(input : Types::ExtendLicenseConsumptionRequest) : Types::ExtendLicenseConsumptionResponse
        request = Protocol::JsonRpc.build_request(Model::EXTEND_LICENSE_CONSUMPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExtendLicenseConsumptionResponse, "ExtendLicenseConsumption")
      end

      # Gets a temporary access token to use with AssumeRoleWithWebIdentity. Access tokens are valid for one
      # hour.

      def get_access_token(
        token : String,
        token_properties : Array(String)? = nil
      ) : Types::GetAccessTokenResponse

        input = Types::GetAccessTokenRequest.new(token: token, token_properties: token_properties)
        get_access_token(input)
      end

      def get_access_token(input : Types::GetAccessTokenRequest) : Types::GetAccessTokenResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ACCESS_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccessTokenResponse, "GetAccessToken")
      end

      # Gets detailed information about the specified grant.

      def get_grant(
        grant_arn : String,
        version : String? = nil
      ) : Types::GetGrantResponse

        input = Types::GetGrantRequest.new(grant_arn: grant_arn, version: version)
        get_grant(input)
      end

      def get_grant(input : Types::GetGrantRequest) : Types::GetGrantResponse
        request = Protocol::JsonRpc.build_request(Model::GET_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetGrantResponse, "GetGrant")
      end

      # Gets detailed information about the specified license.

      def get_license(
        license_arn : String,
        version : String? = nil
      ) : Types::GetLicenseResponse

        input = Types::GetLicenseRequest.new(license_arn: license_arn, version: version)
        get_license(input)
      end

      def get_license(input : Types::GetLicenseRequest) : Types::GetLicenseResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LICENSE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLicenseResponse, "GetLicense")
      end

      # Gets a license asset group.

      def get_license_asset_group(
        license_asset_group_arn : String
      ) : Types::GetLicenseAssetGroupResponse

        input = Types::GetLicenseAssetGroupRequest.new(license_asset_group_arn: license_asset_group_arn)
        get_license_asset_group(input)
      end

      def get_license_asset_group(input : Types::GetLicenseAssetGroupRequest) : Types::GetLicenseAssetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LICENSE_ASSET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLicenseAssetGroupResponse, "GetLicenseAssetGroup")
      end

      # Gets a license asset ruleset.

      def get_license_asset_ruleset(
        license_asset_ruleset_arn : String
      ) : Types::GetLicenseAssetRulesetResponse

        input = Types::GetLicenseAssetRulesetRequest.new(license_asset_ruleset_arn: license_asset_ruleset_arn)
        get_license_asset_ruleset(input)
      end

      def get_license_asset_ruleset(input : Types::GetLicenseAssetRulesetRequest) : Types::GetLicenseAssetRulesetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LICENSE_ASSET_RULESET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLicenseAssetRulesetResponse, "GetLicenseAssetRuleset")
      end

      # Gets detailed information about the specified license configuration.

      def get_license_configuration(
        license_configuration_arn : String
      ) : Types::GetLicenseConfigurationResponse

        input = Types::GetLicenseConfigurationRequest.new(license_configuration_arn: license_configuration_arn)
        get_license_configuration(input)
      end

      def get_license_configuration(input : Types::GetLicenseConfigurationRequest) : Types::GetLicenseConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LICENSE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLicenseConfigurationResponse, "GetLicenseConfiguration")
      end

      # Gets information about the specified license type conversion task.

      def get_license_conversion_task(
        license_conversion_task_id : String
      ) : Types::GetLicenseConversionTaskResponse

        input = Types::GetLicenseConversionTaskRequest.new(license_conversion_task_id: license_conversion_task_id)
        get_license_conversion_task(input)
      end

      def get_license_conversion_task(input : Types::GetLicenseConversionTaskRequest) : Types::GetLicenseConversionTaskResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LICENSE_CONVERSION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLicenseConversionTaskResponse, "GetLicenseConversionTask")
      end

      # Gets information about the specified report generator.

      def get_license_manager_report_generator(
        license_manager_report_generator_arn : String
      ) : Types::GetLicenseManagerReportGeneratorResponse

        input = Types::GetLicenseManagerReportGeneratorRequest.new(license_manager_report_generator_arn: license_manager_report_generator_arn)
        get_license_manager_report_generator(input)
      end

      def get_license_manager_report_generator(input : Types::GetLicenseManagerReportGeneratorRequest) : Types::GetLicenseManagerReportGeneratorResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LICENSE_MANAGER_REPORT_GENERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLicenseManagerReportGeneratorResponse, "GetLicenseManagerReportGenerator")
      end

      # Gets detailed information about the usage of the specified license.

      def get_license_usage(
        license_arn : String
      ) : Types::GetLicenseUsageResponse

        input = Types::GetLicenseUsageRequest.new(license_arn: license_arn)
        get_license_usage(input)
      end

      def get_license_usage(input : Types::GetLicenseUsageRequest) : Types::GetLicenseUsageResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LICENSE_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLicenseUsageResponse, "GetLicenseUsage")
      end

      # Gets the License Manager settings for the current Region.

      def get_service_settings : Types::GetServiceSettingsResponse
        input = Types::GetServiceSettingsRequest.new
        get_service_settings(input)
      end

      def get_service_settings(input : Types::GetServiceSettingsRequest) : Types::GetServiceSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceSettingsResponse, "GetServiceSettings")
      end

      # Lists assets for a license asset group.

      def list_assets_for_license_asset_group(
        asset_type : String,
        license_asset_group_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAssetsForLicenseAssetGroupResponse

        input = Types::ListAssetsForLicenseAssetGroupRequest.new(asset_type: asset_type, license_asset_group_arn: license_asset_group_arn, max_results: max_results, next_token: next_token)
        list_assets_for_license_asset_group(input)
      end

      def list_assets_for_license_asset_group(input : Types::ListAssetsForLicenseAssetGroupRequest) : Types::ListAssetsForLicenseAssetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ASSETS_FOR_LICENSE_ASSET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAssetsForLicenseAssetGroupResponse, "ListAssetsForLicenseAssetGroup")
      end

      # Lists the resource associations for the specified license configuration. Resource associations need
      # not consume licenses from a license configuration. For example, an AMI or a stopped instance might
      # not consume a license (depending on the license rules).

      def list_associations_for_license_configuration(
        license_configuration_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAssociationsForLicenseConfigurationResponse

        input = Types::ListAssociationsForLicenseConfigurationRequest.new(license_configuration_arn: license_configuration_arn, max_results: max_results, next_token: next_token)
        list_associations_for_license_configuration(input)
      end

      def list_associations_for_license_configuration(input : Types::ListAssociationsForLicenseConfigurationRequest) : Types::ListAssociationsForLicenseConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ASSOCIATIONS_FOR_LICENSE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAssociationsForLicenseConfigurationResponse, "ListAssociationsForLicenseConfiguration")
      end

      # Lists the grants distributed for the specified license.

      def list_distributed_grants(
        filters : Array(Types::Filter)? = nil,
        grant_arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDistributedGrantsResponse

        input = Types::ListDistributedGrantsRequest.new(filters: filters, grant_arns: grant_arns, max_results: max_results, next_token: next_token)
        list_distributed_grants(input)
      end

      def list_distributed_grants(input : Types::ListDistributedGrantsRequest) : Types::ListDistributedGrantsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DISTRIBUTED_GRANTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDistributedGrantsResponse, "ListDistributedGrants")
      end

      # Lists the license configuration operations that failed.

      def list_failures_for_license_configuration_operations(
        license_configuration_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFailuresForLicenseConfigurationOperationsResponse

        input = Types::ListFailuresForLicenseConfigurationOperationsRequest.new(license_configuration_arn: license_configuration_arn, max_results: max_results, next_token: next_token)
        list_failures_for_license_configuration_operations(input)
      end

      def list_failures_for_license_configuration_operations(input : Types::ListFailuresForLicenseConfigurationOperationsRequest) : Types::ListFailuresForLicenseConfigurationOperationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FAILURES_FOR_LICENSE_CONFIGURATION_OPERATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFailuresForLicenseConfigurationOperationsResponse, "ListFailuresForLicenseConfigurationOperations")
      end

      # Lists license asset groups.

      def list_license_asset_groups(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLicenseAssetGroupsResponse

        input = Types::ListLicenseAssetGroupsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_license_asset_groups(input)
      end

      def list_license_asset_groups(input : Types::ListLicenseAssetGroupsRequest) : Types::ListLicenseAssetGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LICENSE_ASSET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLicenseAssetGroupsResponse, "ListLicenseAssetGroups")
      end

      # Lists license asset rulesets.

      def list_license_asset_rulesets(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        show_aws_managed_license_asset_rulesets : Bool? = nil
      ) : Types::ListLicenseAssetRulesetsResponse

        input = Types::ListLicenseAssetRulesetsRequest.new(filters: filters, max_results: max_results, next_token: next_token, show_aws_managed_license_asset_rulesets: show_aws_managed_license_asset_rulesets)
        list_license_asset_rulesets(input)
      end

      def list_license_asset_rulesets(input : Types::ListLicenseAssetRulesetsRequest) : Types::ListLicenseAssetRulesetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LICENSE_ASSET_RULESETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLicenseAssetRulesetsResponse, "ListLicenseAssetRulesets")
      end

      # Lists the license configurations for your account.

      def list_license_configurations(
        filters : Array(Types::Filter)? = nil,
        license_configuration_arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLicenseConfigurationsResponse

        input = Types::ListLicenseConfigurationsRequest.new(filters: filters, license_configuration_arns: license_configuration_arns, max_results: max_results, next_token: next_token)
        list_license_configurations(input)
      end

      def list_license_configurations(input : Types::ListLicenseConfigurationsRequest) : Types::ListLicenseConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LICENSE_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLicenseConfigurationsResponse, "ListLicenseConfigurations")
      end

      # Lists license configurations for an organization.

      def list_license_configurations_for_organization(
        filters : Array(Types::Filter)? = nil,
        license_configuration_arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLicenseConfigurationsForOrganizationResponse

        input = Types::ListLicenseConfigurationsForOrganizationRequest.new(filters: filters, license_configuration_arns: license_configuration_arns, max_results: max_results, next_token: next_token)
        list_license_configurations_for_organization(input)
      end

      def list_license_configurations_for_organization(input : Types::ListLicenseConfigurationsForOrganizationRequest) : Types::ListLicenseConfigurationsForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LICENSE_CONFIGURATIONS_FOR_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLicenseConfigurationsForOrganizationResponse, "ListLicenseConfigurationsForOrganization")
      end

      # Lists the license type conversion tasks for your account.

      def list_license_conversion_tasks(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLicenseConversionTasksResponse

        input = Types::ListLicenseConversionTasksRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_license_conversion_tasks(input)
      end

      def list_license_conversion_tasks(input : Types::ListLicenseConversionTasksRequest) : Types::ListLicenseConversionTasksResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LICENSE_CONVERSION_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLicenseConversionTasksResponse, "ListLicenseConversionTasks")
      end

      # Lists the report generators for your account.

      def list_license_manager_report_generators(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLicenseManagerReportGeneratorsResponse

        input = Types::ListLicenseManagerReportGeneratorsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_license_manager_report_generators(input)
      end

      def list_license_manager_report_generators(input : Types::ListLicenseManagerReportGeneratorsRequest) : Types::ListLicenseManagerReportGeneratorsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LICENSE_MANAGER_REPORT_GENERATORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLicenseManagerReportGeneratorsResponse, "ListLicenseManagerReportGenerators")
      end

      # Describes the license configurations for the specified resource.

      def list_license_specifications_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLicenseSpecificationsForResourceResponse

        input = Types::ListLicenseSpecificationsForResourceRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_license_specifications_for_resource(input)
      end

      def list_license_specifications_for_resource(input : Types::ListLicenseSpecificationsForResourceRequest) : Types::ListLicenseSpecificationsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LICENSE_SPECIFICATIONS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLicenseSpecificationsForResourceResponse, "ListLicenseSpecificationsForResource")
      end

      # Lists all versions of the specified license.

      def list_license_versions(
        license_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLicenseVersionsResponse

        input = Types::ListLicenseVersionsRequest.new(license_arn: license_arn, max_results: max_results, next_token: next_token)
        list_license_versions(input)
      end

      def list_license_versions(input : Types::ListLicenseVersionsRequest) : Types::ListLicenseVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LICENSE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLicenseVersionsResponse, "ListLicenseVersions")
      end

      # Lists the licenses for your account.

      def list_licenses(
        filters : Array(Types::Filter)? = nil,
        license_arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLicensesResponse

        input = Types::ListLicensesRequest.new(filters: filters, license_arns: license_arns, max_results: max_results, next_token: next_token)
        list_licenses(input)
      end

      def list_licenses(input : Types::ListLicensesRequest) : Types::ListLicensesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LICENSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLicensesResponse, "ListLicenses")
      end

      # Lists grants that are received. Received grants are grants created while specifying the recipient as
      # this Amazon Web Services account, your organization, or an organizational unit (OU) to which this
      # member account belongs.

      def list_received_grants(
        filters : Array(Types::Filter)? = nil,
        grant_arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListReceivedGrantsResponse

        input = Types::ListReceivedGrantsRequest.new(filters: filters, grant_arns: grant_arns, max_results: max_results, next_token: next_token)
        list_received_grants(input)
      end

      def list_received_grants(input : Types::ListReceivedGrantsRequest) : Types::ListReceivedGrantsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RECEIVED_GRANTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReceivedGrantsResponse, "ListReceivedGrants")
      end

      # Lists the grants received for all accounts in the organization.

      def list_received_grants_for_organization(
        license_arn : String,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListReceivedGrantsForOrganizationResponse

        input = Types::ListReceivedGrantsForOrganizationRequest.new(license_arn: license_arn, filters: filters, max_results: max_results, next_token: next_token)
        list_received_grants_for_organization(input)
      end

      def list_received_grants_for_organization(input : Types::ListReceivedGrantsForOrganizationRequest) : Types::ListReceivedGrantsForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RECEIVED_GRANTS_FOR_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReceivedGrantsForOrganizationResponse, "ListReceivedGrantsForOrganization")
      end

      # Lists received licenses.

      def list_received_licenses(
        filters : Array(Types::Filter)? = nil,
        license_arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListReceivedLicensesResponse

        input = Types::ListReceivedLicensesRequest.new(filters: filters, license_arns: license_arns, max_results: max_results, next_token: next_token)
        list_received_licenses(input)
      end

      def list_received_licenses(input : Types::ListReceivedLicensesRequest) : Types::ListReceivedLicensesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RECEIVED_LICENSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReceivedLicensesResponse, "ListReceivedLicenses")
      end

      # Lists the licenses received for all accounts in the organization.

      def list_received_licenses_for_organization(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListReceivedLicensesForOrganizationResponse

        input = Types::ListReceivedLicensesForOrganizationRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_received_licenses_for_organization(input)
      end

      def list_received_licenses_for_organization(input : Types::ListReceivedLicensesForOrganizationRequest) : Types::ListReceivedLicensesForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RECEIVED_LICENSES_FOR_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReceivedLicensesForOrganizationResponse, "ListReceivedLicensesForOrganization")
      end

      # Lists resources managed using Systems Manager inventory.

      def list_resource_inventory(
        filters : Array(Types::InventoryFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResourceInventoryResponse

        input = Types::ListResourceInventoryRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_resource_inventory(input)
      end

      def list_resource_inventory(input : Types::ListResourceInventoryRequest) : Types::ListResourceInventoryResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCE_INVENTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourceInventoryResponse, "ListResourceInventory")
      end

      # Lists the tags for the specified resource. For more information about tagging support in License
      # Manager, see the TagResource operation.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Lists your tokens.

      def list_tokens(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        token_ids : Array(String)? = nil
      ) : Types::ListTokensResponse

        input = Types::ListTokensRequest.new(filters: filters, max_results: max_results, next_token: next_token, token_ids: token_ids)
        list_tokens(input)
      end

      def list_tokens(input : Types::ListTokensRequest) : Types::ListTokensResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TOKENS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTokensResponse, "ListTokens")
      end

      # Lists all license usage records for a license configuration, displaying license consumption details
      # by resource at a selected point in time. Use this action to audit the current license consumption
      # for any license inventory and configuration.

      def list_usage_for_license_configuration(
        license_configuration_arn : String,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListUsageForLicenseConfigurationResponse

        input = Types::ListUsageForLicenseConfigurationRequest.new(license_configuration_arn: license_configuration_arn, filters: filters, max_results: max_results, next_token: next_token)
        list_usage_for_license_configuration(input)
      end

      def list_usage_for_license_configuration(input : Types::ListUsageForLicenseConfigurationRequest) : Types::ListUsageForLicenseConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USAGE_FOR_LICENSE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUsageForLicenseConfigurationResponse, "ListUsageForLicenseConfiguration")
      end

      # Rejects the specified grant.

      def reject_grant(
        grant_arn : String
      ) : Types::RejectGrantResponse

        input = Types::RejectGrantRequest.new(grant_arn: grant_arn)
        reject_grant(input)
      end

      def reject_grant(input : Types::RejectGrantRequest) : Types::RejectGrantResponse
        request = Protocol::JsonRpc.build_request(Model::REJECT_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RejectGrantResponse, "RejectGrant")
      end

      # Adds the specified tags to the specified resource. The following resources support tagging in
      # License Manager: Licenses Grants License configurations Report generators

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes the specified tags from the specified resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates a license asset group.

      def update_license_asset_group(
        associated_license_asset_ruleset_ar_ns : Array(String),
        client_token : String,
        license_asset_group_arn : String,
        description : String? = nil,
        license_asset_group_configurations : Array(Types::LicenseAssetGroupConfiguration)? = nil,
        name : String? = nil,
        properties : Array(Types::LicenseAssetGroupProperty)? = nil,
        status : String? = nil
      ) : Types::UpdateLicenseAssetGroupResponse

        input = Types::UpdateLicenseAssetGroupRequest.new(associated_license_asset_ruleset_ar_ns: associated_license_asset_ruleset_ar_ns, client_token: client_token, license_asset_group_arn: license_asset_group_arn, description: description, license_asset_group_configurations: license_asset_group_configurations, name: name, properties: properties, status: status)
        update_license_asset_group(input)
      end

      def update_license_asset_group(input : Types::UpdateLicenseAssetGroupRequest) : Types::UpdateLicenseAssetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LICENSE_ASSET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLicenseAssetGroupResponse, "UpdateLicenseAssetGroup")
      end

      # Updates a license asset ruleset.

      def update_license_asset_ruleset(
        client_token : String,
        license_asset_ruleset_arn : String,
        rules : Array(Types::LicenseAssetRule),
        description : String? = nil,
        name : String? = nil
      ) : Types::UpdateLicenseAssetRulesetResponse

        input = Types::UpdateLicenseAssetRulesetRequest.new(client_token: client_token, license_asset_ruleset_arn: license_asset_ruleset_arn, rules: rules, description: description, name: name)
        update_license_asset_ruleset(input)
      end

      def update_license_asset_ruleset(input : Types::UpdateLicenseAssetRulesetRequest) : Types::UpdateLicenseAssetRulesetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LICENSE_ASSET_RULESET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLicenseAssetRulesetResponse, "UpdateLicenseAssetRuleset")
      end

      # Modifies the attributes of an existing license configuration.

      def update_license_configuration(
        license_configuration_arn : String,
        description : String? = nil,
        disassociate_when_not_found : Bool? = nil,
        license_configuration_status : String? = nil,
        license_count : Int64? = nil,
        license_count_hard_limit : Bool? = nil,
        license_expiry : Int64? = nil,
        license_rules : Array(String)? = nil,
        name : String? = nil,
        product_information_list : Array(Types::ProductInformation)? = nil
      ) : Types::UpdateLicenseConfigurationResponse

        input = Types::UpdateLicenseConfigurationRequest.new(license_configuration_arn: license_configuration_arn, description: description, disassociate_when_not_found: disassociate_when_not_found, license_configuration_status: license_configuration_status, license_count: license_count, license_count_hard_limit: license_count_hard_limit, license_expiry: license_expiry, license_rules: license_rules, name: name, product_information_list: product_information_list)
        update_license_configuration(input)
      end

      def update_license_configuration(input : Types::UpdateLicenseConfigurationRequest) : Types::UpdateLicenseConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LICENSE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLicenseConfigurationResponse, "UpdateLicenseConfiguration")
      end

      # Updates a report generator. After you make changes to a report generator, it starts generating new
      # reports within 60 minutes of being updated.

      def update_license_manager_report_generator(
        client_token : String,
        license_manager_report_generator_arn : String,
        report_context : Types::ReportContext,
        report_frequency : Types::ReportFrequency,
        report_generator_name : String,
        type : Array(String),
        description : String? = nil
      ) : Types::UpdateLicenseManagerReportGeneratorResponse

        input = Types::UpdateLicenseManagerReportGeneratorRequest.new(client_token: client_token, license_manager_report_generator_arn: license_manager_report_generator_arn, report_context: report_context, report_frequency: report_frequency, report_generator_name: report_generator_name, type: type, description: description)
        update_license_manager_report_generator(input)
      end

      def update_license_manager_report_generator(input : Types::UpdateLicenseManagerReportGeneratorRequest) : Types::UpdateLicenseManagerReportGeneratorResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LICENSE_MANAGER_REPORT_GENERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLicenseManagerReportGeneratorResponse, "UpdateLicenseManagerReportGenerator")
      end

      # Adds or removes the specified license configurations for the specified Amazon Web Services resource.
      # You can update the license specifications of AMIs, instances, and hosts. You cannot update the
      # license specifications for launch templates and CloudFormation templates, as they send license
      # configurations to the operation that creates the resource.

      def update_license_specifications_for_resource(
        resource_arn : String,
        add_license_specifications : Array(Types::LicenseSpecification)? = nil,
        remove_license_specifications : Array(Types::LicenseSpecification)? = nil
      ) : Types::UpdateLicenseSpecificationsForResourceResponse

        input = Types::UpdateLicenseSpecificationsForResourceRequest.new(resource_arn: resource_arn, add_license_specifications: add_license_specifications, remove_license_specifications: remove_license_specifications)
        update_license_specifications_for_resource(input)
      end

      def update_license_specifications_for_resource(input : Types::UpdateLicenseSpecificationsForResourceRequest) : Types::UpdateLicenseSpecificationsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LICENSE_SPECIFICATIONS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLicenseSpecificationsForResourceResponse, "UpdateLicenseSpecificationsForResource")
      end

      # Updates License Manager settings for the current Region.

      def update_service_settings(
        enable_cross_accounts_discovery : Bool? = nil,
        enabled_discovery_source_regions : Array(String)? = nil,
        organization_configuration : Types::OrganizationConfiguration? = nil,
        s3_bucket_arn : String? = nil,
        sns_topic_arn : String? = nil
      ) : Types::UpdateServiceSettingsResponse

        input = Types::UpdateServiceSettingsRequest.new(enable_cross_accounts_discovery: enable_cross_accounts_discovery, enabled_discovery_source_regions: enabled_discovery_source_regions, organization_configuration: organization_configuration, s3_bucket_arn: s3_bucket_arn, sns_topic_arn: sns_topic_arn)
        update_service_settings(input)
      end

      def update_service_settings(input : Types::UpdateServiceSettingsRequest) : Types::UpdateServiceSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceSettingsResponse, "UpdateServiceSettings")
      end
    end
  end
end
