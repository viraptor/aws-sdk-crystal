module AwsSdk
  module Route53Domains
    module Model
      API_VERSION = "2014-05-15"
      TARGET_PREFIX = "Route53Domains_v20140515"
      SIGNING_NAME = "route53domains"
      ENDPOINT_PREFIX = "route53domains"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53domains-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53domains-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53domains.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://route53domains.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_DOMAIN_TRANSFER_FROM_ANOTHER_AWS_ACCOUNT = OperationModel.new(
        name: "AcceptDomainTransferFromAnotherAwsAccount",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_DELEGATION_SIGNER_TO_DOMAIN = OperationModel.new(
        name: "AssociateDelegationSignerToDomain",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_DOMAIN_TRANSFER_TO_ANOTHER_AWS_ACCOUNT = OperationModel.new(
        name: "CancelDomainTransferToAnotherAwsAccount",
        http_method: "POST",
        request_uri: "/"
      )

      CHECK_DOMAIN_AVAILABILITY = OperationModel.new(
        name: "CheckDomainAvailability",
        http_method: "POST",
        request_uri: "/"
      )

      CHECK_DOMAIN_TRANSFERABILITY = OperationModel.new(
        name: "CheckDomainTransferability",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DOMAIN = OperationModel.new(
        name: "DeleteDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TAGS_FOR_DOMAIN = OperationModel.new(
        name: "DeleteTagsForDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_DOMAIN_AUTO_RENEW = OperationModel.new(
        name: "DisableDomainAutoRenew",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_DOMAIN_TRANSFER_LOCK = OperationModel.new(
        name: "DisableDomainTransferLock",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_DELEGATION_SIGNER_FROM_DOMAIN = OperationModel.new(
        name: "DisassociateDelegationSignerFromDomain",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_DOMAIN_AUTO_RENEW = OperationModel.new(
        name: "EnableDomainAutoRenew",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_DOMAIN_TRANSFER_LOCK = OperationModel.new(
        name: "EnableDomainTransferLock",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTACT_REACHABILITY_STATUS = OperationModel.new(
        name: "GetContactReachabilityStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DOMAIN_DETAIL = OperationModel.new(
        name: "GetDomainDetail",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DOMAIN_SUGGESTIONS = OperationModel.new(
        name: "GetDomainSuggestions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OPERATION_DETAIL = OperationModel.new(
        name: "GetOperationDetail",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOMAINS = OperationModel.new(
        name: "ListDomains",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OPERATIONS = OperationModel.new(
        name: "ListOperations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PRICES = OperationModel.new(
        name: "ListPrices",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_DOMAIN = OperationModel.new(
        name: "ListTagsForDomain",
        http_method: "POST",
        request_uri: "/"
      )

      PUSH_DOMAIN = OperationModel.new(
        name: "PushDomain",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_DOMAIN = OperationModel.new(
        name: "RegisterDomain",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_DOMAIN_TRANSFER_FROM_ANOTHER_AWS_ACCOUNT = OperationModel.new(
        name: "RejectDomainTransferFromAnotherAwsAccount",
        http_method: "POST",
        request_uri: "/"
      )

      RENEW_DOMAIN = OperationModel.new(
        name: "RenewDomain",
        http_method: "POST",
        request_uri: "/"
      )

      RESEND_CONTACT_REACHABILITY_EMAIL = OperationModel.new(
        name: "ResendContactReachabilityEmail",
        http_method: "POST",
        request_uri: "/"
      )

      RESEND_OPERATION_AUTHORIZATION = OperationModel.new(
        name: "ResendOperationAuthorization",
        http_method: "POST",
        request_uri: "/"
      )

      RETRIEVE_DOMAIN_AUTH_CODE = OperationModel.new(
        name: "RetrieveDomainAuthCode",
        http_method: "POST",
        request_uri: "/"
      )

      TRANSFER_DOMAIN = OperationModel.new(
        name: "TransferDomain",
        http_method: "POST",
        request_uri: "/"
      )

      TRANSFER_DOMAIN_TO_ANOTHER_AWS_ACCOUNT = OperationModel.new(
        name: "TransferDomainToAnotherAwsAccount",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DOMAIN_CONTACT = OperationModel.new(
        name: "UpdateDomainContact",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DOMAIN_CONTACT_PRIVACY = OperationModel.new(
        name: "UpdateDomainContactPrivacy",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DOMAIN_NAMESERVERS = OperationModel.new(
        name: "UpdateDomainNameservers",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TAGS_FOR_DOMAIN = OperationModel.new(
        name: "UpdateTagsForDomain",
        http_method: "POST",
        request_uri: "/"
      )

      VIEW_BILLING = OperationModel.new(
        name: "ViewBilling",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
