module Aws
  module Tnb
    module Model
      API_VERSION = "2008-10-21"
      TARGET_PREFIX = ""
      SIGNING_NAME = "tnb"
      ENDPOINT_PREFIX = "tnb"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://tnb-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://tnb-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://tnb.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://tnb.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_SOL_NETWORK_OPERATION = OperationModel.new(
        name: "CancelSolNetworkOperation",
        http_method: "POST",
        request_uri: "/sol/nslcm/v1/ns_lcm_op_occs/{nsLcmOpOccId}/cancel"
      )

      CREATE_SOL_FUNCTION_PACKAGE = OperationModel.new(
        name: "CreateSolFunctionPackage",
        http_method: "POST",
        request_uri: "/sol/vnfpkgm/v1/vnf_packages"
      )

      CREATE_SOL_NETWORK_INSTANCE = OperationModel.new(
        name: "CreateSolNetworkInstance",
        http_method: "POST",
        request_uri: "/sol/nslcm/v1/ns_instances"
      )

      CREATE_SOL_NETWORK_PACKAGE = OperationModel.new(
        name: "CreateSolNetworkPackage",
        http_method: "POST",
        request_uri: "/sol/nsd/v1/ns_descriptors"
      )

      DELETE_SOL_FUNCTION_PACKAGE = OperationModel.new(
        name: "DeleteSolFunctionPackage",
        http_method: "DELETE",
        request_uri: "/sol/vnfpkgm/v1/vnf_packages/{vnfPkgId}"
      )

      DELETE_SOL_NETWORK_INSTANCE = OperationModel.new(
        name: "DeleteSolNetworkInstance",
        http_method: "DELETE",
        request_uri: "/sol/nslcm/v1/ns_instances/{nsInstanceId}"
      )

      DELETE_SOL_NETWORK_PACKAGE = OperationModel.new(
        name: "DeleteSolNetworkPackage",
        http_method: "DELETE",
        request_uri: "/sol/nsd/v1/ns_descriptors/{nsdInfoId}"
      )

      GET_SOL_FUNCTION_INSTANCE = OperationModel.new(
        name: "GetSolFunctionInstance",
        http_method: "GET",
        request_uri: "/sol/vnflcm/v1/vnf_instances/{vnfInstanceId}"
      )

      GET_SOL_FUNCTION_PACKAGE = OperationModel.new(
        name: "GetSolFunctionPackage",
        http_method: "GET",
        request_uri: "/sol/vnfpkgm/v1/vnf_packages/{vnfPkgId}"
      )

      GET_SOL_FUNCTION_PACKAGE_CONTENT = OperationModel.new(
        name: "GetSolFunctionPackageContent",
        http_method: "GET",
        request_uri: "/sol/vnfpkgm/v1/vnf_packages/{vnfPkgId}/package_content"
      )

      GET_SOL_FUNCTION_PACKAGE_DESCRIPTOR = OperationModel.new(
        name: "GetSolFunctionPackageDescriptor",
        http_method: "GET",
        request_uri: "/sol/vnfpkgm/v1/vnf_packages/{vnfPkgId}/vnfd"
      )

      GET_SOL_NETWORK_INSTANCE = OperationModel.new(
        name: "GetSolNetworkInstance",
        http_method: "GET",
        request_uri: "/sol/nslcm/v1/ns_instances/{nsInstanceId}"
      )

      GET_SOL_NETWORK_OPERATION = OperationModel.new(
        name: "GetSolNetworkOperation",
        http_method: "GET",
        request_uri: "/sol/nslcm/v1/ns_lcm_op_occs/{nsLcmOpOccId}"
      )

      GET_SOL_NETWORK_PACKAGE = OperationModel.new(
        name: "GetSolNetworkPackage",
        http_method: "GET",
        request_uri: "/sol/nsd/v1/ns_descriptors/{nsdInfoId}"
      )

      GET_SOL_NETWORK_PACKAGE_CONTENT = OperationModel.new(
        name: "GetSolNetworkPackageContent",
        http_method: "GET",
        request_uri: "/sol/nsd/v1/ns_descriptors/{nsdInfoId}/nsd_content"
      )

      GET_SOL_NETWORK_PACKAGE_DESCRIPTOR = OperationModel.new(
        name: "GetSolNetworkPackageDescriptor",
        http_method: "GET",
        request_uri: "/sol/nsd/v1/ns_descriptors/{nsdInfoId}/nsd"
      )

      INSTANTIATE_SOL_NETWORK_INSTANCE = OperationModel.new(
        name: "InstantiateSolNetworkInstance",
        http_method: "POST",
        request_uri: "/sol/nslcm/v1/ns_instances/{nsInstanceId}/instantiate"
      )

      LIST_SOL_FUNCTION_INSTANCES = OperationModel.new(
        name: "ListSolFunctionInstances",
        http_method: "GET",
        request_uri: "/sol/vnflcm/v1/vnf_instances"
      )

      LIST_SOL_FUNCTION_PACKAGES = OperationModel.new(
        name: "ListSolFunctionPackages",
        http_method: "GET",
        request_uri: "/sol/vnfpkgm/v1/vnf_packages"
      )

      LIST_SOL_NETWORK_INSTANCES = OperationModel.new(
        name: "ListSolNetworkInstances",
        http_method: "GET",
        request_uri: "/sol/nslcm/v1/ns_instances"
      )

      LIST_SOL_NETWORK_OPERATIONS = OperationModel.new(
        name: "ListSolNetworkOperations",
        http_method: "GET",
        request_uri: "/sol/nslcm/v1/ns_lcm_op_occs"
      )

      LIST_SOL_NETWORK_PACKAGES = OperationModel.new(
        name: "ListSolNetworkPackages",
        http_method: "GET",
        request_uri: "/sol/nsd/v1/ns_descriptors"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_SOL_FUNCTION_PACKAGE_CONTENT = OperationModel.new(
        name: "PutSolFunctionPackageContent",
        http_method: "PUT",
        request_uri: "/sol/vnfpkgm/v1/vnf_packages/{vnfPkgId}/package_content"
      )

      PUT_SOL_NETWORK_PACKAGE_CONTENT = OperationModel.new(
        name: "PutSolNetworkPackageContent",
        http_method: "PUT",
        request_uri: "/sol/nsd/v1/ns_descriptors/{nsdInfoId}/nsd_content"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      TERMINATE_SOL_NETWORK_INSTANCE = OperationModel.new(
        name: "TerminateSolNetworkInstance",
        http_method: "POST",
        request_uri: "/sol/nslcm/v1/ns_instances/{nsInstanceId}/terminate"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_SOL_FUNCTION_PACKAGE = OperationModel.new(
        name: "UpdateSolFunctionPackage",
        http_method: "PATCH",
        request_uri: "/sol/vnfpkgm/v1/vnf_packages/{vnfPkgId}"
      )

      UPDATE_SOL_NETWORK_INSTANCE = OperationModel.new(
        name: "UpdateSolNetworkInstance",
        http_method: "POST",
        request_uri: "/sol/nslcm/v1/ns_instances/{nsInstanceId}/update"
      )

      UPDATE_SOL_NETWORK_PACKAGE = OperationModel.new(
        name: "UpdateSolNetworkPackage",
        http_method: "PATCH",
        request_uri: "/sol/nsd/v1/ns_descriptors/{nsdInfoId}"
      )

      VALIDATE_SOL_FUNCTION_PACKAGE_CONTENT = OperationModel.new(
        name: "ValidateSolFunctionPackageContent",
        http_method: "PUT",
        request_uri: "/sol/vnfpkgm/v1/vnf_packages/{vnfPkgId}/package_content/validate"
      )

      VALIDATE_SOL_NETWORK_PACKAGE_CONTENT = OperationModel.new(
        name: "ValidateSolNetworkPackageContent",
        http_method: "PUT",
        request_uri: "/sol/nsd/v1/ns_descriptors/{nsdInfoId}/nsd_content/validate"
      )
    end
  end
end
