module Aws
  module DSQL
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "dsql"
      ENDPOINT_PREFIX = "dsql"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://dsql-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://dsql.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CLUSTER = OperationModel.new(
        name: "CreateCluster",
        http_method: "POST",
        request_uri: "/cluster"
      )

      DELETE_CLUSTER = OperationModel.new(
        name: "DeleteCluster",
        http_method: "DELETE",
        request_uri: "/cluster/{identifier}"
      )

      DELETE_CLUSTER_POLICY = OperationModel.new(
        name: "DeleteClusterPolicy",
        http_method: "DELETE",
        request_uri: "/cluster/{identifier}/policy"
      )

      GET_CLUSTER = OperationModel.new(
        name: "GetCluster",
        http_method: "GET",
        request_uri: "/cluster/{identifier}"
      )

      GET_CLUSTER_POLICY = OperationModel.new(
        name: "GetClusterPolicy",
        http_method: "GET",
        request_uri: "/cluster/{identifier}/policy"
      )

      GET_VPC_ENDPOINT_SERVICE_NAME = OperationModel.new(
        name: "GetVpcEndpointServiceName",
        http_method: "GET",
        request_uri: "/clusters/{identifier}/vpc-endpoint-service-name"
      )

      LIST_CLUSTERS = OperationModel.new(
        name: "ListClusters",
        http_method: "GET",
        request_uri: "/cluster"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_CLUSTER_POLICY = OperationModel.new(
        name: "PutClusterPolicy",
        http_method: "POST",
        request_uri: "/cluster/{identifier}/policy"
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

      UPDATE_CLUSTER = OperationModel.new(
        name: "UpdateCluster",
        http_method: "POST",
        request_uri: "/cluster/{identifier}"
      )
    end
  end
end
