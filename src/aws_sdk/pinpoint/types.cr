require "json"
require "time"

module AwsSdk
  module Pinpoint
    module Types

      # Specifies the status and settings of the ADM (Amazon Device Messaging) channel for an application.

      struct ADMChannelRequest
        include JSON::Serializable

        # The Client ID that you received from Amazon to send messages by using ADM.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The Client Secret that you received from Amazon to send messages by using ADM.

        @[JSON::Field(key: "ClientSecret")]
        getter client_secret : String

        # Specifies whether to enable the ADM channel for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @client_id : String,
          @client_secret : String,
          @enabled : Bool? = nil
        )
        end
      end

      # Provides information about the status and settings of the ADM (Amazon Device Messaging) channel for
      # an application.

      struct ADMChannelResponse
        include JSON::Serializable

        # The type of messaging or notification platform for the channel. For the ADM channel, this value is
        # ADM.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The unique identifier for the application that the ADM channel applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The date and time when the ADM channel was enabled.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # Specifies whether the ADM channel is enabled for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # (Not used) This property is retained only for backward compatibility.

        @[JSON::Field(key: "HasCredential")]
        getter has_credential : Bool?

        # (Deprecated) An identifier for the ADM channel. This property is retained only for backward
        # compatibility.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Specifies whether the ADM channel is archived.

        @[JSON::Field(key: "IsArchived")]
        getter is_archived : Bool?

        # The user who last modified the ADM channel.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time when the ADM channel was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The current version of the ADM channel.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @platform : String,
          @application_id : String? = nil,
          @creation_date : String? = nil,
          @enabled : Bool? = nil,
          @has_credential : Bool? = nil,
          @id : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : String? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Specifies the settings for a one-time message that's sent directly to an endpoint through the ADM
      # (Amazon Device Messaging) channel.

      struct ADMMessage
        include JSON::Serializable

        # The action to occur if the recipient taps the push notification. Valid values are: OPEN_APP - Your
        # app opens or it becomes the foreground app if it was sent to the background. This is the default
        # action. DEEP_LINK - Your app opens and displays a designated user interface in the app. This action
        # uses the deep-linking features of the Android platform. URL - The default mobile browser on the
        # recipient's device opens and loads the web page at a URL that you specify.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The body of the notification message.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # An arbitrary string that indicates that multiple messages are logically the same and that Amazon
        # Device Messaging (ADM) can drop previously enqueued messages in favor of this message.

        @[JSON::Field(key: "ConsolidationKey")]
        getter consolidation_key : String?

        # The JSON data payload to use for the push notification, if the notification is a silent push
        # notification. This payload is added to the data.pinpoint.jsonBody object of the notification.

        @[JSON::Field(key: "Data")]
        getter data : Hash(String, String)?

        # The amount of time, in seconds, that ADM should store the message if the recipient's device is
        # offline. Amazon Pinpoint specifies this value in the expiresAfter parameter when it sends the
        # notification message to ADM.

        @[JSON::Field(key: "ExpiresAfter")]
        getter expires_after : String?

        # The icon image name of the asset saved in your app.

        @[JSON::Field(key: "IconReference")]
        getter icon_reference : String?

        # The URL of the large icon image to display in the content view of the push notification.

        @[JSON::Field(key: "ImageIconUrl")]
        getter image_icon_url : String?

        # The URL of an image to display in the push notification.

        @[JSON::Field(key: "ImageUrl")]
        getter image_url : String?

        # The base64-encoded, MD5 checksum of the value specified by the Data property. ADM uses the MD5 value
        # to verify the integrity of the data.

        @[JSON::Field(key: "MD5")]
        getter md5 : String?

        # The raw, JSON-formatted string to use as the payload for the notification message. If specified,
        # this value overrides all other content for the message.

        @[JSON::Field(key: "RawContent")]
        getter raw_content : String?

        # Specifies whether the notification is a silent push notification, which is a push notification that
        # doesn't display on a recipient's device. Silent push notifications can be used for cases such as
        # updating an app's configuration or supporting phone home functionality.

        @[JSON::Field(key: "SilentPush")]
        getter silent_push : Bool?

        # The URL of the small icon image to display in the status bar and the content view of the push
        # notification.

        @[JSON::Field(key: "SmallImageIconUrl")]
        getter small_image_icon_url : String?

        # The sound to play when the recipient receives the push notification. You can use the default stream
        # or specify the file name of a sound resource that's bundled in your app. On an Android platform, the
        # sound file must reside in /res/raw/.

        @[JSON::Field(key: "Sound")]
        getter sound : String?

        # The default message variables to use in the notification message. You can override the default
        # variables with individual address variables.

        @[JSON::Field(key: "Substitutions")]
        getter substitutions : Hash(String, Array(String))?

        # The title to display above the notification message on the recipient's device.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # The URL to open in the recipient's default mobile browser, if a recipient taps the push notification
        # and the value of the Action property is URL.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @action : String? = nil,
          @body : String? = nil,
          @consolidation_key : String? = nil,
          @data : Hash(String, String)? = nil,
          @expires_after : String? = nil,
          @icon_reference : String? = nil,
          @image_icon_url : String? = nil,
          @image_url : String? = nil,
          @md5 : String? = nil,
          @raw_content : String? = nil,
          @silent_push : Bool? = nil,
          @small_image_icon_url : String? = nil,
          @sound : String? = nil,
          @substitutions : Hash(String, Array(String))? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Specifies the status and settings of the APNs (Apple Push Notification service) channel for an
      # application.

      struct APNSChannelRequest
        include JSON::Serializable

        # The bundle identifier that's assigned to your iOS app. This identifier is used for APNs tokens.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String?

        # The APNs client certificate that you received from Apple, if you want Amazon Pinpoint to communicate
        # with APNs by using an APNs certificate.

        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # The default authentication method that you want Amazon Pinpoint to use when authenticating with
        # APNs, key or certificate.

        @[JSON::Field(key: "DefaultAuthenticationMethod")]
        getter default_authentication_method : String?

        # Specifies whether to enable the APNs channel for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The private key for the APNs client certificate that you want Amazon Pinpoint to use to communicate
        # with APNs.

        @[JSON::Field(key: "PrivateKey")]
        getter private_key : String?

        # The identifier that's assigned to your Apple developer account team. This identifier is used for
        # APNs tokens.

        @[JSON::Field(key: "TeamId")]
        getter team_id : String?

        # The authentication key to use for APNs tokens.

        @[JSON::Field(key: "TokenKey")]
        getter token_key : String?

        # The key identifier that's assigned to your APNs signing key, if you want Amazon Pinpoint to
        # communicate with APNs by using APNs tokens.

        @[JSON::Field(key: "TokenKeyId")]
        getter token_key_id : String?

        def initialize(
          @bundle_id : String? = nil,
          @certificate : String? = nil,
          @default_authentication_method : String? = nil,
          @enabled : Bool? = nil,
          @private_key : String? = nil,
          @team_id : String? = nil,
          @token_key : String? = nil,
          @token_key_id : String? = nil
        )
        end
      end

      # Provides information about the status and settings of the APNs (Apple Push Notification service)
      # channel for an application.

      struct APNSChannelResponse
        include JSON::Serializable

        # The type of messaging or notification platform for the channel. For the APNs channel, this value is
        # APNS.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The unique identifier for the application that the APNs channel applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The date and time when the APNs channel was enabled.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # The default authentication method that Amazon Pinpoint uses to authenticate with APNs for this
        # channel, key or certificate.

        @[JSON::Field(key: "DefaultAuthenticationMethod")]
        getter default_authentication_method : String?

        # Specifies whether the APNs channel is enabled for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # (Not used) This property is retained only for backward compatibility.

        @[JSON::Field(key: "HasCredential")]
        getter has_credential : Bool?

        # Specifies whether the APNs channel is configured to communicate with APNs by using APNs tokens. To
        # provide an authentication key for APNs tokens, set the TokenKey property of the channel.

        @[JSON::Field(key: "HasTokenKey")]
        getter has_token_key : Bool?

        # (Deprecated) An identifier for the APNs channel. This property is retained only for backward
        # compatibility.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Specifies whether the APNs channel is archived.

        @[JSON::Field(key: "IsArchived")]
        getter is_archived : Bool?

        # The user who last modified the APNs channel.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time when the APNs channel was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The current version of the APNs channel.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @platform : String,
          @application_id : String? = nil,
          @creation_date : String? = nil,
          @default_authentication_method : String? = nil,
          @enabled : Bool? = nil,
          @has_credential : Bool? = nil,
          @has_token_key : Bool? = nil,
          @id : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : String? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Specifies the settings for a one-time message that's sent directly to an endpoint through the APNs
      # (Apple Push Notification service) channel.

      struct APNSMessage
        include JSON::Serializable

        # The type of push notification to send. Valid values are: alert - For a standard notification that's
        # displayed on recipients' devices and prompts a recipient to interact with the notification.
        # background - For a silent notification that delivers content in the background and isn't displayed
        # on recipients' devices. complication - For a notification that contains update information for an
        # app’s complication timeline. fileprovider - For a notification that signals changes to a File
        # Provider extension. mdm - For a notification that tells managed devices to contact the MDM server.
        # voip - For a notification that provides information about an incoming VoIP call. Amazon Pinpoint
        # specifies this value in the apns-push-type request header when it sends the notification message to
        # APNs. If you don't specify a value for this property, Amazon Pinpoint sets the value to alert or
        # background automatically, based on the value that you specify for the SilentPush or RawContent
        # property of the message. For more information about the apns-push-type request header, see Sending
        # Notification Requests to APNs on the Apple Developer website.

        @[JSON::Field(key: "APNSPushType")]
        getter apns_push_type : String?

        # The action to occur if the recipient taps the push notification. Valid values are: OPEN_APP - Your
        # app opens or it becomes the foreground app if it was sent to the background. This is the default
        # action. DEEP_LINK - Your app opens and displays a designated user interface in the app. This setting
        # uses the deep-linking features of the iOS platform. URL - The default mobile browser on the
        # recipient's device opens and loads the web page at a URL that you specify.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The key that indicates whether and how to modify the badge of your app's icon when the recipient
        # receives the push notification. If this key isn't included in the dictionary, the badge doesn't
        # change. To remove the badge, set this value to 0.

        @[JSON::Field(key: "Badge")]
        getter badge : Int32?

        # The body of the notification message.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The key that indicates the notification type for the push notification. This key is a value that's
        # defined by the identifier property of one of your app's registered categories.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # An arbitrary identifier that, if assigned to multiple messages, APNs uses to coalesce the messages
        # into a single push notification instead of delivering each message individually. This value can't
        # exceed 64 bytes. Amazon Pinpoint specifies this value in the apns-collapse-id request header when it
        # sends the notification message to APNs.

        @[JSON::Field(key: "CollapseId")]
        getter collapse_id : String?

        # The JSON payload to use for a silent push notification. This payload is added to the
        # data.pinpoint.jsonBody object of the notification.

        @[JSON::Field(key: "Data")]
        getter data : Hash(String, String)?

        # The URL of an image or video to display in the push notification.

        @[JSON::Field(key: "MediaUrl")]
        getter media_url : String?

        # The authentication method that you want Amazon Pinpoint to use when authenticating with APNs,
        # CERTIFICATE or TOKEN.

        @[JSON::Field(key: "PreferredAuthenticationMethod")]
        getter preferred_authentication_method : String?

        # para>5 - Low priority, the notification might be delayed, delivered as part of a group, or
        # throttled. /listitem> 10 - High priority, the notification is sent immediately. This is the default
        # value. A high priority notification should trigger an alert, play a sound, or badge your app's icon
        # on the recipient's device. /para> Amazon Pinpoint specifies this value in the apns-priority request
        # header when it sends the notification message to APNs. The equivalent values for Firebase Cloud
        # Messaging (FCM), formerly Google Cloud Messaging (GCM), are normal, for 5, and high, for 10. If you
        # specify an FCM value for this property, Amazon Pinpoint accepts and converts the value to the
        # corresponding APNs value.

        @[JSON::Field(key: "Priority")]
        getter priority : String?

        # The raw, JSON-formatted string to use as the payload for the notification message. If specified,
        # this value overrides all other content for the message. If you specify the raw content of an APNs
        # push notification, the message payload has to include the content-available key. The value of the
        # content-available key has to be an integer, and can only be 0 or 1. If you're sending a standard
        # notification, set the value of content-available to 0. If you're sending a silent (background)
        # notification, set the value of content-available to 1. Additionally, silent notification payloads
        # can't include the alert, badge, or sound keys. For more information, see Generating a Remote
        # Notification and Pushing Background Updates to Your App on the Apple Developer website.

        @[JSON::Field(key: "RawContent")]
        getter raw_content : String?

        # Specifies whether the notification is a silent push notification. A silent (or background) push
        # notification isn't displayed on recipients' devices. You can use silent push notifications to make
        # small updates to your app, or to display messages in an in-app message center. Amazon Pinpoint uses
        # this property to determine the correct value for the apns-push-type request header when it sends the
        # notification message to APNs. If you specify a value of true for this property, Amazon Pinpoint sets
        # the value for the apns-push-type header field to background. If you specify the raw content of an
        # APNs push notification, the message payload has to include the content-available key. For silent
        # (background) notifications, set the value of content-available to 1. Additionally, the message
        # payload for a silent notification can't include the alert, badge, or sound keys. For more
        # information, see Generating a Remote Notification and Pushing Background Updates to Your App on the
        # Apple Developer website. Apple has indicated that they will throttle "excessive" background
        # notifications based on current traffic volumes. To prevent your notifications being throttled, Apple
        # recommends that you send no more than 3 silent push notifications to each recipient per hour.

        @[JSON::Field(key: "SilentPush")]
        getter silent_push : Bool?

        # The key for the sound to play when the recipient receives the push notification. The value for this
        # key is the name of a sound file in your app's main bundle or the Library/Sounds folder in your app's
        # data container. If the sound file can't be found or you specify default for the value, the system
        # plays the default alert sound.

        @[JSON::Field(key: "Sound")]
        getter sound : String?

        # The default message variables to use in the notification message. You can override these default
        # variables with individual address variables.

        @[JSON::Field(key: "Substitutions")]
        getter substitutions : Hash(String, Array(String))?

        # The key that represents your app-specific identifier for grouping notifications. If you provide a
        # Notification Content app extension, you can use this value to group your notifications together.

        @[JSON::Field(key: "ThreadId")]
        getter thread_id : String?

        # The amount of time, in seconds, that APNs should store and attempt to deliver the push notification,
        # if the service is unable to deliver the notification the first time. If this value is 0, APNs treats
        # the notification as if it expires immediately and the service doesn't store or try to deliver the
        # notification again. Amazon Pinpoint specifies this value in the apns-expiration request header when
        # it sends the notification message to APNs.

        @[JSON::Field(key: "TimeToLive")]
        getter time_to_live : Int32?

        # The title to display above the notification message on the recipient's device.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # The URL to open in the recipient's default mobile browser, if a recipient taps the push notification
        # and the value of the Action property is URL.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @apns_push_type : String? = nil,
          @action : String? = nil,
          @badge : Int32? = nil,
          @body : String? = nil,
          @category : String? = nil,
          @collapse_id : String? = nil,
          @data : Hash(String, String)? = nil,
          @media_url : String? = nil,
          @preferred_authentication_method : String? = nil,
          @priority : String? = nil,
          @raw_content : String? = nil,
          @silent_push : Bool? = nil,
          @sound : String? = nil,
          @substitutions : Hash(String, Array(String))? = nil,
          @thread_id : String? = nil,
          @time_to_live : Int32? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Specifies channel-specific content and settings for a message template that can be used in push
      # notifications that are sent through the APNs (Apple Push Notification service) channel.

      struct APNSPushNotificationTemplate
        include JSON::Serializable

        # The action to occur if a recipient taps a push notification that's based on the message template.
        # Valid values are: OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the
        # background. This is the default action. DEEP_LINK - Your app opens and displays a designated user
        # interface in the app. This setting uses the deep-linking features of the iOS platform. URL - The
        # default mobile browser on the recipient's device opens and loads the web page at a URL that you
        # specify.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The message body to use in push notifications that are based on the message template.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The URL of an image or video to display in push notifications that are based on the message
        # template.

        @[JSON::Field(key: "MediaUrl")]
        getter media_url : String?

        # The raw, JSON-formatted string to use as the payload for push notifications that are based on the
        # message template. If specified, this value overrides all other content for the message template.

        @[JSON::Field(key: "RawContent")]
        getter raw_content : String?

        # The key for the sound to play when the recipient receives a push notification that's based on the
        # message template. The value for this key is the name of a sound file in your app's main bundle or
        # the Library/Sounds folder in your app's data container. If the sound file can't be found or you
        # specify default for the value, the system plays the default alert sound.

        @[JSON::Field(key: "Sound")]
        getter sound : String?

        # The title to use in push notifications that are based on the message template. This title appears
        # above the notification message on a recipient's device.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # The URL to open in the recipient's default mobile browser, if a recipient taps a push notification
        # that's based on the message template and the value of the Action property is URL.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @action : String? = nil,
          @body : String? = nil,
          @media_url : String? = nil,
          @raw_content : String? = nil,
          @sound : String? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Specifies the status and settings of the APNs (Apple Push Notification service) sandbox channel for
      # an application.

      struct APNSSandboxChannelRequest
        include JSON::Serializable

        # The bundle identifier that's assigned to your iOS app. This identifier is used for APNs tokens.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String?

        # The APNs client certificate that you received from Apple, if you want Amazon Pinpoint to communicate
        # with the APNs sandbox environment by using an APNs certificate.

        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # The default authentication method that you want Amazon Pinpoint to use when authenticating with the
        # APNs sandbox environment, key or certificate.

        @[JSON::Field(key: "DefaultAuthenticationMethod")]
        getter default_authentication_method : String?

        # Specifies whether to enable the APNs sandbox channel for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The private key for the APNs client certificate that you want Amazon Pinpoint to use to communicate
        # with the APNs sandbox environment.

        @[JSON::Field(key: "PrivateKey")]
        getter private_key : String?

        # The identifier that's assigned to your Apple developer account team. This identifier is used for
        # APNs tokens.

        @[JSON::Field(key: "TeamId")]
        getter team_id : String?

        # The authentication key to use for APNs tokens.

        @[JSON::Field(key: "TokenKey")]
        getter token_key : String?

        # The key identifier that's assigned to your APNs signing key, if you want Amazon Pinpoint to
        # communicate with the APNs sandbox environment by using APNs tokens.

        @[JSON::Field(key: "TokenKeyId")]
        getter token_key_id : String?

        def initialize(
          @bundle_id : String? = nil,
          @certificate : String? = nil,
          @default_authentication_method : String? = nil,
          @enabled : Bool? = nil,
          @private_key : String? = nil,
          @team_id : String? = nil,
          @token_key : String? = nil,
          @token_key_id : String? = nil
        )
        end
      end

      # Provides information about the status and settings of the APNs (Apple Push Notification service)
      # sandbox channel for an application.

      struct APNSSandboxChannelResponse
        include JSON::Serializable

        # The type of messaging or notification platform for the channel. For the APNs sandbox channel, this
        # value is APNS_SANDBOX.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The unique identifier for the application that the APNs sandbox channel applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The date and time when the APNs sandbox channel was enabled.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # The default authentication method that Amazon Pinpoint uses to authenticate with the APNs sandbox
        # environment for this channel, key or certificate.

        @[JSON::Field(key: "DefaultAuthenticationMethod")]
        getter default_authentication_method : String?

        # Specifies whether the APNs sandbox channel is enabled for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # (Not used) This property is retained only for backward compatibility.

        @[JSON::Field(key: "HasCredential")]
        getter has_credential : Bool?

        # Specifies whether the APNs sandbox channel is configured to communicate with APNs by using APNs
        # tokens. To provide an authentication key for APNs tokens, set the TokenKey property of the channel.

        @[JSON::Field(key: "HasTokenKey")]
        getter has_token_key : Bool?

        # (Deprecated) An identifier for the APNs sandbox channel. This property is retained only for backward
        # compatibility.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Specifies whether the APNs sandbox channel is archived.

        @[JSON::Field(key: "IsArchived")]
        getter is_archived : Bool?

        # The user who last modified the APNs sandbox channel.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time when the APNs sandbox channel was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The current version of the APNs sandbox channel.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @platform : String,
          @application_id : String? = nil,
          @creation_date : String? = nil,
          @default_authentication_method : String? = nil,
          @enabled : Bool? = nil,
          @has_credential : Bool? = nil,
          @has_token_key : Bool? = nil,
          @id : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : String? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Specifies the status and settings of the APNs (Apple Push Notification service) VoIP channel for an
      # application.

      struct APNSVoipChannelRequest
        include JSON::Serializable

        # The bundle identifier that's assigned to your iOS app. This identifier is used for APNs tokens.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String?

        # The APNs client certificate that you received from Apple, if you want Amazon Pinpoint to communicate
        # with APNs by using an APNs certificate.

        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # The default authentication method that you want Amazon Pinpoint to use when authenticating with
        # APNs, key or certificate.

        @[JSON::Field(key: "DefaultAuthenticationMethod")]
        getter default_authentication_method : String?

        # Specifies whether to enable the APNs VoIP channel for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The private key for the APNs client certificate that you want Amazon Pinpoint to use to communicate
        # with APNs.

        @[JSON::Field(key: "PrivateKey")]
        getter private_key : String?

        # The identifier that's assigned to your Apple developer account team. This identifier is used for
        # APNs tokens.

        @[JSON::Field(key: "TeamId")]
        getter team_id : String?

        # The authentication key to use for APNs tokens.

        @[JSON::Field(key: "TokenKey")]
        getter token_key : String?

        # The key identifier that's assigned to your APNs signing key, if you want Amazon Pinpoint to
        # communicate with APNs by using APNs tokens.

        @[JSON::Field(key: "TokenKeyId")]
        getter token_key_id : String?

        def initialize(
          @bundle_id : String? = nil,
          @certificate : String? = nil,
          @default_authentication_method : String? = nil,
          @enabled : Bool? = nil,
          @private_key : String? = nil,
          @team_id : String? = nil,
          @token_key : String? = nil,
          @token_key_id : String? = nil
        )
        end
      end

      # Provides information about the status and settings of the APNs (Apple Push Notification service)
      # VoIP channel for an application.

      struct APNSVoipChannelResponse
        include JSON::Serializable

        # The type of messaging or notification platform for the channel. For the APNs VoIP channel, this
        # value is APNS_VOIP.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The unique identifier for the application that the APNs VoIP channel applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The date and time when the APNs VoIP channel was enabled.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # The default authentication method that Amazon Pinpoint uses to authenticate with APNs for this
        # channel, key or certificate.

        @[JSON::Field(key: "DefaultAuthenticationMethod")]
        getter default_authentication_method : String?

        # Specifies whether the APNs VoIP channel is enabled for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # (Not used) This property is retained only for backward compatibility.

        @[JSON::Field(key: "HasCredential")]
        getter has_credential : Bool?

        # Specifies whether the APNs VoIP channel is configured to communicate with APNs by using APNs tokens.
        # To provide an authentication key for APNs tokens, set the TokenKey property of the channel.

        @[JSON::Field(key: "HasTokenKey")]
        getter has_token_key : Bool?

        # (Deprecated) An identifier for the APNs VoIP channel. This property is retained only for backward
        # compatibility.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Specifies whether the APNs VoIP channel is archived.

        @[JSON::Field(key: "IsArchived")]
        getter is_archived : Bool?

        # The user who last modified the APNs VoIP channel.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time when the APNs VoIP channel was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The current version of the APNs VoIP channel.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @platform : String,
          @application_id : String? = nil,
          @creation_date : String? = nil,
          @default_authentication_method : String? = nil,
          @enabled : Bool? = nil,
          @has_credential : Bool? = nil,
          @has_token_key : Bool? = nil,
          @id : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : String? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Specifies the status and settings of the APNs (Apple Push Notification service) VoIP sandbox channel
      # for an application.

      struct APNSVoipSandboxChannelRequest
        include JSON::Serializable

        # The bundle identifier that's assigned to your iOS app. This identifier is used for APNs tokens.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String?

        # The APNs client certificate that you received from Apple, if you want Amazon Pinpoint to communicate
        # with the APNs sandbox environment by using an APNs certificate.

        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # The default authentication method that you want Amazon Pinpoint to use when authenticating with the
        # APNs sandbox environment for this channel, key or certificate.

        @[JSON::Field(key: "DefaultAuthenticationMethod")]
        getter default_authentication_method : String?

        # Specifies whether the APNs VoIP sandbox channel is enabled for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The private key for the APNs client certificate that you want Amazon Pinpoint to use to communicate
        # with the APNs sandbox environment.

        @[JSON::Field(key: "PrivateKey")]
        getter private_key : String?

        # The identifier that's assigned to your Apple developer account team. This identifier is used for
        # APNs tokens.

        @[JSON::Field(key: "TeamId")]
        getter team_id : String?

        # The authentication key to use for APNs tokens.

        @[JSON::Field(key: "TokenKey")]
        getter token_key : String?

        # The key identifier that's assigned to your APNs signing key, if you want Amazon Pinpoint to
        # communicate with the APNs sandbox environment by using APNs tokens.

        @[JSON::Field(key: "TokenKeyId")]
        getter token_key_id : String?

        def initialize(
          @bundle_id : String? = nil,
          @certificate : String? = nil,
          @default_authentication_method : String? = nil,
          @enabled : Bool? = nil,
          @private_key : String? = nil,
          @team_id : String? = nil,
          @token_key : String? = nil,
          @token_key_id : String? = nil
        )
        end
      end

      # Provides information about the status and settings of the APNs (Apple Push Notification service)
      # VoIP sandbox channel for an application.

      struct APNSVoipSandboxChannelResponse
        include JSON::Serializable

        # The type of messaging or notification platform for the channel. For the APNs VoIP sandbox channel,
        # this value is APNS_VOIP_SANDBOX.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The unique identifier for the application that the APNs VoIP sandbox channel applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The date and time when the APNs VoIP sandbox channel was enabled.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # The default authentication method that Amazon Pinpoint uses to authenticate with the APNs sandbox
        # environment for this channel, key or certificate.

        @[JSON::Field(key: "DefaultAuthenticationMethod")]
        getter default_authentication_method : String?

        # Specifies whether the APNs VoIP sandbox channel is enabled for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # (Not used) This property is retained only for backward compatibility.

        @[JSON::Field(key: "HasCredential")]
        getter has_credential : Bool?

        # Specifies whether the APNs VoIP sandbox channel is configured to communicate with APNs by using APNs
        # tokens. To provide an authentication key for APNs tokens, set the TokenKey property of the channel.

        @[JSON::Field(key: "HasTokenKey")]
        getter has_token_key : Bool?

        # (Deprecated) An identifier for the APNs VoIP sandbox channel. This property is retained only for
        # backward compatibility.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Specifies whether the APNs VoIP sandbox channel is archived.

        @[JSON::Field(key: "IsArchived")]
        getter is_archived : Bool?

        # The user who last modified the APNs VoIP sandbox channel.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time when the APNs VoIP sandbox channel was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The current version of the APNs VoIP sandbox channel.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @platform : String,
          @application_id : String? = nil,
          @creation_date : String? = nil,
          @default_authentication_method : String? = nil,
          @enabled : Bool? = nil,
          @has_credential : Bool? = nil,
          @has_token_key : Bool? = nil,
          @id : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : String? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Provides information about the activities that were performed by a campaign.

      struct ActivitiesResponse
        include JSON::Serializable

        # An array of responses, one for each activity that was performed by the campaign.

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::ActivityResponse)

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null if there are no additional pages.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @item : Array(Types::ActivityResponse),
          @next_token : String? = nil
        )
        end
      end

      # Specifies the configuration and other settings for an activity in a journey.

      struct Activity
        include JSON::Serializable

        # The settings for a custom message activity. This type of activity calls an AWS Lambda function or
        # web hook that sends messages to participants.

        @[JSON::Field(key: "CUSTOM")]
        getter custom : Types::CustomMessageActivity?

        # The settings for a yes/no split activity. This type of activity sends participants down one of two
        # paths in a journey, based on conditions that you specify.

        @[JSON::Field(key: "ConditionalSplit")]
        getter conditional_split : Types::ConditionalSplitActivity?

        # The settings for a connect activity. This type of activity initiates a contact center call to
        # participants.

        @[JSON::Field(key: "ContactCenter")]
        getter contact_center : Types::ContactCenterActivity?

        # The custom description of the activity.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The settings for an email activity. This type of activity sends an email message to participants.

        @[JSON::Field(key: "EMAIL")]
        getter email : Types::EmailMessageActivity?

        # The settings for a holdout activity. This type of activity stops a journey for a specified
        # percentage of participants.

        @[JSON::Field(key: "Holdout")]
        getter holdout : Types::HoldoutActivity?

        # The settings for a multivariate split activity. This type of activity sends participants down one of
        # as many as five paths (including a default Else path) in a journey, based on conditions that you
        # specify.

        @[JSON::Field(key: "MultiCondition")]
        getter multi_condition : Types::MultiConditionalSplitActivity?

        # The settings for a push notification activity. This type of activity sends a push notification to
        # participants.

        @[JSON::Field(key: "PUSH")]
        getter push : Types::PushMessageActivity?

        # The settings for a random split activity. This type of activity randomly sends specified percentages
        # of participants down one of as many as five paths in a journey, based on conditions that you
        # specify.

        @[JSON::Field(key: "RandomSplit")]
        getter random_split : Types::RandomSplitActivity?

        # The settings for an SMS activity. This type of activity sends a text message to participants.

        @[JSON::Field(key: "SMS")]
        getter sms : Types::SMSMessageActivity?

        # The settings for a wait activity. This type of activity waits for a certain amount of time or until
        # a specific date and time before moving participants to the next activity in a journey.

        @[JSON::Field(key: "Wait")]
        getter wait : Types::WaitActivity?

        def initialize(
          @custom : Types::CustomMessageActivity? = nil,
          @conditional_split : Types::ConditionalSplitActivity? = nil,
          @contact_center : Types::ContactCenterActivity? = nil,
          @description : String? = nil,
          @email : Types::EmailMessageActivity? = nil,
          @holdout : Types::HoldoutActivity? = nil,
          @multi_condition : Types::MultiConditionalSplitActivity? = nil,
          @push : Types::PushMessageActivity? = nil,
          @random_split : Types::RandomSplitActivity? = nil,
          @sms : Types::SMSMessageActivity? = nil,
          @wait : Types::WaitActivity? = nil
        )
        end
      end

      # Provides information about an activity that was performed by a campaign.

      struct ActivityResponse
        include JSON::Serializable

        # The unique identifier for the application that the campaign applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The unique identifier for the campaign that the activity applies to.

        @[JSON::Field(key: "CampaignId")]
        getter campaign_id : String

        # The unique identifier for the activity.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The actual time, in ISO 8601 format, when the activity was marked CANCELLED or COMPLETED.

        @[JSON::Field(key: "End")]
        getter end : String?

        # A JSON object that contains metrics relating to the campaign execution for this campaign activity.
        # For information about the structure and contents of the results, see Standard Amazon Pinpoint
        # analytics metrics in the Amazon Pinpoint Developer Guide .

        @[JSON::Field(key: "ExecutionMetrics")]
        getter execution_metrics : Hash(String, String)?

        # Specifies whether the activity succeeded. Possible values are SUCCESS and FAIL.

        @[JSON::Field(key: "Result")]
        getter result : String?

        # The scheduled start time, in ISO 8601 format, for the activity.

        @[JSON::Field(key: "ScheduledStart")]
        getter scheduled_start : String?

        # The actual start time, in ISO 8601 format, of the activity.

        @[JSON::Field(key: "Start")]
        getter start : String?

        # The current status of the activity. Possible values are: PENDING, INITIALIZING, RUNNING, PAUSED,
        # CANCELLED, and COMPLETED.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The total number of endpoints that the campaign successfully delivered messages to.

        @[JSON::Field(key: "SuccessfulEndpointCount")]
        getter successful_endpoint_count : Int32?

        # The total number of time zones that were completed.

        @[JSON::Field(key: "TimezonesCompletedCount")]
        getter timezones_completed_count : Int32?

        # The total number of unique time zones that are in the segment for the campaign.

        @[JSON::Field(key: "TimezonesTotalCount")]
        getter timezones_total_count : Int32?

        # The total number of endpoints that the campaign attempted to deliver messages to.

        @[JSON::Field(key: "TotalEndpointCount")]
        getter total_endpoint_count : Int32?

        # The unique identifier for the campaign treatment that the activity applies to. A treatment is a
        # variation of a campaign that's used for A/B testing of a campaign.

        @[JSON::Field(key: "TreatmentId")]
        getter treatment_id : String?

        def initialize(
          @application_id : String,
          @campaign_id : String,
          @id : String,
          @end : String? = nil,
          @execution_metrics : Hash(String, String)? = nil,
          @result : String? = nil,
          @scheduled_start : String? = nil,
          @start : String? = nil,
          @state : String? = nil,
          @successful_endpoint_count : Int32? = nil,
          @timezones_completed_count : Int32? = nil,
          @timezones_total_count : Int32? = nil,
          @total_endpoint_count : Int32? = nil,
          @treatment_id : String? = nil
        )
        end
      end

      # Specifies address-based configuration settings for a message that's sent directly to an endpoint.

      struct AddressConfiguration
        include JSON::Serializable

        # The message body to use instead of the default message body. This value overrides the default
        # message body.

        @[JSON::Field(key: "BodyOverride")]
        getter body_override : String?

        # The channel to use when sending the message.

        @[JSON::Field(key: "ChannelType")]
        getter channel_type : String?

        # An object that maps custom attributes to attributes for the address and is attached to the message.
        # Attribute names are case sensitive. For a push notification, this payload is added to the
        # data.pinpoint object. For an email or text message, this payload is added to email/SMS delivery
        # receipt event attributes.

        @[JSON::Field(key: "Context")]
        getter context : Hash(String, String)?

        # The raw, JSON-formatted string to use as the payload for the message. If specified, this value
        # overrides all other values for the message.

        @[JSON::Field(key: "RawContent")]
        getter raw_content : String?

        # A map of the message variables to merge with the variables specified by properties of the
        # DefaultMessage object. The variables specified in this map take precedence over all other variables.

        @[JSON::Field(key: "Substitutions")]
        getter substitutions : Hash(String, Array(String))?

        # The message title to use instead of the default message title. This value overrides the default
        # message title.

        @[JSON::Field(key: "TitleOverride")]
        getter title_override : String?

        def initialize(
          @body_override : String? = nil,
          @channel_type : String? = nil,
          @context : Hash(String, String)? = nil,
          @raw_content : String? = nil,
          @substitutions : Hash(String, Array(String))? = nil,
          @title_override : String? = nil
        )
        end
      end

      # Specifies channel-specific content and settings for a message template that can be used in push
      # notifications that are sent through the ADM (Amazon Device Messaging), Baidu (Baidu Cloud Push), or
      # GCM (Firebase Cloud Messaging, formerly Google Cloud Messaging) channel.

      struct AndroidPushNotificationTemplate
        include JSON::Serializable

        # The action to occur if a recipient taps a push notification that's based on the message template.
        # Valid values are: OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the
        # background. This is the default action. DEEP_LINK - Your app opens and displays a designated user
        # interface in the app. This action uses the deep-linking features of the Android platform. URL - The
        # default mobile browser on the recipient's device opens and loads the web page at a URL that you
        # specify.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The message body to use in a push notification that's based on the message template.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The URL of the large icon image to display in the content view of a push notification that's based
        # on the message template.

        @[JSON::Field(key: "ImageIconUrl")]
        getter image_icon_url : String?

        # The URL of an image to display in a push notification that's based on the message template.

        @[JSON::Field(key: "ImageUrl")]
        getter image_url : String?

        # The raw, JSON-formatted string to use as the payload for a push notification that's based on the
        # message template. If specified, this value overrides all other content for the message template.

        @[JSON::Field(key: "RawContent")]
        getter raw_content : String?

        # The URL of the small icon image to display in the status bar and the content view of a push
        # notification that's based on the message template.

        @[JSON::Field(key: "SmallImageIconUrl")]
        getter small_image_icon_url : String?

        # The sound to play when a recipient receives a push notification that's based on the message
        # template. You can use the default stream or specify the file name of a sound resource that's bundled
        # in your app. On an Android platform, the sound file must reside in /res/raw/.

        @[JSON::Field(key: "Sound")]
        getter sound : String?

        # The title to use in a push notification that's based on the message template. This title appears
        # above the notification message on a recipient's device.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # The URL to open in a recipient's default mobile browser, if a recipient taps a push notification
        # that's based on the message template and the value of the Action property is URL.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @action : String? = nil,
          @body : String? = nil,
          @image_icon_url : String? = nil,
          @image_url : String? = nil,
          @raw_content : String? = nil,
          @small_image_icon_url : String? = nil,
          @sound : String? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Provides the results of a query that retrieved the data for a standard metric that applies to an
      # application, and provides information about that query.

      struct ApplicationDateRangeKpiResponse
        include JSON::Serializable

        # The unique identifier for the application that the metric applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The last date and time of the date range that was used to filter the query results, in extended ISO
        # 8601 format. The date range is inclusive.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The name of the metric, also referred to as a key performance indicator (KPI) , that the data was
        # retrieved for. This value describes the associated metric and consists of two or more terms, which
        # are comprised of lowercase alphanumeric characters, separated by a hyphen. For a list of possible
        # values, see the Amazon Pinpoint Developer Guide .

        @[JSON::Field(key: "KpiName")]
        getter kpi_name : String

        # An array of objects that contains the results of the query. Each object contains the value for the
        # metric and metadata about that value.

        @[JSON::Field(key: "KpiResult")]
        getter kpi_result : Types::BaseKpiResult

        # The first date and time of the date range that was used to filter the query results, in extended ISO
        # 8601 format. The date range is inclusive.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null for the Application Metrics resource because the resource returns all results in
        # a single page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @end_time : Time,
          @kpi_name : String,
          @kpi_result : Types::BaseKpiResult,
          @start_time : Time,
          @next_token : String? = nil
        )
        end
      end

      # Provides information about an application.

      struct ApplicationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The unique identifier for the application. This identifier is displayed as the Project ID on the
        # Amazon Pinpoint console.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The display name of the application. This name is displayed as the Project name on the Amazon
        # Pinpoint console.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The date and time when the Application was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # A string-to-string map of key-value pairs that identifies the tags that are associated with the
        # application. Each tag consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @creation_date : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The default sending limits for journeys in the application. To override these limits and define
      # custom limits for a specific journey, use the Journey resource.

      struct ApplicationSettingsJourneyLimits
        include JSON::Serializable

        # The daily number of messages that an endpoint can receive from all journeys. The maximum value is
        # 100. If set to 0, this limit will not apply.

        @[JSON::Field(key: "DailyCap")]
        getter daily_cap : Int32?

        # The default maximum number of messages that can be sent to an endpoint during the specified
        # timeframe for all journeys.

        @[JSON::Field(key: "TimeframeCap")]
        getter timeframe_cap : Types::JourneyTimeframeCap?

        # The default maximum number of messages that a single journey can sent to a single endpoint. The
        # maximum value is 100. If set to 0, this limit will not apply.

        @[JSON::Field(key: "TotalCap")]
        getter total_cap : Int32?

        def initialize(
          @daily_cap : Int32? = nil,
          @timeframe_cap : Types::JourneyTimeframeCap? = nil,
          @total_cap : Int32? = nil
        )
        end
      end

      # Provides information about an application, including the default settings for an application.

      struct ApplicationSettingsResource
        include JSON::Serializable

        # The unique identifier for the application. This identifier is displayed as the Project ID on the
        # Amazon Pinpoint console.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The settings for the AWS Lambda function to invoke by default as a code hook for campaigns in the
        # application. You can use this hook to customize segments that are used by campaigns in the
        # application.

        @[JSON::Field(key: "CampaignHook")]
        getter campaign_hook : Types::CampaignHook?

        # The default sending limits for journeys in the application. These limits apply to each journey for
        # the application but can be overridden, on a per journey basis, with the JourneyLimits resource.

        @[JSON::Field(key: "JourneyLimits")]
        getter journey_limits : Types::ApplicationSettingsJourneyLimits?

        # The date and time, in ISO 8601 format, when the application's settings were last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The default sending limits for campaigns in the application.

        @[JSON::Field(key: "Limits")]
        getter limits : Types::CampaignLimits?

        # The default quiet time for campaigns in the application. Quiet time is a specific time range when
        # messages aren't sent to endpoints, if all the following conditions are met: The
        # EndpointDemographic.Timezone property of the endpoint is set to a valid value. The current time in
        # the endpoint's time zone is later than or equal to the time specified by the QuietTime.Start
        # property for the application (or a campaign or journey that has custom quiet time settings). The
        # current time in the endpoint's time zone is earlier than or equal to the time specified by the
        # QuietTime.End property for the application (or a campaign or journey that has custom quiet time
        # settings). If any of the preceding conditions isn't met, the endpoint will receive messages from a
        # campaign or journey, even if quiet time is enabled.

        @[JSON::Field(key: "QuietTime")]
        getter quiet_time : Types::QuietTime?

        def initialize(
          @application_id : String,
          @campaign_hook : Types::CampaignHook? = nil,
          @journey_limits : Types::ApplicationSettingsJourneyLimits? = nil,
          @last_modified_date : String? = nil,
          @limits : Types::CampaignLimits? = nil,
          @quiet_time : Types::QuietTime? = nil
        )
        end
      end

      # Provides information about all of your applications.

      struct ApplicationsResponse
        include JSON::Serializable

        # An array of responses, one for each application that was returned.

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::ApplicationResponse)?

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null if there are no additional pages.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @item : Array(Types::ApplicationResponse)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Specifies attribute-based criteria for including or excluding endpoints from a segment.

      struct AttributeDimension
        include JSON::Serializable

        # The criteria values to use for the segment dimension. Depending on the value of the AttributeType
        # property, endpoints are included or excluded from the segment if their attribute values match the
        # criteria values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        # INCLUSIVE - endpoints that have attributes matching the values are included in the segment.
        # EXCLUSIVE - endpoints that have attributes matching the values are excluded in the segment. CONTAINS
        # - endpoints that have attributes' substrings match the values are included in the segment. BEFORE -
        # endpoints with attributes read as ISO_INSTANT datetimes before the value are included in the
        # segment. AFTER - endpoints with attributes read as ISO_INSTANT datetimes after the value are
        # included in the segment. ON - endpoints with attributes read as ISO_INSTANT dates on the value are
        # included in the segment. Time is ignored in this comparison. BETWEEN - endpoints with attributes
        # read as ISO_INSTANT datetimes between the values are included in the segment.

        @[JSON::Field(key: "AttributeType")]
        getter attribute_type : String?

        def initialize(
          @values : Array(String),
          @attribute_type : String? = nil
        )
        end
      end

      # Provides information about the type and the names of attributes that were removed from all the
      # endpoints that are associated with an application.

      struct AttributesResource
        include JSON::Serializable

        # The unique identifier for the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The type of attribute or attributes that were removed from the endpoints. Valid values are:
        # endpoint-custom-attributes - Custom attributes that describe endpoints. endpoint-metric-attributes -
        # Custom metrics that your app reports to Amazon Pinpoint for endpoints. endpoint-user-attributes -
        # Custom attributes that describe users.

        @[JSON::Field(key: "AttributeType")]
        getter attribute_type : String

        # An array that specifies the names of the attributes that were removed from the endpoints.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(String)?

        def initialize(
          @application_id : String,
          @attribute_type : String,
          @attributes : Array(String)? = nil
        )
        end
      end

      # Provides information about an API request or response.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestID")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Specifies the status and settings of the Baidu (Baidu Cloud Push) channel for an application.

      struct BaiduChannelRequest
        include JSON::Serializable

        # The API key that you received from the Baidu Cloud Push service to communicate with the service.

        @[JSON::Field(key: "ApiKey")]
        getter api_key : String

        # The secret key that you received from the Baidu Cloud Push service to communicate with the service.

        @[JSON::Field(key: "SecretKey")]
        getter secret_key : String

        # Specifies whether to enable the Baidu channel for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @api_key : String,
          @secret_key : String,
          @enabled : Bool? = nil
        )
        end
      end

      # Provides information about the status and settings of the Baidu (Baidu Cloud Push) channel for an
      # application.

      struct BaiduChannelResponse
        include JSON::Serializable

        # The API key that you received from the Baidu Cloud Push service to communicate with the service.

        @[JSON::Field(key: "Credential")]
        getter credential : String

        # The type of messaging or notification platform for the channel. For the Baidu channel, this value is
        # BAIDU.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The unique identifier for the application that the Baidu channel applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The date and time when the Baidu channel was enabled.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # Specifies whether the Baidu channel is enabled for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # (Not used) This property is retained only for backward compatibility.

        @[JSON::Field(key: "HasCredential")]
        getter has_credential : Bool?

        # (Deprecated) An identifier for the Baidu channel. This property is retained only for backward
        # compatibility.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Specifies whether the Baidu channel is archived.

        @[JSON::Field(key: "IsArchived")]
        getter is_archived : Bool?

        # The user who last modified the Baidu channel.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time when the Baidu channel was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The current version of the Baidu channel.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @credential : String,
          @platform : String,
          @application_id : String? = nil,
          @creation_date : String? = nil,
          @enabled : Bool? = nil,
          @has_credential : Bool? = nil,
          @id : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : String? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Specifies the settings for a one-time message that's sent directly to an endpoint through the Baidu
      # (Baidu Cloud Push) channel.

      struct BaiduMessage
        include JSON::Serializable

        # The action to occur if the recipient taps the push notification. Valid values are: OPEN_APP - Your
        # app opens or it becomes the foreground app if it was sent to the background. This is the default
        # action. DEEP_LINK - Your app opens and displays a designated user interface in the app. This action
        # uses the deep-linking features of the Android platform. URL - The default mobile browser on the
        # recipient's device opens and loads the web page at a URL that you specify.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The body of the notification message.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The JSON data payload to use for the push notification, if the notification is a silent push
        # notification. This payload is added to the data.pinpoint.jsonBody object of the notification.

        @[JSON::Field(key: "Data")]
        getter data : Hash(String, String)?

        # The icon image name of the asset saved in your app.

        @[JSON::Field(key: "IconReference")]
        getter icon_reference : String?

        # The URL of the large icon image to display in the content view of the push notification.

        @[JSON::Field(key: "ImageIconUrl")]
        getter image_icon_url : String?

        # The URL of an image to display in the push notification.

        @[JSON::Field(key: "ImageUrl")]
        getter image_url : String?

        # The raw, JSON-formatted string to use as the payload for the notification message. If specified,
        # this value overrides all other content for the message.

        @[JSON::Field(key: "RawContent")]
        getter raw_content : String?

        # Specifies whether the notification is a silent push notification, which is a push notification that
        # doesn't display on a recipient's device. Silent push notifications can be used for cases such as
        # updating an app's configuration or supporting phone home functionality.

        @[JSON::Field(key: "SilentPush")]
        getter silent_push : Bool?

        # The URL of the small icon image to display in the status bar and the content view of the push
        # notification.

        @[JSON::Field(key: "SmallImageIconUrl")]
        getter small_image_icon_url : String?

        # The sound to play when the recipient receives the push notification. You can use the default stream
        # or specify the file name of a sound resource that's bundled in your app. On an Android platform, the
        # sound file must reside in /res/raw/.

        @[JSON::Field(key: "Sound")]
        getter sound : String?

        # The default message variables to use in the notification message. You can override the default
        # variables with individual address variables.

        @[JSON::Field(key: "Substitutions")]
        getter substitutions : Hash(String, Array(String))?

        # The amount of time, in seconds, that the Baidu Cloud Push service should store the message if the
        # recipient's device is offline. The default value and maximum supported time is 604,800 seconds (7
        # days).

        @[JSON::Field(key: "TimeToLive")]
        getter time_to_live : Int32?

        # The title to display above the notification message on the recipient's device.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # The URL to open in the recipient's default mobile browser, if a recipient taps the push notification
        # and the value of the Action property is URL.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @action : String? = nil,
          @body : String? = nil,
          @data : Hash(String, String)? = nil,
          @icon_reference : String? = nil,
          @image_icon_url : String? = nil,
          @image_url : String? = nil,
          @raw_content : String? = nil,
          @silent_push : Bool? = nil,
          @small_image_icon_url : String? = nil,
          @sound : String? = nil,
          @substitutions : Hash(String, Array(String))? = nil,
          @time_to_live : Int32? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Provides the results of a query that retrieved the data for a standard metric that applies to an
      # application, campaign, or journey.

      struct BaseKpiResult
        include JSON::Serializable

        # An array of objects that provides the results of a query that retrieved the data for a standard
        # metric that applies to an application, campaign, or journey.

        @[JSON::Field(key: "Rows")]
        getter rows : Array(Types::ResultRow)

        def initialize(
          @rows : Array(Types::ResultRow)
        )
        end
      end

      # Specifies the contents of a message that's sent through a custom channel to recipients of a
      # campaign.

      struct CampaignCustomMessage
        include JSON::Serializable

        # The raw, JSON-formatted string to use as the payload for the message. The maximum size is 5 KB.

        @[JSON::Field(key: "Data")]
        getter data : String?

        def initialize(
          @data : String? = nil
        )
        end
      end

      # Provides the results of a query that retrieved the data for a standard metric that applies to a
      # campaign, and provides information about that query.

      struct CampaignDateRangeKpiResponse
        include JSON::Serializable

        # The unique identifier for the application that the metric applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The unique identifier for the campaign that the metric applies to.

        @[JSON::Field(key: "CampaignId")]
        getter campaign_id : String

        # The last date and time of the date range that was used to filter the query results, in extended ISO
        # 8601 format. The date range is inclusive.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The name of the metric, also referred to as a key performance indicator (KPI) , that the data was
        # retrieved for. This value describes the associated metric and consists of two or more terms, which
        # are comprised of lowercase alphanumeric characters, separated by a hyphen. For a list of possible
        # values, see the Amazon Pinpoint Developer Guide .

        @[JSON::Field(key: "KpiName")]
        getter kpi_name : String

        # An array of objects that contains the results of the query. Each object contains the value for the
        # metric and metadata about that value.

        @[JSON::Field(key: "KpiResult")]
        getter kpi_result : Types::BaseKpiResult

        # The first date and time of the date range that was used to filter the query results, in extended ISO
        # 8601 format. The date range is inclusive.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null for the Campaign Metrics resource because the resource returns all results in a
        # single page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @campaign_id : String,
          @end_time : Time,
          @kpi_name : String,
          @kpi_result : Types::BaseKpiResult,
          @start_time : Time,
          @next_token : String? = nil
        )
        end
      end

      # Specifies the content and "From" address for an email message that's sent to recipients of a
      # campaign.

      struct CampaignEmailMessage
        include JSON::Serializable

        # The body of the email for recipients whose email clients don't render HTML content.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The verified email address to send the email from. The default address is the FromAddress specified
        # for the email channel for the application.

        @[JSON::Field(key: "FromAddress")]
        getter from_address : String?

        # The list of MessageHeaders for the email. You can have up to 15 MessageHeaders for each email.

        @[JSON::Field(key: "Headers")]
        getter headers : Array(Types::MessageHeader)?

        # The body of the email, in HTML format, for recipients whose email clients render HTML content.

        @[JSON::Field(key: "HtmlBody")]
        getter html_body : String?

        # The subject line, or title, of the email.

        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @body : String? = nil,
          @from_address : String? = nil,
          @headers : Array(Types::MessageHeader)? = nil,
          @html_body : String? = nil,
          @title : String? = nil
        )
        end
      end

      # Specifies the settings for events that cause a campaign to be sent.

      struct CampaignEventFilter
        include JSON::Serializable

        # The dimension settings of the event filter for the campaign.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Types::EventDimensions

        # The type of event that causes the campaign to be sent. Valid values are: SYSTEM, sends the campaign
        # when a system event occurs; and, ENDPOINT, sends the campaign when an endpoint event ( Events
        # resource) occurs.

        @[JSON::Field(key: "FilterType")]
        getter filter_type : String

        def initialize(
          @dimensions : Types::EventDimensions,
          @filter_type : String
        )
        end
      end

      # Specifies settings for invoking an AWS Lambda function that customizes a segment for a campaign.

      struct CampaignHook
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the AWS Lambda function that Amazon Pinpoint invokes to
        # customize a segment for a campaign.

        @[JSON::Field(key: "LambdaFunctionName")]
        getter lambda_function_name : String?

        # The mode that Amazon Pinpoint uses to invoke the AWS Lambda function. Possible values are: FILTER -
        # Invoke the function to customize the segment that's used by a campaign. DELIVERY - (Deprecated)
        # Previously, invoked the function to send a campaign through a custom channel. This functionality is
        # not supported anymore. To send a campaign through a custom channel, use the
        # CustomDeliveryConfiguration and CampaignCustomMessage objects of the campaign.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The web URL that Amazon Pinpoint calls to invoke the AWS Lambda function over HTTPS.

        @[JSON::Field(key: "WebUrl")]
        getter web_url : String?

        def initialize(
          @lambda_function_name : String? = nil,
          @mode : String? = nil,
          @web_url : String? = nil
        )
        end
      end

      # In-app message configuration.

      struct CampaignInAppMessage
        include JSON::Serializable

        # The message body of the notification, the email body or the text message.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # In-app message content.

        @[JSON::Field(key: "Content")]
        getter content : Array(Types::InAppMessageContent)?

        # Custom config to be sent to client.

        @[JSON::Field(key: "CustomConfig")]
        getter custom_config : Hash(String, String)?

        # In-app message layout.

        @[JSON::Field(key: "Layout")]
        getter layout : String?

        def initialize(
          @body : String? = nil,
          @content : Array(Types::InAppMessageContent)? = nil,
          @custom_config : Hash(String, String)? = nil,
          @layout : String? = nil
        )
        end
      end

      # For a campaign, specifies limits on the messages that the campaign can send. For an application,
      # specifies the default limits for messages that campaigns in the application can send.

      struct CampaignLimits
        include JSON::Serializable

        # The maximum number of messages that a campaign can send to a single endpoint during a 24-hour
        # period. For an application, this value specifies the default limit for the number of messages that
        # campaigns and journeys can send to a single endpoint during a 24-hour period. The maximum value is
        # 100.

        @[JSON::Field(key: "Daily")]
        getter daily : Int32?

        # The maximum amount of time, in seconds, that a campaign can attempt to deliver a message after the
        # scheduled start time for the campaign. The minimum value is 60 seconds.

        @[JSON::Field(key: "MaximumDuration")]
        getter maximum_duration : Int32?

        # The maximum number of messages that a campaign can send each second. For an application, this value
        # specifies the default limit for the number of messages that campaigns can send each second. The
        # minimum value is 1. The maximum value is 20,000.

        @[JSON::Field(key: "MessagesPerSecond")]
        getter messages_per_second : Int32?

        # The maximum total number of messages that the campaign can send per user session.

        @[JSON::Field(key: "Session")]
        getter session : Int32?

        # The maximum number of messages that a campaign can send to a single endpoint during the course of
        # the campaign. If a campaign recurs, this setting applies to all runs of the campaign. The maximum
        # value is 100.

        @[JSON::Field(key: "Total")]
        getter total : Int32?

        def initialize(
          @daily : Int32? = nil,
          @maximum_duration : Int32? = nil,
          @messages_per_second : Int32? = nil,
          @session : Int32? = nil,
          @total : Int32? = nil
        )
        end
      end

      # Provides information about the status, configuration, and other settings for a campaign.

      struct CampaignResponse
        include JSON::Serializable

        # The unique identifier for the application that the campaign applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The Amazon Resource Name (ARN) of the campaign.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date, in ISO 8601 format, when the campaign was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The unique identifier for the campaign.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The date, in ISO 8601 format, when the campaign was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String

        # The unique identifier for the segment that's associated with the campaign.

        @[JSON::Field(key: "SegmentId")]
        getter segment_id : String

        # The version number of the segment that's associated with the campaign.

        @[JSON::Field(key: "SegmentVersion")]
        getter segment_version : Int32

        # An array of responses, one for each treatment that you defined for the campaign, in addition to the
        # default treatment.

        @[JSON::Field(key: "AdditionalTreatments")]
        getter additional_treatments : Array(Types::TreatmentResource)?

        # The delivery configuration settings for sending the campaign through a custom channel.

        @[JSON::Field(key: "CustomDeliveryConfiguration")]
        getter custom_delivery_configuration : Types::CustomDeliveryConfiguration?

        # The current status of the campaign's default treatment. This value exists only for campaigns that
        # have more than one treatment.

        @[JSON::Field(key: "DefaultState")]
        getter default_state : Types::CampaignState?

        # The custom description of the campaign.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The allocated percentage of users (segment members) who shouldn't receive messages from the
        # campaign.

        @[JSON::Field(key: "HoldoutPercent")]
        getter holdout_percent : Int32?

        # The settings for the AWS Lambda function to use as a code hook for the campaign. You can use this
        # hook to customize the segment that's used by the campaign.

        @[JSON::Field(key: "Hook")]
        getter hook : Types::CampaignHook?

        # Specifies whether the campaign is paused. A paused campaign doesn't run unless you resume it by
        # changing this value to false.

        @[JSON::Field(key: "IsPaused")]
        getter is_paused : Bool?

        # The messaging limits for the campaign.

        @[JSON::Field(key: "Limits")]
        getter limits : Types::CampaignLimits?

        # The message configuration settings for the campaign.

        @[JSON::Field(key: "MessageConfiguration")]
        getter message_configuration : Types::MessageConfiguration?

        # The name of the campaign.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Defines the priority of the campaign, used to decide the order of messages displayed to user if
        # there are multiple messages scheduled to be displayed at the same moment

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The schedule settings for the campaign.

        @[JSON::Field(key: "Schedule")]
        getter schedule : Types::Schedule?

        # The current status of the campaign.

        @[JSON::Field(key: "State")]
        getter state : Types::CampaignState?

        # The message template that’s used for the campaign.

        @[JSON::Field(key: "TemplateConfiguration")]
        getter template_configuration : Types::TemplateConfiguration?

        # The custom description of the default treatment for the campaign.

        @[JSON::Field(key: "TreatmentDescription")]
        getter treatment_description : String?

        # The custom name of the default treatment for the campaign, if the campaign has multiple treatments.
        # A treatment is a variation of a campaign that's used for A/B testing.

        @[JSON::Field(key: "TreatmentName")]
        getter treatment_name : String?

        # The version number of the campaign.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        # A string-to-string map of key-value pairs that identifies the tags that are associated with the
        # campaign. Each tag consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_id : String,
          @arn : String,
          @creation_date : String,
          @id : String,
          @last_modified_date : String,
          @segment_id : String,
          @segment_version : Int32,
          @additional_treatments : Array(Types::TreatmentResource)? = nil,
          @custom_delivery_configuration : Types::CustomDeliveryConfiguration? = nil,
          @default_state : Types::CampaignState? = nil,
          @description : String? = nil,
          @holdout_percent : Int32? = nil,
          @hook : Types::CampaignHook? = nil,
          @is_paused : Bool? = nil,
          @limits : Types::CampaignLimits? = nil,
          @message_configuration : Types::MessageConfiguration? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @schedule : Types::Schedule? = nil,
          @state : Types::CampaignState? = nil,
          @template_configuration : Types::TemplateConfiguration? = nil,
          @treatment_description : String? = nil,
          @treatment_name : String? = nil,
          @version : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Specifies the content and settings for an SMS message that's sent to recipients of a campaign.

      struct CampaignSmsMessage
        include JSON::Serializable

        # The body of the SMS message.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The entity ID or Principal Entity (PE) id received from the regulatory body for sending SMS in your
        # country.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String?

        # The SMS message type. Valid values are TRANSACTIONAL (for messages that are critical or
        # time-sensitive, such as a one-time passwords) and PROMOTIONAL (for messsages that aren't critical or
        # time-sensitive, such as marketing messages).

        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        # The long code to send the SMS message from. This value should be one of the dedicated long codes
        # that's assigned to your AWS account. Although it isn't required, we recommend that you specify the
        # long code using an E.164 format to ensure prompt and accurate delivery of the message. For example,
        # +12065550100.

        @[JSON::Field(key: "OriginationNumber")]
        getter origination_number : String?

        # The sender ID to display on recipients' devices when they receive the SMS message.

        @[JSON::Field(key: "SenderId")]
        getter sender_id : String?

        # The template ID received from the regulatory body for sending SMS in your country.

        @[JSON::Field(key: "TemplateId")]
        getter template_id : String?

        def initialize(
          @body : String? = nil,
          @entity_id : String? = nil,
          @message_type : String? = nil,
          @origination_number : String? = nil,
          @sender_id : String? = nil,
          @template_id : String? = nil
        )
        end
      end

      # Provides information about the status of a campaign.

      struct CampaignState
        include JSON::Serializable

        # The current status of the campaign, or the current status of a treatment that belongs to an A/B test
        # campaign. If a campaign uses A/B testing, the campaign has a status of COMPLETED only if all
        # campaign treatments have a status of COMPLETED. If you delete the segment that's associated with a
        # campaign, the campaign fails and has a status of DELETED.

        @[JSON::Field(key: "CampaignStatus")]
        getter campaign_status : String?

        def initialize(
          @campaign_status : String? = nil
        )
        end
      end

      # Provides information about the configuration and other settings for all the campaigns that are
      # associated with an application.

      struct CampaignsResponse
        include JSON::Serializable

        # An array of responses, one for each campaign that's associated with the application.

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::CampaignResponse)

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null if there are no additional pages.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @item : Array(Types::CampaignResponse),
          @next_token : String? = nil
        )
        end
      end

      # Provides information about the general settings and status of a channel for an application.

      struct ChannelResponse
        include JSON::Serializable

        # The unique identifier for the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The date and time, in ISO 8601 format, when the channel was enabled.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # Specifies whether the channel is enabled for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # (Not used) This property is retained only for backward compatibility.

        @[JSON::Field(key: "HasCredential")]
        getter has_credential : Bool?

        # (Deprecated) An identifier for the channel. This property is retained only for backward
        # compatibility.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Specifies whether the channel is archived.

        @[JSON::Field(key: "IsArchived")]
        getter is_archived : Bool?

        # The user who last modified the channel.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time, in ISO 8601 format, when the channel was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The current version of the channel.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @application_id : String? = nil,
          @creation_date : String? = nil,
          @enabled : Bool? = nil,
          @has_credential : Bool? = nil,
          @id : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : String? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Provides information about the general settings and status of all channels for an application,
      # including channels that aren't enabled for the application.

      struct ChannelsResponse
        include JSON::Serializable

        # A map that contains a multipart response for each channel. For each item in this object, the
        # ChannelType is the key and the Channel is the value.

        @[JSON::Field(key: "Channels")]
        getter channels : Hash(String, Types::ChannelResponse)

        def initialize(
          @channels : Hash(String, Types::ChannelResponse)
        )
        end
      end

      # The time when a journey will not send messages. QuietTime should be configured first and
      # SendingSchedule should be set to true.

      struct ClosedDays
        include JSON::Serializable


        @[JSON::Field(key: "CUSTOM")]
        getter custom : Array(Types::ClosedDaysRule)?


        @[JSON::Field(key: "EMAIL")]
        getter email : Array(Types::ClosedDaysRule)?


        @[JSON::Field(key: "PUSH")]
        getter push : Array(Types::ClosedDaysRule)?


        @[JSON::Field(key: "SMS")]
        getter sms : Array(Types::ClosedDaysRule)?


        @[JSON::Field(key: "VOICE")]
        getter voice : Array(Types::ClosedDaysRule)?

        def initialize(
          @custom : Array(Types::ClosedDaysRule)? = nil,
          @email : Array(Types::ClosedDaysRule)? = nil,
          @push : Array(Types::ClosedDaysRule)? = nil,
          @sms : Array(Types::ClosedDaysRule)? = nil,
          @voice : Array(Types::ClosedDaysRule)? = nil
        )
        end
      end

      # Specifies the rule settings for when messages can't be sent.

      struct ClosedDaysRule
        include JSON::Serializable

        # End DateTime ISO 8601 format

        @[JSON::Field(key: "EndDateTime")]
        getter end_date_time : String?

        # The name of the closed day rule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Start DateTime ISO 8601 format

        @[JSON::Field(key: "StartDateTime")]
        getter start_date_time : String?

        def initialize(
          @end_date_time : String? = nil,
          @name : String? = nil,
          @start_date_time : String? = nil
        )
        end
      end

      # Specifies the conditions to evaluate for an activity in a journey, and how to evaluate those
      # conditions.

      struct Condition
        include JSON::Serializable

        # The conditions to evaluate for the activity.

        @[JSON::Field(key: "Conditions")]
        getter conditions : Array(Types::SimpleCondition)?

        # Specifies how to handle multiple conditions for the activity. For example, if you specify two
        # conditions for an activity, whether both or only one of the conditions must be met for the activity
        # to be performed.

        @[JSON::Field(key: "Operator")]
        getter operator : String?

        def initialize(
          @conditions : Array(Types::SimpleCondition)? = nil,
          @operator : String? = nil
        )
        end
      end

      # Specifies the settings for a yes/no split activity in a journey. This type of activity sends
      # participants down one of two paths in a journey, based on conditions that you specify. To create
      # yes/no split activities that send participants down different paths based on push notification
      # events (such as Open or Received events), your mobile app has to specify the User ID and Endpoint ID
      # values. For more information, see Integrating Amazon Pinpoint with your application in the Amazon
      # Pinpoint Developer Guide .

      struct ConditionalSplitActivity
        include JSON::Serializable

        # The conditions that define the paths for the activity, and the relationship between the conditions.

        @[JSON::Field(key: "Condition")]
        getter condition : Types::Condition?

        # The amount of time to wait before determining whether the conditions are met, or the date and time
        # when Amazon Pinpoint determines whether the conditions are met.

        @[JSON::Field(key: "EvaluationWaitTime")]
        getter evaluation_wait_time : Types::WaitTime?

        # The unique identifier for the activity to perform if the conditions aren't met.

        @[JSON::Field(key: "FalseActivity")]
        getter false_activity : String?

        # The unique identifier for the activity to perform if the conditions are met.

        @[JSON::Field(key: "TrueActivity")]
        getter true_activity : String?

        def initialize(
          @condition : Types::Condition? = nil,
          @evaluation_wait_time : Types::WaitTime? = nil,
          @false_activity : String? = nil,
          @true_activity : String? = nil
        )
        end
      end

      # Provides information about an API request or response.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestID")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The settings for a connect activity. This type of activity initiates a contact center call to
      # participants.

      struct ContactCenterActivity
        include JSON::Serializable

        # The unique identifier for the next activity to perform after the this activity.

        @[JSON::Field(key: "NextActivity")]
        getter next_activity : String?

        def initialize(
          @next_activity : String? = nil
        )
        end
      end


      struct CreateAppRequest
        include JSON::Serializable


        @[JSON::Field(key: "CreateApplicationRequest")]
        getter create_application_request : Types::CreateApplicationRequest

        def initialize(
          @create_application_request : Types::CreateApplicationRequest
        )
        end
      end


      struct CreateAppResponse
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationResponse")]
        getter application_response : Types::ApplicationResponse

        def initialize(
          @application_response : Types::ApplicationResponse
        )
        end
      end

      # Specifies the display name of an application and the tags to associate with the application.

      struct CreateApplicationRequest
        include JSON::Serializable

        # The display name of the application. This name is displayed as the Project name on the Amazon
        # Pinpoint console.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A string-to-string map of key-value pairs that defines the tags to associate with the application.
        # Each tag consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "WriteCampaignRequest")]
        getter write_campaign_request : Types::WriteCampaignRequest

        def initialize(
          @application_id : String,
          @write_campaign_request : Types::WriteCampaignRequest
        )
        end
      end


      struct CreateCampaignResponse
        include JSON::Serializable


        @[JSON::Field(key: "CampaignResponse")]
        getter campaign_response : Types::CampaignResponse

        def initialize(
          @campaign_response : Types::CampaignResponse
        )
        end
      end


      struct CreateEmailTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "EmailTemplateRequest")]
        getter email_template_request : Types::EmailTemplateRequest


        @[JSON::Field(key: "template-name")]
        getter template_name : String

        def initialize(
          @email_template_request : Types::EmailTemplateRequest,
          @template_name : String
        )
        end
      end


      struct CreateEmailTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "CreateTemplateMessageBody")]
        getter create_template_message_body : Types::CreateTemplateMessageBody

        def initialize(
          @create_template_message_body : Types::CreateTemplateMessageBody
        )
        end
      end


      struct CreateExportJobRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "ExportJobRequest")]
        getter export_job_request : Types::ExportJobRequest

        def initialize(
          @application_id : String,
          @export_job_request : Types::ExportJobRequest
        )
        end
      end


      struct CreateExportJobResponse
        include JSON::Serializable


        @[JSON::Field(key: "ExportJobResponse")]
        getter export_job_response : Types::ExportJobResponse

        def initialize(
          @export_job_response : Types::ExportJobResponse
        )
        end
      end


      struct CreateImportJobRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "ImportJobRequest")]
        getter import_job_request : Types::ImportJobRequest

        def initialize(
          @application_id : String,
          @import_job_request : Types::ImportJobRequest
        )
        end
      end


      struct CreateImportJobResponse
        include JSON::Serializable


        @[JSON::Field(key: "ImportJobResponse")]
        getter import_job_response : Types::ImportJobResponse

        def initialize(
          @import_job_response : Types::ImportJobResponse
        )
        end
      end


      struct CreateInAppTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "InAppTemplateRequest")]
        getter in_app_template_request : Types::InAppTemplateRequest


        @[JSON::Field(key: "template-name")]
        getter template_name : String

        def initialize(
          @in_app_template_request : Types::InAppTemplateRequest,
          @template_name : String
        )
        end
      end


      struct CreateInAppTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "TemplateCreateMessageBody")]
        getter template_create_message_body : Types::TemplateCreateMessageBody

        def initialize(
          @template_create_message_body : Types::TemplateCreateMessageBody
        )
        end
      end


      struct CreateJourneyRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "WriteJourneyRequest")]
        getter write_journey_request : Types::WriteJourneyRequest

        def initialize(
          @application_id : String,
          @write_journey_request : Types::WriteJourneyRequest
        )
        end
      end


      struct CreateJourneyResponse
        include JSON::Serializable


        @[JSON::Field(key: "JourneyResponse")]
        getter journey_response : Types::JourneyResponse

        def initialize(
          @journey_response : Types::JourneyResponse
        )
        end
      end


      struct CreatePushTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "PushNotificationTemplateRequest")]
        getter push_notification_template_request : Types::PushNotificationTemplateRequest


        @[JSON::Field(key: "template-name")]
        getter template_name : String

        def initialize(
          @push_notification_template_request : Types::PushNotificationTemplateRequest,
          @template_name : String
        )
        end
      end


      struct CreatePushTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "CreateTemplateMessageBody")]
        getter create_template_message_body : Types::CreateTemplateMessageBody

        def initialize(
          @create_template_message_body : Types::CreateTemplateMessageBody
        )
        end
      end

      # Specifies Amazon Pinpoint configuration settings for retrieving and processing recommendation data
      # from a recommender model.

      struct CreateRecommenderConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes
        # Amazon Pinpoint to retrieve recommendation data from the recommender model.

        @[JSON::Field(key: "RecommendationProviderRoleArn")]
        getter recommendation_provider_role_arn : String

        # The Amazon Resource Name (ARN) of the recommender model to retrieve recommendation data from. This
        # value must match the ARN of an Amazon Personalize campaign.

        @[JSON::Field(key: "RecommendationProviderUri")]
        getter recommendation_provider_uri : String

        # A map of key-value pairs that defines 1-10 custom endpoint or user attributes, depending on the
        # value for the RecommendationProviderIdType property. Each of these attributes temporarily stores a
        # recommended item that's retrieved from the recommender model and sent to an AWS Lambda function for
        # additional processing. Each attribute can be used as a message variable in a message template. In
        # the map, the key is the name of a custom attribute and the value is a custom display name for that
        # attribute. The display name appears in the Attribute finder of the template editor on the Amazon
        # Pinpoint console. The following restrictions apply to these names: An attribute name must start with
        # a letter or number and it can contain up to 50 characters. The characters can be letters, numbers,
        # underscores (_), or hyphens (-). Attribute names are case sensitive and must be unique. An attribute
        # display name must start with a letter or number and it can contain up to 25 characters. The
        # characters can be letters, numbers, spaces, underscores (_), or hyphens (-). This object is required
        # if the configuration invokes an AWS Lambda function (RecommendationTransformerUri) to process
        # recommendation data. Otherwise, don't include this object in your request.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # A custom description of the configuration for the recommender model. The description can contain up
        # to 128 characters. The characters can be letters, numbers, spaces, or the following symbols: _ ; ()
        # , ‐.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A custom name of the configuration for the recommender model. The name must start with a letter or
        # number and it can contain up to 128 characters. The characters can be letters, numbers, spaces,
        # underscores (_), or hyphens (-).

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of Amazon Pinpoint ID to associate with unique user IDs in the recommender model. This
        # value enables the model to use attribute and event data that’s specific to a particular endpoint or
        # user in an Amazon Pinpoint application. Valid values are: PINPOINT_ENDPOINT_ID - Associate each user
        # in the model with a particular endpoint in Amazon Pinpoint. The data is correlated based on endpoint
        # IDs in Amazon Pinpoint. This is the default value. PINPOINT_USER_ID - Associate each user in the
        # model with a particular user and endpoint in Amazon Pinpoint. The data is correlated based on user
        # IDs in Amazon Pinpoint. If you specify this value, an endpoint definition in Amazon Pinpoint has to
        # specify both a user ID (UserId) and an endpoint ID. Otherwise, messages won’t be sent to the user's
        # endpoint.

        @[JSON::Field(key: "RecommendationProviderIdType")]
        getter recommendation_provider_id_type : String?

        # The name or Amazon Resource Name (ARN) of the AWS Lambda function to invoke for additional
        # processing of recommendation data that's retrieved from the recommender model.

        @[JSON::Field(key: "RecommendationTransformerUri")]
        getter recommendation_transformer_uri : String?

        # A custom display name for the standard endpoint or user attribute (RecommendationItems) that
        # temporarily stores recommended items for each endpoint or user, depending on the value for the
        # RecommendationProviderIdType property. This value is required if the configuration doesn't invoke an
        # AWS Lambda function (RecommendationTransformerUri) to perform additional processing of
        # recommendation data. This name appears in the Attribute finder of the template editor on the Amazon
        # Pinpoint console. The name can contain up to 25 characters. The characters can be letters, numbers,
        # spaces, underscores (_), or hyphens (-). These restrictions don't apply to attribute values.

        @[JSON::Field(key: "RecommendationsDisplayName")]
        getter recommendations_display_name : String?

        # The number of recommended items to retrieve from the model for each endpoint or user, depending on
        # the value for the RecommendationProviderIdType property. This number determines how many recommended
        # items are available for use in message variables. The minimum value is 1. The maximum value is 5.
        # The default value is 5. To use multiple recommended items and custom attributes with message
        # variables, you have to use an AWS Lambda function (RecommendationTransformerUri) to perform
        # additional processing of recommendation data.

        @[JSON::Field(key: "RecommendationsPerMessage")]
        getter recommendations_per_message : Int32?

        def initialize(
          @recommendation_provider_role_arn : String,
          @recommendation_provider_uri : String,
          @attributes : Hash(String, String)? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @recommendation_provider_id_type : String? = nil,
          @recommendation_transformer_uri : String? = nil,
          @recommendations_display_name : String? = nil,
          @recommendations_per_message : Int32? = nil
        )
        end
      end


      struct CreateRecommenderConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "CreateRecommenderConfiguration")]
        getter create_recommender_configuration : Types::CreateRecommenderConfiguration

        def initialize(
          @create_recommender_configuration : Types::CreateRecommenderConfiguration
        )
        end
      end


      struct CreateRecommenderConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "RecommenderConfigurationResponse")]
        getter recommender_configuration_response : Types::RecommenderConfigurationResponse

        def initialize(
          @recommender_configuration_response : Types::RecommenderConfigurationResponse
        )
        end
      end


      struct CreateSegmentRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "WriteSegmentRequest")]
        getter write_segment_request : Types::WriteSegmentRequest

        def initialize(
          @application_id : String,
          @write_segment_request : Types::WriteSegmentRequest
        )
        end
      end


      struct CreateSegmentResponse
        include JSON::Serializable


        @[JSON::Field(key: "SegmentResponse")]
        getter segment_response : Types::SegmentResponse

        def initialize(
          @segment_response : Types::SegmentResponse
        )
        end
      end


      struct CreateSmsTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "SMSTemplateRequest")]
        getter sms_template_request : Types::SMSTemplateRequest


        @[JSON::Field(key: "template-name")]
        getter template_name : String

        def initialize(
          @sms_template_request : Types::SMSTemplateRequest,
          @template_name : String
        )
        end
      end


      struct CreateSmsTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "CreateTemplateMessageBody")]
        getter create_template_message_body : Types::CreateTemplateMessageBody

        def initialize(
          @create_template_message_body : Types::CreateTemplateMessageBody
        )
        end
      end

      # Provides information about a request to create a message template.

      struct CreateTemplateMessageBody
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the message template that was created.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The message that's returned from the API for the request to create the message template.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The unique identifier for the request to create the message template.

        @[JSON::Field(key: "RequestID")]
        getter request_id : String?

        def initialize(
          @arn : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct CreateVoiceTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "VoiceTemplateRequest")]
        getter voice_template_request : Types::VoiceTemplateRequest

        def initialize(
          @template_name : String,
          @voice_template_request : Types::VoiceTemplateRequest
        )
        end
      end


      struct CreateVoiceTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "CreateTemplateMessageBody")]
        getter create_template_message_body : Types::CreateTemplateMessageBody

        def initialize(
          @create_template_message_body : Types::CreateTemplateMessageBody
        )
        end
      end

      # Specifies the delivery configuration settings for sending a campaign or campaign treatment through a
      # custom channel. This object is required if you use the CampaignCustomMessage object to define the
      # message to send for the campaign or campaign treatment.

      struct CustomDeliveryConfiguration
        include JSON::Serializable

        # The destination to send the campaign or treatment to. This value can be one of the following: The
        # name or Amazon Resource Name (ARN) of an AWS Lambda function to invoke to handle delivery of the
        # campaign or treatment. The URL for a web application or service that supports HTTPS and can receive
        # the message. The URL has to be a full URL, including the HTTPS protocol.

        @[JSON::Field(key: "DeliveryUri")]
        getter delivery_uri : String

        # The types of endpoints to send the campaign or treatment to. Each valid value maps to a type of
        # channel that you can associate with an endpoint by using the ChannelType property of an endpoint.

        @[JSON::Field(key: "EndpointTypes")]
        getter endpoint_types : Array(String)?

        def initialize(
          @delivery_uri : String,
          @endpoint_types : Array(String)? = nil
        )
        end
      end

      # The settings for a custom message activity. This type of activity calls an AWS Lambda function or
      # web hook that sends messages to participants.

      struct CustomMessageActivity
        include JSON::Serializable

        # The destination to send the campaign or treatment to. This value can be one of the following: The
        # name or Amazon Resource Name (ARN) of an AWS Lambda function to invoke to handle delivery of the
        # campaign or treatment. The URL for a web application or service that supports HTTPS and can receive
        # the message. The URL has to be a full URL, including the HTTPS protocol.

        @[JSON::Field(key: "DeliveryUri")]
        getter delivery_uri : String?

        # The types of endpoints to send the custom message to. Each valid value maps to a type of channel
        # that you can associate with an endpoint by using the ChannelType property of an endpoint.

        @[JSON::Field(key: "EndpointTypes")]
        getter endpoint_types : Array(String)?

        # Specifies the message data included in a custom channel message that's sent to participants in a
        # journey.

        @[JSON::Field(key: "MessageConfig")]
        getter message_config : Types::JourneyCustomMessage?

        # The unique identifier for the next activity to perform, after Amazon Pinpoint calls the AWS Lambda
        # function or web hook.

        @[JSON::Field(key: "NextActivity")]
        getter next_activity : String?

        # The name of the custom message template to use for the message. If specified, this value must match
        # the name of an existing message template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # The unique identifier for the version of the message template to use for the message. If specified,
        # this value must match the identifier for an existing template version. To retrieve a list of
        # versions and version identifiers for a template, use the Template Versions resource. If you don't
        # specify a value for this property, Amazon Pinpoint uses the active version of the template. The
        # active version is typically the version of a template that's been most recently reviewed and
        # approved for use, depending on your workflow. It isn't necessarily the latest version of a template.

        @[JSON::Field(key: "TemplateVersion")]
        getter template_version : String?

        def initialize(
          @delivery_uri : String? = nil,
          @endpoint_types : Array(String)? = nil,
          @message_config : Types::JourneyCustomMessage? = nil,
          @next_activity : String? = nil,
          @template_name : String? = nil,
          @template_version : String? = nil
        )
        end
      end

      # Default button configuration.

      struct DefaultButtonConfiguration
        include JSON::Serializable

        # Action triggered by the button.

        @[JSON::Field(key: "ButtonAction")]
        getter button_action : String

        # Button text.

        @[JSON::Field(key: "Text")]
        getter text : String

        # The background color of the button.

        @[JSON::Field(key: "BackgroundColor")]
        getter background_color : String?

        # The border radius of the button.

        @[JSON::Field(key: "BorderRadius")]
        getter border_radius : Int32?

        # Button destination.

        @[JSON::Field(key: "Link")]
        getter link : String?

        # The text color of the button.

        @[JSON::Field(key: "TextColor")]
        getter text_color : String?

        def initialize(
          @button_action : String,
          @text : String,
          @background_color : String? = nil,
          @border_radius : Int32? = nil,
          @link : String? = nil,
          @text_color : String? = nil
        )
        end
      end

      # Specifies the default message for all channels.

      struct DefaultMessage
        include JSON::Serializable

        # The default body of the message.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The default message variables to use in the message. You can override these default variables with
        # individual address variables.

        @[JSON::Field(key: "Substitutions")]
        getter substitutions : Hash(String, Array(String))?

        def initialize(
          @body : String? = nil,
          @substitutions : Hash(String, Array(String))? = nil
        )
        end
      end

      # Specifies the default settings and content for a push notification that's sent directly to an
      # endpoint.

      struct DefaultPushNotificationMessage
        include JSON::Serializable

        # The default action to occur if a recipient taps the push notification. Valid values are: OPEN_APP -
        # Your app opens or it becomes the foreground app if it was sent to the background. This is the
        # default action. DEEP_LINK - Your app opens and displays a designated user interface in the app. This
        # setting uses the deep-linking features of the iOS and Android platforms. URL - The default mobile
        # browser on the recipient's device opens and loads the web page at a URL that you specify.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The default body of the notification message.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The JSON data payload to use for the default push notification, if the notification is a silent push
        # notification. This payload is added to the data.pinpoint.jsonBody object of the notification.

        @[JSON::Field(key: "Data")]
        getter data : Hash(String, String)?

        # Specifies whether the default notification is a silent push notification, which is a push
        # notification that doesn't display on a recipient's device. Silent push notifications can be used for
        # cases such as updating an app's configuration or delivering messages to an in-app notification
        # center.

        @[JSON::Field(key: "SilentPush")]
        getter silent_push : Bool?

        # The default message variables to use in the notification message. You can override the default
        # variables with individual address variables.

        @[JSON::Field(key: "Substitutions")]
        getter substitutions : Hash(String, Array(String))?

        # The default title to display above the notification message on a recipient's device.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # The default URL to open in a recipient's default mobile browser, if a recipient taps the push
        # notification and the value of the Action property is URL.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @action : String? = nil,
          @body : String? = nil,
          @data : Hash(String, String)? = nil,
          @silent_push : Bool? = nil,
          @substitutions : Hash(String, Array(String))? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Specifies the default settings and content for a message template that can be used in messages that
      # are sent through a push notification channel.

      struct DefaultPushNotificationTemplate
        include JSON::Serializable

        # The action to occur if a recipient taps a push notification that's based on the message template.
        # Valid values are: OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the
        # background. This is the default action. DEEP_LINK - Your app opens and displays a designated user
        # interface in the app. This setting uses the deep-linking features of the iOS and Android platforms.
        # URL - The default mobile browser on the recipient's device opens and loads the web page at a URL
        # that you specify.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The message body to use in push notifications that are based on the message template.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The sound to play when a recipient receives a push notification that's based on the message
        # template. You can use the default stream or specify the file name of a sound resource that's bundled
        # in your app. On an Android platform, the sound file must reside in /res/raw/. For an iOS platform,
        # this value is the key for the name of a sound file in your app's main bundle or the Library/Sounds
        # folder in your app's data container. If the sound file can't be found or you specify default for the
        # value, the system plays the default alert sound.

        @[JSON::Field(key: "Sound")]
        getter sound : String?

        # The title to use in push notifications that are based on the message template. This title appears
        # above the notification message on a recipient's device.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # The URL to open in a recipient's default mobile browser, if a recipient taps a push notification
        # that's based on the message template and the value of the Action property is URL.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @action : String? = nil,
          @body : String? = nil,
          @sound : String? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end


      struct DeleteAdmChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteAdmChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "ADMChannelResponse")]
        getter adm_channel_response : Types::ADMChannelResponse

        def initialize(
          @adm_channel_response : Types::ADMChannelResponse
        )
        end
      end


      struct DeleteApnsChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteApnsChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "APNSChannelResponse")]
        getter apns_channel_response : Types::APNSChannelResponse

        def initialize(
          @apns_channel_response : Types::APNSChannelResponse
        )
        end
      end


      struct DeleteApnsSandboxChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteApnsSandboxChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "APNSSandboxChannelResponse")]
        getter apns_sandbox_channel_response : Types::APNSSandboxChannelResponse

        def initialize(
          @apns_sandbox_channel_response : Types::APNSSandboxChannelResponse
        )
        end
      end


      struct DeleteApnsVoipChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteApnsVoipChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "APNSVoipChannelResponse")]
        getter apns_voip_channel_response : Types::APNSVoipChannelResponse

        def initialize(
          @apns_voip_channel_response : Types::APNSVoipChannelResponse
        )
        end
      end


      struct DeleteApnsVoipSandboxChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteApnsVoipSandboxChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "APNSVoipSandboxChannelResponse")]
        getter apns_voip_sandbox_channel_response : Types::APNSVoipSandboxChannelResponse

        def initialize(
          @apns_voip_sandbox_channel_response : Types::APNSVoipSandboxChannelResponse
        )
        end
      end


      struct DeleteAppRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteAppResponse
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationResponse")]
        getter application_response : Types::ApplicationResponse

        def initialize(
          @application_response : Types::ApplicationResponse
        )
        end
      end


      struct DeleteBaiduChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteBaiduChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "BaiduChannelResponse")]
        getter baidu_channel_response : Types::BaiduChannelResponse

        def initialize(
          @baidu_channel_response : Types::BaiduChannelResponse
        )
        end
      end


      struct DeleteCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "campaign-id")]
        getter campaign_id : String

        def initialize(
          @application_id : String,
          @campaign_id : String
        )
        end
      end


      struct DeleteCampaignResponse
        include JSON::Serializable


        @[JSON::Field(key: "CampaignResponse")]
        getter campaign_response : Types::CampaignResponse

        def initialize(
          @campaign_response : Types::CampaignResponse
        )
        end
      end


      struct DeleteEmailChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteEmailChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "EmailChannelResponse")]
        getter email_channel_response : Types::EmailChannelResponse

        def initialize(
          @email_channel_response : Types::EmailChannelResponse
        )
        end
      end


      struct DeleteEmailTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @template_name : String,
          @version : String? = nil
        )
        end
      end


      struct DeleteEmailTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end


      struct DeleteEndpointRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "endpoint-id")]
        getter endpoint_id : String

        def initialize(
          @application_id : String,
          @endpoint_id : String
        )
        end
      end


      struct DeleteEndpointResponse
        include JSON::Serializable


        @[JSON::Field(key: "EndpointResponse")]
        getter endpoint_response : Types::EndpointResponse

        def initialize(
          @endpoint_response : Types::EndpointResponse
        )
        end
      end


      struct DeleteEventStreamRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteEventStreamResponse
        include JSON::Serializable


        @[JSON::Field(key: "EventStream")]
        getter event_stream : Types::EventStream

        def initialize(
          @event_stream : Types::EventStream
        )
        end
      end


      struct DeleteGcmChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteGcmChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "GCMChannelResponse")]
        getter gcm_channel_response : Types::GCMChannelResponse

        def initialize(
          @gcm_channel_response : Types::GCMChannelResponse
        )
        end
      end


      struct DeleteInAppTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @template_name : String,
          @version : String? = nil
        )
        end
      end


      struct DeleteInAppTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end


      struct DeleteJourneyRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "journey-id")]
        getter journey_id : String

        def initialize(
          @application_id : String,
          @journey_id : String
        )
        end
      end


      struct DeleteJourneyResponse
        include JSON::Serializable


        @[JSON::Field(key: "JourneyResponse")]
        getter journey_response : Types::JourneyResponse

        def initialize(
          @journey_response : Types::JourneyResponse
        )
        end
      end


      struct DeletePushTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @template_name : String,
          @version : String? = nil
        )
        end
      end


      struct DeletePushTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end


      struct DeleteRecommenderConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "recommender-id")]
        getter recommender_id : String

        def initialize(
          @recommender_id : String
        )
        end
      end


      struct DeleteRecommenderConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "RecommenderConfigurationResponse")]
        getter recommender_configuration_response : Types::RecommenderConfigurationResponse

        def initialize(
          @recommender_configuration_response : Types::RecommenderConfigurationResponse
        )
        end
      end


      struct DeleteSegmentRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "segment-id")]
        getter segment_id : String

        def initialize(
          @application_id : String,
          @segment_id : String
        )
        end
      end


      struct DeleteSegmentResponse
        include JSON::Serializable


        @[JSON::Field(key: "SegmentResponse")]
        getter segment_response : Types::SegmentResponse

        def initialize(
          @segment_response : Types::SegmentResponse
        )
        end
      end


      struct DeleteSmsChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteSmsChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "SMSChannelResponse")]
        getter sms_channel_response : Types::SMSChannelResponse

        def initialize(
          @sms_channel_response : Types::SMSChannelResponse
        )
        end
      end


      struct DeleteSmsTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @template_name : String,
          @version : String? = nil
        )
        end
      end


      struct DeleteSmsTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end


      struct DeleteUserEndpointsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "user-id")]
        getter user_id : String

        def initialize(
          @application_id : String,
          @user_id : String
        )
        end
      end


      struct DeleteUserEndpointsResponse
        include JSON::Serializable


        @[JSON::Field(key: "EndpointsResponse")]
        getter endpoints_response : Types::EndpointsResponse

        def initialize(
          @endpoints_response : Types::EndpointsResponse
        )
        end
      end


      struct DeleteVoiceChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteVoiceChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "VoiceChannelResponse")]
        getter voice_channel_response : Types::VoiceChannelResponse

        def initialize(
          @voice_channel_response : Types::VoiceChannelResponse
        )
        end
      end


      struct DeleteVoiceTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @template_name : String,
          @version : String? = nil
        )
        end
      end


      struct DeleteVoiceTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end

      # Specifies the settings and content for the default message and any default messages that you
      # tailored for specific channels.

      struct DirectMessageConfiguration
        include JSON::Serializable

        # The default push notification message for the ADM (Amazon Device Messaging) channel. This message
        # overrides the default push notification message (DefaultPushNotificationMessage).

        @[JSON::Field(key: "ADMMessage")]
        getter adm_message : Types::ADMMessage?

        # The default push notification message for the APNs (Apple Push Notification service) channel. This
        # message overrides the default push notification message (DefaultPushNotificationMessage).

        @[JSON::Field(key: "APNSMessage")]
        getter apns_message : Types::APNSMessage?

        # The default push notification message for the Baidu (Baidu Cloud Push) channel. This message
        # overrides the default push notification message (DefaultPushNotificationMessage).

        @[JSON::Field(key: "BaiduMessage")]
        getter baidu_message : Types::BaiduMessage?

        # The default message for all channels.

        @[JSON::Field(key: "DefaultMessage")]
        getter default_message : Types::DefaultMessage?

        # The default push notification message for all push notification channels.

        @[JSON::Field(key: "DefaultPushNotificationMessage")]
        getter default_push_notification_message : Types::DefaultPushNotificationMessage?

        # The default message for the email channel. This message overrides the default message
        # (DefaultMessage).

        @[JSON::Field(key: "EmailMessage")]
        getter email_message : Types::EmailMessage?

        # The default push notification message for the GCM channel, which is used to send notifications
        # through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service. This
        # message overrides the default push notification message (DefaultPushNotificationMessage).

        @[JSON::Field(key: "GCMMessage")]
        getter gcm_message : Types::GCMMessage?

        # The default message for the SMS channel. This message overrides the default message
        # (DefaultMessage).

        @[JSON::Field(key: "SMSMessage")]
        getter sms_message : Types::SMSMessage?

        # The default message for the voice channel. This message overrides the default message
        # (DefaultMessage).

        @[JSON::Field(key: "VoiceMessage")]
        getter voice_message : Types::VoiceMessage?

        def initialize(
          @adm_message : Types::ADMMessage? = nil,
          @apns_message : Types::APNSMessage? = nil,
          @baidu_message : Types::BaiduMessage? = nil,
          @default_message : Types::DefaultMessage? = nil,
          @default_push_notification_message : Types::DefaultPushNotificationMessage? = nil,
          @email_message : Types::EmailMessage? = nil,
          @gcm_message : Types::GCMMessage? = nil,
          @sms_message : Types::SMSMessage? = nil,
          @voice_message : Types::VoiceMessage? = nil
        )
        end
      end

      # Specifies the status and settings of the email channel for an application.

      struct EmailChannelRequest
        include JSON::Serializable

        # The verified email address that you want to send email from when you send email through the channel.

        @[JSON::Field(key: "FromAddress")]
        getter from_address : String

        # The Amazon Resource Name (ARN) of the identity, verified with Amazon Simple Email Service (Amazon
        # SES), that you want to use when you send email through the channel.

        @[JSON::Field(key: "Identity")]
        getter identity : String

        # The Amazon SES configuration set that you want to apply to messages that you send through the
        # channel.

        @[JSON::Field(key: "ConfigurationSet")]
        getter configuration_set : String?

        # Specifies whether to enable the email channel for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The ARN of an IAM role for Amazon Pinpoint to use to send email from your campaigns or journeys
        # through Amazon SES.

        @[JSON::Field(key: "OrchestrationSendingRoleArn")]
        getter orchestration_sending_role_arn : String?

        # The ARN of the AWS Identity and Access Management (IAM) role that you want Amazon Pinpoint to use
        # when it submits email-related event data for the channel.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @from_address : String,
          @identity : String,
          @configuration_set : String? = nil,
          @enabled : Bool? = nil,
          @orchestration_sending_role_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Provides information about the status and settings of the email channel for an application.

      struct EmailChannelResponse
        include JSON::Serializable

        # The type of messaging or notification platform for the channel. For the email channel, this value is
        # EMAIL.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The unique identifier for the application that the email channel applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon SES configuration set that's applied to messages that are sent through the channel.

        @[JSON::Field(key: "ConfigurationSet")]
        getter configuration_set : String?

        # The date and time, in ISO 8601 format, when the email channel was enabled.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # Specifies whether the email channel is enabled for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The verified email address that email is sent from when you send email through the channel.

        @[JSON::Field(key: "FromAddress")]
        getter from_address : String?

        # (Not used) This property is retained only for backward compatibility.

        @[JSON::Field(key: "HasCredential")]
        getter has_credential : Bool?

        # (Deprecated) An identifier for the email channel. This property is retained only for backward
        # compatibility.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the identity, verified with Amazon Simple Email Service (Amazon
        # SES), that's used when you send email through the channel.

        @[JSON::Field(key: "Identity")]
        getter identity : String?

        # Specifies whether the email channel is archived.

        @[JSON::Field(key: "IsArchived")]
        getter is_archived : Bool?

        # The user who last modified the email channel.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time, in ISO 8601 format, when the email channel was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The maximum number of emails that can be sent through the channel each second.

        @[JSON::Field(key: "MessagesPerSecond")]
        getter messages_per_second : Int32?

        # The ARN of an IAM role for Amazon Pinpoint to use to send email from your campaigns or journeys
        # through Amazon SES.

        @[JSON::Field(key: "OrchestrationSendingRoleArn")]
        getter orchestration_sending_role_arn : String?

        # The ARN of the AWS Identity and Access Management (IAM) role that Amazon Pinpoint uses to submit
        # email-related event data for the channel.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The current version of the email channel.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @platform : String,
          @application_id : String? = nil,
          @configuration_set : String? = nil,
          @creation_date : String? = nil,
          @enabled : Bool? = nil,
          @from_address : String? = nil,
          @has_credential : Bool? = nil,
          @id : String? = nil,
          @identity : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : String? = nil,
          @messages_per_second : Int32? = nil,
          @orchestration_sending_role_arn : String? = nil,
          @role_arn : String? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Specifies the default settings and content for a one-time email message that's sent directly to an
      # endpoint.

      struct EmailMessage
        include JSON::Serializable

        # The body of the email message.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The email address to forward bounces and complaints to, if feedback forwarding is enabled.

        @[JSON::Field(key: "FeedbackForwardingAddress")]
        getter feedback_forwarding_address : String?

        # The verified email address to send the email message from. The default value is the FromAddress
        # specified for the email channel.

        @[JSON::Field(key: "FromAddress")]
        getter from_address : String?

        # The email message, represented as a raw MIME message.

        @[JSON::Field(key: "RawEmail")]
        getter raw_email : Types::RawEmail?

        # The reply-to email address(es) for the email message. If a recipient replies to the email, each
        # reply-to address receives the reply.

        @[JSON::Field(key: "ReplyToAddresses")]
        getter reply_to_addresses : Array(String)?

        # The email message, composed of a subject, a text part, and an HTML part.

        @[JSON::Field(key: "SimpleEmail")]
        getter simple_email : Types::SimpleEmail?

        # The default message variables to use in the email message. You can override the default variables
        # with individual address variables.

        @[JSON::Field(key: "Substitutions")]
        getter substitutions : Hash(String, Array(String))?

        def initialize(
          @body : String? = nil,
          @feedback_forwarding_address : String? = nil,
          @from_address : String? = nil,
          @raw_email : Types::RawEmail? = nil,
          @reply_to_addresses : Array(String)? = nil,
          @simple_email : Types::SimpleEmail? = nil,
          @substitutions : Hash(String, Array(String))? = nil
        )
        end
      end

      # Specifies the settings for an email activity in a journey. This type of activity sends an email
      # message to participants.

      struct EmailMessageActivity
        include JSON::Serializable

        # Specifies the sender address for an email message that's sent to participants in the journey.

        @[JSON::Field(key: "MessageConfig")]
        getter message_config : Types::JourneyEmailMessage?

        # The unique identifier for the next activity to perform, after the message is sent.

        @[JSON::Field(key: "NextActivity")]
        getter next_activity : String?

        # The name of the email message template to use for the message. If specified, this value must match
        # the name of an existing message template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # The unique identifier for the version of the email template to use for the message. If specified,
        # this value must match the identifier for an existing template version. To retrieve a list of
        # versions and version identifiers for a template, use the Template Versions resource. If you don't
        # specify a value for this property, Amazon Pinpoint uses the active version of the template. The
        # active version is typically the version of a template that's been most recently reviewed and
        # approved for use, depending on your workflow. It isn't necessarily the latest version of a template.

        @[JSON::Field(key: "TemplateVersion")]
        getter template_version : String?

        def initialize(
          @message_config : Types::JourneyEmailMessage? = nil,
          @next_activity : String? = nil,
          @template_name : String? = nil,
          @template_version : String? = nil
        )
        end
      end

      # Specifies the content and settings for a message template that can be used in messages that are sent
      # through the email channel.

      struct EmailTemplateRequest
        include JSON::Serializable

        # A JSON object that specifies the default values to use for message variables in the message
        # template. This object is a set of key-value pairs. Each key defines a message variable in the
        # template. The corresponding value defines the default value for that variable. When you create a
        # message that's based on the template, you can override these defaults with message-specific and
        # address-specific variables and values.

        @[JSON::Field(key: "DefaultSubstitutions")]
        getter default_substitutions : String?

        # The list of MessageHeaders for the email. You can have up to 15 Headers.

        @[JSON::Field(key: "Headers")]
        getter headers : Array(Types::MessageHeader)?

        # The message body, in HTML format, to use in email messages that are based on the message template.
        # We recommend using HTML format for email clients that render HTML content. You can include links,
        # formatted text, and more in an HTML message.

        @[JSON::Field(key: "HtmlPart")]
        getter html_part : String?

        # The unique identifier for the recommender model to use for the message template. Amazon Pinpoint
        # uses this value to determine how to retrieve and process data from a recommender model when it sends
        # messages that use the template, if the template contains message variables for recommendation data.

        @[JSON::Field(key: "RecommenderId")]
        getter recommender_id : String?

        # The subject line, or title, to use in email messages that are based on the message template.

        @[JSON::Field(key: "Subject")]
        getter subject : String?

        # A custom description of the message template.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        # The message body, in plain text format, to use in email messages that are based on the message
        # template. We recommend using plain text format for email clients that don't render HTML content and
        # clients that are connected to high-latency networks, such as mobile devices.

        @[JSON::Field(key: "TextPart")]
        getter text_part : String?

        # As of 22-05-2023 tags has been deprecated for update operations. After this date any value in tags
        # is not processed and an error code is not returned. To manage tags we recommend using either Tags in
        # the API Reference for Amazon Pinpoint , resourcegroupstaggingapi commands in the AWS Command Line
        # Interface Documentation or resourcegroupstaggingapi in the AWS SDK . (Deprecated) A string-to-string
        # map of key-value pairs that defines the tags to associate with the message template. Each tag
        # consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @default_substitutions : String? = nil,
          @headers : Array(Types::MessageHeader)? = nil,
          @html_part : String? = nil,
          @recommender_id : String? = nil,
          @subject : String? = nil,
          @template_description : String? = nil,
          @text_part : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about the content and settings for a message template that can be used in
      # messages that are sent through the email channel.

      struct EmailTemplateResponse
        include JSON::Serializable

        # The date, in ISO 8601 format, when the message template was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The date, in ISO 8601 format, when the message template was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String

        # The name of the message template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # The type of channel that the message template is designed for. For an email template, this value is
        # EMAIL.

        @[JSON::Field(key: "TemplateType")]
        getter template_type : String

        # The Amazon Resource Name (ARN) of the message template.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The JSON object that specifies the default values that are used for message variables in the message
        # template. This object is a set of key-value pairs. Each key defines a message variable in the
        # template. The corresponding value defines the default value for that variable.

        @[JSON::Field(key: "DefaultSubstitutions")]
        getter default_substitutions : String?


        @[JSON::Field(key: "Headers")]
        getter headers : Array(Types::MessageHeader)?

        # The message body, in HTML format, that's used in email messages that are based on the message
        # template.

        @[JSON::Field(key: "HtmlPart")]
        getter html_part : String?

        # The unique identifier for the recommender model that's used by the message template.

        @[JSON::Field(key: "RecommenderId")]
        getter recommender_id : String?

        # The subject line, or title, that's used in email messages that are based on the message template.

        @[JSON::Field(key: "Subject")]
        getter subject : String?

        # The custom description of the message template.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        # The message body, in plain text format, that's used in email messages that are based on the message
        # template.

        @[JSON::Field(key: "TextPart")]
        getter text_part : String?

        # The unique identifier, as an integer, for the active version of the message template, or the version
        # of the template that you specified by using the version parameter in your request.

        @[JSON::Field(key: "Version")]
        getter version : String?

        # A string-to-string map of key-value pairs that identifies the tags that are associated with the
        # message template. Each tag consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @creation_date : String,
          @last_modified_date : String,
          @template_name : String,
          @template_type : String,
          @arn : String? = nil,
          @default_substitutions : String? = nil,
          @headers : Array(Types::MessageHeader)? = nil,
          @html_part : String? = nil,
          @recommender_id : String? = nil,
          @subject : String? = nil,
          @template_description : String? = nil,
          @text_part : String? = nil,
          @version : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Specifies an endpoint to create or update and the settings and attributes to set or change for the
      # endpoint.

      struct EndpointBatchItem
        include JSON::Serializable

        # The destination address for messages or push notifications that you send to the endpoint. The
        # address varies by channel. For a push-notification channel, use the token provided by the push
        # notification service, such as an Apple Push Notification service (APNs) device token or a Firebase
        # Cloud Messaging (FCM) registration token. For the SMS channel, use a phone number in E.164 format,
        # such as +12065550100. For the email channel, use an email address.

        @[JSON::Field(key: "Address")]
        getter address : String?

        # One or more custom attributes that describe the endpoint by associating a name with an array of
        # values. For example, the value of a custom attribute named Interests might be: ["Science", "Music",
        # "Travel"]. You can use these attributes as filter criteria when you create segments. Attribute names
        # are case sensitive. An attribute name can contain up to 50 characters. An attribute value can
        # contain up to 100 characters. When you define the name of a custom attribute, avoid using the
        # following characters: number sign (#), colon (:), question mark (?), backslash (\), and slash (/).
        # The Amazon Pinpoint console can't display attribute names that contain these characters. This
        # restriction doesn't apply to attribute values.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, Array(String))?

        # The channel to use when sending messages or push notifications to the endpoint.

        @[JSON::Field(key: "ChannelType")]
        getter channel_type : String?

        # The demographic information for the endpoint, such as the time zone and platform.

        @[JSON::Field(key: "Demographic")]
        getter demographic : Types::EndpointDemographic?

        # The date and time, in ISO 8601 format, when the endpoint was created or updated.

        @[JSON::Field(key: "EffectiveDate")]
        getter effective_date : String?

        # Specifies whether to send messages or push notifications to the endpoint. Valid values are: ACTIVE,
        # messages are sent to the endpoint; and, INACTIVE, messages aren’t sent to the endpoint. Amazon
        # Pinpoint automatically sets this value to ACTIVE when you create an endpoint or update an existing
        # endpoint. Amazon Pinpoint automatically sets this value to INACTIVE if you update another endpoint
        # that has the same address specified by the Address property.

        @[JSON::Field(key: "EndpointStatus")]
        getter endpoint_status : String?

        # The case insensitive unique identifier for the endpoint in the context of the batch. The identifier
        # can't contain $ , { or } .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The geographic information for the endpoint.

        @[JSON::Field(key: "Location")]
        getter location : Types::EndpointLocation?

        # One or more custom metrics that your app reports to Amazon Pinpoint for the endpoint.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, Float64)?

        # Specifies whether the user who's associated with the endpoint has opted out of receiving messages
        # and push notifications from you. Possible values are: ALL, the user has opted out and doesn't want
        # to receive any messages or push notifications; and, NONE, the user hasn't opted out and wants to
        # receive all messages and push notifications.

        @[JSON::Field(key: "OptOut")]
        getter opt_out : String?

        # The unique identifier for the request to create or update the endpoint.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # One or more custom attributes that describe the user who's associated with the endpoint.

        @[JSON::Field(key: "User")]
        getter user : Types::EndpointUser?

        def initialize(
          @address : String? = nil,
          @attributes : Hash(String, Array(String))? = nil,
          @channel_type : String? = nil,
          @demographic : Types::EndpointDemographic? = nil,
          @effective_date : String? = nil,
          @endpoint_status : String? = nil,
          @id : String? = nil,
          @location : Types::EndpointLocation? = nil,
          @metrics : Hash(String, Float64)? = nil,
          @opt_out : String? = nil,
          @request_id : String? = nil,
          @user : Types::EndpointUser? = nil
        )
        end
      end

      # Specifies a batch of endpoints to create or update and the settings and attributes to set or change
      # for each endpoint.

      struct EndpointBatchRequest
        include JSON::Serializable

        # An array that defines the endpoints to create or update and, for each endpoint, the property values
        # to set or change. An array can contain a maximum of 100 items.

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::EndpointBatchItem)

        def initialize(
          @item : Array(Types::EndpointBatchItem)
        )
        end
      end

      # Specifies demographic information about an endpoint, such as the applicable time zone and platform.

      struct EndpointDemographic
        include JSON::Serializable

        # The version of the app that's associated with the endpoint.

        @[JSON::Field(key: "AppVersion")]
        getter app_version : String?

        # The locale of the endpoint, in the following format: the ISO 639-1 alpha-2 code, followed by an
        # underscore (_), followed by an ISO 3166-1 alpha-2 value.

        @[JSON::Field(key: "Locale")]
        getter locale : String?

        # The manufacturer of the endpoint device, such as apple or samsung.

        @[JSON::Field(key: "Make")]
        getter make : String?

        # The model name or number of the endpoint device, such as iPhone or SM-G900F.

        @[JSON::Field(key: "Model")]
        getter model : String?

        # The model version of the endpoint device.

        @[JSON::Field(key: "ModelVersion")]
        getter model_version : String?

        # The platform of the endpoint device, such as ios.

        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # The platform version of the endpoint device.

        @[JSON::Field(key: "PlatformVersion")]
        getter platform_version : String?

        # The time zone of the endpoint, specified as a tz database name value, such as America/Los_Angeles.

        @[JSON::Field(key: "Timezone")]
        getter timezone : String?

        def initialize(
          @app_version : String? = nil,
          @locale : String? = nil,
          @make : String? = nil,
          @model : String? = nil,
          @model_version : String? = nil,
          @platform : String? = nil,
          @platform_version : String? = nil,
          @timezone : String? = nil
        )
        end
      end

      # Provides the status code and message that result from processing data for an endpoint.

      struct EndpointItemResponse
        include JSON::Serializable

        # The custom message that's returned in the response as a result of processing the endpoint data.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status code that's returned in the response as a result of processing the endpoint data.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        def initialize(
          @message : String? = nil,
          @status_code : Int32? = nil
        )
        end
      end

      # Specifies geographic information about an endpoint.

      struct EndpointLocation
        include JSON::Serializable

        # The name of the city where the endpoint is located.

        @[JSON::Field(key: "City")]
        getter city : String?

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region where the endpoint
        # is located. For example, US for the United States.

        @[JSON::Field(key: "Country")]
        getter country : String?

        # The latitude coordinate of the endpoint location, rounded to one decimal place.

        @[JSON::Field(key: "Latitude")]
        getter latitude : Float64?

        # The longitude coordinate of the endpoint location, rounded to one decimal place.

        @[JSON::Field(key: "Longitude")]
        getter longitude : Float64?

        # The postal or ZIP code for the area where the endpoint is located.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String?

        # The name of the region where the endpoint is located. For locations in the United States, this value
        # is the name of a state.

        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @city : String? = nil,
          @country : String? = nil,
          @latitude : Float64? = nil,
          @longitude : Float64? = nil,
          @postal_code : String? = nil,
          @region : String? = nil
        )
        end
      end

      # Provides information about the delivery status and results of sending a message directly to an
      # endpoint.

      struct EndpointMessageResult
        include JSON::Serializable

        # The delivery status of the message. Possible values are: DUPLICATE - The endpoint address is a
        # duplicate of another endpoint address. Amazon Pinpoint won't attempt to send the message again.
        # OPT_OUT - The user who's associated with the endpoint has opted out of receiving messages from you.
        # Amazon Pinpoint won't attempt to send the message again. PERMANENT_FAILURE - An error occurred when
        # delivering the message to the endpoint. Amazon Pinpoint won't attempt to send the message again.
        # SUCCESSFUL - The message was successfully delivered to the endpoint. TEMPORARY_FAILURE - A temporary
        # error occurred. Amazon Pinpoint won't attempt to send the message again. THROTTLED - Amazon Pinpoint
        # throttled the operation to send the message to the endpoint. UNKNOWN_FAILURE - An unknown error
        # occurred.

        @[JSON::Field(key: "DeliveryStatus")]
        getter delivery_status : String

        # The downstream service status code for delivering the message.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32

        # The endpoint address that the message was delivered to.

        @[JSON::Field(key: "Address")]
        getter address : String?

        # The unique identifier for the message that was sent.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The status message for delivering the message.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # For push notifications that are sent through the GCM channel, specifies whether the endpoint's
        # device registration token was updated as part of delivering the message.

        @[JSON::Field(key: "UpdatedToken")]
        getter updated_token : String?

        def initialize(
          @delivery_status : String,
          @status_code : Int32,
          @address : String? = nil,
          @message_id : String? = nil,
          @status_message : String? = nil,
          @updated_token : String? = nil
        )
        end
      end

      # Specifies the channel type and other settings for an endpoint.

      struct EndpointRequest
        include JSON::Serializable

        # The destination address for messages or push notifications that you send to the endpoint. The
        # address varies by channel. For a push-notification channel, use the token provided by the push
        # notification service, such as an Apple Push Notification service (APNs) device token or a Firebase
        # Cloud Messaging (FCM) registration token. For the SMS channel, use a phone number in E.164 format,
        # such as +12065550100. For the email channel, use an email address.

        @[JSON::Field(key: "Address")]
        getter address : String?

        # One or more custom attributes that describe the endpoint by associating a name with an array of
        # values. For example, the value of a custom attribute named Interests might be: ["Science", "Music",
        # "Travel"]. You can use these attributes as filter criteria when you create segments. Attribute names
        # are case sensitive. An attribute name can contain up to 50 characters. An attribute value can
        # contain up to 100 characters. When you define the name of a custom attribute, avoid using the
        # following characters: number sign (#), colon (:), question mark (?), backslash (\), and slash (/).
        # The Amazon Pinpoint console can't display attribute names that contain these characters. This
        # restriction doesn't apply to attribute values.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, Array(String))?

        # The channel to use when sending messages or push notifications to the endpoint.

        @[JSON::Field(key: "ChannelType")]
        getter channel_type : String?

        # The demographic information for the endpoint, such as the time zone and platform.

        @[JSON::Field(key: "Demographic")]
        getter demographic : Types::EndpointDemographic?

        # The date and time, in ISO 8601 format, when the endpoint is updated.

        @[JSON::Field(key: "EffectiveDate")]
        getter effective_date : String?

        # Specifies whether to send messages or push notifications to the endpoint. Valid values are: ACTIVE,
        # messages are sent to the endpoint; and, INACTIVE, messages aren’t sent to the endpoint. Amazon
        # Pinpoint automatically sets this value to ACTIVE when you create an endpoint or update an existing
        # endpoint. Amazon Pinpoint automatically sets this value to INACTIVE if you update another endpoint
        # that has the same address specified by the Address property.

        @[JSON::Field(key: "EndpointStatus")]
        getter endpoint_status : String?

        # The geographic information for the endpoint.

        @[JSON::Field(key: "Location")]
        getter location : Types::EndpointLocation?

        # One or more custom metrics that your app reports to Amazon Pinpoint for the endpoint.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, Float64)?

        # Specifies whether the user who's associated with the endpoint has opted out of receiving messages
        # and push notifications from you. Possible values are: ALL, the user has opted out and doesn't want
        # to receive any messages or push notifications; and, NONE, the user hasn't opted out and wants to
        # receive all messages and push notifications.

        @[JSON::Field(key: "OptOut")]
        getter opt_out : String?

        # The unique identifier for the most recent request to update the endpoint.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # One or more custom attributes that describe the user who's associated with the endpoint.

        @[JSON::Field(key: "User")]
        getter user : Types::EndpointUser?

        def initialize(
          @address : String? = nil,
          @attributes : Hash(String, Array(String))? = nil,
          @channel_type : String? = nil,
          @demographic : Types::EndpointDemographic? = nil,
          @effective_date : String? = nil,
          @endpoint_status : String? = nil,
          @location : Types::EndpointLocation? = nil,
          @metrics : Hash(String, Float64)? = nil,
          @opt_out : String? = nil,
          @request_id : String? = nil,
          @user : Types::EndpointUser? = nil
        )
        end
      end

      # Provides information about the channel type and other settings for an endpoint.

      struct EndpointResponse
        include JSON::Serializable

        # The destination address for messages or push notifications that you send to the endpoint. The
        # address varies by channel. For example, the address for a push-notification channel is typically the
        # token provided by a push notification service, such as an Apple Push Notification service (APNs)
        # device token or a Firebase Cloud Messaging (FCM) registration token. The address for the SMS channel
        # is a phone number in E.164 format, such as +12065550100. The address for the email channel is an
        # email address.

        @[JSON::Field(key: "Address")]
        getter address : String?

        # The unique identifier for the application that's associated with the endpoint.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # One or more custom attributes that describe the endpoint by associating a name with an array of
        # values. For example, the value of a custom attribute named Interests might be: ["Science", "Music",
        # "Travel"]. You can use these attributes as filter criteria when you create segments.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, Array(String))?

        # The channel that's used when sending messages or push notifications to the endpoint.

        @[JSON::Field(key: "ChannelType")]
        getter channel_type : String?

        # A number from 0-99 that represents the cohort that the endpoint is assigned to. Endpoints are
        # grouped into cohorts randomly, and each cohort contains approximately 1 percent of the endpoints for
        # an application. Amazon Pinpoint assigns cohorts to the holdout or treatment allocations for
        # campaigns.

        @[JSON::Field(key: "CohortId")]
        getter cohort_id : String?

        # The date and time, in ISO 8601 format, when the endpoint was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # The demographic information for the endpoint, such as the time zone and platform.

        @[JSON::Field(key: "Demographic")]
        getter demographic : Types::EndpointDemographic?

        # The date and time, in ISO 8601 format, when the endpoint was last updated.

        @[JSON::Field(key: "EffectiveDate")]
        getter effective_date : String?

        # Specifies whether messages or push notifications are sent to the endpoint. Possible values are:
        # ACTIVE, messages are sent to the endpoint; and, INACTIVE, messages aren’t sent to the endpoint.
        # Amazon Pinpoint automatically sets this value to ACTIVE when you create an endpoint or update an
        # existing endpoint. Amazon Pinpoint automatically sets this value to INACTIVE if you update another
        # endpoint that has the same address specified by the Address property.

        @[JSON::Field(key: "EndpointStatus")]
        getter endpoint_status : String?

        # The unique identifier that you assigned to the endpoint. The identifier should be a globally unique
        # identifier (GUID) to ensure that it doesn't conflict with other endpoint identifiers that are
        # associated with the application.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The geographic information for the endpoint.

        @[JSON::Field(key: "Location")]
        getter location : Types::EndpointLocation?

        # One or more custom metrics that your app reports to Amazon Pinpoint for the endpoint.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, Float64)?

        # Specifies whether the user who's associated with the endpoint has opted out of receiving messages
        # and push notifications from you. Possible values are: ALL, the user has opted out and doesn't want
        # to receive any messages or push notifications; and, NONE, the user hasn't opted out and wants to
        # receive all messages and push notifications.

        @[JSON::Field(key: "OptOut")]
        getter opt_out : String?

        # The unique identifier for the most recent request to update the endpoint.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # One or more custom user attributes that your app reports to Amazon Pinpoint for the user who's
        # associated with the endpoint.

        @[JSON::Field(key: "User")]
        getter user : Types::EndpointUser?

        def initialize(
          @address : String? = nil,
          @application_id : String? = nil,
          @attributes : Hash(String, Array(String))? = nil,
          @channel_type : String? = nil,
          @cohort_id : String? = nil,
          @creation_date : String? = nil,
          @demographic : Types::EndpointDemographic? = nil,
          @effective_date : String? = nil,
          @endpoint_status : String? = nil,
          @id : String? = nil,
          @location : Types::EndpointLocation? = nil,
          @metrics : Hash(String, Float64)? = nil,
          @opt_out : String? = nil,
          @request_id : String? = nil,
          @user : Types::EndpointUser? = nil
        )
        end
      end

      # Specifies the content, including message variables and attributes, to use in a message that's sent
      # directly to an endpoint.

      struct EndpointSendConfiguration
        include JSON::Serializable

        # The body of the message. If specified, this value overrides the default message body.

        @[JSON::Field(key: "BodyOverride")]
        getter body_override : String?

        # A map of custom attributes to attach to the message for the address. Attribute names are case
        # sensitive. For a push notification, this payload is added to the data.pinpoint object. For an email
        # or text message, this payload is added to email/SMS delivery receipt event attributes.

        @[JSON::Field(key: "Context")]
        getter context : Hash(String, String)?

        # The raw, JSON-formatted string to use as the payload for the message. If specified, this value
        # overrides all other values for the message.

        @[JSON::Field(key: "RawContent")]
        getter raw_content : String?

        # A map of the message variables to merge with the variables specified for the default message
        # (DefaultMessage.Substitutions). The variables specified in this map take precedence over all other
        # variables.

        @[JSON::Field(key: "Substitutions")]
        getter substitutions : Hash(String, Array(String))?

        # The title or subject line of the message. If specified, this value overrides the default message
        # title or subject line.

        @[JSON::Field(key: "TitleOverride")]
        getter title_override : String?

        def initialize(
          @body_override : String? = nil,
          @context : Hash(String, String)? = nil,
          @raw_content : String? = nil,
          @substitutions : Hash(String, Array(String))? = nil,
          @title_override : String? = nil
        )
        end
      end

      # Specifies data for one or more attributes that describe the user who's associated with an endpoint.

      struct EndpointUser
        include JSON::Serializable

        # One or more custom attributes that describe the user by associating a name with an array of values.
        # For example, the value of an attribute named Interests might be: ["Science", "Music", "Travel"]. You
        # can use these attributes as filter criteria when you create segments. Attribute names are case
        # sensitive. An attribute name can contain up to 50 characters. An attribute value can contain up to
        # 100 characters. When you define the name of a custom attribute, avoid using the following
        # characters: number sign (#), colon (:), question mark (?), backslash (\), and slash (/). The Amazon
        # Pinpoint console can't display attribute names that contain these characters. This restriction
        # doesn't apply to attribute values.

        @[JSON::Field(key: "UserAttributes")]
        getter user_attributes : Hash(String, Array(String))?

        # The unique identifier for the user.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @user_attributes : Hash(String, Array(String))? = nil,
          @user_id : String? = nil
        )
        end
      end

      # Provides information about all the endpoints that are associated with a user ID.

      struct EndpointsResponse
        include JSON::Serializable

        # An array of responses, one for each endpoint that's associated with the user ID.

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::EndpointResponse)

        def initialize(
          @item : Array(Types::EndpointResponse)
        )
        end
      end

      # Specifies information about an event that reports data to Amazon Pinpoint.

      struct Event
        include JSON::Serializable

        # The name of the event.

        @[JSON::Field(key: "EventType")]
        getter event_type : String

        # The date and time, in ISO 8601 format, when the event occurred.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : String

        # The package name of the app that's recording the event.

        @[JSON::Field(key: "AppPackageName")]
        getter app_package_name : String?

        # The title of the app that's recording the event.

        @[JSON::Field(key: "AppTitle")]
        getter app_title : String?

        # The version number of the app that's recording the event.

        @[JSON::Field(key: "AppVersionCode")]
        getter app_version_code : String?

        # One or more custom attributes that are associated with the event.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The version of the SDK that's running on the client device.

        @[JSON::Field(key: "ClientSdkVersion")]
        getter client_sdk_version : String?

        # One or more custom metrics that are associated with the event.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, Float64)?

        # The name of the SDK that's being used to record the event.

        @[JSON::Field(key: "SdkName")]
        getter sdk_name : String?

        # Information about the session in which the event occurred.

        @[JSON::Field(key: "Session")]
        getter session : Types::Session?

        def initialize(
          @event_type : String,
          @timestamp : String,
          @app_package_name : String? = nil,
          @app_title : String? = nil,
          @app_version_code : String? = nil,
          @attributes : Hash(String, String)? = nil,
          @client_sdk_version : String? = nil,
          @metrics : Hash(String, Float64)? = nil,
          @sdk_name : String? = nil,
          @session : Types::Session? = nil
        )
        end
      end

      # Specifies the conditions to evaluate for an event that applies to an activity in a journey.

      struct EventCondition
        include JSON::Serializable

        # The dimensions for the event filter to use for the activity.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Types::EventDimensions?

        # The message identifier (message_id) for the message to use when determining whether message events
        # meet the condition.

        @[JSON::Field(key: "MessageActivity")]
        getter message_activity : String?

        def initialize(
          @dimensions : Types::EventDimensions? = nil,
          @message_activity : String? = nil
        )
        end
      end

      # Specifies the dimensions for an event filter that determines when a campaign is sent or a journey
      # activity is performed.

      struct EventDimensions
        include JSON::Serializable

        # One or more custom attributes that your application reports to Amazon Pinpoint. You can use these
        # attributes as selection criteria when you create an event filter.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, Types::AttributeDimension)?

        # The name of the event that causes the campaign to be sent or the journey activity to be performed.
        # This can be a standard event that Amazon Pinpoint generates, such as _email.delivered. For
        # campaigns, this can also be a custom event that's specific to your application. For information
        # about standard events, see Streaming Amazon Pinpoint Events in the Amazon Pinpoint Developer Guide .

        @[JSON::Field(key: "EventType")]
        getter event_type : Types::SetDimension?

        # One or more custom metrics that your application reports to Amazon Pinpoint. You can use these
        # metrics as selection criteria when you create an event filter.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, Types::MetricDimension)?

        def initialize(
          @attributes : Hash(String, Types::AttributeDimension)? = nil,
          @event_type : Types::SetDimension? = nil,
          @metrics : Hash(String, Types::MetricDimension)? = nil
        )
        end
      end

      # Specifies the settings for an event that causes a campaign to be sent or a journey activity to be
      # performed.

      struct EventFilter
        include JSON::Serializable

        # The dimensions for the event filter to use for the campaign or the journey activity.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Types::EventDimensions

        # The type of event that causes the campaign to be sent or the journey activity to be performed. Valid
        # values are: SYSTEM, sends the campaign or performs the activity when a system event occurs; and,
        # ENDPOINT, sends the campaign or performs the activity when an endpoint event ( Events resource )
        # occurs.

        @[JSON::Field(key: "FilterType")]
        getter filter_type : String

        def initialize(
          @dimensions : Types::EventDimensions,
          @filter_type : String
        )
        end
      end

      # Provides the status code and message that result from processing an event.

      struct EventItemResponse
        include JSON::Serializable

        # A custom message that's returned in the response as a result of processing the event.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status code that's returned in the response as a result of processing the event. Possible values
        # are: 202, for events that were accepted; and, 400, for events that weren't valid.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        def initialize(
          @message : String? = nil,
          @status_code : Int32? = nil
        )
        end
      end

      # Specifies the settings for an event that causes a journey activity to start.

      struct EventStartCondition
        include JSON::Serializable


        @[JSON::Field(key: "EventFilter")]
        getter event_filter : Types::EventFilter?


        @[JSON::Field(key: "SegmentId")]
        getter segment_id : String?

        def initialize(
          @event_filter : Types::EventFilter? = nil,
          @segment_id : String? = nil
        )
        end
      end

      # Specifies settings for publishing event data to an Amazon Kinesis data stream or an Amazon Kinesis
      # Data Firehose delivery stream.

      struct EventStream
        include JSON::Serializable

        # The unique identifier for the application to publish event data for.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The Amazon Resource Name (ARN) of the Amazon Kinesis data stream or Amazon Kinesis Data Firehose
        # delivery stream to publish event data to. For a Kinesis data stream, the ARN format is:
        # arn:aws:kinesis: region : account-id :stream/ stream_name For a Kinesis Data Firehose delivery
        # stream, the ARN format is: arn:aws:firehose: region : account-id :deliverystream/ stream_name

        @[JSON::Field(key: "DestinationStreamArn")]
        getter destination_stream_arn : String

        # The AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to publish event
        # data to the stream in your AWS account.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # (Deprecated) Your AWS account ID, which you assigned to an external ID key in an IAM trust policy.
        # Amazon Pinpoint previously used this value to assume an IAM role when publishing event data, but we
        # removed this requirement. We don't recommend use of external IDs for IAM roles that are assumed by
        # Amazon Pinpoint.

        @[JSON::Field(key: "ExternalId")]
        getter external_id : String?

        # The date, in ISO 8601 format, when the event stream was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The IAM user who last modified the event stream.

        @[JSON::Field(key: "LastUpdatedBy")]
        getter last_updated_by : String?

        def initialize(
          @application_id : String,
          @destination_stream_arn : String,
          @role_arn : String,
          @external_id : String? = nil,
          @last_modified_date : String? = nil,
          @last_updated_by : String? = nil
        )
        end
      end

      # Specifies a batch of endpoints and events to process.

      struct EventsBatch
        include JSON::Serializable

        # A set of properties and attributes that are associated with the endpoint.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : Types::PublicEndpoint

        # A set of properties that are associated with the event.

        @[JSON::Field(key: "Events")]
        getter events : Hash(String, Types::Event)

        def initialize(
          @endpoint : Types::PublicEndpoint,
          @events : Hash(String, Types::Event)
        )
        end
      end

      # Specifies a batch of events to process.

      struct EventsRequest
        include JSON::Serializable

        # The batch of events to process. For each item in a batch, the endpoint ID acts as a key that has an
        # EventsBatch object as its value.

        @[JSON::Field(key: "BatchItem")]
        getter batch_item : Hash(String, Types::EventsBatch)

        def initialize(
          @batch_item : Hash(String, Types::EventsBatch)
        )
        end
      end

      # Provides information about endpoints and the events that they're associated with.

      struct EventsResponse
        include JSON::Serializable

        # A map that contains a multipart response for each endpoint. For each item in this object, the
        # endpoint ID is the key and the item response is the value. If no item response exists, the value can
        # also be one of the following: 202, the request was processed successfully; or 400, the payload
        # wasn't valid or required fields were missing.

        @[JSON::Field(key: "Results")]
        getter results : Hash(String, Types::ItemResponse)?

        def initialize(
          @results : Hash(String, Types::ItemResponse)? = nil
        )
        end
      end

      # Specifies the settings for a job that exports endpoint definitions to an Amazon Simple Storage
      # Service (Amazon S3) bucket.

      struct ExportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes
        # Amazon Pinpoint to access the Amazon S3 location where you want to export endpoint definitions to.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The URL of the location in an Amazon Simple Storage Service (Amazon S3) bucket where you want to
        # export endpoint definitions to. This location is typically a folder that contains multiple files.
        # The URL should be in the following format: s3:// bucket-name / folder-name /.

        @[JSON::Field(key: "S3UrlPrefix")]
        getter s3_url_prefix : String

        # The identifier for the segment to export endpoint definitions from. If you don't specify this value,
        # Amazon Pinpoint exports definitions for all the endpoints that are associated with the application.

        @[JSON::Field(key: "SegmentId")]
        getter segment_id : String?

        # The version of the segment to export endpoint definitions from, if specified.

        @[JSON::Field(key: "SegmentVersion")]
        getter segment_version : Int32?

        def initialize(
          @role_arn : String,
          @s3_url_prefix : String,
          @segment_id : String? = nil,
          @segment_version : Int32? = nil
        )
        end
      end

      # Provides information about the resource settings for a job that exports endpoint definitions to a
      # file. The file can be added directly to an Amazon Simple Storage Service (Amazon S3) bucket by using
      # the Amazon Pinpoint API or downloaded directly to a computer by using the Amazon Pinpoint console.

      struct ExportJobResource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorized
        # Amazon Pinpoint to access the Amazon S3 location where the endpoint definitions were exported to.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The URL of the location in an Amazon Simple Storage Service (Amazon S3) bucket where the endpoint
        # definitions were exported to. This location is typically a folder that contains multiple files. The
        # URL should be in the following format: s3:// bucket-name / folder-name /.

        @[JSON::Field(key: "S3UrlPrefix")]
        getter s3_url_prefix : String

        # The identifier for the segment that the endpoint definitions were exported from. If this value isn't
        # present, Amazon Pinpoint exported definitions for all the endpoints that are associated with the
        # application.

        @[JSON::Field(key: "SegmentId")]
        getter segment_id : String?

        # The version of the segment that the endpoint definitions were exported from.

        @[JSON::Field(key: "SegmentVersion")]
        getter segment_version : Int32?

        def initialize(
          @role_arn : String,
          @s3_url_prefix : String,
          @segment_id : String? = nil,
          @segment_version : Int32? = nil
        )
        end
      end

      # Provides information about the status and settings of a job that exports endpoint definitions to a
      # file. The file can be added directly to an Amazon Simple Storage Service (Amazon S3) bucket by using
      # the Amazon Pinpoint API or downloaded directly to a computer by using the Amazon Pinpoint console.

      struct ExportJobResponse
        include JSON::Serializable

        # The unique identifier for the application that's associated with the export job.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The date, in ISO 8601 format, when the export job was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The resource settings that apply to the export job.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::ExportJobResource

        # The unique identifier for the export job.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The status of the export job. The job status is FAILED if Amazon Pinpoint wasn't able to process one
        # or more pieces in the job.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String

        # The job type. This value is EXPORT for export jobs.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The number of pieces that were processed successfully (completed) by the export job, as of the time
        # of the request.

        @[JSON::Field(key: "CompletedPieces")]
        getter completed_pieces : Int32?

        # The date, in ISO 8601 format, when the export job was completed.

        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : String?

        # The number of pieces that weren't processed successfully (failed) by the export job, as of the time
        # of the request.

        @[JSON::Field(key: "FailedPieces")]
        getter failed_pieces : Int32?

        # An array of entries, one for each of the first 100 entries that weren't processed successfully
        # (failed) by the export job, if any.

        @[JSON::Field(key: "Failures")]
        getter failures : Array(String)?

        # The total number of endpoint definitions that weren't processed successfully (failed) by the export
        # job, typically because an error, such as a syntax error, occurred.

        @[JSON::Field(key: "TotalFailures")]
        getter total_failures : Int32?

        # The total number of pieces that must be processed to complete the export job. Each piece consists of
        # an approximately equal portion of the endpoint definitions that are part of the export job.

        @[JSON::Field(key: "TotalPieces")]
        getter total_pieces : Int32?

        # The total number of endpoint definitions that were processed by the export job.

        @[JSON::Field(key: "TotalProcessed")]
        getter total_processed : Int32?

        def initialize(
          @application_id : String,
          @creation_date : String,
          @definition : Types::ExportJobResource,
          @id : String,
          @job_status : String,
          @type : String,
          @completed_pieces : Int32? = nil,
          @completion_date : String? = nil,
          @failed_pieces : Int32? = nil,
          @failures : Array(String)? = nil,
          @total_failures : Int32? = nil,
          @total_pieces : Int32? = nil,
          @total_processed : Int32? = nil
        )
        end
      end

      # Provides information about all the export jobs that are associated with an application or segment.
      # An export job is a job that exports endpoint definitions to a file.

      struct ExportJobsResponse
        include JSON::Serializable

        # An array of responses, one for each export job that's associated with the application (Export Jobs
        # resource) or segment (Segment Export Jobs resource).

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::ExportJobResponse)

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null if there are no additional pages.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @item : Array(Types::ExportJobResponse),
          @next_token : String? = nil
        )
        end
      end

      # Provides information about an API request or response.

      struct ForbiddenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestID")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Specifies the status and settings of the GCM channel for an application. This channel enables Amazon
      # Pinpoint to send push notifications through the Firebase Cloud Messaging (FCM), formerly Google
      # Cloud Messaging (GCM), service.

      struct GCMChannelRequest
        include JSON::Serializable

        # The Web API Key, also referred to as an API_KEY or server key , that you received from Google to
        # communicate with Google services.

        @[JSON::Field(key: "ApiKey")]
        getter api_key : String?

        # The default authentication method used for GCM. Values are either "TOKEN" or "KEY". Defaults to
        # "KEY".

        @[JSON::Field(key: "DefaultAuthenticationMethod")]
        getter default_authentication_method : String?

        # Specifies whether to enable the GCM channel for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The contents of the JSON file provided by Google during registration in order to generate an access
        # token for authentication. For more information see Migrate from legacy FCM APIs to HTTP v1 .

        @[JSON::Field(key: "ServiceJson")]
        getter service_json : String?

        def initialize(
          @api_key : String? = nil,
          @default_authentication_method : String? = nil,
          @enabled : Bool? = nil,
          @service_json : String? = nil
        )
        end
      end

      # Provides information about the status and settings of the GCM channel for an application. The GCM
      # channel enables Amazon Pinpoint to send push notifications through the Firebase Cloud Messaging
      # (FCM), formerly Google Cloud Messaging (GCM), service.

      struct GCMChannelResponse
        include JSON::Serializable

        # The type of messaging or notification platform for the channel. For the GCM channel, this value is
        # GCM.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The unique identifier for the application that the GCM channel applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The date and time when the GCM channel was enabled.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # The Web API Key, also referred to as an API_KEY or server key , that you received from Google to
        # communicate with Google services.

        @[JSON::Field(key: "Credential")]
        getter credential : String?

        # The default authentication method used for GCM. Values are either "TOKEN" or "KEY". Defaults to
        # "KEY".

        @[JSON::Field(key: "DefaultAuthenticationMethod")]
        getter default_authentication_method : String?

        # Specifies whether the GCM channel is enabled for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # (Not used) This property is retained only for backward compatibility.

        @[JSON::Field(key: "HasCredential")]
        getter has_credential : Bool?

        # Returns true if the JSON file provided by Google during registration process was used in the
        # ServiceJson field of the request.

        @[JSON::Field(key: "HasFcmServiceCredentials")]
        getter has_fcm_service_credentials : Bool?

        # (Deprecated) An identifier for the GCM channel. This property is retained only for backward
        # compatibility.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Specifies whether the GCM channel is archived.

        @[JSON::Field(key: "IsArchived")]
        getter is_archived : Bool?

        # The user who last modified the GCM channel.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time when the GCM channel was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The current version of the GCM channel.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @platform : String,
          @application_id : String? = nil,
          @creation_date : String? = nil,
          @credential : String? = nil,
          @default_authentication_method : String? = nil,
          @enabled : Bool? = nil,
          @has_credential : Bool? = nil,
          @has_fcm_service_credentials : Bool? = nil,
          @id : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : String? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Specifies the settings for a one-time message that's sent directly to an endpoint through the GCM
      # channel. The GCM channel enables Amazon Pinpoint to send messages to the Firebase Cloud Messaging
      # (FCM), formerly Google Cloud Messaging (GCM), service.

      struct GCMMessage
        include JSON::Serializable

        # The action to occur if the recipient taps the push notification. Valid values are: OPEN_APP - Your
        # app opens or it becomes the foreground app if it was sent to the background. This is the default
        # action. DEEP_LINK - Your app opens and displays a designated user interface in the app. This action
        # uses the deep-linking features of the Android platform. URL - The default mobile browser on the
        # recipient's device opens and loads the web page at a URL that you specify.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The body of the notification message.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # An arbitrary string that identifies a group of messages that can be collapsed to ensure that only
        # the last message is sent when delivery can resume. This helps avoid sending too many instances of
        # the same messages when the recipient's device comes online again or becomes active. Amazon Pinpoint
        # specifies this value in the Firebase Cloud Messaging (FCM) collapse_key parameter when it sends the
        # notification message to FCM.

        @[JSON::Field(key: "CollapseKey")]
        getter collapse_key : String?

        # The JSON data payload to use for the push notification, if the notification is a silent push
        # notification. This payload is added to the data.pinpoint.jsonBody object of the notification.

        @[JSON::Field(key: "Data")]
        getter data : Hash(String, String)?

        # The icon image name of the asset saved in your app.

        @[JSON::Field(key: "IconReference")]
        getter icon_reference : String?

        # The URL of the large icon image to display in the content view of the push notification.

        @[JSON::Field(key: "ImageIconUrl")]
        getter image_icon_url : String?

        # The URL of an image to display in the push notification.

        @[JSON::Field(key: "ImageUrl")]
        getter image_url : String?

        # The preferred authentication method, with valid values "KEY" or "TOKEN". If a value isn't provided
        # then the DefaultAuthenticationMethod is used.

        @[JSON::Field(key: "PreferredAuthenticationMethod")]
        getter preferred_authentication_method : String?

        # para>normal - The notification might be delayed. Delivery is optimized for battery usage on the
        # recipient's device. Use this value unless immediate delivery is required. /listitem> high - The
        # notification is sent immediately and might wake a sleeping device. /para> Amazon Pinpoint specifies
        # this value in the FCM priority parameter when it sends the notification message to FCM. The
        # equivalent values for Apple Push Notification service (APNs) are 5, for normal, and 10, for high. If
        # you specify an APNs value for this property, Amazon Pinpoint accepts and converts the value to the
        # corresponding FCM value.

        @[JSON::Field(key: "Priority")]
        getter priority : String?

        # The raw, JSON-formatted string to use as the payload for the notification message. If specified,
        # this value overrides all other content for the message.

        @[JSON::Field(key: "RawContent")]
        getter raw_content : String?

        # The package name of the application where registration tokens must match in order for the recipient
        # to receive the message.

        @[JSON::Field(key: "RestrictedPackageName")]
        getter restricted_package_name : String?

        # Specifies whether the notification is a silent push notification, which is a push notification that
        # doesn't display on a recipient's device. Silent push notifications can be used for cases such as
        # updating an app's configuration or supporting phone home functionality.

        @[JSON::Field(key: "SilentPush")]
        getter silent_push : Bool?

        # The URL of the small icon image to display in the status bar and the content view of the push
        # notification.

        @[JSON::Field(key: "SmallImageIconUrl")]
        getter small_image_icon_url : String?

        # The sound to play when the recipient receives the push notification. You can use the default stream
        # or specify the file name of a sound resource that's bundled in your app. On an Android platform, the
        # sound file must reside in /res/raw/.

        @[JSON::Field(key: "Sound")]
        getter sound : String?

        # The default message variables to use in the notification message. You can override the default
        # variables with individual address variables.

        @[JSON::Field(key: "Substitutions")]
        getter substitutions : Hash(String, Array(String))?

        # The amount of time, in seconds, that FCM should store and attempt to deliver the push notification,
        # if the service is unable to deliver the notification the first time. If you don't specify this
        # value, FCM defaults to the maximum value, which is 2,419,200 seconds (28 days). Amazon Pinpoint
        # specifies this value in the FCM time_to_live parameter when it sends the notification message to
        # FCM.

        @[JSON::Field(key: "TimeToLive")]
        getter time_to_live : Int32?

        # The title to display above the notification message on the recipient's device.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # The URL to open in the recipient's default mobile browser, if a recipient taps the push notification
        # and the value of the Action property is URL.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @action : String? = nil,
          @body : String? = nil,
          @collapse_key : String? = nil,
          @data : Hash(String, String)? = nil,
          @icon_reference : String? = nil,
          @image_icon_url : String? = nil,
          @image_url : String? = nil,
          @preferred_authentication_method : String? = nil,
          @priority : String? = nil,
          @raw_content : String? = nil,
          @restricted_package_name : String? = nil,
          @silent_push : Bool? = nil,
          @small_image_icon_url : String? = nil,
          @sound : String? = nil,
          @substitutions : Hash(String, Array(String))? = nil,
          @time_to_live : Int32? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Specifies the GPS coordinates of a location.

      struct GPSCoordinates
        include JSON::Serializable

        # The latitude coordinate of the location.

        @[JSON::Field(key: "Latitude")]
        getter latitude : Float64

        # The longitude coordinate of the location.

        @[JSON::Field(key: "Longitude")]
        getter longitude : Float64

        def initialize(
          @latitude : Float64,
          @longitude : Float64
        )
        end
      end

      # Specifies GPS-based criteria for including or excluding endpoints from a segment.

      struct GPSPointDimension
        include JSON::Serializable

        # The GPS coordinates to measure distance from.

        @[JSON::Field(key: "Coordinates")]
        getter coordinates : Types::GPSCoordinates

        # The range, in kilometers, from the GPS coordinates.

        @[JSON::Field(key: "RangeInKilometers")]
        getter range_in_kilometers : Float64?

        def initialize(
          @coordinates : Types::GPSCoordinates,
          @range_in_kilometers : Float64? = nil
        )
        end
      end


      struct GetAdmChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetAdmChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "ADMChannelResponse")]
        getter adm_channel_response : Types::ADMChannelResponse

        def initialize(
          @adm_channel_response : Types::ADMChannelResponse
        )
        end
      end


      struct GetApnsChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetApnsChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "APNSChannelResponse")]
        getter apns_channel_response : Types::APNSChannelResponse

        def initialize(
          @apns_channel_response : Types::APNSChannelResponse
        )
        end
      end


      struct GetApnsSandboxChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetApnsSandboxChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "APNSSandboxChannelResponse")]
        getter apns_sandbox_channel_response : Types::APNSSandboxChannelResponse

        def initialize(
          @apns_sandbox_channel_response : Types::APNSSandboxChannelResponse
        )
        end
      end


      struct GetApnsVoipChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetApnsVoipChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "APNSVoipChannelResponse")]
        getter apns_voip_channel_response : Types::APNSVoipChannelResponse

        def initialize(
          @apns_voip_channel_response : Types::APNSVoipChannelResponse
        )
        end
      end


      struct GetApnsVoipSandboxChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetApnsVoipSandboxChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "APNSVoipSandboxChannelResponse")]
        getter apns_voip_sandbox_channel_response : Types::APNSVoipSandboxChannelResponse

        def initialize(
          @apns_voip_sandbox_channel_response : Types::APNSVoipSandboxChannelResponse
        )
        end
      end


      struct GetAppRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetAppResponse
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationResponse")]
        getter application_response : Types::ApplicationResponse

        def initialize(
          @application_response : Types::ApplicationResponse
        )
        end
      end


      struct GetApplicationDateRangeKpiRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "kpi-name")]
        getter kpi_name : String


        @[JSON::Field(key: "end-time")]
        getter end_time : Time?


        @[JSON::Field(key: "next-token")]
        getter next_token : String?


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "start-time")]
        getter start_time : Time?

        def initialize(
          @application_id : String,
          @kpi_name : String,
          @end_time : Time? = nil,
          @next_token : String? = nil,
          @page_size : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct GetApplicationDateRangeKpiResponse
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationDateRangeKpiResponse")]
        getter application_date_range_kpi_response : Types::ApplicationDateRangeKpiResponse

        def initialize(
          @application_date_range_kpi_response : Types::ApplicationDateRangeKpiResponse
        )
        end
      end


      struct GetApplicationSettingsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetApplicationSettingsResponse
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationSettingsResource")]
        getter application_settings_resource : Types::ApplicationSettingsResource

        def initialize(
          @application_settings_resource : Types::ApplicationSettingsResource
        )
        end
      end


      struct GetAppsRequest
        include JSON::Serializable


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetAppsResponse
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationsResponse")]
        getter applications_response : Types::ApplicationsResponse

        def initialize(
          @applications_response : Types::ApplicationsResponse
        )
        end
      end


      struct GetBaiduChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetBaiduChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "BaiduChannelResponse")]
        getter baidu_channel_response : Types::BaiduChannelResponse

        def initialize(
          @baidu_channel_response : Types::BaiduChannelResponse
        )
        end
      end


      struct GetCampaignActivitiesRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "campaign-id")]
        getter campaign_id : String


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @application_id : String,
          @campaign_id : String,
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetCampaignActivitiesResponse
        include JSON::Serializable


        @[JSON::Field(key: "ActivitiesResponse")]
        getter activities_response : Types::ActivitiesResponse

        def initialize(
          @activities_response : Types::ActivitiesResponse
        )
        end
      end


      struct GetCampaignDateRangeKpiRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "campaign-id")]
        getter campaign_id : String


        @[JSON::Field(key: "kpi-name")]
        getter kpi_name : String


        @[JSON::Field(key: "end-time")]
        getter end_time : Time?


        @[JSON::Field(key: "next-token")]
        getter next_token : String?


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "start-time")]
        getter start_time : Time?

        def initialize(
          @application_id : String,
          @campaign_id : String,
          @kpi_name : String,
          @end_time : Time? = nil,
          @next_token : String? = nil,
          @page_size : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct GetCampaignDateRangeKpiResponse
        include JSON::Serializable


        @[JSON::Field(key: "CampaignDateRangeKpiResponse")]
        getter campaign_date_range_kpi_response : Types::CampaignDateRangeKpiResponse

        def initialize(
          @campaign_date_range_kpi_response : Types::CampaignDateRangeKpiResponse
        )
        end
      end


      struct GetCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "campaign-id")]
        getter campaign_id : String

        def initialize(
          @application_id : String,
          @campaign_id : String
        )
        end
      end


      struct GetCampaignResponse
        include JSON::Serializable


        @[JSON::Field(key: "CampaignResponse")]
        getter campaign_response : Types::CampaignResponse

        def initialize(
          @campaign_response : Types::CampaignResponse
        )
        end
      end


      struct GetCampaignVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "campaign-id")]
        getter campaign_id : String


        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @application_id : String,
          @campaign_id : String,
          @version : String
        )
        end
      end


      struct GetCampaignVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "CampaignResponse")]
        getter campaign_response : Types::CampaignResponse

        def initialize(
          @campaign_response : Types::CampaignResponse
        )
        end
      end


      struct GetCampaignVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "campaign-id")]
        getter campaign_id : String


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @application_id : String,
          @campaign_id : String,
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetCampaignVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "CampaignsResponse")]
        getter campaigns_response : Types::CampaignsResponse

        def initialize(
          @campaigns_response : Types::CampaignsResponse
        )
        end
      end


      struct GetCampaignsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @application_id : String,
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetCampaignsResponse
        include JSON::Serializable


        @[JSON::Field(key: "CampaignsResponse")]
        getter campaigns_response : Types::CampaignsResponse

        def initialize(
          @campaigns_response : Types::CampaignsResponse
        )
        end
      end


      struct GetChannelsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetChannelsResponse
        include JSON::Serializable


        @[JSON::Field(key: "ChannelsResponse")]
        getter channels_response : Types::ChannelsResponse

        def initialize(
          @channels_response : Types::ChannelsResponse
        )
        end
      end


      struct GetEmailChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetEmailChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "EmailChannelResponse")]
        getter email_channel_response : Types::EmailChannelResponse

        def initialize(
          @email_channel_response : Types::EmailChannelResponse
        )
        end
      end


      struct GetEmailTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @template_name : String,
          @version : String? = nil
        )
        end
      end


      struct GetEmailTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "EmailTemplateResponse")]
        getter email_template_response : Types::EmailTemplateResponse

        def initialize(
          @email_template_response : Types::EmailTemplateResponse
        )
        end
      end


      struct GetEndpointRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "endpoint-id")]
        getter endpoint_id : String

        def initialize(
          @application_id : String,
          @endpoint_id : String
        )
        end
      end


      struct GetEndpointResponse
        include JSON::Serializable


        @[JSON::Field(key: "EndpointResponse")]
        getter endpoint_response : Types::EndpointResponse

        def initialize(
          @endpoint_response : Types::EndpointResponse
        )
        end
      end


      struct GetEventStreamRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetEventStreamResponse
        include JSON::Serializable


        @[JSON::Field(key: "EventStream")]
        getter event_stream : Types::EventStream

        def initialize(
          @event_stream : Types::EventStream
        )
        end
      end


      struct GetExportJobRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "job-id")]
        getter job_id : String

        def initialize(
          @application_id : String,
          @job_id : String
        )
        end
      end


      struct GetExportJobResponse
        include JSON::Serializable


        @[JSON::Field(key: "ExportJobResponse")]
        getter export_job_response : Types::ExportJobResponse

        def initialize(
          @export_job_response : Types::ExportJobResponse
        )
        end
      end


      struct GetExportJobsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @application_id : String,
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetExportJobsResponse
        include JSON::Serializable


        @[JSON::Field(key: "ExportJobsResponse")]
        getter export_jobs_response : Types::ExportJobsResponse

        def initialize(
          @export_jobs_response : Types::ExportJobsResponse
        )
        end
      end


      struct GetGcmChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetGcmChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "GCMChannelResponse")]
        getter gcm_channel_response : Types::GCMChannelResponse

        def initialize(
          @gcm_channel_response : Types::GCMChannelResponse
        )
        end
      end


      struct GetImportJobRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "job-id")]
        getter job_id : String

        def initialize(
          @application_id : String,
          @job_id : String
        )
        end
      end


      struct GetImportJobResponse
        include JSON::Serializable


        @[JSON::Field(key: "ImportJobResponse")]
        getter import_job_response : Types::ImportJobResponse

        def initialize(
          @import_job_response : Types::ImportJobResponse
        )
        end
      end


      struct GetImportJobsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @application_id : String,
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetImportJobsResponse
        include JSON::Serializable


        @[JSON::Field(key: "ImportJobsResponse")]
        getter import_jobs_response : Types::ImportJobsResponse

        def initialize(
          @import_jobs_response : Types::ImportJobsResponse
        )
        end
      end


      struct GetInAppMessagesRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "endpoint-id")]
        getter endpoint_id : String

        def initialize(
          @application_id : String,
          @endpoint_id : String
        )
        end
      end


      struct GetInAppMessagesResponse
        include JSON::Serializable


        @[JSON::Field(key: "InAppMessagesResponse")]
        getter in_app_messages_response : Types::InAppMessagesResponse

        def initialize(
          @in_app_messages_response : Types::InAppMessagesResponse
        )
        end
      end


      struct GetInAppTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @template_name : String,
          @version : String? = nil
        )
        end
      end


      struct GetInAppTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "InAppTemplateResponse")]
        getter in_app_template_response : Types::InAppTemplateResponse

        def initialize(
          @in_app_template_response : Types::InAppTemplateResponse
        )
        end
      end


      struct GetJourneyDateRangeKpiRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "journey-id")]
        getter journey_id : String


        @[JSON::Field(key: "kpi-name")]
        getter kpi_name : String


        @[JSON::Field(key: "end-time")]
        getter end_time : Time?


        @[JSON::Field(key: "next-token")]
        getter next_token : String?


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "start-time")]
        getter start_time : Time?

        def initialize(
          @application_id : String,
          @journey_id : String,
          @kpi_name : String,
          @end_time : Time? = nil,
          @next_token : String? = nil,
          @page_size : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct GetJourneyDateRangeKpiResponse
        include JSON::Serializable


        @[JSON::Field(key: "JourneyDateRangeKpiResponse")]
        getter journey_date_range_kpi_response : Types::JourneyDateRangeKpiResponse

        def initialize(
          @journey_date_range_kpi_response : Types::JourneyDateRangeKpiResponse
        )
        end
      end


      struct GetJourneyExecutionActivityMetricsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "journey-activity-id")]
        getter journey_activity_id : String


        @[JSON::Field(key: "journey-id")]
        getter journey_id : String


        @[JSON::Field(key: "next-token")]
        getter next_token : String?


        @[JSON::Field(key: "page-size")]
        getter page_size : String?

        def initialize(
          @application_id : String,
          @journey_activity_id : String,
          @journey_id : String,
          @next_token : String? = nil,
          @page_size : String? = nil
        )
        end
      end


      struct GetJourneyExecutionActivityMetricsResponse
        include JSON::Serializable


        @[JSON::Field(key: "JourneyExecutionActivityMetricsResponse")]
        getter journey_execution_activity_metrics_response : Types::JourneyExecutionActivityMetricsResponse

        def initialize(
          @journey_execution_activity_metrics_response : Types::JourneyExecutionActivityMetricsResponse
        )
        end
      end


      struct GetJourneyExecutionMetricsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "journey-id")]
        getter journey_id : String


        @[JSON::Field(key: "next-token")]
        getter next_token : String?


        @[JSON::Field(key: "page-size")]
        getter page_size : String?

        def initialize(
          @application_id : String,
          @journey_id : String,
          @next_token : String? = nil,
          @page_size : String? = nil
        )
        end
      end


      struct GetJourneyExecutionMetricsResponse
        include JSON::Serializable


        @[JSON::Field(key: "JourneyExecutionMetricsResponse")]
        getter journey_execution_metrics_response : Types::JourneyExecutionMetricsResponse

        def initialize(
          @journey_execution_metrics_response : Types::JourneyExecutionMetricsResponse
        )
        end
      end


      struct GetJourneyRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "journey-id")]
        getter journey_id : String

        def initialize(
          @application_id : String,
          @journey_id : String
        )
        end
      end


      struct GetJourneyResponse
        include JSON::Serializable


        @[JSON::Field(key: "JourneyResponse")]
        getter journey_response : Types::JourneyResponse

        def initialize(
          @journey_response : Types::JourneyResponse
        )
        end
      end


      struct GetJourneyRunExecutionActivityMetricsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "journey-activity-id")]
        getter journey_activity_id : String


        @[JSON::Field(key: "journey-id")]
        getter journey_id : String


        @[JSON::Field(key: "run-id")]
        getter run_id : String


        @[JSON::Field(key: "next-token")]
        getter next_token : String?


        @[JSON::Field(key: "page-size")]
        getter page_size : String?

        def initialize(
          @application_id : String,
          @journey_activity_id : String,
          @journey_id : String,
          @run_id : String,
          @next_token : String? = nil,
          @page_size : String? = nil
        )
        end
      end


      struct GetJourneyRunExecutionActivityMetricsResponse
        include JSON::Serializable


        @[JSON::Field(key: "JourneyRunExecutionActivityMetricsResponse")]
        getter journey_run_execution_activity_metrics_response : Types::JourneyRunExecutionActivityMetricsResponse

        def initialize(
          @journey_run_execution_activity_metrics_response : Types::JourneyRunExecutionActivityMetricsResponse
        )
        end
      end


      struct GetJourneyRunExecutionMetricsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "journey-id")]
        getter journey_id : String


        @[JSON::Field(key: "run-id")]
        getter run_id : String


        @[JSON::Field(key: "next-token")]
        getter next_token : String?


        @[JSON::Field(key: "page-size")]
        getter page_size : String?

        def initialize(
          @application_id : String,
          @journey_id : String,
          @run_id : String,
          @next_token : String? = nil,
          @page_size : String? = nil
        )
        end
      end


      struct GetJourneyRunExecutionMetricsResponse
        include JSON::Serializable


        @[JSON::Field(key: "JourneyRunExecutionMetricsResponse")]
        getter journey_run_execution_metrics_response : Types::JourneyRunExecutionMetricsResponse

        def initialize(
          @journey_run_execution_metrics_response : Types::JourneyRunExecutionMetricsResponse
        )
        end
      end


      struct GetJourneyRunsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "journey-id")]
        getter journey_id : String


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @application_id : String,
          @journey_id : String,
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetJourneyRunsResponse
        include JSON::Serializable


        @[JSON::Field(key: "JourneyRunsResponse")]
        getter journey_runs_response : Types::JourneyRunsResponse

        def initialize(
          @journey_runs_response : Types::JourneyRunsResponse
        )
        end
      end


      struct GetPushTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @template_name : String,
          @version : String? = nil
        )
        end
      end


      struct GetPushTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "PushNotificationTemplateResponse")]
        getter push_notification_template_response : Types::PushNotificationTemplateResponse

        def initialize(
          @push_notification_template_response : Types::PushNotificationTemplateResponse
        )
        end
      end


      struct GetRecommenderConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "recommender-id")]
        getter recommender_id : String

        def initialize(
          @recommender_id : String
        )
        end
      end


      struct GetRecommenderConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "RecommenderConfigurationResponse")]
        getter recommender_configuration_response : Types::RecommenderConfigurationResponse

        def initialize(
          @recommender_configuration_response : Types::RecommenderConfigurationResponse
        )
        end
      end


      struct GetRecommenderConfigurationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetRecommenderConfigurationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "ListRecommenderConfigurationsResponse")]
        getter list_recommender_configurations_response : Types::ListRecommenderConfigurationsResponse

        def initialize(
          @list_recommender_configurations_response : Types::ListRecommenderConfigurationsResponse
        )
        end
      end


      struct GetSegmentExportJobsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "segment-id")]
        getter segment_id : String


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @application_id : String,
          @segment_id : String,
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetSegmentExportJobsResponse
        include JSON::Serializable


        @[JSON::Field(key: "ExportJobsResponse")]
        getter export_jobs_response : Types::ExportJobsResponse

        def initialize(
          @export_jobs_response : Types::ExportJobsResponse
        )
        end
      end


      struct GetSegmentImportJobsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "segment-id")]
        getter segment_id : String


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @application_id : String,
          @segment_id : String,
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetSegmentImportJobsResponse
        include JSON::Serializable


        @[JSON::Field(key: "ImportJobsResponse")]
        getter import_jobs_response : Types::ImportJobsResponse

        def initialize(
          @import_jobs_response : Types::ImportJobsResponse
        )
        end
      end


      struct GetSegmentRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "segment-id")]
        getter segment_id : String

        def initialize(
          @application_id : String,
          @segment_id : String
        )
        end
      end


      struct GetSegmentResponse
        include JSON::Serializable


        @[JSON::Field(key: "SegmentResponse")]
        getter segment_response : Types::SegmentResponse

        def initialize(
          @segment_response : Types::SegmentResponse
        )
        end
      end


      struct GetSegmentVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "segment-id")]
        getter segment_id : String


        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @application_id : String,
          @segment_id : String,
          @version : String
        )
        end
      end


      struct GetSegmentVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "SegmentResponse")]
        getter segment_response : Types::SegmentResponse

        def initialize(
          @segment_response : Types::SegmentResponse
        )
        end
      end


      struct GetSegmentVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "segment-id")]
        getter segment_id : String


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @application_id : String,
          @segment_id : String,
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetSegmentVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "SegmentsResponse")]
        getter segments_response : Types::SegmentsResponse

        def initialize(
          @segments_response : Types::SegmentsResponse
        )
        end
      end


      struct GetSegmentsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @application_id : String,
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetSegmentsResponse
        include JSON::Serializable


        @[JSON::Field(key: "SegmentsResponse")]
        getter segments_response : Types::SegmentsResponse

        def initialize(
          @segments_response : Types::SegmentsResponse
        )
        end
      end


      struct GetSmsChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetSmsChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "SMSChannelResponse")]
        getter sms_channel_response : Types::SMSChannelResponse

        def initialize(
          @sms_channel_response : Types::SMSChannelResponse
        )
        end
      end


      struct GetSmsTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @template_name : String,
          @version : String? = nil
        )
        end
      end


      struct GetSmsTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "SMSTemplateResponse")]
        getter sms_template_response : Types::SMSTemplateResponse

        def initialize(
          @sms_template_response : Types::SMSTemplateResponse
        )
        end
      end


      struct GetUserEndpointsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "user-id")]
        getter user_id : String

        def initialize(
          @application_id : String,
          @user_id : String
        )
        end
      end


      struct GetUserEndpointsResponse
        include JSON::Serializable


        @[JSON::Field(key: "EndpointsResponse")]
        getter endpoints_response : Types::EndpointsResponse

        def initialize(
          @endpoints_response : Types::EndpointsResponse
        )
        end
      end


      struct GetVoiceChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetVoiceChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "VoiceChannelResponse")]
        getter voice_channel_response : Types::VoiceChannelResponse

        def initialize(
          @voice_channel_response : Types::VoiceChannelResponse
        )
        end
      end


      struct GetVoiceTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @template_name : String,
          @version : String? = nil
        )
        end
      end


      struct GetVoiceTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "VoiceTemplateResponse")]
        getter voice_template_response : Types::VoiceTemplateResponse

        def initialize(
          @voice_template_response : Types::VoiceTemplateResponse
        )
        end
      end

      # Specifies the settings for a holdout activity in a journey. This type of activity stops a journey
      # for a specified percentage of participants.

      struct HoldoutActivity
        include JSON::Serializable

        # The percentage of participants who shouldn't continue the journey. To determine which participants
        # are held out, Amazon Pinpoint applies a probability-based algorithm to the percentage that you
        # specify. Therefore, the actual percentage of participants who are held out may not be equal to the
        # percentage that you specify.

        @[JSON::Field(key: "Percentage")]
        getter percentage : Int32

        # The unique identifier for the next activity to perform, after performing the holdout activity.

        @[JSON::Field(key: "NextActivity")]
        getter next_activity : String?

        def initialize(
          @percentage : Int32,
          @next_activity : String? = nil
        )
        end
      end

      # Specifies the settings for a job that imports endpoint definitions from an Amazon Simple Storage
      # Service (Amazon S3) bucket.

      struct ImportJobRequest
        include JSON::Serializable

        # The format of the files that contain the endpoint definitions to import. Valid values are: CSV, for
        # comma-separated values format; and, JSON, for newline-delimited JSON format. If the Amazon S3
        # location stores multiple files that use different formats, Amazon Pinpoint imports data only from
        # the files that use the specified format.

        @[JSON::Field(key: "Format")]
        getter format : String

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes
        # Amazon Pinpoint to access the Amazon S3 location to import endpoint definitions from.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The URL of the Amazon Simple Storage Service (Amazon S3) bucket that contains the endpoint
        # definitions to import. This location can be a folder or a single file. If the location is a folder,
        # Amazon Pinpoint imports endpoint definitions from the files in this location, including any
        # subfolders that the folder contains. The URL should be in the following format: s3:// bucket-name /
        # folder-name / file-name . The location can end with the key for an individual object or a prefix
        # that qualifies multiple objects.

        @[JSON::Field(key: "S3Url")]
        getter s3_url : String

        # Specifies whether to create a segment that contains the endpoints, when the endpoint definitions are
        # imported.

        @[JSON::Field(key: "DefineSegment")]
        getter define_segment : Bool?

        # (Deprecated) Your AWS account ID, which you assigned to an external ID key in an IAM trust policy.
        # Amazon Pinpoint previously used this value to assume an IAM role when importing endpoint
        # definitions, but we removed this requirement. We don't recommend use of external IDs for IAM roles
        # that are assumed by Amazon Pinpoint.

        @[JSON::Field(key: "ExternalId")]
        getter external_id : String?

        # Specifies whether to register the endpoints with Amazon Pinpoint, when the endpoint definitions are
        # imported.

        @[JSON::Field(key: "RegisterEndpoints")]
        getter register_endpoints : Bool?

        # The identifier for the segment to update or add the imported endpoint definitions to, if the import
        # job is meant to update an existing segment.

        @[JSON::Field(key: "SegmentId")]
        getter segment_id : String?

        # A custom name for the segment that's created by the import job, if the value of the DefineSegment
        # property is true.

        @[JSON::Field(key: "SegmentName")]
        getter segment_name : String?

        def initialize(
          @format : String,
          @role_arn : String,
          @s3_url : String,
          @define_segment : Bool? = nil,
          @external_id : String? = nil,
          @register_endpoints : Bool? = nil,
          @segment_id : String? = nil,
          @segment_name : String? = nil
        )
        end
      end

      # Provides information about the resource settings for a job that imports endpoint definitions from
      # one or more files. The files can be stored in an Amazon Simple Storage Service (Amazon S3) bucket or
      # uploaded directly from a computer by using the Amazon Pinpoint console.

      struct ImportJobResource
        include JSON::Serializable

        # The format of the files that contain the endpoint definitions to import. Valid values are: CSV, for
        # comma-separated values format; and, JSON, for newline-delimited JSON format. If the files are stored
        # in an Amazon S3 location and that location contains multiple files that use different formats,
        # Amazon Pinpoint imports data only from the files that use the specified format.

        @[JSON::Field(key: "Format")]
        getter format : String

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes
        # Amazon Pinpoint to access the Amazon S3 location to import endpoint definitions from.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The URL of the Amazon Simple Storage Service (Amazon S3) bucket that contains the endpoint
        # definitions to import. This location can be a folder or a single file. If the location is a folder,
        # Amazon Pinpoint imports endpoint definitions from the files in this location, including any
        # subfolders that the folder contains. The URL should be in the following format: s3:// bucket-name /
        # folder-name / file-name . The location can end with the key for an individual object or a prefix
        # that qualifies multiple objects.

        @[JSON::Field(key: "S3Url")]
        getter s3_url : String

        # Specifies whether the import job creates a segment that contains the endpoints, when the endpoint
        # definitions are imported.

        @[JSON::Field(key: "DefineSegment")]
        getter define_segment : Bool?

        # (Deprecated) Your AWS account ID, which you assigned to an external ID key in an IAM trust policy.
        # Amazon Pinpoint previously used this value to assume an IAM role when importing endpoint
        # definitions, but we removed this requirement. We don't recommend use of external IDs for IAM roles
        # that are assumed by Amazon Pinpoint.

        @[JSON::Field(key: "ExternalId")]
        getter external_id : String?

        # Specifies whether the import job registers the endpoints with Amazon Pinpoint, when the endpoint
        # definitions are imported.

        @[JSON::Field(key: "RegisterEndpoints")]
        getter register_endpoints : Bool?

        # The identifier for the segment that the import job updates or adds endpoint definitions to, if the
        # import job updates an existing segment.

        @[JSON::Field(key: "SegmentId")]
        getter segment_id : String?

        # The custom name for the segment that's created by the import job, if the value of the DefineSegment
        # property is true.

        @[JSON::Field(key: "SegmentName")]
        getter segment_name : String?

        def initialize(
          @format : String,
          @role_arn : String,
          @s3_url : String,
          @define_segment : Bool? = nil,
          @external_id : String? = nil,
          @register_endpoints : Bool? = nil,
          @segment_id : String? = nil,
          @segment_name : String? = nil
        )
        end
      end

      # Provides information about the status and settings of a job that imports endpoint definitions from
      # one or more files. The files can be stored in an Amazon Simple Storage Service (Amazon S3) bucket or
      # uploaded directly from a computer by using the Amazon Pinpoint console.

      struct ImportJobResponse
        include JSON::Serializable

        # The unique identifier for the application that's associated with the import job.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The date, in ISO 8601 format, when the import job was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The resource settings that apply to the import job.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::ImportJobResource

        # The unique identifier for the import job.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The status of the import job. The job status is FAILED if Amazon Pinpoint wasn't able to process one
        # or more pieces in the job.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String

        # The job type. This value is IMPORT for import jobs.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The number of pieces that were processed successfully (completed) by the import job, as of the time
        # of the request.

        @[JSON::Field(key: "CompletedPieces")]
        getter completed_pieces : Int32?

        # The date, in ISO 8601 format, when the import job was completed.

        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : String?

        # The number of pieces that weren't processed successfully (failed) by the import job, as of the time
        # of the request.

        @[JSON::Field(key: "FailedPieces")]
        getter failed_pieces : Int32?

        # An array of entries, one for each of the first 100 entries that weren't processed successfully
        # (failed) by the import job, if any.

        @[JSON::Field(key: "Failures")]
        getter failures : Array(String)?

        # The total number of endpoint definitions that weren't processed successfully (failed) by the import
        # job, typically because an error, such as a syntax error, occurred.

        @[JSON::Field(key: "TotalFailures")]
        getter total_failures : Int32?

        # The total number of pieces that must be processed to complete the import job. Each piece consists of
        # an approximately equal portion of the endpoint definitions that are part of the import job.

        @[JSON::Field(key: "TotalPieces")]
        getter total_pieces : Int32?

        # The total number of endpoint definitions that were processed by the import job.

        @[JSON::Field(key: "TotalProcessed")]
        getter total_processed : Int32?

        def initialize(
          @application_id : String,
          @creation_date : String,
          @definition : Types::ImportJobResource,
          @id : String,
          @job_status : String,
          @type : String,
          @completed_pieces : Int32? = nil,
          @completion_date : String? = nil,
          @failed_pieces : Int32? = nil,
          @failures : Array(String)? = nil,
          @total_failures : Int32? = nil,
          @total_pieces : Int32? = nil,
          @total_processed : Int32? = nil
        )
        end
      end

      # Provides information about the status and settings of all the import jobs that are associated with
      # an application or segment. An import job is a job that imports endpoint definitions from one or more
      # files.

      struct ImportJobsResponse
        include JSON::Serializable

        # An array of responses, one for each import job that's associated with the application (Import Jobs
        # resource) or segment (Segment Import Jobs resource).

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::ImportJobResponse)

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null if there are no additional pages.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @item : Array(Types::ImportJobResponse),
          @next_token : String? = nil
        )
        end
      end


      struct InAppCampaignSchedule
        include JSON::Serializable

        # The scheduled time after which the in-app message should not be shown. Timestamp is in ISO 8601
        # format.

        @[JSON::Field(key: "EndDate")]
        getter end_date : String?

        # The event filter the SDK has to use to show the in-app message in the application.

        @[JSON::Field(key: "EventFilter")]
        getter event_filter : Types::CampaignEventFilter?

        # Time during which the in-app message should not be shown to the user.

        @[JSON::Field(key: "QuietTime")]
        getter quiet_time : Types::QuietTime?

        def initialize(
          @end_date : String? = nil,
          @event_filter : Types::CampaignEventFilter? = nil,
          @quiet_time : Types::QuietTime? = nil
        )
        end
      end

      # Provides all fields required for building an in-app message.

      struct InAppMessage
        include JSON::Serializable

        # In-app message content.

        @[JSON::Field(key: "Content")]
        getter content : Array(Types::InAppMessageContent)?

        # Custom config to be sent to SDK.

        @[JSON::Field(key: "CustomConfig")]
        getter custom_config : Hash(String, String)?

        # The layout of the message.

        @[JSON::Field(key: "Layout")]
        getter layout : String?

        def initialize(
          @content : Array(Types::InAppMessageContent)? = nil,
          @custom_config : Hash(String, String)? = nil,
          @layout : String? = nil
        )
        end
      end

      # Text config for Message Body.

      struct InAppMessageBodyConfig
        include JSON::Serializable

        # The alignment of the text. Valid values: LEFT, CENTER, RIGHT.

        @[JSON::Field(key: "Alignment")]
        getter alignment : String

        # Message Body.

        @[JSON::Field(key: "Body")]
        getter body : String

        # The text color.

        @[JSON::Field(key: "TextColor")]
        getter text_color : String

        def initialize(
          @alignment : String,
          @body : String,
          @text_color : String
        )
        end
      end

      # Button Config for an in-app message.

      struct InAppMessageButton
        include JSON::Serializable

        # Default button content.

        @[JSON::Field(key: "Android")]
        getter android : Types::OverrideButtonConfiguration?

        # Default button content.

        @[JSON::Field(key: "DefaultConfig")]
        getter default_config : Types::DefaultButtonConfiguration?

        # Default button content.

        @[JSON::Field(key: "IOS")]
        getter ios : Types::OverrideButtonConfiguration?

        # Default button content.

        @[JSON::Field(key: "Web")]
        getter web : Types::OverrideButtonConfiguration?

        def initialize(
          @android : Types::OverrideButtonConfiguration? = nil,
          @default_config : Types::DefaultButtonConfiguration? = nil,
          @ios : Types::OverrideButtonConfiguration? = nil,
          @web : Types::OverrideButtonConfiguration? = nil
        )
        end
      end


      struct InAppMessageCampaign
        include JSON::Serializable

        # Campaign id of the corresponding campaign.

        @[JSON::Field(key: "CampaignId")]
        getter campaign_id : String?

        # Daily cap which controls the number of times any in-app messages can be shown to the endpoint during
        # a day.

        @[JSON::Field(key: "DailyCap")]
        getter daily_cap : Int32?

        # In-app message content with all fields required for rendering an in-app message.

        @[JSON::Field(key: "InAppMessage")]
        getter in_app_message : Types::InAppMessage?

        # Priority of the in-app message.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # Schedule of the campaign.

        @[JSON::Field(key: "Schedule")]
        getter schedule : Types::InAppCampaignSchedule?

        # Session cap which controls the number of times an in-app message can be shown to the endpoint during
        # an application session.

        @[JSON::Field(key: "SessionCap")]
        getter session_cap : Int32?

        # Total cap which controls the number of times an in-app message can be shown to the endpoint.

        @[JSON::Field(key: "TotalCap")]
        getter total_cap : Int32?

        # Treatment id of the campaign.

        @[JSON::Field(key: "TreatmentId")]
        getter treatment_id : String?

        def initialize(
          @campaign_id : String? = nil,
          @daily_cap : Int32? = nil,
          @in_app_message : Types::InAppMessage? = nil,
          @priority : Int32? = nil,
          @schedule : Types::InAppCampaignSchedule? = nil,
          @session_cap : Int32? = nil,
          @total_cap : Int32? = nil,
          @treatment_id : String? = nil
        )
        end
      end

      # The configuration for the message content.

      struct InAppMessageContent
        include JSON::Serializable

        # The background color for the message.

        @[JSON::Field(key: "BackgroundColor")]
        getter background_color : String?

        # The configuration for the message body.

        @[JSON::Field(key: "BodyConfig")]
        getter body_config : Types::InAppMessageBodyConfig?

        # The configuration for the message header.

        @[JSON::Field(key: "HeaderConfig")]
        getter header_config : Types::InAppMessageHeaderConfig?

        # The image url for the background of message.

        @[JSON::Field(key: "ImageUrl")]
        getter image_url : String?

        # The first button inside the message.

        @[JSON::Field(key: "PrimaryBtn")]
        getter primary_btn : Types::InAppMessageButton?

        # The second button inside message.

        @[JSON::Field(key: "SecondaryBtn")]
        getter secondary_btn : Types::InAppMessageButton?

        def initialize(
          @background_color : String? = nil,
          @body_config : Types::InAppMessageBodyConfig? = nil,
          @header_config : Types::InAppMessageHeaderConfig? = nil,
          @image_url : String? = nil,
          @primary_btn : Types::InAppMessageButton? = nil,
          @secondary_btn : Types::InAppMessageButton? = nil
        )
        end
      end

      # Text config for Message Header.

      struct InAppMessageHeaderConfig
        include JSON::Serializable

        # The alignment of the text. Valid values: LEFT, CENTER, RIGHT.

        @[JSON::Field(key: "Alignment")]
        getter alignment : String

        # Message Header.

        @[JSON::Field(key: "Header")]
        getter header : String

        # The text color.

        @[JSON::Field(key: "TextColor")]
        getter text_color : String

        def initialize(
          @alignment : String,
          @header : String,
          @text_color : String
        )
        end
      end

      # Get in-app messages response object.

      struct InAppMessagesResponse
        include JSON::Serializable

        # List of targeted in-app message campaigns.

        @[JSON::Field(key: "InAppMessageCampaigns")]
        getter in_app_message_campaigns : Array(Types::InAppMessageCampaign)?

        def initialize(
          @in_app_message_campaigns : Array(Types::InAppMessageCampaign)? = nil
        )
        end
      end

      # In-App Template Request.

      struct InAppTemplateRequest
        include JSON::Serializable

        # The content of the message, can include up to 5 modals. Each modal must contain a message, a header,
        # and background color. ImageUrl and buttons are optional.

        @[JSON::Field(key: "Content")]
        getter content : Array(Types::InAppMessageContent)?

        # Custom config to be sent to client.

        @[JSON::Field(key: "CustomConfig")]
        getter custom_config : Hash(String, String)?

        # The layout of the message.

        @[JSON::Field(key: "Layout")]
        getter layout : String?

        # The description of the template.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        # As of 22-05-2023 tags has been deprecated for update operations. After this date any value in tags
        # is not processed and an error code is not returned. To manage tags we recommend using either Tags in
        # the API Reference for Amazon Pinpoint , resourcegroupstaggingapi commands in the AWS Command Line
        # Interface Documentation or resourcegroupstaggingapi in the AWS SDK . (Deprecated) A string-to-string
        # map of key-value pairs that defines the tags to associate with the message template. Each tag
        # consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content : Array(Types::InAppMessageContent)? = nil,
          @custom_config : Hash(String, String)? = nil,
          @layout : String? = nil,
          @template_description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # In-App Template Response.

      struct InAppTemplateResponse
        include JSON::Serializable

        # The creation date of the template.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The last modified date of the template.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String

        # The name of the template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # The type of channel that the message template is designed for. For an in-app message template, this
        # value is INAPP.

        @[JSON::Field(key: "TemplateType")]
        getter template_type : String

        # The resource arn of the template.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The content of the message, can include up to 5 modals. Each modal must contain a message, a header,
        # and background color. ImageUrl and buttons are optional.

        @[JSON::Field(key: "Content")]
        getter content : Array(Types::InAppMessageContent)?

        # Custom config to be sent to client.

        @[JSON::Field(key: "CustomConfig")]
        getter custom_config : Hash(String, String)?

        # The layout of the message.

        @[JSON::Field(key: "Layout")]
        getter layout : String?

        # The description of the template.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        # The version id of the template.

        @[JSON::Field(key: "Version")]
        getter version : String?

        # Tags map that contains arn and InternalId for API GW.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @creation_date : String,
          @last_modified_date : String,
          @template_name : String,
          @template_type : String,
          @arn : String? = nil,
          @content : Array(Types::InAppMessageContent)? = nil,
          @custom_config : Hash(String, String)? = nil,
          @layout : String? = nil,
          @template_description : String? = nil,
          @version : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about an API request or response.

      struct InternalServerErrorException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestID")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Provides information about the results of a request to create or update an endpoint that's
      # associated with an event.

      struct ItemResponse
        include JSON::Serializable

        # The response that was received after the endpoint data was accepted.

        @[JSON::Field(key: "EndpointItemResponse")]
        getter endpoint_item_response : Types::EndpointItemResponse?

        # A multipart response object that contains a key and a value for each event in the request. In each
        # object, the event ID is the key and an EventItemResponse object is the value.

        @[JSON::Field(key: "EventsItemResponse")]
        getter events_item_response : Hash(String, Types::EventItemResponse)?

        def initialize(
          @endpoint_item_response : Types::EndpointItemResponse? = nil,
          @events_item_response : Hash(String, Types::EventItemResponse)? = nil
        )
        end
      end

      # The channel-specific configurations for the journey.

      struct JourneyChannelSettings
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Connect Campaign.

        @[JSON::Field(key: "ConnectCampaignArn")]
        getter connect_campaign_arn : String?

        # IAM role ARN to be assumed when invoking Connect campaign execution APIs for dialing.

        @[JSON::Field(key: "ConnectCampaignExecutionRoleArn")]
        getter connect_campaign_execution_role_arn : String?

        def initialize(
          @connect_campaign_arn : String? = nil,
          @connect_campaign_execution_role_arn : String? = nil
        )
        end
      end

      # Specifies the message content for a custom channel message that's sent to participants in a journey.

      struct JourneyCustomMessage
        include JSON::Serializable

        # The message content that's passed to an AWS Lambda function or to a web hook.

        @[JSON::Field(key: "Data")]
        getter data : String?

        def initialize(
          @data : String? = nil
        )
        end
      end

      # Provides the results of a query that retrieved the data for a standard engagement metric that
      # applies to a journey, and provides information about that query.

      struct JourneyDateRangeKpiResponse
        include JSON::Serializable

        # The unique identifier for the application that the metric applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The last date and time of the date range that was used to filter the query results, in extended ISO
        # 8601 format. The date range is inclusive.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The unique identifier for the journey that the metric applies to.

        @[JSON::Field(key: "JourneyId")]
        getter journey_id : String

        # The name of the metric, also referred to as a key performance indicator (KPI) , that the data was
        # retrieved for. This value describes the associated metric and consists of two or more terms, which
        # are comprised of lowercase alphanumeric characters, separated by a hyphen. For a list of possible
        # values, see the Amazon Pinpoint Developer Guide .

        @[JSON::Field(key: "KpiName")]
        getter kpi_name : String

        # An array of objects that contains the results of the query. Each object contains the value for the
        # metric and metadata about that value.

        @[JSON::Field(key: "KpiResult")]
        getter kpi_result : Types::BaseKpiResult

        # The first date and time of the date range that was used to filter the query results, in extended ISO
        # 8601 format. The date range is inclusive.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null for the Journey Engagement Metrics resource because the resource returns all
        # results in a single page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @end_time : Time,
          @journey_id : String,
          @kpi_name : String,
          @kpi_result : Types::BaseKpiResult,
          @start_time : Time,
          @next_token : String? = nil
        )
        end
      end

      # Specifies the "From" address for an email message that's sent to participants in a journey.

      struct JourneyEmailMessage
        include JSON::Serializable

        # The verified email address to send the email message from. The default address is the FromAddress
        # specified for the email channel for the application.

        @[JSON::Field(key: "FromAddress")]
        getter from_address : String?

        def initialize(
          @from_address : String? = nil
        )
        end
      end

      # Provides the results of a query that retrieved the data for a standard execution metric that applies
      # to a journey activity, and provides information about that query.

      struct JourneyExecutionActivityMetricsResponse
        include JSON::Serializable

        # The type of activity that the metric applies to. Possible values are: CONDITIONAL_SPLIT – For a
        # yes/no split activity, which is an activity that sends participants down one of two paths in a
        # journey. HOLDOUT – For a holdout activity, which is an activity that stops a journey for a specified
        # percentage of participants. MESSAGE – For an email activity, which is an activity that sends an
        # email message to participants. MULTI_CONDITIONAL_SPLIT – For a multivariate split activity, which is
        # an activity that sends participants down one of as many as five paths in a journey. RANDOM_SPLIT –
        # For a random split activity, which is an activity that sends specified percentages of participants
        # down one of as many as five paths in a journey. WAIT – For a wait activity, which is an activity
        # that waits for a certain amount of time or until a specific date and time before moving participants
        # to the next activity in a journey.

        @[JSON::Field(key: "ActivityType")]
        getter activity_type : String

        # The unique identifier for the application that the metric applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The unique identifier for the activity that the metric applies to.

        @[JSON::Field(key: "JourneyActivityId")]
        getter journey_activity_id : String

        # The unique identifier for the journey that the metric applies to.

        @[JSON::Field(key: "JourneyId")]
        getter journey_id : String

        # The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated the execution status of
        # the activity and updated the data for the metric.

        @[JSON::Field(key: "LastEvaluatedTime")]
        getter last_evaluated_time : String

        # A JSON object that contains the results of the query. The results vary depending on the type of
        # activity (ActivityType). For information about the structure and contents of the results, see the
        # Amazon Pinpoint Developer Guide .

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, String)

        def initialize(
          @activity_type : String,
          @application_id : String,
          @journey_activity_id : String,
          @journey_id : String,
          @last_evaluated_time : String,
          @metrics : Hash(String, String)
        )
        end
      end

      # Provides the results of a query that retrieved the data for a standard execution metric that applies
      # to a journey, and provides information about that query.

      struct JourneyExecutionMetricsResponse
        include JSON::Serializable

        # The unique identifier for the application that the metric applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The unique identifier for the journey that the metric applies to.

        @[JSON::Field(key: "JourneyId")]
        getter journey_id : String

        # The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated the journey and updated
        # the data for the metric.

        @[JSON::Field(key: "LastEvaluatedTime")]
        getter last_evaluated_time : String

        # A JSON object that contains the results of the query. For information about the structure and
        # contents of the results, see the Amazon Pinpoint Developer Guide .

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, String)

        def initialize(
          @application_id : String,
          @journey_id : String,
          @last_evaluated_time : String,
          @metrics : Hash(String, String)
        )
        end
      end

      # Specifies limits on the messages that a journey can send and the number of times participants can
      # enter a journey.

      struct JourneyLimits
        include JSON::Serializable

        # The maximum number of messages that the journey can send to a single participant during a 24-hour
        # period. The maximum value is 100.

        @[JSON::Field(key: "DailyCap")]
        getter daily_cap : Int32?

        # The maximum number of times that a participant can enter the journey. The maximum value is 100. To
        # allow participants to enter the journey an unlimited number of times, set this value to 0.

        @[JSON::Field(key: "EndpointReentryCap")]
        getter endpoint_reentry_cap : Int32?

        # Minimum time that must pass before an endpoint can re-enter a given journey.

        @[JSON::Field(key: "EndpointReentryInterval")]
        getter endpoint_reentry_interval : String?

        # The maximum number of messages that the journey can send each second.

        @[JSON::Field(key: "MessagesPerSecond")]
        getter messages_per_second : Int32?

        # The number of messages that an endpoint can receive during the specified timeframe.

        @[JSON::Field(key: "TimeframeCap")]
        getter timeframe_cap : Types::JourneyTimeframeCap?

        # The maximum number of messages a journey can sent to a single endpoint. The maximum value is 100. If
        # set to 0, this limit will not apply.

        @[JSON::Field(key: "TotalCap")]
        getter total_cap : Int32?

        def initialize(
          @daily_cap : Int32? = nil,
          @endpoint_reentry_cap : Int32? = nil,
          @endpoint_reentry_interval : String? = nil,
          @messages_per_second : Int32? = nil,
          @timeframe_cap : Types::JourneyTimeframeCap? = nil,
          @total_cap : Int32? = nil
        )
        end
      end

      # Specifies the message configuration for a push notification that's sent to participants in a
      # journey.

      struct JourneyPushMessage
        include JSON::Serializable

        # The number of seconds that the push notification service should keep the message, if the service is
        # unable to deliver the notification the first time. This value is converted to an expiration value
        # when it's sent to a push notification service. If this value is 0, the service treats the
        # notification as if it expires immediately and the service doesn't store or try to deliver the
        # notification again. This value doesn't apply to messages that are sent through the Amazon Device
        # Messaging (ADM) service.

        @[JSON::Field(key: "TimeToLive")]
        getter time_to_live : String?

        def initialize(
          @time_to_live : String? = nil
        )
        end
      end

      # Provides information about the status, configuration, and other settings for a journey.

      struct JourneyResponse
        include JSON::Serializable

        # The unique identifier for the application that the journey applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The unique identifier for the journey.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the journey.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A map that contains a set of Activity objects, one object for each activity in the journey. For each
        # Activity object, the key is the unique identifier (string) for an activity and the value is the
        # settings for the activity.

        @[JSON::Field(key: "Activities")]
        getter activities : Hash(String, Types::Activity)?

        # The time when a journey will not send messages. QuietTime should be configured first and
        # SendingSchedule should be set to true.

        @[JSON::Field(key: "ClosedDays")]
        getter closed_days : Types::ClosedDays?

        # The date, in ISO 8601 format, when the journey was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # Amazon Resource Name (ARN) of the Connect Campaign.

        @[JSON::Field(key: "JourneyChannelSettings")]
        getter journey_channel_settings : Types::JourneyChannelSettings?

        # The date, in ISO 8601 format, when the journey was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The messaging and entry limits for the journey.

        @[JSON::Field(key: "Limits")]
        getter limits : Types::JourneyLimits?

        # Specifies whether the journey's scheduled start and end times use each participant's local time. If
        # this value is true, the schedule uses each participant's local time.

        @[JSON::Field(key: "LocalTime")]
        getter local_time : Bool?

        # The time when a journey can send messages. QuietTime should be configured first and SendingSchedule
        # should be set to true.

        @[JSON::Field(key: "OpenHours")]
        getter open_hours : Types::OpenHours?

        # The quiet time settings for the journey. Quiet time is a specific time range when a journey doesn't
        # send messages to participants, if all the following conditions are met: The
        # EndpointDemographic.Timezone property of the endpoint for the participant is set to a valid value.
        # The current time in the participant's time zone is later than or equal to the time specified by the
        # QuietTime.Start property for the journey. The current time in the participant's time zone is earlier
        # than or equal to the time specified by the QuietTime.End property for the journey. If any of the
        # preceding conditions isn't met, the participant will receive messages from the journey, even if
        # quiet time is enabled.

        @[JSON::Field(key: "QuietTime")]
        getter quiet_time : Types::QuietTime?

        # The frequency with which Amazon Pinpoint evaluates segment and event data for the journey, as a
        # duration in ISO 8601 format.

        @[JSON::Field(key: "RefreshFrequency")]
        getter refresh_frequency : String?

        # Indicates whether the journey participants should be refreshed when a segment is updated.

        @[JSON::Field(key: "RefreshOnSegmentUpdate")]
        getter refresh_on_segment_update : Bool?

        # The schedule settings for the journey.

        @[JSON::Field(key: "Schedule")]
        getter schedule : Types::JourneySchedule?

        # Indicates if journey has Advance Quiet Time enabled. This flag should be set to true in order to
        # allow using OpenHours and ClosedDays.

        @[JSON::Field(key: "SendingSchedule")]
        getter sending_schedule : Bool?

        # The unique identifier for the first activity in the journey.

        @[JSON::Field(key: "StartActivity")]
        getter start_activity : String?

        # The segment that defines which users are participants in the journey.

        @[JSON::Field(key: "StartCondition")]
        getter start_condition : Types::StartCondition?

        # The current status of the journey. Possible values are: DRAFT - The journey is being developed and
        # hasn't been published yet. ACTIVE - The journey has been developed and published. Depending on the
        # journey's schedule, the journey may currently be running or scheduled to start running at a later
        # time. If a journey's status is ACTIVE, you can't add, change, or remove activities from it. PAUSED -
        # The journey has been paused. Amazon Pinpoint continues to perform activities that are currently in
        # progress, until those activities are complete. COMPLETED - The journey has been published and has
        # finished running. All participants have entered the journey and no participants are waiting to
        # complete the journey or any activities in the journey. CANCELLED - The journey has been stopped. If
        # a journey's status is CANCELLED, you can't add, change, or remove activities or segment settings
        # from the journey. CLOSED - The journey has been published and has started running. It may have also
        # passed its scheduled end time, or passed its scheduled start time and a refresh frequency hasn't
        # been specified for it. If a journey's status is CLOSED, you can't add participants to it, and no
        # existing participants can enter the journey for the first time. However, any existing participants
        # who are currently waiting to start an activity may continue the journey.

        @[JSON::Field(key: "State")]
        getter state : String?

        # An array of time zone estimation methods, if any, to use for determining an Endpoints time zone if
        # the Endpoint does not have a value for the Demographic.Timezone attribute. PHONE_NUMBER - A time
        # zone is determined based on the Endpoint.Address and Endpoint.Location.Country. POSTAL_CODE - A time
        # zone is determined based on the Endpoint.Location.PostalCode and Endpoint.Location.Country.
        # POSTAL_CODE detection is only supported in the United States, United Kingdom, Australia, New
        # Zealand, Canada, France, Italy, Spain, Germany and in regions where Amazon Pinpoint is available.

        @[JSON::Field(key: "TimezoneEstimationMethods")]
        getter timezone_estimation_methods : Array(String)?

        # Indicates whether endpoints in quiet hours should enter a wait activity until quiet hours have
        # elapsed.

        @[JSON::Field(key: "WaitForQuietTime")]
        getter wait_for_quiet_time : Bool?

        # This object is not used or supported.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_id : String,
          @id : String,
          @name : String,
          @activities : Hash(String, Types::Activity)? = nil,
          @closed_days : Types::ClosedDays? = nil,
          @creation_date : String? = nil,
          @journey_channel_settings : Types::JourneyChannelSettings? = nil,
          @last_modified_date : String? = nil,
          @limits : Types::JourneyLimits? = nil,
          @local_time : Bool? = nil,
          @open_hours : Types::OpenHours? = nil,
          @quiet_time : Types::QuietTime? = nil,
          @refresh_frequency : String? = nil,
          @refresh_on_segment_update : Bool? = nil,
          @schedule : Types::JourneySchedule? = nil,
          @sending_schedule : Bool? = nil,
          @start_activity : String? = nil,
          @start_condition : Types::StartCondition? = nil,
          @state : String? = nil,
          @timezone_estimation_methods : Array(String)? = nil,
          @wait_for_quiet_time : Bool? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides the results of a query that retrieved the data for a standard execution metric that applies
      # to a journey activity for a particular journey run, and provides information about that query.

      struct JourneyRunExecutionActivityMetricsResponse
        include JSON::Serializable

        # The type of activity that the metric applies to. Possible values are: CONDITIONAL_SPLIT – For a
        # yes/no split activity, which is an activity that sends participants down one of two paths in a
        # journey. HOLDOUT – For a holdout activity, which is an activity that stops a journey for a specified
        # percentage of participants. MESSAGE – For an email activity, which is an activity that sends an
        # email message to participants. MULTI_CONDITIONAL_SPLIT – For a multivariate split activity, which is
        # an activity that sends participants down one of as many as five paths in a journey. RANDOM_SPLIT –
        # For a random split activity, which is an activity that sends specified percentages of participants
        # down one of as many as five paths in a journey. WAIT – For a wait activity, which is an activity
        # that waits for a certain amount of time or until a specific date and time before moving participants
        # to the next activity in a journey.

        @[JSON::Field(key: "ActivityType")]
        getter activity_type : String

        # The unique identifier for the application that the metric applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The unique identifier for the activity that the metric applies to.

        @[JSON::Field(key: "JourneyActivityId")]
        getter journey_activity_id : String

        # The unique identifier for the journey that the metric applies to.

        @[JSON::Field(key: "JourneyId")]
        getter journey_id : String

        # The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated the execution status of
        # the activity for this journey run and updated the data for the metric.

        @[JSON::Field(key: "LastEvaluatedTime")]
        getter last_evaluated_time : String

        # A JSON object that contains the results of the query. For information about the structure and
        # contents of the results, see see Standard Amazon Pinpoint analytics metrics in the Amazon Pinpoint
        # Developer Guide .

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, String)

        # The unique identifier for the journey run that the metric applies to.

        @[JSON::Field(key: "RunId")]
        getter run_id : String

        def initialize(
          @activity_type : String,
          @application_id : String,
          @journey_activity_id : String,
          @journey_id : String,
          @last_evaluated_time : String,
          @metrics : Hash(String, String),
          @run_id : String
        )
        end
      end

      # Provides the results of a query that retrieved the data for a standard execution metric that applies
      # to a journey run, and provides information about that query.

      struct JourneyRunExecutionMetricsResponse
        include JSON::Serializable

        # The unique identifier for the application that the metric applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The unique identifier for the journey that the metric applies to.

        @[JSON::Field(key: "JourneyId")]
        getter journey_id : String

        # The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated the journey run and
        # updated the data for the metric.

        @[JSON::Field(key: "LastEvaluatedTime")]
        getter last_evaluated_time : String

        # A JSON object that contains the results of the query. For information about the structure and
        # contents of the results, see the Standard Amazon Pinpoint analytics metrics in the Amazon Pinpoint
        # Developer Guide .

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, String)

        # The unique identifier for the journey run that the metric applies to.

        @[JSON::Field(key: "RunId")]
        getter run_id : String

        def initialize(
          @application_id : String,
          @journey_id : String,
          @last_evaluated_time : String,
          @metrics : Hash(String, String),
          @run_id : String
        )
        end
      end

      # Provides information from a specified run of a journey.

      struct JourneyRunResponse
        include JSON::Serializable

        # The time when the journey run was created or scheduled, in ISO 8601 format.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String

        # The last time the journey run was updated, in ISO 8601 format..

        @[JSON::Field(key: "LastUpdateTime")]
        getter last_update_time : String

        # The unique identifier for the run.

        @[JSON::Field(key: "RunId")]
        getter run_id : String

        # The current status of the journey run.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @creation_time : String,
          @last_update_time : String,
          @run_id : String,
          @status : String
        )
        end
      end

      # Provides information from all runs of a journey.

      struct JourneyRunsResponse
        include JSON::Serializable

        # An array of responses, one for each run of the journey

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::JourneyRunResponse)

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null if there are no additional pages.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @item : Array(Types::JourneyRunResponse),
          @next_token : String? = nil
        )
        end
      end

      # Specifies the sender ID and message type for an SMS message that's sent to participants in a
      # journey.

      struct JourneySMSMessage
        include JSON::Serializable

        # The entity ID or Principal Entity (PE) id received from the regulatory body for sending SMS in your
        # country.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String?

        # The SMS message type. Valid values are TRANSACTIONAL (for messages that are critical or
        # time-sensitive, such as a one-time passwords) and PROMOTIONAL (for messsages that aren't critical or
        # time-sensitive, such as marketing messages).

        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        # The long code to send the SMS message from. This value should be one of the dedicated long codes
        # that's assigned to your AWS account. Although it isn't required, we recommend that you specify the
        # long code using an E.164 format to ensure prompt and accurate delivery of the message. For example,
        # +12065550100.

        @[JSON::Field(key: "OriginationNumber")]
        getter origination_number : String?

        # The sender ID to display as the sender of the message on a recipient's device. Support for sender
        # IDs varies by country or region. For more information, see Supported Countries and Regions in the
        # Amazon Pinpoint User Guide.

        @[JSON::Field(key: "SenderId")]
        getter sender_id : String?

        # The template ID received from the regulatory body for sending SMS in your country.

        @[JSON::Field(key: "TemplateId")]
        getter template_id : String?

        def initialize(
          @entity_id : String? = nil,
          @message_type : String? = nil,
          @origination_number : String? = nil,
          @sender_id : String? = nil,
          @template_id : String? = nil
        )
        end
      end

      # Specifies the schedule settings for a journey.

      struct JourneySchedule
        include JSON::Serializable

        # The scheduled time, in ISO 8601 format, when the journey ended or will end.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The scheduled time, in ISO 8601 format, when the journey began or will begin.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The starting UTC offset for the journey schedule, if the value of the journey's LocalTime property
        # is true. Valid values are: UTC, UTC+01, UTC+02, UTC+03, UTC+03:30, UTC+04, UTC+04:30, UTC+05,
        # UTC+05:30, UTC+05:45, UTC+06, UTC+06:30, UTC+07, UTC+08, UTC+08:45, UTC+09, UTC+09:30, UTC+10,
        # UTC+10:30, UTC+11, UTC+12, UTC+12:45, UTC+13, UTC+13:45, UTC-02, UTC-02:30, UTC-03, UTC-03:30,
        # UTC-04, UTC-05, UTC-06, UTC-07, UTC-08, UTC-09, UTC-09:30, UTC-10, and UTC-11.

        @[JSON::Field(key: "Timezone")]
        getter timezone : String?

        def initialize(
          @end_time : Time? = nil,
          @start_time : Time? = nil,
          @timezone : String? = nil
        )
        end
      end

      # Changes the status of a journey.

      struct JourneyStateRequest
        include JSON::Serializable

        # The status of the journey. Currently, Supported values are ACTIVE, PAUSED, and CANCELLED If you
        # cancel a journey, Amazon Pinpoint continues to perform activities that are currently in progress,
        # until those activities are complete. Amazon Pinpoint also continues to collect and aggregate
        # analytics data for those activities, until they are complete, and any activities that were complete
        # when you cancelled the journey. After you cancel a journey, you can't add, change, or remove any
        # activities from the journey. In addition, Amazon Pinpoint stops evaluating the journey and doesn't
        # perform any activities that haven't started. When the journey is paused, Amazon Pinpoint continues
        # to perform activities that are currently in progress, until those activities are complete. Endpoints
        # will stop entering journeys when the journey is paused and will resume entering the journey after
        # the journey is resumed. For wait activities, wait time is paused when the journey is paused.
        # Currently, PAUSED only supports journeys with a segment refresh interval.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @state : String? = nil
        )
        end
      end

      # The number of messages that can be sent to an endpoint during the specified timeframe for all
      # journeys.

      struct JourneyTimeframeCap
        include JSON::Serializable

        # The maximum number of messages that all journeys can send to an endpoint during the specified
        # timeframe. The maximum value is 100. If set to 0, this limit will not apply.

        @[JSON::Field(key: "Cap")]
        getter cap : Int32?

        # The length of the timeframe in days. The maximum value is 30. If set to 0, this limit will not
        # apply.

        @[JSON::Field(key: "Days")]
        getter days : Int32?

        def initialize(
          @cap : Int32? = nil,
          @days : Int32? = nil
        )
        end
      end

      # Provides information about the status, configuration, and other settings for all the journeys that
      # are associated with an application.

      struct JourneysResponse
        include JSON::Serializable

        # An array of responses, one for each journey that's associated with the application.

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::JourneyResponse)

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null if there are no additional pages.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @item : Array(Types::JourneyResponse),
          @next_token : String? = nil
        )
        end
      end


      struct ListJourneysRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @application_id : String,
          @page_size : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct ListJourneysResponse
        include JSON::Serializable


        @[JSON::Field(key: "JourneysResponse")]
        getter journeys_response : Types::JourneysResponse

        def initialize(
          @journeys_response : Types::JourneysResponse
        )
        end
      end

      # Provides information about all the recommender model configurations that are associated with your
      # Amazon Pinpoint account.

      struct ListRecommenderConfigurationsResponse
        include JSON::Serializable

        # An array of responses, one for each recommender model configuration that's associated with your
        # Amazon Pinpoint account.

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::RecommenderConfigurationResponse)

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null if there are no additional pages.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @item : Array(Types::RecommenderConfigurationResponse),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable


        @[JSON::Field(key: "TagsModel")]
        getter tags_model : Types::TagsModel

        def initialize(
          @tags_model : Types::TagsModel
        )
        end
      end


      struct ListTemplateVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "template-type")]
        getter template_type : String


        @[JSON::Field(key: "next-token")]
        getter next_token : String?


        @[JSON::Field(key: "page-size")]
        getter page_size : String?

        def initialize(
          @template_name : String,
          @template_type : String,
          @next_token : String? = nil,
          @page_size : String? = nil
        )
        end
      end


      struct ListTemplateVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "TemplateVersionsResponse")]
        getter template_versions_response : Types::TemplateVersionsResponse

        def initialize(
          @template_versions_response : Types::TemplateVersionsResponse
        )
        end
      end


      struct ListTemplatesRequest
        include JSON::Serializable


        @[JSON::Field(key: "next-token")]
        getter next_token : String?


        @[JSON::Field(key: "page-size")]
        getter page_size : String?


        @[JSON::Field(key: "prefix")]
        getter prefix : String?


        @[JSON::Field(key: "template-type")]
        getter template_type : String?

        def initialize(
          @next_token : String? = nil,
          @page_size : String? = nil,
          @prefix : String? = nil,
          @template_type : String? = nil
        )
        end
      end


      struct ListTemplatesResponse
        include JSON::Serializable


        @[JSON::Field(key: "TemplatesResponse")]
        getter templates_response : Types::TemplatesResponse

        def initialize(
          @templates_response : Types::TemplatesResponse
        )
        end
      end

      # Specifies the content and settings for a push notification that's sent to recipients of a campaign.

      struct Message
        include JSON::Serializable

        # The action to occur if a recipient taps the push notification. Valid values are: OPEN_APP - Your app
        # opens or it becomes the foreground app if it was sent to the background. This is the default action.
        # DEEP_LINK - Your app opens and displays a designated user interface in the app. This setting uses
        # the deep-linking features of iOS and Android. URL - The default mobile browser on the recipient's
        # device opens and loads the web page at a URL that you specify.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The body of the notification message. The maximum number of characters is 200.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The URL of the image to display as the push-notification icon, such as the icon for the app.

        @[JSON::Field(key: "ImageIconUrl")]
        getter image_icon_url : String?

        # The URL of the image to display as the small, push-notification icon, such as a small version of the
        # icon for the app.

        @[JSON::Field(key: "ImageSmallIconUrl")]
        getter image_small_icon_url : String?

        # The URL of an image to display in the push notification.

        @[JSON::Field(key: "ImageUrl")]
        getter image_url : String?

        # The JSON payload to use for a silent push notification.

        @[JSON::Field(key: "JsonBody")]
        getter json_body : String?

        # The URL of the image or video to display in the push notification.

        @[JSON::Field(key: "MediaUrl")]
        getter media_url : String?

        # The raw, JSON-formatted string to use as the payload for the notification message. If specified,
        # this value overrides all other content for the message.

        @[JSON::Field(key: "RawContent")]
        getter raw_content : String?

        # Specifies whether the notification is a silent push notification, which is a push notification that
        # doesn't display on a recipient's device. Silent push notifications can be used for cases such as
        # updating an app's configuration, displaying messages in an in-app message center, or supporting
        # phone home functionality.

        @[JSON::Field(key: "SilentPush")]
        getter silent_push : Bool?

        # The number of seconds that the push-notification service should keep the message, if the service is
        # unable to deliver the notification the first time. This value is converted to an expiration value
        # when it's sent to a push-notification service. If this value is 0, the service treats the
        # notification as if it expires immediately and the service doesn't store or try to deliver the
        # notification again. This value doesn't apply to messages that are sent through the Amazon Device
        # Messaging (ADM) service.

        @[JSON::Field(key: "TimeToLive")]
        getter time_to_live : Int32?

        # The title to display above the notification message on a recipient's device.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # The URL to open in a recipient's default mobile browser, if a recipient taps the push notification
        # and the value of the Action property is URL.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @action : String? = nil,
          @body : String? = nil,
          @image_icon_url : String? = nil,
          @image_small_icon_url : String? = nil,
          @image_url : String? = nil,
          @json_body : String? = nil,
          @media_url : String? = nil,
          @raw_content : String? = nil,
          @silent_push : Bool? = nil,
          @time_to_live : Int32? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Provides information about an API request or response.

      struct MessageBody
        include JSON::Serializable

        # The message that's returned from the API.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The unique identifier for the request or response.

        @[JSON::Field(key: "RequestID")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Specifies the message configuration settings for a campaign.

      struct MessageConfiguration
        include JSON::Serializable

        # The message that the campaign sends through the ADM (Amazon Device Messaging) channel. If specified,
        # this message overrides the default message.

        @[JSON::Field(key: "ADMMessage")]
        getter adm_message : Types::Message?

        # The message that the campaign sends through the APNs (Apple Push Notification service) channel. If
        # specified, this message overrides the default message.

        @[JSON::Field(key: "APNSMessage")]
        getter apns_message : Types::Message?

        # The message that the campaign sends through the Baidu (Baidu Cloud Push) channel. If specified, this
        # message overrides the default message.

        @[JSON::Field(key: "BaiduMessage")]
        getter baidu_message : Types::Message?

        # The message that the campaign sends through a custom channel, as specified by the delivery
        # configuration (CustomDeliveryConfiguration) settings for the campaign. If specified, this message
        # overrides the default message.

        @[JSON::Field(key: "CustomMessage")]
        getter custom_message : Types::CampaignCustomMessage?

        # The default message that the campaign sends through all the channels that are configured for the
        # campaign.

        @[JSON::Field(key: "DefaultMessage")]
        getter default_message : Types::Message?

        # The message that the campaign sends through the email channel. If specified, this message overrides
        # the default message.

        @[JSON::Field(key: "EmailMessage")]
        getter email_message : Types::CampaignEmailMessage?

        # The message that the campaign sends through the GCM channel, which enables Amazon Pinpoint to send
        # push notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging
        # (GCM), service. If specified, this message overrides the default message.

        @[JSON::Field(key: "GCMMessage")]
        getter gcm_message : Types::Message?

        # The in-app message configuration.

        @[JSON::Field(key: "InAppMessage")]
        getter in_app_message : Types::CampaignInAppMessage?

        # The message that the campaign sends through the SMS channel. If specified, this message overrides
        # the default message.

        @[JSON::Field(key: "SMSMessage")]
        getter sms_message : Types::CampaignSmsMessage?

        def initialize(
          @adm_message : Types::Message? = nil,
          @apns_message : Types::Message? = nil,
          @baidu_message : Types::Message? = nil,
          @custom_message : Types::CampaignCustomMessage? = nil,
          @default_message : Types::Message? = nil,
          @email_message : Types::CampaignEmailMessage? = nil,
          @gcm_message : Types::Message? = nil,
          @in_app_message : Types::CampaignInAppMessage? = nil,
          @sms_message : Types::CampaignSmsMessage? = nil
        )
        end
      end

      # Contains the name and value pair of an email header to add to your email. You can have up to 15
      # MessageHeaders. A header can contain information such as the sender, receiver, route, or timestamp.

      struct MessageHeader
        include JSON::Serializable

        # The name of the message header. The header name can contain up to 126 characters.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value of the message header. The header value can contain up to 870 characters, including the
        # length of any rendered attributes. For example if you add the {CreationDate} attribute, it renders
        # as YYYY-MM-DDTHH:MM:SS.SSSZ and is 24 characters in length.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Specifies the configuration and other settings for a message.

      struct MessageRequest
        include JSON::Serializable

        # The settings and content for the default message and any default messages that you defined for
        # specific channels.

        @[JSON::Field(key: "MessageConfiguration")]
        getter message_configuration : Types::DirectMessageConfiguration

        # A map of key-value pairs, where each key is an address and each value is an AddressConfiguration
        # object. An address can be a push notification token, a phone number, or an email address. You can
        # use an AddressConfiguration object to tailor the message for an address by specifying settings such
        # as content overrides and message variables.

        @[JSON::Field(key: "Addresses")]
        getter addresses : Hash(String, Types::AddressConfiguration)?

        # A map of custom attributes to attach to the message. For a push notification, this payload is added
        # to the data.pinpoint object. For an email or text message, this payload is added to email/SMS
        # delivery receipt event attributes.

        @[JSON::Field(key: "Context")]
        getter context : Hash(String, String)?

        # A map of key-value pairs, where each key is an endpoint ID and each value is an
        # EndpointSendConfiguration object. You can use an EndpointSendConfiguration object to tailor the
        # message for an endpoint by specifying settings such as content overrides and message variables.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Hash(String, Types::EndpointSendConfiguration)?

        # The message template to use for the message.

        @[JSON::Field(key: "TemplateConfiguration")]
        getter template_configuration : Types::TemplateConfiguration?

        # The unique identifier for tracing the message. This identifier is visible to message recipients.

        @[JSON::Field(key: "TraceId")]
        getter trace_id : String?

        def initialize(
          @message_configuration : Types::DirectMessageConfiguration,
          @addresses : Hash(String, Types::AddressConfiguration)? = nil,
          @context : Hash(String, String)? = nil,
          @endpoints : Hash(String, Types::EndpointSendConfiguration)? = nil,
          @template_configuration : Types::TemplateConfiguration? = nil,
          @trace_id : String? = nil
        )
        end
      end

      # Provides information about the results of a request to send a message to an endpoint address.

      struct MessageResponse
        include JSON::Serializable

        # The unique identifier for the application that was used to send the message.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # A map that contains a multipart response for each address that the message was sent to. In the map,
        # the endpoint ID is the key and the result is the value.

        @[JSON::Field(key: "EndpointResult")]
        getter endpoint_result : Hash(String, Types::EndpointMessageResult)?

        # The identifier for the original request that the message was delivered for.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # A map that contains a multipart response for each address (email address, phone number, or push
        # notification token) that the message was sent to. In the map, the address is the key and the result
        # is the value.

        @[JSON::Field(key: "Result")]
        getter result : Hash(String, Types::MessageResult)?

        def initialize(
          @application_id : String,
          @endpoint_result : Hash(String, Types::EndpointMessageResult)? = nil,
          @request_id : String? = nil,
          @result : Hash(String, Types::MessageResult)? = nil
        )
        end
      end

      # Provides information about the results of sending a message directly to an endpoint address.

      struct MessageResult
        include JSON::Serializable

        # The delivery status of the message. Possible values are: DUPLICATE - The endpoint address is a
        # duplicate of another endpoint address. Amazon Pinpoint won't attempt to send the message again.
        # OPT_OUT - The user who's associated with the endpoint address has opted out of receiving messages
        # from you. Amazon Pinpoint won't attempt to send the message again. PERMANENT_FAILURE - An error
        # occurred when delivering the message to the endpoint address. Amazon Pinpoint won't attempt to send
        # the message again. SUCCESSFUL - The message was successfully delivered to the endpoint address.
        # TEMPORARY_FAILURE - A temporary error occurred. Amazon Pinpoint won't attempt to send the message
        # again. THROTTLED - Amazon Pinpoint throttled the operation to send the message to the endpoint
        # address. UNKNOWN_FAILURE - An unknown error occurred.

        @[JSON::Field(key: "DeliveryStatus")]
        getter delivery_status : String

        # The downstream service status code for delivering the message.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32

        # The unique identifier for the message that was sent.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The status message for delivering the message.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # For push notifications that are sent through the GCM channel, specifies whether the endpoint's
        # device registration token was updated as part of delivering the message.

        @[JSON::Field(key: "UpdatedToken")]
        getter updated_token : String?

        def initialize(
          @delivery_status : String,
          @status_code : Int32,
          @message_id : String? = nil,
          @status_message : String? = nil,
          @updated_token : String? = nil
        )
        end
      end

      # Provides information about an API request or response.

      struct MethodNotAllowedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestID")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Specifies metric-based criteria for including or excluding endpoints from a segment. These criteria
      # derive from custom metrics that you define for endpoints.

      struct MetricDimension
        include JSON::Serializable

        # The operator to use when comparing metric values. Valid values are: GREATER_THAN, LESS_THAN,
        # GREATER_THAN_OR_EQUAL, LESS_THAN_OR_EQUAL, and EQUAL.

        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String

        # The value to compare.

        @[JSON::Field(key: "Value")]
        getter value : Float64

        def initialize(
          @comparison_operator : String,
          @value : Float64
        )
        end
      end

      # Specifies a condition to evaluate for an activity path in a journey.

      struct MultiConditionalBranch
        include JSON::Serializable

        # The condition to evaluate for the activity path.

        @[JSON::Field(key: "Condition")]
        getter condition : Types::SimpleCondition?

        # The unique identifier for the next activity to perform, after completing the activity for the path.

        @[JSON::Field(key: "NextActivity")]
        getter next_activity : String?

        def initialize(
          @condition : Types::SimpleCondition? = nil,
          @next_activity : String? = nil
        )
        end
      end

      # Specifies the settings for a multivariate split activity in a journey. This type of activity sends
      # participants down one of as many as five paths (including a default Else path) in a journey, based
      # on conditions that you specify. To create multivariate split activities that send participants down
      # different paths based on push notification events (such as Open or Received events), your mobile app
      # has to specify the User ID and Endpoint ID values. For more information, see Integrating Amazon
      # Pinpoint with your application in the Amazon Pinpoint Developer Guide .

      struct MultiConditionalSplitActivity
        include JSON::Serializable

        # The paths for the activity, including the conditions for entering each path and the activity to
        # perform for each path.

        @[JSON::Field(key: "Branches")]
        getter branches : Array(Types::MultiConditionalBranch)?

        # The unique identifier for the activity to perform for participants who don't meet any of the
        # conditions specified for other paths in the activity.

        @[JSON::Field(key: "DefaultActivity")]
        getter default_activity : String?

        # The amount of time to wait or the date and time when Amazon Pinpoint determines whether the
        # conditions are met.

        @[JSON::Field(key: "EvaluationWaitTime")]
        getter evaluation_wait_time : Types::WaitTime?

        def initialize(
          @branches : Array(Types::MultiConditionalBranch)? = nil,
          @default_activity : String? = nil,
          @evaluation_wait_time : Types::WaitTime? = nil
        )
        end
      end

      # Provides information about an API request or response.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestID")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Specifies a phone number to validate and retrieve information about.

      struct NumberValidateRequest
        include JSON::Serializable

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region where the phone
        # number was originally registered.

        @[JSON::Field(key: "IsoCountryCode")]
        getter iso_country_code : String?

        # The phone number to retrieve information about. The phone number that you provide should include a
        # valid numeric country code. Otherwise, the operation might result in an error.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        def initialize(
          @iso_country_code : String? = nil,
          @phone_number : String? = nil
        )
        end
      end

      # Provides information about a phone number.

      struct NumberValidateResponse
        include JSON::Serializable

        # The carrier or service provider that the phone number is currently registered with. In some
        # countries and regions, this value may be the carrier or service provider that the phone number was
        # originally registered with.

        @[JSON::Field(key: "Carrier")]
        getter carrier : String?

        # The name of the city where the phone number was originally registered.

        @[JSON::Field(key: "City")]
        getter city : String?

        # The cleansed phone number, in E.164 format, for the location where the phone number was originally
        # registered.

        @[JSON::Field(key: "CleansedPhoneNumberE164")]
        getter cleansed_phone_number_e164 : String?

        # The cleansed phone number, in the format for the location where the phone number was originally
        # registered.

        @[JSON::Field(key: "CleansedPhoneNumberNational")]
        getter cleansed_phone_number_national : String?

        # The name of the country or region where the phone number was originally registered.

        @[JSON::Field(key: "Country")]
        getter country : String?

        # The two-character code, in ISO 3166-1 alpha-2 format, for the country or region where the phone
        # number was originally registered.

        @[JSON::Field(key: "CountryCodeIso2")]
        getter country_code_iso2 : String?

        # The numeric code for the country or region where the phone number was originally registered.

        @[JSON::Field(key: "CountryCodeNumeric")]
        getter country_code_numeric : String?

        # The name of the county where the phone number was originally registered.

        @[JSON::Field(key: "County")]
        getter county : String?

        # The two-character code, in ISO 3166-1 alpha-2 format, that was sent in the request body.

        @[JSON::Field(key: "OriginalCountryCodeIso2")]
        getter original_country_code_iso2 : String?

        # The phone number that was sent in the request body.

        @[JSON::Field(key: "OriginalPhoneNumber")]
        getter original_phone_number : String?

        # The description of the phone type. Valid values are: MOBILE, LANDLINE, VOIP, INVALID, PREPAID, and
        # OTHER.

        @[JSON::Field(key: "PhoneType")]
        getter phone_type : String?

        # The phone type, represented by an integer. Valid values are: 0 (mobile), 1 (landline), 2 (VoIP), 3
        # (invalid), 4 (other), and 5 (prepaid).

        @[JSON::Field(key: "PhoneTypeCode")]
        getter phone_type_code : Int32?

        # The time zone for the location where the phone number was originally registered.

        @[JSON::Field(key: "Timezone")]
        getter timezone : String?

        # The postal or ZIP code for the location where the phone number was originally registered.

        @[JSON::Field(key: "ZipCode")]
        getter zip_code : String?

        def initialize(
          @carrier : String? = nil,
          @city : String? = nil,
          @cleansed_phone_number_e164 : String? = nil,
          @cleansed_phone_number_national : String? = nil,
          @country : String? = nil,
          @country_code_iso2 : String? = nil,
          @country_code_numeric : String? = nil,
          @county : String? = nil,
          @original_country_code_iso2 : String? = nil,
          @original_phone_number : String? = nil,
          @phone_type : String? = nil,
          @phone_type_code : Int32? = nil,
          @timezone : String? = nil,
          @zip_code : String? = nil
        )
        end
      end

      # Specifies the times when message are allowed to be sent to endpoints.

      struct OpenHours
        include JSON::Serializable

        # Rules for Custom Channel.

        @[JSON::Field(key: "CUSTOM")]
        getter custom : Hash(String, Array(Types::OpenHoursRule))?

        # Rules for Email Channel.

        @[JSON::Field(key: "EMAIL")]
        getter email : Hash(String, Array(Types::OpenHoursRule))?

        # Rules for Push Channel.

        @[JSON::Field(key: "PUSH")]
        getter push : Hash(String, Array(Types::OpenHoursRule))?

        # Rules for SMS Channel.

        @[JSON::Field(key: "SMS")]
        getter sms : Hash(String, Array(Types::OpenHoursRule))?

        # Rules for Email Channel.

        @[JSON::Field(key: "VOICE")]
        getter voice : Hash(String, Array(Types::OpenHoursRule))?

        def initialize(
          @custom : Hash(String, Array(Types::OpenHoursRule))? = nil,
          @email : Hash(String, Array(Types::OpenHoursRule))? = nil,
          @push : Hash(String, Array(Types::OpenHoursRule))? = nil,
          @sms : Hash(String, Array(Types::OpenHoursRule))? = nil,
          @voice : Hash(String, Array(Types::OpenHoursRule))? = nil
        )
        end
      end

      # Specifies the start and end time for OpenHours.

      struct OpenHoursRule
        include JSON::Serializable

        # The end of the scheduled time, in ISO 8601 format, when the channel can't send messages.

        @[JSON::Field(key: "EndTime")]
        getter end_time : String?

        # The start of the scheduled time, in ISO 8601 format, when the channel can send messages.

        @[JSON::Field(key: "StartTime")]
        getter start_time : String?

        def initialize(
          @end_time : String? = nil,
          @start_time : String? = nil
        )
        end
      end

      # Override button configuration.

      struct OverrideButtonConfiguration
        include JSON::Serializable

        # Action triggered by the button.

        @[JSON::Field(key: "ButtonAction")]
        getter button_action : String

        # Button destination.

        @[JSON::Field(key: "Link")]
        getter link : String?

        def initialize(
          @button_action : String,
          @link : String? = nil
        )
        end
      end

      # Provides information about an API request or response.

      struct PayloadTooLargeException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestID")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct PhoneNumberValidateRequest
        include JSON::Serializable


        @[JSON::Field(key: "NumberValidateRequest")]
        getter number_validate_request : Types::NumberValidateRequest

        def initialize(
          @number_validate_request : Types::NumberValidateRequest
        )
        end
      end


      struct PhoneNumberValidateResponse
        include JSON::Serializable


        @[JSON::Field(key: "NumberValidateResponse")]
        getter number_validate_response : Types::NumberValidateResponse

        def initialize(
          @number_validate_response : Types::NumberValidateResponse
        )
        end
      end

      # Specifies the properties and attributes of an endpoint that's associated with an event.

      struct PublicEndpoint
        include JSON::Serializable

        # The unique identifier for the recipient, such as a device token, email address, or mobile phone
        # number.

        @[JSON::Field(key: "Address")]
        getter address : String?

        # One or more custom attributes that describe the endpoint by associating a name with an array of
        # values. You can use these attributes as filter criteria when you create segments.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, Array(String))?

        # The channel that's used when sending messages or push notifications to the endpoint.

        @[JSON::Field(key: "ChannelType")]
        getter channel_type : String?

        # The demographic information for the endpoint, such as the time zone and platform.

        @[JSON::Field(key: "Demographic")]
        getter demographic : Types::EndpointDemographic?

        # The date and time, in ISO 8601 format, when the endpoint was last updated.

        @[JSON::Field(key: "EffectiveDate")]
        getter effective_date : String?

        # Specifies whether to send messages or push notifications to the endpoint. Valid values are: ACTIVE,
        # messages are sent to the endpoint; and, INACTIVE, messages aren’t sent to the endpoint. Amazon
        # Pinpoint automatically sets this value to ACTIVE when you create an endpoint or update an existing
        # endpoint. Amazon Pinpoint automatically sets this value to INACTIVE if you update another endpoint
        # that has the same address specified by the Address property.

        @[JSON::Field(key: "EndpointStatus")]
        getter endpoint_status : String?

        # The geographic information for the endpoint.

        @[JSON::Field(key: "Location")]
        getter location : Types::EndpointLocation?

        # One or more custom metrics that your app reports to Amazon Pinpoint for the endpoint.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, Float64)?

        # Specifies whether the user who's associated with the endpoint has opted out of receiving messages
        # and push notifications from you. Possible values are: ALL, the user has opted out and doesn't want
        # to receive any messages or push notifications; and, NONE, the user hasn't opted out and wants to
        # receive all messages and push notifications.

        @[JSON::Field(key: "OptOut")]
        getter opt_out : String?

        # A unique identifier that's generated each time the endpoint is updated.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # One or more custom user attributes that your app reports to Amazon Pinpoint for the user who's
        # associated with the endpoint.

        @[JSON::Field(key: "User")]
        getter user : Types::EndpointUser?

        def initialize(
          @address : String? = nil,
          @attributes : Hash(String, Array(String))? = nil,
          @channel_type : String? = nil,
          @demographic : Types::EndpointDemographic? = nil,
          @effective_date : String? = nil,
          @endpoint_status : String? = nil,
          @location : Types::EndpointLocation? = nil,
          @metrics : Hash(String, Float64)? = nil,
          @opt_out : String? = nil,
          @request_id : String? = nil,
          @user : Types::EndpointUser? = nil
        )
        end
      end

      # Specifies the settings for a push notification activity in a journey. This type of activity sends a
      # push notification to participants.

      struct PushMessageActivity
        include JSON::Serializable

        # Specifies the time to live (TTL) value for push notifications that are sent to participants in a
        # journey.

        @[JSON::Field(key: "MessageConfig")]
        getter message_config : Types::JourneyPushMessage?

        # The unique identifier for the next activity to perform, after the message is sent.

        @[JSON::Field(key: "NextActivity")]
        getter next_activity : String?

        # The name of the push notification template to use for the message. If specified, this value must
        # match the name of an existing message template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # The unique identifier for the version of the push notification template to use for the message. If
        # specified, this value must match the identifier for an existing template version. To retrieve a list
        # of versions and version identifiers for a template, use the Template Versions resource. If you don't
        # specify a value for this property, Amazon Pinpoint uses the active version of the template. The
        # active version is typically the version of a template that's been most recently reviewed and
        # approved for use, depending on your workflow. It isn't necessarily the latest version of a template.

        @[JSON::Field(key: "TemplateVersion")]
        getter template_version : String?

        def initialize(
          @message_config : Types::JourneyPushMessage? = nil,
          @next_activity : String? = nil,
          @template_name : String? = nil,
          @template_version : String? = nil
        )
        end
      end

      # Specifies the content and settings for a message template that can be used in messages that are sent
      # through a push notification channel.

      struct PushNotificationTemplateRequest
        include JSON::Serializable

        # The message template to use for the ADM (Amazon Device Messaging) channel. This message template
        # overrides the default template for push notification channels (DefaultPushNotificationTemplate).

        @[JSON::Field(key: "ADM")]
        getter adm : Types::AndroidPushNotificationTemplate?

        # The message template to use for the APNs (Apple Push Notification service) channel. This message
        # template overrides the default template for push notification channels
        # (DefaultPushNotificationTemplate).

        @[JSON::Field(key: "APNS")]
        getter apns : Types::APNSPushNotificationTemplate?

        # The message template to use for the Baidu (Baidu Cloud Push) channel. This message template
        # overrides the default template for push notification channels (DefaultPushNotificationTemplate).

        @[JSON::Field(key: "Baidu")]
        getter baidu : Types::AndroidPushNotificationTemplate?

        # The default message template to use for push notification channels.

        @[JSON::Field(key: "Default")]
        getter default : Types::DefaultPushNotificationTemplate?

        # A JSON object that specifies the default values to use for message variables in the message
        # template. This object is a set of key-value pairs. Each key defines a message variable in the
        # template. The corresponding value defines the default value for that variable. When you create a
        # message that's based on the template, you can override these defaults with message-specific and
        # address-specific variables and values.

        @[JSON::Field(key: "DefaultSubstitutions")]
        getter default_substitutions : String?

        # The message template to use for the GCM channel, which is used to send notifications through the
        # Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service. This message
        # template overrides the default template for push notification channels
        # (DefaultPushNotificationTemplate).

        @[JSON::Field(key: "GCM")]
        getter gcm : Types::AndroidPushNotificationTemplate?

        # The unique identifier for the recommender model to use for the message template. Amazon Pinpoint
        # uses this value to determine how to retrieve and process data from a recommender model when it sends
        # messages that use the template, if the template contains message variables for recommendation data.

        @[JSON::Field(key: "RecommenderId")]
        getter recommender_id : String?

        # A custom description of the message template.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        # As of 22-05-2023 tags has been deprecated for update operations. After this date any value in tags
        # is not processed and an error code is not returned. To manage tags we recommend using either Tags in
        # the API Reference for Amazon Pinpoint , resourcegroupstaggingapi commands in the AWS Command Line
        # Interface Documentation or resourcegroupstaggingapi in the AWS SDK . (Deprecated) A string-to-string
        # map of key-value pairs that defines the tags to associate with the message template. Each tag
        # consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @adm : Types::AndroidPushNotificationTemplate? = nil,
          @apns : Types::APNSPushNotificationTemplate? = nil,
          @baidu : Types::AndroidPushNotificationTemplate? = nil,
          @default : Types::DefaultPushNotificationTemplate? = nil,
          @default_substitutions : String? = nil,
          @gcm : Types::AndroidPushNotificationTemplate? = nil,
          @recommender_id : String? = nil,
          @template_description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about the content and settings for a message template that can be used in
      # messages that are sent through a push notification channel.

      struct PushNotificationTemplateResponse
        include JSON::Serializable

        # The date, in ISO 8601 format, when the message template was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The date, in ISO 8601 format, when the message template was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String

        # The name of the message template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # The type of channel that the message template is designed for. For a push notification template,
        # this value is PUSH.

        @[JSON::Field(key: "TemplateType")]
        getter template_type : String

        # The message template that's used for the ADM (Amazon Device Messaging) channel. This message
        # template overrides the default template for push notification channels
        # (DefaultPushNotificationTemplate).

        @[JSON::Field(key: "ADM")]
        getter adm : Types::AndroidPushNotificationTemplate?

        # The message template that's used for the APNs (Apple Push Notification service) channel. This
        # message template overrides the default template for push notification channels
        # (DefaultPushNotificationTemplate).

        @[JSON::Field(key: "APNS")]
        getter apns : Types::APNSPushNotificationTemplate?

        # The Amazon Resource Name (ARN) of the message template.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The message template that's used for the Baidu (Baidu Cloud Push) channel. This message template
        # overrides the default template for push notification channels (DefaultPushNotificationTemplate).

        @[JSON::Field(key: "Baidu")]
        getter baidu : Types::AndroidPushNotificationTemplate?

        # The default message template that's used for push notification channels.

        @[JSON::Field(key: "Default")]
        getter default : Types::DefaultPushNotificationTemplate?

        # The JSON object that specifies the default values that are used for message variables in the message
        # template. This object is a set of key-value pairs. Each key defines a message variable in the
        # template. The corresponding value defines the default value for that variable.

        @[JSON::Field(key: "DefaultSubstitutions")]
        getter default_substitutions : String?

        # The message template that's used for the GCM channel, which is used to send notifications through
        # the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service. This message
        # template overrides the default template for push notification channels
        # (DefaultPushNotificationTemplate).

        @[JSON::Field(key: "GCM")]
        getter gcm : Types::AndroidPushNotificationTemplate?

        # The unique identifier for the recommender model that's used by the message template.

        @[JSON::Field(key: "RecommenderId")]
        getter recommender_id : String?

        # The custom description of the message template.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        # The unique identifier, as an integer, for the active version of the message template, or the version
        # of the template that you specified by using the version parameter in your request.

        @[JSON::Field(key: "Version")]
        getter version : String?

        # A string-to-string map of key-value pairs that identifies the tags that are associated with the
        # message template. Each tag consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @creation_date : String,
          @last_modified_date : String,
          @template_name : String,
          @template_type : String,
          @adm : Types::AndroidPushNotificationTemplate? = nil,
          @apns : Types::APNSPushNotificationTemplate? = nil,
          @arn : String? = nil,
          @baidu : Types::AndroidPushNotificationTemplate? = nil,
          @default : Types::DefaultPushNotificationTemplate? = nil,
          @default_substitutions : String? = nil,
          @gcm : Types::AndroidPushNotificationTemplate? = nil,
          @recommender_id : String? = nil,
          @template_description : String? = nil,
          @version : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct PutEventStreamRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "WriteEventStream")]
        getter write_event_stream : Types::WriteEventStream

        def initialize(
          @application_id : String,
          @write_event_stream : Types::WriteEventStream
        )
        end
      end


      struct PutEventStreamResponse
        include JSON::Serializable


        @[JSON::Field(key: "EventStream")]
        getter event_stream : Types::EventStream

        def initialize(
          @event_stream : Types::EventStream
        )
        end
      end


      struct PutEventsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "EventsRequest")]
        getter events_request : Types::EventsRequest

        def initialize(
          @application_id : String,
          @events_request : Types::EventsRequest
        )
        end
      end


      struct PutEventsResponse
        include JSON::Serializable


        @[JSON::Field(key: "EventsResponse")]
        getter events_response : Types::EventsResponse

        def initialize(
          @events_response : Types::EventsResponse
        )
        end
      end

      # Specifies the start and end times that define a time range when messages aren't sent to endpoints.

      struct QuietTime
        include JSON::Serializable

        # The specific time when quiet time ends. This value has to use 24-hour notation and be in HH:MM
        # format, where HH is the hour (with a leading zero, if applicable) and MM is the minutes. For
        # example, use 02:30 to represent 2:30 AM, or 14:30 to represent 2:30 PM.

        @[JSON::Field(key: "End")]
        getter end : String?

        # The specific time when quiet time begins. This value has to use 24-hour notation and be in HH:MM
        # format, where HH is the hour (with a leading zero, if applicable) and MM is the minutes. For
        # example, use 02:30 to represent 2:30 AM, or 14:30 to represent 2:30 PM.

        @[JSON::Field(key: "Start")]
        getter start : String?

        def initialize(
          @end : String? = nil,
          @start : String? = nil
        )
        end
      end

      # Specifies the settings for a random split activity in a journey. This type of activity randomly
      # sends specified percentages of participants down one of as many as five paths in a journey, based on
      # conditions that you specify.

      struct RandomSplitActivity
        include JSON::Serializable

        # The paths for the activity, including the percentage of participants to enter each path and the
        # activity to perform for each path.

        @[JSON::Field(key: "Branches")]
        getter branches : Array(Types::RandomSplitEntry)?

        def initialize(
          @branches : Array(Types::RandomSplitEntry)? = nil
        )
        end
      end

      # Specifies the settings for a path in a random split activity in a journey.

      struct RandomSplitEntry
        include JSON::Serializable

        # The unique identifier for the next activity to perform, after completing the activity for the path.

        @[JSON::Field(key: "NextActivity")]
        getter next_activity : String?

        # The percentage of participants to send down the activity path. To determine which participants are
        # sent down each path, Amazon Pinpoint applies a probability-based algorithm to the percentages that
        # you specify for the paths. Therefore, the actual percentage of participants who are sent down a path
        # may not be equal to the percentage that you specify.

        @[JSON::Field(key: "Percentage")]
        getter percentage : Int32?

        def initialize(
          @next_activity : String? = nil,
          @percentage : Int32? = nil
        )
        end
      end

      # Specifies the contents of an email message, represented as a raw MIME message.

      struct RawEmail
        include JSON::Serializable

        # The email message, represented as a raw MIME message. The entire message must be base64 encoded.

        @[JSON::Field(key: "Data")]
        getter data : Bytes?

        def initialize(
          @data : Bytes? = nil
        )
        end
      end

      # Specifies criteria for including or excluding endpoints from a segment based on how recently an
      # endpoint was active.

      struct RecencyDimension
        include JSON::Serializable

        # The duration to use when determining whether an endpoint is active or inactive.

        @[JSON::Field(key: "Duration")]
        getter duration : String

        # The type of recency dimension to use for the segment. Valid values are: ACTIVE, endpoints that were
        # active within the specified duration are included in the segment; and, INACTIVE, endpoints that
        # weren't active within the specified duration are included in the segment.

        @[JSON::Field(key: "RecencyType")]
        getter recency_type : String

        def initialize(
          @duration : String,
          @recency_type : String
        )
        end
      end

      # Provides information about Amazon Pinpoint configuration settings for retrieving and processing data
      # from a recommender model.

      struct RecommenderConfigurationResponse
        include JSON::Serializable

        # The date, in extended ISO 8601 format, when the configuration was created for the recommender model.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The unique identifier for the recommender model configuration.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The date, in extended ISO 8601 format, when the configuration for the recommender model was last
        # modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes
        # Amazon Pinpoint to retrieve recommendation data from the recommender model.

        @[JSON::Field(key: "RecommendationProviderRoleArn")]
        getter recommendation_provider_role_arn : String

        # The Amazon Resource Name (ARN) of the recommender model that Amazon Pinpoint retrieves the
        # recommendation data from. This value is the ARN of an Amazon Personalize campaign.

        @[JSON::Field(key: "RecommendationProviderUri")]
        getter recommendation_provider_uri : String

        # A map that defines 1-10 custom endpoint or user attributes, depending on the value for the
        # RecommendationProviderIdType property. Each of these attributes temporarily stores a recommended
        # item that's retrieved from the recommender model and sent to an AWS Lambda function for additional
        # processing. Each attribute can be used as a message variable in a message template. This value is
        # null if the configuration doesn't invoke an AWS Lambda function (RecommendationTransformerUri) to
        # perform additional processing of recommendation data.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The custom description of the configuration for the recommender model.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The custom name of the configuration for the recommender model.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of Amazon Pinpoint ID that's associated with unique user IDs in the recommender model. This
        # value enables the model to use attribute and event data that’s specific to a particular endpoint or
        # user in an Amazon Pinpoint application. Possible values are: PINPOINT_ENDPOINT_ID - Each user in the
        # model is associated with a particular endpoint in Amazon Pinpoint. The data is correlated based on
        # endpoint IDs in Amazon Pinpoint. This is the default value. PINPOINT_USER_ID - Each user in the
        # model is associated with a particular user and endpoint in Amazon Pinpoint. The data is correlated
        # based on user IDs in Amazon Pinpoint. If this value is specified, an endpoint definition in Amazon
        # Pinpoint has to specify both a user ID (UserId) and an endpoint ID. Otherwise, messages won’t be
        # sent to the user's endpoint.

        @[JSON::Field(key: "RecommendationProviderIdType")]
        getter recommendation_provider_id_type : String?

        # The name or Amazon Resource Name (ARN) of the AWS Lambda function that Amazon Pinpoint invokes to
        # perform additional processing of recommendation data that it retrieves from the recommender model.

        @[JSON::Field(key: "RecommendationTransformerUri")]
        getter recommendation_transformer_uri : String?

        # The custom display name for the standard endpoint or user attribute (RecommendationItems) that
        # temporarily stores recommended items for each endpoint or user, depending on the value for the
        # RecommendationProviderIdType property. This name appears in the Attribute finder of the template
        # editor on the Amazon Pinpoint console. This value is null if the configuration doesn't invoke an AWS
        # Lambda function (RecommendationTransformerUri) to perform additional processing of recommendation
        # data.

        @[JSON::Field(key: "RecommendationsDisplayName")]
        getter recommendations_display_name : String?

        # The number of recommended items that are retrieved from the model for each endpoint or user,
        # depending on the value for the RecommendationProviderIdType property. This number determines how
        # many recommended items are available for use in message variables.

        @[JSON::Field(key: "RecommendationsPerMessage")]
        getter recommendations_per_message : Int32?

        def initialize(
          @creation_date : String,
          @id : String,
          @last_modified_date : String,
          @recommendation_provider_role_arn : String,
          @recommendation_provider_uri : String,
          @attributes : Hash(String, String)? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @recommendation_provider_id_type : String? = nil,
          @recommendation_transformer_uri : String? = nil,
          @recommendations_display_name : String? = nil,
          @recommendations_per_message : Int32? = nil
        )
        end
      end


      struct RemoveAttributesRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "attribute-type")]
        getter attribute_type : String


        @[JSON::Field(key: "UpdateAttributesRequest")]
        getter update_attributes_request : Types::UpdateAttributesRequest

        def initialize(
          @application_id : String,
          @attribute_type : String,
          @update_attributes_request : Types::UpdateAttributesRequest
        )
        end
      end


      struct RemoveAttributesResponse
        include JSON::Serializable


        @[JSON::Field(key: "AttributesResource")]
        getter attributes_resource : Types::AttributesResource

        def initialize(
          @attributes_resource : Types::AttributesResource
        )
        end
      end

      # Provides the results of a query that retrieved the data for a standard metric that applies to an
      # application, campaign, or journey.

      struct ResultRow
        include JSON::Serializable

        # An array of objects that defines the field and field values that were used to group data in a result
        # set that contains multiple results. This value is null if the data in a result set isn’t grouped.

        @[JSON::Field(key: "GroupedBys")]
        getter grouped_bys : Array(Types::ResultRowValue)

        # An array of objects that provides pre-aggregated values for a standard metric that applies to an
        # application, campaign, or journey.

        @[JSON::Field(key: "Values")]
        getter values : Array(Types::ResultRowValue)

        def initialize(
          @grouped_bys : Array(Types::ResultRowValue),
          @values : Array(Types::ResultRowValue)
        )
        end
      end

      # Provides a single value and metadata about that value as part of an array of query results for a
      # standard metric that applies to an application, campaign, or journey.

      struct ResultRowValue
        include JSON::Serializable

        # The friendly name of the metric whose value is specified by the Value property.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The data type of the value specified by the Value property.

        @[JSON::Field(key: "Type")]
        getter type : String

        # In a Values object, the value for the metric that the query retrieved data for. In a GroupedBys
        # object, the value for the field that was used to group data in a result set that contains multiple
        # results (Values objects).

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @type : String,
          @value : String
        )
        end
      end

      # Specifies the status and settings of the SMS channel for an application.

      struct SMSChannelRequest
        include JSON::Serializable

        # Specifies whether to enable the SMS channel for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The identity that you want to display on recipients' devices when they receive messages from the SMS
        # channel.

        @[JSON::Field(key: "SenderId")]
        getter sender_id : String?

        # The registered short code that you want to use when you send messages through the SMS channel.

        @[JSON::Field(key: "ShortCode")]
        getter short_code : String?

        def initialize(
          @enabled : Bool? = nil,
          @sender_id : String? = nil,
          @short_code : String? = nil
        )
        end
      end

      # Provides information about the status and settings of the SMS channel for an application.

      struct SMSChannelResponse
        include JSON::Serializable

        # The type of messaging or notification platform for the channel. For the SMS channel, this value is
        # SMS.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The unique identifier for the application that the SMS channel applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The date and time, in ISO 8601 format, when the SMS channel was enabled.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # Specifies whether the SMS channel is enabled for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # (Not used) This property is retained only for backward compatibility.

        @[JSON::Field(key: "HasCredential")]
        getter has_credential : Bool?

        # (Deprecated) An identifier for the SMS channel. This property is retained only for backward
        # compatibility.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Specifies whether the SMS channel is archived.

        @[JSON::Field(key: "IsArchived")]
        getter is_archived : Bool?

        # The user who last modified the SMS channel.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time, in ISO 8601 format, when the SMS channel was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The maximum number of promotional messages that you can send through the SMS channel each second.

        @[JSON::Field(key: "PromotionalMessagesPerSecond")]
        getter promotional_messages_per_second : Int32?

        # The identity that displays on recipients' devices when they receive messages from the SMS channel.

        @[JSON::Field(key: "SenderId")]
        getter sender_id : String?

        # The registered short code to use when you send messages through the SMS channel.

        @[JSON::Field(key: "ShortCode")]
        getter short_code : String?

        # The maximum number of transactional messages that you can send through the SMS channel each second.

        @[JSON::Field(key: "TransactionalMessagesPerSecond")]
        getter transactional_messages_per_second : Int32?

        # The current version of the SMS channel.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @platform : String,
          @application_id : String? = nil,
          @creation_date : String? = nil,
          @enabled : Bool? = nil,
          @has_credential : Bool? = nil,
          @id : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : String? = nil,
          @promotional_messages_per_second : Int32? = nil,
          @sender_id : String? = nil,
          @short_code : String? = nil,
          @transactional_messages_per_second : Int32? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Specifies the default settings for a one-time SMS message that's sent directly to an endpoint.

      struct SMSMessage
        include JSON::Serializable

        # The body of the SMS message.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The entity ID or Principal Entity (PE) id received from the regulatory body for sending SMS in your
        # country.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String?

        # The SMS program name that you provided to AWS Support when you requested your dedicated number.

        @[JSON::Field(key: "Keyword")]
        getter keyword : String?

        # This field is reserved for future use.

        @[JSON::Field(key: "MediaUrl")]
        getter media_url : String?

        # The SMS message type. Valid values are TRANSACTIONAL (for messages that are critical or
        # time-sensitive, such as a one-time passwords) and PROMOTIONAL (for messsages that aren't critical or
        # time-sensitive, such as marketing messages).

        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        # The number to send the SMS message from. This value should be one of the dedicated long or short
        # codes that's assigned to your AWS account. If you don't specify a long or short code, Amazon
        # Pinpoint assigns a random long code to the SMS message and sends the message from that code.

        @[JSON::Field(key: "OriginationNumber")]
        getter origination_number : String?

        # The sender ID to display as the sender of the message on a recipient's device. Support for sender
        # IDs varies by country or region.

        @[JSON::Field(key: "SenderId")]
        getter sender_id : String?

        # The message variables to use in the SMS message. You can override the default variables with
        # individual address variables.

        @[JSON::Field(key: "Substitutions")]
        getter substitutions : Hash(String, Array(String))?

        # The template ID received from the regulatory body for sending SMS in your country.

        @[JSON::Field(key: "TemplateId")]
        getter template_id : String?

        def initialize(
          @body : String? = nil,
          @entity_id : String? = nil,
          @keyword : String? = nil,
          @media_url : String? = nil,
          @message_type : String? = nil,
          @origination_number : String? = nil,
          @sender_id : String? = nil,
          @substitutions : Hash(String, Array(String))? = nil,
          @template_id : String? = nil
        )
        end
      end

      # Specifies the settings for an SMS activity in a journey. This type of activity sends a text message
      # to participants.

      struct SMSMessageActivity
        include JSON::Serializable

        # Specifies the sender ID and message type for an SMS message that's sent to participants in a
        # journey.

        @[JSON::Field(key: "MessageConfig")]
        getter message_config : Types::JourneySMSMessage?

        # The unique identifier for the next activity to perform, after the message is sent.

        @[JSON::Field(key: "NextActivity")]
        getter next_activity : String?

        # The name of the SMS message template to use for the message. If specified, this value must match the
        # name of an existing message template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # The unique identifier for the version of the SMS template to use for the message. If specified, this
        # value must match the identifier for an existing template version. To retrieve a list of versions and
        # version identifiers for a template, use the Template Versions resource. If you don't specify a value
        # for this property, Amazon Pinpoint uses the active version of the template. The active version is
        # typically the version of a template that's been most recently reviewed and approved for use,
        # depending on your workflow. It isn't necessarily the latest version of a template.

        @[JSON::Field(key: "TemplateVersion")]
        getter template_version : String?

        def initialize(
          @message_config : Types::JourneySMSMessage? = nil,
          @next_activity : String? = nil,
          @template_name : String? = nil,
          @template_version : String? = nil
        )
        end
      end

      # Specifies the content and settings for a message template that can be used in text messages that are
      # sent through the SMS channel.

      struct SMSTemplateRequest
        include JSON::Serializable

        # The message body to use in text messages that are based on the message template.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # A JSON object that specifies the default values to use for message variables in the message
        # template. This object is a set of key-value pairs. Each key defines a message variable in the
        # template. The corresponding value defines the default value for that variable. When you create a
        # message that's based on the template, you can override these defaults with message-specific and
        # address-specific variables and values.

        @[JSON::Field(key: "DefaultSubstitutions")]
        getter default_substitutions : String?

        # The unique identifier for the recommender model to use for the message template. Amazon Pinpoint
        # uses this value to determine how to retrieve and process data from a recommender model when it sends
        # messages that use the template, if the template contains message variables for recommendation data.

        @[JSON::Field(key: "RecommenderId")]
        getter recommender_id : String?

        # A custom description of the message template.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        # As of 22-05-2023 tags has been deprecated for update operations. After this date any value in tags
        # is not processed and an error code is not returned. To manage tags we recommend using either Tags in
        # the API Reference for Amazon Pinpoint , resourcegroupstaggingapi commands in the AWS Command Line
        # Interface Documentation or resourcegroupstaggingapi in the AWS SDK . (Deprecated) A string-to-string
        # map of key-value pairs that defines the tags to associate with the message template. Each tag
        # consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @body : String? = nil,
          @default_substitutions : String? = nil,
          @recommender_id : String? = nil,
          @template_description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about the content and settings for a message template that can be used in text
      # messages that are sent through the SMS channel.

      struct SMSTemplateResponse
        include JSON::Serializable

        # The date, in ISO 8601 format, when the message template was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The date, in ISO 8601 format, when the message template was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String

        # The name of the message template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # The type of channel that the message template is designed for. For an SMS template, this value is
        # SMS.

        @[JSON::Field(key: "TemplateType")]
        getter template_type : String

        # The Amazon Resource Name (ARN) of the message template.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The message body that's used in text messages that are based on the message template.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The JSON object that specifies the default values that are used for message variables in the message
        # template. This object is a set of key-value pairs. Each key defines a message variable in the
        # template. The corresponding value defines the default value for that variable.

        @[JSON::Field(key: "DefaultSubstitutions")]
        getter default_substitutions : String?

        # The unique identifier for the recommender model that's used by the message template.

        @[JSON::Field(key: "RecommenderId")]
        getter recommender_id : String?

        # The custom description of the message template.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        # The unique identifier, as an integer, for the active version of the message template, or the version
        # of the template that you specified by using the version parameter in your request.

        @[JSON::Field(key: "Version")]
        getter version : String?

        # A string-to-string map of key-value pairs that identifies the tags that are associated with the
        # message template. Each tag consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @creation_date : String,
          @last_modified_date : String,
          @template_name : String,
          @template_type : String,
          @arn : String? = nil,
          @body : String? = nil,
          @default_substitutions : String? = nil,
          @recommender_id : String? = nil,
          @template_description : String? = nil,
          @version : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Specifies the schedule settings for a campaign.

      struct Schedule
        include JSON::Serializable

        # The scheduled time when the campaign began or will begin. Valid values are: IMMEDIATE, to start the
        # campaign immediately; or, a specific time in ISO 8601 format.

        @[JSON::Field(key: "StartTime")]
        getter start_time : String

        # The scheduled time, in ISO 8601 format, when the campaign ended or will end.

        @[JSON::Field(key: "EndTime")]
        getter end_time : String?

        # The type of event that causes the campaign to be sent, if the value of the Frequency property is
        # EVENT.

        @[JSON::Field(key: "EventFilter")]
        getter event_filter : Types::CampaignEventFilter?

        # Specifies how often the campaign is sent or whether the campaign is sent in response to a specific
        # event.

        @[JSON::Field(key: "Frequency")]
        getter frequency : String?

        # Specifies whether the start and end times for the campaign schedule use each recipient's local time.
        # To base the schedule on each recipient's local time, set this value to true.

        @[JSON::Field(key: "IsLocalTime")]
        getter is_local_time : Bool?

        # The default quiet time for the campaign. Quiet time is a specific time range when a campaign doesn't
        # send messages to endpoints, if all the following conditions are met: The
        # EndpointDemographic.Timezone property of the endpoint is set to a valid value. The current time in
        # the endpoint's time zone is later than or equal to the time specified by the QuietTime.Start
        # property for the campaign. The current time in the endpoint's time zone is earlier than or equal to
        # the time specified by the QuietTime.End property for the campaign. If any of the preceding
        # conditions isn't met, the endpoint will receive messages from the campaign, even if quiet time is
        # enabled.

        @[JSON::Field(key: "QuietTime")]
        getter quiet_time : Types::QuietTime?

        # The starting UTC offset for the campaign schedule, if the value of the IsLocalTime property is true.
        # Valid values are: UTC, UTC+01, UTC+02, UTC+03, UTC+03:30, UTC+04, UTC+04:30, UTC+05, UTC+05:30,
        # UTC+05:45, UTC+06, UTC+06:30, UTC+07, UTC+08, UTC+09, UTC+09:30, UTC+10, UTC+10:30, UTC+11, UTC+12,
        # UTC+13, UTC-02, UTC-03, UTC-04, UTC-05, UTC-06, UTC-07, UTC-08, UTC-09, UTC-10, and UTC-11.

        @[JSON::Field(key: "Timezone")]
        getter timezone : String?

        def initialize(
          @start_time : String,
          @end_time : String? = nil,
          @event_filter : Types::CampaignEventFilter? = nil,
          @frequency : String? = nil,
          @is_local_time : Bool? = nil,
          @quiet_time : Types::QuietTime? = nil,
          @timezone : String? = nil
        )
        end
      end

      # Specifies dimension settings for including or excluding endpoints from a segment based on how
      # recently an endpoint was active.

      struct SegmentBehaviors
        include JSON::Serializable

        # The dimension settings that are based on how recently an endpoint was active.

        @[JSON::Field(key: "Recency")]
        getter recency : Types::RecencyDimension?

        def initialize(
          @recency : Types::RecencyDimension? = nil
        )
        end
      end

      # Specifies a segment to associate with an activity in a journey.

      struct SegmentCondition
        include JSON::Serializable

        # The unique identifier for the segment to associate with the activity.

        @[JSON::Field(key: "SegmentId")]
        getter segment_id : String

        def initialize(
          @segment_id : String
        )
        end
      end

      # Specifies demographic-based dimension settings for including or excluding endpoints from a segment.
      # These settings derive from characteristics of endpoint devices, such as platform, make, and model.

      struct SegmentDemographics
        include JSON::Serializable

        # The app version criteria for the segment.

        @[JSON::Field(key: "AppVersion")]
        getter app_version : Types::SetDimension?

        # The channel criteria for the segment.

        @[JSON::Field(key: "Channel")]
        getter channel : Types::SetDimension?

        # The device type criteria for the segment.

        @[JSON::Field(key: "DeviceType")]
        getter device_type : Types::SetDimension?

        # The device make criteria for the segment.

        @[JSON::Field(key: "Make")]
        getter make : Types::SetDimension?

        # The device model criteria for the segment.

        @[JSON::Field(key: "Model")]
        getter model : Types::SetDimension?

        # The device platform criteria for the segment.

        @[JSON::Field(key: "Platform")]
        getter platform : Types::SetDimension?

        def initialize(
          @app_version : Types::SetDimension? = nil,
          @channel : Types::SetDimension? = nil,
          @device_type : Types::SetDimension? = nil,
          @make : Types::SetDimension? = nil,
          @model : Types::SetDimension? = nil,
          @platform : Types::SetDimension? = nil
        )
        end
      end

      # Specifies the dimension settings for a segment.

      struct SegmentDimensions
        include JSON::Serializable

        # One or more custom attributes to use as criteria for the segment.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, Types::AttributeDimension)?

        # The behavior-based criteria, such as how recently users have used your app, for the segment.

        @[JSON::Field(key: "Behavior")]
        getter behavior : Types::SegmentBehaviors?

        # The demographic-based criteria, such as device platform, for the segment.

        @[JSON::Field(key: "Demographic")]
        getter demographic : Types::SegmentDemographics?

        # The location-based criteria, such as region or GPS coordinates, for the segment.

        @[JSON::Field(key: "Location")]
        getter location : Types::SegmentLocation?

        # One or more custom metrics to use as criteria for the segment.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, Types::MetricDimension)?

        # One or more custom user attributes to use as criteria for the segment.

        @[JSON::Field(key: "UserAttributes")]
        getter user_attributes : Hash(String, Types::AttributeDimension)?

        def initialize(
          @attributes : Hash(String, Types::AttributeDimension)? = nil,
          @behavior : Types::SegmentBehaviors? = nil,
          @demographic : Types::SegmentDemographics? = nil,
          @location : Types::SegmentLocation? = nil,
          @metrics : Hash(String, Types::MetricDimension)? = nil,
          @user_attributes : Hash(String, Types::AttributeDimension)? = nil
        )
        end
      end

      # Specifies the base segments and dimensions for a segment, and the relationships between these base
      # segments and dimensions.

      struct SegmentGroup
        include JSON::Serializable

        # An array that defines the dimensions for the segment.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::SegmentDimensions)?

        # The base segment to build the segment on. A base segment, also referred to as a source segment ,
        # defines the initial population of endpoints for a segment. When you add dimensions to a segment,
        # Amazon Pinpoint filters the base segment by using the dimensions that you specify. You can specify
        # more than one dimensional segment or only one imported segment. If you specify an imported segment,
        # the Amazon Pinpoint console displays a segment size estimate that indicates the size of the imported
        # segment without any filters applied to it.

        @[JSON::Field(key: "SourceSegments")]
        getter source_segments : Array(Types::SegmentReference)?

        # Specifies how to handle multiple base segments for the segment. For example, if you specify three
        # base segments for the segment, whether the resulting segment is based on all, any, or none of the
        # base segments.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # Specifies how to handle multiple dimensions for the segment. For example, if you specify three
        # dimensions for the segment, whether the resulting segment includes endpoints that match all, any, or
        # none of the dimensions.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @dimensions : Array(Types::SegmentDimensions)? = nil,
          @source_segments : Array(Types::SegmentReference)? = nil,
          @source_type : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Specifies the settings that define the relationships between segment groups for a segment.

      struct SegmentGroupList
        include JSON::Serializable

        # An array that defines the set of segment criteria to evaluate when handling segment groups for the
        # segment.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::SegmentGroup)?

        # Specifies how to handle multiple segment groups for the segment. For example, if the segment
        # includes three segment groups, whether the resulting segment includes endpoints that match all, any,
        # or none of the segment groups.

        @[JSON::Field(key: "Include")]
        getter include : String?

        def initialize(
          @groups : Array(Types::SegmentGroup)? = nil,
          @include : String? = nil
        )
        end
      end

      # Provides information about the import job that created a segment. An import job is a job that
      # creates a user segment by importing endpoint definitions.

      struct SegmentImportResource
        include JSON::Serializable

        # (Deprecated) Your AWS account ID, which you assigned to an external ID key in an IAM trust policy.
        # Amazon Pinpoint previously used this value to assume an IAM role when importing endpoint
        # definitions, but we removed this requirement. We don't recommend use of external IDs for IAM roles
        # that are assumed by Amazon Pinpoint.

        @[JSON::Field(key: "ExternalId")]
        getter external_id : String

        # The format of the files that were imported to create the segment. Valid values are: CSV, for
        # comma-separated values format; and, JSON, for newline-delimited JSON format.

        @[JSON::Field(key: "Format")]
        getter format : String

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorized
        # Amazon Pinpoint to access the Amazon S3 location to import endpoint definitions from.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The URL of the Amazon Simple Storage Service (Amazon S3) bucket that the endpoint definitions were
        # imported from to create the segment.

        @[JSON::Field(key: "S3Url")]
        getter s3_url : String

        # The number of endpoint definitions that were imported successfully to create the segment.

        @[JSON::Field(key: "Size")]
        getter size : Int32

        # The number of channel types in the endpoint definitions that were imported to create the segment.

        @[JSON::Field(key: "ChannelCounts")]
        getter channel_counts : Hash(String, Int32)?

        def initialize(
          @external_id : String,
          @format : String,
          @role_arn : String,
          @s3_url : String,
          @size : Int32,
          @channel_counts : Hash(String, Int32)? = nil
        )
        end
      end

      # Specifies geographical dimension settings for a segment.

      struct SegmentLocation
        include JSON::Serializable

        # The country or region code, in ISO 3166-1 alpha-2 format, for the segment.

        @[JSON::Field(key: "Country")]
        getter country : Types::SetDimension?

        # The GPS location and range for the segment.

        @[JSON::Field(key: "GPSPoint")]
        getter gps_point : Types::GPSPointDimension?

        def initialize(
          @country : Types::SetDimension? = nil,
          @gps_point : Types::GPSPointDimension? = nil
        )
        end
      end

      # Specifies the segment identifier and version of a segment.

      struct SegmentReference
        include JSON::Serializable

        # The unique identifier for the segment.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The version number of the segment.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @id : String,
          @version : Int32? = nil
        )
        end
      end

      # Provides information about the configuration, dimension, and other settings for a segment.

      struct SegmentResponse
        include JSON::Serializable

        # The unique identifier for the application that the segment is associated with.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The Amazon Resource Name (ARN) of the segment.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date and time when the segment was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The unique identifier for the segment.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The segment type. Valid values are: DIMENSIONAL - A dynamic segment, which is a segment that uses
        # selection criteria that you specify and is based on endpoint data that's reported by your app.
        # Dynamic segments can change over time. IMPORT - A static segment, which is a segment that uses
        # selection criteria that you specify and is based on endpoint definitions that you import from a
        # file. Imported segments are static; they don't change over time.

        @[JSON::Field(key: "SegmentType")]
        getter segment_type : String

        # The dimension settings for the segment.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Types::SegmentDimensions?

        # The settings for the import job that's associated with the segment.

        @[JSON::Field(key: "ImportDefinition")]
        getter import_definition : Types::SegmentImportResource?

        # The date and time when the segment was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The name of the segment.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of one or more segment groups that apply to the segment. Each segment group consists of zero
        # or more base segments and the dimensions that are applied to those base segments.

        @[JSON::Field(key: "SegmentGroups")]
        getter segment_groups : Types::SegmentGroupList?

        # The version number of the segment.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        # A string-to-string map of key-value pairs that identifies the tags that are associated with the
        # segment. Each tag consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_id : String,
          @arn : String,
          @creation_date : String,
          @id : String,
          @segment_type : String,
          @dimensions : Types::SegmentDimensions? = nil,
          @import_definition : Types::SegmentImportResource? = nil,
          @last_modified_date : String? = nil,
          @name : String? = nil,
          @segment_groups : Types::SegmentGroupList? = nil,
          @version : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about all the segments that are associated with an application.

      struct SegmentsResponse
        include JSON::Serializable

        # An array of responses, one for each segment that's associated with the application (Segments
        # resource) or each version of a segment that's associated with the application (Segment Versions
        # resource).

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::SegmentResponse)

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null if there are no additional pages.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @item : Array(Types::SegmentResponse),
          @next_token : String? = nil
        )
        end
      end


      struct SendMessagesRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "MessageRequest")]
        getter message_request : Types::MessageRequest

        def initialize(
          @application_id : String,
          @message_request : Types::MessageRequest
        )
        end
      end


      struct SendMessagesResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageResponse")]
        getter message_response : Types::MessageResponse

        def initialize(
          @message_response : Types::MessageResponse
        )
        end
      end


      struct SendOTPMessageRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "SendOTPMessageRequestParameters")]
        getter send_otp_message_request_parameters : Types::SendOTPMessageRequestParameters

        def initialize(
          @application_id : String,
          @send_otp_message_request_parameters : Types::SendOTPMessageRequestParameters
        )
        end
      end

      # Send OTP message request parameters.

      struct SendOTPMessageRequestParameters
        include JSON::Serializable

        # The brand name that will be substituted into the OTP message body. Should be owned by calling AWS
        # account.

        @[JSON::Field(key: "BrandName")]
        getter brand_name : String

        # Channel type for the OTP message. Supported values: [SMS].

        @[JSON::Field(key: "Channel")]
        getter channel : String

        # The destination identity to send OTP to.

        @[JSON::Field(key: "DestinationIdentity")]
        getter destination_identity : String

        # The origination identity used to send OTP from.

        @[JSON::Field(key: "OriginationIdentity")]
        getter origination_identity : String

        # Developer-specified reference identifier. Required to match during OTP verification.

        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : String

        # The attempts allowed to validate an OTP.

        @[JSON::Field(key: "AllowedAttempts")]
        getter allowed_attempts : Int32?

        # The number of characters in the generated OTP.

        @[JSON::Field(key: "CodeLength")]
        getter code_length : Int32?

        # A unique Entity ID received from DLT after entity registration is approved.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String?

        # The language to be used for the outgoing message body containing the OTP.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # A unique Template ID received from DLT after entity registration is approved.

        @[JSON::Field(key: "TemplateId")]
        getter template_id : String?

        # The time in minutes before the OTP is no longer valid.

        @[JSON::Field(key: "ValidityPeriod")]
        getter validity_period : Int32?

        def initialize(
          @brand_name : String,
          @channel : String,
          @destination_identity : String,
          @origination_identity : String,
          @reference_id : String,
          @allowed_attempts : Int32? = nil,
          @code_length : Int32? = nil,
          @entity_id : String? = nil,
          @language : String? = nil,
          @template_id : String? = nil,
          @validity_period : Int32? = nil
        )
        end
      end


      struct SendOTPMessageResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageResponse")]
        getter message_response : Types::MessageResponse

        def initialize(
          @message_response : Types::MessageResponse
        )
        end
      end

      # Specifies the configuration and other settings for a message to send to all the endpoints that are
      # associated with a list of users.

      struct SendUsersMessageRequest
        include JSON::Serializable

        # The settings and content for the default message and any default messages that you defined for
        # specific channels.

        @[JSON::Field(key: "MessageConfiguration")]
        getter message_configuration : Types::DirectMessageConfiguration

        # A map that associates user IDs with EndpointSendConfiguration objects. You can use an
        # EndpointSendConfiguration object to tailor the message for a user by specifying settings such as
        # content overrides and message variables.

        @[JSON::Field(key: "Users")]
        getter users : Hash(String, Types::EndpointSendConfiguration)

        # A map of custom attribute-value pairs. For a push notification, Amazon Pinpoint adds these
        # attributes to the data.pinpoint object in the body of the notification payload. Amazon Pinpoint also
        # provides these attributes in the events that it generates for users-messages deliveries.

        @[JSON::Field(key: "Context")]
        getter context : Hash(String, String)?

        # The message template to use for the message.

        @[JSON::Field(key: "TemplateConfiguration")]
        getter template_configuration : Types::TemplateConfiguration?

        # The unique identifier for tracing the message. This identifier is visible to message recipients.

        @[JSON::Field(key: "TraceId")]
        getter trace_id : String?

        def initialize(
          @message_configuration : Types::DirectMessageConfiguration,
          @users : Hash(String, Types::EndpointSendConfiguration),
          @context : Hash(String, String)? = nil,
          @template_configuration : Types::TemplateConfiguration? = nil,
          @trace_id : String? = nil
        )
        end
      end

      # Provides information about which users and endpoints a message was sent to.

      struct SendUsersMessageResponse
        include JSON::Serializable

        # The unique identifier for the application that was used to send the message.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The unique identifier that was assigned to the message request.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # An object that indicates which endpoints the message was sent to, for each user. The object lists
        # user IDs and, for each user ID, provides the endpoint IDs that the message was sent to. For each
        # endpoint ID, it provides an EndpointMessageResult object.

        @[JSON::Field(key: "Result")]
        getter result : Hash(String, Hash(String, Types::EndpointMessageResult))?

        def initialize(
          @application_id : String,
          @request_id : String? = nil,
          @result : Hash(String, Hash(String, Types::EndpointMessageResult))? = nil
        )
        end
      end


      struct SendUsersMessagesRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "SendUsersMessageRequest")]
        getter send_users_message_request : Types::SendUsersMessageRequest

        def initialize(
          @application_id : String,
          @send_users_message_request : Types::SendUsersMessageRequest
        )
        end
      end


      struct SendUsersMessagesResponse
        include JSON::Serializable


        @[JSON::Field(key: "SendUsersMessageResponse")]
        getter send_users_message_response : Types::SendUsersMessageResponse

        def initialize(
          @send_users_message_response : Types::SendUsersMessageResponse
        )
        end
      end

      # Provides information about a session.

      struct Session
        include JSON::Serializable

        # The unique identifier for the session.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time when the session began.

        @[JSON::Field(key: "StartTimestamp")]
        getter start_timestamp : String

        # The duration of the session, in milliseconds.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The date and time when the session ended.

        @[JSON::Field(key: "StopTimestamp")]
        getter stop_timestamp : String?

        def initialize(
          @id : String,
          @start_timestamp : String,
          @duration : Int32? = nil,
          @stop_timestamp : String? = nil
        )
        end
      end

      # Specifies the dimension type and values for a segment dimension.

      struct SetDimension
        include JSON::Serializable

        # The criteria values to use for the segment dimension. Depending on the value of the DimensionType
        # property, endpoints are included or excluded from the segment if their values match the criteria
        # values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        # The type of segment dimension to use. Valid values are: INCLUSIVE, endpoints that match the criteria
        # are included in the segment; and, EXCLUSIVE, endpoints that match the criteria are excluded from the
        # segment.

        @[JSON::Field(key: "DimensionType")]
        getter dimension_type : String?

        def initialize(
          @values : Array(String),
          @dimension_type : String? = nil
        )
        end
      end

      # Specifies a condition to evaluate for an activity in a journey.

      struct SimpleCondition
        include JSON::Serializable

        # The dimension settings for the event that's associated with the activity.

        @[JSON::Field(key: "EventCondition")]
        getter event_condition : Types::EventCondition?

        # The segment that's associated with the activity.

        @[JSON::Field(key: "SegmentCondition")]
        getter segment_condition : Types::SegmentCondition?

        # The dimension settings for the segment that's associated with the activity.

        @[JSON::Field(key: "segmentDimensions")]
        getter segment_dimensions : Types::SegmentDimensions?

        def initialize(
          @event_condition : Types::EventCondition? = nil,
          @segment_condition : Types::SegmentCondition? = nil,
          @segment_dimensions : Types::SegmentDimensions? = nil
        )
        end
      end

      # Specifies the contents of an email message, composed of a subject, a text part, and an HTML part.

      struct SimpleEmail
        include JSON::Serializable

        # List of Headers for the email.

        @[JSON::Field(key: "Headers")]
        getter headers : Array(Types::MessageHeader)?

        # The body of the email message, in HTML format. We recommend using HTML format for email clients that
        # render HTML content. You can include links, formatted text, and more in an HTML message.

        @[JSON::Field(key: "HtmlPart")]
        getter html_part : Types::SimpleEmailPart?

        # The subject line, or title, of the email.

        @[JSON::Field(key: "Subject")]
        getter subject : Types::SimpleEmailPart?

        # The body of the email message, in plain text format. We recommend using plain text format for email
        # clients that don't render HTML content and clients that are connected to high-latency networks, such
        # as mobile devices.

        @[JSON::Field(key: "TextPart")]
        getter text_part : Types::SimpleEmailPart?

        def initialize(
          @headers : Array(Types::MessageHeader)? = nil,
          @html_part : Types::SimpleEmailPart? = nil,
          @subject : Types::SimpleEmailPart? = nil,
          @text_part : Types::SimpleEmailPart? = nil
        )
        end
      end

      # Specifies the subject or body of an email message, represented as textual email data and the
      # applicable character set.

      struct SimpleEmailPart
        include JSON::Serializable

        # The applicable character set for the message content.

        @[JSON::Field(key: "Charset")]
        getter charset : String?

        # The textual data of the message content.

        @[JSON::Field(key: "Data")]
        getter data : String?

        def initialize(
          @charset : String? = nil,
          @data : String? = nil
        )
        end
      end

      # Specifies the conditions for the first activity in a journey. This activity and its conditions
      # determine which users are participants in a journey.

      struct StartCondition
        include JSON::Serializable

        # The custom description of the condition.

        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "EventStartCondition")]
        getter event_start_condition : Types::EventStartCondition?

        # The segment that's associated with the first activity in the journey. This segment determines which
        # users are participants in the journey.

        @[JSON::Field(key: "SegmentStartCondition")]
        getter segment_start_condition : Types::SegmentCondition?

        def initialize(
          @description : String? = nil,
          @event_start_condition : Types::EventStartCondition? = nil,
          @segment_start_condition : Types::SegmentCondition? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


        @[JSON::Field(key: "TagsModel")]
        getter tags_model : Types::TagsModel

        def initialize(
          @resource_arn : String,
          @tags_model : Types::TagsModel
        )
        end
      end

      # Specifies the tags (keys and values) for an application, campaign, message template, or segment.

      struct TagsModel
        include JSON::Serializable

        # A string-to-string map of key-value pairs that defines the tags for an application, campaign,
        # message template, or segment. Each of these resources can have a maximum of 50 tags. Each tag
        # consists of a required tag key and an associated tag value. The maximum length of a tag key is 128
        # characters. The maximum length of a tag value is 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      # Specifies the name and version of the message template to use for the message.

      struct Template
        include JSON::Serializable

        # The name of the message template to use for the message. If specified, this value must match the
        # name of an existing message template.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique identifier for the version of the message template to use for the message. If specified,
        # this value must match the identifier for an existing template version. To retrieve a list of
        # versions and version identifiers for a template, use the Template Versions resource. If you don't
        # specify a value for this property, Amazon Pinpoint uses the active version of the template. The
        # active version is typically the version of a template that's been most recently reviewed and
        # approved for use, depending on your workflow. It isn't necessarily the latest version of a template.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Specifies which version of a message template to use as the active version of the template.

      struct TemplateActiveVersionRequest
        include JSON::Serializable

        # The version of the message template to use as the active version of the template. Valid values are:
        # latest, for the most recent version of the template; or, the unique identifier for any existing
        # version of the template. If you specify an identifier, the value must match the identifier for an
        # existing template version. To retrieve a list of versions and version identifiers for a template,
        # use the Template Versions resource.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @version : String? = nil
        )
        end
      end

      # Specifies the message template to use for the message, for each type of channel.

      struct TemplateConfiguration
        include JSON::Serializable

        # The email template to use for the message.

        @[JSON::Field(key: "EmailTemplate")]
        getter email_template : Types::Template?

        # The InApp template to use for the message. The InApp template object is not supported for
        # SendMessages.

        @[JSON::Field(key: "InAppTemplate")]
        getter in_app_template : Types::Template?

        # The push notification template to use for the message.

        @[JSON::Field(key: "PushTemplate")]
        getter push_template : Types::Template?

        # The SMS template to use for the message.

        @[JSON::Field(key: "SMSTemplate")]
        getter sms_template : Types::Template?

        # The voice template to use for the message. This object isn't supported for campaigns.

        @[JSON::Field(key: "VoiceTemplate")]
        getter voice_template : Types::Template?

        def initialize(
          @email_template : Types::Template? = nil,
          @in_app_template : Types::Template? = nil,
          @push_template : Types::Template? = nil,
          @sms_template : Types::Template? = nil,
          @voice_template : Types::Template? = nil
        )
        end
      end

      # Provides information about a request to create a message template.

      struct TemplateCreateMessageBody
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the message template that was created.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The message that's returned from the API for the request to create the message template.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The unique identifier for the request to create the message template.

        @[JSON::Field(key: "RequestID")]
        getter request_id : String?

        def initialize(
          @arn : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Provides information about a message template that's associated with your Amazon Pinpoint account.

      struct TemplateResponse
        include JSON::Serializable

        # The date, in ISO 8601 format, when the message template was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The date, in ISO 8601 format, when the message template was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String

        # The name of the message template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # The type of channel that the message template is designed for. Possible values are: EMAIL, PUSH,
        # SMS, INAPP, and VOICE.

        @[JSON::Field(key: "TemplateType")]
        getter template_type : String

        # The Amazon Resource Name (ARN) of the message template. This value isn't included in a
        # TemplateResponse object. To retrieve the ARN of a template, use the GetEmailTemplate,
        # GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation, depending on the type of template
        # that you want to retrieve the ARN for.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The JSON object that specifies the default values that are used for message variables in the message
        # template. This object isn't included in a TemplateResponse object. To retrieve this object for a
        # template, use the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation,
        # depending on the type of template that you want to retrieve the object for.

        @[JSON::Field(key: "DefaultSubstitutions")]
        getter default_substitutions : String?

        # The custom description of the message template. This value isn't included in a TemplateResponse
        # object. To retrieve the description of a template, use the GetEmailTemplate, GetPushTemplate,
        # GetSmsTemplate, or GetVoiceTemplate operation, depending on the type of template that you want to
        # retrieve the description for.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        # The unique identifier, as an integer, for the active version of the message template.

        @[JSON::Field(key: "Version")]
        getter version : String?

        # A map of key-value pairs that identifies the tags that are associated with the message template.
        # This object isn't included in a TemplateResponse object. To retrieve this object for a template, use
        # the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation, depending on
        # the type of template that you want to retrieve the object for.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @creation_date : String,
          @last_modified_date : String,
          @template_name : String,
          @template_type : String,
          @arn : String? = nil,
          @default_substitutions : String? = nil,
          @template_description : String? = nil,
          @version : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about a specific version of a message template.

      struct TemplateVersionResponse
        include JSON::Serializable

        # The date, in ISO 8601 format, when the version of the message template was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The date, in ISO 8601 format, when the version of the message template was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String

        # The name of the message template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # The type of channel that the message template is designed for. Possible values are: EMAIL, PUSH,
        # SMS, INAPP, and VOICE.

        @[JSON::Field(key: "TemplateType")]
        getter template_type : String

        # A JSON object that specifies the default values that are used for message variables in the version
        # of the message template. This object is a set of key-value pairs. Each key defines a message
        # variable in the template. The corresponding value defines the default value for that variable.

        @[JSON::Field(key: "DefaultSubstitutions")]
        getter default_substitutions : String?

        # The custom description of the version of the message template.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        # The unique identifier for the version of the message template. This value is an integer that Amazon
        # Pinpoint automatically increments and assigns to each new version of a template.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @creation_date : String,
          @last_modified_date : String,
          @template_name : String,
          @template_type : String,
          @default_substitutions : String? = nil,
          @template_description : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Provides information about all the versions of a specific message template.

      struct TemplateVersionsResponse
        include JSON::Serializable

        # An array of responses, one for each version of the message template.

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::TemplateVersionResponse)

        # The message that's returned from the API for the request to retrieve information about all the
        # versions of the message template.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null if there are no additional pages.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The unique identifier for the request to retrieve information about all the versions of the message
        # template.

        @[JSON::Field(key: "RequestID")]
        getter request_id : String?

        def initialize(
          @item : Array(Types::TemplateVersionResponse),
          @message : String? = nil,
          @next_token : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Provides information about all the message templates that are associated with your Amazon Pinpoint
      # account.

      struct TemplatesResponse
        include JSON::Serializable

        # An array of responses, one for each message template that's associated with your Amazon Pinpoint
        # account and meets any filter criteria that you specified in the request.

        @[JSON::Field(key: "Item")]
        getter item : Array(Types::TemplateResponse)

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null if there are no additional pages.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @item : Array(Types::TemplateResponse),
          @next_token : String? = nil
        )
        end
      end

      # Provides information about an API request or response.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestID")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Specifies the settings for a campaign treatment. A treatment is a variation of a campaign that's
      # used for A/B testing of a campaign.

      struct TreatmentResource
        include JSON::Serializable

        # The unique identifier for the treatment.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The allocated percentage of users (segment members) that the treatment is sent to.

        @[JSON::Field(key: "SizePercent")]
        getter size_percent : Int32

        # The delivery configuration settings for sending the treatment through a custom channel. This object
        # is required if the MessageConfiguration object for the treatment specifies a CustomMessage object.

        @[JSON::Field(key: "CustomDeliveryConfiguration")]
        getter custom_delivery_configuration : Types::CustomDeliveryConfiguration?

        # The message configuration settings for the treatment.

        @[JSON::Field(key: "MessageConfiguration")]
        getter message_configuration : Types::MessageConfiguration?

        # The schedule settings for the treatment.

        @[JSON::Field(key: "Schedule")]
        getter schedule : Types::Schedule?

        # The current status of the treatment.

        @[JSON::Field(key: "State")]
        getter state : Types::CampaignState?

        # The message template to use for the treatment.

        @[JSON::Field(key: "TemplateConfiguration")]
        getter template_configuration : Types::TemplateConfiguration?

        # The custom description of the treatment.

        @[JSON::Field(key: "TreatmentDescription")]
        getter treatment_description : String?

        # The custom name of the treatment.

        @[JSON::Field(key: "TreatmentName")]
        getter treatment_name : String?

        def initialize(
          @id : String,
          @size_percent : Int32,
          @custom_delivery_configuration : Types::CustomDeliveryConfiguration? = nil,
          @message_configuration : Types::MessageConfiguration? = nil,
          @schedule : Types::Schedule? = nil,
          @state : Types::CampaignState? = nil,
          @template_configuration : Types::TemplateConfiguration? = nil,
          @treatment_description : String? = nil,
          @treatment_name : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateAdmChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "ADMChannelRequest")]
        getter adm_channel_request : Types::ADMChannelRequest


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @adm_channel_request : Types::ADMChannelRequest,
          @application_id : String
        )
        end
      end


      struct UpdateAdmChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "ADMChannelResponse")]
        getter adm_channel_response : Types::ADMChannelResponse

        def initialize(
          @adm_channel_response : Types::ADMChannelResponse
        )
        end
      end


      struct UpdateApnsChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "APNSChannelRequest")]
        getter apns_channel_request : Types::APNSChannelRequest


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @apns_channel_request : Types::APNSChannelRequest,
          @application_id : String
        )
        end
      end


      struct UpdateApnsChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "APNSChannelResponse")]
        getter apns_channel_response : Types::APNSChannelResponse

        def initialize(
          @apns_channel_response : Types::APNSChannelResponse
        )
        end
      end


      struct UpdateApnsSandboxChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "APNSSandboxChannelRequest")]
        getter apns_sandbox_channel_request : Types::APNSSandboxChannelRequest


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @apns_sandbox_channel_request : Types::APNSSandboxChannelRequest,
          @application_id : String
        )
        end
      end


      struct UpdateApnsSandboxChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "APNSSandboxChannelResponse")]
        getter apns_sandbox_channel_response : Types::APNSSandboxChannelResponse

        def initialize(
          @apns_sandbox_channel_response : Types::APNSSandboxChannelResponse
        )
        end
      end


      struct UpdateApnsVoipChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "APNSVoipChannelRequest")]
        getter apns_voip_channel_request : Types::APNSVoipChannelRequest


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @apns_voip_channel_request : Types::APNSVoipChannelRequest,
          @application_id : String
        )
        end
      end


      struct UpdateApnsVoipChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "APNSVoipChannelResponse")]
        getter apns_voip_channel_response : Types::APNSVoipChannelResponse

        def initialize(
          @apns_voip_channel_response : Types::APNSVoipChannelResponse
        )
        end
      end


      struct UpdateApnsVoipSandboxChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "APNSVoipSandboxChannelRequest")]
        getter apns_voip_sandbox_channel_request : Types::APNSVoipSandboxChannelRequest


        @[JSON::Field(key: "application-id")]
        getter application_id : String

        def initialize(
          @apns_voip_sandbox_channel_request : Types::APNSVoipSandboxChannelRequest,
          @application_id : String
        )
        end
      end


      struct UpdateApnsVoipSandboxChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "APNSVoipSandboxChannelResponse")]
        getter apns_voip_sandbox_channel_response : Types::APNSVoipSandboxChannelResponse

        def initialize(
          @apns_voip_sandbox_channel_response : Types::APNSVoipSandboxChannelResponse
        )
        end
      end


      struct UpdateApplicationSettingsRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "WriteApplicationSettingsRequest")]
        getter write_application_settings_request : Types::WriteApplicationSettingsRequest

        def initialize(
          @application_id : String,
          @write_application_settings_request : Types::WriteApplicationSettingsRequest
        )
        end
      end


      struct UpdateApplicationSettingsResponse
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationSettingsResource")]
        getter application_settings_resource : Types::ApplicationSettingsResource

        def initialize(
          @application_settings_resource : Types::ApplicationSettingsResource
        )
        end
      end

      # Specifies one or more attributes to remove from all the endpoints that are associated with an
      # application.

      struct UpdateAttributesRequest
        include JSON::Serializable

        # An array of the attributes to remove from all the endpoints that are associated with the
        # application. The array can specify the complete, exact name of each attribute to remove or it can
        # specify a glob pattern that an attribute name must match in order for the attribute to be removed.

        @[JSON::Field(key: "Blacklist")]
        getter blacklist : Array(String)?

        def initialize(
          @blacklist : Array(String)? = nil
        )
        end
      end


      struct UpdateBaiduChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "BaiduChannelRequest")]
        getter baidu_channel_request : Types::BaiduChannelRequest

        def initialize(
          @application_id : String,
          @baidu_channel_request : Types::BaiduChannelRequest
        )
        end
      end


      struct UpdateBaiduChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "BaiduChannelResponse")]
        getter baidu_channel_response : Types::BaiduChannelResponse

        def initialize(
          @baidu_channel_response : Types::BaiduChannelResponse
        )
        end
      end


      struct UpdateCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "campaign-id")]
        getter campaign_id : String


        @[JSON::Field(key: "WriteCampaignRequest")]
        getter write_campaign_request : Types::WriteCampaignRequest

        def initialize(
          @application_id : String,
          @campaign_id : String,
          @write_campaign_request : Types::WriteCampaignRequest
        )
        end
      end


      struct UpdateCampaignResponse
        include JSON::Serializable


        @[JSON::Field(key: "CampaignResponse")]
        getter campaign_response : Types::CampaignResponse

        def initialize(
          @campaign_response : Types::CampaignResponse
        )
        end
      end


      struct UpdateEmailChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "EmailChannelRequest")]
        getter email_channel_request : Types::EmailChannelRequest

        def initialize(
          @application_id : String,
          @email_channel_request : Types::EmailChannelRequest
        )
        end
      end


      struct UpdateEmailChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "EmailChannelResponse")]
        getter email_channel_response : Types::EmailChannelResponse

        def initialize(
          @email_channel_response : Types::EmailChannelResponse
        )
        end
      end


      struct UpdateEmailTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "EmailTemplateRequest")]
        getter email_template_request : Types::EmailTemplateRequest


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "create-new-version")]
        getter create_new_version : Bool?


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @email_template_request : Types::EmailTemplateRequest,
          @template_name : String,
          @create_new_version : Bool? = nil,
          @version : String? = nil
        )
        end
      end


      struct UpdateEmailTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end


      struct UpdateEndpointRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "endpoint-id")]
        getter endpoint_id : String


        @[JSON::Field(key: "EndpointRequest")]
        getter endpoint_request : Types::EndpointRequest

        def initialize(
          @application_id : String,
          @endpoint_id : String,
          @endpoint_request : Types::EndpointRequest
        )
        end
      end


      struct UpdateEndpointResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end


      struct UpdateEndpointsBatchRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "EndpointBatchRequest")]
        getter endpoint_batch_request : Types::EndpointBatchRequest

        def initialize(
          @application_id : String,
          @endpoint_batch_request : Types::EndpointBatchRequest
        )
        end
      end


      struct UpdateEndpointsBatchResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end


      struct UpdateGcmChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "GCMChannelRequest")]
        getter gcm_channel_request : Types::GCMChannelRequest

        def initialize(
          @application_id : String,
          @gcm_channel_request : Types::GCMChannelRequest
        )
        end
      end


      struct UpdateGcmChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "GCMChannelResponse")]
        getter gcm_channel_response : Types::GCMChannelResponse

        def initialize(
          @gcm_channel_response : Types::GCMChannelResponse
        )
        end
      end


      struct UpdateInAppTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "InAppTemplateRequest")]
        getter in_app_template_request : Types::InAppTemplateRequest


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "create-new-version")]
        getter create_new_version : Bool?


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @in_app_template_request : Types::InAppTemplateRequest,
          @template_name : String,
          @create_new_version : Bool? = nil,
          @version : String? = nil
        )
        end
      end


      struct UpdateInAppTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end


      struct UpdateJourneyRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "journey-id")]
        getter journey_id : String


        @[JSON::Field(key: "WriteJourneyRequest")]
        getter write_journey_request : Types::WriteJourneyRequest

        def initialize(
          @application_id : String,
          @journey_id : String,
          @write_journey_request : Types::WriteJourneyRequest
        )
        end
      end


      struct UpdateJourneyResponse
        include JSON::Serializable


        @[JSON::Field(key: "JourneyResponse")]
        getter journey_response : Types::JourneyResponse

        def initialize(
          @journey_response : Types::JourneyResponse
        )
        end
      end


      struct UpdateJourneyStateRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "journey-id")]
        getter journey_id : String


        @[JSON::Field(key: "JourneyStateRequest")]
        getter journey_state_request : Types::JourneyStateRequest

        def initialize(
          @application_id : String,
          @journey_id : String,
          @journey_state_request : Types::JourneyStateRequest
        )
        end
      end


      struct UpdateJourneyStateResponse
        include JSON::Serializable


        @[JSON::Field(key: "JourneyResponse")]
        getter journey_response : Types::JourneyResponse

        def initialize(
          @journey_response : Types::JourneyResponse
        )
        end
      end


      struct UpdatePushTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "PushNotificationTemplateRequest")]
        getter push_notification_template_request : Types::PushNotificationTemplateRequest


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "create-new-version")]
        getter create_new_version : Bool?


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @push_notification_template_request : Types::PushNotificationTemplateRequest,
          @template_name : String,
          @create_new_version : Bool? = nil,
          @version : String? = nil
        )
        end
      end


      struct UpdatePushTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end

      # Specifies Amazon Pinpoint configuration settings for retrieving and processing recommendation data
      # from a recommender model.

      struct UpdateRecommenderConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes
        # Amazon Pinpoint to retrieve recommendation data from the recommender model.

        @[JSON::Field(key: "RecommendationProviderRoleArn")]
        getter recommendation_provider_role_arn : String

        # The Amazon Resource Name (ARN) of the recommender model to retrieve recommendation data from. This
        # value must match the ARN of an Amazon Personalize campaign.

        @[JSON::Field(key: "RecommendationProviderUri")]
        getter recommendation_provider_uri : String

        # A map of key-value pairs that defines 1-10 custom endpoint or user attributes, depending on the
        # value for the RecommendationProviderIdType property. Each of these attributes temporarily stores a
        # recommended item that's retrieved from the recommender model and sent to an AWS Lambda function for
        # additional processing. Each attribute can be used as a message variable in a message template. In
        # the map, the key is the name of a custom attribute and the value is a custom display name for that
        # attribute. The display name appears in the Attribute finder of the template editor on the Amazon
        # Pinpoint console. The following restrictions apply to these names: An attribute name must start with
        # a letter or number and it can contain up to 50 characters. The characters can be letters, numbers,
        # underscores (_), or hyphens (-). Attribute names are case sensitive and must be unique. An attribute
        # display name must start with a letter or number and it can contain up to 25 characters. The
        # characters can be letters, numbers, spaces, underscores (_), or hyphens (-). This object is required
        # if the configuration invokes an AWS Lambda function (RecommendationTransformerUri) to process
        # recommendation data. Otherwise, don't include this object in your request.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # A custom description of the configuration for the recommender model. The description can contain up
        # to 128 characters. The characters can be letters, numbers, spaces, or the following symbols: _ ; ()
        # , ‐.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A custom name of the configuration for the recommender model. The name must start with a letter or
        # number and it can contain up to 128 characters. The characters can be letters, numbers, spaces,
        # underscores (_), or hyphens (-).

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of Amazon Pinpoint ID to associate with unique user IDs in the recommender model. This
        # value enables the model to use attribute and event data that’s specific to a particular endpoint or
        # user in an Amazon Pinpoint application. Valid values are: PINPOINT_ENDPOINT_ID - Associate each user
        # in the model with a particular endpoint in Amazon Pinpoint. The data is correlated based on endpoint
        # IDs in Amazon Pinpoint. This is the default value. PINPOINT_USER_ID - Associate each user in the
        # model with a particular user and endpoint in Amazon Pinpoint. The data is correlated based on user
        # IDs in Amazon Pinpoint. If you specify this value, an endpoint definition in Amazon Pinpoint has to
        # specify both a user ID (UserId) and an endpoint ID. Otherwise, messages won’t be sent to the user's
        # endpoint.

        @[JSON::Field(key: "RecommendationProviderIdType")]
        getter recommendation_provider_id_type : String?

        # The name or Amazon Resource Name (ARN) of the AWS Lambda function to invoke for additional
        # processing of recommendation data that's retrieved from the recommender model.

        @[JSON::Field(key: "RecommendationTransformerUri")]
        getter recommendation_transformer_uri : String?

        # A custom display name for the standard endpoint or user attribute (RecommendationItems) that
        # temporarily stores recommended items for each endpoint or user, depending on the value for the
        # RecommendationProviderIdType property. This value is required if the configuration doesn't invoke an
        # AWS Lambda function (RecommendationTransformerUri) to perform additional processing of
        # recommendation data. This name appears in the Attribute finder of the template editor on the Amazon
        # Pinpoint console. The name can contain up to 25 characters. The characters can be letters, numbers,
        # spaces, underscores (_), or hyphens (-). These restrictions don't apply to attribute values.

        @[JSON::Field(key: "RecommendationsDisplayName")]
        getter recommendations_display_name : String?

        # The number of recommended items to retrieve from the model for each endpoint or user, depending on
        # the value for the RecommendationProviderIdType property. This number determines how many recommended
        # items are available for use in message variables. The minimum value is 1. The maximum value is 5.
        # The default value is 5. To use multiple recommended items and custom attributes with message
        # variables, you have to use an AWS Lambda function (RecommendationTransformerUri) to perform
        # additional processing of recommendation data.

        @[JSON::Field(key: "RecommendationsPerMessage")]
        getter recommendations_per_message : Int32?

        def initialize(
          @recommendation_provider_role_arn : String,
          @recommendation_provider_uri : String,
          @attributes : Hash(String, String)? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @recommendation_provider_id_type : String? = nil,
          @recommendation_transformer_uri : String? = nil,
          @recommendations_display_name : String? = nil,
          @recommendations_per_message : Int32? = nil
        )
        end
      end


      struct UpdateRecommenderConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "recommender-id")]
        getter recommender_id : String


        @[JSON::Field(key: "UpdateRecommenderConfiguration")]
        getter update_recommender_configuration : Types::UpdateRecommenderConfiguration

        def initialize(
          @recommender_id : String,
          @update_recommender_configuration : Types::UpdateRecommenderConfiguration
        )
        end
      end


      struct UpdateRecommenderConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "RecommenderConfigurationResponse")]
        getter recommender_configuration_response : Types::RecommenderConfigurationResponse

        def initialize(
          @recommender_configuration_response : Types::RecommenderConfigurationResponse
        )
        end
      end


      struct UpdateSegmentRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "segment-id")]
        getter segment_id : String


        @[JSON::Field(key: "WriteSegmentRequest")]
        getter write_segment_request : Types::WriteSegmentRequest

        def initialize(
          @application_id : String,
          @segment_id : String,
          @write_segment_request : Types::WriteSegmentRequest
        )
        end
      end


      struct UpdateSegmentResponse
        include JSON::Serializable


        @[JSON::Field(key: "SegmentResponse")]
        getter segment_response : Types::SegmentResponse

        def initialize(
          @segment_response : Types::SegmentResponse
        )
        end
      end


      struct UpdateSmsChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "SMSChannelRequest")]
        getter sms_channel_request : Types::SMSChannelRequest

        def initialize(
          @application_id : String,
          @sms_channel_request : Types::SMSChannelRequest
        )
        end
      end


      struct UpdateSmsChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "SMSChannelResponse")]
        getter sms_channel_response : Types::SMSChannelResponse

        def initialize(
          @sms_channel_response : Types::SMSChannelResponse
        )
        end
      end


      struct UpdateSmsTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "SMSTemplateRequest")]
        getter sms_template_request : Types::SMSTemplateRequest


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "create-new-version")]
        getter create_new_version : Bool?


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @sms_template_request : Types::SMSTemplateRequest,
          @template_name : String,
          @create_new_version : Bool? = nil,
          @version : String? = nil
        )
        end
      end


      struct UpdateSmsTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end


      struct UpdateTemplateActiveVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "TemplateActiveVersionRequest")]
        getter template_active_version_request : Types::TemplateActiveVersionRequest


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "template-type")]
        getter template_type : String

        def initialize(
          @template_active_version_request : Types::TemplateActiveVersionRequest,
          @template_name : String,
          @template_type : String
        )
        end
      end


      struct UpdateTemplateActiveVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end


      struct UpdateVoiceChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "VoiceChannelRequest")]
        getter voice_channel_request : Types::VoiceChannelRequest

        def initialize(
          @application_id : String,
          @voice_channel_request : Types::VoiceChannelRequest
        )
        end
      end


      struct UpdateVoiceChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "VoiceChannelResponse")]
        getter voice_channel_response : Types::VoiceChannelResponse

        def initialize(
          @voice_channel_response : Types::VoiceChannelResponse
        )
        end
      end


      struct UpdateVoiceTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "template-name")]
        getter template_name : String


        @[JSON::Field(key: "VoiceTemplateRequest")]
        getter voice_template_request : Types::VoiceTemplateRequest


        @[JSON::Field(key: "create-new-version")]
        getter create_new_version : Bool?


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @template_name : String,
          @voice_template_request : Types::VoiceTemplateRequest,
          @create_new_version : Bool? = nil,
          @version : String? = nil
        )
        end
      end


      struct UpdateVoiceTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "MessageBody")]
        getter message_body : Types::MessageBody

        def initialize(
          @message_body : Types::MessageBody
        )
        end
      end

      # Verify OTP Message Response.

      struct VerificationResponse
        include JSON::Serializable

        # Specifies whether the OTP is valid or not.

        @[JSON::Field(key: "Valid")]
        getter valid : Bool?

        def initialize(
          @valid : Bool? = nil
        )
        end
      end


      struct VerifyOTPMessageRequest
        include JSON::Serializable


        @[JSON::Field(key: "application-id")]
        getter application_id : String


        @[JSON::Field(key: "VerifyOTPMessageRequestParameters")]
        getter verify_otp_message_request_parameters : Types::VerifyOTPMessageRequestParameters

        def initialize(
          @application_id : String,
          @verify_otp_message_request_parameters : Types::VerifyOTPMessageRequestParameters
        )
        end
      end

      # Verify OTP message request.

      struct VerifyOTPMessageRequestParameters
        include JSON::Serializable

        # The destination identity to send OTP to.

        @[JSON::Field(key: "DestinationIdentity")]
        getter destination_identity : String

        # The OTP the end user provided for verification.

        @[JSON::Field(key: "Otp")]
        getter otp : String

        # The reference identifier provided when the OTP was previously sent.

        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : String

        def initialize(
          @destination_identity : String,
          @otp : String,
          @reference_id : String
        )
        end
      end


      struct VerifyOTPMessageResponse
        include JSON::Serializable


        @[JSON::Field(key: "VerificationResponse")]
        getter verification_response : Types::VerificationResponse

        def initialize(
          @verification_response : Types::VerificationResponse
        )
        end
      end

      # Specifies the status and settings of the voice channel for an application.

      struct VoiceChannelRequest
        include JSON::Serializable

        # Specifies whether to enable the voice channel for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Provides information about the status and settings of the voice channel for an application.

      struct VoiceChannelResponse
        include JSON::Serializable

        # The type of messaging or notification platform for the channel. For the voice channel, this value is
        # VOICE.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The unique identifier for the application that the voice channel applies to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The date and time, in ISO 8601 format, when the voice channel was enabled.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # Specifies whether the voice channel is enabled for the application.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # (Not used) This property is retained only for backward compatibility.

        @[JSON::Field(key: "HasCredential")]
        getter has_credential : Bool?

        # (Deprecated) An identifier for the voice channel. This property is retained only for backward
        # compatibility.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Specifies whether the voice channel is archived.

        @[JSON::Field(key: "IsArchived")]
        getter is_archived : Bool?

        # The user who last modified the voice channel.

        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time, in ISO 8601 format, when the voice channel was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The current version of the voice channel.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @platform : String,
          @application_id : String? = nil,
          @creation_date : String? = nil,
          @enabled : Bool? = nil,
          @has_credential : Bool? = nil,
          @id : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : String? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Specifies the settings for a one-time voice message that's sent directly to an endpoint through the
      # voice channel.

      struct VoiceMessage
        include JSON::Serializable

        # The text of the script to use for the voice message.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The code for the language to use when synthesizing the text of the message script. For a list of
        # supported languages and the code for each one, see the Amazon Polly Developer Guide .

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The long code to send the voice message from. This value should be one of the dedicated long codes
        # that's assigned to your AWS account. Although it isn't required, we recommend that you specify the
        # long code in E.164 format, for example +12065550100, to ensure prompt and accurate delivery of the
        # message.

        @[JSON::Field(key: "OriginationNumber")]
        getter origination_number : String?

        # The default message variables to use in the voice message. You can override the default variables
        # with individual address variables.

        @[JSON::Field(key: "Substitutions")]
        getter substitutions : Hash(String, Array(String))?

        # The name of the voice to use when delivering the message. For a list of supported voices, see the
        # Amazon Polly Developer Guide .

        @[JSON::Field(key: "VoiceId")]
        getter voice_id : String?

        def initialize(
          @body : String? = nil,
          @language_code : String? = nil,
          @origination_number : String? = nil,
          @substitutions : Hash(String, Array(String))? = nil,
          @voice_id : String? = nil
        )
        end
      end

      # Specifies the content and settings for a message template that can be used in messages that are sent
      # through the voice channel.

      struct VoiceTemplateRequest
        include JSON::Serializable

        # The text of the script to use in messages that are based on the message template, in plain text
        # format.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # A JSON object that specifies the default values to use for message variables in the message
        # template. This object is a set of key-value pairs. Each key defines a message variable in the
        # template. The corresponding value defines the default value for that variable. When you create a
        # message that's based on the template, you can override these defaults with message-specific and
        # address-specific variables and values.

        @[JSON::Field(key: "DefaultSubstitutions")]
        getter default_substitutions : String?

        # The code for the language to use when synthesizing the text of the script in messages that are based
        # on the message template. For a list of supported languages and the code for each one, see the Amazon
        # Polly Developer Guide .

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # A custom description of the message template.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        # The name of the voice to use when delivering messages that are based on the message template. For a
        # list of supported voices, see the Amazon Polly Developer Guide .

        @[JSON::Field(key: "VoiceId")]
        getter voice_id : String?

        # As of 22-05-2023 tags has been deprecated for update operations. After this date any value in tags
        # is not processed and an error code is not returned. To manage tags we recommend using either Tags in
        # the API Reference for Amazon Pinpoint , resourcegroupstaggingapi commands in the AWS Command Line
        # Interface Documentation or resourcegroupstaggingapi in the AWS SDK . (Deprecated) A string-to-string
        # map of key-value pairs that defines the tags to associate with the message template. Each tag
        # consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @body : String? = nil,
          @default_substitutions : String? = nil,
          @language_code : String? = nil,
          @template_description : String? = nil,
          @voice_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about the content and settings for a message template that can be used in
      # messages that are sent through the voice channel.

      struct VoiceTemplateResponse
        include JSON::Serializable

        # The date, in ISO 8601 format, when the message template was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The date, in ISO 8601 format, when the message template was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String

        # The name of the message template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # The type of channel that the message template is designed for. For a voice template, this value is
        # VOICE.

        @[JSON::Field(key: "TemplateType")]
        getter template_type : String

        # The Amazon Resource Name (ARN) of the message template.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The text of the script that's used in messages that are based on the message template, in plain text
        # format.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The JSON object that specifies the default values that are used for message variables in the message
        # template. This object is a set of key-value pairs. Each key defines a message variable in the
        # template. The corresponding value defines the default value for that variable.

        @[JSON::Field(key: "DefaultSubstitutions")]
        getter default_substitutions : String?

        # The code for the language that's used when synthesizing the text of the script in messages that are
        # based on the message template. For a list of supported languages and the code for each one, see the
        # Amazon Polly Developer Guide .

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The custom description of the message template.

        @[JSON::Field(key: "TemplateDescription")]
        getter template_description : String?

        # The unique identifier, as an integer, for the active version of the message template, or the version
        # of the template that you specified by using the version parameter in your request.

        @[JSON::Field(key: "Version")]
        getter version : String?

        # The name of the voice that's used when delivering messages that are based on the message template.
        # For a list of supported voices, see the Amazon Polly Developer Guide .

        @[JSON::Field(key: "VoiceId")]
        getter voice_id : String?

        # A string-to-string map of key-value pairs that identifies the tags that are associated with the
        # message template. Each tag consists of a required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @creation_date : String,
          @last_modified_date : String,
          @template_name : String,
          @template_type : String,
          @arn : String? = nil,
          @body : String? = nil,
          @default_substitutions : String? = nil,
          @language_code : String? = nil,
          @template_description : String? = nil,
          @version : String? = nil,
          @voice_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Specifies the settings for a wait activity in a journey. This type of activity waits for a certain
      # amount of time or until a specific date and time before moving participants to the next activity in
      # a journey.

      struct WaitActivity
        include JSON::Serializable

        # The unique identifier for the next activity to perform, after performing the wait activity.

        @[JSON::Field(key: "NextActivity")]
        getter next_activity : String?

        # The amount of time to wait or the date and time when the activity moves participants to the next
        # activity in the journey.

        @[JSON::Field(key: "WaitTime")]
        getter wait_time : Types::WaitTime?

        def initialize(
          @next_activity : String? = nil,
          @wait_time : Types::WaitTime? = nil
        )
        end
      end

      # Specifies a duration or a date and time that indicates when Amazon Pinpoint determines whether an
      # activity's conditions have been met or an activity moves participants to the next activity in a
      # journey.

      struct WaitTime
        include JSON::Serializable

        # The amount of time to wait, as a duration in ISO 8601 format, before determining whether the
        # activity's conditions have been met or moving participants to the next activity in the journey.

        @[JSON::Field(key: "WaitFor")]
        getter wait_for : String?

        # The date and time, in ISO 8601 format, when Amazon Pinpoint determines whether the activity's
        # conditions have been met or the activity moves participants to the next activity in the journey.

        @[JSON::Field(key: "WaitUntil")]
        getter wait_until : String?

        def initialize(
          @wait_for : String? = nil,
          @wait_until : String? = nil
        )
        end
      end

      # Specifies the default settings for an application.

      struct WriteApplicationSettingsRequest
        include JSON::Serializable

        # The settings for the AWS Lambda function to invoke by default as a code hook for campaigns in the
        # application. You can use this hook to customize segments that are used by campaigns in the
        # application. To override these settings and define custom settings for a specific campaign, use the
        # CampaignHook object of the Campaign resource.

        @[JSON::Field(key: "CampaignHook")]
        getter campaign_hook : Types::CampaignHook?

        # Specifies whether to enable application-related alarms in Amazon CloudWatch.

        @[JSON::Field(key: "CloudWatchMetricsEnabled")]
        getter cloud_watch_metrics_enabled : Bool?

        # The default sending limits for journeys in the application. These limits apply to each journey for
        # the application but can be overridden, on a per journey basis, with the JourneyLimits resource.

        @[JSON::Field(key: "JourneyLimits")]
        getter journey_limits : Types::ApplicationSettingsJourneyLimits?

        # The default sending limits for campaigns in the application. To override these limits and define
        # custom limits for a specific campaign or journey, use the Campaign resource or the Journey resource,
        # respectively.

        @[JSON::Field(key: "Limits")]
        getter limits : Types::CampaignLimits?

        # The default quiet time for campaigns in the application. Quiet time is a specific time range when
        # messages aren't sent to endpoints, if all the following conditions are met: The
        # EndpointDemographic.Timezone property of the endpoint is set to a valid value. The current time in
        # the endpoint's time zone is later than or equal to the time specified by the QuietTime.Start
        # property for the application (or a campaign or journey that has custom quiet time settings). The
        # current time in the endpoint's time zone is earlier than or equal to the time specified by the
        # QuietTime.End property for the application (or a campaign or journey that has custom quiet time
        # settings). If any of the preceding conditions isn't met, the endpoint will receive messages from a
        # campaign or journey, even if quiet time is enabled. To override the default quiet time settings for
        # a specific campaign or journey, use the Campaign resource or the Journey resource to define a custom
        # quiet time for the campaign or journey.

        @[JSON::Field(key: "QuietTime")]
        getter quiet_time : Types::QuietTime?

        def initialize(
          @campaign_hook : Types::CampaignHook? = nil,
          @cloud_watch_metrics_enabled : Bool? = nil,
          @journey_limits : Types::ApplicationSettingsJourneyLimits? = nil,
          @limits : Types::CampaignLimits? = nil,
          @quiet_time : Types::QuietTime? = nil
        )
        end
      end

      # Specifies the configuration and other settings for a campaign.

      struct WriteCampaignRequest
        include JSON::Serializable

        # An array of requests that defines additional treatments for the campaign, in addition to the default
        # treatment for the campaign.

        @[JSON::Field(key: "AdditionalTreatments")]
        getter additional_treatments : Array(Types::WriteTreatmentResource)?

        # The delivery configuration settings for sending the campaign through a custom channel. This object
        # is required if the MessageConfiguration object for the campaign specifies a CustomMessage object.

        @[JSON::Field(key: "CustomDeliveryConfiguration")]
        getter custom_delivery_configuration : Types::CustomDeliveryConfiguration?

        # A custom description of the campaign.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The allocated percentage of users (segment members) who shouldn't receive messages from the
        # campaign.

        @[JSON::Field(key: "HoldoutPercent")]
        getter holdout_percent : Int32?

        # The settings for the AWS Lambda function to invoke as a code hook for the campaign. You can use this
        # hook to customize the segment that's used by the campaign.

        @[JSON::Field(key: "Hook")]
        getter hook : Types::CampaignHook?

        # Specifies whether to pause the campaign. A paused campaign doesn't run unless you resume it by
        # changing this value to false.

        @[JSON::Field(key: "IsPaused")]
        getter is_paused : Bool?

        # The messaging limits for the campaign.

        @[JSON::Field(key: "Limits")]
        getter limits : Types::CampaignLimits?

        # The message configuration settings for the campaign.

        @[JSON::Field(key: "MessageConfiguration")]
        getter message_configuration : Types::MessageConfiguration?

        # A custom name for the campaign.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Defines the priority of the campaign, used to decide the order of messages displayed to user if
        # there are multiple messages scheduled to be displayed at the same moment.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The schedule settings for the campaign.

        @[JSON::Field(key: "Schedule")]
        getter schedule : Types::Schedule?

        # The unique identifier for the segment to associate with the campaign.

        @[JSON::Field(key: "SegmentId")]
        getter segment_id : String?

        # The version of the segment to associate with the campaign.

        @[JSON::Field(key: "SegmentVersion")]
        getter segment_version : Int32?

        # The message template to use for the campaign.

        @[JSON::Field(key: "TemplateConfiguration")]
        getter template_configuration : Types::TemplateConfiguration?

        # A custom description of the default treatment for the campaign.

        @[JSON::Field(key: "TreatmentDescription")]
        getter treatment_description : String?

        # A custom name of the default treatment for the campaign, if the campaign has multiple treatments. A
        # treatment is a variation of a campaign that's used for A/B testing.

        @[JSON::Field(key: "TreatmentName")]
        getter treatment_name : String?

        # As of 22-05-2023 tags has been deprecated for update operations. After this date any value in tags
        # is not processed and an error code is not returned. To manage tags we recommend using either Tags in
        # the API Reference for Amazon Pinpoint , resourcegroupstaggingapi commands in the AWS Command Line
        # Interface Documentation or resourcegroupstaggingapi in the AWS SDK . (Deprecated) A string-to-string
        # map of key-value pairs that defines the tags to associate with the campaign. Each tag consists of a
        # required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @additional_treatments : Array(Types::WriteTreatmentResource)? = nil,
          @custom_delivery_configuration : Types::CustomDeliveryConfiguration? = nil,
          @description : String? = nil,
          @holdout_percent : Int32? = nil,
          @hook : Types::CampaignHook? = nil,
          @is_paused : Bool? = nil,
          @limits : Types::CampaignLimits? = nil,
          @message_configuration : Types::MessageConfiguration? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @schedule : Types::Schedule? = nil,
          @segment_id : String? = nil,
          @segment_version : Int32? = nil,
          @template_configuration : Types::TemplateConfiguration? = nil,
          @treatment_description : String? = nil,
          @treatment_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Specifies the Amazon Resource Name (ARN) of an event stream to publish events to and the AWS
      # Identity and Access Management (IAM) role to use when publishing those events.

      struct WriteEventStream
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Kinesis data stream or Amazon Kinesis Data Firehose
        # delivery stream that you want to publish event data to. For a Kinesis data stream, the ARN format
        # is: arn:aws:kinesis: region : account-id :stream/ stream_name For a Kinesis Data Firehose delivery
        # stream, the ARN format is: arn:aws:firehose: region : account-id :deliverystream/ stream_name

        @[JSON::Field(key: "DestinationStreamArn")]
        getter destination_stream_arn : String

        # The AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to publish event
        # data to the stream in your AWS account.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        def initialize(
          @destination_stream_arn : String,
          @role_arn : String
        )
        end
      end

      # Specifies the configuration and other settings for a journey.

      struct WriteJourneyRequest
        include JSON::Serializable

        # The name of the journey. A journey name can contain a maximum of 150 characters. The characters can
        # be alphanumeric characters or symbols, such as underscores (_) or hyphens (-). A journey name can't
        # contain any spaces.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A map that contains a set of Activity objects, one object for each activity in the journey. For each
        # Activity object, the key is the unique identifier (string) for an activity and the value is the
        # settings for the activity. An activity identifier can contain a maximum of 100 characters. The
        # characters must be alphanumeric characters.

        @[JSON::Field(key: "Activities")]
        getter activities : Hash(String, Types::Activity)?

        # The time when journey will stop sending messages. QuietTime should be configured first and
        # SendingSchedule should be set to true.

        @[JSON::Field(key: "ClosedDays")]
        getter closed_days : Types::ClosedDays?

        # The date, in ISO 8601 format, when the journey was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # IAM role ARN to be assumed when invoking Connect campaign execution APIs for dialing.

        @[JSON::Field(key: "JourneyChannelSettings")]
        getter journey_channel_settings : Types::JourneyChannelSettings?

        # The date, in ISO 8601 format, when the journey was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        # The messaging and entry limits for the journey.

        @[JSON::Field(key: "Limits")]
        getter limits : Types::JourneyLimits?

        # Specifies whether the journey's scheduled start and end times use each participant's local time. To
        # base the schedule on each participant's local time, set this value to true.

        @[JSON::Field(key: "LocalTime")]
        getter local_time : Bool?

        # The time when journey allow to send messages. QuietTime should be configured first and
        # SendingSchedule should be set to true.

        @[JSON::Field(key: "OpenHours")]
        getter open_hours : Types::OpenHours?

        # The quiet time settings for the journey. Quiet time is a specific time range when a journey doesn't
        # send messages to participants, if all the following conditions are met: The
        # EndpointDemographic.Timezone property of the endpoint for the participant is set to a valid value.
        # The current time in the participant's time zone is later than or equal to the time specified by the
        # QuietTime.Start property for the journey. The current time in the participant's time zone is earlier
        # than or equal to the time specified by the QuietTime.End property for the journey. If any of the
        # preceding conditions isn't met, the participant will receive messages from the journey, even if
        # quiet time is enabled.

        @[JSON::Field(key: "QuietTime")]
        getter quiet_time : Types::QuietTime?

        # The frequency with which Amazon Pinpoint evaluates segment and event data for the journey, as a
        # duration in ISO 8601 format.

        @[JSON::Field(key: "RefreshFrequency")]
        getter refresh_frequency : String?

        # Indicates whether the journey participants should be refreshed when a segment is updated.

        @[JSON::Field(key: "RefreshOnSegmentUpdate")]
        getter refresh_on_segment_update : Bool?

        # The schedule settings for the journey.

        @[JSON::Field(key: "Schedule")]
        getter schedule : Types::JourneySchedule?

        # Indicates if journey has Advance Quiet Time enabled. This flag should be set to true in order to
        # allow using OpenHours and ClosedDays.

        @[JSON::Field(key: "SendingSchedule")]
        getter sending_schedule : Bool?

        # The unique identifier for the first activity in the journey. The identifier for this activity can
        # contain a maximum of 128 characters. The characters must be alphanumeric characters.

        @[JSON::Field(key: "StartActivity")]
        getter start_activity : String?

        # The segment that defines which users are participants in the journey.

        @[JSON::Field(key: "StartCondition")]
        getter start_condition : Types::StartCondition?

        # The status of the journey. Valid values are: DRAFT - Saves the journey and doesn't publish it.
        # ACTIVE - Saves and publishes the journey. Depending on the journey's schedule, the journey starts
        # running immediately or at the scheduled start time. If a journey's status is ACTIVE, you can't add,
        # change, or remove activities from it. PAUSED, CANCELLED, COMPLETED, and CLOSED states are not
        # supported in requests to create or update a journey. To cancel, pause, or resume a journey, use the
        # Journey State resource.

        @[JSON::Field(key: "State")]
        getter state : String?

        # An array of time zone estimation methods, if any, to use for determining an Endpoints time zone if
        # the Endpoint does not have a value for the Demographic.Timezone attribute. PHONE_NUMBER - A time
        # zone is determined based on the Endpoint.Address and Endpoint.Location.Country. POSTAL_CODE - A time
        # zone is determined based on the Endpoint.Location.PostalCode and Endpoint.Location.Country.
        # POSTAL_CODE detection is only supported in the United States, United Kingdom, Australia, New
        # Zealand, Canada, France, Italy, Spain, Germany and in regions where Amazon Pinpoint is available.

        @[JSON::Field(key: "TimezoneEstimationMethods")]
        getter timezone_estimation_methods : Array(String)?

        # Indicates whether endpoints in quiet hours should enter a wait activity until quiet hours have
        # elapsed.

        @[JSON::Field(key: "WaitForQuietTime")]
        getter wait_for_quiet_time : Bool?

        def initialize(
          @name : String,
          @activities : Hash(String, Types::Activity)? = nil,
          @closed_days : Types::ClosedDays? = nil,
          @creation_date : String? = nil,
          @journey_channel_settings : Types::JourneyChannelSettings? = nil,
          @last_modified_date : String? = nil,
          @limits : Types::JourneyLimits? = nil,
          @local_time : Bool? = nil,
          @open_hours : Types::OpenHours? = nil,
          @quiet_time : Types::QuietTime? = nil,
          @refresh_frequency : String? = nil,
          @refresh_on_segment_update : Bool? = nil,
          @schedule : Types::JourneySchedule? = nil,
          @sending_schedule : Bool? = nil,
          @start_activity : String? = nil,
          @start_condition : Types::StartCondition? = nil,
          @state : String? = nil,
          @timezone_estimation_methods : Array(String)? = nil,
          @wait_for_quiet_time : Bool? = nil
        )
        end
      end

      # Specifies the configuration, dimension, and other settings for a segment. A WriteSegmentRequest
      # object can include a Dimensions object or a SegmentGroups object, but not both.

      struct WriteSegmentRequest
        include JSON::Serializable

        # The criteria that define the dimensions for the segment.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Types::SegmentDimensions?

        # The name of the segment.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The segment group to use and the dimensions to apply to the group's base segments in order to build
        # the segment. A segment group can consist of zero or more base segments. Your request can include
        # only one segment group.

        @[JSON::Field(key: "SegmentGroups")]
        getter segment_groups : Types::SegmentGroupList?

        # As of 22-05-2023 tags has been deprecated for update operations. After this date any value in tags
        # is not processed and an error code is not returned. To manage tags we recommend using either Tags in
        # the API Reference for Amazon Pinpoint , resourcegroupstaggingapi commands in the AWS Command Line
        # Interface Documentation or resourcegroupstaggingapi in the AWS SDK . (Deprecated) A string-to-string
        # map of key-value pairs that defines the tags to associate with the segment. Each tag consists of a
        # required tag key and an associated tag value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @dimensions : Types::SegmentDimensions? = nil,
          @name : String? = nil,
          @segment_groups : Types::SegmentGroupList? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Specifies the settings for a campaign treatment. A treatment is a variation of a campaign that's
      # used for A/B testing of a campaign.

      struct WriteTreatmentResource
        include JSON::Serializable

        # The allocated percentage of users (segment members) to send the treatment to.

        @[JSON::Field(key: "SizePercent")]
        getter size_percent : Int32

        # The delivery configuration settings for sending the treatment through a custom channel. This object
        # is required if the MessageConfiguration object for the treatment specifies a CustomMessage object.

        @[JSON::Field(key: "CustomDeliveryConfiguration")]
        getter custom_delivery_configuration : Types::CustomDeliveryConfiguration?

        # The message configuration settings for the treatment.

        @[JSON::Field(key: "MessageConfiguration")]
        getter message_configuration : Types::MessageConfiguration?

        # The schedule settings for the treatment.

        @[JSON::Field(key: "Schedule")]
        getter schedule : Types::Schedule?

        # The message template to use for the treatment.

        @[JSON::Field(key: "TemplateConfiguration")]
        getter template_configuration : Types::TemplateConfiguration?

        # A custom description of the treatment.

        @[JSON::Field(key: "TreatmentDescription")]
        getter treatment_description : String?

        # A custom name for the treatment.

        @[JSON::Field(key: "TreatmentName")]
        getter treatment_name : String?

        def initialize(
          @size_percent : Int32,
          @custom_delivery_configuration : Types::CustomDeliveryConfiguration? = nil,
          @message_configuration : Types::MessageConfiguration? = nil,
          @schedule : Types::Schedule? = nil,
          @template_configuration : Types::TemplateConfiguration? = nil,
          @treatment_description : String? = nil,
          @treatment_name : String? = nil
        )
        end
      end
    end
  end
end
