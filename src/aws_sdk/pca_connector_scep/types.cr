require "json"
require "time"

module AwsSdk
  module PcaConnectorScep
    module Types

      # You can receive this error if you attempt to perform an operation and you don't have the required
      # permissions. This can be caused by insufficient permissions in policies attached to your Amazon Web
      # Services Identity and Access Management (IAM) principal. It can also happen because of restrictions
      # in place from an Amazon Web Services Organizations service control policy (SCP) that affects your
      # Amazon Web Services account.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request is malformed or contains an error such as an invalid parameter value or a missing
      # required parameter.
      struct BadRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # For Connector for SCEP for general-purpose. An object containing information about the specified
      # connector's SCEP challenge passwords.
      struct Challenge
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the challenge.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Resource Name (ARN) of the connector.
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String?

        # The date and time that the challenge was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The SCEP challenge password, in UUID format.
        @[JSON::Field(key: "Password")]
        getter password : String?

        # The date and time that the challenge was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @connector_arn : String? = nil,
          @created_at : Time? = nil,
          @password : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Contains details about the connector's challenge.
      struct ChallengeMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the challenge.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Resource Name (ARN) of the connector.
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String?

        # The date and time that the connector was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The date and time that the connector was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @connector_arn : String? = nil,
          @created_at : Time? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Details about the specified challenge, returned by the GetChallengeMetadata action.
      struct ChallengeMetadataSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the challenge.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Resource Name (ARN) of the connector.
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String?

        # The date and time that the challenge was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The date and time that the challenge was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @connector_arn : String? = nil,
          @created_at : Time? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # This request can't be completed for one of the following reasons because the requested resource was
      # being concurrently modified by another request.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The identifier of the Amazon Web Services resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource type, which can be either Connector or Challenge .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Connector for SCEP is a service that links Amazon Web Services Private Certificate Authority to your
      # SCEP-enabled devices. The connector brokers the exchange of certificates from Amazon Web Services
      # Private CA to your SCEP-enabled devices and mobile device management systems. The connector is a
      # complex type that contains the connector's configuration settings.
      struct Connector
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Resource Name (ARN) of the certificate authority associated with the connector.
        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String?

        # The date and time that the connector was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The connector's HTTPS public SCEP URL.
        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # Contains settings relevant to the mobile device management system that you chose for the connector.
        # If you didn't configure MobileDeviceManagement , then the connector is for general-purpose use and
        # this object is empty.
        @[JSON::Field(key: "MobileDeviceManagement")]
        getter mobile_device_management : Types::MobileDeviceManagement?

        # Contains OpenID Connect (OIDC) parameters for use with Connector for SCEP for Microsoft Intune. For
        # more information about using Connector for SCEP for Microsoft Intune, see Using Connector for SCEP
        # for Microsoft Intune .
        @[JSON::Field(key: "OpenIdConfiguration")]
        getter open_id_configuration : Types::OpenIdConfiguration?

        # The connector's status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Information about why connector creation failed, if status is FAILED .
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The connector type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The date and time that the connector was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @certificate_authority_arn : String? = nil,
          @created_at : Time? = nil,
          @endpoint : String? = nil,
          @mobile_device_management : Types::MobileDeviceManagement? = nil,
          @open_id_configuration : Types::OpenIdConfiguration? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Lists the Amazon Web Services Private CA SCEP connectors belonging to your Amazon Web Services
      # account.
      struct ConnectorSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Resource Name (ARN) of the connector's associated certificate authority.
        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String?

        # The date and time that the challenge was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The connector's HTTPS public SCEP URL.
        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # Contains settings relevant to the mobile device management system that you chose for the connector.
        # If you didn't configure MobileDeviceManagement , then the connector is for general-purpose use and
        # this object is empty.
        @[JSON::Field(key: "MobileDeviceManagement")]
        getter mobile_device_management : Types::MobileDeviceManagement?

        # Contains OpenID Connect (OIDC) parameters for use with Microsoft Intune.
        @[JSON::Field(key: "OpenIdConfiguration")]
        getter open_id_configuration : Types::OpenIdConfiguration?

        # The connector's status. Status can be creating, active, deleting, or failed.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Information about why connector creation failed, if status is FAILED .
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The connector type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The date and time that the challenge was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @certificate_authority_arn : String? = nil,
          @created_at : Time? = nil,
          @endpoint : String? = nil,
          @mobile_device_management : Types::MobileDeviceManagement? = nil,
          @open_id_configuration : Types::OpenIdConfiguration? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct CreateChallengeRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector that you want to create a challenge for.
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String

        # Custom string that can be used to distinguish between calls to the CreateChallenge action. Client
        # tokens for CreateChallenge time out after five minutes. Therefore, if you call CreateChallenge
        # multiple times with the same client token within five minutes, Connector for SCEP recognizes that
        # you are requesting only one challenge and will only respond with one. If you change the client token
        # for each call, Connector for SCEP recognizes that you are requesting multiple challenge passwords.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The key-value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @connector_arn : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateChallengeResponse
        include JSON::Serializable

        # Returns the challenge details for the specified connector.
        @[JSON::Field(key: "Challenge")]
        getter challenge : Types::Challenge?

        def initialize(
          @challenge : Types::Challenge? = nil
        )
        end
      end

      struct CreateConnectorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Web Services Private Certificate Authority certificate
        # authority to use with this connector. Due to security vulnerabilities present in the SCEP protocol,
        # we recommend using a private CA that's dedicated for use with the connector. To retrieve the private
        # CAs associated with your account, you can call ListCertificateAuthorities using the Amazon Web
        # Services Private CA API.
        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # Custom string that can be used to distinguish between calls to the CreateChallenge action. Client
        # tokens for CreateChallenge time out after five minutes. Therefore, if you call CreateChallenge
        # multiple times with the same client token within five minutes, Connector for SCEP recognizes that
        # you are requesting only one challenge and will only respond with one. If you change the client token
        # for each call, Connector for SCEP recognizes that you are requesting multiple challenge passwords.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # If you don't supply a value, by default Connector for SCEP creates a connector for general-purpose
        # use. A general-purpose connector is designed to work with clients or endpoints that support the SCEP
        # protocol, except Connector for SCEP for Microsoft Intune. With connectors for general-purpose use,
        # you manage SCEP challenge passwords using Connector for SCEP. For information about considerations
        # and limitations with using Connector for SCEP, see Considerations and Limitations . If you provide
        # an IntuneConfiguration , Connector for SCEP creates a connector for use with Microsoft Intune, and
        # you manage the challenge passwords using Microsoft Intune. For more information, see Using Connector
        # for SCEP for Microsoft Intune .
        @[JSON::Field(key: "MobileDeviceManagement")]
        getter mobile_device_management : Types::MobileDeviceManagement?

        # The key-value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @certificate_authority_arn : String,
          @client_token : String? = nil,
          @mobile_device_management : Types::MobileDeviceManagement? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateConnectorResponse
        include JSON::Serializable

        # Returns the Amazon Resource Name (ARN) of the connector.
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String?

        def initialize(
          @connector_arn : String? = nil
        )
        end
      end

      struct DeleteChallengeRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the challenge password to delete.
        @[JSON::Field(key: "ChallengeArn")]
        getter challenge_arn : String

        def initialize(
          @challenge_arn : String
        )
        end
      end

      struct DeleteConnectorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector to delete.
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String

        def initialize(
          @connector_arn : String
        )
        end
      end

      struct GetChallengeMetadataRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the challenge.
        @[JSON::Field(key: "ChallengeArn")]
        getter challenge_arn : String

        def initialize(
          @challenge_arn : String
        )
        end
      end

      struct GetChallengeMetadataResponse
        include JSON::Serializable

        # The metadata for the challenge.
        @[JSON::Field(key: "ChallengeMetadata")]
        getter challenge_metadata : Types::ChallengeMetadata?

        def initialize(
          @challenge_metadata : Types::ChallengeMetadata? = nil
        )
        end
      end

      struct GetChallengePasswordRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the challenge.
        @[JSON::Field(key: "ChallengeArn")]
        getter challenge_arn : String

        def initialize(
          @challenge_arn : String
        )
        end
      end

      struct GetChallengePasswordResponse
        include JSON::Serializable

        # The SCEP challenge password.
        @[JSON::Field(key: "Password")]
        getter password : String?

        def initialize(
          @password : String? = nil
        )
        end
      end

      struct GetConnectorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector.
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String

        def initialize(
          @connector_arn : String
        )
        end
      end

      struct GetConnectorResponse
        include JSON::Serializable

        # The properties of the connector.
        @[JSON::Field(key: "Connector")]
        getter connector : Types::Connector?

        def initialize(
          @connector : Types::Connector? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure with an internal
      # server.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains configuration details for use with Microsoft Intune. For information about using Connector
      # for SCEP for Microsoft Intune, see Using Connector for SCEP for Microsoft Intune . When you use
      # Connector for SCEP for Microsoft Intune, certain functionalities are enabled by accessing Microsoft
      # Intune through the Microsoft API. Your use of the Connector for SCEP and accompanying Amazon Web
      # Services services doesn't remove your need to have a valid license for your use of the Microsoft
      # Intune service. You should also review the Microsoft Intune® App Protection Policies .
      struct IntuneConfiguration
        include JSON::Serializable

        # The directory (tenant) ID from your Microsoft Entra ID app registration.
        @[JSON::Field(key: "AzureApplicationId")]
        getter azure_application_id : String

        # The primary domain from your Microsoft Entra ID app registration.
        @[JSON::Field(key: "Domain")]
        getter domain : String

        def initialize(
          @azure_application_id : String,
          @domain : String
        )
        end
      end

      struct ListChallengeMetadataRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connector.
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String

        # The maximum number of objects that you want Connector for SCEP to return for this request. If more
        # objects are available, in the response, Connector for SCEP provides a NextToken value that you can
        # use in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Connector for SCEP returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connector_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChallengeMetadataResponse
        include JSON::Serializable

        # The challenge metadata for the challenges belonging to your Amazon Web Services account.
        @[JSON::Field(key: "Challenges")]
        getter challenges : Array(Types::ChallengeMetadataSummary)?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Connector for SCEP returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @challenges : Array(Types::ChallengeMetadataSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListConnectorsRequest
        include JSON::Serializable

        # The maximum number of objects that you want Connector for SCEP to return for this request. If more
        # objects are available, in the response, Connector for SCEP provides a NextToken value that you can
        # use in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Connector for SCEP returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListConnectorsResponse
        include JSON::Serializable

        # The connectors belonging to your Amazon Web Services account.
        @[JSON::Field(key: "Connectors")]
        getter connectors : Array(Types::ConnectorSummary)?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Connector for SCEP returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connectors : Array(Types::ConnectorSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The key-value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # If you don't supply a value, by default Connector for SCEP creates a connector for general-purpose
      # use. A general-purpose connector is designed to work with clients or endpoints that support the SCEP
      # protocol, except Connector for SCEP for Microsoft Intune. For information about considerations and
      # limitations with using Connector for SCEP, see Considerations and Limitations . If you provide an
      # IntuneConfiguration , Connector for SCEP creates a connector for use with Microsoft Intune, and you
      # manage the challenge passwords using Microsoft Intune. For more information, see Using Connector for
      # SCEP for Microsoft Intune .
      struct MobileDeviceManagement
        include JSON::Serializable

        # Configuration settings for use with Microsoft Intune. For information about using Connector for SCEP
        # for Microsoft Intune, see Using Connector for SCEP for Microsoft Intune .
        @[JSON::Field(key: "Intune")]
        getter intune : Types::IntuneConfiguration?

        def initialize(
          @intune : Types::IntuneConfiguration? = nil
        )
        end
      end

      # Contains OpenID Connect (OIDC) parameters for use with Microsoft Intune. For more information about
      # using Connector for SCEP for Microsoft Intune, see Using Connector for SCEP for Microsoft Intune .
      struct OpenIdConfiguration
        include JSON::Serializable

        # The audience value to copy into your Microsoft Entra app registration's OIDC.
        @[JSON::Field(key: "Audience")]
        getter audience : String?

        # The issuer value to copy into your Microsoft Entra app registration's OIDC.
        @[JSON::Field(key: "Issuer")]
        getter issuer : String?

        # The subject value to copy into your Microsoft Entra app registration's OIDC.
        @[JSON::Field(key: "Subject")]
        getter subject : String?

        def initialize(
          @audience : String? = nil,
          @issuer : String? = nil,
          @subject : String? = nil
        )
        end
      end

      # The operation tried to access a nonexistent resource. The resource might be incorrectly specified,
      # or it might have a status other than ACTIVE .
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The identifier of the Amazon Web Services resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource type, which can be either Connector or Challenge .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The request would cause a service quota to be exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The quota identifier.
        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # The resource type, which can be either Connector or Challenge .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Identifies the originating service.
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The key-value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The limit on the number of requests per second was exceeded.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Specifies a list of tag keys that you want to remove from the specified resources.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # An input validation error occurred. For example, invalid characters in a name tag, or an invalid
      # pagination token.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The reason for the validation error, if available. The service doesn't return a reason for every
        # validation exception.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @reason : String? = nil
        )
        end
      end
    end
  end
end
