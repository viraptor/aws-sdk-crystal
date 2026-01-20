module AwsSdk
  module ImportExport
    module Model
      API_VERSION = "2010-06-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "importexport"
      ENDPOINT_PREFIX = "importexport"
      ENDPOINT_RULE_SET_JSON = nil

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_JOB = OperationModel.new(
        name: "CancelJob",
        http_method: "POST",
        request_uri: "/?Operation=CancelJob"
      )

      CREATE_JOB = OperationModel.new(
        name: "CreateJob",
        http_method: "POST",
        request_uri: "/?Operation=CreateJob"
      )

      GET_SHIPPING_LABEL = OperationModel.new(
        name: "GetShippingLabel",
        http_method: "POST",
        request_uri: "/?Operation=GetShippingLabel"
      )

      GET_STATUS = OperationModel.new(
        name: "GetStatus",
        http_method: "POST",
        request_uri: "/?Operation=GetStatus"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "POST",
        request_uri: "/?Operation=ListJobs"
      )

      UPDATE_JOB = OperationModel.new(
        name: "UpdateJob",
        http_method: "POST",
        request_uri: "/?Operation=UpdateJob"
      )
    end
  end
end
