module AwsSdk
  module PartnerCentralBenefits
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = "PartnerCentralBenefitsService"
      SIGNING_NAME = "partnercentral-benefits"
      ENDPOINT_PREFIX = "partnercentral-benefits"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://partnercentral-benefits-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://partnercentral-benefits.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      AMEND_BENEFIT_APPLICATION = OperationModel.new(
        name: "AmendBenefitApplication",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_BENEFIT_APPLICATION_RESOURCE = OperationModel.new(
        name: "AssociateBenefitApplicationResource",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_BENEFIT_APPLICATION = OperationModel.new(
        name: "CancelBenefitApplication",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BENEFIT_APPLICATION = OperationModel.new(
        name: "CreateBenefitApplication",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_BENEFIT_APPLICATION_RESOURCE = OperationModel.new(
        name: "DisassociateBenefitApplicationResource",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BENEFIT = OperationModel.new(
        name: "GetBenefit",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BENEFIT_ALLOCATION = OperationModel.new(
        name: "GetBenefitAllocation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BENEFIT_APPLICATION = OperationModel.new(
        name: "GetBenefitApplication",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BENEFIT_ALLOCATIONS = OperationModel.new(
        name: "ListBenefitAllocations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BENEFIT_APPLICATIONS = OperationModel.new(
        name: "ListBenefitApplications",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BENEFITS = OperationModel.new(
        name: "ListBenefits",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      RECALL_BENEFIT_APPLICATION = OperationModel.new(
        name: "RecallBenefitApplication",
        http_method: "POST",
        request_uri: "/"
      )

      SUBMIT_BENEFIT_APPLICATION = OperationModel.new(
        name: "SubmitBenefitApplication",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_BENEFIT_APPLICATION = OperationModel.new(
        name: "UpdateBenefitApplication",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
