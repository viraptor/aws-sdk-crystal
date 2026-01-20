module AwsSdk
  module SageMakerFeatureStoreRuntime
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
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Retrieves a batch of Records from a FeatureGroup .

      def batch_get_record(
        identifiers : Array(Types::BatchGetRecordIdentifier),
        expiration_time_response : String? = nil
      ) : Protocol::Request
        input = Types::BatchGetRecordRequest.new(identifiers: identifiers, expiration_time_response: expiration_time_response)
        batch_get_record(input)
      end

      def batch_get_record(input : Types::BatchGetRecordRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_RECORD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Record from a FeatureGroup in the OnlineStore . Feature Store supports both SoftDelete and
      # HardDelete . For SoftDelete (default), feature columns are set to null and the record is no longer
      # retrievable by GetRecord or BatchGetRecord . For HardDelete , the complete Record is removed from
      # the OnlineStore . In both cases, Feature Store appends the deleted record marker to the OfflineStore
      # . The deleted record marker is a record with the same RecordIdentifer as the original, but with
      # is_deleted value set to True , EventTime set to the delete input EventTime , and other feature
      # values set to null . Note that the EventTime specified in DeleteRecord should be set later than the
      # EventTime of the existing record in the OnlineStore for that RecordIdentifer . If it is not, the
      # deletion does not occur: For SoftDelete , the existing (not deleted) record remains in the
      # OnlineStore , though the delete record marker is still written to the OfflineStore . HardDelete
      # returns EventTime : 400 ValidationException to indicate that the delete operation failed. No delete
      # record marker is written to the OfflineStore . When a record is deleted from the OnlineStore , the
      # deleted record marker is appended to the OfflineStore . If you have the Iceberg table format enabled
      # for your OfflineStore , you can remove all history of a record from the OfflineStore using Amazon
      # Athena or Apache Spark. For information on how to hard delete a record from the OfflineStore with
      # the Iceberg table format enabled, see Delete records from the offline store .

      def delete_record(
        event_time : String,
        feature_group_name : String,
        record_identifier_value_as_string : String,
        deletion_mode : String? = nil,
        target_stores : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DeleteRecordRequest.new(event_time: event_time, feature_group_name: feature_group_name, record_identifier_value_as_string: record_identifier_value_as_string, deletion_mode: deletion_mode, target_stores: target_stores)
        delete_record(input)
      end

      def delete_record(input : Types::DeleteRecordRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RECORD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use for OnlineStore serving from a FeatureStore . Only the latest records stored in the OnlineStore
      # can be retrieved. If no Record with RecordIdentifierValue is found, then an empty result is
      # returned.

      def get_record(
        feature_group_name : String,
        record_identifier_value_as_string : String,
        expiration_time_response : String? = nil,
        feature_names : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetRecordRequest.new(feature_group_name: feature_group_name, record_identifier_value_as_string: record_identifier_value_as_string, expiration_time_response: expiration_time_response, feature_names: feature_names)
        get_record(input)
      end

      def get_record(input : Types::GetRecordRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECORD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The PutRecord API is used to ingest a list of Records into your feature group. If a new record’s
      # EventTime is greater, the new record is written to both the OnlineStore and OfflineStore .
      # Otherwise, the record is a historic record and it is written only to the OfflineStore . You can
      # specify the ingestion to be applied to the OnlineStore , OfflineStore , or both by using the
      # TargetStores request parameter. You can set the ingested record to expire at a given time to live
      # (TTL) duration after the record’s event time, ExpiresAt = EventTime + TtlDuration , by specifying
      # the TtlDuration parameter. A record level TtlDuration is set when specifying the TtlDuration
      # parameter using the PutRecord API call. If the input TtlDuration is null or unspecified, TtlDuration
      # is set to the default feature group level TtlDuration . A record level TtlDuration supersedes the
      # group level TtlDuration .

      def put_record(
        feature_group_name : String,
        record : Array(Types::FeatureValue),
        target_stores : Array(String)? = nil,
        ttl_duration : Types::TtlDuration? = nil
      ) : Protocol::Request
        input = Types::PutRecordRequest.new(feature_group_name: feature_group_name, record: record, target_stores: target_stores, ttl_duration: ttl_duration)
        put_record(input)
      end

      def put_record(input : Types::PutRecordRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RECORD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
