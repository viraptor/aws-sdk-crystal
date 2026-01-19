require "json"

module AwsSdk
  module KinesisVideoWebrtcStorage
    module Types
      struct JoinStorageSessionInput
        include JSON::Serializable

        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        def initialize(@channel_arn : String)
          raise ArgumentError.new("channel_arn must not be empty") if @channel_arn.empty?
        end
      end

      struct JoinStorageSessionAsViewerInput
        include JSON::Serializable

        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        @[JSON::Field(key: "clientId")]
        getter client_id : String

        def initialize(@channel_arn : String, @client_id : String)
          raise ArgumentError.new("channel_arn must not be empty") if @channel_arn.empty?
          raise ArgumentError.new("client_id must not be empty") if @client_id.empty?
        end
      end
    end
  end
end
