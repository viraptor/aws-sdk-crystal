require "json"
require "time"

module AwsSdk
  module LicenseManagerUserSubscriptions
    module Types

      # You don't have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details about an Active Directory identity provider.

      struct ActiveDirectoryIdentityProvider
        include JSON::Serializable

        # The ActiveDirectorySettings resource contains details about the Active Directory, including network
        # access details such as domain name and IP addresses, and the credential provider for user
        # administration.

        @[JSON::Field(key: "ActiveDirectorySettings")]
        getter active_directory_settings : Types::ActiveDirectorySettings?

        # The type of Active Directory – either a self-managed Active Directory or an Amazon Web Services
        # Managed Active Directory.

        @[JSON::Field(key: "ActiveDirectoryType")]
        getter active_directory_type : String?

        # The directory ID for an Active Directory identity provider.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # Whether this directory is shared from an Amazon Web Services Managed Active Directory. The default
        # value is false.

        @[JSON::Field(key: "IsSharedActiveDirectory")]
        getter is_shared_active_directory : Bool?

        def initialize(
          @active_directory_settings : Types::ActiveDirectorySettings? = nil,
          @active_directory_type : String? = nil,
          @directory_id : String? = nil,
          @is_shared_active_directory : Bool? = nil
        )
        end
      end

      # Contains network access and credential details that are needed for user administration in the Active
      # Directory.

      struct ActiveDirectorySettings
        include JSON::Serializable

        # Points to the CredentialsProvider resource that contains information about the credential provider
        # for user administration.

        @[JSON::Field(key: "DomainCredentialsProvider")]
        getter domain_credentials_provider : Types::CredentialsProvider?

        # A list of domain IPv4 addresses that are used for the Active Directory.

        @[JSON::Field(key: "DomainIpv4List")]
        getter domain_ipv4_list : Array(String)?

        # A list of domain IPv6 addresses that are used for the Active Directory.

        @[JSON::Field(key: "DomainIpv6List")]
        getter domain_ipv6_list : Array(String)?

        # The domain name for the Active Directory.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The DomainNetworkSettings resource contains an array of subnets that apply for the Active Directory.

        @[JSON::Field(key: "DomainNetworkSettings")]
        getter domain_network_settings : Types::DomainNetworkSettings?

        def initialize(
          @domain_credentials_provider : Types::CredentialsProvider? = nil,
          @domain_ipv4_list : Array(String)? = nil,
          @domain_ipv6_list : Array(String)? = nil,
          @domain_name : String? = nil,
          @domain_network_settings : Types::DomainNetworkSettings? = nil
        )
        end
      end


      struct AssociateUserRequest
        include JSON::Serializable

        # The identity provider for the user.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider

        # The ID of the EC2 instance that provides the user-based subscription.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The user name from the identity provider.

        @[JSON::Field(key: "Username")]
        getter username : String

        # The domain name of the Active Directory that contains information for the user to associate.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The tags that apply for the user association.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @identity_provider : Types::IdentityProvider,
          @instance_id : String,
          @username : String,
          @domain : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct AssociateUserResponse
        include JSON::Serializable

        # Metadata that describes the associate user operation.

        @[JSON::Field(key: "InstanceUserSummary")]
        getter instance_user_summary : Types::InstanceUserSummary

        def initialize(
          @instance_user_summary : Types::InstanceUserSummary
        )
        end
      end

      # The request couldn't be completed because it conflicted with the current state of the resource.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateLicenseServerEndpointRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the IdentityProvider resource that contains details
        # about a registered identity provider. In the case of Active Directory, that can be a self-managed
        # Active Directory or an Amazon Web Services Managed Active Directory that contains user identity
        # details.

        @[JSON::Field(key: "IdentityProviderArn")]
        getter identity_provider_arn : String

        # The LicenseServerSettings resource to create for the endpoint. The settings include the type of
        # license server and the Secrets Manager secret that enables administrators to add or remove users
        # associated with the license server.

        @[JSON::Field(key: "LicenseServerSettings")]
        getter license_server_settings : Types::LicenseServerSettings

        # The tags that apply for the license server endpoint.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @identity_provider_arn : String,
          @license_server_settings : Types::LicenseServerSettings,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateLicenseServerEndpointResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the identity provider specified in the request.

        @[JSON::Field(key: "IdentityProviderArn")]
        getter identity_provider_arn : String?

        # The ARN of the LicenseServerEndpoint resource.

        @[JSON::Field(key: "LicenseServerEndpointArn")]
        getter license_server_endpoint_arn : String?

        def initialize(
          @identity_provider_arn : String? = nil,
          @license_server_endpoint_arn : String? = nil
        )
        end
      end

      # Contains information about the credential provider for user administration.

      struct CredentialsProvider
        include JSON::Serializable

        # Identifies the Secrets Manager secret that contains credentials needed for user administration in
        # the Active Directory.

        @[JSON::Field(key: "SecretsManagerCredentialsProvider")]
        getter secrets_manager_credentials_provider : Types::SecretsManagerCredentialsProvider?

        def initialize(
          @secrets_manager_credentials_provider : Types::SecretsManagerCredentialsProvider? = nil
        )
        end
      end


      struct DeleteLicenseServerEndpointRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the LicenseServerEndpoint resource to delete.

        @[JSON::Field(key: "LicenseServerEndpointArn")]
        getter license_server_endpoint_arn : String

        # The type of License Server that the delete request refers to.

        @[JSON::Field(key: "ServerType")]
        getter server_type : String

        def initialize(
          @license_server_endpoint_arn : String,
          @server_type : String
        )
        end
      end


      struct DeleteLicenseServerEndpointResponse
        include JSON::Serializable

        # Shows details from the LicenseServerEndpoint resource that was deleted.

        @[JSON::Field(key: "LicenseServerEndpoint")]
        getter license_server_endpoint : Types::LicenseServerEndpoint?

        def initialize(
          @license_server_endpoint : Types::LicenseServerEndpoint? = nil
        )
        end
      end


      struct DeregisterIdentityProviderRequest
        include JSON::Serializable

        # An object that specifies details for the Active Directory identity provider.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider?

        # The Amazon Resource Name (ARN) that identifies the identity provider to deregister.

        @[JSON::Field(key: "IdentityProviderArn")]
        getter identity_provider_arn : String?

        # The name of the user-based subscription product. Valid values: VISUAL_STUDIO_ENTERPRISE |
        # VISUAL_STUDIO_PROFESSIONAL | OFFICE_PROFESSIONAL_PLUS | REMOTE_DESKTOP_SERVICES

        @[JSON::Field(key: "Product")]
        getter product : String?

        def initialize(
          @identity_provider : Types::IdentityProvider? = nil,
          @identity_provider_arn : String? = nil,
          @product : String? = nil
        )
        end
      end


      struct DeregisterIdentityProviderResponse
        include JSON::Serializable

        # Metadata that describes the results of an identity provider operation.

        @[JSON::Field(key: "IdentityProviderSummary")]
        getter identity_provider_summary : Types::IdentityProviderSummary

        def initialize(
          @identity_provider_summary : Types::IdentityProviderSummary
        )
        end
      end


      struct DisassociateUserRequest
        include JSON::Serializable

        # The domain name of the Active Directory that contains information for the user to disassociate.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # An object that specifies details for the Active Directory identity provider.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider?

        # The ID of the EC2 instance which provides user-based subscriptions.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The Amazon Resource Name (ARN) of the user to disassociate from the EC2 instance.

        @[JSON::Field(key: "InstanceUserArn")]
        getter instance_user_arn : String?

        # The user name from the Active Directory identity provider for the user.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @domain : String? = nil,
          @identity_provider : Types::IdentityProvider? = nil,
          @instance_id : String? = nil,
          @instance_user_arn : String? = nil,
          @username : String? = nil
        )
        end
      end


      struct DisassociateUserResponse
        include JSON::Serializable

        # Metadata that describes the associate user operation.

        @[JSON::Field(key: "InstanceUserSummary")]
        getter instance_user_summary : Types::InstanceUserSummary

        def initialize(
          @instance_user_summary : Types::InstanceUserSummary
        )
        end
      end

      # Contains network settings for the Active Directory domain.

      struct DomainNetworkSettings
        include JSON::Serializable

        # Contains a list of subnets that apply for the Active Directory domain.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)

        def initialize(
          @subnets : Array(String)
        )
        end
      end

      # A filter name and value pair that is used to return more specific results from a describe or list
      # operation. You can use filters can be used to match a set of resources by specific criteria, such as
      # tags, attributes, or IDs.

      struct Filter
        include JSON::Serializable

        # The name of an attribute to use as a filter.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        # The type of search (For example, eq, geq, leq)

        @[JSON::Field(key: "Operation")]
        getter operation : String?

        # Value of the filter.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @attribute : String? = nil,
          @operation : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Refers to an identity provider.

      struct IdentityProvider
        include JSON::Serializable

        # The ActiveDirectoryIdentityProvider resource contains settings and other details about a specific
        # Active Directory identity provider.

        @[JSON::Field(key: "ActiveDirectoryIdentityProvider")]
        getter active_directory_identity_provider : Types::ActiveDirectoryIdentityProvider?

        def initialize(
          @active_directory_identity_provider : Types::ActiveDirectoryIdentityProvider? = nil
        )
        end
      end

      # Describes an identity provider.

      struct IdentityProviderSummary
        include JSON::Serializable

        # The IdentityProvider resource contains information about an identity provider.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider

        # The name of the user-based subscription product.

        @[JSON::Field(key: "Product")]
        getter product : String

        # The Settings resource contains details about the registered identity provider’s product related
        # configuration settings, such as the subnets to provision VPC endpoints.

        @[JSON::Field(key: "Settings")]
        getter settings : Types::Settings

        # The status of the identity provider.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The failure message associated with an identity provider.

        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        # The Amazon Resource Name (ARN) of the identity provider.

        @[JSON::Field(key: "IdentityProviderArn")]
        getter identity_provider_arn : String?

        # The AWS Account ID of the owner of this resource.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        def initialize(
          @identity_provider : Types::IdentityProvider,
          @product : String,
          @settings : Types::Settings,
          @status : String,
          @failure_message : String? = nil,
          @identity_provider_arn : String? = nil,
          @owner_account_id : String? = nil
        )
        end
      end

      # Describes an EC2 instance providing user-based subscriptions.

      struct InstanceSummary
        include JSON::Serializable

        # The ID of the EC2 instance, which provides user-based subscriptions.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # A list of provided user-based subscription products.

        @[JSON::Field(key: "Products")]
        getter products : Array(String)

        # The status of an EC2 instance resource.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The IdentityProvider resource specifies details about the identity provider.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider?

        # The date of the last status check.

        @[JSON::Field(key: "LastStatusCheckDate")]
        getter last_status_check_date : String?

        # The AWS Account ID of the owner of this resource.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The status message for an EC2 instance.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @instance_id : String,
          @products : Array(String),
          @status : String,
          @identity_provider : Types::IdentityProvider? = nil,
          @last_status_check_date : String? = nil,
          @owner_account_id : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Describes users of an EC2 instance providing user-based subscriptions.

      struct InstanceUserSummary
        include JSON::Serializable

        # The IdentityProvider resource specifies details about the identity provider.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider

        # The ID of the EC2 instance that provides user-based subscriptions.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The status of a user associated with an EC2 instance.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The user name from the identity provider for the user.

        @[JSON::Field(key: "Username")]
        getter username : String

        # The date a user was associated with an EC2 instance.

        @[JSON::Field(key: "AssociationDate")]
        getter association_date : String?

        # The date a user was disassociated from an EC2 instance.

        @[JSON::Field(key: "DisassociationDate")]
        getter disassociation_date : String?

        # The domain name of the Active Directory that contains the user information for the product
        # subscription.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The Amazon Resource Name (ARN) that identifies the instance user.

        @[JSON::Field(key: "InstanceUserArn")]
        getter instance_user_arn : String?

        # The status message for users of an EC2 instance.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @identity_provider : Types::IdentityProvider,
          @instance_id : String,
          @status : String,
          @username : String,
          @association_date : String? = nil,
          @disassociation_date : String? = nil,
          @domain : String? = nil,
          @instance_user_arn : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # An exception occurred with the service.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a Remote Desktop Services (RDS) license server.

      struct LicenseServer
        include JSON::Serializable

        # The health status of the RDS license server.

        @[JSON::Field(key: "HealthStatus")]
        getter health_status : String?

        # A list of domain IPv4 addresses that are used for the RDS license server.

        @[JSON::Field(key: "Ipv4Address")]
        getter ipv4_address : String?

        # A list of domain IPv6 addresses that are used for the RDS license server.

        @[JSON::Field(key: "Ipv6Address")]
        getter ipv6_address : String?

        # The current state of the provisioning process for the RDS license server.

        @[JSON::Field(key: "ProvisioningStatus")]
        getter provisioning_status : String?

        def initialize(
          @health_status : String? = nil,
          @ipv4_address : String? = nil,
          @ipv6_address : String? = nil,
          @provisioning_status : String? = nil
        )
        end
      end

      # Contains details about a network endpoint for a Remote Desktop Services (RDS) license server.

      struct LicenseServerEndpoint
        include JSON::Serializable

        # The timestamp when License Manager created the license server endpoint.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the identity provider that's associated with the RDS license
        # server endpoint.

        @[JSON::Field(key: "IdentityProviderArn")]
        getter identity_provider_arn : String?

        # The ARN of the ServerEndpoint resource for the RDS license server.

        @[JSON::Field(key: "LicenseServerEndpointArn")]
        getter license_server_endpoint_arn : String?

        # The ID of the license server endpoint.

        @[JSON::Field(key: "LicenseServerEndpointId")]
        getter license_server_endpoint_id : String?

        # The current state of the provisioning process for the RDS license server endpoint

        @[JSON::Field(key: "LicenseServerEndpointProvisioningStatus")]
        getter license_server_endpoint_provisioning_status : String?

        # An array of LicenseServer resources that represent the license servers that are accessed through
        # this endpoint.

        @[JSON::Field(key: "LicenseServers")]
        getter license_servers : Array(Types::LicenseServer)?

        # The ServerEndpoint resource contains the network address of the RDS license server endpoint.

        @[JSON::Field(key: "ServerEndpoint")]
        getter server_endpoint : Types::ServerEndpoint?

        # The type of license server.

        @[JSON::Field(key: "ServerType")]
        getter server_type : String?

        # The message associated with the provisioning status, if there is one.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @creation_time : Time? = nil,
          @identity_provider_arn : String? = nil,
          @license_server_endpoint_arn : String? = nil,
          @license_server_endpoint_id : String? = nil,
          @license_server_endpoint_provisioning_status : String? = nil,
          @license_servers : Array(Types::LicenseServer)? = nil,
          @server_endpoint : Types::ServerEndpoint? = nil,
          @server_type : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # The settings to configure your license server.

      struct LicenseServerSettings
        include JSON::Serializable

        # The ServerSettings resource contains the settings for your server.

        @[JSON::Field(key: "ServerSettings")]
        getter server_settings : Types::ServerSettings

        # The type of license server.

        @[JSON::Field(key: "ServerType")]
        getter server_type : String

        def initialize(
          @server_settings : Types::ServerSettings,
          @server_type : String
        )
        end
      end


      struct ListIdentityProvidersRequest
        include JSON::Serializable

        # You can use the following filters to streamline results: Product DirectoryId

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of results to return from a single request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdentityProvidersResponse
        include JSON::Serializable

        # An array of IdentityProviderSummary resources that contain details about the Active Directory
        # identity providers that meet the request criteria.

        @[JSON::Field(key: "IdentityProviderSummaries")]
        getter identity_provider_summaries : Array(Types::IdentityProviderSummary)

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identity_provider_summaries : Array(Types::IdentityProviderSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListInstancesRequest
        include JSON::Serializable

        # You can use the following filters to streamline results: Status InstanceId

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of results to return from a single request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInstancesResponse
        include JSON::Serializable

        # An array of InstanceSummary resources that contain details about the instances that provide
        # user-based subscriptions and also meet the request criteria.

        @[JSON::Field(key: "InstanceSummaries")]
        getter instance_summaries : Array(Types::InstanceSummary)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_summaries : Array(Types::InstanceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseServerEndpointsRequest
        include JSON::Serializable

        # You can use the following filters to streamline results: IdentityProviderArn

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of results to return from a single request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLicenseServerEndpointsResponse
        include JSON::Serializable

        # An array of LicenseServerEndpoint resources that contain detailed information about the RDS License
        # Servers that meet the request criteria.

        @[JSON::Field(key: "LicenseServerEndpoints")]
        getter license_server_endpoints : Array(Types::LicenseServerEndpoint)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @license_server_endpoints : Array(Types::LicenseServerEndpoint)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProductSubscriptionsRequest
        include JSON::Serializable

        # An object that specifies details for the identity provider.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider

        # You can use the following filters to streamline results: Status Username Domain

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of results to return from a single request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the user-based subscription product. Valid values: VISUAL_STUDIO_ENTERPRISE |
        # VISUAL_STUDIO_PROFESSIONAL | OFFICE_PROFESSIONAL_PLUS | REMOTE_DESKTOP_SERVICES

        @[JSON::Field(key: "Product")]
        getter product : String?

        def initialize(
          @identity_provider : Types::IdentityProvider,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @product : String? = nil
        )
        end
      end


      struct ListProductSubscriptionsResponse
        include JSON::Serializable

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Metadata that describes the list product subscriptions operation.

        @[JSON::Field(key: "ProductUserSummaries")]
        getter product_user_summaries : Array(Types::ProductUserSummary)?

        def initialize(
          @next_token : String? = nil,
          @product_user_summaries : Array(Types::ProductUserSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource whose tags you want to retrieve.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags for the specified resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListUserAssociationsRequest
        include JSON::Serializable

        # An object that specifies details for the identity provider.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider

        # The ID of the EC2 instance, which provides user-based subscriptions.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # You can use the following filters to streamline results: Status Username Domain

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of results to return from a single request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identity_provider : Types::IdentityProvider,
          @instance_id : String,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListUserAssociationsResponse
        include JSON::Serializable

        # Metadata that describes the list user association operation.

        @[JSON::Field(key: "InstanceUserSummaries")]
        getter instance_user_summaries : Array(Types::InstanceUserSummary)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_user_summaries : Array(Types::InstanceUserSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A summary of the user-based subscription products for a specific user.

      struct ProductUserSummary
        include JSON::Serializable

        # An object that specifies details for the identity provider.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider

        # The name of the user-based subscription product.

        @[JSON::Field(key: "Product")]
        getter product : String

        # The status of a product for this user.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The user name from the identity provider for this product user.

        @[JSON::Field(key: "Username")]
        getter username : String

        # The domain name of the Active Directory that contains the user information for the product
        # subscription.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The Amazon Resource Name (ARN) for this product user.

        @[JSON::Field(key: "ProductUserArn")]
        getter product_user_arn : String?

        # The status message for a product for this user.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The end date of a subscription.

        @[JSON::Field(key: "SubscriptionEndDate")]
        getter subscription_end_date : String?

        # The start date of a subscription.

        @[JSON::Field(key: "SubscriptionStartDate")]
        getter subscription_start_date : String?

        def initialize(
          @identity_provider : Types::IdentityProvider,
          @product : String,
          @status : String,
          @username : String,
          @domain : String? = nil,
          @product_user_arn : String? = nil,
          @status_message : String? = nil,
          @subscription_end_date : String? = nil,
          @subscription_start_date : String? = nil
        )
        end
      end

      # Server settings that are specific to a Remote Desktop Services (RDS) license server.

      struct RdsSalSettings
        include JSON::Serializable

        # The CredentialsProvider resource contains a reference to the credentials provider that's used for
        # RDS license server user administration.

        @[JSON::Field(key: "RdsSalCredentialsProvider")]
        getter rds_sal_credentials_provider : Types::CredentialsProvider

        def initialize(
          @rds_sal_credentials_provider : Types::CredentialsProvider
        )
        end
      end


      struct RegisterIdentityProviderRequest
        include JSON::Serializable

        # An object that specifies details for the identity provider to register.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider

        # The name of the user-based subscription product. Valid values: VISUAL_STUDIO_ENTERPRISE |
        # VISUAL_STUDIO_PROFESSIONAL | OFFICE_PROFESSIONAL_PLUS | REMOTE_DESKTOP_SERVICES

        @[JSON::Field(key: "Product")]
        getter product : String

        # The registered identity provider’s product related configuration settings such as the subnets to
        # provision VPC endpoints.

        @[JSON::Field(key: "Settings")]
        getter settings : Types::Settings?

        # The tags that apply to the identity provider's registration.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @identity_provider : Types::IdentityProvider,
          @product : String,
          @settings : Types::Settings? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct RegisterIdentityProviderResponse
        include JSON::Serializable

        # Metadata that describes the results of an identity provider operation.

        @[JSON::Field(key: "IdentityProviderSummary")]
        getter identity_provider_summary : Types::IdentityProviderSummary

        def initialize(
          @identity_provider_summary : Types::IdentityProviderSummary
        )
        end
      end

      # The resource couldn't be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains a credentials secret that's stored in Secrets Manager.

      struct SecretsManagerCredentialsProvider
        include JSON::Serializable

        # The ID of the Secrets Manager secret that contains credentials.

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String?

        def initialize(
          @secret_id : String? = nil
        )
        end
      end

      # A network endpoint through which you can access one or more servers.

      struct ServerEndpoint
        include JSON::Serializable

        # The network address of the endpoint.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        def initialize(
          @endpoint : String? = nil
        )
        end
      end

      # Contains settings for a specific server.

      struct ServerSettings
        include JSON::Serializable

        # The RdsSalSettings resource contains settings to configure a specific Remote Desktop Services (RDS)
        # license server.

        @[JSON::Field(key: "RdsSalSettings")]
        getter rds_sal_settings : Types::RdsSalSettings?

        def initialize(
          @rds_sal_settings : Types::RdsSalSettings? = nil
        )
        end
      end

      # The request failed because a service quota is exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The registered identity provider’s product related configuration settings such as the subnets to
      # provision VPC endpoints, and the security group ID that is associated with the VPC endpoints. The
      # security group should permit inbound TCP port 1688 communication from resources in the VPC.

      struct Settings
        include JSON::Serializable

        # A security group ID that allows inbound TCP port 1688 communication between resources in your VPC
        # and the VPC endpoint for activation servers.

        @[JSON::Field(key: "SecurityGroupId")]
        getter security_group_id : String

        # The subnets defined for the registered identity provider.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)

        def initialize(
          @security_group_id : String,
          @subnets : Array(String)
        )
        end
      end


      struct StartProductSubscriptionRequest
        include JSON::Serializable

        # An object that specifies details for the identity provider.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider

        # The name of the user-based subscription product. Valid values: VISUAL_STUDIO_ENTERPRISE |
        # VISUAL_STUDIO_PROFESSIONAL | OFFICE_PROFESSIONAL_PLUS | REMOTE_DESKTOP_SERVICES

        @[JSON::Field(key: "Product")]
        getter product : String

        # The user name from the identity provider of the user.

        @[JSON::Field(key: "Username")]
        getter username : String

        # The domain name of the Active Directory that contains the user for whom to start the product
        # subscription.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The tags that apply to the product subscription.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @identity_provider : Types::IdentityProvider,
          @product : String,
          @username : String,
          @domain : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartProductSubscriptionResponse
        include JSON::Serializable

        # Metadata that describes the start product subscription operation.

        @[JSON::Field(key: "ProductUserSummary")]
        getter product_user_summary : Types::ProductUserSummary

        def initialize(
          @product_user_summary : Types::ProductUserSummary
        )
        end
      end


      struct StopProductSubscriptionRequest
        include JSON::Serializable

        # The domain name of the Active Directory that contains the user for whom to stop the product
        # subscription.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # An object that specifies details for the identity provider.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider?

        # The name of the user-based subscription product. Valid values: VISUAL_STUDIO_ENTERPRISE |
        # VISUAL_STUDIO_PROFESSIONAL | OFFICE_PROFESSIONAL_PLUS | REMOTE_DESKTOP_SERVICES

        @[JSON::Field(key: "Product")]
        getter product : String?

        # The Amazon Resource Name (ARN) of the product user.

        @[JSON::Field(key: "ProductUserArn")]
        getter product_user_arn : String?

        # The user name from the identity provider for the user.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @domain : String? = nil,
          @identity_provider : Types::IdentityProvider? = nil,
          @product : String? = nil,
          @product_user_arn : String? = nil,
          @username : String? = nil
        )
        end
      end


      struct StopProductSubscriptionResponse
        include JSON::Serializable

        # Metadata that describes the start product subscription operation.

        @[JSON::Field(key: "ProductUserSummary")]
        getter product_user_summary : Types::ProductUserSummary

        def initialize(
          @product_user_summary : Types::ProductUserSummary
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to tag.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to apply to the specified resource.

        @[JSON::Field(key: "Tags")]
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

      # The request was denied because of request throttling. Retry the request.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to remove tags from.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tag keys to remove from the resource.

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


      struct UpdateIdentityProviderSettingsRequest
        include JSON::Serializable

        # Updates the registered identity provider’s product related configuration settings. You can update
        # any combination of settings in a single operation such as the: Subnets which you want to add to
        # provision VPC endpoints. Subnets which you want to remove the VPC endpoints from. Security group ID
        # which permits traffic to the VPC endpoints.

        @[JSON::Field(key: "UpdateSettings")]
        getter update_settings : Types::UpdateSettings


        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProvider?

        # The Amazon Resource Name (ARN) of the identity provider to update.

        @[JSON::Field(key: "IdentityProviderArn")]
        getter identity_provider_arn : String?

        # The name of the user-based subscription product. Valid values: VISUAL_STUDIO_ENTERPRISE |
        # VISUAL_STUDIO_PROFESSIONAL | OFFICE_PROFESSIONAL_PLUS | REMOTE_DESKTOP_SERVICES

        @[JSON::Field(key: "Product")]
        getter product : String?

        def initialize(
          @update_settings : Types::UpdateSettings,
          @identity_provider : Types::IdentityProvider? = nil,
          @identity_provider_arn : String? = nil,
          @product : String? = nil
        )
        end
      end


      struct UpdateIdentityProviderSettingsResponse
        include JSON::Serializable


        @[JSON::Field(key: "IdentityProviderSummary")]
        getter identity_provider_summary : Types::IdentityProviderSummary

        def initialize(
          @identity_provider_summary : Types::IdentityProviderSummary
        )
        end
      end

      # Updates the registered identity provider’s product related configuration settings such as the
      # subnets to provision VPC endpoints.

      struct UpdateSettings
        include JSON::Serializable

        # The ID of one or more subnets in which License Manager will create a VPC endpoint for products that
        # require connectivity to activation servers.

        @[JSON::Field(key: "AddSubnets")]
        getter add_subnets : Array(String)

        # The ID of one or more subnets to remove.

        @[JSON::Field(key: "RemoveSubnets")]
        getter remove_subnets : Array(String)

        # A security group ID that allows inbound TCP port 1688 communication between resources in your VPC
        # and the VPC endpoints for activation servers.

        @[JSON::Field(key: "SecurityGroupId")]
        getter security_group_id : String?

        def initialize(
          @add_subnets : Array(String),
          @remove_subnets : Array(String),
          @security_group_id : String? = nil
        )
        end
      end

      # A parameter is not valid.

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
