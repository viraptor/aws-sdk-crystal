require "json"
require "time"

module Aws
  module Codeartifact
    module Types

      # The operation did not succeed because of an unauthorized access attempt.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains details about a package version asset.

      struct AssetSummary
        include JSON::Serializable

        # The name of the asset.

        @[JSON::Field(key: "name")]
        getter name : String

        # The hashes of the asset.

        @[JSON::Field(key: "hashes")]
        getter hashes : Hash(String, String)?

        # The size of the asset.

        @[JSON::Field(key: "size")]
        getter size : Int64?

        def initialize(
          @name : String,
          @hashes : Hash(String, String)? = nil,
          @size : Int64? = nil
        )
        end
      end


      struct AssociateExternalConnectionRequest
        include JSON::Serializable

        # The name of the domain that contains the repository.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the external connection to add to the repository. The following values are supported:
        # public:npmjs - for the npm public repository. public:nuget-org - for the NuGet Gallery. public:pypi
        # - for the Python Package Index. public:maven-central - for Maven Central. public:maven-googleandroid
        # - for the Google Android repository. public:maven-gradleplugins - for the Gradle plugins repository.
        # public:maven-commonsware - for the CommonsWare Android repository. public:maven-clojars - for the
        # Clojars repository. public:ruby-gems-org - for RubyGems.org. public:crates-io - for Crates.io.

        @[JSON::Field(key: "external-connection")]
        getter external_connection : String

        # The name of the repository to which the external connection is added.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        def initialize(
          @domain : String,
          @external_connection : String,
          @repository : String,
          @domain_owner : String? = nil
        )
        end
      end


      struct AssociateExternalConnectionResult
        include JSON::Serializable

        # Information about the connected repository after processing the request.

        @[JSON::Field(key: "repository")]
        getter repository : Types::RepositoryDescription?

        def initialize(
          @repository : Types::RepositoryDescription? = nil
        )
        end
      end

      # A package associated with a package group.

      struct AssociatedPackage
        include JSON::Serializable

        # Describes the strength of the association between the package and package group. A strong match can
        # be thought of as an exact match, and a weak match can be thought of as a variation match, for
        # example, the package name matches a variation of the package group pattern. For more information
        # about package group pattern matching, including strong and weak matches, see Package group
        # definition syntax and matching behavior in the CodeArtifact User Guide .

        @[JSON::Field(key: "associationType")]
        getter association_type : String?

        # A format that specifies the type of the associated package.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The namespace of the associated package. The package component that specifies its namespace depends
        # on its type. For example: The namespace of a Maven package version is its groupId . The namespace of
        # an npm or Swift package version is its scope . The namespace of a generic package is its namespace .
        # Python, NuGet, Ruby, and Cargo package versions do not contain a corresponding component, package
        # versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The name of the associated package.

        @[JSON::Field(key: "package")]
        getter package : String?

        def initialize(
          @association_type : String? = nil,
          @format : String? = nil,
          @namespace : String? = nil,
          @package : String? = nil
        )
        end
      end

      # The operation did not succeed because prerequisites are not met.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of Amazon Web Services resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct CopyPackageVersionsRequest
        include JSON::Serializable

        # The name of the repository into which package versions are copied.

        @[JSON::Field(key: "destination-repository")]
        getter destination_repository : String

        # The name of the domain that contains the source and destination repositories.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The format of the package versions to be copied.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the package that contains the versions to be copied.

        @[JSON::Field(key: "package")]
        getter package : String

        # The name of the repository that contains the package versions to be copied.

        @[JSON::Field(key: "source-repository")]
        getter source_repository : String

        # Set to true to overwrite a package version that already exists in the destination repository. If set
        # to false and the package version already exists in the destination repository, the package version
        # is returned in the failedVersions field of the response with an ALREADY_EXISTS error code.

        @[JSON::Field(key: "allowOverwrite")]
        getter allow_overwrite : Bool?

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # Set to true to copy packages from repositories that are upstream from the source repository to the
        # destination repository. The default setting is false. For more information, see Working with
        # upstream repositories .

        @[JSON::Field(key: "includeFromUpstream")]
        getter include_from_upstream : Bool?

        # The namespace of the package versions to be copied. The package component that specifies its
        # namespace depends on its type. For example: The namespace is required when copying package versions
        # of the following formats: Maven Swift generic The namespace of a Maven package version is its
        # groupId . The namespace of an npm or Swift package version is its scope . The namespace of a generic
        # package is its namespace . Python, NuGet, Ruby, and Cargo package versions do not contain a
        # corresponding component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # A list of key-value pairs. The keys are package versions and the values are package version
        # revisions. A CopyPackageVersion operation succeeds if the specified versions in the source
        # repository match the specified package version revision. You must specify versions or
        # versionRevisions . You cannot specify both.

        @[JSON::Field(key: "versionRevisions")]
        getter version_revisions : Hash(String, String)?

        # The versions of the package to be copied. You must specify versions or versionRevisions . You cannot
        # specify both.

        @[JSON::Field(key: "versions")]
        getter versions : Array(String)?

        def initialize(
          @destination_repository : String,
          @domain : String,
          @format : String,
          @package : String,
          @source_repository : String,
          @allow_overwrite : Bool? = nil,
          @domain_owner : String? = nil,
          @include_from_upstream : Bool? = nil,
          @namespace : String? = nil,
          @version_revisions : Hash(String, String)? = nil,
          @versions : Array(String)? = nil
        )
        end
      end


      struct CopyPackageVersionsResult
        include JSON::Serializable

        # A map of package versions that failed to copy and their error codes. The possible error codes are in
        # the PackageVersionError data type. They are: ALREADY_EXISTS MISMATCHED_REVISION MISMATCHED_STATUS
        # NOT_ALLOWED NOT_FOUND SKIPPED

        @[JSON::Field(key: "failedVersions")]
        getter failed_versions : Hash(String, Types::PackageVersionError)?

        # A list of the package versions that were successfully copied to your repository.

        @[JSON::Field(key: "successfulVersions")]
        getter successful_versions : Hash(String, Types::SuccessfulPackageVersionInfo)?

        def initialize(
          @failed_versions : Hash(String, Types::PackageVersionError)? = nil,
          @successful_versions : Hash(String, Types::SuccessfulPackageVersionInfo)? = nil
        )
        end
      end


      struct CreateDomainRequest
        include JSON::Serializable

        # The name of the domain to create. All domain names in an Amazon Web Services Region that are in the
        # same Amazon Web Services account must be unique. The domain name is used as the prefix in DNS
        # hostnames. Do not use sensitive information in a domain name because it is publicly discoverable.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The encryption key for the domain. This is used to encrypt content stored in a domain. An encryption
        # key can be a key ID, a key Amazon Resource Name (ARN), a key alias, or a key alias ARN. To specify
        # an encryptionKey , your IAM role must have kms:DescribeKey and kms:CreateGrant permissions on the
        # encryption key that is used. For more information, see DescribeKey in the Key Management Service API
        # Reference and Key Management Service API Permissions Reference in the Key Management Service
        # Developer Guide . CodeArtifact supports only symmetric CMKs. Do not associate an asymmetric CMK with
        # your domain. For more information, see Using symmetric and asymmetric keys in the Key Management
        # Service Developer Guide .

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # One or more tag key-value pairs for the domain.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @domain : String,
          @encryption_key : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDomainResult
        include JSON::Serializable

        # Contains information about the created domain after processing the request.

        @[JSON::Field(key: "domain")]
        getter domain : Types::DomainDescription?

        def initialize(
          @domain : Types::DomainDescription? = nil
        )
        end
      end


      struct CreatePackageGroupRequest
        include JSON::Serializable

        # The name of the domain in which you want to create a package group.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The pattern of the package group to create. The pattern is also the identifier of the package group.

        @[JSON::Field(key: "packageGroup")]
        getter package_group : String

        # The contact information for the created package group.

        @[JSON::Field(key: "contactInfo")]
        getter contact_info : String?

        # A description of the package group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # One or more tag key-value pairs for the package group.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @domain : String,
          @package_group : String,
          @contact_info : String? = nil,
          @description : String? = nil,
          @domain_owner : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePackageGroupResult
        include JSON::Serializable

        # Information about the created package group after processing the request.

        @[JSON::Field(key: "packageGroup")]
        getter package_group : Types::PackageGroupDescription?

        def initialize(
          @package_group : Types::PackageGroupDescription? = nil
        )
        end
      end


      struct CreateRepositoryRequest
        include JSON::Serializable

        # The name of the domain that contains the created repository.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the repository to create.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # A description of the created repository.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # One or more tag key-value pairs for the repository.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # A list of upstream repositories to associate with the repository. The order of the upstream
        # repositories in the list determines their priority order when CodeArtifact looks for a requested
        # package version. For more information, see Working with upstream repositories .

        @[JSON::Field(key: "upstreams")]
        getter upstreams : Array(Types::UpstreamRepository)?

        def initialize(
          @domain : String,
          @repository : String,
          @description : String? = nil,
          @domain_owner : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @upstreams : Array(Types::UpstreamRepository)? = nil
        )
        end
      end


      struct CreateRepositoryResult
        include JSON::Serializable

        # Information about the created repository after processing the request.

        @[JSON::Field(key: "repository")]
        getter repository : Types::RepositoryDescription?

        def initialize(
          @repository : Types::RepositoryDescription? = nil
        )
        end
      end


      struct DeleteDomainPermissionsPolicyRequest
        include JSON::Serializable

        # The name of the domain associated with the resource policy to be deleted.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The current revision of the resource policy to be deleted. This revision is used for optimistic
        # locking, which prevents others from overwriting your changes to the domain's resource policy.

        @[JSON::Field(key: "policy-revision")]
        getter policy_revision : String?

        def initialize(
          @domain : String,
          @domain_owner : String? = nil,
          @policy_revision : String? = nil
        )
        end
      end


      struct DeleteDomainPermissionsPolicyResult
        include JSON::Serializable

        # Information about the deleted resource policy after processing the request.

        @[JSON::Field(key: "policy")]
        getter policy : Types::ResourcePolicy?

        def initialize(
          @policy : Types::ResourcePolicy? = nil
        )
        end
      end


      struct DeleteDomainRequest
        include JSON::Serializable

        # The name of the domain to delete.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        def initialize(
          @domain : String,
          @domain_owner : String? = nil
        )
        end
      end


      struct DeleteDomainResult
        include JSON::Serializable

        # Contains information about the deleted domain after processing the request.

        @[JSON::Field(key: "domain")]
        getter domain : Types::DomainDescription?

        def initialize(
          @domain : Types::DomainDescription? = nil
        )
        end
      end


      struct DeletePackageGroupRequest
        include JSON::Serializable

        # The domain that contains the package group to be deleted.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The pattern of the package group to be deleted.

        @[JSON::Field(key: "package-group")]
        getter package_group : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        def initialize(
          @domain : String,
          @package_group : String,
          @domain_owner : String? = nil
        )
        end
      end


      struct DeletePackageGroupResult
        include JSON::Serializable

        # Information about the deleted package group after processing the request.

        @[JSON::Field(key: "packageGroup")]
        getter package_group : Types::PackageGroupDescription?

        def initialize(
          @package_group : Types::PackageGroupDescription? = nil
        )
        end
      end


      struct DeletePackageRequest
        include JSON::Serializable

        # The name of the domain that contains the package to delete.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The format of the requested package to delete.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the package to delete.

        @[JSON::Field(key: "package")]
        getter package : String

        # The name of the repository that contains the package to delete.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The namespace of the package to delete. The package component that specifies its namespace depends
        # on its type. For example: The namespace is required when deleting packages of the following formats:
        # Maven Swift generic The namespace of a Maven package version is its groupId . The namespace of an
        # npm or Swift package version is its scope . The namespace of a generic package is its namespace .
        # Python, NuGet, Ruby, and Cargo package versions do not contain a corresponding component, package
        # versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @domain : String,
          @format : String,
          @package : String,
          @repository : String,
          @domain_owner : String? = nil,
          @namespace : String? = nil
        )
        end
      end


      struct DeletePackageResult
        include JSON::Serializable


        @[JSON::Field(key: "deletedPackage")]
        getter deleted_package : Types::PackageSummary?

        def initialize(
          @deleted_package : Types::PackageSummary? = nil
        )
        end
      end


      struct DeletePackageVersionsRequest
        include JSON::Serializable

        # The name of the domain that contains the package to delete.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The format of the package versions to delete.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the package with the versions to delete.

        @[JSON::Field(key: "package")]
        getter package : String

        # The name of the repository that contains the package versions to delete.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # An array of strings that specify the versions of the package to delete.

        @[JSON::Field(key: "versions")]
        getter versions : Array(String)

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The expected status of the package version to delete.

        @[JSON::Field(key: "expectedStatus")]
        getter expected_status : String?

        # The namespace of the package versions to be deleted. The package component that specifies its
        # namespace depends on its type. For example: The namespace is required when deleting package versions
        # of the following formats: Maven Swift generic The namespace of a Maven package version is its
        # groupId . The namespace of an npm or Swift package version is its scope . The namespace of a generic
        # package is its namespace . Python, NuGet, Ruby, and Cargo package versions do not contain a
        # corresponding component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @domain : String,
          @format : String,
          @package : String,
          @repository : String,
          @versions : Array(String),
          @domain_owner : String? = nil,
          @expected_status : String? = nil,
          @namespace : String? = nil
        )
        end
      end


      struct DeletePackageVersionsResult
        include JSON::Serializable

        # A PackageVersionError object that contains a map of errors codes for the deleted package that
        # failed. The possible error codes are: ALREADY_EXISTS MISMATCHED_REVISION MISMATCHED_STATUS
        # NOT_ALLOWED NOT_FOUND SKIPPED

        @[JSON::Field(key: "failedVersions")]
        getter failed_versions : Hash(String, Types::PackageVersionError)?

        # A list of the package versions that were successfully deleted. The status of every successful
        # version will be Deleted .

        @[JSON::Field(key: "successfulVersions")]
        getter successful_versions : Hash(String, Types::SuccessfulPackageVersionInfo)?

        def initialize(
          @failed_versions : Hash(String, Types::PackageVersionError)? = nil,
          @successful_versions : Hash(String, Types::SuccessfulPackageVersionInfo)? = nil
        )
        end
      end


      struct DeleteRepositoryPermissionsPolicyRequest
        include JSON::Serializable

        # The name of the domain that contains the repository associated with the resource policy to be
        # deleted.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the repository that is associated with the resource policy to be deleted

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The revision of the repository's resource policy to be deleted. This revision is used for optimistic
        # locking, which prevents others from accidentally overwriting your changes to the repository's
        # resource policy.

        @[JSON::Field(key: "policy-revision")]
        getter policy_revision : String?

        def initialize(
          @domain : String,
          @repository : String,
          @domain_owner : String? = nil,
          @policy_revision : String? = nil
        )
        end
      end


      struct DeleteRepositoryPermissionsPolicyResult
        include JSON::Serializable

        # Information about the deleted policy after processing the request.

        @[JSON::Field(key: "policy")]
        getter policy : Types::ResourcePolicy?

        def initialize(
          @policy : Types::ResourcePolicy? = nil
        )
        end
      end


      struct DeleteRepositoryRequest
        include JSON::Serializable

        # The name of the domain that contains the repository to delete.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the repository to delete.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        def initialize(
          @domain : String,
          @repository : String,
          @domain_owner : String? = nil
        )
        end
      end


      struct DeleteRepositoryResult
        include JSON::Serializable

        # Information about the deleted repository after processing the request.

        @[JSON::Field(key: "repository")]
        getter repository : Types::RepositoryDescription?

        def initialize(
          @repository : Types::RepositoryDescription? = nil
        )
        end
      end


      struct DescribeDomainRequest
        include JSON::Serializable

        # A string that specifies the name of the requested domain.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        def initialize(
          @domain : String,
          @domain_owner : String? = nil
        )
        end
      end


      struct DescribeDomainResult
        include JSON::Serializable


        @[JSON::Field(key: "domain")]
        getter domain : Types::DomainDescription?

        def initialize(
          @domain : Types::DomainDescription? = nil
        )
        end
      end


      struct DescribePackageGroupRequest
        include JSON::Serializable

        # The name of the domain that contains the package group.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The pattern of the requested package group.

        @[JSON::Field(key: "package-group")]
        getter package_group : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        def initialize(
          @domain : String,
          @package_group : String,
          @domain_owner : String? = nil
        )
        end
      end


      struct DescribePackageGroupResult
        include JSON::Serializable

        # A PackageGroupDescription object that contains information about the requested package group.

        @[JSON::Field(key: "packageGroup")]
        getter package_group : Types::PackageGroupDescription?

        def initialize(
          @package_group : Types::PackageGroupDescription? = nil
        )
        end
      end


      struct DescribePackageRequest
        include JSON::Serializable

        # The name of the domain that contains the repository that contains the package.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # A format that specifies the type of the requested package.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the requested package.

        @[JSON::Field(key: "package")]
        getter package : String

        # The name of the repository that contains the requested package.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The namespace of the requested package. The package component that specifies its namespace depends
        # on its type. For example: The namespace is required when requesting packages of the following
        # formats: Maven Swift generic The namespace of a Maven package version is its groupId . The namespace
        # of an npm or Swift package version is its scope . The namespace of a generic package is its
        # namespace . Python, NuGet, Ruby, and Cargo package versions do not contain a corresponding
        # component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @domain : String,
          @format : String,
          @package : String,
          @repository : String,
          @domain_owner : String? = nil,
          @namespace : String? = nil
        )
        end
      end


      struct DescribePackageResult
        include JSON::Serializable

        # A PackageDescription object that contains information about the requested package.

        @[JSON::Field(key: "package")]
        getter package : Types::PackageDescription

        def initialize(
          @package : Types::PackageDescription
        )
        end
      end


      struct DescribePackageVersionRequest
        include JSON::Serializable

        # The name of the domain that contains the repository that contains the package version.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # A format that specifies the type of the requested package version.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the requested package version.

        @[JSON::Field(key: "package")]
        getter package : String

        # A string that contains the package version (for example, 3.5.2 ).

        @[JSON::Field(key: "version")]
        getter package_version : String

        # The name of the repository that contains the package version.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The namespace of the requested package version. The package component that specifies its namespace
        # depends on its type. For example: The namespace is required when requesting package versions of the
        # following formats: Maven Swift generic The namespace of a Maven package version is its groupId . The
        # namespace of an npm or Swift package version is its scope . The namespace of a generic package is
        # its namespace . Python, NuGet, Ruby, and Cargo package versions do not contain a corresponding
        # component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @domain : String,
          @format : String,
          @package : String,
          @package_version : String,
          @repository : String,
          @domain_owner : String? = nil,
          @namespace : String? = nil
        )
        end
      end


      struct DescribePackageVersionResult
        include JSON::Serializable

        # A PackageVersionDescription object that contains information about the requested package version.

        @[JSON::Field(key: "packageVersion")]
        getter package_version : Types::PackageVersionDescription

        def initialize(
          @package_version : Types::PackageVersionDescription
        )
        end
      end


      struct DescribeRepositoryRequest
        include JSON::Serializable

        # The name of the domain that contains the repository to describe.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # A string that specifies the name of the requested repository.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        def initialize(
          @domain : String,
          @repository : String,
          @domain_owner : String? = nil
        )
        end
      end


      struct DescribeRepositoryResult
        include JSON::Serializable

        # A RepositoryDescription object that contains the requested repository information.

        @[JSON::Field(key: "repository")]
        getter repository : Types::RepositoryDescription?

        def initialize(
          @repository : Types::RepositoryDescription? = nil
        )
        end
      end


      struct DisassociateExternalConnectionRequest
        include JSON::Serializable

        # The name of the domain that contains the repository from which to remove the external repository.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the external connection to be removed from the repository.

        @[JSON::Field(key: "external-connection")]
        getter external_connection : String

        # The name of the repository from which the external connection will be removed.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        def initialize(
          @domain : String,
          @external_connection : String,
          @repository : String,
          @domain_owner : String? = nil
        )
        end
      end


      struct DisassociateExternalConnectionResult
        include JSON::Serializable

        # The repository associated with the removed external connection.

        @[JSON::Field(key: "repository")]
        getter repository : Types::RepositoryDescription?

        def initialize(
          @repository : Types::RepositoryDescription? = nil
        )
        end
      end


      struct DisposePackageVersionsRequest
        include JSON::Serializable

        # The name of the domain that contains the repository you want to dispose.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # A format that specifies the type of package versions you want to dispose.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the package with the versions you want to dispose.

        @[JSON::Field(key: "package")]
        getter package : String

        # The name of the repository that contains the package versions you want to dispose.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The versions of the package you want to dispose.

        @[JSON::Field(key: "versions")]
        getter versions : Array(String)

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The expected status of the package version to dispose.

        @[JSON::Field(key: "expectedStatus")]
        getter expected_status : String?

        # The namespace of the package versions to be disposed. The package component that specifies its
        # namespace depends on its type. For example: The namespace is required when disposing package
        # versions of the following formats: Maven Swift generic The namespace of a Maven package version is
        # its groupId . The namespace of an npm or Swift package version is its scope . The namespace of a
        # generic package is its namespace . Python, NuGet, Ruby, and Cargo package versions do not contain a
        # corresponding component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The revisions of the package versions you want to dispose.

        @[JSON::Field(key: "versionRevisions")]
        getter version_revisions : Hash(String, String)?

        def initialize(
          @domain : String,
          @format : String,
          @package : String,
          @repository : String,
          @versions : Array(String),
          @domain_owner : String? = nil,
          @expected_status : String? = nil,
          @namespace : String? = nil,
          @version_revisions : Hash(String, String)? = nil
        )
        end
      end


      struct DisposePackageVersionsResult
        include JSON::Serializable

        # A PackageVersionError object that contains a map of errors codes for the disposed package versions
        # that failed. The possible error codes are: ALREADY_EXISTS MISMATCHED_REVISION MISMATCHED_STATUS
        # NOT_ALLOWED NOT_FOUND SKIPPED

        @[JSON::Field(key: "failedVersions")]
        getter failed_versions : Hash(String, Types::PackageVersionError)?

        # A list of the package versions that were successfully disposed.

        @[JSON::Field(key: "successfulVersions")]
        getter successful_versions : Hash(String, Types::SuccessfulPackageVersionInfo)?

        def initialize(
          @failed_versions : Hash(String, Types::PackageVersionError)? = nil,
          @successful_versions : Hash(String, Types::SuccessfulPackageVersionInfo)? = nil
        )
        end
      end

      # Information about a domain. A domain is a container for repositories. When you create a domain, it
      # is empty until you add one or more repositories.

      struct DomainDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The total size of all assets in the domain.

        @[JSON::Field(key: "assetSizeBytes")]
        getter asset_size_bytes : Int64?

        # A timestamp that represents the date and time the domain was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time?

        # The ARN of an Key Management Service (KMS) key associated with a domain.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # The name of the domain.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Web Services account ID that owns the domain.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The number of repositories in the domain.

        @[JSON::Field(key: "repositoryCount")]
        getter repository_count : Int32?

        # The Amazon Resource Name (ARN) of the Amazon S3 bucket that is used to store package assets in the
        # domain.

        @[JSON::Field(key: "s3BucketArn")]
        getter s3_bucket_arn : String?

        # The current status of a domain.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @asset_size_bytes : Int64? = nil,
          @created_time : Time? = nil,
          @encryption_key : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @repository_count : Int32? = nil,
          @s3_bucket_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about how a package originally entered the CodeArtifact domain. For packages published
      # directly to CodeArtifact, the entry point is the repository it was published to. For packages
      # ingested from an external repository, the entry point is the external connection that it was
      # ingested from. An external connection is a CodeArtifact repository that is connected to an external
      # repository such as the npm registry or NuGet gallery. If a package version exists in a repository
      # and is updated, for example if a package of the same version is added with additional assets, the
      # package version's DomainEntryPoint will not change from the original package version's value.

      struct DomainEntryPoint
        include JSON::Serializable

        # The name of the external connection that a package was ingested from.

        @[JSON::Field(key: "externalConnectionName")]
        getter external_connection_name : String?

        # The name of the repository that a package was originally published to.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @external_connection_name : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # Information about a domain, including its name, Amazon Resource Name (ARN), and status. The
      # ListDomains operation returns a list of DomainSummary objects.

      struct DomainSummary
        include JSON::Serializable

        # The ARN of the domain.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A timestamp that contains the date and time the domain was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time?

        # The key used to encrypt the domain.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : String?

        # The name of the domain.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # A string that contains the status of the domain.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_time : Time? = nil,
          @encryption_key : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetAssociatedPackageGroupRequest
        include JSON::Serializable

        # The name of the domain that contains the package from which to get the associated package group.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The format of the package from which to get the associated package group.

        @[JSON::Field(key: "format")]
        getter format : String

        # The package from which to get the associated package group.

        @[JSON::Field(key: "package")]
        getter package : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The namespace of the package from which to get the associated package group. The package component
        # that specifies its namespace depends on its type. For example: The namespace is required when
        # getting associated package groups from packages of the following formats: Maven Swift generic The
        # namespace of a Maven package version is its groupId . The namespace of an npm or Swift package
        # version is its scope . The namespace of a generic package is its namespace . Python, NuGet, Ruby,
        # and Cargo package versions do not contain a corresponding component, package versions of those
        # formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @domain : String,
          @format : String,
          @package : String,
          @domain_owner : String? = nil,
          @namespace : String? = nil
        )
        end
      end


      struct GetAssociatedPackageGroupResult
        include JSON::Serializable

        # Describes the strength of the association between the package and package group. A strong match is
        # also known as an exact match, and a weak match is known as a relative match.

        @[JSON::Field(key: "associationType")]
        getter association_type : String?

        # The package group that is associated with the requested package.

        @[JSON::Field(key: "packageGroup")]
        getter package_group : Types::PackageGroupDescription?

        def initialize(
          @association_type : String? = nil,
          @package_group : Types::PackageGroupDescription? = nil
        )
        end
      end


      struct GetAuthorizationTokenRequest
        include JSON::Serializable

        # The name of the domain that is in scope for the generated authorization token.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The time, in seconds, that the generated authorization token is valid. Valid values are 0 and any
        # number between 900 (15 minutes) and 43200 (12 hours). A value of 0 will set the expiration of the
        # authorization token to the same expiration of the user's role's temporary credentials.

        @[JSON::Field(key: "duration")]
        getter duration_seconds : Int64?

        def initialize(
          @domain : String,
          @domain_owner : String? = nil,
          @duration_seconds : Int64? = nil
        )
        end
      end


      struct GetAuthorizationTokenResult
        include JSON::Serializable

        # The returned authentication token.

        @[JSON::Field(key: "authorizationToken")]
        getter authorization_token : String?

        # A timestamp that specifies the date and time the authorization token expires.

        @[JSON::Field(key: "expiration")]
        getter expiration : Time?

        def initialize(
          @authorization_token : String? = nil,
          @expiration : Time? = nil
        )
        end
      end


      struct GetDomainPermissionsPolicyRequest
        include JSON::Serializable

        # The name of the domain to which the resource policy is attached.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        def initialize(
          @domain : String,
          @domain_owner : String? = nil
        )
        end
      end


      struct GetDomainPermissionsPolicyResult
        include JSON::Serializable

        # The returned resource policy.

        @[JSON::Field(key: "policy")]
        getter policy : Types::ResourcePolicy?

        def initialize(
          @policy : Types::ResourcePolicy? = nil
        )
        end
      end


      struct GetPackageVersionAssetRequest
        include JSON::Serializable

        # The name of the requested asset.

        @[JSON::Field(key: "asset")]
        getter asset : String

        # The name of the domain that contains the repository that contains the package version with the
        # requested asset.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # A format that specifies the type of the package version with the requested asset file.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the package that contains the requested asset.

        @[JSON::Field(key: "package")]
        getter package : String

        # A string that contains the package version (for example, 3.5.2 ).

        @[JSON::Field(key: "version")]
        getter package_version : String

        # The repository that contains the package version with the requested asset.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The namespace of the package version with the requested asset file. The package component that
        # specifies its namespace depends on its type. For example: The namespace is required when requesting
        # assets from package versions of the following formats: Maven Swift generic The namespace of a Maven
        # package version is its groupId . The namespace of an npm or Swift package version is its scope . The
        # namespace of a generic package is its namespace . Python, NuGet, Ruby, and Cargo package versions do
        # not contain a corresponding component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The name of the package version revision that contains the requested asset.

        @[JSON::Field(key: "revision")]
        getter package_version_revision : String?

        def initialize(
          @asset : String,
          @domain : String,
          @format : String,
          @package : String,
          @package_version : String,
          @repository : String,
          @domain_owner : String? = nil,
          @namespace : String? = nil,
          @package_version_revision : String? = nil
        )
        end
      end


      struct GetPackageVersionAssetResult
        include JSON::Serializable

        # The binary file, or asset, that is downloaded.

        @[JSON::Field(key: "asset")]
        getter asset : Bytes?

        # The name of the asset that is downloaded.

        @[JSON::Field(key: "X-AssetName")]
        getter asset_name : String?

        # A string that contains the package version (for example, 3.5.2 ).

        @[JSON::Field(key: "X-PackageVersion")]
        getter package_version : String?

        # The name of the package version revision that contains the downloaded asset.

        @[JSON::Field(key: "X-PackageVersionRevision")]
        getter package_version_revision : String?

        def initialize(
          @asset : Bytes? = nil,
          @asset_name : String? = nil,
          @package_version : String? = nil,
          @package_version_revision : String? = nil
        )
        end
      end


      struct GetPackageVersionReadmeRequest
        include JSON::Serializable

        # The name of the domain that contains the repository that contains the package version with the
        # requested readme file.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # A format that specifies the type of the package version with the requested readme file.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the package version that contains the requested readme file.

        @[JSON::Field(key: "package")]
        getter package : String

        # A string that contains the package version (for example, 3.5.2 ).

        @[JSON::Field(key: "version")]
        getter package_version : String

        # The repository that contains the package with the requested readme file.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The namespace of the package version with the requested readme file. The package component that
        # specifies its namespace depends on its type. For example: The namespace is required when requesting
        # the readme from package versions of the following formats: Maven Swift generic The namespace of a
        # Maven package version is its groupId . The namespace of an npm or Swift package version is its scope
        # . The namespace of a generic package is its namespace . Python, NuGet, Ruby, and Cargo package
        # versions do not contain a corresponding component, package versions of those formats do not have a
        # namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @domain : String,
          @format : String,
          @package : String,
          @package_version : String,
          @repository : String,
          @domain_owner : String? = nil,
          @namespace : String? = nil
        )
        end
      end


      struct GetPackageVersionReadmeResult
        include JSON::Serializable

        # The format of the package with the requested readme file.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The namespace of the package version with the requested readme file. The package component that
        # specifies its namespace depends on its type. For example: The namespace of a Maven package version
        # is its groupId . The namespace of an npm or Swift package version is its scope . The namespace of a
        # generic package is its namespace . Python, NuGet, Ruby, and Cargo package versions do not contain a
        # corresponding component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The name of the package that contains the returned readme file.

        @[JSON::Field(key: "package")]
        getter package : String?

        # The text of the returned readme file.

        @[JSON::Field(key: "readme")]
        getter readme : String?

        # The version of the package with the requested readme file.

        @[JSON::Field(key: "version")]
        getter version : String?

        # The current revision associated with the package version.

        @[JSON::Field(key: "versionRevision")]
        getter version_revision : String?

        def initialize(
          @format : String? = nil,
          @namespace : String? = nil,
          @package : String? = nil,
          @readme : String? = nil,
          @version : String? = nil,
          @version_revision : String? = nil
        )
        end
      end


      struct GetRepositoryEndpointRequest
        include JSON::Serializable

        # The name of the domain that contains the repository.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # Returns which endpoint of a repository to return. A repository has one endpoint for each package
        # format.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the repository.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain that contains
        # the repository. It does not include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # A string that specifies the type of endpoint.

        @[JSON::Field(key: "endpointType")]
        getter endpoint_type : String?

        def initialize(
          @domain : String,
          @format : String,
          @repository : String,
          @domain_owner : String? = nil,
          @endpoint_type : String? = nil
        )
        end
      end


      struct GetRepositoryEndpointResult
        include JSON::Serializable

        # A string that specifies the URL of the returned endpoint.

        @[JSON::Field(key: "repositoryEndpoint")]
        getter repository_endpoint : String?

        def initialize(
          @repository_endpoint : String? = nil
        )
        end
      end


      struct GetRepositoryPermissionsPolicyRequest
        include JSON::Serializable

        # The name of the domain containing the repository whose associated resource policy is to be
        # retrieved.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the repository whose associated resource policy is to be retrieved.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        def initialize(
          @domain : String,
          @repository : String,
          @domain_owner : String? = nil
        )
        end
      end


      struct GetRepositoryPermissionsPolicyResult
        include JSON::Serializable

        # The returned resource policy.

        @[JSON::Field(key: "policy")]
        getter policy : Types::ResourcePolicy?

        def initialize(
          @policy : Types::ResourcePolicy? = nil
        )
        end
      end

      # The operation did not succeed because of an error that occurred inside CodeArtifact.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Details of the license data.

      struct LicenseInfo
        include JSON::Serializable

        # Name of the license.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The URL for license data.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @name : String? = nil,
          @url : String? = nil
        )
        end
      end


      struct ListAllowedRepositoriesForGroupRequest
        include JSON::Serializable

        # The name of the domain that contains the package group from which to list allowed repositories.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The origin configuration restriction type of which to list allowed repositories.

        @[JSON::Field(key: "originRestrictionType")]
        getter origin_restriction_type : String

        # The pattern of the package group from which to list allowed repositories.

        @[JSON::Field(key: "package-group")]
        getter package_group : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain : String,
          @origin_restriction_type : String,
          @package_group : String,
          @domain_owner : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAllowedRepositoriesForGroupResult
        include JSON::Serializable

        # The list of allowed repositories for the package group and origin configuration restriction type.

        @[JSON::Field(key: "allowedRepositories")]
        getter allowed_repositories : Array(String)?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @allowed_repositories : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedPackagesRequest
        include JSON::Serializable

        # The name of the domain that contains the package group from which to list associated packages.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The pattern of the package group from which to list associated packages.

        @[JSON::Field(key: "package-group")]
        getter package_group : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # When this flag is included, ListAssociatedPackages will return a list of packages that would be
        # associated with a package group, even if it does not exist.

        @[JSON::Field(key: "preview")]
        getter preview : Bool?

        def initialize(
          @domain : String,
          @package_group : String,
          @domain_owner : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @preview : Bool? = nil
        )
        end
      end


      struct ListAssociatedPackagesResult
        include JSON::Serializable

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of packages associated with the requested package group.

        @[JSON::Field(key: "packages")]
        getter packages : Array(Types::AssociatedPackage)?

        def initialize(
          @next_token : String? = nil,
          @packages : Array(Types::AssociatedPackage)? = nil
        )
        end
      end


      struct ListDomainsRequest
        include JSON::Serializable

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainsResult
        include JSON::Serializable

        # The returned list of DomainSummary objects.

        @[JSON::Field(key: "domains")]
        getter domains : Array(Types::DomainSummary)?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domains : Array(Types::DomainSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPackageGroupsRequest
        include JSON::Serializable

        # The domain for which you want to list package groups.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # A prefix for which to search package groups. When included, ListPackageGroups will return only
        # package groups with patterns that match the prefix.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @domain : String,
          @domain_owner : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @prefix : String? = nil
        )
        end
      end


      struct ListPackageGroupsResult
        include JSON::Serializable

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of package groups in the requested domain.

        @[JSON::Field(key: "packageGroups")]
        getter package_groups : Array(Types::PackageGroupSummary)?

        def initialize(
          @next_token : String? = nil,
          @package_groups : Array(Types::PackageGroupSummary)? = nil
        )
        end
      end


      struct ListPackageVersionAssetsRequest
        include JSON::Serializable

        # The name of the domain that contains the repository associated with the package version assets.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The format of the package that contains the requested package version assets.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the package that contains the requested package version assets.

        @[JSON::Field(key: "package")]
        getter package : String

        # A string that contains the package version (for example, 3.5.2 ).

        @[JSON::Field(key: "version")]
        getter package_version : String

        # The name of the repository that contains the package that contains the requested package version
        # assets.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The namespace of the package version that contains the requested package version assets. The package
        # component that specifies its namespace depends on its type. For example: The namespace is required
        # requesting assets from package versions of the following formats: Maven Swift generic The namespace
        # of a Maven package version is its groupId . The namespace of an npm or Swift package version is its
        # scope . The namespace of a generic package is its namespace . Python, NuGet, Ruby, and Cargo package
        # versions do not contain a corresponding component, package versions of those formats do not have a
        # namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain : String,
          @format : String,
          @package : String,
          @package_version : String,
          @repository : String,
          @domain_owner : String? = nil,
          @max_results : Int32? = nil,
          @namespace : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPackageVersionAssetsResult
        include JSON::Serializable

        # The returned list of AssetSummary objects.

        @[JSON::Field(key: "assets")]
        getter assets : Array(Types::AssetSummary)?

        # The format of the package that contains the requested package version assets.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The namespace of the package version that contains the requested package version assets. The package
        # component that specifies its namespace depends on its type. For example: The namespace of a Maven
        # package version is its groupId . The namespace of an npm or Swift package version is its scope . The
        # namespace of a generic package is its namespace . Python, NuGet, Ruby, and Cargo package versions do
        # not contain a corresponding component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the package that contains the requested package version assets.

        @[JSON::Field(key: "package")]
        getter package : String?

        # The version of the package associated with the requested assets.

        @[JSON::Field(key: "version")]
        getter version : String?

        # The current revision associated with the package version.

        @[JSON::Field(key: "versionRevision")]
        getter version_revision : String?

        def initialize(
          @assets : Array(Types::AssetSummary)? = nil,
          @format : String? = nil,
          @namespace : String? = nil,
          @next_token : String? = nil,
          @package : String? = nil,
          @version : String? = nil,
          @version_revision : String? = nil
        )
        end
      end


      struct ListPackageVersionDependenciesRequest
        include JSON::Serializable

        # The name of the domain that contains the repository that contains the requested package version
        # dependencies.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The format of the package with the requested dependencies.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the package versions' package.

        @[JSON::Field(key: "package")]
        getter package : String

        # A string that contains the package version (for example, 3.5.2 ).

        @[JSON::Field(key: "version")]
        getter package_version : String

        # The name of the repository that contains the requested package version.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The namespace of the package version with the requested dependencies. The package component that
        # specifies its namespace depends on its type. For example: The namespace is required when listing
        # dependencies from package versions of the following formats: Maven The namespace of a Maven package
        # version is its groupId . The namespace of an npm package version is its scope . Python and NuGet
        # package versions do not contain a corresponding component, package versions of those formats do not
        # have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain : String,
          @format : String,
          @package : String,
          @package_version : String,
          @repository : String,
          @domain_owner : String? = nil,
          @namespace : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPackageVersionDependenciesResult
        include JSON::Serializable

        # The returned list of PackageDependency objects.

        @[JSON::Field(key: "dependencies")]
        getter dependencies : Array(Types::PackageDependency)?

        # A format that specifies the type of the package that contains the returned dependencies.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The namespace of the package version that contains the returned dependencies. The package component
        # that specifies its namespace depends on its type. For example: The namespace is required when
        # listing dependencies from package versions of the following formats: Maven The namespace of a Maven
        # package version is its groupId . The namespace of an npm package version is its scope . Python and
        # NuGet package versions do not contain a corresponding component, package versions of those formats
        # do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the package that contains the returned package versions dependencies.

        @[JSON::Field(key: "package")]
        getter package : String?

        # The version of the package that is specified in the request.

        @[JSON::Field(key: "version")]
        getter version : String?

        # The current revision associated with the package version.

        @[JSON::Field(key: "versionRevision")]
        getter version_revision : String?

        def initialize(
          @dependencies : Array(Types::PackageDependency)? = nil,
          @format : String? = nil,
          @namespace : String? = nil,
          @next_token : String? = nil,
          @package : String? = nil,
          @version : String? = nil,
          @version_revision : String? = nil
        )
        end
      end


      struct ListPackageVersionsRequest
        include JSON::Serializable

        # The name of the domain that contains the repository that contains the requested package versions.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The format of the package versions you want to list.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the package for which you want to request package versions.

        @[JSON::Field(key: "package")]
        getter package : String

        # The name of the repository that contains the requested package versions.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The namespace of the package that contains the requested package versions. The package component
        # that specifies its namespace depends on its type. For example: The namespace is required when
        # deleting package versions of the following formats: Maven Swift generic The namespace of a Maven
        # package version is its groupId . The namespace of an npm or Swift package version is its scope . The
        # namespace of a generic package is its namespace . Python, NuGet, Ruby, and Cargo package versions do
        # not contain a corresponding component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # The originType used to filter package versions. Only package versions with the provided originType
        # will be returned.

        @[JSON::Field(key: "originType")]
        getter origin_type : String?

        # How to sort the requested list of package versions.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # A string that filters the requested package versions by status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain : String,
          @format : String,
          @package : String,
          @repository : String,
          @domain_owner : String? = nil,
          @max_results : Int32? = nil,
          @namespace : String? = nil,
          @next_token : String? = nil,
          @origin_type : String? = nil,
          @sort_by : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListPackageVersionsResult
        include JSON::Serializable

        # The default package version to display. This depends on the package format: For Maven and PyPI
        # packages, it's the most recently published package version. For npm packages, it's the version
        # referenced by the latest tag. If the latest tag is not set, it's the most recently published package
        # version.

        @[JSON::Field(key: "defaultDisplayVersion")]
        getter default_display_version : String?

        # A format of the package.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The namespace of the package that contains the requested package versions. The package component
        # that specifies its namespace depends on its type. For example: The namespace of a Maven package
        # version is its groupId . The namespace of an npm or Swift package version is its scope . The
        # namespace of a generic package is its namespace . Python, NuGet, Ruby, and Cargo package versions do
        # not contain a corresponding component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the package.

        @[JSON::Field(key: "package")]
        getter package : String?

        # The returned list of PackageVersionSummary objects.

        @[JSON::Field(key: "versions")]
        getter versions : Array(Types::PackageVersionSummary)?

        def initialize(
          @default_display_version : String? = nil,
          @format : String? = nil,
          @namespace : String? = nil,
          @next_token : String? = nil,
          @package : String? = nil,
          @versions : Array(Types::PackageVersionSummary)? = nil
        )
        end
      end


      struct ListPackagesRequest
        include JSON::Serializable

        # The name of the domain that contains the repository that contains the requested packages.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the repository that contains the requested packages.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The format used to filter requested packages. Only packages from the provided format will be
        # returned.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The namespace prefix used to filter requested packages. Only packages with a namespace that starts
        # with the provided string value are returned. Note that although this option is called --namespace
        # and not --namespace-prefix , it has prefix-matching behavior. Each package format uses namespace as
        # follows: The namespace of a Maven package version is its groupId . The namespace of an npm or Swift
        # package version is its scope . The namespace of a generic package is its namespace . Python, NuGet,
        # Ruby, and Cargo package versions do not contain a corresponding component, package versions of those
        # formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # A prefix used to filter requested packages. Only packages with names that start with packagePrefix
        # are returned.

        @[JSON::Field(key: "package-prefix")]
        getter package_prefix : String?

        # The value of the Publish package origin control restriction used to filter requested packages. Only
        # packages with the provided restriction are returned. For more information, see
        # PackageOriginRestrictions .

        @[JSON::Field(key: "publish")]
        getter publish : String?

        # The value of the Upstream package origin control restriction used to filter requested packages. Only
        # packages with the provided restriction are returned. For more information, see
        # PackageOriginRestrictions .

        @[JSON::Field(key: "upstream")]
        getter upstream : String?

        def initialize(
          @domain : String,
          @repository : String,
          @domain_owner : String? = nil,
          @format : String? = nil,
          @max_results : Int32? = nil,
          @namespace : String? = nil,
          @next_token : String? = nil,
          @package_prefix : String? = nil,
          @publish : String? = nil,
          @upstream : String? = nil
        )
        end
      end


      struct ListPackagesResult
        include JSON::Serializable

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of returned PackageSummary objects.

        @[JSON::Field(key: "packages")]
        getter packages : Array(Types::PackageSummary)?

        def initialize(
          @next_token : String? = nil,
          @packages : Array(Types::PackageSummary)? = nil
        )
        end
      end


      struct ListRepositoriesInDomainRequest
        include JSON::Serializable

        # The name of the domain that contains the returned list of repositories.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # Filter the list of repositories to only include those that are managed by the Amazon Web Services
        # account ID.

        @[JSON::Field(key: "administrator-account")]
        getter administrator_account : String?

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # A prefix used to filter returned repositories. Only repositories with names that start with
        # repositoryPrefix are returned.

        @[JSON::Field(key: "repository-prefix")]
        getter repository_prefix : String?

        def initialize(
          @domain : String,
          @administrator_account : String? = nil,
          @domain_owner : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @repository_prefix : String? = nil
        )
        end
      end


      struct ListRepositoriesInDomainResult
        include JSON::Serializable

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The returned list of repositories.

        @[JSON::Field(key: "repositories")]
        getter repositories : Array(Types::RepositorySummary)?

        def initialize(
          @next_token : String? = nil,
          @repositories : Array(Types::RepositorySummary)? = nil
        )
        end
      end


      struct ListRepositoriesRequest
        include JSON::Serializable

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # A prefix used to filter returned repositories. Only repositories with names that start with
        # repositoryPrefix are returned.

        @[JSON::Field(key: "repository-prefix")]
        getter repository_prefix : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @repository_prefix : String? = nil
        )
        end
      end


      struct ListRepositoriesResult
        include JSON::Serializable

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The returned list of RepositorySummary objects.

        @[JSON::Field(key: "repositories")]
        getter repositories : Array(Types::RepositorySummary)?

        def initialize(
          @next_token : String? = nil,
          @repositories : Array(Types::RepositorySummary)? = nil
        )
        end
      end


      struct ListSubPackageGroupsRequest
        include JSON::Serializable

        # The name of the domain which contains the package group from which to list sub package groups.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The pattern of the package group from which to list sub package groups.

        @[JSON::Field(key: "package-group")]
        getter package_group : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @domain : String,
          @package_group : String,
          @domain_owner : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSubPackageGroupsResult
        include JSON::Serializable

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of sub package groups for the requested package group.

        @[JSON::Field(key: "packageGroups")]
        getter package_groups : Array(Types::PackageGroupSummary)?

        def initialize(
          @next_token : String? = nil,
          @package_groups : Array(Types::PackageGroupSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to get tags for.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResult
        include JSON::Serializable

        # A list of tag key and value pairs associated with the specified resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Details about a package dependency.

      struct PackageDependency
        include JSON::Serializable

        # The type of a package dependency. The possible values depend on the package type. npm: regular , dev
        # , peer , optional maven: optional , parent , compile , runtime , test , system , provided . Note
        # that parent is not a regular Maven dependency type; instead this is extracted from the
        # &lt;parent&gt; element if one is defined in the package version's POM file. nuget: The
        # dependencyType field is never set for NuGet packages. pypi: Requires-Dist

        @[JSON::Field(key: "dependencyType")]
        getter dependency_type : String?

        # The namespace of the package that this package depends on. The package component that specifies its
        # namespace depends on its type. For example: The namespace of a Maven package version is its groupId
        # . The namespace of an npm or Swift package version is its scope . The namespace of a generic package
        # is its namespace . Python, NuGet, Ruby, and Cargo package versions do not contain a corresponding
        # component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The name of the package that this package depends on.

        @[JSON::Field(key: "package")]
        getter package : String?

        # The required version, or version range, of the package that this package depends on. The version
        # format is specific to the package type. For example, the following are possible valid required
        # versions: 1.2.3 , ^2.3.4 , or 4.x .

        @[JSON::Field(key: "versionRequirement")]
        getter version_requirement : String?

        def initialize(
          @dependency_type : String? = nil,
          @namespace : String? = nil,
          @package : String? = nil,
          @version_requirement : String? = nil
        )
        end
      end

      # Details about a package.

      struct PackageDescription
        include JSON::Serializable

        # A format that specifies the type of the package.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The name of the package.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The namespace of the package. The package component that specifies its namespace depends on its
        # type. For example: The namespace of a Maven package version is its groupId . The namespace of an npm
        # or Swift package version is its scope . The namespace of a generic package is its namespace .
        # Python, NuGet, Ruby, and Cargo package versions do not contain a corresponding component, package
        # versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The package origin configuration for the package.

        @[JSON::Field(key: "originConfiguration")]
        getter origin_configuration : Types::PackageOriginConfiguration?

        def initialize(
          @format : String? = nil,
          @name : String? = nil,
          @namespace : String? = nil,
          @origin_configuration : Types::PackageOriginConfiguration? = nil
        )
        end
      end

      # Details about an allowed repository for a package group, including its name and origin
      # configuration.

      struct PackageGroupAllowedRepository
        include JSON::Serializable

        # The origin configuration restriction type of the allowed repository.

        @[JSON::Field(key: "originRestrictionType")]
        getter origin_restriction_type : String?

        # The name of the allowed repository.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @origin_restriction_type : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # The description of the package group.

      struct PackageGroupDescription
        include JSON::Serializable

        # The ARN of the package group.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The contact information of the package group.

        @[JSON::Field(key: "contactInfo")]
        getter contact_info : String?

        # A timestamp that represents the date and time the package group was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time?

        # The description of the package group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the domain that contains the package group.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domainOwner")]
        getter domain_owner : String?

        # The package group origin configuration that determines how package versions can enter repositories.

        @[JSON::Field(key: "originConfiguration")]
        getter origin_configuration : Types::PackageGroupOriginConfiguration?

        # The direct parent package group of the package group.

        @[JSON::Field(key: "parent")]
        getter parent : Types::PackageGroupReference?

        # The pattern of the package group. The pattern determines which packages are associated with the
        # package group.

        @[JSON::Field(key: "pattern")]
        getter pattern : String?

        def initialize(
          @arn : String? = nil,
          @contact_info : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @domain_name : String? = nil,
          @domain_owner : String? = nil,
          @origin_configuration : Types::PackageGroupOriginConfiguration? = nil,
          @parent : Types::PackageGroupReference? = nil,
          @pattern : String? = nil
        )
        end
      end

      # The package group origin configuration that determines how package versions can enter repositories.

      struct PackageGroupOriginConfiguration
        include JSON::Serializable

        # The origin configuration settings that determine how package versions can enter repositories.

        @[JSON::Field(key: "restrictions")]
        getter restrictions : Hash(String, Types::PackageGroupOriginRestriction)?

        def initialize(
          @restrictions : Hash(String, Types::PackageGroupOriginRestriction)? = nil
        )
        end
      end

      # Contains information about the configured restrictions of the origin controls of a package group.

      struct PackageGroupOriginRestriction
        include JSON::Serializable

        # The effective package group origin restriction setting. If the value of mode is ALLOW ,
        # ALLOW_SPECIFIC_REPOSITORIES , or BLOCK , then the value of effectiveMode is the same. Otherwise,
        # when the value of mode is INHERIT , then the value of effectiveMode is the value of mode of the
        # first parent group which does not have a value of INHERIT .

        @[JSON::Field(key: "effectiveMode")]
        getter effective_mode : String?

        # The parent package group that the package group origin restrictions are inherited from.

        @[JSON::Field(key: "inheritedFrom")]
        getter inherited_from : Types::PackageGroupReference?

        # The package group origin restriction setting. If the value of mode is ALLOW ,
        # ALLOW_SPECIFIC_REPOSITORIES , or BLOCK , then the value of effectiveMode is the same. Otherwise,
        # when the value is INHERIT , then the value of effectiveMode is the value of mode of the first parent
        # group which does not have a value of INHERIT .

        @[JSON::Field(key: "mode")]
        getter mode : String?

        # The number of repositories in the allowed repository list.

        @[JSON::Field(key: "repositoriesCount")]
        getter repositories_count : Int64?

        def initialize(
          @effective_mode : String? = nil,
          @inherited_from : Types::PackageGroupReference? = nil,
          @mode : String? = nil,
          @repositories_count : Int64? = nil
        )
        end
      end

      # Information about the identifiers of a package group.

      struct PackageGroupReference
        include JSON::Serializable

        # The ARN of the package group.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The pattern of the package group. The pattern determines which packages are associated with the
        # package group, and is also the identifier of the package group.

        @[JSON::Field(key: "pattern")]
        getter pattern : String?

        def initialize(
          @arn : String? = nil,
          @pattern : String? = nil
        )
        end
      end

      # Details about a package group.

      struct PackageGroupSummary
        include JSON::Serializable

        # The ARN of the package group.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The contact information of the package group.

        @[JSON::Field(key: "contactInfo")]
        getter contact_info : String?

        # A timestamp that represents the date and time the repository was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time?

        # The description of the package group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The domain that contains the package group.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domainOwner")]
        getter domain_owner : String?

        # Details about the package origin configuration of a package group.

        @[JSON::Field(key: "originConfiguration")]
        getter origin_configuration : Types::PackageGroupOriginConfiguration?

        # The direct parent package group of the package group.

        @[JSON::Field(key: "parent")]
        getter parent : Types::PackageGroupReference?

        # The pattern of the package group. The pattern determines which packages are associated with the
        # package group.

        @[JSON::Field(key: "pattern")]
        getter pattern : String?

        def initialize(
          @arn : String? = nil,
          @contact_info : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @domain_name : String? = nil,
          @domain_owner : String? = nil,
          @origin_configuration : Types::PackageGroupOriginConfiguration? = nil,
          @parent : Types::PackageGroupReference? = nil,
          @pattern : String? = nil
        )
        end
      end

      # Details about the package origin configuration of a package.

      struct PackageOriginConfiguration
        include JSON::Serializable

        # A PackageOriginRestrictions object that contains information about the upstream and publish package
        # origin configuration for the package.

        @[JSON::Field(key: "restrictions")]
        getter restrictions : Types::PackageOriginRestrictions?

        def initialize(
          @restrictions : Types::PackageOriginRestrictions? = nil
        )
        end
      end

      # Details about the origin restrictions set on the package. The package origin restrictions determine
      # how new versions of a package can be added to a specific repository.

      struct PackageOriginRestrictions
        include JSON::Serializable

        # The package origin configuration that determines if new versions of the package can be published
        # directly to the repository.

        @[JSON::Field(key: "publish")]
        getter publish : String

        # The package origin configuration that determines if new versions of the package can be added to the
        # repository from an external connection or upstream source.

        @[JSON::Field(key: "upstream")]
        getter upstream : String

        def initialize(
          @publish : String,
          @upstream : String
        )
        end
      end

      # Details about a package, including its format, namespace, and name.

      struct PackageSummary
        include JSON::Serializable

        # The format of the package.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The namespace of the package. The package component that specifies its namespace depends on its
        # type. For example: The namespace of a Maven package version is its groupId . The namespace of an npm
        # or Swift package version is its scope . The namespace of a generic package is its namespace .
        # Python, NuGet, Ruby, and Cargo package versions do not contain a corresponding component, package
        # versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # A PackageOriginConfiguration object that contains a PackageOriginRestrictions object that contains
        # information about the upstream and publish package origin restrictions.

        @[JSON::Field(key: "originConfiguration")]
        getter origin_configuration : Types::PackageOriginConfiguration?

        # The name of the package.

        @[JSON::Field(key: "package")]
        getter package : String?

        def initialize(
          @format : String? = nil,
          @namespace : String? = nil,
          @origin_configuration : Types::PackageOriginConfiguration? = nil,
          @package : String? = nil
        )
        end
      end

      # Details about a package version.

      struct PackageVersionDescription
        include JSON::Serializable

        # The name of the package that is displayed. The displayName varies depending on the package version's
        # format. For example, if an npm package is named ui , is in the namespace vue , and has the format
        # npm , then the displayName is @vue/ui .

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The format of the package version.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The homepage associated with the package.

        @[JSON::Field(key: "homePage")]
        getter home_page : String?

        # Information about licenses associated with the package version.

        @[JSON::Field(key: "licenses")]
        getter licenses : Array(Types::LicenseInfo)?

        # The namespace of the package version. The package component that specifies its namespace depends on
        # its type. For example: The namespace of a Maven package version is its groupId . The namespace of an
        # npm or Swift package version is its scope . The namespace of a generic package is its namespace .
        # Python, NuGet, Ruby, and Cargo package versions do not contain a corresponding component, package
        # versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # A PackageVersionOrigin object that contains information about how the package version was added to
        # the repository.

        @[JSON::Field(key: "origin")]
        getter origin : Types::PackageVersionOrigin?

        # The name of the requested package.

        @[JSON::Field(key: "packageName")]
        getter package_name : String?

        # A timestamp that contains the date and time the package version was published.

        @[JSON::Field(key: "publishedTime")]
        getter published_time : Time?

        # The revision of the package version.

        @[JSON::Field(key: "revision")]
        getter revision : String?

        # The repository for the source code in the package version, or the source code used to build it.

        @[JSON::Field(key: "sourceCodeRepository")]
        getter source_code_repository : String?

        # A string that contains the status of the package version.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A summary of the package version. The summary is extracted from the package. The information in and
        # detail level of the summary depends on the package version's format.

        @[JSON::Field(key: "summary")]
        getter summary : String?

        # The version of the package.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @display_name : String? = nil,
          @format : String? = nil,
          @home_page : String? = nil,
          @licenses : Array(Types::LicenseInfo)? = nil,
          @namespace : String? = nil,
          @origin : Types::PackageVersionOrigin? = nil,
          @package_name : String? = nil,
          @published_time : Time? = nil,
          @revision : String? = nil,
          @source_code_repository : String? = nil,
          @status : String? = nil,
          @summary : String? = nil,
          @version : String? = nil
        )
        end
      end

      # l An error associated with package.

      struct PackageVersionError
        include JSON::Serializable

        # The error code associated with the error. Valid error codes are: ALREADY_EXISTS MISMATCHED_REVISION
        # MISMATCHED_STATUS NOT_ALLOWED NOT_FOUND SKIPPED

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The error message associated with the error.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Information about how a package version was added to a repository.

      struct PackageVersionOrigin
        include JSON::Serializable

        # A DomainEntryPoint object that contains information about from which repository or external
        # connection the package version was added to the domain.

        @[JSON::Field(key: "domainEntryPoint")]
        getter domain_entry_point : Types::DomainEntryPoint?

        # Describes how the package version was originally added to the domain. An INTERNAL origin type means
        # the package version was published directly to a repository in the domain. An EXTERNAL origin type
        # means the package version was ingested from an external connection.

        @[JSON::Field(key: "originType")]
        getter origin_type : String?

        def initialize(
          @domain_entry_point : Types::DomainEntryPoint? = nil,
          @origin_type : String? = nil
        )
        end
      end

      # Details about a package version, including its status, version, and revision. The
      # ListPackageVersions operation returns a list of PackageVersionSummary objects.

      struct PackageVersionSummary
        include JSON::Serializable

        # A string that contains the status of the package version. It can be one of the following:

        @[JSON::Field(key: "status")]
        getter status : String

        # Information about a package version.

        @[JSON::Field(key: "version")]
        getter version : String

        # A PackageVersionOrigin object that contains information about how the package version was added to
        # the repository.

        @[JSON::Field(key: "origin")]
        getter origin : Types::PackageVersionOrigin?

        # The revision associated with a package version.

        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @status : String,
          @version : String,
          @origin : Types::PackageVersionOrigin? = nil,
          @revision : String? = nil
        )
        end
      end


      struct PublishPackageVersionRequest
        include JSON::Serializable

        # The content of the asset to publish.

        @[JSON::Field(key: "assetContent")]
        getter asset_content : Bytes

        # The name of the asset to publish. Asset names can include Unicode letters and numbers, and the
        # following special characters: ~ ! @ ^ &amp; ( ) - ` _ + [ ] { } ; , . `

        @[JSON::Field(key: "asset")]
        getter asset_name : String

        # The SHA256 hash of the assetContent to publish. This value must be calculated by the caller and
        # provided with the request (see Publishing a generic package in the CodeArtifact User Guide ). This
        # value is used as an integrity check to verify that the assetContent has not changed after it was
        # originally sent.

        @[JSON::Field(key: "x-amz-content-sha256")]
        getter asset_sha256 : String

        # The name of the domain that contains the repository that contains the package version to publish.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # A format that specifies the type of the package version with the requested asset file. The only
        # supported value is generic .

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the package version to publish.

        @[JSON::Field(key: "package")]
        getter package : String

        # The package version to publish (for example, 3.5.2 ).

        @[JSON::Field(key: "version")]
        getter package_version : String

        # The name of the repository that the package version will be published to.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the AWS account that owns the domain. It does not include dashes or
        # spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The namespace of the package version to publish.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # Specifies whether the package version should remain in the unfinished state. If omitted, the package
        # version status will be set to Published (see Package version status in the CodeArtifact User Guide
        # ). Valid values: unfinished

        @[JSON::Field(key: "unfinished")]
        getter unfinished : Bool?

        def initialize(
          @asset_content : Bytes,
          @asset_name : String,
          @asset_sha256 : String,
          @domain : String,
          @format : String,
          @package : String,
          @package_version : String,
          @repository : String,
          @domain_owner : String? = nil,
          @namespace : String? = nil,
          @unfinished : Bool? = nil
        )
        end
      end


      struct PublishPackageVersionResult
        include JSON::Serializable

        # An AssetSummary for the published asset.

        @[JSON::Field(key: "asset")]
        getter asset : Types::AssetSummary?

        # The format of the package version.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The namespace of the package version.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The name of the package.

        @[JSON::Field(key: "package")]
        getter package : String?

        # A string that contains the status of the package version. For more information, see Package version
        # status in the CodeArtifact User Guide .

        @[JSON::Field(key: "status")]
        getter status : String?

        # The version of the package.

        @[JSON::Field(key: "version")]
        getter version : String?

        # The revision of the package version.

        @[JSON::Field(key: "versionRevision")]
        getter version_revision : String?

        def initialize(
          @asset : Types::AssetSummary? = nil,
          @format : String? = nil,
          @namespace : String? = nil,
          @package : String? = nil,
          @status : String? = nil,
          @version : String? = nil,
          @version_revision : String? = nil
        )
        end
      end


      struct PutDomainPermissionsPolicyRequest
        include JSON::Serializable

        # The name of the domain on which to set the resource policy.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # A valid displayable JSON Aspen policy string to be set as the access control resource policy on the
        # provided domain.

        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domainOwner")]
        getter domain_owner : String?

        # The current revision of the resource policy to be set. This revision is used for optimistic locking,
        # which prevents others from overwriting your changes to the domain's resource policy.

        @[JSON::Field(key: "policyRevision")]
        getter policy_revision : String?

        def initialize(
          @domain : String,
          @policy_document : String,
          @domain_owner : String? = nil,
          @policy_revision : String? = nil
        )
        end
      end


      struct PutDomainPermissionsPolicyResult
        include JSON::Serializable

        # The resource policy that was set after processing the request.

        @[JSON::Field(key: "policy")]
        getter policy : Types::ResourcePolicy?

        def initialize(
          @policy : Types::ResourcePolicy? = nil
        )
        end
      end


      struct PutPackageOriginConfigurationRequest
        include JSON::Serializable

        # The name of the domain that contains the repository that contains the package.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # A format that specifies the type of the package to be updated.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the package to be updated.

        @[JSON::Field(key: "package")]
        getter package : String

        # The name of the repository that contains the package.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # A PackageOriginRestrictions object that contains information about the upstream and publish package
        # origin restrictions. The upstream restriction determines if new package versions can be ingested or
        # retained from external connections or upstream repositories. The publish restriction determines if
        # new package versions can be published directly to the repository. You must include both the desired
        # upstream and publish restrictions.

        @[JSON::Field(key: "restrictions")]
        getter restrictions : Types::PackageOriginRestrictions

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The namespace of the package to be updated. The package component that specifies its namespace
        # depends on its type. For example: The namespace of a Maven package version is its groupId . The
        # namespace of an npm or Swift package version is its scope . The namespace of a generic package is
        # its namespace . Python, NuGet, Ruby, and Cargo package versions do not contain a corresponding
        # component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @domain : String,
          @format : String,
          @package : String,
          @repository : String,
          @restrictions : Types::PackageOriginRestrictions,
          @domain_owner : String? = nil,
          @namespace : String? = nil
        )
        end
      end


      struct PutPackageOriginConfigurationResult
        include JSON::Serializable

        # A PackageOriginConfiguration object that describes the origin configuration set for the package. It
        # contains a PackageOriginRestrictions object that describes how new versions of the package can be
        # introduced to the repository.

        @[JSON::Field(key: "originConfiguration")]
        getter origin_configuration : Types::PackageOriginConfiguration?

        def initialize(
          @origin_configuration : Types::PackageOriginConfiguration? = nil
        )
        end
      end


      struct PutRepositoryPermissionsPolicyRequest
        include JSON::Serializable

        # The name of the domain containing the repository to set the resource policy on.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # A valid displayable JSON Aspen policy string to be set as the access control resource policy on the
        # provided repository.

        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String

        # The name of the repository to set the resource policy on.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # Sets the revision of the resource policy that specifies permissions to access the repository. This
        # revision is used for optimistic locking, which prevents others from overwriting your changes to the
        # repository's resource policy.

        @[JSON::Field(key: "policyRevision")]
        getter policy_revision : String?

        def initialize(
          @domain : String,
          @policy_document : String,
          @repository : String,
          @domain_owner : String? = nil,
          @policy_revision : String? = nil
        )
        end
      end


      struct PutRepositoryPermissionsPolicyResult
        include JSON::Serializable

        # The resource policy that was set after processing the request.

        @[JSON::Field(key: "policy")]
        getter policy : Types::ResourcePolicy?

        def initialize(
          @policy : Types::ResourcePolicy? = nil
        )
        end
      end

      # The details of a repository stored in CodeArtifact. A CodeArtifact repository contains a set of
      # package versions, each of which maps to a set of assets. Repositories are polyglot—a single
      # repository can contain packages of any supported type. Each repository exposes endpoints for
      # fetching and publishing packages using tools like the npm CLI, the Maven CLI ( mvn ), and pip . You
      # can create up to 100 repositories per Amazon Web Services account.

      struct RepositoryDescription
        include JSON::Serializable

        # The 12-digit account number of the Amazon Web Services account that manages the repository.

        @[JSON::Field(key: "administratorAccount")]
        getter administrator_account : String?

        # The Amazon Resource Name (ARN) of the repository.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A timestamp that represents the date and time the repository was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time?

        # A text description of the repository.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the domain that contains the repository.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The 12-digit account number of the Amazon Web Services account that owns the domain that contains
        # the repository. It does not include dashes or spaces.

        @[JSON::Field(key: "domainOwner")]
        getter domain_owner : String?

        # An array of external connections associated with the repository.

        @[JSON::Field(key: "externalConnections")]
        getter external_connections : Array(Types::RepositoryExternalConnectionInfo)?

        # The name of the repository.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A list of upstream repositories to associate with the repository. The order of the upstream
        # repositories in the list determines their priority order when CodeArtifact looks for a requested
        # package version. For more information, see Working with upstream repositories .

        @[JSON::Field(key: "upstreams")]
        getter upstreams : Array(Types::UpstreamRepositoryInfo)?

        def initialize(
          @administrator_account : String? = nil,
          @arn : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @domain_name : String? = nil,
          @domain_owner : String? = nil,
          @external_connections : Array(Types::RepositoryExternalConnectionInfo)? = nil,
          @name : String? = nil,
          @upstreams : Array(Types::UpstreamRepositoryInfo)? = nil
        )
        end
      end

      # Contains information about the external connection of a repository.

      struct RepositoryExternalConnectionInfo
        include JSON::Serializable

        # The name of the external connection associated with a repository.

        @[JSON::Field(key: "externalConnectionName")]
        getter external_connection_name : String?

        # The package format associated with a repository's external connection. The valid package formats
        # are: npm : A Node Package Manager (npm) package. pypi : A Python Package Index (PyPI) package. maven
        # : A Maven package that contains compiled code in a distributable format, such as a JAR file. nuget :
        # A NuGet package. generic : A generic package. ruby : A Ruby package. swift : A Swift package. cargo
        # : A Cargo package.

        @[JSON::Field(key: "packageFormat")]
        getter package_format : String?

        # The status of the external connection of a repository. There is one valid value, Available .

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @external_connection_name : String? = nil,
          @package_format : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Details about a repository, including its Amazon Resource Name (ARN), description, and domain
      # information. The ListRepositories operation returns a list of RepositorySummary objects.

      struct RepositorySummary
        include JSON::Serializable

        # The Amazon Web Services account ID that manages the repository.

        @[JSON::Field(key: "administratorAccount")]
        getter administrator_account : String?

        # The ARN of the repository.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A timestamp that represents the date and time the repository was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time?

        # The description of the repository.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the domain that contains the repository.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domainOwner")]
        getter domain_owner : String?

        # The name of the repository.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @administrator_account : String? = nil,
          @arn : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @domain_name : String? = nil,
          @domain_owner : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The operation did not succeed because the resource requested is not found in the service.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of Amazon Web Services resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # An CodeArtifact resource policy that contains a resource ARN, document details, and a revision.

      struct ResourcePolicy
        include JSON::Serializable

        # The resource policy formatted in JSON.

        @[JSON::Field(key: "document")]
        getter document : String?

        # The ARN of the resource associated with the resource policy

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The current revision of the resource policy.

        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @document : String? = nil,
          @resource_arn : String? = nil,
          @revision : String? = nil
        )
        end
      end

      # The operation did not succeed because it would have exceeded a service limit for your account.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of Amazon Web Services resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Contains the revision and status of a package version.

      struct SuccessfulPackageVersionInfo
        include JSON::Serializable

        # The revision of a package version.

        @[JSON::Field(key: "revision")]
        getter revision : String?

        # The status of a package version.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @revision : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A tag is a key-value pair that can be used to manage, search for, or filter resources in
      # CodeArtifact.

      struct Tag
        include JSON::Serializable

        # The tag key.

        @[JSON::Field(key: "key")]
        getter key : String

        # The tag value.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to add or update tags for.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags you want to modify or add to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResult
        include JSON::Serializable

        def initialize
        end
      end

      # The operation did not succeed because too many requests are sent to the service.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The time period, in seconds, to wait before retrying the request.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to remove tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag key for each tag that you want to remove from the resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdatePackageGroupOriginConfigurationRequest
        include JSON::Serializable

        # The name of the domain which contains the package group for which to update the origin
        # configuration.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The pattern of the package group for which to update the origin configuration.

        @[JSON::Field(key: "package-group")]
        getter package_group : String

        # The repository name and restrictions to add to the allowed repository list of the specified package
        # group.

        @[JSON::Field(key: "addAllowedRepositories")]
        getter add_allowed_repositories : Array(Types::PackageGroupAllowedRepository)?

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The repository name and restrictions to remove from the allowed repository list of the specified
        # package group.

        @[JSON::Field(key: "removeAllowedRepositories")]
        getter remove_allowed_repositories : Array(Types::PackageGroupAllowedRepository)?

        # The origin configuration settings that determine how package versions can enter repositories.

        @[JSON::Field(key: "restrictions")]
        getter restrictions : Hash(String, String)?

        def initialize(
          @domain : String,
          @package_group : String,
          @add_allowed_repositories : Array(Types::PackageGroupAllowedRepository)? = nil,
          @domain_owner : String? = nil,
          @remove_allowed_repositories : Array(Types::PackageGroupAllowedRepository)? = nil,
          @restrictions : Hash(String, String)? = nil
        )
        end
      end


      struct UpdatePackageGroupOriginConfigurationResult
        include JSON::Serializable

        # Information about the updated allowed repositories after processing the request.

        @[JSON::Field(key: "allowedRepositoryUpdates")]
        getter allowed_repository_updates : Hash(String, Hash(String, Array(String)))?

        # The package group and information about it after processing the request.

        @[JSON::Field(key: "packageGroup")]
        getter package_group : Types::PackageGroupDescription?

        def initialize(
          @allowed_repository_updates : Hash(String, Hash(String, Array(String)))? = nil,
          @package_group : Types::PackageGroupDescription? = nil
        )
        end
      end


      struct UpdatePackageGroupRequest
        include JSON::Serializable

        # The name of the domain which contains the package group to be updated.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The pattern of the package group to be updated.

        @[JSON::Field(key: "packageGroup")]
        getter package_group : String

        # Contact information which you want to update the requested package group with.

        @[JSON::Field(key: "contactInfo")]
        getter contact_info : String?

        # The description you want to update the requested package group with.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        def initialize(
          @domain : String,
          @package_group : String,
          @contact_info : String? = nil,
          @description : String? = nil,
          @domain_owner : String? = nil
        )
        end
      end


      struct UpdatePackageGroupResult
        include JSON::Serializable

        # The package group and information about it after the request has been processed.

        @[JSON::Field(key: "packageGroup")]
        getter package_group : Types::PackageGroupDescription?

        def initialize(
          @package_group : Types::PackageGroupDescription? = nil
        )
        end
      end


      struct UpdatePackageVersionsStatusRequest
        include JSON::Serializable

        # The name of the domain that contains the repository that contains the package versions with a status
        # to be updated.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # A format that specifies the type of the package with the statuses to update.

        @[JSON::Field(key: "format")]
        getter format : String

        # The name of the package with the version statuses to update.

        @[JSON::Field(key: "package")]
        getter package : String

        # The repository that contains the package versions with the status you want to update.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The status you want to change the package version status to.

        @[JSON::Field(key: "targetStatus")]
        getter target_status : String

        # An array of strings that specify the versions of the package with the statuses to update.

        @[JSON::Field(key: "versions")]
        getter versions : Array(String)

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # The package version’s expected status before it is updated. If expectedStatus is provided, the
        # package version's status is updated only if its status at the time UpdatePackageVersionsStatus is
        # called matches expectedStatus .

        @[JSON::Field(key: "expectedStatus")]
        getter expected_status : String?

        # The namespace of the package version to be updated. The package component that specifies its
        # namespace depends on its type. For example: The namespace of a Maven package version is its groupId
        # . The namespace of an npm or Swift package version is its scope . The namespace of a generic package
        # is its namespace . Python, NuGet, Ruby, and Cargo package versions do not contain a corresponding
        # component, package versions of those formats do not have a namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # A map of package versions and package version revisions. The map key is the package version (for
        # example, 3.5.2 ), and the map value is the package version revision.

        @[JSON::Field(key: "versionRevisions")]
        getter version_revisions : Hash(String, String)?

        def initialize(
          @domain : String,
          @format : String,
          @package : String,
          @repository : String,
          @target_status : String,
          @versions : Array(String),
          @domain_owner : String? = nil,
          @expected_status : String? = nil,
          @namespace : String? = nil,
          @version_revisions : Hash(String, String)? = nil
        )
        end
      end


      struct UpdatePackageVersionsStatusResult
        include JSON::Serializable

        # A list of SuccessfulPackageVersionInfo objects, one for each package version with a status that
        # successfully updated.

        @[JSON::Field(key: "failedVersions")]
        getter failed_versions : Hash(String, Types::PackageVersionError)?

        # A list of PackageVersionError objects, one for each package version with a status that failed to
        # update.

        @[JSON::Field(key: "successfulVersions")]
        getter successful_versions : Hash(String, Types::SuccessfulPackageVersionInfo)?

        def initialize(
          @failed_versions : Hash(String, Types::PackageVersionError)? = nil,
          @successful_versions : Hash(String, Types::SuccessfulPackageVersionInfo)? = nil
        )
        end
      end


      struct UpdateRepositoryRequest
        include JSON::Serializable

        # The name of the domain associated with the repository to update.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the repository to update.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # An updated repository description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The 12-digit account number of the Amazon Web Services account that owns the domain. It does not
        # include dashes or spaces.

        @[JSON::Field(key: "domain-owner")]
        getter domain_owner : String?

        # A list of upstream repositories to associate with the repository. The order of the upstream
        # repositories in the list determines their priority order when CodeArtifact looks for a requested
        # package version. For more information, see Working with upstream repositories .

        @[JSON::Field(key: "upstreams")]
        getter upstreams : Array(Types::UpstreamRepository)?

        def initialize(
          @domain : String,
          @repository : String,
          @description : String? = nil,
          @domain_owner : String? = nil,
          @upstreams : Array(Types::UpstreamRepository)? = nil
        )
        end
      end


      struct UpdateRepositoryResult
        include JSON::Serializable

        # The updated repository.

        @[JSON::Field(key: "repository")]
        getter repository : Types::RepositoryDescription?

        def initialize(
          @repository : Types::RepositoryDescription? = nil
        )
        end
      end

      # Information about an upstream repository. A list of UpstreamRepository objects is an input parameter
      # to CreateRepository and UpdateRepository .

      struct UpstreamRepository
        include JSON::Serializable

        # The name of an upstream repository.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @repository_name : String
        )
        end
      end

      # Information about an upstream repository.

      struct UpstreamRepositoryInfo
        include JSON::Serializable

        # The name of an upstream repository.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @repository_name : String? = nil
        )
        end
      end

      # The operation did not succeed because a parameter in the request was sent with an invalid value.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @reason : String? = nil
        )
        end
      end
    end
  end
end
