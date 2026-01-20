module Aws
  module SSMIncidents
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "ssm-incidents"
      ENDPOINT_PREFIX = "ssm-incidents"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ssm-incidents-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ssm-incidents-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ssm-incidents.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://ssm-incidents.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_INCIDENT_FINDINGS = OperationModel.new(
        name: "BatchGetIncidentFindings",
        http_method: "POST",
        request_uri: "/batchGetIncidentFindings"
      )

      CREATE_REPLICATION_SET = OperationModel.new(
        name: "CreateReplicationSet",
        http_method: "POST",
        request_uri: "/createReplicationSet"
      )

      CREATE_RESPONSE_PLAN = OperationModel.new(
        name: "CreateResponsePlan",
        http_method: "POST",
        request_uri: "/createResponsePlan"
      )

      CREATE_TIMELINE_EVENT = OperationModel.new(
        name: "CreateTimelineEvent",
        http_method: "POST",
        request_uri: "/createTimelineEvent"
      )

      DELETE_INCIDENT_RECORD = OperationModel.new(
        name: "DeleteIncidentRecord",
        http_method: "POST",
        request_uri: "/deleteIncidentRecord"
      )

      DELETE_REPLICATION_SET = OperationModel.new(
        name: "DeleteReplicationSet",
        http_method: "POST",
        request_uri: "/deleteReplicationSet"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/deleteResourcePolicy"
      )

      DELETE_RESPONSE_PLAN = OperationModel.new(
        name: "DeleteResponsePlan",
        http_method: "POST",
        request_uri: "/deleteResponsePlan"
      )

      DELETE_TIMELINE_EVENT = OperationModel.new(
        name: "DeleteTimelineEvent",
        http_method: "POST",
        request_uri: "/deleteTimelineEvent"
      )

      GET_INCIDENT_RECORD = OperationModel.new(
        name: "GetIncidentRecord",
        http_method: "GET",
        request_uri: "/getIncidentRecord"
      )

      GET_REPLICATION_SET = OperationModel.new(
        name: "GetReplicationSet",
        http_method: "GET",
        request_uri: "/getReplicationSet"
      )

      GET_RESOURCE_POLICIES = OperationModel.new(
        name: "GetResourcePolicies",
        http_method: "POST",
        request_uri: "/getResourcePolicies"
      )

      GET_RESPONSE_PLAN = OperationModel.new(
        name: "GetResponsePlan",
        http_method: "GET",
        request_uri: "/getResponsePlan"
      )

      GET_TIMELINE_EVENT = OperationModel.new(
        name: "GetTimelineEvent",
        http_method: "GET",
        request_uri: "/getTimelineEvent"
      )

      LIST_INCIDENT_FINDINGS = OperationModel.new(
        name: "ListIncidentFindings",
        http_method: "POST",
        request_uri: "/listIncidentFindings"
      )

      LIST_INCIDENT_RECORDS = OperationModel.new(
        name: "ListIncidentRecords",
        http_method: "POST",
        request_uri: "/listIncidentRecords"
      )

      LIST_RELATED_ITEMS = OperationModel.new(
        name: "ListRelatedItems",
        http_method: "POST",
        request_uri: "/listRelatedItems"
      )

      LIST_REPLICATION_SETS = OperationModel.new(
        name: "ListReplicationSets",
        http_method: "POST",
        request_uri: "/listReplicationSets"
      )

      LIST_RESPONSE_PLANS = OperationModel.new(
        name: "ListResponsePlans",
        http_method: "POST",
        request_uri: "/listResponsePlans"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_TIMELINE_EVENTS = OperationModel.new(
        name: "ListTimelineEvents",
        http_method: "POST",
        request_uri: "/listTimelineEvents"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/putResourcePolicy"
      )

      START_INCIDENT = OperationModel.new(
        name: "StartIncident",
        http_method: "POST",
        request_uri: "/startIncident"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_DELETION_PROTECTION = OperationModel.new(
        name: "UpdateDeletionProtection",
        http_method: "POST",
        request_uri: "/updateDeletionProtection"
      )

      UPDATE_INCIDENT_RECORD = OperationModel.new(
        name: "UpdateIncidentRecord",
        http_method: "POST",
        request_uri: "/updateIncidentRecord"
      )

      UPDATE_RELATED_ITEMS = OperationModel.new(
        name: "UpdateRelatedItems",
        http_method: "POST",
        request_uri: "/updateRelatedItems"
      )

      UPDATE_REPLICATION_SET = OperationModel.new(
        name: "UpdateReplicationSet",
        http_method: "POST",
        request_uri: "/updateReplicationSet"
      )

      UPDATE_RESPONSE_PLAN = OperationModel.new(
        name: "UpdateResponsePlan",
        http_method: "POST",
        request_uri: "/updateResponsePlan"
      )

      UPDATE_TIMELINE_EVENT = OperationModel.new(
        name: "UpdateTimelineEvent",
        http_method: "POST",
        request_uri: "/updateTimelineEvent"
      )
    end
  end
end
