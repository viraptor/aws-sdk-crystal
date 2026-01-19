require "json"
require "time"

module AwsSdk
  module WorkSpacesWeb
    module Types

      # Access is denied.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct AssociateBrowserSettingsRequest
        include JSON::Serializable

        # The ARN of the browser settings.
        @[JSON::Field(key: "browserSettingsArn")]
        getter browser_settings_arn : String

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @browser_settings_arn : String,
          @portal_arn : String
        )
        end
      end

      struct AssociateBrowserSettingsResponse
        include JSON::Serializable

        # The ARN of the browser settings.
        @[JSON::Field(key: "browserSettingsArn")]
        getter browser_settings_arn : String

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @browser_settings_arn : String,
          @portal_arn : String
        )
        end
      end

      struct AssociateDataProtectionSettingsRequest
        include JSON::Serializable

        # The ARN of the data protection settings.
        @[JSON::Field(key: "dataProtectionSettingsArn")]
        getter data_protection_settings_arn : String

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @data_protection_settings_arn : String,
          @portal_arn : String
        )
        end
      end

      struct AssociateDataProtectionSettingsResponse
        include JSON::Serializable

        # The ARN of the data protection settings resource.
        @[JSON::Field(key: "dataProtectionSettingsArn")]
        getter data_protection_settings_arn : String

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @data_protection_settings_arn : String,
          @portal_arn : String
        )
        end
      end

      struct AssociateIpAccessSettingsRequest
        include JSON::Serializable

        # The ARN of the IP access settings.
        @[JSON::Field(key: "ipAccessSettingsArn")]
        getter ip_access_settings_arn : String

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @ip_access_settings_arn : String,
          @portal_arn : String
        )
        end
      end

      struct AssociateIpAccessSettingsResponse
        include JSON::Serializable

        # The ARN of the IP access settings resource.
        @[JSON::Field(key: "ipAccessSettingsArn")]
        getter ip_access_settings_arn : String

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @ip_access_settings_arn : String,
          @portal_arn : String
        )
        end
      end

      struct AssociateNetworkSettingsRequest
        include JSON::Serializable

        # The ARN of the network settings.
        @[JSON::Field(key: "networkSettingsArn")]
        getter network_settings_arn : String

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @network_settings_arn : String,
          @portal_arn : String
        )
        end
      end

      struct AssociateNetworkSettingsResponse
        include JSON::Serializable

        # The ARN of the network settings.
        @[JSON::Field(key: "networkSettingsArn")]
        getter network_settings_arn : String

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @network_settings_arn : String,
          @portal_arn : String
        )
        end
      end

      struct AssociateSessionLoggerRequest
        include JSON::Serializable

        # The ARN of the portal to associate to the session logger ARN.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The ARN of the session logger to associate to the portal ARN.
        @[JSON::Field(key: "sessionLoggerArn")]
        getter session_logger_arn : String

        def initialize(
          @portal_arn : String,
          @session_logger_arn : String
        )
        end
      end

      struct AssociateSessionLoggerResponse
        include JSON::Serializable

        # The ARN of the portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The ARN of the session logger.
        @[JSON::Field(key: "sessionLoggerArn")]
        getter session_logger_arn : String

        def initialize(
          @portal_arn : String,
          @session_logger_arn : String
        )
        end
      end

      struct AssociateTrustStoreRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The ARN of the trust store.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String

        def initialize(
          @portal_arn : String,
          @trust_store_arn : String
        )
        end
      end

      struct AssociateTrustStoreResponse
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The ARN of the trust store.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String

        def initialize(
          @portal_arn : String,
          @trust_store_arn : String
        )
        end
      end

      struct AssociateUserAccessLoggingSettingsRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The ARN of the user access logging settings.
        @[JSON::Field(key: "userAccessLoggingSettingsArn")]
        getter user_access_logging_settings_arn : String

        def initialize(
          @portal_arn : String,
          @user_access_logging_settings_arn : String
        )
        end
      end

      struct AssociateUserAccessLoggingSettingsResponse
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The ARN of the user access logging settings.
        @[JSON::Field(key: "userAccessLoggingSettingsArn")]
        getter user_access_logging_settings_arn : String

        def initialize(
          @portal_arn : String,
          @user_access_logging_settings_arn : String
        )
        end
      end

      struct AssociateUserSettingsRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The ARN of the user settings.
        @[JSON::Field(key: "userSettingsArn")]
        getter user_settings_arn : String

        def initialize(
          @portal_arn : String,
          @user_settings_arn : String
        )
        end
      end

      struct AssociateUserSettingsResponse
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The ARN of the user settings.
        @[JSON::Field(key: "userSettingsArn")]
        getter user_settings_arn : String

        def initialize(
          @portal_arn : String,
          @user_settings_arn : String
        )
        end
      end

      # The branding configuration output including custom images metadata, localized strings, color theme,
      # and terms of service.
      struct BrandingConfiguration
        include JSON::Serializable

        # The color theme for components on the web portal.
        @[JSON::Field(key: "colorTheme")]
        getter color_theme : String

        # Metadata for the favicon image file, including the MIME type, file extension, and upload timestamp.
        @[JSON::Field(key: "favicon")]
        getter favicon : Types::ImageMetadata

        # A map of localized text strings for different languages, allowing the portal to display content in
        # the user's preferred language.
        @[JSON::Field(key: "localizedStrings")]
        getter localized_strings : Hash(String, Types::LocalizedBrandingStrings)

        # Metadata for the logo image file, including the MIME type, file extension, and upload timestamp.
        @[JSON::Field(key: "logo")]
        getter logo : Types::ImageMetadata

        # Metadata for the wallpaper image file, including the MIME type, file extension, and upload
        # timestamp.
        @[JSON::Field(key: "wallpaper")]
        getter wallpaper : Types::ImageMetadata

        # The terms of service text in Markdown format that users must accept before accessing the portal.
        @[JSON::Field(key: "termsOfService")]
        getter terms_of_service : String?

        def initialize(
          @color_theme : String,
          @favicon : Types::ImageMetadata,
          @localized_strings : Hash(String, Types::LocalizedBrandingStrings),
          @logo : Types::ImageMetadata,
          @wallpaper : Types::ImageMetadata,
          @terms_of_service : String? = nil
        )
        end
      end

      # The input configuration for creating branding settings.
      struct BrandingConfigurationCreateInput
        include JSON::Serializable

        # The color theme for components on the web portal. Choose Light if you upload a dark wallpaper, or
        # Dark for a light wallpaper.
        @[JSON::Field(key: "colorTheme")]
        getter color_theme : String

        # The favicon image for the portal. Provide either a binary image file or an S3 URI pointing to the
        # image file. Maximum 100 KB in JPEG, PNG, or ICO format.
        @[JSON::Field(key: "favicon")]
        getter favicon : Types::IconImageInput

        # A map of localized text strings for different supported languages. Each locale must provide the
        # required fields browserTabTitle and welcomeText .
        @[JSON::Field(key: "localizedStrings")]
        getter localized_strings : Hash(String, Types::LocalizedBrandingStrings)

        # The logo image for the portal. Provide either a binary image file or an S3 URI pointing to the image
        # file. Maximum 100 KB in JPEG, PNG, or ICO format.
        @[JSON::Field(key: "logo")]
        getter logo : Types::IconImageInput

        # The wallpaper image for the portal. Provide either a binary image file or an S3 URI pointing to the
        # image file. Maximum 5 MB in JPEG or PNG format.
        @[JSON::Field(key: "wallpaper")]
        getter wallpaper : Types::WallpaperImageInput

        # The terms of service text in Markdown format. Users will be presented with the terms of service
        # after successfully signing in.
        @[JSON::Field(key: "termsOfService")]
        getter terms_of_service : String?

        def initialize(
          @color_theme : String,
          @favicon : Types::IconImageInput,
          @localized_strings : Hash(String, Types::LocalizedBrandingStrings),
          @logo : Types::IconImageInput,
          @wallpaper : Types::WallpaperImageInput,
          @terms_of_service : String? = nil
        )
        end
      end

      # The input configuration for updating branding settings. All fields are optional when updating
      # existing branding.
      struct BrandingConfigurationUpdateInput
        include JSON::Serializable

        # The color theme for components on the web portal. Choose Light if you upload a dark wallpaper, or
        # Dark for a light wallpaper.
        @[JSON::Field(key: "colorTheme")]
        getter color_theme : String?

        # The favicon image for the portal. Provide either a binary image file or an S3 URI pointing to the
        # image file. Maximum 100 KB in JPEG, PNG, or ICO format.
        @[JSON::Field(key: "favicon")]
        getter favicon : Types::IconImageInput?

        # A map of localized text strings for different supported languages. Each locale must provide the
        # required fields browserTabTitle and welcomeText .
        @[JSON::Field(key: "localizedStrings")]
        getter localized_strings : Hash(String, Types::LocalizedBrandingStrings)?

        # The logo image for the portal. Provide either a binary image file or an S3 URI pointing to the image
        # file. Maximum 100 KB in JPEG, PNG, or ICO format.
        @[JSON::Field(key: "logo")]
        getter logo : Types::IconImageInput?

        # The terms of service text in Markdown format. To remove existing terms of service, provide an empty
        # string.
        @[JSON::Field(key: "termsOfService")]
        getter terms_of_service : String?

        # The wallpaper image for the portal. Provide either a binary image file or an S3 URI pointing to the
        # image file. Maximum 5 MB in JPEG or PNG format.
        @[JSON::Field(key: "wallpaper")]
        getter wallpaper : Types::WallpaperImageInput?

        def initialize(
          @color_theme : String? = nil,
          @favicon : Types::IconImageInput? = nil,
          @localized_strings : Hash(String, Types::LocalizedBrandingStrings)? = nil,
          @logo : Types::IconImageInput? = nil,
          @terms_of_service : String? = nil,
          @wallpaper : Types::WallpaperImageInput? = nil
        )
        end
      end

      # The browser settings resource that can be associated with a web portal. Once associated with a web
      # portal, browser settings control how the browser will behave once a user starts a streaming session
      # for the web portal.
      struct BrowserSettings
        include JSON::Serializable

        # The ARN of the browser settings.
        @[JSON::Field(key: "browserSettingsArn")]
        getter browser_settings_arn : String

        # The additional encryption context of the browser settings.
        @[JSON::Field(key: "additionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # A list of web portal ARNs that this browser settings is associated with.
        @[JSON::Field(key: "associatedPortalArns")]
        getter associated_portal_arns : Array(String)?

        # A JSON string containing Chrome Enterprise policies that will be applied to all streaming sessions.
        @[JSON::Field(key: "browserPolicy")]
        getter browser_policy : String?

        # The customer managed key used to encrypt sensitive information in the browser settings.
        @[JSON::Field(key: "customerManagedKey")]
        getter customer_managed_key : String?

        # The policy that specifies which URLs end users are allowed to access or which URLs or domain
        # categories they are restricted from accessing for enhanced security.
        @[JSON::Field(key: "webContentFilteringPolicy")]
        getter web_content_filtering_policy : Types::WebContentFilteringPolicy?

        def initialize(
          @browser_settings_arn : String,
          @additional_encryption_context : Hash(String, String)? = nil,
          @associated_portal_arns : Array(String)? = nil,
          @browser_policy : String? = nil,
          @customer_managed_key : String? = nil,
          @web_content_filtering_policy : Types::WebContentFilteringPolicy? = nil
        )
        end
      end

      # The summary for browser settings.
      struct BrowserSettingsSummary
        include JSON::Serializable

        # The ARN of the browser settings.
        @[JSON::Field(key: "browserSettingsArn")]
        getter browser_settings_arn : String

        def initialize(
          @browser_settings_arn : String
        )
        end
      end

      # The certificate.
      struct Certificate
        include JSON::Serializable

        # The body of the certificate.
        @[JSON::Field(key: "body")]
        getter body : Bytes?

        # The entity that issued the certificate.
        @[JSON::Field(key: "issuer")]
        getter issuer : String?

        # The certificate is not valid after this date.
        @[JSON::Field(key: "notValidAfter")]
        getter not_valid_after : Time?

        # The certificate is not valid before this date.
        @[JSON::Field(key: "notValidBefore")]
        getter not_valid_before : Time?

        # The entity the certificate belongs to.
        @[JSON::Field(key: "subject")]
        getter subject : String?

        # A hexadecimal identifier for the certificate.
        @[JSON::Field(key: "thumbprint")]
        getter thumbprint : String?

        def initialize(
          @body : Bytes? = nil,
          @issuer : String? = nil,
          @not_valid_after : Time? = nil,
          @not_valid_before : Time? = nil,
          @subject : String? = nil,
          @thumbprint : String? = nil
        )
        end
      end

      # The summary of the certificate.
      struct CertificateSummary
        include JSON::Serializable

        # The entity that issued the certificate.
        @[JSON::Field(key: "issuer")]
        getter issuer : String?

        # The certificate is not valid after this date.
        @[JSON::Field(key: "notValidAfter")]
        getter not_valid_after : Time?

        # The certificate is not valid before this date.
        @[JSON::Field(key: "notValidBefore")]
        getter not_valid_before : Time?

        # The entity the certificate belongs to.
        @[JSON::Field(key: "subject")]
        getter subject : String?

        # A hexadecimal identifier for the certificate.
        @[JSON::Field(key: "thumbprint")]
        getter thumbprint : String?

        def initialize(
          @issuer : String? = nil,
          @not_valid_after : Time? = nil,
          @not_valid_before : Time? = nil,
          @subject : String? = nil,
          @thumbprint : String? = nil
        )
        end
      end

      # There is a conflict.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # Identifier of the resource affected.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Type of the resource affected.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Specifies a single cookie or set of cookies in an end user's browser.
      struct CookieSpecification
        include JSON::Serializable

        # The domain of the cookie.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the cookie.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The path of the cookie.
        @[JSON::Field(key: "path")]
        getter path : String?

        def initialize(
          @domain : String,
          @name : String? = nil,
          @path : String? = nil
        )
        end
      end

      # The configuration that specifies which cookies should be synchronized from the end user's local
      # browser to the remote browser.
      struct CookieSynchronizationConfiguration
        include JSON::Serializable

        # The list of cookie specifications that are allowed to be synchronized to the remote browser.
        @[JSON::Field(key: "allowlist")]
        getter allowlist : Array(Types::CookieSpecification)

        # The list of cookie specifications that are blocked from being synchronized to the remote browser.
        @[JSON::Field(key: "blocklist")]
        getter blocklist : Array(Types::CookieSpecification)?

        def initialize(
          @allowlist : Array(Types::CookieSpecification),
          @blocklist : Array(Types::CookieSpecification)? = nil
        )
        end
      end

      struct CreateBrowserSettingsRequest
        include JSON::Serializable

        # Additional encryption context of the browser settings.
        @[JSON::Field(key: "additionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # A JSON string containing Chrome Enterprise policies that will be applied to all streaming sessions.
        @[JSON::Field(key: "browserPolicy")]
        getter browser_policy : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token returns the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The custom managed key of the browser settings.
        @[JSON::Field(key: "customerManagedKey")]
        getter customer_managed_key : String?

        # The tags to add to the browser settings resource. A tag is a key-value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The policy that specifies which URLs end users are allowed to access or which URLs or domain
        # categories they are restricted from accessing for enhanced security.
        @[JSON::Field(key: "webContentFilteringPolicy")]
        getter web_content_filtering_policy : Types::WebContentFilteringPolicy?

        def initialize(
          @additional_encryption_context : Hash(String, String)? = nil,
          @browser_policy : String? = nil,
          @client_token : String? = nil,
          @customer_managed_key : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @web_content_filtering_policy : Types::WebContentFilteringPolicy? = nil
        )
        end
      end

      struct CreateBrowserSettingsResponse
        include JSON::Serializable

        # The ARN of the browser settings.
        @[JSON::Field(key: "browserSettingsArn")]
        getter browser_settings_arn : String

        def initialize(
          @browser_settings_arn : String
        )
        end
      end

      struct CreateDataProtectionSettingsRequest
        include JSON::Serializable

        # Additional encryption context of the data protection settings.
        @[JSON::Field(key: "additionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token returns the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The custom managed key of the data protection settings.
        @[JSON::Field(key: "customerManagedKey")]
        getter customer_managed_key : String?

        # The description of the data protection settings.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the data protection settings.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The inline redaction configuration of the data protection settings that will be applied to all
        # sessions.
        @[JSON::Field(key: "inlineRedactionConfiguration")]
        getter inline_redaction_configuration : Types::InlineRedactionConfiguration?

        # The tags to add to the data protection settings resource. A tag is a key-value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @additional_encryption_context : Hash(String, String)? = nil,
          @client_token : String? = nil,
          @customer_managed_key : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @inline_redaction_configuration : Types::InlineRedactionConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDataProtectionSettingsResponse
        include JSON::Serializable

        # The ARN of the data protection settings resource.
        @[JSON::Field(key: "dataProtectionSettingsArn")]
        getter data_protection_settings_arn : String

        def initialize(
          @data_protection_settings_arn : String
        )
        end
      end

      struct CreateIdentityProviderRequest
        include JSON::Serializable

        # The identity provider details. The following list describes the provider detail keys for each
        # identity provider type. For Google and Login with Amazon: client_id client_secret authorize_scopes
        # For Facebook: client_id client_secret authorize_scopes api_version For Sign in with Apple: client_id
        # team_id key_id private_key authorize_scopes For OIDC providers: client_id client_secret
        # attributes_request_method oidc_issuer authorize_scopes authorize_url if not available from discovery
        # URL specified by oidc_issuer key token_url if not available from discovery URL specified by
        # oidc_issuer key attributes_url if not available from discovery URL specified by oidc_issuer key
        # jwks_uri if not available from discovery URL specified by oidc_issuer key For SAML providers:
        # MetadataFile OR MetadataURL IDPSignout (boolean) optional IDPInit (boolean) optional
        # RequestSigningAlgorithm (string) optional - Only accepts rsa-sha256 EncryptedResponses (boolean)
        # optional
        @[JSON::Field(key: "identityProviderDetails")]
        getter identity_provider_details : Hash(String, String)

        # The identity provider name.
        @[JSON::Field(key: "identityProviderName")]
        getter identity_provider_name : String

        # The identity provider type.
        @[JSON::Field(key: "identityProviderType")]
        getter identity_provider_type : String

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token returns the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags to add to the identity provider resource. A tag is a key-value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @identity_provider_details : Hash(String, String),
          @identity_provider_name : String,
          @identity_provider_type : String,
          @portal_arn : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateIdentityProviderResponse
        include JSON::Serializable

        # The ARN of the identity provider.
        @[JSON::Field(key: "identityProviderArn")]
        getter identity_provider_arn : String

        def initialize(
          @identity_provider_arn : String
        )
        end
      end

      struct CreateIpAccessSettingsRequest
        include JSON::Serializable

        # The IP rules of the IP access settings.
        @[JSON::Field(key: "ipRules")]
        getter ip_rules : Array(Types::IpRule)

        # Additional encryption context of the IP access settings.
        @[JSON::Field(key: "additionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token returns the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The custom managed key of the IP access settings.
        @[JSON::Field(key: "customerManagedKey")]
        getter customer_managed_key : String?

        # The description of the IP access settings.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the IP access settings.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The tags to add to the IP access settings resource. A tag is a key-value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @ip_rules : Array(Types::IpRule),
          @additional_encryption_context : Hash(String, String)? = nil,
          @client_token : String? = nil,
          @customer_managed_key : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateIpAccessSettingsResponse
        include JSON::Serializable

        # The ARN of the IP access settings resource.
        @[JSON::Field(key: "ipAccessSettingsArn")]
        getter ip_access_settings_arn : String

        def initialize(
          @ip_access_settings_arn : String
        )
        end
      end

      struct CreateNetworkSettingsRequest
        include JSON::Serializable

        # One or more security groups used to control access from streaming instances to your VPC.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The subnets in which network interfaces are created to connect streaming instances to your VPC. At
        # least two of these subnets must be in different availability zones.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The VPC that streaming instances will connect to.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token returns the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags to add to the network settings resource. A tag is a key-value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @security_group_ids : Array(String),
          @subnet_ids : Array(String),
          @vpc_id : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateNetworkSettingsResponse
        include JSON::Serializable

        # The ARN of the network settings.
        @[JSON::Field(key: "networkSettingsArn")]
        getter network_settings_arn : String

        def initialize(
          @network_settings_arn : String
        )
        end
      end

      struct CreatePortalRequest
        include JSON::Serializable

        # The additional encryption context of the portal.
        @[JSON::Field(key: "additionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # The type of authentication integration points used when signing into the web portal. Defaults to
        # Standard . Standard web portals are authenticated directly through your identity provider. You need
        # to call CreateIdentityProvider to integrate your identity provider with your web portal. User and
        # group access to your web portal is controlled through your identity provider. IAM Identity Center
        # web portals are authenticated through IAM Identity Center. Identity sources (including external
        # identity provider integration), plus user and group access to your web portal, can be configured in
        # the IAM Identity Center.
        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token returns the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The customer managed key of the web portal.
        @[JSON::Field(key: "customerManagedKey")]
        getter customer_managed_key : String?

        # The name of the web portal. This is not visible to users who log into the web portal.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The type and resources of the underlying instance.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The maximum number of concurrent sessions for the portal.
        @[JSON::Field(key: "maxConcurrentSessions")]
        getter max_concurrent_sessions : Int32?

        # The tags to add to the web portal. A tag is a key-value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @additional_encryption_context : Hash(String, String)? = nil,
          @authentication_type : String? = nil,
          @client_token : String? = nil,
          @customer_managed_key : String? = nil,
          @display_name : String? = nil,
          @instance_type : String? = nil,
          @max_concurrent_sessions : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreatePortalResponse
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The endpoint URL of the web portal that users access in order to start streaming sessions.
        @[JSON::Field(key: "portalEndpoint")]
        getter portal_endpoint : String

        def initialize(
          @portal_arn : String,
          @portal_endpoint : String
        )
        end
      end

      struct CreateSessionLoggerRequest
        include JSON::Serializable

        # The filter that specifies the events to monitor.
        @[JSON::Field(key: "eventFilter")]
        getter event_filter : Types::EventFilter

        # The configuration that specifies where logs are delivered.
        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::LogConfiguration

        # The additional encryption context of the session logger.
        @[JSON::Field(key: "additionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token returns the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the AWS SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The custom managed key of the session logger.
        @[JSON::Field(key: "customerManagedKey")]
        getter customer_managed_key : String?

        # The human-readable display name for the session logger resource.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The tags to add to the session logger.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @event_filter : Types::EventFilter,
          @log_configuration : Types::LogConfiguration,
          @additional_encryption_context : Hash(String, String)? = nil,
          @client_token : String? = nil,
          @customer_managed_key : String? = nil,
          @display_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateSessionLoggerResponse
        include JSON::Serializable

        # The ARN of the session logger.
        @[JSON::Field(key: "sessionLoggerArn")]
        getter session_logger_arn : String

        def initialize(
          @session_logger_arn : String
        )
        end
      end

      struct CreateTrustStoreRequest
        include JSON::Serializable

        # A list of CA certificates to be added to the trust store.
        @[JSON::Field(key: "certificateList")]
        getter certificate_list : Array(Bytes)

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token returns the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags to add to the trust store. A tag is a key-value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @certificate_list : Array(Bytes),
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateTrustStoreResponse
        include JSON::Serializable

        # The ARN of the trust store.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String

        def initialize(
          @trust_store_arn : String
        )
        end
      end

      struct CreateUserAccessLoggingSettingsRequest
        include JSON::Serializable

        # The ARN of the Kinesis stream.
        @[JSON::Field(key: "kinesisStreamArn")]
        getter kinesis_stream_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token returns the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags to add to the user settings resource. A tag is a key-value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @kinesis_stream_arn : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateUserAccessLoggingSettingsResponse
        include JSON::Serializable

        # The ARN of the user access logging settings.
        @[JSON::Field(key: "userAccessLoggingSettingsArn")]
        getter user_access_logging_settings_arn : String

        def initialize(
          @user_access_logging_settings_arn : String
        )
        end
      end

      struct CreateUserSettingsRequest
        include JSON::Serializable

        # Specifies whether the user can copy text from the streaming session to the local device.
        @[JSON::Field(key: "copyAllowed")]
        getter copy_allowed : String

        # Specifies whether the user can download files from the streaming session to the local device.
        @[JSON::Field(key: "downloadAllowed")]
        getter download_allowed : String

        # Specifies whether the user can paste text from the local device to the streaming session.
        @[JSON::Field(key: "pasteAllowed")]
        getter paste_allowed : String

        # Specifies whether the user can print to the local device.
        @[JSON::Field(key: "printAllowed")]
        getter print_allowed : String

        # Specifies whether the user can upload files from the local device to the streaming session.
        @[JSON::Field(key: "uploadAllowed")]
        getter upload_allowed : String

        # The additional encryption context of the user settings.
        @[JSON::Field(key: "additionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # The branding configuration input that customizes the appearance of the web portal for end users.
        # This includes a custom logo, favicon, wallpaper, localized strings, color theme, and an optional
        # terms of service.
        @[JSON::Field(key: "brandingConfigurationInput")]
        getter branding_configuration_input : Types::BrandingConfigurationCreateInput?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token returns the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The configuration that specifies which cookies should be synchronized from the end user's local
        # browser to the remote browser.
        @[JSON::Field(key: "cookieSynchronizationConfiguration")]
        getter cookie_synchronization_configuration : Types::CookieSynchronizationConfiguration?

        # The customer managed key used to encrypt sensitive information in the user settings.
        @[JSON::Field(key: "customerManagedKey")]
        getter customer_managed_key : String?

        # Specifies whether the user can use deep links that open automatically when connecting to a session.
        @[JSON::Field(key: "deepLinkAllowed")]
        getter deep_link_allowed : String?

        # The amount of time that a streaming session remains active after users disconnect.
        @[JSON::Field(key: "disconnectTimeoutInMinutes")]
        getter disconnect_timeout_in_minutes : Int32?

        # The amount of time that users can be idle (inactive) before they are disconnected from their
        # streaming session and the disconnect timeout interval begins.
        @[JSON::Field(key: "idleDisconnectTimeoutInMinutes")]
        getter idle_disconnect_timeout_in_minutes : Int32?

        # The tags to add to the user settings resource. A tag is a key-value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The configuration of the toolbar. This allows administrators to select the toolbar type and visual
        # mode, set maximum display resolution for sessions, and choose which items are visible to end users
        # during their sessions. If administrators do not modify these settings, end users retain control over
        # their toolbar preferences.
        @[JSON::Field(key: "toolbarConfiguration")]
        getter toolbar_configuration : Types::ToolbarConfiguration?

        # Specifies whether the user can use WebAuthn redirection for passwordless login to websites within
        # the streaming session.
        @[JSON::Field(key: "webAuthnAllowed")]
        getter web_authn_allowed : String?

        def initialize(
          @copy_allowed : String,
          @download_allowed : String,
          @paste_allowed : String,
          @print_allowed : String,
          @upload_allowed : String,
          @additional_encryption_context : Hash(String, String)? = nil,
          @branding_configuration_input : Types::BrandingConfigurationCreateInput? = nil,
          @client_token : String? = nil,
          @cookie_synchronization_configuration : Types::CookieSynchronizationConfiguration? = nil,
          @customer_managed_key : String? = nil,
          @deep_link_allowed : String? = nil,
          @disconnect_timeout_in_minutes : Int32? = nil,
          @idle_disconnect_timeout_in_minutes : Int32? = nil,
          @tags : Array(Types::Tag)? = nil,
          @toolbar_configuration : Types::ToolbarConfiguration? = nil,
          @web_authn_allowed : String? = nil
        )
        end
      end

      struct CreateUserSettingsResponse
        include JSON::Serializable

        # The ARN of the user settings.
        @[JSON::Field(key: "userSettingsArn")]
        getter user_settings_arn : String

        def initialize(
          @user_settings_arn : String
        )
        end
      end

      # The pattern configuration for redacting custom data types in session.
      struct CustomPattern
        include JSON::Serializable

        # The pattern name for the custom pattern.
        @[JSON::Field(key: "patternName")]
        getter pattern_name : String

        # The pattern regex for the customer pattern. The format must follow JavaScript regex format. The
        # pattern must be enclosed between slashes, and can have flags behind the second slash. For example:
        # “/ab+c/gi”.
        @[JSON::Field(key: "patternRegex")]
        getter pattern_regex : String

        # The keyword regex for the customer pattern. After there is a match to the pattern regex, the keyword
        # regex is used to search within the proximity of the match. If there is a keyword match, then the
        # match is confirmed. If no keyword regex is provided, the pattern regex match will automatically be
        # confirmed. The format must follow JavaScript regex format. The pattern must be enclosed between
        # slashes, and can have flags behind the second slash. For example, “/ab+c/gi”
        @[JSON::Field(key: "keywordRegex")]
        getter keyword_regex : String?

        # The pattern description for the customer pattern.
        @[JSON::Field(key: "patternDescription")]
        getter pattern_description : String?

        def initialize(
          @pattern_name : String,
          @pattern_regex : String,
          @keyword_regex : String? = nil,
          @pattern_description : String? = nil
        )
        end
      end

      # The data protection settings resource that can be associated with a web portal.
      struct DataProtectionSettings
        include JSON::Serializable

        # The ARN of the data protection settings resource.
        @[JSON::Field(key: "dataProtectionSettingsArn")]
        getter data_protection_settings_arn : String

        # The additional encryption context of the data protection settings.
        @[JSON::Field(key: "additionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # A list of web portal ARNs that this data protection settings resource is associated with.
        @[JSON::Field(key: "associatedPortalArns")]
        getter associated_portal_arns : Array(String)?

        # The creation date timestamp of the data protection settings.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The customer managed key used to encrypt sensitive information in the data protection settings.
        @[JSON::Field(key: "customerManagedKey")]
        getter customer_managed_key : String?

        # The description of the data protection settings.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the data protection settings.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The inline redaction configuration for the data protection settings.
        @[JSON::Field(key: "inlineRedactionConfiguration")]
        getter inline_redaction_configuration : Types::InlineRedactionConfiguration?

        def initialize(
          @data_protection_settings_arn : String,
          @additional_encryption_context : Hash(String, String)? = nil,
          @associated_portal_arns : Array(String)? = nil,
          @creation_date : Time? = nil,
          @customer_managed_key : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @inline_redaction_configuration : Types::InlineRedactionConfiguration? = nil
        )
        end
      end

      # The summary of the data protection settings.
      struct DataProtectionSettingsSummary
        include JSON::Serializable

        # The ARN of the data protection settings.
        @[JSON::Field(key: "dataProtectionSettingsArn")]
        getter data_protection_settings_arn : String

        # The creation date timestamp of the data protection settings.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The description of the data protection settings.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the data protection settings.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @data_protection_settings_arn : String,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil
        )
        end
      end

      struct DeleteBrowserSettingsRequest
        include JSON::Serializable

        # The ARN of the browser settings.
        @[JSON::Field(key: "browserSettingsArn")]
        getter browser_settings_arn : String

        def initialize(
          @browser_settings_arn : String
        )
        end
      end

      struct DeleteBrowserSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteDataProtectionSettingsRequest
        include JSON::Serializable

        # The ARN of the data protection settings.
        @[JSON::Field(key: "dataProtectionSettingsArn")]
        getter data_protection_settings_arn : String

        def initialize(
          @data_protection_settings_arn : String
        )
        end
      end

      struct DeleteDataProtectionSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteIdentityProviderRequest
        include JSON::Serializable

        # The ARN of the identity provider.
        @[JSON::Field(key: "identityProviderArn")]
        getter identity_provider_arn : String

        def initialize(
          @identity_provider_arn : String
        )
        end
      end

      struct DeleteIdentityProviderResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteIpAccessSettingsRequest
        include JSON::Serializable

        # The ARN of the IP access settings.
        @[JSON::Field(key: "ipAccessSettingsArn")]
        getter ip_access_settings_arn : String

        def initialize(
          @ip_access_settings_arn : String
        )
        end
      end

      struct DeleteIpAccessSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteNetworkSettingsRequest
        include JSON::Serializable

        # The ARN of the network settings.
        @[JSON::Field(key: "networkSettingsArn")]
        getter network_settings_arn : String

        def initialize(
          @network_settings_arn : String
        )
        end
      end

      struct DeleteNetworkSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeletePortalRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @portal_arn : String
        )
        end
      end

      struct DeletePortalResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSessionLoggerRequest
        include JSON::Serializable

        # The ARN of the session logger.
        @[JSON::Field(key: "sessionLoggerArn")]
        getter session_logger_arn : String

        def initialize(
          @session_logger_arn : String
        )
        end
      end

      struct DeleteSessionLoggerResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteTrustStoreRequest
        include JSON::Serializable

        # The ARN of the trust store.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String

        def initialize(
          @trust_store_arn : String
        )
        end
      end

      struct DeleteTrustStoreResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteUserAccessLoggingSettingsRequest
        include JSON::Serializable

        # The ARN of the user access logging settings.
        @[JSON::Field(key: "userAccessLoggingSettingsArn")]
        getter user_access_logging_settings_arn : String

        def initialize(
          @user_access_logging_settings_arn : String
        )
        end
      end

      struct DeleteUserAccessLoggingSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteUserSettingsRequest
        include JSON::Serializable

        # The ARN of the user settings.
        @[JSON::Field(key: "userSettingsArn")]
        getter user_settings_arn : String

        def initialize(
          @user_settings_arn : String
        )
        end
      end

      struct DeleteUserSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateBrowserSettingsRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @portal_arn : String
        )
        end
      end

      struct DisassociateBrowserSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateDataProtectionSettingsRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @portal_arn : String
        )
        end
      end

      struct DisassociateDataProtectionSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateIpAccessSettingsRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @portal_arn : String
        )
        end
      end

      struct DisassociateIpAccessSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateNetworkSettingsRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @portal_arn : String
        )
        end
      end

      struct DisassociateNetworkSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateSessionLoggerRequest
        include JSON::Serializable

        # The ARN of the portal to disassociate from the a session logger.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @portal_arn : String
        )
        end
      end

      struct DisassociateSessionLoggerResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateTrustStoreRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @portal_arn : String
        )
        end
      end

      struct DisassociateTrustStoreResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateUserAccessLoggingSettingsRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @portal_arn : String
        )
        end
      end

      struct DisassociateUserAccessLoggingSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateUserSettingsRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @portal_arn : String
        )
        end
      end

      struct DisassociateUserSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The filter that specifies the events to monitor.
      struct EventFilter
        include JSON::Serializable

        # The filter that monitors all of the available events, including any new events emitted in the
        # future.
        @[JSON::Field(key: "all")]
        getter all : Types::Unit?

        # The filter that monitors only the listed set of events. New events are not auto-monitored.
        @[JSON::Field(key: "include")]
        getter include : Array(String)?

        def initialize(
          @all : Types::Unit? = nil,
          @include : Array(String)? = nil
        )
        end
      end

      struct ExpireSessionRequest
        include JSON::Serializable

        # The ID of the web portal for the session.
        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # The ID of the session to expire.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @portal_id : String,
          @session_id : String
        )
        end
      end

      struct ExpireSessionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct GetBrowserSettingsRequest
        include JSON::Serializable

        # The ARN of the browser settings.
        @[JSON::Field(key: "browserSettingsArn")]
        getter browser_settings_arn : String

        def initialize(
          @browser_settings_arn : String
        )
        end
      end

      struct GetBrowserSettingsResponse
        include JSON::Serializable

        # The browser settings.
        @[JSON::Field(key: "browserSettings")]
        getter browser_settings : Types::BrowserSettings?

        def initialize(
          @browser_settings : Types::BrowserSettings? = nil
        )
        end
      end

      struct GetDataProtectionSettingsRequest
        include JSON::Serializable

        # The ARN of the data protection settings.
        @[JSON::Field(key: "dataProtectionSettingsArn")]
        getter data_protection_settings_arn : String

        def initialize(
          @data_protection_settings_arn : String
        )
        end
      end

      struct GetDataProtectionSettingsResponse
        include JSON::Serializable

        # The data protection settings.
        @[JSON::Field(key: "dataProtectionSettings")]
        getter data_protection_settings : Types::DataProtectionSettings?

        def initialize(
          @data_protection_settings : Types::DataProtectionSettings? = nil
        )
        end
      end

      struct GetIdentityProviderRequest
        include JSON::Serializable

        # The ARN of the identity provider.
        @[JSON::Field(key: "identityProviderArn")]
        getter identity_provider_arn : String

        def initialize(
          @identity_provider_arn : String
        )
        end
      end

      struct GetIdentityProviderResponse
        include JSON::Serializable

        # The identity provider.
        @[JSON::Field(key: "identityProvider")]
        getter identity_provider : Types::IdentityProvider?

        def initialize(
          @identity_provider : Types::IdentityProvider? = nil
        )
        end
      end

      struct GetIpAccessSettingsRequest
        include JSON::Serializable

        # The ARN of the IP access settings.
        @[JSON::Field(key: "ipAccessSettingsArn")]
        getter ip_access_settings_arn : String

        def initialize(
          @ip_access_settings_arn : String
        )
        end
      end

      struct GetIpAccessSettingsResponse
        include JSON::Serializable

        # The IP access settings.
        @[JSON::Field(key: "ipAccessSettings")]
        getter ip_access_settings : Types::IpAccessSettings?

        def initialize(
          @ip_access_settings : Types::IpAccessSettings? = nil
        )
        end
      end

      struct GetNetworkSettingsRequest
        include JSON::Serializable

        # The ARN of the network settings.
        @[JSON::Field(key: "networkSettingsArn")]
        getter network_settings_arn : String

        def initialize(
          @network_settings_arn : String
        )
        end
      end

      struct GetNetworkSettingsResponse
        include JSON::Serializable

        # The network settings.
        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::NetworkSettings?

        def initialize(
          @network_settings : Types::NetworkSettings? = nil
        )
        end
      end

      struct GetPortalRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @portal_arn : String
        )
        end
      end

      struct GetPortalResponse
        include JSON::Serializable

        # The web portal.
        @[JSON::Field(key: "portal")]
        getter portal : Types::Portal?

        def initialize(
          @portal : Types::Portal? = nil
        )
        end
      end

      struct GetPortalServiceProviderMetadataRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        def initialize(
          @portal_arn : String
        )
        end
      end

      struct GetPortalServiceProviderMetadataResponse
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The service provider SAML metadata.
        @[JSON::Field(key: "serviceProviderSamlMetadata")]
        getter service_provider_saml_metadata : String?

        def initialize(
          @portal_arn : String,
          @service_provider_saml_metadata : String? = nil
        )
        end
      end

      struct GetSessionLoggerRequest
        include JSON::Serializable

        # The ARN of the session logger.
        @[JSON::Field(key: "sessionLoggerArn")]
        getter session_logger_arn : String

        def initialize(
          @session_logger_arn : String
        )
        end
      end

      struct GetSessionLoggerResponse
        include JSON::Serializable

        # The session logger details.
        @[JSON::Field(key: "sessionLogger")]
        getter session_logger : Types::SessionLogger?

        def initialize(
          @session_logger : Types::SessionLogger? = nil
        )
        end
      end

      struct GetSessionRequest
        include JSON::Serializable

        # The ID of the web portal for the session.
        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # The ID of the session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @portal_id : String,
          @session_id : String
        )
        end
      end

      struct GetSessionResponse
        include JSON::Serializable

        # The sessions in a list.
        @[JSON::Field(key: "session")]
        getter session : Types::Session?

        def initialize(
          @session : Types::Session? = nil
        )
        end
      end

      struct GetTrustStoreCertificateRequest
        include JSON::Serializable

        # The thumbprint of the trust store certificate.
        @[JSON::Field(key: "thumbprint")]
        getter thumbprint : String

        # The ARN of the trust store certificate.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String

        def initialize(
          @thumbprint : String,
          @trust_store_arn : String
        )
        end
      end

      struct GetTrustStoreCertificateResponse
        include JSON::Serializable

        # The ARN of the trust store certificate.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String

        # The certificate of the trust store certificate.
        @[JSON::Field(key: "certificate")]
        getter certificate : Types::Certificate?

        def initialize(
          @trust_store_arn : String,
          @certificate : Types::Certificate? = nil
        )
        end
      end

      struct GetTrustStoreRequest
        include JSON::Serializable

        # The ARN of the trust store.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String

        def initialize(
          @trust_store_arn : String
        )
        end
      end

      struct GetTrustStoreResponse
        include JSON::Serializable

        # The trust store.
        @[JSON::Field(key: "trustStore")]
        getter trust_store : Types::TrustStore?

        def initialize(
          @trust_store : Types::TrustStore? = nil
        )
        end
      end

      struct GetUserAccessLoggingSettingsRequest
        include JSON::Serializable

        # The ARN of the user access logging settings.
        @[JSON::Field(key: "userAccessLoggingSettingsArn")]
        getter user_access_logging_settings_arn : String

        def initialize(
          @user_access_logging_settings_arn : String
        )
        end
      end

      struct GetUserAccessLoggingSettingsResponse
        include JSON::Serializable

        # The user access logging settings.
        @[JSON::Field(key: "userAccessLoggingSettings")]
        getter user_access_logging_settings : Types::UserAccessLoggingSettings?

        def initialize(
          @user_access_logging_settings : Types::UserAccessLoggingSettings? = nil
        )
        end
      end

      struct GetUserSettingsRequest
        include JSON::Serializable

        # The ARN of the user settings.
        @[JSON::Field(key: "userSettingsArn")]
        getter user_settings_arn : String

        def initialize(
          @user_settings_arn : String
        )
        end
      end

      struct GetUserSettingsResponse
        include JSON::Serializable

        # The user settings.
        @[JSON::Field(key: "userSettings")]
        getter user_settings : Types::UserSettings?

        def initialize(
          @user_settings : Types::UserSettings? = nil
        )
        end
      end

      # The input for an icon image (logo or favicon). Provide either a binary image file or an S3 URI
      # pointing to the image file. Maximum 100 KB in JPEG, PNG, or ICO format.
      struct IconImageInput
        include JSON::Serializable

        # The image provided as a binary image file.
        @[JSON::Field(key: "blob")]
        getter blob : Bytes?

        # The S3 URI pointing to the image file. The URI must use the format s3://bucket-name/key-name . You
        # must have read access to the S3 object.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String?

        def initialize(
          @blob : Bytes? = nil,
          @s3_uri : String? = nil
        )
        end
      end

      # The identity provider.
      struct IdentityProvider
        include JSON::Serializable

        # The ARN of the identity provider.
        @[JSON::Field(key: "identityProviderArn")]
        getter identity_provider_arn : String

        # The identity provider details. The following list describes the provider detail keys for each
        # identity provider type. For Google and Login with Amazon: client_id client_secret authorize_scopes
        # For Facebook: client_id client_secret authorize_scopes api_version For Sign in with Apple: client_id
        # team_id key_id private_key authorize_scopes For OIDC providers: client_id client_secret
        # attributes_request_method oidc_issuer authorize_scopes authorize_url if not available from discovery
        # URL specified by oidc_issuer key token_url if not available from discovery URL specified by
        # oidc_issuer key attributes_url if not available from discovery URL specified by oidc_issuer key
        # jwks_uri if not available from discovery URL specified by oidc_issuer key For SAML providers:
        # MetadataFile OR MetadataURL IDPSignout (boolean) optional IDPInit (boolean) optional
        # RequestSigningAlgorithm (string) optional - Only accepts rsa-sha256 EncryptedResponses (boolean)
        # optional
        @[JSON::Field(key: "identityProviderDetails")]
        getter identity_provider_details : Hash(String, String)?

        # The identity provider name.
        @[JSON::Field(key: "identityProviderName")]
        getter identity_provider_name : String?

        # The identity provider type.
        @[JSON::Field(key: "identityProviderType")]
        getter identity_provider_type : String?

        def initialize(
          @identity_provider_arn : String,
          @identity_provider_details : Hash(String, String)? = nil,
          @identity_provider_name : String? = nil,
          @identity_provider_type : String? = nil
        )
        end
      end

      # The summary of the identity provider.
      struct IdentityProviderSummary
        include JSON::Serializable

        # The ARN of the identity provider.
        @[JSON::Field(key: "identityProviderArn")]
        getter identity_provider_arn : String

        # The identity provider name.
        @[JSON::Field(key: "identityProviderName")]
        getter identity_provider_name : String?

        # The identity provider type.
        @[JSON::Field(key: "identityProviderType")]
        getter identity_provider_type : String?

        def initialize(
          @identity_provider_arn : String,
          @identity_provider_name : String? = nil,
          @identity_provider_type : String? = nil
        )
        end
      end

      # Metadata information about an uploaded image file.
      struct ImageMetadata
        include JSON::Serializable

        # The file extension of the image.
        @[JSON::Field(key: "fileExtension")]
        getter file_extension : String

        # The timestamp when the image was last uploaded.
        @[JSON::Field(key: "lastUploadTimestamp")]
        getter last_upload_timestamp : Time

        # The MIME type of the image.
        @[JSON::Field(key: "mimeType")]
        getter mime_type : String

        def initialize(
          @file_extension : String,
          @last_upload_timestamp : Time,
          @mime_type : String
        )
        end
      end

      # The configuration for in-session inline redaction.
      struct InlineRedactionConfiguration
        include JSON::Serializable

        # The inline redaction patterns to be enabled for the inline redaction configuration.
        @[JSON::Field(key: "inlineRedactionPatterns")]
        getter inline_redaction_patterns : Array(Types::InlineRedactionPattern)

        # The global confidence level for the inline redaction configuration. This indicates the certainty of
        # data type matches in the redaction process. Confidence level 3 means high confidence, and requires a
        # formatted text pattern match in order for content to be redacted. Confidence level 2 means medium
        # confidence, and redaction considers both formatted and unformatted text, and adds keyword associate
        # to the logic. Confidence level 1 means low confidence, and redaction is enforced for both formatted
        # pattern + unformatted pattern without keyword. This is applied to patterns that do not have a
        # pattern-level confidence level. Defaults to confidence level 2.
        @[JSON::Field(key: "globalConfidenceLevel")]
        getter global_confidence_level : Int32?

        # The global enforced URL configuration for the inline redaction configuration. This is applied to
        # patterns that do not have a pattern-level enforced URL list.
        @[JSON::Field(key: "globalEnforcedUrls")]
        getter global_enforced_urls : Array(String)?

        # The global exempt URL configuration for the inline redaction configuration. This is applied to
        # patterns that do not have a pattern-level exempt URL list.
        @[JSON::Field(key: "globalExemptUrls")]
        getter global_exempt_urls : Array(String)?

        def initialize(
          @inline_redaction_patterns : Array(Types::InlineRedactionPattern),
          @global_confidence_level : Int32? = nil,
          @global_enforced_urls : Array(String)? = nil,
          @global_exempt_urls : Array(String)? = nil
        )
        end
      end

      # The set of patterns that determine the data types redacted in session.
      struct InlineRedactionPattern
        include JSON::Serializable

        # The redaction placeholder that will replace the redacted text in session for the inline redaction
        # pattern.
        @[JSON::Field(key: "redactionPlaceHolder")]
        getter redaction_place_holder : Types::RedactionPlaceHolder

        # The built-in pattern from the list of preconfigured patterns. Either a customPattern or
        # builtInPatternId is required.
        @[JSON::Field(key: "builtInPatternId")]
        getter built_in_pattern_id : String?

        # The confidence level for inline redaction pattern. This indicates the certainty of data type matches
        # in the redaction process. Confidence level 3 means high confidence, and requires a formatted text
        # pattern match in order for content to be redacted. Confidence level 2 means medium confidence, and
        # redaction considers both formatted and unformatted text, and adds keyword associate to the logic.
        # Confidence level 1 means low confidence, and redaction is enforced for both formatted pattern +
        # unformatted pattern without keyword. This overrides the global confidence level.
        @[JSON::Field(key: "confidenceLevel")]
        getter confidence_level : Int32?

        # &gt;The configuration for a custom pattern. Either a customPattern or builtInPatternId is required.
        @[JSON::Field(key: "customPattern")]
        getter custom_pattern : Types::CustomPattern?

        # The enforced URL configuration for the inline redaction pattern. This will override the global
        # enforced URL configuration.
        @[JSON::Field(key: "enforcedUrls")]
        getter enforced_urls : Array(String)?

        # The exempt URL configuration for the inline redaction pattern. This will override the global exempt
        # URL configuration for the inline redaction pattern.
        @[JSON::Field(key: "exemptUrls")]
        getter exempt_urls : Array(String)?

        def initialize(
          @redaction_place_holder : Types::RedactionPlaceHolder,
          @built_in_pattern_id : String? = nil,
          @confidence_level : Int32? = nil,
          @custom_pattern : Types::CustomPattern? = nil,
          @enforced_urls : Array(String)? = nil,
          @exempt_urls : Array(String)? = nil
        )
        end
      end

      # There is an internal server error.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # Advice to clients on when the call can be safely retried.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String? = nil,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # The IP access settings resource that can be associated with a web portal.
      struct IpAccessSettings
        include JSON::Serializable

        # The ARN of the IP access settings resource.
        @[JSON::Field(key: "ipAccessSettingsArn")]
        getter ip_access_settings_arn : String

        # The additional encryption context of the IP access settings.
        @[JSON::Field(key: "additionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # A list of web portal ARNs that this IP access settings resource is associated with.
        @[JSON::Field(key: "associatedPortalArns")]
        getter associated_portal_arns : Array(String)?

        # The creation date timestamp of the IP access settings.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The customer managed key used to encrypt sensitive information in the IP access settings.
        @[JSON::Field(key: "customerManagedKey")]
        getter customer_managed_key : String?

        # The description of the IP access settings.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the IP access settings.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The IP rules of the IP access settings.
        @[JSON::Field(key: "ipRules")]
        getter ip_rules : Array(Types::IpRule)?

        def initialize(
          @ip_access_settings_arn : String,
          @additional_encryption_context : Hash(String, String)? = nil,
          @associated_portal_arns : Array(String)? = nil,
          @creation_date : Time? = nil,
          @customer_managed_key : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @ip_rules : Array(Types::IpRule)? = nil
        )
        end
      end

      # The summary of IP access settings.
      struct IpAccessSettingsSummary
        include JSON::Serializable

        # The ARN of IP access settings.
        @[JSON::Field(key: "ipAccessSettingsArn")]
        getter ip_access_settings_arn : String

        # The creation date timestamp of the IP access settings.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The description of the IP access settings.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the IP access settings.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @ip_access_settings_arn : String,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil
        )
        end
      end

      # The IP rules of the IP access settings.
      struct IpRule
        include JSON::Serializable

        # The IP range of the IP rule.
        @[JSON::Field(key: "ipRange")]
        getter ip_range : String

        # The description of the IP rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @ip_range : String,
          @description : String? = nil
        )
        end
      end

      struct ListBrowserSettingsRequest
        include JSON::Serializable

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBrowserSettingsResponse
        include JSON::Serializable

        # The browser settings.
        @[JSON::Field(key: "browserSettings")]
        getter browser_settings : Array(Types::BrowserSettingsSummary)?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @browser_settings : Array(Types::BrowserSettingsSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDataProtectionSettingsRequest
        include JSON::Serializable

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDataProtectionSettingsResponse
        include JSON::Serializable

        # The data protection settings.
        @[JSON::Field(key: "dataProtectionSettings")]
        getter data_protection_settings : Array(Types::DataProtectionSettingsSummary)?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_protection_settings : Array(Types::DataProtectionSettingsSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIdentityProvidersRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @portal_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIdentityProvidersResponse
        include JSON::Serializable

        # The identity providers.
        @[JSON::Field(key: "identityProviders")]
        getter identity_providers : Array(Types::IdentityProviderSummary)?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @identity_providers : Array(Types::IdentityProviderSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIpAccessSettingsRequest
        include JSON::Serializable

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIpAccessSettingsResponse
        include JSON::Serializable

        # The IP access settings.
        @[JSON::Field(key: "ipAccessSettings")]
        getter ip_access_settings : Array(Types::IpAccessSettingsSummary)?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ip_access_settings : Array(Types::IpAccessSettingsSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListNetworkSettingsRequest
        include JSON::Serializable

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListNetworkSettingsResponse
        include JSON::Serializable

        # The network settings.
        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Array(Types::NetworkSettingsSummary)?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @network_settings : Array(Types::NetworkSettingsSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPortalsRequest
        include JSON::Serializable

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPortalsResponse
        include JSON::Serializable

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The portals in the list.
        @[JSON::Field(key: "portals")]
        getter portals : Array(Types::PortalSummary)?

        def initialize(
          @next_token : String? = nil,
          @portals : Array(Types::PortalSummary)? = nil
        )
        end
      end

      struct ListSessionLoggersRequest
        include JSON::Serializable

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSessionLoggersResponse
        include JSON::Serializable

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of session loggers, including summaries of their details.
        @[JSON::Field(key: "sessionLoggers")]
        getter session_loggers : Array(Types::SessionLoggerSummary)?

        def initialize(
          @next_token : String? = nil,
          @session_loggers : Array(Types::SessionLoggerSummary)? = nil
        )
        end
      end

      struct ListSessionsRequest
        include JSON::Serializable

        # The ID of the web portal for the sessions.
        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # The method in which the returned sessions should be sorted.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The status of the session.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The username of the session.
        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @portal_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @session_id : String? = nil,
          @sort_by : String? = nil,
          @status : String? = nil,
          @username : String? = nil
        )
        end
      end

      struct ListSessionsResponse
        include JSON::Serializable

        # The sessions in a list.
        @[JSON::Field(key: "sessions")]
        getter sessions : Array(Types::SessionSummary)

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @sessions : Array(Types::SessionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags of the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListTrustStoreCertificatesRequest
        include JSON::Serializable

        # The ARN of the trust store
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @trust_store_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTrustStoreCertificatesResponse
        include JSON::Serializable

        # The ARN of the trust store.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String

        # The certificate list.
        @[JSON::Field(key: "certificateList")]
        getter certificate_list : Array(Types::CertificateSummary)?

        # The pagination token used to retrieve the next page of results for this operation.&gt;
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @trust_store_arn : String,
          @certificate_list : Array(Types::CertificateSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTrustStoresRequest
        include JSON::Serializable

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTrustStoresResponse
        include JSON::Serializable

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The trust stores.
        @[JSON::Field(key: "trustStores")]
        getter trust_stores : Array(Types::TrustStoreSummary)?

        def initialize(
          @next_token : String? = nil,
          @trust_stores : Array(Types::TrustStoreSummary)? = nil
        )
        end
      end

      struct ListUserAccessLoggingSettingsRequest
        include JSON::Serializable

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListUserAccessLoggingSettingsResponse
        include JSON::Serializable

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The user access logging settings.
        @[JSON::Field(key: "userAccessLoggingSettings")]
        getter user_access_logging_settings : Array(Types::UserAccessLoggingSettingsSummary)?

        def initialize(
          @next_token : String? = nil,
          @user_access_logging_settings : Array(Types::UserAccessLoggingSettingsSummary)? = nil
        )
        end
      end

      struct ListUserSettingsRequest
        include JSON::Serializable

        # The maximum number of results to be included in the next page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListUserSettingsResponse
        include JSON::Serializable

        # The pagination token used to retrieve the next page of results for this operation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The user settings.
        @[JSON::Field(key: "userSettings")]
        getter user_settings : Array(Types::UserSettingsSummary)?

        def initialize(
          @next_token : String? = nil,
          @user_settings : Array(Types::UserSettingsSummary)? = nil
        )
        end
      end

      # Localized text strings for a specific language that customize the web portal.
      struct LocalizedBrandingStrings
        include JSON::Serializable

        # The text displayed in the browser tab title.
        @[JSON::Field(key: "browserTabTitle")]
        getter browser_tab_title : String

        # The welcome text displayed on the sign-in page.
        @[JSON::Field(key: "welcomeText")]
        getter welcome_text : String

        # The text displayed on the contact button. This field is optional and defaults to "Contact us".
        @[JSON::Field(key: "contactButtonText")]
        getter contact_button_text : String?

        # A contact link URL. The URL must start with https:// or mailto: . If not provided, the contact
        # button will be hidden from the web portal screen.
        @[JSON::Field(key: "contactLink")]
        getter contact_link : String?

        # The text displayed during session loading. This field is optional and defaults to "Loading your
        # session".
        @[JSON::Field(key: "loadingText")]
        getter loading_text : String?

        # The text displayed on the login button. This field is optional and defaults to "Sign In".
        @[JSON::Field(key: "loginButtonText")]
        getter login_button_text : String?

        # The description text for the login section. This field is optional and defaults to "Sign in to your
        # session".
        @[JSON::Field(key: "loginDescription")]
        getter login_description : String?

        # The title text for the login section. This field is optional and defaults to "Sign In".
        @[JSON::Field(key: "loginTitle")]
        getter login_title : String?

        def initialize(
          @browser_tab_title : String,
          @welcome_text : String,
          @contact_button_text : String? = nil,
          @contact_link : String? = nil,
          @loading_text : String? = nil,
          @login_button_text : String? = nil,
          @login_description : String? = nil,
          @login_title : String? = nil
        )
        end
      end

      # The configuration of the log.
      struct LogConfiguration
        include JSON::Serializable

        # The configuration for delivering the logs to S3.
        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3LogConfiguration?

        def initialize(
          @s3 : Types::S3LogConfiguration? = nil
        )
        end
      end

      # A network settings resource that can be associated with a web portal. Once associated with a web
      # portal, network settings define how streaming instances will connect with your specified VPC.
      struct NetworkSettings
        include JSON::Serializable

        # The ARN of the network settings.
        @[JSON::Field(key: "networkSettingsArn")]
        getter network_settings_arn : String

        # A list of web portal ARNs that this network settings is associated with.
        @[JSON::Field(key: "associatedPortalArns")]
        getter associated_portal_arns : Array(String)?

        # One or more security groups used to control access from streaming instances to your VPC.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The subnets in which network interfaces are created to connect streaming instances to your VPC. At
        # least two of these subnets must be in different availability zones.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The VPC that streaming instances will connect to.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @network_settings_arn : String,
          @associated_portal_arns : Array(String)? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The summary of network settings.
      struct NetworkSettingsSummary
        include JSON::Serializable

        # The ARN of the network settings.
        @[JSON::Field(key: "networkSettingsArn")]
        getter network_settings_arn : String

        # The VPC ID of the network settings.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @network_settings_arn : String,
          @vpc_id : String? = nil
        )
        end
      end

      # The web portal.
      struct Portal
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The additional encryption context of the portal.
        @[JSON::Field(key: "additionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # The type of authentication integration points used when signing into the web portal. Defaults to
        # Standard . Standard web portals are authenticated directly through your identity provider. You need
        # to call CreateIdentityProvider to integrate your identity provider with your web portal. User and
        # group access to your web portal is controlled through your identity provider. IAM Identity Center
        # web portals are authenticated through IAM Identity Center. Identity sources (including external
        # identity provider integration), plus user and group access to your web portal, can be configured in
        # the IAM Identity Center.
        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String?

        # The ARN of the browser settings that is associated with this web portal.
        @[JSON::Field(key: "browserSettingsArn")]
        getter browser_settings_arn : String?

        # The browser that users see when using a streaming session.
        @[JSON::Field(key: "browserType")]
        getter browser_type : String?

        # The creation date of the web portal.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The customer managed key used to encrypt sensitive information in the portal.
        @[JSON::Field(key: "customerManagedKey")]
        getter customer_managed_key : String?

        # The ARN of the data protection settings.
        @[JSON::Field(key: "dataProtectionSettingsArn")]
        getter data_protection_settings_arn : String?

        # The name of the web portal.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The type and resources of the underlying instance.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The ARN of the IP access settings.
        @[JSON::Field(key: "ipAccessSettingsArn")]
        getter ip_access_settings_arn : String?

        # The maximum number of concurrent sessions for the portal.
        @[JSON::Field(key: "maxConcurrentSessions")]
        getter max_concurrent_sessions : Int32?

        # The ARN of the network settings that is associated with the web portal.
        @[JSON::Field(key: "networkSettingsArn")]
        getter network_settings_arn : String?

        # The endpoint URL of the web portal that users access in order to start streaming sessions.
        @[JSON::Field(key: "portalEndpoint")]
        getter portal_endpoint : String?

        # The status of the web portal.
        @[JSON::Field(key: "portalStatus")]
        getter portal_status : String?

        # The renderer that is used in streaming sessions.
        @[JSON::Field(key: "rendererType")]
        getter renderer_type : String?

        # The ARN of the session logger that is assocaited with the portal.
        @[JSON::Field(key: "sessionLoggerArn")]
        getter session_logger_arn : String?

        # A message that explains why the web portal is in its current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The ARN of the trust store that is associated with the web portal.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String?

        # The ARN of the user access logging settings that is associated with the web portal.
        @[JSON::Field(key: "userAccessLoggingSettingsArn")]
        getter user_access_logging_settings_arn : String?

        # The ARN of the user settings that is associated with the web portal.
        @[JSON::Field(key: "userSettingsArn")]
        getter user_settings_arn : String?

        def initialize(
          @portal_arn : String,
          @additional_encryption_context : Hash(String, String)? = nil,
          @authentication_type : String? = nil,
          @browser_settings_arn : String? = nil,
          @browser_type : String? = nil,
          @creation_date : Time? = nil,
          @customer_managed_key : String? = nil,
          @data_protection_settings_arn : String? = nil,
          @display_name : String? = nil,
          @instance_type : String? = nil,
          @ip_access_settings_arn : String? = nil,
          @max_concurrent_sessions : Int32? = nil,
          @network_settings_arn : String? = nil,
          @portal_endpoint : String? = nil,
          @portal_status : String? = nil,
          @renderer_type : String? = nil,
          @session_logger_arn : String? = nil,
          @status_reason : String? = nil,
          @trust_store_arn : String? = nil,
          @user_access_logging_settings_arn : String? = nil,
          @user_settings_arn : String? = nil
        )
        end
      end

      # The summary of the portal.
      struct PortalSummary
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The type of authentication integration points used when signing into the web portal. Defaults to
        # Standard . Standard web portals are authenticated directly through your identity provider. You need
        # to call CreateIdentityProvider to integrate your identity provider with your web portal. User and
        # group access to your web portal is controlled through your identity provider. IAM Identity Center
        # web portals are authenticated through IAM Identity Center. Identity sources (including external
        # identity provider integration), plus user and group access to your web portal, can be configured in
        # the IAM Identity Center.
        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String?

        # The ARN of the browser settings that is associated with the web portal.
        @[JSON::Field(key: "browserSettingsArn")]
        getter browser_settings_arn : String?

        # The browser type of the web portal.
        @[JSON::Field(key: "browserType")]
        getter browser_type : String?

        # The creation date of the web portal.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The ARN of the data protection settings.
        @[JSON::Field(key: "dataProtectionSettingsArn")]
        getter data_protection_settings_arn : String?

        # The name of the web portal.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The type and resources of the underlying instance.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The ARN of the IP access settings.
        @[JSON::Field(key: "ipAccessSettingsArn")]
        getter ip_access_settings_arn : String?

        # The maximum number of concurrent sessions for the portal.
        @[JSON::Field(key: "maxConcurrentSessions")]
        getter max_concurrent_sessions : Int32?

        # The ARN of the network settings that is associated with the web portal.
        @[JSON::Field(key: "networkSettingsArn")]
        getter network_settings_arn : String?

        # The endpoint URL of the web portal that users access in order to start streaming sessions.
        @[JSON::Field(key: "portalEndpoint")]
        getter portal_endpoint : String?

        # The status of the web portal.
        @[JSON::Field(key: "portalStatus")]
        getter portal_status : String?

        # The renderer that is used in streaming sessions.
        @[JSON::Field(key: "rendererType")]
        getter renderer_type : String?

        # The ARN of the session logger that is assocaited with the portal.
        @[JSON::Field(key: "sessionLoggerArn")]
        getter session_logger_arn : String?

        # The ARN of the trust that is associated with this web portal.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String?

        # The ARN of the user access logging settings that is associated with the web portal.
        @[JSON::Field(key: "userAccessLoggingSettingsArn")]
        getter user_access_logging_settings_arn : String?

        # The ARN of the user settings that is associated with the web portal.
        @[JSON::Field(key: "userSettingsArn")]
        getter user_settings_arn : String?

        def initialize(
          @portal_arn : String,
          @authentication_type : String? = nil,
          @browser_settings_arn : String? = nil,
          @browser_type : String? = nil,
          @creation_date : Time? = nil,
          @data_protection_settings_arn : String? = nil,
          @display_name : String? = nil,
          @instance_type : String? = nil,
          @ip_access_settings_arn : String? = nil,
          @max_concurrent_sessions : Int32? = nil,
          @network_settings_arn : String? = nil,
          @portal_endpoint : String? = nil,
          @portal_status : String? = nil,
          @renderer_type : String? = nil,
          @session_logger_arn : String? = nil,
          @trust_store_arn : String? = nil,
          @user_access_logging_settings_arn : String? = nil,
          @user_settings_arn : String? = nil
        )
        end
      end

      # The redaction placeholder that will replace the redacted text in session.
      struct RedactionPlaceHolder
        include JSON::Serializable

        # The redaction placeholder type that will replace the redacted text in session.
        @[JSON::Field(key: "redactionPlaceHolderType")]
        getter redaction_place_holder_type : String

        # The redaction placeholder text that will replace the redacted text in session for the custom text
        # redaction placeholder type.
        @[JSON::Field(key: "redactionPlaceHolderText")]
        getter redaction_place_holder_text : String?

        def initialize(
          @redaction_place_holder_type : String,
          @redaction_place_holder_text : String? = nil
        )
        end
      end

      # The resource cannot be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # Hypothetical identifier of the resource affected.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Hypothetical type of the resource affected.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The S3 log configuration.
      struct S3LogConfiguration
        include JSON::Serializable

        # The S3 bucket name where logs are delivered.
        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The folder structure that defines the organizational structure for log files in S3.
        @[JSON::Field(key: "folderStructure")]
        getter folder_structure : String

        # The format of the LogFile that is written to S3.
        @[JSON::Field(key: "logFileFormat")]
        getter log_file_format : String

        # The expected bucket owner of the target S3 bucket. The caller must have permissions to write to the
        # target bucket.
        @[JSON::Field(key: "bucketOwner")]
        getter bucket_owner : String?

        # The S3 path prefix that determines where log files are stored.
        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket : String,
          @folder_structure : String,
          @log_file_format : String,
          @bucket_owner : String? = nil,
          @key_prefix : String? = nil
        )
        end
      end

      # The service quota has been exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The originating quota.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # Identifier of the resource affected.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Type of the resource affected.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The originating service.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String? = nil,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # Information about a secure browser session.
      struct Session
        include JSON::Serializable

        # The IP address of the client.
        @[JSON::Field(key: "clientIpAddresses")]
        getter client_ip_addresses : Array(String)?

        # The end time of the session.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String?

        # The ID of the session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # The start time of the session.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The status of the session.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The username of the session.
        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @client_ip_addresses : Array(String)? = nil,
          @end_time : Time? = nil,
          @portal_arn : String? = nil,
          @session_id : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @username : String? = nil
        )
        end
      end

      # The session logger resource.
      struct SessionLogger
        include JSON::Serializable

        # The ARN of the session logger resource.
        @[JSON::Field(key: "sessionLoggerArn")]
        getter session_logger_arn : String

        # The additional encryption context of the session logger.
        @[JSON::Field(key: "additionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # The associated portal ARN.
        @[JSON::Field(key: "associatedPortalArns")]
        getter associated_portal_arns : Array(String)?

        # The date the session logger resource was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The custom managed key of the session logger.
        @[JSON::Field(key: "customerManagedKey")]
        getter customer_managed_key : String?

        # The human-readable display name.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The filter that specifies which events to monitor.
        @[JSON::Field(key: "eventFilter")]
        getter event_filter : Types::EventFilter?

        # The configuration that specifies where logs are fowarded.
        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        def initialize(
          @session_logger_arn : String,
          @additional_encryption_context : Hash(String, String)? = nil,
          @associated_portal_arns : Array(String)? = nil,
          @creation_date : Time? = nil,
          @customer_managed_key : String? = nil,
          @display_name : String? = nil,
          @event_filter : Types::EventFilter? = nil,
          @log_configuration : Types::LogConfiguration? = nil
        )
        end
      end

      # The summary of the session logger resource.
      struct SessionLoggerSummary
        include JSON::Serializable

        # The ARN of the session logger resource.
        @[JSON::Field(key: "sessionLoggerArn")]
        getter session_logger_arn : String

        # The date the session logger resource was created.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : Time?

        # The human-readable display name.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The configuration that specifies where the logs are fowarded.
        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        def initialize(
          @session_logger_arn : String,
          @creation_date : Time? = nil,
          @display_name : String? = nil,
          @log_configuration : Types::LogConfiguration? = nil
        )
        end
      end

      # Summary information about a secure browser session.
      struct SessionSummary
        include JSON::Serializable

        # The end time of the session.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String?

        # The ID of the session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # The start time of the session.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The status of the session.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The username of the session.
        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @end_time : Time? = nil,
          @portal_arn : String? = nil,
          @session_id : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @username : String? = nil
        )
        end
      end

      # The tag.
      struct Tag
        include JSON::Serializable

        # The key of the tag.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag
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

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags of the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token returns the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag),
          @client_token : String? = nil
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # There is a throttling error.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The originating quota.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # Advice to clients on when the call can be safely retried.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The originating service.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String? = nil,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      # There are too many tags.
      struct TooManyTagsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # Name of the resource affected.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # The configuration of the toolbar. This allows administrators to select the toolbar type and visual
      # mode, set maximum display resolution for sessions, and choose which items are visible to end users
      # during their sessions. If administrators do not modify these settings, end users retain control over
      # their toolbar preferences.
      struct ToolbarConfiguration
        include JSON::Serializable

        # The list of toolbar items to be hidden.
        @[JSON::Field(key: "hiddenToolbarItems")]
        getter hidden_toolbar_items : Array(String)?

        # The maximum display resolution that is allowed for the session.
        @[JSON::Field(key: "maxDisplayResolution")]
        getter max_display_resolution : String?

        # The type of toolbar displayed during the session.
        @[JSON::Field(key: "toolbarType")]
        getter toolbar_type : String?

        # The visual mode of the toolbar.
        @[JSON::Field(key: "visualMode")]
        getter visual_mode : String?

        def initialize(
          @hidden_toolbar_items : Array(String)? = nil,
          @max_display_resolution : String? = nil,
          @toolbar_type : String? = nil,
          @visual_mode : String? = nil
        )
        end
      end

      # A trust store that can be associated with a web portal. A trust store contains certificate authority
      # (CA) certificates. Once associated with a web portal, the browser in a streaming session will
      # recognize certificates that have been issued using any of the CAs in the trust store. If your
      # organization has internal websites that use certificates issued by private CAs, you should add the
      # private CA certificate to the trust store.
      struct TrustStore
        include JSON::Serializable

        # The ARN of the trust store.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String

        # A list of web portal ARNs that this trust store is associated with.
        @[JSON::Field(key: "associatedPortalArns")]
        getter associated_portal_arns : Array(String)?

        def initialize(
          @trust_store_arn : String,
          @associated_portal_arns : Array(String)? = nil
        )
        end
      end

      # The summary of the trust store.
      struct TrustStoreSummary
        include JSON::Serializable

        # The ARN of the trust store.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String?

        def initialize(
          @trust_store_arn : String? = nil
        )
        end
      end

      struct Unit
        include JSON::Serializable

        def initialize
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the resource.
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

      struct UpdateBrowserSettingsRequest
        include JSON::Serializable

        # The ARN of the browser settings.
        @[JSON::Field(key: "browserSettingsArn")]
        getter browser_settings_arn : String

        # A JSON string containing Chrome Enterprise policies that will be applied to all streaming sessions.
        @[JSON::Field(key: "browserPolicy")]
        getter browser_policy : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token return the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The policy that specifies which URLs end users are allowed to access or which URLs or domain
        # categories they are restricted from accessing for enhanced security.
        @[JSON::Field(key: "webContentFilteringPolicy")]
        getter web_content_filtering_policy : Types::WebContentFilteringPolicy?

        def initialize(
          @browser_settings_arn : String,
          @browser_policy : String? = nil,
          @client_token : String? = nil,
          @web_content_filtering_policy : Types::WebContentFilteringPolicy? = nil
        )
        end
      end

      struct UpdateBrowserSettingsResponse
        include JSON::Serializable

        # The browser settings.
        @[JSON::Field(key: "browserSettings")]
        getter browser_settings : Types::BrowserSettings

        def initialize(
          @browser_settings : Types::BrowserSettings
        )
        end
      end

      struct UpdateDataProtectionSettingsRequest
        include JSON::Serializable

        # The ARN of the data protection settings.
        @[JSON::Field(key: "dataProtectionSettingsArn")]
        getter data_protection_settings_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token return the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the data protection settings.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the data protection settings.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The inline redaction configuration of the data protection settings that will be applied to all
        # sessions.
        @[JSON::Field(key: "inlineRedactionConfiguration")]
        getter inline_redaction_configuration : Types::InlineRedactionConfiguration?

        def initialize(
          @data_protection_settings_arn : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @inline_redaction_configuration : Types::InlineRedactionConfiguration? = nil
        )
        end
      end

      struct UpdateDataProtectionSettingsResponse
        include JSON::Serializable

        # The data protection settings.
        @[JSON::Field(key: "dataProtectionSettings")]
        getter data_protection_settings : Types::DataProtectionSettings

        def initialize(
          @data_protection_settings : Types::DataProtectionSettings
        )
        end
      end

      struct UpdateIdentityProviderRequest
        include JSON::Serializable

        # The ARN of the identity provider.
        @[JSON::Field(key: "identityProviderArn")]
        getter identity_provider_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token return the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The details of the identity provider. The following list describes the provider detail keys for each
        # identity provider type. For Google and Login with Amazon: client_id client_secret authorize_scopes
        # For Facebook: client_id client_secret authorize_scopes api_version For Sign in with Apple: client_id
        # team_id key_id private_key authorize_scopes For OIDC providers: client_id client_secret
        # attributes_request_method oidc_issuer authorize_scopes authorize_url if not available from discovery
        # URL specified by oidc_issuer key token_url if not available from discovery URL specified by
        # oidc_issuer key attributes_url if not available from discovery URL specified by oidc_issuer key
        # jwks_uri if not available from discovery URL specified by oidc_issuer key For SAML providers:
        # MetadataFile OR MetadataURL IDPSignout (boolean) optional IDPInit (boolean) optional
        # RequestSigningAlgorithm (string) optional - Only accepts rsa-sha256 EncryptedResponses (boolean)
        # optional
        @[JSON::Field(key: "identityProviderDetails")]
        getter identity_provider_details : Hash(String, String)?

        # The name of the identity provider.
        @[JSON::Field(key: "identityProviderName")]
        getter identity_provider_name : String?

        # The type of the identity provider.
        @[JSON::Field(key: "identityProviderType")]
        getter identity_provider_type : String?

        def initialize(
          @identity_provider_arn : String,
          @client_token : String? = nil,
          @identity_provider_details : Hash(String, String)? = nil,
          @identity_provider_name : String? = nil,
          @identity_provider_type : String? = nil
        )
        end
      end

      struct UpdateIdentityProviderResponse
        include JSON::Serializable

        # The identity provider.
        @[JSON::Field(key: "identityProvider")]
        getter identity_provider : Types::IdentityProvider

        def initialize(
          @identity_provider : Types::IdentityProvider
        )
        end
      end

      struct UpdateIpAccessSettingsRequest
        include JSON::Serializable

        # The ARN of the IP access settings.
        @[JSON::Field(key: "ipAccessSettingsArn")]
        getter ip_access_settings_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token return the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the IP access settings.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the IP access settings.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The updated IP rules of the IP access settings.
        @[JSON::Field(key: "ipRules")]
        getter ip_rules : Array(Types::IpRule)?

        def initialize(
          @ip_access_settings_arn : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @ip_rules : Array(Types::IpRule)? = nil
        )
        end
      end

      struct UpdateIpAccessSettingsResponse
        include JSON::Serializable

        # The IP access settings.
        @[JSON::Field(key: "ipAccessSettings")]
        getter ip_access_settings : Types::IpAccessSettings

        def initialize(
          @ip_access_settings : Types::IpAccessSettings
        )
        end
      end

      struct UpdateNetworkSettingsRequest
        include JSON::Serializable

        # The ARN of the network settings.
        @[JSON::Field(key: "networkSettingsArn")]
        getter network_settings_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token return the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # One or more security groups used to control access from streaming instances to your VPC.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The subnets in which network interfaces are created to connect streaming instances to your VPC. At
        # least two of these subnets must be in different availability zones.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The VPC that streaming instances will connect to.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @network_settings_arn : String,
          @client_token : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      struct UpdateNetworkSettingsResponse
        include JSON::Serializable

        # The network settings.
        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::NetworkSettings

        def initialize(
          @network_settings : Types::NetworkSettings
        )
        end
      end

      struct UpdatePortalRequest
        include JSON::Serializable

        # The ARN of the web portal.
        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The type of authentication integration points used when signing into the web portal. Defaults to
        # Standard . Standard web portals are authenticated directly through your identity provider. You need
        # to call CreateIdentityProvider to integrate your identity provider with your web portal. User and
        # group access to your web portal is controlled through your identity provider. IAM Identity Center
        # web portals are authenticated through IAM Identity Center. Identity sources (including external
        # identity provider integration), plus user and group access to your web portal, can be configured in
        # the IAM Identity Center.
        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String?

        # The name of the web portal. This is not visible to users who log into the web portal.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The type and resources of the underlying instance.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The maximum number of concurrent sessions for the portal.
        @[JSON::Field(key: "maxConcurrentSessions")]
        getter max_concurrent_sessions : Int32?

        def initialize(
          @portal_arn : String,
          @authentication_type : String? = nil,
          @display_name : String? = nil,
          @instance_type : String? = nil,
          @max_concurrent_sessions : Int32? = nil
        )
        end
      end

      struct UpdatePortalResponse
        include JSON::Serializable

        # The web portal.
        @[JSON::Field(key: "portal")]
        getter portal : Types::Portal?

        def initialize(
          @portal : Types::Portal? = nil
        )
        end
      end

      struct UpdateSessionLoggerRequest
        include JSON::Serializable

        # The ARN of the session logger to update.
        @[JSON::Field(key: "sessionLoggerArn")]
        getter session_logger_arn : String

        # The updated display name.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The updated eventFilter.
        @[JSON::Field(key: "eventFilter")]
        getter event_filter : Types::EventFilter?

        # The updated logConfiguration.
        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        def initialize(
          @session_logger_arn : String,
          @display_name : String? = nil,
          @event_filter : Types::EventFilter? = nil,
          @log_configuration : Types::LogConfiguration? = nil
        )
        end
      end

      struct UpdateSessionLoggerResponse
        include JSON::Serializable

        # The updated details of the session logger.
        @[JSON::Field(key: "sessionLogger")]
        getter session_logger : Types::SessionLogger

        def initialize(
          @session_logger : Types::SessionLogger
        )
        end
      end

      struct UpdateTrustStoreRequest
        include JSON::Serializable

        # The ARN of the trust store.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String

        # A list of CA certificates to add to the trust store.
        @[JSON::Field(key: "certificatesToAdd")]
        getter certificates_to_add : Array(Bytes)?

        # A list of CA certificates to delete from a trust store.
        @[JSON::Field(key: "certificatesToDelete")]
        getter certificates_to_delete : Array(String)?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token return the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @trust_store_arn : String,
          @certificates_to_add : Array(Bytes)? = nil,
          @certificates_to_delete : Array(String)? = nil,
          @client_token : String? = nil
        )
        end
      end

      struct UpdateTrustStoreResponse
        include JSON::Serializable

        # The ARN of the trust store.
        @[JSON::Field(key: "trustStoreArn")]
        getter trust_store_arn : String

        def initialize(
          @trust_store_arn : String
        )
        end
      end

      struct UpdateUserAccessLoggingSettingsRequest
        include JSON::Serializable

        # The ARN of the user access logging settings.
        @[JSON::Field(key: "userAccessLoggingSettingsArn")]
        getter user_access_logging_settings_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token return the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The ARN of the Kinesis stream.
        @[JSON::Field(key: "kinesisStreamArn")]
        getter kinesis_stream_arn : String?

        def initialize(
          @user_access_logging_settings_arn : String,
          @client_token : String? = nil,
          @kinesis_stream_arn : String? = nil
        )
        end
      end

      struct UpdateUserAccessLoggingSettingsResponse
        include JSON::Serializable

        # The user access logging settings.
        @[JSON::Field(key: "userAccessLoggingSettings")]
        getter user_access_logging_settings : Types::UserAccessLoggingSettings

        def initialize(
          @user_access_logging_settings : Types::UserAccessLoggingSettings
        )
        end
      end

      struct UpdateUserSettingsRequest
        include JSON::Serializable

        # The ARN of the user settings.
        @[JSON::Field(key: "userSettingsArn")]
        getter user_settings_arn : String

        # The branding configuration that customizes the appearance of the web portal for end users. When
        # updating user settings without an existing branding configuration, all fields (logo, favicon,
        # wallpaper, localized strings, and color theme) are required except for terms of service. When
        # updating user settings with an existing branding configuration, all fields are optional.
        @[JSON::Field(key: "brandingConfigurationInput")]
        getter branding_configuration_input : Types::BrandingConfigurationUpdateInput?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token return the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the Amazon Web Services SDK.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The configuration that specifies which cookies should be synchronized from the end user's local
        # browser to the remote browser. If the allowlist and blocklist are empty, the configuration becomes
        # null.
        @[JSON::Field(key: "cookieSynchronizationConfiguration")]
        getter cookie_synchronization_configuration : Types::CookieSynchronizationConfiguration?

        # Specifies whether the user can copy text from the streaming session to the local device.
        @[JSON::Field(key: "copyAllowed")]
        getter copy_allowed : String?

        # Specifies whether the user can use deep links that open automatically when connecting to a session.
        @[JSON::Field(key: "deepLinkAllowed")]
        getter deep_link_allowed : String?

        # The amount of time that a streaming session remains active after users disconnect.
        @[JSON::Field(key: "disconnectTimeoutInMinutes")]
        getter disconnect_timeout_in_minutes : Int32?

        # Specifies whether the user can download files from the streaming session to the local device.
        @[JSON::Field(key: "downloadAllowed")]
        getter download_allowed : String?

        # The amount of time that users can be idle (inactive) before they are disconnected from their
        # streaming session and the disconnect timeout interval begins.
        @[JSON::Field(key: "idleDisconnectTimeoutInMinutes")]
        getter idle_disconnect_timeout_in_minutes : Int32?

        # Specifies whether the user can paste text from the local device to the streaming session.
        @[JSON::Field(key: "pasteAllowed")]
        getter paste_allowed : String?

        # Specifies whether the user can print to the local device.
        @[JSON::Field(key: "printAllowed")]
        getter print_allowed : String?

        # The configuration of the toolbar. This allows administrators to select the toolbar type and visual
        # mode, set maximum display resolution for sessions, and choose which items are visible to end users
        # during their sessions. If administrators do not modify these settings, end users retain control over
        # their toolbar preferences.
        @[JSON::Field(key: "toolbarConfiguration")]
        getter toolbar_configuration : Types::ToolbarConfiguration?

        # Specifies whether the user can upload files from the local device to the streaming session.
        @[JSON::Field(key: "uploadAllowed")]
        getter upload_allowed : String?

        # Specifies whether the user can use WebAuthn redirection for passwordless login to websites within
        # the streaming session.
        @[JSON::Field(key: "webAuthnAllowed")]
        getter web_authn_allowed : String?

        def initialize(
          @user_settings_arn : String,
          @branding_configuration_input : Types::BrandingConfigurationUpdateInput? = nil,
          @client_token : String? = nil,
          @cookie_synchronization_configuration : Types::CookieSynchronizationConfiguration? = nil,
          @copy_allowed : String? = nil,
          @deep_link_allowed : String? = nil,
          @disconnect_timeout_in_minutes : Int32? = nil,
          @download_allowed : String? = nil,
          @idle_disconnect_timeout_in_minutes : Int32? = nil,
          @paste_allowed : String? = nil,
          @print_allowed : String? = nil,
          @toolbar_configuration : Types::ToolbarConfiguration? = nil,
          @upload_allowed : String? = nil,
          @web_authn_allowed : String? = nil
        )
        end
      end

      struct UpdateUserSettingsResponse
        include JSON::Serializable

        # The user settings.
        @[JSON::Field(key: "userSettings")]
        getter user_settings : Types::UserSettings

        def initialize(
          @user_settings : Types::UserSettings
        )
        end
      end

      # A user access logging settings resource that can be associated with a web portal.
      struct UserAccessLoggingSettings
        include JSON::Serializable

        # The ARN of the user access logging settings.
        @[JSON::Field(key: "userAccessLoggingSettingsArn")]
        getter user_access_logging_settings_arn : String

        # A list of web portal ARNs that this user access logging settings is associated with.
        @[JSON::Field(key: "associatedPortalArns")]
        getter associated_portal_arns : Array(String)?

        # The ARN of the Kinesis stream.
        @[JSON::Field(key: "kinesisStreamArn")]
        getter kinesis_stream_arn : String?

        def initialize(
          @user_access_logging_settings_arn : String,
          @associated_portal_arns : Array(String)? = nil,
          @kinesis_stream_arn : String? = nil
        )
        end
      end

      # The summary of user access logging settings.
      struct UserAccessLoggingSettingsSummary
        include JSON::Serializable

        # The ARN of the user access logging settings.
        @[JSON::Field(key: "userAccessLoggingSettingsArn")]
        getter user_access_logging_settings_arn : String

        # The ARN of the Kinesis stream.
        @[JSON::Field(key: "kinesisStreamArn")]
        getter kinesis_stream_arn : String?

        def initialize(
          @user_access_logging_settings_arn : String,
          @kinesis_stream_arn : String? = nil
        )
        end
      end

      # A user settings resource that can be associated with a web portal. Once associated with a web
      # portal, user settings control how users can transfer data between a streaming session and the their
      # local devices.
      struct UserSettings
        include JSON::Serializable

        # The ARN of the user settings.
        @[JSON::Field(key: "userSettingsArn")]
        getter user_settings_arn : String

        # The additional encryption context of the user settings.
        @[JSON::Field(key: "additionalEncryptionContext")]
        getter additional_encryption_context : Hash(String, String)?

        # A list of web portal ARNs that this user settings is associated with.
        @[JSON::Field(key: "associatedPortalArns")]
        getter associated_portal_arns : Array(String)?

        # The branding configuration output that customizes the appearance of the web portal for end users.
        @[JSON::Field(key: "brandingConfiguration")]
        getter branding_configuration : Types::BrandingConfiguration?

        # The configuration that specifies which cookies should be synchronized from the end user's local
        # browser to the remote browser.
        @[JSON::Field(key: "cookieSynchronizationConfiguration")]
        getter cookie_synchronization_configuration : Types::CookieSynchronizationConfiguration?

        # Specifies whether the user can copy text from the streaming session to the local device.
        @[JSON::Field(key: "copyAllowed")]
        getter copy_allowed : String?

        # The customer managed key used to encrypt sensitive information in the user settings.
        @[JSON::Field(key: "customerManagedKey")]
        getter customer_managed_key : String?

        # Specifies whether the user can use deep links that open automatically when connecting to a session.
        @[JSON::Field(key: "deepLinkAllowed")]
        getter deep_link_allowed : String?

        # The amount of time that a streaming session remains active after users disconnect.
        @[JSON::Field(key: "disconnectTimeoutInMinutes")]
        getter disconnect_timeout_in_minutes : Int32?

        # Specifies whether the user can download files from the streaming session to the local device.
        @[JSON::Field(key: "downloadAllowed")]
        getter download_allowed : String?

        # The amount of time that users can be idle (inactive) before they are disconnected from their
        # streaming session and the disconnect timeout interval begins.
        @[JSON::Field(key: "idleDisconnectTimeoutInMinutes")]
        getter idle_disconnect_timeout_in_minutes : Int32?

        # Specifies whether the user can paste text from the local device to the streaming session.
        @[JSON::Field(key: "pasteAllowed")]
        getter paste_allowed : String?

        # Specifies whether the user can print to the local device.
        @[JSON::Field(key: "printAllowed")]
        getter print_allowed : String?

        # The configuration of the toolbar. This allows administrators to select the toolbar type and visual
        # mode, set maximum display resolution for sessions, and choose which items are visible to end users
        # during their sessions. If administrators do not modify these settings, end users retain control over
        # their toolbar preferences.
        @[JSON::Field(key: "toolbarConfiguration")]
        getter toolbar_configuration : Types::ToolbarConfiguration?

        # Specifies whether the user can upload files from the local device to the streaming session.
        @[JSON::Field(key: "uploadAllowed")]
        getter upload_allowed : String?

        # Specifies whether the user can use WebAuthn redirection for passwordless login to websites within
        # the streaming session.
        @[JSON::Field(key: "webAuthnAllowed")]
        getter web_authn_allowed : String?

        def initialize(
          @user_settings_arn : String,
          @additional_encryption_context : Hash(String, String)? = nil,
          @associated_portal_arns : Array(String)? = nil,
          @branding_configuration : Types::BrandingConfiguration? = nil,
          @cookie_synchronization_configuration : Types::CookieSynchronizationConfiguration? = nil,
          @copy_allowed : String? = nil,
          @customer_managed_key : String? = nil,
          @deep_link_allowed : String? = nil,
          @disconnect_timeout_in_minutes : Int32? = nil,
          @download_allowed : String? = nil,
          @idle_disconnect_timeout_in_minutes : Int32? = nil,
          @paste_allowed : String? = nil,
          @print_allowed : String? = nil,
          @toolbar_configuration : Types::ToolbarConfiguration? = nil,
          @upload_allowed : String? = nil,
          @web_authn_allowed : String? = nil
        )
        end
      end

      # The summary of user settings.
      struct UserSettingsSummary
        include JSON::Serializable

        # The ARN of the user settings.
        @[JSON::Field(key: "userSettingsArn")]
        getter user_settings_arn : String

        # The branding configuration output that customizes the appearance of the web portal for end users.
        @[JSON::Field(key: "brandingConfiguration")]
        getter branding_configuration : Types::BrandingConfiguration?

        # The configuration that specifies which cookies should be synchronized from the end user's local
        # browser to the remote browser.
        @[JSON::Field(key: "cookieSynchronizationConfiguration")]
        getter cookie_synchronization_configuration : Types::CookieSynchronizationConfiguration?

        # Specifies whether the user can copy text from the streaming session to the local device.
        @[JSON::Field(key: "copyAllowed")]
        getter copy_allowed : String?

        # Specifies whether the user can use deep links that open automatically when connecting to a session.
        @[JSON::Field(key: "deepLinkAllowed")]
        getter deep_link_allowed : String?

        # The amount of time that a streaming session remains active after users disconnect.
        @[JSON::Field(key: "disconnectTimeoutInMinutes")]
        getter disconnect_timeout_in_minutes : Int32?

        # Specifies whether the user can download files from the streaming session to the local device.
        @[JSON::Field(key: "downloadAllowed")]
        getter download_allowed : String?

        # The amount of time that users can be idle (inactive) before they are disconnected from their
        # streaming session and the disconnect timeout interval begins.
        @[JSON::Field(key: "idleDisconnectTimeoutInMinutes")]
        getter idle_disconnect_timeout_in_minutes : Int32?

        # Specifies whether the user can paste text from the local device to the streaming session.
        @[JSON::Field(key: "pasteAllowed")]
        getter paste_allowed : String?

        # Specifies whether the user can print to the local device.
        @[JSON::Field(key: "printAllowed")]
        getter print_allowed : String?

        # The configuration of the toolbar. This allows administrators to select the toolbar type and visual
        # mode, set maximum display resolution for sessions, and choose which items are visible to end users
        # during their sessions. If administrators do not modify these settings, end users retain control over
        # their toolbar preferences.
        @[JSON::Field(key: "toolbarConfiguration")]
        getter toolbar_configuration : Types::ToolbarConfiguration?

        # Specifies whether the user can upload files from the local device to the streaming session.
        @[JSON::Field(key: "uploadAllowed")]
        getter upload_allowed : String?

        # Specifies whether the user can use WebAuthn redirection for passwordless login to websites within
        # the streaming session.
        @[JSON::Field(key: "webAuthnAllowed")]
        getter web_authn_allowed : String?

        def initialize(
          @user_settings_arn : String,
          @branding_configuration : Types::BrandingConfiguration? = nil,
          @cookie_synchronization_configuration : Types::CookieSynchronizationConfiguration? = nil,
          @copy_allowed : String? = nil,
          @deep_link_allowed : String? = nil,
          @disconnect_timeout_in_minutes : Int32? = nil,
          @download_allowed : String? = nil,
          @idle_disconnect_timeout_in_minutes : Int32? = nil,
          @paste_allowed : String? = nil,
          @print_allowed : String? = nil,
          @toolbar_configuration : Types::ToolbarConfiguration? = nil,
          @upload_allowed : String? = nil,
          @web_authn_allowed : String? = nil
        )
        end
      end

      # There is a validation error.
      struct ValidationException
        include JSON::Serializable

        # The field that caused the error.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        @[JSON::Field(key: "message")]
        getter message : String?

        # Reason the request failed validation
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Information about a field passed inside a request that resulted in an exception.
      struct ValidationExceptionField
        include JSON::Serializable

        # The message describing why the field failed validation.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field that failed validation.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The input for a wallpaper image. Provide the image as either a binary image file or an S3 URI.
      # Maximum 5 MB in JPEG or PNG format.
      struct WallpaperImageInput
        include JSON::Serializable

        # The image provided as a binary image file.
        @[JSON::Field(key: "blob")]
        getter blob : Bytes?

        # The S3 URI pointing to the image file. The URI must use the format s3://bucket-name/key-name . You
        # must have read access to the S3 object.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String?

        def initialize(
          @blob : Bytes? = nil,
          @s3_uri : String? = nil
        )
        end
      end

      # The policy that specifies which URLs end users are allowed to access or which URLs or domain
      # categories they are restricted from accessing for enhanced security.
      struct WebContentFilteringPolicy
        include JSON::Serializable

        # URLs and domains that are always accessible to end users.
        @[JSON::Field(key: "allowedUrls")]
        getter allowed_urls : Array(String)?

        # Categories of websites that are blocked on the end user’s browsers.
        @[JSON::Field(key: "blockedCategories")]
        getter blocked_categories : Array(String)?

        # URLs and domains that end users cannot access.
        @[JSON::Field(key: "blockedUrls")]
        getter blocked_urls : Array(String)?

        def initialize(
          @allowed_urls : Array(String)? = nil,
          @blocked_categories : Array(String)? = nil,
          @blocked_urls : Array(String)? = nil
        )
        end
      end
    end
  end
end
