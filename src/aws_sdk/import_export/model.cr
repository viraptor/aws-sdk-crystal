module AwsSdk
  module ImportExport
    module Model
      API_VERSION = "2010-06-01"
      ENDPOINT_PREFIX = "importexport"
      ENDPOINT_RULE_SET_JSON = nil

      struct OperationModel
        getter name : String

        def initialize(@name : String)
        end
      end

      CANCEL_JOB = OperationModel.new(name: "CancelJob")
      CREATE_JOB = OperationModel.new(name: "CreateJob")
      GET_SHIPPING_LABEL = OperationModel.new(name: "GetShippingLabel")
      GET_STATUS = OperationModel.new(name: "GetStatus")
      LIST_JOBS = OperationModel.new(name: "ListJobs")
      UPDATE_JOB = OperationModel.new(name: "UpdateJob")
    end
  end
end
