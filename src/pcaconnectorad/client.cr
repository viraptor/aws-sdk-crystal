module Aws
  module PcaConnectorAd
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates a connector between Amazon Web Services Private CA and an Active Directory. You must specify
      # the private CA, directory ID, and security groups.

      def create_connector(
        certificate_authority_arn : String,
        directory_id : String,
        vpc_information : Types::VpcInformation,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConnectorRequest.new(certificate_authority_arn: certificate_authority_arn, directory_id: directory_id, vpc_information: vpc_information, client_token: client_token, tags: tags)
        create_connector(input)
      end

      def create_connector(input : Types::CreateConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a directory registration that authorizes communication between Amazon Web Services Private
      # CA and an Active Directory

      def create_directory_registration(
        directory_id : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDirectoryRegistrationRequest.new(directory_id: directory_id, client_token: client_token, tags: tags)
        create_directory_registration(input)
      end

      def create_directory_registration(input : Types::CreateDirectoryRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DIRECTORY_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a service principal name (SPN) for the service account in Active Directory. Kerberos
      # authentication uses SPNs to associate a service instance with a service sign-in account.

      def create_service_principal_name(
        connector_arn : String,
        directory_registration_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateServicePrincipalNameRequest.new(connector_arn: connector_arn, directory_registration_arn: directory_registration_arn, client_token: client_token)
        create_service_principal_name(input)
      end

      def create_service_principal_name(input : Types::CreateServicePrincipalNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SERVICE_PRINCIPAL_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Active Directory compatible certificate template. The connectors issues certificates
      # using these templates based on the requester’s Active Directory group membership.

      def create_template(
        connector_arn : String,
        definition : Types::TemplateDefinition,
        name : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTemplateRequest.new(connector_arn: connector_arn, definition: definition, name: name, client_token: client_token, tags: tags)
        create_template(input)
      end

      def create_template(input : Types::CreateTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a group access control entry. Allow or deny Active Directory groups from enrolling and/or
      # autoenrolling with the template based on the group security identifiers (SIDs).

      def create_template_group_access_control_entry(
        access_rights : Types::AccessRights,
        group_display_name : String,
        group_security_identifier : String,
        template_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateTemplateGroupAccessControlEntryRequest.new(access_rights: access_rights, group_display_name: group_display_name, group_security_identifier: group_security_identifier, template_arn: template_arn, client_token: client_token)
        create_template_group_access_control_entry(input)
      end

      def create_template_group_access_control_entry(input : Types::CreateTemplateGroupAccessControlEntryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TEMPLATE_GROUP_ACCESS_CONTROL_ENTRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a connector for Active Directory. You must provide the Amazon Resource Name (ARN) of the
      # connector that you want to delete. You can find the ARN by calling the
      # https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_ListConnectors action. Deleting
      # a connector does not deregister your directory with Amazon Web Services Private CA. You can
      # deregister your directory by calling the
      # https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_DeleteDirectoryRegistration
      # action.

      def delete_connector(
        connector_arn : String
      ) : Protocol::Request
        input = Types::DeleteConnectorRequest.new(connector_arn: connector_arn)
        delete_connector(input)
      end

      def delete_connector(input : Types::DeleteConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a directory registration. Deleting a directory registration deauthorizes Amazon Web Services
      # Private CA with the directory.

      def delete_directory_registration(
        directory_registration_arn : String
      ) : Protocol::Request
        input = Types::DeleteDirectoryRegistrationRequest.new(directory_registration_arn: directory_registration_arn)
        delete_directory_registration(input)
      end

      def delete_directory_registration(input : Types::DeleteDirectoryRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DIRECTORY_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the service principal name (SPN) used by a connector to authenticate with your Active
      # Directory.

      def delete_service_principal_name(
        connector_arn : String,
        directory_registration_arn : String
      ) : Protocol::Request
        input = Types::DeleteServicePrincipalNameRequest.new(connector_arn: connector_arn, directory_registration_arn: directory_registration_arn)
        delete_service_principal_name(input)
      end

      def delete_service_principal_name(input : Types::DeleteServicePrincipalNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SERVICE_PRINCIPAL_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a template. Certificates issued using the template are still valid until they are revoked or
      # expired.

      def delete_template(
        template_arn : String
      ) : Protocol::Request
        input = Types::DeleteTemplateRequest.new(template_arn: template_arn)
        delete_template(input)
      end

      def delete_template(input : Types::DeleteTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a group access control entry.

      def delete_template_group_access_control_entry(
        group_security_identifier : String,
        template_arn : String
      ) : Protocol::Request
        input = Types::DeleteTemplateGroupAccessControlEntryRequest.new(group_security_identifier: group_security_identifier, template_arn: template_arn)
        delete_template_group_access_control_entry(input)
      end

      def delete_template_group_access_control_entry(input : Types::DeleteTemplateGroupAccessControlEntryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TEMPLATE_GROUP_ACCESS_CONTROL_ENTRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about your connector. You specify the connector on input by its ARN (Amazon
      # Resource Name).

      def get_connector(
        connector_arn : String
      ) : Protocol::Request
        input = Types::GetConnectorRequest.new(connector_arn: connector_arn)
        get_connector(input)
      end

      def get_connector(input : Types::GetConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A structure that contains information about your directory registration.

      def get_directory_registration(
        directory_registration_arn : String
      ) : Protocol::Request
        input = Types::GetDirectoryRegistrationRequest.new(directory_registration_arn: directory_registration_arn)
        get_directory_registration(input)
      end

      def get_directory_registration(input : Types::GetDirectoryRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DIRECTORY_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the service principal name that the connector uses to authenticate with Active Directory.

      def get_service_principal_name(
        connector_arn : String,
        directory_registration_arn : String
      ) : Protocol::Request
        input = Types::GetServicePrincipalNameRequest.new(connector_arn: connector_arn, directory_registration_arn: directory_registration_arn)
        get_service_principal_name(input)
      end

      def get_service_principal_name(input : Types::GetServicePrincipalNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_PRINCIPAL_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a certificate template that the connector uses to issue certificates from a private CA.

      def get_template(
        template_arn : String
      ) : Protocol::Request
        input = Types::GetTemplateRequest.new(template_arn: template_arn)
        get_template(input)
      end

      def get_template(input : Types::GetTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the group access control entries for a template.

      def get_template_group_access_control_entry(
        group_security_identifier : String,
        template_arn : String
      ) : Protocol::Request
        input = Types::GetTemplateGroupAccessControlEntryRequest.new(group_security_identifier: group_security_identifier, template_arn: template_arn)
        get_template_group_access_control_entry(input)
      end

      def get_template_group_access_control_entry(input : Types::GetTemplateGroupAccessControlEntryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TEMPLATE_GROUP_ACCESS_CONTROL_ENTRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the connectors that you created by using the
      # https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateConnector action.

      def list_connectors(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectorsRequest.new(max_results: max_results, next_token: next_token)
        list_connectors(input)
      end

      def list_connectors(input : Types::ListConnectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the directory registrations that you created by using the
      # https://docs.aws.amazon.com/pca-connector-ad/latest/APIReference/API_CreateDirectoryRegistration
      # action.

      def list_directory_registrations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDirectoryRegistrationsRequest.new(max_results: max_results, next_token: next_token)
        list_directory_registrations(input)
      end

      def list_directory_registrations(input : Types::ListDirectoryRegistrationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DIRECTORY_REGISTRATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the service principal names that the connector uses to authenticate with Active Directory.

      def list_service_principal_names(
        directory_registration_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServicePrincipalNamesRequest.new(directory_registration_arn: directory_registration_arn, max_results: max_results, next_token: next_token)
        list_service_principal_names(input)
      end

      def list_service_principal_names(input : Types::ListServicePrincipalNamesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_PRINCIPAL_NAMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags, if any, that are associated with your resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists group access control entries you created.

      def list_template_group_access_control_entries(
        template_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTemplateGroupAccessControlEntriesRequest.new(template_arn: template_arn, max_results: max_results, next_token: next_token)
        list_template_group_access_control_entries(input)
      end

      def list_template_group_access_control_entries(input : Types::ListTemplateGroupAccessControlEntriesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATE_GROUP_ACCESS_CONTROL_ENTRIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the templates, if any, that are associated with a connector.

      def list_templates(
        connector_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTemplatesRequest.new(connector_arn: connector_arn, max_results: max_results, next_token: next_token)
        list_templates(input)
      end

      def list_templates(input : Types::ListTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more tags to your resource.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from your resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update template configuration to define the information included in certificates.

      def update_template(
        template_arn : String,
        definition : Types::TemplateDefinition? = nil,
        reenroll_all_certificate_holders : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateTemplateRequest.new(template_arn: template_arn, definition: definition, reenroll_all_certificate_holders: reenroll_all_certificate_holders)
        update_template(input)
      end

      def update_template(input : Types::UpdateTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a group access control entry you created using CreateTemplateGroupAccessControlEntry .

      def update_template_group_access_control_entry(
        group_security_identifier : String,
        template_arn : String,
        access_rights : Types::AccessRights? = nil,
        group_display_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTemplateGroupAccessControlEntryRequest.new(group_security_identifier: group_security_identifier, template_arn: template_arn, access_rights: access_rights, group_display_name: group_display_name)
        update_template_group_access_control_entry(input)
      end

      def update_template_group_access_control_entry(input : Types::UpdateTemplateGroupAccessControlEntryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TEMPLATE_GROUP_ACCESS_CONTROL_ENTRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
