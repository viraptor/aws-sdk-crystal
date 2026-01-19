module AwsSdk
  module Codeartifact
    module Model
      API_VERSION = "2018-09-22"
      TARGET_PREFIX = ""
      SIGNING_NAME = "codeartifact"
      ENDPOINT_PREFIX = "codeartifact"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codeartifact-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codeartifact-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codeartifact.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://codeartifact.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_EXTERNAL_CONNECTION = OperationModel.new(
        name: "AssociateExternalConnection",
        http_method: "POST",
        request_uri: "/v1/repository/external-connection"
      )

      COPY_PACKAGE_VERSIONS = OperationModel.new(
        name: "CopyPackageVersions",
        http_method: "POST",
        request_uri: "/v1/package/versions/copy"
      )

      CREATE_DOMAIN = OperationModel.new(
        name: "CreateDomain",
        http_method: "POST",
        request_uri: "/v1/domain"
      )

      CREATE_PACKAGE_GROUP = OperationModel.new(
        name: "CreatePackageGroup",
        http_method: "POST",
        request_uri: "/v1/package-group"
      )

      CREATE_REPOSITORY = OperationModel.new(
        name: "CreateRepository",
        http_method: "POST",
        request_uri: "/v1/repository"
      )

      DELETE_DOMAIN = OperationModel.new(
        name: "DeleteDomain",
        http_method: "DELETE",
        request_uri: "/v1/domain"
      )

      DELETE_DOMAIN_PERMISSIONS_POLICY = OperationModel.new(
        name: "DeleteDomainPermissionsPolicy",
        http_method: "DELETE",
        request_uri: "/v1/domain/permissions/policy"
      )

      DELETE_PACKAGE = OperationModel.new(
        name: "DeletePackage",
        http_method: "DELETE",
        request_uri: "/v1/package"
      )

      DELETE_PACKAGE_GROUP = OperationModel.new(
        name: "DeletePackageGroup",
        http_method: "DELETE",
        request_uri: "/v1/package-group"
      )

      DELETE_PACKAGE_VERSIONS = OperationModel.new(
        name: "DeletePackageVersions",
        http_method: "POST",
        request_uri: "/v1/package/versions/delete"
      )

      DELETE_REPOSITORY = OperationModel.new(
        name: "DeleteRepository",
        http_method: "DELETE",
        request_uri: "/v1/repository"
      )

      DELETE_REPOSITORY_PERMISSIONS_POLICY = OperationModel.new(
        name: "DeleteRepositoryPermissionsPolicy",
        http_method: "DELETE",
        request_uri: "/v1/repository/permissions/policies"
      )

      DESCRIBE_DOMAIN = OperationModel.new(
        name: "DescribeDomain",
        http_method: "GET",
        request_uri: "/v1/domain"
      )

      DESCRIBE_PACKAGE = OperationModel.new(
        name: "DescribePackage",
        http_method: "GET",
        request_uri: "/v1/package"
      )

      DESCRIBE_PACKAGE_GROUP = OperationModel.new(
        name: "DescribePackageGroup",
        http_method: "GET",
        request_uri: "/v1/package-group"
      )

      DESCRIBE_PACKAGE_VERSION = OperationModel.new(
        name: "DescribePackageVersion",
        http_method: "GET",
        request_uri: "/v1/package/version"
      )

      DESCRIBE_REPOSITORY = OperationModel.new(
        name: "DescribeRepository",
        http_method: "GET",
        request_uri: "/v1/repository"
      )

      DISASSOCIATE_EXTERNAL_CONNECTION = OperationModel.new(
        name: "DisassociateExternalConnection",
        http_method: "DELETE",
        request_uri: "/v1/repository/external-connection"
      )

      DISPOSE_PACKAGE_VERSIONS = OperationModel.new(
        name: "DisposePackageVersions",
        http_method: "POST",
        request_uri: "/v1/package/versions/dispose"
      )

      GET_ASSOCIATED_PACKAGE_GROUP = OperationModel.new(
        name: "GetAssociatedPackageGroup",
        http_method: "GET",
        request_uri: "/v1/get-associated-package-group"
      )

      GET_AUTHORIZATION_TOKEN = OperationModel.new(
        name: "GetAuthorizationToken",
        http_method: "POST",
        request_uri: "/v1/authorization-token"
      )

      GET_DOMAIN_PERMISSIONS_POLICY = OperationModel.new(
        name: "GetDomainPermissionsPolicy",
        http_method: "GET",
        request_uri: "/v1/domain/permissions/policy"
      )

      GET_PACKAGE_VERSION_ASSET = OperationModel.new(
        name: "GetPackageVersionAsset",
        http_method: "GET",
        request_uri: "/v1/package/version/asset"
      )

      GET_PACKAGE_VERSION_README = OperationModel.new(
        name: "GetPackageVersionReadme",
        http_method: "GET",
        request_uri: "/v1/package/version/readme"
      )

      GET_REPOSITORY_ENDPOINT = OperationModel.new(
        name: "GetRepositoryEndpoint",
        http_method: "GET",
        request_uri: "/v1/repository/endpoint"
      )

      GET_REPOSITORY_PERMISSIONS_POLICY = OperationModel.new(
        name: "GetRepositoryPermissionsPolicy",
        http_method: "GET",
        request_uri: "/v1/repository/permissions/policy"
      )

      LIST_ALLOWED_REPOSITORIES_FOR_GROUP = OperationModel.new(
        name: "ListAllowedRepositoriesForGroup",
        http_method: "GET",
        request_uri: "/v1/package-group-allowed-repositories"
      )

      LIST_ASSOCIATED_PACKAGES = OperationModel.new(
        name: "ListAssociatedPackages",
        http_method: "GET",
        request_uri: "/v1/list-associated-packages"
      )

      LIST_DOMAINS = OperationModel.new(
        name: "ListDomains",
        http_method: "POST",
        request_uri: "/v1/domains"
      )

      LIST_PACKAGE_GROUPS = OperationModel.new(
        name: "ListPackageGroups",
        http_method: "POST",
        request_uri: "/v1/package-groups"
      )

      LIST_PACKAGE_VERSION_ASSETS = OperationModel.new(
        name: "ListPackageVersionAssets",
        http_method: "POST",
        request_uri: "/v1/package/version/assets"
      )

      LIST_PACKAGE_VERSION_DEPENDENCIES = OperationModel.new(
        name: "ListPackageVersionDependencies",
        http_method: "POST",
        request_uri: "/v1/package/version/dependencies"
      )

      LIST_PACKAGE_VERSIONS = OperationModel.new(
        name: "ListPackageVersions",
        http_method: "POST",
        request_uri: "/v1/package/versions"
      )

      LIST_PACKAGES = OperationModel.new(
        name: "ListPackages",
        http_method: "POST",
        request_uri: "/v1/packages"
      )

      LIST_REPOSITORIES = OperationModel.new(
        name: "ListRepositories",
        http_method: "POST",
        request_uri: "/v1/repositories"
      )

      LIST_REPOSITORIES_IN_DOMAIN = OperationModel.new(
        name: "ListRepositoriesInDomain",
        http_method: "POST",
        request_uri: "/v1/domain/repositories"
      )

      LIST_SUB_PACKAGE_GROUPS = OperationModel.new(
        name: "ListSubPackageGroups",
        http_method: "POST",
        request_uri: "/v1/package-groups/sub-groups"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/v1/tags"
      )

      PUBLISH_PACKAGE_VERSION = OperationModel.new(
        name: "PublishPackageVersion",
        http_method: "POST",
        request_uri: "/v1/package/version/publish"
      )

      PUT_DOMAIN_PERMISSIONS_POLICY = OperationModel.new(
        name: "PutDomainPermissionsPolicy",
        http_method: "PUT",
        request_uri: "/v1/domain/permissions/policy"
      )

      PUT_PACKAGE_ORIGIN_CONFIGURATION = OperationModel.new(
        name: "PutPackageOriginConfiguration",
        http_method: "POST",
        request_uri: "/v1/package"
      )

      PUT_REPOSITORY_PERMISSIONS_POLICY = OperationModel.new(
        name: "PutRepositoryPermissionsPolicy",
        http_method: "PUT",
        request_uri: "/v1/repository/permissions/policy"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/v1/tag"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/v1/untag"
      )

      UPDATE_PACKAGE_GROUP = OperationModel.new(
        name: "UpdatePackageGroup",
        http_method: "PUT",
        request_uri: "/v1/package-group"
      )

      UPDATE_PACKAGE_GROUP_ORIGIN_CONFIGURATION = OperationModel.new(
        name: "UpdatePackageGroupOriginConfiguration",
        http_method: "PUT",
        request_uri: "/v1/package-group-origin-configuration"
      )

      UPDATE_PACKAGE_VERSIONS_STATUS = OperationModel.new(
        name: "UpdatePackageVersionsStatus",
        http_method: "POST",
        request_uri: "/v1/package/versions/update_status"
      )

      UPDATE_REPOSITORY = OperationModel.new(
        name: "UpdateRepository",
        http_method: "PUT",
        request_uri: "/v1/repository"
      )
    end
  end
end
