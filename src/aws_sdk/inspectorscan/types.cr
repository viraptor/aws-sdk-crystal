require "json"

module AwsSdk
  module InspectorScan
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the validation failure.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # The number of seconds to wait before retrying the request.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @reason : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end


      struct Sbom
        include JSON::Serializable

        def initialize
        end
      end


      struct ScanSbomRequest
        include JSON::Serializable

        # The JSON file for the SBOM you want to scan. The SBOM must be in CycloneDX 1.5 format. This format
        # limits you to passing 2000 components before throwing a ValidException error.

        @[JSON::Field(key: "sbom")]
        getter sbom : Types::Sbom

        # The output format for the vulnerability report.

        @[JSON::Field(key: "outputFormat")]
        getter output_format : String?

        def initialize(
          @sbom : Types::Sbom,
          @output_format : String? = nil
        )
        end
      end


      struct ScanSbomResponse
        include JSON::Serializable

        # The vulnerability report for the scanned SBOM.

        @[JSON::Field(key: "sbom")]
        getter sbom : Types::Sbom?

        def initialize(
          @sbom : Types::Sbom? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds to wait before retrying the request.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # The request has failed validation due to missing required fields or having invalid inputs.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the validation failure.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # The fields that failed validation.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @fields : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # The request has failed validation due to missing required fields or having invalid inputs.

      struct ValidationExceptionField
        include JSON::Serializable

        # The validation exception message.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the validation exception.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
