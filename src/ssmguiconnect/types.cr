require "json"

module Aws
  module SSMGuiConnect
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

      # An error occurred due to a conflict.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The set of preferences used for recording RDP connections in the requesting Amazon Web Services
      # account and Amazon Web Services Region. This includes details such as which S3 bucket recordings are
      # stored in.

      struct ConnectionRecordingPreferences
        include JSON::Serializable

        # The ARN of a KMS key that is used to encrypt data while it is being processed by the service. This
        # key must exist in the same Amazon Web Services Region as the node you start an RDP connection to.

        @[JSON::Field(key: "KMSKeyArn")]
        getter kms_key_arn : String

        # Determines where recordings of RDP connections are stored.

        @[JSON::Field(key: "RecordingDestinations")]
        getter recording_destinations : Types::RecordingDestinations

        def initialize(
          @kms_key_arn : String,
          @recording_destinations : Types::RecordingDestinations
        )
        end
      end


      struct DeleteConnectionRecordingPreferencesRequest
        include JSON::Serializable

        # User-provided idempotency token.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @client_token : String? = nil
        )
        end
      end


      struct DeleteConnectionRecordingPreferencesResponse
        include JSON::Serializable

        # Service-provided idempotency token.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @client_token : String? = nil
        )
        end
      end


      struct GetConnectionRecordingPreferencesResponse
        include JSON::Serializable

        # Service-provided idempotency token.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The set of preferences used for recording RDP connections in the requesting Amazon Web Services
        # account and Amazon Web Services Region. This includes details such as which S3 bucket recordings are
        # stored in.

        @[JSON::Field(key: "ConnectionRecordingPreferences")]
        getter connection_recording_preferences : Types::ConnectionRecordingPreferences?

        def initialize(
          @client_token : String? = nil,
          @connection_recording_preferences : Types::ConnectionRecordingPreferences? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Determines where recordings of RDP connections are stored.

      struct RecordingDestinations
        include JSON::Serializable

        # The S3 bucket where RDP connection recordings are stored.

        @[JSON::Field(key: "S3Buckets")]
        getter s3_buckets : Array(Types::S3Bucket)

        def initialize(
          @s3_buckets : Array(Types::S3Bucket)
        )
        end
      end

      # The resource could not be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The S3 bucket where RDP connection recordings are stored.

      struct S3Bucket
        include JSON::Serializable

        # The name of the S3 bucket where RDP connection recordings are stored.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # The Amazon Web Services account number that owns the S3 bucket.

        @[JSON::Field(key: "BucketOwner")]
        getter bucket_owner : String

        def initialize(
          @bucket_name : String,
          @bucket_owner : String
        )
        end
      end

      # Your request exceeds a service quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct UpdateConnectionRecordingPreferencesRequest
        include JSON::Serializable

        # The set of preferences used for recording RDP connections in the requesting Amazon Web Services
        # account and Amazon Web Services Region. This includes details such as which S3 bucket recordings are
        # stored in.

        @[JSON::Field(key: "ConnectionRecordingPreferences")]
        getter connection_recording_preferences : Types::ConnectionRecordingPreferences

        # User-provided idempotency token.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @connection_recording_preferences : Types::ConnectionRecordingPreferences,
          @client_token : String? = nil
        )
        end
      end


      struct UpdateConnectionRecordingPreferencesResponse
        include JSON::Serializable

        # Service-provided idempotency token.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The set of preferences used for recording RDP connections in the requesting Amazon Web Services
        # account and Amazon Web Services Region. This includes details such as which S3 bucket recordings are
        # stored in.

        @[JSON::Field(key: "ConnectionRecordingPreferences")]
        getter connection_recording_preferences : Types::ConnectionRecordingPreferences?

        def initialize(
          @client_token : String? = nil,
          @connection_recording_preferences : Types::ConnectionRecordingPreferences? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
