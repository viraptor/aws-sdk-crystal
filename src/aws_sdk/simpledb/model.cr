module AwsSdk
  module SimpleDB
    module Model
      API_VERSION = "2009-04-15"
      TARGET_PREFIX = ""
      SIGNING_NAME = "sdb"
      ENDPOINT_PREFIX = "sdb"
      ENDPOINT_RULE_SET_JSON = nil

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_DELETE_ATTRIBUTES = OperationModel.new(
        name: "BatchDeleteAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_PUT_ATTRIBUTES = OperationModel.new(
        name: "BatchPutAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DOMAIN = OperationModel.new(
        name: "CreateDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ATTRIBUTES = OperationModel.new(
        name: "DeleteAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DOMAIN = OperationModel.new(
        name: "DeleteDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DOMAIN_METADATA = OperationModel.new(
        name: "DomainMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ATTRIBUTES = OperationModel.new(
        name: "GetAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOMAINS = OperationModel.new(
        name: "ListDomains",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ATTRIBUTES = OperationModel.new(
        name: "PutAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      SELECT = OperationModel.new(
        name: "Select",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
