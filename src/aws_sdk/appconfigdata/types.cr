require "json"

module AwsSdk
  module AppConfigData
    module Types

      # Detailed information about the input that failed to satisfy the constraints specified by a call.

      struct BadRequestDetails
        include JSON::Serializable

        # One or more specified parameters are not valid for the call.

        @[JSON::Field(key: "InvalidParameters")]
        getter invalid_parameters : Hash(String, Types::InvalidParameterDetail)?

        def initialize(
          @invalid_parameters : Hash(String, Types::InvalidParameterDetail)? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by the service.

      struct BadRequestException
        include JSON::Serializable

        # Details describing why the request was invalid.

        @[JSON::Field(key: "Details")]
        getter details : Types::BadRequestDetails?


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Code indicating the reason the request was invalid.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @details : Types::BadRequestDetails? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct GetLatestConfigurationRequest
        include JSON::Serializable

        # Token describing the current state of the configuration session. To obtain a token, first call the
        # StartConfigurationSession API. Note that every call to GetLatestConfiguration will return a new
        # ConfigurationToken ( NextPollConfigurationToken in the response) and must be provided to subsequent
        # GetLatestConfiguration API calls. This token should only be used once. To support long poll use
        # cases, the token is valid for up to 24 hours. If a GetLatestConfiguration call uses an expired
        # token, the system returns BadRequestException .

        @[JSON::Field(key: "configuration_token")]
        getter configuration_token : String

        def initialize(
          @configuration_token : String
        )
        end
      end


      struct GetLatestConfigurationResponse
        include JSON::Serializable

        # The data of the configuration. This may be empty if the client already has the latest version of
        # configuration.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Bytes?

        # A standard MIME type describing the format of the configuration content.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The latest token describing the current state of the configuration session. This must be provided to
        # the next call to GetLatestConfiguration. This token should only be used once. To support long poll
        # use cases, the token is valid for up to 24 hours. If a GetLatestConfiguration call uses an expired
        # token, the system returns BadRequestException .

        @[JSON::Field(key: "Next-Poll-Configuration-Token")]
        getter next_poll_configuration_token : String?

        # The amount of time the client should wait before polling for configuration updates again. Use
        # RequiredMinimumPollIntervalInSeconds to set the desired poll interval.

        @[JSON::Field(key: "Next-Poll-Interval-In-Seconds")]
        getter next_poll_interval_in_seconds : Int32?

        # The user-defined label for the AppConfig hosted configuration version. This attribute doesn't apply
        # if the configuration is not from an AppConfig hosted configuration version. If the client already
        # has the latest version of the configuration data, this value is empty.

        @[JSON::Field(key: "Version-Label")]
        getter version_label : String?

        def initialize(
          @configuration : Bytes? = nil,
          @content_type : String? = nil,
          @next_poll_configuration_token : String? = nil,
          @next_poll_interval_in_seconds : Int32? = nil,
          @version_label : String? = nil
        )
        end
      end

      # There was an internal failure in the service.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about an invalid parameter.

      struct InvalidParameterDetail
        include JSON::Serializable

        # The reason the parameter is invalid.

        @[JSON::Field(key: "Problem")]
        getter problem : String?

        def initialize(
          @problem : String? = nil
        )
        end
      end

      # The requested resource could not be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # A map indicating which parameters in the request reference the resource that was not found.

        @[JSON::Field(key: "ReferencedBy")]
        getter referenced_by : Hash(String, String)?

        # The type of resource that was not found.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @referenced_by : Hash(String, String)? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct StartConfigurationSessionRequest
        include JSON::Serializable

        # The application ID or the application name.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The configuration profile ID or the configuration profile name.

        @[JSON::Field(key: "ConfigurationProfileIdentifier")]
        getter configuration_profile_identifier : String

        # The environment ID or the environment name.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # Sets a constraint on a session. If you specify a value of, for example, 60 seconds, then the client
        # that established the session can't call GetLatestConfiguration more frequently than every 60
        # seconds.

        @[JSON::Field(key: "RequiredMinimumPollIntervalInSeconds")]
        getter required_minimum_poll_interval_in_seconds : Int32?

        def initialize(
          @application_identifier : String,
          @configuration_profile_identifier : String,
          @environment_identifier : String,
          @required_minimum_poll_interval_in_seconds : Int32? = nil
        )
        end
      end


      struct StartConfigurationSessionResponse
        include JSON::Serializable

        # Token encapsulating state about the configuration session. Provide this token to the
        # GetLatestConfiguration API to retrieve configuration data. This token should only be used once in
        # your first call to GetLatestConfiguration . You must use the new token in the GetLatestConfiguration
        # response ( NextPollConfigurationToken ) in each subsequent call to GetLatestConfiguration . The
        # InitialConfigurationToken and NextPollConfigurationToken should only be used once. To support long
        # poll use cases, the tokens are valid for up to 24 hours. If a GetLatestConfiguration call uses an
        # expired token, the system returns BadRequestException .

        @[JSON::Field(key: "InitialConfigurationToken")]
        getter initial_configuration_token : String?

        def initialize(
          @initial_configuration_token : String? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
