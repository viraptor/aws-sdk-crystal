module AwsSdk
  module KinesisVideoWebrtcStorage
    module Model
      ENDPOINT_PREFIX = "kinesisvideo"
      ENDPOINT_RULE_SET_JSON = nil

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      JOIN_STORAGE_SESSION = OperationModel.new(
        name: "JoinStorageSession",
        http_method: "POST",
        request_uri: "/joinStorageSession"
      )

      JOIN_STORAGE_SESSION_AS_VIEWER = OperationModel.new(
        name: "JoinStorageSessionAsViewer",
        http_method: "POST",
        request_uri: "/joinStorageSessionAsViewer"
      )
    end
  end
end
