module Aws
  module MailManager
    module Model
      API_VERSION = "2023-10-17"
      TARGET_PREFIX = "MailManagerSvc"
      SIGNING_NAME = "ses"
      ENDPOINT_PREFIX = "mail-manager"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://mail-manager-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://mail-manager-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://mail-manager.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://mail-manager.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ADDON_INSTANCE = OperationModel.new(
        name: "CreateAddonInstance",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ADDON_SUBSCRIPTION = OperationModel.new(
        name: "CreateAddonSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ADDRESS_LIST = OperationModel.new(
        name: "CreateAddressList",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ADDRESS_LIST_IMPORT_JOB = OperationModel.new(
        name: "CreateAddressListImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ARCHIVE = OperationModel.new(
        name: "CreateArchive",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INGRESS_POINT = OperationModel.new(
        name: "CreateIngressPoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RELAY = OperationModel.new(
        name: "CreateRelay",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RULE_SET = OperationModel.new(
        name: "CreateRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRAFFIC_POLICY = OperationModel.new(
        name: "CreateTrafficPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ADDON_INSTANCE = OperationModel.new(
        name: "DeleteAddonInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ADDON_SUBSCRIPTION = OperationModel.new(
        name: "DeleteAddonSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ADDRESS_LIST = OperationModel.new(
        name: "DeleteAddressList",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ARCHIVE = OperationModel.new(
        name: "DeleteArchive",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INGRESS_POINT = OperationModel.new(
        name: "DeleteIngressPoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RELAY = OperationModel.new(
        name: "DeleteRelay",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RULE_SET = OperationModel.new(
        name: "DeleteRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRAFFIC_POLICY = OperationModel.new(
        name: "DeleteTrafficPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_MEMBER_FROM_ADDRESS_LIST = OperationModel.new(
        name: "DeregisterMemberFromAddressList",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ADDON_INSTANCE = OperationModel.new(
        name: "GetAddonInstance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ADDON_SUBSCRIPTION = OperationModel.new(
        name: "GetAddonSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ADDRESS_LIST = OperationModel.new(
        name: "GetAddressList",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ADDRESS_LIST_IMPORT_JOB = OperationModel.new(
        name: "GetAddressListImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ARCHIVE = OperationModel.new(
        name: "GetArchive",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ARCHIVE_EXPORT = OperationModel.new(
        name: "GetArchiveExport",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ARCHIVE_MESSAGE = OperationModel.new(
        name: "GetArchiveMessage",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ARCHIVE_MESSAGE_CONTENT = OperationModel.new(
        name: "GetArchiveMessageContent",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ARCHIVE_SEARCH = OperationModel.new(
        name: "GetArchiveSearch",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ARCHIVE_SEARCH_RESULTS = OperationModel.new(
        name: "GetArchiveSearchResults",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INGRESS_POINT = OperationModel.new(
        name: "GetIngressPoint",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MEMBER_OF_ADDRESS_LIST = OperationModel.new(
        name: "GetMemberOfAddressList",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELAY = OperationModel.new(
        name: "GetRelay",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RULE_SET = OperationModel.new(
        name: "GetRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRAFFIC_POLICY = OperationModel.new(
        name: "GetTrafficPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ADDON_INSTANCES = OperationModel.new(
        name: "ListAddonInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ADDON_SUBSCRIPTIONS = OperationModel.new(
        name: "ListAddonSubscriptions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ADDRESS_LIST_IMPORT_JOBS = OperationModel.new(
        name: "ListAddressListImportJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ADDRESS_LISTS = OperationModel.new(
        name: "ListAddressLists",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ARCHIVE_EXPORTS = OperationModel.new(
        name: "ListArchiveExports",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ARCHIVE_SEARCHES = OperationModel.new(
        name: "ListArchiveSearches",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ARCHIVES = OperationModel.new(
        name: "ListArchives",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INGRESS_POINTS = OperationModel.new(
        name: "ListIngressPoints",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MEMBERS_OF_ADDRESS_LIST = OperationModel.new(
        name: "ListMembersOfAddressList",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RELAYS = OperationModel.new(
        name: "ListRelays",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RULE_SETS = OperationModel.new(
        name: "ListRuleSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRAFFIC_POLICIES = OperationModel.new(
        name: "ListTrafficPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_MEMBER_TO_ADDRESS_LIST = OperationModel.new(
        name: "RegisterMemberToAddressList",
        http_method: "POST",
        request_uri: "/"
      )

      START_ADDRESS_LIST_IMPORT_JOB = OperationModel.new(
        name: "StartAddressListImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_ARCHIVE_EXPORT = OperationModel.new(
        name: "StartArchiveExport",
        http_method: "POST",
        request_uri: "/"
      )

      START_ARCHIVE_SEARCH = OperationModel.new(
        name: "StartArchiveSearch",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_ADDRESS_LIST_IMPORT_JOB = OperationModel.new(
        name: "StopAddressListImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_ARCHIVE_EXPORT = OperationModel.new(
        name: "StopArchiveExport",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_ARCHIVE_SEARCH = OperationModel.new(
        name: "StopArchiveSearch",
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

      UPDATE_ARCHIVE = OperationModel.new(
        name: "UpdateArchive",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INGRESS_POINT = OperationModel.new(
        name: "UpdateIngressPoint",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RELAY = OperationModel.new(
        name: "UpdateRelay",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RULE_SET = OperationModel.new(
        name: "UpdateRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TRAFFIC_POLICY = OperationModel.new(
        name: "UpdateTrafficPolicy",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
