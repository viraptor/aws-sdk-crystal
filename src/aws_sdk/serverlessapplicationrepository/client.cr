module AwsSdk
  module ServerlessApplicationRepository
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

      # Creates an application, optionally including an AWS SAM file to create the first application version
      # in the same call.

      def create_application(
        author : String,
        description : String,
        name : String,
        home_page_url : String? = nil,
        labels : Array(String)? = nil,
        license_body : String? = nil,
        license_url : String? = nil,
        readme_body : String? = nil,
        readme_url : String? = nil,
        semantic_version : String? = nil,
        source_code_archive_url : String? = nil,
        source_code_url : String? = nil,
        spdx_license_id : String? = nil,
        template_body : String? = nil,
        template_url : String? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationRequest.new(author: author, description: description, name: name, home_page_url: home_page_url, labels: labels, license_body: license_body, license_url: license_url, readme_body: readme_body, readme_url: readme_url, semantic_version: semantic_version, source_code_archive_url: source_code_archive_url, source_code_url: source_code_url, spdx_license_id: spdx_license_id, template_body: template_body, template_url: template_url)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an application version.

      def create_application_version(
        application_id : String,
        semantic_version : String,
        source_code_archive_url : String? = nil,
        source_code_url : String? = nil,
        template_body : String? = nil,
        template_url : String? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationVersionRequest.new(application_id: application_id, semantic_version: semantic_version, source_code_archive_url: source_code_archive_url, source_code_url: source_code_url, template_body: template_body, template_url: template_url)
        create_application_version(input)
      end

      def create_application_version(input : Types::CreateApplicationVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an AWS CloudFormation change set for the given application.

      def create_cloud_formation_change_set(
        application_id : String,
        stack_name : String,
        capabilities : Array(String)? = nil,
        change_set_name : String? = nil,
        client_token : String? = nil,
        description : String? = nil,
        notification_arns : Array(String)? = nil,
        parameter_overrides : Array(Types::ParameterValue)? = nil,
        resource_types : Array(String)? = nil,
        rollback_configuration : Types::RollbackConfiguration? = nil,
        semantic_version : String? = nil,
        tags : Array(Types::Tag)? = nil,
        template_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateCloudFormationChangeSetRequest.new(application_id: application_id, stack_name: stack_name, capabilities: capabilities, change_set_name: change_set_name, client_token: client_token, description: description, notification_arns: notification_arns, parameter_overrides: parameter_overrides, resource_types: resource_types, rollback_configuration: rollback_configuration, semantic_version: semantic_version, tags: tags, template_id: template_id)
        create_cloud_formation_change_set(input)
      end

      def create_cloud_formation_change_set(input : Types::CreateCloudFormationChangeSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLOUD_FORMATION_CHANGE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an AWS CloudFormation template.

      def create_cloud_formation_template(
        application_id : String,
        semantic_version : String? = nil
      ) : Protocol::Request
        input = Types::CreateCloudFormationTemplateRequest.new(application_id: application_id, semantic_version: semantic_version)
        create_cloud_formation_template(input)
      end

      def create_cloud_formation_template(input : Types::CreateCloudFormationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLOUD_FORMATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified application.

      def delete_application(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteApplicationRequest.new(application_id: application_id)
        delete_application(input)
      end

      def delete_application(input : Types::DeleteApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the specified application.

      def get_application(
        application_id : String,
        semantic_version : String? = nil
      ) : Protocol::Request
        input = Types::GetApplicationRequest.new(application_id: application_id, semantic_version: semantic_version)
        get_application(input)
      end

      def get_application(input : Types::GetApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the policy for the application.

      def get_application_policy(
        application_id : String
      ) : Protocol::Request
        input = Types::GetApplicationPolicyRequest.new(application_id: application_id)
        get_application_policy(input)
      end

      def get_application_policy(input : Types::GetApplicationPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the specified AWS CloudFormation template.

      def get_cloud_formation_template(
        application_id : String,
        template_id : String
      ) : Protocol::Request
        input = Types::GetCloudFormationTemplateRequest.new(application_id: application_id, template_id: template_id)
        get_cloud_formation_template(input)
      end

      def get_cloud_formation_template(input : Types::GetCloudFormationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLOUD_FORMATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the list of applications nested in the containing application.

      def list_application_dependencies(
        application_id : String,
        max_items : Int32? = nil,
        next_token : String? = nil,
        semantic_version : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationDependenciesRequest.new(application_id: application_id, max_items: max_items, next_token: next_token, semantic_version: semantic_version)
        list_application_dependencies(input)
      end

      def list_application_dependencies(input : Types::ListApplicationDependenciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATION_DEPENDENCIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists versions for the specified application.

      def list_application_versions(
        application_id : String,
        max_items : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationVersionsRequest.new(application_id: application_id, max_items: max_items, next_token: next_token)
        list_application_versions(input)
      end

      def list_application_versions(input : Types::ListApplicationVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATION_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists applications owned by the requester.

      def list_applications(
        max_items : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationsRequest.new(max_items: max_items, next_token: next_token)
        list_applications(input)
      end

      def list_applications(input : Types::ListApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the permission policy for an application. For the list of actions supported for this operation,
      # see Application Permissions .

      def put_application_policy(
        application_id : String,
        statements : Array(Types::ApplicationPolicyStatement)
      ) : Protocol::Request
        input = Types::PutApplicationPolicyRequest.new(application_id: application_id, statements: statements)
        put_application_policy(input)
      end

      def put_application_policy(input : Types::PutApplicationPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_APPLICATION_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Unshares an application from an AWS Organization. This operation can be called only from the
      # organization's master account.

      def unshare_application(
        application_id : String,
        organization_id : String
      ) : Protocol::Request
        input = Types::UnshareApplicationRequest.new(application_id: application_id, organization_id: organization_id)
        unshare_application(input)
      end

      def unshare_application(input : Types::UnshareApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNSHARE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified application.

      def update_application(
        application_id : String,
        author : String? = nil,
        description : String? = nil,
        home_page_url : String? = nil,
        labels : Array(String)? = nil,
        readme_body : String? = nil,
        readme_url : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApplicationRequest.new(application_id: application_id, author: author, description: description, home_page_url: home_page_url, labels: labels, readme_body: readme_body, readme_url: readme_url)
        update_application(input)
      end

      def update_application(input : Types::UpdateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
