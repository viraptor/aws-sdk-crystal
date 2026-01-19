module AwsSdk
  module Codeartifact
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

      # Adds an existing external connection to a repository. One external connection is allowed per
      # repository. A repository can have one or more upstream repositories, or an external connection.
      def associate_external_connection(
        domain : String,
        external_connection : String,
        repository : String,
        domain_owner : String? = nil
      ) : Protocol::Request
        input = Types::AssociateExternalConnectionRequest.new(domain: domain, external_connection: external_connection, repository: repository, domain_owner: domain_owner)
        associate_external_connection(input)
      end
      def associate_external_connection(input : Types::AssociateExternalConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_EXTERNAL_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Copies package versions from one repository to another repository in the same domain. You must
      # specify versions or versionRevisions . You cannot specify both.
      def copy_package_versions(
        destination_repository : String,
        domain : String,
        format : String,
        package : String,
        source_repository : String,
        allow_overwrite : Bool? = nil,
        domain_owner : String? = nil,
        include_from_upstream : Bool? = nil,
        namespace : String? = nil,
        version_revisions : Hash(String, String)? = nil,
        versions : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CopyPackageVersionsRequest.new(destination_repository: destination_repository, domain: domain, format: format, package: package, source_repository: source_repository, allow_overwrite: allow_overwrite, domain_owner: domain_owner, include_from_upstream: include_from_upstream, namespace: namespace, version_revisions: version_revisions, versions: versions)
        copy_package_versions(input)
      end
      def copy_package_versions(input : Types::CopyPackageVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COPY_PACKAGE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a domain. CodeArtifact domains make it easier to manage multiple repositories across an
      # organization. You can use a domain to apply permissions across many repositories owned by different
      # Amazon Web Services accounts. An asset is stored only once in a domain, even if it's in multiple
      # repositories. Although you can have multiple domains, we recommend a single production domain that
      # contains all published artifacts so that your development teams can find and share packages. You can
      # use a second pre-production domain to test changes to the production domain configuration.
      def create_domain(
        domain : String,
        encryption_key : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDomainRequest.new(domain: domain, encryption_key: encryption_key, tags: tags)
        create_domain(input)
      end
      def create_domain(input : Types::CreateDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a package group. For more information about creating package groups, including example CLI
      # commands, see Create a package group in the CodeArtifact User Guide .
      def create_package_group(
        domain : String,
        package_group : String,
        contact_info : String? = nil,
        description : String? = nil,
        domain_owner : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreatePackageGroupRequest.new(domain: domain, package_group: package_group, contact_info: contact_info, description: description, domain_owner: domain_owner, tags: tags)
        create_package_group(input)
      end
      def create_package_group(input : Types::CreatePackageGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PACKAGE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a repository.
      def create_repository(
        domain : String,
        repository : String,
        description : String? = nil,
        domain_owner : String? = nil,
        tags : Array(Types::Tag)? = nil,
        upstreams : Array(Types::UpstreamRepository)? = nil
      ) : Protocol::Request
        input = Types::CreateRepositoryRequest.new(domain: domain, repository: repository, description: description, domain_owner: domain_owner, tags: tags, upstreams: upstreams)
        create_repository(input)
      end
      def create_repository(input : Types::CreateRepositoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REPOSITORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a domain. You cannot delete a domain that contains repositories. If you want to delete a
      # domain with repositories, first delete its repositories.
      def delete_domain(
        domain : String,
        domain_owner : String? = nil
      ) : Protocol::Request
        input = Types::DeleteDomainRequest.new(domain: domain, domain_owner: domain_owner)
        delete_domain(input)
      end
      def delete_domain(input : Types::DeleteDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the resource policy set on a domain.
      def delete_domain_permissions_policy(
        domain : String,
        domain_owner : String? = nil,
        policy_revision : String? = nil
      ) : Protocol::Request
        input = Types::DeleteDomainPermissionsPolicyRequest.new(domain: domain, domain_owner: domain_owner, policy_revision: policy_revision)
        delete_domain_permissions_policy(input)
      end
      def delete_domain_permissions_policy(input : Types::DeleteDomainPermissionsPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN_PERMISSIONS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a package and all associated package versions. A deleted package cannot be restored. To
      # delete one or more package versions, use the DeletePackageVersions API.
      def delete_package(
        domain : String,
        format : String,
        package : String,
        repository : String,
        domain_owner : String? = nil,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::DeletePackageRequest.new(domain: domain, format: format, package: package, repository: repository, domain_owner: domain_owner, namespace: namespace)
        delete_package(input)
      end
      def delete_package(input : Types::DeletePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a package group. Deleting a package group does not delete packages or package versions
      # associated with the package group. When a package group is deleted, the direct child package groups
      # will become children of the package group's direct parent package group. Therefore, if any of the
      # child groups are inheriting any settings from the parent, those settings could change.
      def delete_package_group(
        domain : String,
        package_group : String,
        domain_owner : String? = nil
      ) : Protocol::Request
        input = Types::DeletePackageGroupRequest.new(domain: domain, package_group: package_group, domain_owner: domain_owner)
        delete_package_group(input)
      end
      def delete_package_group(input : Types::DeletePackageGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PACKAGE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes one or more versions of a package. A deleted package version cannot be restored in your
      # repository. If you want to remove a package version from your repository and be able to restore it
      # later, set its status to Archived . Archived packages cannot be downloaded from a repository and
      # don't show up with list package APIs (for example, ListPackageVersions ), but you can restore them
      # using UpdatePackageVersionsStatus .
      def delete_package_versions(
        domain : String,
        format : String,
        package : String,
        repository : String,
        versions : Array(String),
        domain_owner : String? = nil,
        expected_status : String? = nil,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::DeletePackageVersionsRequest.new(domain: domain, format: format, package: package, repository: repository, versions: versions, domain_owner: domain_owner, expected_status: expected_status, namespace: namespace)
        delete_package_versions(input)
      end
      def delete_package_versions(input : Types::DeletePackageVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PACKAGE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a repository.
      def delete_repository(
        domain : String,
        repository : String,
        domain_owner : String? = nil
      ) : Protocol::Request
        input = Types::DeleteRepositoryRequest.new(domain: domain, repository: repository, domain_owner: domain_owner)
        delete_repository(input)
      end
      def delete_repository(input : Types::DeleteRepositoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REPOSITORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the resource policy that is set on a repository. After a resource policy is deleted, the
      # permissions allowed and denied by the deleted policy are removed. The effect of deleting a resource
      # policy might not be immediate. Use DeleteRepositoryPermissionsPolicy with caution. After a policy is
      # deleted, Amazon Web Services users, roles, and accounts lose permissions to perform the repository
      # actions granted by the deleted policy.
      def delete_repository_permissions_policy(
        domain : String,
        repository : String,
        domain_owner : String? = nil,
        policy_revision : String? = nil
      ) : Protocol::Request
        input = Types::DeleteRepositoryPermissionsPolicyRequest.new(domain: domain, repository: repository, domain_owner: domain_owner, policy_revision: policy_revision)
        delete_repository_permissions_policy(input)
      end
      def delete_repository_permissions_policy(input : Types::DeleteRepositoryPermissionsPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REPOSITORY_PERMISSIONS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a DomainDescription object that contains information about the requested domain.
      def describe_domain(
        domain : String,
        domain_owner : String? = nil
      ) : Protocol::Request
        input = Types::DescribeDomainRequest.new(domain: domain, domain_owner: domain_owner)
        describe_domain(input)
      end
      def describe_domain(input : Types::DescribeDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a PackageDescription object that contains information about the requested package.
      def describe_package(
        domain : String,
        format : String,
        package : String,
        repository : String,
        domain_owner : String? = nil,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::DescribePackageRequest.new(domain: domain, format: format, package: package, repository: repository, domain_owner: domain_owner, namespace: namespace)
        describe_package(input)
      end
      def describe_package(input : Types::DescribePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a PackageGroupDescription object that contains information about the requested package
      # group.
      def describe_package_group(
        domain : String,
        package_group : String,
        domain_owner : String? = nil
      ) : Protocol::Request
        input = Types::DescribePackageGroupRequest.new(domain: domain, package_group: package_group, domain_owner: domain_owner)
        describe_package_group(input)
      end
      def describe_package_group(input : Types::DescribePackageGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PACKAGE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a PackageVersionDescription object that contains information about the requested package
      # version.
      def describe_package_version(
        domain : String,
        format : String,
        package : String,
        package_version : String,
        repository : String,
        domain_owner : String? = nil,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::DescribePackageVersionRequest.new(domain: domain, format: format, package: package, package_version: package_version, repository: repository, domain_owner: domain_owner, namespace: namespace)
        describe_package_version(input)
      end
      def describe_package_version(input : Types::DescribePackageVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PACKAGE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a RepositoryDescription object that contains detailed information about the requested
      # repository.
      def describe_repository(
        domain : String,
        repository : String,
        domain_owner : String? = nil
      ) : Protocol::Request
        input = Types::DescribeRepositoryRequest.new(domain: domain, repository: repository, domain_owner: domain_owner)
        describe_repository(input)
      end
      def describe_repository(input : Types::DescribeRepositoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_REPOSITORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an existing external connection from a repository.
      def disassociate_external_connection(
        domain : String,
        external_connection : String,
        repository : String,
        domain_owner : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateExternalConnectionRequest.new(domain: domain, external_connection: external_connection, repository: repository, domain_owner: domain_owner)
        disassociate_external_connection(input)
      end
      def disassociate_external_connection(input : Types::DisassociateExternalConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_EXTERNAL_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the assets in package versions and sets the package versions' status to Disposed . A
      # disposed package version cannot be restored in your repository because its assets are deleted. To
      # view all disposed package versions in a repository, use ListPackageVersions and set the status
      # parameter to Disposed . To view information about a disposed package version, use
      # DescribePackageVersion .
      def dispose_package_versions(
        domain : String,
        format : String,
        package : String,
        repository : String,
        versions : Array(String),
        domain_owner : String? = nil,
        expected_status : String? = nil,
        namespace : String? = nil,
        version_revisions : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::DisposePackageVersionsRequest.new(domain: domain, format: format, package: package, repository: repository, versions: versions, domain_owner: domain_owner, expected_status: expected_status, namespace: namespace, version_revisions: version_revisions)
        dispose_package_versions(input)
      end
      def dispose_package_versions(input : Types::DisposePackageVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISPOSE_PACKAGE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the most closely associated package group to the specified package. This API does not
      # require that the package exist in any repository in the domain. As such, GetAssociatedPackageGroup
      # can be used to see which package group's origin configuration applies to a package before that
      # package is in a repository. This can be helpful to check if public packages are blocked without
      # ingesting them. For information package group association and matching, see Package group definition
      # syntax and matching behavior in the CodeArtifact User Guide .
      def get_associated_package_group(
        domain : String,
        format : String,
        package : String,
        domain_owner : String? = nil,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::GetAssociatedPackageGroupRequest.new(domain: domain, format: format, package: package, domain_owner: domain_owner, namespace: namespace)
        get_associated_package_group(input)
      end
      def get_associated_package_group(input : Types::GetAssociatedPackageGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSOCIATED_PACKAGE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates a temporary authorization token for accessing repositories in the domain. This API
      # requires the codeartifact:GetAuthorizationToken and sts:GetServiceBearerToken permissions. For more
      # information about authorization tokens, see CodeArtifact authentication and tokens . CodeArtifact
      # authorization tokens are valid for a period of 12 hours when created with the login command. You can
      # call login periodically to refresh the token. When you create an authorization token with the
      # GetAuthorizationToken API, you can set a custom authorization period, up to a maximum of 12 hours,
      # with the durationSeconds parameter. The authorization period begins after login or
      # GetAuthorizationToken is called. If login or GetAuthorizationToken is called while assuming a role,
      # the token lifetime is independent of the maximum session duration of the role. For example, if you
      # call sts assume-role and specify a session duration of 15 minutes, then generate a CodeArtifact
      # authorization token, the token will be valid for the full authorization period even though this is
      # longer than the 15-minute session duration. See Using IAM Roles for more information on controlling
      # session duration.
      def get_authorization_token(
        domain : String,
        domain_owner : String? = nil,
        duration_seconds : Int64? = nil
      ) : Protocol::Request
        input = Types::GetAuthorizationTokenRequest.new(domain: domain, domain_owner: domain_owner, duration_seconds: duration_seconds)
        get_authorization_token(input)
      end
      def get_authorization_token(input : Types::GetAuthorizationTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTHORIZATION_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the resource policy attached to the specified domain. The policy is a resource-based policy,
      # not an identity-based policy. For more information, see Identity-based policies and resource-based
      # policies in the IAM User Guide .
      def get_domain_permissions_policy(
        domain : String,
        domain_owner : String? = nil
      ) : Protocol::Request
        input = Types::GetDomainPermissionsPolicyRequest.new(domain: domain, domain_owner: domain_owner)
        get_domain_permissions_policy(input)
      end
      def get_domain_permissions_policy(input : Types::GetDomainPermissionsPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_PERMISSIONS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an asset (or file) that is in a package. For example, for a Maven package version, use
      # GetPackageVersionAsset to download a JAR file, a POM file, or any other assets in the package
      # version.
      def get_package_version_asset(
        asset : String,
        domain : String,
        format : String,
        package : String,
        package_version : String,
        repository : String,
        domain_owner : String? = nil,
        namespace : String? = nil,
        package_version_revision : String? = nil
      ) : Protocol::Request
        input = Types::GetPackageVersionAssetRequest.new(asset: asset, domain: domain, format: format, package: package, package_version: package_version, repository: repository, domain_owner: domain_owner, namespace: namespace, package_version_revision: package_version_revision)
        get_package_version_asset(input)
      end
      def get_package_version_asset(input : Types::GetPackageVersionAssetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PACKAGE_VERSION_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the readme file or descriptive text for a package version. The returned text might contain
      # formatting. For example, it might contain formatting for Markdown or reStructuredText.
      def get_package_version_readme(
        domain : String,
        format : String,
        package : String,
        package_version : String,
        repository : String,
        domain_owner : String? = nil,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::GetPackageVersionReadmeRequest.new(domain: domain, format: format, package: package, package_version: package_version, repository: repository, domain_owner: domain_owner, namespace: namespace)
        get_package_version_readme(input)
      end
      def get_package_version_readme(input : Types::GetPackageVersionReadmeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PACKAGE_VERSION_README, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the endpoint of a repository for a specific package format. A repository has one endpoint
      # for each package format: cargo generic maven npm nuget pypi ruby swift
      def get_repository_endpoint(
        domain : String,
        format : String,
        repository : String,
        domain_owner : String? = nil,
        endpoint_type : String? = nil
      ) : Protocol::Request
        input = Types::GetRepositoryEndpointRequest.new(domain: domain, format: format, repository: repository, domain_owner: domain_owner, endpoint_type: endpoint_type)
        get_repository_endpoint(input)
      end
      def get_repository_endpoint(input : Types::GetRepositoryEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REPOSITORY_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the resource policy that is set on a repository.
      def get_repository_permissions_policy(
        domain : String,
        repository : String,
        domain_owner : String? = nil
      ) : Protocol::Request
        input = Types::GetRepositoryPermissionsPolicyRequest.new(domain: domain, repository: repository, domain_owner: domain_owner)
        get_repository_permissions_policy(input)
      end
      def get_repository_permissions_policy(input : Types::GetRepositoryPermissionsPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REPOSITORY_PERMISSIONS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the repositories in the added repositories list of the specified restriction type for a
      # package group. For more information about restriction types and added repository lists, see Package
      # group origin controls in the CodeArtifact User Guide .
      def list_allowed_repositories_for_group(
        domain : String,
        origin_restriction_type : String,
        package_group : String,
        domain_owner : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAllowedRepositoriesForGroupRequest.new(domain: domain, origin_restriction_type: origin_restriction_type, package_group: package_group, domain_owner: domain_owner, max_results: max_results, next_token: next_token)
        list_allowed_repositories_for_group(input)
      end
      def list_allowed_repositories_for_group(input : Types::ListAllowedRepositoriesForGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ALLOWED_REPOSITORIES_FOR_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of packages associated with the requested package group. For information package
      # group association and matching, see Package group definition syntax and matching behavior in the
      # CodeArtifact User Guide .
      def list_associated_packages(
        domain : String,
        package_group : String,
        domain_owner : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        preview : Bool? = nil
      ) : Protocol::Request
        input = Types::ListAssociatedPackagesRequest.new(domain: domain, package_group: package_group, domain_owner: domain_owner, max_results: max_results, next_token: next_token, preview: preview)
        list_associated_packages(input)
      end
      def list_associated_packages(input : Types::ListAssociatedPackagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSOCIATED_PACKAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of DomainSummary objects for all domains owned by the Amazon Web Services account
      # that makes this call. Each returned DomainSummary object contains information about a domain.
      def list_domains(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainsRequest.new(max_results: max_results, next_token: next_token)
        list_domains(input)
      end
      def list_domains(input : Types::ListDomainsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of package groups in the requested domain.
      def list_package_groups(
        domain : String,
        domain_owner : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListPackageGroupsRequest.new(domain: domain, domain_owner: domain_owner, max_results: max_results, next_token: next_token, prefix: prefix)
        list_package_groups(input)
      end
      def list_package_groups(input : Types::ListPackageGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PACKAGE_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of AssetSummary objects for assets in a package version.
      def list_package_version_assets(
        domain : String,
        format : String,
        package : String,
        package_version : String,
        repository : String,
        domain_owner : String? = nil,
        max_results : Int32? = nil,
        namespace : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPackageVersionAssetsRequest.new(domain: domain, format: format, package: package, package_version: package_version, repository: repository, domain_owner: domain_owner, max_results: max_results, namespace: namespace, next_token: next_token)
        list_package_version_assets(input)
      end
      def list_package_version_assets(input : Types::ListPackageVersionAssetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PACKAGE_VERSION_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the direct dependencies for a package version. The dependencies are returned as
      # PackageDependency objects. CodeArtifact extracts the dependencies for a package version from the
      # metadata file for the package format (for example, the package.json file for npm packages and the
      # pom.xml file for Maven). Any package version dependencies that are not listed in the configuration
      # file are not returned.
      def list_package_version_dependencies(
        domain : String,
        format : String,
        package : String,
        package_version : String,
        repository : String,
        domain_owner : String? = nil,
        namespace : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPackageVersionDependenciesRequest.new(domain: domain, format: format, package: package, package_version: package_version, repository: repository, domain_owner: domain_owner, namespace: namespace, next_token: next_token)
        list_package_version_dependencies(input)
      end
      def list_package_version_dependencies(input : Types::ListPackageVersionDependenciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PACKAGE_VERSION_DEPENDENCIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of PackageVersionSummary objects for package versions in a repository that match the
      # request parameters. Package versions of all statuses will be returned by default when calling
      # list-package-versions with no --status parameter.
      def list_package_versions(
        domain : String,
        format : String,
        package : String,
        repository : String,
        domain_owner : String? = nil,
        max_results : Int32? = nil,
        namespace : String? = nil,
        next_token : String? = nil,
        origin_type : String? = nil,
        sort_by : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListPackageVersionsRequest.new(domain: domain, format: format, package: package, repository: repository, domain_owner: domain_owner, max_results: max_results, namespace: namespace, next_token: next_token, origin_type: origin_type, sort_by: sort_by, status: status)
        list_package_versions(input)
      end
      def list_package_versions(input : Types::ListPackageVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PACKAGE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of PackageSummary objects for packages in a repository that match the request
      # parameters.
      def list_packages(
        domain : String,
        repository : String,
        domain_owner : String? = nil,
        format : String? = nil,
        max_results : Int32? = nil,
        namespace : String? = nil,
        next_token : String? = nil,
        package_prefix : String? = nil,
        publish : String? = nil,
        upstream : String? = nil
      ) : Protocol::Request
        input = Types::ListPackagesRequest.new(domain: domain, repository: repository, domain_owner: domain_owner, format: format, max_results: max_results, namespace: namespace, next_token: next_token, package_prefix: package_prefix, publish: publish, upstream: upstream)
        list_packages(input)
      end
      def list_packages(input : Types::ListPackagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PACKAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of RepositorySummary objects. Each RepositorySummary contains information about a
      # repository in the specified Amazon Web Services account and that matches the input parameters.
      def list_repositories(
        max_results : Int32? = nil,
        next_token : String? = nil,
        repository_prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListRepositoriesRequest.new(max_results: max_results, next_token: next_token, repository_prefix: repository_prefix)
        list_repositories(input)
      end
      def list_repositories(input : Types::ListRepositoriesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REPOSITORIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of RepositorySummary objects. Each RepositorySummary contains information about a
      # repository in the specified domain and that matches the input parameters.
      def list_repositories_in_domain(
        domain : String,
        administrator_account : String? = nil,
        domain_owner : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        repository_prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListRepositoriesInDomainRequest.new(domain: domain, administrator_account: administrator_account, domain_owner: domain_owner, max_results: max_results, next_token: next_token, repository_prefix: repository_prefix)
        list_repositories_in_domain(input)
      end
      def list_repositories_in_domain(input : Types::ListRepositoriesInDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REPOSITORIES_IN_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of direct children of the specified package group. For information package group
      # hierarchy, see Package group definition syntax and matching behavior in the CodeArtifact User Guide
      # .
      def list_sub_package_groups(
        domain : String,
        package_group : String,
        domain_owner : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSubPackageGroupsRequest.new(domain: domain, package_group: package_group, domain_owner: domain_owner, max_results: max_results, next_token: next_token)
        list_sub_package_groups(input)
      end
      def list_sub_package_groups(input : Types::ListSubPackageGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUB_PACKAGE_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about Amazon Web Services tags for a specified Amazon Resource Name (ARN) in
      # CodeArtifact.
      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new package version containing one or more assets (or files). The unfinished flag can be
      # used to keep the package version in the Unfinished state until all of its assets have been uploaded
      # (see Package version status in the CodeArtifact user guide ). To set the package version’s status to
      # Published , omit the unfinished flag when uploading the final asset, or set the status using
      # UpdatePackageVersionStatus . Once a package version’s status is set to Published , it cannot change
      # back to Unfinished . Only generic packages can be published using this API. For more information,
      # see Using generic packages in the CodeArtifact User Guide .
      def publish_package_version(
        asset_content : Bytes,
        asset_name : String,
        asset_sha256 : String,
        domain : String,
        format : String,
        package : String,
        package_version : String,
        repository : String,
        domain_owner : String? = nil,
        namespace : String? = nil,
        unfinished : Bool? = nil
      ) : Protocol::Request
        input = Types::PublishPackageVersionRequest.new(asset_content: asset_content, asset_name: asset_name, asset_sha256: asset_sha256, domain: domain, format: format, package: package, package_version: package_version, repository: repository, domain_owner: domain_owner, namespace: namespace, unfinished: unfinished)
        publish_package_version(input)
      end
      def publish_package_version(input : Types::PublishPackageVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUBLISH_PACKAGE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets a resource policy on a domain that specifies permissions to access it. When you call
      # PutDomainPermissionsPolicy , the resource policy on the domain is ignored when evaluting
      # permissions. This ensures that the owner of a domain cannot lock themselves out of the domain, which
      # would prevent them from being able to update the resource policy.
      def put_domain_permissions_policy(
        domain : String,
        policy_document : String,
        domain_owner : String? = nil,
        policy_revision : String? = nil
      ) : Protocol::Request
        input = Types::PutDomainPermissionsPolicyRequest.new(domain: domain, policy_document: policy_document, domain_owner: domain_owner, policy_revision: policy_revision)
        put_domain_permissions_policy(input)
      end
      def put_domain_permissions_policy(input : Types::PutDomainPermissionsPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DOMAIN_PERMISSIONS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the package origin configuration for a package. The package origin configuration determines how
      # new versions of a package can be added to a repository. You can allow or block direct publishing of
      # new package versions, or ingestion and retaining of new package versions from an external connection
      # or upstream source. For more information about package origin controls and configuration, see
      # Editing package origin controls in the CodeArtifact User Guide . PutPackageOriginConfiguration can
      # be called on a package that doesn't yet exist in the repository. When called on a package that does
      # not exist, a package is created in the repository with no versions and the requested restrictions
      # are set on the package. This can be used to preemptively block ingesting or retaining any versions
      # from external connections or upstream repositories, or to block publishing any versions of the
      # package into the repository before connecting any package managers or publishers to the repository.
      def put_package_origin_configuration(
        domain : String,
        format : String,
        package : String,
        repository : String,
        restrictions : Types::PackageOriginRestrictions,
        domain_owner : String? = nil,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::PutPackageOriginConfigurationRequest.new(domain: domain, format: format, package: package, repository: repository, restrictions: restrictions, domain_owner: domain_owner, namespace: namespace)
        put_package_origin_configuration(input)
      end
      def put_package_origin_configuration(input : Types::PutPackageOriginConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_PACKAGE_ORIGIN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the resource policy on a repository that specifies permissions to access it. When you call
      # PutRepositoryPermissionsPolicy , the resource policy on the repository is ignored when evaluting
      # permissions. This ensures that the owner of a repository cannot lock themselves out of the
      # repository, which would prevent them from being able to update the resource policy.
      def put_repository_permissions_policy(
        domain : String,
        policy_document : String,
        repository : String,
        domain_owner : String? = nil,
        policy_revision : String? = nil
      ) : Protocol::Request
        input = Types::PutRepositoryPermissionsPolicyRequest.new(domain: domain, policy_document: policy_document, repository: repository, domain_owner: domain_owner, policy_revision: policy_revision)
        put_repository_permissions_policy(input)
      end
      def put_repository_permissions_policy(input : Types::PutRepositoryPermissionsPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_REPOSITORY_PERMISSIONS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or updates tags for a resource in CodeArtifact.
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from a resource in CodeArtifact.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a package group. This API cannot be used to update a package group's origin configuration or
      # pattern. To update a package group's origin configuration, use UpdatePackageGroupOriginConfiguration
      # .
      def update_package_group(
        domain : String,
        package_group : String,
        contact_info : String? = nil,
        description : String? = nil,
        domain_owner : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePackageGroupRequest.new(domain: domain, package_group: package_group, contact_info: contact_info, description: description, domain_owner: domain_owner)
        update_package_group(input)
      end
      def update_package_group(input : Types::UpdatePackageGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PACKAGE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the package origin configuration for a package group. The package origin configuration
      # determines how new versions of a package can be added to a repository. You can allow or block direct
      # publishing of new package versions, or ingestion and retaining of new package versions from an
      # external connection or upstream source. For more information about package group origin controls and
      # configuration, see Package group origin controls in the CodeArtifact User Guide .
      def update_package_group_origin_configuration(
        domain : String,
        package_group : String,
        add_allowed_repositories : Array(Types::PackageGroupAllowedRepository)? = nil,
        domain_owner : String? = nil,
        remove_allowed_repositories : Array(Types::PackageGroupAllowedRepository)? = nil,
        restrictions : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdatePackageGroupOriginConfigurationRequest.new(domain: domain, package_group: package_group, add_allowed_repositories: add_allowed_repositories, domain_owner: domain_owner, remove_allowed_repositories: remove_allowed_repositories, restrictions: restrictions)
        update_package_group_origin_configuration(input)
      end
      def update_package_group_origin_configuration(input : Types::UpdatePackageGroupOriginConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PACKAGE_GROUP_ORIGIN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the status of one or more versions of a package. Using UpdatePackageVersionsStatus , you can
      # update the status of package versions to Archived , Published , or Unlisted . To set the status of a
      # package version to Disposed , use DisposePackageVersions .
      def update_package_versions_status(
        domain : String,
        format : String,
        package : String,
        repository : String,
        target_status : String,
        versions : Array(String),
        domain_owner : String? = nil,
        expected_status : String? = nil,
        namespace : String? = nil,
        version_revisions : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdatePackageVersionsStatusRequest.new(domain: domain, format: format, package: package, repository: repository, target_status: target_status, versions: versions, domain_owner: domain_owner, expected_status: expected_status, namespace: namespace, version_revisions: version_revisions)
        update_package_versions_status(input)
      end
      def update_package_versions_status(input : Types::UpdatePackageVersionsStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PACKAGE_VERSIONS_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the properties of a repository.
      def update_repository(
        domain : String,
        repository : String,
        description : String? = nil,
        domain_owner : String? = nil,
        upstreams : Array(Types::UpstreamRepository)? = nil
      ) : Protocol::Request
        input = Types::UpdateRepositoryRequest.new(domain: domain, repository: repository, description: description, domain_owner: domain_owner, upstreams: upstreams)
        update_repository(input)
      end
      def update_repository(input : Types::UpdateRepositoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REPOSITORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
