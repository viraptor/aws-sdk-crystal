module AwsSdk
  module AppStream
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Associates the specified app block builder with the specified app block.

      def associate_app_block_builder_app_block(
        app_block_arn : String,
        app_block_builder_name : String
      ) : Types::AssociateAppBlockBuilderAppBlockResult

        input = Types::AssociateAppBlockBuilderAppBlockRequest.new(app_block_arn: app_block_arn, app_block_builder_name: app_block_builder_name)
        associate_app_block_builder_app_block(input)
      end

      def associate_app_block_builder_app_block(input : Types::AssociateAppBlockBuilderAppBlockRequest) : Types::AssociateAppBlockBuilderAppBlockResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_APP_BLOCK_BUILDER_APP_BLOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateAppBlockBuilderAppBlockResult, "AssociateAppBlockBuilderAppBlock")
      end

      # Associates the specified application with the specified fleet. This is only supported for Elastic
      # fleets.

      def associate_application_fleet(
        application_arn : String,
        fleet_name : String
      ) : Types::AssociateApplicationFleetResult

        input = Types::AssociateApplicationFleetRequest.new(application_arn: application_arn, fleet_name: fleet_name)
        associate_application_fleet(input)
      end

      def associate_application_fleet(input : Types::AssociateApplicationFleetRequest) : Types::AssociateApplicationFleetResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_APPLICATION_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateApplicationFleetResult, "AssociateApplicationFleet")
      end

      # Associates an application to entitle.

      def associate_application_to_entitlement(
        application_identifier : String,
        entitlement_name : String,
        stack_name : String
      ) : Types::AssociateApplicationToEntitlementResult

        input = Types::AssociateApplicationToEntitlementRequest.new(application_identifier: application_identifier, entitlement_name: entitlement_name, stack_name: stack_name)
        associate_application_to_entitlement(input)
      end

      def associate_application_to_entitlement(input : Types::AssociateApplicationToEntitlementRequest) : Types::AssociateApplicationToEntitlementResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_APPLICATION_TO_ENTITLEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateApplicationToEntitlementResult, "AssociateApplicationToEntitlement")
      end

      # Associates the specified fleet with the specified stack.

      def associate_fleet(
        fleet_name : String,
        stack_name : String
      ) : Types::AssociateFleetResult

        input = Types::AssociateFleetRequest.new(fleet_name: fleet_name, stack_name: stack_name)
        associate_fleet(input)
      end

      def associate_fleet(input : Types::AssociateFleetRequest) : Types::AssociateFleetResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateFleetResult, "AssociateFleet")
      end

      # Associates license included application(s) with an existing image builder instance.

      def associate_software_to_image_builder(
        image_builder_name : String,
        software_names : Array(String)
      ) : Types::AssociateSoftwareToImageBuilderResult

        input = Types::AssociateSoftwareToImageBuilderRequest.new(image_builder_name: image_builder_name, software_names: software_names)
        associate_software_to_image_builder(input)
      end

      def associate_software_to_image_builder(input : Types::AssociateSoftwareToImageBuilderRequest) : Types::AssociateSoftwareToImageBuilderResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_SOFTWARE_TO_IMAGE_BUILDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateSoftwareToImageBuilderResult, "AssociateSoftwareToImageBuilder")
      end

      # Associates the specified users with the specified stacks. Users in a user pool cannot be assigned to
      # stacks with fleets that are joined to an Active Directory domain.

      def batch_associate_user_stack(
        user_stack_associations : Array(Types::UserStackAssociation)
      ) : Types::BatchAssociateUserStackResult

        input = Types::BatchAssociateUserStackRequest.new(user_stack_associations: user_stack_associations)
        batch_associate_user_stack(input)
      end

      def batch_associate_user_stack(input : Types::BatchAssociateUserStackRequest) : Types::BatchAssociateUserStackResult
        request = Protocol::JsonRpc.build_request(Model::BATCH_ASSOCIATE_USER_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchAssociateUserStackResult, "BatchAssociateUserStack")
      end

      # Disassociates the specified users from the specified stacks.

      def batch_disassociate_user_stack(
        user_stack_associations : Array(Types::UserStackAssociation)
      ) : Types::BatchDisassociateUserStackResult

        input = Types::BatchDisassociateUserStackRequest.new(user_stack_associations: user_stack_associations)
        batch_disassociate_user_stack(input)
      end

      def batch_disassociate_user_stack(input : Types::BatchDisassociateUserStackRequest) : Types::BatchDisassociateUserStackResult
        request = Protocol::JsonRpc.build_request(Model::BATCH_DISASSOCIATE_USER_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDisassociateUserStackResult, "BatchDisassociateUserStack")
      end

      # Copies the image within the same region or to a new region within the same AWS account. Note that
      # any tags you added to the image will not be copied.

      def copy_image(
        destination_image_name : String,
        destination_region : String,
        source_image_name : String,
        destination_image_description : String? = nil
      ) : Types::CopyImageResponse

        input = Types::CopyImageRequest.new(destination_image_name: destination_image_name, destination_region: destination_region, source_image_name: source_image_name, destination_image_description: destination_image_description)
        copy_image(input)
      end

      def copy_image(input : Types::CopyImageRequest) : Types::CopyImageResponse
        request = Protocol::JsonRpc.build_request(Model::COPY_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CopyImageResponse, "CopyImage")
      end

      # Creates an app block. App blocks are a WorkSpaces Applications resource that stores the details
      # about the virtual hard disk in an S3 bucket. It also stores the setup script with details about how
      # to mount the virtual hard disk. The virtual hard disk includes the application binaries and other
      # files necessary to launch your applications. Multiple applications can be assigned to a single app
      # block. This is only supported for Elastic fleets.

      def create_app_block(
        name : String,
        source_s3_location : Types::S3Location,
        description : String? = nil,
        display_name : String? = nil,
        packaging_type : String? = nil,
        post_setup_script_details : Types::ScriptDetails? = nil,
        setup_script_details : Types::ScriptDetails? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateAppBlockResult

        input = Types::CreateAppBlockRequest.new(name: name, source_s3_location: source_s3_location, description: description, display_name: display_name, packaging_type: packaging_type, post_setup_script_details: post_setup_script_details, setup_script_details: setup_script_details, tags: tags)
        create_app_block(input)
      end

      def create_app_block(input : Types::CreateAppBlockRequest) : Types::CreateAppBlockResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_APP_BLOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAppBlockResult, "CreateAppBlock")
      end

      # Creates an app block builder.

      def create_app_block_builder(
        instance_type : String,
        name : String,
        platform : String,
        vpc_config : Types::VpcConfig,
        access_endpoints : Array(Types::AccessEndpoint)? = nil,
        description : String? = nil,
        display_name : String? = nil,
        enable_default_internet_access : Bool? = nil,
        iam_role_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateAppBlockBuilderResult

        input = Types::CreateAppBlockBuilderRequest.new(instance_type: instance_type, name: name, platform: platform, vpc_config: vpc_config, access_endpoints: access_endpoints, description: description, display_name: display_name, enable_default_internet_access: enable_default_internet_access, iam_role_arn: iam_role_arn, tags: tags)
        create_app_block_builder(input)
      end

      def create_app_block_builder(input : Types::CreateAppBlockBuilderRequest) : Types::CreateAppBlockBuilderResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_APP_BLOCK_BUILDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAppBlockBuilderResult, "CreateAppBlockBuilder")
      end

      # Creates a URL to start a create app block builder streaming session.

      def create_app_block_builder_streaming_url(
        app_block_builder_name : String,
        validity : Int64? = nil
      ) : Types::CreateAppBlockBuilderStreamingURLResult

        input = Types::CreateAppBlockBuilderStreamingURLRequest.new(app_block_builder_name: app_block_builder_name, validity: validity)
        create_app_block_builder_streaming_url(input)
      end

      def create_app_block_builder_streaming_url(input : Types::CreateAppBlockBuilderStreamingURLRequest) : Types::CreateAppBlockBuilderStreamingURLResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_APP_BLOCK_BUILDER_STREAMING_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAppBlockBuilderStreamingURLResult, "CreateAppBlockBuilderStreamingURL")
      end

      # Creates an application. Applications are a WorkSpaces Applications resource that stores the details
      # about how to launch applications on Elastic fleet streaming instances. An application consists of
      # the launch details, icon, and display name. Applications are associated with an app block that
      # contains the application binaries and other files. The applications assigned to an Elastic fleet are
      # the applications users can launch. This is only supported for Elastic fleets.

      def create_application(
        app_block_arn : String,
        icon_s3_location : Types::S3Location,
        instance_families : Array(String),
        launch_path : String,
        name : String,
        platforms : Array(String),
        description : String? = nil,
        display_name : String? = nil,
        launch_parameters : String? = nil,
        tags : Hash(String, String)? = nil,
        working_directory : String? = nil
      ) : Types::CreateApplicationResult

        input = Types::CreateApplicationRequest.new(app_block_arn: app_block_arn, icon_s3_location: icon_s3_location, instance_families: instance_families, launch_path: launch_path, name: name, platforms: platforms, description: description, display_name: display_name, launch_parameters: launch_parameters, tags: tags, working_directory: working_directory)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationRequest) : Types::CreateApplicationResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateApplicationResult, "CreateApplication")
      end

      # Creates a Directory Config object in WorkSpaces Applications. This object includes the configuration
      # information required to join fleets and image builders to Microsoft Active Directory domains.

      def create_directory_config(
        directory_name : String,
        organizational_unit_distinguished_names : Array(String),
        certificate_based_auth_properties : Types::CertificateBasedAuthProperties? = nil,
        service_account_credentials : Types::ServiceAccountCredentials? = nil
      ) : Types::CreateDirectoryConfigResult

        input = Types::CreateDirectoryConfigRequest.new(directory_name: directory_name, organizational_unit_distinguished_names: organizational_unit_distinguished_names, certificate_based_auth_properties: certificate_based_auth_properties, service_account_credentials: service_account_credentials)
        create_directory_config(input)
      end

      def create_directory_config(input : Types::CreateDirectoryConfigRequest) : Types::CreateDirectoryConfigResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DIRECTORY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDirectoryConfigResult, "CreateDirectoryConfig")
      end

      # Creates a new entitlement. Entitlements control access to specific applications within a stack,
      # based on user attributes. Entitlements apply to SAML 2.0 federated user identities. WorkSpaces
      # Applications user pool and streaming URL users are entitled to all applications in a stack.
      # Entitlements don't apply to the desktop stream view application, or to applications managed by a
      # dynamic app provider using the Dynamic Application Framework.

      def create_entitlement(
        app_visibility : String,
        attributes : Array(Types::EntitlementAttribute),
        name : String,
        stack_name : String,
        description : String? = nil
      ) : Types::CreateEntitlementResult

        input = Types::CreateEntitlementRequest.new(app_visibility: app_visibility, attributes: attributes, name: name, stack_name: stack_name, description: description)
        create_entitlement(input)
      end

      def create_entitlement(input : Types::CreateEntitlementRequest) : Types::CreateEntitlementResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENTITLEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEntitlementResult, "CreateEntitlement")
      end

      # Creates a task to export a WorkSpaces Applications image to an EC2 AMI. This allows you to use your
      # customized WorkSpaces Applications images with other AWS services or for backup purposes.

      def create_export_image_task(
        ami_name : String,
        iam_role_arn : String,
        image_name : String,
        ami_description : String? = nil,
        tag_specifications : Hash(String, String)? = nil
      ) : Types::CreateExportImageTaskResult

        input = Types::CreateExportImageTaskRequest.new(ami_name: ami_name, iam_role_arn: iam_role_arn, image_name: image_name, ami_description: ami_description, tag_specifications: tag_specifications)
        create_export_image_task(input)
      end

      def create_export_image_task(input : Types::CreateExportImageTaskRequest) : Types::CreateExportImageTaskResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_EXPORT_IMAGE_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateExportImageTaskResult, "CreateExportImageTask")
      end

      # Creates a fleet. A fleet consists of streaming instances that your users access for their
      # applications and desktops.

      def create_fleet(
        instance_type : String,
        name : String,
        compute_capacity : Types::ComputeCapacity? = nil,
        description : String? = nil,
        disconnect_timeout_in_seconds : Int32? = nil,
        display_name : String? = nil,
        domain_join_info : Types::DomainJoinInfo? = nil,
        enable_default_internet_access : Bool? = nil,
        fleet_type : String? = nil,
        iam_role_arn : String? = nil,
        idle_disconnect_timeout_in_seconds : Int32? = nil,
        image_arn : String? = nil,
        image_name : String? = nil,
        max_concurrent_sessions : Int32? = nil,
        max_sessions_per_instance : Int32? = nil,
        max_user_duration_in_seconds : Int32? = nil,
        platform : String? = nil,
        root_volume_config : Types::VolumeConfig? = nil,
        session_script_s3_location : Types::S3Location? = nil,
        stream_view : String? = nil,
        tags : Hash(String, String)? = nil,
        usb_device_filter_strings : Array(String)? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::CreateFleetResult

        input = Types::CreateFleetRequest.new(instance_type: instance_type, name: name, compute_capacity: compute_capacity, description: description, disconnect_timeout_in_seconds: disconnect_timeout_in_seconds, display_name: display_name, domain_join_info: domain_join_info, enable_default_internet_access: enable_default_internet_access, fleet_type: fleet_type, iam_role_arn: iam_role_arn, idle_disconnect_timeout_in_seconds: idle_disconnect_timeout_in_seconds, image_arn: image_arn, image_name: image_name, max_concurrent_sessions: max_concurrent_sessions, max_sessions_per_instance: max_sessions_per_instance, max_user_duration_in_seconds: max_user_duration_in_seconds, platform: platform, root_volume_config: root_volume_config, session_script_s3_location: session_script_s3_location, stream_view: stream_view, tags: tags, usb_device_filter_strings: usb_device_filter_strings, vpc_config: vpc_config)
        create_fleet(input)
      end

      def create_fleet(input : Types::CreateFleetRequest) : Types::CreateFleetResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFleetResult, "CreateFleet")
      end

      # Creates an image builder. An image builder is a virtual machine that is used to create an image. The
      # initial state of the builder is PENDING . When it is ready, the state is RUNNING .

      def create_image_builder(
        instance_type : String,
        name : String,
        access_endpoints : Array(Types::AccessEndpoint)? = nil,
        appstream_agent_version : String? = nil,
        description : String? = nil,
        display_name : String? = nil,
        domain_join_info : Types::DomainJoinInfo? = nil,
        enable_default_internet_access : Bool? = nil,
        iam_role_arn : String? = nil,
        image_arn : String? = nil,
        image_name : String? = nil,
        root_volume_config : Types::VolumeConfig? = nil,
        softwares_to_install : Array(String)? = nil,
        softwares_to_uninstall : Array(String)? = nil,
        tags : Hash(String, String)? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::CreateImageBuilderResult

        input = Types::CreateImageBuilderRequest.new(instance_type: instance_type, name: name, access_endpoints: access_endpoints, appstream_agent_version: appstream_agent_version, description: description, display_name: display_name, domain_join_info: domain_join_info, enable_default_internet_access: enable_default_internet_access, iam_role_arn: iam_role_arn, image_arn: image_arn, image_name: image_name, root_volume_config: root_volume_config, softwares_to_install: softwares_to_install, softwares_to_uninstall: softwares_to_uninstall, tags: tags, vpc_config: vpc_config)
        create_image_builder(input)
      end

      def create_image_builder(input : Types::CreateImageBuilderRequest) : Types::CreateImageBuilderResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_IMAGE_BUILDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateImageBuilderResult, "CreateImageBuilder")
      end

      # Creates a URL to start an image builder streaming session.

      def create_image_builder_streaming_url(
        name : String,
        validity : Int64? = nil
      ) : Types::CreateImageBuilderStreamingURLResult

        input = Types::CreateImageBuilderStreamingURLRequest.new(name: name, validity: validity)
        create_image_builder_streaming_url(input)
      end

      def create_image_builder_streaming_url(input : Types::CreateImageBuilderStreamingURLRequest) : Types::CreateImageBuilderStreamingURLResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_IMAGE_BUILDER_STREAMING_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateImageBuilderStreamingURLResult, "CreateImageBuilderStreamingURL")
      end

      # Creates a custom WorkSpaces Applications image by importing an EC2 AMI. This allows you to use your
      # own customized AMI to create WorkSpaces Applications images that support additional instance types
      # beyond the standard stream.* instances.

      def create_imported_image(
        iam_role_arn : String,
        name : String,
        source_ami_id : String,
        agent_software_version : String? = nil,
        app_catalog_config : Array(Types::ApplicationConfig)? = nil,
        description : String? = nil,
        display_name : String? = nil,
        dry_run : Bool? = nil,
        runtime_validation_config : Types::RuntimeValidationConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateImportedImageResult

        input = Types::CreateImportedImageRequest.new(iam_role_arn: iam_role_arn, name: name, source_ami_id: source_ami_id, agent_software_version: agent_software_version, app_catalog_config: app_catalog_config, description: description, display_name: display_name, dry_run: dry_run, runtime_validation_config: runtime_validation_config, tags: tags)
        create_imported_image(input)
      end

      def create_imported_image(input : Types::CreateImportedImageRequest) : Types::CreateImportedImageResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_IMPORTED_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateImportedImageResult, "CreateImportedImage")
      end

      # Creates a stack to start streaming applications to users. A stack consists of an associated fleet,
      # user access policies, and storage configurations.

      def create_stack(
        name : String,
        access_endpoints : Array(Types::AccessEndpoint)? = nil,
        application_settings : Types::ApplicationSettings? = nil,
        description : String? = nil,
        display_name : String? = nil,
        embed_host_domains : Array(String)? = nil,
        feedback_url : String? = nil,
        redirect_url : String? = nil,
        storage_connectors : Array(Types::StorageConnector)? = nil,
        streaming_experience_settings : Types::StreamingExperienceSettings? = nil,
        tags : Hash(String, String)? = nil,
        user_settings : Array(Types::UserSetting)? = nil
      ) : Types::CreateStackResult

        input = Types::CreateStackRequest.new(name: name, access_endpoints: access_endpoints, application_settings: application_settings, description: description, display_name: display_name, embed_host_domains: embed_host_domains, feedback_url: feedback_url, redirect_url: redirect_url, storage_connectors: storage_connectors, streaming_experience_settings: streaming_experience_settings, tags: tags, user_settings: user_settings)
        create_stack(input)
      end

      def create_stack(input : Types::CreateStackRequest) : Types::CreateStackResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateStackResult, "CreateStack")
      end

      # Creates a temporary URL to start an WorkSpaces Applications streaming session for the specified
      # user. A streaming URL enables application streaming to be tested without user setup.

      def create_streaming_url(
        fleet_name : String,
        stack_name : String,
        user_id : String,
        application_id : String? = nil,
        session_context : String? = nil,
        validity : Int64? = nil
      ) : Types::CreateStreamingURLResult

        input = Types::CreateStreamingURLRequest.new(fleet_name: fleet_name, stack_name: stack_name, user_id: user_id, application_id: application_id, session_context: session_context, validity: validity)
        create_streaming_url(input)
      end

      def create_streaming_url(input : Types::CreateStreamingURLRequest) : Types::CreateStreamingURLResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_STREAMING_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateStreamingURLResult, "CreateStreamingURL")
      end

      # Creates custom branding that customizes the appearance of the streaming application catalog page.

      def create_theme_for_stack(
        favicon_s3_location : Types::S3Location,
        organization_logo_s3_location : Types::S3Location,
        stack_name : String,
        theme_styling : String,
        title_text : String,
        footer_links : Array(Types::ThemeFooterLink)? = nil
      ) : Types::CreateThemeForStackResult

        input = Types::CreateThemeForStackRequest.new(favicon_s3_location: favicon_s3_location, organization_logo_s3_location: organization_logo_s3_location, stack_name: stack_name, theme_styling: theme_styling, title_text: title_text, footer_links: footer_links)
        create_theme_for_stack(input)
      end

      def create_theme_for_stack(input : Types::CreateThemeForStackRequest) : Types::CreateThemeForStackResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_THEME_FOR_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateThemeForStackResult, "CreateThemeForStack")
      end

      # Creates a new image with the latest Windows operating system updates, driver updates, and WorkSpaces
      # Applications agent software. For more information, see the "Update an Image by Using Managed
      # WorkSpaces Applications Image Updates" section in Administer Your WorkSpaces Applications Images ,
      # in the Amazon WorkSpaces Applications Administration Guide .

      def create_updated_image(
        existing_image_name : String,
        new_image_name : String,
        dry_run : Bool? = nil,
        new_image_description : String? = nil,
        new_image_display_name : String? = nil,
        new_image_tags : Hash(String, String)? = nil
      ) : Types::CreateUpdatedImageResult

        input = Types::CreateUpdatedImageRequest.new(existing_image_name: existing_image_name, new_image_name: new_image_name, dry_run: dry_run, new_image_description: new_image_description, new_image_display_name: new_image_display_name, new_image_tags: new_image_tags)
        create_updated_image(input)
      end

      def create_updated_image(input : Types::CreateUpdatedImageRequest) : Types::CreateUpdatedImageResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_UPDATED_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUpdatedImageResult, "CreateUpdatedImage")
      end

      # Creates a usage report subscription. Usage reports are generated daily.

      def create_usage_report_subscription : Types::CreateUsageReportSubscriptionResult
        input = Types::CreateUsageReportSubscriptionRequest.new
        create_usage_report_subscription(input)
      end

      def create_usage_report_subscription(input : Types::CreateUsageReportSubscriptionRequest) : Types::CreateUsageReportSubscriptionResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_USAGE_REPORT_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUsageReportSubscriptionResult, "CreateUsageReportSubscription")
      end

      # Creates a new user in the user pool.

      def create_user(
        authentication_type : String,
        user_name : String,
        first_name : String? = nil,
        last_name : String? = nil,
        message_action : String? = nil
      ) : Types::CreateUserResult

        input = Types::CreateUserRequest.new(authentication_type: authentication_type, user_name: user_name, first_name: first_name, last_name: last_name, message_action: message_action)
        create_user(input)
      end

      def create_user(input : Types::CreateUserRequest) : Types::CreateUserResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUserResult, "CreateUser")
      end

      # Deletes an app block.

      def delete_app_block(
        name : String
      ) : Types::DeleteAppBlockResult

        input = Types::DeleteAppBlockRequest.new(name: name)
        delete_app_block(input)
      end

      def delete_app_block(input : Types::DeleteAppBlockRequest) : Types::DeleteAppBlockResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_APP_BLOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAppBlockResult, "DeleteAppBlock")
      end

      # Deletes an app block builder. An app block builder can only be deleted when it has no association
      # with an app block.

      def delete_app_block_builder(
        name : String
      ) : Types::DeleteAppBlockBuilderResult

        input = Types::DeleteAppBlockBuilderRequest.new(name: name)
        delete_app_block_builder(input)
      end

      def delete_app_block_builder(input : Types::DeleteAppBlockBuilderRequest) : Types::DeleteAppBlockBuilderResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_APP_BLOCK_BUILDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAppBlockBuilderResult, "DeleteAppBlockBuilder")
      end

      # Deletes an application.

      def delete_application(
        name : String
      ) : Types::DeleteApplicationResult

        input = Types::DeleteApplicationRequest.new(name: name)
        delete_application(input)
      end

      def delete_application(input : Types::DeleteApplicationRequest) : Types::DeleteApplicationResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationResult, "DeleteApplication")
      end

      # Deletes the specified Directory Config object from WorkSpaces Applications. This object includes the
      # information required to join streaming instances to an Active Directory domain.

      def delete_directory_config(
        directory_name : String
      ) : Types::DeleteDirectoryConfigResult

        input = Types::DeleteDirectoryConfigRequest.new(directory_name: directory_name)
        delete_directory_config(input)
      end

      def delete_directory_config(input : Types::DeleteDirectoryConfigRequest) : Types::DeleteDirectoryConfigResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DIRECTORY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDirectoryConfigResult, "DeleteDirectoryConfig")
      end

      # Deletes the specified entitlement.

      def delete_entitlement(
        name : String,
        stack_name : String
      ) : Types::DeleteEntitlementResult

        input = Types::DeleteEntitlementRequest.new(name: name, stack_name: stack_name)
        delete_entitlement(input)
      end

      def delete_entitlement(input : Types::DeleteEntitlementRequest) : Types::DeleteEntitlementResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENTITLEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEntitlementResult, "DeleteEntitlement")
      end

      # Deletes the specified fleet.

      def delete_fleet(
        name : String
      ) : Types::DeleteFleetResult

        input = Types::DeleteFleetRequest.new(name: name)
        delete_fleet(input)
      end

      def delete_fleet(input : Types::DeleteFleetRequest) : Types::DeleteFleetResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFleetResult, "DeleteFleet")
      end

      # Deletes the specified image. You cannot delete an image when it is in use. After you delete an
      # image, you cannot provision new capacity using the image.

      def delete_image(
        name : String
      ) : Types::DeleteImageResult

        input = Types::DeleteImageRequest.new(name: name)
        delete_image(input)
      end

      def delete_image(input : Types::DeleteImageRequest) : Types::DeleteImageResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteImageResult, "DeleteImage")
      end

      # Deletes the specified image builder and releases the capacity.

      def delete_image_builder(
        name : String
      ) : Types::DeleteImageBuilderResult

        input = Types::DeleteImageBuilderRequest.new(name: name)
        delete_image_builder(input)
      end

      def delete_image_builder(input : Types::DeleteImageBuilderRequest) : Types::DeleteImageBuilderResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_IMAGE_BUILDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteImageBuilderResult, "DeleteImageBuilder")
      end

      # Deletes permissions for the specified private image. After you delete permissions for an image, AWS
      # accounts to which you previously granted these permissions can no longer use the image.

      def delete_image_permissions(
        name : String,
        shared_account_id : String
      ) : Types::DeleteImagePermissionsResult

        input = Types::DeleteImagePermissionsRequest.new(name: name, shared_account_id: shared_account_id)
        delete_image_permissions(input)
      end

      def delete_image_permissions(input : Types::DeleteImagePermissionsRequest) : Types::DeleteImagePermissionsResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_IMAGE_PERMISSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteImagePermissionsResult, "DeleteImagePermissions")
      end

      # Deletes the specified stack. After the stack is deleted, the application streaming environment
      # provided by the stack is no longer available to users. Also, any reservations made for application
      # streaming sessions for the stack are released.

      def delete_stack(
        name : String
      ) : Types::DeleteStackResult

        input = Types::DeleteStackRequest.new(name: name)
        delete_stack(input)
      end

      def delete_stack(input : Types::DeleteStackRequest) : Types::DeleteStackResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteStackResult, "DeleteStack")
      end

      # Deletes custom branding that customizes the appearance of the streaming application catalog page.

      def delete_theme_for_stack(
        stack_name : String
      ) : Types::DeleteThemeForStackResult

        input = Types::DeleteThemeForStackRequest.new(stack_name: stack_name)
        delete_theme_for_stack(input)
      end

      def delete_theme_for_stack(input : Types::DeleteThemeForStackRequest) : Types::DeleteThemeForStackResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_THEME_FOR_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteThemeForStackResult, "DeleteThemeForStack")
      end

      # Disables usage report generation.

      def delete_usage_report_subscription : Types::DeleteUsageReportSubscriptionResult
        input = Types::DeleteUsageReportSubscriptionRequest.new
        delete_usage_report_subscription(input)
      end

      def delete_usage_report_subscription(input : Types::DeleteUsageReportSubscriptionRequest) : Types::DeleteUsageReportSubscriptionResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_USAGE_REPORT_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteUsageReportSubscriptionResult, "DeleteUsageReportSubscription")
      end

      # Deletes a user from the user pool.

      def delete_user(
        authentication_type : String,
        user_name : String
      ) : Types::DeleteUserResult

        input = Types::DeleteUserRequest.new(authentication_type: authentication_type, user_name: user_name)
        delete_user(input)
      end

      def delete_user(input : Types::DeleteUserRequest) : Types::DeleteUserResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteUserResult, "DeleteUser")
      end

      # Retrieves a list that describes one or more app block builder associations.

      def describe_app_block_builder_app_block_associations(
        app_block_arn : String? = nil,
        app_block_builder_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAppBlockBuilderAppBlockAssociationsResult

        input = Types::DescribeAppBlockBuilderAppBlockAssociationsRequest.new(app_block_arn: app_block_arn, app_block_builder_name: app_block_builder_name, max_results: max_results, next_token: next_token)
        describe_app_block_builder_app_block_associations(input)
      end

      def describe_app_block_builder_app_block_associations(input : Types::DescribeAppBlockBuilderAppBlockAssociationsRequest) : Types::DescribeAppBlockBuilderAppBlockAssociationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APP_BLOCK_BUILDER_APP_BLOCK_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAppBlockBuilderAppBlockAssociationsResult, "DescribeAppBlockBuilderAppBlockAssociations")
      end

      # Retrieves a list that describes one or more app block builders.

      def describe_app_block_builders(
        max_results : Int32? = nil,
        names : Array(String)? = nil,
        next_token : String? = nil
      ) : Types::DescribeAppBlockBuildersResult

        input = Types::DescribeAppBlockBuildersRequest.new(max_results: max_results, names: names, next_token: next_token)
        describe_app_block_builders(input)
      end

      def describe_app_block_builders(input : Types::DescribeAppBlockBuildersRequest) : Types::DescribeAppBlockBuildersResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APP_BLOCK_BUILDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAppBlockBuildersResult, "DescribeAppBlockBuilders")
      end

      # Retrieves a list that describes one or more app blocks.

      def describe_app_blocks(
        arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAppBlocksResult

        input = Types::DescribeAppBlocksRequest.new(arns: arns, max_results: max_results, next_token: next_token)
        describe_app_blocks(input)
      end

      def describe_app_blocks(input : Types::DescribeAppBlocksRequest) : Types::DescribeAppBlocksResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APP_BLOCKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAppBlocksResult, "DescribeAppBlocks")
      end

      # Retrieves license included application usage information.

      def describe_app_license_usage(
        billing_period : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAppLicenseUsageResult

        input = Types::DescribeAppLicenseUsageRequest.new(billing_period: billing_period, max_results: max_results, next_token: next_token)
        describe_app_license_usage(input)
      end

      def describe_app_license_usage(input : Types::DescribeAppLicenseUsageRequest) : Types::DescribeAppLicenseUsageResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APP_LICENSE_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAppLicenseUsageResult, "DescribeAppLicenseUsage")
      end

      # Retrieves a list that describes one or more application fleet associations. Either ApplicationArn or
      # FleetName must be specified.

      def describe_application_fleet_associations(
        application_arn : String? = nil,
        fleet_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeApplicationFleetAssociationsResult

        input = Types::DescribeApplicationFleetAssociationsRequest.new(application_arn: application_arn, fleet_name: fleet_name, max_results: max_results, next_token: next_token)
        describe_application_fleet_associations(input)
      end

      def describe_application_fleet_associations(input : Types::DescribeApplicationFleetAssociationsRequest) : Types::DescribeApplicationFleetAssociationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATION_FLEET_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationFleetAssociationsResult, "DescribeApplicationFleetAssociations")
      end

      # Retrieves a list that describes one or more applications.

      def describe_applications(
        arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeApplicationsResult

        input = Types::DescribeApplicationsRequest.new(arns: arns, max_results: max_results, next_token: next_token)
        describe_applications(input)
      end

      def describe_applications(input : Types::DescribeApplicationsRequest) : Types::DescribeApplicationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationsResult, "DescribeApplications")
      end

      # Retrieves a list that describes one or more specified Directory Config objects for WorkSpaces
      # Applications, if the names for these objects are provided. Otherwise, all Directory Config objects
      # in the account are described. These objects include the configuration information required to join
      # fleets and image builders to Microsoft Active Directory domains. Although the response syntax in
      # this topic includes the account password, this password is not returned in the actual response.

      def describe_directory_configs(
        directory_names : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeDirectoryConfigsResult

        input = Types::DescribeDirectoryConfigsRequest.new(directory_names: directory_names, max_results: max_results, next_token: next_token)
        describe_directory_configs(input)
      end

      def describe_directory_configs(input : Types::DescribeDirectoryConfigsRequest) : Types::DescribeDirectoryConfigsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DIRECTORY_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDirectoryConfigsResult, "DescribeDirectoryConfigs")
      end

      # Retrieves a list that describes one of more entitlements.

      def describe_entitlements(
        stack_name : String,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil
      ) : Types::DescribeEntitlementsResult

        input = Types::DescribeEntitlementsRequest.new(stack_name: stack_name, max_results: max_results, name: name, next_token: next_token)
        describe_entitlements(input)
      end

      def describe_entitlements(input : Types::DescribeEntitlementsRequest) : Types::DescribeEntitlementsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENTITLEMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEntitlementsResult, "DescribeEntitlements")
      end

      # Retrieves a list that describes one or more specified fleets, if the fleet names are provided.
      # Otherwise, all fleets in the account are described.

      def describe_fleets(
        names : Array(String)? = nil,
        next_token : String? = nil
      ) : Types::DescribeFleetsResult

        input = Types::DescribeFleetsRequest.new(names: names, next_token: next_token)
        describe_fleets(input)
      end

      def describe_fleets(input : Types::DescribeFleetsRequest) : Types::DescribeFleetsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetsResult, "DescribeFleets")
      end

      # Retrieves a list that describes one or more specified image builders, if the image builder names are
      # provided. Otherwise, all image builders in the account are described.

      def describe_image_builders(
        max_results : Int32? = nil,
        names : Array(String)? = nil,
        next_token : String? = nil
      ) : Types::DescribeImageBuildersResult

        input = Types::DescribeImageBuildersRequest.new(max_results: max_results, names: names, next_token: next_token)
        describe_image_builders(input)
      end

      def describe_image_builders(input : Types::DescribeImageBuildersRequest) : Types::DescribeImageBuildersResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMAGE_BUILDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImageBuildersResult, "DescribeImageBuilders")
      end

      # Retrieves a list that describes the permissions for shared AWS account IDs on a private image that
      # you own.

      def describe_image_permissions(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        shared_aws_account_ids : Array(String)? = nil
      ) : Types::DescribeImagePermissionsResult

        input = Types::DescribeImagePermissionsRequest.new(name: name, max_results: max_results, next_token: next_token, shared_aws_account_ids: shared_aws_account_ids)
        describe_image_permissions(input)
      end

      def describe_image_permissions(input : Types::DescribeImagePermissionsRequest) : Types::DescribeImagePermissionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMAGE_PERMISSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImagePermissionsResult, "DescribeImagePermissions")
      end

      # Retrieves a list that describes one or more specified images, if the image names or image ARNs are
      # provided. Otherwise, all images in the account are described.

      def describe_images(
        arns : Array(String)? = nil,
        max_results : Int32? = nil,
        names : Array(String)? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Types::DescribeImagesResult

        input = Types::DescribeImagesRequest.new(arns: arns, max_results: max_results, names: names, next_token: next_token, type: type)
        describe_images(input)
      end

      def describe_images(input : Types::DescribeImagesRequest) : Types::DescribeImagesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImagesResult, "DescribeImages")
      end

      # Retrieves a list that describes the streaming sessions for a specified stack and fleet. If a UserId
      # is provided for the stack and fleet, only streaming sessions for that user are described. If an
      # authentication type is not provided, the default is to authenticate users using a streaming URL.

      def describe_sessions(
        fleet_name : String,
        stack_name : String,
        authentication_type : String? = nil,
        instance_id : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        user_id : String? = nil
      ) : Types::DescribeSessionsResult

        input = Types::DescribeSessionsRequest.new(fleet_name: fleet_name, stack_name: stack_name, authentication_type: authentication_type, instance_id: instance_id, limit: limit, next_token: next_token, user_id: user_id)
        describe_sessions(input)
      end

      def describe_sessions(input : Types::DescribeSessionsRequest) : Types::DescribeSessionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSessionsResult, "DescribeSessions")
      end

      # Retrieves license included application associations for a specified resource.

      def describe_software_associations(
        associated_resource : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeSoftwareAssociationsResult

        input = Types::DescribeSoftwareAssociationsRequest.new(associated_resource: associated_resource, max_results: max_results, next_token: next_token)
        describe_software_associations(input)
      end

      def describe_software_associations(input : Types::DescribeSoftwareAssociationsRequest) : Types::DescribeSoftwareAssociationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SOFTWARE_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSoftwareAssociationsResult, "DescribeSoftwareAssociations")
      end

      # Retrieves a list that describes one or more specified stacks, if the stack names are provided.
      # Otherwise, all stacks in the account are described.

      def describe_stacks(
        names : Array(String)? = nil,
        next_token : String? = nil
      ) : Types::DescribeStacksResult

        input = Types::DescribeStacksRequest.new(names: names, next_token: next_token)
        describe_stacks(input)
      end

      def describe_stacks(input : Types::DescribeStacksRequest) : Types::DescribeStacksResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STACKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStacksResult, "DescribeStacks")
      end

      # Retrieves a list that describes the theme for a specified stack. A theme is custom branding that
      # customizes the appearance of the streaming application catalog page.

      def describe_theme_for_stack(
        stack_name : String
      ) : Types::DescribeThemeForStackResult

        input = Types::DescribeThemeForStackRequest.new(stack_name: stack_name)
        describe_theme_for_stack(input)
      end

      def describe_theme_for_stack(input : Types::DescribeThemeForStackRequest) : Types::DescribeThemeForStackResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_THEME_FOR_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeThemeForStackResult, "DescribeThemeForStack")
      end

      # Retrieves a list that describes one or more usage report subscriptions.

      def describe_usage_report_subscriptions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeUsageReportSubscriptionsResult

        input = Types::DescribeUsageReportSubscriptionsRequest.new(max_results: max_results, next_token: next_token)
        describe_usage_report_subscriptions(input)
      end

      def describe_usage_report_subscriptions(input : Types::DescribeUsageReportSubscriptionsRequest) : Types::DescribeUsageReportSubscriptionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_USAGE_REPORT_SUBSCRIPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUsageReportSubscriptionsResult, "DescribeUsageReportSubscriptions")
      end

      # Retrieves a list that describes the UserStackAssociation objects. You must specify either or both of
      # the following: The stack name The user name (email address of the user associated with the stack)
      # and the authentication type for the user

      def describe_user_stack_associations(
        authentication_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        stack_name : String? = nil,
        user_name : String? = nil
      ) : Types::DescribeUserStackAssociationsResult

        input = Types::DescribeUserStackAssociationsRequest.new(authentication_type: authentication_type, max_results: max_results, next_token: next_token, stack_name: stack_name, user_name: user_name)
        describe_user_stack_associations(input)
      end

      def describe_user_stack_associations(input : Types::DescribeUserStackAssociationsRequest) : Types::DescribeUserStackAssociationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_USER_STACK_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUserStackAssociationsResult, "DescribeUserStackAssociations")
      end

      # Retrieves a list that describes one or more specified users in the user pool.

      def describe_users(
        authentication_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeUsersResult

        input = Types::DescribeUsersRequest.new(authentication_type: authentication_type, max_results: max_results, next_token: next_token)
        describe_users(input)
      end

      def describe_users(input : Types::DescribeUsersRequest) : Types::DescribeUsersResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_USERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUsersResult, "DescribeUsers")
      end

      # Disables the specified user in the user pool. Users can't sign in to WorkSpaces Applications until
      # they are re-enabled. This action does not delete the user.

      def disable_user(
        authentication_type : String,
        user_name : String
      ) : Types::DisableUserResult

        input = Types::DisableUserRequest.new(authentication_type: authentication_type, user_name: user_name)
        disable_user(input)
      end

      def disable_user(input : Types::DisableUserRequest) : Types::DisableUserResult
        request = Protocol::JsonRpc.build_request(Model::DISABLE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableUserResult, "DisableUser")
      end

      # Disassociates a specified app block builder from a specified app block.

      def disassociate_app_block_builder_app_block(
        app_block_arn : String,
        app_block_builder_name : String
      ) : Types::DisassociateAppBlockBuilderAppBlockResult

        input = Types::DisassociateAppBlockBuilderAppBlockRequest.new(app_block_arn: app_block_arn, app_block_builder_name: app_block_builder_name)
        disassociate_app_block_builder_app_block(input)
      end

      def disassociate_app_block_builder_app_block(input : Types::DisassociateAppBlockBuilderAppBlockRequest) : Types::DisassociateAppBlockBuilderAppBlockResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_APP_BLOCK_BUILDER_APP_BLOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateAppBlockBuilderAppBlockResult, "DisassociateAppBlockBuilderAppBlock")
      end

      # Disassociates the specified application from the fleet.

      def disassociate_application_fleet(
        application_arn : String,
        fleet_name : String
      ) : Types::DisassociateApplicationFleetResult

        input = Types::DisassociateApplicationFleetRequest.new(application_arn: application_arn, fleet_name: fleet_name)
        disassociate_application_fleet(input)
      end

      def disassociate_application_fleet(input : Types::DisassociateApplicationFleetRequest) : Types::DisassociateApplicationFleetResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_APPLICATION_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateApplicationFleetResult, "DisassociateApplicationFleet")
      end

      # Deletes the specified application from the specified entitlement.

      def disassociate_application_from_entitlement(
        application_identifier : String,
        entitlement_name : String,
        stack_name : String
      ) : Types::DisassociateApplicationFromEntitlementResult

        input = Types::DisassociateApplicationFromEntitlementRequest.new(application_identifier: application_identifier, entitlement_name: entitlement_name, stack_name: stack_name)
        disassociate_application_from_entitlement(input)
      end

      def disassociate_application_from_entitlement(input : Types::DisassociateApplicationFromEntitlementRequest) : Types::DisassociateApplicationFromEntitlementResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_APPLICATION_FROM_ENTITLEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateApplicationFromEntitlementResult, "DisassociateApplicationFromEntitlement")
      end

      # Disassociates the specified fleet from the specified stack.

      def disassociate_fleet(
        fleet_name : String,
        stack_name : String
      ) : Types::DisassociateFleetResult

        input = Types::DisassociateFleetRequest.new(fleet_name: fleet_name, stack_name: stack_name)
        disassociate_fleet(input)
      end

      def disassociate_fleet(input : Types::DisassociateFleetRequest) : Types::DisassociateFleetResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateFleetResult, "DisassociateFleet")
      end

      # Removes license included application(s) association(s) from an image builder instance.

      def disassociate_software_from_image_builder(
        image_builder_name : String,
        software_names : Array(String)
      ) : Types::DisassociateSoftwareFromImageBuilderResult

        input = Types::DisassociateSoftwareFromImageBuilderRequest.new(image_builder_name: image_builder_name, software_names: software_names)
        disassociate_software_from_image_builder(input)
      end

      def disassociate_software_from_image_builder(input : Types::DisassociateSoftwareFromImageBuilderRequest) : Types::DisassociateSoftwareFromImageBuilderResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_SOFTWARE_FROM_IMAGE_BUILDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateSoftwareFromImageBuilderResult, "DisassociateSoftwareFromImageBuilder")
      end

      # Enables a user in the user pool. After being enabled, users can sign in to WorkSpaces Applications
      # and open applications from the stacks to which they are assigned.

      def enable_user(
        authentication_type : String,
        user_name : String
      ) : Types::EnableUserResult

        input = Types::EnableUserRequest.new(authentication_type: authentication_type, user_name: user_name)
        enable_user(input)
      end

      def enable_user(input : Types::EnableUserRequest) : Types::EnableUserResult
        request = Protocol::JsonRpc.build_request(Model::ENABLE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableUserResult, "EnableUser")
      end

      # Immediately stops the specified streaming session.

      def expire_session(
        session_id : String
      ) : Types::ExpireSessionResult

        input = Types::ExpireSessionRequest.new(session_id: session_id)
        expire_session(input)
      end

      def expire_session(input : Types::ExpireSessionRequest) : Types::ExpireSessionResult
        request = Protocol::JsonRpc.build_request(Model::EXPIRE_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExpireSessionResult, "ExpireSession")
      end

      # Retrieves information about an export image task, including its current state, progress, and any
      # error details.

      def get_export_image_task(
        task_id : String? = nil
      ) : Types::GetExportImageTaskResult

        input = Types::GetExportImageTaskRequest.new(task_id: task_id)
        get_export_image_task(input)
      end

      def get_export_image_task(input : Types::GetExportImageTaskRequest) : Types::GetExportImageTaskResult
        request = Protocol::JsonRpc.build_request(Model::GET_EXPORT_IMAGE_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetExportImageTaskResult, "GetExportImageTask")
      end

      # Retrieves the name of the fleet that is associated with the specified stack.

      def list_associated_fleets(
        stack_name : String,
        next_token : String? = nil
      ) : Types::ListAssociatedFleetsResult

        input = Types::ListAssociatedFleetsRequest.new(stack_name: stack_name, next_token: next_token)
        list_associated_fleets(input)
      end

      def list_associated_fleets(input : Types::ListAssociatedFleetsRequest) : Types::ListAssociatedFleetsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_ASSOCIATED_FLEETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAssociatedFleetsResult, "ListAssociatedFleets")
      end

      # Retrieves the name of the stack with which the specified fleet is associated.

      def list_associated_stacks(
        fleet_name : String,
        next_token : String? = nil
      ) : Types::ListAssociatedStacksResult

        input = Types::ListAssociatedStacksRequest.new(fleet_name: fleet_name, next_token: next_token)
        list_associated_stacks(input)
      end

      def list_associated_stacks(input : Types::ListAssociatedStacksRequest) : Types::ListAssociatedStacksResult
        request = Protocol::JsonRpc.build_request(Model::LIST_ASSOCIATED_STACKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAssociatedStacksResult, "ListAssociatedStacks")
      end

      # Retrieves a list of entitled applications.

      def list_entitled_applications(
        entitlement_name : String,
        stack_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEntitledApplicationsResult

        input = Types::ListEntitledApplicationsRequest.new(entitlement_name: entitlement_name, stack_name: stack_name, max_results: max_results, next_token: next_token)
        list_entitled_applications(input)
      end

      def list_entitled_applications(input : Types::ListEntitledApplicationsRequest) : Types::ListEntitledApplicationsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_ENTITLED_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEntitledApplicationsResult, "ListEntitledApplications")
      end

      # Lists export image tasks, with optional filtering and pagination. Use this operation to monitor the
      # status of multiple export operations.

      def list_export_image_tasks(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListExportImageTasksResult

        input = Types::ListExportImageTasksRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_export_image_tasks(input)
      end

      def list_export_image_tasks(input : Types::ListExportImageTasksRequest) : Types::ListExportImageTasksResult
        request = Protocol::JsonRpc.build_request(Model::LIST_EXPORT_IMAGE_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListExportImageTasksResult, "ListExportImageTasks")
      end

      # Retrieves a list of all tags for the specified WorkSpaces Applications resource. You can tag
      # WorkSpaces Applications image builders, images, fleets, and stacks. For more information about tags,
      # see Tagging Your Resources in the Amazon WorkSpaces Applications Administration Guide .

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Starts an app block builder. An app block builder can only be started when it's associated with an
      # app block. Starting an app block builder starts a new instance, which is equivalent to an elastic
      # fleet instance with application builder assistance functionality.

      def start_app_block_builder(
        name : String
      ) : Types::StartAppBlockBuilderResult

        input = Types::StartAppBlockBuilderRequest.new(name: name)
        start_app_block_builder(input)
      end

      def start_app_block_builder(input : Types::StartAppBlockBuilderRequest) : Types::StartAppBlockBuilderResult
        request = Protocol::JsonRpc.build_request(Model::START_APP_BLOCK_BUILDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartAppBlockBuilderResult, "StartAppBlockBuilder")
      end

      # Starts the specified fleet.

      def start_fleet(
        name : String
      ) : Types::StartFleetResult

        input = Types::StartFleetRequest.new(name: name)
        start_fleet(input)
      end

      def start_fleet(input : Types::StartFleetRequest) : Types::StartFleetResult
        request = Protocol::JsonRpc.build_request(Model::START_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartFleetResult, "StartFleet")
      end

      # Starts the specified image builder.

      def start_image_builder(
        name : String,
        appstream_agent_version : String? = nil
      ) : Types::StartImageBuilderResult

        input = Types::StartImageBuilderRequest.new(name: name, appstream_agent_version: appstream_agent_version)
        start_image_builder(input)
      end

      def start_image_builder(input : Types::StartImageBuilderRequest) : Types::StartImageBuilderResult
        request = Protocol::JsonRpc.build_request(Model::START_IMAGE_BUILDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartImageBuilderResult, "StartImageBuilder")
      end

      # Initiates license included applications deployment to an image builder instance.

      def start_software_deployment_to_image_builder(
        image_builder_name : String,
        retry_failed_deployments : Bool? = nil
      ) : Types::StartSoftwareDeploymentToImageBuilderResult

        input = Types::StartSoftwareDeploymentToImageBuilderRequest.new(image_builder_name: image_builder_name, retry_failed_deployments: retry_failed_deployments)
        start_software_deployment_to_image_builder(input)
      end

      def start_software_deployment_to_image_builder(input : Types::StartSoftwareDeploymentToImageBuilderRequest) : Types::StartSoftwareDeploymentToImageBuilderResult
        request = Protocol::JsonRpc.build_request(Model::START_SOFTWARE_DEPLOYMENT_TO_IMAGE_BUILDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSoftwareDeploymentToImageBuilderResult, "StartSoftwareDeploymentToImageBuilder")
      end

      # Stops an app block builder. Stopping an app block builder terminates the instance, and the instance
      # state is not persisted.

      def stop_app_block_builder(
        name : String
      ) : Types::StopAppBlockBuilderResult

        input = Types::StopAppBlockBuilderRequest.new(name: name)
        stop_app_block_builder(input)
      end

      def stop_app_block_builder(input : Types::StopAppBlockBuilderRequest) : Types::StopAppBlockBuilderResult
        request = Protocol::JsonRpc.build_request(Model::STOP_APP_BLOCK_BUILDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopAppBlockBuilderResult, "StopAppBlockBuilder")
      end

      # Stops the specified fleet.

      def stop_fleet(
        name : String
      ) : Types::StopFleetResult

        input = Types::StopFleetRequest.new(name: name)
        stop_fleet(input)
      end

      def stop_fleet(input : Types::StopFleetRequest) : Types::StopFleetResult
        request = Protocol::JsonRpc.build_request(Model::STOP_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopFleetResult, "StopFleet")
      end

      # Stops the specified image builder.

      def stop_image_builder(
        name : String
      ) : Types::StopImageBuilderResult

        input = Types::StopImageBuilderRequest.new(name: name)
        stop_image_builder(input)
      end

      def stop_image_builder(input : Types::StopImageBuilderRequest) : Types::StopImageBuilderResult
        request = Protocol::JsonRpc.build_request(Model::STOP_IMAGE_BUILDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopImageBuilderResult, "StopImageBuilder")
      end

      # Adds or overwrites one or more tags for the specified WorkSpaces Applications resource. You can tag
      # WorkSpaces Applications image builders, images, fleets, and stacks. Each tag consists of a key and
      # an optional value. If a resource already has a tag with the same key, this operation updates its
      # value. To list the current tags for your resources, use ListTagsForResource . To disassociate tags
      # from your resources, use UntagResource . For more information about tags, see Tagging Your Resources
      # in the Amazon WorkSpaces Applications Administration Guide .

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Disassociates one or more specified tags from the specified WorkSpaces Applications resource. To
      # list the current tags for your resources, use ListTagsForResource . For more information about tags,
      # see Tagging Your Resources in the Amazon WorkSpaces Applications Administration Guide .

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates an app block builder. If the app block builder is in the STARTING or STOPPING state, you
      # can't update it. If the app block builder is in the RUNNING state, you can only update the
      # DisplayName and Description. If the app block builder is in the STOPPED state, you can update any
      # attribute except the Name.

      def update_app_block_builder(
        name : String,
        access_endpoints : Array(Types::AccessEndpoint)? = nil,
        attributes_to_delete : Array(String)? = nil,
        description : String? = nil,
        display_name : String? = nil,
        enable_default_internet_access : Bool? = nil,
        iam_role_arn : String? = nil,
        instance_type : String? = nil,
        platform : String? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::UpdateAppBlockBuilderResult

        input = Types::UpdateAppBlockBuilderRequest.new(name: name, access_endpoints: access_endpoints, attributes_to_delete: attributes_to_delete, description: description, display_name: display_name, enable_default_internet_access: enable_default_internet_access, iam_role_arn: iam_role_arn, instance_type: instance_type, platform: platform, vpc_config: vpc_config)
        update_app_block_builder(input)
      end

      def update_app_block_builder(input : Types::UpdateAppBlockBuilderRequest) : Types::UpdateAppBlockBuilderResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APP_BLOCK_BUILDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAppBlockBuilderResult, "UpdateAppBlockBuilder")
      end

      # Updates the specified application.

      def update_application(
        name : String,
        app_block_arn : String? = nil,
        attributes_to_delete : Array(String)? = nil,
        description : String? = nil,
        display_name : String? = nil,
        icon_s3_location : Types::S3Location? = nil,
        launch_parameters : String? = nil,
        launch_path : String? = nil,
        working_directory : String? = nil
      ) : Types::UpdateApplicationResult

        input = Types::UpdateApplicationRequest.new(name: name, app_block_arn: app_block_arn, attributes_to_delete: attributes_to_delete, description: description, display_name: display_name, icon_s3_location: icon_s3_location, launch_parameters: launch_parameters, launch_path: launch_path, working_directory: working_directory)
        update_application(input)
      end

      def update_application(input : Types::UpdateApplicationRequest) : Types::UpdateApplicationResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateApplicationResult, "UpdateApplication")
      end

      # Updates the specified Directory Config object in WorkSpaces Applications. This object includes the
      # configuration information required to join fleets and image builders to Microsoft Active Directory
      # domains.

      def update_directory_config(
        directory_name : String,
        certificate_based_auth_properties : Types::CertificateBasedAuthProperties? = nil,
        organizational_unit_distinguished_names : Array(String)? = nil,
        service_account_credentials : Types::ServiceAccountCredentials? = nil
      ) : Types::UpdateDirectoryConfigResult

        input = Types::UpdateDirectoryConfigRequest.new(directory_name: directory_name, certificate_based_auth_properties: certificate_based_auth_properties, organizational_unit_distinguished_names: organizational_unit_distinguished_names, service_account_credentials: service_account_credentials)
        update_directory_config(input)
      end

      def update_directory_config(input : Types::UpdateDirectoryConfigRequest) : Types::UpdateDirectoryConfigResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DIRECTORY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDirectoryConfigResult, "UpdateDirectoryConfig")
      end

      # Updates the specified entitlement.

      def update_entitlement(
        name : String,
        stack_name : String,
        app_visibility : String? = nil,
        attributes : Array(Types::EntitlementAttribute)? = nil,
        description : String? = nil
      ) : Types::UpdateEntitlementResult

        input = Types::UpdateEntitlementRequest.new(name: name, stack_name: stack_name, app_visibility: app_visibility, attributes: attributes, description: description)
        update_entitlement(input)
      end

      def update_entitlement(input : Types::UpdateEntitlementRequest) : Types::UpdateEntitlementResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENTITLEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEntitlementResult, "UpdateEntitlement")
      end

      # Updates the specified fleet. If the fleet is in the STOPPED state, you can update any attribute
      # except the fleet name. If the fleet is in the RUNNING state, you can update the following based on
      # the fleet type: Always-On and On-Demand fleet types You can update the DisplayName , ComputeCapacity
      # , ImageARN , ImageName , IdleDisconnectTimeoutInSeconds , and DisconnectTimeoutInSeconds attributes.
      # Elastic fleet type You can update the DisplayName , IdleDisconnectTimeoutInSeconds ,
      # DisconnectTimeoutInSeconds , MaxConcurrentSessions , SessionScriptS3Location and
      # UsbDeviceFilterStrings attributes. If the fleet is in the STARTING or STOPPED state, you can't
      # update it.

      def update_fleet(
        attributes_to_delete : Array(String)? = nil,
        compute_capacity : Types::ComputeCapacity? = nil,
        delete_vpc_config : Bool? = nil,
        description : String? = nil,
        disconnect_timeout_in_seconds : Int32? = nil,
        display_name : String? = nil,
        domain_join_info : Types::DomainJoinInfo? = nil,
        enable_default_internet_access : Bool? = nil,
        iam_role_arn : String? = nil,
        idle_disconnect_timeout_in_seconds : Int32? = nil,
        image_arn : String? = nil,
        image_name : String? = nil,
        instance_type : String? = nil,
        max_concurrent_sessions : Int32? = nil,
        max_sessions_per_instance : Int32? = nil,
        max_user_duration_in_seconds : Int32? = nil,
        name : String? = nil,
        platform : String? = nil,
        root_volume_config : Types::VolumeConfig? = nil,
        session_script_s3_location : Types::S3Location? = nil,
        stream_view : String? = nil,
        usb_device_filter_strings : Array(String)? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::UpdateFleetResult

        input = Types::UpdateFleetRequest.new(attributes_to_delete: attributes_to_delete, compute_capacity: compute_capacity, delete_vpc_config: delete_vpc_config, description: description, disconnect_timeout_in_seconds: disconnect_timeout_in_seconds, display_name: display_name, domain_join_info: domain_join_info, enable_default_internet_access: enable_default_internet_access, iam_role_arn: iam_role_arn, idle_disconnect_timeout_in_seconds: idle_disconnect_timeout_in_seconds, image_arn: image_arn, image_name: image_name, instance_type: instance_type, max_concurrent_sessions: max_concurrent_sessions, max_sessions_per_instance: max_sessions_per_instance, max_user_duration_in_seconds: max_user_duration_in_seconds, name: name, platform: platform, root_volume_config: root_volume_config, session_script_s3_location: session_script_s3_location, stream_view: stream_view, usb_device_filter_strings: usb_device_filter_strings, vpc_config: vpc_config)
        update_fleet(input)
      end

      def update_fleet(input : Types::UpdateFleetRequest) : Types::UpdateFleetResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFleetResult, "UpdateFleet")
      end

      # Adds or updates permissions for the specified private image.

      def update_image_permissions(
        image_permissions : Types::ImagePermissions,
        name : String,
        shared_account_id : String
      ) : Types::UpdateImagePermissionsResult

        input = Types::UpdateImagePermissionsRequest.new(image_permissions: image_permissions, name: name, shared_account_id: shared_account_id)
        update_image_permissions(input)
      end

      def update_image_permissions(input : Types::UpdateImagePermissionsRequest) : Types::UpdateImagePermissionsResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_IMAGE_PERMISSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateImagePermissionsResult, "UpdateImagePermissions")
      end

      # Updates the specified fields for the specified stack.

      def update_stack(
        name : String,
        access_endpoints : Array(Types::AccessEndpoint)? = nil,
        application_settings : Types::ApplicationSettings? = nil,
        attributes_to_delete : Array(String)? = nil,
        delete_storage_connectors : Bool? = nil,
        description : String? = nil,
        display_name : String? = nil,
        embed_host_domains : Array(String)? = nil,
        feedback_url : String? = nil,
        redirect_url : String? = nil,
        storage_connectors : Array(Types::StorageConnector)? = nil,
        streaming_experience_settings : Types::StreamingExperienceSettings? = nil,
        user_settings : Array(Types::UserSetting)? = nil
      ) : Types::UpdateStackResult

        input = Types::UpdateStackRequest.new(name: name, access_endpoints: access_endpoints, application_settings: application_settings, attributes_to_delete: attributes_to_delete, delete_storage_connectors: delete_storage_connectors, description: description, display_name: display_name, embed_host_domains: embed_host_domains, feedback_url: feedback_url, redirect_url: redirect_url, storage_connectors: storage_connectors, streaming_experience_settings: streaming_experience_settings, user_settings: user_settings)
        update_stack(input)
      end

      def update_stack(input : Types::UpdateStackRequest) : Types::UpdateStackResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateStackResult, "UpdateStack")
      end

      # Updates custom branding that customizes the appearance of the streaming application catalog page.

      def update_theme_for_stack(
        stack_name : String,
        attributes_to_delete : Array(String)? = nil,
        favicon_s3_location : Types::S3Location? = nil,
        footer_links : Array(Types::ThemeFooterLink)? = nil,
        organization_logo_s3_location : Types::S3Location? = nil,
        state : String? = nil,
        theme_styling : String? = nil,
        title_text : String? = nil
      ) : Types::UpdateThemeForStackResult

        input = Types::UpdateThemeForStackRequest.new(stack_name: stack_name, attributes_to_delete: attributes_to_delete, favicon_s3_location: favicon_s3_location, footer_links: footer_links, organization_logo_s3_location: organization_logo_s3_location, state: state, theme_styling: theme_styling, title_text: title_text)
        update_theme_for_stack(input)
      end

      def update_theme_for_stack(input : Types::UpdateThemeForStackRequest) : Types::UpdateThemeForStackResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_THEME_FOR_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateThemeForStackResult, "UpdateThemeForStack")
      end
    end
  end
end
