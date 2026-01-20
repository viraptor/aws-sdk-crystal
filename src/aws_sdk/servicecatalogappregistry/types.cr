require "json"
require "time"

module AwsSdk
  module ServiceCatalogAppRegistry
    module Types

      # Includes all of the AppRegistry settings.

      struct AppRegistryConfiguration
        include JSON::Serializable

        # Includes the definition of a tagQuery .

        @[JSON::Field(key: "tagQueryConfiguration")]
        getter tag_query_configuration : Types::TagQueryConfiguration?

        def initialize(
          @tag_query_configuration : Types::TagQueryConfiguration? = nil
        )
        end
      end

      # Represents a Amazon Web Services Service Catalog AppRegistry application that is the top-level node
      # in a hierarchy of related cloud resource abstractions.

      struct Application
        include JSON::Serializable

        # A key-value pair that identifies an associated resource.

        @[JSON::Field(key: "applicationTag")]
        getter application_tag : Hash(String, String)?

        # The Amazon resource name (ARN) that specifies the application across services.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ISO-8601 formatted timestamp of the moment when the application was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the application.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the application.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ISO-8601 formatted timestamp of the moment when the application was last updated.

        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The name of the application. The name must be unique in the region in which you are creating the
        # application.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Key-value pairs you can use to associate with the application.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_tag : Hash(String, String)? = nil,
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_update_time : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Summary of a Amazon Web Services Service Catalog AppRegistry application.

      struct ApplicationSummary
        include JSON::Serializable

        # The Amazon resource name (ARN) that specifies the application across services.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ISO-8601 formatted timestamp of the moment when the application was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the application.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the application.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ISO-8601 formatted timestamp of the moment when the application was last updated.

        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The name of the application. The name must be unique in the region in which you are creating the
        # application.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_update_time : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # The result of the application tag that's applied to a resource.

      struct ApplicationTagResult
        include JSON::Serializable

        # The application tag is in the process of being applied to a resource, was successfully applied to a
        # resource, or failed to apply to a resource.

        @[JSON::Field(key: "applicationTagStatus")]
        getter application_tag_status : String?

        # The message returned if the call fails.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # A unique pagination token for each page of results. Make the call again with the returned token to
        # retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The resources associated with an application

        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::ResourcesListItem)?

        def initialize(
          @application_tag_status : String? = nil,
          @error_message : String? = nil,
          @next_token : String? = nil,
          @resources : Array(Types::ResourcesListItem)? = nil
        )
        end
      end


      struct AssociateAttributeGroupRequest
        include JSON::Serializable

        # The name, ID, or ARN of the application.

        @[JSON::Field(key: "application")]
        getter application : String

        # The name, ID, or ARN of the attribute group that holds the attributes to describe the application.

        @[JSON::Field(key: "attributeGroup")]
        getter attribute_group : String

        def initialize(
          @application : String,
          @attribute_group : String
        )
        end
      end


      struct AssociateAttributeGroupResponse
        include JSON::Serializable

        # The Amazon resource name (ARN) of the application that was augmented with attributes.

        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String?

        # The Amazon resource name (ARN) of the attribute group that contains the application's new
        # attributes.

        @[JSON::Field(key: "attributeGroupArn")]
        getter attribute_group_arn : String?

        def initialize(
          @application_arn : String? = nil,
          @attribute_group_arn : String? = nil
        )
        end
      end


      struct AssociateResourceRequest
        include JSON::Serializable

        # The name, ID, or ARN of the application.

        @[JSON::Field(key: "application")]
        getter application : String

        # The name or ID of the resource of which the application will be associated.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The type of resource of which the application will be associated.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Determines whether an application tag is applied or skipped.

        @[JSON::Field(key: "options")]
        getter options : Array(String)?

        def initialize(
          @application : String,
          @resource : String,
          @resource_type : String,
          @options : Array(String)? = nil
        )
        end
      end


      struct AssociateResourceResponse
        include JSON::Serializable

        # The Amazon resource name (ARN) of the application that was augmented with attributes.

        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String?

        # Determines whether an application tag is applied or skipped.

        @[JSON::Field(key: "options")]
        getter options : Array(String)?

        # The Amazon resource name (ARN) that specifies the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @application_arn : String? = nil,
          @options : Array(String)? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # Represents a Amazon Web Services Service Catalog AppRegistry attribute group that is rich metadata
      # which describes an application and its components.

      struct AttributeGroup
        include JSON::Serializable

        # The Amazon resource name (ARN) that specifies the attribute group across services.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ISO-8601 formatted timestamp of the moment the attribute group was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the attribute group that the user provides.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The globally unique attribute group identifier of the attribute group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ISO-8601 formatted timestamp of the moment the attribute group was last updated. This time is
        # the same as the creationTime for a newly created attribute group.

        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The name of the attribute group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Key-value pairs you can use to associate with the attribute group.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_update_time : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The details related to a specific AttributeGroup.

      struct AttributeGroupDetails
        include JSON::Serializable

        # The Amazon resource name (ARN) that specifies the attribute group.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The service principal that created the attribute group.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The unique identifier of the attribute group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # This field is no longer supported. We recommend you don't use the field when using
        # ListAttributeGroupsForApplication . The name of the attribute group.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @created_by : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Summary of a Amazon Web Services Service Catalog AppRegistry attribute group.

      struct AttributeGroupSummary
        include JSON::Serializable

        # The Amazon resource name (ARN) that specifies the attribute group across services.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The service principal that created the attribute group.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The ISO-8601 formatted timestamp of the moment the attribute group was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the attribute group that the user provides.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The globally unique attribute group identifier of the attribute group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ISO-8601 formatted timestamp of the moment the attribute group was last updated. This time is
        # the same as the creationTime for a newly created attribute group.

        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The name of the attribute group.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @created_by : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_update_time : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # There was a conflict when processing the request (for example, a resource with the given name
      # already exists within the account).

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateApplicationRequest
        include JSON::Serializable

        # A unique identifier that you provide to ensure idempotency. If you retry a request that completed
        # successfully using the same client token and the same parameters, the retry succeeds without
        # performing any further actions. If you retry a successful request using the same client token, but
        # one or more of the parameters are different, the retry fails.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the application. The name must be unique in the region in which you are creating the
        # application.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the application.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Key-value pairs you can use to associate with the application.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateApplicationResponse
        include JSON::Serializable

        # Information about the application.

        @[JSON::Field(key: "application")]
        getter application : Types::Application?

        def initialize(
          @application : Types::Application? = nil
        )
        end
      end


      struct CreateAttributeGroupRequest
        include JSON::Serializable

        # A JSON string in the form of nested key-value pairs that represent the attributes in the group and
        # describes an application and its components.

        @[JSON::Field(key: "attributes")]
        getter attributes : String

        # A unique identifier that you provide to ensure idempotency. If you retry a request that completed
        # successfully using the same client token and the same parameters, the retry succeeds without
        # performing any further actions. If you retry a successful request using the same client token, but
        # one or more of the parameters are different, the retry fails.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the attribute group.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the attribute group that the user provides.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Key-value pairs you can use to associate with the attribute group.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @attributes : String,
          @client_token : String,
          @name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAttributeGroupResponse
        include JSON::Serializable

        # Information about the attribute group.

        @[JSON::Field(key: "attributeGroup")]
        getter attribute_group : Types::AttributeGroup?

        def initialize(
          @attribute_group : Types::AttributeGroup? = nil
        )
        end
      end


      struct DeleteApplicationRequest
        include JSON::Serializable

        # The name, ID, or ARN of the application.

        @[JSON::Field(key: "application")]
        getter application : String

        def initialize(
          @application : String
        )
        end
      end


      struct DeleteApplicationResponse
        include JSON::Serializable

        # Information about the deleted application.

        @[JSON::Field(key: "application")]
        getter application : Types::ApplicationSummary?

        def initialize(
          @application : Types::ApplicationSummary? = nil
        )
        end
      end


      struct DeleteAttributeGroupRequest
        include JSON::Serializable

        # The name, ID, or ARN of the attribute group that holds the attributes to describe the application.

        @[JSON::Field(key: "attributeGroup")]
        getter attribute_group : String

        def initialize(
          @attribute_group : String
        )
        end
      end


      struct DeleteAttributeGroupResponse
        include JSON::Serializable

        # Information about the deleted attribute group.

        @[JSON::Field(key: "attributeGroup")]
        getter attribute_group : Types::AttributeGroupSummary?

        def initialize(
          @attribute_group : Types::AttributeGroupSummary? = nil
        )
        end
      end


      struct DisassociateAttributeGroupRequest
        include JSON::Serializable

        # The name, ID, or ARN of the application.

        @[JSON::Field(key: "application")]
        getter application : String

        # The name, ID, or ARN of the attribute group that holds the attributes to describe the application.

        @[JSON::Field(key: "attributeGroup")]
        getter attribute_group : String

        def initialize(
          @application : String,
          @attribute_group : String
        )
        end
      end


      struct DisassociateAttributeGroupResponse
        include JSON::Serializable

        # The Amazon resource name (ARN) that specifies the application.

        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String?

        # The Amazon resource name (ARN) that specifies the attribute group.

        @[JSON::Field(key: "attributeGroupArn")]
        getter attribute_group_arn : String?

        def initialize(
          @application_arn : String? = nil,
          @attribute_group_arn : String? = nil
        )
        end
      end


      struct DisassociateResourceRequest
        include JSON::Serializable

        # The name or ID of the application.

        @[JSON::Field(key: "application")]
        getter application : String

        # The name or ID of the resource.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The type of the resource that is being disassociated.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @application : String,
          @resource : String,
          @resource_type : String
        )
        end
      end


      struct DisassociateResourceResponse
        include JSON::Serializable

        # The Amazon resource name (ARN) that specifies the application.

        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String?

        # The Amazon resource name (ARN) that specifies the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @application_arn : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end


      struct GetApplicationRequest
        include JSON::Serializable

        # The name, ID, or ARN of the application.

        @[JSON::Field(key: "application")]
        getter application : String

        def initialize(
          @application : String
        )
        end
      end


      struct GetApplicationResponse
        include JSON::Serializable

        # A key-value pair that identifies an associated resource.

        @[JSON::Field(key: "applicationTag")]
        getter application_tag : Hash(String, String)?

        # The Amazon resource name (ARN) that specifies the application across services.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The number of top-level resources that were registered as part of this application.

        @[JSON::Field(key: "associatedResourceCount")]
        getter associated_resource_count : Int32?

        # The ISO-8601 formatted timestamp of the moment when the application was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the application.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the application.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The information about the integration of the application with other services, such as Resource
        # Groups.

        @[JSON::Field(key: "integrations")]
        getter integrations : Types::Integrations?

        # The ISO-8601 formatted timestamp of the moment when the application was last updated.

        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The name of the application. The name must be unique in the region in which you are creating the
        # application.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Key-value pairs associated with the application.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_tag : Hash(String, String)? = nil,
          @arn : String? = nil,
          @associated_resource_count : Int32? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @integrations : Types::Integrations? = nil,
          @last_update_time : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetAssociatedResourceRequest
        include JSON::Serializable

        # The name, ID, or ARN of the application.

        @[JSON::Field(key: "application")]
        getter application : String

        # The name or ID of the resource associated with the application.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The type of resource associated with the application.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The maximum number of results to return. If the parameter is omitted, it defaults to 25. The value
        # is optional.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A unique pagination token for each page of results. Make the call again with the returned token to
        # retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # States whether an application tag is applied, not applied, in the process of being applied, or
        # skipped.

        @[JSON::Field(key: "resourceTagStatus")]
        getter resource_tag_status : Array(String)?

        def initialize(
          @application : String,
          @resource : String,
          @resource_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_tag_status : Array(String)? = nil
        )
        end
      end


      struct GetAssociatedResourceResponse
        include JSON::Serializable

        # The result of the application that's tag applied to a resource.

        @[JSON::Field(key: "applicationTagResult")]
        getter application_tag_result : Types::ApplicationTagResult?

        # Determines whether an application tag is applied or skipped.

        @[JSON::Field(key: "options")]
        getter options : Array(String)?

        # The resource associated with the application.

        @[JSON::Field(key: "resource")]
        getter resource : Types::Resource?

        def initialize(
          @application_tag_result : Types::ApplicationTagResult? = nil,
          @options : Array(String)? = nil,
          @resource : Types::Resource? = nil
        )
        end
      end


      struct GetAttributeGroupRequest
        include JSON::Serializable

        # The name, ID, or ARN of the attribute group that holds the attributes to describe the application.

        @[JSON::Field(key: "attributeGroup")]
        getter attribute_group : String

        def initialize(
          @attribute_group : String
        )
        end
      end


      struct GetAttributeGroupResponse
        include JSON::Serializable

        # The Amazon resource name (ARN) that specifies the attribute group across services.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A JSON string in the form of nested key-value pairs that represent the attributes in the group and
        # describes an application and its components.

        @[JSON::Field(key: "attributes")]
        getter attributes : String?

        # The service principal that created the attribute group.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The ISO-8601 formatted timestamp of the moment the attribute group was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the attribute group that the user provides.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the attribute group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ISO-8601 formatted timestamp of the moment the attribute group was last updated. This time is
        # the same as the creationTime for a newly created attribute group.

        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The name of the attribute group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Key-value pairs associated with the attribute group.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @attributes : String? = nil,
          @created_by : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_update_time : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetConfigurationResponse
        include JSON::Serializable

        # Retrieves TagKey configuration from an account.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AppRegistryConfiguration?

        def initialize(
          @configuration : Types::AppRegistryConfiguration? = nil
        )
        end
      end

      # The information about the service integration.

      struct Integrations
        include JSON::Serializable


        @[JSON::Field(key: "applicationTagResourceGroup")]
        getter application_tag_resource_group : Types::ResourceGroup?

        # The information about the resource group integration.

        @[JSON::Field(key: "resourceGroup")]
        getter resource_group : Types::ResourceGroup?

        def initialize(
          @application_tag_resource_group : Types::ResourceGroup? = nil,
          @resource_group : Types::ResourceGroup? = nil
        )
        end
      end

      # The service is experiencing internal problems.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListApplicationsRequest
        include JSON::Serializable

        # The upper bound of the number of results to return (cannot exceed 25). If this parameter is omitted,
        # it defaults to 25. This value is optional.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use to get the next page of results after a previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationsResponse
        include JSON::Serializable

        # This list of applications.

        @[JSON::Field(key: "applications")]
        getter applications : Array(Types::ApplicationSummary)?

        # The token to use to get the next page of results after a previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @applications : Array(Types::ApplicationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedAttributeGroupsRequest
        include JSON::Serializable

        # The name or ID of the application.

        @[JSON::Field(key: "application")]
        getter application : String

        # The upper bound of the number of results to return (cannot exceed 25). If this parameter is omitted,
        # it defaults to 25. This value is optional.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use to get the next page of results after a previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedAttributeGroupsResponse
        include JSON::Serializable

        # A list of attribute group IDs.

        @[JSON::Field(key: "attributeGroups")]
        getter attribute_groups : Array(String)?

        # The token to use to get the next page of results after a previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @attribute_groups : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedResourcesRequest
        include JSON::Serializable

        # The name, ID, or ARN of the application.

        @[JSON::Field(key: "application")]
        getter application : String

        # The upper bound of the number of results to return (cannot exceed 25). If this parameter is omitted,
        # it defaults to 25. This value is optional.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use to get the next page of results after a previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedResourcesResponse
        include JSON::Serializable

        # The token to use to get the next page of results after a previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Information about the resources.

        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::ResourceInfo)?

        def initialize(
          @next_token : String? = nil,
          @resources : Array(Types::ResourceInfo)? = nil
        )
        end
      end


      struct ListAttributeGroupsForApplicationRequest
        include JSON::Serializable

        # The name or ID of the application.

        @[JSON::Field(key: "application")]
        getter application : String

        # The upper bound of the number of results to return. The value cannot exceed 25. If you omit this
        # parameter, it defaults to 25. This value is optional.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # This token retrieves the next page of results after a previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAttributeGroupsForApplicationResponse
        include JSON::Serializable

        # The details related to a specific attribute group.

        @[JSON::Field(key: "attributeGroupsDetails")]
        getter attribute_groups_details : Array(Types::AttributeGroupDetails)?

        # The token to use to get the next page of results after a previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @attribute_groups_details : Array(Types::AttributeGroupDetails)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAttributeGroupsRequest
        include JSON::Serializable

        # The upper bound of the number of results to return (cannot exceed 25). If this parameter is omitted,
        # it defaults to 25. This value is optional.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use to get the next page of results after a previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAttributeGroupsResponse
        include JSON::Serializable

        # This list of attribute groups.

        @[JSON::Field(key: "attributeGroups")]
        getter attribute_groups : Array(Types::AttributeGroupSummary)?

        # The token to use to get the next page of results after a previous API call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @attribute_groups : Array(Types::AttributeGroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon resource name (ARN) that specifies the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags on the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct PutConfigurationRequest
        include JSON::Serializable

        # Associates a TagKey configuration to an account.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AppRegistryConfiguration

        def initialize(
          @configuration : Types::AppRegistryConfiguration
        )
        end
      end

      # The information about the resource.

      struct Resource
        include JSON::Serializable

        # The Amazon resource name (ARN) of the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time the resource was associated with the application.

        @[JSON::Field(key: "associationTime")]
        getter association_time : Time?

        # The service integration information about the resource.

        @[JSON::Field(key: "integrations")]
        getter integrations : Types::ResourceIntegrations?

        # The name of the resource.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @association_time : Time? = nil,
          @integrations : Types::ResourceIntegrations? = nil,
          @name : String? = nil
        )
        end
      end

      # The details related to the resource.

      struct ResourceDetails
        include JSON::Serializable

        # The value of the tag.

        @[JSON::Field(key: "tagValue")]
        getter tag_value : String?

        def initialize(
          @tag_value : String? = nil
        )
        end
      end

      # The information about the resource group integration.

      struct ResourceGroup
        include JSON::Serializable

        # The Amazon resource name (ARN) of the resource group.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The error message that generates when the propagation process for the resource group fails.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The state of the propagation process for the resource group. The states includes: CREATING if the
        # resource group is in the process of being created. CREATE_COMPLETE if the resource group was created
        # successfully. CREATE_FAILED if the resource group failed to be created. UPDATING if the resource
        # group is in the process of being updated. UPDATE_COMPLETE if the resource group updated
        # successfully. UPDATE_FAILED if the resource group could not update successfully.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @error_message : String? = nil,
          @state : String? = nil
        )
        end
      end

      # The information about the resource.

      struct ResourceInfo
        include JSON::Serializable

        # The Amazon resource name (ARN) that specifies the resource across services.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the resource.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Determines whether an application tag is applied or skipped.

        @[JSON::Field(key: "options")]
        getter options : Array(String)?

        # The details related to the resource.

        @[JSON::Field(key: "resourceDetails")]
        getter resource_details : Types::ResourceDetails?

        # Provides information about the Service Catalog App Registry resource type.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @options : Array(String)? = nil,
          @resource_details : Types::ResourceDetails? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The service integration information about the resource.

      struct ResourceIntegrations
        include JSON::Serializable

        # The information about the integration of Resource Groups.

        @[JSON::Field(key: "resourceGroup")]
        getter resource_group : Types::ResourceGroup?

        def initialize(
          @resource_group : Types::ResourceGroup? = nil
        )
        end
      end

      # The specified resource does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource in a list of resources.

      struct ResourcesListItem
        include JSON::Serializable

        # The message returned if the call fails.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The Amazon resource name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # Provides information about the AppRegistry resource type.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The status of the list item.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error_message : String? = nil,
          @resource_arn : String? = nil,
          @resource_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The maximum number of resources per account has been reached.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct SyncResourceRequest
        include JSON::Serializable

        # An entity you can work with and specify with a name or ID. Examples include an Amazon EC2 instance,
        # an Amazon Web Services CloudFormation stack, or an Amazon S3 bucket.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The type of resource of which the application will be associated.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @resource : String,
          @resource_type : String
        )
        end
      end


      struct SyncResourceResponse
        include JSON::Serializable

        # The results of the output if an application is associated with an ARN value, which could be
        # syncStarted or None.

        @[JSON::Field(key: "actionTaken")]
        getter action_taken : String?

        # The Amazon resource name (ARN) that specifies the application.

        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String?

        # The Amazon resource name (ARN) that specifies the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @action_taken : String? = nil,
          @application_arn : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # The definition of tagQuery . Specifies which resources are associated with an application.

      struct TagQueryConfiguration
        include JSON::Serializable

        # Condition in the IAM policy that associates resources to an application.

        @[JSON::Field(key: "tagKey")]
        getter tag_key : String?

        def initialize(
          @tag_key : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon resource name (ARN) that specifies the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The new or modified tags for the resource.

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

      # The maximum number of API requests has been exceeded.

      struct ThrottlingException
        include JSON::Serializable

        # A message associated with the Throttling exception.

        @[JSON::Field(key: "message")]
        getter message : String

        # The originating service code.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @service_code : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon resource name (ARN) that specifies the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of the tag keys to remove from the specified resource.

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


      struct UpdateApplicationRequest
        include JSON::Serializable

        # The name, ID, or ARN of the application that will be updated.

        @[JSON::Field(key: "application")]
        getter application : String

        # The new description of the application.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Deprecated: The new name of the application. The name must be unique in the region in which you are
        # updating the application. Please do not use this field as we have stopped supporting name updates.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @application : String,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateApplicationResponse
        include JSON::Serializable

        # The updated information of the application.

        @[JSON::Field(key: "application")]
        getter application : Types::Application?

        def initialize(
          @application : Types::Application? = nil
        )
        end
      end


      struct UpdateAttributeGroupRequest
        include JSON::Serializable

        # The name, ID, or ARN of the attribute group that holds the attributes to describe the application.

        @[JSON::Field(key: "attributeGroup")]
        getter attribute_group : String

        # A JSON string in the form of nested key-value pairs that represent the attributes in the group and
        # describes an application and its components.

        @[JSON::Field(key: "attributes")]
        getter attributes : String?

        # The description of the attribute group that the user provides.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Deprecated: The new name of the attribute group. The name must be unique in the region in which you
        # are updating the attribute group. Please do not use this field as we have stopped supporting name
        # updates.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @attribute_group : String,
          @attributes : String? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateAttributeGroupResponse
        include JSON::Serializable

        # The updated information of the attribute group.

        @[JSON::Field(key: "attributeGroup")]
        getter attribute_group : Types::AttributeGroup?

        def initialize(
          @attribute_group : Types::AttributeGroup? = nil
        )
        end
      end

      # The request has invalid or missing parameters.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
