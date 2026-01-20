module AwsSdk
  module EKSAuth
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # The Amazon EKS Auth API and the AssumeRoleForPodIdentity action are only used by the EKS Pod
      # Identity Agent. We recommend that applications use the Amazon Web Services SDKs to connect to Amazon
      # Web Services services; if credentials from an EKS Pod Identity association are available in the pod,
      # the latest versions of the SDKs use them automatically.

      def assume_role_for_pod_identity(
        cluster_name : String,
        token : String
      ) : Protocol::Request
        input = Types::AssumeRoleForPodIdentityRequest.new(cluster_name: cluster_name, token: token)
        assume_role_for_pod_identity(input)
      end

      def assume_role_for_pod_identity(input : Types::AssumeRoleForPodIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSUME_ROLE_FOR_POD_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
