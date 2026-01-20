module Aws
  module IoTSiteWise
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Associates a child asset with the given parent asset through a hierarchy defined in the parent
      # asset's model. For more information, see Associating assets in the IoT SiteWise User Guide .

      def associate_assets(
        asset_id : String,
        child_asset_id : String,
        hierarchy_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AssociateAssetsRequest.new(asset_id: asset_id, child_asset_id: child_asset_id, hierarchy_id: hierarchy_id, client_token: client_token)
        associate_assets(input)
      end

      def associate_assets(input : Types::AssociateAssetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a time series (data stream) with an asset property.

      def associate_time_series_to_asset_property(
        alias_ : String,
        asset_id : String,
        property_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AssociateTimeSeriesToAssetPropertyRequest.new(alias_: alias_, asset_id: asset_id, property_id: property_id, client_token: client_token)
        associate_time_series_to_asset_property(input)
      end

      def associate_time_series_to_asset_property(input : Types::AssociateTimeSeriesToAssetPropertyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_TIME_SERIES_TO_ASSET_PROPERTY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a group (batch) of assets with an IoT SiteWise Monitor project.

      def batch_associate_project_assets(
        asset_ids : Array(String),
        project_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchAssociateProjectAssetsRequest.new(asset_ids: asset_ids, project_id: project_id, client_token: client_token)
        batch_associate_project_assets(input)
      end

      def batch_associate_project_assets(input : Types::BatchAssociateProjectAssetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_ASSOCIATE_PROJECT_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a group (batch) of assets from an IoT SiteWise Monitor project.

      def batch_disassociate_project_assets(
        asset_ids : Array(String),
        project_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchDisassociateProjectAssetsRequest.new(asset_ids: asset_ids, project_id: project_id, client_token: client_token)
        batch_disassociate_project_assets(input)
      end

      def batch_disassociate_project_assets(input : Types::BatchDisassociateProjectAssetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DISASSOCIATE_PROJECT_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets aggregated values (for example, average, minimum, and maximum) for one or more asset
      # properties. For more information, see Querying aggregates in the IoT SiteWise User Guide .

      def batch_get_asset_property_aggregates(
        entries : Array(Types::BatchGetAssetPropertyAggregatesEntry),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchGetAssetPropertyAggregatesRequest.new(entries: entries, max_results: max_results, next_token: next_token)
        batch_get_asset_property_aggregates(input)
      end

      def batch_get_asset_property_aggregates(input : Types::BatchGetAssetPropertyAggregatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_ASSET_PROPERTY_AGGREGATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the current value for one or more asset properties. For more information, see Querying current
      # values in the IoT SiteWise User Guide .

      def batch_get_asset_property_value(
        entries : Array(Types::BatchGetAssetPropertyValueEntry),
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchGetAssetPropertyValueRequest.new(entries: entries, next_token: next_token)
        batch_get_asset_property_value(input)
      end

      def batch_get_asset_property_value(input : Types::BatchGetAssetPropertyValueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_ASSET_PROPERTY_VALUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the historical values for one or more asset properties. For more information, see Querying
      # historical values in the IoT SiteWise User Guide .

      def batch_get_asset_property_value_history(
        entries : Array(Types::BatchGetAssetPropertyValueHistoryEntry),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchGetAssetPropertyValueHistoryRequest.new(entries: entries, max_results: max_results, next_token: next_token)
        batch_get_asset_property_value_history(input)
      end

      def batch_get_asset_property_value_history(input : Types::BatchGetAssetPropertyValueHistoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_ASSET_PROPERTY_VALUE_HISTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a list of asset property values to IoT SiteWise. Each value is a timestamp-quality-value (TQV)
      # data point. For more information, see Ingesting data using the API in the IoT SiteWise User Guide .
      # To identify an asset property, you must specify one of the following: The assetId and propertyId of
      # an asset property. A propertyAlias , which is a data stream alias (for example,
      # /company/windfarm/3/turbine/7/temperature ). To define an asset property's alias, see
      # UpdateAssetProperty . With respect to Unix epoch time, IoT SiteWise accepts only TQVs that have a
      # timestamp of no more than 7 days in the past and no more than 10 minutes in the future. IoT SiteWise
      # rejects timestamps outside of the inclusive range of [-7 days, +10 minutes] and returns a
      # TimestampOutOfRangeException error. For each asset property, IoT SiteWise overwrites TQVs with
      # duplicate timestamps unless the newer TQV has a different quality. For example, if you store a TQV
      # {T1, GOOD, V1} , then storing {T1, GOOD, V2} replaces the existing TQV. IoT SiteWise authorizes
      # access to each BatchPutAssetPropertyValue entry individually. For more information, see
      # BatchPutAssetPropertyValue authorization in the IoT SiteWise User Guide .

      def batch_put_asset_property_value(
        entries : Array(Types::PutAssetPropertyValueEntry),
        enable_partial_entry_processing : Bool? = nil
      ) : Protocol::Request
        input = Types::BatchPutAssetPropertyValueRequest.new(entries: entries, enable_partial_entry_processing: enable_partial_entry_processing)
        batch_put_asset_property_value(input)
      end

      def batch_put_asset_property_value(input : Types::BatchPutAssetPropertyValueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_PUT_ASSET_PROPERTY_VALUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an access policy that grants the specified identity (IAM Identity Center user, IAM Identity
      # Center group, or IAM user) access to the specified IoT SiteWise Monitor portal or project resource.
      # Support for access policies that use an SSO Group as the identity is not supported at this time.

      def create_access_policy(
        access_policy_identity : Types::Identity,
        access_policy_permission : String,
        access_policy_resource : Types::Resource,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAccessPolicyRequest.new(access_policy_identity: access_policy_identity, access_policy_permission: access_policy_permission, access_policy_resource: access_policy_resource, client_token: client_token, tags: tags)
        create_access_policy(input)
      end

      def create_access_policy(input : Types::CreateAccessPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an asset from an existing asset model. For more information, see Creating assets in the IoT
      # SiteWise User Guide .

      def create_asset(
        asset_model_id : String,
        asset_name : String,
        asset_description : String? = nil,
        asset_external_id : String? = nil,
        asset_id : String? = nil,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAssetRequest.new(asset_model_id: asset_model_id, asset_name: asset_name, asset_description: asset_description, asset_external_id: asset_external_id, asset_id: asset_id, client_token: client_token, tags: tags)
        create_asset(input)
      end

      def create_asset(input : Types::CreateAssetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an asset model from specified property and hierarchy definitions. You create assets from
      # asset models. With asset models, you can easily create assets of the same type that have
      # standardized definitions. Each asset created from a model inherits the asset model's property and
      # hierarchy definitions. For more information, see Defining asset models in the IoT SiteWise User
      # Guide . You can create three types of asset models, ASSET_MODEL , COMPONENT_MODEL , or an INTERFACE
      # . ASSET_MODEL – (default) An asset model that you can use to create assets. Can't be included as a
      # component in another asset model. COMPONENT_MODEL – A reusable component that you can include in the
      # composite models of other asset models. You can't create assets directly from this type of asset
      # model. INTERFACE – An interface is a type of model that defines a standard structure that can be
      # applied to different asset models.

      def create_asset_model(
        asset_model_name : String,
        asset_model_composite_models : Array(Types::AssetModelCompositeModelDefinition)? = nil,
        asset_model_description : String? = nil,
        asset_model_external_id : String? = nil,
        asset_model_hierarchies : Array(Types::AssetModelHierarchyDefinition)? = nil,
        asset_model_id : String? = nil,
        asset_model_properties : Array(Types::AssetModelPropertyDefinition)? = nil,
        asset_model_type : String? = nil,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAssetModelRequest.new(asset_model_name: asset_model_name, asset_model_composite_models: asset_model_composite_models, asset_model_description: asset_model_description, asset_model_external_id: asset_model_external_id, asset_model_hierarchies: asset_model_hierarchies, asset_model_id: asset_model_id, asset_model_properties: asset_model_properties, asset_model_type: asset_model_type, client_token: client_token, tags: tags)
        create_asset_model(input)
      end

      def create_asset_model(input : Types::CreateAssetModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSET_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom composite model from specified property and hierarchy definitions. There are two
      # types of custom composite models, inline and component-model-based . Use component-model-based
      # custom composite models to define standard, reusable components. A component-model-based custom
      # composite model consists of a name, a description, and the ID of the component model it references.
      # A component-model-based custom composite model has no properties of its own; its referenced
      # component model provides its associated properties to any created assets. For more information, see
      # Custom composite models (Components) in the IoT SiteWise User Guide . Use inline custom composite
      # models to organize the properties of an asset model. The properties of inline custom composite
      # models are local to the asset model where they are included and can't be used to create multiple
      # assets. To create a component-model-based model, specify the composedAssetModelId of an existing
      # asset model with assetModelType of COMPONENT_MODEL . To create an inline model, specify the
      # assetModelCompositeModelProperties and don't include an composedAssetModelId .

      def create_asset_model_composite_model(
        asset_model_composite_model_name : String,
        asset_model_composite_model_type : String,
        asset_model_id : String,
        asset_model_composite_model_description : String? = nil,
        asset_model_composite_model_external_id : String? = nil,
        asset_model_composite_model_id : String? = nil,
        asset_model_composite_model_properties : Array(Types::AssetModelPropertyDefinition)? = nil,
        client_token : String? = nil,
        composed_asset_model_id : String? = nil,
        if_match : String? = nil,
        if_none_match : String? = nil,
        match_for_version_type : String? = nil,
        parent_asset_model_composite_model_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateAssetModelCompositeModelRequest.new(asset_model_composite_model_name: asset_model_composite_model_name, asset_model_composite_model_type: asset_model_composite_model_type, asset_model_id: asset_model_id, asset_model_composite_model_description: asset_model_composite_model_description, asset_model_composite_model_external_id: asset_model_composite_model_external_id, asset_model_composite_model_id: asset_model_composite_model_id, asset_model_composite_model_properties: asset_model_composite_model_properties, client_token: client_token, composed_asset_model_id: composed_asset_model_id, if_match: if_match, if_none_match: if_none_match, match_for_version_type: match_for_version_type, parent_asset_model_composite_model_id: parent_asset_model_composite_model_id)
        create_asset_model_composite_model(input)
      end

      def create_asset_model_composite_model(input : Types::CreateAssetModelCompositeModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSET_MODEL_COMPOSITE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Defines a job to ingest data to IoT SiteWise from Amazon S3. For more information, see Create a bulk
      # import job (CLI) in the Amazon Simple Storage Service User Guide . Before you create a bulk import
      # job, you must enable IoT SiteWise warm tier or IoT SiteWise cold tier. For more information about
      # how to configure storage settings, see PutStorageConfiguration . Bulk import is designed to store
      # historical data to IoT SiteWise. Newly ingested data in the hot tier triggers notifications and
      # computations. After data moves from the hot tier to the warm or cold tier based on retention
      # settings, it does not trigger computations or notifications. Data older than 7 days does not trigger
      # computations or notifications.

      def create_bulk_import_job(
        error_report_location : Types::ErrorReportLocation,
        files : Array(Types::File),
        job_configuration : Types::JobConfiguration,
        job_name : String,
        job_role_arn : String,
        adaptive_ingestion : Bool? = nil,
        delete_files_after_import : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateBulkImportJobRequest.new(error_report_location: error_report_location, files: files, job_configuration: job_configuration, job_name: job_name, job_role_arn: job_role_arn, adaptive_ingestion: adaptive_ingestion, delete_files_after_import: delete_files_after_import)
        create_bulk_import_job(input)
      end

      def create_bulk_import_job(input : Types::CreateBulkImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BULK_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a computation model with a configuration and data binding.

      def create_computation_model(
        computation_model_configuration : Types::ComputationModelConfiguration,
        computation_model_data_binding : Hash(String, Types::ComputationModelDataBindingValue),
        computation_model_name : String,
        client_token : String? = nil,
        computation_model_description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateComputationModelRequest.new(computation_model_configuration: computation_model_configuration, computation_model_data_binding: computation_model_data_binding, computation_model_name: computation_model_name, client_token: client_token, computation_model_description: computation_model_description, tags: tags)
        create_computation_model(input)
      end

      def create_computation_model(input : Types::CreateComputationModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_COMPUTATION_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a dashboard in an IoT SiteWise Monitor project.

      def create_dashboard(
        dashboard_definition : String,
        dashboard_name : String,
        project_id : String,
        client_token : String? = nil,
        dashboard_description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDashboardRequest.new(dashboard_definition: dashboard_definition, dashboard_name: dashboard_name, project_id: project_id, client_token: client_token, dashboard_description: dashboard_description, tags: tags)
        create_dashboard(input)
      end

      def create_dashboard(input : Types::CreateDashboardRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DASHBOARD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a dataset to connect an external datasource.

      def create_dataset(
        dataset_name : String,
        dataset_source : Types::DatasetSource,
        client_token : String? = nil,
        dataset_description : String? = nil,
        dataset_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDatasetRequest.new(dataset_name: dataset_name, dataset_source: dataset_source, client_token: client_token, dataset_description: dataset_description, dataset_id: dataset_id, tags: tags)
        create_dataset(input)
      end

      def create_dataset(input : Types::CreateDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a gateway, which is a virtual or edge device that delivers industrial data streams from
      # local servers to IoT SiteWise. For more information, see Ingesting data using a gateway in the IoT
      # SiteWise User Guide .

      def create_gateway(
        gateway_name : String,
        gateway_platform : Types::GatewayPlatform,
        gateway_version : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateGatewayRequest.new(gateway_name: gateway_name, gateway_platform: gateway_platform, gateway_version: gateway_version, tags: tags)
        create_gateway(input)
      end

      def create_gateway(input : Types::CreateGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a portal, which can contain projects and dashboards. IoT SiteWise Monitor uses IAM Identity
      # Center or IAM to authenticate portal users and manage user permissions. Before you can sign in to a
      # new portal, you must add at least one identity to that portal. For more information, see Adding or
      # removing portal administrators in the IoT SiteWise User Guide .

      def create_portal(
        portal_contact_email : String,
        portal_name : String,
        role_arn : String,
        alarms : Types::Alarms? = nil,
        client_token : String? = nil,
        notification_sender_email : String? = nil,
        portal_auth_mode : String? = nil,
        portal_description : String? = nil,
        portal_logo_image_file : Types::ImageFile? = nil,
        portal_type : String? = nil,
        portal_type_configuration : Hash(String, Types::PortalTypeEntry)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePortalRequest.new(portal_contact_email: portal_contact_email, portal_name: portal_name, role_arn: role_arn, alarms: alarms, client_token: client_token, notification_sender_email: notification_sender_email, portal_auth_mode: portal_auth_mode, portal_description: portal_description, portal_logo_image_file: portal_logo_image_file, portal_type: portal_type, portal_type_configuration: portal_type_configuration, tags: tags)
        create_portal(input)
      end

      def create_portal(input : Types::CreatePortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a project in the specified portal. Make sure that the project name and description don't
      # contain confidential information.

      def create_project(
        portal_id : String,
        project_name : String,
        client_token : String? = nil,
        project_description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateProjectRequest.new(portal_id: portal_id, project_name: project_name, client_token: client_token, project_description: project_description, tags: tags)
        create_project(input)
      end

      def create_project(input : Types::CreateProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an access policy that grants the specified identity access to the specified IoT SiteWise
      # Monitor resource. You can use this operation to revoke access to an IoT SiteWise Monitor resource.

      def delete_access_policy(
        access_policy_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAccessPolicyRequest.new(access_policy_id: access_policy_id, client_token: client_token)
        delete_access_policy(input)
      end

      def delete_access_policy(input : Types::DeleteAccessPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an asset. This action can't be undone. For more information, see Deleting assets and models
      # in the IoT SiteWise User Guide . You can't delete an asset that's associated to another asset. For
      # more information, see DisassociateAssets .

      def delete_asset(
        asset_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAssetRequest.new(asset_id: asset_id, client_token: client_token)
        delete_asset(input)
      end

      def delete_asset(input : Types::DeleteAssetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an asset model. This action can't be undone. You must delete all assets created from an
      # asset model before you can delete the model. Also, you can't delete an asset model if a parent asset
      # model exists that contains a property formula expression that depends on the asset model that you
      # want to delete. For more information, see Deleting assets and models in the IoT SiteWise User Guide
      # .

      def delete_asset_model(
        asset_model_id : String,
        client_token : String? = nil,
        if_match : String? = nil,
        if_none_match : String? = nil,
        match_for_version_type : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAssetModelRequest.new(asset_model_id: asset_model_id, client_token: client_token, if_match: if_match, if_none_match: if_none_match, match_for_version_type: match_for_version_type)
        delete_asset_model(input)
      end

      def delete_asset_model(input : Types::DeleteAssetModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSET_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a composite model. This action can't be undone. You must delete all assets created from a
      # composite model before you can delete the model. Also, you can't delete a composite model if a
      # parent asset model exists that contains a property formula expression that depends on the asset
      # model that you want to delete. For more information, see Deleting assets and models in the IoT
      # SiteWise User Guide .

      def delete_asset_model_composite_model(
        asset_model_composite_model_id : String,
        asset_model_id : String,
        client_token : String? = nil,
        if_match : String? = nil,
        if_none_match : String? = nil,
        match_for_version_type : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAssetModelCompositeModelRequest.new(asset_model_composite_model_id: asset_model_composite_model_id, asset_model_id: asset_model_id, client_token: client_token, if_match: if_match, if_none_match: if_none_match, match_for_version_type: match_for_version_type)
        delete_asset_model_composite_model(input)
      end

      def delete_asset_model_composite_model(input : Types::DeleteAssetModelCompositeModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSET_MODEL_COMPOSITE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an interface relationship between an asset model and an interface asset model.

      def delete_asset_model_interface_relationship(
        asset_model_id : String,
        interface_asset_model_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAssetModelInterfaceRelationshipRequest.new(asset_model_id: asset_model_id, interface_asset_model_id: interface_asset_model_id, client_token: client_token)
        delete_asset_model_interface_relationship(input)
      end

      def delete_asset_model_interface_relationship(input : Types::DeleteAssetModelInterfaceRelationshipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSET_MODEL_INTERFACE_RELATIONSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a computation model. This action can't be undone.

      def delete_computation_model(
        computation_model_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteComputationModelRequest.new(computation_model_id: computation_model_id, client_token: client_token)
        delete_computation_model(input)
      end

      def delete_computation_model(input : Types::DeleteComputationModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_COMPUTATION_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a dashboard from IoT SiteWise Monitor.

      def delete_dashboard(
        dashboard_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteDashboardRequest.new(dashboard_id: dashboard_id, client_token: client_token)
        delete_dashboard(input)
      end

      def delete_dashboard(input : Types::DeleteDashboardRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DASHBOARD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a dataset. This cannot be undone.

      def delete_dataset(
        dataset_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteDatasetRequest.new(dataset_id: dataset_id, client_token: client_token)
        delete_dataset(input)
      end

      def delete_dataset(input : Types::DeleteDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a gateway from IoT SiteWise. When you delete a gateway, some of the gateway's files remain
      # in your gateway's file system.

      def delete_gateway(
        gateway_id : String
      ) : Protocol::Request
        input = Types::DeleteGatewayRequest.new(gateway_id: gateway_id)
        delete_gateway(input)
      end

      def delete_gateway(input : Types::DeleteGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a portal from IoT SiteWise Monitor.

      def delete_portal(
        portal_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeletePortalRequest.new(portal_id: portal_id, client_token: client_token)
        delete_portal(input)
      end

      def delete_portal(input : Types::DeletePortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a project from IoT SiteWise Monitor.

      def delete_project(
        project_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteProjectRequest.new(project_id: project_id, client_token: client_token)
        delete_project(input)
      end

      def delete_project(input : Types::DeleteProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a time series (data stream). If you delete a time series that's associated with an asset
      # property, the asset property still exists, but the time series will no longer be associated with
      # this asset property. To identify a time series, do one of the following: If the time series isn't
      # associated with an asset property, specify the alias of the time series. If the time series is
      # associated with an asset property, specify one of the following: The alias of the time series. The
      # assetId and propertyId that identifies the asset property.

      def delete_time_series(
        alias_ : String? = nil,
        asset_id : String? = nil,
        client_token : String? = nil,
        property_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteTimeSeriesRequest.new(alias_: alias_, asset_id: asset_id, client_token: client_token, property_id: property_id)
        delete_time_series(input)
      end

      def delete_time_series(input : Types::DeleteTimeSeriesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TIME_SERIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an access policy, which specifies an identity's access to an IoT SiteWise Monitor portal
      # or project.

      def describe_access_policy(
        access_policy_id : String
      ) : Protocol::Request
        input = Types::DescribeAccessPolicyRequest.new(access_policy_id: access_policy_id)
        describe_access_policy(input)
      end

      def describe_access_policy(input : Types::DescribeAccessPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an action.

      def describe_action(
        action_id : String
      ) : Protocol::Request
        input = Types::DescribeActionRequest.new(action_id: action_id)
        describe_action(input)
      end

      def describe_action(input : Types::DescribeActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an asset.

      def describe_asset(
        asset_id : String,
        exclude_properties : Bool? = nil
      ) : Protocol::Request
        input = Types::DescribeAssetRequest.new(asset_id: asset_id, exclude_properties: exclude_properties)
        describe_asset(input)
      end

      def describe_asset(input : Types::DescribeAssetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an asset composite model (also known as an asset component). An
      # AssetCompositeModel is an instance of an AssetModelCompositeModel . If you want to see information
      # about the model this is based on, call DescribeAssetModelCompositeModel .

      def describe_asset_composite_model(
        asset_composite_model_id : String,
        asset_id : String
      ) : Protocol::Request
        input = Types::DescribeAssetCompositeModelRequest.new(asset_composite_model_id: asset_composite_model_id, asset_id: asset_id)
        describe_asset_composite_model(input)
      end

      def describe_asset_composite_model(input : Types::DescribeAssetCompositeModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ASSET_COMPOSITE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an asset model. This includes details about the asset model's
      # properties, hierarchies, composite models, and any interface relationships if the asset model
      # implements interfaces.

      def describe_asset_model(
        asset_model_id : String,
        asset_model_version : String? = nil,
        exclude_properties : Bool? = nil
      ) : Protocol::Request
        input = Types::DescribeAssetModelRequest.new(asset_model_id: asset_model_id, asset_model_version: asset_model_version, exclude_properties: exclude_properties)
        describe_asset_model(input)
      end

      def describe_asset_model(input : Types::DescribeAssetModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ASSET_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an asset model composite model (also known as an asset model component).
      # For more information, see Custom composite models (Components) in the IoT SiteWise User Guide .

      def describe_asset_model_composite_model(
        asset_model_composite_model_id : String,
        asset_model_id : String,
        asset_model_version : String? = nil
      ) : Protocol::Request
        input = Types::DescribeAssetModelCompositeModelRequest.new(asset_model_composite_model_id: asset_model_composite_model_id, asset_model_id: asset_model_id, asset_model_version: asset_model_version)
        describe_asset_model_composite_model(input)
      end

      def describe_asset_model_composite_model(input : Types::DescribeAssetModelCompositeModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ASSET_MODEL_COMPOSITE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an interface relationship between an asset model and an interface asset
      # model.

      def describe_asset_model_interface_relationship(
        asset_model_id : String,
        interface_asset_model_id : String
      ) : Protocol::Request
        input = Types::DescribeAssetModelInterfaceRelationshipRequest.new(asset_model_id: asset_model_id, interface_asset_model_id: interface_asset_model_id)
        describe_asset_model_interface_relationship(input)
      end

      def describe_asset_model_interface_relationship(input : Types::DescribeAssetModelInterfaceRelationshipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ASSET_MODEL_INTERFACE_RELATIONSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an asset property. When you call this operation for an attribute
      # property, this response includes the default attribute value that you define in the asset model. If
      # you update the default value in the model, this operation's response includes the new default value.
      # This operation doesn't return the value of the asset property. To get the value of an asset
      # property, use GetAssetPropertyValue .

      def describe_asset_property(
        asset_id : String,
        property_id : String
      ) : Protocol::Request
        input = Types::DescribeAssetPropertyRequest.new(asset_id: asset_id, property_id: property_id)
        describe_asset_property(input)
      end

      def describe_asset_property(input : Types::DescribeAssetPropertyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ASSET_PROPERTY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a bulk import job request. For more information, see Describe a bulk
      # import job (CLI) in the Amazon Simple Storage Service User Guide .

      def describe_bulk_import_job(
        job_id : String
      ) : Protocol::Request
        input = Types::DescribeBulkImportJobRequest.new(job_id: job_id)
        describe_bulk_import_job(input)
      end

      def describe_bulk_import_job(input : Types::DescribeBulkImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BULK_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a computation model.

      def describe_computation_model(
        computation_model_id : String,
        computation_model_version : String? = nil
      ) : Protocol::Request
        input = Types::DescribeComputationModelRequest.new(computation_model_id: computation_model_id, computation_model_version: computation_model_version)
        describe_computation_model(input)
      end

      def describe_computation_model(input : Types::DescribeComputationModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_COMPUTATION_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the execution summary of a computation model.

      def describe_computation_model_execution_summary(
        computation_model_id : String,
        resolve_to_resource_id : String? = nil,
        resolve_to_resource_type : String? = nil
      ) : Protocol::Request
        input = Types::DescribeComputationModelExecutionSummaryRequest.new(computation_model_id: computation_model_id, resolve_to_resource_id: resolve_to_resource_id, resolve_to_resource_type: resolve_to_resource_type)
        describe_computation_model_execution_summary(input)
      end

      def describe_computation_model_execution_summary(input : Types::DescribeComputationModelExecutionSummaryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_COMPUTATION_MODEL_EXECUTION_SUMMARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a dashboard.

      def describe_dashboard(
        dashboard_id : String
      ) : Protocol::Request
        input = Types::DescribeDashboardRequest.new(dashboard_id: dashboard_id)
        describe_dashboard(input)
      end

      def describe_dashboard(input : Types::DescribeDashboardRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DASHBOARD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a dataset.

      def describe_dataset(
        dataset_id : String
      ) : Protocol::Request
        input = Types::DescribeDatasetRequest.new(dataset_id: dataset_id)
        describe_dataset(input)
      end

      def describe_dataset(input : Types::DescribeDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the default encryption configuration for the Amazon Web Services account
      # in the default or specified Region. For more information, see Key management in the IoT SiteWise
      # User Guide .

      def describe_default_encryption_configuration : Protocol::Request
        input = Types::DescribeDefaultEncryptionConfigurationRequest.new
        describe_default_encryption_configuration(input)
      end

      def describe_default_encryption_configuration(input : Types::DescribeDefaultEncryptionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DEFAULT_ENCRYPTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the execution.

      def describe_execution(
        execution_id : String
      ) : Protocol::Request
        input = Types::DescribeExecutionRequest.new(execution_id: execution_id)
        describe_execution(input)
      end

      def describe_execution(input : Types::DescribeExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a gateway.

      def describe_gateway(
        gateway_id : String
      ) : Protocol::Request
        input = Types::DescribeGatewayRequest.new(gateway_id: gateway_id)
        describe_gateway(input)
      end

      def describe_gateway(input : Types::DescribeGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Each gateway capability defines data sources for a gateway. This is the namespace of the gateway
      # capability. . The namespace follows the format service:capability:version , where: service - The
      # service providing the capability, or iotsitewise . capability - The specific capability type.
      # Options include: opcuacollector for the OPC UA data source collector, or publisher for data
      # publisher capability. version - The version number of the capability. Option include 2 for Classic
      # streams, V2 gateways, and 3 for MQTT-enabled, V3 gateways. After updating a capability
      # configuration, the sync status becomes OUT_OF_SYNC until the gateway processes the configuration.Use
      # DescribeGatewayCapabilityConfiguration to check the sync status and verify the configuration was
      # applied. A gateway can have multiple capability configurations with different namespaces.

      def describe_gateway_capability_configuration(
        capability_namespace : String,
        gateway_id : String
      ) : Protocol::Request
        input = Types::DescribeGatewayCapabilityConfigurationRequest.new(capability_namespace: capability_namespace, gateway_id: gateway_id)
        describe_gateway_capability_configuration(input)
      end

      def describe_gateway_capability_configuration(input : Types::DescribeGatewayCapabilityConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_GATEWAY_CAPABILITY_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current IoT SiteWise logging options.

      def describe_logging_options : Protocol::Request
        input = Types::DescribeLoggingOptionsRequest.new
        describe_logging_options(input)
      end

      def describe_logging_options(input : Types::DescribeLoggingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_LOGGING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a portal.

      def describe_portal(
        portal_id : String
      ) : Protocol::Request
        input = Types::DescribePortalRequest.new(portal_id: portal_id)
        describe_portal(input)
      end

      def describe_portal(input : Types::DescribePortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a project.

      def describe_project(
        project_id : String
      ) : Protocol::Request
        input = Types::DescribeProjectRequest.new(project_id: project_id)
        describe_project(input)
      end

      def describe_project(input : Types::DescribeProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the storage configuration for IoT SiteWise.

      def describe_storage_configuration : Protocol::Request
        input = Types::DescribeStorageConfigurationRequest.new
        describe_storage_configuration(input)
      end

      def describe_storage_configuration(input : Types::DescribeStorageConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_STORAGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a time series (data stream). To identify a time series, do one of the
      # following: If the time series isn't associated with an asset property, specify the alias of the time
      # series. If the time series is associated with an asset property, specify one of the following: The
      # alias of the time series. The assetId and propertyId that identifies the asset property.

      def describe_time_series(
        alias_ : String? = nil,
        asset_id : String? = nil,
        property_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeTimeSeriesRequest.new(alias_: alias_, asset_id: asset_id, property_id: property_id)
        describe_time_series(input)
      end

      def describe_time_series(input : Types::DescribeTimeSeriesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TIME_SERIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a child asset from the given parent asset through a hierarchy defined in the parent
      # asset's model.

      def disassociate_assets(
        asset_id : String,
        child_asset_id : String,
        hierarchy_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateAssetsRequest.new(asset_id: asset_id, child_asset_id: child_asset_id, hierarchy_id: hierarchy_id, client_token: client_token)
        disassociate_assets(input)
      end

      def disassociate_assets(input : Types::DisassociateAssetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a time series (data stream) from an asset property.

      def disassociate_time_series_from_asset_property(
        alias_ : String,
        asset_id : String,
        property_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateTimeSeriesFromAssetPropertyRequest.new(alias_: alias_, asset_id: asset_id, property_id: property_id, client_token: client_token)
        disassociate_time_series_from_asset_property(input)
      end

      def disassociate_time_series_from_asset_property(input : Types::DisassociateTimeSeriesFromAssetPropertyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_TIME_SERIES_FROM_ASSET_PROPERTY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Executes an action on a target resource.

      def execute_action(
        action_definition_id : String,
        action_payload : Types::ActionPayload,
        target_resource : Types::TargetResource,
        client_token : String? = nil,
        resolve_to : Types::ResolveTo? = nil
      ) : Protocol::Request
        input = Types::ExecuteActionRequest.new(action_definition_id: action_definition_id, action_payload: action_payload, target_resource: target_resource, client_token: client_token, resolve_to: resolve_to)
        execute_action(input)
      end

      def execute_action(input : Types::ExecuteActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Run SQL queries to retrieve metadata and time-series data from asset models, assets, measurements,
      # metrics, transforms, and aggregates.

      def execute_query(
        query_statement : String,
        client_token : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ExecuteQueryRequest.new(query_statement: query_statement, client_token: client_token, max_results: max_results, next_token: next_token)
        execute_query(input)
      end

      def execute_query(input : Types::ExecuteQueryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets aggregated values for an asset property. For more information, see Querying aggregates in the
      # IoT SiteWise User Guide . To identify an asset property, you must specify one of the following: The
      # assetId and propertyId of an asset property. A propertyAlias , which is a data stream alias (for
      # example, /company/windfarm/3/turbine/7/temperature ). To define an asset property's alias, see
      # UpdateAssetProperty .

      def get_asset_property_aggregates(
        aggregate_types : Array(String),
        end_date : Time,
        resolution : String,
        start_date : Time,
        asset_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        property_alias : String? = nil,
        property_id : String? = nil,
        qualities : Array(String)? = nil,
        time_ordering : String? = nil
      ) : Protocol::Request
        input = Types::GetAssetPropertyAggregatesRequest.new(aggregate_types: aggregate_types, end_date: end_date, resolution: resolution, start_date: start_date, asset_id: asset_id, max_results: max_results, next_token: next_token, property_alias: property_alias, property_id: property_id, qualities: qualities, time_ordering: time_ordering)
        get_asset_property_aggregates(input)
      end

      def get_asset_property_aggregates(input : Types::GetAssetPropertyAggregatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSET_PROPERTY_AGGREGATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an asset property's current value. For more information, see Querying current values in the IoT
      # SiteWise User Guide . To identify an asset property, you must specify one of the following: The
      # assetId and propertyId of an asset property. A propertyAlias , which is a data stream alias (for
      # example, /company/windfarm/3/turbine/7/temperature ). To define an asset property's alias, see
      # UpdateAssetProperty .

      def get_asset_property_value(
        asset_id : String? = nil,
        property_alias : String? = nil,
        property_id : String? = nil
      ) : Protocol::Request
        input = Types::GetAssetPropertyValueRequest.new(asset_id: asset_id, property_alias: property_alias, property_id: property_id)
        get_asset_property_value(input)
      end

      def get_asset_property_value(input : Types::GetAssetPropertyValueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSET_PROPERTY_VALUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the history of an asset property's values. For more information, see Querying historical values
      # in the IoT SiteWise User Guide . To identify an asset property, you must specify one of the
      # following: The assetId and propertyId of an asset property. A propertyAlias , which is a data stream
      # alias (for example, /company/windfarm/3/turbine/7/temperature ). To define an asset property's
      # alias, see UpdateAssetProperty .

      def get_asset_property_value_history(
        asset_id : String? = nil,
        end_date : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        property_alias : String? = nil,
        property_id : String? = nil,
        qualities : Array(String)? = nil,
        start_date : Time? = nil,
        time_ordering : String? = nil
      ) : Protocol::Request
        input = Types::GetAssetPropertyValueHistoryRequest.new(asset_id: asset_id, end_date: end_date, max_results: max_results, next_token: next_token, property_alias: property_alias, property_id: property_id, qualities: qualities, start_date: start_date, time_ordering: time_ordering)
        get_asset_property_value_history(input)
      end

      def get_asset_property_value_history(input : Types::GetAssetPropertyValueHistoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSET_PROPERTY_VALUE_HISTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get interpolated values for an asset property for a specified time interval, during a period of
      # time. If your time series is missing data points during the specified time interval, you can use
      # interpolation to estimate the missing data. For example, you can use this operation to return the
      # interpolated temperature values for a wind turbine every 24 hours over a duration of 7 days. To
      # identify an asset property, you must specify one of the following: The assetId and propertyId of an
      # asset property. A propertyAlias , which is a data stream alias (for example,
      # /company/windfarm/3/turbine/7/temperature ). To define an asset property's alias, see
      # UpdateAssetProperty .

      def get_interpolated_asset_property_values(
        end_time_in_seconds : Int64,
        interval_in_seconds : Int64,
        quality : String,
        start_time_in_seconds : Int64,
        type : String,
        asset_id : String? = nil,
        end_time_offset_in_nanos : Int32? = nil,
        interval_window_in_seconds : Int64? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        property_alias : String? = nil,
        property_id : String? = nil,
        start_time_offset_in_nanos : Int32? = nil
      ) : Protocol::Request
        input = Types::GetInterpolatedAssetPropertyValuesRequest.new(end_time_in_seconds: end_time_in_seconds, interval_in_seconds: interval_in_seconds, quality: quality, start_time_in_seconds: start_time_in_seconds, type: type, asset_id: asset_id, end_time_offset_in_nanos: end_time_offset_in_nanos, interval_window_in_seconds: interval_window_in_seconds, max_results: max_results, next_token: next_token, property_alias: property_alias, property_id: property_id, start_time_offset_in_nanos: start_time_offset_in_nanos)
        get_interpolated_asset_property_values(input)
      end

      def get_interpolated_asset_property_values(input : Types::GetInterpolatedAssetPropertyValuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTERPOLATED_ASSET_PROPERTY_VALUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Invokes SiteWise Assistant to start or continue a conversation.

      def invoke_assistant(
        message : String,
        conversation_id : String? = nil,
        enable_trace : Bool? = nil
      ) : Protocol::Request
        input = Types::InvokeAssistantRequest.new(message: message, conversation_id: conversation_id, enable_trace: enable_trace)
        invoke_assistant(input)
      end

      def invoke_assistant(input : Types::InvokeAssistantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_ASSISTANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of access policies for an identity (an IAM Identity Center user, an IAM
      # Identity Center group, or an IAM user) or an IoT SiteWise Monitor resource (a portal or project).

      def list_access_policies(
        iam_arn : String? = nil,
        identity_id : String? = nil,
        identity_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_id : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListAccessPoliciesRequest.new(iam_arn: iam_arn, identity_id: identity_id, identity_type: identity_type, max_results: max_results, next_token: next_token, resource_id: resource_id, resource_type: resource_type)
        list_access_policies(input)
      end

      def list_access_policies(input : Types::ListAccessPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCESS_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of actions for a specific target resource.

      def list_actions(
        target_resource_id : String,
        target_resource_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resolve_to_resource_id : String? = nil,
        resolve_to_resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListActionsRequest.new(target_resource_id: target_resource_id, target_resource_type: target_resource_type, max_results: max_results, next_token: next_token, resolve_to_resource_id: resolve_to_resource_id, resolve_to_resource_type: resolve_to_resource_type)
        list_actions(input)
      end

      def list_actions(input : Types::ListActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of composite models associated with the asset model

      def list_asset_model_composite_models(
        asset_model_id : String,
        asset_model_version : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetModelCompositeModelsRequest.new(asset_model_id: asset_model_id, asset_model_version: asset_model_version, max_results: max_results, next_token: next_token)
        list_asset_model_composite_models(input)
      end

      def list_asset_model_composite_models(input : Types::ListAssetModelCompositeModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSET_MODEL_COMPOSITE_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of properties associated with an asset model. If you update properties
      # associated with the model before you finish listing all the properties, you need to start all over
      # again.

      def list_asset_model_properties(
        asset_model_id : String,
        asset_model_version : String? = nil,
        filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetModelPropertiesRequest.new(asset_model_id: asset_model_id, asset_model_version: asset_model_version, filter: filter, max_results: max_results, next_token: next_token)
        list_asset_model_properties(input)
      end

      def list_asset_model_properties(input : Types::ListAssetModelPropertiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSET_MODEL_PROPERTIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of summaries of all asset models.

      def list_asset_models(
        asset_model_types : Array(String)? = nil,
        asset_model_version : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetModelsRequest.new(asset_model_types: asset_model_types, asset_model_version: asset_model_version, max_results: max_results, next_token: next_token)
        list_asset_models(input)
      end

      def list_asset_models(input : Types::ListAssetModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSET_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of properties associated with an asset. If you update properties
      # associated with the model before you finish listing all the properties, you need to start all over
      # again.

      def list_asset_properties(
        asset_id : String,
        filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetPropertiesRequest.new(asset_id: asset_id, filter: filter, max_results: max_results, next_token: next_token)
        list_asset_properties(input)
      end

      def list_asset_properties(input : Types::ListAssetPropertiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSET_PROPERTIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of asset relationships for an asset. You can use this operation to
      # identify an asset's root asset and all associated assets between that asset and its root.

      def list_asset_relationships(
        asset_id : String,
        traversal_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetRelationshipsRequest.new(asset_id: asset_id, traversal_type: traversal_type, max_results: max_results, next_token: next_token)
        list_asset_relationships(input)
      end

      def list_asset_relationships(input : Types::ListAssetRelationshipsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSET_RELATIONSHIPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of asset summaries. You can use this operation to do the following: List
      # assets based on a specific asset model. List top-level assets. You can't use this operation to list
      # all assets. To retrieve summaries for all of your assets, use ListAssetModels to get all of your
      # asset model IDs. Then, use ListAssets to get all assets for each asset model.

      def list_assets(
        asset_model_id : String? = nil,
        filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetsRequest.new(asset_model_id: asset_model_id, filter: filter, max_results: max_results, next_token: next_token)
        list_assets(input)
      end

      def list_assets(input : Types::ListAssetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of associated assets. You can use this operation to do the following:
      # CHILD - List all child assets associated to the asset. PARENT - List the asset's parent asset.

      def list_associated_assets(
        asset_id : String,
        hierarchy_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        traversal_direction : String? = nil
      ) : Protocol::Request
        input = Types::ListAssociatedAssetsRequest.new(asset_id: asset_id, hierarchy_id: hierarchy_id, max_results: max_results, next_token: next_token, traversal_direction: traversal_direction)
        list_associated_assets(input)
      end

      def list_associated_assets(input : Types::ListAssociatedAssetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSOCIATED_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of bulk import job requests. For more information, see List bulk import
      # jobs (CLI) in the IoT SiteWise User Guide .

      def list_bulk_import_jobs(
        filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBulkImportJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_bulk_import_jobs(input)
      end

      def list_bulk_import_jobs(input : Types::ListBulkImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BULK_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of composition relationships for an asset model of type COMPONENT_MODEL .

      def list_composition_relationships(
        asset_model_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCompositionRelationshipsRequest.new(asset_model_id: asset_model_id, max_results: max_results, next_token: next_token)
        list_composition_relationships(input)
      end

      def list_composition_relationships(input : Types::ListCompositionRelationshipsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPOSITION_RELATIONSHIPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all data binding usages for computation models. This allows to identify where specific data
      # bindings are being utilized across the computation models. This track dependencies between data
      # sources and computation models.

      def list_computation_model_data_binding_usages(
        data_binding_value_filter : Types::DataBindingValueFilter,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListComputationModelDataBindingUsagesRequest.new(data_binding_value_filter: data_binding_value_filter, max_results: max_results, next_token: next_token)
        list_computation_model_data_binding_usages(input)
      end

      def list_computation_model_data_binding_usages(input : Types::ListComputationModelDataBindingUsagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPUTATION_MODEL_DATA_BINDING_USAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all distinct resources that are resolved from the executed actions of the computation model.

      def list_computation_model_resolve_to_resources(
        computation_model_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListComputationModelResolveToResourcesRequest.new(computation_model_id: computation_model_id, max_results: max_results, next_token: next_token)
        list_computation_model_resolve_to_resources(input)
      end

      def list_computation_model_resolve_to_resources(input : Types::ListComputationModelResolveToResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPUTATION_MODEL_RESOLVE_TO_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of summaries of all computation models.

      def list_computation_models(
        computation_model_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListComputationModelsRequest.new(computation_model_type: computation_model_type, max_results: max_results, next_token: next_token)
        list_computation_models(input)
      end

      def list_computation_models(input : Types::ListComputationModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPUTATION_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of dashboards for an IoT SiteWise Monitor project.

      def list_dashboards(
        project_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDashboardsRequest.new(project_id: project_id, max_results: max_results, next_token: next_token)
        list_dashboards(input)
      end

      def list_dashboards(input : Types::ListDashboardsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DASHBOARDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of datasets for a specific target resource.

      def list_datasets(
        source_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDatasetsRequest.new(source_type: source_type, max_results: max_results, next_token: next_token)
        list_datasets(input)
      end

      def list_datasets(input : Types::ListDatasetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATASETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of summaries of all executions.

      def list_executions(
        target_resource_id : String,
        target_resource_type : String,
        action_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resolve_to_resource_id : String? = nil,
        resolve_to_resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListExecutionsRequest.new(target_resource_id: target_resource_id, target_resource_type: target_resource_type, action_type: action_type, max_results: max_results, next_token: next_token, resolve_to_resource_id: resolve_to_resource_id, resolve_to_resource_type: resolve_to_resource_type)
        list_executions(input)
      end

      def list_executions(input : Types::ListExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of gateways.

      def list_gateways(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGatewaysRequest.new(max_results: max_results, next_token: next_token)
        list_gateways(input)
      end

      def list_gateways(input : Types::ListGatewaysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GATEWAYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of asset models that have a specific interface asset model applied to
      # them.

      def list_interface_relationships(
        interface_asset_model_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInterfaceRelationshipsRequest.new(interface_asset_model_id: interface_asset_model_id, max_results: max_results, next_token: next_token)
        list_interface_relationships(input)
      end

      def list_interface_relationships(input : Types::ListInterfaceRelationshipsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INTERFACE_RELATIONSHIPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of IoT SiteWise Monitor portals.

      def list_portals(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPortalsRequest.new(max_results: max_results, next_token: next_token)
        list_portals(input)
      end

      def list_portals(input : Types::ListPortalsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PORTALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of assets associated with an IoT SiteWise Monitor project.

      def list_project_assets(
        project_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProjectAssetsRequest.new(project_id: project_id, max_results: max_results, next_token: next_token)
        list_project_assets(input)
      end

      def list_project_assets(input : Types::ListProjectAssetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROJECT_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of projects for an IoT SiteWise Monitor portal.

      def list_projects(
        portal_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProjectsRequest.new(portal_id: portal_id, max_results: max_results, next_token: next_token)
        list_projects(input)
      end

      def list_projects(input : Types::ListProjectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROJECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the list of tags for an IoT SiteWise resource.

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

      # Retrieves a paginated list of time series (data streams).

      def list_time_series(
        alias_prefix : String? = nil,
        asset_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        time_series_type : String? = nil
      ) : Protocol::Request
        input = Types::ListTimeSeriesRequest.new(alias_prefix: alias_prefix, asset_id: asset_id, max_results: max_results, next_token: next_token, time_series_type: time_series_type)
        list_time_series(input)
      end

      def list_time_series(input : Types::ListTimeSeriesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TIME_SERIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates an interface relationship between an asset model and an interface asset model.
      # This operation applies an interface to an asset model.

      def put_asset_model_interface_relationship(
        asset_model_id : String,
        interface_asset_model_id : String,
        property_mapping_configuration : Types::PropertyMappingConfiguration,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::PutAssetModelInterfaceRelationshipRequest.new(asset_model_id: asset_model_id, interface_asset_model_id: interface_asset_model_id, property_mapping_configuration: property_mapping_configuration, client_token: client_token)
        put_asset_model_interface_relationship(input)
      end

      def put_asset_model_interface_relationship(input : Types::PutAssetModelInterfaceRelationshipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ASSET_MODEL_INTERFACE_RELATIONSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the default encryption configuration for the Amazon Web Services account. For more information,
      # see Key management in the IoT SiteWise User Guide .

      def put_default_encryption_configuration(
        encryption_type : String,
        kms_key_id : String? = nil
      ) : Protocol::Request
        input = Types::PutDefaultEncryptionConfigurationRequest.new(encryption_type: encryption_type, kms_key_id: kms_key_id)
        put_default_encryption_configuration(input)
      end

      def put_default_encryption_configuration(input : Types::PutDefaultEncryptionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DEFAULT_ENCRYPTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets logging options for IoT SiteWise.

      def put_logging_options(
        logging_options : Types::LoggingOptions
      ) : Protocol::Request
        input = Types::PutLoggingOptionsRequest.new(logging_options: logging_options)
        put_logging_options(input)
      end

      def put_logging_options(input : Types::PutLoggingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_LOGGING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Configures storage settings for IoT SiteWise.

      def put_storage_configuration(
        storage_type : String,
        disallow_ingest_null_na_n : Bool? = nil,
        disassociated_data_storage : String? = nil,
        multi_layer_storage : Types::MultiLayerStorage? = nil,
        retention_period : Types::RetentionPeriod? = nil,
        warm_tier : String? = nil,
        warm_tier_retention_period : Types::WarmTierRetentionPeriod? = nil
      ) : Protocol::Request
        input = Types::PutStorageConfigurationRequest.new(storage_type: storage_type, disallow_ingest_null_na_n: disallow_ingest_null_na_n, disassociated_data_storage: disassociated_data_storage, multi_layer_storage: multi_layer_storage, retention_period: retention_period, warm_tier: warm_tier, warm_tier_retention_period: warm_tier_retention_period)
        put_storage_configuration(input)
      end

      def put_storage_configuration(input : Types::PutStorageConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_STORAGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to an IoT SiteWise resource. If a tag already exists for the resource, this operation
      # updates the tag's value.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag from an IoT SiteWise resource.

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

      # Updates an existing access policy that specifies an identity's access to an IoT SiteWise Monitor
      # portal or project resource.

      def update_access_policy(
        access_policy_id : String,
        access_policy_identity : Types::Identity,
        access_policy_permission : String,
        access_policy_resource : Types::Resource,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAccessPolicyRequest.new(access_policy_id: access_policy_id, access_policy_identity: access_policy_identity, access_policy_permission: access_policy_permission, access_policy_resource: access_policy_resource, client_token: client_token)
        update_access_policy(input)
      end

      def update_access_policy(input : Types::UpdateAccessPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an asset's name. For more information, see Updating assets and models in the IoT SiteWise
      # User Guide .

      def update_asset(
        asset_id : String,
        asset_name : String,
        asset_description : String? = nil,
        asset_external_id : String? = nil,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAssetRequest.new(asset_id: asset_id, asset_name: asset_name, asset_description: asset_description, asset_external_id: asset_external_id, client_token: client_token)
        update_asset(input)
      end

      def update_asset(input : Types::UpdateAssetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an asset model and all of the assets that were created from the model. Each asset created
      # from the model inherits the updated asset model's property and hierarchy definitions. For more
      # information, see Updating assets and models in the IoT SiteWise User Guide . If you remove a
      # property from an asset model, IoT SiteWise deletes all previous data for that property. You can’t
      # change the type or data type of an existing property. To replace an existing asset model property
      # with a new one with the same name , do the following: Submit an UpdateAssetModel request with the
      # entire existing property removed. Submit a second UpdateAssetModel request that includes the new
      # property. The new asset property will have the same name as the previous one and IoT SiteWise will
      # generate a new unique id .

      def update_asset_model(
        asset_model_id : String,
        asset_model_name : String,
        asset_model_composite_models : Array(Types::AssetModelCompositeModel)? = nil,
        asset_model_description : String? = nil,
        asset_model_external_id : String? = nil,
        asset_model_hierarchies : Array(Types::AssetModelHierarchy)? = nil,
        asset_model_properties : Array(Types::AssetModelProperty)? = nil,
        client_token : String? = nil,
        if_match : String? = nil,
        if_none_match : String? = nil,
        match_for_version_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAssetModelRequest.new(asset_model_id: asset_model_id, asset_model_name: asset_model_name, asset_model_composite_models: asset_model_composite_models, asset_model_description: asset_model_description, asset_model_external_id: asset_model_external_id, asset_model_hierarchies: asset_model_hierarchies, asset_model_properties: asset_model_properties, client_token: client_token, if_match: if_match, if_none_match: if_none_match, match_for_version_type: match_for_version_type)
        update_asset_model(input)
      end

      def update_asset_model(input : Types::UpdateAssetModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSET_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a composite model and all of the assets that were created from the model. Each asset created
      # from the model inherits the updated asset model's property and hierarchy definitions. For more
      # information, see Updating assets and models in the IoT SiteWise User Guide . If you remove a
      # property from a composite asset model, IoT SiteWise deletes all previous data for that property. You
      # can’t change the type or data type of an existing property. To replace an existing composite asset
      # model property with a new one with the same name , do the following: Submit an
      # UpdateAssetModelCompositeModel request with the entire existing property removed. Submit a second
      # UpdateAssetModelCompositeModel request that includes the new property. The new asset property will
      # have the same name as the previous one and IoT SiteWise will generate a new unique id .

      def update_asset_model_composite_model(
        asset_model_composite_model_id : String,
        asset_model_composite_model_name : String,
        asset_model_id : String,
        asset_model_composite_model_description : String? = nil,
        asset_model_composite_model_external_id : String? = nil,
        asset_model_composite_model_properties : Array(Types::AssetModelProperty)? = nil,
        client_token : String? = nil,
        if_match : String? = nil,
        if_none_match : String? = nil,
        match_for_version_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAssetModelCompositeModelRequest.new(asset_model_composite_model_id: asset_model_composite_model_id, asset_model_composite_model_name: asset_model_composite_model_name, asset_model_id: asset_model_id, asset_model_composite_model_description: asset_model_composite_model_description, asset_model_composite_model_external_id: asset_model_composite_model_external_id, asset_model_composite_model_properties: asset_model_composite_model_properties, client_token: client_token, if_match: if_match, if_none_match: if_none_match, match_for_version_type: match_for_version_type)
        update_asset_model_composite_model(input)
      end

      def update_asset_model_composite_model(input : Types::UpdateAssetModelCompositeModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSET_MODEL_COMPOSITE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an asset property's alias and notification state. This operation overwrites the property's
      # existing alias and notification state. To keep your existing property's alias or notification state,
      # you must include the existing values in the UpdateAssetProperty request. For more information, see
      # DescribeAssetProperty .

      def update_asset_property(
        asset_id : String,
        property_id : String,
        client_token : String? = nil,
        property_alias : String? = nil,
        property_notification_state : String? = nil,
        property_unit : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAssetPropertyRequest.new(asset_id: asset_id, property_id: property_id, client_token: client_token, property_alias: property_alias, property_notification_state: property_notification_state, property_unit: property_unit)
        update_asset_property(input)
      end

      def update_asset_property(input : Types::UpdateAssetPropertyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSET_PROPERTY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the computation model.

      def update_computation_model(
        computation_model_configuration : Types::ComputationModelConfiguration,
        computation_model_data_binding : Hash(String, Types::ComputationModelDataBindingValue),
        computation_model_id : String,
        computation_model_name : String,
        client_token : String? = nil,
        computation_model_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateComputationModelRequest.new(computation_model_configuration: computation_model_configuration, computation_model_data_binding: computation_model_data_binding, computation_model_id: computation_model_id, computation_model_name: computation_model_name, client_token: client_token, computation_model_description: computation_model_description)
        update_computation_model(input)
      end

      def update_computation_model(input : Types::UpdateComputationModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_COMPUTATION_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an IoT SiteWise Monitor dashboard.

      def update_dashboard(
        dashboard_definition : String,
        dashboard_id : String,
        dashboard_name : String,
        client_token : String? = nil,
        dashboard_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDashboardRequest.new(dashboard_definition: dashboard_definition, dashboard_id: dashboard_id, dashboard_name: dashboard_name, client_token: client_token, dashboard_description: dashboard_description)
        update_dashboard(input)
      end

      def update_dashboard(input : Types::UpdateDashboardRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DASHBOARD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a dataset.

      def update_dataset(
        dataset_id : String,
        dataset_name : String,
        dataset_source : Types::DatasetSource,
        client_token : String? = nil,
        dataset_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDatasetRequest.new(dataset_id: dataset_id, dataset_name: dataset_name, dataset_source: dataset_source, client_token: client_token, dataset_description: dataset_description)
        update_dataset(input)
      end

      def update_dataset(input : Types::UpdateDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a gateway's name.

      def update_gateway(
        gateway_id : String,
        gateway_name : String
      ) : Protocol::Request
        input = Types::UpdateGatewayRequest.new(gateway_id: gateway_id, gateway_name: gateway_name)
        update_gateway(input)
      end

      def update_gateway(input : Types::UpdateGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a gateway capability configuration or defines a new capability configuration. Each gateway
      # capability defines data sources for a gateway. Important workflow notes: Each gateway capability
      # defines data sources for a gateway. This is the namespace of the gateway capability. . The namespace
      # follows the format service:capability:version , where: service - The service providing the
      # capability, or iotsitewise . capability - The specific capability type. Options include:
      # opcuacollector for the OPC UA data source collector, or publisher for data publisher capability.
      # version - The version number of the capability. Option include 2 for Classic streams, V2 gateways,
      # and 3 for MQTT-enabled, V3 gateways. After updating a capability configuration, the sync status
      # becomes OUT_OF_SYNC until the gateway processes the configuration.Use
      # DescribeGatewayCapabilityConfiguration to check the sync status and verify the configuration was
      # applied. A gateway can have multiple capability configurations with different namespaces.

      def update_gateway_capability_configuration(
        capability_configuration : String,
        capability_namespace : String,
        gateway_id : String
      ) : Protocol::Request
        input = Types::UpdateGatewayCapabilityConfigurationRequest.new(capability_configuration: capability_configuration, capability_namespace: capability_namespace, gateway_id: gateway_id)
        update_gateway_capability_configuration(input)
      end

      def update_gateway_capability_configuration(input : Types::UpdateGatewayCapabilityConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GATEWAY_CAPABILITY_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an IoT SiteWise Monitor portal.

      def update_portal(
        portal_contact_email : String,
        portal_id : String,
        portal_name : String,
        role_arn : String,
        alarms : Types::Alarms? = nil,
        client_token : String? = nil,
        notification_sender_email : String? = nil,
        portal_description : String? = nil,
        portal_logo_image : Types::Image? = nil,
        portal_type : String? = nil,
        portal_type_configuration : Hash(String, Types::PortalTypeEntry)? = nil
      ) : Protocol::Request
        input = Types::UpdatePortalRequest.new(portal_contact_email: portal_contact_email, portal_id: portal_id, portal_name: portal_name, role_arn: role_arn, alarms: alarms, client_token: client_token, notification_sender_email: notification_sender_email, portal_description: portal_description, portal_logo_image: portal_logo_image, portal_type: portal_type, portal_type_configuration: portal_type_configuration)
        update_portal(input)
      end

      def update_portal(input : Types::UpdatePortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an IoT SiteWise Monitor project.

      def update_project(
        project_id : String,
        project_name : String,
        client_token : String? = nil,
        project_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateProjectRequest.new(project_id: project_id, project_name: project_name, client_token: client_token, project_description: project_description)
        update_project(input)
      end

      def update_project(input : Types::UpdateProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
