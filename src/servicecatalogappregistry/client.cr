module Aws
  module ServiceCatalogAppRegistry
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

      # Associates an attribute group with an application to augment the application's metadata with the
      # group's attributes. This feature enables applications to be described with user-defined details that
      # are machine-readable, such as third-party integrations.

      def associate_attribute_group(
        application : String,
        attribute_group : String
      ) : Protocol::Request
        input = Types::AssociateAttributeGroupRequest.new(application: application, attribute_group: attribute_group)
        associate_attribute_group(input)
      end

      def associate_attribute_group(input : Types::AssociateAttributeGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_ATTRIBUTE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a resource with an application. The resource can be specified by its ARN or name. The
      # application can be specified by ARN, ID, or name. Minimum permissions You must have the following
      # permissions to associate a resource using the OPTIONS parameter set to APPLY_APPLICATION_TAG .
      # tag:GetResources tag:TagResources You must also have these additional permissions if you don't use
      # the AWSServiceCatalogAppRegistryFullAccess policy. For more information, see
      # AWSServiceCatalogAppRegistryFullAccess in the AppRegistry Administrator Guide.
      # resource-groups:AssociateResource cloudformation:UpdateStack cloudformation:DescribeStacks In
      # addition, you must have the tagging permission defined by the Amazon Web Services service that
      # creates the resource. For more information, see TagResources in the Resource Groups Tagging API
      # Reference .

      def associate_resource(
        application : String,
        resource : String,
        resource_type : String,
        options : Array(String)? = nil
      ) : Protocol::Request
        input = Types::AssociateResourceRequest.new(application: application, resource: resource, resource_type: resource_type, options: options)
        associate_resource(input)
      end

      def associate_resource(input : Types::AssociateResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new application that is the top-level node in a hierarchy of related cloud resource
      # abstractions.

      def create_application(
        client_token : String,
        name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationRequest.new(client_token: client_token, name: name, description: description, tags: tags)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new attribute group as a container for user-defined attributes. This feature enables users
      # to have full control over their cloud application's metadata in a rich machine-readable format to
      # facilitate integration with automated workflows and third-party tools.

      def create_attribute_group(
        attributes : String,
        client_token : String,
        name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAttributeGroupRequest.new(attributes: attributes, client_token: client_token, name: name, description: description, tags: tags)
        create_attribute_group(input)
      end

      def create_attribute_group(input : Types::CreateAttributeGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ATTRIBUTE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an application that is specified either by its application ID, name, or ARN. All associated
      # attribute groups and resources must be disassociated from it before deleting an application.

      def delete_application(
        application : String
      ) : Protocol::Request
        input = Types::DeleteApplicationRequest.new(application: application)
        delete_application(input)
      end

      def delete_application(input : Types::DeleteApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an attribute group, specified either by its attribute group ID, name, or ARN.

      def delete_attribute_group(
        attribute_group : String
      ) : Protocol::Request
        input = Types::DeleteAttributeGroupRequest.new(attribute_group: attribute_group)
        delete_attribute_group(input)
      end

      def delete_attribute_group(input : Types::DeleteAttributeGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ATTRIBUTE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates an attribute group from an application to remove the extra attributes contained in the
      # attribute group from the application's metadata. This operation reverts AssociateAttributeGroup .

      def disassociate_attribute_group(
        application : String,
        attribute_group : String
      ) : Protocol::Request
        input = Types::DisassociateAttributeGroupRequest.new(application: application, attribute_group: attribute_group)
        disassociate_attribute_group(input)
      end

      def disassociate_attribute_group(input : Types::DisassociateAttributeGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_ATTRIBUTE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a resource from application. Both the resource and the application can be specified
      # either by ID or name. Minimum permissions You must have the following permissions to remove a
      # resource that's been associated with an application using the APPLY_APPLICATION_TAG option for
      # AssociateResource . tag:GetResources tag:UntagResources You must also have the following permissions
      # if you don't use the AWSServiceCatalogAppRegistryFullAccess policy. For more information, see
      # AWSServiceCatalogAppRegistryFullAccess in the AppRegistry Administrator Guide.
      # resource-groups:DisassociateResource cloudformation:UpdateStack cloudformation:DescribeStacks In
      # addition, you must have the tagging permission defined by the Amazon Web Services service that
      # creates the resource. For more information, see UntagResources in the Resource Groups Tagging API
      # Reference .

      def disassociate_resource(
        application : String,
        resource : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::DisassociateResourceRequest.new(application: application, resource: resource, resource_type: resource_type)
        disassociate_resource(input)
      end

      def disassociate_resource(input : Types::DisassociateResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves metadata information about one of your applications. The application can be specified by
      # its ARN, ID, or name (which is unique within one account in one region at a given point in time).
      # Specify by ARN or ID in automated workflows if you want to make sure that the exact same application
      # is returned or a ResourceNotFoundException is thrown, avoiding the ABA addressing problem.

      def get_application(
        application : String
      ) : Protocol::Request
        input = Types::GetApplicationRequest.new(application: application)
        get_application(input)
      end

      def get_application(input : Types::GetApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the resource associated with the application.

      def get_associated_resource(
        application : String,
        resource : String,
        resource_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_tag_status : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetAssociatedResourceRequest.new(application: application, resource: resource, resource_type: resource_type, max_results: max_results, next_token: next_token, resource_tag_status: resource_tag_status)
        get_associated_resource(input)
      end

      def get_associated_resource(input : Types::GetAssociatedResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSOCIATED_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves an attribute group by its ARN, ID, or name. The attribute group can be specified by its
      # ARN, ID, or name.

      def get_attribute_group(
        attribute_group : String
      ) : Protocol::Request
        input = Types::GetAttributeGroupRequest.new(attribute_group: attribute_group)
        get_attribute_group(input)
      end

      def get_attribute_group(input : Types::GetAttributeGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ATTRIBUTE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a TagKey configuration from an account.


      def get_configuration : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all of your applications. Results are paginated.

      def list_applications(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationsRequest.new(max_results: max_results, next_token: next_token)
        list_applications(input)
      end

      def list_applications(input : Types::ListApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all attribute groups that are associated with specified application. Results are paginated.

      def list_associated_attribute_groups(
        application : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssociatedAttributeGroupsRequest.new(application: application, max_results: max_results, next_token: next_token)
        list_associated_attribute_groups(input)
      end

      def list_associated_attribute_groups(input : Types::ListAssociatedAttributeGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSOCIATED_ATTRIBUTE_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the resources that are associated with the specified application. Results are
      # paginated. If you share an application, and a consumer account associates a tag query to the
      # application, all of the users who can access the application can also view the tag values in all
      # accounts that are associated with it using this API.

      def list_associated_resources(
        application : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssociatedResourcesRequest.new(application: application, max_results: max_results, next_token: next_token)
        list_associated_resources(input)
      end

      def list_associated_resources(input : Types::ListAssociatedResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSOCIATED_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all attribute groups which you have access to. Results are paginated.

      def list_attribute_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAttributeGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_attribute_groups(input)
      end

      def list_attribute_groups(input : Types::ListAttributeGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ATTRIBUTE_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the details of all attribute groups associated with a specific application. The results
      # display in pages.

      def list_attribute_groups_for_application(
        application : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAttributeGroupsForApplicationRequest.new(application: application, max_results: max_results, next_token: next_token)
        list_attribute_groups_for_application(input)
      end

      def list_attribute_groups_for_application(input : Types::ListAttributeGroupsForApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ATTRIBUTE_GROUPS_FOR_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the tags on the resource.

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

      # Associates a TagKey configuration to an account.

      def put_configuration(
        configuration : Types::AppRegistryConfiguration
      ) : Protocol::Request
        input = Types::PutConfigurationRequest.new(configuration: configuration)
        put_configuration(input)
      end

      def put_configuration(input : Types::PutConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Syncs the resource with current AppRegistry records. Specifically, the resource’s AppRegistry system
      # tags sync with its associated application. We remove the resource's AppRegistry system tags if it
      # does not associate with the application. The caller must have permissions to read and update the
      # resource.

      def sync_resource(
        resource : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::SyncResourceRequest.new(resource: resource, resource_type: resource_type)
        sync_resource(input)
      end

      def sync_resource(input : Types::SyncResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SYNC_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified resource. Each tag consists of a key and
      # an optional value. If a tag with the same key is already associated with the resource, this action
      # updates its value. This operation returns an empty response if the call was successful.

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

      # Removes tags from a resource. This operation returns an empty response if the call was successful.

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

      # Updates an existing application with new attributes.

      def update_application(
        application : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApplicationRequest.new(application: application, description: description, name: name)
        update_application(input)
      end

      def update_application(input : Types::UpdateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing attribute group with new details.

      def update_attribute_group(
        attribute_group : String,
        attributes : String? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAttributeGroupRequest.new(attribute_group: attribute_group, attributes: attributes, description: description, name: name)
        update_attribute_group(input)
      end

      def update_attribute_group(input : Types::UpdateAttributeGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ATTRIBUTE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
