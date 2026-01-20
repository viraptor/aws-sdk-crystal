module Aws
  module MediaConvert
    module Model
      API_VERSION = "2017-08-29"
      TARGET_PREFIX = ""
      SIGNING_NAME = "mediaconvert"
      ENDPOINT_PREFIX = "mediaconvert"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediaconvert-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://mediaconvert.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://mediaconvert-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediaconvert.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"cn-northwest-1"]}],"endpoint":{"url":"https://subscribe.mediaconvert.cn-northwest-1.amazonaws.com.cn","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://mediaconvert.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_CERTIFICATE = OperationModel.new(
        name: "AssociateCertificate",
        http_method: "POST",
        request_uri: "/2017-08-29/certificates"
      )

      CANCEL_JOB = OperationModel.new(
        name: "CancelJob",
        http_method: "DELETE",
        request_uri: "/2017-08-29/jobs/{id}"
      )

      CREATE_JOB = OperationModel.new(
        name: "CreateJob",
        http_method: "POST",
        request_uri: "/2017-08-29/jobs"
      )

      CREATE_JOB_TEMPLATE = OperationModel.new(
        name: "CreateJobTemplate",
        http_method: "POST",
        request_uri: "/2017-08-29/jobTemplates"
      )

      CREATE_PRESET = OperationModel.new(
        name: "CreatePreset",
        http_method: "POST",
        request_uri: "/2017-08-29/presets"
      )

      CREATE_QUEUE = OperationModel.new(
        name: "CreateQueue",
        http_method: "POST",
        request_uri: "/2017-08-29/queues"
      )

      CREATE_RESOURCE_SHARE = OperationModel.new(
        name: "CreateResourceShare",
        http_method: "POST",
        request_uri: "/2017-08-29/resourceShares"
      )

      DELETE_JOB_TEMPLATE = OperationModel.new(
        name: "DeleteJobTemplate",
        http_method: "DELETE",
        request_uri: "/2017-08-29/jobTemplates/{name}"
      )

      DELETE_POLICY = OperationModel.new(
        name: "DeletePolicy",
        http_method: "DELETE",
        request_uri: "/2017-08-29/policy"
      )

      DELETE_PRESET = OperationModel.new(
        name: "DeletePreset",
        http_method: "DELETE",
        request_uri: "/2017-08-29/presets/{name}"
      )

      DELETE_QUEUE = OperationModel.new(
        name: "DeleteQueue",
        http_method: "DELETE",
        request_uri: "/2017-08-29/queues/{name}"
      )

      DESCRIBE_ENDPOINTS = OperationModel.new(
        name: "DescribeEndpoints",
        http_method: "POST",
        request_uri: "/2017-08-29/endpoints"
      )

      DISASSOCIATE_CERTIFICATE = OperationModel.new(
        name: "DisassociateCertificate",
        http_method: "DELETE",
        request_uri: "/2017-08-29/certificates/{arn}"
      )

      GET_JOB = OperationModel.new(
        name: "GetJob",
        http_method: "GET",
        request_uri: "/2017-08-29/jobs/{id}"
      )

      GET_JOB_TEMPLATE = OperationModel.new(
        name: "GetJobTemplate",
        http_method: "GET",
        request_uri: "/2017-08-29/jobTemplates/{name}"
      )

      GET_JOBS_QUERY_RESULTS = OperationModel.new(
        name: "GetJobsQueryResults",
        http_method: "GET",
        request_uri: "/2017-08-29/jobsQueries/{id}"
      )

      GET_POLICY = OperationModel.new(
        name: "GetPolicy",
        http_method: "GET",
        request_uri: "/2017-08-29/policy"
      )

      GET_PRESET = OperationModel.new(
        name: "GetPreset",
        http_method: "GET",
        request_uri: "/2017-08-29/presets/{name}"
      )

      GET_QUEUE = OperationModel.new(
        name: "GetQueue",
        http_method: "GET",
        request_uri: "/2017-08-29/queues/{name}"
      )

      LIST_JOB_TEMPLATES = OperationModel.new(
        name: "ListJobTemplates",
        http_method: "GET",
        request_uri: "/2017-08-29/jobTemplates"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "GET",
        request_uri: "/2017-08-29/jobs"
      )

      LIST_PRESETS = OperationModel.new(
        name: "ListPresets",
        http_method: "GET",
        request_uri: "/2017-08-29/presets"
      )

      LIST_QUEUES = OperationModel.new(
        name: "ListQueues",
        http_method: "GET",
        request_uri: "/2017-08-29/queues"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/2017-08-29/tags/{arn}"
      )

      LIST_VERSIONS = OperationModel.new(
        name: "ListVersions",
        http_method: "GET",
        request_uri: "/2017-08-29/versions"
      )

      PROBE = OperationModel.new(
        name: "Probe",
        http_method: "POST",
        request_uri: "/2017-08-29/probe"
      )

      PUT_POLICY = OperationModel.new(
        name: "PutPolicy",
        http_method: "PUT",
        request_uri: "/2017-08-29/policy"
      )

      SEARCH_JOBS = OperationModel.new(
        name: "SearchJobs",
        http_method: "GET",
        request_uri: "/2017-08-29/search"
      )

      START_JOBS_QUERY = OperationModel.new(
        name: "StartJobsQuery",
        http_method: "POST",
        request_uri: "/2017-08-29/jobsQueries"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/2017-08-29/tags"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "PUT",
        request_uri: "/2017-08-29/tags/{arn}"
      )

      UPDATE_JOB_TEMPLATE = OperationModel.new(
        name: "UpdateJobTemplate",
        http_method: "PUT",
        request_uri: "/2017-08-29/jobTemplates/{name}"
      )

      UPDATE_PRESET = OperationModel.new(
        name: "UpdatePreset",
        http_method: "PUT",
        request_uri: "/2017-08-29/presets/{name}"
      )

      UPDATE_QUEUE = OperationModel.new(
        name: "UpdateQueue",
        http_method: "PUT",
        request_uri: "/2017-08-29/queues/{name}"
      )
    end
  end
end
