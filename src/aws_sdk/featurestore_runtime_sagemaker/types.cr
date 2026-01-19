require "json"

module AwsSdk
  module SageMakerFeatureStoreRuntime
    module Types

      # You do not have permission to perform an action.
      struct AccessForbidden
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The error that has occurred when attempting to retrieve a batch of Records.
      struct BatchGetRecordError
        include JSON::Serializable

        # The error code of an error that has occurred when attempting to retrieve a batch of Records. For
        # more information on errors, see Errors .
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String

        # The error message of an error that has occurred when attempting to retrieve a record in the batch.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String

        # The name of the feature group that the record belongs to.
        @[JSON::Field(key: "FeatureGroupName")]
        getter feature_group_name : String

        # The value for the RecordIdentifier in string format of a Record from a FeatureGroup that is causing
        # an error when attempting to be retrieved.
        @[JSON::Field(key: "RecordIdentifierValueAsString")]
        getter record_identifier_value_as_string : String

        def initialize(
          @error_code : String,
          @error_message : String,
          @feature_group_name : String,
          @record_identifier_value_as_string : String
        )
        end
      end

      # The identifier that identifies the batch of Records you are retrieving in a batch.
      struct BatchGetRecordIdentifier
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the FeatureGroup containing the records you are retrieving
        # in a batch.
        @[JSON::Field(key: "FeatureGroupName")]
        getter feature_group_name : String

        # The value for a list of record identifiers in string format.
        @[JSON::Field(key: "RecordIdentifiersValueAsString")]
        getter record_identifiers_value_as_string : Array(String)

        # List of names of Features to be retrieved. If not specified, the latest value for all the Features
        # are returned.
        @[JSON::Field(key: "FeatureNames")]
        getter feature_names : Array(String)?

        def initialize(
          @feature_group_name : String,
          @record_identifiers_value_as_string : Array(String),
          @feature_names : Array(String)? = nil
        )
        end
      end

      struct BatchGetRecordRequest
        include JSON::Serializable

        # A list containing the name or Amazon Resource Name (ARN) of the FeatureGroup , the list of names of
        # Feature s to be retrieved, and the corresponding RecordIdentifier values as strings.
        @[JSON::Field(key: "Identifiers")]
        getter identifiers : Array(Types::BatchGetRecordIdentifier)

        # Parameter to request ExpiresAt in response. If Enabled , BatchGetRecord will return the value of
        # ExpiresAt , if it is not null. If Disabled and null, BatchGetRecord will return null.
        @[JSON::Field(key: "ExpirationTimeResponse")]
        getter expiration_time_response : String?

        def initialize(
          @identifiers : Array(Types::BatchGetRecordIdentifier),
          @expiration_time_response : String? = nil
        )
        end
      end

      struct BatchGetRecordResponse
        include JSON::Serializable

        # A list of errors that have occurred when retrieving a batch of Records.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchGetRecordError)

        # A list of Records you requested to be retrieved in batch.
        @[JSON::Field(key: "Records")]
        getter records : Array(Types::BatchGetRecordResultDetail)

        # A unprocessed list of FeatureGroup names, with their corresponding RecordIdentifier value, and
        # Feature name.
        @[JSON::Field(key: "UnprocessedIdentifiers")]
        getter unprocessed_identifiers : Array(Types::BatchGetRecordIdentifier)

        def initialize(
          @errors : Array(Types::BatchGetRecordError),
          @records : Array(Types::BatchGetRecordResultDetail),
          @unprocessed_identifiers : Array(Types::BatchGetRecordIdentifier)
        )
        end
      end

      # The output of records that have been retrieved in a batch.
      struct BatchGetRecordResultDetail
        include JSON::Serializable

        # The FeatureGroupName containing Records you retrieved in a batch.
        @[JSON::Field(key: "FeatureGroupName")]
        getter feature_group_name : String

        # The Record retrieved.
        @[JSON::Field(key: "Record")]
        getter record : Array(Types::FeatureValue)

        # The value of the record identifier in string format.
        @[JSON::Field(key: "RecordIdentifierValueAsString")]
        getter record_identifier_value_as_string : String

        # The ExpiresAt ISO string of the requested record.
        @[JSON::Field(key: "ExpiresAt")]
        getter expires_at : String?

        def initialize(
          @feature_group_name : String,
          @record : Array(Types::FeatureValue),
          @record_identifier_value_as_string : String,
          @expires_at : String? = nil
        )
        end
      end

      struct DeleteRecordRequest
        include JSON::Serializable

        # Timestamp indicating when the deletion event occurred. EventTime can be used to query data at a
        # certain point in time.
        @[JSON::Field(key: "EventTime")]
        getter event_time : String

        # The name or Amazon Resource Name (ARN) of the feature group to delete the record from.
        @[JSON::Field(key: "FeatureGroupName")]
        getter feature_group_name : String

        # The value for the RecordIdentifier that uniquely identifies the record, in string format.
        @[JSON::Field(key: "RecordIdentifierValueAsString")]
        getter record_identifier_value_as_string : String

        # The name of the deletion mode for deleting the record. By default, the deletion mode is set to
        # SoftDelete .
        @[JSON::Field(key: "DeletionMode")]
        getter deletion_mode : String?

        # A list of stores from which you're deleting the record. By default, Feature Store deletes the record
        # from all of the stores that you're using for the FeatureGroup .
        @[JSON::Field(key: "TargetStores")]
        getter target_stores : Array(String)?

        def initialize(
          @event_time : String,
          @feature_group_name : String,
          @record_identifier_value_as_string : String,
          @deletion_mode : String? = nil,
          @target_stores : Array(String)? = nil
        )
        end
      end

      # The value associated with a feature.
      struct FeatureValue
        include JSON::Serializable

        # The name of a feature that a feature value corresponds to.
        @[JSON::Field(key: "FeatureName")]
        getter feature_name : String

        # The value in string format associated with a feature. Used when your CollectionType is None . Note
        # that features types can be String , Integral , or Fractional . This value represents all three types
        # as a string.
        @[JSON::Field(key: "ValueAsString")]
        getter value_as_string : String?

        # The list of values in string format associated with a feature. Used when your CollectionType is a
        # List , Set , or Vector . Note that features types can be String , Integral , or Fractional . These
        # values represents all three types as a string.
        @[JSON::Field(key: "ValueAsStringList")]
        getter value_as_string_list : Array(String)?

        def initialize(
          @feature_name : String,
          @value_as_string : String? = nil,
          @value_as_string_list : Array(String)? = nil
        )
        end
      end

      struct GetRecordRequest
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the feature group from which you want to retrieve a
        # record.
        @[JSON::Field(key: "FeatureGroupName")]
        getter feature_group_name : String

        # The value that corresponds to RecordIdentifier type and uniquely identifies the record in the
        # FeatureGroup .
        @[JSON::Field(key: "RecordIdentifierValueAsString")]
        getter record_identifier_value_as_string : String

        # Parameter to request ExpiresAt in response. If Enabled , GetRecord will return the value of
        # ExpiresAt , if it is not null. If Disabled and null, GetRecord will return null.
        @[JSON::Field(key: "ExpirationTimeResponse")]
        getter expiration_time_response : String?

        # List of names of Features to be retrieved. If not specified, the latest value for all the Features
        # are returned.
        @[JSON::Field(key: "FeatureName")]
        getter feature_names : Array(String)?

        def initialize(
          @feature_group_name : String,
          @record_identifier_value_as_string : String,
          @expiration_time_response : String? = nil,
          @feature_names : Array(String)? = nil
        )
        end
      end

      struct GetRecordResponse
        include JSON::Serializable

        # The ExpiresAt ISO string of the requested record.
        @[JSON::Field(key: "ExpiresAt")]
        getter expires_at : String?

        # The record you requested. A list of FeatureValues .
        @[JSON::Field(key: "Record")]
        getter record : Array(Types::FeatureValue)?

        def initialize(
          @expires_at : String? = nil,
          @record : Array(Types::FeatureValue)? = nil
        )
        end
      end

      # An internal failure occurred. Try your request again. If the problem persists, contact Amazon Web
      # Services customer support.
      struct InternalFailure
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct PutRecordRequest
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the feature group that you want to insert the record into.
        @[JSON::Field(key: "FeatureGroupName")]
        getter feature_group_name : String

        # List of FeatureValues to be inserted. This will be a full over-write. If you only want to update few
        # of the feature values, do the following: Use GetRecord to retrieve the latest record. Update the
        # record returned from GetRecord . Use PutRecord to update feature values.
        @[JSON::Field(key: "Record")]
        getter record : Array(Types::FeatureValue)

        # A list of stores to which you're adding the record. By default, Feature Store adds the record to all
        # of the stores that you're using for the FeatureGroup .
        @[JSON::Field(key: "TargetStores")]
        getter target_stores : Array(String)?

        # Time to live duration, where the record is hard deleted after the expiration time is reached;
        # ExpiresAt = EventTime + TtlDuration . For information on HardDelete, see the DeleteRecord API in the
        # Amazon SageMaker API Reference guide.
        @[JSON::Field(key: "TtlDuration")]
        getter ttl_duration : Types::TtlDuration?

        def initialize(
          @feature_group_name : String,
          @record : Array(Types::FeatureValue),
          @target_stores : Array(String)? = nil,
          @ttl_duration : Types::TtlDuration? = nil
        )
        end
      end

      # A resource that is required to perform an action was not found.
      struct ResourceNotFound
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The service is currently unavailable.
      struct ServiceUnavailable
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Time to live duration, where the record is hard deleted after the expiration time is reached;
      # ExpiresAt = EventTime + TtlDuration . For information on HardDelete, see the DeleteRecord API in the
      # Amazon SageMaker API Reference guide.
      struct TtlDuration
        include JSON::Serializable

        # TtlDuration time unit.
        @[JSON::Field(key: "Unit")]
        getter unit : String

        # TtlDuration time value.
        @[JSON::Field(key: "Value")]
        getter value : Int32

        def initialize(
          @unit : String,
          @value : Int32
        )
        end
      end

      # There was an error validating your request.
      struct ValidationError
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
